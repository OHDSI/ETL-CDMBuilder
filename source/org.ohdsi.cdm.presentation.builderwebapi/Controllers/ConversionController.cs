using Microsoft.AspNetCore.SignalR;
using Microsoft.Extensions.Configuration;
using org.ohdsi.cdm.framework.common.DataReaders.v5;
using org.ohdsi.cdm.framework.common.DataReaders.v5.v54;
using org.ohdsi.cdm.framework.common.Definitions;
using org.ohdsi.cdm.framework.common.Omop;
using org.ohdsi.cdm.framework.desktop.Base;
using org.ohdsi.cdm.framework.desktop.DbLayer;
using org.ohdsi.cdm.framework.desktop.Helpers;
using org.ohdsi.cdm.presentation.builderwebapi.Hubs;
using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Data.Odbc;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;

namespace org.ohdsi.cdm.presentation.builderwebapi.Controllers
{
    public class ConversionController
    {
        private Settings _settings;
        private Vocabulary _vocabulary;
        private IHubContext<LogHub> _logHub;
        private IBackgroundTaskQueue _taskQueue;
        private string _authorization;

        public ConversionController(IBackgroundTaskQueue taskQueue, ConversionSettings settings, IConfiguration configuration, IHubContext<LogHub> logHub, string authorization)
        {
            _logHub = logHub;
            _settings = new Settings(settings, configuration);

            _settings.Load();
            _vocabulary = new Vocabulary(_settings, _logHub, authorization);
            _taskQueue = taskQueue;
            _authorization = authorization;
        }

        private void WriteLog(Status status, string message, Double progress)
        {
            _logHub.Clients.Group(_authorization).SendAsync("Log", new LogMessage { Status = status, Text = message, Progress = progress }).Wait();
        }

        public bool CreateDestination()
        {
            WriteLog(Status.Running, "Creating CDM database...", 0);

            var dbDestination = new DbDestination(_settings.DestinationConnectionString,
                   _settings.ConversionSettings.DestinationSchema);

            try
            {
                dbDestination.CreateDatabase(_settings.CreateCdmDatabaseScript);
                WriteLog(Status.Running, "CDM database created", 0);
            }
            catch (Exception e)
            {
                WriteLog(Status.Running, "Warning: CDM database exists", 0);
            }

            try
            {
                dbDestination.CreateSchema();
                WriteLog(Status.Running, "Schema created", 0);
            }
            catch (Exception e)
            {
                WriteLog(Status.Running, "Warning: CDM schema exists", 0);
            }

            bool successful;
            try
            {
                dbDestination.ExecuteQuery(_settings.CreateCdmTablesScript);
                WriteLog(Status.Running, "CDM tables created", 0);

                successful = true;
            }
            catch (Exception e)
            {
                WriteLog(Status.Running, "Warning: CDM tables exists" , 0);
                try
                {
                    dbDestination.ExecuteQuery(_settings.TruncateTablesScript);
                    WriteLog(Status.Running, "CDM tables truncated", 0);
                    successful = true;
                }
                catch (Exception e2)
                {
                    WriteLog(Status.Failed, e2.Message, 0);
                    throw e2;
                }
            }
                        
            return successful;
        }

        public void Start()
        {
            if (CreateDestination())
            {
                CreateLookup();
                Build();
            }
        }

        public void CreateLookup()
        {
            if (_taskQueue.Aborted) return;

            var timer = new Stopwatch();
            timer.Start();
            _vocabulary.Fill(true, false);
            var locationConcepts = new List<Location>();
            var careSiteConcepts = new List<CareSite>();
            var providerConcepts = new List<Provider>();

            LoadLocation(locationConcepts);
            LoadCareSite(careSiteConcepts);
            LoadProvider(providerConcepts);
            SaveLookup(timer, locationConcepts, careSiteConcepts, providerConcepts);

            locationConcepts.Clear();
            careSiteConcepts.Clear();
            providerConcepts.Clear();
            locationConcepts = null;
            careSiteConcepts = null;
            providerConcepts = null;
            GC.Collect();
        }

