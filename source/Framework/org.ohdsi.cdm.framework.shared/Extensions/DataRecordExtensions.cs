using System;
using System.Data;
using System.Globalization;

namespace org.ohdsi.cdm.framework.shared.Extensions
{
   public static class DataRecordExtensions
   {
      private static string GetErrorMeassge(IDataRecord reader, string fieldName, string methodName)
      {
         return string.Format("DataRecordExtensions.{0} | {1}={2}", methodName, fieldName, GetValue(reader, fieldName));
      }

      public static string GetString(this IDataRecord reader, string fieldName)
      {
         try
         {
            if (string.IsNullOrEmpty(fieldName))
               return null;

            var value = GetValue(reader, fieldName).ToString();
            return value.Trim();
         }
         catch (Exception e)
         {
            throw new Exception(GetErrorMeassge(reader, fieldName, "GetString()"), e);
         }
      }

      public static string GetTime(this IDataRecord reader, string fieldName)
      {
         try
         {
            if (string.IsNullOrEmpty(fieldName))
               return null;

            DateTime dt;
            return DateTime.TryParse(reader.GetString(fieldName), out dt)
               ? dt.ToString("HH:mm:ss", CultureInfo.InvariantCulture)
               : null;
         }
         catch (Exception e)
         {
            throw new Exception(GetErrorMeassge(reader, fieldName, "GetTime()"), e);
         }
      }

      public static int? GetInt(this IDataRecord reader, string fieldName)
      {
         try
         {
            if (string.IsNullOrEmpty(fieldName))
               return null;

            var value = GetValue(reader, fieldName);
            if (value is DBNull || string.IsNullOrEmpty(value.ToString()))
               return null;

            return Convert.ToInt32(value);
         }
         catch (Exception e)
         {
            throw new Exception(GetErrorMeassge(reader, fieldName, "GetInt()"), e);
         }
      }

      public static decimal? GetDecimal(this IDataRecord reader, string fieldName)
      {
         try
         {
            if (string.IsNullOrEmpty(fieldName))
               return null;

            var value = GetValue(reader, fieldName);

            if (value is DBNull || string.IsNullOrEmpty(value.ToString()))
               return null;

            decimal res;
            decimal.TryParse(value.ToString(), out res);

            return res;
         }
         catch (Exception e)
         {
            throw new Exception(GetErrorMeassge(reader, fieldName, "GetDecimal()"), e);
         }
      }

      public static DateTime GetDateTime(this IDataRecord reader, string fieldName)
      {
         try
         {
            if (string.IsNullOrEmpty(fieldName))
               return DateTime.MinValue;

            var result = GetValue(reader, fieldName) as DateTime?;

            if (!result.HasValue)
            {
               var dateTimeString = GetValue(reader, fieldName).ToString();

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
         catch (Exception e)
         {
            throw new Exception(GetErrorMeassge(reader, fieldName, "GetDateTime()"), e);
         }
      }

      public static long? GetLong(this IDataRecord reader, string fieldName)
      {
         try
         {
            if (string.IsNullOrEmpty(fieldName))
               return null;

            var value = GetValue(reader, fieldName);

            if (value is DBNull || string.IsNullOrEmpty(value.ToString()))
               return null;

            return Convert.ToInt64(value);
         }
         catch (Exception e)
         {
            throw new Exception(GetErrorMeassge(reader, fieldName, "GetLong()"), e);
         }
      }

      private static object GetValue(IDataRecord reader, string fieldName)
      {
         try
         {
            return reader[fieldName];
         }
         catch (Exception e)
         {
            throw new Exception(string.Format("DataRecordExtensions.{0} | {1}", "GetValue()", fieldName), e);
         }
      }
   }
}
