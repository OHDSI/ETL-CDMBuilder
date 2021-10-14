using org.ohdsi.cdm.framework.common.Builder;
using org.ohdsi.cdm.framework.common.Extensions;
using org.ohdsi.cdm.framework.common.Omop;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;

namespace org.ohdsi.cdm.framework.common.Definitions
{
    public class EpisodeDefinition : EntityDefinition
    {
        public string EpisodeParentId { get; set; }
        public string EpisodeNumber { get; set; }
        public string EpisodeObjectConceptId { get; set; }

        public IEnumerable<Episode> GetNotes(Concept concept, IDataRecord reader,
            KeyMasterOffsetManager offset)
        {
            return
                base.GetConcepts(concept, reader, offset)
                    .Select(
                        e =>
                            new Episode
                            {
                                Id = offset.GetKeyOffset(e.PersonId).NoteId,

                                PersonId = e.PersonId,
                                ConceptId = e.ConceptId,
                                StartDate = e.StartDate,
                                TypeConceptId = e.TypeConceptId,
                                SourceValue = e.SourceValue,
                                AdditionalFields = e.AdditionalFields,

                                EpisodeParentId = reader.GetLong(EpisodeParentId) ?? 0,
                                EpisodeNumber = reader.GetInt(EpisodeNumber) ?? 0,
                                EpisodeObjectConceptId = reader.GetInt(EpisodeObjectConceptId) ?? 0,
                            });
        }

        public override IEnumerable<IEntity> GetConcepts(Concept concept, IDataRecord reader, KeyMasterOffsetManager offset)
        {
            throw new NotImplementedException("EpisodeDefinition.GetConcepts()");
            //return
            //    base.GetConcepts(concept, reader, offset);
            //TMP: NOTE
            //return
            //base.GetConcepts(concept, reader, offset)
            //   .Select(
            //      e =>
            //         new Note(e)
            //         {
            //            Id = _offset.GetKeyOffset(e.PersonId).NoteId,
            //            EncodingConceptId = reader.GetInt(EncodingConceptId) ?? 0,
            //            LanguageConceptId = reader.GetInt(LanguageConceptId) ?? 0,
            //            Title = reader.GetString(Title),
            //            Text = reader.GetString(Text),
            //            StartTime = e.StartTime ?? e.StartDate.ToString("HH:mm:ss", CultureInfo.InvariantCulture),
            //         });
        }
    }
}

