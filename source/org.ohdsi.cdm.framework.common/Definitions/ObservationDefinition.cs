using org.ohdsi.cdm.framework.common.Builder;
using org.ohdsi.cdm.framework.common.Extensions;
using org.ohdsi.cdm.framework.common.Omop;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;

namespace org.ohdsi.cdm.framework.common.Definitions
{
    public class ObservationDefinition : EntityDefinition
    {
        //public string[] ValuesAsNumber { get; set; }
        //public string[] ValuesAsString { get; set; }

        public string ValueAsNumber { get; set; }
        public string ValueAsString { get; set; }

        public string RangeLow { get; set; }
        public string RangeHigh { get; set; }

        public string ValueAsConceptId { get; set; }
        public string UnitsConceptId { get; set; }
        public string AssociatedProviderId { get; set; }
        public string RelevantConditionConceptId { get; set; }

        public string UnitsSourceValue { get; set; }
        public string Time { get; set; }

        // CDM V5 props
        public string QualifierConceptId { get; set; }
        public string QualifierSourceValue { get; set; }

        public KeyValuePair<int?, string> GetUnitConcept(IDataRecord reader, string conceptName)
        {
            var sourceValue = string.Empty;

            var concept = Concepts.FirstOrDefault(c => c.Name == conceptName);
            if (concept != null)
            {
                var concepts = base.GetConcepts(concept, reader, null).Where(c => c.ConceptId != 0).ToList();
                sourceValue = reader.GetString(concept.Fields[0].Key);

                if (concepts.Count > 0)
                {
                    foreach (var uc in concepts)
                    {
                        if (!string.IsNullOrEmpty(sourceValue) && !string.IsNullOrEmpty(uc.VocabularySourceValue) &&
                            sourceValue.Equals(uc.VocabularySourceValue, StringComparison.Ordinal))
                            return new KeyValuePair<int?, string>(uc.ConceptId, sourceValue);
                    }

                    return new KeyValuePair<int?, string>(concepts[0].ConceptId, concepts[0].SourceValue);

                }
            }

            return new KeyValuePair<int?, string>(null, sourceValue);
        }

     
        public override IEnumerable<IEntity> GetConcepts(Concept concept, IDataRecord reader,
            KeyMasterOffsetManager offset)
        {
            foreach (var entity in base.GetConcepts(concept, reader, offset))
            {
                var unitConcept = GetUnitConcept(reader, "UnitConceptId");
                var qualifierConcept = GetUnitConcept(reader, "QualifierConceptId");

                var createObservation = new Func<Observation>(() => new Observation(entity)
                {
                    Id = offset.GetKeyOffset(entity.PersonId).ObservationId,
                    SourceValue = string.IsNullOrWhiteSpace(entity.SourceValue)
                        ? null
                        : entity.SourceValue,
                    RangeLow = reader.GetDecimal(RangeLow),
                    RangeHigh = reader.GetDecimal(RangeHigh),
                    UnitsConceptId = unitConcept.Key ?? 0,
                    UnitsSourceValue = string.IsNullOrWhiteSpace(unitConcept.Value) ? null : unitConcept.Value,
                    ValueAsConceptId = reader.GetInt(ValueAsConceptId) ?? 0,
                    QualifierConceptId = qualifierConcept.Key ?? 0,
                    QualifierSourceValue = string.IsNullOrWhiteSpace(qualifierConcept.Value) ? null : qualifierConcept.Value,
                    //RelevantConditionConceptId = relevantConditionConceptId ?? 0
                });

                var observation = createObservation();
                observation.ValueAsNumber = reader.GetDecimal(ValueAsNumber);
                if (observation.ValueAsNumber.HasValue)
                {
                    observation.ValueAsNumber = Math.Round(observation.ValueAsNumber.Value, 3);
                }

                observation.ValueAsString = reader.GetString(ValueAsString);

                yield return observation;
            }
        }
    }
}

