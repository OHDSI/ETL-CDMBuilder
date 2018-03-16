using System;
using System.Data;
using org.ohdsi.cdm.framework.shared.Extensions;

namespace org.ohdsi.cdm.framework.core.Definitions
{
   public class Condition1
   {
      private readonly string variableName;
      private readonly int value;
      private readonly string comparison;

      public Condition1(string expression)
      {
         var res = expression.Split(new[] { '=' }, StringSplitOptions.RemoveEmptyEntries);
         if (res.Length == 2)
         {
            comparison = "=";
         }
         else
         {
            res = expression.Split(new[] { '>' }, StringSplitOptions.RemoveEmptyEntries);
            if (res.Length == 2)
            {
               comparison = ">";
            }
            else
            {
               res = expression.Split(new[] { '<' }, StringSplitOptions.RemoveEmptyEntries);
               if (res.Length == 2)
               {
                  comparison = "<";
               }
            }
         }

         if (res.Length != 2 || string.IsNullOrEmpty(res[0]) || string.IsNullOrEmpty(res[1]))
            throw new Exception("Condition: Wrong parameters count");

         variableName = res[0].Replace("{", "").Replace("}", "").Trim();
         value = int.Parse(res[1]);
      }

      public bool Match(IDataRecord reader)
      {
         var soureValue = reader.GetInt(variableName);

         switch (comparison)
         {
            case "=":
               return soureValue == value;

            case ">":
               return soureValue > value;

            case "<":
               return soureValue < value;

            default:
               throw new Exception("Condition: incorrect match");
         }
      }
   }
}
