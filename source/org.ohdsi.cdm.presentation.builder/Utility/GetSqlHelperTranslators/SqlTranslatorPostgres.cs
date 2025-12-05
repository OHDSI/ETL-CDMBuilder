using System.Text.RegularExpressions;

namespace org.ohdsi.cdm.presentation.builder.Utility.GetSqlHelperTranslators
{
    internal class SqlTranslatorPostgres : ISqlTranslator
    {
        private readonly string _schema;
        private readonly string? _table;

        public SqlTranslatorPostgres(string schemaName, string? tableName)
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

            #region remove ' ' before '(' if its not within quotes
            queryChanged = Regex.Replace(
                queryChanged,
                @"((?:[^']*'[^']*')*[^']*) \(",
                "$1(",
                RegexOptions.IgnoreCase
            );
            #endregion

            #region simple replaces

            queryChanged = queryChanged.Replace("  ", " ", StringComparison.InvariantCultureIgnoreCase);

            queryChanged = queryChanged.Replace("bigint)", "DECIMAL)", StringComparison.InvariantCultureIgnoreCase);

            queryChanged = queryChanged.Replace("getdate()", "CURRENT_TIMESTAMP", StringComparison.InvariantCultureIgnoreCase);

            queryChanged = queryChanged.Replace("nvl(", "COALESCE(", StringComparison.InvariantCultureIgnoreCase);

            queryChanged = queryChanged.Replace("isnull(", "COALESCE(", StringComparison.InvariantCultureIgnoreCase);

            queryChanged = queryChanged.Replace("len(", "LENGTH(", StringComparison.InvariantCultureIgnoreCase);

            #endregion

            #region datepart translation
            // DATEPART(MONTH, e2.DTSTART)
            // -> -> ->
            // EXTRACT(MONTH FROM e2.DTSTART)
            queryChanged = Regex.Replace(
                queryChanged,
                // \bDATEPART, then “(”, capture part, “,”, capture expr, “)”
                @"\bDATEPART\b*\(\s*([A-Za-z_][A-Za-z0-9_]*)\s*,\s*([^)]+?)\s*\)",
                match => $"EXTRACT({match.Groups[1].Value.ToUpper()} FROM {match.Groups[2].Value})",
                RegexOptions.IgnoreCase
            );
            queryChanged = Regex.Replace(
                queryChanged,
                // \bDATEPART, then “(”, capture part, “,”, capture expr, “)”
                @"\bDATE_PART\b*\(\s*([A-Za-z_][A-Za-z0-9_]*)\s*,\s*([^)]+?)\s*\)",
                match => $"EXTRACT({match.Groups[1].Value.ToUpper()} FROM {match.Groups[2].Value})",
                RegexOptions.IgnoreCase
            );

            #endregion

            #region convert '' to null when context demands it
            // … CASE WHEN col > -999999.99999 THEN col ELSE '' END AS VALUE_AS_NUMBER
            // -> -> ->
            // … CASE WHEN col > -999999.99999 THEN col ELSE NULL END AS VALUE_AS_NUMBER
            queryChanged = Regex.Replace(
                queryChanged,
                // find the ELSE '' END AS VALUE_AS_NUMBER pattern and replace the '' with NULL
                @"(ELSE\s*)''(\s*END\s+AS\s+VALUE_AS_NUMBER\b)",
                "$1NULL$2",
                RegexOptions.IgnoreCase
            );

            // CAST('' AS NUMERIC)
            // -> -> ->
            //  NULL::NUMERIC
            queryChanged = Regex.Replace(
                queryChanged,
                @"CAST\(\s*''\s+AS\s+(?:NUMERIC|DOUBLE\s+PRECISION|DECIMAL)\)",
                "NULL::${1}",
                RegexOptions.IgnoreCase
            );
            #endregion

