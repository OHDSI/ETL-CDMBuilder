using System;
using System.ComponentModel;

namespace org.ohdsi.cdm.framework.common.Omop
{
    public enum Attrition
    {
        None,
        [Description("Gender changes")]
        GenderChanges,
        [Description("Implausible year of birth - future")]
        ImplausibleYOBFuture,
        [Description("Implausible year of birth - past")]
        ImplausibleYOBPast,
        [Description("Implausible year of birth - post earliest observation period")]
        ImplausibleYOBPostEarliestOP,
        [Description("Invalid observation time")]
        InvalidObservationTime,
        [Description("Missing insurance coverage")]
        MissingInsuranceCoverage,
        [Description("Multiple years of birth")]
        MultipleYearsOfBirth,
        [Description("Unacceptable patient quality")]
        UnacceptablePatientQuality,
        [Description("Unknown gender")]
        UnknownGender,
        [Description("Unknown year of birth")]
        UnknownYearOfBirth
    }

    public class MetadataOMOP
    {
        public int Id { get; set; }
        public int MetadataConceptId { get; set; }
        public string Name { get; set; }

        public string ValueAsString { get; set; }

        public int ValueAsConceptId { get; set; }

        public decimal ValueAsNumber { get; set; }

        public DateTime MetadataDate { get; set; }

        public string MetadataDatetime { get; set; }
    }

    public class Metadata
    {
        public long PersonId { get; set; }

        public string Name { get; set; }
    }

    public class Metadata2
    {
        public int ChunkId { get; private set; }
        public int PrefixId { get; private set; }
        public int ConceptId { get; set; }
        public string Name { get; set; }
        public string ValueAsString { get; set; }
        public int ValueAsConceptId { get; set; }
        public DateTime Date { get; set; }
        public int Count { get; set; }

        public Metadata2(int chunkId, int prefixId)
        {
            ChunkId = chunkId;
            PrefixId = prefixId;
            Count = 0;
        }
    }
}
