using Npgsql;
using NpgsqlTypes;
using org.ohdsi.cdm.framework.common.Base;
using org.ohdsi.cdm.framework.common.Builder;
using org.ohdsi.cdm.framework.common.DataReaders.v5;
using org.ohdsi.cdm.framework.common.DataReaders.v5.v52;
using org.ohdsi.cdm.framework.common.DataReaders.v5.v53;
using org.ohdsi.cdm.framework.common.Definitions;
using org.ohdsi.cdm.framework.common.Enums;
using org.ohdsi.cdm.framework.common.Extensions;
using org.ohdsi.cdm.framework.common.Omop;
using org.ohdsi.cdm.framework.Common.Base;
using org.ohdsi.cdm.framework.common.Utility;
using org.ohdsi.cdm.framework.desktop.Databases;
using org.ohdsi.cdm.framework.desktop.DataReaders;
using org.ohdsi.cdm.framework.desktop.Enums;
using org.ohdsi.cdm.framework.desktop.Helpers;
using org.ohdsi.cdm.framework.desktop.Savers;
using org.ohdsi.cdm.framework.desktop.Settings;
using System;
using System.Data;
using System.Data.Common;
using System.Data.Odbc;
using System.Diagnostics;
using System.Globalization;
using System.Numerics;
using System.Reflection;
using System.Runtime.CompilerServices;
using System.Text;
using System.Text.RegularExpressions;
using System.Xml.Linq;
using System.Xml.Serialization;
using cdm6 = org.ohdsi.cdm.framework.common.DataReaders.v6;
using CohortDefinition = org.ohdsi.cdm.framework.common.Definitions.CohortDefinition;
using FrameworkSettings = org.ohdsi.cdm.framework.desktop.Settings;

namespace org.ohdsi.cdm.presentation.builder.Utility
{

    /// <summary>
    /// This class keeps code from Framework.dll with minor alterations so that it would work in this project
    /// </summary>
    public abstract class CdmFrameworkImport
    {
        public class DbSourceAdapter
        {
            readonly cdm.framework.desktop.DbLayer.DbSource _dbSource;
            private readonly string _connectionString;
            private readonly string _dbType;

            public DbSourceAdapter(string connectionString, string dbType, string schemaName)
            {
                _connectionString = connectionString;
                _dbType = dbType;
                _dbSource = new cdm.framework.desktop.DbLayer.DbSource(connectionString, dbType, schemaName);
            }


            public void CreateChunkSchema(string name)
            {                
                try
                {
                    var query = "CREATE SCHEMA IF NOT EXISTS {sc};";
                    query = query.Replace("{sc}", name);
                    using var connection = SqlConnectionHelper.OpenOdbcConnection(_connectionString);
                    using var cmd = new OdbcCommand(query, connection);
                    cmd.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Can't create chunk schema");
                }
            }

            private string GetQuery(string fileName, string schemaName)
            {
                var resources = EmbeddedResourceManager.ReadEmbeddedResources("ohdsi", fileName, StringComparison.InvariantCultureIgnoreCase);
                var query = resources
                    .FirstOrDefault(s => s.Key.Contains(_dbType, StringComparison.InvariantCultureIgnoreCase))
                    .Value.Replace("{sc}", schemaName);
                return query;
            }

            public void CreateChunkTable(string schemaName, bool withDrop = true)
            {
                if (withDrop)
                    DropChunkTable(schemaName);

                var query = GetQuery("CreateChunkTable.sql", schemaName);

                Console.WriteLine("CreateChunkTable:" + query);

                using var connection = SqlConnectionHelper.OpenOdbcConnection(_connectionString);
                using var cmd = new OdbcCommand(query, connection);
                cmd.ExecuteNonQuery();
            }

            public void DropChunkTable(string schemaName)
            {
                var query = GetQuery("DropChunkTable.sql", schemaName);

                Console.WriteLine("DropChunkTable:" + query);
                using var connection = SqlConnectionHelper.OpenOdbcConnection(_connectionString);
                using var cmd = new OdbcCommand(query, connection);
                cmd.ExecuteNonQuery();
            }

            public IEnumerable<long> GetPersonIds(int chunkId, string schemaName)
            {
                var query = $"SELECT person_id FROM {schemaName}._chunks where chunkid={chunkId};";
                using var connection = SqlConnectionHelper.OpenOdbcConnection(_connectionString);
                using var c = new OdbcCommand(query, connection) { CommandTimeout = 300 };
                using var reader = c.ExecuteReader();
                while (reader.Read())
                {
                    yield return reader.GetInt64(0);
                }
            }