            #region coalesce(x,'') → coalesce(CAST(x AS VARCHAR), '')
            queryChanged = Regex.Replace(
              queryChanged,
              @"\bcoalesce\(\s*([A-Za-z_][A-Za-z0-9_]*)\s*,\s*''\s*\)",
              "coalesce(CAST($1 AS VARCHAR), '')",
              RegexOptions.IgnoreCase | RegexOptions.Multiline
            );
            #endregion

            #region concat fix assuming all numerical pluses are within cases
            // … END + COLUMN_NAME
            // -> -> ->
            // … END || COLUMN_NAME
            queryChanged = Regex.Replace(
                queryChanged,
                // capture “END” + whitespace + “+” + whitespace, then the identifier
                @"\bEND\s*\+\s*(\w+)\b",
                "END || $1",
                RegexOptions.IgnoreCase
            );

            // … ' + COLUMN_NAME
            // -> -> ->
            // … ' || COLUMN_NAME
            queryChanged = Regex.Replace(
                queryChanged,
                // Capture a single-quoted string (group 1), then any whitespace and a plus
                @"'([^']*)'\s*\+",
                "'$1' ||",
                RegexOptions.IgnoreCase
            );

            // + '... COLUMN_NAME
            // -> -> ->
            // || '... COLUMN_NAME
            queryChanged = Regex.Replace(
                queryChanged,
                // Capture a plus, any whitespace, then single-quoted string (group 1)
                @"\+\s*'([^']*)'",
                "|| '$1'",
                RegexOptions.IgnoreCase
            );

            #endregion

            #region round translation
            //ROUND(field) AS QUANTITY
            // -> -> ->
            //ROUND(CAST(field AS NUMERIC), 0) AS QUANTITY
            queryChanged = Regex.Replace(queryChanged,
                @"\bROUND\s*\(\s*([^,]+)\s*,\s*(\d+)\s*\)",
                "ROUND(CAST($1 AS NUMERIC), $2)",
                RegexOptions.IgnoreCase
            );

            var dbg = "\r\n\t\t ROUND(METQTY,0) AS QUANTITY,";
            var dbg_res = Regex.Replace(dbg,
                @"\bROUND\s*\(\s*([^,]+)\s*,\s*(\d+)\s*\)",
                "ROUND(CAST($1 AS NUMERIC), $2)",
                RegexOptions.IgnoreCase
            );
            #endregion

            #region left(lpad) translation
            // SUBSTRING(RIGHT('00000000000' + cast(ENROLID as VARCHAR), 11), 1,9)
            // -> -> ->
            // LEFT(LPAD(ENROLID::TEXT, 11, '0'), 9)
            queryChanged = Regex.Replace(
                queryChanged,
                @"SUBSTRING\(\s*RIGHT\('0+'\s*\+\s*cast\(\s*(\w+)\s+as\s+VARCHAR\)\s*,\s*11\)\s*,\s*1\s*,\s*9\)",
                @"LEFT(LPAD($1::text,11,'0'),9)",
                RegexOptions.IgnoreCase
            );
            #endregion

            #region left and right fix 
            // LEFT(integer, n) → LEFT(CAST(integer AS varchar), n)
            queryChanged = Regex.Replace(
                queryChanged,
                @"\bleft\s*\(\s*([^,]+?)\s*,\s*(\d+)\s*\)",
                "left(CAST($1 AS varchar), $2)",
                RegexOptions.IgnoreCase
            );

            // RIGHT(integer, n) → RIGHT(CAST(integer AS varchar), n)
            queryChanged = Regex.Replace(
                queryChanged,
                @"\bRIGHT\s*\(\s*([^,]+?)\s*,\s*(\d+)\s*\)",
                "RIGHT(CAST($1 AS varchar), $2)",
                RegexOptions.IgnoreCase
            );
            #endregion


