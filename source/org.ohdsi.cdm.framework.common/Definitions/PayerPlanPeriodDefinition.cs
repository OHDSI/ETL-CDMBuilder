using org.ohdsi.cdm.framework.common.Builder;
using org.ohdsi.cdm.framework.common.Extensions;
using org.ohdsi.cdm.framework.common.Omop;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;

namespace org.ohdsi.cdm.framework.common.Definitions
{
    public class PayerPlanPeriodDefinition : EntityDefinition
    {
        public string PayerSource { get; set; }
        public string PlanSource { get; set; }
        public string FamilySource { get; set; }

        public override IEnumerable<IEntity> GetConcepts(Concept concept, IDataRecord reader,
            KeyMasterOffsetManager keyOffset)
        {
            var personId = reader.GetLong(PersonId);

            var startDate = reader.GetDateTime(StartDate);
            var endDate = reader.GetDateTime(EndDate);
            long? id = 0;

            if (!string.IsNullOrEmpty(Id))
            {
                id = reader.GetLong(Id);
            }

            if (personId.HasValue)
            {
                Dictionary<string, string> additionalFields = null;
                if (AdditionalFields != null)
                {
                    additionalFields =
                        new Dictionary<string, string>(AdditionalFields.Length, StringComparer.OrdinalIgnoreCase);
                    foreach (var additionalField in AdditionalFields)
                    {
                        additionalFields.Add(additionalField, reader.GetString(additionalField));
                    }
                }

                var payerSourceValue = reader.GetString(PayerSource);
                if (string.IsNullOrWhiteSpace(payerSourceValue))
                    payerSourceValue = null;

                var planSource = reader.GetString(PlanSource);
                if (string.IsNullOrWhiteSpace(planSource))
                    planSource = null;

                int payerConceptId = 0;
                int payerSourceConceptId = 0;

                int planConceptId = 0;
                int planSourceConceptId = 0;

                int sponsorConceptId = 0;
                int sponsorSourceConceptId = 0;
                string sponsorSource = null;

                int stopReasonConceptId = 0;
                int stopReasonSourceConceptId = 0;
                string stopReasonSource = null;

                if (Concepts != null && Concepts.Length > 0) // payer_concept_id
                {
                    var payerConcepts = base.GetConcepts(Concepts[0], reader, null).ToList();
                    payerSourceValue = reader.GetString(Concepts[0].Fields[0].Key);

                    if (payerConcepts.Count > 0)
                    {
                        payerConceptId = payerConcepts[0].ConceptId;
                        payerSourceConceptId = payerConcepts[0].SourceConceptId;
                    }
                }

                if (Concepts != null && Concepts.Length > 1) // plan_concept_id
                {
                    var planConcepts = base.GetConcepts(Concepts[1], reader, null).ToList();
                    planSource = reader.GetString(Concepts[1].Fields[0].Key);

                    if (planConcepts.Count > 0)
                    {
                        planConceptId = planConcepts[0].ConceptId;
                        planSourceConceptId = planConcepts[0].SourceConceptId;
                    }
                }

                if (Concepts != null && Concepts.Length > 2) //sponsor_concept_id
                {
                    var sponsorConcepts = base.GetConcepts(Concepts[2], reader, null).ToList();
                    sponsorSource = reader.GetString(Concepts[2].Fields[0].Key);

                    if (sponsorConcepts.Count > 0)
                    {
                        sponsorConceptId = sponsorConcepts[0].ConceptId;
                        sponsorSourceConceptId = sponsorConcepts[0].SourceConceptId;
                    }
                }

                if (Concepts != null && Concepts.Length > 3) //stop_reason_concept_id
                {
                    var stopReasonConcepts = base.GetConcepts(Concepts[3], reader, null).ToList();
                    stopReasonSource = reader.GetString(Concepts[3].Fields[0].Key);

                    if (stopReasonConcepts.Count > 0)
                    {
                        stopReasonConceptId = stopReasonConcepts[0].ConceptId;
                        stopReasonSourceConceptId = stopReasonConcepts[0].SourceConceptId;
                    }
                }

                yield return new PayerPlanPeriod
                {
                    Id = id ?? 0,
                    PersonId = personId.Value,
                    StartDate = startDate,
                    EndDate = endDate,
                    PayerConceptId = payerConceptId,
                    PayerSourceConceptId = payerSourceConceptId,
                    PayerSourceValue = payerSourceValue,
                    PlanConceptId = planConceptId,
                    PlanSourceConceptId = planSourceConceptId,
                    PlanSourceValue = planSource,
                    SponsorConceptId = sponsorConceptId,
                    SponsorSourceConceptId = sponsorSourceConceptId,
                    SponsorSourceValue = sponsorSource,
                    StopReasonConceptId = stopReasonConceptId,
                    StopReasonSourceConceptId = stopReasonSourceConceptId,
                    StopReasonSourceValue = stopReasonSource,
                    FamilySourceValue = reader.GetString(FamilySource),
                    VisitOccurrenceId = reader.GetLong(VisitOccurrenceId),
                    AdditionalFields = additionalFields
                };
            }
        }
    }
}
