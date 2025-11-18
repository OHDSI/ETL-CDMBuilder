using org.ohdsi.cdm.framework.desktop;
using org.ohdsi.cdm.framework.desktop.Savers;
using org.ohdsi.cdm.presentation.builder.CdmFrameworkImport;
using org.ohdsi.cdm.presentation.builder.Utility;
using System.Diagnostics;
using System.Globalization;


namespace org.ohdsi.cdm.presentation.builder.Controllers
{
    public class ChunkController
    {
        public enum AssignEmptyPersonIdSettings
        {
            DoNothing,
            AssignIfNoPersonIdSet,
            AssignAll
        }
                
        private readonly DbSourceAdapter _dbSource;

        public ChunkController()
        {
            _dbSource = new DbSourceAdapter(Settings.Current.Building.SourceConnectionString,
                Settings.Current.Building.SourceEngine.Database.ToString(), Settings.Current.Building.SourceSchema);
        }

        public int CreateChunks(string chunksSchema)
        {
            Console.WriteLine("\r\nGenerating chunk ids...");
            Stopwatch sw = new Stopwatch();
            sw.Start();

            _dbSource.CreateChunkTable(chunksSchema);
            //the table is partitioned for postgre, index creation would be too complex. Also the bottleneck is fact tables, not _chunks
            if (Settings.Current.Building.SourceEngine.Database != framework.desktop.Enums.Database.Postgre)
                _dbSource.CreateIndexesChunkTable(chunksSchema);

            var personKeysByChunks = GetPersonKeys()
                    .OrderBy(s => s.PersonId)
                    .Chunk(Settings.Current.Building.ChunkSize)
                    .ToList();

            for (int chunkId = 0; chunkId < personKeysByChunks.Count; chunkId++)
            {
                for (int i = 0; i < personKeysByChunks[chunkId].Length; i++)
                {
                    personKeysByChunks[chunkId][i].Id = chunkId;
                }
            }

            var chunksCount = personKeysByChunks.Count;
            var personsCount = personKeysByChunks.Sum(s => s.Length);
            if (chunksCount < personKeysByChunks.Sum(s => s.Length) / Settings.Current.Building.ChunkSize)
                throw new Exception("Failed to create correct number of chunks!");

            ISaver frameworkSaver =  Settings.Current.Building.SourceEngine.GetSaver();
            var saver = CdmFrameworkImport.Savers.Saver.GetSaverFromFrameworkSaver(frameworkSaver);
            using (saver)
            {
                try
                {
                    var createdSaver = saver.Create(Settings.Current.Building.SourceConnectionString);
                    var index = 0; //not used in the function
                    var personsAggr = personKeysByChunks.SelectMany(s => s).ToList();
                    createdSaver.AddChunk(personsAggr, index, chunksSchema);
                    createdSaver.Commit();
                }
                catch (Exception e)
                {
                    Console.WriteLine("Chunks have not been properly created!");
                    throw;
                }
            }

            _dbSource.AnalyzeChunkTable(chunksSchema);

            var elapsedSeconds = Math.Round((double)sw.ElapsedMilliseconds / 1000, 3);
            var culture = (CultureInfo)CultureInfo.CurrentCulture.Clone();
            culture.NumberFormat.NumberGroupSeparator = " ";
            Console.WriteLine($"Chunk ids have been generated, saved, and have their hash calculated - { elapsedSeconds }s");
            Console.WriteLine($"Persons count = { personsCount.ToString(culture) }"
                + $" | Chunk size = { Settings.Current.Building.ChunkSize.ToString(culture) }"
                + $" | Chunks count = { chunksCount }");

            Settings.Current.Building.PersonsCount = personsCount;

            return chunksCount;
        }

        IEnumerable<ChunkRecord> GetPersonKeys()
        {            
            var query = Utility.GetSqlHelper.TranslateSqlFromRedshift(Settings.Current.Building.VendorToProcess, 
                Settings.Current.Building.SourceEngine.Database, Settings.Current.Building.BatchScript, 
                Settings.Current.Building.SourceSchema, Settings.Current.Building.SourceSchema, Settings.Current.Building.VendorToProcess.PersonTableName);

            foreach (var reader in _dbSource.GetPersonKeys(query, Settings.Current.Building.SourceSchema))
            {
                if (reader[0] == null || reader[1] == null)
                    continue;

                long personId = long.Parse(reader[0].ToString().Trim());
                string personSource = reader[1].ToString().Trim();
                int partitionId = 0;
                try
                {
                    partitionId = int.Parse(reader[2].ToString().Trim());
                }
                catch (Exception e)
                {
                    //partitionId is not set
                }

                yield return new ChunkRecord() { PersonId = personId, PersonSource = personSource, PartitionId = partitionId };
            }
        }
    }
}
