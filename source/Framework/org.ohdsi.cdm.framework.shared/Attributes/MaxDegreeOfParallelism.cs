using System;

namespace org.ohdsi.cdm.framework.shared.Attributes
{
   public class MaxDegreeOfParallelism : Attribute
   {
      private readonly int value;

      public MaxDegreeOfParallelism(int value)
      {
         this.value = value;
      }

      public int Value
      {
         get { return this.value; }
      }
   }
}
