using System.Collections.Concurrent;
using org.ohdsi.cdm.framework.entities.Omop;

namespace org.ohdsi.cdm.framework.entities.Builder
{
   public class ChunkData
   {
      public int Id { get; set; }
      
      public ConcurrentStack<Person> Persons { get; set; }
      public ConcurrentStack<Death> Deaths { get; set; }
      public ConcurrentStack<ObservationPeriod> ObservationPeriods { get; set; }
      public ConcurrentStack<PayerPlanPeriod> PayerPlanPeriods { get; set; }
      public ConcurrentStack<ConditionOccurrence> ConditionOccurrences { get; set; }
      public ConcurrentStack<DrugExposure> DrugExposures { get; set; }
      public ConcurrentStack<ProcedureOccurrence> ProcedureOccurrences { get; set; }
      public ConcurrentStack<Observation> Observations { get; set; }
      public ConcurrentStack<VisitOccurrence> VisitOccurrences { get; set; }
      public ConcurrentStack<DrugCost> DrugCost { get; set; }
      public ConcurrentStack<ProcedureCost> ProcedureCost { get; set; }
      public ConcurrentStack<EraEntity> ConditionEra { get; set; }
      public ConcurrentStack<EraEntity> DrugEra { get; set; }
      public ConcurrentStack<Cohort> Cohort { get; set; }

      public KeyMasterOffset KeyMasterOffset { get; private set; }

      public ChunkData()
      {
         KeyMasterOffset = new KeyMasterOffset();
         Persons = new ConcurrentStack<Person>();
         Deaths = new ConcurrentStack<Death>();
         ObservationPeriods = new ConcurrentStack<ObservationPeriod>();
         PayerPlanPeriods = new ConcurrentStack<PayerPlanPeriod>();
         ConditionOccurrences = new ConcurrentStack<ConditionOccurrence>();
         DrugExposures = new ConcurrentStack<DrugExposure>();
         ProcedureOccurrences = new ConcurrentStack<ProcedureOccurrence>();
         Observations = new ConcurrentStack<Observation>();
         VisitOccurrences = new ConcurrentStack<VisitOccurrence>();
         DrugCost = new ConcurrentStack<DrugCost>();
         ProcedureCost = new ConcurrentStack<ProcedureCost>();
         ConditionEra = new ConcurrentStack<EraEntity>();
         DrugEra = new ConcurrentStack<EraEntity>();
         Cohort = new ConcurrentStack<Cohort>();
      }
   }
}
