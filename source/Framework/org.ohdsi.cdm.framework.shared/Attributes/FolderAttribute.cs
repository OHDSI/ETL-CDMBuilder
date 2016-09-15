using System;

namespace org.ohdsi.cdm.framework.shared.Attributes
{
   public class FolderAttribute : Attribute
   {
      private readonly string value;

      public FolderAttribute(string value)
      {
         this.value = value;
      }

      public string Value
      {
         get { return this.value; }
      }
   }
}
