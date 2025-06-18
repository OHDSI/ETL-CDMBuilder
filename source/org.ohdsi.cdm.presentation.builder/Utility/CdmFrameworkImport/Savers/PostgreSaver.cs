using Npgsql;
using NpgsqlTypes;
using org.ohdsi.cdm.framework.common.Extensions;
using org.ohdsi.cdm.framework.desktop.Helpers;
using System.Data.Odbc;
using FrameworkSettings = org.ohdsi.cdm.framework.desktop.Settings;

namespace org.ohdsi.cdm.presentation.builder.Utility.CdmFrameworkImport.Savers
{
    public class PostgreSaver : Saver
    {
        private NpgsqlConnection _connection;
        public override ISaver Create(string connectionString)
        {
            var odbc = new OdbcConnectionStringBuilder(connectionString);

            var connectionStringTemplate = "Server={server};Port=5432;Database={database};User Id={username};Password={password};SslMode=Require;Trust Server Certificate=true";



            var npgsqlConnectionString = connectionStringTemplate.Replace("{server}", odbc["server"].ToString())
                .Replace("{database}", odbc["database"].ToString()).Replace("{username}", odbc["uid"].ToString())
                .Replace("{password}", odbc["pwd"].ToString());

            Console.WriteLine("npgsqlConnectionString=" + npgsqlConnectionString);
            _connection = SqlConnectionHelper.OpenNpgsqlConnection(npgsqlConnectionString);

            return this;
        }

        public override void Write(int? chunkId, int? subChunkId, System.Data.IDataReader reader, string tableName)
        {
            if (reader == null)
                return;

            if (tableName.StartsWith("_chunks", StringComparison.CurrentCultureIgnoreCase))
            {
                tableName = FrameworkSettings.Settings.Current.Building.SourceSchemaName + "." + tableName;
            }
            else
            {
                tableName = FrameworkSettings.Settings.Current.Building.DestinationSchemaName + "." + tableName;
            }

            var fields = new string[reader.FieldCount];
            for (var i = 0; i < reader.FieldCount; i++)
            {
                fields[i] = reader.GetName(i);
            }

            var q = $"COPY {tableName} ({string.Join(",", fields)}) from STDIN (FORMAT BINARY)";

            //this is for debugging ease
            var rowData = new List<(int ColIndex, string ColName, Type ClrType, object Value, NpgsqlDbType PgType)>();
            int row = -1;

            try
            {
                using var importer = _connection.BeginBinaryImport(q);
                while (reader.Read())
                {
                    row++;
                    rowData.Clear();

                    for (int col = 0; col < reader.FieldCount; col++)
                    {
                        var name = reader.GetName(col);
                        var clrType = reader.GetFieldType(col);
                        var value = reader.IsDBNull(col) ? null : reader.GetValue(col);

                        //this is here to avoid placing bytes for int8 type into int4 causing errors
                        //although, best solution would be to alter create table statement in ETL-LambdaBuilder
                        Type newClrType = clrType;
                        object newValue = value;
                        if (clrType == typeof(long)
                            && value is long l
                            && l >= int.MinValue
                            && l <= int.MaxValue)
                        {
                            newClrType = typeof(int);
                            newValue = (int)l;
                        }

                        var pgType = newValue == null
                                      ? NpgsqlDbType.Unknown
                                      : GetFieldType(newClrType, name);                        

                        rowData.Add((col, name, newClrType, newValue, pgType));
                    }

                    if (rowData.Count != reader.FieldCount)
                        throw new InvalidOperationException(
                            $"Row {row}: expected {reader.FieldCount} columns but got {rowData.Count}");

                    importer.StartRow();
                    foreach (var (ColIndex, ColName, ClrType, Value, PgType) in rowData)
                    {
                        if (Value is null)
                            importer.WriteNull();
                        else
                            importer.Write(Value, PgType); 
                    }
                }
                importer.Complete();
            }
            catch (Exception e)
            {
                var personId = rowData.FirstOrDefault().Value?.ToString() ?? "unknown";
                throw new Exception($"Error importing row {row} Id {personId} into {tableName}", e);
            }
        }

        private static NpgsqlDbType GetFieldType(Type type, string fieldName)
        {
            var name = type.Name;
            var underlyingType = Nullable.GetUnderlyingType(type);
            if (underlyingType != null)
            {
                name = underlyingType.Name;
            }

            switch (name)
            {
                case "Int64":                    
                    return NpgsqlDbType.Bigint;
                case "Int32":
                    return NpgsqlDbType.Integer;
                case "Decimal":
                    return NpgsqlDbType.Numeric;
                case "DateTime":
                    {
                        if (fieldName.Contains("time", StringComparison.CurrentCultureIgnoreCase))
                            return NpgsqlDbType.Timestamp;

                        return NpgsqlDbType.Date;
                    }
                case "TimeSpan":
                    return NpgsqlDbType.Time;
                case "String":
                    {
                        // workaround for 5.3 schema, string used for Timestamp
                        if (fieldName.Contains("time", StringComparison.CurrentCultureIgnoreCase))
                            return NpgsqlDbType.Time;


                        return NpgsqlDbType.Varchar;
                    }

                default:
                    throw new NotImplementedException();
            }
        }

        public override void Dispose()
        {
            _connection.Dispose();
            GC.SuppressFinalize(this);
        }
    }
}
