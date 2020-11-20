using org.ohdsi.cdm.framework.common.Builder;
using org.ohdsi.cdm.framework.common.Extensions;
using org.ohdsi.cdm.framework.common.Omop;
using System.Data;

namespace org.ohdsi.cdm.framework.common.Definitions
{
    public class ProcedureCostDefinition : CostDefinition
    {
        public ProcedureCost CreateEnity(ProcedureOccurrence procedure, IDataRecord reader,
            KeyMasterOffsetManager offset)
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

            PopulateOthersConcepts(reader, out var drgConceptId, out var drgSource, out var revenueCodeConceptId,
                out var revenueCodeSource);

            return new ProcedureCost(procedure)
            {
                ProcedureCostId = offset.GetKeyOffset(procedure.PersonId).ProcedureCostId,
                PaidCopay = paidCopay,
                PaidCoinsurance = paidCoinsurance,
                PaidTowardDeductible = paidTowardDeductible,
                PaidByPayer = reader.GetDecimal(PaidByPayer),
                PaidByCoordinationBenefits = reader.GetDecimal(PaidByCoordinationBenefits),
                TotalPaid = reader.GetDecimal(TotalPaid),
                TotalOutOfPocket = totalOutOfPocket,
                RevenueCodeConceptId = revenueCodeConceptId,
                RevenueCodeSourceValue = revenueCodeSource,
                DrgConceptId = drgConceptId,
                DrgSourceValue = drgSource,
                CurrencyConceptId = reader.GetInt(CurrencyConceptId) ?? 0
            };
        }
    }
}
