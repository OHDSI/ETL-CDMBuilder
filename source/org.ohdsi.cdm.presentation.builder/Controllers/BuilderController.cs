using org.ohdsi.cdm.framework.common.Base;
using org.ohdsi.cdm.framework.common.Definitions;
using org.ohdsi.cdm.framework.common.Lookups;
using org.ohdsi.cdm.framework.common.Omop;
using org.ohdsi.cdm.framework.common.Utility;
using org.ohdsi.cdm.presentation.builder.Base.DbDestinations;
using org.ohdsi.cdm.presentation.Builder.AnsiConsoleHelpers;
using Spectre.Console;
using System.Data;
using System.Data.Odbc;
using System.Diagnostics;
using DatabaseChunkBuilder = org.ohdsi.cdm.presentation.builder.Base.DatabaseChunkBuilder;


namespace org.ohdsi.cdm.presentation.builder.Controllers
{
    public class BuilderController
    {

        #region Enums

        public enum BuilderState
        {
            Unknown,
            Idle,
            Running,
            Stopping,
            Stopped,
            Error
        }

        #endregion

        #region Variables

        private readonly ChunkController _chunkController;
        private readonly string _etlLibraryPath;

        #endregion

        #region Constructor

        public BuilderController(string etlLibraryPath)
        {
            _chunkController = new ChunkController();
            _etlLibraryPath = etlLibraryPath;
        }

        #endregion

        #region Methods 

        public void CreateDestination()
        {
            var dbDestination = DbDestinationFactory.Create(Settings.Current.Building.DestinationConnectionString, Settings.Current.Building.CdmEngine,
                Settings.Current.Building.CdmSchema);

            dbDestination.CreateDatabase(Settings.Current.CreateCdmDatabaseScript);
            dbDestination.CreateSchema();
            dbDestination.ExecuteQuery(Settings.Current.CreateCdmTablesScript);
            Console.WriteLine("\r\nDDL complete!");
        }

        public void DropDestination()
        {
            var dbDestination = DbDestinationFactory.Create(Settings.Current.Building.DestinationConnectionString, Settings.Current.Building.CdmEngine,
                Settings.Current.Building.CdmSchema);

            dbDestination.ExecuteQuery(Settings.Current.DropTablesScript);
        }

        public void TruncateLookup()
        {
            var dbDestination = DbDestinationFactory.Create(Settings.Current.Building.DestinationConnectionString, Settings.Current.Building.CdmEngine,
                Settings.Current.Building.CdmSchema);

            dbDestination.ExecuteQuery(Settings.Current.TruncateLookupScript);
        }

        public void TruncateTables()
        {
            var dbDestination = DbDestinationFactory.Create(Settings.Current.Building.DestinationConnectionString, Settings.Current.Building.CdmEngine,
                Settings.Current.Building.CdmSchema);

            dbDestination.ExecuteQuery(Settings.Current.TruncateTablesScript);
            Console.WriteLine("\r\nTable truncation complete!");
        }

        public void TruncateWithoutLookupTables()
        {
            var dbDestination = DbDestinationFactory.Create(Settings.Current.Building.DestinationConnectionString, Settings.Current.Building.CdmEngine,
                Settings.Current.Building.CdmSchema);

            dbDestination.ExecuteQuery(Settings.Current.TruncateWithoutLookupTablesScript);
        }

        public void ResetVocabularyStep()
        {
            var dbDestination = DbDestinationFactory.Create(Settings.Current.Building.DestinationConnectionString, Settings.Current.Building.CdmEngine,
                Settings.Current.Building.CdmSchema);

            dbDestination.ExecuteQuery(Settings.Current.DropVocabularyTablesScript);
        }

        public void CreateLookup(IVocabulary vocabulary, string chunkSchema)
        {
            var timer = new Stopwatch();
            timer.Start();
            vocabulary.Fill(true);
            var locationConcepts = new List<Location>();
            var careSiteConcepts = new List<CareSite>();
            var providerConcepts = new List<Provider>();

            Console.WriteLine("Loading locations...");
            var location = Settings.Current.Building.SourceQueryDefinitions.FirstOrDefault(qd => qd.Locations != null);
            if (location != null)
            {
                FillList<Location>(locationConcepts, location, location.Locations[0], _etlLibraryPath, chunkSchema);
            }

            if (locationConcepts.Count == 0)
                locationConcepts.Add(new Location { Id = Entity.GetId(null) });
            Console.WriteLine("Locations were loaded");

            Console.WriteLine("Loading care sites...");
            var careSite = Settings.Current.Building.SourceQueryDefinitions.FirstOrDefault(qd => qd.CareSites != null);
            if (careSite != null)
            {
                FillList<CareSite>(careSiteConcepts, careSite, careSite.CareSites[0], _etlLibraryPath, chunkSchema);
            }

            if (careSiteConcepts.Count == 0)
                careSiteConcepts.Add(new CareSite { Id = 0, LocationId = 0, OrganizationId = 0, PlaceOfSvcSourceValue = null });
            Console.WriteLine("Care sites were loaded");

            Console.WriteLine("Loading providers...");
            var provider = Settings.Current.Building.SourceQueryDefinitions.FirstOrDefault(qd => qd.Providers != null);
            if (provider != null)
            {
                FillList<Provider>(providerConcepts, provider, provider.Providers[0], _etlLibraryPath, chunkSchema);
            }
            Console.WriteLine("Providers were loaded");

            try
            {
                Console.WriteLine("Saving lookups...");

                var saver = Settings.Current.Building.CdmEngine.GetSaver();
                using (saver.Create(Settings.Current.Building.DestinationConnectionString))
                {

                    saver.SaveEntityLookup(Settings.Current.Building.Cdm, locationConcepts, careSiteConcepts, providerConcepts, null);
                    //System.NullReferenceException: 'Object reference not set to an instance of an object.'

                }
            }
            catch (Exception ex)
            {
                //throw;
            }

            timer.Stop();
            var elapsedSeconds = Math.Round(Convert.ToDecimal(timer.ElapsedMilliseconds) / 1000, 3);
            Logger.Write(null, Logger.LogMessageTypes.Info,
                $"Care site, Location and Provider tables were saved to CDM database - {elapsedSeconds} s");

            locationConcepts.Clear();
            careSiteConcepts.Clear();
            providerConcepts.Clear();
            locationConcepts = null;
            careSiteConcepts = null;
            providerConcepts = null;
            GC.Collect();
        }

