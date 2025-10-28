using org.ohdsi.cdm.framework.desktop;
using org.ohdsi.cdm.framework.desktop.Savers;
using org.ohdsi.cdm.presentation.builder.CdmFrameworkImport;
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

            _dbSource.CreateIndexesChunkTable(chunksSchema);

            var personKeysByChunks = GetPersonKeys()
                    .OrderBy(s => s.PersonId)
                    .Chunk(Settings.Current.Building.ChunkSize)
                    .ToList();
            var persons = personKeysByChunks
                .SelectMany((s, i) =>
                    s.Select(a => new ChunkRecord()
                    {
                        PersonId = a.PersonId,
                        PersonSource = a.PersonSource,
                        Id = i
                    }))
                .ToList();

            var chunksCount = persons.Select(s => s.Id).DistinctBy(s => s).Count();
            if (chunksCount < persons.Count / Settings.Current.Building.ChunkSize)
                throw new Exception("Failed to create correct number of chunks!");

            ISaver frameworkSaver =  Settings.Current.Building.SourceEngine.GetSaver();
            var saver = CdmFrameworkImport.Savers.Saver.GetSaverFromFrameworkSaver(frameworkSaver);
            using (saver)
            {
                try
                {
                    var createdSaver = saver.Create(Settings.Current.Building.SourceConnectionString);
                    var index = 0; //not used in the function
                    createdSaver.AddChunk(persons, index, chunksSchema);
                    createdSaver.Commit();
                }
                catch (Exception e)
                {
                    Console.WriteLine("Chunks have not been properly created!");
                    throw;
                }
            }

            var elapsedSeconds = Math.Round((double)sw.ElapsedMilliseconds / 1000, 3);
            var culture = (CultureInfo)CultureInfo.CurrentCulture.Clone();
            culture.NumberFormat.NumberGroupSeparator = " ";
            Console.WriteLine($"Chunk ids have been generated and saved - { elapsedSeconds }s");
            Console.WriteLine($"Persons count = { persons.Count.ToString(culture) }"
                + $" | Chunk size = { Settings.Current.Building.ChunkSize.ToString(culture) }"
                + $" | Chunks count = { chunksCount }");

            return chunksCount;
        }

        public IEnumerable<(long PersonId, string PersonSource)> GetPersonKeys()
        {            
            var query = Utility.GetSqlHelper.TranslateSqlFromRedshift(Settings.Current.Building.VendorToProcess, Settings.Current.Building.SourceEngine.Database, Settings.Current.Building.BatchScript, Settings.Current.Building.SourceSchema, Settings.Current.Building.SourceSchema, Settings.Current.Building.VendorToProcess.PersonTableName);

            foreach (var reader in _dbSource.GetPersonKeys(query, Settings.Current.Building.SourceSchema))
            {
                if (reader[0] == null || reader[1] == null)
                    continue;

                long personId = long.Parse(reader[0].ToString().Trim());
                string personSource = reader[1].ToString().Trim();

                yield return new (personId, personSource);
            }
        }
    }
}
