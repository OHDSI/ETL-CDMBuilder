using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using org.ohdsi.cdm.framework.data.DbLayer;
using org.ohdsi.cdm.framework.entities.Omop;
using org.ohdsi.cdm.framework.shared.Enums;
using org.ohdsi.cdm.framework.shared.Helpers;

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
         dbSource = new DbSource(Settings.Current.Building.SourceConnectionString, Path.Combine(new[]
         {
            Settings.Current.Builder.Folder,
            "Common",
            Settings.Current.Building.SourceEngine.Database.ToString()
         }), Settings.Current.Building.SourceSchemaName);
      }

      public void CreateChunks()
      {
         dbKeyOffset.Create(Settings.Current.Building.Id.Value);
         dbChunk.ClearChunks(Settings.Current.Building.Id.Value);
         dbSource.CreateChunkTable();
         int i = 0;
         int k = 0;
         using (var saver = Settings.Current.Building.SourceEngine.GetSaver().Create(Settings.Current.Building.SourceConnectionString))
         {
            List<ChunkRecord> chunks = new List<ChunkRecord>();
            foreach (var chunk in GetPersonKeys(Settings.Current.Builder.BatchSize))
            {
               var chunkId = dbChunk.AddChunk(Settings.Current.Building.Id.Value);

                chunks.AddRange(chunk.Select(c => new ChunkRecord {Id = chunkId, PersonId = Convert.ToInt64(c.Key), PersonSource = c.Value}));
                if (Settings.Current.Building.SourceEngine.Database == Database.Redshift && Settings.Current.Builder.BatchSize >= 10000 && i == 200)
                {
                    saver.AddChunk(chunks, k);
                    chunks.Clear();
                    i = 0;
                    k++;
                }
                i++;
                //saver.AddChunk(chunk.Select(
                //  c => new ChunkRecord {Id = chunkId, PersonId = Convert.ToInt64(c.Key), PersonSource = c.Value})
                //  .ToList());
            }
            if (chunks.Count > 0)
            {
                saver.AddChunk(chunks, k);
            }

            saver.Commit();
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

         var query = GetSqlHelper.GetSql(Settings.Current.Building.SourceEngine.Database, Settings.Current.Building.BatchScript, Settings.Current.Building.SourceSchemaName);
         
         foreach (var reader in dbSource.GetPersonKeys(query, batches, batchSize))
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
