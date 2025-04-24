using Microsoft.AspNetCore.SignalR;
using Microsoft.Extensions.Configuration;
using org.ohdsi.cdm.framework.common.Definitions;
using org.ohdsi.cdm.framework.common.Enums;
using org.ohdsi.cdm.framework.common.Omop;
using org.ohdsi.cdm.framework.desktop.Base;
using org.ohdsi.cdm.framework.desktop.DbLayer;
using org.ohdsi.cdm.framework.desktop.Helpers;
using org.ohdsi.cdm.presentation.builder.Helpers;
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

        public ConversionController(IBackgroundTaskQueue taskQueue, ConversionSettings settings, IConfiguration configuration, IHubContext<LogHub> logHub)
        {
            _logHub = logHub;
            _settings = new Settings(settings, configuration);

            _settings.Load();
            _vocabulary = new Vocabulary(_settings, _logHub);
            _taskQueue = taskQueue;
        }

        public bool CreateDestination()
        {
            _logHub.Clients.All.SendAsync("Log", "Creating CDM database...").Wait();

            var dbDestination = new DbDestination(_settings.DestinationConnectionString,
                   _settings.ConversionSettings.DestinationSchema);

            try
            {
                dbDestination.CreateDatabase(_settings.CreateCdmDatabaseScript);
                _logHub.Clients.All.SendAsync("Log", "CDM database created").Wait();
            }
            catch (Exception e)
            {
                _logHub.Clients.All.SendAsync("Log", "Warning: " + e.Message).Wait();
            }

            bool successful;
            try
            {
                dbDestination.ExecuteQuery(_settings.CreateCdmTablesScript);
                _logHub.Clients.All.SendAsync("Log", "CDM tables created").Wait();

                successful = true;
            }
            catch (Exception e)
            {
                _logHub.Clients.All.SendAsync("Log", "Warning: CDM tables " + e.Message).Wait();
                try
                {
                    dbDestination.ExecuteQuery(_settings.TruncateTablesScript);
                    _logHub.Clients.All.SendAsync("Log", "CDM tables truncated").Wait();
                    successful = true;
                }
                catch (Exception e2)
                {
                    throw;
                }
            }

            return successful;
        }

        public void Start(string chunkSchema)
        {
            if (CreateDestination())
            {
                CreateLookup(chunkSchema);
                Build();
            }
        }

        public void CreateLookup(string chunkSchema)
        {
            if (_taskQueue.Aborted) return;

            var timer = new Stopwatch();
            timer.Start();
            _vocabulary.Fill(true, false);
            var locationConcepts = new List<Location>();
            var careSiteConcepts = new List<CareSite>();
            var providerConcepts = new List<Provider>();

            LoadLocation(locationConcepts, chunkSchema);
            LoadCareSite(careSiteConcepts, chunkSchema);
            LoadProvider(providerConcepts, chunkSchema);
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
            _logHub.Clients.All.SendAsync("Log", "Saving lookups...").Wait();
            var saver = _settings.DestinationEngine.GetSaver();
            using (saver.Create(_settings.DestinationConnectionString))
            {
                saver.SaveEntityLookup(_settings.Cdm, locationConcepts, careSiteConcepts, providerConcepts, null);
            }

            Console.WriteLine("Lookups was saved ");
            _logHub.Clients.All.SendAsync("Log", "Lookups was saved").Wait();
            timer.Stop();

            _logHub.Clients.All.SendAsync("Log", string.Format("{0}| {1}", DateTime.Now, $"Care site, Location and Provider tables were saved to CDM database - {timer.ElapsedMilliseconds} ms")).Wait();
        }

        private void LoadProvider(List<Provider> providerConcepts, string chunkSchema)
        {
            if (_taskQueue.Aborted) return;
            Console.WriteLine("Loading providers...");
            _logHub.Clients.All.SendAsync("Log", "Loading providers...").Wait();
            var provider = _settings.SourceQueryDefinitions.FirstOrDefault(qd => qd.Providers != null);
            if (provider != null)
            {
                FillList<Provider>(providerConcepts, provider, provider.Providers[0], chunkSchema);
            }
            Console.WriteLine("Providers was loaded");
            _logHub.Clients.All.SendAsync("Log", "Providers was loaded").Wait();
        }

        private void LoadCareSite(List<CareSite> careSiteConcepts, string chunkSchema)
        {
            if (_taskQueue.Aborted) return;
            Console.WriteLine("Loading care sites...");
            _logHub.Clients.All.SendAsync("Log", "Loading care sites...").Wait();
            var careSite = _settings.SourceQueryDefinitions.FirstOrDefault(qd => qd.CareSites != null);
            if (careSite != null)
            {
                FillList<CareSite>(careSiteConcepts, careSite, careSite.CareSites[0], chunkSchema);
            }

            if (careSiteConcepts.Count == 0)
                careSiteConcepts.Add(new CareSite { Id = 0, LocationId = 0, OrganizationId = 0, PlaceOfSvcSourceValue = null });
            Console.WriteLine("Care sites was loaded");
            _logHub.Clients.All.SendAsync("Log", "Care sites was loaded").Wait();
        }

        private void LoadLocation(List<Location> locationConcepts, string chunkSchema)
        {
            if (_taskQueue.Aborted) return;
            Console.WriteLine("Loading locations...");
            _logHub.Clients.All.SendAsync("Log", "Loading locations...").Wait();
            var location = _settings.SourceQueryDefinitions.FirstOrDefault(qd => qd.Locations != null);
            if (location != null)
            {
                FillList<Location>(locationConcepts, location, location.Locations[0], chunkSchema);
            }

            if (locationConcepts.Count == 0)
                locationConcepts.Add(new Location { Id = Entity.GetId(null) });
            Console.WriteLine("Locations was loaded");
            _logHub.Clients.All.SendAsync("Log", "Locations was loaded").Wait();
        }

        private void FillList<T>(ICollection<T> list, QueryDefinition qd, EntityDefinition ed, string chunkSchema) where T : IEntity
        {
            var sql = GetSqlHelper.GetSql(_settings.SourceEngine.Database,
                qd.GetSql(null, _settings.ConversionSettings.SourceSchema, chunkSchema), _settings.ConversionSettings.SourceSchema);

            if (string.IsNullOrEmpty(sql)) return;

            var keys = new Dictionary<string, bool>();
            using (var connection = new OdbcConnection(_settings.SourceConnectionString))
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

        public void Build()
        {
            if (_taskQueue.Aborted) return;

            var saveQueue = new BlockingCollection<DatabaseChunkPart>();

            var chunkController = new ChunkController(_settings);
            var chunksCount = chunkController.CreateChunks();

            _vocabulary.Fill(false, false);

            _logHub.Clients.All.SendAsync("Log", string.Format("{0}| {1}",
                DateTime.Now,
                $"Conversion to CDM was started"))
                               .Wait();

            var step = 100.0 / chunksCount;
            var total = 0.0;

            _logHub.Clients.All.SendAsync("Progress", total.ToString()).Wait();

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
                            data.Save();

                            timer.Stop();

                            _logHub.Clients.All.SendAsync("Log", string.Format("{0}| {1}",
               DateTime.Now,
              $"ChunkId={data.ChunkData.ChunkId} was saved - {timer.ElapsedMilliseconds} ms | {GC.GetTotalMemory(false) / 1024f / 1024f} Mb"))
                              .Wait();

                            total += step;
                        }

                        _logHub.Clients.All.SendAsync("Progress", Convert.ToInt32(total).ToString()).Wait();
                    }
                });

            var degreeOfParallelism = 1;

            Parallel.For(0, chunksCount,
                new ParallelOptions { MaxDegreeOfParallelism = degreeOfParallelism }, (chunkId, state) =>
                {

                    if (_taskQueue.Aborted) return;

                    var chunk = new DatabaseChunkBuilder(chunkId);

                    using var connection =
                        new OdbcConnection(_settings.SourceConnectionString);

                    connection.Open();
                    saveQueue.Add(chunk.Process(_settings.SourceEngine,
                        _settings.ConversionSettings.SourceSchema,
                        _settings.SourceQueryDefinitions,
                        connection));
                });

            saveQueue.CompleteAdding();
            save.Wait();
        }
    }
}