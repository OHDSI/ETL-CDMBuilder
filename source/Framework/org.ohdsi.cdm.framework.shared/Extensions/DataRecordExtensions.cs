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
            //var value = string.Intern(GetValue(reader, fieldName).ToString());
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

            return ParseInt32Fast(value.ToString());
            //return Convert.ToInt32(value);
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

            return ParseDecimalFast(value.ToString());
            //decimal res;
            //decimal.TryParse(value.ToString(), out res);

            //return res;
         }
         catch (Exception e)
         {
            throw new Exception(GetErrorMeassge(reader, fieldName, "GetDecimal()"), e);
         }
      }

      private static readonly int[] powof10 = 
      {
         1,
         10,
         100,
         1000,
         10000,
         100000,
         1000000,
         10000000,
         100000000,
         1000000000
      };

      private static decimal ParseDecimalFast(string input)
      {
         int len = input.Length;
         if (len != 0)
         {
            bool negative = false;
            long n = 0;
            int start = 0;
            if (input[0] == '-')
            {
               negative = true;
               start = 1;
            }
            if (len <= 19)
            {
               int decpos = len;
               for (int k = start; k < len; k++)
               {
                  char c = input[k];
                  if (c == '.')
                  {
                     decpos = k + 1;
                  }
                  else
                  {
                     n = (n * 10) + (int)(c - '0');
                  }
               }
               return new decimal((int)n, (int)(n >> 32), 0, negative, (byte)(len - decpos));
            }
            else
            {
               if (len > 28)
               {
                  len = 28;
               }
               int decpos = len;
               for (int k = start; k < 19; k++)
               {
                  char c = input[k];
                  if (c == '.')
                  {
                     decpos = k + 1;
                  }
                  else
                  {
                     n = (n * 10) + (int)(c - '0');
                  }
               }
               int n2 = 0;
               bool secondhalfdec = false;
               for (int k = 19; k < len; k++)
               {
                  char c = input[k];
                  if (c == '.')
                  {
                     decpos = k + 1;
                     secondhalfdec = true;
                  }
                  else
                  {
                     n2 = (n2 * 10) + (int)(c - '0');
                  }
               }
               byte decimalPosition = (byte)(len - decpos);
               return new decimal((int)n, (int)(n >> 32), 0, negative, decimalPosition) * powof10[len - (!secondhalfdec ? 19 : 20)] + new decimal(n2, 0, 0, negative, decimalPosition);
            }
         }
         return 0;
      }

      private static Int32 ParseInt32Fast(string value)
      {
         var startIndex = 0;
         if (value[0] == '-')
         {
            startIndex = 1;
         }

         Int32 result = 0;
         for (int i = startIndex; i < value.Length; i++)
         {
            result = 10 * result + (value[i] - 48);
         }

         if (startIndex == 1)
            result = result * -1;

         return result;
      }

      private static Int64 ParseInt64Fast(string value)
      {
         var startIndex = 0;
         if (value[0] == '-')
         {
            startIndex = 1;
         }

         Int64 result = 0;
         for (int i = startIndex; i < value.Length; i++)
         {
            result = 10 * result + (value[i] - 48);
         }

         if (startIndex == 1)
            result = result * -1;

         return result;
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

            return ParseInt64Fast(value.ToString());
            //return Convert.ToInt64(value);
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
