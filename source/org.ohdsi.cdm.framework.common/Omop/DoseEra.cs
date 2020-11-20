namespace org.ohdsi.cdm.framework.common.Omop
{
    public class DoseEra : EraEntity
    {
        public int UnitConceptId { get; set; }
        public decimal DoseValue { get; set; }
    }
}
