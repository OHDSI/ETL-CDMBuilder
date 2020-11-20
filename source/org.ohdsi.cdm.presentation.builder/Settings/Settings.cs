using System.Configuration;
using System.IO;

namespace org.ohdsi.cdm.presentation.builder
{
    public class Settings
    {

        #region Properties
        public static Settings Current { get; set; }
        public BuildingSettings Building { get; set; }

        public string BuilderFolder { get; set; }

        public int DegreeOfParallelism => int.Parse(ConfigurationManager.AppSettings["DegreeOfParallelism"]);


        static Settings()
        {
            Current = new Settings();
        }

        public string DropVocabularyTablesScript => File.ReadAllText(
            Path.Combine(BuilderFolder, "ETL", "Common", "Scripts", Building.DestinationEngine.Database.ToString(), GetCdmVersionFolder(), "DropVocabularyTables.sql"));

        public string TruncateWithoutLookupTablesScript => File.ReadAllText(
            Path.Combine(BuilderFolder, "ETL", "Common", "Scripts", Building.DestinationEngine.Database.ToString(), GetCdmVersionFolder(), "TruncateWithoutLookupTables.sql"));

        public string TruncateTablesScript => File.ReadAllText(
            Path.Combine(BuilderFolder, "ETL", "Common", "Scripts", Building.DestinationEngine.Database.ToString(), GetCdmVersionFolder(), "TruncateTables.sql"));

        public string DropTablesScript => File.ReadAllText(
            Path.Combine(BuilderFolder, "ETL", "Common", "Scripts", Building.DestinationEngine.Database.ToString(), GetCdmVersionFolder(), "DropTables.sql"));

        public string TruncateLookupScript => File.ReadAllText(
            Path.Combine(BuilderFolder, "ETL", "Common", "Scripts", Building.DestinationEngine.Database.ToString(), GetCdmVersionFolder(), "TruncateLookup.sql"));

        public string CreateCdmTablesScript => File.ReadAllText(
            Path.Combine(BuilderFolder, "ETL", "Common", "Scripts", Building.DestinationEngine.Database.ToString(),
                         GetCdmVersionFolder(), "CreateTables.sql"));

        public string CreateCdmDatabaseScript => File.ReadAllText(
            Path.Combine(new[] {
                BuilderFolder,
                "ETL",
                "Common",
                "Scripts",
                Building.DestinationEngine.Database.ToString(),
                "CreateDestination.sql"
            }));

        #endregion

        #region Methods
        public static void Initialize()
        {
            Current.Building = new BuildingSettings();
            Current.Building.Load();
        }

        public void Save(bool reloadVendorSettings)
        {
            Current.Building.Save(reloadVendorSettings);
        }

        public void Load()
        {
            Current.Building.Load();
        }

        private string GetCdmVersionFolder()
        {
            return ConfigurationManager.AppSettings["CDM"];
        }

        #endregion
    }
}
