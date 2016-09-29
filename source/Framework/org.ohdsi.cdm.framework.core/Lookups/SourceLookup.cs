using System.Collections.Generic;
using System.Data;

namespace org.ohdsi.cdm.framework.core.Lookups
{
   public class SourceLookup : BaseLookup
   {
      private readonly Dictionary<string, string> mLookup = new Dictionary<string, string>();

      public SourceLookup(string connectionString, string sqlFileDestination, string schemaName)
         : base(connectionString, sqlFileDestination, schemaName)
      {
         
      }

      public override void AddRecord(IDataReader reader)
      {
         var key = reader[0].ToString().Trim();
         var source = reader[1].ToString().Trim();

         if (!mLookup.ContainsKey(key))
         {
            mLookup.Add(key, source);
         }
      }

      public override string LookupSource(string key)
      {
         if (mLookup.ContainsKey(key))
            return mLookup[key];

         return null;
      }
   }
}
