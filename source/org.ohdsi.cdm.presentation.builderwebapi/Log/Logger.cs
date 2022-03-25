using Npgsql;
using System;

namespace org.ohdsi.cdm.presentation.builderwebapi.Log
{
    public class Logger
    {
        public static void Write(string connectionString, LogMessage message)
        {
            var query = "INSERT INTO builder.log (conversion_id, step_id, chunk_id, time, type, description) " +
                "VALUES(@conversion_id, @step_id, @chunk_id, @time, @type, @description);";

            using var connection = new NpgsqlConnection(connectionString);
            connection.Open();

            using var c = new NpgsqlCommand(query, connection);
            c.Parameters.AddWithValue("@conversion_id", (object)message.ConversionId ?? DBNull.Value);
            c.Parameters.AddWithValue("@step_id", (object)message.StepId ?? DBNull.Value);
            c.Parameters.AddWithValue("@chunk_id", (object)message.ChunkId ?? DBNull.Value);
            c.Parameters.AddWithValue("@time", DateTime.UtcNow);
            c.Parameters.AddWithValue("@type", message.Type.ToString());
            c.Parameters.AddWithValue("@description", message.Text);

            var result = c.ExecuteScalar();
        }
    }
}