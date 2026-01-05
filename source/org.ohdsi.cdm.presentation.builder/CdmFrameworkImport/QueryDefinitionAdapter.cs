using org.ohdsi.cdm.framework.common.Definitions;
using org.ohdsi.cdm.framework.common.Enums;
using System.Collections.Concurrent;
using System.Xml.Serialization;

namespace org.ohdsi.cdm.presentation.builder.CdmFrameworkImport
{
    [XmlInclude(typeof(QueryDefinition))]
    [Serializable]
    public class QueryDefinitionAdapter : QueryDefinition
    {
        private static readonly string[] separator = new[] { "," };

        public new ConcurrentDictionary<long, long> ProcessedPersonIds { get; set; }
        public new ConcurrentBag<DeviceCostDefinition> DeviceCost { get; set; }
        public new ConcurrentBag<DrugCostDefinition> DrugCost { get; set; }
        public new ConcurrentBag<MeasurementCostDefinition> MeasurementCost { get; set; }
        public new ConcurrentBag<ProcedureCostDefinition> ProcedureCost { get; set; }
        public new ConcurrentBag<ObservationCostDefinition> ObservationCost { get; set; }

        public bool HasAnyProvidersLocationsCareSites =>
            this.Providers == null ? false : this.Providers.Any()
            || this.Locations == null ? false : this.Locations.Any()
            || this.CareSites == null ? false : this.CareSites.Any();

        public QueryDefinitionAdapter(QueryDefinition original)
            : base()
        {
            if (original == null)
                throw new ArgumentNullException(nameof(original));


            this.ProcessedPersonIds = new ConcurrentDictionary<long, long>();
            foreach (var item in original.ProcessedPersonIds ?? new Dictionary<long, long>())
                if (!this.ProcessedPersonIds.TryAdd(item.Key, item.Value))
                    throw new Exception("Failed to copy property to QueryDefinitionAdapter!");

            this.DeviceCost = new ConcurrentBag<DeviceCostDefinition>();
            foreach (var item in original.DeviceCost ?? new DeviceCostDefinition[0])
                this.DeviceCost.Add(item);

            this.DrugCost = new ConcurrentBag<DrugCostDefinition>();
            foreach (var item in original.DrugCost ?? new DrugCostDefinition[0])
                this.DrugCost.Add(item);

            this.MeasurementCost = new ConcurrentBag<MeasurementCostDefinition>();
            foreach (var item in original.MeasurementCost ?? new MeasurementCostDefinition[0])
                this.MeasurementCost.Add(item);

            this.ProcedureCost = new ConcurrentBag<ProcedureCostDefinition>();
            foreach (var item in original.ProcedureCost ?? new ProcedureCostDefinition[0])
                this.ProcedureCost.Add(item);

            this.ObservationCost = new ConcurrentBag<ObservationCostDefinition>();
            foreach (var item in original.ObservationCost ?? new ObservationCostDefinition[0])
                this.ObservationCost.Add(item);

            this.Awaiting = original.Awaiting;
            this.CareSites = original.CareSites;
            this.Cohort = original.Cohort;
            this.ConditionOccurrence = original.ConditionOccurrence;
            this.Costs = original.Costs;
            this.DataProcessed = original.DataProcessed;
            this.Death = original.Death;            
            this.DeviceExposure = original.DeviceExposure;
            this.DrugExposure = original.DrugExposure;
            this.EpisodeEvents = original.EpisodeEvents;
            this.Episodes = original.Episodes;
            this.FieldHeaders = original.FieldHeaders;
            this.FileName = original.FileName;
            this.Guid = original.Guid;
            this.Locations = original.Locations;
            this.Measurement = original.Measurement;
            this.Note = original.Note;
            this.Observation = original.Observation;
            this.ObservationPeriods = original.ObservationPeriods;
            this.Organizations = original.Organizations;
            this.PayerPlanPeriods = original.PayerPlanPeriods;
            this.Persons = original.Persons;
            this.ProcedureOccurrence = original.ProcedureOccurrence;
            this.Providers = original.Providers;
            this.Query = original.Query;
            this.Reading = original.Reading;
            this.Variables = original.Variables;
            this.VisitCost = original.VisitCost;
            this.VisitDetail = original.VisitDetail;
            this.VisitOccurrence = original.VisitOccurrence;
        }

        public new string GetSql(Vendor vendor, string sourceSchema, string chunkSchema)
        {
            var res = this.Query.Text
                .Replace("{sc}", sourceSchema)
                .Replace("{ch_sc}", chunkSchema);

            if (this.Variables == null || this.Variables.Length == 0)
                return res;

            foreach (var queryVariable in this.Variables)
            {
                if (IsSuitable(queryVariable.Database, vendor))
                    res = res.Replace("{" + queryVariable.Name + "}", queryVariable.Value);
            }

            return res;
        }

        private new static bool IsSuitable(string databases, Vendor vendor)
        {
            if (string.IsNullOrEmpty(databases))
                return true;

            if (databases.Equals("none", StringComparison.OrdinalIgnoreCase))
                return false;

            return databases
                .Split(separator, StringSplitOptions.RemoveEmptyEntries)
                .Any(db => vendor.ToString().Contains(db.Trim(), StringComparison.CurrentCultureIgnoreCase));
        }
    }

}
