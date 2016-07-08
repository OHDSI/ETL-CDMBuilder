using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using org.ohdsi.cdm.framework.shared.Helpers;

namespace org.ohdsi.cdm.framework.data.DbLayer
{
   public class DbKeyOffset
   {
      private readonly string connectionString;

      public DbKeyOffset(string connectionString)
      {
         this.connectionString = connectionString;
      }

      public void Create(int buildingId)
      {
         const string query = "DELETE FROM KeyOffset WHERE BuildingId = {0} " +
                              "INSERT INTO KeyOffset (BuildingId, VisitOccurrence, PayerPlanPeriod, DrugExposure, ProcedureOccurrence) " +
                              "VALUES ({0}, 0, 0, 0, 0)";
         using (var connection = SqlConnectionHelper.OpenConnection(connectionString))
         {
            using (var cmd = new SqlCommand(string.Format(query, buildingId), connection))
            {
               cmd.CommandTimeout = 30000;
               cmd.ExecuteNonQuery();
            }
         }
      }

      public IEnumerable<IDataReader> Update(int buildingId, long visitOffset, long periodOffset, long drugOffset, long procedureOffset)
      {
         using (var connection = SqlConnectionHelper.OpenConnection(connectionString))
         using (var transaction = connection.BeginTransaction())
         {
            const string updateQuery = "UPDATE [KeyOffset] " +
                                       "SET [VisitOccurrence] = [VisitOccurrence] + @visitOffset " +
                                       ",[PayerPlanPeriod] = [PayerPlanPeriod] + @periodOffset " +
                                       ",[DrugExposure] = [DrugExposure] + @drugOffset " +
                                       ",[ProcedureOccurrence] = [ProcedureOccurrence] + @procedureOffset " +
                                       "OUTPUT INSERTED.[VisitOccurrence], INSERTED.[PayerPlanPeriod], INSERTED.[DrugExposure], INSERTED.[ProcedureOccurrence] " +
                                       "WHERE [BuildingId] = @buildingId ";

            using (var cmd = new SqlCommand(updateQuery, connection, transaction))
            {
               cmd.Parameters.Add("@buildingId", SqlDbType.Int);
               cmd.Parameters["@buildingId"].Value = buildingId;

               cmd.Parameters.Add("@visitOffset", SqlDbType.BigInt);
               cmd.Parameters["@visitOffset"].Value = visitOffset;

               cmd.Parameters.Add("@periodOffset", SqlDbType.BigInt);
               cmd.Parameters["@periodOffset"].Value = periodOffset;

               cmd.Parameters.Add("@drugOffset", SqlDbType.BigInt);
               cmd.Parameters["@drugOffset"].Value = drugOffset;

               cmd.Parameters.Add("@procedureOffset", SqlDbType.BigInt);
               cmd.Parameters["@procedureOffset"].Value = procedureOffset;

               cmd.CommandTimeout = 30000;
               using (var reader = cmd.ExecuteReader())
               {
                  while (reader.Read())
                  {
                     yield return reader;
                     
                  }
               }
            }

            transaction.Commit();
         }
      }
   }
}
