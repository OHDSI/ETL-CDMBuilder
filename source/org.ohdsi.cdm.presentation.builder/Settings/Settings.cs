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

            var presentationResources = EmbeddedResourceManager.ReadEmbeddedResources("org.ohdsi.cdm.presentation.builder", resourceName, StringComparison.CurrentCultureIgnoreCase);
            var presentationFiltered = presentationResources
                .Where(s => s.Key.Contains(Current.Building.CdmEngine.Database.ToName(), StringComparison.InvariantCultureIgnoreCase))
                .OrderByDescending(s => getVersion(s.Key))
                .ToList()
                ;

            var frameworkResource = frameworkFiltered.First(s => getVersion(s.Key) <= requiredVersion);
            var presentationResource = presentationFiltered.FirstOrDefault(s => getVersion(s.Key) <= requiredVersion);

            var result = frameworkResource.Value;

            if (presentationResource.Value != null)
            {
                result = presentationResource.Value;
                AnsiConsole.MarkupLine($"\r\n[yellow]File {presentationResource.Key} was overwritten![/]\r\n");
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
