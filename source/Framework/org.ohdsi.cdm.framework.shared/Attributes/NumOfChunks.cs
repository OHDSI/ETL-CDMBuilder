using System;

namespace org.ohdsi.cdm.framework.shared.Attributes
{
   public class NumOfChunks : Attribute
   {
      private readonly int value;

      public NumOfChunks(int value)
      {
         this.value = value;
      }

      public int Value
      {
         get { return this.value; }
      }
   }
}
