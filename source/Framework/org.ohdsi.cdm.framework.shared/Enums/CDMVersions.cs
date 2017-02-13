using org.ohdsi.cdm.framework.shared.Attributes;

namespace org.ohdsi.cdm.framework.shared.Enums
{
   public enum CDMVersions
   {
      [Folder("v5")]
      [IngredientLevelFileAttribute("IngredientLevelV5.sql")]
      v5,

      [Folder("v5.01")]
      [IngredientLevelFileAttribute("IngredientLevelV5.sql")]
      v501
   }
}
