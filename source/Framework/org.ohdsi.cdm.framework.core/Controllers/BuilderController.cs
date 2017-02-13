using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Threading;
using System.Threading.Tasks;
using org.ohdsi.cdm.framework.core.Savers;
using org.ohdsi.cdm.framework.data.DbLayer;
using org.ohdsi.cdm.framework.entities.Builder;
using org.ohdsi.cdm.framework.shared.Enums;

namespace org.ohdsi.cdm.framework.core.Controllers
{
    public class BuilderController
    {
        #region Variables
        private readonly DbBuilder dbBuilder;
        private readonly ChunkController chunkController;
        private readonly AchillesController achillesController;
        private int chunkCount;
        #endregion

        #region Properties
        public Builder Builder { get; private set; }

        public bool AllChunksComplete
        {
            get { return chunkController.AllChunksComplete(); }
        }

        public bool AllChunksStarted
        {
            get { return chunkController.AllChunksStarted(); }
        }

        public int GetChunksCount
        {
            get
            {
                if (chunkCount == 0)
                    chunkCount = chunkController.GetChunksCount();

                return chunkCount;
            }
        }

        public int GetCompleteChunksCount
        {
            get
            {
                return chunkController.GetCompleteChunksCount();
            }
        }

       public long TotalPersonCount
       {
          get { return chunkController.TotalPersonCount; }
       }
       #endregion

        #region Constructor
        public BuilderController()
        {
            chunkController = new ChunkController();
            dbBuilder = new DbBuilder(Settings.Current.Building.BuilderConnectionString);
            Builder = new Builder();
            achillesController = new AchillesController(Settings.Current.AchillesRScript);
            RefreshState();
        }
        #endregion

        #region Methods
        private void PerformAction(Action act)
        {
            if (Builder.State == BuilderState.Error)
                return;

            try
            {
                act();
            }
            catch (Exception e)
            {
                UpdateState(BuilderState.Error);
                Logger.WriteError(e);
            }
            finally
            {
            }
        }

       public void RefreshState()
       {
          var attempt = 0;

          while (true)
          {
             try
             {
                foreach (var dataReader in dbBuilder.Load(Environment.MachineName, Settings.Current.Builder.Version))
                {
                   Builder.SetFrom(dataReader);
                }
                break;
             }
             catch (Exception e)
             {
                attempt++;

                if (attempt == 10)
                   throw;
             }
          }
       }

       public void UpdateState(BuilderState state)
        {
            Builder.State = state;
            dbBuilder.UpdateState(Builder.Id, state);
        }

        public void CreateDestination()
        {
            PerformAction(() =>
            {
                var dbDestination = new DbDestination(Settings.Current.Building.DestinationConnectionString, Settings.Current.Building.DestinationSchemaName);


                if (Settings.Current.Building.DestinationEngine.Database != Database.Redshift)
                    dbDestination.CreateDatabase(Settings.Current.CreateCDMDatabaseScript);

                dbDestination.CreateTables(Settings.Current.CreateCDMTablesScript);
            });
        }

        public void CreateTablesStep()
        {
            var dbDestination = new DbDestination(Settings.Current.Building.DestinationConnectionString, Settings.Current.Building.DestinationSchemaName);

            dbDestination.CreateTables(Settings.Current.CreateCDMTablesScript);
        }

        public void DropDestination()
        {
            var dbDestination = new DbDestination(Settings.Current.Building.DestinationConnectionString, Settings.Current.Building.DestinationSchemaName);

            dbDestination.DropDatabase();
        }

        public void TruncateLookup()
        {
            var dbDestination = new DbDestination(Settings.Current.Building.DestinationConnectionString, Settings.Current.Building.DestinationSchemaName);

            dbDestination.TruncateLookup(Settings.Current.TruncateLookupScript);
        }

        public void TruncateTables()
        {
            var dbDestination = new DbDestination(Settings.Current.Building.DestinationConnectionString, Settings.Current.Building.DestinationSchemaName);

            dbDestination.TruncateTables(Settings.Current.TruncateTablesScript);
        }

