using System;
using System.Collections.Generic;

namespace org.ohdsi.cdm.framework.common.Extensions
{
    public static class DictionaryExtensions
    {
        public static TValue GetOrAdd<TKey, TValue>(
            this Dictionary<TKey, TValue> dict,
            TKey key, Func<TKey, TValue> generator,
            out bool added)
        {
            TValue value;
            while (true)
            {
                if (dict.TryGetValue(key, out value))
                {
                    added = false;
                    return value;
                }

                value = generator(key);
                if (!dict.ContainsKey(key))
                {
                    dict.Add(key, value);
                    added = true;
                    return value;
                }
            }
        }
    }
}
