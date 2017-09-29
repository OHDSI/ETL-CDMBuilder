using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using org.ohdsi.cdm.framework.core.Common.Services;
using org.ohdsi.cdm.framework.core.Definitions;
using org.ohdsi.cdm.framework.entities.Builder;
using org.ohdsi.cdm.framework.entities.Omop;
using org.ohdsi.cdm.framework.shared.Enums;
using org.ohdsi.cdm.framework.shared.Extensions;

namespace org.ohdsi.cdm.framework.core.Base
{
   public class ChunkPart
   {
      private ConcurrentDictionary<long, Lazy<IPersonBuilder>> personBuilders;
      private ChunkData chunk;
      private readonly int chunkId;
      private readonly Func<IPersonBuilder> createPersonBuilder;
      private readonly string prefix;
      private readonly PerformanceCounter cpuCounter;
      private readonly PerformanceCounter ramCounter;

      public ChunkPart(int chunkId, Func<IPersonBuilder> createPersonBuilder, string prefix)
      {
         this.chunkId = chunkId;
         this.createPersonBuilder = createPersonBuilder;
         this.prefix = prefix;

         Init();

         cpuCounter = new PerformanceCounter("Processor", "% Processor Time", "_Total");
         ramCounter = new PerformanceCounter("Memory", "Available MBytes");
      }

      public void Init()
      {
         this.personBuilders = new ConcurrentDictionary<long, Lazy<IPersonBuilder>>();
         this.chunk = new ChunkData(chunkId, int.Parse(prefix));
      }


      private void LogResourceUsage()
      {
         Logger.Write(chunkId, LogMessageTypes.Info,
            string.Format("CPU: {0}% | RAM Available: {1}Mb", cpuCounter.NextValue(), ramCounter.NextValue()));
      }

      public void Load()
      {
         var timer = new Stopwatch();
         timer.Start();

         //Parallel.ForEach(Settings.Current.Building.SourceQueryDefinitions, new ParallelOptions { MaxDegreeOfParallelism = 3 }, qd =>
         Parallel.ForEach(Settings.Current.Building.SourceQueryDefinitions, qd =>
         {
            if (qd.Providers != null) return;
            if (qd.Locations != null) return;
            if (qd.CareSites != null) return;

            var sql = qd.GetSql(Settings.Current.Building.SourceEngine.Database,
               Settings.Current.Building.Vendor, Settings.Current.Building.SourceSchemaName);

            if (string.IsNullOrEmpty(sql)) return;

            

            if (Settings.Current.Building.SourceEngine.Database != Database.Redshift)
            {
               var q = string.Format(sql, chunkId);
               using (var conn = Settings.Current.Building.SourceEngine.GetConnection(Settings.Current.Building.SourceConnectionString))
               using (var cdm = Settings.Current.Building.SourceEngine.GetCommand(q, conn))
               using (var reader = Settings.Current.Building.SourceEngine.ReadChunkData(conn, cdm, qd, chunkId, prefix))
               {
                  PopulateData(qd, reader);
               }
            }
            else
            {
               using (var reader = Settings.Current.Building.SourceEngine.ReadChunkData(null, null, qd, chunkId, prefix))
               {
                  PopulateData(qd, reader);
               }
            }

         });
         timer.Stop();

         Logger.Write(chunkId, LogMessageTypes.Info,
                  string.Format(prefix + ") loaded - {0} ms | {1} Mb", timer.ElapsedMilliseconds,
                     (GC.GetTotalMemory(false) / 1024f) / 1024f));

         LogResourceUsage();
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
         }
      }

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
               Concept conceptDef = null;
               if (d.Concepts != null && d.Concepts.Any())
                  conceptDef = d.Concepts[0];

               bool added;
               var pb =
                  personBuilders.GetOrAdd(personId.Value, key => new Lazy<IPersonBuilder>(() => createPersonBuilder()),
                     out added).Value;

               if (pb.Chunk == null)
                  pb.JoinToChunkData(chunk);

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
                              AddChildData(entity, queryDefinition.DrugCost[0].CreateEnity((DrugExposure)entity, reader));
                           break;
                        }

                     case EntityType.ProcedureOccurrence:
                        {
                           if (queryDefinition.ProcedureCost != null && queryDefinition.ProcedureCost[0].Match(reader))
                              AddChildData(entity,
                                 queryDefinition.ProcedureCost[0].CreateEnity((ProcedureOccurrence)entity, reader,
                                    keyMasterOffset));
                           break;
                        }

                     case EntityType.VisitOccurrence:
                        {
                           if (queryDefinition.VisitCost != null && queryDefinition.VisitCost[0].Match(reader))
                              AddChildData(entity,
                                 queryDefinition.VisitCost[0].CreateEnity((VisitOccurrence)entity, reader,
                                    keyMasterOffset));
                           break;
                        }

                     case EntityType.DeviceExposure:
                        {
                           if (queryDefinition.DeviceCost != null && queryDefinition.DeviceCost[0].Match(reader))
                              AddChildData(entity,
                                 queryDefinition.DeviceCost[0].CreateEnity((DeviceExposure)entity, reader,
                                    keyMasterOffset));
                           break;
                        }

                     case EntityType.Observation:
                        {
                           if (queryDefinition.ObservationCost != null && queryDefinition.ObservationCost[0].Match(reader))
                              AddChildData(entity,
                                 queryDefinition.ObservationCost[0].CreateEnity((Observation)entity, reader));
                           break;
                        }

                     case EntityType.Measurement:
                        {
                           if (queryDefinition.MeasurementCost != null && queryDefinition.MeasurementCost[0].Match(reader))
                              AddChildData(entity,
                                 queryDefinition.MeasurementCost[0].CreateEnity((Measurement)entity, reader));
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

      public void Build(IVocabularyService vocabularyService)
      {
         var providerKeys = LookupProviders(vocabularyService);
         Parallel.ForEach(personBuilders.Values, pb => pb.Value.Build(providerKeys));

         personBuilders.Clear();
         personBuilders = null;
      }

      private Dictionary<string, long> LookupProviders(IVocabularyService vocabularyService)
      {
         var providerKeys = new Dictionary<string, long>(StringComparer.OrdinalIgnoreCase);

         foreach (var pb in personBuilders.Values)
         {
            foreach (var providerKey in pb.Value.ProviderKeys.Keys)
            {
               if (!providerKeys.ContainsKey(providerKey))
               {
                  providerKeys.Add(providerKey, 0);
               }
            }
         }

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
         return providerKeys;
      }

      public void Save()
      {
         if (Settings.Current.Building.Vendor != Vendors.ErasV5 && chunk.Persons.Count == 0)
         {
            Logger.Write(chunkId, LogMessageTypes.Debug, "skipped subChunkId=" + prefix);
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
            "saved to S3 for Redhsift or otherwise to DB subChunkId=" + prefix + " | " + chunk.Persons.Count + " | " + timer.ElapsedMilliseconds +
            " ms");
         LogResourceUsage();
      }

      public void Clean()
      {
         chunk.Clean();
         chunk = null;
         Logger.Write(chunkId, LogMessageTypes.Info, "Cleanup subChunkId=" + prefix);
         LogResourceUsage();
      }
   }
}
