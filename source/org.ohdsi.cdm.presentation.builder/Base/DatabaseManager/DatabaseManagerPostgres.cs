using org.ohdsi.cdm.framework.desktop.Databases;
using org.ohdsi.cdm.framework.desktop.Helpers;
using Spectre.Console;
using System.Data;
using System.Data.Odbc;

namespace org.ohdsi.cdm.presentation.builder.Base.DatabaseManager
{
    public class DatabaseManagerPostgres : DatabaseManager
    {
        public DatabaseManagerPostgres(string connectionString, IDatabaseEngine dbEngine, string schemaName)
            : base(connectionString, dbEngine, schemaName)
        {

        }

        #region interface

        public override ActionStatus CreateDatabase(string query)
        {
            var sqlConnectionStringBuilder = new OdbcConnectionStringBuilder(ConnectionString);
            var database = sqlConnectionStringBuilder["database"];
            var uid = sqlConnectionStringBuilder["uid"];

            var preciseQuery = string.Format(query, database, uid);

            #region OdbcConnection connection = SqlConnectionHelper.OpenOdbcConnection(sqlConnectionStringBuilder.ConnectionString)
            OdbcConnection connection;
            try
            {
                connection = SqlConnectionHelper.OpenOdbcConnection(sqlConnectionStringBuilder.ConnectionString);
            }
            catch (Exception e)
            {
                if (new[] { "database ", " does not exist" }.All(s => e.Message.Contains(s)))
                {
                    var CSwithDefaultDatabase = sqlConnectionStringBuilder.ConnectionString.Replace(database.ToString(), "postgres");
                    connection = SqlConnectionHelper.OpenOdbcConnection(CSwithDefaultDatabase);
                }
                else
                    throw;
            }
            #endregion

            using (connection)
            {
                if (IsDatabaseExisting(connection, database.ToString()))
                    return ActionStatus.AlreadyExists;

                using (var command = new OdbcCommand(preciseQuery, connection))
                {
                    try
                    {
                        command.CommandTimeout = 30000;
                        command.ExecuteNonQuery();

                        return ActionStatus.Success;
                    }
                    catch (OdbcException ex)
                    {
                        if (new[] { "database", "already exists" }.All(s => ex.Message.Contains(s, StringComparison.InvariantCultureIgnoreCase)))
                        {
                            // ignore
                            return ActionStatus.AlreadyExists;
                        }
                        else
                        {
                            AnsiConsole.WriteLine();
                            AnsiConsole.WriteLine(@"Failed to execute command: {0}", command.CommandText);
                            AnsiConsole.WriteLine(ex.Message);
                            throw;
                        }
                    }
                    catch (Exception e)
                    {
                        throw;
                    }
                }
            }
        }

        public override ActionStatus CreateSchema()
        {
            var query = $"create schema {SchemaName}";

            try
            {
                using (var connection = SqlConnectionHelper.OpenOdbcConnection(ConnectionString))
                {
                    using (var command = new OdbcCommand(query, connection))
                    {
                        command.CommandTimeout = 0;
                        command.ExecuteNonQuery();
                    }
                }
                return ActionStatus.Success;
            }
            catch (OdbcException ex)
            {
                if (new[] { "schema", "already exists" }.All(s => ex.Message.Contains(s, StringComparison.InvariantCultureIgnoreCase)))
                {
                    // ignore
                    return ActionStatus.AlreadyExists;
                }
                else
                {
                    AnsiConsole.WriteLine();
                    AnsiConsole.WriteLine(@"Failed to execute command: {0}", query);
                    AnsiConsole.WriteLine(ex.Message);
                    throw;
                }
            }
            catch (Exception e)
            {
                throw;
            }
        }

        public override ActionStatus ExecuteQuery(string query)
        {
            try
            {
                using (var connection = SqlConnectionHelper.OpenOdbcConnection(ConnectionString))
                {
                    string queryAltered = "\n" + query.Replace("{sc}", SchemaName);

                    var subQueries = SplitQuery(queryAltered);

                    foreach (var subQuery in subQueries)
                    {
                        try
                        {
                            var cleaned = CleanCommand(subQuery);
                            using (var command = new OdbcCommand(cleaned, connection))
                            {
                                command.CommandTimeout = 30000;
                                command.ExecuteNonQuery();
                            }
                        }
                        catch (OdbcException odbcEx)
                        {
                            if (new[] { "relation", "already exists" }.All(s => odbcEx.Message.Contains(s, StringComparison.InvariantCultureIgnoreCase))
                                || new[] { "relation", "does not exist" }.All(s => odbcEx.Message.Contains(s, StringComparison.InvariantCultureIgnoreCase)))
                            {
                                // ignore
                                // don't return because we need to execute all subqueries
                            }
                            else
                            {
                                AnsiConsole.WriteLine();
                                AnsiConsole.WriteLine(@"Failed to execute command: {0}", query);
                                AnsiConsole.WriteLine(odbcEx.Message);
                                throw;
                            }
                        }
                        catch (Exception ex)
                        {
                            throw;
                        }
                    }
                }
                return ActionStatus.Success;
            }
            catch (Exception e)
            {
                throw;
            }
        }

        #endregion

        bool IsDatabaseExisting(OdbcConnection connection, string database)
        {
            var checkDbExistQuery = $"SELECT 1\r\nFROM pg_database\r\nWHERE lower(datname) = lower('{database}');";

            using (var command = new OdbcCommand(checkDbExistQuery, connection))
            {
                try
                {
                    command.CommandTimeout = 30000;
                    var reader = command.ExecuteReader(CommandBehavior.SingleRow);
                    if (reader.Read())
                    {
                        return true;
                    }
                }
                catch (Exception e)
                {

                }
            }

            return false;
        }    
    }
}
