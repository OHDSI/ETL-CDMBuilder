using System;
using System.Collections.Generic;
using System.Linq;
using NUnit.Framework;
using org.ohdsi.cdm.framework.core.Helpers;
using org.ohdsi.cdm.framework.entities.Omop;

namespace org.ohdsi.cdm.tests
{
   [TestFixture]
   public class TDrugEra
   {
      [Test]
      public void TestDrugExposures2()
      {
         var drugExposures = new List<DrugExposure>
                                {
                                   new DrugExposure(new Entity
                                                       {
                                                          ConceptId = 1,
                                                          PersonId = 1,
                                                          StartDate = DateTime.Parse("2001-01-15"),
                                                          EndDate = DateTime.Parse("2001-02-13")
                                                       })
                                      {GetEraConceptIdsCall = GetEraConceptIds2},
                                   new DrugExposure(new Entity
                                                       {
                                                          ConceptId = 2,
                                                          PersonId = 1,
                                                          StartDate = DateTime.Parse("2001-04-09"),
                                                          EndDate = DateTime.Parse("2001-05-06")
                                                       })
                                      {GetEraConceptIdsCall = GetEraConceptIds2}
                                };

         var eras = EraHelper.GetEras(drugExposures, 30, 0).ToList();

         Assert.AreEqual(eras.Count, 2);
         Assert.AreEqual(eras[0].StartDate, DateTime.Parse("2001-01-15"));
         Assert.AreEqual(eras[0].EndDate, DateTime.Parse("2001-02-13"));
         Assert.AreEqual(eras[0].OccurrenceCount, 1);

         Assert.AreEqual(eras[1].StartDate, DateTime.Parse("2001-04-09"));
         Assert.AreEqual(eras[1].EndDate, DateTime.Parse("2001-05-06"));
         Assert.AreEqual(eras[1].OccurrenceCount, 1);
      }

      [Test]
      public void TestDrugExposuresGap1()
      {
         var drugExposures = new List<DrugExposure>
                                {
                                   new DrugExposure(new Entity
                                                       {
                                                          ConceptId = 1,
                                                          PersonId = 1,
                                                          StartDate = DateTime.Parse("2001-01-15"),
                                                          EndDate = DateTime.Parse("2001-02-15")
                                                       })
                                      {GetEraConceptIdsCall = GetEraConceptIds2},
                                   new DrugExposure(new Entity
                                                       {
                                                          ConceptId = 1,
                                                          PersonId = 1,
                                                          StartDate = DateTime.Parse("2001-02-25"),
                                                          EndDate = DateTime.Parse("2001-03-01")
                                                       })
                                      {GetEraConceptIdsCall = GetEraConceptIds2}
                                };

         var eras = EraHelper.GetEras(drugExposures, 30, 0).ToList();

         Assert.AreEqual(eras.Count, 1);
         Assert.AreEqual(eras[0].StartDate, DateTime.Parse("2001-01-15"));
         Assert.AreEqual(eras[0].EndDate, DateTime.Parse("2001-03-01"));
         Assert.AreEqual(eras[0].GapDays, 10);
         Assert.AreEqual(eras[0].OccurrenceCount, 2);
      }

      [Test]
      public void TestDrugExposuresGap2()
      {
         var drugExposures = new List<DrugExposure>
                                {
                                   new DrugExposure(new Entity
                                                       {
                                                          ConceptId = 1,
                                                          PersonId = 1,
                                                          StartDate = DateTime.Parse("2001-01-15"),
                                                          EndDate = DateTime.Parse("2001-02-15")
                                                       })
                                      {GetEraConceptIdsCall = GetEraConceptIds2},
                                   new DrugExposure(new Entity
                                                       {
                                                          ConceptId = 1,
                                                          PersonId = 1,
                                                          StartDate = DateTime.Parse("2001-02-01"),
                                                          EndDate = DateTime.Parse("2001-03-01")
                                                       })
                                      {GetEraConceptIdsCall = GetEraConceptIds2},
                                      new DrugExposure(new Entity
                                                       {
                                                          ConceptId = 1,
                                                          PersonId = 1,
                                                          StartDate = DateTime.Parse("2001-03-15"),
                                                          EndDate = DateTime.Parse("2001-04-01")
                                                       })
                                      {GetEraConceptIdsCall = GetEraConceptIds2},
                                      new DrugExposure(new Entity
                                                       {
                                                          ConceptId = 1,
                                                          PersonId = 1,
                                                          StartDate = DateTime.Parse("2001-04-05"),
                                                          EndDate = DateTime.Parse("2001-04-27")
                                                       })
                                      {GetEraConceptIdsCall = GetEraConceptIds2}
                                };

         var eras = EraHelper.GetEras(drugExposures, 30, 0).ToList();

         Assert.AreEqual(eras.Count, 1);
         Assert.AreEqual(eras[0].StartDate, DateTime.Parse("2001-01-15"));
         Assert.AreEqual(eras[0].EndDate, DateTime.Parse("2001-04-27"));
         Assert.AreEqual(eras[0].GapDays, 18);
         Assert.AreEqual(eras[0].OccurrenceCount, 4);
      }

