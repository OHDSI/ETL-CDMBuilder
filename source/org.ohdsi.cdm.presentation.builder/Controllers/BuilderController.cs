using org.ohdsi.cdm.framework.common.Base;
using org.ohdsi.cdm.framework.common.Definitions;
using org.ohdsi.cdm.framework.common.Enums;
using org.ohdsi.cdm.framework.common.Lookups;
using org.ohdsi.cdm.framework.common.Omop;
using org.ohdsi.cdm.framework.common.Utility;
using org.ohdsi.cdm.framework.desktop.Base;
using org.ohdsi.cdm.framework.desktop.DbLayer;
using org.ohdsi.cdm.framework.desktop.Enums;
using org.ohdsi.cdm.framework.desktop.Helpers;
using org.ohdsi.cdm.framework.desktop.Savers;
using org.ohdsi.cdm.presentation.builder.Base;
using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Data.Odbc;
using System.Diagnostics;
using System.Linq;
using System.Numerics;
using System.Threading;
using System.Threading.Tasks;
using static org.ohdsi.cdm.presentation.builder.Utility.CdmFrameworkImport;
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

        #region Properties

        public BuilderState CurrentState { get; set; }
        public int CompleteChunksCount => Settings.Current.Building.CompletedChunkIds.Count;

        #endregion

        #region Constructor

        public BuilderController(string etlLibraryPath)
        {
            _chunkController = new ChunkController();
            _etlLibraryPath = etlLibraryPath;
        }

        #endregion

        #region Methods 

        private void PerformAction(Action act)
        {
            if (CurrentState == BuilderState.Error)
                return;

            try
            {
                act();
            }
            catch (Exception e)
            {
                CurrentState = BuilderState.Error;
                Logger.WriteError(e);
            }
            finally
            {
            }
        }

        public void CreateDestination()
        {
            PerformAction(() =>
            {
                var dbDestination = new DbDestination(Settings.Current.Building.DestinationConnectionString,
                    Settings.Current.Building.CdmSchema);

                dbDestination.CreateDatabase(Settings.Current.CreateCdmDatabaseScript);
                dbDestination.ExecuteQuery(Settings.Current.CreateCdmTablesScript);
            });
        }

        public void CreateTablesStep()
        {
            var dbDestination = new DbDestination(Settings.Current.Building.DestinationConnectionString,
                Settings.Current.Building.CdmSchema);

            dbDestination.ExecuteQuery(Settings.Current.CreateCdmTablesScript);
        }

        public void DropDestination()
        {
            var dbDestination = new DbDestination(Settings.Current.Building.DestinationConnectionString,
                Settings.Current.Building.CdmSchema);

            dbDestination.ExecuteQuery(Settings.Current.DropTablesScript);
        }

        public void TruncateLookup()
        {
            var dbDestination = new DbDestination(Settings.Current.Building.DestinationConnectionString,
                Settings.Current.Building.CdmSchema);

            dbDestination.ExecuteQuery(Settings.Current.TruncateLookupScript);
        }

        public void TruncateTables()
        {
            var dbDestination = new DbDestination(Settings.Current.Building.DestinationConnectionString,
                Settings.Current.Building.CdmSchema);

            dbDestination.ExecuteQuery(Settings.Current.TruncateTablesScript);
        }

        public void TruncateWithoutLookupTables()
        {
            var dbDestination = new DbDestination(Settings.Current.Building.DestinationConnectionString,
                Settings.Current.Building.CdmSchema);

            dbDestination.ExecuteQuery(Settings.Current.TruncateWithoutLookupTablesScript);
        }

        public void ResetVocabularyStep()
        {
            var dbDestination = new DbDestination(Settings.Current.Building.DestinationConnectionString,
                Settings.Current.Building.CdmSchema);

            dbDestination.ExecuteQuery(Settings.Current.DropVocabularyTablesScript);
        }

        public void CreateLookup(IVocabulary vocabulary, string chunkSchema)
        {
            PerformAction(() =>
            {
                var timer = new Stopwatch();
                timer.Start();
                vocabulary.Fill(true, false);
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
                Logger.Write(null, Logger.LogMessageTypes.Info,
                    $"Care site, Location and Provider tables were saved to CDM database - {timer.ElapsedMilliseconds} ms");

                locationConcepts.Clear();
                careSiteConcepts.Clear();
                providerConcepts.Clear();
                locationConcepts = null;
                careSiteConcepts = null;
                providerConcepts = null;
                GC.Collect();
            });
        }



        private void FillList<T>(ICollection<T> list, QueryDefinition qd, EntityDefinition ed, string etlLibraryPath, string chunkSchema) where T : IEntity
        {
            var vendor = Settings.Current.Building.VendorToProcess;
            var sql = framework.desktop.Helpers.GetSqlHelper.GetSql(Settings.Current.Building.SourceEngine.Database,
                qd.GetSql(vendor, Settings.Current.Building.SourceSchema, chunkSchema), Settings.Current.Building.SourceSchema);

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

                            if (CurrentState != BuilderState.Running)
                                break;
                        }
                    }
                }
            }
        }

        public void Build(IVocabulary vocabulary, string chunksSchema)
        {
            var saveQueue = new BlockingCollection<DatabaseChunkPart>();

            PerformAction(() =>
            {
                if (Settings.Current.Building.ChunksCount == 0)
                {
                    Settings.Current.Building.ChunksCount = _chunkController.CreateChunks(chunksSchema); 
                }

                vocabulary.Fill(false, false);

                Logger.Write(null, Logger.LogMessageTypes.Info,
                    $"==================== Conversion to CDM was started ====================");

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
                            Settings.Current.Building.CompletedChunkIds.Add(data.ChunkData.ChunkId);
                            timer.Stop();
                            Logger.Write(data.ChunkData.ChunkId, Logger.LogMessageTypes.Info,
                                $"ChunkId={data.ChunkData.ChunkId} was saved - {timer.ElapsedMilliseconds} ms | {GC.GetTotalMemory(false) / 1024f / 1024f} Mb");
                        }

                        if (CurrentState != BuilderState.Running)
                            break;
                    }

                    CurrentState = BuilderState.Stopped;
                });

                if(Settings.Current.OnlyEvenChunks)
                    Logger.Write(null, Logger.LogMessageTypes.Info, "Only even chunk ids will be processed on this machine");

                if (Settings.Current.OnlyOddChunks)
                    Logger.Write(null, Logger.LogMessageTypes.Info, "Only odd chunk ids will be processed on this machine");

                if(Settings.Current.ChunksTo > 0)
                    Logger.Write(null, Logger.LogMessageTypes.Info, $"ChunkIds from {Settings.Current.ChunksFrom} to {Settings.Current.ChunksTo} will be converted");

                Parallel.For(0, Settings.Current.Building.ChunksCount,
                    new ParallelOptions { MaxDegreeOfParallelism = Settings.Current.DegreeOfParallelism }, (chunkId, state) =>
                      {
                          if (CurrentState != BuilderState.Running)
                              state.Break();

                          if (!Settings.Current.Building.CompletedChunkIds.Contains(chunkId))
                          {
                              if(IsOdd(chunkId))
                              {
                                  if (Settings.Current.OnlyEvenChunks)
                                  {
                                      Logger.Write(null, Logger.LogMessageTypes.Info, $"{chunkId} was skipped");
                                      return;
                                  }
                              }
                              else
                              {
                                  if (Settings.Current.OnlyOddChunks)
                                  {
                                      Logger.Write(null, Logger.LogMessageTypes.Info, $"{chunkId} was skipped");
                                      return;
                                  }
                              }

                              if(chunkId < Settings.Current.ChunksFrom)
                              {
                                  Logger.Write(null, Logger.LogMessageTypes.Info, $"{chunkId} was skipped");
                                  return;
                              }

                              if (chunkId > Settings.Current.ChunksTo)
                              {
                                  Logger.Write(null, Logger.LogMessageTypes.Info, $"{chunkId} was skipped");
                                  return;
                              }

                              var chunk = new DatabaseChunkBuilder(chunkId, CreatePersonBuilder);

                              using (var connection =
                                  new OdbcConnection(Settings.Current.Building.SourceConnectionString))
                              {
                                  connection.Open();
                                  var result = chunk.Process(Settings.Current.Building.SourceEngine, Settings.Current.Building.SourceSchema);
                                  saveQueue.Add(result.GetDatabaseChunkPart());
                              }

                              Settings.Current.Save(false);

                              while (saveQueue.Count > 0)
                              {
                                  Thread.Sleep(1000);
                              }
                          }
                      });

                saveQueue.CompleteAdding();

                save.Wait();
            });
        }

        public static bool IsOdd(int value)
        {
            return value % 2 != 0;
        }

        private PersonBuilder CreatePersonBuilder()
        {
            var constructorInfo = EtlLibrary.GetBuilderConstructor(_etlLibraryPath, Settings.Current.Building.VendorToProcess);
            var handle = (PersonBuilder)constructorInfo.Invoke([Settings.Current.Building.VendorToProcess]);
            return handle;
        }

        #endregion
    }
}
