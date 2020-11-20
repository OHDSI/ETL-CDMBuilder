using org.ohdsi.cdm.framework.common.Enums;
using org.ohdsi.cdm.framework.desktop.Enums;
using org.ohdsi.cdm.framework.desktop.Helpers;
using System.Data.Odbc;
using System.Data.SqlClient;

namespace org.ohdsi.cdm.framework.desktop.Savers
{
    public class MsSqlSaver : Saver
    {
        private SqlConnection _connection;
        private SqlTransaction _transaction;
        private SqlBulkCopy _bulkCopy;

        public override ISaver Create(string connectionString, CdmVersions cdmVersion, string sourceSchema, string destinationSchema)
        {
            CdmVersion = cdmVersion;
            SourceSchema = sourceSchema;
            DestinationSchema = destinationSchema;

            var odbcConnection = new OdbcConnectionStringBuilder(connectionString);
            var sqlConnection = new SqlConnectionStringBuilder
            {
                ["Data Source"] = odbcConnection["server"],
                ["Initial Catalog"] = odbcConnection["database"],
                ["User Id"] = odbcConnection["uid"],
                ["Password"] = odbcConnection["pwd"]
            };

            _connection = SqlConnectionHelper.OpenMssqlConnection(sqlConnection.ConnectionString);
            _transaction = _connection.BeginTransaction();
            _bulkCopy = new SqlBulkCopy(_connection, SqlBulkCopyOptions.TableLock, _transaction) { BulkCopyTimeout = 600 };

            return this;
        }

        public override Database GetDatabaseType()
        {
            return Database.MsSql;
        }

        public override void Write(int? chunkId, int? subChunkId, System.Data.IDataReader reader, string tableName)
        {
            if (tableName.ToLower().StartsWith("_chunks"))
            {
                tableName = SourceSchema + "." + tableName;
            }
            else
            {
                tableName = DestinationSchema + "." + tableName;
            }

            _bulkCopy.DestinationTableName = tableName;
            _bulkCopy.WriteToServer(reader);
        }

        public override void Commit()
        {
            _transaction.Commit();
            _bulkCopy.Close();
        }

        public override void Rollback()
        {
            _transaction.Rollback();
        }

        public override void Dispose()
        {
            _transaction.Dispose();
            _connection.Dispose();
        }
    }
}
