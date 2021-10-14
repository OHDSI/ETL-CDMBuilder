using System;
using System.Collections.Generic;
using System.Text;

namespace org.ohdsi.cdm.framework.common.Omop
{
    public class EpisodeEvent
    {
        public long EpisodeId { get; set; }
        public long EventId { get; set; }
        public int EpisodeEventFieldConceptId { get; set; }
    }
}
