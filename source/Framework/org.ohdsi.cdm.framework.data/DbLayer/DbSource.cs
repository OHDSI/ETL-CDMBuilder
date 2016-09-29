using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Odbc;
using System.IO;
using org.ohdsi.cdm.framework.shared.Extensions;
using org.ohdsi.cdm.framework.shared.Helpers;

namespace org.ohdsi.cdm.framework.data.DbLayer
{
   public class DbSource
   {
      private readonly string connectionString;
      private readonly string folder;
      private readonly string schemaName;

      public DbSource(string connectionString, string folder, string schemaName)
      {
         this.connectionString = connectionString;
         this.folder = folder;
         this.schemaName = schemaName;
      }

      public void CreateChunkTable()
      {
         DropChunkTable();
         var query = File.ReadAllText(Path.Combine(folder, "CreateChunkTable.sql"));
         query = query.Replace("{sc}", schemaName);
         using (var connection = SqlConnectionHelper.OpenOdbcConnection(connectionString))
         using (var cmd = new OdbcCommand(query, connection) {CommandTimeout = 0})
         {
            cmd.ExecuteNonQuery();
         }
      }

      public void DropChunkTable()
      {
         var query = File.ReadAllText(Path.Combine(folder, "DropChunkTable.sql"));
         query = query.Replace("{sc}", schemaName);
         using (var connection = SqlConnectionHelper.OpenOdbcConnection(connectionString))
         using (var cmd = new OdbcCommand(query, connection) {CommandTimeout = 0})
         {
            cmd.ExecuteNonQuery();
         }
      }

      public void CreateIndexesChunkTable()
      {
         var query = File.ReadAllText(Path.Combine(folder, "CreateIndexesChunkTable.sql"));
         query = query.Replace("{sc}", schemaName);
         if (string.IsNullOrEmpty(query.Trim())) return;

         using (var connection = SqlConnectionHelper.OpenOdbcConnection(connectionString))
         {
            foreach (var subQuery in query.Split(new[] {"GO" + Environment.NewLine}, StringSplitOptions.RemoveEmptyEntries))
            {
               using (var command = new OdbcCommand(subQuery, connection))
               {
                  command.CommandTimeout = 0;
                  command.ExecuteNonQuery();
               }
            }
         }
      }


      public IEnumerable<IDataReader> GetPersonKeys(string batchScript, long batches, int batchSize)
      {
         batchScript = batchScript.Replace("{sc}", schemaName);
         var sql = batches > 0 ? string.Format(batchScript, "TOP " + batches*batchSize) : string.Format(batchScript, "");
         using (var connection = SqlConnectionHelper.OpenOdbcConnection(connectionString))
         using (var c = new OdbcCommand(sql, connection) {CommandTimeout = 0})
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

      public IEnumerable<long> GetPersonIds(int chunkId)
      {
         var sql = string.Format("SELECT PERSON_ID FROM {0}._chunks where ChunkId = {1}", schemaName, chunkId);
         using (var connection = SqlConnectionHelper.OpenOdbcConnection(connectionString))
         using (var c = new OdbcCommand(sql, connection) { CommandTimeout = 0 })
         {
            using (var reader = c.ExecuteReader())
            {
               while (reader.Read())
               {
                  yield return reader.GetInt64(0);
               }
            }
         }
      }

      public string GetSourceReleaseDate()
      {
         try
         {
            string query = "SELECT VERSION_DATE VERSION_DATE FROM " + schemaName + "._Version";
            using (var connection = SqlConnectionHelper.OpenOdbcConnection(connectionString))
            using (var c = new OdbcCommand(query, connection) { CommandTimeout = 0 })
            {
               using (var reader = c.ExecuteReader())
               {

                  while (reader.Read())
                  {
                     var dateString = reader.GetString("VERSION_DATE");
                     var date = DateTime.Parse(dateString);

                     return date.ToShortDateString();
                  }
               }
            }
         }
         catch (Exception)
         {
            return DateTime.MinValue.ToShortDateString();
         }

         return DateTime.MinValue.ToShortDateString();
      }
   }
}
