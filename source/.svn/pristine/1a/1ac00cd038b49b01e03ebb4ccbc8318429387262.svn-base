using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
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
             if(chunkCount == 0)
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
       #endregion

       #region Constructor
       public BuilderController()
       {
          chunkController = new ChunkController();
          dbBuilder = new DbBuilder(Settings.Current.Building.BuilderConnectionString);
          Builder = new Builder();
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
          foreach (var dataReader in dbBuilder.Load(Environment.MachineName))
          {
             Builder.SetFrom(dataReader);
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
             var dbDestination = new DbDestination(Settings.Current.Building.DestinationConnectionString);
             dbDestination.CreateDatabase(Settings.Current.CreateCDMDatabaseScript);
             dbDestination.CreateTables(Settings.Current.CreateCDMTablesScript);
          });
       }

       public void DropDestination()
       {
          var dbDestination = new DbDestination(Settings.Current.Building.DestinationConnectionString);
          dbDestination.DropDatabase();
       }

       public void TruncateLookup()
       {
          var dbDestination = new DbDestination(Settings.Current.Building.DestinationConnectionString);
          dbDestination.TruncateLookup();
       }

       public void TruncateTables()
       {
          var dbDestination = new DbDestination(Settings.Current.Building.DestinationConnectionString);
          dbDestination.TruncateTables();
       }

       public void TruncateWithoutLookupTables()
       {
          var dbDestination = new DbDestination(Settings.Current.Building.DestinationConnectionString);
          dbDestination.TruncateWithoutLookupTables();
       }

       public void ResetChunk()
       {
          chunkController.ResetChunks();
       }

       public void ResetVocabularyStep()
       {
          var dbDestination = new DbDestination(Settings.Current.Building.DestinationConnectionString);
          dbDestination.DropVocabularyTables();
       }
       
       public void CreateChunks()
       {
          PerformAction(chunkController.CreateChunks);
       }

       public void CopyVocabulary()
       {
          PerformAction(() =>
          {
             var dbDestination = new DbDestination(Settings.Current.Building.DestinationConnectionString);
             dbDestination.CopyVocabulary(Settings.Current.CopyVocabularyScript, Settings.Current.Building.VocabularyConnectionString);
          });
       }

       public void CreateIndexes()
       {
          PerformAction(() =>
          {
             var dbDestination = new DbDestination(Settings.Current.Building.DestinationConnectionString);
             dbDestination.CreateIndexes(Settings.Current.CreateIndexesScript);
          });
       }

       public void CreateLookup()
       {
          PerformAction(() =>
          {
             var vocabulary = new Vocabulary();
             vocabulary.Initialize();
             vocabulary.CreateEntityLookup();
          });
       }

       public void Build()
       {
          PerformAction(() =>
          {
             Parallel.For(0, Settings.Current.Builder.MaxDegreeOfParallelism, i =>
             {
                while (!chunkController.AllChunksStarted())
                {
                   var psi =
                      new ProcessStartInfo(Path.Combine(Settings.Current.Builder.Folder, "org.ohdsi.cdm.presentation.builderprocess.exe"))
                      {
                         Arguments = Settings.Current.Building.BuilderConnectionString,
                         CreateNoWindow = true
                      };
                 
                   var p = Process.Start(psi);
                   p.WaitForExit();
                   p.Close();
                   p.Dispose();

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
