using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using org.ohdsi.cdm.framework.entities.Builder;
using org.ohdsi.cdm.framework.entities.Omop;
using org.ohdsi.cdm.framework.shared.Extensions;
using org.ohdsi.cdm.framework.shared.Helpers;

namespace org.ohdsi.cdm.framework.core.Definitions
{
   public class DrugExposureDefinition : EntityDefinition
   {
      public string DaysSupply { get; set; }
      public string Refill { get; set; }
      public string Quantity { get; set; }
      public string Sig { get; set; }
      public string DaysSupplyLookup { get; set; }
      public string RouteConceptId { get; set; }
      public string RouteSourceValue { get; set; }
      public string DoseUnitConceptId { get; set; }
      public string DoseUnitSourceValue { get; set; }
      public string StopReason { get; set; }

      // CDM v5.2 props
      public string VerbatimEndDate { get; set; }


      public override IEnumerable<IEntity> GetConcepts(Concept concept, IDataRecord reader, KeyMasterOffset keyOffset)
      {
         DateTime? endDate = null;
         
         long? routeConceptId = null;
         string routeSourceValue = null;
         if (Concepts.Length == 2)
         {
            var routeConcepts = base.GetConcepts(Concepts[1], reader, null).ToList();
            routeSourceValue = reader.GetString(Concepts[1].Fields[0].Key);
            if (routeConcepts.Count > 0)
            {
               routeConceptId = routeConcepts[0].ConceptId;
               routeSourceValue = routeConcepts[0].SourceValue;
            }
         }
         else
         {
            routeConceptId = reader.GetLong(RouteConceptId);
            routeSourceValue = reader.GetString(RouteSourceValue);
         }


         foreach (var c in base.GetConcepts(concept, reader, keyOffset))
         {
            var e = (Entity) c;

            var calculatedDaysSupply = GetDaysSupply(reader, e);
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
                               Id = keyOffset.DrugExposureId,
                               Refills = reader.GetInt(Refill),
                               DaysSupply = reader.GetInt(DaysSupply),
                               CalculatedDaysSupply = calculatedDaysSupply,
                               Quantity = reader.GetDecimal(Quantity),
                               Sig = reader.GetString(Sig),
                               EndDate = endDate == DateTime.MinValue ? null : endDate,
                               StartTime = e.StartTime ?? e.StartDate.ToString("HH:mm:ss", CultureInfo.InvariantCulture),
                               VerbatimEndDate = verbatimEndDate == DateTime.MinValue ? (DateTime?)null : verbatimEndDate,
                               GetEraConceptIdsCall = Vocabulary.LookupIngredientLevel,
                               RouteConceptId = routeConceptId,
                               RouteSourceValue = routeSourceValue,
                               DoseUnitConceptId = reader.GetLong(DoseUnitConceptId),
                               DoseUnitSourceValue = reader.GetString(DoseUnitSourceValue),
                               StopReason = reader.GetString(StopReason)
                            };

         }
      }

      private int GetDaysSupply(IDataRecord reader, Entity e)
      {
         var daysSupply = reader.GetInt(DaysSupply);

         if(!daysSupply.HasValue || daysSupply == 0)
         {
            // TODO : Create separate CPRDDrugExposureDefinition class and move this metod to new class
            if(!string.IsNullOrEmpty(DaysSupplyLookup))
            {
               int prodcode;
               if(!int.TryParse(e.AdditionalFields["prodcode"], out prodcode))
                  return 0;

               decimal ndd;
               decimal.TryParse(e.AdditionalFields["ndd"], out ndd);

               int numpacks;
               int.TryParse(e.AdditionalFields["numpacks"], out numpacks);

               decimal quantity = -1;
               if (e.AdditionalFields.ContainsKey("quantity"))
               {
                  decimal.TryParse(e.AdditionalFields["quantity"], out quantity);
               }

               var key = CompositeKeyHelper.GetCprdDaysSupplyKey(prodcode, ndd, quantity, numpacks);
               var result = Vocabulary.LookupDaysSupply(key, DaysSupplyLookup);
               if (!result.HasValue)
               {
                  key = CompositeKeyHelper.GetCprdDaysSupplyKey(prodcode);
                  result = Vocabulary.LookupDaysSupply(key, DaysSupplyLookup);
               }

               var ds = result.HasValue ? result.Value : 0;
               return ds > 365 ? 0 : ds;
            }
         }

         return daysSupply.HasValue ? daysSupply.Value : 0;
      }
   }
}
