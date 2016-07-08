namespace org.ohdsi.cdm.framework.core.Lookups
{
    public class GenderLookup : BaseLookup
    {
       public override void Load()
       {
          lookup.Clear();
          lookup.Add("", 8551); //UNKNOWN
          lookup.Add("0", 8551); //UNKNOWN
          lookup.Add("3", 8551); //UNKNOWN
          lookup.Add("4", 8551); //UNKNOWN
          lookup.Add("U", 8551); //UNKNOWN
          

          lookup.Add("1", 8507); //MALE
          lookup.Add("M", 8507); //MALE
          

          lookup.Add("2", 8532); //FEMALE
          lookup.Add("F", 8532); //FEMALE
          
       }
    }
}
