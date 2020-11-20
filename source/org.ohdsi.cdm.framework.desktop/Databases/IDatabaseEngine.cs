using org.ohdsi.cdm.framework.common.Definitions;
using org.ohdsi.cdm.framework.desktop.Enums;
using org.ohdsi.cdm.framework.desktop.Savers;
using System.Data;

namespace org.ohdsi.cdm.framework.desktop.Databases
{
    public interface IDatabaseEngine
    {
        Database Database { get; }
        ISaver GetSaver();

        IDbConnection GetConnection(string odbcConnectionString);
        IDbCommand GetCommand(string cmdText, IDbConnection connection);

        IDataReader ReadChunkData(IDbConnection conn, IDbCommand cmd, QueryDefinition qd, int chunkId, string prefix);
    }
}
