using org.ohdsi.cdm.framework.common.Definitions;
using org.ohdsi.cdm.framework.common.Enums;
using org.ohdsi.cdm.framework.common.Extensions;
using org.ohdsi.cdm.framework.common.Utility;
using org.ohdsi.cdm.framework.desktop.Databases;
using org.ohdsi.cdm.presentation.builder.Utility;
using System;
using System.Configuration;
using System.Reflection;
using System.Xml.Serialization;
using FrameworkSettings = org.ohdsi.cdm.framework.desktop.Settings.Settings;

namespace org.ohdsi.cdm.presentation.builder
{
    public class BuildingSettings
    {        

        private static object _threadlock;


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
        public string RawSourceConnectionString { get; set; }
        public string RawDestinationConnectionString { get; set; }
        public string RawVocabularyConnectionString { get; set; }

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

        public string EtlLibraryPath { get; set; }

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
            _threadlock = new object();
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
            var vendorResources = relatedResources.Where(s => s.Key.Contains("." + VendorToProcess.Folder + ".")).ToDictionary(); //strinct search in cases of CPRD and CPRDHES
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

        public void Load()
        {
            var folder = "Building";
            var fileName = string.Empty;

            if (!string.IsNullOrEmpty(SourceDb) && !string.IsNullOrEmpty(CdmDb) && !string.IsNullOrEmpty(VocabDb))
            {
                folder = Path.Combine("Building", $"{SourceDb}_{CdmDb}_{VocabDb}");
            }

            Folder = folder;

            if (Directory.Exists(Folder))
                folder = Folder;
            else
                Directory.CreateDirectory(Folder);

            if (Directory.GetDirectories("Building").Length > 0 && !File.Exists($@"{folder}\Settings.xml"))
            {
                var last = Directory.GetDirectories("Building")
                    .OrderByDescending(di => new DirectoryInfo(di).LastWriteTime)
                    .FirstOrDefault();

                fileName = $@"{last}\Settings.xml";
            }
            else
            {
                fileName = $@"{folder}\Settings.xml";
            }

            if (File.Exists(fileName))
            {
                var xmlSerializer = new XmlSerializer(GetType());
                using (var reader = new StringReader(File.ReadAllText(fileName)))
                {
                    var bs = (BuildingSettings)xmlSerializer.Deserialize(reader);

                    SourceServer = bs.SourceServer;
                    SourceDb = bs.SourceDb;
                    SourceSchema = bs.SourceSchema;
                    SourceUser = bs.SourceUser;
                    SourcePswd = bs.SourcePswd;

                    CdmServer = bs.CdmServer;
                    CdmDb = bs.CdmDb;
                    CdmSchema = bs.CdmSchema;
                    CdmUser = bs.CdmUser;
                    CdmPswd = bs.CdmPswd;

                    VocabServer = bs.VocabServer;
                    VocabDb = bs.VocabDb;
                    VocabSchema = bs.VocabSchema;
                    VocabUser = bs.VocabUser;
                    VocabPswd = bs.VocabPswd;

                    BuildingState = bs.BuildingState;
                    ChunksCount = bs.ChunksCount;
                    ContinueLoadFromChunk = bs.ContinueLoadFromChunk;

                    Settings.Current.Building = bs;

                    Settings.Current.Building.RawSourceConnectionString = SourceConnectionString + "sc=" + SourceSchema + ";";
                    Settings.Current.Building.RawDestinationConnectionString = DestinationConnectionString + "sc=" + CdmSchema + ";";
                    Settings.Current.Building.RawVocabularyConnectionString = VocabularyConnectionString + "sc=" + VocabSchema + ";";
                }
            }
            else
                Settings.Current.Building = new BuildingSettings(SourceEngine, CdmEngine, VocabularyEngine, VendorToProcess, 0, 10000, 5, 60, 5000, 5);
        }

        public void Reset()
        {
            BuildingState = new Building();
            ChunksCount = 0;
        }

