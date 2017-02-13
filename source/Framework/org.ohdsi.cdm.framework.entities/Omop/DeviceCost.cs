using org.ohdsi.cdm.framework.shared.Enums;

namespace org.ohdsi.cdm.framework.entities.Omop
{
   public class DeviceCost : DeviceExposure
   {
      public long DeviceCostId { get; set; }
      public long? CurrencyConceptId { get; set; }

      public decimal? PaidCopay { get; set; }
      public decimal? PaidCoinsurance { get; set; }
      public decimal? PaidTowardDeductible { get; set; }
      public decimal? PaidByPayer { get; set; }
      public decimal? PaidByCoordinationBenefits { get; set; }
      public decimal? TotalOutOfPocket { get; set; }
      public decimal? TotalPaid { get; set; }

      public long? PayerPlanPeriodId { get; set; }

      public long? RevenueCodeConceptId { get; set; }
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
   }
}
