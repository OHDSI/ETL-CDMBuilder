using org.ohdsi.cdm.framework.desktop.Enums;
using org.ohdsi.cdm.framework.desktop.Savers;

namespace org.ohdsi.cdm.framework.desktop.Databases
{
    public class MySqlDatabaseEngine : DatabaseEngine
    {
        public MySqlDatabaseEngine()
        {
            Database = Database.MySql;
        }

        public override ISaver GetSaver()
        {
            return new MySqlSaver();
        }
    }
}