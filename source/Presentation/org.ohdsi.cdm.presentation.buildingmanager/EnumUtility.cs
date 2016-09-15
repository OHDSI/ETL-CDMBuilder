using System;
using System.ComponentModel;
using System.Linq;

namespace org.ohdsi.cdm.presentation.buildingmanager
{
   public static class EnumUtility
   {
      // Might want to return a named type, this is a lazy example (which does work though)
      public static object[] GetValuesAndDescriptions(Type enumType)
      {
         var values = Enum.GetValues(enumType).Cast<object>();
         var valuesAndDescriptions = from value in values
                                     select new
                                     {
                                        Value = value,
                                        Description = value.GetType()
                                            .GetMember(value.ToString())[0]
                                            .GetCustomAttributes(true)
                                            .OfType<DescriptionAttribute>()
                                            .First()
                                            .Description
                                     };
         return valuesAndDescriptions.ToArray();
      }
   }
}
