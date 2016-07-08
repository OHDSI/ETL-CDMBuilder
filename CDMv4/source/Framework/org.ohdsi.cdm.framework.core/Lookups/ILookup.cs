namespace org.ohdsi.cdm.framework.core.Lookups
{
   interface ILookup
   {
      void Load();
      long? LookupValue(string sourceValue);
   }
}
