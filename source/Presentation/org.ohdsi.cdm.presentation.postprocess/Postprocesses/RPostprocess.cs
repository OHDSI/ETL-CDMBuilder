using System;
using System.Diagnostics;
using Microsoft.Win32;
using org.ohdsi.cdm.framework.core;

namespace org.ohdsi.cdm.presentation.postprocess.Postprocesses
{
   internal class RPostprocess : IPostprocess
   {
      public const int TIMEOUT = 72*60*60*1000; // 72 hour timeout
      private readonly PostprocessSettings settings;

      public RPostprocess(PostprocessSettings settings)
      {
         this.settings = settings;
      }

      public static bool ExistsOnPath(string exeName)
      {
         var psi = new ProcessStartInfo
         {
            UseShellExecute = false,
            Arguments = "--help",
            FileName = exeName
         };
         var p = new Process {StartInfo = psi};
         try
         {
            p.Start();
            p.WaitForExit();
         }
         catch (System.ComponentModel.Win32Exception)
         {
            return false;
         }
         return p.ExitCode == 0;
      }

      public static string RInstallPath()
      {
         RegistryKey key = null;
         try
         {
            if (ExistsOnPath("rscript"))
               return "rscript";

            key = Registry.LocalMachine.OpenSubKey(@"SOFTWARE\R-core\R64");
            if (key == null)
            {
               key = Registry.LocalMachine.OpenSubKey(@"SOFTWARE\R-core\R");
            }

            if (key != null)
            {
               var o = key.GetValue("InstallPath");
               if (o != null)
               {
                  return o.ToString();
               }
            }
            Logger.WriteError(new Exception("R installation not found."));
            return string.Empty;
         }
         catch (Exception ex)
         {
            Logger.WriteError(ex);
            return string.Empty;
         }
         finally
         {
            if (key != null)
               key.Dispose();
         }
      }

      public string GetSetting(PostprocessSettingName settingName)
      {
         return settings.GetSettingValue(Settings.Current.Building.Vendor, Settings.Current.Building.Id.Value, settingName);
      }

      public virtual int Run()
      {
         throw new NotImplementedException();
      }
   }
}
