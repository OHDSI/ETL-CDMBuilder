using System.Collections.Generic;
using System.Data;
using System.Linq;
using org.ohdsi.cdm.framework.entities.Builder;
using org.ohdsi.cdm.framework.entities.Omop;
using org.ohdsi.cdm.framework.shared.Extensions;

namespace org.ohdsi.cdm.framework.core.Definitions
{
   public class DeathDefinition : EntityDefinition
   {
      public string Died { get; set; }

      public override IEnumerable<IEntity> GetConcepts(Concept concept, IDataRecord reader, KeyMasterOffset keyOffset)
      {
         var concepts = base.GetConcepts(concept, reader, keyOffset).ToList();
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
                if (Concepts.Count() > 1)
                {
                    for (int i = 1; i < Concepts.Count(); i++)
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
                    var sourceConceptIdValues = secondaryConcept.GetSourceConceptIdValues(Vocabulary, field, reader);
                    long sourceConceptId = 0;

                    if (sourceConceptIdValues.Any())
                       sourceConceptId = sourceConceptIdValues[0].ConceptId.HasValue
                          ? sourceConceptIdValues[0].ConceptId.Value
                          : 0;

                    yield return new Death((Entity) baseConcept)
                    {
                       TypeConceptId = field.DefaultTypeId.HasValue ? field.DefaultTypeId.Value : 0,
                       ValidStartDate = lookupValue.ValidStartDate,
                       ValidEndDate = lookupValue.ValidEndDate,
                       SourceConceptId = sourceConceptId
                       //TypeConceptId = 0 // !!!
                    };
                    break;

                 }
              }
           }
       }
   }
}
