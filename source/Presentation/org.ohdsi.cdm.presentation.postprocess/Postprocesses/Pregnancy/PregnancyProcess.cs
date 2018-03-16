using System;
using System.Collections.Generic;
using System.Data.Odbc;
using System.Diagnostics;
using System.IO;
using System.Text.RegularExpressions;
using System.Threading;
using org.ohdsi.cdm.framework.core;
using org.ohdsi.cdm.framework.shared.Enums;
using org.ohdsi.cdm.presentation.postprocess.Postprocesses;

namespace org.ohdsi.cdm.presentation.postprocess.Processes.Pregnancy
{
   internal class PregnancyProcess : RPostprocess
   {
      public PregnancyProcess(PostprocessSettings settings) : base(settings)
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
         
         var odbcConnection = new OdbcConnectionStringBuilder(Settings.Current.Building.DestinationConnectionString);
         var server = odbcConnection["server"].ToString();
         var usr = odbcConnection["uid"].ToString();
         var pass = odbcConnection["pwd"].ToString();
         var schema = Settings.Current.Building.DestinationSchemaName;
         var db = odbcConnection["database"].ToString();
         
         var resSchema = GetSetting(PostprocessSettingName.ResultsSchema);
         if (string.IsNullOrWhiteSpace(resSchema))
            resSchema = "cdm";
         
         var achillesParams = new Dictionary<string, string>
         {
            {"rsCluster", server},
            {"rsUser", usr},
            {"rsPassword", pass},
            {"rsCdmSchema", schema},
            {"rsDbName", db},
            {"rsResultsSchema", resSchema},

            {"awsAccessKeyId", Settings.Current.S3AwsAccessKeyId},
            {"awsSecretKey", Settings.Current.S3AwsSecretAccessKey},
            {"awsBucketName", Settings.Current.Bucket},
            {"awsObjectKey", "pregnancy"}
         };

         var script = File.ReadAllText(Path.Combine(Environment.CurrentDirectory, @"Postprocesses\Pregnancy\Pregnancy.R"));
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
               throw new Exception("Pregnancy timed out.");

            if (File.Exists(scriptPath))
               File.Delete(scriptPath);

            return r.ExitCode;
         }
      }
   }
}
