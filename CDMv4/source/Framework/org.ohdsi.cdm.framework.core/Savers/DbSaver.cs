using System.Data.SqlClient;
using org.ohdsi.cdm.framework.shared.Extensions;
using org.ohdsi.cdm.framework.shared.Helpers;

namespace org.ohdsi.cdm.framework.core.Savers
{
   public class DbSaver : Saver
   {
      private SqlConnection connection;
      private SqlTransaction transaction;
      private SqlBulkCopy bulkCopy;

      public override ISaver Create()
      {
         connection = SqlConnectionHelper.OpenConnection(Settings.Current.Building.DestinationConnectionString);
         transaction = connection.BeginTransaction();
         bulkCopy = new SqlBulkCopy(connection, SqlBulkCopyOptions.TableLock, transaction);

         return this;
      }

      public override void Write(int chunkId, System.Data.IDataReader reader, string tableName)
      {
         bulkCopy.Write(reader, tableName);
      }

      public override void Commit()
      {
         transaction.Commit();
         bulkCopy.Close();
      }

      public override void Rollback()
      {
         transaction.Rollback();
      }

      public override void Dispose()
      {
         transaction.Dispose();
         connection.Dispose();
      }
   }
}
