using System;
using System.Collections.Generic;
using NUnit.Framework;
using org.ohdsi.cdm.builders.premier;
using org.ohdsi.cdm.framework.core.Base;
using org.ohdsi.cdm.framework.entities.Builder;
using org.ohdsi.cdm.framework.entities.Omop;

namespace org.ohdsi.cdm.tests
{
   [TestFixture]
   public class TPersonBuilder
   {
      [Test]
      public void TestBuildPerson()
      {
         var builder = new PremierPersonBuilder(new ChunkBuilder(new ChunkData(), typeof(PremierPersonBuilder)));
         var personRecords = new List<Person>
         {
            new Person
            {
               PersonId = 1,
               StartDate = DateTime.Parse("2000-11-01"),
               EndDate = DateTime.Parse("2000-11-01"),
               GenderSourceValue = "F",
               GenderConceptId = 8532,
               YearOfBirth = 1968
            },
            new Person
            {
               PersonId = 1,
               StartDate = DateTime.Parse("2001-01-01"),
               EndDate = DateTime.Parse("2001-01-01"),
               GenderSourceValue = "F",
               GenderConceptId = 8532,
               YearOfBirth = 1967
            },
            new Person
            {
               PersonId = 1,
               StartDate = DateTime.Parse("2003-03-01"),
               EndDate = DateTime.Parse("2003-03-01"),
               GenderSourceValue = "F",
               GenderConceptId = 8532,
               YearOfBirth = 1999
            }
         };

         var person = builder.BuildPerson(personRecords);

         Assert.AreEqual("F", person.GenderSourceValue);
         Assert.AreEqual(8532, person.GenderConceptId);
         Assert.AreEqual(1999, person.YearOfBirth);
      }
   }
}
