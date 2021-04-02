using org.ohdsi.cdm.framework.common.Builder;
using org.ohdsi.cdm.framework.common.Extensions;
using org.ohdsi.cdm.framework.common.Omop;
using System.Collections.Generic;
using System.Data;
using System.Linq;

namespace org.ohdsi.cdm.framework.common.Definitions
{
    public class DeathDefinition : EntityDefinition
    {
        public string Died { get; set; }

        public override IEnumerable<IEntity> GetConcepts(Concept concept, IDataRecord reader, KeyMasterOffsetManager offset)
        {
            var concepts = base.GetConcepts(concept, reader, offset).ToList();
            if (concepts.Count > 0)
            {
                var baseConcept = concepts[0];
                var died = reader.GetInt(Died);
                if (died.HasValue && died.Value == 1)
                {
                    yield return new Death((Entity)baseConcept) { Primary = true };
                }
                else //Medical claim diagnostic code indicating death
                {
                    if (Concepts != null && Concepts.Length > 1)
                    {
                        for (int i = 1; i < Concepts.Length; i++)
                        {
                            foreach (var entity in PopulateDeath(reader, Concepts[i], baseConcept)) yield return entity;
                        }
                    }
                    else
                    {
                        foreach (var entity in PopulateDeath(reader, Concepts[0], baseConcept)) yield return entity;
                    }
                }
            }
        }

        private IEnumerable<IEntity> PopulateDeath(IDataRecord reader, Concept secondaryConcept, IEntity baseConcept)
        {
            foreach (var field in secondaryConcept.Fields)
            {
                foreach (var lookupValue in secondaryConcept.GetConceptIdValues(Vocabulary, field, reader))
                {
                    if (lookupValue.ConceptId > 0)
                    {
                        yield return new Death((Entity)baseConcept)
                        {
                            TypeConceptId = field.DefaultTypeId ?? 0,
                            ValidStartDate = lookupValue.ValidStartDate,
                            ValidEndDate = lookupValue.ValidEndDate,
                            SourceConceptId = lookupValue.SourceConceptId
                            //TypeConceptId = 0 // !!!
                        };
                        break;

                    }
                }
            }
        }
    }
}
