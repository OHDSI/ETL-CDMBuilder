using org.ohdsi.cdm.framework.desktop.Databases;
using org.ohdsi.cdm.framework.desktop.Helpers;
using org.ohdsi.cdm.presentation.builder.Utility;
using Spectre.Console;
using System.Data.Odbc;
using System.Data;
using System.Text.RegularExpressions;
using Microsoft.Extensions.Logging.Abstractions;

namespace org.ohdsi.cdm.presentation.builder.Base.DatabaseManager
{
    /// <summary>
    /// Created via DbDestinationFactory
    /// </summary>
    public abstract class DatabaseManager
    {
        public enum ActionStatus
        {
            Success,
            Failed,
            AlreadyExists
        }

        public string ConnectionString { get; }
        public IDatabaseEngine DbEngine { get; }
        public string SchemaName { get; }

        protected DatabaseManager(string connectionString, IDatabaseEngine dbEngine, string schemaName)
        {
            ConnectionString = connectionString;
            DbEngine = dbEngine;
            SchemaName = schemaName;
        }

        public abstract ActionStatus CreateDatabase(string query);

        public abstract ActionStatus CreateSchema();

        public abstract ActionStatus ExecuteQuery(string query);

        #region _chunks

        public void CreateChunkTable(string schemaName, bool withDrop = true)
        {
            if (withDrop)
                DropChunkTable(schemaName);

            var origQuery = GetQuery("CreateChunkTable.sql", schemaName);

            //make the table partitioned to enable partitionwise join with gigantic tables which can't be indexed due to huge disk load for temp and actual data storage            
            if (Settings.Current.Building.SourceEngine.Database == framework.desktop.Enums.Database.Postgre)
            {
                var partitionCount = 256;

                using var connection = SqlConnectionHelper.OpenOdbcConnection(ConnectionString);

                #region main table
                string fieldSet = "(ChunkId int, PartitionId int, PERSON_ID bigint NOT NULL, PERSON_SOURCE_VALUE varchar(50) NULL)";
                if (!origQuery.Contains(fieldSet.Replace("  ", " ").Trim(), StringComparison.InvariantCultureIgnoreCase))
                    throw new Exception("Fields for _chunks table in the main package have been changed!");

                var createTable = "CREATE TABLE {0}._chunks " +
                    "\r\n" + fieldSet +
                    "\r\npartition by HASH (person_source_value);";
                var createTableFormatted = string.Format(createTable, schemaName);

                using var createTableCmd = new OdbcCommand(createTableFormatted, connection);
                createTableCmd.ExecuteNonQuery();
                #endregion

                #region partitions
                var createPartitions = "DO $$" +
                    "\r\nDECLARE" +
                    "\r\n  part_cnt    int := {1};" +
                    "\r\n  i          int;" +
                    "\r\n  part_name   text;" +
                    "\r\nBEGIN" +
                    "\r\n  FOR i IN 0..part_cnt-1 LOOP" +
                    "\r\n    part_name := format('_chunks_p%s', i);" +
                    "\r\n\r\n    IF NOT EXISTS (" +
                    "\r\n      SELECT 1" +
                    "\r\n      FROM pg_class c" +
                    "\r\n      JOIN pg_namespace n ON n.oid = c.relnamespace" +
                    "\r\n      WHERE n.nspname = '{0}' AND c.relname = part_name" +
                    "\r\n    ) THEN" +
                    "\r\n      EXECUTE format(" +
                    "\r\n        'CREATE TABLE %I.%I" +
                    "\r\n           PARTITION OF %I.%I" +
                    "\r\n           FOR VALUES WITH (MODULUS %s, REMAINDER %s);'," +
                    "\r\n        '{0}', part_name, '{0}', '_chunks', part_cnt, i" +
                    "\r\n      );" +
                    "\r\n    END IF;" +
                    "\r\n  END LOOP;" +
                    "\r\nEND$$;";
                var createPartitionsformatted = string.Format(createPartitions, schemaName, partitionCount.ToString());

                using var createPartitionsCmd = new OdbcCommand(createPartitionsformatted, connection);
                createPartitionsCmd.ExecuteNonQuery();
                #endregion

                #region statistics 
                string createStatistics = string.Format("CREATE STATISTICS {0}_chunks_stats", schemaName) +
                    "\r\n    (dependencies, ndistinct)" +
                    "\r\n    ON chunkid, person_source_value" +
                    string.Format("\r\nFROM {0}._chunks;", schemaName);

                using var statisticsCmd = new OdbcCommand(createStatistics, connection);
                statisticsCmd.ExecuteNonQuery();
                #endregion

            }
            //use default _chunks script
            else
            {
                if (Settings.Current.Building.SourceEngine.Database == framework.desktop.Enums.Database.MsSql
                    && !origQuery.Contains(", [PartitionId] [int]"))
                    origQuery = origQuery.Replace("[ChunkId] [int],", "[ChunkId] [int], [PartitionId] [int],");
                using var connection = SqlConnectionHelper.OpenOdbcConnection(ConnectionString);
                using var cmd = new OdbcCommand(origQuery, connection);
                cmd.ExecuteNonQuery();
            }
        }

