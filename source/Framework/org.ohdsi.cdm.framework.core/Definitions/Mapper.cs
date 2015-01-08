using System;
using System.Collections.Generic;
using System.Data;
using org.ohdsi.cdm.framework.core.Lookups;

namespace org.ohdsi.cdm.framework.core.Definitions
{
   public class Mapper
   {
      private Dictionary<string, int?> fields;
      public string Lookup { get; set; }
      public string File { get; set; }
      public string Condition { get; set; }
      private Condition condition;

      public Field[] Fields { get; set; }

      public List<LookupValue> Map(Vocabulary vocabulary, string key, string source, DateTime eventDate)
      {
         if (!string.IsNullOrEmpty(Lookup))
         {
            return vocabulary.Lookup(source, Lookup, eventDate);
         }

         if (!string.IsNullOrEmpty(File))
         {
            var list = new List<LookupValue>
            {
               new LookupValue {ConceptId = vocabulary.ReferenceFileLookup(File, source)}
            };
            return list;
         }

         return new List<LookupValue> {new LookupValue {ConceptId = fields[key]}};
      }

      public bool Match(IDataReader reader)
      {
         if (condition == null)
         {
            condition = new Condition(Condition);
         }

         return condition.Match(reader);
      }
   }
}
