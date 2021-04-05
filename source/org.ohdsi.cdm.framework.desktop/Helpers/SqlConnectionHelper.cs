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
            try
            {
                connection.Open();
            }
            catch(Exception e)
            {
                // TMP
                connection = new NpgsqlConnection(connectionString + ";SslMode=Require;Trust Server Certificate=true");
                connection.Open();
            }

            return connection;
        }

        public static MySqlConnection OpenMySqlConnection(string connectionString)
        {
            var connection = new MySqlConnection(connectionString);
            connection.Open();

            return connection;
        }

        const string npgsql = "Server={server};Port=5431;Database={database};User Id={username};Password={password};Timeout=120;";

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

            if (db == Database.Postgre)
            {
                var odbc = new OdbcConnectionStringBuilder(odbcConnectionString);

               //var connectionStringTemplate = "Server={server};Port=5432;Database={database};User Id={username};Password={password};SslMode=Require;Trust Server Certificate=true";
                var connectionStringTemplate = "Server={server};Port={port};Database={database};User Id={username};Password={password};";

                var npgsqlConnectionString = "";
                //// TMP
                if (odbc["database"].ToString() == "cdm_souffleur" && (
                    odbc["server"].ToString() == "10.110.1.7" ||
                    odbc["server"].ToString() == "185.134.75.47" ||
                    odbc["server"].ToString() == "192.168.20.47" ||
                    odbc["server"].ToString() == "10.5.10.33")
                    )
                {
                    connectionStringTemplate = npgsql;

                    npgsqlConnectionString = connectionStringTemplate.Replace("{server}", odbc["server"].ToString())
                    .Replace("{database}", odbc["database"].ToString()).Replace("{username}", odbc["uid"].ToString())
                    .Replace("{password}", odbc["pwd"].ToString());
                }
                else
                {
                    if (odbc["port"] == null)
                    {
                        npgsqlConnectionString = connectionStringTemplate.Replace("{server}", odbc["server"].ToString())
                        .Replace("{database}", odbc["database"].ToString()).Replace("{username}", odbc["uid"].ToString())
                        .Replace("{password}", odbc["pwd"].ToString())
                        .Replace("{port}", "5432");
                    }
                    else
                    {
                        npgsqlConnectionString = connectionStringTemplate.Replace("{server}", odbc["server"].ToString())
                            .Replace("{database}", odbc["database"].ToString()).Replace("{username}", odbc["uid"].ToString())
                            .Replace("{password}", odbc["pwd"].ToString())
                            .Replace("{port}", odbc["port"].ToString());
                    }
                }

                Console.WriteLine("npgsqlConnectionString=" + npgsqlConnectionString);
                return OpenNpgsqlConnection(npgsqlConnectionString);
            }

            var connection = new OdbcConnection(odbcConnectionString);
            connection.Open();
            return connection;

        }

        //public static string GetConnection(string odbcConnectionString, Database db)
        //{
        //    var odbcConnection = new OdbcConnectionStringBuilder(odbcConnectionString);

        //    if (db == Database.MsSql)
        //    {
        //        var sqlConnection = new SqlConnectionStringBuilder
        //        {
        //            ["Data Source"] = odbcConnection["server"],
        //            ["Initial Catalog"] = odbcConnection["database"],
        //            ["User Id"] = odbcConnection["uid"],
        //            ["Password"] = odbcConnection["pwd"]
        //        };

        //        return sqlConnection.ConnectionString;
        //    }

        //    if (db == Database.Postgre)
        //    {
        //        var odbc = new OdbcConnectionStringBuilder(odbcConnectionString);

        //        //var connectionStringTemplate = "Server={server};Port=5432;Database={database};User Id={username};Password={password};SslMode=Require;Trust Server Certificate=true";
        //        var connectionStringTemplate = "Server={server};Port=5432;Database={database};User Id={username};Password={password};";

        //        // TMP
        //        if (odbc["server"].ToString() == "10.110.1.7" || 
        //            odbc["server"].ToString() == "185.134.75.47" ||
        //            odbc["server"].ToString() == "192.168.20.47")
        //            connectionStringTemplate = npgsql;

        //        var npgsqlConnectionString = connectionStringTemplate.Replace("{server}", odbc["server"].ToString())
        //            .Replace("{database}", odbc["database"].ToString()).Replace("{username}", odbc["uid"].ToString())
        //            .Replace("{password}", odbc["pwd"].ToString());

        //        Console.WriteLine("npgsqlConnectionString=" + npgsqlConnectionString);
        //        return npgsqlConnectionString;
        //    }

        //    return odbcConnectionString;

        //}

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
