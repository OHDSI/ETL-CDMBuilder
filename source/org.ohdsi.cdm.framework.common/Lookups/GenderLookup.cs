using System;
using System.Collections.Generic;

namespace org.ohdsi.cdm.framework.common.Lookups
{
    public class GenderLookup
    {
        private readonly Dictionary<string, int> _lookup = new Dictionary<string, int>(StringComparer.OrdinalIgnoreCase);
        public void Load()
        {
            _lookup.Clear();
            _lookup.Add("", 8551); //UNKNOWN
            _lookup.Add("0", 8551); //UNKNOWN
            _lookup.Add("3", 8551); //UNKNOWN
            _lookup.Add("4", 8551); //UNKNOWN
            _lookup.Add("U", 8551); //UNKNOWN
            _lookup.Add("unknown", 8551); //UNKNOWN


            _lookup.Add("1", 8507); //MALE
            _lookup.Add("M", 8507); //MALE


            _lookup.Add("2", 8532); //FEMALE
            _lookup.Add("F", 8532); //FEMALE

            _lookup.Add("male", 8507); // MALE - JMDC
            _lookup.Add("female", 8532); // FEMALE - JMDC
        }

        public int? LookupValue(string sourceValue)
        {
            if (sourceValue == null) return null;

            if (_lookup.ContainsKey(sourceValue))
            {
                return _lookup[sourceValue];
            }

            return null;
        }
    }
}