        public void AnalyzeChunkTable(string schemaName)
        {
            if (Settings.Current.Building.SourceEngine.Database == framework.desktop.Enums.Database.Postgre)
            {
                string analyze = string.Format("ANALYZE {0}._chunks;", schemaName);

                using var connection = SqlConnectionHelper.OpenOdbcConnection(ConnectionString);
                using var analyzeCmd = new OdbcCommand(analyze, connection);
                analyzeCmd.ExecuteNonQuery();
            }
            else
            {
                //do nothing for other RDBMS
            }
        }

        public void DropChunkTable(string schemaName)
        {
            var query = GetQuery("DropChunkTable.sql", schemaName);

            AnsiConsole.WriteLine("DropChunkTable:" + query);
            using var connection = SqlConnectionHelper.OpenOdbcConnection(ConnectionString);
            using var cmd = new OdbcCommand(query, connection);
            cmd.CommandTimeout = 6000;
            cmd.ExecuteNonQuery();
        }

        public void CreateIndexesChunkTable(string schemaName)
        {
            var query = GetQuery("CreateIndexesChunkTable.sql", schemaName);

            if (string.IsNullOrEmpty(query.Trim()))
                return;

            using var connection = SqlConnectionHelper.OpenOdbcConnection(ConnectionString);
            foreach (var subQuery in query.Split(new[] { "GO" + "\r\n", "GO" + "\n" },
                StringSplitOptions.RemoveEmptyEntries))
            {
                using var command = new OdbcCommand(subQuery, connection);
                command.CommandTimeout = 0;
                command.ExecuteNonQuery();
            }
        }

        public IEnumerable<IDataReader> GetPersonKeys(string batchScript, string schemaName)
        {
            batchScript = batchScript.Replace("{sc}", schemaName);
            var sql = string.Format(batchScript, "");

            sql = SqlRenderTranslator.Translate(new SqlRenderTranslator.Request(
                null,
                Settings.Current.Building.VendorToProcess.Name,
                "GetPersonKeys.sql",
                sql,
                Settings.Current.Building.SourceEngine.Database));

            sql = Utility.NativeTranslators.GetSqlHelper.TranslateSqlFromRedshift(Settings.Current.Building.VendorToProcess,
                Settings.Current.Building.SourceEngine.Database, sql, schemaName, schemaName, Settings.Current.Building.VendorToProcess.PersonTableName);

            using var connection = SqlConnectionHelper.OpenOdbcConnection(ConnectionString);
            using var c = new OdbcCommand(sql, connection) { CommandTimeout = 0 };
            using var reader = c.ExecuteReader();
            while (reader.Read())
            {
                yield return reader;
            }

        }

        #endregion

        protected string GetQuery(string fileName, string schemaName)
        {
            var resources = EmbeddedResourceManager.ReadEmbeddedResources("ohdsi", fileName, StringComparison.InvariantCultureIgnoreCase);

            var query = resources
                .FirstOrDefault(s => s.Key.Contains(DbEngine.Database.ToString(), StringComparison.InvariantCultureIgnoreCase))
                .Value.Replace("{sc}", schemaName);
            return query;
        }

        protected string CleanCommand(string command)
            => Regex.Replace(command, @"\s+", " ").Trim();
    }
}