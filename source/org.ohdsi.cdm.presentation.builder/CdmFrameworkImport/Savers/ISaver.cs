using org.ohdsi.cdm.framework.common.Builder;
using org.ohdsi.cdm.framework.common.Enums;
using org.ohdsi.cdm.framework.common.Omop;
using org.ohdsi.cdm.framework.desktop;
using System.Data;

namespace org.ohdsi.cdm.presentation.builder.Utility.CdmFrameworkImport.Savers
{
    public interface ISaver : IDisposable
    {
        ISaver Create(string connectionString);
        void Save(ChunkData chunk, KeyMasterOffsetManager offsetManager);
        void SaveEntityLookup(CdmVersions cdmVersions, List<Location> location, List<CareSite> careSite, List<Provider> provider, List<CohortDefinition> cohortDefinition);
        void AddChunk(List<ChunkRecord> chunk, int index, string schemaName);
        void Write(int? chunkId, int? subChunkId, IDataReader reader, string tableName);
        void Write(ChunkData chunk, string table);
        void Commit();
        void Rollback();
    }
}