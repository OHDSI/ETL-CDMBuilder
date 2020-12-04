using Microsoft.Extensions.Configuration;
using org.ohdsi.cdm.framework.common.Definitions;
using org.ohdsi.cdm.framework.common.Enums;
using org.ohdsi.cdm.framework.common.Extensions;
using org.ohdsi.cdm.framework.desktop.Databases;
using System;
using System.Collections.Generic;
using System.IO;
using System.IO.Compression;

namespace org.ohdsi.cdm.presentation.builderwebapi
{
    public class Settings
    {
        private readonly IConfiguration _configuration;

        public CdmVersions Cdm
        {
            get
            {
                if (ConversionSettings.CdmVersion == "v5.3")
                    return CdmVersions.V53;

                return CdmVersions.V6;
            }
        }


        public IDatabaseEngine SourceEngine
        {
            get
            {
                if (ConversionSettings.SourceEngine == "postgre")
                    return new PostgreDatabaseEngine();

                if (ConversionSettings.SourceEngine == "mysql")
                    return new MySqlDatabaseEngine();

                return new MssqlDatabaseEngine();
            }
        }

        public IDatabaseEngine DestinationEngine
        {
            get
            {
                if (ConversionSettings.DestinationEngine == "postgre")
                    return new PostgreDatabaseEngine();

                if (ConversionSettings.DestinationEngine == "mysql")
                    return new MySqlDatabaseEngine();

                return new MssqlDatabaseEngine();
            }
        }

        public IDatabaseEngine VocabularyEngine
        {
            get
            {
                if (ConversionSettings.VocabularyEngine == "postgre")
                    return new PostgreDatabaseEngine();

                if (ConversionSettings.VocabularyEngine == "mysql")
                    return new MySqlDatabaseEngine();

                return new MssqlDatabaseEngine();
            }
        }

        public string SourceConnectionString
        {
            get
            {
                return GetConnectionString(ConversionSettings.SourceEngine,
                                           ConversionSettings.SourceServer,
                                           ConversionSettings.SourceDatabase,
                                           ConversionSettings.SourceUser,
                                           ConversionSettings.SourcePassword);
            }
        }

        public string DestinationConnectionString
        {
            get
            {
                return GetConnectionString(ConversionSettings.DestinationEngine,
                                           ConversionSettings.DestinationServer,
                                           ConversionSettings.DestinationDatabase,
                                           ConversionSettings.DestinationUser,
                                           ConversionSettings.DestinationPassword);
            }
        }
        public string VocabularyConnectionString
        {
            get
            {
                return GetConnectionString(ConversionSettings.VocabularyEngine,
                                           ConversionSettings.VocabularyServer,
                                           ConversionSettings.VocabularyDatabase,
                                           ConversionSettings.VocabularyUser,
                                           ConversionSettings.VocabularyPassword);
            }
        }

        public ConversionSettings ConversionSettings { get; private set; }
        public string Folder { get; private set; }
        public string BatchScript { get; set; }
        public Dictionary<string, string> Lookups;

        public List<QueryDefinition> SourceQueryDefinitions { get; private set; }

        public Settings(ConversionSettings settings, IConfiguration configuration)
        {
            _configuration = configuration;
            Folder = AppContext.BaseDirectory;

            ConversionSettings = settings;
            Lookups = new Dictionary<string, string>();
            SourceQueryDefinitions = new List<QueryDefinition>();
        }

