using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using org.ohdsi.cdm.framework.data.DbLayer;
using org.ohdsi.cdm.framework.entities.Builder;
using org.ohdsi.cdm.framework.entities.DataReaders;
using v5 = org.ohdsi.cdm.framework.entities.DataReaders.v5;
using org.ohdsi.cdm.framework.entities.Omop;
using org.ohdsi.cdm.framework.shared.Enums;
using org.ohdsi.cdm.framework.shared.Extensions;

namespace org.ohdsi.cdm.framework.core.Savers
{
   public class Saver : ISaver
   {
      public virtual ISaver Create(string connectionString)
      {
         return this;
      }

      private static void UpdateOffset(KeyMasterOffset offset)
      {
         var visitOffset = 0;
         if (offset.VisitOccurrenceIdChanged)
            visitOffset = offset.VisitOccurrenceId;

         var periodOffset = 0;
         if (offset.PayerPlanPeriodIdChanged)
            periodOffset = offset.PayerPlanPeriodId;

         var drugOffset = 0;
         if (offset.DrugExposureIdChanged)
            drugOffset = offset.DrugExposureId;

         var procedureOffset = 0;
         if (offset.ProcedureOccurrenceIdChanged)
            procedureOffset = offset.ProcedureOccurrenceId;

         var deviceOffset = 0;
         if (offset.DeviceExposureIdChanged)
            deviceOffset = offset.DeviceExposureId;



         var conditionOffset = 0;
         if (offset.ConditionOccurrenceIdChanged)
            conditionOffset = offset.ConditionOccurrenceId;

         var measurementOffset = 0;
         if (offset.MeasurementIdChanged)
            measurementOffset = offset.MeasurementId;

         var observationOffset = 0;
         if (offset.ObservationIdChanged)
            observationOffset = offset.ObservationId;

         var observationPeriodOffset = 0;
         if (offset.ObservationPeriodIdChanged)
            observationPeriodOffset = offset.ObservationPeriodId;

         var visitCostOffset = 0;
         if (offset.VisitCostIdChanged)
            visitCostOffset = offset.VisitCostId;

         var procedureCostOffset = 0;
         if (offset.ProcedureCostIdChanged)
            procedureCostOffset = offset.ProcedureCostId;

         var deviceCostOffset = 0;
         if (offset.DeviceCostIdChanged)
            deviceCostOffset = offset.DeviceCostId;

         var drugEraOffset = 0;
         if (offset.DrugEraIdChanged)
            drugEraOffset = offset.DrugEraId;

         var conditionEraOffset = 0;
         if (offset.ConditionEraIdChanged)
            conditionEraOffset = offset.ConditionEraId;

         var dbKeyOffset = new DbKeyOffset(Settings.Current.Building.BuilderConnectionString);
         foreach (
            var reader in
               dbKeyOffset.Update(Settings.Current.Building.Id.Value, visitOffset, periodOffset, drugOffset,
                  procedureOffset, deviceOffset, conditionOffset, measurementOffset, observationOffset,
                  observationPeriodOffset, visitCostOffset, procedureCostOffset, deviceCostOffset, drugEraOffset,
                  conditionEraOffset))
         {
            offset.VisitOccurrenceOffset = reader.GetLong("VisitOccurrence").Value - visitOffset;
            offset.PayerPlanPeriodOffset = reader.GetLong("PayerPlanPeriod").Value - periodOffset;
            offset.DrugExposureOffset = reader.GetLong("DrugExposure").Value - drugOffset;
            offset.ProcedureOccurrenceOffset = reader.GetLong("ProcedureOccurrence").Value - procedureOffset;
            offset.DeviceExposureOffset = reader.GetLong("DeviceExposure").Value - deviceOffset;

            offset.ConditionOccurrenceOffset = reader.GetLong("ConditionOccurrence").Value - conditionOffset;
            offset.MeasurementOffset = reader.GetLong("Measurement").Value - measurementOffset;
            offset.ObservationOffset = reader.GetLong("Observation").Value - observationOffset;
            offset.ObservationPeriodOffset = reader.GetLong("ObservationPeriod").Value - observationPeriodOffset;
            offset.VisitCostOffset = reader.GetLong("VisitCost").Value - visitCostOffset;
            offset.ProcedureCostOffset = reader.GetLong("ProcedureCost").Value - procedureCostOffset;
            offset.DeviceCostOffset = reader.GetLong("DeviceCost").Value - deviceCostOffset;
            offset.DrugEraOffset = reader.GetLong("DrugEra").Value - drugEraOffset;
            offset.ConditionEraOffset = reader.GetLong("ConditionEra").Value - conditionEraOffset;
         }
      }

