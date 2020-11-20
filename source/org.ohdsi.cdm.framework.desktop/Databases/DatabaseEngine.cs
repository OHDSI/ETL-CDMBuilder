using org.ohdsi.cdm.framework.common.Definitions;
using org.ohdsi.cdm.framework.desktop.Enums;
using org.ohdsi.cdm.framework.desktop.Helpers;
using org.ohdsi.cdm.framework.desktop.Savers;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Odbc;

namespace org.ohdsi.cdm.framework.desktop.Databases
{
    public class DatabaseEngine : IDatabaseEngine
    {
        public Database Database { get; protected set; }

        public virtual IEnumerable<string> GetAllTables()
        {
            throw new NotImplementedException();
        }

        public virtual IEnumerable<string> GetAllColumns(string tableName)
        {
            throw new NotImplementedException();
        }

        public virtual ISaver GetSaver()
        {
            throw new NotImplementedException();
        }

        public virtual IDbConnection GetConnection(string odbcConnectionString)
        {
            return SqlConnectionHelper.OpenConnection(odbcConnectionString, Database);
        }


        public virtual IDbCommand GetCommand(string cmdText, IDbConnection connection)
        {
            var c = new OdbcCommand(cmdText, (OdbcConnection)connection);

            return c;
        }

        public virtual IDataReader ReadChunkData(IDbConnection conn, IDbCommand cmd, QueryDefinition qd, int chunkId,
            string prefix)
        {
            return cmd.ExecuteReader();
        }

    }
}
