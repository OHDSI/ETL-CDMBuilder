using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using org.ohdsi.cdm.framework.shared.Helpers;

namespace org.ohdsi.cdm.framework.data.DbLayer
{
   public class DbSource
   {
      private const string CREATE_TMP_CHUNK_TABLE = "CREATE TABLE [dbo].[_chunks] ([ChunkId] [int], [PERSON_ID] [bigint] NOT NULL, [PERSON_SOURCE_VALUE] [varchar](50) NULL) ON [PRIMARY]";
      //private const string DROP_TMP_CHUNK_TABLE = "IF OBJECT_ID(N'tempdb.._chunks', N'U') IS NOT NULL DROP TABLE [dbo].[_chunks]";
      private const string DROP_TMP_CHUNK_TABLE = "IF (EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND  TABLE_NAME = '_chunks')) BEGIN DROP TABLE [dbo].[_chunks] END";

       private readonly string connectionString;

       public DbSource(string connectionString)
      {
         this.connectionString = connectionString;
      }

      public void CreateChunkTable()
      {
         DropChunkTable();
         using (var connection = SqlConnectionHelper.OpenConnection(connectionString))
         using (var cmd = new SqlCommand(CREATE_TMP_CHUNK_TABLE, connection) { CommandTimeout = 0 })
         {
            cmd.ExecuteNonQuery();
         }
      }

      public void DropChunkTable()
      {
         using (var connection = SqlConnectionHelper.OpenConnection(connectionString))
         using (var cmd = new SqlCommand(DROP_TMP_CHUNK_TABLE, connection) { CommandTimeout = 0 })
         {
            cmd.ExecuteNonQuery();
         }
      }

      public void CreateIndexesChunkTable()
      {
         using (var connection = SqlConnectionHelper.OpenConnection(connectionString))
         using (var cmd = new SqlCommand("CREATE CLUSTERED INDEX [pk_person] ON [dbo].[_chunks] ([ChunkId] ASC, [PERSON_ID] ASC) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]", connection) { CommandTimeout = 0 })
         {
            cmd.ExecuteNonQuery();
         }

         using (var connection = SqlConnectionHelper.OpenConnection(connectionString))
         using (var cmd = new SqlCommand("CREATE NONCLUSTERED INDEX [idx_PersonSource] ON [dbo].[_chunks] ([PERSON_SOURCE_VALUE] ASC) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]", connection) { CommandTimeout = 0 })
         {
            cmd.ExecuteNonQuery();
         }
      }
      
      
      public IEnumerable<IDataReader> GetPersonKeys(string batchScript, long batches, int batchSize)
      {
         var sql = batches > 0 ? string.Format(batchScript, "TOP " + batches * batchSize) : string.Format(batchScript, "");

         using (var connection = SqlConnectionHelper.OpenConnection(connectionString))
         using (var c = new SqlCommand(sql, connection) { CommandTimeout = 0 })
         {
            using (var reader = c.ExecuteReader())
            {
               
               while (reader.Read())
               {
                  yield return reader;
               }
            }
         }
      }
   }
}
