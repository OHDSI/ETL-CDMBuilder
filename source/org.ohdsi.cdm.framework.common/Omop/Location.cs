namespace org.ohdsi.cdm.framework.common.Omop
{
    public class Location : Entity
    {
        public string Address1 { get; set; }
        public string Address2 { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string Zip { get; set; }
        public string County { get; set; }

        public string Country { get; set; }

        public decimal? Latitude { get; set; }

        public decimal? Longitude { get; set; }

        public override string GetKey()
        {
            if (string.IsNullOrEmpty(SourceValue))
                return Address1 + " " + Address2;

            return SourceValue;
        }

    }
}
