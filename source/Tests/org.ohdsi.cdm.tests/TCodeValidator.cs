using NUnit.Framework;
using org.ohdsi.cdm.framework.shared.Validators;

namespace org.ohdsi.cdm.tests
{
   public class TCodeValidator
   {
      [Test]
      public void TestIcd9()
      {
         Assert.IsTrue(CodeValidator.IsValidIcd9("1234"));
         Assert.IsTrue(CodeValidator.IsValidIcd9("12345"));
         Assert.IsTrue(CodeValidator.IsValidIcd9("E123"));
         Assert.IsTrue(CodeValidator.IsValidIcd9("E1234"));
         Assert.IsTrue(CodeValidator.IsValidIcd9("012"));
         Assert.IsTrue(CodeValidator.IsValidIcd9("V12"));

         Assert.IsFalse(CodeValidator.IsValidIcd9("E12"));
         Assert.IsFalse(CodeValidator.IsValidIcd9("E12345"));
         Assert.IsFalse(CodeValidator.IsValidIcd9("E123A"));
         Assert.IsFalse(CodeValidator.IsValidIcd9("01"));
         Assert.IsFalse(CodeValidator.IsValidIcd9("V1"));
         Assert.IsFalse(CodeValidator.IsValidIcd9("012345"));
         Assert.IsFalse(CodeValidator.IsValidIcd9("V12345"));
      }
   }
}
