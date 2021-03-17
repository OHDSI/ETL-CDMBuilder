using org.ohdsi.cdm.framework.desktop;
using org.ohdsi.cdm.framework.desktop.DbLayer;
using org.ohdsi.cdm.framework.desktop.Helpers;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;

namespace org.ohdsi.cdm.presentation.builderwebapi.Controllers
{
    public class ChunkController
    {
        private readonly DbSource _dbSource;
        private readonly Settings _settings;
        private const int ChunkSize = 1000;

        public ChunkController(Settings settings)
        {
            _settings = settings;
            _dbSource = new DbSource(settings.SourceConnectionString, Path.Combine(new[]
            {
                settings.Folder,
                "ETL",
                "Common",
                "Scripts",
                settings.ConversionSettings.SourceEngine
            }), settings.ConversionSettings.SourceSchema, settings.SourceEngine);
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

            using (var saver = _settings.SourceEngine.GetSaver()
                .Create(_settings.SourceConnectionString,
                _settings.Cdm,
                _settings.ConversionSettings.SourceSchema,
                _settings.ConversionSettings.DestinationSchema))
            {
                foreach (var chunk in GetPersonKeys(ChunkSize))
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
            return GetPersonKeys(0, batchSize);
        }

        public IEnumerable<List<KeyValuePair<string, string>>> GetPersonKeys(long batches, int batchSize)
        {
            var batch = new List<KeyValuePair<string, string>>(batchSize);

            var query = GetSqlHelper.GetSql(_settings.SourceEngine.Database, _settings.BatchScript, _settings.ConversionSettings.SourceSchema);

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
