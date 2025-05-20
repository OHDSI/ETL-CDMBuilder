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

        public class DatabaseChunkPartAdapter
        {
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
                        sqlClean = GetSqlHelper.GetSql(building.SourceEngine.Database, sourceQueryDefinitionSql, building.SourceSchemaName, _chunkId.ToString());
                        if (string.IsNullOrEmpty(sqlClean))                        
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
                if (FrameworkSettings.Settings.Current.Building.Vendor.Name != "PregnancyAlgorithm" && FrameworkSettings.Settings.Current.Building.Vendor.Name != "Era" && _databaseChunkPart.ChunkData.Persons.Count == 0)
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
            public static string GetSql(Database sourceDatabase, string query, string schemaName, string chunkId)
            {
                if (string.IsNullOrEmpty(query)) return query;

                string queryPart = query;
                string queryPartChanged = query;

                if (!queryPartChanged.StartsWith("<"))
                    return finalizeXmlToDbQueryConversion(queryPartChanged, chunkId, schemaName);

                var xeQuery = XElement.Parse(queryPartChanged);
                queryPart = queryPartChanged = xeQuery.Elements("Query").FirstOrDefault()?.Value ?? throw new Exception("Fail to find Query tag in Definitons!");

                #region string tableName = tableName from query
                string[] tableLines = queryPart
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
                #endregion

                #region queryPartChanged = QueryDefinitions with assigned variables
                if (query.Contains("<Variables>"))
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
                        queryPartChanged = queryPartChanged.Replace(actualVariable, variable.Sql);
                    }
                }
                #endregion

                #region database specifics
                switch (sourceDatabase)
                {
                    #region MySql
                    case Database.MySql:
                        queryPartChanged = queryPartChanged.Replace("as varchar", "as char");
                        queryPartChanged = queryPartChanged.Replace("as int", "as signed");
                        queryPartChanged = queryPartChanged.Replace("as bigint", "as signed");
                        queryPartChanged = queryPartChanged.Replace("date_part('year',", "extract(year from ");
                        queryPartChanged = queryPartChanged.Replace("date_part('month',", "extract(month from ");
                        queryPartChanged = queryPartChanged.Replace("date_part('day',", "extract(day from ");
                        queryPartChanged = queryPartChanged.Replace("--", "#");
                        break;
                    #endregion

                    #region MsSql
                    case Database.MsSql:
                        queryPartChanged = queryPartChanged.Replace(schemaName + ".procedure ", schemaName + ".[procedure] ");
                        queryPartChanged = queryPartChanged.Replace("chr(", "char(");
                        queryPartChanged = queryPartChanged.Replace("||", "+");
                        queryPartChanged = queryPartChanged.Replace("date_part('year'", "datepart(year");
                        queryPartChanged = queryPartChanged.Replace("date_part('month'", "datepart(month");
                        queryPartChanged = queryPartChanged.Replace("date_part('day'", "datepart(day");

                        foreach (Match match in Regex.Matches(query, @"\[(.*?)\]", RegexOptions.IgnoreCase).Cast<Match>())
                        {
                            var originalValue = match.Value;
                            // Remove [ and ] and replace spaces as _
                            var forRedshift = originalValue.Replace(" ", "_").Replace("-", "_").Trim();
                            queryPartChanged = queryPartChanged.Replace(originalValue, forRedshift);
                        }

                        break;
                    #endregion

                    #region Postgre
                    case Database.Postgre:
                        
                        #region datepart translation
                        // DATEPART(MONTH, e2.DTSTART)
                        // -> -> ->
                        // EXTRACT(MONTH FROM e2.DTSTART)
                        queryPartChanged = Regex.Replace(
                            queryPartChanged,
                            // \bDATEPART, then “(”, capture part, “,”, capture expr, “)”
                            @"\bDATEPART\s*\(\s*([A-Za-z_][A-Za-z0-9_]*)\s*,\s*([^)]+?)\s*\)",
                            match => $"EXTRACT({match.Groups[1].Value.ToUpper()} FROM {match.Groups[2].Value})",
                            RegexOptions.IgnoreCase
                        );
                        #endregion


                        #region concat fix assuming all numerical pluses are within cases
                        // … END + COLUMN_NAME
                        // -> -> ->
                        // … END || COLUMN_NAME
                        queryPartChanged = Regex.Replace(
                            queryPartChanged,
                            // capture “END” + whitespace + “+” + whitespace, then the identifier
                            @"\bEND\s*\+\s*(\w+)\b",
                            "END || $1",
                            RegexOptions.IgnoreCase
                        );

                        // … ' + COLUMN_NAME
                        // -> -> ->
                        // … ' || COLUMN_NAME
                        queryPartChanged = Regex.Replace(
                            queryPartChanged,
                            // Capture a single-quoted string (group 1), then any whitespace and a plus
                            @"'([^']*)'\s*\+",
                            "'$1' ||",
                            RegexOptions.IgnoreCase
                        );

                        // + '... COLUMN_NAME
                        // -> -> ->
                        // || '... COLUMN_NAME
                        queryPartChanged = Regex.Replace(
                            queryPartChanged,
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
                        queryPartChanged = Regex.Replace(queryPartChanged,
                            @"ROUND\(([^,]+),\s*(\d+)\)",
                            "ROUND(CAST($1 AS NUMERIC), $2)",
                            RegexOptions.IgnoreCase);
                        #endregion

                        #region left(lpad) translation
                        // SUBSTRING(RIGHT('00000000000' + cast(ENROLID as VARCHAR), 11), 1,9)
                        // -> -> ->
                        // LEFT(LPAD(ENROLID::TEXT, 11, '0'), 9)
                        queryPartChanged = Regex.Replace(
                            queryPartChanged,
                            @"SUBSTRING\(\s*RIGHT\('0+'\s*\+\s*cast\(\s*(\w+)\s+as\s+VARCHAR\)\s*,\s*11\)\s*,\s*1\s*,\s*9\)",
                            @"LEFT(LPAD($1::text,11,'0'),9)",
                            RegexOptions.IgnoreCase
                        );
                        #endregion

                        #region drug_claims.rxmr fix
                        if (tableName.Equals("drug_claims", StringComparison.InvariantCultureIgnoreCase))
                        {
                            // wrap any bare integer after “RXMR” and one of the operators =, !=, <, >, <=, >=
                            queryPartChanged = Regex.Replace(
                                queryPartChanged,
                                // capture “RXMR” + whitespace + one of the ops + whitespace, then the number
                                @"\b(RXMR\s*(?:!=|>=|<=|=|>|<)\s*)(\d+)\b",
                                "$1'$2'",
                                RegexOptions.IgnoreCase
                            );
                        }
                        #endregion

                        break;
                    #endregion

                    #region Redshift
                    case Database.Redshift:
                        //foreach (Match match in Regex.Matches(query, @"\[(.*?)\]", RegexOptions.IgnoreCase).Cast<Match>())
                        //{
                        //    var originalValue = match.Value;
                        //    // Remove [ and ] and replace spaces as _
                        //    var forRedshift = originalValue.Replace("[", @"""").Replace("]", @"""").Replace(" ", "_")
                        //        .Replace("-", "_").Trim();
                        //    working = working.Replace(originalValue, forRedshift);
                        //}

                        break;
                        #endregion
                }
                #endregion

                return finalizeXmlToDbQueryConversion(queryPartChanged, chunkId, schemaName);
            }

            static string finalizeXmlToDbQueryConversion(string source, string chunkId, string schemaName)
            {
                var result = source
                        .Replace("{0}", chunkId)
                        .Replace("{sc}", schemaName)
                        .Replace("&gt;", ">")
                        .Replace("&lt;", "<")
                        .Replace("&ge;", ">=")
                        .Replace("&le;", "<=")
                        .Trim()
                        ;
                return result;
            }
        }
    }
}