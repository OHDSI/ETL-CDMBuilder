using org.ohdsi.cdm.framework.common.Definitions;
using org.ohdsi.cdm.framework.desktop.Helpers;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Odbc;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace org.ohdsi.cdm.presentation.builder.Utility.CdmFrameworkImport
{
    public class DbSourceAdapter
    {
        readonly framework.desktop.DbLayer.DbSource _dbSource;
        private readonly string _connectionString;
        private readonly string _dbType;

        public DbSourceAdapter(string connectionString, string dbType, string schemaName)
        {
            _connectionString = connectionString;
            _dbType = dbType;
            _dbSource = new framework.desktop.DbLayer.DbSource(connectionString, dbType, schemaName);
        }

        public void CreateChunkTable(string schemaName, bool withDrop = true)
        {
            if (withDrop)
                DropChunkTable(schemaName);           

            var origQuery = GetQuery("CreateChunkTable.sql", schemaName);

            if (_dbType == "Postgre")
            {
                List<string> queries = new List<string>();

                //create a partitioned table
                queries.Add("""
                    CREATE TABLE {0}._chunks 
                    (ChunkId int, PERSON_ID bigint NOT NULL, PERSON_SOURCE_VALUE varchar(50) NULL)
                    PARTITION BY HASH (ChunkId);
                    """);

                //create the partitions by ChunkId for that table
                queries.Add("""                    
                    DO $$
                    DECLARE
                      top_mod    int := 128;
                      i          int;
                      top_name   text;
                    BEGIN
                      FOR i IN 0..top_mod-1 LOOP
                        top_name := format('_chunks_c%03s', i);

                        IF NOT EXISTS (
                          SELECT 1
                          FROM pg_class c
                          JOIN pg_namespace n ON n.oid = c.relnamespace
                          WHERE n.nspname = '{0}' AND c.relname = top_name
                        ) THEN
                          EXECUTE format(
                            'CREATE TABLE %I.%I
                               PARTITION OF %I.%I
                               FOR VALUES WITH (MODULUS %s, REMAINDER %s);',
                            '{0}', top_name, '{0}', '_chunks', top_mod, i
                          );
                        END IF;

                      END LOOP;
                    END $$;
                    """);

                foreach (var queryRaw in queries)
                {
                    var query = string.Format(queryRaw, schemaName);

                    Console.WriteLine("CreateChunkTable:" + query);

                    using var connection = SqlConnectionHelper.OpenOdbcConnection(_connectionString);
                    using var cmd = new OdbcCommand(query, connection);
                    cmd.CommandTimeout = 6000;
                    cmd.ExecuteNonQuery();
                }
            }
            else 
            {
                using var connection = SqlConnectionHelper.OpenOdbcConnection(_connectionString);
                using var cmd = new OdbcCommand(origQuery, connection);
                cmd.ExecuteNonQuery();
            }
        }

        public void DropChunkTable(string schemaName)
        {
            var query = GetQuery("DropChunkTable.sql", schemaName);

            Console.WriteLine("DropChunkTable:" + query);
            using var connection = SqlConnectionHelper.OpenOdbcConnection(_connectionString);
            using var cmd = new OdbcCommand(query, connection);
            cmd.CommandTimeout = 6000;
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
            var sql = string.Format(batchScript, "");

            sql = GetSqlHelper.TranslateSqlFromRedshift(Settings.Current.Building.VendorToProcess,
                Settings.Current.Building.SourceEngine.Database, sql, schemaName, Settings.Current.Building.VendorToProcess.PersonTableName);

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

        private string GetQuery(string fileName, string schemaName)
        {
            var resources = EmbeddedResourceManager.ReadEmbeddedResources("ohdsi", fileName, StringComparison.InvariantCultureIgnoreCase);
            var query = resources
                .FirstOrDefault(s => s.Key.Contains(_dbType, StringComparison.InvariantCultureIgnoreCase))
                .Value.Replace("{sc}", schemaName);
            return query;
        }
    }
}