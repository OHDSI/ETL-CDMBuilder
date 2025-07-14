using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace org.ohdsi.cdm.presentation.builder.Utility.GetSqlHelperTranslators
{
    internal class SqlTranslatorMySql : ISqlTranslator
    {
        private readonly string _schema;
        private readonly string? _table;

        public SqlTranslatorMySql(string schemaName, string? tableName)
        {
            _schema = schemaName;
            _table = tableName;
        }

        public string Translate(string query)
        {
            var queryChanged = query;

            queryChanged = translateEngineLevelCommands(queryChanged);

            queryChanged = translateDatabaseLevelCommands(queryChanged);

            return queryChanged;
        }

        string translateEngineLevelCommands(string query)
        {
            var queryChanged = query;

            queryChanged = queryChanged.Replace("  ", " ", StringComparison.InvariantCultureIgnoreCase);

            queryChanged = queryChanged.Replace("bigint)", "double)", StringComparison.InvariantCultureIgnoreCase);

            // ISNULL(a,b) → IFNULL(a,b)
            queryChanged = Regex.Replace(queryChanged, @"\bISNULL\(", "IFNULL(", RegexOptions.IgnoreCase);

            // chr → char
            queryChanged = Regex.Replace(queryChanged, @"\bchr\(", "char(", RegexOptions.IgnoreCase);

            queryChanged = queryChanged.Replace("nvl(", "COALESCE(", StringComparison.InvariantCultureIgnoreCase);

            queryChanged = queryChanged.Replace("isnull(", "COALESCE(", StringComparison.InvariantCultureIgnoreCase);

            queryChanged = queryChanged.Replace("len(", "char_length(", StringComparison.InvariantCultureIgnoreCase);

            // DATEPART(YEAR, t1.DTSTART) → YEAR(t1.DTSTART)
            queryChanged = Regex.Replace(
                queryChanged,
                @"\bDATEPART\s*\(\s*YEAR\s*,\s*([^)]+)\)",
                "YEAR($1)",
                RegexOptions.IgnoreCase);

            // DATEPART(MONTH, col) → MONTH(col)
            queryChanged = Regex.Replace(
              queryChanged,
              @"\bDATEPART\s*\(\s*MONTH\s*,\s*(?<c>[\w\.]+)\s*\)",
              "MONTH(${c})",
              RegexOptions.IgnoreCase);

            // GETDATE() → NOW()
            queryChanged = Regex.Replace(
                queryChanged,
                @"\bGETDATE\s*\(\s*\)",
                "NOW()",
                RegexOptions.IgnoreCase);


            // SUBSTRING(RIGHT(x,11),1,9) → SUBSTRING(x, -11, 9)  
            queryChanged = Regex.Replace(
              queryChanged,
              @"\bSUBSTRING\s*\(\s*RIGHT\s*\(\s*(?<expr>[^,]+)\s*,\s*\d+\s*\)\s*,\s*\d+\s*,\s*\d+\s*\)",
              m => $"SUBSTRING({m.Groups["expr"].Value}, -11, 9)",
              RegexOptions.IgnoreCase);

            // CAST(... AS VARCHAR) → CAST(... AS CHAR)
            queryChanged = Regex.Replace(
              queryChanged,
              @"\bCAST\s*\(\s*(?<expr>.+?)\s+AS\s+VARCHAR\s*\)",
              "CAST(${expr} AS CHAR)",
              RegexOptions.IgnoreCase);

            // String concatenation via '+' → CONCAT(...)  
            queryChanged = Regex.Replace(
              queryChanged,
              @"CAST\(\s*CAST\((?<year>\w+)\s+AS\s+CHAR\)\s*\+\s*'-(?<month>\d+)'\s*\+\s*CAST\(\s*MONTH\((?<datecol>[^)]+)\)\s+AS\s+CHAR\)\s+AS\s+DATE\s*\)",
              m => $"CAST(CONCAT({m.Groups["year"].Value}, '-', {m.Groups["month"].Value}, '-01') AS DATE)",
              RegexOptions.IgnoreCase);

            // CAST(<expr> AS int) → CAST(<expr> AS SIGNED)
            queryChanged = Regex.Replace(
                queryChanged,
                @"\bCAST\s*\(\s*([^)]+)\s+AS\s+int\s*\)",
                "CAST($1 AS SIGNED)",
                RegexOptions.IgnoreCase);

            return queryChanged;
        }

        string translateDatabaseLevelCommands(string query)
        {
            var queryChanged = query;

            if (new[] { "ccae", "mdcr", "mdcd" }.Any(s => _schema.Contains(s, StringComparison.InvariantCultureIgnoreCase)))
                queryChanged = translateTruven(queryChanged);

            return queryChanged;
        }

        string translateTruven(string query)
        {
            string queryChanged = query;

            // Quote _chunks - if not already
            queryChanged = Regex.Replace(
                queryChanged,
                @"(?<!`)\b_chunks\b(?!`)",
                "`_chunks`",
                RegexOptions.IgnoreCase);

            // Quote schema.table for everything else
            queryChanged = Regex.Replace(
                queryChanged,
                $@"\b{Regex.Escape(_schema)}\.(\w+)\b",
                match => $"`{_schema}`.`{match.Groups[1].Value}`",
                RegexOptions.IgnoreCase);

            queryChanged = queryChanged.Replace("10/01/2015", "2015-10-01");

            return queryChanged;
        }
    }
}
