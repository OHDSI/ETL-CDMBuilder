using System.Collections.Generic;

namespace org.ohdsi.cdm.presentation.builderwebapi.Log
{
    public class ConversionLogMessage
    {
        public int id { get; set; }
        public int statusCode { get; set; }
        public string statusName { get; set; }
        public List<Message> logs { get; set; }
    }
}
