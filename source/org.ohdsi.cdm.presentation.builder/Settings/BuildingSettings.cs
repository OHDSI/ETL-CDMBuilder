using org.ohdsi.cdm.framework.common.Definitions;
using org.ohdsi.cdm.framework.common.Enums;
using org.ohdsi.cdm.framework.common.Extensions;
using org.ohdsi.cdm.framework.common.Utility;
using org.ohdsi.cdm.framework.desktop.Databases;
using org.ohdsi.cdm.presentation.builder.Utility;
using Spectre.Console;
using System.Configuration;
using System.Reflection;
using System.Xml.Serialization;
using FrameworkSettings = org.ohdsi.cdm.framework.desktop.Settings.Settings;

namespace org.ohdsi.cdm.presentation.builder
{
    public class BuildingSettings
    {        
        #region Properties

        [XmlIgnore]
        public string Folder { get; protected set; }
        [XmlIgnore]
        public int ContinueLoadFromChunk { get; protected set; }
        [XmlIgnore]
        public int MaxMemoryBudgetMb { get; protected set; }
        [XmlIgnore]
        public int MemoryPerChunkMarginPercent { get; protected set; }
        public Building BuildingState { get; set; }

        public string SourceServer { get; set; }
        public string SourceDb { get; set; }
        public string SourceSchema { get; set; }
        public string SourceUser { get; set; }
        public string SourcePswd { get; set; }

        public string CdmServer { get; set; }
        public string CdmDb { get; set; }
        public string CdmSchema { get; set; }
        public string CdmUser { get; set; }
        public string CdmPswd { get; set; }

        public string VocabServer { get; set; }
        public string VocabDb { get; set; }
        public string VocabSchema { get; set; }
        public string VocabUser { get; set; }
        public string VocabPswd { get; set; }


        public int ChunksCount { get; set; }
        public int PersonsCount { get; set; }

        [XmlIgnore]
        public Vendor VendorToProcess { get; set; }

        public string QueryOverwriteFolderPath { get; set; }

        [XmlIgnore]
        public CdmVersions Cdm => FrameworkSettings.Current.Building.Cdm;

        [XmlIgnore]
        public List<QueryDefinition> SourceQueryDefinitions { get; set; }

        [XmlIgnore]
        public int Batches { get; set; }

        [XmlIgnore]
        public int ChunkSize { get; protected set; }

        [XmlIgnore]
        public string BatchScript { get; set; }

        [XmlIgnore]
        public int QueryTriesAmount { get; protected set; }

        [XmlIgnore]
        public int QueryTriesDelaySeconds { get; protected set; }

        [XmlIgnore]
        public IDatabaseEngine SourceEngine { get; private set; }

        [XmlIgnore]
        public IDatabaseEngine CdmEngine { get; private set; }

        [XmlIgnore]
        public IDatabaseEngine VocabularyEngine { get; private set; }

        [XmlIgnore]
        public string DestinationConnectionString
        {
            get
            {
                var conStrings = ConfigurationManager.ConnectionStrings;
                foreach (var conString in conStrings)
                {
                    var conStringTyped = (ConnectionStringSettings)conString;

                    if (!conStringTyped.Name.Contains("Destination"))
                        continue;
                    if (!conStringTyped.Name.Contains(CdmEngine.Database.ToName()))
                        continue;

                    var result = conStringTyped.ConnectionString
                        .Replace("{server}", CdmServer)
                        .Replace("{database}", CdmDb)
                        .Replace("{username}", CdmUser)
                        .Replace("{password}", CdmPswd);

                    //if (result.Contains("Mysql", StringComparison.InvariantCultureIgnoreCase))
                    //    result = result.Replace("database=" + CdmDb + ";", "", StringComparison.InvariantCultureIgnoreCase);

                    return result;
                }
                throw new KeyNotFoundException(CdmServer + " connection string for CDM was not found!");
            }
        }

