using System.Collections.Generic;
using System.Data;
using System.Linq;
using org.ohdsi.cdm.framework.entities.Builder;
using org.ohdsi.cdm.framework.entities.Omop;
using org.ohdsi.cdm.framework.shared.Extensions;

namespace org.ohdsi.cdm.framework.core.Definitions
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

        public KeyValuePair<long?, string> GetUnitConcept(IDataRecord reader)
        {
           if (Concepts.Length < 2)
              return new KeyValuePair<long?, string>(null, string.Empty);

           var unitsConcepts = base.GetConcepts(Concepts[1], reader, null).ToList();

           if (unitsConcepts.Count > 0)
           {
              return new KeyValuePair<long?, string>(unitsConcepts[0].ConceptId, unitsConcepts[0].SourceValue);
           }

           return new KeyValuePair<long?, string>(null, string.Empty);
        }

        public override IEnumerable<IEntity> GetConcepts(Concept concept, IDataRecord reader, KeyMasterOffset keyOffset)
        {
            var obsConcepts = base.GetConcepts(concept, reader, keyOffset).ToList();
            var unitConcept = GetUnitConcept(reader);

            if (obsConcepts.Count > 0)
            {
                yield return new Measurement(obsConcepts[0])
            {
                Id = keyOffset.MeasurementId,
                SourceValue = string.IsNullOrWhiteSpace(obsConcepts[0].SourceValue) ? null : obsConcepts[0].SourceValue,
                RangeLow = reader.GetDecimal(RangeLow),
                RangeHigh = reader.GetDecimal(RangeHigh),
                ValueAsNumber = reader.GetDecimal(ValueAsNumber),
                OperatorConceptId = reader.GetInt(OperatorConceptId) ?? 0,
                UnitConceptId = unitConcept.Key ?? 0,
                UnitSourceValue = string.IsNullOrWhiteSpace(unitConcept.Value) ? null : unitConcept.Value,
                ValueSourceValue = reader.GetString(ValueSourceValue),
                ValueAsConceptId = reader.GetInt(ValueAsConceptId) ?? 0,
                Time = reader.GetTime(Time)
            };
            }

        }
    }
}

