using System;
using System.Collections.Concurrent;

namespace org.ohdsi.cdm.framework.shared.Extensions
{
   public static class ConcurrentDictionaryExtensions
   {
      public static TValue GetOrAdd<TKey, TValue>(
    this ConcurrentDictionary<TKey, TValue> dict,
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
            if (dict.TryAdd(key, value))
            {
               added = true;
               return value;
            }
         }
      }
   }
}
