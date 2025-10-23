using org.ohdsi.cdm.framework.desktop.Databases;

namespace org.ohdsi.cdm.presentation.builder.Base.DbDestinations
{
    public static class DbDestinationFactory
    {
        public static DbDestination Create(string connectionString, IDatabaseEngine dbEngine, string schemaName) 
            =>
            dbEngine switch
            {
                PostgreDatabaseEngine pg =>
                    new DbDestinationPostgres(connectionString, pg, schemaName),

                MssqlDatabaseEngine ms =>
                    new DbDestinationMsSql(connectionString, ms, schemaName),

                MySqlDatabaseEngine ms =>
                    new DbDestinationMySql(connectionString, ms, schemaName),

                _ => throw new NotSupportedException(
                       $"DbDestinationFactory -> Engine '{dbEngine.GetType().Name}' not supported.")
            };
    }

}
