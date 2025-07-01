using org.ohdsi.cdm.framework.common.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using FrameworkSettings = org.ohdsi.cdm.framework.desktop.Settings;

namespace org.ohdsi.cdm.presentation.builder.Utility.CdmFrameworkImport
{
    public class DatabaseChunkBuilderAdapter
    {
        private readonly framework.desktop.Base.DatabaseChunkBuilder _databaseChunkBuilder;

        private int _chunkId;
        private Func<IPersonBuilder> _createPersonBuilder;


        public DatabaseChunkBuilderAdapter(int chunkId, Func<IPersonBuilder> createPersonBuilder)
        {
            _chunkId = chunkId;
            _createPersonBuilder = createPersonBuilder;

            _databaseChunkBuilder = new framework.desktop.Base.DatabaseChunkBuilder(chunkId, createPersonBuilder);
        }


        public void Process()
        {
            _databaseChunkBuilder.Process();
        }
    }
}
