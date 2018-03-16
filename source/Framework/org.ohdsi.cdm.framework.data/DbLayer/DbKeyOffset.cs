using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using org.ohdsi.cdm.framework.shared.Enums;
using org.ohdsi.cdm.framework.shared.Extensions;
using org.ohdsi.cdm.framework.shared.Helpers;
using org.ohdsi.cdm.framework.entities.Builder;

namespace org.ohdsi.cdm.framework.data.DbLayer
{
   public class DbKeyOffset
   {
      private readonly string connectionString;

      public DbKeyOffset(string connectionString)
      {
         this.connectionString = connectionString;
      }

      public void Recreate(int buildingId)
      {
         const string query = "DELETE FROM KeyOffset WHERE BuildingId = {0} " +
                              "INSERT INTO KeyOffset (BuildingId, VisitOccurrence, PayerPlanPeriod, DrugExposure, ProcedureOccurrence, DeviceExposure, ConditionOccurrence, Measurement, Observation, ObservationPeriod, VisitCost, ProcedureCost, DeviceCost, DrugEra, ConditionEra, Note) " +
                              "VALUES ({0}, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)";
         using (var connection = SqlConnectionHelper.OpenMSSQLConnection(connectionString))
         {
            using (var cmd = new SqlCommand(string.Format(query, buildingId), connection))
            {
               cmd.CommandTimeout = 30000;
               cmd.ExecuteNonQuery();
            }
         }
      }

      public void Update(int buildingId, KeyMasterOffset offset, long visitOffset, long periodOffset, long drugOffset,
         long procedureOffset, long deviceOffset, long conditionOffset, long measurementOffset, long observationOffset,
         long observationPeriodOffset, long visitCostOffset, long procedureCostOffset, long deviceCostOffset,
         long drugEraOffset, long conditionEraOffset, long noteOffset)
      {
         var attempt = 0;
         var done = false;

         while (!done)
         {
            using (var connection = SqlConnectionHelper.OpenMSSQLConnection(connectionString))
            using (var transaction = connection.BeginTransaction())
            {
               try
               {
                  attempt++;
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
                                             ",[Note] = [Note] + @noteOffset " +
                                             ",[ConditionEra] = [ConditionEra] + @conditionEraOffset " +
                                             "OUTPUT INSERTED.[VisitOccurrence], INSERTED.[PayerPlanPeriod], INSERTED.[DrugExposure], INSERTED.[ProcedureOccurrence], INSERTED.[DeviceExposure], " +
                                             "INSERTED.[ConditionOccurrence], INSERTED.[Measurement], INSERTED.[Observation], INSERTED.[ObservationPeriod], INSERTED.[VisitCost], INSERTED.[ProcedureCost], INSERTED.[DeviceCost], INSERTED.[DrugEra], INSERTED.[ConditionEra], INSERTED.[Note] " +
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

                     cmd.Parameters.Add("@noteOffset", SqlDbType.BigInt);
                     cmd.Parameters["@noteOffset"].Value = noteOffset;

                     cmd.CommandTimeout = 30000;
                     using (var reader = cmd.ExecuteReader())
                     {
                        while (reader.Read())
                        {
                           offset.VisitOccurrenceOffset = reader.GetLong("VisitOccurrence").Value - visitOffset;
                           offset.PayerPlanPeriodOffset = reader.GetLong("PayerPlanPeriod").Value - periodOffset;
                           offset.DrugExposureOffset = reader.GetLong("DrugExposure").Value - drugOffset;
                           offset.ProcedureOccurrenceOffset = reader.GetLong("ProcedureOccurrence").Value -
                                                              procedureOffset;
                           offset.DeviceExposureOffset = reader.GetLong("DeviceExposure").Value - deviceOffset;

                           offset.ConditionOccurrenceOffset = reader.GetLong("ConditionOccurrence").Value -
                                                              conditionOffset;
                           offset.MeasurementOffset = reader.GetLong("Measurement").Value - measurementOffset;
                           offset.ObservationOffset = reader.GetLong("Observation").Value - observationOffset;
                           offset.ObservationPeriodOffset = reader.GetLong("ObservationPeriod").Value -
                                                            observationPeriodOffset;
                           offset.VisitCostOffset = reader.GetLong("VisitCost").Value - visitCostOffset;
                           offset.ProcedureCostOffset = reader.GetLong("ProcedureCost").Value - procedureCostOffset;
                           offset.DeviceCostOffset = reader.GetLong("DeviceCost").Value - deviceCostOffset;
                           offset.DrugEraOffset = reader.GetLong("DrugEra").Value - drugEraOffset;
                           offset.ConditionEraOffset = reader.GetLong("ConditionEra").Value - conditionEraOffset;
                           offset.NoteOffset = reader.GetLong("Note").Value - noteOffset;
                        }
                     }
                  }

                  transaction.Commit();
                  done = true;
               }
               catch (Exception)
               {
                  transaction.Rollback();

                  if (attempt > 10)
                  {
                     throw;
                  }
               }
            }
         }
      }
   }
}
