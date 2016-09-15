using System;
using System.Collections.Generic;
using System.Data;
using org.ohdsi.cdm.framework.entities.Builder;
using org.ohdsi.cdm.framework.entities.Omop;

namespace org.ohdsi.cdm.framework.core.Savers
{
   public interface ISaver : IDisposable
   {
      ISaver Create(string connectionString);
      void Save(ChunkData chunk);
      void SaveEntityLookup(List<Location> location, List<Organization> organization, List<CareSite> careSite, List<Provider> provider);
      void AddChunk(List<ChunkRecord> chunk, int index);
      void Write(int? chunkId, int?subChunkId, IDataReader reader, string tableName);
      void Commit();
      void Rollback();
      void CopyVocabulary();

   }
}
