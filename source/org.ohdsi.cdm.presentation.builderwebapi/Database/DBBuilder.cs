using NETCore.Encrypt;
using Npgsql;
using org.ohdsi.cdm.presentation.builderwebapi.Enums;
using org.ohdsi.cdm.presentation.builderwebapi.Log;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Dynamic;

namespace org.ohdsi.cdm.presentation.builderwebapi.Database
{
    public class DBBuilder
    {
        public static int AddConversion(string connectionString, string user, string conversionName)
        {
            var query = "INSERT INTO builder.conversion(user_name, name) VALUES(@user_name, @name) " +
                   "ON CONFLICT ON CONSTRAINT conversion_user_name_name_key " +
                   "DO UPDATE SET started = NULL, completed = NULL, canceled = NULL, failed = NULL " +
                   "RETURNING id";

            using var connection = new NpgsqlConnection(connectionString);
            connection.Open();

            using var c = new NpgsqlCommand(query, connection);
            c.Parameters.AddWithValue("@user_name", user);
            c.Parameters.AddWithValue("@name", conversionName);

            var result = c.ExecuteScalar();
            int conversionId;

            if (result == null)
            {
                conversionId = GetConversionId(connectionString, user, conversionName);
            }
            else
            {
                int.TryParse(result.ToString(), out conversionId);
            }

            return conversionId;
        }

        public static void AddChunk(string connectionString, int chunkId, int conversionId)
        {
            const string query =
               "INSERT INTO builder.chunk(id,  conversion_id) VALUES (@id, @conversion_id);";
            using var connection = new NpgsqlConnection(connectionString);
            connection.Open();

            using var c = new NpgsqlCommand(query, connection);
            c.Parameters.AddWithValue("@id", chunkId);
            c.Parameters.AddWithValue("@conversion_id", conversionId);

            c.ExecuteScalar();
        }

        public static void ClearChunks(string connectionString, int conversionId)
        {
            const string query =
               "DELETE FROM builder.chunk WHERE conversion_id = @conversion_id;";
            using var connection = new NpgsqlConnection(connectionString);
            connection.Open();

            using var c = new NpgsqlCommand(query, connection);
            c.Parameters.AddWithValue("@conversion_id", conversionId);

            c.ExecuteScalar();
        }

        public static void StoreParameters(string connectionString, string secureKey, int conversionId, IEnumerable<Tuple<string, string>> parameters)
        {
            var query = "INSERT INTO builder.conversion_parameters(conversion_id, name, value) VALUES(@conversionId, @name, @value) " +
                "ON CONFLICT ON CONSTRAINT conversion_parameters_conversion_id_name_key " +
                "DO UPDATE SET value = EXCLUDED.value;";

            using var connection = new NpgsqlConnection(connectionString);
            connection.Open();

            foreach (var item in parameters)
            {
                using var c = new NpgsqlCommand(query, connection);
                c.Parameters.AddWithValue("@conversionId", conversionId);
                c.Parameters.AddWithValue("@name", item.Item1);
                //c.Parameters.AddWithValue("@value", SecureString.Encrypt(item.Item2, secureKey));
                c.Parameters.AddWithValue("@value", EncryptProvider.AESEncrypt(item.Item2, secureKey));

                c.ExecuteNonQuery();
            }
        }

        public static Dictionary<string, string> GetLookups(string connectionString, string secureKey, int conversionId)
        {
            var parameters = new Dictionary<string, string>();
            var query = "SELECT name, value FROM builder.conversion_parameters WHERE conversion_id = @conversionId and name like 'Lookup:%'";

            using var connection = new NpgsqlConnection(connectionString);
            connection.Open();

            using var c = new NpgsqlCommand(query, connection);
            c.Parameters.AddWithValue("@conversionId", conversionId);

            using (var reader = c.ExecuteReader())
            {
                while (reader.Read())
                {
                    try
                    {
                        parameters.Add(reader[0].ToString(), EncryptProvider.AESDecrypt(reader[1].ToString(), secureKey));
                    }
                    catch (Exception e)
                    {
                    }
                }
            }
            return parameters;
        }

