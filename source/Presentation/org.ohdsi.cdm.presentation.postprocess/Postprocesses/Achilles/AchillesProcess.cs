using System;
using System.Collections.Generic;
using System.Data.Odbc;
using System.Data.SqlClient;
using System.Diagnostics;
using System.IO;
using System.Text.RegularExpressions;
using System.Threading;
using org.ohdsi.cdm.framework.core;
using org.ohdsi.cdm.framework.shared.Enums;
using org.ohdsi.cdm.presentation.postprocess.Postprocesses;

namespace org.ohdsi.cdm.presentation.postprocess.Processes.Achilles
{
   internal class AchillesProcess : RPostprocess
   {

      public AchillesProcess(PostprocessSettings settings) : base(settings)
      {
      }
      public override int Run()
      {
         var rInstallPath = RInstallPath();
         if (!string.Equals(rInstallPath, "rscript", StringComparison.OrdinalIgnoreCase))
         {
            rInstallPath = Path.Combine(rInstallPath, @"bin\Rscript.exe");
            if (!(File.Exists(rInstallPath)))
               return 1;
         }

         // create Achilles JSON root folder if not exists
         var jsonPath = GetSetting(PostprocessSettingName.AchillesJsonFolder);
         
         if (string.IsNullOrWhiteSpace(jsonPath))
            jsonPath = Path.Combine(Environment.CurrentDirectory, @"achillesJson\" + Settings.Current.Building.LoadId);

         jsonPath = Path.GetFullPath(new Uri(jsonPath).LocalPath)
            .TrimEnd(Path.DirectorySeparatorChar, Path.AltDirectorySeparatorChar);
         if (!(Directory.Exists(jsonPath)))
            Directory.CreateDirectory(jsonPath);
         jsonPath = jsonPath.Replace("\\", "/");

         var odbcConnection = new OdbcConnectionStringBuilder(Settings.Current.Building.DestinationConnectionString);
         var server = odbcConnection["server"].ToString();
         var usr = odbcConnection["uid"].ToString();
         var pass = odbcConnection["pwd"].ToString();
         var schema = Settings.Current.Building.DestinationSchemaName;
         var db = odbcConnection["database"].ToString();
         var src = Settings.Current.Building.Vendor.ToString();

         var loadId = Settings.Current.Building.LoadId;

         var hixConnection = new SqlConnectionStringBuilder(Settings.Current.HIXConnectionString);
         var hixServer = hixConnection["Data Source"].ToString();
         var hixDb = hixConnection["Initial Catalog"].ToString();
         var hixUser = hixConnection["User Id"].ToString();
         var hixPass = hixConnection["Password"].ToString();
         var hixPort = "1433";

         var runCost = GetSetting(PostprocessSettingName.AchillesRunCostAnalysis);
         runCost = string.IsNullOrWhiteSpace(runCost) ? "TRUE" : runCost.Trim().ToUpper();


         var cdmV = Settings.Current.Building.CDM == CDMVersions.v501 ? "5.0.1" : "5";
         var resSchema = GetSetting(PostprocessSettingName.ResultsSchema);
         if (string.IsNullOrWhiteSpace(resSchema))
            resSchema = "cdm";

         var scratchSchema = GetSetting(PostprocessSettingName.ScratchSchema);
         if (string.IsNullOrWhiteSpace(scratchSchema))
            scratchSchema = "cdm";

         var numThreads = GetSetting(PostprocessSettingName.AchillesNumThreads);
         if (string.IsNullOrWhiteSpace(numThreads))
            numThreads = "1";
         
         var achillesParams = new Dictionary<string, string>
         {
            {"rsCluster", server},
            {"rsUser", usr},
            {"rsPassword", pass},
            {"rsDbSchema", schema},
            {"rsDbName", db},
            {"sourceName", src},
            {"achillesJsonFolder", jsonPath},
            {"loadId", loadId.ToString()},
            //{"runCostAnalysis", runCost},
            //{"cdmVersion", cdmV},
            //{"numThreads", numThreads},
            //{"resultsSchema", resSchema},
            //{"scratchSchema", scratchSchema},
            {"hixServer", hixServer},
            {"hixUser", hixUser},
            {"hixPassword", hixPass},
            {"hixDb", hixDb},
            {"hixPort", hixPort}
         };

         var script = File.ReadAllText(Path.Combine(Environment.CurrentDirectory, @"Postprocesses\Achilles\Achilles.R"));
         script = Regex.Replace(script, @"\{(.+?)\}", m => achillesParams[m.Groups[1].Value]);

         var scriptPath = Path.GetTempFileName();
         Logger.Write(null, LogMessageTypes.Info, script);
         File.WriteAllText(scriptPath, script);

         var processParameters = new ProcessStartInfo(rInstallPath)
         {
            Arguments = string.Format("\"{0}\" --vanilla --slave", scriptPath),
            CreateNoWindow = true,
            UseShellExecute = false,
            RedirectStandardError = true,
            RedirectStandardOutput = true
         };

         var r = new Process {StartInfo = processParameters};

         using (var outputWaitHandle = new AutoResetEvent(false))
         using (var errorWaitHandle = new AutoResetEvent(false))
         {
            r.OutputDataReceived += (sender, e) =>
            {
               if (e.Data == null)
               {
                  outputWaitHandle.Set();
               }
               else
               {
                  Logger.Write(null, LogMessageTypes.Info, e.Data);
               }
            };
            r.ErrorDataReceived += (sender, e) =>
            {
               if (e.Data == null)
               {
                  errorWaitHandle.Set();
               }
               else
               {
                  LogMessageTypes msgType;
                  msgType = e.Data == "Execution halted" || e.Data.StartsWith("Error")
                     ? LogMessageTypes.Error
                     : LogMessageTypes.Warning;

                  Logger.Write(null, msgType, e.Data);
               }
            };

            r.Start();
            r.BeginOutputReadLine();
            r.BeginErrorReadLine();

            if (!r.WaitForExit(TIMEOUT) || !outputWaitHandle.WaitOne(TIMEOUT) || !errorWaitHandle.WaitOne(TIMEOUT))
               throw new Exception("Achilles timed out.");

            if (File.Exists(scriptPath))
               File.Delete(scriptPath);

            return r.ExitCode;
         }
      }
   }
}
