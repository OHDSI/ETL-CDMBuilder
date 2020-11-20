using org.ohdsi.cdm.framework.desktop;
using org.ohdsi.cdm.framework.desktop.DbLayer;
using org.ohdsi.cdm.framework.desktop.Helpers;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;

namespace org.ohdsi.cdm.presentation.builder.Controllers
{
    public class ChunkController
    {
        private readonly DbSource _dbSource;

        public ChunkController()
        {
            _dbSource = new DbSource(Settings.Current.Building.SourceConnectionString, Path.Combine(new[]
            {
                Settings.Current.BuilderFolder,
                "ETL",
                "Common",
                "Scripts",
                Settings.Current.Building.SourceEngine.Database.ToString()
            }), Settings.Current.Building.SourceSchema);
        }


        public void ClenupChunks()
        {
            _dbSource.DropChunkTable();
        }

        public int CreateChunks()
        {
            var chunks = new List<ChunkRecord>();

            Console.WriteLine("Generating chunk ids...");
            _dbSource.CreateChunkTable();
            _dbSource.CreateIndexesChunkTable();

            var chunkId = 0;
            var k = 0;

            using (var saver = Settings.Current.Building.SourceEngine.GetSaver()
                .Create(Settings.Current.Building.SourceConnectionString,
                Settings.Current.Building.Cdm,
                Settings.Current.Building.SourceSchema,
                Settings.Current.Building.CdmSchema))
            {
                foreach (var chunk in GetPersonKeys(Settings.Current.Building.ChunkSize))
                {
                    chunks.AddRange(chunk.Select(c =>
                        new ChunkRecord { Id = chunkId, PersonId = Convert.ToInt64(c.Key), PersonSource = c.Value }));

                    chunkId++;
                }

                if (chunks.Count > 0)
                {
                    saver.AddChunk(chunks, k);
                }

                saver.Commit();
            }

            Console.WriteLine("Chunk ids were generated and saved, total count=" + chunkId);

            return chunkId;
        }

        public IEnumerable<List<KeyValuePair<string, string>>> GetPersonKeys(int batchSize)
        {
            return GetPersonKeys(Settings.Current.Building.Batches, batchSize);
        }

        public IEnumerable<List<KeyValuePair<string, string>>> GetPersonKeys(long batches, int batchSize)
        {
            var batch = new List<KeyValuePair<string, string>>(batchSize);

            var query = GetSqlHelper.GetSql(Settings.Current.Building.SourceEngine.Database, Settings.Current.Building.BatchScript, Settings.Current.Building.SourceSchema);

            foreach (var reader in _dbSource.GetPersonKeys(query, batches, batchSize))
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
    }
}
