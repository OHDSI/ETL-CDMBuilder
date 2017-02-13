using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using org.ohdsi.cdm.framework.core.Common.Services;
using org.ohdsi.cdm.framework.core.Definitions;
using org.ohdsi.cdm.framework.data.DbLayer;
using org.ohdsi.cdm.framework.entities.Builder;
using org.ohdsi.cdm.framework.entities.Omop;
using org.ohdsi.cdm.framework.shared.Enums;
using org.ohdsi.cdm.framework.shared.Extensions;

namespace org.ohdsi.cdm.framework.core.Base
{
   public class ChunkBuilder : IChunkBuilder
   {
      #region Variables

      private IVocabularyService vocabularyService;
      private readonly ConcurrentDictionary<long, Lazy<IPersonBuilder>> personBuilders =
         new ConcurrentDictionary<long, Lazy<IPersonBuilder>>();
      
      private readonly ManualResetEvent readyToSave = new ManualResetEvent(false);
      private readonly int chunkId;

      //private int processingQuery;
      private bool loaded;
      private long rowsProcessed;

      private readonly Func<IPersonBuilder> createPersonBuilder;
      private readonly List<ChunkData> subChunks;
      #endregion
      
      #region Constructors

      public ChunkBuilder(int chunkId, Func<IPersonBuilder> createPersonBuilder,
         int subChunkSize, List<ChunkData> subChunks)
      {
         this.chunkId = chunkId;
         this.createPersonBuilder = createPersonBuilder;
         this.subChunks = subChunks;
         
         var subChunkCount = Settings.Current.Builder.BatchSize / subChunkSize;
         Logger.Write(chunkId, LogMessageTypes.Debug, "subChunkInfo " + subChunkCount + " | " + subChunkSize);
      }
      #endregion

      #region Methods

      private void AddEntity(IEntity entity)
      {
         personBuilders[entity.PersonId].Value.AddData(entity);
      }

      private void AddChildData(IEntity parent, IEntity child)
      {
          personBuilders[parent.PersonId].Value.AddChildData(parent, child);
      }

      private void AddEntity(QueryDefinition queryDefinition, IEnumerable<EntityDefinition> definitions,
         IDataRecord reader, Guid recordGuid, string definitionName)
      {
         if (definitions == null) return;

         foreach (var d in queryDefinition.FindDefinition(definitions, reader))
         {
            var personId = reader.GetLong(d.PersonId);

            try
            {
               if (personId.HasValue)
                  queryDefinition.ProcessedPersonId = personId.Value;

               Concept conceptDef = null;
               if (d.Concepts != null && d.Concepts.Any())
                  conceptDef = d.Concepts[0];

               bool added;
               var pb =
                  personBuilders.GetOrAdd(personId.Value, key => new Lazy<IPersonBuilder>(() => createPersonBuilder()),
                     out added).Value;

               if (added)
                  readyToSave.Set();

               JoinSubChunk(personId.Value, pb);

               pb.JoinToVocabulary(d.Vocabulary);
               var keyMasterOffset = pb.Chunk.KeyMasterOffset;

               foreach (var entity in d.GetConcepts(conceptDef, reader, keyMasterOffset))
               {
                  if (entity == null) continue;

                  entity.SourceRecordGuid = recordGuid;
                  AddEntity(entity);

                  switch (entity.GeEntityType())
                  {
                     case EntityType.DrugExposure:
                     {
                        if (queryDefinition.DrugCost != null && queryDefinition.DrugCost[0].Match(reader))
                           AddChildData(entity, queryDefinition.DrugCost[0].CreateEnity((DrugExposure) entity, reader));
                        break;
                     }

                     case EntityType.ProcedureOccurrence:
                     {
                        if (queryDefinition.ProcedureCost != null && queryDefinition.ProcedureCost[0].Match(reader))
                           AddChildData(entity,
                              queryDefinition.ProcedureCost[0].CreateEnity((ProcedureOccurrence) entity, reader,
                                 keyMasterOffset));
                        break;
                     }

                     case EntityType.VisitOccurrence:
                     {
                        if (queryDefinition.VisitCost != null && queryDefinition.VisitCost[0].Match(reader))
                           AddChildData(entity,
                              queryDefinition.VisitCost[0].CreateEnity((VisitOccurrence) entity, reader,
                                 keyMasterOffset));
                        break;
                     }

                     case EntityType.DeviceExposure:
                     {
                        if (queryDefinition.DeviceCost != null && queryDefinition.DeviceCost[0].Match(reader))
                           AddChildData(entity,
                              queryDefinition.DeviceCost[0].CreateEnity((DeviceExposure) entity, reader,
                                 keyMasterOffset));
                        break;
                     }

                     case EntityType.Observation:
                     {
                        if (queryDefinition.ObservationCost != null && queryDefinition.ObservationCost[0].Match(reader))
                           AddChildData(entity,
                              queryDefinition.ObservationCost[0].CreateEnity((Observation) entity, reader));
                        break;
                     }

                     case EntityType.Measurement:
                     {
                        if (queryDefinition.MeasurementCost != null && queryDefinition.MeasurementCost[0].Match(reader))
                           AddChildData(entity,
                              queryDefinition.MeasurementCost[0].CreateEnity((Measurement) entity, reader));
                        break;
                     }
                  }
               }
            }
            catch (Exception e)
            {
               throw new Exception(string.Format("PersonId={0} | DefinitionFileName={1} | DefinitionName={2}", personId, queryDefinition.FileName, definitionName), e);
            }
         }
      }

