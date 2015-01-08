using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using org.ohdsi.cdm.framework.shared.Enums;
using org.ohdsi.cdm.framework.shared.Extensions;
using org.ohdsi.cdm.framework.shared.Helpers;

namespace org.ohdsi.cdm.framework.data.DbLayer
{
   public class DbBuildingSettings
   {
      private readonly string connectionString;

      public DbBuildingSettings(string connectionString)
      {
         this.connectionString = connectionString;
      }

      public int? GetBuildingId(string sourceConnectionString, string destinationConnectionString, string vocabularyConnectionString, Vendors vendor)
      {
         const string query = "SELECT [BuildingId] FROM [dbo].[BuildingSettings] where [SourceConnectionString] = '{0}' and [DestinationConnectionString] = '{1}' and [VocabularyConnectionString] = '{2}' and [Vendor] = '{3}'";

         using (var connection = SqlConnectionHelper.OpenConnection(connectionString))
         {
            using (var cmd = new SqlCommand(string.Format(query, sourceConnectionString, destinationConnectionString, vocabularyConnectionString, vendor), connection))
            {
               using (var reader = cmd.ExecuteReader())
               {
                  while (reader.Read())
                  {
                     return reader.GetInt("BuildingId");
                  }
               }
            }
         }

         return null;
      }

      public int Create(string sourceConnectionString, string destinationConnectionString, string vocabularyConnectionString, Vendors vendor)
      {
         using (var connection = SqlConnectionHelper.OpenConnection(connectionString))
         {
            const string query = "INSERT INTO [dbo].[BuildingSettings] " +
                                 "([SourceConnectionString] " +
                                 ",[DestinationConnectionString] " +
                                 ",[VocabularyConnectionString] " +
                                 ",[Vendor]) " +
                                 "VALUES " +
                                 "(@sourceConnectionString " +
                                 ",@destinationConnectionString " +
                                 ",@vocabularyConnectionString " +
                                 ",@vendor);Select Scope_Identity();";

            using (var cmd = new SqlCommand(query, connection))
            {
               cmd.Parameters.Add("@sourceConnectionString", SqlDbType.VarChar);
               cmd.Parameters["@sourceConnectionString"].Value = sourceConnectionString;

               cmd.Parameters.Add("@destinationConnectionString", SqlDbType.VarChar);
               cmd.Parameters["@destinationConnectionString"].Value = destinationConnectionString;

               cmd.Parameters.Add("@vocabularyConnectionString", SqlDbType.VarChar);
               cmd.Parameters["@vocabularyConnectionString"].Value = vocabularyConnectionString;

               cmd.Parameters.Add("@vendor", SqlDbType.VarChar);
               cmd.Parameters["@vendor"].Value = vendor.ToString();

               cmd.CommandTimeout = 30000;
               return Convert.ToInt32(cmd.ExecuteScalar());
            }
         }
      }

      public void Update(int buildingId, string sourceConnectionString, string destinationConnectionString, string vocabularyConnectionString, Vendors vendor)
      {
         using (var connection = SqlConnectionHelper.OpenConnection(connectionString))
         {
            const string query = "UPDATE [dbo].[BuildingSettings] " +
                                 "SET [SourceConnectionString] = @sourceConnectionString " +
                                 ",[DestinationConnectionString] = @destinationConnectionString " +
                                 ",[VocabularyConnectionString] = @vocabularyConnectionString " +
                                 ",[Vendor] = @vendor " +
                                 "WHERE BuildingId = @buildingId";

            using (var cmd = new SqlCommand(query, connection))
            {
               cmd.Parameters.Add("@buildingId", SqlDbType.Int);
               cmd.Parameters["@buildingId"].Value = buildingId;

               cmd.Parameters.Add("@sourceConnectionString", SqlDbType.VarChar);
               cmd.Parameters["@sourceConnectionString"].Value = sourceConnectionString;

               cmd.Parameters.Add("@destinationConnectionString", SqlDbType.VarChar);
               cmd.Parameters["@destinationConnectionString"].Value = destinationConnectionString;

               cmd.Parameters.Add("@vocabularyConnectionString", SqlDbType.VarChar);
               cmd.Parameters["@vocabularyConnectionString"].Value = vocabularyConnectionString;

               cmd.Parameters.Add("@vendor", SqlDbType.VarChar);
               cmd.Parameters["@vendor"].Value = vendor.ToString();

               cmd.CommandTimeout = 30000;
               cmd.ExecuteScalar();
            }
         }
      }

      public void Reset()
      {
         using (var connection = SqlConnectionHelper.OpenConnection(connectionString))
         {
            const string query = "delete from [dbo].[BuildingSettings]";

            using (var cmd = new SqlCommand(query, connection))
            {
               cmd.ExecuteScalar();
            }
         }
      }

      public IEnumerable<IDataReader> Load(int buildingId)
      {
         const string query = "SELECT [BuildingId] " +
                              ",[SourceConnectionString] " +
                              ",[DestinationConnectionString] " +
                              ",[VocabularyConnectionString] " +
                              ",[Vendor] " +
                              "FROM [dbo].[BuildingSettings] where BuildingId = {0}";

         using (var connection = SqlConnectionHelper.OpenConnection(connectionString))
         {
            using (var cmd = new SqlCommand(string.Format(query, buildingId), connection))
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
   }
}
