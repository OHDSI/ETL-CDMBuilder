using org.ohdsi.cdm.framework.desktop.Enums;
using org.ohdsi.cdm.framework.desktop.Savers;
using System.Data;
using System.Data.SqlClient;

namespace org.ohdsi.cdm.framework.desktop.Databases
{
    public class MssqlDatabaseEngine : DatabaseEngine
    {
        public MssqlDatabaseEngine()
        {
            Database = Database.MsSql;
        }

        public override IDbCommand GetCommand(string cmdText, IDbConnection connection)
        {
            var c = new SqlCommand(cmdText, (SqlConnection)connection);
            return c;
        }

        public override ISaver GetSaver()
        {
            return new MsSqlSaver();
        }
    }
}
