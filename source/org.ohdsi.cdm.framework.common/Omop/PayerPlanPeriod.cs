using org.ohdsi.cdm.framework.common.Enums;

namespace org.ohdsi.cdm.framework.common.Omop
{
    public class PayerPlanPeriod : EraEntity
    {
        public string FamilySourceValue { get; set; }

        public int PayerConceptId { get; set; }
        public int PayerSourceConceptId { get; set; }
        public string PayerSourceValue { get; set; }

        public int PlanConceptId { get; set; }
        public int PlanSourceConceptId { get; set; }
        public string PlanSourceValue { get; set; }

        public int SponsorConceptId { get; set; }
        public int SponsorSourceConceptId { get; set; }
        public string SponsorSourceValue { get; set; }

        public int StopReasonConceptId { get; set; }
        public int StopReasonSourceConceptId { get; set; }
        public string StopReasonSourceValue { get; set; }

        public long? ContractPersonId { get; set; }
        public int? ContractConceptId { get; set; }
        public string ContractSourceValue { get; set; }
        public int? ContractSourceConceptId { get; set; }

        public override EntityType GeEntityType()
        {
            return EntityType.PayerPlanPeriod;
        }
    }
}

