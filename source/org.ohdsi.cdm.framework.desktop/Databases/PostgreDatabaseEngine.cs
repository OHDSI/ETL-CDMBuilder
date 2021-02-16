using org.ohdsi.cdm.framework.desktop.Enums;
using org.ohdsi.cdm.framework.desktop.Savers;
using System.Data;
using Npgsql;

namespace org.ohdsi.cdm.framework.desktop.Databases
{
    public class PostgreDatabaseEngine : DatabaseEngine
    {
        public PostgreDatabaseEngine()
        {
            Database = Database.Postgre;
        }

        public override IDbCommand GetCommand(string cmdText, IDbConnection connection)
        {
            var c = new NpgsqlCommand(cmdText, (NpgsqlConnection)connection);
            return c;
        }

        public override ISaver GetSaver()
        {
            return new PostgreSaver();
        }
    }
}