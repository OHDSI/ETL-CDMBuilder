namespace org.ohdsi.cdm.framework.entities.Omop
{
   public class CareSite : Entity
   {
      public long LocationId { get; set; }
      public int OrganizationId { get; set; }
      public string PlaceOfSvcSourceValue { get; set; }

      public override string GetKey()
      {
         return Id + ":" + LocationId;
      }
   }
}
