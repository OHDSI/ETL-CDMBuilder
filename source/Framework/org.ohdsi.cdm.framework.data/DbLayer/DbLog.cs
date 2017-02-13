using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using org.ohdsi.cdm.framework.shared.Enums;
using org.ohdsi.cdm.framework.shared.Helpers;

namespace org.ohdsi.cdm.framework.data.DbLayer
{
   public class DbLog
   {
      private readonly string connectionString;

      public DbLog(string connectionString)
      {
         this.connectionString = connectionString;
      }

      public IEnumerable<string> GetErrors(int buildingId)
      {
         const string query =
            "SELECT  'Builder: ' + b.Dsn + CHAR(13) + " +
            "'Time: ' + cast([Time] as nvarchar) + CHAR(13) + " +
            "'Error: ' + [Message] + CHAR(13) + CHAR(13) " +
            "FROM [dbo].[Log] l " +
            "join [dbo].[Builder] b on l.BuilderId = b.Id " +
            "where l.[BuildingId] = {0} and [Type] = 'Error' " +
            "order by time desc ";

         using (var connection = SqlConnectionHelper.OpenMSSQLConnection(connectionString))
         {
            using (var cmd = new SqlCommand(string.Format(query, buildingId), connection))
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

      public void Reset(int buildingId)
      {
         const string query =
            "delete [dbo].[Log] FROM [dbo].[Log] l " +
            "join [dbo].[Builder] b on l.BuilderId = b.Id " +
            "where l.[BuildingId] = {0} and l.[Type] = 'Error'";

         using (var connection = SqlConnectionHelper.OpenMSSQLConnection(connectionString))
         {
            using (var cmd = new SqlCommand(string.Format(query, buildingId), connection))
            {
               cmd.ExecuteNonQuery();
            }
         }
      }

      public void Add(int? builderId, int? buildingId, int? chunkId, LogMessageTypes type, string message)
      {
         const string query =
             "INSERT INTO [Log] ([ChunkId],[BuilderId],[BuildingId],[Type],[Time],[Message]) VALUES (@chunkId, @builderId, @buildingId, @type, @time, @message)";

         using (var connection = SqlConnectionHelper.OpenMSSQLConnection(connectionString))
         using (var cmd = new SqlCommand(query, connection) { CommandTimeout = 0 })
         {
            cmd.Parameters.Add("@chunkId", SqlDbType.Int);
            cmd.Parameters["@chunkId"].Value = chunkId.HasValue ? chunkId : (object)DBNull.Value;

            cmd.Parameters.Add("@builderId", SqlDbType.Int);
            cmd.Parameters["@builderId"].Value = builderId.HasValue ? builderId : (object)DBNull.Value;

            cmd.Parameters.Add("@buildingId", SqlDbType.Int);
            cmd.Parameters["@buildingId"].Value = buildingId.HasValue ? buildingId : (object)DBNull.Value;

            cmd.Parameters.Add("@type", SqlDbType.VarChar);
            cmd.Parameters["@type"].Value = type.ToString();

            cmd.Parameters.Add("@time", SqlDbType.DateTime);
            cmd.Parameters["@time"].Value = DateTime.Now;

            cmd.Parameters.Add("@message", SqlDbType.VarChar);
            cmd.Parameters["@message"].Value = message;

            cmd.ExecuteNonQuery();
         }
      }
   }
}
