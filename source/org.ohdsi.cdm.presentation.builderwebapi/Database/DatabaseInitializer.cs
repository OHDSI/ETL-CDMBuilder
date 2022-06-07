using Microsoft.Extensions.Configuration;
using Npgsql;
using System.IO;
using System.Threading.Tasks;

namespace org.ohdsi.cdm.presentation.builderwebapi.Database
{
    public class DatabaseInitializer
    {
        public static async Task Run(IConfiguration conf)
        {
            var connectionString = $"Server={conf["SharedDbHost"]};Port={conf["SharedDbPort"]};Database={conf["SharedDbName"]};User Id={conf["SharedDbBuilderUser"]};Password={conf["SharedDbBuilderPass"]};";
            var script = File.ReadAllText(Path.Combine("Database", "dbinit.txt"));
            using var connection = new NpgsqlConnection(connectionString);
            connection.Open();

            using var c = new NpgsqlCommand(script, connection);

            await c.ExecuteScalarAsync();
        }
    }
}