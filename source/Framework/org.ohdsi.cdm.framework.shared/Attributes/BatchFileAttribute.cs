using System;

namespace org.ohdsi.cdm.framework.shared.Attributes
{
   public class BatchFileAttribute : Attribute
   {
      private readonly string value;

      public BatchFileAttribute(string value)
      {
         this.value = value;
      }

      public string Value
      {
         get { return this.value; }
      }
   }
}