        private void FillList<T>(ICollection<T> list, QueryDefinition qd, EntityDefinition ed, string etlLibraryPath, string chunkSchema) where T : IEntity
        {
            var vendor = Settings.Current.Building.VendorToProcess;
            var origQuery = qd.GetSql(vendor, Settings.Current.Building.SourceSchema, chunkSchema);
            if (string.IsNullOrEmpty(origQuery)) return;

            var sql = Utility.GetSqlHelper.TranslateSqlFromRedshift(vendor, Settings.Current.Building.SourceEngine.Database, origQuery, chunkSchema, chunkSchema, qd.FileName);
            if (string.IsNullOrEmpty(sql)) return;

            var keys = new Dictionary<string, bool>();
            using (var connection = new OdbcConnection(Settings.Current.Building.SourceConnectionString))
            {
                connection.Open();
                using (var c = new OdbcCommand(sql, connection))
                {
                    c.CommandTimeout = 30000;
                    using (var reader = c.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            Concept conceptDef = null;
                            if (ed.Concepts != null && ed.Concepts.Any())
                                conceptDef = ed.Concepts[0];

                            var concept = (T)ed.GetConcepts(conceptDef, reader, null).ToList()[0];

                            var key = concept.GetKey();
                            if (key == null) continue;

                            if (keys.ContainsKey(key))
                                continue;

                            keys.Add(key, false);

                            list.Add(concept);
                        }
                    }
                }
            }
        }

        public void Build(IVocabulary vocabulary, string chunksSchema)
        {
            if (Settings.Current.Building.ChunksCount == 0)
                Settings.Current.Building.ChunksCount = _chunkController.CreateChunks(chunksSchema);

            vocabulary.Fill(false);

            Logger.Write(null, Logger.LogMessageTypes.Info,
                "\r\n==================== Conversion to CDM has been started ====================");
            Logger.Write(null, Logger.LogMessageTypes.Info, "Console window should not be resized, lest the earlier messages are erased.");
            //todo make DI instead of passing it to methods
            AnsiConsole.Progress()
                    .AutoClear(false)
                    .HideCompleted(true)
                    .Columns(
                        new TaskDescriptionColumn(),
                        new ElapsedTimeColumn(),
                        new ProgressBarColumn(),
                        new PercentageColumn(),
                        new SpinnerColumn(),
                        new RemainingTimeColumn(),
                        new MemoryColumn())
                    .Start(ctx =>
                    {
                        var overallTask = ctx.AddTask($"Processing {Settings.Current.Building.ChunksCount} chunks",
                            maxValue: Settings.Current.Building.ChunksCount * Settings.Current.Building.ChunkSize);

                        for (int chunkId = 0; chunkId < Settings.Current.Building.ChunksCount; chunkId++)
                        {
                            if (chunkId < Settings.Current.Building.ContinueLoadFromChunk)
                            {
                                overallTask.Increment(Settings.Current.Building.ChunkSize);
                                continue;
                            }

                            var chunkTask = ctx.AddTask($"Chunk {chunkId}", maxValue: Settings.Current.Building.ChunkSize);
                            ProcessChunkId(chunkId, chunkTask, overallTask);                            
                            GC.Collect(GC.MaxGeneration, GCCollectionMode.Forced, blocking: true, compacting: true);
                        }
                    });
        }

        void ProcessChunkId(int chunkId,  ProgressTask chunkTask, ProgressTask overallTask)
        {
            DatabaseChunkBuilder chunk;
            var maxTries = Settings.Current.Building.QueryTriesAmount;
            var tryDelaySeconds = Settings.Current.Building.QueryTriesDelaySeconds;
            for (int i = 0; i < maxTries; i++)
                try
                {
                    chunk = new DatabaseChunkBuilder(chunkId, Utility.VendorHelper.CreatePersonBuilder);
                    using (var connection = new OdbcConnection(Settings.Current.Building.SourceConnectionString))
                    {
                        connection.Open();
                        chunk.Process(chunkTask, overallTask);
                    }

                    Settings.Current.Save(false);
                    break; // success
                }
                catch(Exception e)
                {
                    if (i >= maxTries - 1)
                    {
                        throw;
                    }
                    chunk = null;
                    GC.Collect(GC.MaxGeneration, GCCollectionMode.Forced);
                    Thread.Sleep(tryDelaySeconds * 1000);
                    Logger.Write(chunkId, Logger.LogMessageTypes.Warning, "\r\nCommencing try #" + (i + 1) + "/" + (maxTries - 1) + "\r\n\r\n");
                }
        }

        #endregion
    }
}
