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
                              "INSERT INTO KeyOffset (BuildingId, VisitOccurrence, PayerPlanPeriod, DrugExposure, ProcedureOccurrence, DeviceExposure, ConditionOccurrence, Measurement, Observation, ObservationPeriod, VisitCost, ProcedureCost, DeviceCost, DrugEra, ConditionEra) " +
                              "VALUES ({0}, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)";
         using (var connection = SqlConnectionHelper.OpenMSSQLConnection(connectionString))
         {
            using (var cmd = new SqlCommand(string.Format(query, buildingId), connection))
            {
               cmd.CommandTimeout = 30000;
               cmd.ExecuteNonQuery();
            }
         }
      }

      public IEnumerable<IDataReader> Update(int buildingId, long visitOffset, long periodOffset, long drugOffset,
         long procedureOffset, long deviceOffset, long conditionOffset, long measurementOffset, long observationOffset,
         long observationPeriodOffset, long visitCostOffset, long procedureCostOffset, long deviceCostOffset,
         long drugEraOffset, long conditionEraOffset)
      {
         using (var connection = SqlConnectionHelper.OpenMSSQLConnection(connectionString))
         using (var transaction = connection.BeginTransaction())
         {
            const string updateQuery = "UPDATE [KeyOffset] " +
                                       "SET [VisitOccurrence] = [VisitOccurrence] + @visitOffset " +
                                       ",[PayerPlanPeriod] = [PayerPlanPeriod] + @periodOffset " +
                                       ",[DrugExposure] = [DrugExposure] + @drugOffset " +
                                       ",[ProcedureOccurrence] = [ProcedureOccurrence] + @procedureOffset " +
                                       ",[DeviceExposure] = [DeviceExposure] + @deviceOffset " +

                                       ",[ConditionOccurrence] = [ConditionOccurrence] +  @conditionOffset " +
                                       ",[Measurement] = [Measurement] + @measurementOffset " +
                                       ",[Observation] = [Observation] + @observationOffset " +
                                       ",[ObservationPeriod] = [ObservationPeriod] + @observationPeriodOffset " +
                                       ",[VisitCost] = [VisitCost] + @visitCostOffset " +
                                       ",[ProcedureCost] = [ProcedureCost] + @procedureCostOffset " +
                                       ",[DeviceCost] = [DeviceCost] + @deviceCostOffset " +
                                       ",[DrugEra] = [DrugEra] + @drugEraOffset " +
                                       ",[ConditionEra] = [ConditionEra] + @conditionEraOffset " +
                                       "OUTPUT INSERTED.[VisitOccurrence], INSERTED.[PayerPlanPeriod], INSERTED.[DrugExposure], INSERTED.[ProcedureOccurrence], INSERTED.[DeviceExposure], " +
                                       "INSERTED.[ConditionOccurrence], INSERTED.[Measurement], INSERTED.[Observation], INSERTED.[ObservationPeriod], INSERTED.[VisitCost], INSERTED.[ProcedureCost], INSERTED.[DeviceCost], INSERTED.[DrugEra], INSERTED.[ConditionEra] " +
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

               cmd.Parameters.Add("@deviceOffset", SqlDbType.BigInt);
               cmd.Parameters["@deviceOffset"].Value = deviceOffset;


               cmd.Parameters.Add("@conditionOffset", SqlDbType.BigInt);
               cmd.Parameters["@conditionOffset"].Value = conditionOffset;

               cmd.Parameters.Add("@measurementOffset", SqlDbType.BigInt);
               cmd.Parameters["@measurementOffset"].Value = measurementOffset;

               cmd.Parameters.Add("@observationOffset", SqlDbType.BigInt);
               cmd.Parameters["@observationOffset"].Value = observationOffset;

               cmd.Parameters.Add("@observationPeriodOffset", SqlDbType.BigInt);
               cmd.Parameters["@observationPeriodOffset"].Value = observationPeriodOffset;

               cmd.Parameters.Add("@visitCostOffset", SqlDbType.BigInt);
               cmd.Parameters["@visitCostOffset"].Value = visitCostOffset;

               cmd.Parameters.Add("@procedureCostOffset", SqlDbType.BigInt);
               cmd.Parameters["@procedureCostOffset"].Value = procedureCostOffset;

               cmd.Parameters.Add("@deviceCostOffset", SqlDbType.BigInt);
               cmd.Parameters["@deviceCostOffset"].Value = deviceCostOffset;

               cmd.Parameters.Add("@drugEraOffset", SqlDbType.BigInt);
               cmd.Parameters["@drugEraOffset"].Value = drugEraOffset;

               cmd.Parameters.Add("@conditionEraOffset", SqlDbType.BigInt);
               cmd.Parameters["@conditionEraOffset"].Value = conditionEraOffset;

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