      public void Save(ChunkData chunk)
      {
         SaveSync(chunk);
      }

      private void SaveSync(ChunkData chunk)
      {
         try
         {
            UpdateOffset(chunk.KeyMasterOffset);

            Write(chunk.ChunkId, chunk.SubChunkId, new v5.PersonDataReader(chunk.Persons.ToList()), "PERSON");
            Write(chunk.ChunkId, chunk.SubChunkId, new v5.ObservationPeriodDataReader(chunk.ObservationPeriods.ToList(), chunk.KeyMasterOffset), "OBSERVATION_PERIOD"); 
            Write(chunk.ChunkId, chunk.SubChunkId, new v5.PayerPlanPeriodDataReader(chunk.PayerPlanPeriods.ToList(), chunk.KeyMasterOffset), "PAYER_PLAN_PERIOD");
            Write(chunk.ChunkId, chunk.SubChunkId, new v5.DeathDataReader(chunk.Deaths.ToList()), "DEATH"); 
            Write(chunk.ChunkId, chunk.SubChunkId, new v5.DrugExposureDataReader(chunk.DrugExposures.ToList(), chunk.KeyMasterOffset), "DRUG_EXPOSURE");
            Write(chunk.ChunkId, chunk.SubChunkId, new v5.ObservationDataReader(chunk.Observations.ToList(), chunk.KeyMasterOffset), "OBSERVATION");
            Write(chunk.ChunkId, chunk.SubChunkId, new v5.VisitOccurrenceDataReader(chunk.VisitOccurrences.ToList(), chunk.KeyMasterOffset), "VISIT_OCCURRENCE");
            Write(chunk.ChunkId, chunk.SubChunkId, new v5.ProcedureOccurrenceDataReader(chunk.ProcedureOccurrences.ToList(), chunk.KeyMasterOffset), "PROCEDURE_OCCURRENCE");

            Write(chunk.ChunkId, chunk.SubChunkId, new v5.DrugEraDataReader(chunk.DrugEra.ToList(), chunk.KeyMasterOffset), "DRUG_ERA");
            Write(chunk.ChunkId, chunk.SubChunkId, new v5.ConditionEraDataReader(chunk.ConditionEra.ToList(), chunk.KeyMasterOffset), "CONDITION_ERA");
            Write(chunk.ChunkId, chunk.SubChunkId, new v5.DeviceExposureDataReader(chunk.DeviceExposure.ToList(), chunk.KeyMasterOffset), "DEVICE_EXPOSURE");
            Write(chunk.ChunkId, chunk.SubChunkId, new v5.MeasurementDataReader(chunk.Measurements.ToList(), chunk.KeyMasterOffset), "MEASUREMENT");
            Write(chunk.ChunkId, chunk.SubChunkId, new v5.CohortDataReader(chunk.Cohort.ToList()), "COHORT");

            if (Settings.Current.Building.CDM == CDMVersions.v5)
            {
               Write(chunk.ChunkId, chunk.SubChunkId, new v5.ConditionOccurrenceDataReader(chunk.ConditionOccurrences.ToList(), chunk.KeyMasterOffset), "CONDITION_OCCURRENCE");

               Write(chunk.ChunkId, chunk.SubChunkId, new v5.DrugCostDataReader(chunk.DrugCost.ToList(), chunk.KeyMasterOffset), "DRUG_COST");
               Write(chunk.ChunkId, chunk.SubChunkId, new v5.DeviceCostDataReader(chunk.DeviceCost.ToList(), chunk.KeyMasterOffset), "DEVICE_COST");
               Write(chunk.ChunkId, chunk.SubChunkId, new v5.ProcedureCostDataReader(chunk.ProcedureCost.ToList(), chunk.KeyMasterOffset), "PROCEDURE_COST");
               Write(chunk.ChunkId, chunk.SubChunkId, new v5.VisitCostDataReader(chunk.VisitCost.ToList(), chunk.KeyMasterOffset), "VISIT_COST");
            }
            else if (Settings.Current.Building.CDM == CDMVersions.v501)
            {
               Write(chunk.ChunkId, chunk.SubChunkId, new v5.ConditionOccurrenceDataReader2(chunk.ConditionOccurrences.ToList(), chunk.KeyMasterOffset), "CONDITION_OCCURRENCE");
               Write(chunk.ChunkId, chunk.SubChunkId, new v5.CostDataReader(chunk.Cost.ToList(), chunk.KeyMasterOffset), "COST");
            }

            Commit();
         }
         catch (Exception e)
         {
            Logger.WriteError(chunk.ChunkId, e);
            Rollback();
            Logger.Write(chunk.ChunkId, LogMessageTypes.Debug, "Rollback - Complete");
            throw;
         }
      }

