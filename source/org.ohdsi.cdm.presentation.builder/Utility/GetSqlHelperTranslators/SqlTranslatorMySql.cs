using System;
using System.Collections.Generic;
using System.Globalization;
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

            queryChanged = queryChanged.Replace("int)", "double)", StringComparison.InvariantCultureIgnoreCase);

            queryChanged = queryChanged.Replace("timestamp)", "datetime)", StringComparison.InvariantCultureIgnoreCase);

            // ISNULL(a,b) → IFNULL(a,b)
            queryChanged = Regex.Replace(queryChanged, @"\bISNULL\(", "IFNULL(", RegexOptions.IgnoreCase);

            // chr → char
            queryChanged = Regex.Replace(queryChanged, @"\bchr\(", "char(", RegexOptions.IgnoreCase);

            queryChanged = queryChanged.Replace("nvl(", "COALESCE(", StringComparison.InvariantCultureIgnoreCase);

            queryChanged = queryChanged.Replace("isnull(", "COALESCE(", StringComparison.InvariantCultureIgnoreCase);

            queryChanged = queryChanged.Replace("len(", "char_length(", StringComparison.InvariantCultureIgnoreCase);

            #region datepart

            queryChanged = Regex.Replace(queryChanged, @"\s*date_part\s*\(", " datepart(", RegexOptions.IgnoreCase);

            // DATEPART(YEAR, t1.DTSTART) → YEAR(t1.DTSTART)
            queryChanged = Regex.Replace(
                queryChanged,
                @"\bDATEPART\s*\(\s*YEAR\s*,\s*([^)]+)\)",
                "YEAR($1)",
                RegexOptions.IgnoreCase);

            // DATEPART('YEAR', t1.DTSTART) → YEAR(t1.DTSTART)
            queryChanged = Regex.Replace(
                queryChanged,
                @"\bDATEPART\s*\(\s*'YEAR'\s*,\s*([^)]+)\)",
                "YEAR($1)",
                RegexOptions.IgnoreCase);

            // DATEPART(MONTH, t1.col) → MONTH(t1.col)
            queryChanged = Regex.Replace(
              queryChanged,
              @"\bDATEPART\s*\(\s*MONTH\s*,\s*([^)]+)\)",
              "MONTH($1)",
              RegexOptions.IgnoreCase);

            // DATEPART('MONTH', t1.col) → MONTH(t1.col)
            queryChanged = Regex.Replace(
              queryChanged,
              @"\bDATEPART\s*\(\s*'MONTH'\s*,\s*([^)]+)\)",
              "MONTH($1)",
              RegexOptions.IgnoreCase);

            #endregion

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

            #region procedure_date ilike 'yy%' to like
            queryChanged = Regex.Replace(
              queryChanged,
              @"\b([\w\.\[\]]+)\s+ilike\s+('(?:[^']|'')*')",
              "LOWER($1) LIKE LOWER($2)",
              RegexOptions.IgnoreCase
            );
            #endregion

            #region to_date → str_to_date
            queryChanged = Regex.Replace(
                queryChanged,
                @"\bto_date\s*\(\s*([\w\.]+)\s*,\s*'YYYY-MM-DD'\s*,\s*false\s*\)",
                "STR_TO_DATE($1, '%Y-%m-%d')",
                RegexOptions.IgnoreCase
            );

            queryChanged = Regex.Replace(
                queryChanged,
                @"\bto_date\s*\(\s*([\w\.]+)\s*,\s*'YYYYMMDD'\s*,\s*false\s*\)",
                "STR_TO_DATE($1, '%Y%m%d')",
                RegexOptions.IgnoreCase
            );

            queryChanged = Regex.Replace(
                queryChanged,
                @"\bto_date\s*\(\s*([\w\.]+)\s*,\s*'YYYYMMDD'\s*\)",
                "STR_TO_DATE($1, '%Y%m%d')",
                RegexOptions.IgnoreCase
            );
            #endregion


            return queryChanged;
        }

        string translateDatabaseLevelCommands(string query)
        {
            var queryChanged = query;

            if (new[] { "ccae", "mdcr", "mdcd" }.Any(s => _schema.Contains(s, StringComparison.InvariantCultureIgnoreCase)))
                queryChanged = translateTruven(queryChanged);

            if (new[] { "optum_panther", "optumpanther", "ehr" }.Any(s => _schema.Contains(s, StringComparison.InvariantCultureIgnoreCase)))
                queryChanged = translateOptumPantherEhr(queryChanged);

            if (new[] { "optum_extended", "optumextended", "dod", "ses" }.Any(s => _schema.Contains(s, StringComparison.InvariantCultureIgnoreCase)))
                queryChanged = translateOptumExtended(queryChanged);

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

            queryChanged = queryChanged.Replace("10/01/2015",
                "2015-10-01",
                StringComparison.CurrentCultureIgnoreCase);

            return queryChanged;
        }

        string translateOptumPantherEhr(string query)
        {
            var queryChanged = query;

            if (_table.Equals("alz_imaging", StringComparison.CurrentCultureIgnoreCase))
            {
                queryChanged = Regex.Replace(
                    queryChanged,
                    @"\bprocedure\b",
                    " \"procedure\" ",
                    RegexOptions.IgnoreCase
                );
            }

            if (_table.Equals("diagnosis", StringComparison.CurrentCultureIgnoreCase))
            {
                queryChanged = queryChanged.Replace(
                    @"'October 1, 2015'",
                    "STR_TO_DATE('October 1, 2015', '%M %e, %Y')",
                    StringComparison.CurrentCultureIgnoreCase
                );
            }

            if (_table.Equals("L_LOCATION", StringComparison.CurrentCultureIgnoreCase))
            {
                queryChanged = queryChanged.Replace(
                    @"region + '_' + division",
                    "concat(region, '_', division)",
                    StringComparison.CurrentCultureIgnoreCase
                );
            }

            if (_table.Equals("onc_metastatic_location", StringComparison.CurrentCultureIgnoreCase))
            {
                queryChanged = queryChanged.Replace("to_date(replace(metastasis_dx_date, 'mmdd', '0630'), 'YYYYMMDD')",
                    "STR_TO_DATE(metastasis_dx_date, '%Y%m%d')",
                    StringComparison.CurrentCultureIgnoreCase);

                queryChanged = queryChanged.Replace("to_date(replace(metastasis_dx_date, 'dd', '15'), 'YYYYMMDD')",
                    "STR_TO_DATE(metastasis_dx_date, '%Y%m%d')",
                    StringComparison.CurrentCultureIgnoreCase);
            }

            if (_table.Equals("onc_neoplasm_histology", StringComparison.CurrentCultureIgnoreCase))
            {
                queryChanged = queryChanged.Replace("trim (coalesce(histology_characteristic, '') || ' ' || coalesce(direction, '') || ' ' || coalesce(neoplasm_type, '') || ' ' || coalesce(histology, ''))",
                    "ltrim(rtrim(coalesce(histology_characteristic, '') || ' ' || coalesce(direction, '') || ' ' || coalesce(neoplasm_type, '') || ' ' || coalesce(histology, '')))",
                    StringComparison.CurrentCultureIgnoreCase);

                queryChanged = queryChanged.Replace("trim (coalesce (neoplasm_characteristic, '') ||' '|| coalesce (histology_characteristic, '')||' '||coalesce (direction, '')||' '|| coalesce (neoplasm_type, '')||' '\r\n                || coalesce (histology, 'neoplasm'))",
                    "ltrim(rtrim(coalesce (neoplasm_characteristic, '') ||' '|| coalesce (histology_characteristic, '')||' '||coalesce (direction, '')||' '|| coalesce (neoplasm_type, '')||' '\r\n                || coalesce (histology, 'neoplasm')))",
                    StringComparison.CurrentCultureIgnoreCase);

            }

            if (_table.Equals("onc_tumor_size", StringComparison.CurrentCultureIgnoreCase))
            {
                queryChanged = queryChanged.Replace("ISNULL",
                    "COALESCE",
                    StringComparison.CurrentCultureIgnoreCase);

                queryChanged = Regex.Replace(
                    queryChanged,
                    @"\b([A-Za-z0-9_\.]+)::float\s*/\s*(\d+)",
                    "CAST($1 AS FLOAT) / $2",
                    RegexOptions.IgnoreCase);

                queryChanged = Regex.Replace(
                    queryChanged,
                    @"\b([A-Za-z0-9_\.]+)::float\b",
                    "CAST($1 AS FLOAT)",
                    RegexOptions.IgnoreCase);

            }

            return queryChanged;

        }

        string translateOptumExtended(string query)
        {
            var queryChanged = query;


            queryChanged = queryChanged.Replace("10/01/2015",
                "2015-10-01",
                StringComparison.CurrentCultureIgnoreCase);


            queryChanged = queryChanged.Replace("05/01/2000",
                "2000-05-01",
                StringComparison.CurrentCultureIgnoreCase);


            if (string.IsNullOrEmpty(_table))
                return queryChanged;


            if (_table.Equals("member_continuous_enrollment", StringComparison.CurrentCultureIgnoreCase))
            {
                queryChanged = queryChanged.Replace("DATEPART(MONTH, m2.startDate)",
                    "RIGHT('0' + CAST(DATEPART(MONTH, m2.startDate) AS VARCHAR), 2)",
                    StringComparison.CurrentCultureIgnoreCase);
            }

            if (_table.Equals("rx_claims", StringComparison.CurrentCultureIgnoreCase))
            {
                queryChanged = queryChanged.Replace("ISNULL",
                    "COALESCE",
                    StringComparison.CurrentCultureIgnoreCase);
            }

            return queryChanged;
        }
    }
}