        public void TruncateWithoutLookupTables()
        {
            var dbDestination = new DbDestination(Settings.Current.Building.DestinationConnectionString, Settings.Current.Building.DestinationSchemaName);

            dbDestination.TruncateWithoutLookupTables(Settings.Current.TruncateWithoutLookupTablesScript);
        }

        public void ResetChunk()
        {
            chunkController.ResetChunks();
        }

        public void CleanupS3()
        {
            if (Settings.Current.Building.DestinationEngine.Database == Database.Redshift)
            {
                using (var saver = new RedshiftSaver())
                {
                    saver.Create(Settings.Current.Building.DestinationConnectionString);
                    saver.ClenupBucket();
                }
            }
        }

        public void ResetVocabularyStep()
        {
            var dbDestination = new DbDestination(Settings.Current.Building.DestinationConnectionString, Settings.Current.Building.DestinationSchemaName);

            dbDestination.DropVocabularyTables(Settings.Current.DropVocabularyTablesScript);
        }

        public void CreateChunks()
        {
            PerformAction(chunkController.CreateChunks);
        }

        public void CopyVocabulary()
        {
            PerformAction(() =>
            {
                var saver = Settings.Current.Building.DestinationEngine.GetSaver().Create(Settings.Current.Building.DestinationConnectionString);
                saver.CopyVocabulary();
            });
        }

        public void CreateIndexes()
        {
            PerformAction(() =>
            {
                var dbDestination = new DbDestination(Settings.Current.Building.DestinationConnectionString, Settings.Current.Building.DestinationSchemaName);

                dbDestination.CreateIndexes(Settings.Current.CreateIndexesScript);
            });
        }

        public void RunAchilles()
        {
            PerformAction(() => achillesController.Run());
        }

        public void CreateLookup(bool lookupCreated)
        {
            PerformAction(() =>
            {
                var vocabulary = new Vocabulary();
                vocabulary.Initialize();
                vocabulary.CreateEntityLookup(lookupCreated);
            });
        }

        public void Build()
        {
            var dbChunk = new DbChunk(Settings.Current.Building.BuilderConnectionString);
            dbChunk.MarkUncompletedChunks(Settings.Current.Building.Id.Value, Settings.Current.Builder.Id.Value);

            PerformAction(() =>
            {
                Parallel.For(0, Settings.Current.Builder.MaxDegreeOfParallelism, i =>
                {
                    while (!chunkController.AllChunksStarted())
                    {
                        var arguments =
                           string.Format(@"<{0}>{1}</{0}>", "cs", Settings.Current.Building.BuilderConnectionString) +
                           string.Format(@"<{0}>{1}</{0}>", "keyid", Settings.Current.AwsAccessKeyId) +
                           string.Format(@"<{0}>{1}</{0}>", "accesskey", Settings.Current.AwsSecretAccessKey) +
                           string.Format(@"<{0}>{1}</{0}>", "SubChunkSize", Settings.Current.SubChunkSize) +
                           string.Format(@"<{0}>{1}</{0}>", "bucket", Settings.Current.Bucket);

                        var psi =
                           new ProcessStartInfo(Path.Combine(Settings.Current.Builder.Folder, "org.ohdsi.cdm.presentation.builderprocess.exe"))
                           {
                               Arguments = arguments,
                               CreateNoWindow = true
                           };

                        Thread.Sleep(1000);

                        using (var p = Process.Start(psi))
                        {
                            p.WaitForExit();
                            p.Close();
                        }
                        
                        RefreshState();
                        if (Builder.State != BuilderState.Running)
                        {
                            break;
                        }
                    }
                });
            });
        }

        public IEnumerable<string> GetOtherBuilderInfo()
        {
            return dbBuilder.GetOtherBuilderInfo(Settings.Current.Builder.Id.Value, Settings.Current.Building.Id.Value);
        }

        public void ResetNotFinishedChunks()
        {
            chunkController.ResetNotFinishedChunks();
        }
        #endregion
    }
}
