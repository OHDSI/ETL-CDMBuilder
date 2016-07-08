using System.Threading;

namespace org.ohdsi.cdm.framework.entities.Builder
{
   public class KeyMaster
   {
      private static int locationId = 1;
      private static int organizationId = 1;
      private static int careSiteId = 1;
      private static int providerId = 1;
      
      public static int GetLocationId()
      {
         return Interlocked.Increment(ref locationId);
      }

      public static int GetOrganizationId()
      {
         return Interlocked.Increment(ref organizationId);
      }

      public static int GetCareSiteId()
      {
         return Interlocked.Increment(ref careSiteId);
      }

      public static int GetProviderId()
      {
         return Interlocked.Increment(ref providerId);
      }
   }
}
