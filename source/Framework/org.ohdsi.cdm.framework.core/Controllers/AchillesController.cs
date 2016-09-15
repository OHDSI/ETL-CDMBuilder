using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using org.ohdsi.cdm.framework.core.Databases;
using org.ohdsi.cdm.framework.data.DbLayer;
using org.ohdsi.cdm.framework.entities.Omop;
using org.ohdsi.cdm.framework.shared.Enums;
using org.ohdsi.cdm.framework.shared.Helpers;

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
        const int timeout = 12 * 60 * 60 * 1000; // 12 hour timeout
        private string script;
        private string rscriptPath;

        public AchillesController(string script)
        {
            this.script = script;                        
        }

        private string RInstallPath()
        {
            RegistryKey key = null;
            try
            {
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
            this.rscriptPath = Path.Combine(RInstallPath(), @"bin\Rscript.exe");
            if (!(File.Exists(rscriptPath)))
                return 1;

            var achillesParams = new Dictionary<string, string>();
            achillesParams.Add("rsCluster", ConfigurationManager.AppSettings["rsCluster"]);
            achillesParams.Add("rsUser", ConfigurationManager.AppSettings["rsUser"]);
            achillesParams.Add("rsPassword", ConfigurationManager.AppSettings["rsPassword"]);
            achillesParams.Add("rsDbSchema", ConfigurationManager.AppSettings["rsDbSchema"] ?? "cdm");
            achillesParams.Add("rsDbName", ConfigurationManager.AppSettings["rsDbName"]);
            achillesParams.Add("sourceName", Settings.Current.Building.Vendor.ToString());
            achillesParams.Add("achillesJsonFolder", ConfigurationManager.AppSettings["achillesJsonFolder"].Replace("\\", "/"));
            achillesParams.Add("loadId", ConfigurationManager.AppSettings["loadId"]);
            achillesParams.Add("runCostAnalysis", ConfigurationManager.AppSettings["runCostAnalysis"].ToUpper());
            achillesParams.Add("cdmVersion", Settings.Current.Building.CDM == CDMVersions.v5 ? "5" : string.Empty);
            achillesParams.Add("resultsSchema", ConfigurationManager.AppSettings["resultsSchema"]);

            script = Regex.Replace(script, @"\{(.+?)\}", m => achillesParams[m.Groups[1].Value]);

            var scriptPath = Path.GetTempFileName();
            File.WriteAllText(scriptPath, script);

            var output = new StringBuilder();
            var error = new StringBuilder();

            var ProcessParameters = new ProcessStartInfo(rscriptPath)
            {
                Arguments = string.Format("\"{0}\" --vanilla --slave", scriptPath),
                CreateNoWindow = true,
                UseShellExecute = false,
                RedirectStandardError = true,
                //RedirectStandardInput = true,
                RedirectStandardOutput = true
            };

            var r = new Process();
            r.StartInfo = ProcessParameters;

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
                        output.AppendLine(e.Data);
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
                        error.AppendLine(e.Data);

                        LogMessageTypes msgType;
                        if (e.Data.StartsWith("Error:"))
                            msgType = LogMessageTypes.Error;
                        else
                            msgType = LogMessageTypes.Warning;

                        Logger.Write(null, msgType, e.Data);
                    }
                };

                r.Start();

                //r.StandardInput.WriteLine(script);

                r.BeginOutputReadLine();
                r.BeginErrorReadLine();

                if (r.WaitForExit(timeout) &&
                    outputWaitHandle.WaitOne(timeout) &&
                    errorWaitHandle.WaitOne(timeout))
                {
                    if (File.Exists(scriptPath))
                        File.Delete(scriptPath);

                    return r.ExitCode;
                }
                else
                {
                    throw new Exception("Achilles timed out.");
                }
            }

        }
    }
}
