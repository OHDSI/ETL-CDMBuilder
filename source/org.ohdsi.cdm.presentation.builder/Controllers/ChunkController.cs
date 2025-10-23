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

            var personIds = new List<ChunkRecord>();

            ISaver frameworkSaver =  Settings.Current.Building.SourceEngine.GetSaver();
            var saver = CdmFrameworkImport.Savers.Saver.GetSaverFromFrameworkSaver(frameworkSaver);
            //debug saver._connection is null now

            using (saver)
            {
                personIds = GetPersonKeys().OrderBy(s => s.PersonId).ToList();
                for (int i = 0; i < personIds.Count; i++)
                {
                    var chunkId = Math.Floor((double)i / (double)Settings.Current.Building.ChunkSize);
                    var chunkPerson = personIds[i];
                    chunkPerson.Id = Convert.ToInt32(chunkId);
                }

                if (personIds.Count > 0)
                    try
                    {
                        var createdSaver = saver.Create(Settings.Current.Building.SourceConnectionString);
                        createdSaver.AddChunk(personIds, 0, chunksSchema);
                        createdSaver.Commit();
                    }
                    catch (Exception e)
                    {
                        throw;
                    }
            }

            int chunksCount = personIds.Count / Settings.Current.Building.ChunkSize;

            var elapsedSeconds = Math.Round((double)sw.ElapsedMilliseconds / 1000, 3);
            var culture = (CultureInfo)CultureInfo.CurrentCulture.Clone();
            culture.NumberFormat.NumberGroupSeparator = " ";
            Console.WriteLine($"Chunk ids have been generated and saved - {elapsedSeconds}s");
            Console.WriteLine($"Persons count = {personIds.Count.ToString(culture)}"
                + $" | Chunk size = {Settings.Current.Building.ChunkSize.ToString(culture)}"
                + $" | Chunks count = { chunksCount }");

            return chunksCount;
        }

        public IEnumerable<ChunkRecord> GetPersonKeys()
        {            
            var query = Utility.GetSqlHelper.TranslateSqlFromRedshift(Settings.Current.Building.VendorToProcess, Settings.Current.Building.SourceEngine.Database, Settings.Current.Building.BatchScript, Settings.Current.Building.SourceSchema, Settings.Current.Building.SourceSchema, Settings.Current.Building.VendorToProcess.PersonTableName);

            foreach (var reader in _dbSource.GetPersonKeys(query, Settings.Current.Building.SourceSchema))
            {
                if (reader[0] == null || reader[1] == null)
                    continue;

                long personId = long.Parse(reader[0].ToString().Trim());
                string personSource = reader[1].ToString().Trim();

                ChunkRecord chunkRecord = new ChunkRecord()
                {
                    PersonId = personId,
                    PersonSource = personSource,
                };

                yield return chunkRecord;
            }
        }
    }
}
