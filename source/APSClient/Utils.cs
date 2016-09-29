using System;
using System.Globalization;

namespace APSClient
{
   class Utils
   {
      public static string AddDefaultSchemaAndQuoteTableName(string tableName)
      {
         string str;
         if (!tableName.StartsWith("[", StringComparison.CurrentCulture))
         {
            int index = tableName.IndexOf(".", StringComparison.CurrentCulture);
            if (index < 0)
            {
               return string.Format(CultureInfo.CurrentCulture, "[dbo].[{0}]", new object[] { EscapeTableName(tableName) });
            }
            str = tableName.Substring(0, index);
            return string.Format(CultureInfo.CurrentCulture, "[{0}].[{1}]", new object[] { EscapeTableName(str), EscapeTableName(tableName.Substring(index + 1)) });
         }
         string schemaAndTableName = GetSchemaAndTableName(tableName, out str);
         return string.Format(CultureInfo.CurrentCulture, "{0}.{1}", new object[] { string.IsNullOrEmpty(str) ? "[dbo]" : str, schemaAndTableName });
      }

      private static string GetSchemaAndTableName(string tableName, out string schemaName)
      {
         schemaName = string.Empty;
         if (string.IsNullOrEmpty(tableName))
         {
            return string.Empty;
         }
         int index = tableName.Replace("]]", "##").IndexOf("].[", StringComparison.CurrentCulture);
         if (index > 0)
         {
            schemaName = tableName.Substring(0, index + 1);
            return tableName.Substring(index + 2);
         }
         return tableName;
      }

      private static string EscapeTableName(string tableName)
      {
         if (string.IsNullOrEmpty(tableName))
         {
            return null;
         }
         return tableName.Replace("]", "]]");
      }
   }
}
