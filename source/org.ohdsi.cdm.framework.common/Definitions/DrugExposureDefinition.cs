using org.ohdsi.cdm.framework.common.Builder;
using org.ohdsi.cdm.framework.common.Extensions;
using org.ohdsi.cdm.framework.common.Omop;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;

namespace org.ohdsi.cdm.framework.common.Definitions
{
    public class DrugExposureDefinition : EntityDefinition
    {
        public string DaysSupply { get; set; }
        public string Refill { get; set; }
        public string Quantity { get; set; }
        public string Sig { get; set; }

        public string RouteConceptId { get; set; }
        public string RouteSourceValue { get; set; }
        public string DoseUnitConceptId { get; set; }
        public string DoseUnitSourceValue { get; set; }
        public string StopReason { get; set; }

        // CDM v5.2 props
        public string VerbatimEndDate { get; set; }


        public override IEnumerable<IEntity> GetConcepts(Concept concept, IDataRecord reader, KeyMasterOffsetManager offset)
        {
            DateTime? endDate = null;

            int routeConceptId = 0;
            string routeSourceValue = null;
            if (Concepts != null && Concepts.Length == 2)
            {
                var routeConcept = Concepts.FirstOrDefault(c => c.Name == "RouteConceptId");
                if (routeConcept == null)
                    routeConcept = Concepts[1];

                var routeConcepts = base.GetConcepts(routeConcept, reader, null).ToList();
                routeSourceValue = reader.GetString(routeConcept.Fields[0].Key);
                if (routeConcepts.Count > 0)
                {
                    routeConceptId = routeConcepts[0].ConceptId;
                    routeSourceValue = routeConcepts[0].SourceValue;
                }
            }
            else
            {
                routeConceptId = reader.GetInt(RouteConceptId) ?? 0;
                routeSourceValue = reader.GetString(RouteSourceValue);
            }


            foreach (var c in base.GetConcepts(concept, reader, offset))
            {
                var e = (Entity)c;

                var calculatedDaysSupply = reader.GetInt(DaysSupply) ?? 0;
                if (!string.IsNullOrEmpty(EndDate))
                {
                    if (calculatedDaysSupply > 0 && calculatedDaysSupply <= 365)
                        endDate = e.StartDate.AddDays(calculatedDaysSupply - 1);
                    else
                        endDate = reader.GetDateTime(EndDate);
                }

                var verbatimEndDate = reader.GetDateTime(VerbatimEndDate);

                yield return new DrugExposure(e)
                {
                    Id = offset.GetKeyOffset(e.PersonId).DrugExposureId,
                    Refills = reader.GetIntSafe(Refill),
                    DaysSupply = reader.GetInt(DaysSupply),
                    CalculatedDaysSupply = calculatedDaysSupply,
                    Quantity = reader.GetDecimal(Quantity),
                    Sig = reader.GetString(Sig),
                    EndDate = endDate == DateTime.MinValue ? null : endDate,
                    VerbatimEndDate = verbatimEndDate == DateTime.MinValue ? (DateTime?)null : verbatimEndDate,
                    RouteConceptId = routeConceptId,
                    RouteSourceValue = routeSourceValue,
                    DoseUnitConceptId = reader.GetInt(DoseUnitConceptId) ?? 0,
                    DoseUnitSourceValue = reader.GetString(DoseUnitSourceValue),
                    StopReason = reader.GetString(StopReason)
                };

            }
        }


    }
}
