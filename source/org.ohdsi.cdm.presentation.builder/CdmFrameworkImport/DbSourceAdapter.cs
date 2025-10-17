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

            using var connection = SqlConnectionHelper.OpenOdbcConnection(_connectionString);
            using var cmd = new OdbcCommand(origQuery, connection);
            cmd.ExecuteNonQuery();
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


        public IEnumerable<IDataReader> GetPersonKeys(string batchScript, string schemaName)
        {
            batchScript = batchScript.Replace("{sc}", schemaName);
            var sql = string.Format(batchScript, "");

            sql = GetSqlHelper.TranslateSqlFromRedshift(Settings.Current.Building.VendorToProcess,
                Settings.Current.Building.SourceEngine.Database, sql, schemaName, schemaName, Settings.Current.Building.VendorToProcess.PersonTableName);

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