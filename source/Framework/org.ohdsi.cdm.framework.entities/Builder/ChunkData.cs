using System.Collections.Concurrent;
using org.ohdsi.cdm.framework.entities.Omop;
using org.ohdsi.cdm.framework.shared.Enums;

namespace org.ohdsi.cdm.framework.entities.Builder
{
   public class ChunkData
   {
      public int SubChunkId { get; private set; }
      public int ChunkId { get; private set; }

      public ConcurrentQueue<Person> Persons { get; private set; }
      public ConcurrentQueue<Death> Deaths { get; private set; }
      public ConcurrentQueue<ObservationPeriod> ObservationPeriods { get; private set; }
      public ConcurrentQueue<PayerPlanPeriod> PayerPlanPeriods { get; private set; }
      public ConcurrentQueue<ConditionOccurrence> ConditionOccurrences { get; private set; }
      public ConcurrentQueue<DrugExposure> DrugExposures { get; private set; }
      public ConcurrentQueue<ProcedureOccurrence> ProcedureOccurrences { get; private set; }
      public ConcurrentQueue<Observation> Observations { get; private set; }
      public ConcurrentQueue<Measurement> Measurements { get; private set; }
      public ConcurrentQueue<VisitOccurrence> VisitOccurrences { get; private set; }
      public ConcurrentQueue<VisitCost> VisitCost { get; private set; }
      public ConcurrentQueue<DrugCost> DrugCost { get; private set; }
      public ConcurrentQueue<ProcedureCost> ProcedureCost { get; private set; }
      public ConcurrentQueue<EraEntity> ConditionEra { get; private set; }
      public ConcurrentQueue<EraEntity> DrugEra { get; private set; }
      public ConcurrentQueue<Cohort> Cohort { get; private set; }
      public ConcurrentQueue<DeviceExposure> DeviceExposure { get; private set; }
      public ConcurrentQueue<DeviceCost> DeviceCost { get; private set; }
      public ConcurrentQueue<Cost> Cost { get; private set; }

      public KeyMasterOffset KeyMasterOffset { get; private set; }
      public bool Saved { get; private set; }
      public long MinPersonId { get; private set; }
      public long MaxPersonId { get; private set; }

      
      public ChunkData(int chunkId, int subChunkId)
      {
         ChunkId = chunkId;
         SubChunkId = subChunkId;
         
         KeyMasterOffset = new KeyMasterOffset();

         Persons = new ConcurrentQueue<Person>();
         Deaths = new ConcurrentQueue<Death>();
         ObservationPeriods = new ConcurrentQueue<ObservationPeriod>();
         PayerPlanPeriods = new ConcurrentQueue<PayerPlanPeriod>();
         ConditionOccurrences = new ConcurrentQueue<ConditionOccurrence>();
         DrugExposures = new ConcurrentQueue<DrugExposure>();
         ProcedureOccurrences = new ConcurrentQueue<ProcedureOccurrence>();
         Observations = new ConcurrentQueue<Observation>();
         Measurements = new ConcurrentQueue<Measurement>();
         VisitOccurrences = new ConcurrentQueue<VisitOccurrence>();
         VisitCost = new ConcurrentQueue<VisitCost>();
         DrugCost = new ConcurrentQueue<DrugCost>();
         ProcedureCost = new ConcurrentQueue<ProcedureCost>();
         ConditionEra = new ConcurrentQueue<EraEntity>();
         DrugEra = new ConcurrentQueue<EraEntity>();
         Cohort = new ConcurrentQueue<Cohort>();
         DeviceExposure = new ConcurrentQueue<DeviceExposure>();
         DeviceCost = new ConcurrentQueue<DeviceCost>();
         Cost = new ConcurrentQueue<Cost>();
      }

      public void Clean()
      {
         Persons = null;
         Deaths = null;
         ObservationPeriods = null;
         PayerPlanPeriods = null;
         ConditionOccurrences = null;
         DrugExposures = null;
         ProcedureOccurrences = null;
         Observations = null;
         Measurements = null;
         VisitOccurrences = null;
         VisitCost = null;
         DrugCost = null;
         ProcedureCost = null;
         ConditionEra = null;
         DrugEra = null;
         Cohort = null;
         DeviceExposure = null;
         DeviceCost = null;
         Cost = null;
      }

      public bool AddCostData(Cost cost)
      {
         if (cost == null) 
            return false;
         if (cost.PaidPatientCopay == 0 && cost.PaidPatientCoinsurance == 0 && cost.PaidPatientDeductible == 0 &&
             cost.PaidByPayer == 0)
            return false;

         Cost.Enqueue(cost);
         return true;
      }

      public void AddData(IEntity data, EntityType entityType)
      {
         switch (entityType)
         {
            case EntityType.Person:
            {
               Persons.Enqueue((Person) data);
               break;
            }

            case EntityType.Death:
            {
               Deaths.Enqueue((Death) data);
               break;
            }

            case EntityType.PayerPlanPeriod:
            {
               PayerPlanPeriods.Enqueue((PayerPlanPeriod) data);
               break;
            }

            case EntityType.ConditionOccurrence:
            {
               ConditionOccurrences.Enqueue((ConditionOccurrence) data);
               break;
            }

            case EntityType.DrugExposure:
            {
               DrugExposures.Enqueue((DrugExposure) data);
               break;
            }

            case EntityType.ProcedureOccurrence:
            {
               ProcedureOccurrences.Enqueue((ProcedureOccurrence) data);
               break;
            }

            case EntityType.Observation:
            {
               Observations.Enqueue((Observation) data);
               break;
            }

            case EntityType.VisitOccurrence:
            {
               VisitOccurrences.Enqueue((VisitOccurrence) data);
               break;
            }

            case EntityType.Cohort:
            {
               Cohort.Enqueue((Cohort) data);
               break;
            }

            case EntityType.Measurement:
            {
               Measurements.Enqueue((Measurement) data);
               break;
            }

            case EntityType.DeviceExposure:
            {
               DeviceExposure.Enqueue((DeviceExposure) data);
               break;
            }

            case EntityType.DeviceCost:
            {
               DeviceCost.Enqueue((DeviceCost) data);
               break;
            }

            case EntityType.DrugCost:
            {
               DrugCost.Enqueue((DrugCost) data);
               break;
            }

            case EntityType.VisitCost:
            {
               VisitCost.Enqueue((VisitCost) data);
               break;
            }

            //case EntityType.Cost:
            //{
               
            //   break;
            //}

            case EntityType.ProcedureCost:
            {
               ProcedureCost.Enqueue((ProcedureCost) data);
               break;
            }

            case EntityType.ObservationPeriod:
            {
               ObservationPeriods.Enqueue((ObservationPeriod) data);
               break;
            }

            case EntityType.DrugEra:
            {
               DrugEra.Enqueue((EraEntity) data);
               break;
            }

            case EntityType.ConditionEra:
            {
               ConditionEra.Enqueue((EraEntity) data);
               break;
            }
         }
      }

      public void AddData(IEntity data)
      {
         AddData(data, data.GeEntityType());
      }
   }
}
