using org.ohdsi.cdm.framework.common.Definitions;
using org.ohdsi.cdm.framework.common.Enums;
using org.ohdsi.cdm.framework.common.Extensions;
using org.ohdsi.cdm.framework.desktop.Databases;
using System.Configuration;
using System.Xml.Serialization;

namespace org.ohdsi.cdm.presentation.builder
{
    public class BuildingSettings
    {

        private static object _threadlock;

        [XmlIgnore]
        public string Folder { get; private set; }
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

        public List<int> CompletedChunkIds { get; set; }

        public int ChunksCount { get; set; }

        public string PersonBuilder
        {
            get
            {
                return ConfigurationManager.AppSettings["PersonBuilder"];
            }
        }

        public string Vendor
        {
            get
            {
                return ConfigurationManager.AppSettings["Vendor"];
            }
        }

        public string VendorFolder
        {
            get
            {
                switch (Vendor)
                {
                    default:
                        throw new NotImplementedException($"Vendor {Vendor} is not supported");
                    case "Seer":
                        return @"ETL\SEER";
                    case "Nhanes":
                        return @"ETL\NHANES";
                    case "OptumPanther":
                        return @"ETL\OPTUMPANTHER";
                    case "Cerner":
                        return @"ETL\CERNER";
                    case "HealthVerity":
                        return @"ETL\HEALTHVERITY";
                    case "Premier":
                        return @"ETL\PREMIER";
                    case "Jmdc":
                        return @"ETL\JMDC";
                    case "Cprd":
                        return @"ETL\CPRD";
                    case "Hcup":
                        return @"ETL\HCUP";
                    case "CprdHES":
                        return @"ETL\CPRDHES";
                }
            }
        }

        public CdmVersions Cdm
        {
            get
            {
                if (ConfigurationManager.AppSettings["CDM"] == "v5.3")
                    return CdmVersions.V53;

                return CdmVersions.V6;
            }
        }


        #region Properties

        [XmlIgnore]
        public List<QueryDefinition> SourceQueryDefinitions { get; set; }

        [XmlIgnore]
        public int Batches { get; set; }

        [XmlIgnore]
        public int ChunkSize => int.Parse(ConfigurationManager.AppSettings["ChunkSize"]);

        [XmlIgnore]
        public string BatchScript { get; set; }

        [XmlIgnore]
        public IDatabaseEngine SourceEngine
        {
            get
            {
                var conStrings = ConfigurationManager.ConnectionStrings;
                foreach (var conString in conStrings)
                {
                    var conStringTyped = (ConnectionStringSettings)conString;
                    if (!conStringTyped.Name.Contains("Source"))
                        continue;

                    if (conStringTyped.Name.ToLower().Contains("postgre"))
                        return new PostgreDatabaseEngine();

                    if (conStringTyped.Name.ToLower().Contains("mysql"))
                        return new MySqlDatabaseEngine();

                    if (conStringTyped.Name.ToLower().Contains("redshift"))
                        return new RedshiftDatabaseEngine();

                    if (conStringTyped.Name.ToLower().Contains("mssql"))
                        return new MssqlDatabaseEngine();
                }
                throw new KeyNotFoundException("Failed to find relevant DB engine!");
            }
        }

        [XmlIgnore]
        public IDatabaseEngine DestinationEngine
        {
            get
            {
                var conStrings = ConfigurationManager.ConnectionStrings;
                foreach (var conString in conStrings)
                {
                    var conStringTyped = (ConnectionStringSettings)conString;
                    if (!conStringTyped.Name.Contains("Destination"))
                        continue;

                    if (conStringTyped.Name.ToLower().Contains("postgre"))
                        return new PostgreDatabaseEngine();

                    if (conStringTyped.Name.ToLower().Contains("mysql"))
                        return new MySqlDatabaseEngine();

                    if (conStringTyped.Name.ToLower().Contains("redshift"))
                        return new RedshiftDatabaseEngine();

                    if (conStringTyped.Name.ToLower().Contains("mssql"))
                        return new MssqlDatabaseEngine();
                }
                throw new KeyNotFoundException("Failed to find relevant DB engine!");
            }
        }

