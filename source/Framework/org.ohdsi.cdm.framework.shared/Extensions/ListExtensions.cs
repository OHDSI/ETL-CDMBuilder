using System;
using System.Collections.Generic;

namespace org.ohdsi.cdm.framework.shared.Extensions
{
   public static class ListExtensions
   {
       public static IList<T> Shuffle<T>(this IList<T> list)
       {
           var rng = new Random();
           var n = list.Count;
           while (n > 1)
           {
               n--;
               var k = rng.Next(n + 1);
               var value = list[k];
               list[k] = list[n];
               list[n] = value;
           }

           return list;
       }
   }
}
