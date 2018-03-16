using System;
using System.Data;
using System.Diagnostics;
using System.IO;
using System.IO.Compression;
using System.Linq;
using System.Text;
using Amazon.S3;
using Amazon.S3.Model;
using Amazon.S3.Transfer;
using CsvHelper;

namespace org.ohdsi.cdm.framework.core.Helpers
{
    class AmazonS3Helper
    {
        public static void CopyFile(IAmazonS3 client, string bucketName, string filePath)
        {
            var directoryTransferUtility = new TransferUtility(client);
            directoryTransferUtility.Upload(new TransferUtilityUploadRequest
            {
                BucketName = bucketName,
                FilePath = filePath,
                ServerSideEncryptionMethod = ServerSideEncryptionMethod.AES256,
                StorageClass = S3StorageClass.ReducedRedundancy
            });
        }

        public static void CopyFile(IAmazonS3 client, string bucketName, string fileName, IDataReader reader, string tableName)
        {
           int fileIndex = 0;
           var fileEnded = false;

           while (!fileEnded)
           {
              var name = fileName + "." + fileIndex;
              fileEnded = SaveFilePart(client, bucketName, name, reader);
              fileIndex++;
           }
        }

       private static bool SaveFilePart(IAmazonS3 client, string bucketName, string fileName, IDataReader reader)
       {
          var rowNumbers = 0;
          const int rowLimit = 10*1000*1000;
          var ended = false;

          using (var source = new MemoryStream())
          using (TextWriter writer = new StreamWriter(source, new UTF8Encoding(false, true)))
          using (
             var csv = new CsvWriter(writer,
                new CsvHelper.Configuration.Configuration
                {
                   HasHeaderRecord = false,
                   Delimiter = "\t",
                   Quote = '`',
                   Encoding = Encoding.UTF8
                }))
          {
             while (rowNumbers < rowLimit)
             {
                ended = !reader.Read();

                if (ended)
                   break;

                for (var i = 0; i < reader.FieldCount; i++)
                {
                   var type = reader.GetFieldType(i);
                   var value = reader.GetValue(i);
                   if (type == typeof (DateTime) && value != null)
                   {
                      csv.WriteField(((DateTime) value).ToString("yyyy-MM-dd"));
                   }
                   else if (type == typeof (string) && (value == null || value is DBNull))
                   {
                      csv.WriteField('\0');
                   }
                   else
                   {
                      csv.WriteField(value ?? string.Empty);
                   }
                }
                csv.NextRecord();
                rowNumbers++;
             }
             writer.Flush();

             using (var gz = Compress(source))
             using (var directoryTransferUtility = new TransferUtility(client))
             {
                directoryTransferUtility.Upload(new TransferUtilityUploadRequest
                {
                   BucketName = bucketName,
                   Key = fileName,
                   ServerSideEncryptionMethod = ServerSideEncryptionMethod.AES256,
                   StorageClass = S3StorageClass.ReducedRedundancy,
                   InputStream = gz
                });
             }
          }

          return ended;
       }

       public static MemoryStream Compress(Stream inputStream)
        {
            var timer = new Stopwatch();
            timer.Start();
            inputStream.Position = 0;
            var outputStream = new MemoryStream();
            using (var gz = new GZipStream(outputStream, CompressionLevel.Fastest, true))
            {
                inputStream.CopyTo(gz);
            }
            outputStream.Position = 0;
            timer.Stop();
            return outputStream;
        }

        public static bool IsKeyExists(AmazonS3Client client, string bucket, string key)
        {
            var request = new ListObjectsRequest { BucketName = bucket, Prefix = key };
            var response = client.ListObjects(request);
            return response.S3Objects.Any(o => o.Key == key);
        }

        public static void CreateBucket(IAmazonS3 client, string bucketName)
        {
            client.PutBucket(new PutBucketRequest
            {
                BucketName = bucketName,
                UseClientRegion = true
            });
        }

        public static void DeleteBucket(IAmazonS3 client, string bucketName)
        {
            client.DeleteBucket(new DeleteBucketRequest
            {
                BucketName = bucketName
            });
        }

        public static void ClenupBucket(IAmazonS3 client, string folderName)
        {
           try
           {
              var deleteObjectsRequest = new DeleteObjectsRequest();
              var listObjectsRequest = new ListObjectsRequest
              {
                 BucketName = Settings.Current.Bucket,
                 Prefix = folderName
              };

              var response = client.ListObjects(listObjectsRequest);
              var containsObjectsToDelete = false;
              if (response.S3Objects.Count > 0)
              {
                 foreach (var entry in response.S3Objects)
                 {
                    if (string.IsNullOrEmpty(entry.Key)) continue;
                    // remove only chunk data
                    if (!entry.Key.Contains("sets"))
                       continue;

                    containsObjectsToDelete = true;
                    deleteObjectsRequest.AddKey(entry.Key);
                 }

                 if (containsObjectsToDelete)
                 {
                     deleteObjectsRequest.BucketName = Settings.Current.Bucket;
                     client.DeleteObjects(deleteObjectsRequest);
                 }
              }
           }
           catch (AmazonS3Exception ex)
           {
              //status wasn't not found, so throw the exception
              if (ex.StatusCode != System.Net.HttpStatusCode.NotFound) throw;
           }
        }

        public static void CreateFolder(IAmazonS3 client, string bucket, string folder)
        {
            client.PutObject(new PutObjectRequest { BucketName = bucket, Key = string.Format(@"{0}/", folder), InputStream = new MemoryStream() });
        }

        public static void DeleteFile(IAmazonS3 client, string bucketName, string fileName)
        {
            client.DeleteObject(new DeleteObjectRequest
            {
                BucketName = bucketName,
                Key = fileName
            });
        }

        public static void DeleteFolder(IAmazonS3 client, string bucketName, string folder)
        {
            DeleteFile(client, bucketName, string.Format(@"{0}/", folder));
        }
    }
}
