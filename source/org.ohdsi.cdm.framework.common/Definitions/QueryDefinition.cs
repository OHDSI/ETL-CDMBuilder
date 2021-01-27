using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading;
using System.Xml.Serialization;

namespace org.ohdsi.cdm.framework.common.Definitions
{
    [XmlType(TypeName = "Variable")]
    [Serializable]
    public class QueryVariable
    {
        [XmlAttribute("database")]
        public string Database { get; set; }

        [XmlAttribute("name")]
        public string Name { get; set; }

        [XmlText]
        public string Value { get; set; }
    }

    [Serializable]
    public class Query
    {
        [XmlAttribute("database")]
        public string Database { get; set; }

        [XmlText]
        public string Text { get; set; }
    }

    public class QueryDefinition
    {
        private long _processedRowCount;

        public Guid Guid { get; set; }
        public Query Query { get; set; }
        public QueryVariable[] Variables { get; set; }
        public string FileName { get; set; }

        [XmlIgnore]
        public Dictionary<string, int> FieldHeaders { get; set; }

        [XmlIgnore]
        public bool DataProcessed { get; set; }

        [XmlIgnore]
        public bool Reading { get; set; }


        [XmlIgnore]
        public long ProcessedRowCount => _processedRowCount;

        [XmlIgnore]
        public Dictionary<long, long> ProcessedPersonIds { get; set; }


        [XmlIgnore]
        public EventWaitHandle WaitHandle { get; } = new ManualResetEvent(true);

        [XmlIgnore]
        public bool Awaiting { get; set; }

        public PersonDefinition[] Persons { get; set; }
        public PayerPlanPeriodDefinition[] PayerPlanPeriods { get; set; }
        public ObservationPeriodDefinition[] ObservationPeriod { get; set; }
        public ConditionOccurrenceDefinition[] ConditionOccurrence { get; set; }
        public DeathDefinition[] Death { get; set; }
        public DrugExposureDefinition[] DrugExposure { get; set; }
        public DrugCostDefinition[] DrugCost { get; set; }
        public ProcedureCostDefinition[] ProcedureCost { get; set; }
        public MeasurementCostDefinition[] MeasurementCost { get; set; }
        public ObservationCostDefinition[] ObservationCost { get; set; }

        public ProcedureOccurrenceDefinition[] ProcedureOccurrence { get; set; }
        public NoteDefinition[] Note { get; set; }
        public ObservationDefinition[] Observation { get; set; }
        public MeasurementDefinition[] Measurement { get; set; }
        public VisitOccurrenceDefinition[] VisitOccurrence { get; set; }
        public VisitDetailDefinition[] VisitDetail { get; set; }
        public VisitCostDefinition[] VisitCost { get; set; }
        public CohortDefinition[] Cohort { get; set; }
        public DeviceExposureDefinition[] DeviceExposure { get; set; }
        public DeviceCostDefinition[] DeviceCost { get; set; }

        public LocationDefinition[] Locations { get; set; }
        public OrganizationDefinition[] Organizations { get; set; }
        public CareSiteDefinition[] CareSites { get; set; }
        public ProviderDefinition[] Providers { get; set; }

        public void RowProcessed()
        {
            //Interlocked.Increment(ref _processedRowCount);
            _processedRowCount++;
        }

        public QueryDefinition()
        {
            ProcessedPersonIds = new Dictionary<long, long>();
        }

        public void Clean()
        {
            _processedRowCount = 0;
            ProcessedPersonIds = new Dictionary<long, long>();
            Awaiting = false;
            DataProcessed = false;
        }

        public List<EntityDefinition> FindDefinition(IEnumerable<EntityDefinition> definitions, IDataRecord reader)
        {
            if (definitions == null) return null;
            var result = new List<EntityDefinition>();

            foreach (var definition in definitions)
            {
                if (!definition.Match(reader)) continue;

                result.Add(definition);
            }

            return result;
        }

        public string GetPersonIdFieldName()
        {
            if (Persons != null && Persons.Any())
            {
                return Persons[0].PersonId;
            }

            if (PayerPlanPeriods != null && PayerPlanPeriods.Any())
            {
                return PayerPlanPeriods[0].PersonId;
            }

            if (ConditionOccurrence != null && ConditionOccurrence.Any())
            {
                return ConditionOccurrence[0].PersonId;
            }

            if (Death != null && Death.Any())
            {
                return Death[0].PersonId;
            }

            if (DrugExposure != null && DrugExposure.Any())
            {
                return DrugExposure[0].PersonId;
            }

            if (ProcedureOccurrence != null && ProcedureOccurrence.Any())
            {
                return ProcedureOccurrence[0].PersonId;
            }

            if (Observation != null && Observation.Any())
            {
                return Observation[0].PersonId;
            }

            if (Measurement != null && Measurement.Any())
            {
                return Measurement[0].PersonId;
            }

            if (VisitOccurrence != null && VisitOccurrence.Any())
            {
                return VisitOccurrence[0].PersonId;
            }

            if (VisitDetail != null && VisitDetail.Any())
            {
                return VisitDetail[0].PersonId;
            }

            if (Cohort != null && Cohort.Any())
            {
                return Cohort[0].PersonId;
            }

            if (DeviceExposure != null && DeviceExposure.Any())
            {
                return DeviceExposure[0].PersonId;
            }

            if (Note != null && Note.Any())
            {
                return Note[0].PersonId;
            }

            throw new Exception("Cant find PersonId FieldName " + this.FileName);
        }

        public string GetSql(string vendor, string schemaName)
        {
            if (!IsSuitable(Query.Database, vendor))
                return null;

            if (Variables == null || !Variables.Any())
                return Query.Text.Replace("{sc}", schemaName);

            foreach (var v in Variables)
            {
                if (!IsSuitable(v.Database, vendor))
                    continue;

                Query.Text = Query.Text.Replace("{" + v.Name + "}", v.Value);
            }

            return Query.Text.Replace("{sc}", schemaName);
        }


        public string GetSql(string vendor)
        {
            if (!IsSuitable(Query.Database, vendor))
                return null;

            if (Variables == null || !Variables.Any())
                return Query.Text;

            foreach (var v in Variables)
            {
                if (!IsSuitable(v.Database, vendor))
                    continue;

                Query.Text = Query.Text.Replace("{" + v.Name + "}", v.Value);
            }

            return Query.Text;
        }

        public bool IsSuitable(string databases, string vendor)
        {
            if (string.IsNullOrEmpty(databases))
                return true;

            return
               databases.Split(new[] { "," }, StringSplitOptions.RemoveEmptyEntries)
                  .Any(db => vendor.ToLower().Contains(db.Trim().ToLower()));
        }
    }
}
