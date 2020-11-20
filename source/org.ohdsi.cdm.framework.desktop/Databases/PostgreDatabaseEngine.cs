using org.ohdsi.cdm.framework.desktop.Enums;
using org.ohdsi.cdm.framework.desktop.Savers;

namespace org.ohdsi.cdm.framework.desktop.Databases
{
    public class PostgreDatabaseEngine : DatabaseEngine
    {
        public PostgreDatabaseEngine()
        {
            Database = Database.Postgre;
        }

        public override ISaver GetSaver()
        {
            return new PostgreSaver();
        }
    }
}