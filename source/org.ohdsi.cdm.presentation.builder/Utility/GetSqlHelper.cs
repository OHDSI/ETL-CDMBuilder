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

namespace org.ohdsi.cdm.presentation.builder.Utility
{
    public static class GetSqlHelper
    {
        /// <summary>
        /// Translate select from Redshift to other SQL dialects
        /// </summary>
        /// <param name="vendor"></param>
        /// <param name="sourceDatabase"></param>
        /// <param name="query"></param>
        /// <param name="schemaName"></param>
        /// <param name="chunkId">Should be left null or blank for batch sqcript</param>
        /// <returns></returns>
        public static string TranslateSqlFromRedshift(Vendor vendor, Database sourceDatabase, string query, string schemaName, string chunkId = "")
        {
            try
            {
                string tableName = getTableNameFromQuery(query);
                var queryChanged = translateFromRedshift(query, sourceDatabase, schemaName, tableName);
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
            var tableLines = query
                    .Split(new[] { "\r", "\n" }, StringSplitOptions.RemoveEmptyEntries)
                    .Where(s => new string[] { "from", "join" }.Any(a => s.Contains(a, StringComparison.InvariantCultureIgnoreCase)))
                    .Where(s => !s.Contains("_chunks", StringComparison.InvariantCultureIgnoreCase));

            string tableName = new string(tableLines
                .First(s => s.Contains(".")) //get first qualified table name
                .SkipWhile(s => s != '.')
                .Skip(1)
                .TakeWhile(s => s != ' ')
                .ToArray());

            return tableName;
        }

        static string translateFromRedshift(string query, Database requiredEngine, string schemaName, string tableName)
        {
            return requiredEngine switch
            {
                Database.MySql => translateRedshiftToMySql(query, schemaName, tableName),
                Database.MsSql => translateRedshiftToMsSql(query, schemaName, tableName),
                Database.Postgre => translateRedshiftToPostgres(query, schemaName, tableName),
                _ => throw new NotImplementedException($"Database {requiredEngine.ToName()} is not supported for translation from Redshift"),
            };
        }

        static string translateRedshiftToPostgres(string query, string schemaName, string tableName)
        {
            var queryChanged = query;

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

            return queryChanged;

        }

        static string translateRedshiftToMsSql(string query, string schemaName, string tableName)
        {
            var queryChanged = query;

            //////////////////////////
            #region engine level

            // GETDATE() instead of CURRENT_TIMESTAMP
            queryChanged = queryChanged
                .Replace("CURRENT_TIMESTAMP", "GETDATE()", StringComparison.InvariantCultureIgnoreCase);

            #region datepart translation (EXTRACT → DATEPART)
            queryChanged = Regex.Replace(
                queryChanged,
                // EXTRACT(MONTH FROM col) → DATEPART(MONTH, col)
                @"\bEXTRACT\s*\(\s*([A-Za-z_][A-Za-z0-9_]*)\s+FROM\s+([^)]+?)\)",
                "DATEPART($1, $2)",
                RegexOptions.IgnoreCase);
            #endregion

            #region coalesce → isnull
            // COALESCE(col, 'val') → ISNULL(col, 'val')
            queryChanged = Regex.Replace(
                queryChanged,
                @"\bCOALESCE\s*\(\s*([^,]+?)\s*,\s*([^)]+?)\)",
                "ISNULL($1, $2)",
                RegexOptions.IgnoreCase);
            #endregion

            #region null::type → CAST(NULL AS type)
            // NULL::NUMERIC → CAST(NULL AS NUMERIC)
            queryChanged = Regex.Replace(
                queryChanged,
                @"NULL::\s*(NUMERIC|DECIMAL|DOUBLE PRECISION)",
                "CAST(NULL AS $1)",
                RegexOptions.IgnoreCase);
            #endregion

            #region string concatenation (|| → +)
            // 'foo' || col → 'foo' + col   and   col || 'bar' → col + 'bar'
            queryChanged = Regex.Replace(
                queryChanged,
                @"\|\|",
                "+",
                RegexOptions.None);
            #endregion

            #region LEFT(LPAD(...)) → SUBSTRING(RIGHT(REPLICATE(...)))
            // LEFT(LPAD(col::text,11,'0'),9) →
            // SUBSTRING(RIGHT(REPLICATE('0',11) + CAST(col AS VARCHAR(11)),11),1,9)
            queryChanged = Regex.Replace(
                queryChanged,
                @"LEFT\s*\(\s*LPAD\s*\(\s*(\w+)::text\s*,\s*11\s*,\s*'0'\s*\)\s*,\s*9\s*\)",
                "SUBSTRING(RIGHT(REPLICATE('0',11) + CAST($1 AS VARCHAR(11)),11),1,9)",
                RegexOptions.IgnoreCase);
            #endregion

            #endregion
            //////////////////////////


            //////////////////////////
            #region database level


            #endregion
            //////////////////////////


            //////////////////////////
            #region table level


            #endregion
            //////////////////////////

            return queryChanged;
        }

        static string translateRedshiftToMySql(string query, string schemaName, string tableName)

        {
            var queryChanged = query;

            //////////////////////////
            #region engine level 

            // ISNULL(a,b) → IFNULL(a,b)
            queryChanged = Regex.Replace(queryChanged, @"\bISNULL\(", "IFNULL(", RegexOptions.IgnoreCase);

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



            #endregion
            //////////////////////////




            //////////////////////////
            #region database level

            #region Truven
            if (new[] { "ccae", "mdcr", "mdcd" }.Any(s => schemaName.Contains(s, StringComparison.InvariantCultureIgnoreCase)))
            {
                // Quote _chunks - if not already
                queryChanged = Regex.Replace(
                    queryChanged,
                    @"(?<!`)\b_chunks\b(?!`)",
                    "`_chunks`",
                    RegexOptions.IgnoreCase);

                // Quote schema.table for everything else
                queryChanged = Regex.Replace(
                    queryChanged,
                    $@"\b{Regex.Escape(schemaName)}\.(\w+)\b",
                    match => $"`{schemaName}`.`{match.Groups[1].Value}`",
                    RegexOptions.IgnoreCase);

                queryChanged = queryChanged.Replace("10/01/2015", "2015-10-01");

            }
            #endregion

            #endregion
            //////////////////////////




            //////////////////////////
            #region table level

            #endregion
            //////////////////////////

            return queryChanged;
        }
    }
}