        public static Dictionary<string, string> GetParameters(string connectionString, string secureKey, int conversionId)
        {
            var parameters = new Dictionary<string, string>();
            var query = "SELECT name, value FROM builder.conversion_parameters WHERE conversion_id = @conversionId";

            using var connection = new NpgsqlConnection(connectionString);
            connection.Open();

            using var c = new NpgsqlCommand(query, connection);
            c.Parameters.AddWithValue("@conversionId", conversionId);

            using (var reader = c.ExecuteReader())
            {
                while (reader.Read())
                {
                    try
                    {
                        parameters.Add(reader[0].ToString(), EncryptProvider.AESDecrypt(reader[1].ToString(), secureKey));
                    }
                    catch (Exception e)
                    {
                    }
                }
            }
            return parameters;
        }

        public static int GetConversionId(string connectionString, string user, string conversionName)
        {
            var query = "SELECT Id FROM builder.conversion WHERE user_name = @user_name and name = @name";

            using var connection = new NpgsqlConnection(connectionString);
            connection.Open();

            using var c = new NpgsqlCommand(query, connection);
            c.Parameters.AddWithValue("@user_name", user);
            c.Parameters.AddWithValue("@name", conversionName);

            return (int)c.ExecuteScalar();
        }

        public static int? StartConversion(string connectionString)
        {
            using var connection = new NpgsqlConnection(connectionString);
            connection.Open();

            using var transaction = connection.BeginTransaction(System.Data.IsolationLevel.Serializable);
            int? conversionId = null;
            try
            {
                // var query = "SELECT Id FROM builder.conversion WHERE started is null ORDER BY id limit 1";

                var query = "SELECT c.Id FROM builder.conversion c " +
                    "JOIN builder.conversion_parameters p ON c.Id = p.conversion_id " +
                    "WHERE c.started is null and p.Name != 'ContentKey' " +
                    "ORDER BY c.id limit 1";

                using var c = new NpgsqlCommand(query, connection, transaction);

                object result = c.ExecuteScalar();
                if (result != null)
                {
                    conversionId = (int)result;

                    query = "UPDATE builder.conversion SET started = @started WHERE id = @id";
                    using var c2 = new NpgsqlCommand(query, connection, transaction);
                    c2.Parameters.AddWithValue("@id", conversionId);
                    c2.Parameters.AddWithValue("@started", DateTime.UtcNow);

                    c2.ExecuteNonQuery();
                }
                transaction.Commit();
            }
            catch (Exception)
            {
                transaction.Rollback();
            }

            return conversionId;
        }

        public static void CompleteConversion(string connectionString, int conversionId)
        {
            var query = "UPDATE builder.conversion SET completed = @value " +
                "WHERE id = @conversion_id";

            using var connection = new NpgsqlConnection(connectionString);
            connection.Open();

            using var c = new NpgsqlCommand(query, connection);
            c.Parameters.AddWithValue("@conversion_id", conversionId);
            c.Parameters.AddWithValue("@value", DateTime.UtcNow);

            c.ExecuteNonQuery();
        }

