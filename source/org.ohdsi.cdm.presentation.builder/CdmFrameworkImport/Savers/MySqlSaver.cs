using MySqlConnector;
using org.ohdsi.cdm.framework.desktop.Helpers;
using System.Data.Odbc;

namespace org.ohdsi.cdm.presentation.builder.CdmFrameworkImport.Savers
{
    public class MySqlSaver : Saver
    {
        private MySqlConnection _connection;
        private MySqlTransaction _transaction;

        protected override string UniqueKeyViolationMessage => "Duplicate entry";

        public override ISaver Create(string connectionString)
        {
            var odbcConnection = new OdbcConnectionStringBuilder(connectionString);
            var sqlConnection = new MySqlConnectionStringBuilder
            {
                Server = odbcConnection["server"].ToString(),
                UserID = odbcConnection["user"].ToString(),
                Password = odbcConnection["password"].ToString(),
                Database = odbcConnection["database"].ToString(),
                DefaultCommandTimeout = 9999,
                ConnectionTimeout = 9999,
                AllowLoadLocalInfile = true
            };

            _connection = SqlConnectionHelper.OpenMySqlConnection(sqlConnection.ConnectionString);
            _transaction = _connection.BeginTransaction();

            return this;
        }

        public override void Write(int? chunkId, int? subChunkId, System.Data.IDataReader reader, string tableName)
        {
            var bulkCopy = new MySqlBulkCopy(_connection, _transaction)
            {
                BulkCopyTimeout = 9999,
                DestinationTableName = tableName
            };
            bulkCopy.WriteToServer(reader);
        }

        public override void Commit()
        {
            _transaction.Commit();
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