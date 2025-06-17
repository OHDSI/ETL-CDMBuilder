using org.ohdsi.cdm.framework.desktop.Databases;
using org.ohdsi.cdm.framework.desktop.Helpers;
using System;
using System.Data.Odbc;

namespace org.ohdsi.cdm.presentation.builder.Base
{
    public class DbDestination
    {
        private readonly string _connectionString;
        private readonly string _schemaName;

        public DbDestination(string connectionString, string schemaName)
        {
            _connectionString = connectionString;
            _schemaName = schemaName;
        }

        public void CreateDatabase(string query)
        {
            var sqlConnectionStringBuilder = new OdbcConnectionStringBuilder(_connectionString);
            var database = sqlConnectionStringBuilder["database"];

            var mySql = _connectionString.Contains("mySql", StringComparison.InvariantCultureIgnoreCase);

            using (var connection = SqlConnectionHelper.OpenOdbcConnection(sqlConnectionStringBuilder.ConnectionString))
            {
                var preciseQuery = string.Format(query, database);

                foreach (var subQuery in preciseQuery.Split(new[] { "\r\nGO", "\nGO" }, StringSplitOptions.None))
                {
                    if (!_connectionString.Contains("SQL Server")
                        && subQuery.Contains("SET RECOVERY", StringComparison.InvariantCultureIgnoreCase))
                        continue; //only works for SQL SERVER

                    using (var command = new OdbcCommand(subQuery, connection))
                    {
                        try
                        {
                            command.CommandTimeout = 30000;
                            command.ExecuteNonQuery();
                        }
                        catch (OdbcException ex)
                        {
                            if (new[] { "database", "already exists" }.All(s => ex.Message.Contains(s, StringComparison.InvariantCultureIgnoreCase)))
                            {
                                // ignore
                            }
                            else
                            {
                                Console.WriteLine();
                                Console.WriteLine(@"Failed to execute command: {0}", command.CommandText);
                                Console.WriteLine(ex.Message);
                            }
                        }
                        catch (Exception e)
                        {
                            throw;
                        }
                    }
                }
            }

            if (!mySql && _schemaName.ToLower().Trim() != "dbo")
                CreateSchema();
        }

        public void CreateSchema()
        {
            var query = $"create schema {_schemaName}";

            try
            {
                using (var connection = SqlConnectionHelper.OpenOdbcConnection(_connectionString))
                {
                    using (var command = new OdbcCommand(query, connection))
                    {
                        command.CommandTimeout = 0;
                        command.ExecuteNonQuery();
                    }
                }
            }
            catch (OdbcException ex)
            {
                if (new[] { "schema", "already exists" }.All(s => ex.Message.Contains(s, StringComparison.InvariantCultureIgnoreCase)) //pgsql
                    || new[] { "There is already an object named", "in the database" }.All(s => ex.Message.Contains(s, StringComparison.InvariantCultureIgnoreCase))) //mssql
                {
                    // ignore
                }
                else
                {
                    Console.WriteLine();
                    Console.WriteLine(@"Failed to execute command: {0}", query);
                    Console.WriteLine(ex.Message);
                    throw;
                }
            }
            catch (Exception e)
            {
                throw;
            }
        }

        public void ExecuteQuery(string query, IDatabaseEngine engine)
        {
            try
            {
                using (var connection = SqlConnectionHelper.OpenOdbcConnection(_connectionString))
                {
                    string queryAltered = "\n" + query.Replace("{sc}", _schemaName);

                    var subQueries = queryAltered
                        .Split(new[] { ";" }, StringSplitOptions.RemoveEmptyEntries)
                        .Select(s => s.Trim())
                        .Where(s => !string.IsNullOrWhiteSpace(s))
                        .ToList();

                    foreach (var subQuery in subQueries)
                    {
                        try
                        {
                            using (var command = new OdbcCommand(subQuery, connection))
                            {
                                command.CommandTimeout = 30000;
                                command.ExecuteNonQuery();
                            }
                        }
                        catch (OdbcException odbcEx)
                        {
                            if (new[] { "table", "already exists" }.All(s => odbcEx.Message.Contains(s, StringComparison.InvariantCultureIgnoreCase)) //pgsql
                                || new[] { "There is already an object named", "in the database" }.All(s => odbcEx.Message.Contains(s, StringComparison.InvariantCultureIgnoreCase))) //mssql
                            {
                                // ignore
                            }
                            else
                            {
                                Console.WriteLine();
                                Console.WriteLine(@"Failed to execute command: {0}", query);
                                Console.WriteLine(odbcEx.Message);
                                throw;
                            }
                        }
                        catch (Exception ex)
                        {
                            throw;
                        }
                    }
                }
            }
            catch (Exception e)
            {
                throw;
            }
        }
    }
}