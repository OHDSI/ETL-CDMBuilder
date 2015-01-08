using System.IO;

namespace org.ohdsi.cdm.framework.core
{
   public class Settings
   {
      #region Properties
      public static Settings Current { get; set; }
      public BuildingSettings Building { get; private set; }
      public BuilderSettings Builder { get; private set; }

      public string ResultFolder { get; private set; }
      
      public string CreateCDMTablesScript
      {
         get { return File.ReadAllText(Path.Combine(Builder.Folder, @"Common\CreateTables.sql")); }
      }

      public string CreateCDMDatabaseScript
      {
         get { return File.ReadAllText(Path.Combine(Builder.Folder, @"Common\CreateDestination.sql")); }
      }

      public string CopyVocabularyScript
      {
         get { return File.ReadAllText(Path.Combine(Builder.Folder, @"Common\CopyVocabulary.sql")); }
      }

      public string CreateIndexesScript
      {
         get { return File.ReadAllText(Path.Combine(Builder.Folder, @"Common\CreateIndexes.sql")); }
      }
      #endregion

      #region Methods
      public static void Initialize(string builderConnectionString, string machineName)
      {
         Current = new Settings();
         Current.Building = new BuildingSettings(builderConnectionString);
         Current.Builder = new BuilderSettings(machineName);
         Current.Builder.Load();

         if (Current.Builder.BuildingId.HasValue)
            Current.Building.Load(Current.Builder.BuildingId.Value);
      }

      public void Save()
      {
         Current.Building.Save();
         Current.Builder.BuildingId = Current.Building.Id;
         Current.Builder.Save();
      }
      #endregion
   }
}
