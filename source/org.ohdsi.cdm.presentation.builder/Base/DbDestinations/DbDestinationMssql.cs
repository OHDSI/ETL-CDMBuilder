using org.ohdsi.cdm.framework.desktop.Databases;
using org.ohdsi.cdm.framework.desktop.Helpers;
using System.Data.Odbc;

namespace org.ohdsi.cdm.presentation.builder.Base.DbDestinations
{
    public class DbDestinationMsSql : DbDestination
    {
        public DbDestinationMsSql(string connectionString, IDatabaseEngine dbEngine, string schemaName)
            : base(connectionString, dbEngine, schemaName)
        { 
        
        }

        public override ActionStatus CreateDatabase(string query)
        {
            var sqlConnectionStringBuilder = new OdbcConnectionStringBuilder(ConnectionString);
            var database = sqlConnectionStringBuilder["database"];


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
                    var CSwithDefaultDatabase = sqlConnectionStringBuilder.ConnectionString.Replace(database.ToString(), "master");
                    connection = SqlConnectionHelper.OpenOdbcConnection(CSwithDefaultDatabase);
                }
                else
                    throw;
            }
            #endregion
            using (connection)
            {
                var preciseQuery = string.Format(query, database);

                foreach (var subQuery in preciseQuery.Split(new[] { "\r\nGO", "\nGO" }, StringSplitOptions.None))
                {
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
                                return ActionStatus.AlreadyExists;
                            }
                            else
                            {
                                Console.WriteLine();
                                Console.WriteLine(@"Failed to execute command: {0}", command.CommandText);
                                Console.WriteLine(ex.Message);
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

            return ActionStatus.Success;
        }

        public override ActionStatus CreateSchema()
        {

            if (SchemaName.ToLower().Trim() == "dbo")
                return ActionStatus.AlreadyExists;

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
                if (new[] { "There is already an object named", "in the database" }.All(s => ex.Message.Contains(s, StringComparison.InvariantCultureIgnoreCase)))
                {
                    // ignore
                    return ActionStatus.AlreadyExists;
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

        public override ActionStatus ExecuteQuery(string query)
        {
            try
            {
                using (var connection = SqlConnectionHelper.OpenOdbcConnection(ConnectionString))
                {
                    string queryAltered = "\n" + query.Replace("{sc}", SchemaName);

                    var subQueries = queryAltered
                        .Split(new[] { ";" }, StringSplitOptions.RemoveEmptyEntries)
                        .Select(s => new string(s.Skip(s.IndexOf("CREATE", StringComparison.CurrentCultureIgnoreCase)).ToArray()).Trim() + ";")
                        .Where(s => s.Contains("CREATE", StringComparison.CurrentCultureIgnoreCase)
                                 || s.Contains("truncate", StringComparison.CurrentCultureIgnoreCase))
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
                            if (new[] { "There is already an object named", "in the database" }.All(s => odbcEx.Message.Contains(s, StringComparison.InvariantCultureIgnoreCase)))
                            {
                                // ignore
                                // don't return because we need to execute all subqueries
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
                return ActionStatus.Success;
            }
            catch (Exception e)
            {
                throw;
            }
        }
    }
}
