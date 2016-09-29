namespace org.ohdsi.cdm.framework.shared.Validators
{
   public class CodeValidator
   {
      public enum IcdVer
      {
         Icd9,
         Icd10
      }

      public static bool IsValidIcd(string code, IcdVer ver)
      {
         return ver == IcdVer.Icd9 ? IsValidIcd9(code) : IsValidIcd10(code);
      }

      public static bool IsValidIcdProcedure(string code, IcdVer ver)
      {
         return ver == IcdVer.Icd9 ? IsValidIcd9Procedure(code) : IsValidIcd10Procedure(code);
      }


      public static bool IsValidIcd10(string code)
      {
         return !string.IsNullOrWhiteSpace(code) && code.Length >= 3 && code.Length <= 7;
      }

      public static bool IsValidIcd9(string code)
      {
         if (string.IsNullOrWhiteSpace(code) || code.Length < 3 || code.Length > 5)
            return false;

         for (var i = 1; i < code.Length; i++)
         {
            if (!char.IsDigit(code[i]))
               return false;
         }

         var firstChar = code[0];
         int firstDigit;
         int.TryParse(firstChar.ToString(), out firstDigit);

         if (firstChar == 'E')
         {
            return code.Length >= 4 && code.Length <= 5;
         }

         if(firstChar == 'V' || (char.IsDigit(firstChar) && firstDigit >= 0 && firstDigit <= 9))
         {
            return code.Length >= 3 && code.Length <= 5;
         }

         return false;
      }

      public static bool IsValidIcd10Procedure(string code)
      {
         if (string.IsNullOrEmpty(code)) return false;

         return code.Length == 7;
      }

      public static bool IsValidIcd9Procedure(string code)
      {
         if (string.IsNullOrEmpty(code)) return false;

         if (code.Length < 2 || code.Length > 4 || !char.IsDigit(code[0]))
            return false;

         var digitCount = 0;
         var zeroCount = 0;
         foreach (var c in code)
         {
            if (char.IsDigit(c))
               digitCount++;

            if (c == '0')
               zeroCount++;
         }

         if (zeroCount == code.Length)
            return false;

         //return (digitCount >= 2 && digitCount <= 4);
         return true;
      }
   }
}
