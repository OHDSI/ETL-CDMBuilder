using System;
using org.ohdsi.cdm.framework.core.Common.Services;
using org.ohdsi.cdm.framework.data.DbLayer;

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

            var part = new ChunkPart(chunkId, createPersonBuilder, "0");

            part.Load();
            part.Build(vocabularyService);
            part.Save();

            var dbChunk = new DbChunk(Settings.Current.Building.BuilderConnectionString);
            dbChunk.ChunkComplete(chunkId);

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
