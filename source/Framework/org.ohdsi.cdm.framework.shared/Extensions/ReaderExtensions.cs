using System;
using System.Data;

namespace org.ohdsi.cdm.framework.shared.Extensions
{
   public static class ReaderExtensions
   {
      public static T? GetValue<T>(this IDataReader reader, string fieldName) where T : struct
      {
         if (string.IsNullOrEmpty(fieldName))
            return null;

         var value = reader[fieldName];

         if (value is DBNull)
            return null;

         if (typeof(T) == typeof(decimal))
         {
            decimal? result = Convert.ToDecimal(value);
            return result as T?;
         }

         if (typeof(T) == typeof(long))
         {
            long? result = Convert.ToInt64(value);
            return result as T?;
         }

         if (typeof(T) == typeof(int))
         {
            int? result = Convert.ToInt32(value);
            return result as T?;
         }

         return reader[fieldName] as T?;
      }

      public static string GetString(this IDataReader reader, string fieldName)
      {
         //return string.IsNullOrEmpty(fieldName) ? null : reader[fieldName].ToString().Trim();
         return string.IsNullOrEmpty(fieldName) ? null : String.Intern(reader[fieldName].ToString().Trim());
      }

      public static int? GetInt(this IDataReader reader, string fieldName)
      {
         return reader.GetValue<int>(fieldName);
      }

      public static decimal? GetDecimal(this IDataReader reader, string fieldName)
      {
         return reader.GetValue<decimal>(fieldName);
      }

      public static DateTime GetDateTime(this IDataReader reader, string fieldName)
      {
         var result = reader.GetValue<DateTime>(fieldName);
         if (!result.HasValue)
         {
            var dateTimeString = reader.GetString(fieldName);
            DateTime dateTime;
            if (!string.IsNullOrEmpty(dateTimeString) && DateTime.TryParse(dateTimeString, out dateTime))
            {
               return dateTime;
            }
         }
         return !result.HasValue ? DateTime.MinValue : result.Value;
      }

      public static long? GetLong(this IDataReader reader, string fieldName)
      {
         return reader.GetValue<long>(fieldName);
      }
   }
}
