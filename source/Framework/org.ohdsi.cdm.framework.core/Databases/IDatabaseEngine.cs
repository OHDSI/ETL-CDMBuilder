using System;
using System.Collections.Generic;
using System.Data;
using org.ohdsi.cdm.framework.core.Base;
using org.ohdsi.cdm.framework.core.Definitions;
using org.ohdsi.cdm.framework.core.Savers;
using org.ohdsi.cdm.framework.shared.Enums;

namespace org.ohdsi.cdm.framework.core.Databases
{
   public interface IDatabaseEngine
   {
      Database Database { get; }
      IEnumerable<string> GetAllTables();
      IEnumerable<string> GetAllColumns(string tableName);
      ISaver GetSaver();

      string GetSql(string tableName, IEnumerable<string> columns, int chunkId, string personIdFieldName);
      IDbConnection GetConnection(string odbcConnectionString);
      IDbCommand GetCommand(string cmdText, IDbConnection connection);

      IDataReader ReadChunkData(IDbConnection conn, IDbCommand cmd, QueryDefinition qd, int chunkId, string prefix);

      IChunkBuilder GetChunkBuilder(int chunkId, Func<IPersonBuilder> createPersonBuilder, int subChunkSize);
   }
}
