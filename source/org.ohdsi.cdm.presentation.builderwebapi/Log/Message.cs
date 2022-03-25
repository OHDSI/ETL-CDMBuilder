using System;

namespace org.ohdsi.cdm.presentation.builderwebapi.Log
{
    public class Message
    {
        public int id { get; set; }
        public string message { get; set; }
        public DateTime time { get; set; }
        public int statusCode { get; set; }
        public string statusName { get; set; }
        public int percent { get; set; }
    }
}
