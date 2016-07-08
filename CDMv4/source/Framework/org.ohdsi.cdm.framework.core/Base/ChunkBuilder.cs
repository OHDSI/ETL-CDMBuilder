using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using org.ohdsi.cdm.framework.core.CommonVocabulary;
using org.ohdsi.cdm.framework.core.Definitions;
using org.ohdsi.cdm.framework.core.Savers;
using org.ohdsi.cdm.framework.entities.Builder;
using org.ohdsi.cdm.framework.entities.Omop;
using org.ohdsi.cdm.framework.shared.Enums;
using org.ohdsi.cdm.framework.shared.Helpers;

namespace org.ohdsi.cdm.framework.core.Base
{
   public class ChunkBuilder : IChunkBuilder
   {
      #region Variables
      private readonly ConcurrentDictionary<long, IPersonBuilder> personBuilders =
         new ConcurrentDictionary<long, IPersonBuilder>();

      private readonly ConcurrentDictionary<string, long> providerKeys =
         new ConcurrentDictionary<string, long>(StringComparer.OrdinalIgnoreCase);

      private readonly ChunkData chunk;
      private readonly Type builderType;
      #endregion

      #region Properties

      public Vocabulary Vocabulary { get; set; }

      public ChunkData Chunk
      {
         get { return chunk; }
      }

      public ConcurrentDictionary<string, long> ProviderKeys
      {
         get { return providerKeys; }
      }
      #endregion

      #region Constructors
      public ChunkBuilder(ChunkData chunkData, Type builderType)
      {
         this.chunk = chunkData;
         this.builderType = builderType;
      }
      #endregion

      #region Methods
      private IPersonBuilder CreatePersonBuilder()
      {
         return (IPersonBuilder)Activator.CreateInstance(builderType, this);
      }

      private void AddEntity(IEntity entity)
      {
         personBuilders.GetOrAdd(entity.PersonId, CreatePersonBuilder()).AddData(entity);

         if (!string.IsNullOrEmpty(entity.ProviderKey))
         {
            providerKeys.GetOrAdd(entity.ProviderKey, 0);
         }
      }

      private void AddChildData(IEntity parent, IEntity child)
      {
         personBuilders[parent.PersonId].AddChildData(parent, child);
      }

      private void AddEntity(QueryDefinition queryDefinition, IEnumerable<EntityDefinition> definitions,
                             IDataReader reader, Guid recordGuid)
      {
         if (definitions == null) return;

         foreach (var d in queryDefinition.FindDefinition(definitions, reader))
         {
            Concept conceptDef = null;
            if (d.Concepts != null && d.Concepts.Any())
               conceptDef = d.Concepts[0];

            if (this.Vocabulary == null)
               this.Vocabulary = d.Vocabulary;

            foreach (var entity in d.GetConcepts(conceptDef, reader, chunk.KeyMasterOffset))
            {
               if (entity == null) continue;

               entity.SourceRecordGuid = recordGuid;
               AddEntity(entity);

               if (entity is DrugExposure)
               {
                  if (queryDefinition.DrugCost != null)
                     AddChildData(entity, queryDefinition.DrugCost[0].CreateEnity((DrugExposure) entity, reader));
               }
               else if (entity is ProcedureOccurrence)
               {
                  if (queryDefinition.ProcedureCost != null)
                     AddChildData(entity,
                                  queryDefinition.ProcedureCost[0].CreateEnity((ProcedureOccurrence) entity, reader));
               }
            }
         }
      }

      public ChunkBuilder Load()
      {
         var timer = new Stopwatch();
         timer.Start();

         foreach (var queryDefinition in Settings.Current.Building.SourceQueryDefinitions)
         {
            if (queryDefinition.Providers != null) continue; 
            if (queryDefinition.Locations != null) continue;
            if (queryDefinition.CareSites != null) continue;

            using (var conn = SqlConnectionHelper.OpenConnection(Settings.Current.Building.SourceConnectionString))
             {
                 var queryFormat = queryDefinition.Query;
                 var query = string.Format(queryFormat, chunk.Id);


                 foreach (var q in query.Split(new[] {"go;"}, StringSplitOptions.RemoveEmptyEntries))
                 {
                     using (var c = new SqlCommand(q, conn))
                     {
                         c.CommandTimeout = 999999999;
                         using (var reader = c.ExecuteReader())
                         {
                             do
                             {
                                 while (reader.Read())
                                 {
                                     var recordGuid = Guid.NewGuid();

                                     AddEntity(queryDefinition, queryDefinition.Persons, reader, recordGuid);
                                     AddEntity(queryDefinition, queryDefinition.PayerPlanPeriods, reader, recordGuid);
                                     AddEntity(queryDefinition, queryDefinition.Death, reader, recordGuid);
                                     AddEntity(queryDefinition, queryDefinition.VisitOccurrence, reader, recordGuid);
                                     AddEntity(queryDefinition, queryDefinition.Observation, reader, recordGuid);
                                     AddEntity(queryDefinition, queryDefinition.ConditionOccurrence, reader, recordGuid);
                                     AddEntity(queryDefinition, queryDefinition.ProcedureOccurrence, reader, recordGuid);
                                     AddEntity(queryDefinition, queryDefinition.DrugExposure, reader, recordGuid);
                                     AddEntity(queryDefinition, queryDefinition.Cohort, reader, recordGuid);
                                 }
                             } while (reader.NextResult());
                         }
                     }
                 }
             }
         }

         timer.Stop();
         Logger.Write(chunk.Id, LogMessageTypes.Info, string.Format("Loaded - {0} ms", timer.ElapsedMilliseconds));
         Logger.Write(chunk.Id, LogMessageTypes.Info, string.Format("Loaded - {0} Mb", (GC.GetTotalMemory(false) / 1024f) / 1024f));

         return this;
      }

      public ChunkBuilder Build()
      {
         var timer = new Stopwatch();
         timer.Start();

         if (providerKeys.Count > 0)
         {
            var providerIds = VocabularyManager.GetProviderIds(providerKeys.Keys.ToArray());
            foreach (var keyValuePair in providerIds)
            {

               if (keyValuePair.Value != -1)
               {
                  providerKeys[keyValuePair.Key] = keyValuePair.Value;
               }
               else
                 Logger.Write(chunk.Id, LogMessageTypes.Warning,
                                      string.Format("ProviderIds does not contains key = '{0}'", keyValuePair.Key));
            }
         }

         var opt = new ParallelOptions {MaxDegreeOfParallelism = 1};
         Parallel.ForEach(personBuilders, opt, cd => cd.Value.Build());

         timer.Stop();
         Logger.Write(chunk.Id, LogMessageTypes.Info, string.Format("Built - {0} ms", timer.ElapsedMilliseconds));
         Logger.Write(chunk.Id, LogMessageTypes.Info, string.Format("Built - {0} Mb", (GC.GetTotalMemory(false) / 1024f) / 1024f));

         return this;
      }

      private void SaveData()
      {
         ISaver saver;

         if (Settings.Current.Building.SaveType == SaveType.Db)
         {
            saver = new DbSaver();
         }
         else
         {
            saver = new FileSaver();
         }

         using (saver)
         {
            saver.Create().Save(chunk);
         }
      }

      public Task Save()
      {
         return Task.Factory.StartNew(SaveData);
      }
      #endregion
   }
}
