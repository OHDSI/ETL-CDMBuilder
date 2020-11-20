using org.ohdsi.cdm.framework.common.Extensions;
using org.ohdsi.cdm.framework.common.Omop;
using System.Data;

namespace org.ohdsi.cdm.framework.common.Definitions
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

            PopulateOthersConcepts(reader, out var drgConceptId, out var drgSource, out var revenueCodeConceptId,
                out var revenueCodeSource);

            return new ObservationCost(observation)
            {
                CurrencyConceptId = reader.GetInt(CurrencyConceptId) ?? 0,
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
