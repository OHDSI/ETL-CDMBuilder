using org.ohdsi.cdm.framework.common.Extensions;
using System;
using System.Collections.Generic;
using System.Linq;

namespace org.ohdsi.cdm.framework.common.Lookups
{
    public class Lookup
    {
        private Dictionary<string, Dictionary<int, LookupValue>> _lookup;

        public int KeysCount
        {
            get
            {
                if (_lookup == null)
                    return 0;

                return _lookup.Keys.Count;
            }
        }

        public Lookup(int capacity)
        {
            _lookup = new Dictionary<string, Dictionary<int, LookupValue>>(capacity, StringComparer.OrdinalIgnoreCase);
        }

        public Lookup()
        {
            _lookup = new Dictionary<string, Dictionary<int, LookupValue>>(StringComparer.OrdinalIgnoreCase);
        }

        public void Add(LookupValue lv)
        {
            if (!_lookup.ContainsKey(lv.SourceCode))
                _lookup.Add(lv.SourceCode, new Dictionary<int, LookupValue>());

            if (!_lookup[lv.SourceCode].ContainsKey(lv.ConceptId.Value))
            {
                _lookup[lv.SourceCode].Add(lv.ConceptId.Value, lv);
            }

            if (lv.Ingredients != null && lv.Ingredients.Count > 0)
                _lookup[lv.SourceCode][lv.ConceptId.Value].Ingredients.Add(lv.Ingredients.First());
        }

        public IEnumerable<LookupValue> LookupValues(string sourceCode, DateTime? eventDate)
        {
            if (_lookup.ContainsKey(sourceCode))
            {
                foreach (var lookupValue in GetValues(sourceCode, eventDate))
                    yield return lookupValue;
            }
            else
                yield return new LookupValue { ConceptId = null };
        }

        private IEnumerable<LookupValue> GetValues(string sourceCode, DateTime? eventDate)
        {
            foreach (var conceptId in _lookup[sourceCode].Keys)
            {
                var l = _lookup[sourceCode][conceptId];

                if (l.ConceptId == -1)
                    l.ConceptId = null;

                if (!eventDate.HasValue || eventDate.Value == DateTime.MinValue)
                {
                    yield return l;
                }
                else
                {
                    if (eventDate.Value.Between(l.ValidStartDate, l.ValidEndDate))
                    {
                        yield return l;
                    }
                    else
                    {
                        if (l.ConceptId.HasValue)
                            l.ConceptId = 0;

                        yield return l;
                    }
                }
            }
        }

    }
}
