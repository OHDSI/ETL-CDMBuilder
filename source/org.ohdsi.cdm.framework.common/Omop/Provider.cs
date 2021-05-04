namespace org.ohdsi.cdm.framework.common.Omop
{
    public class Provider : Entity
    {
        public long? CareSiteId { get; set; }
        public string ProviderSourceValue { get; set; }
        public string Npi { get; set; }
        public string Dea { get; set; }

        // CDM v5 props
        public string Name { get; set; }
        public int? YearOfBirth { get; set; }
        public int? GenderConceptId { get; set; }
        public string GenderSourceValue { get; set; }
        public int? GenderSourceConceptId { get; set; }
        public int? SpecialtySourceConceptId { get; set; }


        public override string GetKey()
        {
            if (string.IsNullOrEmpty(SourceValue))
                return Id.ToString();

            return SourceValue;
        }
    }
}