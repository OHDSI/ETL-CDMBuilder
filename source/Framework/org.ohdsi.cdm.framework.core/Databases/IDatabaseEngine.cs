using System.Collections.Generic;
using System.Data;
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
   }
}
