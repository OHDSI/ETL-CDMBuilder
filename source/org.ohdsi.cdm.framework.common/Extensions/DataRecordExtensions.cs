using System;
using System.Data;

namespace org.ohdsi.cdm.framework.common.Extensions
{
    public static class DataRecordExtensions
    {
        private static string GetErrorMeassge(IDataRecord reader, string fieldName, string methodName)
        {
            return $"DataRecordExtensions.{methodName} | {fieldName}={GetValue(reader, fieldName)}";
        }

        public static string GetString(this IDataRecord reader, string fieldName)
        {
            try
            {
                if (string.IsNullOrEmpty(fieldName))
                    return null;

                var value = GetValue(reader, fieldName).ToString();

                return string.Intern(value.Trim());
            }
            catch (Exception e)
            {
                throw new Exception(GetErrorMeassge(reader, fieldName, "GetString()"), e);
            }
        }

        public static TimeSpan? GetTime(this IDataRecord reader, string fieldName)
        {
            try
            {
                if (string.IsNullOrEmpty(fieldName))
                    return null;

                if (DateTime.TryParse(reader.GetString(fieldName), out var dt))
                {
                    return dt.TimeOfDay;
                }

                return null;
            }
            catch (Exception e)
            {
                throw new Exception(GetErrorMeassge(reader, fieldName, "GetTime()"), e);
            }
        }

        public static int? GetIntSafe(this IDataRecord reader, string fieldName)
        {
            try
            {
                if (string.IsNullOrEmpty(fieldName))
                    return null;

                var value = GetValue(reader, fieldName);
                if (value is DBNull || string.IsNullOrEmpty(value.ToString()))
                    return null;

                if (int.TryParse(value.ToString(), out var result))
                    return result;

                return null;

            }
            catch (Exception e)
            {
                throw new Exception(GetErrorMeassge(reader, fieldName, "GetInt()"), e);
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

                //return ParseDecimalFast(value.ToString());
                decimal.TryParse(value.ToString(), out var res);

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

                    if (!string.IsNullOrEmpty(dateTimeString) && DateTime.TryParse(dateTimeString, out var dateTime))
                    {
                        return dateTime.Date;
                    }
                }
                else
                {
                    return result.Value.Date;
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
                throw new Exception($"DataRecordExtensions.{"GetValue()"} | {fieldName}", e);
            }
        }
    }
}
