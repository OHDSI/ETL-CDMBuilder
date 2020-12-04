using org.ohdsi.cdm.framework.common.Base;
using org.ohdsi.cdm.framework.common.Definitions;
using org.ohdsi.cdm.framework.desktop.Base;
using org.ohdsi.cdm.framework.desktop.Databases;
using System;
using System.Collections.Generic;
using System.Data.Odbc;
using System.Diagnostics;

namespace org.ohdsi.cdm.presentation.builderwebapi
{
    public class DatabaseChunkBuilder
    {
        #region Variables

        private readonly int _chunkId;

        #endregion

        #region Constructors

        public DatabaseChunkBuilder(int chunkId)
        {
            _chunkId = chunkId;
        }
        #endregion

        #region Methods
        public DatabaseChunkPart Process(IDatabaseEngine sourceEngine, string sourceSchemaName, List<QueryDefinition> sourceQueryDefinitions, OdbcConnection sourceConnection)
        {
            try
            {
                Console.WriteLine("DatabaseChunkBuilder");

                var part = new DatabaseChunkPart(_chunkId, () => new PersonBuilder(), "0", 0);

                var timer = new Stopwatch();
                timer.Start();


                var result = part.Load(sourceEngine, sourceSchemaName, sourceQueryDefinitions, sourceConnection, "");

                if (result.Value != null)
                {
                    //Logger.Write(_chunkId, LogMessageTypes.Info, result.Key);
                    throw result.Value;
                }

                part.Build();

                return part;
            }
            catch (Exception e)
            {
                throw;
            }
        }
        #endregion
    }
}
