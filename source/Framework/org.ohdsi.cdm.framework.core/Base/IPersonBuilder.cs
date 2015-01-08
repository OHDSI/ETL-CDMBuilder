using System.Collections.Generic;
using org.ohdsi.cdm.framework.entities.Omop;

namespace org.ohdsi.cdm.framework.core.Base
{
   public interface IPersonBuilder
   {
      void AddChildData(IEntity parent, IEntity child);
      void AddData(IEntity data);
      void Build();

      Death BuildDeath(Death[] death, Dictionary<long, VisitOccurrence> visitOccurrences, ObservationPeriod[] observationPeriods);

      Person BuildPerson(List<Person> person);
      bool Excluded(Person person, IEnumerable<ObservationPeriod> periods);
      IEnumerable<VisitOccurrence> BuildVisitOccurrences(VisitOccurrence[] visitOccurrences, ObservationPeriod[] observationPeriods);
      IEnumerable<ObservationPeriod> BuildObservationPeriods(int gap, EraEntity[] observationPeriods);
      IEnumerable<PayerPlanPeriod> BuildPayerPlanPeriods(PayerPlanPeriod[] payerPlanPeriods, Dictionary<long, VisitOccurrence> visitOccurrences);
      IEnumerable<DrugExposure> BuildDrugExposures(DrugExposure[] drugExposuresList, Dictionary<long, VisitOccurrence> visitOccurrences, ObservationPeriod[] observationPeriods);
      IEnumerable<ConditionOccurrence> BuildConditionOccurrences(ConditionOccurrence[] conditionOccurrences, Dictionary<long, VisitOccurrence> visitOccurrences, ObservationPeriod[] observationPeriods);
      IEnumerable<ProcedureOccurrence> BuildProcedureOccurrences(ProcedureOccurrence[] procedureOccurrences, Dictionary<long, VisitOccurrence> visitOccurrences, ObservationPeriod[] observationPeriods);
      IEnumerable<Observation> BuildObservations(Observation[] observations, Dictionary<long, VisitOccurrence> visitOccurrences, ObservationPeriod[] observationPeriods);
      IEnumerable<EraEntity> BuildConditionEra(ConditionOccurrence[] conditionOccurrences);
      IEnumerable<EraEntity> BuildDrugEra(DrugExposure[] drugExposures);
      IEnumerable<Cohort> BuildCohort(Cohort[] cohortRecords, ObservationPeriod[] observationPeriods);
      
      IEnumerable<DrugCost> BuildDrugCosts(DrugExposure[] drugExposuresList);
      IEnumerable<ProcedureCost> BuildProcedureCosts(ProcedureOccurrence[] procedureOccurrences);
   }
}
