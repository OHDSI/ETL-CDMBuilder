using System;
using System.Data;
using org.ohdsi.cdm.framework.entities.Builder;

namespace org.ohdsi.cdm.framework.core.Savers
{
   public interface ISaver : IDisposable
   {
      ISaver Create();
      void Save(ChunkData chunk);
      void Write(int chunkId, IDataReader reader, string tableName);
      void Commit();
      void Rollback();

   }
}