      [Test]
      public void TestDrugExposures1()
      {
         var drugExposures = new List<DrugExposure>
                                {
                                   new DrugExposure(new Entity
                                                       {
                                                          ConceptId = 1,
                                                          PersonId = 1,
                                                          StartDate = DateTime.Parse("2001-01-15"),
                                                          EndDate = DateTime.Parse("2001-04-08")
                                                       })
                                      {GetEraConceptIdsCall = GetEraConceptIds2},
                                   new DrugExposure(new Entity
                                                       {
                                                          ConceptId = 2,
                                                          PersonId = 1,
                                                          StartDate = DateTime.Parse("2001-01-17"),
                                                          EndDate = DateTime.Parse("2001-02-13")
                                                       })
                                      {GetEraConceptIdsCall = GetEraConceptIds2},
                                   new DrugExposure(new Entity
                                                       {
                                                          ConceptId = 2,
                                                          PersonId = 1,
                                                          StartDate = DateTime.Parse("2001-04-09"),
                                                          EndDate = DateTime.Parse("2001-05-06")
                                                       })
                                      {GetEraConceptIdsCall = GetEraConceptIds2}
                                };

         var eras = EraHelper.GetEras(drugExposures, 30, 0).ToList();

         Assert.AreEqual(eras.Count, 1);
         Assert.AreEqual(eras[0].StartDate, DateTime.Parse("2001-01-15"));
         Assert.AreEqual(eras[0].EndDate, DateTime.Parse("2001-05-06"));
         Assert.AreEqual(eras[0].OccurrenceCount, 3);
      }

      [Test]
      public void TestDrugExposures3()
      {
         var drugExposures = new List<DrugExposure>
                                {
                                   new DrugExposure(new Entity
                                                       {
                                                          ConceptId = 1,
                                                          PersonId = 1,
                                                          StartDate = DateTime.Parse("2001-01-15"),
                                                          EndDate = DateTime.Parse("2001-04-08")
                                                       })
                                      {GetEraConceptIdsCall = GetEraConceptIds2},
                                   new DrugExposure(new Entity
                                                       {
                                                          ConceptId = 2,
                                                          PersonId = 1,
                                                          StartDate = DateTime.Parse("2001-01-17"),
                                                          EndDate = DateTime.Parse("2001-02-13")
                                                       })
                                      {GetEraConceptIdsCall = GetEraConceptIds2},
                                   new DrugExposure(new Entity
                                                       {
                                                          ConceptId = 2,
                                                          PersonId = 1,
                                                          StartDate = DateTime.Parse("2001-04-09"),
                                                          EndDate = DateTime.Parse("2001-05-06")
                                                       })
                                      {GetEraConceptIdsCall = GetEraConceptIds2}
                                };

         var eras = EraHelper.GetEras(drugExposures, 30, 0).ToList();

         Assert.AreEqual(eras.Count, 1);
         Assert.AreEqual(eras[0].StartDate, DateTime.Parse("2001-01-15"));
         Assert.AreEqual(eras[0].EndDate, DateTime.Parse("2001-05-06"));
         Assert.AreEqual(eras[0].OccurrenceCount, 3);
      }

      [Test]
      public void TestDrugExposures()
      {
         var drugExposures = new List<DrugExposure>
                                {
                                   new DrugExposure(new Entity
                                                       {
                                                          ConceptId = 1,
                                                          PersonId = 1,
                                                          StartDate = new DateTime(2011, 3, 7)
                                                       })
                                      {GetEraConceptIdsCall = GetEraConceptIds1},
                                   new DrugExposure(new Entity
                                                       {
                                                          ConceptId = 2,
                                                          PersonId = 1,
                                                          StartDate = new DateTime(2011, 3, 7)
                                                       })
                                      {GetEraConceptIdsCall = GetEraConceptIds2},
                                   new DrugExposure(new Entity
                                                       {
                                                          ConceptId = 2,
                                                          PersonId = 1,
                                                          StartDate = new DateTime(2011, 3, 7)
                                                       })
                                      {GetEraConceptIdsCall = GetEraConceptIds3}
                                };

         var eras = EraHelper.GetEras(drugExposures, 0, 0).ToList();

         Assert.AreEqual(eras.Count, 4);
         Assert.AreEqual(eras[0].ConceptId, 1);
         Assert.AreEqual(eras[0].OccurrenceCount, 3);

         Assert.AreEqual(eras[1].ConceptId, 2);
         Assert.AreEqual(eras[1].OccurrenceCount, 2);

         Assert.AreEqual(eras[2].ConceptId, 3);
         Assert.AreEqual(eras[2].OccurrenceCount, 2);

         Assert.AreEqual(eras[3].ConceptId, 4);
         Assert.AreEqual(eras[3].OccurrenceCount, 1);
      }

      private static HashSet<long?> GetEraConceptIds1(long conceptId)
      {
          return new HashSet<long?> { 1, 2, 3 };
      }

      private static HashSet<long?> GetEraConceptIds2(long conceptId)
      {
          return new HashSet<long?> { 1 };
      }

      private static HashSet<long?> GetEraConceptIds3(long conceptId)
      {
          return new HashSet<long?> { 1, 2, 3, 4 };
      }
   }
     
}

