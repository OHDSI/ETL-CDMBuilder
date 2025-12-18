using org.ohdsi.cdm.framework.desktop.Enums;
using Spectre.Console;
using System.Diagnostics;

namespace org.ohdsi.cdm.presentation.builder.Utility
{
    public static class SqlRenderTranslator
    {
        public record Request(string? JarPath, string VendorName, string SqlFileName, string SqlOriginal, Database TargetDatabase);
        
        protected record RequestParsed(string JarPath, string VendorName, string SqlFileName, string SqlOriginal, string targetDialect);

        static string DirectoryPath => Path.Combine(Directory.GetCurrentDirectory(), "Cache", "SqlRender");

        public static string Translate(Request request)
        {
            string error = "";
            try
            {
                if(request.TargetDatabase == Database.MySql) //not supported
                    return request.SqlOriginal;

                var parsed = ParseArguments(request);

                var baseDir = Directory.GetCurrentDirectory();
                var dir = Path.Combine(DirectoryPath, parsed.VendorName);
                Directory.CreateDirectory(dir);

                var sqlFileNameNormalized = parsed.SqlFileName.Replace(".sql", "").Split('.').Last();
                var inputFileName = $"{sqlFileNameNormalized}_redshift.sql";
                var outputFileName = $"{sqlFileNameNormalized}_{parsed.targetDialect.Replace(" ", "")}.sql";

                string inputPathFull = Path.Combine(dir, inputFileName);
                string outputPathFull = Path.Combine(dir, outputFileName);

                string args = $"-jar \"{parsed.JarPath}\" \"{inputPathFull}\" \"{outputPathFull}\" -translate \"{parsed.targetDialect}\"";

                File.WriteAllText(inputPathFull, parsed.SqlOriginal);

                var psi = new ProcessStartInfo
                {
                    FileName = "java",
                    Arguments = args,
                    RedirectStandardOutput = true,
                    RedirectStandardError = true,
                    UseShellExecute = false,
                    CreateNoWindow = true
                };

                using var proc = Process.Start(psi);
                string output = proc.StandardOutput.ReadToEnd();
                error = proc.StandardError.ReadToEnd();
                proc.WaitForExit();

                if (!string.IsNullOrEmpty(error))
                {
                    AnsiConsole.WriteLine(error);
                    throw new Exception("SqlRender translation failed!");
                }

                if (!string.IsNullOrEmpty(output))
                    AnsiConsole.WriteLine(output);

                var result = File.ReadAllText(outputPathFull);

                return result;
            }
            catch (Exception e)
            {
                throw;
            }
        }

        private static RequestParsed ParseArguments(Request request)
        {
            var jarPath = request.JarPath;
            if (string.IsNullOrEmpty(request.JarPath))
            {
                string path = Path.Combine(Directory.GetCurrentDirectory(), "SqlRender.jar");
                if (File.Exists(path))
                    jarPath = path;
                else
                    throw new ArgumentNullException("JarPath is null or empty, and default path does not exist!");
            }

            if (string.IsNullOrEmpty(request.VendorName)
                || string.IsNullOrEmpty(request.SqlFileName)
                || string.IsNullOrEmpty(request.SqlOriginal))
                throw new ArgumentNullException("Some of the arguments to SqlRenderTranslator are null!");

            string targetDialect = request.TargetDatabase switch
            {
                Database.Postgre => "postgresql",
                Database.MsSql => "sql server",
                Database.MySql => throw new InvalidOperationException("SqlRender does not support MySql!"),
                _ => throw new NotImplementedException($"Database {request.TargetDatabase.ToString()} is not supported for translation from Redshift")
            };

            return new RequestParsed(jarPath, request.VendorName, request.SqlFileName, request.SqlOriginal, targetDialect);
        }
    }
}
