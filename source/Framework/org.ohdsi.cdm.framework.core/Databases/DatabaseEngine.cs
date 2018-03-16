using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Odbc;
using org.ohdsi.cdm.framework.core.Base;
using org.ohdsi.cdm.framework.core.Definitions;
using org.ohdsi.cdm.framework.core.Savers;
using org.ohdsi.cdm.framework.shared.Enums;
using org.ohdsi.cdm.framework.shared.Helpers;

namespace org.ohdsi.cdm.framework.core.Databases
{
   public class DatabaseEngine : IDatabaseEngine
   {
      public Database Database { get; protected set; }

      public virtual IEnumerable<string> GetAllTables()
      {
         throw new NotImplementedException();
      }

      public virtual IEnumerable<string> GetAllColumns(string tableName)
      {
         throw new NotImplementedException();
      }

      public virtual ISaver GetSaver()
      {
         throw new NotImplementedException();
      }
      
      public virtual string GetSql(string tableName, IEnumerable<string> columns, int chunkId, string personIdFieldName)
      {
         return string.Format("select {0} from {1} JOIN _chunks ch ON ch.ChunkId = {2} AND {3} = ch.PERSON_ID", string.Join(",", columns), tableName, chunkId, personIdFieldName);
      }

      public virtual IDbConnection GetConnection(string odbcConnectionString)
      {
         return SqlConnectionHelper.OpenConnection(odbcConnectionString, Database);
      }

      public virtual IDbCommand GetCommand(string cmdText, IDbConnection connection)
      {
         throw new NotImplementedException();
      }

      public virtual IDataReader ReadChunkData(IDbConnection conn, IDbCommand cmd, QueryDefinition qd, int chunkId, string prefix)
      {
         throw new NotImplementedException();
      }

      public virtual IChunkBuilder GetChunkBuilder(int chunkId, Func<IPersonBuilder> createPersonBuilder)
      {
         return new ChunkBuilder(chunkId, createPersonBuilder);
      }

      public static IDatabaseEngine GetEngine(OdbcConnection cn)
      {
         switch (GetDbType(cn))
         {
            case Database.MSSQL:
               return new MSSQLDatabaseEngine();

            case Database.Redshift:
               return new RedshiftDatabaseEngine();

            default:
               throw new Exception("Unsupported database engine");
         }
      }

      public static IDatabaseEngine GetEngine(string connectionString)
      {
         if(connectionString.ToLower().Contains("amazon redshift"))
            return new RedshiftDatabaseEngine();
         
               return new MSSQLDatabaseEngine();
      }

      public static Database GetDbType(string connectionString)
      {
         return connectionString.ToLower().Contains("amazon redshift") ? Database.Redshift : Database.MSSQL;
      }

      public static Database GetDbType(OdbcConnection cn)
      {
         var t = Database.Unsupported;
         try
         {
            if (cn.State != ConnectionState.Open) 
               cn.Open();


            var cmd = cn.CreateCommand();
            var outstring = "";
            cmd.CommandText = "SELECT * FROM v$version";
            try
            {
               var reader = cmd.ExecuteReader();
               if (reader.HasRows)
               {
                  reader.Read();
                  outstring = String.Format("{0}", reader.GetString(0));

               }
            }
            catch (Exception)
            {
               cmd = cn.CreateCommand();
               cmd.CommandText = "SELECT @@version, @@version_comment FROM dual";
               try
               {
                  var reader = cmd.ExecuteReader();
                  if (reader.HasRows)
                  {
                     reader.Read();
                     outstring = String.Format("{0} {1}", reader.GetString(0), reader.GetString(1));

                  }
               }
               catch (Exception)
               {
                  cmd = cn.CreateCommand();
                  cmd.CommandText = "SELECT @@version";
                  try
                  {
                     var reader = cmd.ExecuteReader();
                     if (reader.HasRows)
                     {
                        reader.Read();
                        outstring = String.Format("{0}", reader.GetString(0));

                     }
                  }
                  catch (Exception)
                  {
                     cmd = cn.CreateCommand();
                     cmd.CommandText = "SELECT version()";
                     try
                     {
                        var reader = cmd.ExecuteReader();
                        if (reader.HasRows)
                        {
                           reader.Read();
                           outstring = String.Format("{0}", reader.GetString(0));

                        }
                     }
                     catch (Exception)
                     {
                     }
                  }
               }
            }

            outstring = outstring.ToUpper();

            if (outstring.Contains("SQL SERVER"))
            {
               t = Database.MSSQL;
            }
            else if (outstring.Contains("REDSHIFT"))
            {
               t = Database.Redshift;
            }
         }
         catch (Exception e)
         {

         }
         return t;

      }
   }
}