            public void CreateIndexesChunkTable(string schemaName)
            {
                var query = GetQuery("CreateIndexesChunkTable.sql", schemaName);

                if (string.IsNullOrEmpty(query.Trim()))
                    return;

                using var connection = SqlConnectionHelper.OpenOdbcConnection(_connectionString);
                foreach (var subQuery in query.Split(new[] { "GO" + "\r\n", "GO" + "\n" },
                    StringSplitOptions.RemoveEmptyEntries))
                {
                    using var command = new OdbcCommand(subQuery, connection);
                    command.CommandTimeout = 0;
                    command.ExecuteNonQuery();
                }
            }


            public IEnumerable<IDataReader> GetPersonKeys(string batchScript, long batches, int batchSize, string schemaName)
            {
                batchScript = batchScript.Replace("{sc}", schemaName);

                //unclear why this is necessary, not working in Postgre
                //var sql = batches > 0
                //    ? string.Format(batchScript, "TOP " + batches * batchSize)
                //    : string.Format(batchScript, "");
                var sql = string.Format(batchScript, "");

                using var connection = SqlConnectionHelper.OpenOdbcConnection(_connectionString);
                using var c = new OdbcCommand(sql, connection) { CommandTimeout = 0 };
                using var reader = c.ExecuteReader();
                while (reader.Read())
                {
                    yield return reader;
                }

            }

            public string GetSourceReleaseDate(string schemaName)
            {
                try
                {
                    string query = "SELECT VERSION_DATE VERSION_DATE FROM " + schemaName + "._Version";
                    using var connection = SqlConnectionHelper.OpenOdbcConnection(_connectionString);
                    using var c = new OdbcCommand(query, connection) { CommandTimeout = 0 };
                    using var reader = c.ExecuteReader();

                    while (reader.Read())
                    {
                        var dateString = reader.GetString("VERSION_DATE");
                        var date = DateTime.Parse(dateString);

                        return date.ToShortDateString();
                    }

                }
                catch (Exception)
                {
                    return DateTime.MinValue.ToShortDateString();
                }

                return DateTime.MinValue.ToShortDateString();
            }

            public string GetSourceVersionId(string schemaName)
            {
                try
                {
                    string query = "SELECT version_id FROM " + schemaName + "._Version";
                    using var connection = SqlConnectionHelper.OpenOdbcConnection(_connectionString);
                    using var c = new OdbcCommand(query, connection);
                    using var reader = c.ExecuteReader();

                    while (reader.Read())
                    {
                        return reader.GetString("version_id");
                    }

                }
                catch (Exception)
                {
                    return "unknown";
                }

                return "unknown";
            }
        }

        public class DatabaseChunkBuilderAdapter
        {
            private readonly framework.desktop.Base.DatabaseChunkBuilder _databaseChunkBuilder;
            private readonly FrameworkSettings.BuildingSettings _frameworkBuildingSettings; //to quickly check it
            
            private int _chunkId;
            private Func<IPersonBuilder> _createPersonBuilder;


            public DatabaseChunkBuilderAdapter(int chunkId, Func<IPersonBuilder> createPersonBuilder)
            {
                _chunkId = chunkId;
                _createPersonBuilder = createPersonBuilder;
                _frameworkBuildingSettings = FrameworkSettings.Settings.Current.Building;

                _databaseChunkBuilder = new framework.desktop.Base.DatabaseChunkBuilder(chunkId, createPersonBuilder);
            }

            
            public void Process()
            {
                _databaseChunkBuilder.Process();
            }
        }

        public class DatabaseChunkPartAdapter
        {
            private static readonly string[] tableExclusionArray = new string[] 
            {
            "ccae_tests_native.LONG_TERM_CARE"
            };

            private readonly framework.desktop.Base.DatabaseChunkPart _databaseChunkPart;
            private readonly KeyMasterOffsetManager _offsetManager;
            private readonly int _chunkId;
            private readonly string _prefix;
            private readonly int _attempt;

            public DatabaseChunkPartAdapter(Func<IPersonBuilder> createPersonBuilder, int chunkId, string prefix, int attempt)
            {
                _databaseChunkPart = new framework.desktop.Base.DatabaseChunkPart(chunkId, createPersonBuilder, prefix, attempt);
                _offsetManager = new KeyMasterOffsetManager(_chunkId, int.Parse(prefix), attempt);
                _chunkId = chunkId;
                _prefix = prefix;
                _attempt = attempt;
            }

            public framework.desktop.Base.DatabaseChunkPart GetDatabaseChunkPart()
            {
                return _databaseChunkPart;
            }

            public void Reset()
            {
                _databaseChunkPart.Reset();
            }