            #region to_date fix
            // to_date(text_date, 'YYYYMMDD', FALSE)
            // -> -> ->
            // to_date(text_date, 'YYYYMMDD')
            queryChanged = Regex.Replace(
                queryChanged,
                @"\bto_date\s*\(\s*([^,]+?)\s*,\s*'([^']+?)'\s*,\s*false\s*\)",
                "to_date($1, '$2')",
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

            if (_schema.Contains("premier", StringComparison.InvariantCultureIgnoreCase))
                queryChanged = translatePremier(queryChanged);

            if (new[] { "optum_panther", "optumpanther", "ehr" }.Any(s => _schema.Contains(s, StringComparison.InvariantCultureIgnoreCase)))
                queryChanged = translateOptumPantherEhr(queryChanged);

            if (new[] { "optum_extended", "optumextended", "dod", "ses" }.Any(s => _schema.Contains(s, StringComparison.InvariantCultureIgnoreCase)))
                queryChanged = translateOptumExtended(queryChanged);

            if (new[] { "jmdc" }.Any(s => _schema.Contains(s, StringComparison.InvariantCultureIgnoreCase)))
                queryChanged = translateJmdc(queryChanged);

            if (new[] { "cprd" }.Any(s => _schema.Contains(s, StringComparison.InvariantCultureIgnoreCase)))
                queryChanged = translateCprd(queryChanged);

            return queryChanged;
        }

        string translateTruven(string query)
        {
            var queryChanged = query;

            #region cast enrolid as varchar
            // ENROLID AS PERSON_ID
            // -> -> ->
            // CAST(ENROLID AS VARCHAR(50)) AS PERSON_ID
            //t. is optional
            queryChanged = Regex.Replace(
                queryChanged,
                @"\b(\w+\.)?ENROLID\s*AS\s*PERSON_ID\b",
                "cast($1ENROLID AS VARCHAR(50)) AS PERSON_ID",
                RegexOptions.IgnoreCase
            );
            #endregion

            #region fix _chunks join 
            // = ch.person_id
            // -> -> ->
            // = ch.person_source_value
            queryChanged = Regex.Replace(
                queryChanged,
                @"=(\s*)ch\.person_id\b",
                "= $1ch.person_source_value",
                RegexOptions.IgnoreCase
            );

            // t.ENROLID = ch.person_source_value
            // -> -> ->
            // cast(t.ENROLID as varchar) = ch.person_source_value
            //t. is optional
            queryChanged = Regex.Replace(
                queryChanged,
                @"\b(\w+\.)?ENROLID\s*=\s*ch\.person_source_value\b",
                "cast($1ENROLID as varchar) = ch.person_source_value",
                RegexOptions.IgnoreCase
            );
            #endregion

            #region dstatus fix
            // look for a number that’s either
            // - right after "IN("  or
            // - right after the previous comma (\G, )
            // and is followed by either a comma or the closing parenthesis
            // then wrap the numbers in quotes
            queryChanged = Regex.Replace(
                queryChanged,
                @"(?<=\bDSTATUS\s+IN\s*\(\s*|\G,)\s*(\d+)\s*(?=\s*(?:,|\)))",
                "'$1'",
                RegexOptions.IgnoreCase
            );
            #endregion

            if (_table.Equals("drug_claims", StringComparison.InvariantCultureIgnoreCase))
            {
                // wrap any bare integer after “RXMR” and one of the operators =, !=, <, >, <=, >=
                queryChanged = Regex.Replace(
                    queryChanged,
                    // capture “RXMR” + whitespace + one of the ops + whitespace, then the number
                    @"\b(RXMR\s*(?:!=|>=|<=|=|>|<)\s*)(\d+)\b",
                    "$1'$2'",
                    RegexOptions.IgnoreCase
                );
            }

            return queryChanged;
        }

