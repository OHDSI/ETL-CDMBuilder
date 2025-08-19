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
    public class DbDestinationMySql : DbDestination
    {
        public DbDestinationMySql(string connectionString, IDatabaseEngine dbEngine, string schemaName)
            : base(connectionString, dbEngine, schemaName)
        { 
        
        }


        public override ActionStatus CreateDatabase(string query)
        {
            var sqlConnectionStringBuilder = new OdbcConnectionStringBuilder(ConnectionString);
            var database = sqlConnectionStringBuilder["database"];

            #region commands

            string localInfileCommand = "SET GLOBAL local_infile = ON;";

            string createToDateCommand = "USE `" + SchemaName + "`;\r\nDELIMITER $$\r\nCREATE FUNCTION to_date(in_str VARCHAR(255), in_mask VARCHAR(255))\r\nRETURNS DATE\r\nDETERMINISTIC\r\nBEGIN\r\n  DECLARE fmt VARCHAR(255);\r\n  SET fmt = REPLACE(REPLACE(REPLACE(in_mask, 'YYYY', '%Y'), 'MM', '%m'), 'DD', '%d');\r\n  RETURN STR_TO_DATE(in_str, fmt);\r\nEND$$\r\nDELIMITER ;";

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
                            if (new[] { "Table", "already exists" }.All(s => odbcEx.Message.Contains(s, StringComparison.InvariantCultureIgnoreCase)))
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