        public static Tuple<int?, int?> StartChunk(string connectionString)
        {
            using var connection = new NpgsqlConnection(connectionString);
            connection.Open();

            using var transaction = connection.BeginTransaction(System.Data.IsolationLevel.Serializable);
            int? chunkId = null;
            int? conversionId = null;
            try
            {
                var query = "select conversion_id, (count(started)/count(*)::float)*100 " +
                    "FROM builder.chunk " +
                    "group by conversion_id " +
                    "order by 2;";

                using var c0 = new NpgsqlCommand(query, connection, transaction);
                object result0 = c0.ExecuteScalar();
                if (result0 != null)
                {
                    conversionId = (int)result0;

                    query = "SELECT Id FROM builder.chunk WHERE conversion_id = @conversionId and started is null ORDER BY id limit 1";
                    using var c1 = new NpgsqlCommand(query, connection, transaction);
                    c1.Parameters.AddWithValue("@conversionId", conversionId);

                    object result1 = c1.ExecuteScalar();
                    if (result1 != null)
                    {
                        chunkId = (int)result1;

                        query = "UPDATE builder.chunk SET started = @started WHERE conversion_id = @conversionId and id = @id";
                        using var c2 = new NpgsqlCommand(query, connection, transaction);
                        c2.Parameters.AddWithValue("@conversionId", conversionId);
                        c2.Parameters.AddWithValue("@id", chunkId);
                        c2.Parameters.AddWithValue("@started", DateTime.UtcNow);

                        c2.ExecuteNonQuery();
                    }
                }
                transaction.Commit();
            }
            catch (Exception)
            {
                transaction.Rollback();
            }

            return new Tuple<int?, int?>(conversionId, chunkId);
        }

        public static IEnumerable<int> GetNotStartedConversionIds(string connectionString)
        {
            var query = "SELECT Id FROM builder.conversion " +
                "WHERE started is null ";

            using var connection = new NpgsqlConnection(connectionString);
            connection.Open();

            using var c = new NpgsqlCommand(query, connection);
            using var reader = c.ExecuteReader();
            while (reader.Read())
            {
                yield return (int)reader[0];
            }
        }

        public static IEnumerable<int> GetStartedConversionIds(string connectionString)
        {
            var query = "SELECT Id FROM builder.conversion " +
                "WHERE started is not null and completed is null and canceled is null and failed is null " +
                "ORDER BY started";

            using var connection = new NpgsqlConnection(connectionString);
            connection.Open();

            using var c = new NpgsqlCommand(query, connection);
            using var reader = c.ExecuteReader();
            while (reader.Read())
            {
                yield return (int)reader[0];
            }
        }

        public static Steps? GetNextStep(string connectionString, int conversionId)
        {
            var query = "SELECT name, started, completed, canceled, failed FROM builder.steps WHERE conversion_id = @conversionId ORDER BY Id asc";

            using var connection = new NpgsqlConnection(connectionString);
            connection.Open();

            using var c = new NpgsqlCommand(query, connection);
            c.Parameters.AddWithValue("@conversionId", conversionId);

            var steps = new ArrayList();
            using var reader = c.ExecuteReader();
            Steps? nextStep = null;

            while (reader.Read())
            {
                dynamic step = new ExpandoObject();
                step.Name = reader[0];
                step.Started = reader[1];
                step.Completed = reader[2];
                step.Canceled = reader[3];
                step.Failed = reader[4];
                if (step.Completed is DBNull || !step.Canceled is DBNull || !step.Failed is DBNull)
                {
                    if (Enum.TryParse(reader[0].ToString(), true, out Steps nStep))
                    {
                        return nStep;
                    }

                    break;
                }

                if (!step.Completed is DBNull)
                {
                    if (Enum.TryParse(reader[0].ToString(), true, out Steps nStep))
                    {
                        nextStep = nStep;
                    }
                }
            }

            if (!nextStep.HasValue)
                return Steps.CreateDestination;

            switch (nextStep.Value)
            {
                case Steps.CreateDestination:
                    return Steps.LoadVocabulary;

                case Steps.LoadVocabulary:
                    return Steps.ConvertHealthSystemData;

                case Steps.ConvertHealthSystemData:
                    return Steps.CreateChunks;

                case Steps.CreateChunks:
                    return Steps.ConvertChunks;

                case Steps.ConvertChunks:
                    return null;

                default:
                    return Steps.CreateDestination;
            }
        }

