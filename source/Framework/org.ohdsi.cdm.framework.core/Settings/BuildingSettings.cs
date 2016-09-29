using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using org.ohdsi.cdm.framework.core.Databases;
using org.ohdsi.cdm.framework.core.Definitions;
using org.ohdsi.cdm.framework.core.Extensions;
using org.ohdsi.cdm.framework.data.DbLayer;
using org.ohdsi.cdm.framework.shared.Attributes;
using org.ohdsi.cdm.framework.shared.Enums;
using org.ohdsi.cdm.framework.shared.Extensions;

namespace org.ohdsi.cdm.framework.core
{
   public class BuildingSettings
   {
      #region Variables
      private readonly DbBuildingSettings dbBuildingSettings;
      private IDatabaseEngine sourceEngine;
      private IDatabaseEngine destinationEngine;
      private string cdmSourceScript;

      #endregion

      #region Properties
      public int? Id { get; private set; }

      public Vendors Vendor { get; set; }
      public List<QueryDefinition> SourceQueryDefinitions { get; private set; }
      public List<QueryDefinition> DestinationQueryDefinitions { get; private set; }
      public List<QueryDefinition> CommonQueryDefinitions { get; private set; }

      public string RawSourceConnectionString { get; set; }
      public string RawDestinationConnectionString { get; set; }
      public string RawVocabularyConnectionString { get; set; }
      
      public string BuilderConnectionString { get; private set; }
      public string VocabularyVersion { get; private set; }
      public string SourceReleaseDate { get; private set; }

      public int Batches { get; set; }
      public SaveType SaveType { get; set; }

      public string BatchScript { get; private set; }
      public string CohortDefinitionScript { get; private set; }

      public string SourceConnectionString
      {
         get
         {
            return Regex.Replace(RawSourceConnectionString, "sc=" + SourceSchemaName + ";", "", RegexOptions.IgnoreCase);
         }
      }

      public string DestinationConnectionString
      {
         get
         {
            return Regex.Replace(RawDestinationConnectionString, "sc=" + DestinationSchemaName + ";", "", RegexOptions.IgnoreCase);
         }
      }

      public string VocabularyConnectionString
      {
         get
         {
            return Regex.Replace(RawVocabularyConnectionString, "sc=" + VocabularySchemaName + ";", "", RegexOptions.IgnoreCase);
         }
      }

      public string CdmSourceScript
      {
         get
         {
             if (cdmSourceScript == null || SourceReleaseDate == null || VocabularyVersion == null)
                 return null;
            
            cdmSourceScript = cdmSourceScript.Replace("{0}", SourceReleaseDate);
            cdmSourceScript = cdmSourceScript.Replace("{1}", VocabularyVersion);
            cdmSourceScript = cdmSourceScript.Replace("{3}", DateTime.Now.ToShortDateString());

            return cdmSourceScript;
         }
         private set { cdmSourceScript = value; }
      }

      public CDMVersions CDM
      {
         get
         {
            return Vendor.GetAttribute<CDMVersionAttribute>().Value;
         }
      }

      public IDatabaseEngine SourceEngine
      {
         get
         {
            return sourceEngine ?? (sourceEngine = DatabaseEngine.GetEngine(RawSourceConnectionString));
         }
      }

      public IDatabaseEngine DestinationEngine
      {
         get
         {
            return destinationEngine ??
                   (destinationEngine = DatabaseEngine.GetEngine(RawDestinationConnectionString));
         }
      }

      public string SourceSchemaName
      {
         get
         {
            var match = Regex.Match(RawSourceConnectionString, "(?s)(?<=sc=).*?(?=;)", RegexOptions.IgnoreCase);
            if (match.Success)
            {
               return match.Value.Trim().ToLower();
            }

            return "dbo";
         }
      }

      public string DestinationSchemaName
      {
         get
         {
            var match = Regex.Match(RawDestinationConnectionString, "(?s)(?<=sc=).*?(?=;)", RegexOptions.IgnoreCase);
            if (match.Success)
            {
               return match.Value.Trim().ToLower();
            }

            return "dbo";
         }
      }