      private void JoinSubChunk(long personId, IPersonBuilder pb)
      {
         if (pb.Chunk != null)
            return;

         //TODO change to Interval-Tree
         foreach (var subChunk in subChunks)
         {
            if (personId >= subChunk.MinPersonId && personId <= subChunk.MaxPersonId)
            {
               pb.JoinToChunkData(subChunk);
            }
         }
      }


      public void Process()
      {
         try
         {
            var channelFactory = ServicesManager.GetChannelFactory<IVocabularyService>("net.pipe://localhost/VocabularyServiceEndpoint");
            vocabularyService = channelFactory.CreateChannel();

            var buildAndSave = StartBuildAndSave();
            Load();
            buildAndSave.Wait();

            if (Settings.Current.Building.DestinationEngine.Database == Database.Redshift)
            {
               ServicesManager.AddToSaveQueue(chunkId);
               Logger.Write(null, LogMessageTypes.Debug, "AddToSaveQueue " + chunkId);
            }
            else
            {
               var dbChunk = new DbChunk(Settings.Current.Building.BuilderConnectionString);
               dbChunk.ChunkComplete(chunkId);
            }

            channelFactory.Close();
         }
         catch (Exception e)
         {
            Logger.WriteError(chunkId, e);

            throw;
         }
      }


      private Task StartBuildAndSave()
      {
         var buildTask = Task.Factory.StartNew(() =>
         {
            try
            {
               var saveTasks = new List<Task>();
               readyToSave.WaitOne();

               long currentRow = 0;
               while (personBuilders.Any(pb => pb.Value != null))
               {
                  if (!loaded && ((currentRow > 0 && rowsProcessed == currentRow) || rowsProcessed == 0 || rowsProcessed % 100 != 0))
                  {
                     continue;
                  }

                  currentRow = rowsProcessed;

                  var minProcessedPersonId = GetMinProcessedPersonId();

                  if (loaded || (minProcessedPersonId != long.MinValue && minProcessedPersonId != long.MaxValue))
                  {
                     var personIds = GetUncompletedPersonIds(minProcessedPersonId);
                     if (personIds.Length > 0)
                     {
                        Build(personIds);

                        var chunksToSave = new List<ChunkData>();
                        foreach (var personId in personIds)
                        {
                           personBuilders[personId].Value.Chunk.PersonWasBuilt();
                           if (personBuilders[personId].Value.Chunk.RadyToSave)
                              chunksToSave.Add(personBuilders[personId].Value.Chunk);
                        }
                        saveTasks.AddRange(SaveSubChunks(chunksToSave));
                        CleanPersonBuilders(personIds);
                     }
                  }
               }

               Task.WaitAll(saveTasks.ToArray());
            }
            catch (Exception e)
            {
               Logger.WriteError(chunkId, e);
               throw;
            }

         });
         return buildTask;
      }

