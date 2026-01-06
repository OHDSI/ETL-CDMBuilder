using Microsoft.Win32;
using org.ohdsi.cdm.framework.desktop.Settings;
using PresentationSettings = org.ohdsi.cdm.presentation.builder.Settings;
using Spectre.Console;
using System.Diagnostics;
using System.Text;
using System.Text.RegularExpressions;

public static class RSqlGenerator
{
    public static string GenerateSqlOnly()
    {
        AnsiConsole.WriteLine($"\r\nRun R to clear and populate source with test data...");
        var sw = new Stopwatch();
        sw.Start();

        var rExePaths = GetRscriptExePaths();
        var rProjectPath = PresentationSettings.Current.Building.RepopulateSourceUsingRPath;

        var errors = new List<string>();

        //a lot of exe files and some seem randomly to fail to encode text. try all untill successful
        foreach (var rExePath in rExePaths)
        {
            var cacheFolder = Path.Combine(Directory.GetCurrentDirectory(), "Cache", "R");
            var sourcedFiles = CopyDirectory(rProjectPath, cacheFolder);
            var frameworkFileName = GetFrameworkFileName(cacheFolder);

            WriteHardcodedR(cacheFolder, frameworkFileName, sourcedFiles);

            var (exit, o, e) = RunR(
                rscriptExe: rExePath,
                workDir: cacheFolder,
                scriptFileName: "code to run.R"
            );

            var insertPath = Path.Combine(cacheFolder, "insert.sql");
            if (File.Exists(insertPath))
            {
                var newE = Regex.Replace(
                    e,
                    @"^running\s+'[^']*'\s*$",
                    "",
                    RegexOptions.Multiline
                );

                AnsiConsole.WriteLine($"Exit={exit}\r\n OUT={o}\r\n ERR={newE}");

                var insertSql = File.ReadAllText(insertPath);

                AnsiConsole.WriteLine($"DONE. {Convert.ToInt32(sw.Elapsed.TotalSeconds)}s.");

                return insertSql;
            }
            else
            {
                var msg = $"File={rExePath} \r\nExit={exit}\r\n OUT={o}\r\n ERR={e}";
                errors.Add(msg);
            }
        }
        foreach (var error in errors)
            AnsiConsole.WriteLine(error);
        throw new Exception("Failed to generate sql to populate source!");
    }

    static string GetRExePath()
    {
        string[] keys =
        {
            @"SOFTWARE\R-core\R",
            @"SOFTWARE\WOW6432Node\R-core\R"
        };

        foreach (var keyPath in keys)
        {
            using var key = Registry.LocalMachine.OpenSubKey(keyPath);
            if (key == null) continue;

            var installPath = key.GetValue("InstallPath") as string;
            if (string.IsNullOrWhiteSpace(installPath)) continue;

            var rExe = Path.Combine(installPath, "bin", "x64", "R.exe");
            if (File.Exists(rExe))
                return rExe;

            // fallback
            rExe = Path.Combine(installPath, "bin", "R.exe");
            if (File.Exists(rExe))
                return rExe;
        }

        throw new FileNotFoundException("R.exe not found in registry");
    }

    static string[] GetRscriptExePaths()
    {
        string rExe = GetRExePath();

        DirectoryInfo rRoot = Directory.GetParent(Directory.GetParent(Directory.GetParent(rExe)!.FullName)!.FullName)!;
        string[] files = Directory.GetFiles(rRoot.FullName, "*", SearchOption.AllDirectories)
            .Where(s => s.EndsWith("Rscript.exe", StringComparison.CurrentCultureIgnoreCase)
                     || s.EndsWith("R.exe", StringComparison.CurrentCultureIgnoreCase))
            .OrderByDescending(s => s.Length)
            .ToArray();

        return files;
    }

