namespace org.ohdsi.cdm.framework.common.Omop
{
    public class Organization : Entity
    {
        public int LocationId { get; set; }
        public string PlaceOfSvcSourceValue { get; set; }

        public override string GetKey()
        {
            return GetOrganizationKey(LocationId, SourceValue);
        }

        public static string GetOrganizationKey(int locationId, string provId)
        {
            return locationId + ":" + provId;
        }
    }
}
