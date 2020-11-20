using org.ohdsi.cdm.framework.desktop.Enums;
using org.ohdsi.cdm.framework.desktop.Savers;

namespace org.ohdsi.cdm.framework.desktop.Databases
{
    public class MssqlDatabaseEngine : DatabaseEngine
    {
        public MssqlDatabaseEngine()
        {
            Database = Database.MsSql;
        }

        public override ISaver GetSaver()
        {
            return new MsSqlSaver();
        }
    }
}
