using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace org.ohdsi.cdm.presentation.builder.Utility.GetSqlHelperTranslators
{
    internal class SqlTranslatorMsSql : ISqlTranslator
    {
        private readonly string _schema;
        private readonly string? _table;

        public SqlTranslatorMsSql(string schemaName, string? tableName)
        {
            _schema = schemaName;
            _table = tableName;
        }

        public string Translate(string query)
        {
            var queryChanged = translateEngineLevelCommands(query);

            queryChanged = translateDatabaseLevelCommands(queryChanged);

            return queryChanged;
        }

        string translateEngineLevelCommands(string query)
        {
            var queryChanged = query;

            queryChanged = queryChanged.Replace("  ", " ", StringComparison.InvariantCultureIgnoreCase);

            queryChanged = queryChanged.Replace("getdate()", "CURRENT_TIMESTAMP", StringComparison.InvariantCultureIgnoreCase);

            queryChanged = queryChanged.Replace("nvl(", "COALESCE(", StringComparison.InvariantCultureIgnoreCase);

            queryChanged = queryChanged.Replace("isnull(", "COALESCE(", StringComparison.InvariantCultureIgnoreCase);

            // length → len
            queryChanged = Regex.Replace(queryChanged, @"\s*length\s*\(", " len(", RegexOptions.IgnoreCase);

            // chr → char
            queryChanged = Regex.Replace(queryChanged, @"\s*chr\s*\(", " char(", RegexOptions.IgnoreCase);

            queryChanged = Regex.Replace(queryChanged, @"\s*date_part\s*\(", " datepart(", RegexOptions.IgnoreCase);

            #region procedure_date ilike 'yy%' to like
            queryChanged = Regex.Replace(
              queryChanged,
              @"\b([\w\.\[\]]+)\s+ilike\s+('(?:[^']|'')*')",
              "LOWER($1) LIKE LOWER($2)",
              RegexOptions.IgnoreCase
            );
            #endregion

            #region datepart translation (EXTRACT → DATEPART)
            queryChanged = Regex.Replace(
                queryChanged,
                // EXTRACT(MONTH FROM col) → DATEPART(MONTH, col)
                @"\bEXTRACT\s*\(\s*([A-Za-z_][A-Za-z0-9_]*)\s+FROM\s+([^)]+?)\)",
                "DATEPART($1, $2)",
                RegexOptions.IgnoreCase
            );
            #endregion

            #region coalesce → isnull
            // COALESCE(col, 'val') → ISNULL(col, 'val')
            queryChanged = Regex.Replace(
                queryChanged,
                @"\bCOALESCE\s*\(\s*([^,]+?)\s*,\s*([^)]+?)\)",
                "ISNULL($1, $2)",
                RegexOptions.IgnoreCase
            );
            #endregion

            #region null::type → CAST(NULL AS type)
            // NULL::NUMERIC → CAST(NULL AS NUMERIC)
            queryChanged = Regex.Replace(
                queryChanged,
                @"NULL::\s*(NUMERIC|DECIMAL|DOUBLE PRECISION)",
                "CAST(NULL AS $1)",
                RegexOptions.IgnoreCase
            );
            #endregion

            #region string concatenation (|| → +)
            // 'foo' || col → 'foo' + col   and   col || 'bar' → col + 'bar'
            queryChanged = Regex.Replace(
                queryChanged,
                @"\|\|",
                "+",
                RegexOptions.None
            );
            #endregion

            #region LEFT(LPAD(...)) → SUBSTRING(RIGHT(REPLICATE(...)))
            // LEFT(LPAD(col::text,11,'0'),9) →
            // SUBSTRING(RIGHT(REPLICATE('0',11) + CAST(col AS VARCHAR(11)),11),1,9)
            queryChanged = Regex.Replace(
                queryChanged,
                @"LEFT\s*\(\s*LPAD\s*\(\s*(\w+)::text\s*,\s*11\s*,\s*'0'\s*\)\s*,\s*9\s*\)",
                "SUBSTRING(RIGHT(REPLICATE('0',11) + CAST($1 AS VARCHAR(11)),11),1,9)",
                RegexOptions.IgnoreCase
            );
            #endregion

            #region to_date → convert
            queryChanged = Regex.Replace(
                queryChanged,
                @"\bto_date\s*\(\s*([\w\.\[\]]+)\s*,\s*'YYYY-MM-DD'\s*,\s*false\s*\)",
                "CONVERT(date, $1, 23)",
                RegexOptions.IgnoreCase
            );

            queryChanged = Regex.Replace(
                queryChanged,
                @"\bto_date\s*\(\s*([\w\.\[\]]+)\s*,\s*'YYYYMMDD'\s*,\s*false\s*\)",
                "CONVERT(date, $1, 112)",
                RegexOptions.IgnoreCase
            );

            queryChanged = Regex.Replace(
                queryChanged,
                @"\bto_date\s*\(\s*([\w\.\[\]]+)\s*,\s*'YYYY-MM-DD'\s*\)",
                "CONVERT(date, $1, 23)",
                RegexOptions.IgnoreCase
            );

            queryChanged = Regex.Replace(
                queryChanged,
                @"\bto_date\s*\(\s*([\w\.\[\]]+)\s*,\s*'YYYYMMDD'\s*\)",
                "CONVERT(date, $1, 112)",
                RegexOptions.IgnoreCase
            );
            #endregion

            return queryChanged;
        }

        string translateDatabaseLevelCommands(string query)
        {
            var queryChanged = query;

            if (_schema.Contains("premier", StringComparison.CurrentCultureIgnoreCase))
                queryChanged = translatePremier(queryChanged);

            if (new[] { "optum_panther", "optumpanther", "ehr" }.Any(s => _schema.Contains(s, StringComparison.InvariantCultureIgnoreCase)))
                queryChanged = translateOptumPantherEhr(queryChanged);

            return queryChanged;
        }

        string translatePremier(string query)
        {
            var queryChanged = query;



            if(string.IsNullOrEmpty(_table))
                return queryChanged;

            if (_table.Equals("patbill", StringComparison.CurrentCultureIgnoreCase))
            {
                queryChanged = queryChanged.Replace("chg.std_chg_code != 360360000530008",
                    "chg.std_chg_code != '360360000530008'",
                    StringComparison.CurrentCultureIgnoreCase);
            }

            if (_table.Equals("vitals", StringComparison.CurrentCultureIgnoreCase))
            {
                queryChanged = queryChanged.Replace("regexp_replace(lab_test, '\\\\(.*\\\\)', '') snomed",
                    "STUFF(lab_test, \r\n PATINDEX('%([(]%)%', lab_test), \r\n CHARINDEX(')', lab_test + ')') - PATINDEX('%([(]%)%', lab_test) + 1, \r\n '')",
                    StringComparison.CurrentCultureIgnoreCase);
            }

            return queryChanged;
        }

        string translateOptumPantherEhr(string query)
        {
            var queryChanged = query;



            if (string.IsNullOrEmpty(_table))
                return queryChanged;

            if (_table.Equals("alz_imaging", StringComparison.CurrentCultureIgnoreCase))
            {
                queryChanged = Regex.Replace(
                    queryChanged,
                    @"\bprocedure\b",
                    " l.[procedure] ",
                    RegexOptions.IgnoreCase
                );
            }

            if (_table.Equals("medication_administrations", StringComparison.CurrentCultureIgnoreCase))
            {
                queryChanged = queryChanged.Replace("cast(m.admin_date + ' ' + m.admin_time as TIMESTAMP)",
                    "TRY_CONVERT(datetime, CONCAT(m.admin_date, ' ', m.admin_time), 120)",
                    StringComparison.CurrentCultureIgnoreCase);
            }

            if (_table.Equals("onc_metastatic_location", StringComparison.CurrentCultureIgnoreCase))
            {
                queryChanged = queryChanged.Replace("to_date(replace(metastasis_dx_date, 'mmdd', '0630'), 'YYYYMMDD')",
                    "TRY_CONVERT(date, REPLACE(metastasis_dx_date, 'mmdd', '0630'), 112)",
                    StringComparison.CurrentCultureIgnoreCase);

                queryChanged = queryChanged.Replace("to_date(replace(metastasis_dx_date, 'dd', '15'), 'YYYYMMDD')",
                    "TRY_CONVERT(date, REPLACE(metastasis_dx_date, 'dd', '15'), 112)",
                    StringComparison.CurrentCultureIgnoreCase);
            }

            if (_table.Equals("onc_neoplasm_histology", StringComparison.CurrentCultureIgnoreCase))
            {
                queryChanged = queryChanged.Replace("regexp_replace",
                    "replace",
                    StringComparison.CurrentCultureIgnoreCase);

                queryChanged = queryChanged.Replace("to_date(replace(h.neoplasm_dx_date, 'mmdd', '0630'), 'YYYYMMDD')",
                    "TRY_CONVERT(date, REPLACE(h.neoplasm_dx_date, 'mmdd', '0630'), 112)",
                    StringComparison.CurrentCultureIgnoreCase);

                queryChanged = queryChanged.Replace("to_date(replace(h.neoplasm_dx_date, 'dd', '15'), 'YYYYMMDD')",
                    "TRY_CONVERT(date, REPLACE(h.neoplasm_dx_date, 'dd', '15'), 112)",
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

            if (_table.Equals("procedure", StringComparison.CurrentCultureIgnoreCase))
            {
                queryChanged = queryChanged.Replace(".procedure",
                    ".\"procedure\"",
                    StringComparison.CurrentCultureIgnoreCase);
            }

            return queryChanged;
        }
    }
}
