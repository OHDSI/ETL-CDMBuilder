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

                DatabaseChunkBuilder builder = new DatabaseChunkBuilder(_chunkId);
                var result = builder.Process(sourceEngine, sourceSchemaName, sourceQueryDefinitions, sourceConnection);

                return result;
            }
            catch (Exception e)
            {
                throw;
            }
        }
        #endregion
    }
}
