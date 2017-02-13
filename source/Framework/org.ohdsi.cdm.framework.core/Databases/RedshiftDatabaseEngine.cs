using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Odbc;
using System.IO;
using Amazon.S3;
using Amazon.S3.Model;
using org.ohdsi.cdm.framework.core.Base;
using org.ohdsi.cdm.framework.core.Definitions;
using org.ohdsi.cdm.framework.core.Savers;
using org.ohdsi.cdm.framework.entities.DataReaders;
using org.ohdsi.cdm.framework.shared.Enums;
using org.ohdsi.cdm.framework.shared.Helpers;

namespace org.ohdsi.cdm.framework.core.Databases
{
   public class RedshiftDatabaseEngine : DatabaseEngine
   {
      public RedshiftDatabaseEngine()
      {
         Database = Database.Redshift;
      }

      public override IEnumerable<string> GetAllTables()
      {
         const string query = "select distinct(tablename) from pg_table_def where schemaname = 'public'";

         using (var conn = SqlConnectionHelper.OpenOdbcConnection(Settings.Current.Building.SourceConnectionString))
         using (var c = new OdbcCommand(query, conn))
         using (var reader = c.ExecuteReader())
         {
            while (reader.Read())
            {
               yield return reader.GetString(0);
            }
         }
      }

      public override IEnumerable<string> GetAllColumns(string tableName)
      {
         var query = string.Format(@"select ""column"" from pg_table_def where tablename = '{0}'", tableName);

         using (var conn = SqlConnectionHelper.OpenOdbcConnection(Settings.Current.Building.SourceConnectionString))
         using (var c = new OdbcCommand(query, conn))
         using (var reader = c.ExecuteReader())
         {
            while (reader.Read())
            {
               yield return reader.GetString(0);
            }
         }
      }

      public override ISaver GetSaver()
      {
         return new RedshiftSaver();
      }

      public override IDbCommand GetCommand(string cmdText, IDbConnection connection)
      {
         return new OdbcCommand(cmdText, (OdbcConnection)connection);
      }

      //public override IDbConnection GetConnection(string odbcConnectionString)
      //{
      //   return new OdbcConnection();
      //}

      //public override IDataReader ReadChunkData(IDbConnection conn, IDbCommand cmd, QueryDefinition qd, int chunkId, string prefix)
      //{
      //    return cmd.ExecuteReader();
      //}

      public override IDataReader ReadChunkData(IDbConnection conn, IDbCommand cmd, QueryDefinition qd, int chunkId, string prefix)
      {
          var personIdFieldName = qd.GetPersonIdFieldName();
          var folder = string.Format("{0}/{1}/raw", Settings.Current.Building.Vendor,
             Settings.Current.Building.Id);

          //if (qd.FieldHeaders == null)
          //    RestoreMetadataFromS3(qd, folder);
         
          return new S3DataReader(Settings.Current.Bucket, folder, Settings.Current.AwsAccessKeyId,
             Settings.Current.AwsSecretAccessKey, chunkId, qd.FileName, qd.FieldHeaders, prefix, (m) => Logger.Write(chunkId, LogMessageTypes.Debug, m));
      }

      //public static void RestoreMetadataFromS3(QueryDefinition queryDefinition, string folder)
      //{
      //    queryDefinition.FieldHeaders = new Dictionary<string, int>();

      //    var metadataKey = string.Format("{0}/metadata/{1}", folder, queryDefinition.FileName + ".txt");

      //    using (var client = new AmazonS3Client(Settings.Current.AwsAccessKeyId, Settings.Current.AwsSecretAccessKey, Amazon.RegionEndpoint.USEast1))
      //    using (var stream = new MemoryStream())
      //    using (var sr = new StreamReader(stream))
      //    {
      //        var request = new GetObjectRequest { BucketName = Settings.Current.Bucket, Key = metadataKey };
      //        using (var response = client.GetObject(request))
      //        {
      //            response.ResponseStream.CopyTo(stream);
      //        }
      //        stream.Position = 0;

      //        var index = 0;
      //        foreach (var fieldName in sr.ReadLine().Split(new[] { ',' }, StringSplitOptions.RemoveEmptyEntries))
      //        {
      //            try
      //            {
      //                queryDefinition.FieldHeaders.Add(fieldName.ToLower(), index);
      //                index++;
      //            }
      //            catch (Exception)
      //            {
      //                throw new Exception("[RestoreMetadataFromS3] fieldName duplication: " + fieldName + " - " + queryDefinition.FileName);
      //            }
      //        }
      //    }
      //}

      public override IChunkBuilder GetChunkBuilder(int chunkId, Func<IPersonBuilder> createPersonBuilder, int subChunkSize)
      {
         return new ChunkBuilder2(chunkId, createPersonBuilder);
      }
   }
}
