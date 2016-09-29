using System;
using System.Data;
using System.Globalization;

namespace org.ohdsi.cdm.framework.shared.Extensions
{
   public static class DataRecordExtensions
   {
      public static string GetString(this IDataRecord reader, string fieldName)
      {
         if (string.IsNullOrEmpty(fieldName))
            return null;

         var value = reader[fieldName].ToString();
         return value.Trim();
      }


      public static string GetTime(this IDataRecord reader, string fieldName)
      {
         if (string.IsNullOrEmpty(fieldName))
            return null;

         DateTime dt;
         return DateTime.TryParse(reader.GetString(fieldName), out dt) ? dt.ToString("HH:mm:ss", CultureInfo.InvariantCulture) : null;
      }

      public static int? GetInt(this IDataRecord reader, string fieldName)
      {
         if (string.IsNullOrEmpty(fieldName))
            return null;

         var value = reader[fieldName];
         return value is DBNull ? (Int32?)null : Convert.ToInt32(value);
      }

      public static decimal? GetDecimal(this IDataRecord reader, string fieldName)
      {
         if (string.IsNullOrEmpty(fieldName))
            return null;

         var value = reader[fieldName];

         if (value is DBNull)
            return null;

         return Convert.ToDecimal(value);
      }

      public static DateTime GetDateTime(this IDataRecord reader, string fieldName)
      {
         if (string.IsNullOrEmpty(fieldName))
            return DateTime.MinValue;

         var result = reader[fieldName] as DateTime?;

         if (!result.HasValue)
         {
            var dateTimeString = reader[fieldName].ToString();

            DateTime dateTime;
            if (!string.IsNullOrEmpty(dateTimeString) && DateTime.TryParse(dateTimeString, out dateTime))
            {
               return dateTime;
            }
         }
         else
         {
            return result.Value;
         }

         return DateTime.MinValue;
      }

      public static long? GetLong(this IDataRecord reader, string fieldName)
      {
         if (string.IsNullOrEmpty(fieldName))
            return null;

         var value = reader[fieldName];
         return value is DBNull ? (Int64?)null : Convert.ToInt64(value);
      }
   }
}
