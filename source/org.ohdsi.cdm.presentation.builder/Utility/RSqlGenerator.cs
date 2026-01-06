using System;
using System.Diagnostics;
using System.IO;
using System.Text;
using System.Text.RegularExpressions;

public static class RSqlGenerator
{
    public record Request(
        string RscriptPath,
        string FrameworkType,          
        string NativeDatabaseSchema,   
        string CdmDatabaseSchema,      
        string Dbms,                   
        string Server,
        int Port,
        string User,
        string Password
    );

    public record Response(
        string InsertSqlPath,
        string TestSqlPath,
        string InsertSqlText,
        string TestSqlText,
        string StdOut,
        string StdErr,
        int ExitCode
    );

    public static Response GenerateSqlOnly(Request cfg)
    {
        if (string.IsNullOrWhiteSpace(cfg.RscriptPath) || !File.Exists(cfg.RscriptPath))
            throw new FileNotFoundException("code to run.R not found", cfg.RscriptPath);

        var rDir = Path.GetDirectoryName(Path.GetFullPath(cfg.RscriptPath))!;
        var original = File.ReadAllText(cfg.RscriptPath, Encoding.UTF8);

        var patched = PatchAssignments(original, cfg);

        patched = InsertEarlyQuitAfterSqlGeneration(patched);

        var tempRPath = Path.Combine(rDir, $"__run_generate_only_{Guid.NewGuid():N}.R");
        File.WriteAllText(tempRPath, patched, new UTF8Encoding(encoderShouldEmitUTF8Identifier: false));

        try
        {
            var psi = new ProcessStartInfo
            {
                FileName = cfg.RscriptPath,
                Arguments = Quote(tempRPath),
                WorkingDirectory = rDir, //use relational paths
                UseShellExecute = false,
                RedirectStandardOutput = true,
                RedirectStandardError = true,
                CreateNoWindow = true,
                StandardOutputEncoding = Encoding.UTF8,
                StandardErrorEncoding = Encoding.UTF8
            };

            using var p = Process.Start(psi) ?? throw new InvalidOperationException("Failed to start Rscript process");

            string stdout = p.StandardOutput.ReadToEnd();
            string stderr = p.StandardError.ReadToEnd();
            p.WaitForExit();

            var insertPath = Path.Combine(rDir, "insert.sql");
            var testPath = Path.Combine(rDir, "test.sql");

            if (!File.Exists(insertPath))
                throw new FileNotFoundException("insert.sql was not generated. Check R output.", insertPath);

            if (!File.Exists(testPath))
                throw new FileNotFoundException("test.sql was not generated. Check R output.", testPath);

            var insertText = File.ReadAllText(insertPath, Encoding.UTF8);
            var testText = File.ReadAllText(testPath, Encoding.UTF8);

            return new Response(
                InsertSqlPath: insertPath,
                TestSqlPath: testPath,
                InsertSqlText: insertText,
                TestSqlText: testText,
                StdOut: stdout,
                StdErr: stderr,
                ExitCode: p.ExitCode
            );
        }
        finally
        {

        }
    }

    private static string PatchAssignments(string text, Request cfg)
    {
        text = ReplaceRStringAssignment(text, "frameworkType", cfg.FrameworkType);

        text = ReplaceRStringAssignment(text, "nativeDatabaseSchema", cfg.NativeDatabaseSchema);

        text = ReplaceRStringAssignment(text, "cdmDatabaseSchema", cfg.CdmDatabaseSchema);

        // connectionDetails <- DatabaseConnector::createConnectionDetails(...)
        text = ReplaceCreateConnectionDetails(
            text,
            dbms: cfg.Dbms,
            server: cfg.Server,
            port: cfg.Port,
            user: cfg.User,
            password: cfg.Password
        );

        return text;
    }

    private static string ReplaceRStringAssignment(string text, string varName, string value)
    {
        // varName <- "...."
        var pattern = $@"(?m)^\s*{Regex.Escape(varName)}\s*<-\s*""[^""]*""\s*$";
        var replacement = $"{varName} <- \"{EscapeForR(value)}\"";
        if (!Regex.IsMatch(text, pattern))
            throw new InvalidOperationException($"Assignment not found for variable: {varName}");
        return Regex.Replace(text, pattern, replacement);
    }

    private static string ReplaceCreateConnectionDetails(string text, string dbms, string server, int port, string user, string password)
    {
        // connectionDetails <- DatabaseConnector::createConnectionDetails(dbms = "...", server = "...", port = ..., user = "...", password = "...")
        var pattern =
            @"(?ms)^\s*connectionDetails\s*<-\s*DatabaseConnector::createConnectionDetails\s*\(\s*.*?\)\s*";
        var replacement =
$@"connectionDetails <- DatabaseConnector::createConnectionDetails(dbms = ""{EscapeForR(dbms)}"",
                                                                server = ""{EscapeForR(server)}"",
                                                                port = {port},
                                                                user = ""{EscapeForR(user)}"",
                                                                password = ""{EscapeForR(password)}""
)";
        if (!Regex.IsMatch(text, pattern))
            throw new InvalidOperationException("connectionDetails <- createConnectionDetails(...) block not found");
        return Regex.Replace(text, pattern, replacement, RegexOptions.IgnoreCase);
    }

    private static string InsertEarlyQuitAfterSqlGeneration(string text)
    {
        // quit() after 2nd cat(...) (test.sql) ensuring both files are generated
        // Find cat(file="test.sql", ...)
        var pattern = @"(?ms)(^\s*cat\s*\(\s*file\s*=\s*""test\.sql"".*?\)\s*$)";
        var m = Regex.Match(text, pattern);
        if (!m.Success)
            throw new InvalidOperationException("Could not find cat(file=\"test.sql\", ...) line to insert quit() after it.");

        var insert =
            m.Groups[1].Value +
            Environment.NewLine +
            Environment.NewLine +
            "## AUTO-INJECTED: stop after SQL generation (no DB execution)\n" +
            "quit(status = 0, save = \"no\")\n";

        // insert quit
        return Regex.Replace(text, pattern, Regex.Escape(m.Groups[1].Value)).Replace(Regex.Escape(m.Groups[1].Value), insert);
    }

    private static string Quote(string s) 
        => "\"" + s.Replace("\"", "\\\"") + "\"";

    private static string EscapeForR(string s)
        => s.Replace("\\", "\\\\").Replace("\"", "\\\"");
}
