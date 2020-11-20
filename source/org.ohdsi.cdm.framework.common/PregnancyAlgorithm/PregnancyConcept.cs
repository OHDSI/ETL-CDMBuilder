using org.ohdsi.cdm.framework.common.Omop;

namespace org.ohdsi.cdm.framework.common.PregnancyAlgorithm
{
    public class PregnancyConcept
    {
        public int EventId { get; set; }
        public int ConceptId { get; set; }
        public string Category { get; set; }
        public string DataValue { get; set; }
        public int? GestValue { get; set; }

        public decimal? ValueAsNumber { get; set; }

        public IEntity Entity { get; set; }
    }
}
