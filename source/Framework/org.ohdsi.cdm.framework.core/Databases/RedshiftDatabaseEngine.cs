using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Odbc;
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

      public override IDataReader ReadChunkData(IDbConnection conn, IDbCommand cmd, QueryDefinition qd, int chunkId, string prefix)
      {
          var folder = string.Format("{0}/{1}/raw", Settings.Current.Building.Vendor,
             Settings.Current.Building.Id);

         
          return new S3DataReader(Settings.Current.Bucket, folder, Settings.Current.S3AwsAccessKeyId,
             Settings.Current.S3AwsSecretAccessKey, chunkId, qd.FileName, qd.FieldHeaders, prefix, (m) => Logger.Write(chunkId, LogMessageTypes.Debug, m));
      }
      
      public override IChunkBuilder GetChunkBuilder(int chunkId, Func<IPersonBuilder> createPersonBuilder)
      {
         return new RedshiftChunkBuilder(chunkId, createPersonBuilder);
      }
   }
}
