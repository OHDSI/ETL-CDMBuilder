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
        public string[] ValuesAsNumber { get; set; }
        public string[] ValuesAsString { get; set; }

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

        public KeyValuePair<int?, string> GetUnitConcept(IDataRecord reader)
        {
            if (Concepts != null && Concepts.Length < 2)
                return new KeyValuePair<int?, string>(null, string.Empty);

            var unitsConcept = Concepts.FirstOrDefault(c => c.Name == "UnitConceptId");
            if (unitsConcept == null)
                unitsConcept = Concepts[1];

            var unitsConcepts = base.GetConcepts(unitsConcept, reader, null).Where(c => c.ConceptId != 0).ToList();
            var sourceValue = reader.GetString(unitsConcept.Fields[0].Key);

            if (unitsConcepts.Count > 0)
            {
                foreach (var uc in unitsConcepts)
                {
                    if (!string.IsNullOrEmpty(sourceValue) && !string.IsNullOrEmpty(uc.VocabularySourceValue) &&
                        sourceValue.Equals(uc.VocabularySourceValue, StringComparison.Ordinal))
                        return new KeyValuePair<int?, string>(uc.ConceptId, sourceValue);
                }

                return new KeyValuePair<int?, string>(unitsConcepts[0].ConceptId, unitsConcepts[0].SourceValue);

            }

            return new KeyValuePair<int?, string>(null, sourceValue);
        }

        public override IEnumerable<IEntity> GetConcepts(Concept concept, IDataRecord reader,
            KeyMasterOffsetManager offset)
        {
            foreach (var entity in base.GetConcepts(concept, reader, offset))
            {
                var unitConcept = GetUnitConcept(reader);
                int? relevantConditionConceptId = null;

                if (Concepts != null && Concepts.Length == 3)
                {
                    var relevantConditionConcepts =
                        Concepts[2].GetConceptIdValues(Vocabulary, Concepts[2].Fields[0], reader);

                    if (relevantConditionConcepts.Count > 0)
                        relevantConditionConceptId = relevantConditionConcepts.Min(c => c.ConceptId);
                }

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
                    QualifierConceptId = reader.GetInt(QualifierConceptId) ?? 0,
                    QualifierSourceValue = reader.GetString(QualifierSourceValue),
                    RelevantConditionConceptId = relevantConditionConceptId ?? 0
                });

                if (ValuesAsNumber != null && ValuesAsNumber.Length > 1)
                {
                    foreach (var valueAsNumber in ValuesAsNumber)
                    {
                        var value = reader.GetDecimal(valueAsNumber);
                        if (value != null)
                        {
                            var observation = createObservation();

                            observation.ValueAsNumber = Math.Round(value.Value, 3);
                            observation.SourceValue = observation.ValueAsNumber.ToString();
                            observation.TypeConceptId = 38000277;
                            yield return observation;
                        }
                    }
                }
                else if (ValuesAsString != null && ValuesAsString.Length > 1)
                {
                    foreach (var valueAsString in ValuesAsString)
                    {
                        var value = reader.GetString(valueAsString);
                        if (!string.IsNullOrEmpty(value) && value != "-" && value != "9") //TMP
                        {
                            var observation = createObservation();
                            observation.ValueAsString = reader.GetString(valueAsString);
                            observation.SourceValue = valueAsString;
                            observation.TypeConceptId = 38000278;
                            yield return observation;
                        }
                    }
                }
                //else if (obsConcepts[0].ConceptId > 0 || !string.IsNullOrEmpty(obsConcepts[0].SourceValue))
                else if (entity.ConceptId > 0 || concept.Fields[0].IsNullable || !string.IsNullOrEmpty(entity.SourceValue))
                {
                    var observation = createObservation();
                    if (ValuesAsNumber != null && ValuesAsNumber.Length > 0)
                    {
                        observation.ValueAsNumber = reader.GetDecimal(ValuesAsNumber[0]);
                        if (observation.ValueAsNumber.HasValue)
                        {
                            observation.ValueAsNumber = Math.Round(observation.ValueAsNumber.Value, 3);
                        }
                    }

                    if (ValuesAsString != null && ValuesAsString.Length > 0)
                    {
                        observation.ValueAsString = reader.GetString(ValuesAsString[0]);

                        // Workaround, map ValueAsString (usind SourceLookup) and reset SourceValue to original value
                        if (observation.AdditionalFields != null &&
                            observation.AdditionalFields.ContainsKey("original_source"))
                        {
                            observation.ValueAsString = observation.SourceValue;
                            observation.SourceValue = observation.AdditionalFields["original_source"];
                        }
                    }

                    yield return observation;
                }
            }
        }
    }
}

