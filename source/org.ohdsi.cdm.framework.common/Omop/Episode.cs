using org.ohdsi.cdm.framework.common.Omop;

namespace org.ohdsi.cdm.framework.common.Omop
{
    public class Episode : Entity
    {
        public long EpisodeParentId { get; set; }
        public int EpisodeNumber { get; set; }
        public int EpisodeObjectConceptId { get; set; }
    }
}
