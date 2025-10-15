using org.ohdsi.cdm.framework.common.Base;
using org.ohdsi.cdm.framework.common.Definitions;
using org.ohdsi.cdm.framework.common.DataReaders;
using org.ohdsi.cdm.framework.desktop.Base;
using org.ohdsi.cdm.framework.desktop.Databases;
using org.ohdsi.cdm.framework.desktop.Enums;
using System;
using System.Collections.Generic;
using System.Data.Odbc;
using System.Diagnostics;
using IPersonBuilder = org.ohdsi.cdm.framework.common.Base.IPersonBuilder;
using org.ohdsi.cdm.framework.common.Enums;
using DatabaseChunkPartAdapter = org.ohdsi.cdm.presentation.builder.Utility.CdmFrameworkImport.DatabaseChunkPartAdapter;
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
        public void Process(ProgressTask progressTask, ProgressTask overallTask)
        {
            DatabaseChunkPartAdapter part;
            try
            {
                part = new DatabaseChunkPartAdapter(_createPersonBuilder, _chunkId, "0", 0);

                var result = part.Load();

                if (result.Value != null)
                {
                    Logger.Write(_chunkId, Logger.LogMessageTypes.Info, result.Key);
                    throw result.Value;
                }

                part.Build(progressTask, overallTask);
                part.Save();
            }
            catch (Exception e)
            {
                Logger.WriteError(_chunkId, e);
                Logger.Write(_chunkId, Logger.LogMessageTypes.Error, "ChunkId=" + _chunkId + ". Peak memory=" + MemoryColumn.MaxMemoryMb + "/" + MemoryColumn.MaxMemoryGC);

                throw;
            }
        }
        #endregion
    }
}
