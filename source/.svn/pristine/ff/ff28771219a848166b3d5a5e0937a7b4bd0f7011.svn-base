using System;
using System.Collections.Generic;
using System.Linq;
using NUnit.Framework;
using org.ohdsi.cdm.builders.premier;
using org.ohdsi.cdm.framework.core.Base;
using org.ohdsi.cdm.framework.entities.Builder;
using org.ohdsi.cdm.framework.entities.Omop;

namespace org.ohdsi.cdm.tests
{
   [TestFixture]
   public class TPremierPersonBuilder
   {
      [Test]
      public void TestBuildPersonGender()
      {
         var buider = new PremierPersonBuilder(new ChunkBuilder(new ChunkData(), typeof(PremierPersonBuilder)));

         var persons = new List<Person>();
         persons.Add(new Person(new Entity()) {GenderConceptId = 1});
         persons.Add(new Person(new Entity()) {GenderConceptId = 2});

         var result = buider.BuildPerson(persons);
         Assert.IsNull(result);
      }

      [Test]
      public void TestBuildPersonYearOfBirth()
      {
         var buider = new PremierPersonBuilder(new ChunkBuilder(new ChunkData(), typeof(PremierPersonBuilder)));

         var persons = new List<Person>
         {
            new Person(new Entity()) {YearOfBirth = 2001},
            new Person(new Entity()) {YearOfBirth = 1999},
            new Person(new Entity()) {YearOfBirth = 2000}
         };

         var result = buider.BuildPerson(persons);
         Assert.AreEqual(2001, result.YearOfBirth);
      }

      [Test]
      public void TestBuildPersonRace()
      {
         var buider = new PremierPersonBuilder(new ChunkBuilder(new ChunkData(), typeof(PremierPersonBuilder)));

         var persons = new List<Person>();
         persons.Add(new Person(new Entity()) {RaceSourceValue = "1", YearOfBirth = 2001});
         persons.Add(new Person(new Entity()) {RaceSourceValue = "1", YearOfBirth = 2001});
         persons.Add(new Person(new Entity()) {RaceSourceValue = "3", YearOfBirth = 2001});
         persons.Add(new Person(new Entity()) {RaceSourceValue = "1", YearOfBirth = 2001});
         persons.Add(new Person(new Entity()) {RaceSourceValue = "2", YearOfBirth = 2001});
         persons.Add(new Person(new Entity()) {RaceSourceValue = "2", YearOfBirth = 2001});

         var result = buider.BuildPerson(persons);
         Assert.AreEqual("1", result.RaceSourceValue);
      }

