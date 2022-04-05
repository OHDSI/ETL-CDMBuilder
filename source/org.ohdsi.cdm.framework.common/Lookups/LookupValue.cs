using System;
using System.Collections.Generic;

namespace org.ohdsi.cdm.framework.common.Lookups
{
    [Serializable]
    public class LookupValue
    {
        public int? ConceptId { get; set; }
        public string SourceCode { get; set; }

        public DateTime ValidStartDate { get; set; }
        public DateTime ValidEndDate { get; set; }
        public string Domain { get; set; }
        public int SourceConceptId { get; set; }
        public HashSet<int> Ingredients { get; set; }
    }
}
