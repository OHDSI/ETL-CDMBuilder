using System;
using System.Data;
using System.Data.SqlClient;
using System.Threading;
using Microsoft.SqlServer.DataWarehouse.Loader;

namespace APSClient
{
   public class APSBulkCopy
   {
      private readonly SqlConnectionStringBuilder connectionString;
      
      public APSBulkCopy(string connectionString)
      {
         this.connectionString = new SqlConnectionStringBuilder(connectionString);
      }

      public void Write(string destinationTable, TableType tableType, IDataReader reader)
      {
         using (var loader = new LoaderClient(connectionString.DataSource, new LoaderClientBindingConfiguration(), "", false))
         {
            var settings = new LoaderSettings
            {
               UseSSL = false,
               LoadType = "TCP",
               StagingDatabase = "",
               DestinationTable = connectionString.InitialCatalog + "." + Utils.AddDefaultSchemaAndQuoteTableName(destinationTable),
               ClientIps = LoaderClient.GetMachineIpList()
            };

            if (tableType == TableType.Distributed)
            {
               settings.Mode = LoaderMode.FastAppend;
               settings.MultipleTransactions = true;
            }
            else
            {
               settings.Mode = LoaderMode.Append;
               settings.MultipleTransactions = false;
            }

            loader.SetConfigurationOptions(settings);
            loader.AuthenticateSqlUser(connectionString.UserID, connectionString.Password);

            loader.BeginExecuteBinary(delegate { }, null, loader);

            while (!loader.IsReady)
            {
               Thread.Sleep(100);
            }
            
            if (IsStatusError(loader.Status))
            {
               throw new Exception(loader.Status.LoaderError.ExceptionMessage);
            }

            loader.SendData(reader);
            loader.EndSendData();

            if (loader.Status.Status == LoaderStatusType.Rejected)
            {
               throw new Exception("LoaderStatusType.Rejected");
            }

            if (loader.Status.Status == LoaderStatusType.Aborted)
            {
               throw new Exception("LoaderStatusType.Aborted");
            }

            if (loader.Status.Status == LoaderStatusType.Canceled)
            {
               throw new Exception("LoaderStatusType.Canceled");
            }

            if (loader.Status.Status == LoaderStatusType.Error)
            {
               throw new Exception("LoaderStatusType.Error");
            }

            if (loader.Status.Status == LoaderStatusType.Failed)
            {
               throw new Exception("LoaderStatusType.Failed");
            }

            while (((loader.Status.Status != LoaderStatusType.Finished) &&
                    (loader.Status.Status != LoaderStatusType.Completed)) && !IsStatusError(loader.Status))
            {
               Thread.Sleep(100);
            }
            
            if (IsStatusError(loader.Status))
            {
               throw new Exception(loader.Status.LoaderError.ExceptionMessage);
            }

         }
      }

      private static bool IsStatusError(ILoaderStatus status)
      {
         return ((status != null) && (status.LoaderError != null));
      }
   }
}
