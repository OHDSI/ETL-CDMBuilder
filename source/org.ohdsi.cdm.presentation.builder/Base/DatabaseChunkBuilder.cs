using org.ohdsi.cdm.framework.common.Base;
using org.ohdsi.cdm.framework.common.Definitions;
using org.ohdsi.cdm.framework.desktop.Base;
using org.ohdsi.cdm.framework.desktop.Databases;
using org.ohdsi.cdm.framework.desktop.Enums;
using System;
using System.Collections.Generic;
using System.Data.Odbc;
using System.Diagnostics;

namespace org.ohdsi.cdm.presentation.builder.Base
{
    public class DatabaseChunkBuilder
    {
        #region Variables

        private readonly int _chunkId;
        private readonly Func<IPersonBuilder> _createPersonBuilder;
        #endregion

        #region Constructors

        public DatabaseChunkBuilder(int chunkId, Func<IPersonBuilder> createPersonBuilder)
        {
            _chunkId = chunkId;
            _createPersonBuilder = createPersonBuilder;
        }
        #endregion

        #region Methods
        public DatabaseChunkPart Process(IDatabaseEngine sourceEngine, string sourceSchemaName, List<QueryDefinition> sourceQueryDefinitions, string sourceConnection, string vendor)
        {
            try
            {
                Console.WriteLine("DatabaseChunkBuilder");

                var part = new DatabaseChunkPart(_chunkId, _createPersonBuilder, "0", 0);

                var timer = new Stopwatch();
                timer.Start();


                var result = part.Load(sourceEngine, sourceSchemaName, sourceQueryDefinitions, sourceConnection, vendor);

                if (result.Value != null)
                {
                    Logger.Write(_chunkId, LogMessageTypes.Info, result.Key);
                    throw result.Value;
                }

                Logger.Write(_chunkId, LogMessageTypes.Info,
                    $"ChunkId={_chunkId} was loaded - {timer.ElapsedMilliseconds} ms | {GC.GetTotalMemory(false) / 1024f / 1024f} Mb");

                part.Build();

                return part;
            }
            catch (Exception e)
            {
                Logger.WriteError(_chunkId, e);

                throw;
            }
        }
        #endregion
    }
}