      [Test]
      public void TestBuildVisitOccurrences()
      {
         var builder = new PremierPersonBuilder(new ChunkBuilder(new ChunkData(), typeof(PremierPersonBuilder)));

         var visitOccurrences = GetVisitOccurrences();

         foreach (var visitOccurrence in visitOccurrences)
         {
            var de = new DrugExposure(visitOccurrence) {AdditionalFields = new Dictionary<string, string>()};
            de.AdditionalFields.Add("serv_day", visitOccurrence.AdditionalFields["max_serv_day"]);
            de.VisitOccurrenceId = visitOccurrence.Id;
            builder.AddData(de);
         }

         var result = builder.BuildVisitOccurrences(visitOccurrences, new List<ObservationPeriod>().ToArray()).ToList();

         Assert.AreEqual(1175536237, result[0].Id);
         Assert.AreEqual(new DateTime(2010, 10, 1), result[0].StartDate);
         Assert.AreEqual(new DateTime(2010, 10, 4), result[0].EndDate);

         Assert.AreEqual(1228455080, result[1].Id);
         Assert.AreEqual(new DateTime(2010, 10, 23), result[1].StartDate);
         Assert.AreEqual(new DateTime(2010, 11, 1), result[1].EndDate);

         Assert.AreEqual(1430830346, result[2].Id);
         Assert.AreEqual(new DateTime(2011, 1, 1), result[2].StartDate);
         Assert.AreEqual(new DateTime(2011, 1, 7), result[2].EndDate);

         Assert.AreEqual(1511534818, result[3].Id);
         Assert.AreEqual(new DateTime(2011, 2, 1), result[3].StartDate);
         Assert.AreEqual(new DateTime(2011, 2, 6), result[3].EndDate);

         Assert.AreEqual(1560724070, result[4].Id);
         Assert.AreEqual(new DateTime(2011, 2, 13), result[4].StartDate);
         Assert.AreEqual(new DateTime(2011, 4, 1), result[4].EndDate);

         Assert.AreEqual(1569075673, result[5].Id);
         Assert.AreEqual(new DateTime(2011, 5, 1), result[5].StartDate);
         Assert.AreEqual(new DateTime(2011, 5, 8), result[5].EndDate);

         Assert.AreEqual(1568584891, result[6].Id);
         Assert.AreEqual(new DateTime(2011, 5, 9), result[6].StartDate);
         Assert.AreEqual(new DateTime(2011, 5, 11), result[6].EndDate);

         Assert.AreEqual(1606647218, result[7].Id);
         Assert.AreEqual(new DateTime(2011, 7, 1), result[7].StartDate);
         Assert.AreEqual(new DateTime(2011, 7, 3), result[7].EndDate);

         Assert.AreEqual(1606676096, result[8].Id);
         Assert.AreEqual(new DateTime(2011, 7, 4), result[8].StartDate);
         Assert.AreEqual(new DateTime(2011, 7, 10), result[8].EndDate);

         Assert.AreEqual(1649550323, result[9].Id);
         Assert.AreEqual(new DateTime(2011, 8, 1), result[9].StartDate);
         Assert.AreEqual(new DateTime(2011, 8, 10), result[9].EndDate);

         Assert.AreEqual(1649545709, result[10].Id);
         Assert.AreEqual(new DateTime(2011, 8, 11), result[10].StartDate);
         Assert.AreEqual(new DateTime(2011, 8, 21), result[10].EndDate);

         Assert.AreEqual(1856443013, result[11].Id);
         Assert.AreEqual(new DateTime(2011, 10, 1), result[11].StartDate);
         Assert.AreEqual(new DateTime(2011, 10, 10), result[11].EndDate);
      }

      [Test]
      public void TestBuildVisitOccurrences1()
      {
         var builder = new PremierPersonBuilder(new ChunkBuilder(new ChunkData(), typeof(PremierPersonBuilder)));

         var visitOccurrences = GetVisitOccurrences1();

         foreach (var visitOccurrence in visitOccurrences)
         {
            var de = new DrugExposure(visitOccurrence) { AdditionalFields = new Dictionary<string, string>() };
            de.AdditionalFields.Add("serv_day", visitOccurrence.AdditionalFields["max_serv_day"]);
            de.VisitOccurrenceId = visitOccurrence.Id;
            builder.AddData(de);
         }

         var result = builder.BuildVisitOccurrences(visitOccurrences, new List<ObservationPeriod>().ToArray()).ToList();

         Assert.AreEqual(9625131, result[0].Id);
         Assert.AreEqual(new DateTime(2011, 3, 1), result[0].StartDate);
         Assert.AreEqual(new DateTime(2011, 3, 1), result[0].EndDate);

         Assert.AreEqual(2049445909, result[1].Id);
         Assert.AreEqual(new DateTime(2011, 11, 30), result[1].StartDate);
         Assert.AreEqual(new DateTime(2012, 1, 1), result[1].EndDate);

         Assert.AreEqual(9652529, result[2].Id);
         Assert.AreEqual(new DateTime(2012, 2, 22), result[2].StartDate);
         Assert.AreEqual(new DateTime(2012, 3, 1), result[2].EndDate);

         Assert.AreEqual(57308877, result[3].Id);
         Assert.AreEqual(new DateTime(2012, 9, 1), result[3].StartDate);
         Assert.AreEqual(new DateTime(2012, 9, 1), result[3].EndDate);
      }

