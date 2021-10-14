using org.ohdsi.cdm.framework.common.Builder;
using org.ohdsi.cdm.framework.common.Extensions;
using org.ohdsi.cdm.framework.common.Omop;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;

namespace org.ohdsi.cdm.framework.common.Definitions
{
    public class MeasurementDefinition : EntityDefinition
    {
        public string Time { get; set; }

        public string OperatorConceptId { get; set; }
        public string ValueAsNumber { get; set; }
        public string ValueAsConceptId { get; set; }
        public string UnitConceptId { get; set; }
        public string RangeLow { get; set; }
        public string RangeHigh { get; set; }
        public string UnitSourceValue { get; set; }
        public string ValueSourceValue { get; set; }
        public string EventId { get; set; }
        public string EventFieldConceptId { get; set; }

        public Tuple<int?, int?, string> GetUnitConcept(IDataRecord reader)
        {
            var sourceValue = string.Empty;
            var unitsConcept = Concepts.FirstOrDefault(c => c.Name == "UnitConceptId");
            if (unitsConcept != null)
            {
                var unitsConcepts = base.GetConcepts(unitsConcept, reader, null).Where(c => c.ConceptId != 0).ToList();
                sourceValue = reader.GetString(unitsConcept.Fields[0].Key);

                if (unitsConcepts.Count > 0)
                {
                    foreach (var uc in unitsConcepts)
                    {
                        if (!string.IsNullOrEmpty(sourceValue) && !string.IsNullOrEmpty(uc.VocabularySourceValue) &&
                            sourceValue.Equals(uc.VocabularySourceValue, StringComparison.Ordinal))
                            return new Tuple<int?, int?, string>(uc.ConceptId, uc.SourceConceptId, sourceValue);
                    }

                    return new Tuple<int?, int?, string>(unitsConcepts[0].ConceptId, unitsConcepts[0].SourceConceptId, unitsConcepts[0].SourceValue);
                }
            }

            return new Tuple<int?, int?, string>(null, null, sourceValue);
        }

        public override IEnumerable<IEntity> GetConcepts(Concept concept, IDataRecord reader,
            KeyMasterOffsetManager offset)
        {
            //var obsConcepts = base.GetConcepts(concept, reader, offset).ToList();
            var unitConcept = GetUnitConcept(reader);

            int? valueAsConceptId = null;
            int? operatorConceptId = null;
            if (Concepts != null)
            {
                var valueConcept = Concepts.FirstOrDefault(c => c.Name == "ValueAsConceptId");
                if (valueConcept != null)
                {
                    var valueConcepts = base.GetConcepts(valueConcept, reader, null).ToList();
                    if (valueConcepts.Count > 0)
                    {
                        valueAsConceptId = valueConcepts[0].ConceptId;
                    }
                }

                var operatorConcept = Concepts.FirstOrDefault(c => c.Name == "OperatorConceptId");
                if (operatorConcept != null)
                {
                    var operatorConcepts = base.GetConcepts(operatorConcept, reader, null).ToList();
                    if (operatorConcepts.Count > 0)
                    {
                        operatorConceptId = operatorConcepts[0].ConceptId;
                    }
                }
            }
            else
            {
                if (operatorConceptId == null)
                    operatorConceptId = reader.GetInt(OperatorConceptId);

                if (valueAsConceptId == null)
                    valueAsConceptId = reader.GetInt(ValueAsConceptId);
            }

            foreach (var entity in base.GetConcepts(concept, reader, offset))
            {
                yield return new Measurement(entity)
                {
                    Id = offset.GetKeyOffset(entity.PersonId).MeasurementId,
                    SourceValue = string.IsNullOrWhiteSpace(entity.SourceValue)
                        ? null
                        : entity.SourceValue,
                    RangeLow = reader.GetDecimal(RangeLow),
                    RangeHigh = reader.GetDecimal(RangeHigh),
                    ValueAsNumber = reader.GetDecimal(ValueAsNumber),
                    OperatorConceptId = operatorConceptId ?? 0,
                    UnitConceptId = unitConcept.Item1 ?? 0,
                    UnitSourceConceptId = unitConcept.Item2 ?? 0,
                    UnitSourceValue = string.IsNullOrWhiteSpace(unitConcept.Item3) ? null : unitConcept.Item3,
                    ValueSourceValue = reader.GetString(ValueSourceValue),
                    ValueAsConceptId = valueAsConceptId ?? 0,
                    Time = reader.GetString(Time),
                    EventId = reader.GetLong(EventId) ?? 0,
                    EventFieldConceptId = reader.GetInt(EventFieldConceptId) ?? 0
                };
            }
        }
    }
}