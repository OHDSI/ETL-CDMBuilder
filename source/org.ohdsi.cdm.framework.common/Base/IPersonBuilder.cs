using org.ohdsi.cdm.framework.common.Builder;
using org.ohdsi.cdm.framework.common.Lookups;
using org.ohdsi.cdm.framework.common.Omop;
using System;
using System.Collections.Generic;

namespace org.ohdsi.cdm.framework.common.Base
{
    public interface IPersonBuilder
    {

        bool Complete { get; set; }

        ChunkData Result { get; }

        string GetFolder();

        void AddChildData(ProcedureOccurrence parent, ProcedureCost child);

        void AddChildData(DrugExposure parent, DrugCost child);

        void AddChildData(DeviceExposure parent, DeviceCost child);

        void AddChildData(Measurement parent, MeasurementCost child);

        void AddChildData(Observation parent, ObservationCost child);

        void AddChildData(VisitOccurrence parent, VisitCost child);

        void AddData(IEntity data);

        void AddNote(Note data);

        //void Build(ChunkData chunkData);
        Attrition Build(ChunkData data, KeyMasterOffsetManager offset);

        Death BuildDeath(Death[] death, Dictionary<long, VisitOccurrence> visitOccurrences,
            ObservationPeriod[] observationPeriods);

        KeyValuePair<Person, Attrition> BuildPerson(List<Person> person);
        bool Excluded(Person person, IEnumerable<ObservationPeriod> periods);
        void JoinToVocabulary(IVocabulary vocabulary);

        IEnumerable<VisitOccurrence> BuildVisitOccurrences(VisitOccurrence[] visitOccurrences,
            ObservationPeriod[] observationPeriods);

        IEnumerable<VisitDetail> BuildVisitDetails(VisitDetail[] visitDetails, VisitOccurrence[] visitOccurrences,
            ObservationPeriod[] observationPeriods);

        IEnumerable<ObservationPeriod> BuildObservationPeriods(int gap, EraEntity[] observationPeriods);

        IEnumerable<PayerPlanPeriod> BuildPayerPlanPeriods(PayerPlanPeriod[] payerPlanPeriods,
            Dictionary<long, VisitOccurrence> visitOccurrences);

        IEnumerable<DrugExposure> BuildDrugExposures(DrugExposure[] drugExposuresList,
            Dictionary<long, VisitOccurrence> visitOccurrences, ObservationPeriod[] observationPeriods);

        IEnumerable<ConditionOccurrence> BuildConditionOccurrences(ConditionOccurrence[] conditionOccurrences,
            Dictionary<long, VisitOccurrence> visitOccurrences, ObservationPeriod[] observationPeriods);

        IEnumerable<ProcedureOccurrence> BuildProcedureOccurrences(ProcedureOccurrence[] procedureOccurrences,
            Dictionary<long, VisitOccurrence> visitOccurrences, ObservationPeriod[] observationPeriods);

        IEnumerable<Observation> BuildObservations(Observation[] observations,
            Dictionary<long, VisitOccurrence> visitOccurrences, ObservationPeriod[] observationPeriods);

        IEnumerable<Measurement> BuildMeasurement(Measurement[] measurements,
            Dictionary<long, VisitOccurrence> visitOccurrences, ObservationPeriod[] observationPeriods);

        IEnumerable<EraEntity> BuildConditionEra(ConditionOccurrence[] conditionOccurrences, ObservationPeriod[] observationPeriods);
        IEnumerable<EraEntity> BuildDrugEra(DrugExposure[] drugExposures, ObservationPeriod[] observationPeriods);
        IEnumerable<Cohort> BuildCohort(Cohort[] cohortRecords, ObservationPeriod[] observationPeriods);

        IEnumerable<EraEntity> BuildPregnancyEpisodes(ConditionOccurrence[] conditionOccurrences,
            ProcedureOccurrence[] procedureOccurrences, Observation[] observations, Measurement[] measurements, DrugExposure[] drugExposures);


        IEnumerable<DeviceExposure> BuildDeviceExposure(DeviceExposure[] devExposure,
            Dictionary<long, VisitOccurrence> visitOccurrences, ObservationPeriod[] observationPeriods);

        IEnumerable<DrugCost> BuildDrugCosts(DrugExposure[] drugExposuresList);
        IEnumerable<ProcedureCost> BuildProcedureCosts(ProcedureOccurrence[] procedureOccurrences);
        IEnumerable<VisitCost> BuildVisitCosts(VisitOccurrence[] visitOccurrences);
        IEnumerable<DeviceCost> BuildDeviceCosts(DeviceExposure[] deviceExposure);

        IEnumerable<Note> BuildNote(Note[] notes, Dictionary<long, VisitOccurrence> visitOccurrences,
            ObservationPeriod[] observationPeriods);

        bool AddCost(long eventId, IEntity data, Func<ICostV5, Cost> createCost);
        void Reset();

    }
}
