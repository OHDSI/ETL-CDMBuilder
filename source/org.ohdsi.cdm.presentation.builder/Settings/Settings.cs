using System.Configuration;
using System.IO;
using System.Reflection;
using org.ohdsi.cdm.framework.desktop.Databases;
using FrameworkSettings = org.ohdsi.cdm.framework.desktop.Settings.Settings;

namespace org.ohdsi.cdm.presentation.builder
{
    public class Settings
    {

        #region Properties

        public static Settings Current { get; set; }

        #region public BuildingSettings Building
        public BuildingSettings Building 
        {
            get => building;
            set 
            {
                building = value;
                FrameworkSettings.Current.Building = new framework.desktop.Settings.BuildingSettings(value.DestinationConnectionString);
            }
        }
        private BuildingSettings building; 
        #endregion

        #region public string BuilderFolder
        public string BuilderFolder
        {
            get => builderFolder;
            set
            {
                builderFolder = value;
                FrameworkSettings.Current.CDMFolder = value;
            }
        }
        private string builderFolder;
        #endregion

        #region public int DegreeOfParallelism
        public int DegreeOfParallelism
        {
            get => int.Parse(ConfigurationManager.AppSettings["DegreeOfParallelism"]);
            set 
            {
                degreeOfParallelism = value;
                FrameworkSettings.Current.ParallelChunks = FrameworkSettings.Current.ParallelQueries = value;                
            }
        }
        private int degreeOfParallelism;
        #endregion


        #region public int OnlyEvenChunks
        public bool OnlyEvenChunks
        {
            get => bool.Parse(ConfigurationManager.AppSettings["OnlyEvenChunks"]);
            set
            {
                onlyEvenChunks = value;                
            }
        }
        private bool onlyEvenChunks;
        #endregion

        #region public bool OnlyOddChunks
        public bool OnlyOddChunks
        { 
            get => bool.Parse(ConfigurationManager.AppSettings["OnlyOddChunks"]);
            set
            {
                onlyOddChunks = value;
            }
        }
        private bool onlyOddChunks;
        #endregion

        #region public int ChunksFrom
        public int ChunksFrom
        {
            get => int.Parse(ConfigurationManager.AppSettings["ChunksFrom"]);
            set 
            {
                chunksFrom = value;
            }
        }
        private int chunksFrom;
        #endregion

        #region public int ChunksTo
        public int ChunksTo
        {
            get => int.Parse(ConfigurationManager.AppSettings["ChunksTo"]);
            set
            {
                chunksTo = value;
            }
        }
        private int chunksTo;
        #endregion
        
        //scripts below in FrameworkSettings only have getters

        public string DropVocabularyTablesScript => ReadEmbeddedResource("DropVocabularyTables.sql");

        public string TruncateWithoutLookupTablesScript => ReadEmbeddedResource("TruncateWithoutLookupTables.sql");

        public string TruncateTablesScript => ReadEmbeddedResource("TruncateTables.sql");

        public string DropTablesScript => ReadEmbeddedResource("DropTables.sql");

        public string TruncateLookupScript => ReadEmbeddedResource("TruncateLookup.sql");

        public string CreateCdmTablesScript => ReadEmbeddedResource("CreateTables.sql");

        public string CreateCdmDatabaseScript => ReadEmbeddedResource("CreateDestination.sql");

        #endregion


        #region Methods

        public void Save(bool reloadVendorSettings)
        {
            Current.Building.Save(reloadVendorSettings);
        }

        private static string ReadEmbeddedResource(string resourceName)
        {
            var assemblies = AppDomain.CurrentDomain.GetAssemblies();
            foreach (var assembly in assemblies)
            {
                var resourceNames = assembly.GetManifestResourceNames();
                foreach (var resource in resourceNames)
                {
                    if (resource.EndsWith(resourceName, StringComparison.OrdinalIgnoreCase))
                    {
                        using (var stream = assembly.GetManifestResourceStream(resource))
                        {
                            if (stream == null)
                            {
                                throw new FileNotFoundException($"Embedded resource '{resource}' not found in assembly '{assembly.FullName}'.");
                            }

                            using (var reader = new StreamReader(stream))
                            {
                                return reader.ReadToEnd();
                            }
                        }
                    }
                }
            }

            throw new FileNotFoundException($"Embedded resource '{resourceName}' not found in any loaded assembly.");
        }

        #endregion
    }
}
