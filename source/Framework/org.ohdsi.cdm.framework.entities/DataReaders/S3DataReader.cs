using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.IO.Compression;
using System.Text;
using System.Threading.Tasks;
using Amazon.S3.Model;
using Amazon.S3;
using org.ohdsi.cdm.framework.shared.Helpers;

namespace org.ohdsi.cdm.framework.entities.DataReaders
{
   public class S3DataReader : IDataReader
   {
      private readonly IEnumerator<string[]> enumerator;

      private readonly AmazonS3Client client;
      private readonly int chunkId;
      private readonly string bucket;
      private readonly string folder;
      private readonly string fileName;
      private readonly Dictionary<string, int> fieldHeaders;
      private readonly string prefix;
      private Action<string> log;

      public S3DataReader(string bucket, string folder, string awsAccessKeyId,
         string awsSecretAccessKey, int chunkId, string fileName, Dictionary<string, int> fieldHeaders, string prefix, Action<string> log)
      {
         this.chunkId = chunkId;
         this.bucket = bucket;
         this.folder = folder;
         this.fileName = fileName;
         this.fieldHeaders = fieldHeaders;
         this.prefix = prefix;
         this.log = log;

         var config = new AmazonS3Config
         {
             Timeout = TimeSpan.FromMinutes(60),
             ReadWriteTimeout = TimeSpan.FromMinutes(60),
             RegionEndpoint = Amazon.RegionEndpoint.USEast1,
             ConnectionLimit = 256,
             MaxErrorRetry = 20,
             MaxIdleTime = 60 * 60 * 1000
         };

         client = new AmazonS3Client(awsAccessKeyId, awsSecretAccessKey, config);

         enumerator = GetEnumerator();
      }
      
      private IEnumerator<string[]> GetEnumerator()
      {
         foreach (var file in GetFiles())
         {
            var getObjectRequest = new GetObjectRequest
            {
               BucketName = bucket,
               Key = file
            };

            var lines = new BlockingCollection<string>();

            var stage1 = Task.Run(() =>
            {
               try
               {
                  using (var getObjectResponse = client.GetObject(getObjectRequest))
                  using (var responseStream = getObjectResponse.ResponseStream)
                  using (var bufferedStream = new BufferedStream(responseStream))
                  using (var gzipStream = new GZipStream(bufferedStream, CompressionMode.Decompress))
                  using (var reader = new StreamReader(gzipStream, Encoding.Default))
                  {
                     string line;

                     while ((line = reader.ReadLine()) != null)
                     {
                        lines.Add(line);
                     }
                  }

               }
               finally
               {
                  lines.CompleteAdding();
               }
            });

            var spliter = new StringSplitter(this.fieldHeaders.Count);
            foreach (var line in lines.GetConsumingEnumerable())
            {
               if (!string.IsNullOrEmpty(line))
               {
                  try
                  {
                     spliter.Split(line, '\t');
                  }
                  catch (Exception)
                  {
                     log("Split error, file name - " + file);
                     log("Split error, error line - " + line);
                     log("Split error, headers - " + string.Join(",", this.fieldHeaders));
                     throw;
                  }
                  
                  yield return spliter.Results;
               }
            }

            Task.WaitAll(stage1);
         }
      }


      public bool Read()
      {
         return enumerator.MoveNext();
      }

      private IEnumerable<string> GetFiles()
      {
          var request = new ListObjectsV2Request
          {
              BucketName = bucket,
              Prefix = string.Format("{0}/{1}/{2}/{3}", folder, chunkId, fileName, fileName + prefix)
          };

         ListObjectsV2Response response;
         do
         {
            response = client.ListObjectsV2(request);

            foreach (var entry in response.S3Objects)
            {
               //1. entry.Size 20byte add filtraion
               //2. split by subfolders
               //3. restore point, store max subSaved person id
               if(entry.Size > 20)
                  yield return entry.Key;
            }

            request.ContinuationToken = response.NextContinuationToken;
         } while (response.IsTruncated);
      }

      

      object IDataRecord.this[int i]
      {
         get
         {
            return enumerator.Current == null ? null : enumerator.Current[i];
         }
      }

      object IDataRecord.this[string name]
      {
         get
         {
            return enumerator.Current == null ? null : enumerator.Current[fieldHeaders[name.ToLower()]];
         }
      }

      public void Close()
      {
      }

      public void Dispose()
      {
         client.Dispose();
      }

      public int FieldCount { get; private set; }

      #region NotImplemented
      public string GetName(int i)
      {
         throw new NotImplementedException();
      }

      public string GetDataTypeName(int i)
      {
         throw new NotImplementedException();
      }

      public Type GetFieldType(int i)
      {
         throw new NotImplementedException();
      }

      public object GetValue(int i)
      {
         throw new NotImplementedException();
      }

      public int GetValues(object[] values)
      {
         throw new NotImplementedException();
      }

      public int GetOrdinal(string name)
      {
         throw new NotImplementedException();
      }

      public bool GetBoolean(int i)
      {
         throw new NotImplementedException();
      }

      public byte GetByte(int i)
      {
         throw new NotImplementedException();
      }

      public long GetBytes(int i, long fieldOffset, byte[] buffer, int bufferoffset, int length)
      {
         throw new NotImplementedException();
      }

      public char GetChar(int i)
      {
         throw new NotImplementedException();
      }

      public long GetChars(int i, long fieldoffset, char[] buffer, int bufferoffset, int length)
      {
         throw new NotImplementedException();
      }

      public Guid GetGuid(int i)
      {
         throw new NotImplementedException();
      }

      public short GetInt16(int i)
      {
         throw new NotImplementedException();
      }

      public int GetInt32(int i)
      {
         throw new NotImplementedException();
      }

      public long GetInt64(int i)
      {
         throw new NotImplementedException();
      }

      public float GetFloat(int i)
      {
         throw new NotImplementedException();
      }

      public double GetDouble(int i)
      {
         throw new NotImplementedException();
      }

      public string GetString(int i)
      {
         throw new NotImplementedException();
      }

      public decimal GetDecimal(int i)
      {
         throw new NotImplementedException();
      }

      public DateTime GetDateTime(int i)
      {
         throw new NotImplementedException();
      }

      public IDataReader GetData(int i)
      {
         throw new NotImplementedException();
      }

      public bool IsDBNull(int i)
      {
         throw new NotImplementedException();
      }
      
      public DataTable GetSchemaTable()
      {
         throw new NotImplementedException();
      }

      public bool NextResult()
      {
         throw new NotImplementedException();
      }

      public int Depth { get; private set; }
      public bool IsClosed { get; private set; }
      public int RecordsAffected { get; private set; }
      #endregion
   }
}
