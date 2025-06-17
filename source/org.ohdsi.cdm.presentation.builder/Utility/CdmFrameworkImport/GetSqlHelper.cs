using org.ohdsi.cdm.framework.common.Enums;
using org.ohdsi.cdm.framework.common.Extensions;
using org.ohdsi.cdm.framework.desktop.Databases;
using org.ohdsi.cdm.framework.desktop.Enums;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace org.ohdsi.cdm.presentation.builder.Utility.CdmFrameworkImport
{
    public static class GetSqlHelper
    {
        /// <summary>
        /// Will error in case the table does not exist
        /// </summary>
        /// <param name="targetDatabase"></param>
        /// <param name="query"></param>
        /// <returns></returns>
        /// <exception cref="NotImplementedException"></exception>
        public static string TranslateSqlTruncate(IDatabaseEngine targetDatabase, string query)
        {
            var queryChanged = query;
            switch (targetDatabase)
            {
                default:
                    throw new NotImplementedException($"Database {targetDatabase.Database.ToName()} is not supported for truncate translation");

                case MssqlDatabaseEngine:
                    {
                        break;
                    }

                case PostgreDatabaseEngine:
                    {
                        // IF OBJECT_ID (N'{sc}.MY_TABLE', N'U') IS NOT NULL truncate table {sc}.MY_TABLE;
                        //   →   →   →
                        // DO $$ BEGIN EXECUTE 'TRUNCATE TABLE {sc}.MY_TABLE'; EXCEPTION WHEN undefined_table THEN NULL; END; $$ LANGUAGE plpgsql;
                        #region truncate_if_exists → DO $$ ... EXCEPTION WHEN undefined_table
                        // IF OBJECT_ID (N'schema.table', N'U') IS NOT NULL truncate table schema.table;
                        // ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
                        queryChanged = Regex.Replace(
                           queryChanged,
                           @"(?im)^\s*IF\s+OBJECT_ID\s*\(\s*N?'([^']+)'\s*,\s*N?'U'\s*\)\s+IS\s+NOT\s+NULL\s+truncate\s+table\s+\1\s*;",
                           @"DO $ BEGIN EXECUTE 'TRUNCATE TABLE $1'; EXCEPTION WHEN undefined_table THEN NULL; END; $$ LANGUAGE plpgsql;",
                           RegexOptions.Multiline | RegexOptions.IgnoreCase
                        );
                        queryChanged = queryChanged.Replace("DO $", "DO $$").Replace("END; $", "END; $$");
                        #endregion

                        break;
                    }
            }
            return queryChanged;
        }

        /// <summary>
        /// Translate select from MsSql to other SQL dialects
        /// </summary>
        /// <param name="vendor"></param>
        /// <param name="sourceDatabase"></param>
        /// <param name="query"></param>
        /// <param name="schemaName"></param>
        /// <param name="chunkId">Should be left null or blank for batch sqcript</param>
        /// <returns></returns>
        public static string TranslateSql(Vendor vendor, Database sourceDatabase, string query, string schemaName, string chunkId = "")
        {
            try
            {
                string tableName = getTableNameFromQuery(query);
                var queryChanged = translateFromMsSql(query, sourceDatabase, schemaName, tableName);
                queryChanged = finalizeXmlToDbQueryConversion(queryChanged, chunkId, schemaName);
                return queryChanged;
            }
            catch (Exception e)
            {
                throw;
            }
            finally
            {

            }
        }

        static string finalizeXmlToDbQueryConversion(string source, string chunkId, string schemaName)
        {
            var result = source
                    .Replace("{0}", chunkId ?? "0")
                    .Replace("{sc}", schemaName)
                    .Replace("&gt;", ">")
                    .Replace("&lt;", "<")
                    .Replace("&ge;", ">=")
                    .Replace("&le;", "<=")
                    .Trim()
                    ;
            return result;
        }

        static string getTableNameFromQuery(string query)
        {
            string[] tableLines = query
                    .Split(new[] { "\r", "\n" }, StringSplitOptions.RemoveEmptyEntries)
                    .Where(s => new string[] { "from", "join" }.Any(a => s.Contains(a, StringComparison.InvariantCultureIgnoreCase)))
                    .Where(s => !s.Contains("_chunks", StringComparison.InvariantCultureIgnoreCase))
                    .ToArray();

            string tableName = new string(tableLines
                .First(s => s.Contains(".")) //get first qualified table name
                .SkipWhile(s => s != '.')
                .Skip(1)
                .TakeWhile(s => s != ' ')
                .ToArray());

            return tableName;
        }

        static string assignVariables(string query, XElement xeQuery, string schemaName)
        {
            string result = query;
            if (xeQuery.ToString().Contains("<Variables>"))
            {
                var variables = xeQuery
                    .Elements("Variables")
                    .First()
                    .Elements("Variable")
                    .Select(v => new
                    {
                        Name = v.Attribute("name")?.Value ?? "",
                        Database = v.Attribute("database")?.Value ?? "",
                        Sql = v.Value.Trim()
                    })
                    .ToList();

                foreach (var variable in variables)
                {
                    var databases = variable.Database.Split(',');
                    if (!databases.Any(s => schemaName.Contains(s, StringComparison.InvariantCultureIgnoreCase)))
                        continue;

                    var actualVariable = "{" + variable.Name + "}";
                    result = result.Replace(actualVariable, variable.Sql);
                }
            }
            return result;
        }

        static string translateFromMsSql(string query, Database requiredEngine, string schemaName, string tableName)
        {
            var queryChanged = query;

            switch (requiredEngine)
            {
                case Database.MySql:
                    {
                        queryChanged = queryChanged.Replace("as varchar", "as char");
                        queryChanged = queryChanged.Replace("as int", "as signed");
                        queryChanged = queryChanged.Replace("as bigint", "as signed");
                        queryChanged = queryChanged.Replace("date_part('year',", "extract(year from ");
                        queryChanged = queryChanged.Replace("date_part('month',", "extract(month from ");
                        queryChanged = queryChanged.Replace("date_part('day',", "extract(day from ");
                        queryChanged = queryChanged.Replace("--", "#");
                        break;
                    }

                case Database.MsSql:
                    {
                        queryChanged = queryChanged.Replace(schemaName + ".procedure ", schemaName + ".[procedure] ");
                        queryChanged = queryChanged.Replace("chr(", "char(");
                        queryChanged = queryChanged.Replace("||", "+");
                        queryChanged = queryChanged.Replace("date_part('year'", "datepart(year");
                        queryChanged = queryChanged.Replace("date_part('month'", "datepart(month");
                        queryChanged = queryChanged.Replace("date_part('day'", "datepart(day");

                        foreach (Match match in Regex.Matches(queryChanged, @"\[(.*?)\]", RegexOptions.IgnoreCase).Cast<Match>())
                        {
                            var originalValue = match.Value;
                            // Remove [ and ] and replace spaces as _
                            var forRedshift = originalValue.Replace(" ", "_").Replace("-", "_").Trim();
                            queryChanged = queryChanged.Replace(originalValue, forRedshift);
                        }

                        break;
                    }

                case Database.Postgre:
                    {
                        //////////////////////////
                        #region engine level 

                        queryChanged = queryChanged.Replace("getdate()", "CURRENT_TIMESTAMP", StringComparison.InvariantCultureIgnoreCase);

                        #region datepart translation
                        // DATEPART(MONTH, e2.DTSTART)
                        // -> -> ->
                        // EXTRACT(MONTH FROM e2.DTSTART)
                        queryChanged = Regex.Replace(
                            queryChanged,
                            // \bDATEPART, then “(”, capture part, “,”, capture expr, “)”
                            @"\bDATEPART\s*\(\s*([A-Za-z_][A-Za-z0-9_]*)\s*,\s*([^)]+?)\s*\)",
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

                        #region isnull to coalesce
                        // ISNULL(name, 'PROVID')
                        // -> -> ->
                        // COALESCE(name, 'PROVID')
                        queryChanged = Regex.Replace(
                            queryChanged,
                            @"\bISNULL\s*\(\s*([^,]+?)\s*,\s*([^)]+?)\s*\)",
                            "COALESCE($1, $2)",
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
                            RegexOptions.IgnoreCase);

                        var dbg = "\r\n\t\t ROUND(METQTY,0) AS QUANTITY,";
                        var dbg_res = Regex.Replace(dbg,
                            @"\bROUND\s*\(\s*([^,]+)\s*,\s*(\d+)\s*\)",
                            "ROUND(CAST($1 AS NUMERIC), $2)",
                            RegexOptions.IgnoreCase);
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

                        #endregion
                        //////////////////////////




                        //////////////////////////
                        #region database level

                        #region Truven
                        if (new[] { "ccae", "mdcr", "mdcd" }.Any(s => schemaName.Contains(s, StringComparison.InvariantCultureIgnoreCase)))
                        {
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
                        }
                        #endregion

                        #endregion
                        //////////////////////////



                            
                        //////////////////////////
                        #region table level

                        #region ccae.drug_claims.rxmr fix
                        if (new[] { "ccae", "mdcr", "mdcd" }.Any(s => schemaName.Contains(s, StringComparison.InvariantCultureIgnoreCase))
                            && tableName.Equals("drug_claims", StringComparison.InvariantCultureIgnoreCase))
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
                        #endregion

                        #endregion
                        //////////////////////////

                        break;
                    }

                case Database.Redshift:
                    {
                        throw new NotImplementedException("Translation to Redshift is not ready!");
                        //foreach (Match match in Regex.Matches(queryChanged, @"\[(.*?)\]", RegexOptions.IgnoreCase).Cast<Match>())
                        //{
                        //    var originalValue = match.Value;
                        //    // Remove [ and ] and replace spaces as _
                        //    var forRedshift = originalValue.Replace("[", @"""").Replace("]", @"""").Replace(" ", "_")
                        //        .Replace("-", "_").Trim();
                        //    working = working.Replace(originalValue, forRedshift);
                        //}

                        break;

                    }
            }
            return queryChanged;
        }

        static bool isDatabaseMatch(XElement xeQuery, Vendor vendor, string schemaName)
        {
            var xeQueryDatabaseAttribute = xeQuery.Attribute("database");
            if (xeQueryDatabaseAttribute != null)
            {
                //it would be better to check database name though
                var dbs = xeQueryDatabaseAttribute.Value.Split(',');
                if (!dbs.Any(s => vendor.Name.Contains(s, StringComparison.InvariantCultureIgnoreCase)
                              || schemaName.Contains(s, StringComparison.InvariantCultureIgnoreCase)))
                    return false;
            }
            return true;
        }
    }
}