        public static void StartStep(string connectionString, int conversionId, Steps step)
        {
            var query = "INSERT INTO builder.steps(name, conversion_id, started) VALUES(@name, @conversionId, @started) " +
              "ON CONFLICT ON CONSTRAINT steps_name_conversion_id_key " +
              "DO UPDATE SET started = EXCLUDED.started, completed = NULL, canceled = NULL, failed = NULL;";

            using var connection = new NpgsqlConnection(connectionString);
            connection.Open();

            using var c = new NpgsqlCommand(query, connection);
            c.Parameters.AddWithValue("@name", step.ToString());
            c.Parameters.AddWithValue("@conversionId", conversionId);
            c.Parameters.AddWithValue("@started", DateTime.UtcNow);

            c.ExecuteNonQuery();
        }

        public static void CompleteStep(string connectionString, int conversionId, Steps step)
        {
            var query = "UPDATE builder.steps SET completed = @value " +
                "WHERE conversion_id = @conversion_id and name = @name";

            using var connection = new NpgsqlConnection(connectionString);
            connection.Open();

            using var c = new NpgsqlCommand(query, connection);
            c.Parameters.AddWithValue("@name", step.ToString());
            c.Parameters.AddWithValue("@conversion_id", conversionId);
            c.Parameters.AddWithValue("@value", DateTime.UtcNow);

            c.ExecuteNonQuery();
        }

        public static void CancelStep(string connectionString, int conversionId, Steps step)
        {
            var query = "UPDATE builder.steps SET canceled = @value " +
                "WHERE conversion_id = @conversion_id and name = @name";

            using var connection = new NpgsqlConnection(connectionString);
            connection.Open();

            using var c = new NpgsqlCommand(query, connection);
            c.Parameters.AddWithValue("@name", step.ToString());
            c.Parameters.AddWithValue("@conversion_id", conversionId);
            c.Parameters.AddWithValue("@value", DateTime.UtcNow);

            c.ExecuteNonQuery();
        }

        public static void FailStep(string connectionString, int conversionId, Steps step)
        {
            var query = "UPDATE builder.steps SET failed = @value " +
              "WHERE conversion_id = @conversion_id and name = @name";

            using var connection = new NpgsqlConnection(connectionString);
            connection.Open();

            using var c = new NpgsqlCommand(query, connection);
            c.Parameters.AddWithValue("@name", step.ToString());
            c.Parameters.AddWithValue("@conversion_id", conversionId);
            c.Parameters.AddWithValue("@value", DateTime.UtcNow);

            c.ExecuteNonQuery();
        }

        public static bool IsConversionAborted(string connectionString, int conversionId)
        {
            var query = "SELECT Id FROM builder.conversion WHERE id = @conversionId and (canceled is not null or failed is not null)";

            using var connection = new NpgsqlConnection(connectionString);
            connection.Open();

            using var c = new NpgsqlCommand(query, connection);
            c.Parameters.AddWithValue("@conversionId", conversionId);

            using var reader = c.ExecuteReader();

            while (reader.Read())
            {
                return true;
            }

            return false;
        }

        public static void AbortConversion(string connectionString, int conversionId)
        {
            var query = "UPDATE builder.conversion SET canceled = @value " +
                "WHERE id = @conversion_id";

            using var connection = new NpgsqlConnection(connectionString);
            connection.Open();

            using var c = new NpgsqlCommand(query, connection);
            c.Parameters.AddWithValue("@conversion_id", conversionId);
            c.Parameters.AddWithValue("@value", DateTime.UtcNow);

            c.ExecuteNonQuery();
        }

        public static void CompleteChunk(string connectionString, int conversionId, int chunkId)
        {
            var query = "UPDATE builder.chunk SET completed = @value " +
                "WHERE conversion_id = @conversion_id and Id = @chunkId";

            using var connection = new NpgsqlConnection(connectionString);
            connection.Open();

            using var c = new NpgsqlCommand(query, connection);
            c.Parameters.AddWithValue("@chunkId", chunkId);
            c.Parameters.AddWithValue("@conversion_id", conversionId);
            c.Parameters.AddWithValue("@value", DateTime.UtcNow);

            c.ExecuteNonQuery();
        }

