using org.ohdsi.cdm.framework.common.Base;

namespace org.ohdsi.cdm.presentation.builderwebapi
{
    public class ConversionSettings
    {
        public string SourceEngine { get; set; }
        public string DestinationEngine { get; set; }
        public string VocabularyEngine { get; set; }

        public string SourceServer { get; set; }
        public string DestinationServer { get; set; }
        public string VocabularyServer { get; set; }

        public string SourceSchema { get; set; }
        public string DestinationSchema { get; set; }
        public string VocabularySchema { get; set; }

        public string SourceDatabase { get; set; }
        public string DestinationDatabase { get; set; }
        public string VocabularyDatabase { get; set; }

        public string SourceUser { get; set; }
        public string DestinationUser { get; set; }
        public string VocabularyUser { get; set; }

        public string SourcePassword { get; set; }
        public string DestinationPassword { get; set; }
        public string VocabularyPassword { get; set; }

        public object SourcePort { get; set; }
        public object DestinationPort { get; set; }
        public object VocabularyPort { get; set; }

        public string MappingsName { get; set; }
        public string CdmVersion { get; set; } = "v5.3";

        public BuildSettings BuildSettings { get; set; }
    }
}