      [Test]
      public void TestPremierPersonUniqueEntities()
      {
         var conditionOccurrences = new List<ConditionOccurrence>();
         var drugExposures = new List<DrugExposure>();
         var visitOccurrences = new Dictionary<long, VisitOccurrence>();
         var builder = new PremierPersonBuilder(new ChunkBuilder(new ChunkData(), typeof(PremierPersonBuilder)));

         var ent = new Entity
         {
            Id = 1,
            ConceptId = 1,
            PersonId = 1,
            ProviderId = 1,
            VisitOccurrenceId = 1,
            StartDate = new DateTime(2013, 1, 1),
            EndDate = new DateTime(2013, 1, 1),
            TypeConceptId = 1,
            SourceValue = "1"
         };
         var visitOccurrence =
            new VisitOccurrence(new Entity
            {
               PersonId = 1,
               StartDate = new DateTime(2000, 1, 1),
               EndDate = new DateTime(2020, 1, 1)
            })
            {
               AdditionalFields = new Dictionary<string, string> {{"disc_mon_seq", "1"}},
               Id = 1
            };

         visitOccurrences.Add(visitOccurrence.Id, visitOccurrence);

         conditionOccurrences.Add(new ConditionOccurrence(ent));
         conditionOccurrences.Add(new ConditionOccurrence(ent));

         drugExposures.Add(new DrugExposure(new Entity
         {
            PersonId = 1,
            ConceptId = 535714,
            VisitOccurrenceId = 1,
            TypeConceptId = 38000179,
            SourceValue = "90384"
         }
            ));
         drugExposures.Add(new DrugExposure(new Entity
         {
            PersonId = 1,
            ConceptId = 535714,
            VisitOccurrenceId = 1,
            TypeConceptId = 38000179,
            SourceValue = "99.11"
         }
            ));


         var coResult = builder.BuildConditionOccurrences(conditionOccurrences.ToArray(), visitOccurrences, new ObservationPeriod[] {});
         var deResult = builder.BuildDrugExposures(drugExposures.ToArray(), visitOccurrences, new ObservationPeriod[] { });

         Assert.AreEqual(1, coResult.Count());
         Assert.AreEqual(2, deResult.Count());
      }

      private static VisitOccurrence[] GetVisitOccurrences1()
      {
         var list =  new List<VisitOccurrence>
            {
               new VisitOccurrence(new Entity())
                  {
                     Id = 9625131,
                     PersonId = 2049445909,
                     AdditionalFields = new Dictionary<string, string> {{"max_serv_day", "1"}, {"disc_mon_seq", "2"}},
                     StartDate = new DateTime(2012, 3, 1),
                     EndDate = new DateTime(2011, 3, 1),
                  },
                  new VisitOccurrence(new Entity())
                  {
                     Id = 9652529,
                     PersonId = 2049445909,
                     AdditionalFields = new Dictionary<string, string> {{"max_serv_day", "9"}, {"disc_mon_seq", "1"}},
                     StartDate = new DateTime(2012, 2, 1),
                     EndDate = new DateTime(2012, 3, 1),
                  },
                  new VisitOccurrence(new Entity())
                  {
                     Id = 2049445909,
                     PersonId = 2049445909,
                     AdditionalFields = new Dictionary<string, string> {{"max_serv_day", "33"}, {"disc_mon_seq", "1"}},
                     StartDate = new DateTime(2011, 12, 1),
                     EndDate = new DateTime(2012, 1, 1),
                  },
                  new VisitOccurrence(new Entity())
                  {
                     Id = 57308877,
                     PersonId = 2049445909,
                     AdditionalFields = new Dictionary<string, string> {{"max_serv_day", "1"}, {"disc_mon_seq", "1"}},
                     StartDate = new DateTime(2012, 9, 1),
                     EndDate = new DateTime(2012, 9, 1),
                  }
            };

         return list.ToArray();
      }

