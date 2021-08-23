using org.ohdsi.cdm.framework.desktop.Enums;
using System;
using System.Collections.Generic;
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
                    query = query.Replace("as varchar", "as char", StringComparison.InvariantCultureIgnoreCase);
                    query = query.Replace("as int", "as signed", StringComparison.InvariantCultureIgnoreCase);
                    query = query.Replace("as bigint", "as signed", StringComparison.InvariantCultureIgnoreCase);
                    query = query.Replace("date_part('year',", "extract(year from ", StringComparison.InvariantCultureIgnoreCase);
                    query = query.Replace("date_part('month',", "extract(month from ", StringComparison.InvariantCultureIgnoreCase);
                    query = query.Replace("date_part('day',", "extract(day from ", StringComparison.InvariantCultureIgnoreCase);
                    query = query.Replace("date_part('hour',", "extract(hour from ", StringComparison.InvariantCultureIgnoreCase);
                    query = query.Replace("date_part('minute',", "extract(minute from ", StringComparison.InvariantCultureIgnoreCase);
                    query = query.Replace("date_part('second',", "extract(second from ", StringComparison.InvariantCultureIgnoreCase);
                    query = query.Replace("--", "#");

                    query = UpdateDATEADDQuery(query, sourceDatabase);
                    break;

                case Database.MsSql:
                    query = query.Replace(schemaName + ".procedure ", schemaName + ".[procedure] ", StringComparison.InvariantCultureIgnoreCase);
                    query = query.Replace("chr(", "char(", StringComparison.InvariantCultureIgnoreCase);
                    query = query.Replace("||", "+");
                    query = query.Replace("date_part('year'", "datepart(year", StringComparison.InvariantCultureIgnoreCase);
                    query = query.Replace("date_part('month'", "datepart(month", StringComparison.InvariantCultureIgnoreCase);
                    query = query.Replace("date_part('day'", "datepart(day", StringComparison.InvariantCultureIgnoreCase);
                    query = query.Replace("date_part('hour'", "datepart(hour", StringComparison.InvariantCultureIgnoreCase);
                    query = query.Replace("date_part('minute'", "datepart(minute", StringComparison.InvariantCultureIgnoreCase);
                    query = query.Replace("date_part('second'", "datepart(second", StringComparison.InvariantCultureIgnoreCase);

                    foreach (Match match in Regex.Matches(query, @"\[(.*?)\]", RegexOptions.IgnoreCase))
                    {
                        var originalValue = match.Value;
                        // Remove [ and ] and replace spaces as _
                        var forRedshift = originalValue.Replace(" ", "_").Replace("-", "_").Trim();
                        query = query.Replace(originalValue, forRedshift);
                    }

                    query = UpdateDATEADDQuery(query, sourceDatabase);
                    query = Trim(query);
                    break;

                case Database.Postgre:
                    query = query.Replace("datepart(year", "date_part('year'", StringComparison.InvariantCultureIgnoreCase);
                    query = query.Replace("datepart(month", "date_part('month'", StringComparison.InvariantCultureIgnoreCase);
                    query = query.Replace("datepart(day", "date_part('day'", StringComparison.InvariantCultureIgnoreCase);
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

        private static string Trim(string query)
        {
            var rg = new Regex(@"\strim\(.*?\)", RegexOptions.Compiled | RegexOptions.IgnoreCase | RegexOptions.Multiline);

            foreach (var m in rg.Matches(query))
            {
                var old = m.ToString();
                var newValue = old.Replace("trim(", "rtrim(ltrim(", StringComparison.InvariantCultureIgnoreCase) + ")";

                query = query.Replace(old, newValue, StringComparison.InvariantCultureIgnoreCase);
            }

            return query;
        }

        private static string UpdateDATEADDQuery(string query, Database db)
        {
            if (db != Database.MsSql && db != Database.MySql)
                return query;

            var rg = new Regex(@"(\+.*\d\s\*\sinterval\s.*\))", RegexOptions.Compiled | RegexOptions.IgnoreCase | RegexOptions.Multiline);
            var subs = new List<string>();
            foreach (var sq in query.Split(','))
            {
                var newSubQuery = sq;
                var matches = rg.Matches(sq);

                if (matches.Count == 0)
                {
                    subs.Add(newSubQuery);
                    continue;
                }

                foreach (var m in matches)
                {
                    var match = m.ToString();
                    newSubQuery = newSubQuery.Replace(match, "", StringComparison.InvariantCultureIgnoreCase);
                    newSubQuery = newSubQuery.Replace(";", "", StringComparison.InvariantCultureIgnoreCase);

                    match = match.Replace("+", "", StringComparison.InvariantCultureIgnoreCase)
                        .Replace("*", "", StringComparison.InvariantCultureIgnoreCase)
                        .Replace("interval", "", StringComparison.InvariantCultureIgnoreCase)
                        .Replace("(", "", StringComparison.InvariantCultureIgnoreCase)
                        .Replace(")", "", StringComparison.InvariantCultureIgnoreCase)
                        .Replace("'", "", StringComparison.InvariantCultureIgnoreCase);
                    var newMatch = "";

                    if (match.Contains("Year", StringComparison.InvariantCultureIgnoreCase))
                    {
                        newMatch = UpdateDATEADD("Year", match, db);
                    }
                    else if (match.Contains("Month", StringComparison.InvariantCultureIgnoreCase))
                    {
                        newMatch = UpdateDATEADD("Month", match, db);
                    }
                    else if (match.Contains("Day", StringComparison.InvariantCultureIgnoreCase))
                    {
                        newMatch = UpdateDATEADD("Day", match, db);
                    }
                    else if (match.Contains("Hour", StringComparison.InvariantCultureIgnoreCase))
                    {
                        newMatch = UpdateDATEADD("Hour", match, db);
                    }
                    else if (match.Contains("Minute", StringComparison.InvariantCultureIgnoreCase))
                    {
                        newMatch = UpdateDATEADD("Minute", match, db);
                    }
                    else if (match.Contains("Second", StringComparison.InvariantCultureIgnoreCase))
                    {
                        newMatch = UpdateDATEADD("Second", match, db);
                    }

                    if (newSubQuery.Contains("select", StringComparison.InvariantCultureIgnoreCase))
                    {
                        var date = newSubQuery.Replace("select", "", StringComparison.InvariantCultureIgnoreCase).Trim();
                        newSubQuery = "select " + newMatch.Replace("[date]", date);
                    }
                    else
                    {
                        newSubQuery = newMatch.Replace("[date]", newSubQuery);
                    }
                }

                //newQuery.Append(newSubQuery);
                subs.Add(newSubQuery);
            }

            return string.Join(',', subs);
        }

        private static string UpdateDATEADD(string interval, string query, Database db)
        {
            var value = query.Replace($"1 {interval}", "", StringComparison.InvariantCultureIgnoreCase).Trim();
            if (db == Database.MsSql)
                return $"DATEADD({interval}, {value}, [date])";
            //return "DATEADD(" + interval + "," + value + ",";

            // DATE_ADD('2017-06-15', interval 1 Year)
            return $"DATE_ADD([date], interval {value} {interval})";
        }
    }
}