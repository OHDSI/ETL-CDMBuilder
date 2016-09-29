using System;

namespace org.ohdsi.cdm.framework.shared.Attributes
{
   public class CDMSourceAttribute : Attribute
   {
      private readonly string value;

      public CDMSourceAttribute(string value)
      {
         this.value = value;
      }

      public string Value
      {
         get { return this.value; }
      }
   }
}
