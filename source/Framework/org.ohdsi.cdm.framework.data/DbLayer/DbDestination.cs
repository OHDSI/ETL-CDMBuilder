using System;
using System.Data.SqlClient;
using org.ohdsi.cdm.framework.shared.Helpers;

namespace org.ohdsi.cdm.framework.data.DbLayer
{
   public class DbDestination
   {
      private readonly string connectionString;

      public DbDestination(string connectionString)
      {
         this.connectionString = connectionString;
      }

      public void CreateDatabase(string query)
      {
         var sqlConnectionStringBuilder = new SqlConnectionStringBuilder(connectionString);

         var destination = sqlConnectionStringBuilder["Database"];
         sqlConnectionStringBuilder["Database"] = "master";

         using (var connection = SqlConnectionHelper.OpenConnection(sqlConnectionStringBuilder.ConnectionString))
         {
            query = string.Format(query, destination);

            foreach (var subQuery in query.Split(new[] { "\r\nGO" }, StringSplitOptions.None))
            {
               using (var command = new SqlCommand(subQuery, connection))
               {
                  command.CommandTimeout = 30000;
                  command.ExecuteNonQuery();
               }
            }
         }
      }

      public void DropDatabase()
      {
         var sqlConnectionStringBuilder = new SqlConnectionStringBuilder(connectionString);

         var destination = sqlConnectionStringBuilder["Database"];
         sqlConnectionStringBuilder["Database"] = "master";

         using (var connection = SqlConnectionHelper.OpenConnection(sqlConnectionStringBuilder.ConnectionString))
         {
            var query = string.Format("ALTER DATABASE [{0}] SET SINGLE_USER WITH ROLLBACK IMMEDIATE;", destination);
            
            using (var command = new SqlCommand(query, connection))
            {
               command.CommandTimeout = 30000;
               command.ExecuteNonQuery();
            }

            query = string.Format("DROP DATABASE [{0}]", destination);

            using (var command = new SqlCommand(query, connection))
            {
               command.CommandTimeout = 30000;
               command.ExecuteNonQuery();
            }
         }
      }

      public void TruncateLookup()
      {
         using (var connection = SqlConnectionHelper.OpenConnection(connectionString))
         {
            const string query = "truncate table CARE_SITE; truncate table LOCATION; truncate table ORGANIZATION; truncate table PROVIDER;";
            using (var command = new SqlCommand(query, connection))
            {
               command.CommandTimeout = 0;
               command.ExecuteNonQuery();
            }
         }
      }

      public void TruncateTables()
      {
         using (var connection = SqlConnectionHelper.OpenConnection(connectionString))
         {
            const string query = "truncate table PERSON; truncate table CONDITION_OCCURRENCE; truncate table DRUG_EXPOSURE; truncate table PROCEDURE_OCCURRENCE; " +
                                 "truncate table CONDITION_ERA; truncate table DRUG_ERA; truncate table OBSERVATION_PERIOD; truncate table OBSERVATION; truncate table VISIT_OCCURRENCE;  " +
                                 "truncate table LOCATION; truncate table ORGANIZATION; truncate table CARE_SITE; truncate table PROVIDER; truncate table PAYER_PLAN_PERIOD; truncate table DRUG_COST; truncate table PROCEDURE_COST; " +
                                 "truncate table DEATH; truncate table COHORT;";

            using (var command = new SqlCommand(query, connection))
            {
               command.CommandTimeout = 0;
               command.ExecuteNonQuery();
            }
         }
      }

      public void TruncateWithoutLookupTables()
      {
         using (var connection = SqlConnectionHelper.OpenConnection(connectionString))
         {
            const string query = "truncate table PERSON; truncate table CONDITION_OCCURRENCE; truncate table DRUG_EXPOSURE; truncate table PROCEDURE_OCCURRENCE; " +
                                 "truncate table CONDITION_ERA; truncate table DRUG_ERA; truncate table OBSERVATION_PERIOD; truncate table OBSERVATION; truncate table VISIT_OCCURRENCE;  " +
                                 "truncate table PAYER_PLAN_PERIOD; truncate table DRUG_COST; truncate table PROCEDURE_COST; " +
                                 "truncate table DEATH; truncate table COHORT;";

            using (var command = new SqlCommand(query, connection))
            {
               command.CommandTimeout = 0;
               command.ExecuteNonQuery();
            }
         }
      }

      public void DropVocabularyTables()
      {
         using (var connection = SqlConnectionHelper.OpenConnection(connectionString))
         {
            const string query = "DROP TABLE [CONCEPT]; DROP TABLE [CONCEPT_ANCESTOR]; DROP TABLE [CONCEPT_RELATIONSHIP]; DROP TABLE [CONCEPT_SYNONYM]; DROP TABLE [RELATIONSHIP]; DROP TABLE [SOURCE_TO_CONCEPT_MAP]; DROP TABLE [VOCABULARY];";
            using (var command = new SqlCommand(query, connection))
            {
               command.CommandTimeout = 0;
               command.ExecuteNonQuery();
            }
         }
      }

      public void CopyVocabulary(string query, string vocabularyConnectionString)
      {
         var vocab = new SqlConnectionStringBuilder(vocabularyConnectionString);
         using (var connection = SqlConnectionHelper.OpenConnection(connectionString))
         {
            query = string.Format(query, vocab.DataSource, vocab.InitialCatalog);
            using (var command = new SqlCommand(query, connection))
            {
               command.CommandTimeout = 0;
               command.ExecuteNonQuery();
            }
         }
      }

      public void CreateTables(string query)
      {
         var sqlConnectionStringBuilder = new SqlConnectionStringBuilder(connectionString);
         using (var connection = SqlConnectionHelper.OpenConnection(sqlConnectionStringBuilder.ConnectionString))
         {
            using (var command = new SqlCommand(query, connection))
            {
               command.ExecuteNonQuery();
            }
         }
      }

      public void CreateIndexes(string query)
      {
         using (var connection = SqlConnectionHelper.OpenConnection(connectionString))
         {
            foreach (var subQuery in query.Split(new[] { "\r\nGO" }, StringSplitOptions.None))
            {
               using (var command = new SqlCommand(subQuery, connection))
               {
                  command.CommandTimeout = 0;
                  command.ExecuteNonQuery();
               }
            }
         }
      }
   }
}