      private void CleanPersonBuilders(IEnumerable<long> personIds)
      {
         foreach (var personId in personIds)
         {
            personBuilders[personId] = null;
         }
      }
      

      private IEnumerable<Task> SaveSubChunks(IEnumerable<ChunkData> chunks)
      {
         return chunks.Select(c => Task.Factory.StartNew(() => Save(c)));
      }

      private void Build(long[] personIds)
      {
         var timer = new Stopwatch();
         timer.Start();

         var providerKeys = new Dictionary<string, long>();
         foreach (var personId in personIds)
         {
            foreach (var providerKey in personBuilders[personId].Value.ProviderKeys.Keys)
            {
               if (!providerKeys.ContainsKey(providerKey))
               {
                  providerKeys.Add(providerKey, 0);
               }
            }
         }
         timer.Stop();
         //Logger.Write(chunkId, LogMessageTypes.Debug, "Get ProviderKeys " + timer.ElapsedMilliseconds + " ms");

         timer.Restart();

         if (providerKeys.Count > 0)
         {
            var providerIds = vocabularyService.GetProviderIds(providerKeys.Keys.ToArray());
            foreach (var keyValuePair in providerIds)
            {
               if (keyValuePair.Value != -1)
               {
                  providerKeys[keyValuePair.Key] = keyValuePair.Value;
               }
            }
         }

         timer.Stop();
         //Logger.Write(chunkId, LogMessageTypes.Debug, "GetProviderIds " + timer.ElapsedMilliseconds + " ms");

         timer.Restart();

         Parallel.ForEach(personIds, personId => personBuilders[personId].Value.Build(providerKeys));

         timer.Stop();
         //Logger.Write(chunkId, LogMessageTypes.Debug, "Build " + timer.ElapsedMilliseconds + " ms");
      }

      private long[] GetUncompletedPersonIds(long minProcessedPersonId)
      {
         return personBuilders.Keys.Where(
            personId =>
               (loaded || personId < minProcessedPersonId) &&
               personBuilders[personId] != null).OrderBy(personId => personId).ToArray();
      }

      private static long GetMinProcessedPersonId()
      {
         var minProcessedPersonId = long.MaxValue;
         foreach (var qd in Settings.Current.Building.SourceQueryDefinitions)
         {
            if (qd.Providers != null) continue;
            if (qd.Locations != null) continue;
            if (qd.CareSites != null) continue;
            if (!qd.IsSuitable(qd.Query.Database, Settings.Current.Building.Vendor)) continue;

            if (qd.ProcessedPersonId < minProcessedPersonId)
               minProcessedPersonId = qd.ProcessedPersonId;
         }
         return minProcessedPersonId;
      }

      private void Save(ChunkData chunk)
      {
          //if (chunk.Persons.Count == 0)
          //{
          //    Logger.Write(chunkId, LogMessageTypes.Debug, "skipped subChunkId=" + chunk.SubChunkId);
          //    chunk.Clean();
          //    return;
          //}

          var saver = Settings.Current.Building.DestinationEngine.GetSaver();

          var timer = new Stopwatch();
          timer.Start();
          using (saver)
          {
              saver.Create(Settings.Current.Building.DestinationConnectionString).Save(chunk);
          }
          timer.Stop();

         Logger.Write(chunkId, LogMessageTypes.Info,
            "saved subChunkId=" + chunk.SubChunkId + " | " + chunk.Persons.Count + " | " + timer.ElapsedMilliseconds +
            " ms");

          chunk.Clean();
      }
      
