using System;

namespace org.ohdsi.cdm.framework.shared.Attributes
{
   public class ChunkSize : Attribute
   {
      private readonly int value;

      public ChunkSize(int value)
      {
         this.value = value;
      }

      public int Value
      {
         get { return this.value; }
      }
   }
}