        [XmlIgnore]
        public IDatabaseEngine VocabularyEngine
        {
            get
            {
                var conStrings = ConfigurationManager.ConnectionStrings;
                foreach (var conString in conStrings)
                {
                    var conStringTyped = (ConnectionStringSettings)conString;
                    if (!conStringTyped.Name.Contains("Vocabulary"))
                        continue;

                    if (conStringTyped.Name.ToLower().Contains("postgre"))
                        return new PostgreDatabaseEngine();

                    if (conStringTyped.Name.ToLower().Contains("mysql"))
                        return new MySqlDatabaseEngine();

                    if (conStringTyped.Name.ToLower().Contains("redshift"))
                        return new RedshiftDatabaseEngine();

                    if (conStringTyped.Name.ToLower().Contains("mssql"))
                        return new MssqlDatabaseEngine();
                }
                throw new KeyNotFoundException("Failed to find relevant DB engine!");
            }
        }

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
                    if (!conStringTyped.Name.Contains(SourceEngine.Database.ToName()))
                        continue;

                    var result = conStringTyped.ConnectionString.Replace("{server}", CdmServer)
                        .Replace("{database}", CdmDb).Replace("{username}", CdmUser)
                        .Replace("{password}", CdmPswd);

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

                    var result = conStringTyped.ConnectionString.Replace("{server}", SourceServer)
                        .Replace("{database}", SourceDb).Replace("{username}", SourceUser)
                        .Replace("{password}", SourcePswd);

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
                    if (!conStringTyped.Name.Contains(SourceEngine.Database.ToName()))
                        continue;

                    var result = conStringTyped.ConnectionString.Replace("{server}", VocabServer)
                        .Replace("{database}", VocabDb).Replace("{username}", VocabUser)
                        .Replace("{password}", VocabPswd);

                    return result;
                }
                throw new KeyNotFoundException(VocabServer + " connection string for vocabulary was not found!");
            }
        }

        #endregion

        public BuildingSettings()
        {
            CompletedChunkIds = new List<int>();
            BuildingState = new Building();
            ChunksCount = 0;
            _threadlock = new object();
        }

        #region Methods

        private void SetVendorSettings()
        { 
            var batch = "Batch.sql";
            if (File.Exists(Path.Combine(VendorFolder, batch)))
            {
                BatchScript = File.ReadAllText(Path.Combine(VendorFolder, batch));
            }

            var folder = Path.Combine(VendorFolder, "Definitions");
            if (Directory.Exists(folder))
            {
                var files = Directory.GetFiles(folder);
                if (files.Length > 0)
                {
                    SourceQueryDefinitions = files.Select(
                        definition =>
                        {
                            var qd = new QueryDefinition().DeserializeFromXml(File.ReadAllText(definition));
                            var fileInfo = new FileInfo(definition);
                            qd.FileName = fileInfo.Name.Replace(fileInfo.Extension, "");

                            return qd;
                        }).ToList();
                }
            }

            Settings.Current.Building.SourceQueryDefinitions = SourceQueryDefinitions;
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
                    CompletedChunkIds = bs.CompletedChunkIds;
                    ChunksCount = bs.ChunksCount;

                    Settings.Current.Building = bs;

                    Settings.Current.Building.RawSourceConnectionString = SourceConnectionString + "sc=" + SourceSchema + ";";
                    Settings.Current.Building.RawDestinationConnectionString = DestinationConnectionString + "sc=" + CdmSchema + ";";
                    Settings.Current.Building.RawVocabularyConnectionString = VocabularyConnectionString + "sc=" + VocabSchema + ";";
                }
            }
            else
                Settings.Current.Building = new BuildingSettings();
        }

        public void Reset()
        {
            BuildingState = new Building();
            CompletedChunkIds = new List<int>();
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
                SetVendorSettings();
        }

        #endregion
    }
}