            public KeyValuePair<string, Exception> Load()
            {
                var building = FrameworkSettings.Settings.Current.Building;

                string sqlClean = "";
                string sourceConnectionString = "";
                string sourceEngine = "";

                try
                {
                    Stopwatch stopwatch = new Stopwatch();
                    stopwatch.Start();
                    foreach (var sourceQueryDefinition in building.SourceQueryDefinitions)
                    {
                        var sourceQueryDefinitionTyped = new QueryDefinitionAdapter(sourceQueryDefinition);
                        if (sourceQueryDefinitionTyped.HasAnyProvidersLocationsCareSites)
                            continue;

                        string sourceQueryDefinitionSql = sourceQueryDefinitionTyped.GetSql(building.Vendor, building.SourceSchemaName, building.SourceSchemaName);
                        sqlClean = GetSqlHelper.TranslateSql(building.Vendor, building.SourceEngine.Database, sourceQueryDefinitionSql, building.SourceSchemaName, _chunkId.ToString());
                        if (string.IsNullOrEmpty(sqlClean))
                            continue;

                        //debug
                        if (tableExclusionArray.Any(s => sqlClean.Contains(s, StringComparison.InvariantCultureIgnoreCase)))
                            continue;

                        if (building.SourceEngine.Database != Database.Redshift)
                        {
                            sourceConnectionString = building.SourceConnectionString;
                            sourceEngine = building.SourceEngine.Database.ToString();
                            using (IDbConnection dbConnection = building.SourceEngine.GetConnection(building.SourceConnectionString))
                            {
                                using IDbCommand cmd = building.SourceEngine.GetCommand(sqlClean, dbConnection);
                                using IDataReader dataReader = building.SourceEngine.ReadChunkData(dbConnection, cmd, sourceQueryDefinition, _chunkId, _prefix);
                                while (dataReader.Read())
                                {
                                    _databaseChunkPart.PopulateData(sourceQueryDefinition, dataReader);
                                }
                            }
                            continue;
                        }
                        using IDataReader dataReader2 = building.SourceEngine.ReadChunkData(null, null, sourceQueryDefinition, _chunkId, _prefix);
                        while (dataReader2.Read())
                        {
                            _databaseChunkPart.PopulateData(sourceQueryDefinition, dataReader2);
                        }
                    }
                    stopwatch.Stop();
                }
                catch (Exception value2)
                {
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.AppendLine("SourceEngine=" + sourceEngine);
                    stringBuilder.AppendLine("SourceConnectionString=" + sourceConnectionString);
                    stringBuilder.AppendLine("Query:");
                    stringBuilder.AppendLine(sqlClean);
                    return new KeyValuePair<string, Exception>(stringBuilder.ToString(), value2);
                }
                return new KeyValuePair<string, Exception>(null, null);
            }

            public void Build()
            {
                Console.WriteLine($"Building CDM chunkId={_chunkId} ...");
                foreach (KeyValuePair<long, Lazy<IPersonBuilder>> personBuilder in _databaseChunkPart.PersonBuilders)
                {
                    Attrition attrition = personBuilder.Value.Value.Build(_databaseChunkPart.ChunkData, _offsetManager);                    
                    _databaseChunkPart.ChunkData.AddAttrition(personBuilder.Key, attrition);
                }
                _databaseChunkPart.PersonBuilders.Clear();
                _databaseChunkPart.PersonBuilders = null;
                Console.WriteLine($"Building CDM chunkId={_chunkId} - complete");
            }

            public void Save()
            {
                Console.WriteLine($"Saving chunkId={_chunkId} ...");
                Console.WriteLine("DestinationConnectionString=" + FrameworkSettings.Settings.Current.Building.DestinationConnectionString);
                if (FrameworkSettings.Settings.Current.Building.Vendor.Name != "PregnancyAlgorithm" 
                    && FrameworkSettings.Settings.Current.Building.Vendor.Name != "Era" 
                    && _databaseChunkPart.ChunkData.Persons.Count == 0)
                {
                    _databaseChunkPart.ChunkData.Clean();
                    return;
                }
                ISaver saver = FrameworkSettings.Settings.Current.Building.DestinationEngine.GetSaver();
                Stopwatch stopwatch = new Stopwatch();
                stopwatch.Start();
                using (saver)
                {
                    saver.Create(FrameworkSettings.Settings.Current.Building.DestinationConnectionString).Save(_databaseChunkPart.ChunkData, _offsetManager);
                }
                stopwatch.Stop();
                Console.WriteLine($"Saving chunkId={_chunkId} - complete");
                _databaseChunkPart.ChunkData.Clean();
                GC.Collect();
            }

            public void Clean()
            {
                _databaseChunkPart.ChunkData.Clean();
            }
        }

        [XmlInclude(typeof(QueryDefinition))]
        [Serializable]
        public class QueryDefinitionAdapter
        {
            private static string[] separator => new string[1] { "," };

            public ProviderDefinition[] Providers => _original.Providers ?? Array.Empty<ProviderDefinition>();
            public LocationDefinition[] Locations => _original.Locations ?? Array.Empty<LocationDefinition>();
            public CareSiteDefinition[] CareSites => _original.CareSites ?? Array.Empty<CareSiteDefinition>();

