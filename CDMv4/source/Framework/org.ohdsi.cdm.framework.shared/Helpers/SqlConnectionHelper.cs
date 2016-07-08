using System;
using System.Data.SqlClient;
using System.Threading;

namespace org.ohdsi.cdm.framework.shared.Helpers 
{
   public static class SqlConnectionHelper
   {
      public static string GetConnectionString(string server, string database)
      {
         return
            string.Format(
               "Data Source={0};Initial Catalog={1};User Id=hix_reader;Password=reader1!;Connection Timeout=60;", server,
               database);
      }

      public static SqlConnection OpenConnection(string connectionString)
      {
         var connection = new SqlConnection(connectionString);
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
