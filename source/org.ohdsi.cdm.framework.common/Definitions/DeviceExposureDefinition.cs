using org.ohdsi.cdm.framework.common.Builder;
using org.ohdsi.cdm.framework.common.Extensions;
using org.ohdsi.cdm.framework.common.Omop;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;

namespace org.ohdsi.cdm.framework.common.Definitions
{
    public class DeviceExposureDefinition : EntityDefinition
    {
        public string UniqueDeviceId { get; set; }
        public string Quantity { get; set; }

        public string ProductionId { get; set; }


        //public KeyValuePair<KeyValuePair<int?, int?>, string> GetUnitConcept(IDataRecord reader)
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
            var unitConcept = GetUnitConcept(reader);

            foreach (var entity in base.GetConcepts(concept, reader, offset))
            {
                yield return new DeviceExposure(entity)
                {
                    Id = offset.GetKeyOffset(entity.PersonId).DeviceExposureId,
                    UniqueDeviceId = reader.GetString(UniqueDeviceId),
                    Quantity = reader.GetInt(Quantity) ?? 0,
                    ProductionId = reader.GetString(ProductionId),
                    UnitConceptId = unitConcept.Item1 ?? 0,
                    UnitSourceConceptId = unitConcept.Item2 ?? 0,
                    UnitSourceValue = string.IsNullOrWhiteSpace(unitConcept.Item3) ? null : unitConcept.Item3,
                };
            }
        }
    }
}