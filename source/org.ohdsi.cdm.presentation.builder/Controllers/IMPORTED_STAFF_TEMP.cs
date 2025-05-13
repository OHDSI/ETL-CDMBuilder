using Npgsql;
using NpgsqlTypes;
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
using org.ohdsi.cdm.framework.desktop.Settings;
using org.ohdsi.cdm.presentation.builder;
using org.ohdsi.cdm.presentation.builder.Utility;
using System.Data;
using System.Data.Common;
using System.Data.Odbc;
using System.Reflection;
using System.Text;
using cdm6 = org.ohdsi.cdm.framework.common.DataReaders.v6;

namespace org.ohdsi.cdm.framework.desktop.Savers
{
    public class IMPORTED_STAFF_TEMP
    {
        /// <summary>
        /// This method is a copy from Framework. For some reason this does not work:
        /// _dbSource = new DbSource(Settings.Current.Building.SourceConnectionString, Path.Combine(new[]
        /// {
        ///     Settings.Current.BuilderFolder,
        ///     "ETL",
        ///     "Common",
        ///     "Scripts",
        ///     Settings.Current.Building.SourceEngine.Database.ToString()
        /// }), Settings.Current.Building.SourceSchema);
        /// _dbSource.CreateChunkTable(chunksSchema);
        /// </summary>
        /// <param name="name"></param>
        /// <param name="_connectionString"></param>
        public static void CreateChunkSchema(string name, string _connectionString)
        {
            try
            {
                string text = "CREATE SCHEMA IF NOT EXISTS {sc};";
                text = text.Replace("{sc}", name);
                using OdbcConnection connection = SqlConnectionHelper.OpenOdbcConnection(_connectionString);
                using OdbcCommand odbcCommand = new OdbcCommand(text, connection);
                odbcCommand.ExecuteNonQuery();
            }
            catch (Exception e)
            {
                Console.WriteLine("Can't create chunk schema");
            }
        }

        public static void CreateChunkTable(string schemaName, string connectionString)
        {
            DropChunkTable(schemaName, connectionString);

            var scripts = EmbeddedResourceManager.ReadEmbeddedResources("OHDSI", "CreateChunkTable.sql", StringComparison.OrdinalIgnoreCase);
            var engine = presentation.builder.Settings.Current.Building.CdmEngine.Database.ToName();
            var query = scripts.FirstOrDefault(s => s.Key.Contains(engine)).Value.Replace("{sc}", schemaName);

            Console.WriteLine("CreateChunkTable:" + query);

            using var connection = SqlConnectionHelper.OpenOdbcConnection(connectionString);
            using var cmd = new OdbcCommand(query, connection);
            cmd.ExecuteNonQuery();
        }

        public static void DropChunkTable(string schemaName, string connectionString)
        {
            var scripts = EmbeddedResourceManager.ReadEmbeddedResources("OHDSI", "DropChunkTable.sql", StringComparison.OrdinalIgnoreCase);
            var engine = presentation.builder.Settings.Current.Building.CdmEngine.Database.ToName();
            var query = scripts.FirstOrDefault(s => s.Key.Contains(engine)).Value.Replace("{sc}", schemaName);

            Console.WriteLine("DropChunkTable:" + query);
            using var connection = SqlConnectionHelper.OpenOdbcConnection(connectionString);
            using var cmd = new OdbcCommand(query, connection);
            cmd.ExecuteNonQuery();
        }

        public static IEnumerable<long> GetPersonIds(int chunkId, string schemaName, string connectionString)
        {
            var query = $"SELECT person_id FROM {schemaName}._chunks where chunkid={chunkId};";
            using var connection = SqlConnectionHelper.OpenOdbcConnection(connectionString);
            using var c = new OdbcCommand(query, connection) { CommandTimeout = 300 };
            using var reader = c.ExecuteReader();
            while (reader.Read())
            {
                yield return reader.GetInt64(0);
            }
        }

        /// <summary>
        /// The original method does not work for some reason. This also uses the Db engine to choose the correct script.
        /// </summary>
        /// <param name="schemaName"></param>
        /// <param name="_connectionString"></param>
        public static void CreateIndexesChunkTable(string schemaName, string _connectionString)
        {
            var scripts = EmbeddedResourceManager.ReadEmbeddedResources("OHDSI", "CreateIndexesChunkTable.sql", StringComparison.OrdinalIgnoreCase);
            var engine = presentation.builder.Settings.Current.Building.CdmEngine.Database.ToName();
            var query = scripts.FirstOrDefault(s => s.Key.Contains(engine)).Value.Replace("{sc}", schemaName);
            if (string.IsNullOrEmpty(query.Trim()))
            {
                return;
            }

            using OdbcConnection connection = SqlConnectionHelper.OpenOdbcConnection(_connectionString);
            string[] array = query.Split(new string[2] { "GO\r\n", "GO\n" }, StringSplitOptions.RemoveEmptyEntries);
            for (int i = 0; i < array.Length; i++)
            {
                using OdbcCommand odbcCommand = new OdbcCommand(array[i], connection);
                odbcCommand.CommandTimeout = 0;
                odbcCommand.ExecuteNonQuery();
            }
        }
    }
}