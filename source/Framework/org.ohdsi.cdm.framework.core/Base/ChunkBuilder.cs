using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
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
   public class ChunkBuilder
   {
      #region Variables

      private IVocabularyService vocabularyService;
      private readonly ConcurrentDictionary<long, IPersonBuilder> personBuilders =
         new ConcurrentDictionary<long, IPersonBuilder>();

      
      private readonly ManualResetEvent readyToSave = new ManualResetEvent(false);
      private readonly int chunkId;

      private int processingQuery;
      private long rowsProcessed;

      private readonly Dictionary<long, int> personIdToSubChunkId = new Dictionary<long, int>();
      private readonly Dictionary<int, int> subChunkPersonsCount = new Dictionary<int, int>();
      private readonly Dictionary<int, ChunkData> subChunks = new Dictionary<int, ChunkData>();
      
      #endregion

      #region Properties
      public IDbConnection SourceConnectionString
      {
         get
         {
            return Settings.Current.Building.SourceEngine.GetConnection(Settings.Current.Building.SourceConnectionString);
         }
      }

      #endregion

      #region Constructors

      public ChunkBuilder(int chunkId, IEnumerable<long> personIds, Func<IPersonBuilder> createPersonBuilder,
         int subChunkSize)
      {
         this.chunkId = chunkId;

         var currentSubChunkId = 0;
         foreach (var personId in personIds.OrderBy(pId => pId))
         {
            if (!subChunkPersonsCount.ContainsKey(currentSubChunkId))
            {
               subChunkPersonsCount.Add(currentSubChunkId, 0);
               subChunks.Add(currentSubChunkId, new ChunkData(chunkId, currentSubChunkId));
            }

            subChunkPersonsCount[currentSubChunkId]++;
            personIdToSubChunkId.Add(personId, currentSubChunkId);

            var personBuilder = createPersonBuilder();
            personBuilder.JoinToChunkData(subChunks[currentSubChunkId]);
            personBuilders.TryAdd(personId, personBuilder);

            if (subChunkPersonsCount[currentSubChunkId] == subChunkSize)
            {
               currentSubChunkId++;
            }
         }

         Logger.Write(chunkId, LogMessageTypes.Debug, "subChunkInfo " + subChunks.Count + " | " + subChunkSize);
      }
      #endregion

      #region Methods

      private void AddEntity(IEntity entity)
      {
         personBuilders[entity.PersonId].AddData(entity);
      }

      private void AddChildData(IEntity parent, IEntity child)
      {
          personBuilders[parent.PersonId].AddChildData(parent, child);
      }

      private void AddEntity(QueryDefinition queryDefinition, IEnumerable<EntityDefinition> definitions,
         IDataRecord reader, Guid recordGuid)
      {
         if (definitions == null) return;

         foreach (var d in queryDefinition.FindDefinition(definitions, reader))
         {
            var personId = reader.GetLong(d.PersonId);
            if(personId.HasValue)
               queryDefinition.ProcessedPersonId = personId.Value;

            Concept conceptDef = null;
            if (d.Concepts != null && d.Concepts.Any())
               conceptDef = d.Concepts[0];
            personBuilders[personId.Value].JoinToVocabulary(d.Vocabulary);

            var keyMasterOffset = GetSubChunk(personId.Value).KeyMasterOffset;

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
               }
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

      private ChunkData GetSubChunk(long personId)
      {
         var subChunkId = personIdToSubChunkId[personId];
         return subChunks[subChunkId];
      }
      
      private Task StartBuildAndSave()
      {
         var buildTask = Task.Factory.StartNew(() =>
         {
            try
            {
               var readyPersonInSubChunk = new Dictionary<int, int>();
               var savedSubChunks = new Dictionary<int, bool>();
               var saveTasks = new List<Task>();
               readyToSave.WaitOne();

               long currentRow = 0;
               while (personBuilders.Any(pb => pb.Value != null))
               {
                  if (processingQuery > 0 && ((currentRow > 0 && rowsProcessed == currentRow) || rowsProcessed%100 != 0))
                  {
                     continue;
                  }

                  currentRow = rowsProcessed;

                  var minProcessedPersonId = GetMinProcessedPersonId();

                  //Logger.Write(chunkId, LogMessageTypes.Debug, "minProcessedPersonId=" + minProcessedPersonId + " rowsProcessed=" + rowsProcessed);
                  if (processingQuery == 0 || minProcessedPersonId != long.MaxValue)
                  {
                     var personIds = GetUncompletedPersonIds(minProcessedPersonId);
                     if (personIds.Length > 0)
                     {
                        //Logger.Write(chunkId, LogMessageTypes.Debug, "Start build for=" + personIds.Length);
                        Build(personIds);

                        var chunks = GetPreparedSubChunk(personIds, readyPersonInSubChunk, savedSubChunks).ToArray();

                        //Logger.Write(chunkId, LogMessageTypes.Debug, "PreparedSubChunk=" + chunks.Count());
                        saveTasks.AddRange(SaveSubChunks(chunks));
                        
                        CleanPersonBuilders(personIds);
                     }
                  }

                  //if (processingQuery == 0)
                  //{
                  //   break;
                  //}

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

      private IEnumerable<ChunkData> GetPreparedSubChunk(IEnumerable<long> personIds,
         IDictionary<int, int> readyPersonInSubChunk, IDictionary<int, bool> savedSubChunks)
      {
         foreach (var chunk in personIds.Select(GetSubChunk))
         {
            if (!readyPersonInSubChunk.ContainsKey(chunk.SubChunkId))
               readyPersonInSubChunk.Add(chunk.SubChunkId, 0);

            readyPersonInSubChunk[chunk.SubChunkId]++;

            if (subChunkPersonsCount[chunk.SubChunkId] != readyPersonInSubChunk[chunk.SubChunkId])
               continue;
            if (savedSubChunks.ContainsKey(chunk.SubChunkId))
               continue;

            savedSubChunks.Add(chunk.SubChunkId, false);

            yield return chunk;
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
            foreach (var providerKey in personBuilders[personId].ProviderKeys.Keys)
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

         Parallel.ForEach(personIds, personId => personBuilders[personId].Build(providerKeys));

         timer.Stop();
         //Logger.Write(chunkId, LogMessageTypes.Debug, "Build " + timer.ElapsedMilliseconds + " ms");
      }

      private long[] GetUncompletedPersonIds(long minProcessedPersonId)
      {
         return personBuilders.Keys.Where(
            personId =>
               (processingQuery == 0 || personId < minProcessedPersonId) &&
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
          if (chunk.Persons.Count == 0)
          {
              Logger.Write(chunkId, LogMessageTypes.Debug, "skipped subChunkId=" + chunk.SubChunkId);
              chunk.Clean();
              return;
          }

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
            qd.ProcessedPersonId = 0;
         }

         Parallel.ForEach(Settings.Current.Building.SourceQueryDefinitions, queryDefinition =>
         {
            try
            {
               if (queryDefinition.Providers != null) return;
               if (queryDefinition.Locations != null) return;
               if (queryDefinition.CareSites != null) return;

               var sql = queryDefinition.GetSql(Settings.Current.Building.SourceEngine.Database,
                  Settings.Current.Building.Vendor, Settings.Current.Building.SourceSchemaName);

               if (string.IsNullOrEmpty(sql)) return;

               var query = string.Format(sql, chunkId);
               foreach (var q in query.Split(new[] {"go;"}, StringSplitOptions.RemoveEmptyEntries))
               {
                  using (var conn = SourceConnectionString)
                  using (var c = Settings.Current.Building.SourceEngine.GetCommand(q, conn))
                  {
                     Interlocked.Increment(ref processingQuery);
                     readyToSave.Set();
                     
                     var time = new Stopwatch();
                     time.Start();
                     using (var reader = c.ExecuteReader())
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
                        PopulateData(queryDefinition, reader);
                        queryDefinition.ProcessedPersonId = long.MaxValue;
                        time.Stop();
                        Logger.Write(chunkId, LogMessageTypes.Debug, "PD) " + time.ElapsedMilliseconds + " ms || " + q);
                     }

                     Interlocked.Decrement(ref processingQuery);
                  }
               }
            }
            catch (Exception e)
            {
               Logger.WriteError(chunkId, e);
               throw;
            }
         });


         timer.Stop();
         dbChunk.ChunkLoaded(chunkId);

         Logger.Write(chunkId, LogMessageTypes.Info, string.Format("Loaded - {0} ms", timer.ElapsedMilliseconds));
         Logger.Write(chunkId, LogMessageTypes.Info, string.Format("Loaded - {0} Mb", (GC.GetTotalMemory(false)/1024f)/1024f));
      }

      private void PopulateData(QueryDefinition queryDefinition, IDataReader reader)
      {
         do
         {
            var dbEnumerator = new DbEnumerator(reader);
            while (dbEnumerator.MoveNext())
            {
               var recordGuid = Guid.NewGuid();
               var r = (IDataRecord) dbEnumerator.Current;

               AddEntity(queryDefinition, queryDefinition.Persons, r, recordGuid);
               AddEntity(queryDefinition, queryDefinition.PayerPlanPeriods, r, recordGuid);
               AddEntity(queryDefinition, queryDefinition.Death, r, recordGuid);
               AddEntity(queryDefinition, queryDefinition.VisitOccurrence, r, recordGuid);
               AddEntity(queryDefinition, queryDefinition.Observation, r, recordGuid);
               AddEntity(queryDefinition, queryDefinition.ConditionOccurrence, r, recordGuid);
               AddEntity(queryDefinition, queryDefinition.ProcedureOccurrence, r, recordGuid);
               AddEntity(queryDefinition, queryDefinition.DrugExposure, r, recordGuid);
               AddEntity(queryDefinition, queryDefinition.Cohort, r, recordGuid);
               AddEntity(queryDefinition, queryDefinition.Measurement, r, recordGuid);
               AddEntity(queryDefinition, queryDefinition.DeviceExposure, r, recordGuid);

               Interlocked.Increment(ref rowsProcessed);
            }
         } while (reader.NextResult());
      }

      #endregion
   }
}
