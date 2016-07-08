using System;
using System.Data;
using System.Data.SqlClient;
using org.ohdsi.cdm.framework.shared.Extensions;
using org.ohdsi.cdm.framework.shared.Helpers;

namespace org.ohdsi.cdm.framework.data.DbLayer
{
   public class DbChunk
   {
      private readonly string connectionString;

      public DbChunk(string connectionString)
      {
         this.connectionString = connectionString;
      }

      public int AddChunk(int buildingId)
      {
         const string query =
            "INSERT INTO Chunk (BuildingId) VALUES (@buildingId);Select Scope_Identity();";
         using (var connection = SqlConnectionHelper.OpenConnection(connectionString))
         using (var cmd = new SqlCommand(query, connection) {CommandTimeout = 0})
         {
            cmd.Parameters.Add("@buildingId", SqlDbType.Int);
            cmd.Parameters["@buildingId"].Value = buildingId;
            return Convert.ToInt32(cmd.ExecuteScalar());
         }
      }

      public int GetChunksCount(int buildingId)
      {
         var query =
                string.Format(
                   "SELECT Count(*) FROM Chunk WHERE BuildingId = {0}",
                   buildingId);

         using (var connection = SqlConnectionHelper.OpenConnection(connectionString))
         using (var cmd = new SqlCommand(query, connection) { CommandTimeout = 0 })
         {
            return Convert.ToInt32(cmd.ExecuteScalar());
         }
      }

      public int GetCompleteChunksCount(int buildingId)
      {
         var query =
                string.Format(
                   "SELECT Count(*) FROM Chunk WHERE BuildingId = {0} AND Ended is not null",
                   buildingId);

         using (var connection = SqlConnectionHelper.OpenConnection(connectionString))
         using (var cmd = new SqlCommand(query, connection) { CommandTimeout = 0 })
         {
            return Convert.ToInt32(cmd.ExecuteScalar());
         }
      }

      public void ResetNotFinishedChunks(int buildingId)
      {
         var query = string.Format("UPDATE [dbo].[Chunk] SET [Started] = NULL WHERE [Ended] is NULL and [BuildingId] = {0}", buildingId);
         using (var connection = SqlConnectionHelper.OpenConnection(connectionString))
         using (var cmd = new SqlCommand(query, connection) { CommandTimeout = 0 })
         {
            cmd.ExecuteNonQuery();
         }
      }

      public void ResetChunks(int buildingId)
      {
         var query = string.Format("UPDATE [dbo].[Chunk] SET [Started] = NULL,  [Ended] = NULL  WHERE [BuildingId] = {0}", buildingId);
         using (var connection = SqlConnectionHelper.OpenConnection(connectionString))
         using (var cmd = new SqlCommand(query, connection) { CommandTimeout = 0 })
         {
            cmd.ExecuteNonQuery();
         }
      }

      public bool AllChunksStarted(int buildingId)
      {
         using (var connection = SqlConnectionHelper.OpenConnection(connectionString))
         using (var transaction = connection.BeginTransaction())
         {
            var query =
               string.Format(
                  "SELECT TOP 1 Id FROM Chunk WHERE BuildingId = {0} AND Started is null",
                  buildingId);
            using (var cmd = new SqlCommand(query, connection, transaction) {CommandTimeout = 0})
            {
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

      public bool AllChunksComplete(int buildingId)
      {
         using (var connection = SqlConnectionHelper.OpenConnection(connectionString))
         using (var transaction = connection.BeginTransaction())
         {
            var query =
               string.Format(
                  "SELECT TOP 1 Id FROM Chunk WHERE BuildingId = {0} AND Ended is null",
                  buildingId);
            using (var cmd = new SqlCommand(query, connection, transaction) {CommandTimeout = 0})
            {
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

      public void ChunkComplete(int chunkId)
      {
         var query = string.Format("UPDATE Chunk SET Ended = '{1}' WHERE Id = {0}", chunkId, DateTime.Now);
         using (var connection = SqlConnectionHelper.OpenConnection(connectionString))
         using (var cmd = new SqlCommand(query, connection) {CommandTimeout = 0})
         {
            cmd.ExecuteNonQuery();
         }
      }

      public int? TakeChunk(int buildingId)
      {
         int? chunkId = null;
         using (var connection = SqlConnectionHelper.OpenConnection(connectionString))
         using (var transaction = connection.BeginTransaction())
         {
            var query =
               string.Format("SELECT TOP 1 Id FROM Chunk with (updlock) WHERE BuildingId = {0} AND Started is null",
                             buildingId);
            using (var cmd = new SqlCommand(query, connection, transaction) { CommandTimeout = 0 })
            {
               using (var reader = cmd.ExecuteReader())
               {
                  while (reader.Read())
                  {
                     chunkId = reader.GetInt("Id").Value;
                  }
               }
            }

            if (chunkId.HasValue)
            {
               query = string.Format("UPDATE Chunk SET Started = '{1}'  WHERE Id = {0}", chunkId,
                                     DateTime.Now);
               using (var cmd = new SqlCommand(query, connection, transaction) { CommandTimeout = 0 })
               {
                  cmd.ExecuteNonQuery();
               }
            }
            transaction.Commit();
         }

         return chunkId;
      }

      public void ClearChunks(int buildingId)
      {
         var query = string.Format("DELETE FROM Chunk WHERE BuildingId = {0} ", buildingId);
         using (var connection = SqlConnectionHelper.OpenConnection(connectionString))
         using (var cmd = new SqlCommand(query, connection) {CommandTimeout = 0})
         {
            cmd.ExecuteNonQuery();
         }
      }
   }
}
