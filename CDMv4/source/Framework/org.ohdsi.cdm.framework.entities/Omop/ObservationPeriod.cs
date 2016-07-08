using System;

namespace org.ohdsi.cdm.framework.entities.Omop
{
    public class ObservationPeriod
    {
        public long PersonId { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
    }
}