        public void Load()
        {
            var mappingsDir = Path.Combine(Folder, "mappings");
            var mappingsFile = Path.Combine(mappingsDir, ConversionSettings.MappingsName + ".zip");

            using ZipArchive archive = ZipFile.OpenRead(mappingsFile);
            foreach (var item in archive.Entries)
            {
                using var stream = item.Open();
                using StreamReader reader = new StreamReader(stream);

                var content = reader.ReadToEnd();
                if (item.FullName.StartsWith("Definitions"))
                {
                    // TMP
                    content = content.Replace("<Person>", "<Persons>");
                    content = content.Replace("</Person>", "</Persons>");

                    if (item.Name.Replace(".xml", "").ToLower() == "l_location")
                    {
                        content = content.Replace("<Location>", "<Locations>");
                        content = content.Replace("</Location>", "</Locations>");

                        content = content.Replace("<LocationId>", "<Id>");
                        content = content.Replace("</LocationId>", "</Id>");
                    }

                    if (item.Name.Replace(".xml", "").ToLower() == "l_care_site")
                    {
                        content = content.Replace("<CareSite>", "<CareSites>");
                        content = content.Replace("</CareSite>", "</CareSites>");

                        content = content.Replace("<CareSiteId>", "<Id>");
                        content = content.Replace("</CareSiteId>", "</Id>");
                    }

                    content = content.Replace("<VisitStartDate>", "<StartDate>");
                    content = content.Replace("</VisitStartDate>", "</StartDate>");

                    content = content.Replace("<VisitEndDate>", "<EndDate>");
                    content = content.Replace("</VisitEndDate>", "</EndDate>");

                    content = content.Replace("<ConceptIdMapper>", "<ConceptIdMappers>");
                    content = content.Replace("</ConceptIdMapper>", "</ConceptIdMappers>");

                    var qd = new QueryDefinition().DeserializeFromXml(content);

                    if (qd.Persons != null)
                    {
                        if (qd.Persons[0].Concepts.Length > 0)
                        {
                            qd.Persons[0].Gender = qd.Persons[0].Concepts[0].Fields[0].SourceKey;
                        }

                        qd.Persons[0].StartDate = "observation_period_start_date";
                        qd.Persons[0].EndDate = "observation_period_end_date";
                    }

                    qd.FileName = item.Name.Replace(".xml", "");
                    SourceQueryDefinitions.Add(qd);
                }
                else if (item.FullName.StartsWith("Lookups"))
                {
                    Lookups.Add(item.Name.Replace(".sql", ""), content);
                }
                else if (item.FullName.StartsWith("Batch.sql"))
                {
                    BatchScript = content;
                }
            }
        }

        public string DropVocabularyTablesScript => File.ReadAllText(
            Path.Combine(Folder, "ETL", "Common", "Scripts", ConversionSettings.DestinationEngine, ConversionSettings.CdmVersion, "DropVocabularyTables.sql"));

        public string TruncateWithoutLookupTablesScript => File.ReadAllText(
            Path.Combine(Folder, "ETL", "Common", "Scripts", ConversionSettings.DestinationEngine, ConversionSettings.CdmVersion, "TruncateWithoutLookupTables.sql"));

        public string TruncateTablesScript => File.ReadAllText(
            Path.Combine(Folder, "ETL", "Common", "Scripts", ConversionSettings.DestinationEngine, ConversionSettings.CdmVersion, "TruncateTables.sql"));

        public string DropTablesScript => File.ReadAllText(
            Path.Combine(Folder, "ETL", "Common", "Scripts", ConversionSettings.DestinationEngine, ConversionSettings.CdmVersion, "DropTables.sql"));

        public string TruncateLookupScript => File.ReadAllText(
            Path.Combine(Folder, "ETL", "Common", "Scripts", ConversionSettings.DestinationEngine, ConversionSettings.CdmVersion, "TruncateLookup.sql"));

        public string CreateCdmTablesScript => File.ReadAllText(
            Path.Combine(Folder, "ETL", "Common", "Scripts", ConversionSettings.DestinationEngine,
                         ConversionSettings.CdmVersion, "CreateTables.sql"));

        public string CreateCdmDatabaseScript => File.ReadAllText(
            Path.Combine(new[] {
                Folder,
                "ETL",
                "Common",
                "Scripts",
                ConversionSettings.DestinationEngine,
                "CreateDestination.sql"
            }));

        private string GetConnectionString(string dbType, string server, string db, string user, string pswd)
        {
            return _configuration[dbType].Replace("{server}", server).Replace("{database}", db).Replace("{username}", user)
                .Replace("{password}", pswd);
        }

    }
}