      public string VocabularySchemaName
      {
         get
         {
            var match = Regex.Match(RawVocabularyConnectionString, "(?s)(?<=sc=).*?(?=;)", RegexOptions.IgnoreCase);
            if (match.Success)
            {
               return match.Value.Trim().ToLower();
            }

            return "dbo";
         }
      }
      
      #endregion

      #region Constructor
      public BuildingSettings(string builderConnectionString)
      {
         dbBuildingSettings = new DbBuildingSettings(builderConnectionString);
         BuilderConnectionString = builderConnectionString;
      }
      #endregion

      #region Methods
      private void SetFrom(IDataReader reader)
      {
         RawVocabularyConnectionString = reader.GetString("VocabularyConnectionString");
         RawSourceConnectionString = reader.GetString("SourceConnectionString");
         RawDestinationConnectionString = reader.GetString("DestinationConnectionString");

         Vendor = (Vendors)Enum.Parse(typeof(Vendors), reader.GetString("Vendor"));

         SetVendorSettings();
         SetVocabularyVersion();
         SetSourceReleaseDate();
      }

      private void SetVocabularyVersion()
      {
         if(CDM != CDMVersions.v5 ) return;

         VocabularyVersion = dbBuildingSettings.GetVocabularyVersion(VocabularyConnectionString);
      }

      private void SetSourceReleaseDate()
      {
         var dbSource = new DbSource(SourceConnectionString, null, SourceSchemaName);
         SourceReleaseDate = dbSource.GetSourceReleaseDate();
      }

      private void SetVendorSettings()
      {
         var vendorFolder = Vendor.GetAttribute<FolderAttribute>().Value;
         var batch = Vendor.GetAttribute<BatchFileAttribute>() == null
            ? "Batch.sql"
            : Vendor.GetAttribute<BatchFileAttribute>().Value;

         var cdmSource = Vendor.GetAttribute<CDMSourceAttribute>() == null
            ? "CdmSource.sql"
            : Vendor.GetAttribute<CDMSourceAttribute>().Value;

         if (File.Exists(Path.Combine(vendorFolder, batch)))
         {
             BatchScript = File.ReadAllText(Path.Combine(vendorFolder, batch));
         }

         if (File.Exists(Path.Combine(vendorFolder, cdmSource)))
         {
            CdmSourceScript = File.ReadAllText(Path.Combine(vendorFolder, cdmSource));
         }

         if (File.Exists(Path.Combine(vendorFolder, "CohortDefinition.sql")))
         {
            CohortDefinitionScript = File.ReadAllText(Path.Combine(vendorFolder, "CohortDefinition.sql"));
         }

         var folder = Path.Combine(vendorFolder, "Definitions");
         SourceQueryDefinitions = Directory.GetFiles(folder).Select(
             definition => new QueryDefinition().DeserializeFromXml(File.ReadAllText(definition))).ToList();

         folder = Path.Combine(Directory.GetParent(vendorFolder).FullName, Path.Combine("Common", "Definitions"));
         CommonQueryDefinitions = Directory.GetFiles(folder).Select(
             definition => new QueryDefinition().DeserializeFromXml(File.ReadAllText(definition))).ToList();

         folder = Path.Combine(vendorFolder, "CDMDefinitions");
         if (Directory.Exists(folder))
         {
            DestinationQueryDefinitions = Directory.GetFiles(folder).Select(
             definition => new QueryDefinition().DeserializeFromXml(File.ReadAllText(definition))).ToList();
         }
      }

      public bool Load(int buildingId)
      {
         Id = null;
         foreach (var dataReader in dbBuildingSettings.Load(buildingId))
         {
            Id = buildingId;
            SetFrom(dataReader);
         }

         return Id.HasValue;
      }

      public void Save()
      {
         var id = dbBuildingSettings.GetBuildingId(RawSourceConnectionString, RawDestinationConnectionString,
            RawVocabularyConnectionString, Vendor);

         if (id.HasValue)
         {
            Id = id;
            dbBuildingSettings.Update(Id.Value, RawSourceConnectionString, RawDestinationConnectionString,
               RawVocabularyConnectionString, Vendor);
         }
         else
         {
            Id = dbBuildingSettings.Create(RawSourceConnectionString, RawDestinationConnectionString,
               RawVocabularyConnectionString, Vendor);
         }

         SetVendorSettings();
      }
      #endregion
   }
}
