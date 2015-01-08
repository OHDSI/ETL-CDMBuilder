namespace org.ohdsi.cdm.framework.entities.Omop
{
   public class ProcedureCost : ProcedureOccurrence
   {
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

      public ProcedureCost(ProcedureOccurrence ent)
         : base(ent)
      {
         Init(ent);

         Id = ent.Id;
         SourceRecordGuid = ent.SourceRecordGuid;
      }
   }
}
