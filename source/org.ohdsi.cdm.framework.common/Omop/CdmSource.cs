using System;

namespace org.ohdsi.cdm.framework.common.Omop
{
    public class CdmSource
    {
        public string CdmSourceName { get; set; }
        public string CdmSourceAbbreviation { get; set; }
        public string CdmHolder { get; set; }
        public string SourceDescription { get; set; }
        public string SourceDocumentationReference { get; set; }
        public string CdmEtlReference { get; set; }
        public DateTime SourceReleaseDate { get; set; }
        public DateTime CdmReleaseDate { get; set; }
        public string CdmVersion { get; set; }
        public int CdmVersionConceptId { get; set; }
        public string VocabularyVersion { get; set; }

        public CdmSource()
        {
        }
    }
}
