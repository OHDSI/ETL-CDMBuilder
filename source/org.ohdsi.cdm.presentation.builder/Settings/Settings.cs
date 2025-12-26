using org.ohdsi.cdm.framework.common.Extensions;
using org.ohdsi.cdm.presentation.builder.Utility;
using Spectre.Console;
using System.Linq;
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
            var requiredVersion = getVersion(Settings.Current.Building.Cdm.ToName());

            var frameworkResources = EmbeddedResourceManager.ReadEmbeddedResources("org.ohdsi.cdm.framework", resourceName, StringComparison.CurrentCultureIgnoreCase);
            var frameworkFiltered = frameworkResources
                .Where(s => s.Key.Contains(Current.Building.CdmEngine.Database.ToName(), StringComparison.InvariantCultureIgnoreCase))
                .OrderByDescending(s => getVersion(s.Key))
                .ToList()
                ;

            var overwrites = new Dictionary<string, string>();
            if (!string.IsNullOrEmpty(Settings.Current.Building.QueryOverwriteFolderPath)
                && Directory.Exists(Settings.Current.Building.QueryOverwriteFolderPath))
            {
                var dbDir = Directory.GetDirectories(Settings.Current.Building.QueryOverwriteFolderPath)
                    .Select(s => new DirectoryInfo(s))
                    .FirstOrDefault(s => s.Name.Contains(Current.Building.CdmEngine.Database.ToName(), StringComparison.InvariantCultureIgnoreCase));

                if (dbDir != null)
                {
                    var files = Directory.GetFiles(dbDir.FullName)
                        .Select(s => new FileInfo(s))
                        .ToList();

                    foreach (var file in files)
                    {
                        overwrites[file.Name] = File.ReadAllText(file.FullName);
                    }
                }
            }

            var frameworkResource = frameworkFiltered.First(s => getVersion(s.Key) <= requiredVersion);
            var overwrite = overwrites.FirstOrDefault(s => s.Key.Replace(".sql", "").Split('.').Last() == frameworkResource.Key.Replace(".sql", "").Split('.').Last());

            var result = frameworkResource.Value;

            if (overwrite.Value != null)
            {
                result = overwrite.Value;
                AnsiConsole.MarkupLine($"\r\n[yellow]File {overwrite.Key} was overwritten![/]\r\n");
            }

            return result;
        }

        static float getVersion(string resourceKey)
        {
            var cleaned = new string(resourceKey.Where(s => char.IsDigit(s) || s == '.').ToArray()).Trim('.');
            if (!cleaned.Contains(".") && cleaned.Length > 0)
                cleaned = cleaned.Insert(cleaned.Length - 1, ".");
            
            if (float.TryParse(cleaned, out float result))
            {                
                return result;
            }
            else
                return 0;            
        }

        #endregion
    }
}
