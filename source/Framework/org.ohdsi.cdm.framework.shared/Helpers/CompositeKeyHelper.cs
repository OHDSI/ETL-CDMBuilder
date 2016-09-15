namespace org.ohdsi.cdm.framework.shared.Helpers
{
   public class CompositeKeyHelper
   {
      public static string GetCprdDaysSupplyKey(int prodcode)
      {
         return GetCprdDaysSupplyKey(prodcode, null, null, null);
      }

      public static string GetCprdDaysSupplyKey(int prodcode, decimal? ndd, decimal? qty, int? numpacks)
      {
         var key = prodcode.ToString();

         key += ndd.HasValue ? ";" + ndd.Value : ";-1.000";

         key += qty.HasValue ? ";" + qty.Value : ";-1.00";

         key += numpacks.HasValue ? ";" + numpacks.Value : ";-1";

         return key;
      }
   }
}
