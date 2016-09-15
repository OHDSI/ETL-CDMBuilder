using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel;

namespace org.ohdsi.cdm.framework.core.Common.Services
{
   [ServiceBehavior(MaxItemsInObjectGraph = int.MaxValue, InstanceContextMode = InstanceContextMode.PerCall)]
   public class VocabularyService : IVocabularyService
   {
      public static Dictionary<string, long> providers = new Dictionary<string, long>(StringComparer.OrdinalIgnoreCase);

      public void AddProviders(KeyValuePair<string, long>[] values)
      {
         foreach (var value in values)
         {
            if (providers.ContainsKey(value.Key)) continue;

            providers.Add(value.Key, value.Value);
         }
      }

      public KeyValuePair<string, long>[] GetProviderIds(string[] sources)
      {
         return
            sources.Select(
               source =>
               providers.ContainsKey(source)
                  ? new KeyValuePair<string, long>(source, providers[source])
                  : new KeyValuePair<string, long>(source, -1)).ToArray();
      }
   }
}