        public static void CancelChunk(string connectionString, int conversionId, int chunkId)
        {
            var query = "UPDATE builder.chunk SET canceled = @value " +
                "WHERE conversion_id = @conversion_id and Id = @chunkId";

            using var connection = new NpgsqlConnection(connectionString);
            connection.Open();

            using var c = new NpgsqlCommand(query, connection);
            c.Parameters.AddWithValue("@chunkId", chunkId);
            c.Parameters.AddWithValue("@conversion_id", conversionId);
            c.Parameters.AddWithValue("@value", DateTime.UtcNow);

            c.ExecuteNonQuery();
        }

        public static void FailChunk(string connectionString, int conversionId, int chunkId)
        {
            var query = "UPDATE builder.chunk SET failed = @value " +
              "WHERE conversion_id = @conversion_id and Id = @chunkId";

            using var connection = new NpgsqlConnection(connectionString);
            connection.Open();

            using var c = new NpgsqlCommand(query, connection);
            c.Parameters.AddWithValue("@chunkId", chunkId);
            c.Parameters.AddWithValue("@conversion_id", conversionId);
            c.Parameters.AddWithValue("@value", DateTime.UtcNow);

            c.ExecuteNonQuery();
        }

        public static bool AreAllChunksConverted(string connectionString, int conversionId)
        {
            var query = "SELECT count(*) - count(c.completed) " +
                "FROM builder.steps s " +
                "join builder.chunk c on c.conversion_id = s.conversion_id " +
                "where s.conversion_id = @conversion_id and s.name = 'CreateChunks' and s.completed is not null " +
                "group by s.id;";

            using var connection = new NpgsqlConnection(connectionString);
            connection.Open();

            using var c = new NpgsqlCommand(query, connection);
            c.Parameters.AddWithValue("@conversion_id", conversionId);

            object result = c.ExecuteScalar();
            if (result != null)
            {
                return Convert.ToInt64(result) == 0;
            }

            return false;
        }

        public static IEnumerable<Message> GetLog(string connectionString, int conversionId, int? logId)
        {
            var query = "with a as ( select conversion_id, (count(completed)/count(*)::float) * 100 as progress FROM builder.chunk " +
                "WHERE conversion_id = @conversion_id group by conversion_id) " +
                "SELECT l.id, time, type, description, coalesce(progress, 0) progress " +
                "FROM builder.log l " +
                "LEFT JOIN a on a.conversion_id = l.conversion_id " +
                "JOIN conversion c ON c.id = @conversion_id and l.time >= c.started " +
                "WHERE l.conversion_id = @conversion_id";

            if (logId.HasValue)
                query += " and l.id > @log_id";

            query += " order by l.id asc";

            using var connection = new NpgsqlConnection(connectionString);
            connection.Open();

            using var c = new NpgsqlCommand(query, connection);
            c.Parameters.AddWithValue("@conversion_id", conversionId);

            if (logId.HasValue)
                c.Parameters.AddWithValue("@log_id", logId);

            using var reader = c.ExecuteReader();
            while (reader.Read())
            {
                var logType = Enum.Parse<LogType>(reader.GetString(2));
                yield return new Message
                {
                    id = reader.GetInt32(0),
                    time = reader.GetDateTime(1),
                    statusName = logType.ToString(),
                    statusCode = (int)logType,
                    message = reader.GetString(3),
                    percent = Convert.ToInt32(reader.GetDouble(4))
                };
            }
        }

        public static string GetUsername(string connectionString, int conversionId)
        {
            var query = "SELECT user_name " +
                "FROM builder.conversion " +
                "where id = @conversion_id";

            using var connection = new NpgsqlConnection(connectionString);
            connection.Open();

            using var c = new NpgsqlCommand(query, connection);
            c.Parameters.AddWithValue("@conversion_id", conversionId);

            return (string)c.ExecuteScalar();
        }
    }
}