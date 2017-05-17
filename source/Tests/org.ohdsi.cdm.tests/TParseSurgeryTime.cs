using System;
using System.Linq;
using NUnit.Framework;
using org.ohdsi.cdm.builders.premier_v5;

namespace org.ohdsi.cdm.tests
{
   public class TParseSurgeryTime
   {
      [Test]
      public void Test()
      {
         Assert.AreEqual(15, PremierV5PersonBuilder.GetMinutes("OR MINOR ADDL 15 MIN"));
         Assert.AreEqual(60, PremierV5PersonBuilder.GetMinutes("OR MINOR EMERGENCY 1ST HR"));
         Assert.AreEqual(255, PremierV5PersonBuilder.GetMinutes("OR OPEN HEART 4 HR 15 MIN"));
         Assert.AreEqual(6 * 60, PremierV5PersonBuilder.GetMinutes("OR MAJOR 6 HR"));
         Assert.AreEqual(30, PremierV5PersonBuilder.GetMinutes("OR MINOR 1ST 30 MIN"));
      }
   }
}
