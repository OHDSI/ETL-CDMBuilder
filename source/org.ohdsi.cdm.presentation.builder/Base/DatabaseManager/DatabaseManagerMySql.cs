using org.ohdsi.cdm.framework.desktop.Databases;
using org.ohdsi.cdm.framework.desktop.Helpers;
using Spectre.Console;
using System.Data.Odbc;

namespace org.ohdsi.cdm.presentation.builder.Base.DatabaseManager
{
    [Obsolete("This is not supported anymore")]
    public class DatabaseManagerMySql : DatabaseManager
    {
        public DatabaseManagerMySql(string connectionString, IDatabaseEngine dbEngine, string schemaName)
            : base(connectionString, dbEngine, schemaName)
        { 
        
        }

        #region interface

        public override ActionStatus CreateDatabase(string query)
        {
            var sqlConnectionStringBuilder = new OdbcConnectionStringBuilder(ConnectionString);
            var database = sqlConnectionStringBuilder["database"];

            #region commands

            string localInfileCommand = "SET GLOBAL local_infile = ON;";

            string createToDateCommand = 
                "\r\nCREATE FUNCTION to_date(in_str VARCHAR(255), in_mask VARCHAR(255))" +
                "\r\nRETURNS DATE" +
                "\r\nDETERMINISTIC" +
                "\r\nBEGIN" +
                "\r\n  DECLARE fmt VARCHAR(255);" +
                "\r\n  SET fmt = REPLACE(REPLACE(REPLACE(in_mask, 'YYYY', '%Y'), 'MM', '%m'), 'DD', '%d');" +
                "\r\n  RETURN STR_TO_DATE(in_str, fmt);" +
                "\r\nEND";

            #endregion

            #region OdbcConnection connection = SqlConnectionHelper.OpenOdbcConnection(sqlConnectionStringBuilder.ConnectionString)
            OdbcConnection connection;
            try
            {
                connection = SqlConnectionHelper.OpenOdbcConnection(sqlConnectionStringBuilder.ConnectionString);
            }
            catch (Exception e)
            {
                if (new[] { "Unknown database" }.All(s => e.Message.Contains(s)))
                {
                    var CSwithDefaultDatabase = sqlConnectionStringBuilder.ConnectionString.Replace(database.ToString(), "sys");
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
                            if (new[] { "database exists" }.All(s => ex.Message.Contains(s, StringComparison.InvariantCultureIgnoreCase)))
                            {
                                ExecuteQuery(localInfileCommand);
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

                ExecuteQuery(localInfileCommand);
                ExecuteQuery(createToDateCommand);
            }

            return ActionStatus.Success;
        }

        public override ActionStatus CreateSchema()
        {
            return ActionStatus.Success; // MySQL does not use schemas
        }

        public override ActionStatus ExecuteQuery(string query)
        {
            try
            {
                using (var connection = SqlConnectionHelper.OpenOdbcConnection(ConnectionString))
                {
                    string queryAltered = "\n" + query.Replace("{sc}", SchemaName);

                    var subQueries = SplitQuery(queryAltered);

                    if (queryAltered.Contains("create function", StringComparison.CurrentCultureIgnoreCase))
                        subQueries = new[] { queryAltered }.ToArray();

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
                            if (new[] { "Table", "already exists" }.All(s => odbcEx.Message.Contains(s, StringComparison.InvariantCultureIgnoreCase)))
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
    }
}
