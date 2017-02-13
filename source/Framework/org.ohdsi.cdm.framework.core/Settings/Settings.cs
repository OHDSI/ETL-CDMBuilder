using System.IO;
using org.ohdsi.cdm.framework.shared.Attributes;
using org.ohdsi.cdm.framework.shared.Extensions;
using System.Configuration;

namespace org.ohdsi.cdm.framework.core
{
   public class Settings
   {
      private string apsConnectionString;
      private bool storeToAPS;
      private string awsAccessKeyId;
      private string awsSecretAccessKey;
      private string bucket;
      private int? subChunkSize;

      #region Properties
      public static Settings Current { get; set; }
      public BuildingSettings Building { get; set; }
      public BuilderSettings Builder { get; set; }

      public string ResultFolder { get; set; }

      static Settings ()
      {
         Current = new Settings();
      }

      public string DropVocabularyTablesScript
      {
         get
         {
            return File.ReadAllText(
               Path.Combine(new[] {
                  Builder.Folder, 
                  "Common", 
                  Building.DestinationEngine.Database.ToString(),
                  GetCDMVersionFolder(),
                  "DropVocabularyTables.sql"
               }));

         }
      }

      public string TruncateWithoutLookupTablesScript
      {
         get
         {
            return File.ReadAllText(
               Path.Combine(new[] {
                  Builder.Folder, 
                  "Common", 
                  Building.DestinationEngine.Database.ToString(),
                  GetCDMVersionFolder(),
                  "TruncateWithoutLookupTables.sql"
               }));

         }
      }

      public string TruncateTablesScript
      {
         get
         {
            return File.ReadAllText(
               Path.Combine(new[] {
                  Builder.Folder, 
                  "Common", 
                  Building.DestinationEngine.Database.ToString(),
                  GetCDMVersionFolder(),
                  "TruncateTables.sql"
               }));

         }
      }

      public string TruncateLookupScript
      {
         get
         {
            return File.ReadAllText(
               Path.Combine(new[] {
                  Builder.Folder, 
                  "Common", 
                  Building.DestinationEngine.Database.ToString(),
                  GetCDMVersionFolder(),
                  "TruncateLookup.sql"
               }));

         }
      }

      public string CreateCDMTablesScript
      {
         get
         {
            return File.ReadAllText(
               Path.Combine(new[] {
                  Builder.Folder, 
                  "Common", 
                  Building.DestinationEngine.Database.ToString(),
                  GetCDMVersionFolder(),
                  "CreateTables.sql"
               }));

         }
      }

      public string CreateCDMDatabaseScript
      {
         get
         {
            return File.ReadAllText(
               Path.Combine(new[] {
                  Builder.Folder, 
                  "Common", 
                  Building.DestinationEngine.Database.ToString(), 
                  "CreateDestination.sql"
               }));
         }
      }

      public string CopyVocabularyScript
      {
         get
         {
            return File.ReadAllText(
               Path.Combine(new[] {
                  Builder.Folder, 
                  "Common", 
                  Building.DestinationEngine.Database.ToString(),
                  GetCDMVersionFolder(),
                  "CopyVocabulary.sql"
               }));
         }
      }

      public string CreateIndexesScript
      {
         get
         {
            return File.ReadAllText(
               Path.Combine(new[] {
                  Builder.Folder, 
                  "Common", 
                  Building.DestinationEngine.Database.ToString(), 
                  GetCDMVersionFolder(),
                  "CreateIndexes.sql"
               }));
         }
      }

      public string AwsAccessKeyId
      {
         get
         {
            if (!string.IsNullOrEmpty(awsAccessKeyId))
               return awsAccessKeyId;

            return ConfigurationManager.AppSettings["aws_access_key_id"];
         }
         set { awsAccessKeyId = value; }
      }

      public string AwsSecretAccessKey
      {
         get
         {
            if (!string.IsNullOrEmpty(awsSecretAccessKey))
               return awsSecretAccessKey;

            return ConfigurationManager.AppSettings["aws_secret_access_key"];
         }
         set { awsSecretAccessKey = value; }
      }

      public string Bucket
      {
         get
         {
            if (!string.IsNullOrEmpty(bucket))
               return bucket;

            return ConfigurationManager.AppSettings["bucket"];
         }
         set { bucket = value; }
      }

      public int SubChunkSize
      {
         get
         {
            if(!subChunkSize.HasValue)
               subChunkSize = int.Parse(ConfigurationManager.AppSettings["SubChunkSize"]);

            return subChunkSize.Value;
         }
         set { subChunkSize = value; }
      }

      public bool StoreToAPS
      {
         //get { return bool.Parse(ConfigurationManager.AppSettings["StoreToAPS"]); }
         get { return false; }
      }

      public string APSConnectionString
      {
         get
         {
            if (ConfigurationManager.ConnectionStrings["APS"].ConnectionString != null)
               apsConnectionString = ConfigurationManager.ConnectionStrings["APS"].ConnectionString;

            return apsConnectionString;
         }
         set
         {
            var config = ConfigurationManager.OpenExeConfiguration(ConfigurationUserLevel.None);
            if (config.ConnectionStrings.ConnectionStrings["APS"] != null)
            {
               
               config.ConnectionStrings.ConnectionStrings["APS"].ConnectionString = value;
               config.Save(ConfigurationSaveMode.Modified);
            }

            apsConnectionString = value;
         }
      }

      public string AchillesRScript
      {
         get
         {
            return File.ReadAllText(
               Path.Combine(new[] {
                  Builder.Folder, 
                  "Common", 
                  Building.DestinationEngine.Database.ToString(),
                  "Achilles.R"
               })); 
         }
      }
        #endregion

      #region Methods
      public static void Initialize(string builderConnectionString, string machineName)
      {
         Current.Building = new BuildingSettings(builderConnectionString);
         Current.Builder = new BuilderSettings(machineName);
         Current.Builder.Load();

         if (Current.Builder.BuildingId.HasValue)
            Current.Building.Load(Current.Builder.BuildingId.Value);
      }

      public void Save()
      {
         Current.Building.Save();
         Current.Builder.BuildingId = Current.Building.Id;
         Current.Builder.Save();
      }

      private string GetCDMVersionFolder()
      {
         return Building.CDM.GetAttribute<FolderAttribute>().Value;
      }

      #endregion
   }
}
