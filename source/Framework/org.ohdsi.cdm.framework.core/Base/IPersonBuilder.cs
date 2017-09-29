using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using org.ohdsi.cdm.framework.entities.Builder;
using org.ohdsi.cdm.framework.entities.Omop;
using org.ohdsi.cdm.framework.shared.Enums;

namespace org.ohdsi.cdm.framework.core.Base
{
   public interface IPersonBuilder
   {
      ChunkData Chunk { get; }
      void AddChildData(IEntity parent, IEntity child);
      void AddData(IEntity data);
      void Build(Dictionary<string, long> providers);
      //bool WasBuilt { get; }

      Death BuildDeath(Death[] death, Dictionary<long, VisitOccurrence> visitOccurrences, ObservationPeriod[] observationPeriods);

      Person BuildPerson(List<Person> person);
      bool Excluded(Person person, IEnumerable<ObservationPeriod> periods);
      void JoinToChunkData(ChunkData chunkData);
      void JoinToVocabulary(Vocabulary vocabulary);

      IEnumerable<VisitOccurrence> BuildVisitOccurrences(VisitOccurrence[] visitOccurrences, ObservationPeriod[] observationPeriods);
      IEnumerable<ObservationPeriod> BuildObservationPeriods(int gap, EraEntity[] observationPeriods);
      IEnumerable<PayerPlanPeriod> BuildPayerPlanPeriods(PayerPlanPeriod[] payerPlanPeriods, Dictionary<long, VisitOccurrence> visitOccurrences);
      IEnumerable<DrugExposure> BuildDrugExposures(DrugExposure[] drugExposuresList, Dictionary<long, VisitOccurrence> visitOccurrences, ObservationPeriod[] observationPeriods);
      IEnumerable<ConditionOccurrence> BuildConditionOccurrences(ConditionOccurrence[] conditionOccurrences, Dictionary<long, VisitOccurrence> visitOccurrences, ObservationPeriod[] observationPeriods);
      IEnumerable<ProcedureOccurrence> BuildProcedureOccurrences(ProcedureOccurrence[] procedureOccurrences, Dictionary<long, VisitOccurrence> visitOccurrences, ObservationPeriod[] observationPeriods);
      IEnumerable<Observation> BuildObservations(Observation[] observations, Dictionary<long, VisitOccurrence> visitOccurrences, ObservationPeriod[] observationPeriods);
      IEnumerable<Measurement> BuildMeasurement(Measurement[] measurements, Dictionary<long, VisitOccurrence> visitOccurrences, ObservationPeriod[] observationPeriods);
      IEnumerable<EraEntity> BuildConditionEra(ConditionOccurrence[] conditionOccurrences);
      IEnumerable<EraEntity> BuildDrugEra(DrugExposure[] drugExposures);
      IEnumerable<Cohort> BuildCohort(Cohort[] cohortRecords, ObservationPeriod[] observationPeriods);
      IEnumerable<DeviceExposure> BuildDeviceExposure(DeviceExposure[] devExposure, Dictionary<long, VisitOccurrence> visitOccurrences, ObservationPeriod[] observationPeriods);
      
      IEnumerable<DrugCost> BuildDrugCosts(DrugExposure[] drugExposuresList);
      IEnumerable<ProcedureCost> BuildProcedureCosts(ProcedureOccurrence[] procedureOccurrences);
      IEnumerable<VisitCost> BuildVisitCosts(VisitOccurrence[] visitOccurrences);
      IEnumerable<DeviceCost> BuildDeviceCosts(DeviceExposure[] deviceExposure);

      ConcurrentDictionary<string, bool> ProviderKeys { get; }
      bool AddCost(IEntity data, Func<ICostV5, Cost> createCost);

   }
}
