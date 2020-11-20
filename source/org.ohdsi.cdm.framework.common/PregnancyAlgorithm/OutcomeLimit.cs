namespace org.ohdsi.cdm.framework.common.PregnancyAlgorithm
{
    public class OutcomeLimit
    {
        public int Id { get; set; }
        public string FirstPregCategory { get; set; }
        public string OutcomePregCategory { get; set; }
        public int MinDays { get; set; }
    }
}