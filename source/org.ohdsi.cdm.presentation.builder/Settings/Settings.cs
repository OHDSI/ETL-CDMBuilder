using System.Configuration;
using System.IO;
using System.Reflection;

namespace org.ohdsi.cdm.presentation.builder
{
    public class Settings
    {

        #region Properties
        public static Settings Current { get; set; }
        public BuildingSettings Building { get; set; }

        public string BuilderFolder { get; set; }

        public int DegreeOfParallelism => int.Parse(ConfigurationManager.AppSettings["DegreeOfParallelism"]);

        public bool OnlyEvenChunks => bool.Parse(ConfigurationManager.AppSettings["OnlyEvenChunks"]);
        public bool OnlyOddChunks => bool.Parse(ConfigurationManager.AppSettings["OnlyOddChunks"]);

        public int ChunksFrom => int.Parse(ConfigurationManager.AppSettings["ChunksFrom"]);
        public int ChunksTo => int.Parse(ConfigurationManager.AppSettings["ChunksTo"]);

        public string DropVocabularyTablesScript { get; private set; } = ReadEmbeddedResource("DropVocabularyTables.sql");

        public string TruncateWithoutLookupTablesScript { get; private set; } = ReadEmbeddedResource("TruncateWithoutLookupTables.sql");

        public string TruncateTablesScript { get; private set; } = ReadEmbeddedResource("TruncateTables.sql");

        public string DropTablesScript { get; private set; } = ReadEmbeddedResource("DropTables.sql");

        public string TruncateLookupScript { get; private set; } = ReadEmbeddedResource("TruncateLookup.sql");

        public string CreateCdmTablesScript { get; private set; } = ReadEmbeddedResource("CreateTables.sql");

        public string CreateCdmDatabaseScript { get; private set; } = ReadEmbeddedResource("CreateDestination.sql");

        #endregion

        static Settings()
        {
            Current = new Settings();
            Current.Building = new BuildingSettings();
            Current.Building.Load();
        }

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
