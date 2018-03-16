using System;
using org.ohdsi.cdm.framework.shared.Enums;

namespace org.ohdsi.cdm.framework.entities.Omop
{
   public class MeasurementCost : Measurement, IEquatable<MeasurementCost>, ICostV5
   {
      public decimal? PaidCopay { get; set; }
      public decimal? PaidCoinsurance { get; set; }
      public decimal? PaidTowardDeductible { get; set; }
      public decimal? PaidByPayer { get; set; }
      public decimal? PaidByCoordinationBenefits { get; set; }
      public decimal? TotalOutOfPocket { get; set; }
      public decimal? TotalPaid { get; set; }
      public decimal? IngredientCost { get; set; }
      public decimal? DispensingFee { get; set; }
      public decimal? AverageWholesalePrice { get; set; }

      public long? PayerPlanPeriodId { get; set; }
      public long? DrgConceptId { get; set; }


      // CDM v5 props
      //public string DiseaseClassLookupKey { get; set; }
      public long CurrencyConceptId { get; set; }
      public long? RevenueCodeConceptId { get; set; }
      public string DrgSourceValue { get; set; }
      public string RevenueCodeSourceValue { get; set; }

      public MeasurementCost(Measurement ent)
         : base(ent)
      {
         Init(ent);

         Id = ent.Id;
         SourceRecordGuid = ent.SourceRecordGuid;
      }

      public bool Equals(MeasurementCost other)
      {
         return this.PaidCopay.Equals(other.PaidCopay) &&
                this.PaidCoinsurance == other.PaidCoinsurance &&
                this.PaidTowardDeductible == other.PaidTowardDeductible &&
                this.PaidByPayer == other.PaidByPayer &&
                this.PaidByCoordinationBenefits == other.PaidByCoordinationBenefits &&
                this.TotalOutOfPocket == other.TotalOutOfPocket &&
                this.TotalPaid == other.TotalPaid &&
                this.PayerPlanPeriodId == other.PayerPlanPeriodId &&
                this.IngredientCost == other.IngredientCost &&
                this.DispensingFee == other.DispensingFee &&
                this.AverageWholesalePrice == other.AverageWholesalePrice &&
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
                IngredientCost.GetHashCode() ^
                DispensingFee.GetHashCode() ^
                AverageWholesalePrice.GetHashCode() ^
                PayerPlanPeriodId.GetHashCode() ^
                CurrencyConceptId.GetHashCode();
      }

      public override EntityType GeEntityType()
      {
         return EntityType.MeasurementCost;
      }

      public Cost CreateCost(long costId)
      {
         return new Cost
         {
            CostId = costId,
            CurrencyConceptId = CurrencyConceptId,
            TotalCharge = null,
            TotalCost = null,
            RevenueCodeConceptId = RevenueCodeConceptId,
            RevenueCodeSourceValue = RevenueCodeSourceValue,

            DrgConceptId = DrgConceptId,
            DrgSourceValue = DrgSourceValue,

            PayerPlanPeriodId = PayerPlanPeriodId,

            PaidPatientCopay = PaidCopay,
            PaidPatientCoinsurance = PaidCoinsurance,
            PaidPatientDeductible = PaidTowardDeductible,
            PaidByPrimary = PaidByCoordinationBenefits,

            TotalPaid = PaidCopay + PaidCoinsurance + PaidTowardDeductible + PaidByPayer + PaidByCoordinationBenefits,
            PaidByPatient = PaidCopay + PaidCoinsurance + PaidTowardDeductible,
            PaidByPayer = PaidByPayer,

            Domain = "Measurement",
            TypeId = 0,
            EventId = Id
         };
      }
   }
}
