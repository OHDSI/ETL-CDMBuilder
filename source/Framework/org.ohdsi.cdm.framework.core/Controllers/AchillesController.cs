using System;
using System.Collections.Generic;
using System.Data.Odbc;
using System.IO;
using org.ohdsi.cdm.framework.shared.Enums;
using Microsoft.Win32;
using System.Text;
using System.Diagnostics;
using System.Threading;
using System.Text.RegularExpressions;
using System.Configuration;

namespace org.ohdsi.cdm.framework.core.Controllers
{
    public class AchillesController
    {
        private const int timeout = 12 * 60 * 60 * 1000; // 12 hour timeout
        private string script;
        private string rscriptPath;

        public AchillesController(string script)
        {
            this.script = script;
        }

        private static bool ExistsOnPath(string exeName)
        {
            var psi = new ProcessStartInfo
            {
                UseShellExecute = false,
                Arguments = "--help",
                FileName = exeName
            };
            var p = new Process { StartInfo = psi };
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

        private string RInstallPath()
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

        public int Run()
        {
            this.rscriptPath = RInstallPath();
            if (!string.Equals(this.rscriptPath, "rscript", StringComparison.OrdinalIgnoreCase))
            {
                this.rscriptPath = Path.Combine(this.rscriptPath, @"bin\Rscript.exe");
                if (!(File.Exists(rscriptPath)))
                    return 1;
            }

            // create Achilles JSON root folder if not exists
            var jsonPath = ConfigurationManager.AppSettings["achillesJsonFolder"];
            if (string.IsNullOrWhiteSpace(jsonPath))
                jsonPath = @"c:\temp\achillesJson";
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

            var loadId = ConfigurationManager.AppSettings["loadId"];

            var hixServer = ConfigurationManager.AppSettings["hixServer"];
            if (string.IsNullOrWhiteSpace(hixServer))
                hixServer = "";
            var hixDb = ConfigurationManager.AppSettings["hixDatabase"];
            if (string.IsNullOrWhiteSpace(hixDb))
                hixDb = "";
            var hixPort = ConfigurationManager.AppSettings["hixPort"];
            if (string.IsNullOrWhiteSpace(hixPort))
                hixPort = "1433";
            var hixUser = ConfigurationManager.AppSettings["hixUser"];
            if (string.IsNullOrWhiteSpace(hixUser))
                hixUser = "";
            var hixPass = ConfigurationManager.AppSettings["hixPassword"];

            var runCost = ConfigurationManager.AppSettings["runCostAnalysis"];
            if (string.IsNullOrWhiteSpace(runCost))
                runCost = "TRUE";
            else
                runCost = runCost.Trim().ToUpper();

            var cdmV = Settings.Current.Building.CDM == CDMVersions.v5 ? "5" : string.Empty;
            var resSchema = ConfigurationManager.AppSettings["resultsSchema"];
            if (string.IsNullOrWhiteSpace(resSchema))
                resSchema = "cdm";

            var achillesParams = new Dictionary<string, string>
            {
                {"rsCluster", server},
                {"rsUser", usr},
                {"rsPassword", pass},
                {"rsDbSchema", schema},
                {"rsDbName", db},
                {"sourceName", src},
                {"achillesJsonFolder", jsonPath},
                {"loadId", loadId},
                {"runCostAnalysis", runCost},
                {"cdmVersion", cdmV},
                {"resultsSchema", resSchema},
                {"hixServer", hixServer},
                {"hixUser", hixUser},
                {"hixPassword", hixPass},
                {"hixDb", hixDb},
                {"hixPort", hixPort}
            };

            script = Regex.Replace(script, @"\{(.+?)\}", m => achillesParams[m.Groups[1].Value]);

            var scriptPath = Path.GetTempFileName();
            Logger.Write(null, LogMessageTypes.Info, script);
            File.WriteAllText(scriptPath, script);

            //var output = new StringBuilder();
            //var error = new StringBuilder();

            var processParameters = new ProcessStartInfo(rscriptPath)
            {
                Arguments = string.Format("\"{0}\" --vanilla --slave", scriptPath),
                CreateNoWindow = true,
                UseShellExecute = false,
                RedirectStandardError = true,
                //RedirectStandardInput = true,
                RedirectStandardOutput = true
            };

            var r = new Process { StartInfo = processParameters };

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
                        //output.AppendLine(e.Data);
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
                        //error.AppendLine(e.Data);

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

                if (!r.WaitForExit(timeout) || !outputWaitHandle.WaitOne(timeout) || !errorWaitHandle.WaitOne(timeout))
                    throw new Exception("Achilles timed out.");

                if (File.Exists(scriptPath))
                    File.Delete(scriptPath);

                return r.ExitCode;
            }
        }
    }
}