        private void SaveLookup(Stopwatch timer, List<Location> locationConcepts, List<CareSite> careSiteConcepts, List<Provider> providerConcepts)
        {
            if (_taskQueue.Aborted) return;
            Console.WriteLine("Saving lookups...");
            WriteLog(Status.Running, "Saving lookups...", 0);

            var saver = _settings.DestinationEngine.GetSaver();
            using (saver.Create(_settings.DestinationConnectionString,
                _settings.Cdm,
                _settings.ConversionSettings.SourceSchema,
                _settings.ConversionSettings.DestinationSchema))
            {
                saver.SaveEntityLookup(_settings.Cdm, locationConcepts, careSiteConcepts, providerConcepts, null);
            }

            using (saver.Create(_settings.DestinationConnectionString,
                _settings.Cdm,
                _settings.ConversionSettings.SourceSchema,
                _settings.ConversionSettings.DestinationSchema))
            {
                if (_settings.Cdm == framework.common.Enums.CdmVersions.V53)
                {
                    var reader = new CdmSourceDataReader(new CdmSource
                    {
                        CdmSourceName = _settings.ConversionSettings.SourceDatabase,
                        CdmSourceAbbreviation = _settings.ConversionSettings.SourceDatabase,
                        SourceDescription = _settings.ConversionSettings.SourceDatabase,
                        CdmEtlReference = "unknown",
                        SourceDocumentationReference = "None",
                        CdmReleaseDate = DateTime.Now,
                        SourceReleaseDate = DateTime.Now,
                        CdmVersion = _settings.GetCdmScriptsFolder,
                        VocabularyVersion = "5.3",
                        CdmHolder = "unknown"
                    });
                    saver.Write(null, null, reader, "CDM_SOURCE");
                    saver.Commit();
                }
                else if (_settings.Cdm == framework.common.Enums.CdmVersions.V54)
                {
                    var reader = new CdmSourceDataReader54(new CdmSource
                    {
                        CdmSourceName = _settings.ConversionSettings.SourceDatabase,
                        CdmSourceAbbreviation = _settings.ConversionSettings.SourceDatabase,
                        SourceDescription = _settings.ConversionSettings.SourceDatabase,
                        CdmEtlReference = "unknown",
                        SourceDocumentationReference = "None",
                        CdmReleaseDate = DateTime.Now,
                        SourceReleaseDate = DateTime.Now,
                        CdmVersion = _settings.GetCdmScriptsFolder,
                        VocabularyVersion = "5.4",
                        CdmHolder = "unknown"
                    });
                    saver.Write(null, null, reader, "CDM_SOURCE");
                    saver.Commit();
                }
                else
                {
                    var reader = new CdmSourceDataReader(new CdmSource
                    {
                        CdmSourceName = _settings.ConversionSettings.SourceDatabase,
                        CdmSourceAbbreviation = _settings.ConversionSettings.SourceDatabase,
                        SourceDescription = _settings.ConversionSettings.SourceDatabase,
                        CdmEtlReference = "unknown",
                        SourceDocumentationReference = "None",
                        CdmReleaseDate = DateTime.Now,
                        SourceReleaseDate = DateTime.Now,
                        CdmVersion = _settings.GetCdmScriptsFolder,
                        VocabularyVersion = "6.0",
                        CdmHolder = "unknown"
                    });
                    saver.Write(null, null, reader, "CDM_SOURCE");
                    saver.Commit();
                }
            }

            Console.WriteLine("Lookups was saved ");
            WriteLog(Status.Running, "Lookups was saved", 0);
            timer.Stop();

            WriteLog(Status.Running, string.Format("{0}| {1}", DateTime.Now, $"Care site, Location and Provider tables were saved to CDM database - {timer.ElapsedMilliseconds} ms"), 0);
        }

        private void LoadProvider(List<Provider> providerConcepts)
        {
            if (_taskQueue.Aborted) return;
            Console.WriteLine("Loading providers...");
            WriteLog(Status.Running, "Loading providers...", 0);
            var provider = _settings.SourceQueryDefinitions.FirstOrDefault(qd => qd.Providers != null);
            if (provider != null)
            {
                FillList<Provider>(providerConcepts, provider, provider.Providers[0]);
            }
            Console.WriteLine("Providers was loaded");
            WriteLog(Status.Running, "Providers was loaded", 0);
        }

        private void LoadCareSite(List<CareSite> careSiteConcepts)
        {
            if (_taskQueue.Aborted) return;
            Console.WriteLine("Loading care sites...");
            WriteLog(Status.Running, "Loading care sites...", 0);

            var careSite = _settings.SourceQueryDefinitions.FirstOrDefault(qd => qd.CareSites != null);
            if (careSite != null)
            {
                FillList<CareSite>(careSiteConcepts, careSite, careSite.CareSites[0]);
            }

            if (careSiteConcepts.Count == 0)
                careSiteConcepts.Add(new CareSite { Id = 0, LocationId = 0, OrganizationId = 0, PlaceOfSvcSourceValue = null });
            Console.WriteLine("Care sites was loaded");
            WriteLog(Status.Running, "Care sites was loaded", 0);
        }

