using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using org.ohdsi.cdm.framework.data.DbLayer;
using org.ohdsi.cdm.framework.entities.DataReaders;
using org.ohdsi.cdm.framework.entities.Omop;
using org.ohdsi.cdm.framework.shared.Extensions;

namespace org.ohdsi.cdm.framework.core.Controllers
{
   public class ChunkController
   {
      private readonly DbKeyOffset dbKeyOffset;
      private readonly DbChunk dbChunk;
      private readonly DbSource dbSource;

      public ChunkController()
      {
         dbKeyOffset = new DbKeyOffset(Settings.Current.Building.BuilderConnectionString);
         dbChunk = new DbChunk(Settings.Current.Building.BuilderConnectionString);
         dbSource = new DbSource(Settings.Current.Building.SourceConnectionString);
      }

      public void CreateChunks()
      {
         dbKeyOffset.Create(Settings.Current.Building.Id.Value);
         dbChunk.ClearChunks(Settings.Current.Building.Id.Value);
         dbSource.CreateChunkTable();
         foreach (var chunk in GetPersonKeys(Settings.Current.Builder.BatchSize))
         {
            var chunkId = dbChunk.AddChunk(Settings.Current.Building.Id.Value);

            using (var bulkCopy = new SqlBulkCopy(Settings.Current.Building.SourceConnectionString))
            {
               bulkCopy.Write(
                  new ChunkDataReader(
                     chunk.Select(
                        c => new ChunkRecord {Id = chunkId, PersonId = Convert.ToInt64(c.Key), PersonSource = c.Value})
                        .ToList()),
                  "_chunks");
               bulkCopy.Close();
            }
         }
         dbSource.CreateIndexesChunkTable();
      }

      public IEnumerable<List<KeyValuePair<string, string>>> GetPersonKeys(int batchSize)
      {
         return GetPersonKeys(Settings.Current.Building.Batches, batchSize);
      }

      public bool AllChunksStarted()
      {
         return dbChunk.AllChunksStarted(Settings.Current.Building.Id.Value);
      }

      public bool AllChunksComplete()
      {
         return dbChunk.AllChunksComplete(Settings.Current.Building.Id.Value);
      }

      public int GetChunksCount()
      {
         return dbChunk.GetChunksCount(Settings.Current.Building.Id.Value);
      }

      public int GetCompleteChunksCount()
      {
         return dbChunk.GetCompleteChunksCount(Settings.Current.Building.Id.Value);
      }

      public IEnumerable<List<KeyValuePair<string, string>>> GetPersonKeys(long batches, int batchSize)
      {
         var batch = new List<KeyValuePair<string, string>>(batchSize);
         foreach (var reader in dbSource.GetPersonKeys(Settings.Current.Building.BatchScript, batches, batchSize))
         {
            if (batch.Count == batchSize)
            {
               yield return batch;
               batch.Clear();
            }

            var id = reader[0].ToString().Trim();
            var source = reader[1].ToString().Trim();

            batch.Add(new KeyValuePair<string, string>(id, source));
         }

         yield return batch;
      }

      public void ResetNotFinishedChunks()
      {
         dbChunk.ResetNotFinishedChunks(Settings.Current.Building.Id.Value);
      }

      public void ResetChunks()
      {
         dbChunk.ResetChunks(Settings.Current.Building.Id.Value);
      }
   }
}
