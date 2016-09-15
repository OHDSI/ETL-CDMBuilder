using System;
using System.Data.Odbc;
using System.IO;
using org.ohdsi.cdm.framework.shared.Helpers;

namespace org.ohdsi.cdm.framework.data.DbLayer
{
   public class DbDestination
   {
      private readonly string connectionString;
      private readonly string folder;
      private readonly string schemaName;

      public DbDestination(string connectionString, string folder, string schemaName)
      {
         this.connectionString = connectionString;
         this.folder = folder;
         this.schemaName = schemaName;
      }

      public void CreateDatabase(string query)
      {
         var sqlConnectionStringBuilder = new OdbcConnectionStringBuilder(connectionString);
         var database = sqlConnectionStringBuilder["database"];

         // TMP
         if (connectionString.ToLower().Contains("amazon redshift"))
            sqlConnectionStringBuilder["database"] = "poc";
         else
            sqlConnectionStringBuilder["database"] = "master";

         using (var connection = SqlConnectionHelper.OpenOdbcConnection(sqlConnectionStringBuilder.ConnectionString))
         {
            query = string.Format(query, database);

            foreach (var subQuery in query.Split(new[] { "\r\nGO" }, StringSplitOptions.None))
            {
               using (var command = new OdbcCommand(subQuery, connection))
               {
                  command.CommandTimeout = 30000;
                  command.ExecuteNonQuery();
               }
            }
         }
      }

      public void DropDatabase()
      {
         var sqlConnectionStringBuilder = new OdbcConnectionStringBuilder(connectionString);

         var destination = sqlConnectionStringBuilder["Database"];
         sqlConnectionStringBuilder["Database"] = "master";

         using (var connection = SqlConnectionHelper.OpenOdbcConnection(sqlConnectionStringBuilder.ConnectionString))
         {
            var query = string.Format("ALTER DATABASE [{0}] SET SINGLE_USER WITH ROLLBACK IMMEDIATE;", destination);
            
            using (var command = new OdbcCommand(query, connection))
            {
               command.CommandTimeout = 30000;
               command.ExecuteNonQuery();
            }

            query = string.Format("DROP DATABASE [{0}]", destination);

            using (var command = new OdbcCommand(query, connection))
            {
               command.CommandTimeout = 30000;
               command.ExecuteNonQuery();
            }
         }
      }

      public void TruncateLookup()
      {
         using (var connection = SqlConnectionHelper.OpenOdbcConnection(connectionString))
         {
            var query = File.ReadAllText(Path.Combine(folder, "TruncateLookup.sql"));
            query = query.Replace("{sc}", schemaName);

            using (var command = new OdbcCommand(query, connection))
            {
               command.CommandTimeout = 0;
               command.ExecuteNonQuery();
            }
         }
      }

      public void TruncateTables()
      {
         using (var connection = SqlConnectionHelper.OpenOdbcConnection(connectionString))
         {
            var query = File.ReadAllText(Path.Combine(folder, "TruncateTables.sql"));
            query = query.Replace("{sc}", schemaName);

            using (var command = new OdbcCommand(query, connection))
            {
               command.CommandTimeout = 0;
               command.ExecuteNonQuery();
            }
         }
      }

      public void TruncateWithoutLookupTables()
      {
         using (var connection = SqlConnectionHelper.OpenOdbcConnection(connectionString))
         {
            var query = File.ReadAllText(Path.Combine(folder, "TruncateWithoutLookupTables.sql"));
            query = query.Replace("{sc}", schemaName);

            using (var command = new OdbcCommand(query, connection))
            {
               command.CommandTimeout = 0;
               command.ExecuteNonQuery();
            }
         }
      }

