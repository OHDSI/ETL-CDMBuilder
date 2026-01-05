using org.ohdsi.cdm.framework.desktop.Databases;
using org.ohdsi.cdm.framework.desktop.Enums;

namespace org.ohdsi.cdm.presentation.builder.Base.DatabaseManager
{
    public static class DatabaseManagerFactory
    {
        public static DatabaseManager Create(string connectionString, IDatabaseEngine dbEngine, string schemaName) 
            =>
            dbEngine switch
            {
                PostgreDatabaseEngine e =>
                    new DatabaseManagerPostgres(connectionString, e, schemaName),

                MssqlDatabaseEngine e =>
                    new DatabaseManagerMssql(connectionString, e, schemaName),

                MySqlDatabaseEngine e =>
                    new DatabaseManagerMySql(connectionString, e, schemaName),

                _ => throw new NotSupportedException(
                       $"DbDestinationFactory -> Engine '{dbEngine.GetType().Name}' not supported.")
            };

        public static DatabaseManager Create(string connectionString, Database dbEngine, string schemaName)
            =>
            dbEngine switch
            {
                Database.Postgre =>
                    new DatabaseManagerPostgres(connectionString, new PostgreDatabaseEngine(), schemaName),

                Database.MsSql =>
                    new DatabaseManagerMssql(connectionString, new MssqlDatabaseEngine(), schemaName),

                Database.MySql =>
                    new DatabaseManagerMySql(connectionString, new MySqlDatabaseEngine(), schemaName),

                _ => throw new NotSupportedException(
                       $"DbDestinationFactory -> Engine '{dbEngine.GetType().Name}' not supported.")
            };
    }

}
