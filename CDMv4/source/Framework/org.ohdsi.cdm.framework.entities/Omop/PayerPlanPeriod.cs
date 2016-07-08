namespace org.ohdsi.cdm.framework.entities.Omop 
{
   public class PayerPlanPeriod : EraEntity
   {
      public string PayerSourceValue { get; set; }
      public string PlanSourceValue { get; set; }
      public string FamilySourceValue { get; set; }
   }
}
