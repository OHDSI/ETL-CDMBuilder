using org.ohdsi.cdm.framework.common.Builder;
using org.ohdsi.cdm.framework.common.Extensions;
using org.ohdsi.cdm.framework.common.Omop;
using System.Collections.Generic;
using System.Data;
using System.Linq;

namespace org.ohdsi.cdm.framework.common.Definitions
{
    public class ProcedureOccurrenceDefinition : EntityDefinition
    {
        // CDM v5 props
        public string ModifierConceptId { get; set; }
        public string Quantity { get; set; }
        public string QualifierSourceValue { get; set; }

        public override IEnumerable<IEntity> GetConcepts(Concept concept, IDataRecord reader, KeyMasterOffsetManager offset)
        {
            int? relevantConditionConceptId = null;
            int? modifierConceptId = reader.GetInt(ModifierConceptId) ?? 0;
            if (Concepts.Length == 2)
            {
                var relevantConcepts = Concepts[1].GetConceptIdValues(Vocabulary, Concepts[1].Fields[0], reader);

                if (relevantConcepts.Count > 0)
                {
                    relevantConditionConceptId = relevantConcepts.Min(c => c.ConceptId); //CDM v4
                    modifierConceptId = relevantConditionConceptId; //CDM v5
                }
            }

            var quantity = reader.GetDecimal(Quantity);
            int? q = null;

            if (quantity.HasValue)
                q = System.Decimal.ToInt32(quantity.Value);

            foreach (var e in base.GetConcepts(concept, reader, offset))
            {
                yield return
                   new ProcedureOccurrence(e)
                   {
                       Id = offset.GetKeyOffset(e.PersonId).ProcedureOccurrenceId,
                       ReleventConditionConceptId = relevantConditionConceptId,
                       ModifierConceptId = modifierConceptId ?? 0,
                       Quantity = q,
                       QualifierSourceValue = reader.GetString(QualifierSourceValue)
                   };
            }
        }
    }
}
