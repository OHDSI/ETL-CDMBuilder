using org.ohdsi.cdm.framework.desktop.Enums;
using System;
using System.Collections.Generic;
using System.IO;
using System.Text;

namespace org.ohdsi.cdm.presentation.builder
{
    public class Logger
    {
        private static object _threadlock;

        static Logger()
        {
            _threadlock = new object();
        }


        public static void WriteError(Exception e)
        {
            Write(null, LogMessageTypes.Error, CreateExceptionString(e));
        }

        public static void WriteWarning(string message)
        {
            Write(null, LogMessageTypes.Warning, message);
        }

        public static void WriteError(int? chunkId, Exception e)
        {
            Write(chunkId, LogMessageTypes.Error, CreateExceptionString(e));
        }

        public static void Write(int? chunkId, LogMessageTypes type, string message)
        {
            var buildingFolder = "Building";
            string chunkFolder = null;

            if (!string.IsNullOrEmpty(Settings.Current.Building.Folder))
                buildingFolder = Settings.Current.Building.Folder;

            if (chunkId.HasValue)
                chunkFolder = Path.Combine(buildingFolder, chunkId.Value.ToString());

            if (!Directory.Exists(buildingFolder))
                Directory.CreateDirectory(buildingFolder);

            if (chunkFolder != null && !Directory.Exists(chunkFolder))
                Directory.CreateDirectory(chunkFolder);

            if (chunkFolder != null)
                File.AppendAllText($@"{chunkFolder}\log.txt", $@"{DateTime.Now:G}| {message}{Environment.NewLine}");

            lock (_threadlock)
            {
                File.AppendAllText($@"{buildingFolder}\log.txt", $@"{DateTime.Now:G}| {message}{Environment.NewLine}");
            }
        }

        public static IEnumerable<string> GetErrors()
        {
            var folder = "Building";

            if (!string.IsNullOrEmpty(Settings.Current.Building.Folder))
                folder = Settings.Current.Building.Folder;

            if (File.Exists($@"{folder}\log.txt"))
            {
                lock (_threadlock)
                {
                    return File.ReadAllLines($@"{folder}\log.txt");
                }
            }

            return new[] { "" };
        }

        public static void ResetErrors()
        {
            var folder = "Building";

            if (!string.IsNullOrEmpty(Settings.Current.Building.Folder))
                folder = Settings.Current.Building.Folder;

            if (File.Exists($@"{folder}\log.txt"))
            {
                lock (_threadlock)
                {
                    File.WriteAllText($@"{folder}\log.txt", "");
                }
            }
        }

        public static string CreateExceptionString(Exception e)
        {
            var sb = new StringBuilder();
            CreateExceptionString(sb, e, string.Empty);

            return sb.ToString();
        }

        private static void CreateExceptionString(StringBuilder sb, Exception e, string indent)
        {
            if (indent == null)
            {
                indent = string.Empty;
            }
            else if (indent.Length > 0)
            {
                sb.AppendFormat("{0}Inner ", indent);
            }

            sb.AppendFormat("Exception Found:\n{0}Type: {1}", indent, e.GetType().FullName);
            sb.AppendFormat("\n{0}Message: {1}", indent, e.Message);
            sb.AppendFormat("\n{0}Source: {1}", indent, e.Source);
            sb.AppendFormat("\n{0}Stacktrace: {1}", indent, e.StackTrace);

            if (e.InnerException != null)
            {
                sb.Append("\n");
                CreateExceptionString(sb, e.InnerException, indent + "  ");
            }
        }
    }
}
