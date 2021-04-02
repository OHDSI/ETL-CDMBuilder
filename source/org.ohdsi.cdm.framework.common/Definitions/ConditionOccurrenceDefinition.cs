using org.ohdsi.cdm.framework.common.Builder;
using org.ohdsi.cdm.framework.common.Extensions;
using org.ohdsi.cdm.framework.common.Omop;
using System.Collections.Generic;
using System.Data;
using System.Linq;

namespace org.ohdsi.cdm.framework.common.Definitions
{
    public class ConditionOccurrenceDefinition : EntityDefinition
    {

        public override IEnumerable<IEntity> GetConcepts(Concept concept, IDataRecord reader,
            KeyMasterOffsetManager offset)
        {
            int? statusConceptId = 0;
            string statusSource = null;
            if (Concepts != null && Concepts.Length == 2)
            {
                var conditionStatusConcept = Concepts.FirstOrDefault(c => c.Name == "ConditionStatusConceptId");
                if (conditionStatusConcept == null)
                    conditionStatusConcept = Concepts[1];

                var statusConcepts = conditionStatusConcept.GetConceptIdValues(Vocabulary, conditionStatusConcept.Fields[0], reader);
                statusSource = reader.GetString(conditionStatusConcept.Fields[0].Key);

                if (statusConcepts.Count > 0)
                {
                    statusConceptId = statusConcepts.Min(c => c.ConceptId);
                    statusSource = statusConcepts.Min(c => c.SourceCode);

                    if (string.IsNullOrEmpty(statusSource))
                        statusSource = reader.GetString(conditionStatusConcept.Fields[0].Key);

                    if (string.IsNullOrEmpty(statusSource))
                        statusSource = reader.GetString(conditionStatusConcept.Fields[0].SourceKey);
                }
            }

            return
                base.GetConcepts(concept, reader, offset)
                    .Select(
                        e =>
                            new ConditionOccurrence(e)
                            {
                                Id = offset.GetKeyOffset(e.PersonId).ConditionOccurrenceId,
                                StatusConceptId = statusConceptId.HasValue ? statusConceptId.Value : 0,
                                StatusSourceValue = statusSource
                            });
        }
    }
}
