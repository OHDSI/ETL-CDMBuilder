using System;
using System.Collections.Generic;
using System.Data;
using org.ohdsi.cdm.framework.entities.Builder;
using org.ohdsi.cdm.framework.entities.Omop;
using org.ohdsi.cdm.framework.shared.Extensions;

namespace org.ohdsi.cdm.framework.core.Definitions
{
   public class VisitCostDefinition : VisitOccurrenceDefinition
   {
      public string CurrencyConceptId { get; set; }
      public string PaidCopay { get; set; }
      public string PaidCoinsurance { get; set; }
      public string PaidTowardDeductible { get; set; }
      public string PaidByPayer { get; set; }
      public string PaidByCoordinationBenefits { get; set; }
      public string TotalOutOfPocket { get; set; }
      public string TotalPaid { get; set; }

      public override IEnumerable<IEntity> GetConcepts(Concept concept, IDataRecord reader, KeyMasterOffset keyOffset)
      {
         throw new NotImplementedException();
      }

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
                      CurrencyConceptId = reader.GetLong(CurrencyConceptId)
                   };
      }
   }
}
