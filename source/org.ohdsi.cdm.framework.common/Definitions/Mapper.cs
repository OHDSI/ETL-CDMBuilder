using org.ohdsi.cdm.framework.common.Lookups;
using System;
using System.Collections.Generic;
using System.Data;

namespace org.ohdsi.cdm.framework.common.Definitions
{
    public class Mapper
    {
        private Dictionary<string, int?> _fields;
        private Condition1 _condition;

        public string Lookup { get; set; }
        public string File { get; set; }
        public string Condition { get; set; }


        public Field[] Fields { get; set; }

        //public List<LookupValue> Map(IVocabulary vocabulary, string key, string source, DateTime eventDate,
        //    bool caseSensitive)
        //{
        //    if (!string.IsNullOrEmpty(Lookup))
        //    {
        //        return vocabulary.Lookup(source, Lookup, eventDate, caseSensitive);
        //    }

        //    return new List<LookupValue> {new LookupValue {ConceptId = _fields[key]}};
        //}

        //public List<LookupValue> Map(IVocabulary vocabulary, string key, string source, DateTime eventDate,
        //    bool caseSensitive)
        //{
        //    if (!string.IsNullOrEmpty(Lookup))
        //    {
        //        return vocabulary.Lookup(source, Lookup, eventDate);
        //    }

        //    return new List<LookupValue> { new LookupValue { ConceptId = _fields[key] } };
        //}

        public List<LookupValue> Map(IVocabulary vocabulary, string key, string source, DateTime eventDate)
        {
            if (!string.IsNullOrEmpty(Lookup))
            {
                return vocabulary.Lookup(source, Lookup, eventDate);
            }

            return new List<LookupValue> { new LookupValue { ConceptId = _fields[key] } };
        }

        public bool Match(IDataRecord reader)
        {
            if (_condition == null)
            {
                _condition = new Condition1(Condition);
            }

            return _condition.Match(reader);
        }
    }
}
