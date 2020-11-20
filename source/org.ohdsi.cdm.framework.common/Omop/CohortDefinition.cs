using System;

namespace org.ohdsi.cdm.framework.common.Omop
{
    public class CohortDefinition
    {
        public long Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string Syntax { get; set; }
        public int TypeConceptId { get; set; }
        public int ConceptId { get; set; }
        public DateTime Date { get; set; }
    }
}
