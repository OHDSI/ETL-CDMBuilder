using org.ohdsi.cdm.framework.shared.Enums;

namespace org.ohdsi.cdm.framework.entities.Omop
{
   public class DeviceCost : DeviceExposure, ICostV5
   {
      public long DeviceCostId { get; set; }
      public string DiseaseClassLookupKey { get; set; }
      public decimal? IngredientCost { get; set; }
      public decimal? DispensingFee { get; set; }
      public decimal? AverageWholesalePrice { get; set; }
      public long CurrencyConceptId { get; set; }

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

      public DeviceCost(DeviceExposure ent)
         : base(ent)
      {
         Init(ent);

         Id = ent.Id;
         SourceRecordGuid = ent.SourceRecordGuid;
      }

      public override EntityType GeEntityType()
      {
         return EntityType.DeviceCost;
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

            PayerPlanPeriodId = PayerPlanPeriodId,

            PaidPatientCopay = PaidCopay,
            PaidPatientCoinsurance = PaidCoinsurance,
            PaidPatientDeductible = PaidTowardDeductible,
            PaidByPrimary = PaidByCoordinationBenefits,

            TotalPaid = PaidCopay + PaidCoinsurance + PaidTowardDeductible + PaidByPayer + PaidByCoordinationBenefits,
            PaidByPatient = PaidCopay + PaidCoinsurance + PaidTowardDeductible,
            PaidByPayer = PaidByPayer,

            Domain = "Device",
            TypeId = 0,
            EventId = Id
         };
      }
   }
}