      private void SaveAsync(ChunkData chunk)
      {
         try
         {
            UpdateOffset(chunk.KeyMasterOffset);

            var tasks = new List<Task>();

            tasks.Add(
               Task.Run(
                  () => Write(chunk.ChunkId, chunk.SubChunkId, new v5.PersonDataReader(chunk.Persons.ToList()), "PERSON")));
            tasks.Add(
               Task.Run(
                  () =>
                     Write(chunk.ChunkId, chunk.SubChunkId,
                        new v5.ObservationPeriodDataReader(chunk.ObservationPeriods.ToList(), chunk.KeyMasterOffset),
                        "OBSERVATION_PERIOD")));
            tasks.Add(
               Task.Run(
                  () =>
                     Write(chunk.ChunkId, chunk.SubChunkId,
                        new v5.PayerPlanPeriodDataReader(chunk.PayerPlanPeriods.ToList(), chunk.KeyMasterOffset),
                        "PAYER_PLAN_PERIOD")));
            tasks.Add(
               Task.Run(() => Write(chunk.ChunkId, chunk.SubChunkId, new v5.DeathDataReader(chunk.Deaths.ToList()), "DEATH")));
            tasks.Add(
               Task.Run(
                  () =>
                     Write(chunk.ChunkId, chunk.SubChunkId,
                        new v5.DrugExposureDataReader(chunk.DrugExposures.ToList(), chunk.KeyMasterOffset), "DRUG_EXPOSURE")));
            tasks.Add(
               Task.Run(
                  () =>
                     Write(chunk.ChunkId, chunk.SubChunkId,
                        new v5.ObservationDataReader(chunk.Observations.ToList(), chunk.KeyMasterOffset), "OBSERVATION")));
            tasks.Add(
               Task.Run(
                  () =>
                     Write(chunk.ChunkId, chunk.SubChunkId,
                        new v5.VisitOccurrenceDataReader(chunk.VisitOccurrences.ToList(), chunk.KeyMasterOffset),
                        "VISIT_OCCURRENCE")));
            tasks.Add(
               Task.Run(
                  () =>
                     Write(chunk.ChunkId, chunk.SubChunkId,
                        new v5.ProcedureOccurrenceDataReader(chunk.ProcedureOccurrences.ToList(), chunk.KeyMasterOffset),
                        "PROCEDURE_OCCURRENCE")));

            tasks.Add(
               Task.Run(
                  () =>
                     Write(chunk.ChunkId, chunk.SubChunkId,
                        new v5.DrugEraDataReader(chunk.DrugEra.ToList(), chunk.KeyMasterOffset), "DRUG_ERA")));
            tasks.Add(
               Task.Run(
                  () =>
                     Write(chunk.ChunkId, chunk.SubChunkId,
                        new v5.ConditionEraDataReader(chunk.ConditionEra.ToList(), chunk.KeyMasterOffset), "CONDITION_ERA")));
            tasks.Add(
               Task.Run(
                  () =>
                     Write(chunk.ChunkId, chunk.SubChunkId,
                        new v5.DeviceExposureDataReader(chunk.DeviceExposure.ToList(), chunk.KeyMasterOffset),
                        "DEVICE_EXPOSURE")));
            tasks.Add(
               Task.Run(
                  () =>
                     Write(chunk.ChunkId, chunk.SubChunkId,
                        new v5.MeasurementDataReader(chunk.Measurements.ToList(), chunk.KeyMasterOffset), "MEASUREMENT")));
            tasks.Add(
               Task.Run(() => Write(chunk.ChunkId, chunk.SubChunkId, new v5.CohortDataReader(chunk.Cohort.ToList()), "COHORT")));

            if (Settings.Current.Building.CDM == CDMVersions.v5)
            {
               tasks.Add(
                  Task.Run(
                     () =>
                        Write(chunk.ChunkId, chunk.SubChunkId,
                           new v5.ConditionOccurrenceDataReader(chunk.ConditionOccurrences.ToList(), chunk.KeyMasterOffset),
                           "CONDITION_OCCURRENCE")));

               tasks.Add(
                  Task.Run(
                     () =>
                        Write(chunk.ChunkId, chunk.SubChunkId,
                           new v5.DrugCostDataReader(chunk.DrugCost.ToList(), chunk.KeyMasterOffset), "DRUG_COST")));
               tasks.Add(
                  Task.Run(
                     () =>
                        Write(chunk.ChunkId, chunk.SubChunkId,
                           new v5.DeviceCostDataReader(chunk.DeviceCost.ToList(), chunk.KeyMasterOffset), "DEVICE_COST")));
               tasks.Add(
                  Task.Run(
                     () =>
                        Write(chunk.ChunkId, chunk.SubChunkId,
                           new v5.ProcedureCostDataReader(chunk.ProcedureCost.ToList(), chunk.KeyMasterOffset),
                           "PROCEDURE_COST")));
               tasks.Add(
                  Task.Run(
                     () =>
                        Write(chunk.ChunkId, chunk.SubChunkId,
                           new v5.VisitCostDataReader(chunk.VisitCost.ToList(), chunk.KeyMasterOffset), "VISIT_COST")));
            }
            else if (Settings.Current.Building.CDM == CDMVersions.v501)
            {
               tasks.Add(
                  Task.Run(
                     () =>
                        Write(chunk.ChunkId, chunk.SubChunkId,
                           new v5.ConditionOccurrenceDataReader2(chunk.ConditionOccurrences.ToList(), chunk.KeyMasterOffset),
                           "CONDITION_OCCURRENCE")));
               tasks.Add(
                  Task.Run(
                     () =>
                        Write(chunk.ChunkId, chunk.SubChunkId,
                           new v5.CostDataReader(chunk.Cost.ToList(), chunk.KeyMasterOffset), "COST")));
            }

            Task.WaitAll(tasks.ToArray());
            Commit();
         }
         catch (Exception e)
         {
            Logger.WriteError(chunk.ChunkId, e);
            Rollback();
            Logger.Write(chunk.ChunkId, LogMessageTypes.Debug, "Rollback - Complete");
            throw;
         }
      }

