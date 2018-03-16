using System.Collections.Generic;
using System.Data;
using System.Linq;
using org.ohdsi.cdm.framework.entities.Builder;
using org.ohdsi.cdm.framework.entities.Omop;
using org.ohdsi.cdm.framework.shared.Extensions;
using System.Globalization;

namespace org.ohdsi.cdm.framework.core.Definitions
{
   public class NoteDefinition : EntityDefinition
    {
       public string EncodingConceptId { get; set; }
       public string LanguageConceptId { get; set; }

       public string Title { get; set; }
       public string Text { get; set; }

        public override IEnumerable<IEntity> GetConcepts(Concept concept, IDataRecord reader, KeyMasterOffset keyOffset)
        {
           return
           base.GetConcepts(concept, reader, keyOffset)
              .Select(
                 e =>
                    new Note(e)
                    {
                       Id = keyOffset.NoteId,
                       EncodingConceptId = reader.GetLong(EncodingConceptId) ?? 0,
                       LanguageConceptId = reader.GetLong(LanguageConceptId) ?? 0,
                       Title = reader.GetString(Title),
                       Text = reader.GetString(Text),
                       StartTime = e.StartTime ?? e.StartDate.ToString("HH:mm:ss", CultureInfo.InvariantCulture),
                    });
        }
    }
}

