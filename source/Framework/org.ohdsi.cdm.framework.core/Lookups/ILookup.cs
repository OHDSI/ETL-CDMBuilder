namespace org.ohdsi.cdm.framework.core.Lookups
{
   public interface ILookup
   {
      void Load();
      long? LookupValue(string sourceValue);
      string LookupSource(string key);
   }
}
