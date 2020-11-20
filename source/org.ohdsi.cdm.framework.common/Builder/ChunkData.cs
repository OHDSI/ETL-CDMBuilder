using org.ohdsi.cdm.framework.common.Enums;
using org.ohdsi.cdm.framework.common.Extensions;
using org.ohdsi.cdm.framework.common.Omop;
using System.Collections.Generic;

namespace org.ohdsi.cdm.framework.common.Builder
{
    public class ChunkData
    {

        public int SubChunkId { get; set; }
        public int ChunkId { get; set; }

        public List<Person> Persons { get; private set; }
        public List<Death> Deaths { get; private set; }
        public List<Note> Note { get; private set; }
        public List<ObservationPeriod> ObservationPeriods { get; private set; }
        public List<PayerPlanPeriod> PayerPlanPeriods { get; private set; }
        public List<ConditionOccurrence> ConditionOccurrences { get; private set; }
        public List<DrugExposure> DrugExposures { get; private set; }
        public List<ProcedureOccurrence> ProcedureOccurrences { get; private set; }
        public List<Observation> Observations { get; private set; }
        public List<Measurement> Measurements { get; private set; }
        public List<VisitOccurrence> VisitOccurrences { get; private set; }
        public List<VisitDetail> VisitDetails { get; private set; }

        public List<EraEntity> ConditionEra { get; private set; }
        public List<EraEntity> DrugEra { get; private set; }
        public List<Cohort> Cohort { get; private set; }
        public List<DeviceExposure> DeviceExposure { get; private set; }

        public List<Cost> Cost { get; private set; }
        public Dictionary<long, Metadata> Metadata { get; private set; }

        public List<FactRelationship> FactRelationships { get; private set; }

        public ChunkData(int chunkId, int subChunkId)
        {
            ChunkId = chunkId;
            SubChunkId = subChunkId;
            Init();
        }

        public void AddAttrition(long personId, Attrition attrition)
        {
            if (attrition == Attrition.None)
                return;

            if (!Metadata.ContainsKey(personId))
                Metadata.Add(personId, null);

            Metadata[personId] = new Metadata { PersonId = personId, Name = attrition.ToName() };
        }


        public ChunkData()
        {
            Init();
        }

        public void Init()
        {
            Metadata = new Dictionary<long, Metadata>();
            Persons = new List<Person>();
            Deaths = new List<Death>();
            ObservationPeriods = new List<ObservationPeriod>();
            PayerPlanPeriods = new List<PayerPlanPeriod>();
            ConditionOccurrences = new List<ConditionOccurrence>();
            DrugExposures = new List<DrugExposure>();
            ProcedureOccurrences = new List<ProcedureOccurrence>();
            Observations = new List<Observation>();
            Measurements = new List<Measurement>();
            VisitOccurrences = new List<VisitOccurrence>();
            VisitDetails = new List<VisitDetail>();

            ConditionEra = new List<EraEntity>();
            DrugEra = new List<EraEntity>();
            Cohort = new List<Cohort>();
            DeviceExposure = new List<DeviceExposure>();
            Cost = new List<Cost>();
            Note = new List<Note>();
            FactRelationships = new List<FactRelationship>();
        }

        public void Clean()
        {
            Metadata = null;
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
            VisitDetails = null;

            ConditionEra = null;
            DrugEra = null;
            Cohort = null;
            DeviceExposure = null;
            Cost = null;
            Note = null;
            FactRelationships = null;
        }

        public bool AddCostData(Cost cost)
        {
            if (cost == null)
                return false;
            if (cost.PaidPatientCopay == 0 && cost.PaidPatientCoinsurance == 0 && cost.PaidPatientDeductible == 0 &&
                cost.PaidByPayer == 0 && cost.TotalPaid == 0)
                return false;

            Cost.Add(cost);
            return true;
        }

        public void AddData(IEntity data, EntityType entityType)
        {
            switch (entityType)
            {
                case EntityType.Person:
                    {
                        Persons.Add((Person)data);
                        break;
                    }

                case EntityType.Death:
                    {
                        Deaths.Add((Death)data);
                        break;
                    }

                case EntityType.PayerPlanPeriod:
                    {
                        PayerPlanPeriods.Add((PayerPlanPeriod)data);
                        break;
                    }

                case EntityType.ConditionOccurrence:
                    {
                        ConditionOccurrences.Add((ConditionOccurrence)data);
                        break;
                    }

                case EntityType.DrugExposure:
                    {
                        DrugExposures.Add((DrugExposure)data);
                        break;
                    }

                case EntityType.ProcedureOccurrence:
                    {
                        ProcedureOccurrences.Add((ProcedureOccurrence)data);
                        break;
                    }

                case EntityType.Observation:
                    {
                        Observations.Add((Observation)data);
                        break;
                    }

                case EntityType.VisitOccurrence:
                    {
                        VisitOccurrences.Add((VisitOccurrence)data);
                        break;
                    }

                case EntityType.VisitDetail:
                    {
                        VisitDetails.Add((VisitDetail)data);
                        break;
                    }

                case EntityType.Cohort:
                    {
                        Cohort.Add((Cohort)data);
                        break;
                    }

                case EntityType.Measurement:
                    {
                        Measurements.Add((Measurement)data);
                        break;
                    }

                case EntityType.DeviceExposure:
                    {
                        DeviceExposure.Add((DeviceExposure)data);
                        break;
                    }

                case EntityType.ObservationPeriod:
                    {
                        ObservationPeriods.Add((ObservationPeriod)data);
                        break;
                    }

                case EntityType.DrugEra:
                    {
                        DrugEra.Add((EraEntity)data);
                        break;
                    }

                case EntityType.ConditionEra:
                    {
                        ConditionEra.Add((EraEntity)data);
                        break;
                    }

                case EntityType.Note:
                    {
                        Note.Add((Note)data);
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
