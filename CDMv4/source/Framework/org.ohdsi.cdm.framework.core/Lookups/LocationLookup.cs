namespace org.ohdsi.cdm.framework.core.Lookups
{
   public class LocationLookup : BaseLookup
   {
      private static int locationId = 1;
      private static readonly object lockLocationId = new object();

      public override void Load()
      {
      }

      public override long? LookupValue(string sourceValue)
      {
         // we can create our own identifiers if we assume the database is empty on startup
         // will need to implement a vocabulary save function to run at the end to update the lookup tables

         lock (lockLocationId)
         {
            if (!lookup.ContainsKey(sourceValue))
            {
               // create record in database and return the newly created identifier
               lookup.Add(sourceValue, locationId++ );
            }
            return lookup[sourceValue];
         }
      }
   }
}
