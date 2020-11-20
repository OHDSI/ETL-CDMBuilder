namespace org.ohdsi.cdm.framework.common.PregnancyAlgorithm
{
    public class GestEst
    {
        public int Id { get; set; }
        public string Category { get; set; }
        public int PreTerm { get; set; }
        public int PostTerm { get; set; }
        public int FullTerm { get; set; }
        public int NoData { get; set; }
    }
}