      public virtual void SaveEntityLookup(List<Location> location, List<Organization> organization,
         List<CareSite> careSite, List<Provider> provider)
      {
         SaveEntityLookupV5(location, organization, careSite, provider);
      }

      public virtual void SaveEntityLookupV5(List<Location> location, List<Organization> organization, List<CareSite> careSite, List<Provider> provider)
      {
          try
          {
              if (location != null && location.Count > 0)
                 Write(null, null, new v5.LocationDataReader(location), "LOCATION");

              if (careSite != null && careSite.Count > 0)
                 Write(null, null, new v5.CareSiteDataReader(careSite), "CARE_SITE");

              if (provider != null && provider.Count > 0)
                  Write(null, null, new v5.ProviderDataReader(provider), "PROVIDER");

              Commit();
          }
          catch (Exception e)
          {
              Logger.WriteError(e);
              Rollback();
          }
      }

      public virtual void AddChunk(List<ChunkRecord> chunk, int index)
      {
         try
         {
            Write(null, null, new ChunkDataReader(chunk), "_chunks");
         }
         catch (Exception e)
         {
            Logger.WriteError(e);
            Rollback();
         }
      }

      public virtual void Write(int? chunkId, int? subChunkId, IDataReader reader, string tableName)
      {
         throw new NotImplementedException();
      }

      public virtual void Commit()
      {
         
      }

      public virtual void Rollback()
      {
         
      }

      public virtual void CopyVocabulary()
      {
         throw new NotImplementedException();
      }

      public virtual void Dispose()
      {
         
      }
   }
}

   
   
