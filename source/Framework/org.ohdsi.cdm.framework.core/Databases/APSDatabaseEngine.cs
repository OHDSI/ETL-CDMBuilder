using System.Collections.Generic;
using System.Data.SqlClient;
using org.ohdsi.cdm.framework.core.Savers;
using org.ohdsi.cdm.framework.shared.Helpers;
using org.ohdsi.cdm.framework.shared.Enums;

namespace org.ohdsi.cdm.framework.core.Databases
{
   public class APSDatabaseEngine : DatabaseEngine
   {
      public APSDatabaseEngine()
      {
         Database = Database.APS;
      }

      public override IEnumerable<string> GetAllTables()
      {
         const string query = "SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE = 'BASE TABLE'";

         using (var conn = SqlConnectionHelper.OpenMSSQLConnection(Settings.Current.Building.SourceConnectionString))
         using (var c = new SqlCommand(query, conn))
         using (var reader = c.ExecuteReader())
         {
            while (reader.Read())
            {
               yield return reader.GetString(0);
            }
         }
      }

      public override IEnumerable<string> GetAllColumns(string tableName)
      {
         var query = string.Format("SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = '{0}'",
            tableName);

         using (var conn = SqlConnectionHelper.OpenMSSQLConnection(Settings.Current.Building.SourceConnectionString))
         using (var c = new SqlCommand(query, conn))
         using (var reader = c.ExecuteReader())
         {
            while (reader.Read())
            {
               yield return reader.GetString(0);
            }
         }
      }

      public override ISaver GetSaver()
      {
         return new APSSaver();
      }
   }
}