      public void DropVocabularyTables()
      {
         using (var connection = SqlConnectionHelper.OpenOdbcConnection(connectionString))
         {
            const string query =
               "IF OBJECT_ID (N'AGG_DESCENDANT_SOURCECODES', N'U') IS NOT NULL truncate table AGG_DESCENDANT_SOURCECODES; " +
               "IF OBJECT_ID (N'attribute_definition', N'U') IS NOT NULL truncate table attribute_definition; " +
               "IF OBJECT_ID (N'cohort_definition', N'U') IS NOT NULL truncate table cohort_definition; " +
               "IF OBJECT_ID (N'CONCEPT', N'U') IS NOT NULL truncate table CONCEPT; " +
               "IF OBJECT_ID (N'concept_ancestor', N'U') IS NOT NULL truncate table concept_ancestor; " +
               "IF OBJECT_ID (N'concept_class', N'U') IS NOT NULL truncate table concept_class; " +
               "IF OBJECT_ID (N'concept_relationship', N'U') IS NOT NULL truncate table concept_relationship; " +
               "IF OBJECT_ID (N'CONCEPT_SYNONYM', N'U') IS NOT NULL truncate table CONCEPT_SYNONYM; " +
               "IF OBJECT_ID (N'DESCENDANT_CONCEPT_COUNT', N'U') IS NOT NULL truncate table DESCENDANT_CONCEPT_COUNT; " +
               "IF OBJECT_ID (N'DESCENDANT_SOURCE_CODE_COUNT', N'U') IS NOT NULL truncate table DESCENDANT_SOURCE_CODE_COUNT; " +
               "IF OBJECT_ID (N'domain', N'U') IS NOT NULL truncate table domain; " +
               "IF OBJECT_ID (N'DRUG_APPROVAL', N'U') IS NOT NULL truncate table DRUG_APPROVAL; " +
               "IF OBJECT_ID (N'DRUG_STRENGTH', N'U') IS NOT NULL truncate table DRUG_STRENGTH; " +
               "IF OBJECT_ID (N'relationship', N'U') IS NOT NULL truncate table relationship; " +
               "IF OBJECT_ID (N'source_to_concept_map', N'U') IS NOT NULL truncate table source_to_concept_map; " +
               "IF OBJECT_ID (N'VOCABULARY', N'U') IS NOT NULL truncate table VOCABULARY; ";

            using (var command = new OdbcCommand(query, connection))
            {
               command.CommandTimeout = 0;
               command.ExecuteNonQuery();
            }
         }
      }

      public void CopyVocabulary(string query, string vocabularyConnectionString)
      {
         if (string.IsNullOrEmpty(query.Trim())) return;

         var vocab = new OdbcConnectionStringBuilder(vocabularyConnectionString);
         using (var connection = SqlConnectionHelper.OpenOdbcConnection(connectionString))
         {
            query = string.Format(query, vocab["server"], vocab["database"]);
            using (var command = new OdbcCommand(query, connection))
            {
               command.CommandTimeout = 0;
               command.ExecuteNonQuery();
            }
         }
      }

      public void CreateTables(string query)
      {
         query = query.Replace("{sc}", schemaName);
         var sqlConnectionStringBuilder = new OdbcConnectionStringBuilder(connectionString);
         using (var connection = SqlConnectionHelper.OpenOdbcConnection(sqlConnectionStringBuilder.ConnectionString))
         {
            using (var command = new OdbcCommand(query, connection))
            {
               command.ExecuteNonQuery();
            }
         }
      }

      public void FillPostBuildTable(string query)
      {
         query = query.Replace("{sc}", schemaName);
         var sqlConnectionStringBuilder = new OdbcConnectionStringBuilder(connectionString);
         using (var connection = SqlConnectionHelper.OpenOdbcConnection(sqlConnectionStringBuilder.ConnectionString))
         {
            using (var command = new OdbcCommand(query, connection))
            {
               command.ExecuteNonQuery();
            }
         }
      }

      public void CreateIndexes(string query)
      {
         if (string.IsNullOrEmpty(query.Trim())) return;
         
         using (var connection = SqlConnectionHelper.OpenOdbcConnection(connectionString))
         {
            foreach (var subQuery in query.Split(new[] { "\r\nGO" }, StringSplitOptions.None))
            {
               using (var command = new OdbcCommand(subQuery, connection))
               {
                  command.CommandTimeout = 0;
                  command.ExecuteNonQuery();
               }
            }
         }
      }
   }
}
