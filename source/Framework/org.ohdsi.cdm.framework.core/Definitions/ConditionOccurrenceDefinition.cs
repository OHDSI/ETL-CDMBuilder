using System.Collections.Generic;
using System.Data;
using System.Linq;
using org.ohdsi.cdm.framework.entities.Builder;
using org.ohdsi.cdm.framework.entities.Omop;
using org.ohdsi.cdm.framework.shared.Extensions;

namespace org.ohdsi.cdm.framework.core.Definitions
{
   public class ConditionOccurrenceDefinition : EntityDefinition
   {

      public override IEnumerable<IEntity> GetConcepts(Concept concept, IDataRecord reader, KeyMasterOffset keyOffset)
      {
         long? statusConceptId = 0;
         string statusSource = null;
         if (Concepts.Length == 2)
         {
            var statusConcepts = Concepts[1].GetConceptIdValues(Vocabulary, Concepts[1].Fields[0], reader);

            if (statusConcepts.Count > 0)
            {
               statusConceptId = statusConcepts.Min(c => c.ConceptId);
               statusSource = statusConcepts.Min(c => c.Source);

               if (string.IsNullOrEmpty(statusSource))
                  statusSource = reader.GetString(Concepts[1].Fields[0].Key);

               if (string.IsNullOrEmpty(statusSource))
                  statusSource = reader.GetString(Concepts[1].Fields[0].SourceKey);
            }
         }

         return
            base.GetConcepts(concept, reader, keyOffset)
               .Select(
                  e =>
                     new ConditionOccurrence(e)
                     {
                        Id = keyOffset.ConditionOccurrenceId,
                        StatusConceptId = statusConceptId.HasValue ? statusConceptId.Value : 0,
                        StatusSourceValue = statusSource
                     });
      }
   }
}
