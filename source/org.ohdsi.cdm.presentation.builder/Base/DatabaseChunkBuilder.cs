using IPersonBuilder = org.ohdsi.cdm.framework.common.Base.IPersonBuilder;
using DatabaseChunkPartAdapter = org.ohdsi.cdm.presentation.builder.CdmFrameworkImport.DatabaseChunkPartAdapter;
using Spectre.Console;
using org.ohdsi.cdm.presentation.Builder.AnsiConsoleHelpers;

namespace org.ohdsi.cdm.presentation.builder.Base
{
    /// <summary>
    /// Should this be replaced with Framework.DatabaseChunkBuilder?
    /// </summary>
    public class DatabaseChunkBuilder
    {
        #region Variables

        private readonly int _chunkId;
        private readonly Func<IPersonBuilder> _createPersonBuilder;
        private readonly framework.desktop.Settings.BuildingSettings _frameworkBuildingSettings; //this is here for debug purposes to quickly check it

        private DatabaseChunkPartAdapter _databaseChunkPartAdapter;
        #endregion

        #region Constructors

        public DatabaseChunkBuilder(int chunkId, Func<IPersonBuilder> createPersonBuilder)
        {
            _chunkId = chunkId;
            _createPersonBuilder = createPersonBuilder;
            _frameworkBuildingSettings = framework.desktop.Settings.Settings.Current.Building;
        }
        #endregion

        #region Methods
        public void Calculate(ProgressTask progressTask, ProgressTask overallTask)
        {
            try
            {
                _databaseChunkPartAdapter = new DatabaseChunkPartAdapter(_createPersonBuilder, _chunkId, "0", 0);

                var result = _databaseChunkPartAdapter.Load();

                if (result.Value != null)
                {
                    Logger.Write(_chunkId, Logger.LogMessageTypes.Info, result.Key);
                    throw result.Value;
                }

                _databaseChunkPartAdapter.Build(progressTask, overallTask);
            }
            catch (Exception e)
            {
                Logger.WriteError(_chunkId, e);
                Logger.Write(_chunkId, Logger.LogMessageTypes.Error, "ChunkId=" + _chunkId + ". Peak memory=" + MemoryColumn.MaxMbMemoryProcess + "/" + MemoryColumn.MaxMbMemoryGC);

                throw;
            }
        }

        public void Save()
        {
            try
            {
                _databaseChunkPartAdapter.Save();
            }
            catch (Exception e)
            {
                Logger.WriteError(_chunkId, e);
                Logger.Write(_chunkId, Logger.LogMessageTypes.Error, "ChunkId=" + _chunkId + ". Peak memory=" + MemoryColumn.MaxMbMemoryProcess + "/" + MemoryColumn.MaxMbMemoryGC);

                throw;
            }
        }
        #endregion
    }
}
