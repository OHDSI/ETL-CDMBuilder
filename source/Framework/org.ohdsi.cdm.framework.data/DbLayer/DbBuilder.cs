using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using org.ohdsi.cdm.framework.shared.Enums;
using org.ohdsi.cdm.framework.shared.Extensions;
using org.ohdsi.cdm.framework.shared.Helpers;

namespace org.ohdsi.cdm.framework.data.DbLayer
{
   public class DbBuilder
   {
      private readonly string connectionString;

      public DbBuilder(string connectionString)
      {
         this.connectionString = connectionString;
      }

      public BuilderState GetState(int builderId)
      {
         const string query = "SELECT StateId FROM [Builder] WHERE Id = {0}";

         using (var connection = SqlConnectionHelper.OpenMSSQLConnection(connectionString))
         {
            using (var cmd = new SqlCommand(string.Format(query, builderId), connection))
            {
               using (var reader = cmd.ExecuteReader())
               {
                  while (reader.Read())
                  {
                     var stateId = reader.GetInt("StateId");
                     if (stateId != null) return (BuilderState)stateId.Value;
                  }

                  return BuilderState.Unknown;
               }
            }
         }
      }

      public void UpdateState(int builderId, BuilderState state)
      {
         const string query = "UPDATE [Builder] SET [StateId] = {1} WHERE Id = {0}";

         using (var connection = SqlConnectionHelper.OpenMSSQLConnection(connectionString))
         {
            using (var cmd = new SqlCommand(string.Format(query, builderId, (int)state), connection))
            {
               cmd.CommandTimeout = 30000;
               cmd.ExecuteNonQuery();
            }
         }
      }

      public IEnumerable<IDataReader> Load(string machineName, string version)
      {
         const string query = "SELECT [Id], [StateId] FROM [Builder] WHERE [DSN] = '{0}' AND [Version]  = '{1}'";

         using (var connection = SqlConnectionHelper.OpenMSSQLConnection(connectionString))
         {
            using (var cmd = new SqlCommand(string.Format(query, machineName, version), connection))
            {
               cmd.CommandTimeout = 30000;
               using (var reader = cmd.ExecuteReader())
               {
                  while (reader.Read())
                  {
                     yield return reader;
                  }
               }
            }
         }
      }

      public IEnumerable<string> GetOtherBuilderInfo(int builderId, int buildingId)
      {
         const string query = "SELECT [Dsn] + ' - ' + s.Name + CHAR(13) " +
                              "FROM [dbo].[Builder] b  " +
                              "join [dbo].[BuilderState] s on b.[StateId] = s.Id  " +
                              "where b.Id != {0} and BuildingId = {1} ";

         using (var connection = SqlConnectionHelper.OpenMSSQLConnection(connectionString))
         {
            using (var cmd = new SqlCommand(string.Format(query, builderId, buildingId), connection))
            {
               cmd.CommandTimeout = 30000;
               using (var reader = cmd.ExecuteReader())
               {
                  while (reader.Read())
                  {
                     yield return reader.GetString(0);
                  }
               }
            }
         }
      }

      public bool IsLead(int builderId, int buildingId)
      {
         const string query = "SELECT TOP 1 Id FROM [Builder] b WHERE Id != {0} and BuildingId = {1} and StateId = 2";

         using (var connection = SqlConnectionHelper.OpenMSSQLConnection(connectionString))
         {
            using (var cmd = new SqlCommand(string.Format(query, builderId, buildingId), connection))
            {
               cmd.CommandTimeout = 30000;
               using (var reader = cmd.ExecuteReader())
               {
                  while (reader.Read())
                  {
                     return false;
                  }
               }
            }
         }

         return true;
      }