            public bool HasAnyProvidersLocationsCareSites => Providers.Any() || Locations.Any() || CareSites.Any();

            private readonly QueryDefinition _original;

            public QueryDefinitionAdapter(QueryDefinition original)
            {
                _original = original;
            }

            public string GetSql(Vendor vendor, string sourceSchema, string chunkSchema)
            {
                //not clear what this does so skip the check. It's not working correctly sometimes
                if (false && !IsSuitable(_original.Query.Database, vendor))
                {
                    return null;
                }

                if (_original.Variables == null || _original.Variables.Length == 0)
                {
                    return _original.Query.Text.Replace("{sc}", sourceSchema).Replace("{ch_sc}", chunkSchema);
                }

                QueryVariable[] variables = _original.Variables;
                foreach (QueryVariable queryVariable in variables)
                {
                    if (IsSuitable(queryVariable.Database, vendor))
                    {
                        _original.Query.Text = _original.Query.Text.Replace("{" + queryVariable.Name + "}", queryVariable.Value);
                    }
                }

                return _original.Query.Text.Replace("{sc}", sourceSchema).Replace("{ch_sc}", chunkSchema);
            }

            public static bool IsSuitable(string databases, Vendor vendor)
            {
                Vendor vendor2 = vendor;
                if (string.IsNullOrEmpty(databases))
                {
                    return true;
                }

                if (databases.Equals("none", StringComparison.OrdinalIgnoreCase))
                {
                    return false;
                }

                return databases.Split(separator, StringSplitOptions.RemoveEmptyEntries).Any((string db) => vendor2.ToString().Contains(db.Trim(), StringComparison.CurrentCultureIgnoreCase));
            }
        }

        /// <summary>
        /// This is imported from Framework, but it has completely new massive logic
        /// </summary>
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
                            queryChanged = queryChanged.Replace("DO $", "DO $$").Replace("END $", "END $$");
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

            /// <summary>
            /// Translate select from MsSql to other SQL dialects. 
            /// TO BE DELETED
            /// </summary>
            /// <param name="vendor"></param>
            /// <param name="sourceDatabase"></param>
            /// <param name="query"></param>
            /// <param name="schemaName"></param>
            /// <param name="chunkId"></param>
            /// <param name="isBatchScript"></param>
            /// <returns></returns>
            /// <exception cref="Exception"></exception>
            [Obsolete("This should not be used since the Framework handles the query now after Settings.SourceQueryDefinitions are set. ")]
            public static string TranslateSqlFromXml(Vendor vendor, Database sourceDatabase, string query, string schemaName, string chunkId, bool isBatchScript = false)
            {
                try
                {
                    if (string.IsNullOrEmpty(query)) return query;

                    string queryPart = query;
                    string queryPartChanged = query;

                    if (isBatchScript)
                        //return finalizeXmlToDbQueryConversion(queryPartChanged, chunkId, schemaName);
                        return query;

                    var xeQueryDefinition = XElement.Parse(queryPartChanged);
                    var xeVariables = xeQueryDefinition.Element("Variables");
                    var xeQuery = xeQueryDefinition.Element("Query") ?? throw new Exception("Can't find Query tag in QueryDefinitions!");

                    if (!isDatabaseMatch(xeQuery, vendor, schemaName))
                        return null; //do not process this query due to database mismatch

                    queryPart = queryPartChanged = xeQuery.Value;

                    string tableName = getTableNameFromQuery(queryPartChanged);

                    queryPartChanged = assignVariables(queryPartChanged, xeQueryDefinition, schemaName);

                    queryPartChanged = translateFromMsSql(queryPartChanged, sourceDatabase, schemaName, tableName);

                    return finalizeXmlToDbQueryConversion(queryPartChanged, chunkId, schemaName);
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
                        .Replace("{0}", chunkId ?? "")
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

        /// <summary>
        /// Can't reference org.ohdsi.cdm.presentation.lambdabuilder from ETL-LambdaBuilder, so hard copy with a constructor
        /// </summary>
        public class BuildingSettings : IVendorSettings
        {
            public int? Id { get; set; }

            public Vendor Vendor { get; set; }
            public List<QueryDefinition> SourceQueryDefinitions { get; set; }
            public List<LookupDefinition> CombinedLookupDefinitions { get; set; }

            public int LoadId { get; set; }

            public string BatchScript { get; set; }

            public BuildingSettings(int buildingId, Vendor vendor, string etlLibraryPath)
            {
                this.Id = buildingId;
                this.Vendor = vendor;
                EtlLibrary.LoadVendorSettings(etlLibraryPath, this);
            }
        }

    }
}