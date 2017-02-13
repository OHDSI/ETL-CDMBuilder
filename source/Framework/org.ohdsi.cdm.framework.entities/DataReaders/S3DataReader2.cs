using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.IO.Compression;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Amazon.S3.Model;
using Amazon.S3;
using org.ohdsi.cdm.framework.shared.Helpers;

namespace org.ohdsi.cdm.framework.entities.DataReaders
{
   public class S3FileReader2 : IDataReader
   {
      private readonly IEnumerator<List<string[]>> enumerator;

      private readonly int chunkId;
      private readonly string bucket;
      private readonly string folder;
      private readonly string fileName;
      private readonly Dictionary<string, int> fieldHeaders;
      private readonly string awsAccessKeyId;
      private readonly string awsSecretAccessKey;
      private readonly string personIdFieldName;

      public S3FileReader2(string awsAccessKeyId,
         string awsSecretAccessKey, string bucket, string fileName, Dictionary<string, int> fieldHeaders, string personIdFieldName)
      {
         this.fileName = fileName;
         this.fieldHeaders = fieldHeaders;
         this.bucket = bucket;
         this.awsAccessKeyId = awsAccessKeyId;
         this.awsSecretAccessKey = awsSecretAccessKey;
         this.personIdFieldName = personIdFieldName;

         enumerator = GetEnumerator();
      }

      private IEnumerator<List<string[]>> GetEnumerator()
      {
         var getObjectRequest = new GetObjectRequest
         {
            BucketName = bucket,
            Key = fileName
         };

         var count = 0;
         var error = false;
         var complete = false;
         var attempt = 0;

         var config = new AmazonS3Config
         {
            Timeout = TimeSpan.FromMinutes(30),
            ReadWriteTimeout = TimeSpan.FromMinutes(30),
            RegionEndpoint = Amazon.RegionEndpoint.USEast1,
            ConnectionLimit = 256,
            MaxErrorRetry = 20,
            MaxIdleTime = 30 * 60 * 1000
         };

         while (!complete)
         {
            using (var client = new AmazonS3Client(awsAccessKeyId, awsSecretAccessKey, config))
            using (var getObjectResponse = client.GetObject(getObjectRequest))
            using (var responseStream = getObjectResponse.ResponseStream)
            using (var gzipStream = new GZipStream(responseStream, CompressionMode.Decompress))
            using (var reader = new StreamReader(gzipStream, Encoding.Default))
            {
               if (error)
               {
                  int rowCount = 0;
                  while (rowCount < count)
                  {
                     reader.ReadLine();
                     rowCount++;
                  }
                  error = false;
               }

               var spliter = new StringSplitter(this.fieldHeaders.Count);
               string currentPersonId = null;
               var result = new List<string[]>();
               while (true)
               {
                  string line = null;

                  try
                  {
                     line = reader.ReadLine();
                  }
                  catch (Exception e)
                  {
                     error = true;
                     attempt++;

                     if (attempt == 10)
                        throw;
                  }

                  if (!string.IsNullOrEmpty(line))
                  {
                     count++;
                     spliter.Split(line, '|');
                     var personId = spliter.Results[fieldHeaders[personIdFieldName]];

                     if (currentPersonId != null && personId != currentPersonId)
                     {
                        yield return result;
                        result = new List<string[]>();
                     }

                     currentPersonId = personId;
                     result.Add(spliter.Results);
                  }

                  if (line == null)
                  {
                     complete = !error;
                     break;
                  }
               }
            }
         }
      }

      public bool Read()
      {
         return enumerator.MoveNext();
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
      }

      public int FieldCount
      {
         get { return enumerator.Current.Count; }
      }

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

   public class S3DataReader2 : IDataReader
   {
      private readonly IEnumerator<IDataReader> enumerator;


      private readonly int chunkId;
      private readonly string bucket;
      private readonly string folder;
      private readonly string fileName;
      private readonly string awsAccessKeyId;
      private readonly string awsSecretAccessKey;
      private readonly string personIdFieldName;
      private readonly Dictionary<string, int> fieldHeaders;

      public S3DataReader2(string bucket, string folder, string awsAccessKeyId,
         string awsSecretAccessKey, int chunkId, string fileName, Dictionary<string, int> fieldHeaders, string personIdFieldName)
      {
         this.chunkId = chunkId;
         this.bucket = bucket;
         this.folder = folder;
         this.fileName = fileName;
         this.fieldHeaders = fieldHeaders;
         this.awsAccessKeyId = awsAccessKeyId;
         this.awsSecretAccessKey = awsSecretAccessKey;
         this.personIdFieldName = personIdFieldName;

         enumerator = GetEnumerator();
      }

      private IEnumerator<IDataReader> GetEnumerator()
      {
         var dictionary = new Dictionary<string, S3FileReader2>();
         foreach (var file in GetFiles())
         {
            dictionary.Add(file, new S3FileReader2(awsAccessKeyId, awsSecretAccessKey, bucket, file, fieldHeaders, personIdFieldName));
         }

         var keyPersonId = new ConcurrentDictionary<string, string>();
         Parallel.ForEach(dictionary.Keys, key =>
         {
            IDataReader reader = dictionary[key];
            if (reader.Read())
            {
               var personId = ((string[])reader[0])[fieldHeaders[personIdFieldName]];
               keyPersonId.TryAdd(key, personId);
            }
         });

         var finishedReaderCount = 0;

         while (finishedReaderCount < dictionary.Keys.Count)
         {
            var min = keyPersonId.Where(kvp => kvp.Value != null).OrderBy(kvp => kvp.Value).FirstOrDefault();
            IDataReader minReader = dictionary[min.Key];
            var currentPersonId = min.Value;

            while (currentPersonId == min.Value)
            {
               yield return minReader;

               if (minReader.Read())
               {
                  currentPersonId = ((string[])minReader[0])[fieldHeaders[personIdFieldName]];
                  keyPersonId[min.Key] = currentPersonId;
               }
               else
               {
                  keyPersonId[min.Key] = null;
                  finishedReaderCount++;
                  break;
               }
            }
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
            Prefix = string.Format("{0}/{1}/{2}", folder, chunkId, fileName)
         };

         var config = new AmazonS3Config
         {
            Timeout = TimeSpan.FromMinutes(30),
            ReadWriteTimeout = TimeSpan.FromMinutes(30),
            RegionEndpoint = Amazon.RegionEndpoint.USEast1,
            ConnectionLimit = 256,
            MaxErrorRetry = 20,
            MaxIdleTime = 30 * 60 * 1000
         };
         using (var client = new AmazonS3Client(awsAccessKeyId, awsSecretAccessKey, config))
         {
            ListObjectsV2Response response;
            do
            {
               response = client.ListObjectsV2(request);

               foreach (var entry in response.S3Objects)
               {
                  //1. entry.Size 20byte add filtraion
                  //2. split by subfolders
                  //3. restore point, store max subSaved person id
                  if (entry.Size > 20)
                     yield return entry.Key;
               }

               request.ContinuationToken = response.NextContinuationToken;
            } while (response.IsTruncated);
         }
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
      }

      public int FieldCount
      {
         get { return enumerator.Current.FieldCount; }
      }

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
