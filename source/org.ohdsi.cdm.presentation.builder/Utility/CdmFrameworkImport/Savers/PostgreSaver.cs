using Npgsql;
using NpgsqlTypes;
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

            using var inStream = _connection.BeginBinaryImport(q);
            while (reader.Read())
            {
                inStream.StartRow();

                for (var i = 0; i < reader.FieldCount; i++)
                {
                    var value = reader.GetValue(i);

                    if (value is null)
                    {
                        inStream.WriteNull();
                    }
                    else
                    {
                        var fd = GetFieldType(reader.GetFieldType(i), reader.GetName(i));
                        inStream.Write(value, fd);
                        //Console.Write("|| " + fd.ToString() + Environment.NewLine);
                    }
                }
            }
            inStream.Complete();
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
