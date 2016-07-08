using System.Collections.Generic;
using System.Data;
using System.Linq;
using org.ohdsi.cdm.framework.entities.Builder;
using org.ohdsi.cdm.framework.entities.Omop;
using org.ohdsi.cdm.framework.shared.Extensions;

namespace org.ohdsi.cdm.framework.core.Definitions
{
   public class ProviderDefinition : EntityDefinition
   {
      public string CareSiteId { get; set; }
      public string ProviderSourceValue { get; set; }
      public string SpecialtySourceValue { get; set; }

      public override IEnumerable<IEntity> GetConcepts(Concept concept, IDataReader reader, KeyMasterOffset keyMaster)
      {
         long id;
         var idUndefined = false;
         if (string.IsNullOrEmpty(Id))
         {
            id = KeyMaster.GetProviderId();
            idUndefined = true;
         }
         else
         {
            id = reader.GetLong(Id).Value;
         }

         if (concept == null)
         {
            yield return new Provider
               {
                  Id = id,
                  CareSiteId = reader.GetInt(CareSiteId) ?? 0,
                  ProviderSourceValue = reader.GetString(ProviderSourceValue),
                  SourceValue = reader.GetString(SpecialtySourceValue)
               };
         }
         else
         {
            var conceptField = concept.Fields[0];


            var source = reader.GetString(conceptField.Key) ?? reader.GetString(conceptField.SourceKey);

            if (source != null && source.Length == 0)
               source = null;

            var specialtyConceptIds = concept.GetValues(Vocabulary, conceptField, reader).ToList();
            long? specialtyConcept = null;

            //(Unknown Physician Specialty)
            long defaultConceptId = 38004514;

            if (conceptField.DefaultConceptId.HasValue)
            {
               defaultConceptId = conceptField.DefaultConceptId.Value;
            }

            if (specialtyConceptIds.Count > 0)
            {
               specialtyConcept = specialtyConceptIds[0].ConceptId;
            }

            yield return new Provider
               {
                  Id = id,
                  IdUndefined = idUndefined,
                  CareSiteId = reader.GetInt(CareSiteId) ?? 0,
                  ConceptId = specialtyConcept.HasValue ? specialtyConcept.Value : defaultConceptId,
                  ProviderSourceValue = reader.GetString(ProviderSourceValue),
                  SourceValue =
                     string.IsNullOrEmpty(conceptField.SourceKey) ? source : reader.GetString(conceptField.SourceKey)
               };
         }
      }
   }
}
