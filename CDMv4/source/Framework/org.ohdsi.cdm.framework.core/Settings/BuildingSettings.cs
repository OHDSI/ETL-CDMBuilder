using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using org.ohdsi.cdm.framework.core.Definitions;
using org.ohdsi.cdm.framework.core.Extensions;
using org.ohdsi.cdm.framework.data.DbLayer;
using org.ohdsi.cdm.framework.shared.Enums;
using org.ohdsi.cdm.framework.shared.Extensions;

namespace org.ohdsi.cdm.framework.core
{
   public class BuildingSettings
   {
      #region Variables
      private readonly DbBuildingSettings dbBuildingSettings;
      #endregion

      #region Properties
      public int? Id { get; private set; }

      public Vendors Vendor { get; set; }
      public List<QueryDefinition> SourceQueryDefinitions { get; private set; }
      public List<QueryDefinition> DestinationQueryDefinitions { get; private set; }
      public List<QueryDefinition> CommonQueryDefinitions { get; private set; }
      
      public string SourceConnectionString { get; set; }
      public string DestinationConnectionString { get; set; }
      public string VocabularyConnectionString { get; set; }
      public string BuilderConnectionString { get; private set; }

      public int Batches { get; set; }
      public SaveType SaveType { get; set; }

      public string BatchScript { get; private set; }
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
         VocabularyConnectionString = reader.GetString("VocabularyConnectionString");
         SourceConnectionString = reader.GetString("SourceConnectionString");
         DestinationConnectionString = reader.GetString("DestinationConnectionString");

         Vendor = (Vendors)Enum.Parse(typeof(Vendors), reader.GetString("Vendor"));

         SetVendorSettings();
      }

      private void SetVendorSettings()
      {
         if (File.Exists(Path.Combine(Vendor.ToString(), "Batch.sql")))
         {
            BatchScript = File.ReadAllText(Path.Combine(Vendor.ToString(), "Batch.sql"));
         }

         var folder = Path.Combine(Vendor.ToString(), "Definitions");
         SourceQueryDefinitions = Directory.GetFiles(folder).Select(
             definition => new QueryDefinition().DeserializeFromXml(File.ReadAllText(definition))).ToList();

         folder = Path.Combine(Directory.GetParent(Vendor.ToString()).FullName, Path.Combine("Common", "Definitions"));
         CommonQueryDefinitions = Directory.GetFiles(folder).Select(
             definition => new QueryDefinition().DeserializeFromXml(File.ReadAllText(definition))).ToList();

         folder = Path.Combine(Vendor.ToString(), "CDMDefinitions");
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
         var id = dbBuildingSettings.GetBuildingId(SourceConnectionString, DestinationConnectionString,
            VocabularyConnectionString, Vendor);

         if (id.HasValue)
         {
            Id = id;
            dbBuildingSettings.Update(Id.Value, SourceConnectionString, DestinationConnectionString,
               VocabularyConnectionString, Vendor);
         }
         else
         {
            Id = dbBuildingSettings.Create(SourceConnectionString, DestinationConnectionString,
               VocabularyConnectionString, Vendor);
         }

         SetVendorSettings();
      }
      #endregion
   }
}
