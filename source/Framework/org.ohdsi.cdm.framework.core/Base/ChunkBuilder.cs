using System;
using System.Diagnostics;
using org.ohdsi.cdm.framework.core.Common.Services;
using org.ohdsi.cdm.framework.data.DbLayer;
using org.ohdsi.cdm.framework.shared.Enums;

namespace org.ohdsi.cdm.framework.core.Base
{
   public class ChunkBuilder : IChunkBuilder
   {
      #region Variables
      private IVocabularyService vocabularyService;
      private readonly int chunkId;
      private readonly Func<IPersonBuilder> createPersonBuilder;
      #endregion
      
      #region Constructors

      public ChunkBuilder(int chunkId, Func<IPersonBuilder> createPersonBuilder)
      {
         this.chunkId = chunkId;
         this.createPersonBuilder = createPersonBuilder;
      }
      #endregion

      #region Methods

      public void Process()
      {
         try
         {
            var channelFactory = ServicesManager.GetChannelFactory<IVocabularyService>("net.pipe://localhost/VocabularyServiceEndpoint");
            vocabularyService = channelFactory.CreateChannel();

            var dbChunk = new DbChunk(Settings.Current.Building.BuilderConnectionString);
            var part = new ChunkPart(chunkId, createPersonBuilder, "0");

            var timer = new Stopwatch();
            timer.Start();
            
            part.Load();
            dbChunk.ChunkLoaded(chunkId);
            Logger.Write(chunkId, LogMessageTypes.Info, string.Format("Loaded - {0} ms | {1} Mb", timer.ElapsedMilliseconds, (GC.GetTotalMemory(false) / 1024f) / 1024f));

            part.Build(vocabularyService);
            part.Save();
            
            if (Settings.Current.Building.DestinationEngine.Database == Database.Redshift)
            {
               ServicesManager.AddToSaveQueue(chunkId);
               Logger.Write(null, LogMessageTypes.Debug, "AddToSaveQueue " + chunkId);
            }
            else
            {
               dbChunk.ChunkComplete(chunkId);
            }

            channelFactory.Close();
         }
         catch (Exception e)
         {
            Logger.WriteError(chunkId, e);

            throw;
         }
      }
      #endregion
   }
}
