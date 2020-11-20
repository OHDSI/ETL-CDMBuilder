using org.ohdsi.cdm.framework.common.Builder;
using org.ohdsi.cdm.framework.common.Enums;
using org.ohdsi.cdm.framework.common.Omop;
using org.ohdsi.cdm.framework.desktop.Enums;
using System;
using System.Collections.Generic;
using System.Data;

namespace org.ohdsi.cdm.framework.desktop.Savers
{
    public interface ISaver : IDisposable
    {
        CdmVersions CdmVersion { get; set; }
        string SourceSchema { get; set; }
        string DestinationSchema { get; set; }
        ISaver Create(string connectionString, CdmVersions cdmVersion, string sourceSchema, string destinationSchema);
        Database GetDatabaseType();
        void Save(ChunkData chunk, KeyMasterOffsetManager offsetManager);
        void SaveEntityLookup(CdmVersions cdmVersions, List<Location> location, List<CareSite> careSite, List<Provider> provider, List<CohortDefinition> cohortDefinition);
        void AddChunk(List<ChunkRecord> chunk, int index);
        void Write(int? chunkId, int? subChunkId, IDataReader reader, string tableName);
        void Write(ChunkData chunk, string table);
        void Commit();
        void Rollback();

    }
}
