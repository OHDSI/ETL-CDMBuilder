using org.ohdsi.cdm.presentation.builderwebapi.Enums;

namespace org.ohdsi.cdm.presentation.builderwebapi.Log
{
    public class LogMessage
    {
        public string User { get; set; }
        public int? ConversionId { get; set; }
        public int? StepId { get; set; }
        public int? ChunkId { get; set; }
        public LogType Type { get; set; }
        public string Text { get; set; }
    }
}