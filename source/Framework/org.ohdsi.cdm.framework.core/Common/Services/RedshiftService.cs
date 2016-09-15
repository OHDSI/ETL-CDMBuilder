using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data.Odbc;
using System.Diagnostics;
using System.Linq;
using System.ServiceModel;
using System.Threading;
using org.ohdsi.cdm.framework.shared.Enums;
using org.ohdsi.cdm.framework.shared.Helpers;
using org.ohdsi.cdm.framework.data.DbLayer;

namespace org.ohdsi.cdm.framework.core.Common.Services
{
    [ServiceBehavior(MaxItemsInObjectGraph = int.MaxValue, InstanceContextMode = InstanceContextMode.Single)]
    public class RedshiftService : IRedshiftService
    {
        private static readonly Dictionary<int, int> indexSize = new Dictionary<int, int>();
        private static Dictionary<int, int> chunksIndexes;

        private BackgroundWorker saver;
        private const int SIZE_OF_SET = 10;
        
        public void Start()
        {
            Logger.Write(null, LogMessageTypes.Debug, "sss RedshiftService Start()");

            indexSize.Clear();
            var dbChunk = new DbChunk(Settings.Current.Building.BuilderConnectionString);
            chunksIndexes = dbChunk.SplitChunks(Settings.Current.Building.Id.Value, SIZE_OF_SET);
            
            foreach (var index in chunksIndexes.Values)
            {
                if (!indexSize.ContainsKey(index))
                    indexSize.Add(index, 0);

                indexSize[index] = indexSize[index] + 1;
            }

            if (Settings.Current.Builder.IsLead && Settings.Current.Building.DestinationEngine.Database == Database.Redshift)
            {
               if (saver != null)
               {
                  saver.DoWork -= saver_DoWork;
                  saver.RunWorkerCompleted -= saver_RunWorkerCompleted;
                  saver.Dispose();
                  saver = null;
               }

               saver = new BackgroundWorker{ WorkerSupportsCancellation = true };
               saver.DoWork += saver_DoWork;
               saver.RunWorkerCompleted += saver_RunWorkerCompleted;
               saver.RunWorkerAsync();
               Logger.Write(null, LogMessageTypes.Debug, "sss saver_DoWork");
            }
        }

        void saver_RunWorkerCompleted(object sender, RunWorkerCompletedEventArgs e)
        {
           Logger.Write(null, LogMessageTypes.Debug, "sss saver_RunWorkerCompleted");
        }

        public void Stop()
        {
           try
           {
              if (saver != null)
              {
                 Logger.Write(null, LogMessageTypes.Debug, "sss CancelAsync");
                 saver.CancelAsync();
              }
           }
           catch (Exception ex)
           {
              Logger.Write(null, LogMessageTypes.Debug, "sss CancelAsync ERROR");
              Logger.WriteError(ex);
           }
        }

        public void AddToSaveQueue(int chunkId)
        {
            Logger.Write(null, LogMessageTypes.Debug, "sss AddToSaveQueue " + chunkId);

            var setIndex = chunksIndexes[chunkId];

            var dbAvailableOnS3 = new DbAvailableOnS3(Settings.Current.Building.BuilderConnectionString);
            dbAvailableOnS3.AddPreparedChunk(Settings.Current.Building.Id.Value, setIndex, chunkId);
            var count = dbAvailableOnS3.GetChunksCount(Settings.Current.Building.Id.Value, setIndex);

            Logger.Write(null, LogMessageTypes.Debug, string.Format("sss AddToSaveQueue index={0}; chunkId={1}; set[setIndex].Count={2}; indexSize={3}", setIndex, chunkId, count, indexSize[setIndex]));
        }

        public int GetIndexOfSet(int chunkId)
        {
            return chunksIndexes[chunkId];
        }

        private void saver_DoWork(object sender, DoWorkEventArgs e)
        {
           try
           {
              var worker = (BackgroundWorker) sender;
              var dbAvailableOnS3 = new DbAvailableOnS3(Settings.Current.Building.BuilderConnectionString);

              while (true)
              {
                 if (worker.CancellationPending)
                 {
                    Logger.Write(null, LogMessageTypes.Debug, "sss CancellationPending = TRUE");
                    e.Cancel = true;
                    return;
                 }

                 var setIndex = dbAvailableOnS3.GetCompletedSetIndex(Settings.Current.Building.Id.Value, SIZE_OF_SET);
                 if (!setIndex.HasValue)
                 {
                    Thread.Sleep(1000);
                    continue;
                 }

                 Logger.Write(null, LogMessageTypes.Debug, "sss StartSaveChunkTask index - " + setIndex);
                 SaveSet(setIndex.Value);
                 dbAvailableOnS3.SetSaved(Settings.Current.Building.Id.Value, setIndex.Value);
                 Logger.Write(null, LogMessageTypes.Debug, "sss EndSaveChunkTask index - " + setIndex);


              }
           }
           catch (Exception ex)
           {
              Logger.Write(null, LogMessageTypes.Debug, "sss StartSaveChunkTask ERROR");
              Logger.WriteError(ex);
           }

           Logger.Write(null, LogMessageTypes.Debug, "sss StartSaveChunkTask index END");
        }

