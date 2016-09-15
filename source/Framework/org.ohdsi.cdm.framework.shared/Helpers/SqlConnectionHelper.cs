using System;
using System.Data;
using System.Data.Odbc;
using System.Data.SqlClient;
using System.Threading;
using org.ohdsi.cdm.framework.shared.Enums;

namespace org.ohdsi.cdm.framework.shared.Helpers 
{
   public static class SqlConnectionHelper
   {
      public static SqlConnection OpenMSSQLConnection(string connectionString)
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

      public static IDbConnection OpenConnection(string odbcConnectionString, Database db)
      {
         var odbcConnection = new OdbcConnectionStringBuilder(odbcConnectionString);

         if (db == Database.MSSQL || db == Database.APS)
         {
            var sqlConnection = new SqlConnectionStringBuilder();
            sqlConnection["Data Source"] = odbcConnection["server"];
            sqlConnection["Initial Catalog"] = odbcConnection["database"];
            sqlConnection["User Id"] = odbcConnection["uid"];
            sqlConnection["Password"] = odbcConnection["pwd"];

            return OpenMSSQLConnection(sqlConnection.ConnectionString);
         }

         var connection = new OdbcConnection(odbcConnectionString);
         connection.Open();
         return connection;
         
      }

      private const int DB_DEADLOCK_RETRY_COUNT = 100;
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
