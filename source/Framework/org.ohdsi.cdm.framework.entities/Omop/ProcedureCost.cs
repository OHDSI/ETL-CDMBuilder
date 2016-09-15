using System;
using org.ohdsi.cdm.framework.shared.Enums;

namespace org.ohdsi.cdm.framework.entities.Omop
{
   public class ProcedureCost : ProcedureOccurrence, IEquatable<ProcedureCost>
   {
      public long ProcedureCostId { get; set; }

      public decimal? PaidCopay { get; set; }
      public decimal? PaidCoinsurance { get; set; }
      public decimal? PaidTowardDeductible { get; set; }
      public decimal? PaidByPayer { get; set; }
      public decimal? PaidByCoordinationBenefits { get; set; }
      public decimal? TotalOutOfPocket { get; set; }
      public decimal? TotalPaid { get; set; }

      public long? PayerPlanPeriodId { get; set; }

      public long? DiseaseClassConceptId { get; set; }
      public long? RevenueCodeConceptId { get; set; }
      public string DiseaseClassSourceValue { get; set; }
      public string RevenueCodeSourceValue { get; set; }

      public string DiseaseClassLookupKey { get; set; }

      // CDM v5 props
      public long CurrencyConceptId { get; set; }

      public ProcedureCost(ProcedureOccurrence ent)
         : base(ent)
      {
         Init(ent);

         Id = ent.Id;
         SourceRecordGuid = ent.SourceRecordGuid;
      }

      public bool Equals(ProcedureCost other)
      {
         return this.PaidCopay.Equals(other.PaidCopay) &&
                this.PaidCoinsurance == other.PaidCoinsurance &&
                this.PaidTowardDeductible == other.PaidTowardDeductible &&
                this.PaidByPayer == other.PaidByPayer &&
                this.PaidByCoordinationBenefits == other.PaidByCoordinationBenefits &&
                this.TotalOutOfPocket == other.TotalOutOfPocket &&
                this.TotalPaid == other.TotalPaid &&
                this.PayerPlanPeriodId == other.PayerPlanPeriodId &&
                this.DiseaseClassConceptId == other.DiseaseClassConceptId &&
                this.RevenueCodeConceptId == other.RevenueCodeConceptId &&
                this.DiseaseClassSourceValue == other.DiseaseClassSourceValue &&
                this.RevenueCodeSourceValue == other.RevenueCodeSourceValue &&
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
                DiseaseClassConceptId.GetHashCode() ^
                RevenueCodeConceptId.GetHashCode() ^
                (DiseaseClassSourceValue != null ? DiseaseClassSourceValue.GetHashCode() : 0) ^
                (RevenueCodeSourceValue != null ? RevenueCodeSourceValue.GetHashCode() : 0) ^
                CurrencyConceptId.GetHashCode();
      }

      public override EntityType GeEntityType()
      {
         return EntityType.ProcedureCost;
      }
   }
}
