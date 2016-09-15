using System;

namespace org.ohdsi.cdm.framework.shared.Attributes
{
   public class IngredientLevelFileAttribute : Attribute
   {
      private readonly string value;

      public IngredientLevelFileAttribute(string value)
      {
         this.value = value;
      }

      public string Value
      {
         get { return this.value; }
      }
   }
}