        string translatePremier(string query)
        {
            var queryChanged = query;

            #region cast medrec_key as varchar
            // t.medrec_key = ch.person_source_value
            // -> -> ->
            // cast(t.medrec_key as varchar) = ch.person_source_value
            queryChanged = Regex.Replace(
                queryChanged,
                @"\b(\w+\.)?medrec_key\s*=\s*ch\.person_source_value\b",
                "cast(medrec_key as varchar) = ch.person_source_value",
                RegexOptions.IgnoreCase
            );
            #endregion

            if (string.IsNullOrEmpty(_table))
                return queryChanged;

            if (_table.Equals("patbill", StringComparison.InvariantCultureIgnoreCase))
            {
                queryChanged = queryChanged.Replace("chg.std_chg_code != 360360000530008",
                    "chg.std_chg_code != '360360000530008'",
                    StringComparison.CurrentCultureIgnoreCase);

                queryChanged = queryChanged.Replace("len(pat.ms_drg)",
                    "length(cast(pat.ms_drg as varchar))",
                    StringComparison.CurrentCultureIgnoreCase);

                queryChanged = queryChanged.Replace("length(pat.ms_drg)",
                    "length(cast(pat.ms_drg as varchar))",
                    StringComparison.CurrentCultureIgnoreCase);
            }

            return queryChanged;
        }

        string translateOptumPantherEhr(string query)
        {
            var queryChanged = query;

            if (string.IsNullOrEmpty(_table))
                return queryChanged;

            //add cast as varchar
            queryChanged = Regex.Replace(
                queryChanged,
                @"\bEXTRACT\s*\(\s*YEAR\s+FROM\s+((?:\w+\.)*)note_date\s*\)\s*=",
                "cast(EXTRACT(YEAR FROM $1note_date) as varchar) =",
                RegexOptions.IgnoreCase
            );
            queryChanged = Regex.Replace(
                queryChanged,
                @"\bEXTRACT\s*\(\s*MONTH\s+FROM\s+((?:\w+\.)*)note_date\s*\)\s*=",
                "cast(EXTRACT(MONTH FROM $1note_date) as varchar) =",
                RegexOptions.IgnoreCase
            );

            if (_table.Equals("diagnosis", StringComparison.InvariantCultureIgnoreCase))
            {
                queryChanged = queryChanged.Replace("diagnosis_status || ';' || ad + dd + p + pd as condition_status_source_value",
                    "diagnosis_status || ';' || ad || dd || p || pd as condition_status_source_value",
                    StringComparison.CurrentCultureIgnoreCase);
            }

            return queryChanged;
        }

        string translateOptumExtended(string query)
        {
            var queryChanged = query;           


            if (string.IsNullOrEmpty(_table))
                return queryChanged;

            if (_table.Equals("SES", StringComparison.CurrentCultureIgnoreCase))
            {
                queryChanged = queryChanged.Replace("last_day(cast(extract_ym || '01' as date)) date",
                    "(date_trunc('month', cast(extract_ym || '01' as date) + interval '1 month') - interval '1 day')::date as date",
                    StringComparison.CurrentCultureIgnoreCase);                
            }

            return queryChanged;
        }

        string translateJmdc(string query)
        {
            var queryChanged = query;


            if (string.IsNullOrEmpty(_table))
                return queryChanged;

            if (_table.Equals("enrollment", StringComparison.CurrentCultureIgnoreCase))
            {
                queryChanged = queryChanged.Replace("DATEADD(DAY, -1, DATEADD(MONTH, 1, CAST(CAST(e.observation_end AS VARCHAR(6)) || '01' AS DATE))) AS observation_period_end_date",
                    "(to_date(CAST(e.observation_end AS varchar) || '01','YYYYMMDD') + interval '1 month' - interval '1 day') AS observation_period_end_date",
                    StringComparison.CurrentCultureIgnoreCase);
            }

            return queryChanged;
        }

        string translateCprd(string query)
        {
            var queryChanged = query;


            queryChanged = Regex.Replace(
                queryChanged,
                @"\bpatid\s*=\s*ch.person_source_value",
                "patid = cast(ch.person_source_value as int8)",
                RegexOptions.IgnoreCase
            );


            if (string.IsNullOrEmpty(_table))
                return queryChanged;


            return queryChanged;
        }
    }
}