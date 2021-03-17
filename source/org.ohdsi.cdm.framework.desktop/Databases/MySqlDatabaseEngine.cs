using org.ohdsi.cdm.framework.desktop.Enums;
using org.ohdsi.cdm.framework.desktop.Savers;
using System.Data;
using MySqlConnector;

namespace org.ohdsi.cdm.framework.desktop.Databases
{
    public class MySqlDatabaseEngine : DatabaseEngine
    {
        public MySqlDatabaseEngine()
        {
            Database = Database.MySql;
        }

        public override IDbCommand GetCommand(string cmdText, IDbConnection connection)
        {
            var c = new MySqlCommand(cmdText, (MySqlConnection)connection);
            return c;
        }

        public override ISaver GetSaver()
        {
            return new MySqlSaver();
        }
    }
}