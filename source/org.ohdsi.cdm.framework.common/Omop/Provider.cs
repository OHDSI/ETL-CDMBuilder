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
            if (!string.IsNullOrEmpty(ProviderKey))
                return ProviderKey;

            var source = SourceValue;
            if (!string.IsNullOrEmpty(SourceValue))
                source = SourceValue.TrimStart('0');

            //source - SPECIALTY_SOURCE_VALUE

            //PROVIDER_SOURCE_VALUE	SPECIALTY_SOURCE_VALUE
            //   T88888	250

            //      250;T88888

            return (source ?? "") + ";" + (ProviderSourceValue ?? "");
        }
    }
}