        private void SaveSet(int setIndex)
        {
            var dbAvailableOnS3 = new DbAvailableOnS3(Settings.Current.Building.BuilderConnectionString);
            Logger.Write(null, LogMessageTypes.Debug, "sss SaveSet BEGIN index - " + setIndex);
            var chunkIds = dbAvailableOnS3.GetChunksId(Settings.Current.Building.Id.Value, setIndex).ToArray();

            Logger.Write(null, LogMessageTypes.Debug, "sss SaveSet chunkIds: " + string.Join(",", chunkIds));

            var timer = new Stopwatch();
            timer.Start();

            using (
               var connection =
                  SqlConnectionHelper.OpenOdbcConnection(Settings.Current.Building.DestinationConnectionString))
            using (var transaction = connection.BeginTransaction())
            {
                try
                {
                   
                   SaveTable(connection, transaction, setIndex, "PERSON");
                   SaveTable(connection, transaction, setIndex, "OBSERVATION_PERIOD");
                   SaveTable(connection, transaction, setIndex, "PAYER_PLAN_PERIOD");
                   SaveTable(connection, transaction, setIndex, "CONDITION_OCCURRENCE");
                   SaveTable(connection, transaction, setIndex, "DEATH");
                   SaveTable(connection, transaction, setIndex, "DRUG_EXPOSURE");
                   SaveTable(connection, transaction, setIndex, "DRUG_COST");
                   SaveTable(connection, transaction, setIndex, "OBSERVATION");
                   SaveTable(connection, transaction, setIndex, "VISIT_OCCURRENCE");
                   SaveTable(connection, transaction, setIndex, "VISIT_COST");
                   SaveTable(connection, transaction, setIndex, "PROCEDURE_OCCURRENCE");
                   SaveTable(connection, transaction, setIndex, "PROCEDURE_COST");
                   SaveTable(connection, transaction, setIndex, "DRUG_ERA");
                   SaveTable(connection, transaction, setIndex, "CONDITION_ERA");
                   SaveTable(connection, transaction, setIndex, "DEVICE_EXPOSURE");
                   SaveTable(connection, transaction, setIndex, "DEVICE_COST");
                   SaveTable(connection, transaction, setIndex, "MEASUREMENT");
                   SaveTable(connection, transaction, setIndex, "COHORT");
                    

                    transaction.Commit();
                }
                catch (Exception e)
                {
                    foreach (var chunkId in chunkIds)
                    {
                        Logger.WriteError(chunkId, e);
                        transaction.Rollback();
                        Logger.Write(chunkId, LogMessageTypes.Debug, "Rollback - Complete");
                    }
                }
            }

            var dbChunk = new DbChunk(Settings.Current.Building.BuilderConnectionString);
            foreach (var chunkId in chunkIds)
                dbChunk.ChunkComplete(chunkId);
            timer.Stop();
            Logger.Write(null, LogMessageTypes.Info, string.Format("Save - {0} ms", timer.ElapsedMilliseconds));
        }

        private static void SaveTable(OdbcConnection connection, OdbcTransaction transaction, int setIndex,
          string tableName)
        {
            var timer = new Stopwatch();
            timer.Start();
            Logger.Write(null, LogMessageTypes.Debug, string.Format("*** START index - {0}; table - {1}", setIndex, tableName));
           var bucket = string.Format("{0}/{1}-{2}", Settings.Current.Bucket, Settings.Current.Building.Vendor,
              Settings.Current.Building.Id);

            var folder = setIndex;
            var fileName = string.Format(@"{0}/{1}", folder, tableName + ".txt.gz");

            tableName = string.Format("{0}.{1}", Settings.Current.Building.DestinationSchemaName, tableName);

            const string query = @"copy {0} from 's3://{1}/{2}' " +
                                 @"credentials 'aws_access_key_id={3};aws_secret_access_key={4}' " +
                                 @"IGNOREBLANKLINES " +
                                 @"DELIMITER '\t' " +
                                 @"NULL AS '\000' " +
                                 @"csv quote as '`' " +
                                 @"GZIP";

            using (var c = new OdbcCommand(string.Format(query, tableName, bucket, fileName, Settings.Current.AwsAccessKeyId, Settings.Current.AwsSecretAccessKey), connection, transaction))
            {
                c.CommandTimeout = 999999999;
                c.ExecuteNonQuery();
            }

            timer.Stop();
            Logger.Write(null, LogMessageTypes.Debug, string.Format("*** END index - {0}; table - {1}, time={2}ms", setIndex, tableName, timer.ElapsedMilliseconds));
        }
      
    }
}
