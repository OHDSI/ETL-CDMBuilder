using org.ohdsi.cdm.framework.desktop.Helpers;
using System.Data;
using System.Data.Odbc;

namespace org.ohdsi.cdm.presentation.builder.CdmFrameworkImport
{
    public class DbSourceAdapter
    {
        public static int PartitionCount => 256; //all other partitioned tables must have the same amount of partitions 

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

            //make the table partitioned to enable partitionwise join with gigantic tables which can't be indexed due to huge disk load for temp and actual data storage            
            if (Settings.Current.Building.SourceEngine.Database == framework.desktop.Enums.Database.Postgre)
            {
                #region main table
                string fieldSet = "(ChunkId int, PartitionId int, PERSON_ID bigint NOT NULL, PERSON_SOURCE_VALUE varchar(50) NULL)";
                if (!origQuery.Contains(fieldSet.Replace("  ", " ").Trim(), StringComparison.InvariantCultureIgnoreCase))
                    throw new Exception("Fields for _chunks table in the main package have been changed!");

                var createTable = "CREATE TABLE {0}._chunks " +
                    "\r\n" + fieldSet +
                    "\r\npartition by HASH (person_source_value);";
                var createTableFormatted = string.Format(createTable, schemaName);

                using var createTableConnection = SqlConnectionHelper.OpenOdbcConnection(_connectionString);
                using var createTableCmd = new OdbcCommand(createTableFormatted, createTableConnection);
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
                var createPartitionsformatted = string.Format(createPartitions, schemaName, PartitionCount.ToString());

                using var createPartitionsConnection = SqlConnectionHelper.OpenOdbcConnection(_connectionString);
                using var createPartitionsCmd = new OdbcCommand(createPartitionsformatted, createPartitionsConnection);
                createPartitionsCmd.ExecuteNonQuery();
                #endregion
            }
            //use default _chunks script
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


        public IEnumerable<IDataReader> GetPersonKeys(string batchScript, string schemaName)
        {
            batchScript = batchScript.Replace("{sc}", schemaName);
            var sql = string.Format(batchScript, "");

            sql = Utility.GetSqlHelper.TranslateSqlFromRedshift(Settings.Current.Building.VendorToProcess,
                Settings.Current.Building.SourceEngine.Database, sql, schemaName, schemaName, Settings.Current.Building.VendorToProcess.PersonTableName);

            using var connection = SqlConnectionHelper.OpenOdbcConnection(_connectionString);
            using var c = new OdbcCommand(sql, connection) { CommandTimeout = 0 };
            using var reader = c.ExecuteReader();
            while (reader.Read())
            {
                yield return reader;
            }

        }

        private string GetQuery(string fileName, string schemaName)
        {
            var resources = Utility.EmbeddedResourceManager.ReadEmbeddedResources("ohdsi", fileName, StringComparison.InvariantCultureIgnoreCase);
            var query = resources
                .FirstOrDefault(s => s.Key.Contains(_dbType, StringComparison.InvariantCultureIgnoreCase))
                .Value.Replace("{sc}", schemaName);
            return query;
        }
    }
}