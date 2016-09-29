using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using org.ohdsi.cdm.framework.shared.Extensions;
using org.ohdsi.cdm.framework.shared.Helpers;

namespace org.ohdsi.cdm.framework.data.DbLayer
{
   public class DbAvailableOnS3
   {
      private readonly string connectionString;

      public DbAvailableOnS3(string connectionString)
      {
         this.connectionString = connectionString;
      }

      public void AddPreparedChunk(int buildingId, int setIndex, int chunkId)
      {
          var sql = string.Format("INSERT INTO AvailableOnS3 (BuildingId, SetIndex, ChunkId, Saved) VALUES ({0}, {1}, {2}, 0)", buildingId, setIndex, chunkId);
         using (var connection = SqlConnectionHelper.OpenMSSQLConnection(connectionString))
         using (var c = new SqlCommand(sql, connection) {CommandTimeout = 0})
         {
            c.ExecuteScalar();
         }
      }

      public int GetChunksCount(int buildingId, int setIndex)
      {
         var query =
            string.Format(
               "SELECT Count(*) FROM AvailableOnS3 WHERE BuildingId = {0} AND SetIndex = {1}",
               buildingId, setIndex);

         using (var connection = SqlConnectionHelper.OpenMSSQLConnection(connectionString))
         using (var cmd = new SqlCommand(query, connection) { CommandTimeout = 0 })
         {
            return Convert.ToInt32(cmd.ExecuteScalar());
         }
      }

      public int? GetCompletedSetIndex(int buildingId, int size)
      {
         var query = string.Format(
            "with a as ( " +
            "SELECT Id, (ROW_NUMBER() OVER (ORDER BY Id)) / {1} as [Index]  " +
            "FROM Chunk where BuildingId = {0} " +
            "), a1 as ( " +
            "select [Index], COUNT(*) cnt from a group by [Index] " +
            "), b as ( " +
            "SELECT SetIndex, COUNT(*) cnt FROM AvailableOnS3 " +
            "where BuildingId = {0} and Saved = 0 " +
            "GROUP BY BuildingId, SetIndex) " +
            "select top 1 [Index] from a1 " +
            "join b on b.SetIndex = a1.[Index] and b.cnt = a1.cnt", buildingId, size);
         
         int? index = null;
         using (var connection = SqlConnectionHelper.OpenMSSQLConnection(connectionString))
         {
            using (var cmd = new SqlCommand(query, connection) { CommandTimeout = 0 })
            {
               using (var reader = cmd.ExecuteReader())
               {
                  while (reader.Read())
                  {
                     index = reader.GetInt("Index").Value;
                  }
               }
            }
         }

         return index;
      }

      public void SetSaved(int buildingId, int setIndex)
      {
         var sql = string.Format("UPDATE AvailableOnS3 SET Saved = 1 WHERE BuildingId = {0} and SetIndex = {1}",
            buildingId, setIndex);
         using (var connection = SqlConnectionHelper.OpenMSSQLConnection(connectionString))
         using (var c = new SqlCommand(sql, connection) {CommandTimeout = 0})
         {
            c.ExecuteScalar();
         }
      }

      public IEnumerable<int> GetChunksId(int buildingId, int setIndex)
      {
         var query =
            string.Format(
               "SELECT ChunkId FROM AvailableOnS3 WHERE BuildingId = {0} AND SetIndex = {1}",
               buildingId, setIndex);

         using (var connection = SqlConnectionHelper.OpenMSSQLConnection(connectionString))
         {
            using (var cmd = new SqlCommand(query, connection) { CommandTimeout = 0 })
            {
               using (var reader = cmd.ExecuteReader())
               {
                  while (reader.Read())
                  {
                     yield return reader.GetInt("ChunkId").Value;
                  }
               }
            }
         }
      }
   }
}
