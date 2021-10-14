using org.ohdsi.cdm.framework.common.Builder;
using org.ohdsi.cdm.framework.common.Extensions;
using org.ohdsi.cdm.framework.common.Omop;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;

namespace org.ohdsi.cdm.framework.common.Definitions
{
    public class EpisodeEventDefinition : EntityDefinition
    {
        public string EpisodeId { get; set; }
        public string EventId { get; set; }
        public string EpisodeEventFieldConceptId { get; set; }

        public IEnumerable<EpisodeEvent> GetNotes(Concept concept, IDataRecord reader,
            KeyMasterOffsetManager offset)
        {
            yield return new EpisodeEvent
            {
                EpisodeId = reader.GetLong(EpisodeId) ?? 0,
                EventId = reader.GetLong(EventId) ?? 0,
                EpisodeEventFieldConceptId = reader.GetInt(EpisodeEventFieldConceptId) ?? 0,
            };
        }

        public override IEnumerable<IEntity> GetConcepts(Concept concept, IDataRecord reader, KeyMasterOffsetManager offset)
        {
            throw new NotImplementedException("EpisodeEventDefinition.GetConcepts()");

        }
    }
}

