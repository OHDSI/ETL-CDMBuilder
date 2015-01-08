using System.Collections.Generic;
using System.Data;
using System.Linq;
using org.ohdsi.cdm.framework.entities.Builder;
using org.ohdsi.cdm.framework.entities.Omop;

namespace org.ohdsi.cdm.framework.core.Definitions
{
   public class ProcedureOccurrenceDefinition : EntityDefinition
   {
      public override IEnumerable<IEntity> GetConcepts(Concept concept, IDataReader reader, KeyMasterOffset keyMaster)
      {
         long? relevantConditionConceptId = null;
         if (Concepts.Length == 2)
         {
            var relevantConcepts = Concepts[1].GetValues(Vocabulary, Concepts[1].Fields[0], reader);

            if (relevantConcepts.Count > 0)
               relevantConditionConceptId = relevantConcepts.Min(c => c.ConceptId);
         }

         foreach (var e in base.GetConcepts(concept, reader, keyMaster))
         {
            yield return
               new ProcedureOccurrence((Entity) e)
                  {
                     Id = keyMaster.ProcedureOccurrenceId,
                     ReleventConditionConceptId = relevantConditionConceptId
                  };
         }
      }
   }
}
