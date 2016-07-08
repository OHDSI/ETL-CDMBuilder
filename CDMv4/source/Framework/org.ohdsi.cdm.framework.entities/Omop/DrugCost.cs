namespace org.ohdsi.cdm.framework.entities.Omop
{
   public class DrugCost : DrugExposure
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

      public DrugCost(DrugExposure ent)
         : base(ent)
      {
         Init(ent);

         Id = ent.Id;
         SourceRecordGuid = ent.SourceRecordGuid;
      }
   }
}