      private void Load()
      {
         loaded = false;
         var dbChunk = new DbChunk(Settings.Current.Building.BuilderConnectionString);
         var timer = new Stopwatch();
         timer.Start();

         var runningQueries =
            (Settings.Current.Building.SourceQueryDefinitions
               .Where(qd => qd.Providers == null)
               .Where(qd => qd.Locations == null)
               .Where(qd => qd.CareSites == null))
               .Count(qd => qd.IsSuitable(qd.Query.Database, Settings.Current.Building.Vendor));

         foreach (var qd in Settings.Current.Building.SourceQueryDefinitions)
         {
            qd.ProcessedPersonId = long.MinValue;
         }

         Parallel.ForEach(Settings.Current.Building.SourceQueryDefinitions, qd =>
         {
            try
            {
               if (qd.Providers != null) return;
               if (qd.Locations != null) return;
               if (qd.CareSites != null) return;
               
               var time = new Stopwatch();
               time.Start();
               
               var sql = qd.GetSql(Settings.Current.Building.SourceEngine.Database,
                           Settings.Current.Building.Vendor, Settings.Current.Building.SourceSchemaName);

               if (string.IsNullOrEmpty(sql)) return;
               var q = string.Format(sql, chunkId);

               using (var conn = Settings.Current.Building.SourceEngine.GetConnection(Settings.Current.Building.SourceConnectionString))
               using (var cdm = Settings.Current.Building.SourceEngine.GetCommand(q, conn))
               {
                  //Interlocked.Increment(ref processingQuery);
                  
                  using (var reader = Settings.Current.Building.SourceEngine.ReadChunkData(conn, cdm, qd, chunkId, null))
                  {
                     time.Stop();
                     Logger.Write(chunkId, LogMessageTypes.Debug, "QE) " + time.ElapsedMilliseconds + " ms || " + q);

                     Interlocked.Decrement(ref runningQueries);
                     Logger.Write(chunkId, LogMessageTypes.Debug, "Running Queries = " + runningQueries);

                     if (runningQueries == 0)
                     {
                        dbChunk.ChunkQueriesExecuted(chunkId);
                     }

                     time.Restart();
                     PopulateData(qd, reader);
                     qd.ProcessedPersonId = long.MaxValue;
                     time.Stop();
                     Logger.Write(chunkId, LogMessageTypes.Debug, "PD) " + time.ElapsedMilliseconds + " ms || " + q);
                  }

                  //Interlocked.Decrement(ref processingQuery);
               }
            }
            catch (Exception e)
            {
               Logger.WriteError(chunkId, e);
               throw;
            }
         });

         readyToSave.Set();
         
         timer.Stop();
         dbChunk.ChunkLoaded(chunkId);

         Logger.Write(chunkId, LogMessageTypes.Info, string.Format("Loaded - {0} ms", timer.ElapsedMilliseconds));
         Logger.Write(chunkId, LogMessageTypes.Info, string.Format("Loaded - {0} Mb", (GC.GetTotalMemory(false)/1024f)/1024f));
         loaded = true;
      }

      private void PopulateData(QueryDefinition queryDefinition, IDataReader reader)
      {
         while (reader.Read())
         {
            var recordGuid = Guid.NewGuid();

            AddEntity(queryDefinition, queryDefinition.Persons, reader, recordGuid, "Persons");
            AddEntity(queryDefinition, queryDefinition.PayerPlanPeriods, reader, recordGuid, "PayerPlanPeriods");
            AddEntity(queryDefinition, queryDefinition.Death, reader, recordGuid, "Death");
            AddEntity(queryDefinition, queryDefinition.VisitOccurrence, reader, recordGuid, "VisitOccurrence");
            AddEntity(queryDefinition, queryDefinition.Observation, reader, recordGuid, "Observation");
            AddEntity(queryDefinition, queryDefinition.ConditionOccurrence, reader, recordGuid, "ConditionOccurrence");
            AddEntity(queryDefinition, queryDefinition.ProcedureOccurrence, reader, recordGuid, "ProcedureOccurrence");
            AddEntity(queryDefinition, queryDefinition.DrugExposure, reader, recordGuid, "DrugExposure");
            AddEntity(queryDefinition, queryDefinition.Cohort, reader, recordGuid, "Cohort");
            AddEntity(queryDefinition, queryDefinition.Measurement, reader, recordGuid, "Measurement");
            AddEntity(queryDefinition, queryDefinition.DeviceExposure, reader, recordGuid, "DeviceExposure");

            Interlocked.Increment(ref rowsProcessed);
         }
      }

      #endregion
   }
}
