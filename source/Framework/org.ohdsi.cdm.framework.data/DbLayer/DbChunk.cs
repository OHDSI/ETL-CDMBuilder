using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using org.ohdsi.cdm.framework.entities.Omop;
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

        public void AddSubChunk(int chunkId, int index, long minPersonId, long maxPersonId, int personCount)
        {
           const string query =
              "INSERT INTO SubChunk ([ChunkId],[Index],[MinPersonId],[MaxPersonId],[PersonCount]) VALUES (@chunkId,@index,@minPersonId,@maxPersonId,@personCount);";
           using (var connection = SqlConnectionHelper.OpenMSSQLConnection(connectionString))
           using (var cmd = new SqlCommand(query, connection) { CommandTimeout = 0 })
           {
              cmd.Parameters.Add("@chunkId", SqlDbType.Int);
              cmd.Parameters["@chunkId"].Value = chunkId;

              cmd.Parameters.Add("@index", SqlDbType.Int);
              cmd.Parameters["@index"].Value = index;

              cmd.Parameters.Add("@minPersonId", SqlDbType.BigInt);
              cmd.Parameters["@minPersonId"].Value = minPersonId;

              cmd.Parameters.Add("@maxPersonId", SqlDbType.BigInt);
              cmd.Parameters["@maxPersonId"].Value = maxPersonId;

              cmd.Parameters.Add("@personCount", SqlDbType.Int);
              cmd.Parameters["@personCount"].Value = personCount;

              cmd.ExecuteNonQuery();
           }
        }

        public int AddChunk(int buildingId)
        {
            const string query =
               "INSERT INTO Chunk (BuildingId) VALUES (@buildingId);Select Scope_Identity();";
            using (var connection = SqlConnectionHelper.OpenMSSQLConnection(connectionString))
            using (var cmd = new SqlCommand(query, connection) { CommandTimeout = 0 })
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

            using (var connection = SqlConnectionHelper.OpenMSSQLConnection(connectionString))
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

            using (var connection = SqlConnectionHelper.OpenMSSQLConnection(connectionString))
            using (var cmd = new SqlCommand(query, connection) { CommandTimeout = 0 })
            {
                return Convert.ToInt32(cmd.ExecuteScalar());
            }
        }

        public int GetChunksWithRunningQueriesCount(int buildingId)
        {
           var query =
                  string.Format(
                     "SELECT Count(*) FROM Chunk WHERE BuildingId = {0} AND Started is not null AND QueriesExecuted is NULL AND Failed is NULL",
                     buildingId);

           using (var connection = SqlConnectionHelper.OpenMSSQLConnection(connectionString))
           using (var cmd = new SqlCommand(query, connection) { CommandTimeout = 0 })
           {
              return Convert.ToInt32(cmd.ExecuteScalar());
           }
        }

        public void ResetNotFinishedChunks(int buildingId)
        {
            var query = string.Format("UPDATE [dbo].[Chunk] SET [Started] = NULL WHERE [Ended] is NULL and [BuildingId] = {0}", buildingId);
            using (var connection = SqlConnectionHelper.OpenMSSQLConnection(connectionString))
            using (var cmd = new SqlCommand(query, connection) { CommandTimeout = 0 })
            {
                cmd.ExecuteNonQuery();
            }
        }

        public void ResetChunks(int buildingId)
        {
            var query = string.Format("UPDATE [dbo].[Chunk] SET [Started] = NULL,  [Ended] = NULL, [QueriesExecuted] = NULL, [Loaded] = NULL, [Built] = NULL WHERE [BuildingId] = {0}", buildingId);
            using (var connection = SqlConnectionHelper.OpenMSSQLConnection(connectionString))
            using (var cmd = new SqlCommand(query, connection) { CommandTimeout = 0 })
            {
                cmd.ExecuteNonQuery();
            }

            query = string.Format("DELETE FROM [dbo].[AvailableOnS3] WHERE [BuildingId] = {0}", buildingId);
            using (var connection = SqlConnectionHelper.OpenMSSQLConnection(connectionString))
            using (var cmd = new SqlCommand(query, connection) { CommandTimeout = 0 })
            {
               cmd.ExecuteNonQuery();
            }

            //query = string.Format("DELETE FROM SubChunk where ChunkId in (SELECT Id FROM Chunk WHERE BuildingId =  {0})", buildingId);
            //using (var connection = SqlConnectionHelper.OpenMSSQLConnection(connectionString))
            //using (var cmd = new SqlCommand(query, connection) { CommandTimeout = 0 })
            //{
            //   cmd.ExecuteNonQuery();
            //}
        }

        public bool AllChunksStarted(int buildingId)
        {
            using (var connection = SqlConnectionHelper.OpenMSSQLConnection(connectionString))
            using (var transaction = connection.BeginTransaction())
            {
                var query =
                   string.Format(
                      "SELECT TOP 1 Id FROM Chunk WHERE BuildingId = {0} AND Started is null",
                      buildingId);
                using (var cmd = new SqlCommand(query, connection, transaction) { CommandTimeout = 0 })
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
            using (var connection = SqlConnectionHelper.OpenMSSQLConnection(connectionString))
            using (var transaction = connection.BeginTransaction())
            {
                var query =
                   string.Format(
                      "SELECT TOP 1 Id FROM Chunk WHERE BuildingId = {0} AND Ended is null",
                      buildingId);
                using (var cmd = new SqlCommand(query, connection, transaction) { CommandTimeout = 0 })
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

        public void ChunkFailed(int chunkId)
        {
            var query = string.Format("UPDATE Chunk SET Failed = '{1}' WHERE Id = {0}", chunkId, DateTime.Now);
            using (var connection = SqlConnectionHelper.OpenMSSQLConnection(connectionString))
            using (var cmd = new SqlCommand(query, connection) { CommandTimeout = 0 })
            {
                cmd.ExecuteNonQuery();
            }
        }

        public void ChunkComplete(int chunkId)
        {
           var query = string.Format("UPDATE Chunk SET Ended = '{1}' WHERE Id = {0}", chunkId, DateTime.Now);
           using (var connection = SqlConnectionHelper.OpenMSSQLConnection(connectionString))
           using (var cmd = new SqlCommand(query, connection) { CommandTimeout = 0 })
           {
              cmd.ExecuteNonQuery();
           }
        }

        public void ChunkQueriesExecuted(int chunkId)
        {
           var query = string.Format("UPDATE Chunk SET QueriesExecuted = '{1}' WHERE Id = {0}", chunkId, DateTime.Now);
           using (var connection = SqlConnectionHelper.OpenMSSQLConnection(connectionString))
           using (var cmd = new SqlCommand(query, connection) { CommandTimeout = 0 })
           {
              cmd.ExecuteNonQuery();
           }
        }

        public void ChunkLoaded(int chunkId)
        {
           var query = string.Format("UPDATE Chunk SET Loaded = '{1}' WHERE Id = {0}", chunkId, DateTime.Now);
           using (var connection = SqlConnectionHelper.OpenMSSQLConnection(connectionString))
           using (var cmd = new SqlCommand(query, connection) { CommandTimeout = 0 })
           {
              cmd.ExecuteNonQuery();
           }
        }

        public void ChunkBuilt(int chunkId)
        {
           var query = string.Format("UPDATE Chunk SET Built = '{1}' WHERE Id = {0}", chunkId, DateTime.Now);
           using (var connection = SqlConnectionHelper.OpenMSSQLConnection(connectionString))
           using (var cmd = new SqlCommand(query, connection) { CommandTimeout = 0 })
           {
              cmd.ExecuteNonQuery();
           }
        }


        public void UncompleteChunk(int chunkId)
        {
            var query = string.Format("UPDATE Chunk SET Ended = NULL WHERE Id = {0}", chunkId);
            using (var connection = SqlConnectionHelper.OpenMSSQLConnection(connectionString))
            using (var cmd = new SqlCommand(query, connection) { CommandTimeout = 0 })
            {
                cmd.ExecuteNonQuery();
            }
        }

        public void MarkUncompletedChunks(int buildingId, int builderId)
        {
           var query = string.Format("UPDATE Chunk SET Failed = '{2}' WHERE BuildingId = {0} AND BuilderId = {1} AND Started is not NULL and Ended is NULL", buildingId, builderId, DateTime.Now);
           using (var connection = SqlConnectionHelper.OpenMSSQLConnection(connectionString))
           using (var cmd = new SqlCommand(query, connection) { CommandTimeout = 0 })
           {
              cmd.ExecuteNonQuery();
           }
        }

        public IEnumerable<SubChunkRecord> GetSubChunks(int chunkId)
        {
           using (var connection = SqlConnectionHelper.OpenMSSQLConnection(connectionString))
           {
              var query = string.Format("SELECT [Index],[MinPersonId],[MaxPersonId],[PersonCount],[Saved] FROM [SubChunk] where [ChunkId] = {0}", chunkId);

              using (var cmd = new SqlCommand(query, connection) { CommandTimeout = 0 })
              {
                 using (var reader = cmd.ExecuteReader())
                 {
                    while (reader.Read())
                    {
                       yield return
                          new SubChunkRecord
                          {
                             ChunkId = chunkId,
                             Index = reader.GetInt("Index").Value,
                             MinPersonId = reader.GetLong("MinPersonId").Value,
                             MaxPersonId = reader.GetLong("MaxPersonId").Value,
                             Count = reader.GetInt("PersonCount").Value,
                             Saved = reader.GetString("Saved") == "1"
                          };
                    }
                 }
              }
           }
        }

        public int? TakeChunk(int buildingId, int builderId)
        {
            int? chunkId = null;
            using (var connection = SqlConnectionHelper.OpenMSSQLConnection(connectionString))
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
                    query = string.Format("UPDATE Chunk SET Started = '{1}', BuilderId = {2}  WHERE Id = {0}", chunkId,
                                          DateTime.Now, builderId);
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
            using (var connection = SqlConnectionHelper.OpenMSSQLConnection(connectionString))
            using (var cmd = new SqlCommand(query, connection) { CommandTimeout = 0 })
            {
                cmd.ExecuteNonQuery();
            }

            query = string.Format("DELETE FROM AvailableOnS3 WHERE BuildingId = {0} ", buildingId);
            using (var connection = SqlConnectionHelper.OpenMSSQLConnection(connectionString))
            using (var cmd = new SqlCommand(query, connection) { CommandTimeout = 0 })
            {
               cmd.ExecuteNonQuery();
            }
        }

        public Dictionary<int, int> SplitChunks(int buildingId, int size)
        {
            var result = new Dictionary<int, int>();
            string query = string.Format("SELECT Id, (ROW_NUMBER() OVER (ORDER BY Id)) / {1} as [Index] FROM Chunk where BuildingId = {0}", buildingId, size);
            using (var connection = SqlConnectionHelper.OpenMSSQLConnection(connectionString))
            using (var cmd = new SqlCommand(query, connection) { CommandTimeout = 0 })
            {
                using (var reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        result.Add(reader.GetInt("Id").Value, reader.GetInt("Index").Value);
                    }
                }
            }

            return result;
        }
    }
}
