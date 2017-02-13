using System;
using System.Collections.Generic;
using System.Data;
using org.ohdsi.cdm.framework.entities.Builder;
using org.ohdsi.cdm.framework.entities.Omop;
using org.ohdsi.cdm.framework.shared.Extensions;

namespace org.ohdsi.cdm.framework.core.Definitions
{
   public class DrugCostDefinition : ProcedureOccurrenceDefinition
   {
      public string PaidCopay { get; set; }
      public string PaidCoinsurance { get; set; }
      public string PaidTowardDeductible { get; set; }
      public string PaidByPayer { get; set; }
      public string PaidByCoordinationBenefits { get; set; }
      public string TotalOutOfPocket { get; set; }
      public string TotalPaid { get; set; }
      public string IngredientCost { get; set; }
      public string DispensingFee { get; set; }
      public string AverageWholesalePrice { get; set; }

      // CDM v5 props
      public string CurrencyConceptId { get; set; }

      public override IEnumerable<IEntity> GetConcepts(Concept concept, IDataRecord reader, KeyMasterOffset keyOffset)
      {
         throw new NotImplementedException();
      }

      public DrugCost CreateEnity(DrugExposure drugExposure, IDataRecord reader)
      {
         var paidCopay = reader.GetDecimal(PaidCopay);
         var paidCoinsurance = reader.GetDecimal(PaidCoinsurance);
         var paidTowardDeductible = reader.GetDecimal(PaidTowardDeductible);
         decimal? totalOutOfPocket = null;

         if (!string.IsNullOrEmpty(TotalOutOfPocket))
         {
            totalOutOfPocket = reader.GetDecimal(TotalOutOfPocket);
         }
         else
         {
            totalOutOfPocket = paidCopay + paidCoinsurance + paidTowardDeductible;
         }

         long? revenueCodeConceptId = null;
         string revenueCodeSource = null;
         if (Concepts != null)
         {
            if (Concepts.Length > 0)
            {
               var revenueCodeConcept = Concepts[0];

               if (revenueCodeConcept.Fields.Length > 0)
               {
                  revenueCodeSource = reader.GetString(revenueCodeConcept.Fields[0].Key);

                  var revenueConcepts = revenueCodeConcept.GetConceptIdValues(Vocabulary, revenueCodeConcept.Fields[0],
                     reader);
                  if (revenueConcepts.Count > 0)
                     revenueCodeConceptId = revenueConcepts[0].ConceptId;
               }
            }
         }

         return new DrugCost(drugExposure)
                   {
                      CurrencyConceptId = reader.GetLong(CurrencyConceptId),
                      PaidCopay = paidCopay,
                      PaidCoinsurance = paidCoinsurance,
                      PaidTowardDeductible = paidTowardDeductible,
                      PaidByPayer = reader.GetDecimal(PaidByPayer),
                      PaidByCoordinationBenefits = reader.GetDecimal(PaidByCoordinationBenefits),
                      TotalPaid = reader.GetDecimal(TotalPaid),
                      IngredientCost = reader.GetDecimal(IngredientCost),
                      DispensingFee = reader.GetDecimal(DispensingFee),
                      AverageWholesalePrice = reader.GetDecimal(AverageWholesalePrice),
                      TotalOutOfPocket = totalOutOfPocket,
                      RevenueCodeConceptId = revenueCodeConceptId,
                      RevenueCodeSourceValue = revenueCodeSource,
                   };
      }
   }
}
