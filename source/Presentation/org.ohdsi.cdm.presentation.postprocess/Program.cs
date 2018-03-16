using System;
using System.Configuration;
using System.IO;
using org.ohdsi.cdm.framework.core;
using org.ohdsi.cdm.framework.shared.Enums;
using org.ohdsi.cdm.presentation.postprocess.Processes.Achilles;
using org.ohdsi.cdm.presentation.postprocess.Processes.Pregnancy;

namespace org.ohdsi.cdm.presentation.postprocess
{
   class Program
   {
      readonly static PostprocessSettings PostprocessSettings = new PostprocessSettings();
      static void Main(string[] args)
      {
         Initialize();

         if (Settings.Current.Building.DestinationEngine.Database != Database.Redshift)
         {
            Logger.Write(Settings.Current.Builder.Id, Settings.Current.Building.Id, null, LogMessageTypes.Error, "Post Process supports only Amazon Redshift database.");
            return;
         }

         Logger.Write(Settings.Current.Builder.Id, Settings.Current.Building.Id, null, LogMessageTypes.Debug, "postprocess running...");

         
         RunProcess(new AchillesProcess(PostprocessSettings), PostprocessSettingName.Achilles);
         RunProcess(new PregnancyProcess(PostprocessSettings), PostprocessSettingName.Pregnancy);
         
         
         Logger.Write(Settings.Current.Builder.Id, Settings.Current.Building.Id, null, LogMessageTypes.Debug, "postprocess complete");
      }

      private static void Initialize()
      {
         try
         {
            var config = ConfigurationManager.OpenExeConfiguration(Path.Combine(Environment.CurrentDirectory, "org.ohdsi.cdm.presentation.buildingmanager.exe"));

            Settings.Initialize(config.ConnectionStrings.ConnectionStrings["Builder"].ConnectionString,
               Environment.MachineName);

            PostprocessSettings.Load();
         }
         catch (Exception e)
         {
            File.WriteAllText(Path.Combine(Environment.CurrentDirectory, "postprocess_error.txt"), Logger.CreateExceptionString(e));
            Logger.WriteError(e);
         }
      }

      private static void RunProcess(IPostprocess process, PostprocessSettingName settingName)
      {
         if (string.IsNullOrEmpty(PostprocessSettings.GetSettingValue(Settings.Current.Building.Vendor, Settings.Current.Building.LoadId, settingName)))
            return;

         try
         {
            Logger.Write(Settings.Current.Builder.Id, Settings.Current.Building.Id, null, LogMessageTypes.Debug, string.Format("postprocess {0} running...", settingName));
            process.Run();
            Logger.Write(Settings.Current.Builder.Id, Settings.Current.Building.Id, null, LogMessageTypes.Debug, string.Format("postprocess {0} complete", settingName));
         }
         catch (Exception e)
         {
            Logger.Write(Settings.Current.Builder.Id, Settings.Current.Building.Id, null, LogMessageTypes.Error, Logger.CreateExceptionString(e));
         }
      }
   }
}
