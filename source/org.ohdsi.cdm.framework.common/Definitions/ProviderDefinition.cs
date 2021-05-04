using org.ohdsi.cdm.framework.common.Builder;
using org.ohdsi.cdm.framework.common.Extensions;
using org.ohdsi.cdm.framework.common.Omop;
using System.Collections.Generic;
using System.Data;
using System.Linq;

namespace org.ohdsi.cdm.framework.common.Definitions
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

        public override IEnumerable<IEntity> GetConcepts(Concept concept, IDataRecord reader,
            KeyMasterOffsetManager keyOffset)
        {
            int? genderConceptId = 0;
            string genderSource = null;

            int? specialtyConceptId = 0;
            int? specialtySourceConceptId = 0;
            string specialtySource = null;

            if (Concepts != null)
            {
                var genderConcept = Concepts.FirstOrDefault(c => c.Name == "GenderConceptId");
                if (genderConcept != null)
                {
                    var genderConcepts = genderConcept.GetConceptIdValues(Vocabulary, genderConcept.Fields[0], reader);
                    genderSource = reader.GetString(genderConcept.Fields[0].Key);

                    if (genderConcepts.Count > 0)
                    {
                        genderConceptId = genderConcepts.Min(c => c.ConceptId);
                        genderSource = genderConcepts.Min(c => c.SourceCode);

                        if (string.IsNullOrEmpty(genderSource))
                            genderSource = reader.GetString(genderConcept.Fields[0].Key);

                        if (string.IsNullOrEmpty(genderSource))
                            genderSource = reader.GetString(genderConcept.Fields[0].SourceKey);
                    }
                }

                var specialtyConcept = Concepts.FirstOrDefault(c => c.Name == "SpecialtyConceptId");
                if (specialtyConcept != null)
                {
                    var specialtyConcepts = specialtyConcept.GetConceptIdValues(Vocabulary, specialtyConcept.Fields[0], reader);
                    specialtySource = reader.GetString(specialtyConcept.Fields[0].Key);

                    if (specialtyConcepts.Count > 0)
                    {
                        specialtyConceptId = specialtyConcepts.Min(c => c.ConceptId);
                        specialtySourceConceptId = specialtyConcepts.Min(c => c.SourceConceptId);
                        specialtySource = specialtyConcepts.Min(c => c.SourceCode);

                        if (string.IsNullOrEmpty(specialtySource))
                            specialtySource = reader.GetString(specialtyConcept.Fields[0].Key);

                        if (string.IsNullOrEmpty(specialtySource))
                            specialtySource = reader.GetString(specialtyConcept.Fields[0].SourceKey);
                    }
                }
            }

            var prov = new Provider
            {
                CareSiteId = reader.GetLong(CareSiteId) ?? 0,
                ConceptId = specialtyConceptId ?? 0,
                ProviderSourceValue = reader.GetString(ProviderSourceValue),
                SourceValue = specialtySource,
                Name = reader.GetString(Name),
                YearOfBirth = reader.GetInt(YearOfBirth),
                GenderConceptId = genderConceptId,
                GenderSourceValue = reader.GetString(GenderSourceValue),
                Npi = reader.GetString(NPI),
                Dea = reader.GetString(DEA),
                GenderSourceConceptId = reader.GetInt(GenderSourceConceptId) ?? 0,
                SpecialtySourceConceptId = specialtySourceConceptId ?? 0
            };

            prov.Id = string.IsNullOrEmpty(Id) ? Entity.GetId(prov.GetKey()) : reader.GetLong(Id).Value;

            yield return prov;

        }
    }
}
