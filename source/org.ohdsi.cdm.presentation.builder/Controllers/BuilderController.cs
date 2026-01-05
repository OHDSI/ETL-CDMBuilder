using org.ohdsi.cdm.framework.common.Definitions;
using org.ohdsi.cdm.framework.common.Lookups;
using org.ohdsi.cdm.framework.common.Omop;
using org.ohdsi.cdm.presentation.builder.AnsiConsoleColumns;
using org.ohdsi.cdm.presentation.builder.Base.DatabaseManager;
using org.ohdsi.cdm.presentation.builder.Utility;
using org.ohdsi.cdm.presentation.builder.Utility.NativeTranslators;
using org.ohdsi.cdm.presentation.Builder.AnsiConsoleHelpers;
using Spectre.Console;
using System.Collections.Concurrent;
using System.Data;
using System.Data.Odbc;
using System.Diagnostics;
using DatabaseChunkBuilder = org.ohdsi.cdm.presentation.builder.Base.DatabaseChunkBuilder;


namespace org.ohdsi.cdm.presentation.builder.Controllers
{
    public class BuilderController
    {
        #region Variables

        private readonly DatabaseManager _dbSource;
        private readonly DatabaseManager _dbDestination;

        private ConcurrentBag<int> _processedChunkIds = new ConcurrentBag<int>();


        #endregion

        #region Constructor

        public BuilderController()
        {
            _dbSource = DatabaseManagerFactory.Create(Settings.Current.Building.SourceConnectionString, Settings.Current.Building.SourceEngine,
                Settings.Current.Building.SourceSchema);

            _dbDestination = DatabaseManagerFactory.Create(Settings.Current.Building.DestinationConnectionString, Settings.Current.Building.CdmEngine,
                Settings.Current.Building.CdmSchema);
        }

        #endregion

        #region Methods 

        #region Source

        public void CreateSource()
        {
            throw new NotImplementedException();
        }

        public void DropSource()
        {
            throw new NotImplementedException();
        }

        public void FillSource()
        {
            throw new NotImplementedException();
        }

        public void TruncateSource()
        {
            throw new NotImplementedException();
        }

        #endregion

        #region Destination

        public void CreateDestination()
        {
            _dbDestination.CreateDatabase(Settings.Current.CreateCdmDatabaseScript);
            _dbDestination.CreateSchema();
            _dbDestination.ExecuteQuery(Settings.Current.CreateCdmTablesScript);
            AnsiConsole.WriteLine("\r\nDestination DDL complete!");
        }

        public void DropDestination()
        {
            _dbDestination.ExecuteQuery(Settings.Current.DropTablesScript);
        }

        public void TruncateLookup()
        {
            _dbDestination.ExecuteQuery(Settings.Current.TruncateLookupScript);
        }

        public void TruncateDestinationTables()
        {
            _dbDestination.ExecuteQuery(Settings.Current.TruncateTablesScript);
            AnsiConsole.WriteLine("\r\nDestination table truncation complete!");
        }

        #endregion

        #region Lookups

        public void CreateLookup(IVocabulary vocabulary, string chunkSchema)
        {
            var locationConcepts = new List<Location>();
            var careSiteConcepts = new List<CareSite>();
            var providerConcepts = new List<Provider>();

            AnsiConsole.Progress()
                .AutoClear(false)
                .HideCompleted(false)
                .Columns(
                    new TaskDescriptionColumn(),
                    new FrozenElapsedTimeColumn(),
                    new SpinnerColumn())
                .Start(ctx =>
                {
                    #region Location
                    var location = Settings.Current.Building.SourceQueryDefinitions.FirstOrDefault(qd => qd.Locations != null);

                    if (location != null)
                    {
                        var locationTask = ctx.AddTask("Loading Location");
                        FillList<Location>(locationConcepts, location, location.Locations[0], chunkSchema, "Location", locationTask);
                        locationTask.StopTask();
                    }

                    if (locationConcepts.Count == 0)
                        locationConcepts.Add(new Location { Id = Entity.GetId(null) });
                    #endregion


                    #region CareSite
                    var careSite = Settings.Current.Building.SourceQueryDefinitions.FirstOrDefault(qd => qd.CareSites != null);

                    if (careSite != null)
                    {
                        var careSiteTask = ctx.AddTask("Loading CareSite");
                        FillList<CareSite>(careSiteConcepts, careSite, careSite.CareSites[0], chunkSchema, "CareSite", careSiteTask);
                        careSiteTask.StopTask();
                    }

                    if (careSiteConcepts.Count == 0)
                        careSiteConcepts.Add(new CareSite { Id = 0, LocationId = 0, OrganizationId = 0, PlaceOfSvcSourceValue = null });
                    #endregion


                    #region Provider
                    var provider = Settings.Current.Building.SourceQueryDefinitions.FirstOrDefault(qd => qd.Providers != null);

                    if (provider != null)
                    {
                        var providerTask = ctx.AddTask("Loading Provider");
                        FillList<Provider>(providerConcepts, provider, provider.Providers[0], chunkSchema, "Provider", providerTask);
                        providerTask.StopTask();
                    }
                    #endregion
                });

            try
            {
                AnsiConsole.WriteLine("Saving lookups...");

                var saver = Settings.Current.Building.CdmEngine.GetSaver();
                using (saver.Create(Settings.Current.Building.DestinationConnectionString))
                {
                    saver.SaveEntityLookup(Settings.Current.Building.Cdm, locationConcepts, careSiteConcepts, providerConcepts, null);
                }
            }
            catch (Exception ex)
            {
                throw;
            }

            locationConcepts.Clear();
            careSiteConcepts.Clear();
            providerConcepts.Clear();
            locationConcepts = null;
            careSiteConcepts = null;
            providerConcepts = null;
            GC.Collect();
        }

