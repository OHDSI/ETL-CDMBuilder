using System;
using System.Data;
using System.Diagnostics;
using System.Linq;
using org.ohdsi.cdm.framework.data.DbLayer;
using org.ohdsi.cdm.framework.entities.Builder;
using org.ohdsi.cdm.framework.entities.DataReaders;
using org.ohdsi.cdm.framework.shared.Enums;
using org.ohdsi.cdm.framework.shared.Extensions;

namespace org.ohdsi.cdm.framework.core.Savers
{
   public class Saver : ISaver
   {
      public virtual ISaver Create()
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

         var dbKeyOffset = new DbKeyOffset(Settings.Current.Building.BuilderConnectionString);
         foreach (var reader in dbKeyOffset.Update(Settings.Current.Building.Id.Value, visitOffset, periodOffset, drugOffset, procedureOffset))
         {
            offset.VisitOccurrenceOffset = reader.GetLong("VisitOccurrence").Value - visitOffset;
            offset.PayerPlanPeriodOffset = reader.GetLong("PayerPlanPeriod").Value - periodOffset;
            offset.DrugExposureOffset = reader.GetLong("DrugExposure").Value - drugOffset;
            offset.ProcedureOccurrenceOffset = reader.GetLong("ProcedureOccurrence").Value - procedureOffset;
         }
      }

      public void Save(ChunkData chunk)
      {
         var timer = new Stopwatch();
         timer.Start();
         try
         {
            UpdateOffset(chunk.KeyMasterOffset);

            Write(chunk.Id, new PersonDataReader(chunk.Persons.ToList()), "PERSON");
            Write(chunk.Id, new ObservationPeriodDataReader(chunk.ObservationPeriods.ToList()), "OBSERVATION_PERIOD");
            Write(chunk.Id, new PayerPlanPeriodDataReader(chunk.PayerPlanPeriods.ToList(), chunk.KeyMasterOffset), "PAYER_PLAN_PERIOD");
            Write(chunk.Id, new ConditionOccurrenceDataReader(chunk.ConditionOccurrences.ToList(), chunk.KeyMasterOffset), "CONDITION_OCCURRENCE");
            Write(chunk.Id, new DeathDataReader(chunk.Deaths.ToList()), "DEATH");
            Write(chunk.Id, new DrugExposureDataReader(chunk.DrugExposures.ToList(), chunk.KeyMasterOffset), "DRUG_EXPOSURE");
            Write(chunk.Id, new DrugCostDataReader(chunk.DrugCost.ToList(), chunk.KeyMasterOffset), "DRUG_COST");
            Write(chunk.Id, new ObservationDataReader(chunk.Observations.ToList(), chunk.KeyMasterOffset), "OBSERVATION");
            Write(chunk.Id, new VisitOccurrenceDataReader(chunk.VisitOccurrences.ToList(), chunk.KeyMasterOffset), "VISIT_OCCURRENCE");
            Write(chunk.Id, new ProcedureOccurrenceDataReader(chunk.ProcedureOccurrences.ToList(), chunk.KeyMasterOffset), "PROCEDURE_OCCURRENCE");
            Write(chunk.Id, new ProcedureCostDataReader(chunk.ProcedureCost.ToList(), chunk.KeyMasterOffset), "PROCEDURE_COST");
            Write(chunk.Id, new DrugEraDataReader(chunk.DrugEra.ToList()), "DRUG_ERA");
            Write(chunk.Id, new ConditionEraDataReader(chunk.ConditionEra.ToList()), "CONDITION_ERA");
            Write(chunk.Id, new CohortDataReader(chunk.Cohort.ToList()), "COHORT");

            Commit();
            var dbChunk = new DbChunk(Settings.Current.Building.BuilderConnectionString);
            dbChunk.ChunkComplete(chunk.Id);
         }
         catch (Exception e)
         {
            Logger.WriteError(chunk.Id, e);
            Rollback();
            Logger.Write(chunk.Id, LogMessageTypes.Debug, "Rollback - Complete");
         }

         timer.Stop();
      }

      public virtual void Write(int chunkId, IDataReader reader, string tableName)
      {
         throw new NotImplementedException();
      }

      public virtual void Commit()
      {
         
      }

      public virtual void Rollback()
      {
         
      }

      public virtual void Dispose()
      {
         
      }
   }
}

   
   
