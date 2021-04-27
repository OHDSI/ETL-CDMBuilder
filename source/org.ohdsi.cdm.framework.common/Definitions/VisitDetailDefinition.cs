using org.ohdsi.cdm.framework.common.Builder;
using org.ohdsi.cdm.framework.common.Extensions;
using org.ohdsi.cdm.framework.common.Omop;
using System.Collections.Generic;
using System.Data;
using System.Linq;

namespace org.ohdsi.cdm.framework.common.Definitions
{
    public class VisitDetailDefinition : EntityDefinition
    {
        public string CareSiteId { get; set; }

        // CDM v5.2 props
        public string AdmittingSourceConceptId { get; set; }
        public string AdmittingSourceValue { get; set; }
        public string DischargeToConceptId { get; set; }
        public string DischargeToSourceValue { get; set; }
        public string PrecedingVisitDetailId { get; set; }

        public override IEnumerable<IEntity> GetConcepts(Concept concept, IDataRecord reader,
            KeyMasterOffsetManager keyOffset)
        {
            var visitDetails = base.GetConcepts(concept, reader, keyOffset).ToList();

            if (visitDetails.Count > 0)
            {
                int? dischargeToConceptId = null;
                string dischargeToSourceValue = null;
                if (Concepts != null)
                {
                    var dischargeConcept = Concepts.FirstOrDefault(c => c.Name == "DischargeToConceptId");
                    if (dischargeConcept != null)
                    {
                        var dischargeConcepts = base.GetConcepts(dischargeConcept, reader, null).ToList();
                        dischargeToSourceValue = reader.GetString(dischargeConcept.Fields[0].Key);
                        if (dischargeConcepts.Count > 0)
                        {
                            dischargeToConceptId = dischargeConcepts[0].ConceptId;
                            dischargeToSourceValue = dischargeConcepts[0].SourceValue;
                        }
                    }
                }
                else
                {
                    dischargeToConceptId = reader.GetInt(DischargeToConceptId);
                    dischargeToSourceValue = reader.GetString(DischargeToSourceValue);
                }


                int? admittingSourceConceptId = null;
                string admittingSourceValue = null;
                if (Concepts != null)
                {
                    var admittingConcept = Concepts.FirstOrDefault(c => c.Name == "AdmittedFromConceptId");
                    if (admittingConcept != null)
                    {
                        var admittingConcepts = base.GetConcepts(admittingConcept, reader, null).ToList();
                        admittingSourceValue = reader.GetString(admittingConcept.Fields[0].Key);
                        if (admittingConcepts.Count > 0)
                        {
                            admittingSourceConceptId = admittingConcepts[0].ConceptId;
                            admittingSourceValue = admittingConcepts[0].SourceValue;
                        }
                    }
                }
                else
                {
                    admittingSourceConceptId = reader.GetInt(AdmittingSourceConceptId);
                    admittingSourceValue = reader.GetString(AdmittingSourceValue);
                }

                var id = reader.GetLong(Id);

                var visitDetail = new VisitDetail((Entity)visitDetails[0])
                {
                    CareSiteId = reader.GetLong(CareSiteId) ?? 0,
                    AdmittingSourceConceptId = admittingSourceConceptId ?? 0,
                    AdmittingSourceValue = admittingSourceValue,
                    DischargeToConceptId = dischargeToConceptId ?? 0,
                    DischargeToSourceValue = dischargeToSourceValue,
                    PrecedingVisitDetailId = reader.GetInt(PrecedingVisitDetailId)
                };
                if (id.HasValue)
                {
                    visitDetail.Id = id.Value;
                }
                else
                {
                    visitDetail.IdUndefined = true;
                }

                yield return visitDetail;
            }
        }
    }
}
