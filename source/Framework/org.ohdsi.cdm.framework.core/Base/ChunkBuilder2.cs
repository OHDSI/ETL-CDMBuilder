using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using Amazon.S3;
using Amazon.S3.Model;
using org.ohdsi.cdm.framework.core.Common.Services;
using org.ohdsi.cdm.framework.core.Definitions;
using org.ohdsi.cdm.framework.data.DbLayer;
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
      //private readonly PerformanceCounter networkBytesSent;
      //private readonly PerformanceCounter networkBytesReceived;
      private readonly PerformanceCounter cpuCounter;
      private readonly PerformanceCounter ramCounter;

      public ChunkPart(int chunkId, Func<IPersonBuilder> createPersonBuilder, string prefix)
      {
         this.chunkId = chunkId;
         this.createPersonBuilder = createPersonBuilder;
         this.prefix = prefix;
         this.personBuilders = new ConcurrentDictionary<long, Lazy<IPersonBuilder>>();
         this.chunk = new ChunkData(chunkId, int.Parse(prefix), 0, 0, 0, false);

         //const string cn = "get connection string from WMI";
         //networkBytesSent = new PerformanceCounter("Network Interface", "Bytes Sent/sec", cn);
         //networkBytesReceived = new PerformanceCounter("Network Interface", "Bytes Received/sec", cn);

         cpuCounter = new PerformanceCounter("Processor", "% Processor Time", "_Total");
         ramCounter = new PerformanceCounter("Memory", "Available MBytes");
      }


      private void LogResourceUsage()
      {
         //Logger.Write(chunkId, LogMessageTypes.Info,
         //   string.Format("CPU: {0}% | RAM Available: {1}Mb | Sent: {2}Bytes Sent/sec | Received: {3}Bytes Received/sec",
         //      cpuCounter.NextValue(), ramCounter.NextValue(), networkBytesSent.NextValue(), networkBytesReceived.NextValue()));

         Logger.Write(chunkId, LogMessageTypes.Info,
            string.Format("CPU: {0}% | RAM Available: {1}Mb", cpuCounter.NextValue(), ramCounter.NextValue()));
      }

      public void Load()
      {
         var timer = new Stopwatch();
         timer.Start();

         Parallel.ForEach(Settings.Current.Building.SourceQueryDefinitions, new ParallelOptions { MaxDegreeOfParallelism = 3 }, qd =>
         {
            if (qd.Providers != null) return;
            if (qd.Locations != null) return;
            if (qd.CareSites != null) return;

            var sql = qd.GetSql(Settings.Current.Building.SourceEngine.Database,
               Settings.Current.Building.Vendor, Settings.Current.Building.SourceSchemaName);

            if (string.IsNullOrEmpty(sql)) return;

            using (var reader = Settings.Current.Building.SourceEngine.ReadChunkData(null, null, qd, chunkId, prefix))
            {
               PopulateData(qd, reader);
            }

         });
         timer.Stop();

         Logger.Write(chunkId, LogMessageTypes.Info,
                  string.Format(prefix + ") loaded - {0} ms | {1} Mb", timer.ElapsedMilliseconds,
                     (GC.GetTotalMemory(false) / 1024f) / 1024f));

         //Logger.Write(chunkId, LogMessageTypes.Info,
         //   "loaded subChunkId=" + prefix + " | " + timer.ElapsedMilliseconds +
         //   " ms");

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
         var providerKeys = new Dictionary<string, long>();

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
         if (chunk.Persons.Count == 0)
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
            "saved to S3 subChunkId=" + prefix + " | " + chunk.Persons.Count + " | " + timer.ElapsedMilliseconds +
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

   public class ChunkBuilder2 : IChunkBuilder
   {
      #region Variables

      private IVocabularyService vocabularyService;
      private readonly int chunkId;
      private readonly Func<IPersonBuilder> createPersonBuilder;

      #endregion
    
      #region Constructors

      public ChunkBuilder2(int chunkId, Func<IPersonBuilder> createPersonBuilder)
      {
         this.chunkId = chunkId;
         this.createPersonBuilder = createPersonBuilder;
      }
      #endregion

      #region Methods
      
    
      private IEnumerable<string> GetParts()
      {
         var folder = string.Format("{0}/{1}/raw", Settings.Current.Building.Vendor,
           Settings.Current.Building.Id);

         var fileName = string.Empty;
         
         foreach (var qd in Settings.Current.Building.SourceQueryDefinitions)
         {
            var sql = qd.GetSql(Settings.Current.Building.SourceEngine.Database,
               Settings.Current.Building.Vendor, Settings.Current.Building.SourceSchemaName);
            if (qd.Persons == null) continue;
            if (string.IsNullOrEmpty(sql)) continue;

            fileName = qd.FileName;
            break;
         }

         using (var client = new AmazonS3Client(Settings.Current.AwsAccessKeyId, Settings.Current.AwsSecretAccessKey, Amazon.RegionEndpoint.USEast1))
         {
            var request = new ListObjectsV2Request
            {
               BucketName = Settings.Current.Bucket,
               Prefix = string.Format("{0}/{1}/{2}/{3}", folder, chunkId, fileName, fileName)
            };

            ListObjectsV2Response response;
            do
            {
               response = client.ListObjectsV2(request);

               var partIndexes = new HashSet<string>();
               
               var fn = fileName;
               foreach (var entry in response.S3Objects)
               {
                  var end = entry.Key.LastIndexOf(fn, StringComparison.InvariantCultureIgnoreCase) + fn.Length;
                  var key = entry.Key.Replace(entry.Key.Substring(0, end), "");
                  key = key.Substring(0, key.IndexOf('_'));
                  partIndexes.Add(key);
               }
               
               foreach (var partIndex in partIndexes)
               {
                  yield return partIndex;
               }

               request.ContinuationToken = response.NextContinuationToken;
            } while (response.IsTruncated);
         }
      }


      public void Process()
      {
         try
         {
            var channelFactory = ServicesManager.GetChannelFactory<IVocabularyService>("net.pipe://localhost/VocabularyServiceEndpoint");
            vocabularyService = channelFactory.CreateChannel();

            var dbChunk = new DbChunk(Settings.Current.Building.BuilderConnectionString);
            var timer = new Stopwatch();
            timer.Start();

            var folder = string.Format("{0}/{1}/raw", Settings.Current.Building.Vendor,
           Settings.Current.Building.Id);

            Parallel.ForEach(Settings.Current.Building.SourceQueryDefinitions, qd =>
            {
                if (qd.Providers != null) return;
                if (qd.Locations != null) return;
                if (qd.CareSites != null) return;

                var sql = qd.GetSql(Settings.Current.Building.SourceEngine.Database,
                   Settings.Current.Building.Vendor, Settings.Current.Building.SourceSchemaName);

                if (string.IsNullOrEmpty(sql)) return;

                qd.FieldHeaders = new Dictionary<string, int>();

                var metadataKey = string.Format("{0}/metadata/{1}", folder, qd.FileName + ".txt");

                using (var client = new AmazonS3Client(Settings.Current.AwsAccessKeyId, Settings.Current.AwsSecretAccessKey, Amazon.RegionEndpoint.USEast1))
                using (var stream = new MemoryStream())
                using (var sr = new StreamReader(stream))
                {
                    var request = new GetObjectRequest { BucketName = Settings.Current.Bucket, Key = metadataKey };
                    using (var response = client.GetObject(request))
                    {
                        response.ResponseStream.CopyTo(stream);
                    }
                    stream.Position = 0;

                    var index = 0;
                    foreach (var fieldName in sr.ReadLine().Split(new[] { ',' }, StringSplitOptions.RemoveEmptyEntries))
                    {
                        try
                        {
                            qd.FieldHeaders.Add(fieldName.ToLower(), index);
                            index++;
                        }
                        catch (Exception)
                        {
                            throw new Exception("[RestoreMetadataFromS3] fieldName duplication: " + fieldName + " - " + qd.FileName);
                        }
                    }
                }
            });

            Parallel.ForEach(GetParts(), new ParallelOptions { MaxDegreeOfParallelism = 1 }, p =>
            //Parallel.ForEach(GetParts(), p =>
            {
                var part = new ChunkPart(chunkId, createPersonBuilder, p);

               LoadPart(part, p);
               
               part.Build(vocabularyService);

               SavePart(part, p);
            });
           
            dbChunk.ChunkLoaded(chunkId);

            Logger.Write(chunkId, LogMessageTypes.Info, string.Format("Loaded - {0} ms | {1} Mb", timer.ElapsedMilliseconds, (GC.GetTotalMemory(false) / 1024f) / 1024f));
            
            if (Settings.Current.Building.DestinationEngine.Database == Database.Redshift)
            {
               ServicesManager.AddToSaveQueue(chunkId);
               Logger.Write(null, LogMessageTypes.Debug, "AddToSaveQueue " + chunkId);
            }
            else
            {
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

      private void LoadPart(ChunkPart part, string p)
      {
         var loadAttempt = 0;
         var loaded = false;
         while (!loaded)
         {
            try
            {
               loadAttempt++;
               part.Load();
               loaded = true;
              
            }
            catch (Exception ex)
            {
               if (loadAttempt <= 11)
               {
                  Logger.Write(chunkId, LogMessageTypes.Warning,
                     p + ") load attempt=" + loadAttempt + ") " + Logger.CreateExceptionString(ex));
                  part = new ChunkPart(chunkId, createPersonBuilder, p);
               }
               else
               {
                  throw;
               }
            }
         }
      }

      private void SavePart(ChunkPart part, string p)
      {
         

         var saveAttempt = 0;
         var saved = false;
         while (!saved)
         {
            try
            {
               saveAttempt++;
               part.Save();
               saved = true;
            }
            catch (Exception ex)
            {
               if (saveAttempt <= 11)
               {
                  Logger.Write(chunkId, LogMessageTypes.Warning,
                     p + ") save attempt=" + saveAttempt + ") " + Logger.CreateExceptionString(ex));
               }
               else
               {
                  throw;
               }
            }
         }

         part.Clean();
      }

      #endregion
   }
}