      public IEnumerable<IDataReader> LoadSettings(string machineName, string version)
      {
         const string query =
            "SELECT [Id], [Folder], [MaxDegreeOfParallelism], [BatchSize], [BuildingId] FROM [Builder] WHERE [DSN] = '{0}' AND [Version]  = '{1}'";

         using (var connection = SqlConnectionHelper.OpenMSSQLConnection(connectionString))
         {
            using (var cmd = new SqlCommand(string.Format(query, machineName, version), connection))
            {
               cmd.CommandTimeout = 30000;
               using (var reader = cmd.ExecuteReader())
               {
                  while (reader.Read())
                  {
                      yield return reader;
                  }
               }
            }
         }
      }

      public void Remove(int builderId)
      {
         var query = "DELETE FROM [Builder] WHERE Id = " + builderId;
         using (var connection = SqlConnectionHelper.OpenMSSQLConnection(connectionString))
         {
            using (var cmd = new SqlCommand(query, connection))
            {
               cmd.CommandTimeout = 30000;
               cmd.ExecuteScalar();
            }
         }
      }

      public void Reset(int builderId)
      {
         var query = "UPDATE [dbo].[Builder] SET [BuildingId] = NULL WHERE Id = " + builderId;
         using (var connection = SqlConnectionHelper.OpenMSSQLConnection(connectionString))
         {
            using (var cmd = new SqlCommand(query, connection))
            {
               cmd.CommandTimeout = 30000;
               cmd.ExecuteScalar();
            }
         }
      }

      public int CreateSettings(string machineName, string folder, int maxDegreeOfParallelism, int batchSize, string version)
      {
         var query = "INSERT INTO [Builder] ([Dsn],[Folder],[MaxDegreeOfParallelism],[BatchSize], [Version]) VALUES ('{0}','{1}',{2},{3},'{4}');Select Scope_Identity();";
         query = string.Format(query, machineName, folder, maxDegreeOfParallelism, batchSize, version);
         using (var connection = SqlConnectionHelper.OpenMSSQLConnection(connectionString))
         {
            using (var cmd = new SqlCommand(query, connection))
            {
               cmd.CommandTimeout = 30000;
               return Convert.ToInt32(cmd.ExecuteScalar());
            }
         }
      }

      public void UpdateSettings(int builderId, string machineName, int buildingId, string folder, int maxDegreeOfParallelism, int batchSize, string version)
      {
         const string query = "UPDATE [dbo].[Builder] " +
                              "SET [Folder] = @folder " +
                              ",[MaxDegreeOfParallelism] = @maxDegreeOfParallelism " +
                              ",[BuildingId] = @buildingId " +
                              ",[BatchSize] = @batchSize " +
                              ",[Version] = @version " +
                              "WHERE [Id] = @builderId";

         using (var connection = SqlConnectionHelper.OpenMSSQLConnection(connectionString))
         {
            using (var cmd = new SqlCommand(query, connection))
            {
               cmd.Parameters.Add("@builderId", SqlDbType.Int);
               cmd.Parameters["@builderId"].Value = builderId;

               cmd.Parameters.Add("@dsn", SqlDbType.VarChar);
               cmd.Parameters["@dsn"].Value = machineName;

               cmd.Parameters.Add("@folder", SqlDbType.VarChar);
               cmd.Parameters["@folder"].Value = folder;

               cmd.Parameters.Add("@maxDegreeOfParallelism", SqlDbType.VarChar);
               cmd.Parameters["@maxDegreeOfParallelism"].Value = maxDegreeOfParallelism;

               cmd.Parameters.Add("@batchSize", SqlDbType.VarChar);
               cmd.Parameters["@batchSize"].Value = batchSize;

               cmd.Parameters.Add("@buildingId", SqlDbType.Int);
               cmd.Parameters["@buildingId"].Value = buildingId;

               cmd.Parameters.Add("@version", SqlDbType.VarChar);
               cmd.Parameters["@version"].Value = version;

               cmd.CommandTimeout = 30000;
               cmd.ExecuteScalar();
            }
         }
      }
   }
}
