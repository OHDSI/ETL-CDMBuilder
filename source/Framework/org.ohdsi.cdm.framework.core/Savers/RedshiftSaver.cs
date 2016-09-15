using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Odbc;
using System.IO;
using System.Threading.Tasks;
using Amazon.S3;
using Amazon.S3.Util;
using org.ohdsi.cdm.framework.core.Common.Services;
using org.ohdsi.cdm.framework.core.Helpers;
using org.ohdsi.cdm.framework.entities.DataReaders;
using org.ohdsi.cdm.framework.entities.Omop;
using org.ohdsi.cdm.framework.shared.Helpers;

namespace org.ohdsi.cdm.framework.core.Savers
{
   public class RedshiftSaver : Saver
   {
      private AmazonS3Client currentClient;
      private string connectionString;


      public override ISaver Create(string connectionString)
      {
         currentClient = new AmazonS3Client(Settings.Current.AwsAccessKeyId, Settings.Current.AwsSecretAccessKey,
            Amazon.RegionEndpoint.USEast1);

         this.connectionString = connectionString;

         return this;
      }

      public override void Write(int? chunkId, int? subChunkId, IDataReader reader, string tableName)
      {
         var bucket = string.Format("{0}/{1}-{2}", Settings.Current.Bucket, Settings.Current.Building.Vendor,
          Settings.Current.Building.Id);
         var fileName = MoveToS3(currentClient, bucket, chunkId, subChunkId, reader, tableName);

         if (tableName.ToLower().StartsWith("_chunks") || !chunkId.HasValue)
         {
            var schemaName = Settings.Current.Building.DestinationSchemaName;

            if (tableName.ToLower().StartsWith("_chunks"))
            {
                schemaName = Settings.Current.Building.SourceSchemaName;
                tableName = "_chunks";
            }

            using (var currentConnection = SqlConnectionHelper.OpenOdbcConnection(connectionString))
            using (var currentTransaction = currentConnection.BeginTransaction())
            {
               CopyToRedshift(bucket, schemaName, tableName, fileName, currentConnection, currentTransaction);
               currentTransaction.Commit();
            }
         }
      }

      private static void CopyToRedshift(string bucket, string schemaName, string tableName, string fileName,
         OdbcConnection connection, OdbcTransaction transaction)
      {
         const string query = @"copy {0}.{1} from 's3://{2}/{3}' " +
                              @"credentials 'aws_access_key_id={4};aws_secret_access_key={5}' " +
                              @"IGNOREBLANKLINES " +
                              @"DELIMITER '\t' " +
                              @"NULL AS '\000' " +
                              @"csv quote as '`' " +
                              @"GZIP";

         using (
            var c =
               new OdbcCommand(
                  string.Format(query, schemaName, tableName, bucket, fileName, Settings.Current.AwsAccessKeyId,
                     Settings.Current.AwsSecretAccessKey), connection, transaction))
         {
            c.CommandTimeout = 999999999;
            c.ExecuteNonQuery();
         }
      }

      private static string MoveToS3(AmazonS3Client s3Client, string bucket, int? chunkId, int? subChunkId, IDataReader reader,
         string tableName)
      {
         var folder = tableName;
         string fileName;
         if (chunkId.HasValue)
         {
            var indexOfSet = ServicesManager.GetIndexOfSet(chunkId.Value);

            fileName = string.Format(@"{0}/{1}", indexOfSet, tableName + ".txt.gz." + chunkId + "." + subChunkId);
         }
         else
            fileName = string.Format(@"{0}", folder + ".txt.gz");

         if (!(AmazonS3Util.DoesS3BucketExist(s3Client, Settings.Current.Bucket)))
         {
            AmazonS3Helper.CreateBucket(s3Client, Settings.Current.Bucket);
         }
         
         AmazonS3Helper.CopyFile(s3Client, bucket, fileName, reader, tableName);
         return fileName;
      }

      public override void AddChunk(List<ChunkRecord> chunk, int index)
      {
          try
          {
              Write(null, null, new ChunkDataReader(chunk), "_chunks" + index);
          }
          catch (Exception e)
          {
              Logger.WriteError(e);
              Rollback();
          }
      }

      public void ClenupBucket()
      {
         var folder = string.Format("{0}-{1}", Settings.Current.Building.Vendor,
           Settings.Current.Building.Id);

         AmazonS3Helper.ClenupBucket(currentClient, folder);
      }

      public override void CopyVocabulary()
      {
         //create tables
         using (var connection = SqlConnectionHelper.OpenOdbcConnection(Settings.Current.Building.DestinationConnectionString))
         {
            var schemaName = Settings.Current.Building.DestinationSchemaName;
            var query = Settings.Current.CopyVocabularyScript;
            query = query.Replace("{sc}", schemaName);

            using (var c = new OdbcCommand(query, connection))
            {
               c.CommandTimeout = 0;
               c.ExecuteNonQuery();
            }
         }

         // Move data to S3 and then copy to Redshift
         var vocabQueriesPath = Path.Combine(new[] { Settings.Current.Builder.Folder, "Common", "Redshift", "v5", "Vocabulary" });
         Parallel.ForEach(Directory.GetFiles(vocabQueriesPath), filePath =>
         {
            var tableName = Path.GetFileNameWithoutExtension(filePath);

            using (var connection = SqlConnectionHelper.OpenOdbcConnection(Settings.Current.Building.VocabularyConnectionString))
            {
               var schemaName = Settings.Current.Building.VocabularySchemaName;
               var query = File.ReadAllText(filePath);
               query = query.Replace("{sc}", schemaName);

               using (var c = new OdbcCommand(query, connection))
               {
                  c.CommandTimeout = 0;
                  using (var reader = c.ExecuteReader())
                  {
                     Write(null, null, reader, tableName);
                  }
               }
            }
         });
      }

      public override void Commit()
      {
      }

      public override void Rollback()
      {
      }

      public override void Dispose()
      {
         currentClient.Dispose();
      }
   }
}
