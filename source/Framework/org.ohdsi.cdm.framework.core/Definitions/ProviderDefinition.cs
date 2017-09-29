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
      public string NPI { get; set; }
      public string DEA { get; set; }

      // CDM v5 props
      public string Name { get; set; }
      public string YearOfBirth { get; set; }
      public string GenderConceptId { get; set; }
      public string GenderSourceValue { get; set; }
      public string GenderSourceConceptId { get; set; }
      public string SpecialtySourceConceptId { get; set; }

      public override IEnumerable<IEntity> GetConcepts(Concept concept, IDataRecord reader, KeyMasterOffset keyOffset)
      {
         long id;
         var idUndefined = false;
         int genderConceptId = 0;
         if (string.IsNullOrEmpty(Id))
         {
            id = KeyMaster.GetProviderId();
            idUndefined = true;
         }
         else
         {
            id = reader.GetLong(Id).Value;
         }

         if (string.IsNullOrEmpty(GenderConceptId) && Vocabulary != null)
         {
            genderConceptId = Vocabulary.LookupGender(GenderSourceValue) ?? 0;
         }
         else if (reader.GetInt(GenderConceptId).HasValue)
         {
            genderConceptId = reader.GetInt(GenderConceptId).Value;
         }

         if (concept == null)
         {
            yield return new Provider
               {
                  Id = id,
                  CareSiteId = reader.GetInt(CareSiteId) ?? 0,
                  ProviderSourceValue = reader.GetString(ProviderSourceValue),
                  SourceValue = reader.GetString(SpecialtySourceValue),
                  NPI = reader.GetString(NPI),
                  DEA = reader.GetString(DEA),
                  Name = reader.GetString(Name),
                  YearOfBirth = reader.GetInt(YearOfBirth),
                  GenderConceptId = genderConceptId,
                  GenderSourceValue = reader.GetString(GenderSourceValue),
                  GenderSourceConceptId = reader.GetInt(GenderSourceConceptId) ?? 0,
                  SpecialtySourceConceptId = reader.GetInt(SpecialtySourceConceptId) ?? 0,
                  LookupKey = reader.GetString(LookupKey)
               };
         }
         else
         {
            var conceptField = concept.Fields[0];


            var source = reader.GetString(conceptField.Key) ?? reader.GetString(conceptField.SourceKey);

            if (source != null && source.Length == 0)
               source = null;

            var specialtyConceptIds = concept.GetConceptIdValues(Vocabulary, conceptField, reader).ToList();
            long? specialtyConcept = null;

            //(Unknown Physician Specialty)
            long defaultConceptId = 38004514;

            if (conceptField.DefaultConceptId.HasValue)
            {
               defaultConceptId = conceptField.DefaultConceptId.Value;
            }

            if (specialtyConceptIds.Count > 0 && specialtyConceptIds[0].ConceptId != 0)
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
                  SourceValue = source,
                  Name = reader.GetString(Name),
                  YearOfBirth = reader.GetInt(YearOfBirth),
                  GenderConceptId = genderConceptId,
                  GenderSourceValue = reader.GetString(GenderSourceValue),
                  NPI = reader.GetString(NPI),
                  DEA = reader.GetString(DEA),
                  GenderSourceConceptId = reader.GetInt(GenderSourceConceptId) ?? 0,
                  SpecialtySourceConceptId = reader.GetInt(SpecialtySourceConceptId) ?? 0,
                  LookupKey = reader.GetString(LookupKey)
               };
         }
      }
   }
}