        [XmlIgnore]
        public string SourceConnectionString
        {
            get
            {
                var conStrings = ConfigurationManager.ConnectionStrings;
                foreach (var conString in conStrings)
                {
                    var conStringTyped = (ConnectionStringSettings)conString;

                    if (!conStringTyped.Name.Contains("Source"))
                        continue;
                    if (!conStringTyped.Name.Contains(SourceEngine.Database.ToName()))
                        continue;

                    var result = conStringTyped.ConnectionString
                        .Replace("{server}", SourceServer)
                        .Replace("{database}", SourceDb)
                        .Replace("{username}", SourceUser)
                        .Replace("{password}", SourcePswd);

                    //if (result.Contains("Mysql", StringComparison.InvariantCultureIgnoreCase))
                    //    result = result.Replace("database=" + SourceDb + ";", "", StringComparison.InvariantCultureIgnoreCase);

                    return result;
                }
                throw new KeyNotFoundException(SourceServer + " connection string for source was not found!"); 
            }
        }

        [XmlIgnore]
        public string VocabularyConnectionString
        {
            get
            {
                var conStrings = ConfigurationManager.ConnectionStrings;
                foreach (var conString in conStrings)
                {
                    var conStringTyped = (ConnectionStringSettings)conString;

                    if (!conStringTyped.Name.Contains("Vocabulary"))
                        continue;
                    if (!conStringTyped.Name.Contains(VocabularyEngine.Database.ToName()))
                        continue;

                    var result = conStringTyped.ConnectionString
                        .Replace("{server}", VocabServer)
                        .Replace("{database}", VocabDb)
                        .Replace("{username}", VocabUser)
                        .Replace("{password}", VocabPswd);

                    //if (result.Contains("Mysql", StringComparison.InvariantCultureIgnoreCase))
                    //    result = result.Replace("database=" + VocabDb + ";", "", StringComparison.InvariantCultureIgnoreCase);

                    return result;
                }
                throw new KeyNotFoundException(VocabServer + " connection string for vocabulary was not found!");
            }
        }

        #endregion

        [Obsolete("This constructor is only for XML serialization")]
        public BuildingSettings() { }

        public BuildingSettings(IDatabaseEngine sourceDatabaseEngine, IDatabaseEngine cdmDatabaseEngine, 
            IDatabaseEngine vocabularyDatabaseEngine, Vendor vendor, int continueLoadFromChunk, int chunkSize,
            int queryTriesAmount, int queryTriesDelaySeconds, int maxMemoryBudgetMb, int memoryPerChunkMarginPercent)
        {
            BuildingState = new Building();
            ChunksCount = 0;
            SourceEngine = sourceDatabaseEngine;
            CdmEngine = cdmDatabaseEngine;
            VocabularyEngine = vocabularyDatabaseEngine;
            VendorToProcess = vendor;
            ContinueLoadFromChunk = continueLoadFromChunk;
            ChunkSize = chunkSize;
            QueryTriesAmount = queryTriesAmount;
            QueryTriesDelaySeconds = queryTriesDelaySeconds;
            MaxMemoryBudgetMb = maxMemoryBudgetMb;
            MemoryPerChunkMarginPercent = memoryPerChunkMarginPercent;
            SetVendorSettings(sourceDatabaseEngine.Database.ToName());
        }

        #region Methods

        private void SetVendorSettings(string databaseEngineName)
        {
            var relatedResources = EmbeddedResourceManager.ReadEmbeddedResources("ETL", VendorToProcess.Folder, StringComparison.InvariantCultureIgnoreCase);
            var vendorResources = relatedResources.Where(s => s.Key.Contains("." + VendorToProcess.Folder + ".")).ToDictionary(); //strict search in cases of CPRD and CPRDHES
            BatchScript = vendorResources.FirstOrDefault(s => s.Key.Contains("Batch.sql")).Value;

            SourceQueryDefinitions = vendorResources
                .Where(s => s.Key.Contains("Definitions"))
                .Select(s => new QueryDefinition()
                {
                    Query = new Query()
                    {
                        Database = databaseEngineName,
                        Text = s.Value,
                    },
                    FileName = s.Key,                   
                })
                .ToList();
        }

