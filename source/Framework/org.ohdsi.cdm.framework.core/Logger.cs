using System;
using System.Text;
using org.ohdsi.cdm.framework.data.DbLayer;
using org.ohdsi.cdm.framework.shared.Enums;

namespace org.ohdsi.cdm.framework.core
{
   public class Logger
   {
      private static DbLog dbLog;
      private static DbLog DbLog 
      {
         get
         {
            if (dbLog == null)
            {
               dbLog = new DbLog(Settings.Current.Building.BuilderConnectionString);
            }

            return dbLog;
         }
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
         Write(Settings.Current.Builder.Id, Settings.Current.Building.Id, chunkId, type, message);
      }

      public static void Write(int? builderId, int? buildingId, int? chunkId, LogMessageTypes type, string message)
      {
         DbLog.Add(builderId, buildingId, chunkId, type, message);
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
