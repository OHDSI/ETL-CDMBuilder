using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace org.ohdsi.cdm.presentation.builderwebapi
{
    public enum Status
    {
        Started,
        Running,
        Finished,
        Error,
        Failed,
        Canceled,
        None
    }

    public class LogMessage
    {
        public Status Status { get; set; }
        public string Text { get; set; }

        public Double Progress { get; set; }
    }
}
