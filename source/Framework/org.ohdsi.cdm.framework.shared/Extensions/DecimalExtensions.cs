using System;

namespace org.ohdsi.cdm.framework.shared.Extensions
{
   public static class DecimalExtensions
   {
      public static decimal? Round(this decimal? input)
      {
         if (!input.HasValue)
            return null;

         return Math.Round(input.Value, 2, MidpointRounding.AwayFromZero);
      }
   }
}
