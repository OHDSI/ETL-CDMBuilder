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
      private bool autoSettings;
      private string s3awsAccessKeyId;
      private string s3awsSecretAccessKey;

      private string ec2awsAccessKeyId;
      private string ec2awsSecretAccessKey;
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
      
      public string S3AwsAccessKeyId
      {
         get
         {
            if (!string.IsNullOrEmpty(s3awsAccessKeyId))
               return s3awsAccessKeyId;

            return ConfigurationManager.AppSettings["s3_aws_access_key_id"];
         }
         set { s3awsAccessKeyId = value; }
      }

      public string S3AwsSecretAccessKey
      {
         get
         {
            if (!string.IsNullOrEmpty(s3awsSecretAccessKey))
               return s3awsSecretAccessKey;

            return ConfigurationManager.AppSettings["s3_aws_secret_access_key"];
         }
         set { s3awsSecretAccessKey = value; }
      }

      public string Ec2AwsAccessKeyId
      {
         get
         {
            if (!string.IsNullOrEmpty(ec2awsAccessKeyId))
               return ec2awsAccessKeyId;

            return ConfigurationManager.AppSettings["ec2_aws_access_key_id"];
         }
         set { ec2awsAccessKeyId = value; }
      }

      public string Ec2AwsSecretAccessKey
      {
         get
         {
            if (!string.IsNullOrEmpty(ec2awsSecretAccessKey))
               return ec2awsSecretAccessKey;

            return ConfigurationManager.AppSettings["ec2_aws_secret_access_key"];
         }
         set { ec2awsSecretAccessKey = value; }
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

      public bool AutoSettings
      {
         //get { return bool.Parse(ConfigurationManager.AppSettings["AutoSettings"]); }
         get { return true; }
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