      private static VisitOccurrence[] GetVisitOccurrences()
      {
         var list = new List<VisitOccurrence>
            {
               new VisitOccurrence(new Entity())
                  {
                     Id = 1175536237,
                     PersonId = 1120230975,
                     AdditionalFields = new Dictionary<string, string> {{"max_serv_day", "4"}, {"disc_mon_seq", "1"}},
                     StartDate = new DateTime(2010, 10, 1),
                     EndDate = new DateTime(2010, 10, 1),
                  },
               new VisitOccurrence(new Entity())
                  {
                     Id = 1228455080,
                     PersonId = 1120230975,
                     AdditionalFields = new Dictionary<string, string> {{"max_serv_day", "10"}, {"disc_mon_seq", "1"}},
                     StartDate = new DateTime(2010, 10, 1),
                     EndDate = new DateTime(2010, 11, 1),
                  },
               new VisitOccurrence(new Entity())
                  {
                     Id = 1430830346,
                     PersonId = 1120230975,
                     AdditionalFields = new Dictionary<string, string> {{"max_serv_day", "7"}, {"disc_mon_seq", "1"}},
                     StartDate = new DateTime(2011, 1, 1),
                     EndDate = new DateTime(2011, 1, 1),
                  },
               new VisitOccurrence(new Entity())
                  {
                     Id = 1511534818,
                     PersonId = 1120230975,
                     AdditionalFields = new Dictionary<string, string> {{"max_serv_day", "6"}, {"disc_mon_seq", "1"}},
                     StartDate = new DateTime(2011, 2, 1),
                     EndDate = new DateTime(2011, 2, 1),
                  },
               new VisitOccurrence(new Entity())
                  {
                     Id = 1560724070,
                     PersonId = 1120230975,
                     AdditionalFields = new Dictionary<string, string> {{"max_serv_day", "48"}, {"disc_mon_seq", "1"}},
                     StartDate = new DateTime(2011, 2, 1),
                     EndDate = new DateTime(2011, 4, 1),
                  },
               new VisitOccurrence(new Entity())
                  {
                     Id = 1569075673,
                     PersonId = 1120230975,
                     AdditionalFields = new Dictionary<string, string> {{"max_serv_day", "8"}, {"disc_mon_seq", "1"}},
                     StartDate = new DateTime(2011, 5, 1),
                     EndDate = new DateTime(2011, 5, 1),
                  },
               new VisitOccurrence(new Entity())
                  {
                     Id = 1568584891,
                     PersonId = 1120230975,
                     AdditionalFields = new Dictionary<string, string> {{"max_serv_day", "3"}, {"disc_mon_seq", "2"}},
                     StartDate = new DateTime(2011, 5, 1),
                     EndDate = new DateTime(2011, 5, 1),
                  }
               ,
               new VisitOccurrence(new Entity())
                  {
                     Id = 1606647218,
                     PersonId = 1120230975,
                     AdditionalFields = new Dictionary<string, string> {{"max_serv_day", "3"}, {"disc_mon_seq", "1"}},
                     StartDate = new DateTime(2011, 7, 1),
                     EndDate = new DateTime(2011, 7, 1),
                  },
               new VisitOccurrence(new Entity())
                  {
                     Id = 1606676096,
                     PersonId = 1120230975,
                     AdditionalFields = new Dictionary<string, string> {{"max_serv_day", "7"}, {"disc_mon_seq", "2"}},
                     StartDate = new DateTime(2011, 7, 1),
                     EndDate = new DateTime(2011, 7, 1),
                  }
               ,
               new VisitOccurrence(new Entity())
                  {
                     Id = 1649550323,
                     PersonId = 1120230975,
                     AdditionalFields = new Dictionary<string, string> {{"max_serv_day", "10"}, {"disc_mon_seq", "1"}},
                     StartDate = new DateTime(2011, 8, 1),
                     EndDate = new DateTime(2011, 8, 1),
                  },
               new VisitOccurrence(new Entity())
                  {
                     Id = 1649545709,
                     PersonId = 1120230975,
                     AdditionalFields = new Dictionary<string, string> {{"max_serv_day", "11"}, {"disc_mon_seq", "2"}},
                     StartDate = new DateTime(2011, 8, 1),
                     EndDate = new DateTime(2011, 8, 1),
                  }
               ,
               new VisitOccurrence(new Entity())
                  {
                     Id = 1856443013,
                     PersonId = 1120230975,
                     AdditionalFields = new Dictionary<string, string> {{"max_serv_day", "10"}, {"disc_mon_seq", "1"}},
                     StartDate = new DateTime(2011, 10, 1),
                     EndDate = new DateTime(2011, 10, 1),
                  }
            };

         return list.ToArray();
      }
   }
}