    static List<string> CopyDirectory(string sourceDir, string targetDir)
    {
        List<string> sourcedFiles = new List<string>();
        var sourceFilesToSearchFor = new[] { "main.R", "UnitTests.R", "SetDefaults.R" };

        if (Directory.Exists(targetDir))
            Directory.Delete(targetDir, true);

        Directory.CreateDirectory(targetDir);

        foreach (var file in Directory.GetFiles(sourceDir))
        {
            var fileName = Path.GetFileName(file);
            File.Copy(file, Path.Combine(targetDir, fileName), true);

            if (sourceFilesToSearchFor.Any(s => fileName.Contains(s, StringComparison.CurrentCultureIgnoreCase)))
                sourcedFiles.Add(fileName);
        }

        foreach (var dir in Directory.GetDirectories(sourceDir))
        {
            sourcedFiles.AddRange(CopyDirectory(dir, Path.Combine(targetDir, Path.GetFileName(dir))));
        }
        return sourcedFiles;
    }

    static string GetFrameworkFileName(string cacheFolder)
    {
        var path = Path.Combine(cacheFolder, "extras");
        FileInfo[] files = Directory.GetFiles(path)
            .Where(s => s.Contains("Framework", StringComparison.CurrentCultureIgnoreCase))
            .Where(s => s.EndsWith(".R", StringComparison.CurrentCultureIgnoreCase))
            .Select(s => new FileInfo(s))
            .ToArray();

        if (files.Length == 0)
            throw new Exception("No Framework.R files in extras directory!");

        var currentVendor = Settings.Current.Building.Vendor.Name;
        var fileByVendor = files.FirstOrDefault(s => s.Name.Contains(currentVendor, StringComparison.CurrentCultureIgnoreCase));
        if (fileByVendor != null)
            return fileByVendor.Name;

        var vendorEnd = currentVendor.Split(new[] { '_', ' ', '-' }).Last();
        var fileByVendorEnd = files.FirstOrDefault(s => s.Name.Contains(vendorEnd, StringComparison.CurrentCultureIgnoreCase));
        if (fileByVendorEnd != null)
            return fileByVendorEnd.Name;

        var remainingRandomFile = files.First();
        return remainingRandomFile.Name;
    }

    static void WriteHardcodedR(string targetProjectDir, string frameworkFileName, List<string> sourcedFiles)
    {
        var source = "";
        foreach (var sourceFile in sourcedFiles)
            source = $"source(\"R/{sourceFile}\")" + "\r\n\r\n"
                + source;
        
        var rCode = source + $"""

source("extras/{frameworkFileName}")

source_schema <- "{Settings.Current.Building.SourceSchemaName}"
frameworkType <- "{Settings.Current.Building.Vendor.Name}"

sequencer <- getSequence()
initFramework()
setDefaults()
createTests()

insertSql <- paste(generateInsertSql(databaseSchema = source_schema), sep = "", collapse = "\n")

SqlRender::writeSql(insertSql, "insert.sql")
quit(status = 0, save = "no")
""";

        File.WriteAllText(
            Path.Combine(targetProjectDir, "code to run.R"),
            rCode,
            new UTF8Encoding(false)
        );
    }

    static (int Exit, string Out, string Err) RunR(string rscriptExe, string workDir, string scriptFileName)
    {
        var scriptFullPath = Path.GetFullPath(Path.Combine(workDir, scriptFileName));
        if (!File.Exists(scriptFullPath))
            throw new FileNotFoundException("R script not found", scriptFullPath);

        var psi = new ProcessStartInfo
        {
            FileName = rscriptExe,
            WorkingDirectory = workDir,
            UseShellExecute = false,
            RedirectStandardOutput = true,
            RedirectStandardError = true,
            CreateNoWindow = true,
            StandardOutputEncoding = Encoding.UTF8,
            StandardErrorEncoding = Encoding.UTF8
        };

        psi.ArgumentList.Add("--vanilla");
        psi.ArgumentList.Add("--verbose");
        psi.ArgumentList.Add(scriptFullPath);

        using var p = Process.Start(psi) ?? throw new InvalidOperationException("Failed to start Rscript");

        string stdout = p.StandardOutput.ReadToEnd();
        string stderr = p.StandardError.ReadToEnd();
        p.WaitForExit();

        return (p.ExitCode, stdout, stderr);
    }
}
