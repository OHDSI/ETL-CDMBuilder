using org.ohdsi.cdm.framework.common.Extensions;
using org.ohdsi.cdm.framework.common.Omop;
using System.Data;

namespace org.ohdsi.cdm.framework.common.Definitions
{
    public class MeasurementCostDefinition : CostDefinition
    {
        public MeasurementCost CreateEnity(Measurement measurement, IDataRecord reader)
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

            int? drgConceptId;
            string drgSource;
            int? revenueCodeConceptId;
            string revenueCodeSource;
            PopulateOthersConcepts(reader, out drgConceptId, out drgSource, out revenueCodeConceptId, out revenueCodeSource);

            return new MeasurementCost(measurement)
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
