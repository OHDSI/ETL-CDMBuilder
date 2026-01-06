using org.ohdsi.cdm.framework.desktop.Settings;
using Spectre.Console;
using System.Diagnostics;
using System.Text;
using System.Text.RegularExpressions;

public static class RSqlGenerator
{
    public record Request(
        string RexePath,
        string RprojectPath       
    );

    public record Response(
        string InsertSqlPath,
        string InsertSqlText
    );

    public static Response GenerateSqlOnly(Request cfg)
    {
        AnsiConsole.WriteLine($"\r\nRun R to clear and populate source with test data...");
        var sw = new Stopwatch();
        sw.Start();

        var rExePath = @"C:\Program Files\R\R-4.5.0\bin\Rscript.exe";
        var rProjectPath = @"C:\repos\OPEN SOURCE\ETL-LambdaBuilder\ETL-LambdaBuilder\docs\IBM_CCAE_MDCR\Test Cases";

        var cacheFolder = Path.Combine(Directory.GetCurrentDirectory(), "Cache", "R");
        var frameworkFileName = "IBMCCAE_TestingFramework.R";

        var sourcedFiles = CopyDirectory(rProjectPath, cacheFolder);
        WriteHardcodedR(cacheFolder, frameworkFileName, sourcedFiles);

        var (exit, o, e) = RunR(
            rscriptExe: @"C:\Program Files\R\R-4.5.0\bin\Rscript.exe",
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

            return new Response(
                    InsertSqlPath: insertPath,
                    InsertSqlText: insertSql
                );
        }
        else
        {
            AnsiConsole.WriteLine($"Exit={exit}\r\n OUT={o}\r\n ERR={e}");
            throw new Exception("Failed to generate sql to populate source!");
        }
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
