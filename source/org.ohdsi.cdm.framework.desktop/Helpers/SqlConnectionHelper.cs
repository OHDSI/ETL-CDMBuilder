using MySqlConnector;
using Npgsql;
using org.ohdsi.cdm.framework.desktop.Enums;
using System;
using System.Data;
using System.Data.Odbc;
using System.Data.SqlClient;
using System.Threading;

namespace org.ohdsi.cdm.framework.desktop.Helpers
{
    public static class SqlConnectionHelper
    {
        public static SqlConnection OpenMssqlConnection(string connectionString)
        {
            var connection = new SqlConnection(connectionString);
            connection.Open();

            return connection;
        }

        public static OdbcConnection OpenOdbcConnection(string connectionString)
        {
            var connection = new OdbcConnection(connectionString);
            connection.Open();

            return connection;
        }

        public static OdbcConnection OpenOdbcConnection(string connectionString, int numberOfAttempts)
        {
            var attempt = 0;
            while (true)
            {
                try
                {
                    attempt++;
                    var connection = new OdbcConnection(connectionString);
                    connection.Open();

                    return connection;
                }
                catch (Exception)
                {
                    if (attempt <= numberOfAttempts)
                    {
                        Thread.Sleep(1000);
                    }
                    else
                    {
                        throw;
                    }
                }
            }
        }

        public static NpgsqlConnection OpenNpgsqlConnection(string connectionString)
        {
            var connection = new NpgsqlConnection(connectionString);
            connection.Open();

            return connection;
        }

        public static MySqlConnection OpenMySqlConnection(string connectionString)
        {
            var connection = new MySqlConnection(connectionString);
            connection.Open();

            return connection;
        }


        public static IDbConnection OpenConnection(string odbcConnectionString, Database db)
        {
            var odbcConnection = new OdbcConnectionStringBuilder(odbcConnectionString);

            if (db == Database.MsSql)
            {
                var sqlConnection = new SqlConnectionStringBuilder
                {
                    ["Data Source"] = odbcConnection["server"],
                    ["Initial Catalog"] = odbcConnection["database"],
                    ["User Id"] = odbcConnection["uid"],
                    ["Password"] = odbcConnection["pwd"]
                };

                return OpenMssqlConnection(sqlConnection.ConnectionString);
            }

            var connection = new OdbcConnection(odbcConnectionString);
            connection.Open();
            return connection;

        }

        private const int DbDeadlockRetryCount = 100;

        public static T AttemptActionReturnObject<T>(Func<T> action, Action<int> log)
        {
            var attemptCount = 0;

            do
            {
                attemptCount++;
                try
                {
                    return action();
                }
                catch (SqlException ex)
                {
                    log(attemptCount);

                    //if (attemptCount <= DB_DEADLOCK_RETRY_COUNT)
                    {
                        switch (ex.Number)
                        {
                            case 1205: //(ER_LOCK_WAIT_TIMEOUT) Lock wait timeout exceeded
                            case 1213: //(ER_LOCK_DEADLOCK) Deadlock found when trying to get lock
                                //Thread.Sleep(attemptCount * 1000);
                                Thread.Sleep(1000);
                                break;
                            default:
                                throw;
                        }
                    }
                    //else
                    //{
                    //   throw;
                    //}
                }
            } while (true);
        }
    }
}
