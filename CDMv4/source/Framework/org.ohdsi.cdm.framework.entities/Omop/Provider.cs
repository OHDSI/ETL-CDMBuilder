namespace org.ohdsi.cdm.framework.entities.Omop
{
   public class Provider : Entity
   {
      public int? CareSiteId { get; set; }
      public string ProviderSourceValue { get; set; }
      public string NPI { get; set; }
      public string DEA { get; set; }

      public override string GetKey()
      {
         var source = SourceValue;
         if (!string.IsNullOrEmpty(SourceValue))
            source = SourceValue.TrimStart('0');

         return (source ?? "") + ";" + (ProviderSourceValue ?? "");
      }
   }
}