        /// <summary>
        /// This should only be called once after everything's set up
        /// </summary>
        public void SetFrameworkBuildingSettings()
        {
            FrameworkSettings.Initialize(SourceConnectionString, "");

            var fb = FrameworkSettings.Current.Building;
            //this sc=<schema>; modification is required due to hardcode in the library. A standart [dbo]. is used otherwise
            fb.RawSourceConnectionString = SourceConnectionString + "sc=" + SourceSchema + ";";
            fb.RawDestinationConnectionString = DestinationConnectionString + "sc=" + CdmSchema + ";";
            fb.RawVocabularyConnectionString = VocabularyConnectionString + "sc=" + VocabSchema + ";";

            fb.Vendor = VendorToProcess;

            #region set SourceQueryDefinitions

            var buildingSettings = new CdmFrameworkImport.BuildingSettings(0, VendorToProcess, Directory.GetCurrentDirectory());
            ResolveTemporalQueryOverrides(buildingSettings);

            foreach (var sourceQueryDefinion in buildingSettings.SourceQueryDefinitions)
            {
                var match = SourceQueryDefinitions.FirstOrDefault(s => s.FileName.Replace(".xml", "").Split('.').Last() == sourceQueryDefinion.FileName);
                if (match == null)
                    continue;

                // set matching properties
                var sourceProps = sourceQueryDefinion.GetType().GetProperties(BindingFlags.Public | BindingFlags.Instance);
                var targetProps = match.GetType().GetProperties(BindingFlags.Public | BindingFlags.Instance);

                foreach (var sourceProp in sourceProps)
                {
                    var targetProp = targetProps.FirstOrDefault(p => p.Name == sourceProp.Name && p.CanWrite);
                    if (targetProp != null && targetProp.PropertyType.IsAssignableFrom(sourceProp.PropertyType))
                    {
                        var value = sourceProp.GetValue(sourceQueryDefinion);
                        targetProp.SetValue(match, value);
                    }
                }
            }

            fb.SourceQueryDefinitions = SourceQueryDefinitions;

            #endregion
        }

        void ResolveTemporalQueryOverrides(CdmFrameworkImport.BuildingSettings settings)
        {

            var vendorName = VendorToProcess.Name;
            if (vendorName.StartsWith("Truven"))
                vendorName = "Truven";
            if (vendorName.StartsWith("OptumExtended"))
                vendorName = "OptumExtended";

            var overwrites = new Dictionary<string, string>();
            if (!string.IsNullOrEmpty(Settings.Current.Building.QueryOverwriteFolderPath)
                && Directory.Exists(Settings.Current.Building.QueryOverwriteFolderPath))
            {
                var dbDir = Directory.GetDirectories(Settings.Current.Building.QueryOverwriteFolderPath)
                    .Select(s => new DirectoryInfo(s))
                    .FirstOrDefault(s => s.Name.Contains(vendorName, StringComparison.InvariantCultureIgnoreCase));

                if (dbDir != null)
                {
                    var files = Directory.GetFiles(dbDir.FullName)
                        .Select(s => new FileInfo(s))
                        .ToList();

                    foreach (var file in files)
                    {
                        var fileName = file.Name.Replace(".xml", "");
                        var fileContents = File.ReadAllText(file.FullName);

                        QueryDefinition newQd = new QueryDefinition().DeserializeFromXml(fileContents);
                        newQd.FileName = fileName;

                        settings.SourceQueryDefinitions.RemoveAll(s => s.FileName.Equals(fileName, StringComparison.CurrentCultureIgnoreCase));
                        settings.SourceQueryDefinitions.Add(newQd);

                        AnsiConsole.MarkupLine($"[yellow]\r\nFile {fileName} was overwritten!\r\n[/]");
                    }
                }
            }
        }

        #endregion
    }
}