        private void LoadLocation(List<Location> locationConcepts)
        {
            if (_taskQueue.Aborted) return;
            Console.WriteLine("Loading locations...");
            WriteLog(Status.Running, "Loading locations...", 0);
            var location = _settings.SourceQueryDefinitions.FirstOrDefault(qd => qd.Locations != null);
            if (location != null)
            {
                FillList<Location>(locationConcepts, location, location.Locations[0]);
            }

            if (locationConcepts.Count == 0)
                locationConcepts.Add(new Location { Id = Entity.GetId(null) });
            Console.WriteLine("Locations was loaded");
            WriteLog(Status.Running, "Locations was loaded", 0);
        }

        private void FillList<T>(ICollection<T> list, QueryDefinition qd, EntityDefinition ed) where T : IEntity
        {
            var sql = GetSqlHelper.GetSql(_settings.SourceEngine.Database,
                qd.GetSql("", _settings.ConversionSettings.SourceSchema), _settings.ConversionSettings.SourceSchema);

            if (string.IsNullOrEmpty(sql)) return;

            var keys = new Dictionary<string, bool>();
            using var connection = _settings.SourceEngine.GetConnection(_settings.SourceConnectionString);
            //using (var connection = new OdbcConnection(_settings.SourceConnectionString))
            {
                //using (var c = new OdbcCommand(sql, connection))
                using (var c = _settings.SourceEngine.GetCommand(sql, connection))
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

        public void Build()
        {
            if (_taskQueue.Aborted) return;

            var saveQueue = new BlockingCollection<DatabaseChunkPart>();

            var chunkController = new ChunkController(_settings);
            var chunksCount = chunkController.CreateChunks();

            _vocabulary.Fill(false, false);

            WriteLog(Status.Running, string.Format("{0}| {1}",
                DateTime.Now,
                $"Conversion to CDM was started"), 0);

            var step = 100.0 / chunksCount;
            var total = 0.0;

            _logHub.Clients.Group(_authorization).SendAsync("Progress", total.ToString()).Wait();

            var save = Task.Run(() =>
                {
                    while (!saveQueue.IsCompleted)
                    {

                        DatabaseChunkPart data = null;
                        try
                        {
                            data = saveQueue.Take();
                        }
                        catch (InvalidOperationException)
                        {

                        }

                        if (data != null)
                        {
                            var timer = new Stopwatch();
                            timer.Start();
                            data.Save(_settings.Cdm,
                                _settings.DestinationConnectionString,
                                _settings.DestinationEngine,
                                _settings.ConversionSettings.SourceSchema,
                                _settings.ConversionSettings.DestinationSchema);

                            timer.Stop();

                            total += step;
                            WriteLog(Status.Running, string.Format("{0}| {1}", DateTime.Now, $"ChunkId={data.ChunkData.ChunkId} was saved - {timer.ElapsedMilliseconds} ms | {GC.GetTotalMemory(false) / 1024f / 1024f} Mb"), total);
                        }

                        _logHub.Clients.Group(_authorization).SendAsync("Progress", Convert.ToInt32(total).ToString()).Wait();
                    }
                });

            var degreeOfParallelism = 1;

            Parallel.For(0, chunksCount,
                new ParallelOptions { MaxDegreeOfParallelism = degreeOfParallelism }, (chunkId, state) =>
                {
                    try
                    {
                        if (_taskQueue.Aborted) return;

                        var chunk = new DatabaseChunkBuilder(chunkId);

                        //using var connection =
                        //    new OdbcConnection(_settings.SourceConnectionString);

                        //connection.Open();
                        saveQueue.Add(chunk.Process(_settings.SourceEngine,
                            _settings.ConversionSettings.SourceSchema,
                            _settings.SourceQueryDefinitions,
                            _settings.SourceConnectionString,
                            _settings.ConversionSettings.BuildSettings));
                    }
                    catch(Exception e)
                    {
                        _logHub.Clients.Group(_authorization).SendAsync("Log", new LogMessage { Status = Status.Failed, Text = "Error occurred executing. " + e.Message, Progress = 0 }).Wait();
                    }
                });

            saveQueue.CompleteAdding();
            save.Wait();
        }
    }
}