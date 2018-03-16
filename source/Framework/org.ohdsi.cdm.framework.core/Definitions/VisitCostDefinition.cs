using System.Data;
using org.ohdsi.cdm.framework.entities.Builder;
using org.ohdsi.cdm.framework.entities.Omop;
using org.ohdsi.cdm.framework.shared.Extensions;

namespace org.ohdsi.cdm.framework.core.Definitions
{
   public class VisitCostDefinition : CostDefinition
   {
      public VisitCost CreateEnity(VisitOccurrence visit, IDataRecord reader, KeyMasterOffset keyOffset)
      {
         var paidCopay = reader.GetDecimal(PaidCopay);
         var paidCoinsurance = reader.GetDecimal(PaidCoinsurance);
         var paidTowardDeductible = reader.GetDecimal(PaidTowardDeductible);

         decimal? totalOutOfPocket = null;

         if (paidCopay.HasValue && paidCoinsurance.HasValue && paidTowardDeductible.HasValue)
         {
            totalOutOfPocket = paidCopay + paidCoinsurance + paidTowardDeductible;
         }
         else if (paidCoinsurance.HasValue && paidTowardDeductible.HasValue)
         {
            totalOutOfPocket = paidCoinsurance + paidTowardDeductible;
         }

         long? drgConceptId;
         string drgSource;
         long? revenueCodeConceptId;
         string revenueCodeSource;
         PopulateOthersConcepts(reader, out drgConceptId, out drgSource, out revenueCodeConceptId, out revenueCodeSource);

         return new VisitCost(visit)
         {
            VisitCostId = keyOffset.VisitCostId,
            PaidCopay = paidCopay,
            PaidCoinsurance = paidCoinsurance,
            PaidTowardDeductible = paidTowardDeductible,
            PaidByPayer = reader.GetDecimal(PaidByPayer),
            PaidByCoordinationBenefits = reader.GetDecimal(PaidByCoordinationBenefits),
            TotalPaid = reader.GetDecimal(TotalPaid),
            TotalOutOfPocket = totalOutOfPocket,
            CurrencyConceptId = reader.GetLong(CurrencyConceptId) ?? 0,
            DrgConceptId = drgConceptId,
            DrgSourceValue = drgSource,
            RevenueCodeConceptId = revenueCodeConceptId,
            RevenueCodeSourceValue = revenueCodeSource
         };
      }
   }
}
