using System;
using org.ohdsi.cdm.framework.shared.Enums;

namespace org.ohdsi.cdm.framework.entities.Omop
{
   public class VisitCost : VisitOccurrence, IEquatable<VisitCost>
   {
      public long VisitCostId { get; set; }
      public long? CurrencyConceptId { get; set; }

      public decimal? PaidCopay { get; set; }
      public decimal? PaidCoinsurance { get; set; }
      public decimal? PaidTowardDeductible { get; set; }
      public decimal? PaidByPayer { get; set; }
      public decimal? PaidByCoordinationBenefits { get; set; }
      public decimal? TotalOutOfPocket { get; set; }
      public decimal? TotalPaid { get; set; }

      public long? PayerPlanPeriodId { get; set; }
      
      public VisitCost(VisitOccurrence ent)
         : base(ent)
      {
         Init(ent);

         Id = ent.Id;
         SourceRecordGuid = ent.SourceRecordGuid;
      }

      public bool Equals(VisitCost other)
      {
         return this.PaidCopay.Equals(other.PaidCopay) &&
                this.PaidCoinsurance == other.PaidCoinsurance &&
                this.PaidTowardDeductible == other.PaidTowardDeductible &&
                this.PaidByPayer == other.PaidByPayer &&
                this.PaidByCoordinationBenefits == other.PaidByCoordinationBenefits &&
                this.TotalOutOfPocket == other.TotalOutOfPocket &&
                this.TotalPaid == other.TotalPaid &&
                this.PayerPlanPeriodId == other.PayerPlanPeriodId &&
                this.CurrencyConceptId == other.CurrencyConceptId;
      }

      public override int GetHashCode()
      {
         return PaidCopay.GetHashCode() ^
                PaidCoinsurance.GetHashCode() ^
                PaidTowardDeductible.GetHashCode() ^
                PaidByPayer.GetHashCode() ^
                PaidByCoordinationBenefits.GetHashCode() ^
                TotalOutOfPocket.GetHashCode() ^
                TotalPaid.GetHashCode() ^
                PayerPlanPeriodId.GetHashCode() ^
                CurrencyConceptId.GetHashCode();
      }

      public override EntityType GeEntityType()
      {
         return EntityType.VisitCost;
      }
   }
}
