using System.Data.Odbc;
using System.Data.SqlClient;
using System.IO;
using org.ohdsi.cdm.framework.data.DbLayer;
using org.ohdsi.cdm.framework.shared.Extensions;
using org.ohdsi.cdm.framework.shared.Helpers;

namespace org.ohdsi.cdm.framework.core.Savers
{
   public class MSSqlSaver : Saver
   {
      private SqlConnection connection;
      private SqlTransaction transaction;
      private SqlBulkCopy bulkCopy;

      public override ISaver Create(string connectionString)
      {
         var odbcConnection = new OdbcConnectionStringBuilder(connectionString);
         var sqlConnection = new SqlConnectionStringBuilder();
         sqlConnection["Data Source"] = odbcConnection["server"];
         sqlConnection["Initial Catalog"] = odbcConnection["database"];
         sqlConnection["User Id"] = odbcConnection["uid"];
         sqlConnection["Password"] = odbcConnection["pwd"];

         connection = SqlConnectionHelper.OpenMSSQLConnection(sqlConnection.ConnectionString);
         transaction = connection.BeginTransaction();
         bulkCopy = new SqlBulkCopy(connection, SqlBulkCopyOptions.TableLock, transaction);

         return this;
      }

      public override void Write(int? chunkId, int? subChunkId, System.Data.IDataReader reader, string tableName)
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

      public override void CopyVocabulary()
      {
         var dbDestination = new DbDestination(Settings.Current.Building.DestinationConnectionString,
               Path.Combine(new[]
                {
                   Settings.Current.Builder.Folder,
                   "Common",
                   Settings.Current.Building.DestinationEngine.Database.ToString()
                }), Settings.Current.Building.DestinationSchemaName);

         dbDestination.CopyVocabulary(Settings.Current.CopyVocabularyScript, Settings.Current.Building.VocabularyConnectionString);
      }
   }
}
