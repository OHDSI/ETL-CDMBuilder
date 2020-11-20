using org.ohdsi.cdm.framework.desktop.Enums;
using System.Text.RegularExpressions;

namespace org.ohdsi.cdm.framework.desktop.Helpers
{
    public static class GetSqlHelper
    {
        public static string GetSql(Database sourceDatabase, string query, string schemaName)
        {
            if (string.IsNullOrEmpty(query)) return query;

            switch (sourceDatabase)
            {
                case Database.MySql:
                    query = query.Replace("as varchar", "as char");
                    query = query.Replace("as int", "as signed");
                    query = query.Replace("as bigint", "as signed");
                    query = query.Replace("date_part('year',", "extract(year from ");
                    query = query.Replace("date_part('month',", "extract(month from ");
                    query = query.Replace("date_part('day',", "extract(day from ");
                    query = query.Replace("--", "#");
                    break;
                case Database.MsSql:
                    query = query.Replace(schemaName + ".procedure ", schemaName + ".[procedure] ");
                    query = query.Replace("chr(", "char(");
                    query = query.Replace("||", "+");
                    query = query.Replace("date_part('year'", "datepart(year");
                    query = query.Replace("date_part('month'", "datepart(month");
                    query = query.Replace("date_part('day'", "datepart(day");

                    foreach (Match match in Regex.Matches(query, @"\[(.*?)\]", RegexOptions.IgnoreCase))
                    {
                        var originalValue = match.Value;
                        // Remove [ and ] and replace spaces as _
                        var forRedshift = originalValue.Replace(" ", "_").Replace("-", "_").Trim();
                        query = query.Replace(originalValue, forRedshift);
                    }

                    break;

                case Database.Postgre:
                    query = query.Replace("datepart(year", "date_part('year'");
                    query = query.Replace("datepart(month", "date_part('month'");
                    query = query.Replace("datepart(day", "date_part('day'");
                    break;

                case Database.Redshift:
                    foreach (Match match in Regex.Matches(query, @"\[(.*?)\]", RegexOptions.IgnoreCase))
                    {
                        var originalValue = match.Value;
                        // Remove [ and ] and replace spaces as _
                        var forRedshift = originalValue.Replace("[", @"""").Replace("]", @"""").Replace(" ", "_")
                            .Replace("-", "_").Trim();
                        query = query.Replace(originalValue, forRedshift);
                    }

                    break;
            }

            return query;
        }
    }
}