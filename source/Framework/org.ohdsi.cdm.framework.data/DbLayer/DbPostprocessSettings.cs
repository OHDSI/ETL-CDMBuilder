using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using org.ohdsi.cdm.framework.shared.Helpers;

namespace org.ohdsi.cdm.framework.data.DbLayer
{
   public class DbPostprocessSettings
   {
      private readonly string connectionString;

      public DbPostprocessSettings(string connectionString)
      {
         this.connectionString = connectionString;
      }

      public IEnumerable<IDataReader> Load()
      {
         const string query = "SELECT * FROM [dbo].[PostprocessSettings]";

         using (var connection = SqlConnectionHelper.OpenMSSQLConnection(connectionString))
         {
            using (var cmd = new SqlCommand(query, connection))
            {
               cmd.CommandTimeout = 3000;
               using (var reader = cmd.ExecuteReader())
               {
                  while (reader.Read())
                  {
                     yield return reader;
                  }
               }
            }
         }
      }
   }
}
