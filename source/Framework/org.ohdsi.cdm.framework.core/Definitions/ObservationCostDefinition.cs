using System.Data;
using org.ohdsi.cdm.framework.entities.Omop;
using org.ohdsi.cdm.framework.shared.Extensions;

namespace org.ohdsi.cdm.framework.core.Definitions
{
   public class ObservationCostDefinition : CostDefinition
   {
      public ObservationCost CreateEnity(Observation observation, IDataRecord reader)
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

         long? drgConceptId;
         string drgSource;
         long? revenueCodeConceptId;
         string revenueCodeSource;
         PopulateOthersConcepts(reader, out drgConceptId, out drgSource, out revenueCodeConceptId, out revenueCodeSource);

         return new ObservationCost(observation)
         {
            CurrencyConceptId = reader.GetLong(CurrencyConceptId) ?? 0,
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
            DrgConceptId = drgConceptId,
            DrgSourceValue = drgSource,
            RevenueCodeConceptId = revenueCodeConceptId,
            RevenueCodeSourceValue = revenueCodeSource,
         };
      }
   }
}
