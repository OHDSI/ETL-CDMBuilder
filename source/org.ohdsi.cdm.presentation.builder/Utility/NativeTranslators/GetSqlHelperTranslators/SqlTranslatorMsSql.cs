using System.Text.RegularExpressions;

namespace org.ohdsi.cdm.presentation.builder.Utility.NativeTranslators.GetSqlHelperTranslators
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

            queryChanged = Regex.Replace(
                queryChanged,
                @"\bregexp_replace\s*\(",
                "replace(",
                RegexOptions.IgnoreCase);

            queryChanged = Regex.Replace(
                queryChanged,
                @"\bnvl\s*\(",
                "coalesce(",
                RegexOptions.IgnoreCase);

            queryChanged = Regex.Replace(
                queryChanged,
                @"\bisnull\s*\(",
                "coalesce(",
                RegexOptions.IgnoreCase);

            #region length → len
            queryChanged = Regex.Replace(queryChanged, @"\s*length\s*\(", " len(", RegexOptions.IgnoreCase);
            #endregion

            #region chr → char
            queryChanged = Regex.Replace(queryChanged, @"\s*chr\s*\(", " char(", RegexOptions.IgnoreCase);
            #endregion

            #region ::float -> CAST(... AS FLOAT)

            queryChanged = Regex.Replace(
                queryChanged,
                @"\b([A-Za-z0-9_\.]+)::float\b",
                "CAST($1 AS FLOAT)",
                RegexOptions.IgnoreCase);

            #endregion

            #region procedure_date ilike 'yy%' to like
            queryChanged = Regex.Replace(
              queryChanged,
              @"\b([\w\.\[\]]+)\s+ilike\s+('(?:[^']|'')*')",
              "LOWER($1) LIKE LOWER($2)",
              RegexOptions.IgnoreCase
            );
            #endregion

            #region datepart translation (EXTRACT → DATEPART)

            queryChanged = Regex.Replace(queryChanged, @"\s*date_part\s*\(", " datepart(", RegexOptions.IgnoreCase);

            queryChanged = Regex.Replace(
                queryChanged,
                // EXTRACT(MONTH FROM col) → DATEPART(MONTH, col)
                @"\bEXTRACT\s*\(\s*([A-Za-z_][A-Za-z0-9_]*)\s+FROM\s+([^)]+?)\)",
                "DATEPART($1, $2)",
                RegexOptions.IgnoreCase
            );

            //remove quotes
            queryChanged = queryChanged
                .Replace("datepart('YEAR'", "DATEPART(YEAR", StringComparison.CurrentCultureIgnoreCase)
                .Replace("datepart('MONTH'", "DATEPART(MONTH", StringComparison.CurrentCultureIgnoreCase)
                .Replace("datepart('DAY'", "DATEPART(DAY", StringComparison.CurrentCultureIgnoreCase);

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
            // to_date(CONCAT(CAST(x AS VARCHAR(6)), '01'), 'yyyyMMdd')
            // CONVERT(date, CONCAT(CAST(x AS VARCHAR(6)), '01'), 112)
            queryChanged = Regex.Replace(
                queryChanged,
                @"\bto_date\s*\(\s*(?<expr>(?>[^()']+|'[^']*'|\((?<d>)|\)(?<-d>))*(?(d)(?!)))\s*,\s*'(?<fmt>[^']+)'\s*(?:,\s*(?<bool>true|false)\s*)?\)",
                m =>
                {
                    var expr = m.Groups["expr"].Value.Trim();
                    var fmt = m.Groups["fmt"].Value.Trim();
            
                    if (fmt.Equals("YYYY-MM-DD", StringComparison.OrdinalIgnoreCase))
                        return $"convert(date, {expr}, 23)";
            
                    if (fmt.Equals("YYYYMMDD", StringComparison.OrdinalIgnoreCase))
                        return $"convert(date, {expr}, 112)";
            
                    return $"convert(date, {expr})";
                },
                RegexOptions.IgnoreCase | RegexOptions.CultureInvariant
            );

            //regex above seems to fail parsing simple fields
            queryChanged = Regex.Replace(
                queryChanged,
                @"\bto_date\s*\(\s*(?<expr>(?>[^()' ,]+|'[^']*'|\((?<d>)|\)(?<-d>)|,(?(d))|\s+)*)\s*,\s*'(?<fmt>[^']+)'\s*(?:,\s*(?<bool>true|false)\s*)?\)",
                m =>
                {
                    var expr = m.Groups["expr"].Value.Trim();
                    var fmt = m.Groups["fmt"].Value.Trim();
            
                    if (fmt.Equals("YYYY-MM-DD", StringComparison.OrdinalIgnoreCase))
                        return $"convert(date, {expr}, 23)";
            
                    if (fmt.Equals("YYYYMMDD", StringComparison.OrdinalIgnoreCase))
                        return $"convert(date, {expr}, 112)";
            
                    return $"convert(date, {expr})";
                },
                RegexOptions.IgnoreCase | RegexOptions.CultureInvariant
            );
                        
            //try to avoid errors when concatinating multiple data types to a string for date casting
            //check each line for convert(date  
            //make everything between '+' wrapped in cast(x as varchar(4))
            //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! THIS WILL BREAK IF ANY TO_DATE CONVERSION IS SPLIT BY LINES !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
            var lines = queryChanged.Split(new[] { "\r\n", "\n", "\r" }, StringSplitOptions.None);
            for (int i = 0; i < lines.Length; i++)
                if (lines[i].Contains("convert(date", StringComparison.OrdinalIgnoreCase) && lines[i].Contains('+'))
                    lines[i] = Regex.Replace(lines[i],
                        @"(?<=\+)\s*(?!')(?<op>[^+]+?)\s*(?=\+)",
                        m => $" CAST({m.Groups["op"].Value.Trim()} AS varchar(4)) ",
                        RegexOptions.IgnoreCase | RegexOptions.CultureInvariant);
            queryChanged = string.Join("\n", lines);

            //cast(x + y + z as timestamp)
            //cast(cast(x as varchar) + cast(y as varchar) + cast(z as varchar) as timestamp)
            queryChanged = Regex.Replace(
                queryChanged,
                @"CAST\s*\(\s*(?<expr>[^()]+?)\s+AS\s+timestamp\s*\)",
                m =>
                {
                    var expr = m.Groups["expr"].Value.Trim();
                    var args = expr.Split(new[] { "+", "||" }, StringSplitOptions.RemoveEmptyEntries);
                    return string.Join(" + ", args.Select(s => "cast(" + s.Trim() + " as varchar(20))"));
                },
                RegexOptions.IgnoreCase
            );



            #endregion

            #region last_day → EOMONTH
            // last_day(cast(extract_ym || '01' as date))
            // EOMONTH(CAST(extract_ym || '01' AS date))
            queryChanged = Regex.Replace(
                queryChanged,
                @"last_day\s*\(\s*(?<expr>(?>[^()']+|'[^']*'|\((?<d>)|\)(?<-d>))*(?(d)(?!)))\s*\)?\)",
                m =>
                {
                    var expr = m.Groups["expr"].Value.Trim();

                    return $"EOMONTH({expr})";
                },
                RegexOptions.IgnoreCase | RegexOptions.CultureInvariant
            );
            #endregion

            #region to_char(date, 'MM')
            //to_char(m2.startDate, 'MM')
            // RIGHT('0' + CAST(DATEPART(MONTH, m2.startDate) AS VARCHAR(2)), 2)

            queryChanged = Regex.Replace(
                queryChanged,
                @"(?i)\bto_char\s*\(\s*(?<expr>[A-Za-z_][A-Za-z0-9_]*\.[A-Za-z_][A-Za-z0-9_]*)\s*,\s*'MM'\s*\)",
                m =>
                {
                    var expr = m.Groups["expr"].Value;
                    return $"RIGHT('0' + CAST(DATEPART(MONTH, {expr}) AS VARCHAR(2)), 2)";
                },
                RegexOptions.CultureInvariant
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

            if (new[] { "optum_extended", "optumextended", "dod", "ses" }.Any(s => _schema.Contains(s, StringComparison.InvariantCultureIgnoreCase)))
                queryChanged = translateOptumExtended(queryChanged);

            if (new[] { "jmdc" }.Any(s => _schema.Contains(s, StringComparison.InvariantCultureIgnoreCase)))
                queryChanged = translateJmdc(queryChanged);

            return queryChanged;
        }

        string translatePremier(string query)
        {
            var queryChanged = query;



            if (string.IsNullOrEmpty(_table))
                return queryChanged;

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

            return queryChanged;
        }

        string translateOptumExtended(string query)
        {
            var queryChanged = query;


            if (string.IsNullOrEmpty(_table))
                return queryChanged;


            return queryChanged;
        }

        string translateJmdc(string query)
        {
            var queryChanged = query;


            if (string.IsNullOrEmpty(_table))
                return queryChanged;


            return queryChanged;
        }
    }
}