        public void Save(bool reloadVendorSettings)
        {
            var folder = "Building";
            if (!Directory.Exists(folder))
            {
                Directory.CreateDirectory(folder);
                Reset();
            }

            if (!string.IsNullOrEmpty(SourceDb) && !string.IsNullOrEmpty(CdmDb) && !string.IsNullOrEmpty(VocabDb))
            {
                folder = Path.Combine("Building", $"{SourceDb}_{CdmDb}_{VocabDb}");
                if (!Directory.Exists(folder))
                {
                    Directory.CreateDirectory(folder);
                    Reset();
                }
            }

            Folder = folder;

            var xmlSerializer = new XmlSerializer(GetType());
            using (StringWriter textWriter = new StringWriter())
            {
                xmlSerializer.Serialize(textWriter, this);
                lock (_threadlock)
                {
                    File.WriteAllText($@"{folder}\Settings.xml", textWriter.ToString());
                }
            }

            if (reloadVendorSettings)
                SetVendorSettings(Settings.Current.Building.CdmEngine.Database.ToName());
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

            var buildingSettings = new CdmFrameworkImport.BuildingSettings(0, VendorToProcess, EtlLibraryPath);
            EtlLibrary.LoadVendorSettings(EtlLibraryPath, buildingSettings);

            TempReplaceQuery(buildingSettings.SourceQueryDefinitions, new string[] { "CPRD - Additional" });

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

        /// <summary>
        /// Fix queries locally to make them compatible with DB-specific optimizations. New queries should be in TempReplaceQueries Altered and Original folders
        /// </summary>
        /// <param name="vendorQueryNameToReplace">Specify which queries are to be rewritten. Only use this if necessary, othrwwise pass null</param>
        private void TempReplaceQuery(List<QueryDefinition> frameworkDefinitions, string[] vendorQueryNameToReplace)
        {
            if (vendorQueryNameToReplace == null || vendorQueryNameToReplace.Length == 0)
                return;

            var vendorQueries = vendorQueryNameToReplace
                .Where(s => s.Contains(VendorToProcess.Name, StringComparison.CurrentCultureIgnoreCase))
                .Select(s => s.Replace(VendorToProcess.Name, "", StringComparison.CurrentCultureIgnoreCase).Trim().Trim('-').Trim())
                .ToList();

            foreach (var queryName in vendorQueries)
            {
                var frameworkDefinition = frameworkDefinitions.First(s => s.FileName.Equals(queryName, StringComparison.CurrentCultureIgnoreCase));
                TempReplaceQuery(frameworkDefinition, VendorToProcess.Name, queryName);
            }
        }

        private void TempReplaceQuery(QueryDefinition targetQD, string VendorName, string queryName)
        {
            var localFiles = EmbeddedResourceManager.ReadEmbeddedResources("cdm.presentation.builder", queryName);
            var vendorFiles = localFiles.Where(s => s.Key.Contains(VendorName, StringComparison.CurrentCultureIgnoreCase)).ToDictionary();
            if (vendorFiles.Count > 2)
                throw new Exception("Multiple resources were found for replacing TempReplaceQueries." + VendorName + ", " + queryName + "!");
            if (vendorFiles.Count == 0)
                throw new Exception("No resources were found for replacing TempReplaceQueries." + VendorName + ", " + queryName + "!");

            var original = vendorFiles.First(s => s.Key.Contains("Original")); //copy from EtlLibrary
            var altered = vendorFiles.First(s => s.Key.Contains("Altered"));            
            var actualQuery = targetQD.Query.Text.Contains("<Query>") && targetQD.Query.Text.Contains("</Query>")
                ? targetQD.Query.Text.Split(new[] { "<Query>", "</Query>" }, StringSplitOptions.None)[1]
                : targetQD.Query.Text;

            var actualQueryNormalized = new string(actualQuery.ToLower().SkipWhile(s => s != 's' || s != 'w').ToArray())//select, with
                .Replace("  ", " ").Trim();
            var originalNormalized = new string(original.Value.ToLower().SkipWhile(s => s != 's' || s != 'w').ToArray())//select, with
                .Replace("  ", " ").Trim();

            if (actualQueryNormalized != originalNormalized)
                //altered query should be manually changed or not be used at this point
                throw new Exception("Original saved SQL differs from the actual SQL from ETL library for " + VendorName + " - " + queryName + "!");

            targetQD.Query.Text = targetQD.Query.Text.Replace(actualQuery, altered.Value);
            Console.WriteLine("Script for " + queryName + " has been altered!");
        }

        #endregion
    }
}