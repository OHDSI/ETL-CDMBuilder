using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Threading.Tasks;
using Amazon.S3;
using Amazon.S3.Model;
using org.ohdsi.cdm.framework.core.Common.Services;
using org.ohdsi.cdm.framework.data.DbLayer;
using org.ohdsi.cdm.framework.shared.Enums;

namespace org.ohdsi.cdm.framework.core.Base
{
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

         if (string.IsNullOrEmpty(fileName))
            fileName = Settings.Current.Building.SourceQueryDefinitions[0].FileName;

         using (var client = new AmazonS3Client(Settings.Current.S3AwsAccessKeyId, Settings.Current.S3AwsSecretAccessKey, Amazon.RegionEndpoint.USEast1))
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

                qd.FieldHeaders = new Dictionary<string, int>(StringComparer.OrdinalIgnoreCase);

                var metadataKey = string.Format("{0}/metadata/{1}", folder, qd.FileName + ".txt");

                using (var client = new AmazonS3Client(Settings.Current.S3AwsAccessKeyId, Settings.Current.S3AwsSecretAccessKey, Amazon.RegionEndpoint.USEast1))
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
                            qd.FieldHeaders.Add(fieldName, index);
                            index++;
                        }
                        catch (Exception)
                        {
                            throw new Exception("[RestoreMetadataFromS3] fieldName duplication: " + fieldName + " - " + qd.FileName);
                        }
                    }
                }
            });

            Parallel.ForEach(GetParts(), new ParallelOptions { MaxDegreeOfParallelism = 2 }, p =>
            //Parallel.ForEach(GetParts(), p =>
            {
               Logger.Write(chunkId, LogMessageTypes.Info, "load part="+ p);
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
                  part.Init();
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
