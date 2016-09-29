using System.Collections.Generic;
using APSClient;

namespace org.ohdsi.cdm.framework.core.Savers
{
   public class APSSaver : Saver
   {
      private static readonly Dictionary<string, bool> replicatedTables = new Dictionary<string, bool>
      {
         {"care_site", false},
         {"location", false},
         {"organization", false},
         {"provider", false}
      };

      private APSBulkCopy bulkCopy;
      public override ISaver Create(string connectionString)
      {
         bulkCopy = new APSBulkCopy(connectionString);

         return this;
      }

      public override void Write(int? chunkId, int? subChunkId, System.Data.IDataReader reader, string tableName)
      {
         bulkCopy.Write(tableName, GetTableType(tableName), reader);
      }

      private static TableType GetTableType(string tableName)
      {
         return replicatedTables.ContainsKey(tableName.ToLower()) ? TableType.Replicated : TableType.Distributed;
      }
   }
}