        private void FillList<T>(ICollection<T> list, QueryDefinition qd, EntityDefinition ed, 
            string chunkSchema, string tableName, ProgressTask task) where T : IEntity
        {
            if (!new[] { "Location", "CareSite", "Provider" }.Any(s => s == tableName))
                throw new ArgumentException("Invalid name for FillList! " + tableName);

            var initTaskDescription = task.Description;

            var vendor = Settings.Current.Building.VendorToProcess;
            var origQuery = qd.GetSql(vendor, Settings.Current.Building.SourceSchema, chunkSchema);
            if (string.IsNullOrEmpty(origQuery)) return;

            var sql = SqlRenderTranslator.Translate(new SqlRenderTranslator.Request(
                null,
                vendor.Name,
                qd.FileName,
                origQuery,
                Settings.Current.Building.SourceEngine.Database));

            sql = GetSqlHelper.TranslateSqlFromRedshift(vendor, Settings.Current.Building.SourceEngine.Database, sql, chunkSchema, chunkSchema, qd.FileName);
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
                            task.Description = initTaskDescription + " | KeysCount=" + keys.Count;

                            list.Add(concept);
                        }
                    }
                }
            }
        }

        #endregion

        #region Build

        public void Build(IVocabulary vocabulary)
        {
            var degreeParallel = Math.Max(1, Environment.ProcessorCount - 1);
            var saveLock = new object();

            AnsiConsole.MarkupLine("[blue]\r\n==================== Conversion to CDM has been started ====================[/]");
            Logger.Write(null, Logger.LogMessageTypes.Info, "Console window should not be resized, lest the earlier messages are erased.");
            Logger.Write(null, Logger.LogMessageTypes.Info,
                $"Maximum memory allocation for multithreading is {Settings.Current.Building.MaxMemoryBudgetMb} mb. " +
                $"Memory margin is {Settings.Current.Building.MemoryPerChunkMarginPercent}%.");
            Logger.Write(null, Logger.LogMessageTypes.Info, $"Starting loading from chunk {Settings.Current.Building.ContinueLoadFromChunk}.");
            Logger.Write(null, Logger.LogMessageTypes.Info, $"Target: {Settings.Current.Building.CdmEngine.Database.ToString()}" +
                $" {Settings.Current.Building.CdmSchema}@{Settings.Current.Building.CdmServer}.");

            AnsiConsole.Progress()
                .AutoClear(false)
                .HideCompleted(true)
                .Columns(
                    new TaskDescriptionColumn(),
                    new ElapsedTimeColumn(),
                    new ProgressBarColumn(),
                    new PercentageColumn(),
                    new SpinnerColumn(),
                    new RemainingTimeNewColumn(),
                    new MemoryColumn())
                .Start(ctx =>
                {
                    ctx.Refresh();

                    var total = Settings.Current.Building.ChunksCount * Settings.Current.Building.ChunkSize;
                    var overallTask = ctx.AddTask($"Processing {Settings.Current.Building.ChunksCount} chunks", maxValue: total);
                    
                    var startChunkId = Settings.Current.Building.ContinueLoadFromChunk;
                    if (startChunkId > 0)
                        overallTask.Increment(Settings.Current.Building.ChunkSize * startChunkId);
                
                    //process the 1st chunk separately to get max memory usage
                    var startChunkTask = ctx.AddTask($"Chunk {startChunkId}", maxValue: Settings.Current.Building.ChunkSize);
                    ProcessChunkId(startChunkId, startChunkTask, overallTask, saveLock);
                    if (Settings.Current.Building.ChunksCount == 1)
                        return;

                    //initial chunk has already been dumped and memory counters triggered
                    var initialMemoryLoad = MemoryColumn.CurrentMbMemoryGC; // only consider actual usage, not OS allocations. Mostly for Vocabulary
                    var maxThreadCountByMemoryLimits = GetMaxThreadCountByMemoryLimits(initialMemoryLoad);
                    degreeParallel = Math.Min(degreeParallel, maxThreadCountByMemoryLimits);

                    //start from 2nd chunk
                    int first = startChunkId + 1;
                    int lastExclusive = Settings.Current.Building.ChunksCount;
                    int nextId = first - 1;

                    var workers = new List<Task>(degreeParallel);
                    for (int w = 0; w < degreeParallel; w++)
                    {
                        workers.Add(Task.Run(() =>
                        {
                            while (true)
                            {                                
                                int chunkId = Interlocked.Increment(ref nextId);
                                if (chunkId >= lastExclusive) break;

                                if (chunkId < Settings.Current.Building.ContinueLoadFromChunk)
                                {
                                    overallTask.Increment(Settings.Current.Building.ChunkSize);
                                    continue;
                                }

                                var chunkTask = ctx.AddTask($"Chunk {chunkId}", maxValue: Settings.Current.Building.ChunkSize);
                                ProcessChunkId(chunkId, chunkTask, overallTask, saveLock);
                                chunkTask.Increment(chunkTask.MaxValue - chunkTask.Value);
                            }
                        }));
                    }
                    Task.WaitAll(workers.ToArray());
                    overallTask.Increment(overallTask.MaxValue - overallTask.Value);
                });

            for (int i = 0; i <= degreeParallel; i++)
                AnsiConsole.WriteLine();
            Thread.Sleep(1000);
        }

        int GetMaxThreadCountByMemoryLimits(double initialMemoryLoad)
        {
            //considering OS memory allocation here will also help to avoid memory errors due to less possible threads
            var currentPeak = Math.Max(MemoryColumn.MaxMbMemoryProcess, MemoryColumn.MaxMbMemoryGC); 
            var delta = currentPeak - initialMemoryLoad;
            var deltaPlusMargin = delta / 100 * (100 + Settings.Current.Building.MemoryPerChunkMarginPercent);

            var unclaimedMemory = Settings.Current.Building.MaxMemoryBudgetMb - currentPeak;
            var possibleThreadCount = Math.Floor(unclaimedMemory / deltaPlusMargin);

            var res = possibleThreadCount > 1 ? Convert.ToInt32(possibleThreadCount) : 1;
            return res;
        }

        void ProcessChunkId(int chunkId, ProgressTask chunkTask, ProgressTask overallTask, object saveLock)
        {
            var maxTries = Settings.Current.Building.QueryTriesAmount;
            var tryDelaySeconds = Settings.Current.Building.QueryTriesDelaySeconds;

            for (int i = 0; i < maxTries; i++)
            {
                try
                {
                    var chunk = new DatabaseChunkBuilder(chunkId, Utility.VendorHelper.CreatePersonBuilder);

                    using (var connection = new OdbcConnection(Settings.Current.Building.SourceConnectionString))
                    {
                        connection.Open();

                        chunk.Calculate(chunkTask, overallTask);

                        lock (saveLock)
                        {
                            chunk.Save();
                            Settings.Current.Save(false);
                            chunk = null;

                            _processedChunkIds.Add(chunkId);
                            var dir = Path.Combine(Directory.GetCurrentDirectory(), "Cache");
                            Directory.CreateDirectory(dir);

                            var path = Path.Combine(dir, "LastProcessedChunkId.txt");
                            var info = GetProcessedChunksInfo();
                            File.WriteAllText(path, info);
                            
                            GC.Collect(GC.MaxGeneration, GCCollectionMode.Forced, blocking: true, compacting: true);
                            RemainingTimeNewColumn.IncrementPersonsProcessed(Settings.Current.Building.ChunkSize);
                        }
                    }
                    return; // success, no need to retry processing
                }
                catch (Exception e)
                {
                    if (i >= maxTries - 1)
                        throw;

                    Thread.Sleep(tryDelaySeconds * 1000);
                    Logger.Write(chunkId, Logger.LogMessageTypes.Warning,
                        $"\r\nCommencing try #{i + 2}/{maxTries}.\r\n{e.Message}\r\n{e.InnerException?.Message ?? ""}\r\n");
                }
            }
        }

        string GetProcessedChunksInfo()
        {
            var sortedList = _processedChunkIds.OrderBy(s => s).ToList();
            var beforeGaps = new List<int>();

            for (int i = 0; i < sortedList.Count - 1; i++)
            {                
                if (sortedList[i + 1] != sortedList[i] + 1)
                {
                    beforeGaps.Add(sortedList[i]);
                }
            }

            if (sortedList.Any())
            {
                beforeGaps.Add(sortedList.Last());
            }

            var res = string.Join("\r\n", beforeGaps);
            return res;
        }

        #endregion

        #endregion
    }
}
