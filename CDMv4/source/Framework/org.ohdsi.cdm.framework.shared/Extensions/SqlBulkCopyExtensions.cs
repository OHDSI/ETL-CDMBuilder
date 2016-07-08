using System.Data;
using System.Data.SqlClient;

namespace org.ohdsi.cdm.framework.shared.Extensions
{
   public static class SqlBulkCopyExtensions
   {
      public static void Write(this SqlBulkCopy bulkCopy, IDataReader reader, string tableName)
      {
         bulkCopy.DestinationTableName = tableName;
         bulkCopy.BulkCopyTimeout = int.MaxValue;
         bulkCopy.WriteToServer(reader);
      }
   }
}
