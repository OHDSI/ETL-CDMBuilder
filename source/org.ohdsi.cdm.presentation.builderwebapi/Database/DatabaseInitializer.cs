using Microsoft.Extensions.Configuration;
using Npgsql;
using System.IO;
using System.Threading.Tasks;

namespace org.ohdsi.cdm.presentation.builderwebapi.Database
{
    public class DatabaseInitializer
    {
        public static async Task Run(IConfiguration configuration)
        {
            var connectionString = configuration.GetConnectionString("DefaultConnection");
            var script = File.ReadAllText(Path.Combine("Database", "dbinit.txt"));
            using var connection = new NpgsqlConnection(connectionString);
            connection.Open();

            using var c = new NpgsqlCommand(script, connection);

            await c.ExecuteScalarAsync();
        }
    }
}