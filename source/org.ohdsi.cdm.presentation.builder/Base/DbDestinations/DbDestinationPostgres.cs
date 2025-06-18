using org.ohdsi.cdm.framework.desktop.Databases;
using org.ohdsi.cdm.framework.desktop.Helpers;
using System;
using System.Collections.Generic;
using System.Data.Odbc;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace org.ohdsi.cdm.presentation.builder.Base.DbDestinations
{
    public class DbDestinationPostgres : DbDestination
    {
        public DbDestinationPostgres(string connectionString, IDatabaseEngine dbEngine, string schemaName)
            : base(connectionString, dbEngine, schemaName)
        { 
        
        }

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
            catch(Exception e)
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
                            if (new[] { "relation", "already exists" }.All(s => odbcEx.Message.Contains(s, StringComparison.InvariantCultureIgnoreCase)))
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
