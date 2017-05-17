using System;
using System.Collections.Generic;
using System.Linq;
using NUnit.Framework;
using org.ohdsi.cdm.builders.optumextendedses;
using org.ohdsi.cdm.framework.entities.Omop;

namespace org.ohdsi.cdm.tests
{
   [TestFixture]
   public class TOptumSESPersonBuilder
   {
      [Test]
      public void TestGetIPClaims()
      {
         var buider =
            new OptumExtendedSesPersonBuilder();

         //2008-09-29 2008-10-05 952690485125145
         //2011-04-14 2011-04-16 952690488174899
         //2011-04-14 2011-04-16 952690488174899
         //2011-05-09 2011-05-09 952690488174899
         //2014-07-18 2014-07-19 952690488174899
         //2014-07-18 2014-07-19 952690488174899
         var vo = new VisitOccurrence(new Entity())
         {
            AdditionalFields = new Dictionary<string, string>(),
            StartDate = DateTime.Parse("2008-09-29"),
            EndDate = DateTime.Parse("2008-10-05"),
            ConceptId = 9201
         };
         vo.AdditionalFields.Add("pat_planid", "952690485125145");

         var vo1 = new VisitOccurrence(new Entity())
         {
            AdditionalFields = new Dictionary<string, string>(),
            StartDate = DateTime.Parse("2011-04-14"),
            EndDate = DateTime.Parse("2011-04-16"),
            ConceptId = 9201
         };
         vo1.AdditionalFields.Add("pat_planid", "952690488174899");

         var vo2 = new VisitOccurrence(new Entity())
         {
            AdditionalFields = new Dictionary<string, string>(),
            StartDate = DateTime.Parse("2011-04-14"),
            EndDate = DateTime.Parse("2011-04-16"),
            ConceptId = 9201
         };
         vo2.AdditionalFields.Add("pat_planid", "952690488174899");

         var vo3 = new VisitOccurrence(new Entity())
         {
            AdditionalFields = new Dictionary<string, string>(),
            StartDate = DateTime.Parse("2011-05-09"),
            EndDate = DateTime.Parse("2011-05-09"),
            ConceptId = 9201
         };
         vo3.AdditionalFields.Add("pat_planid", "952690488174899");

         var vo4 = new VisitOccurrence(new Entity())
         {
            AdditionalFields = new Dictionary<string, string>(),
            StartDate = DateTime.Parse("2014-07-18"),
            EndDate = DateTime.Parse("2014-07-19"),
            ConceptId = 9201
         };
         vo4.AdditionalFields.Add("pat_planid", "952690488174899");

         var vo5 = new VisitOccurrence(new Entity())
         {
            AdditionalFields = new Dictionary<string, string>(),
            StartDate = DateTime.Parse("2014-07-18"),
            EndDate = DateTime.Parse("2014-07-19"),
            ConceptId = 9201
         };
         vo5.AdditionalFields.Add("pat_planid", "952690488174899");

         var result =
            buider.GetIPClaims(new List<VisitOccurrence> { vo5, vo4, vo3, vo2, vo1, vo })
               .OrderBy(v => v.StartDate)
               .ThenBy(v => v.EndDate.Value).ToList();



         Assert.AreEqual(4, result.Count);
         Assert.AreEqual(DateTime.Parse("2008-09-29"), result[0].StartDate);
         Assert.AreEqual(DateTime.Parse("2008-10-05"), result[0].EndDate);

         Assert.AreEqual(DateTime.Parse("2011-04-14"), result[1].StartDate);
         Assert.AreEqual(DateTime.Parse("2011-04-16"), result[1].EndDate);

         Assert.AreEqual(DateTime.Parse("2011-05-09"), result[2].StartDate);
         Assert.AreEqual(DateTime.Parse("2011-05-09"), result[2].EndDate);

         Assert.AreEqual(DateTime.Parse("2014-07-18"), result[3].StartDate);
         Assert.AreEqual(DateTime.Parse("2014-07-19"), result[3].EndDate);
      }

      [Test]
      public void TestGetIPClaims2()
      {
         var buider =
            new OptumExtendedSesPersonBuilder();

         var vo = new VisitOccurrence(new Entity())
         {
            AdditionalFields = new Dictionary<string, string>(),
            StartDate = DateTime.Parse("2008-09-29"),
            EndDate = DateTime.Parse("2008-10-05"),
            ConceptId = 9201
         };
         vo.AdditionalFields.Add("pat_planid", "952690485125145");

         var vo1 = new VisitOccurrence(new Entity())
         {
            AdditionalFields = new Dictionary<string, string>(),
            StartDate = DateTime.Parse("2011-04-14"),
            EndDate = DateTime.Parse("2011-04-16"),
            ConceptId = 9201
         };
         vo1.AdditionalFields.Add("pat_planid", "952690488174899");

         var vo2 = new VisitOccurrence(new Entity())
         {
            AdditionalFields = new Dictionary<string, string>(),
            StartDate = DateTime.Parse("2011-04-14"),
            EndDate = DateTime.Parse("2011-05-09"),
            ConceptId = 9201
         };
         vo2.AdditionalFields.Add("pat_planid", "952690488174899");

         var vo3 = new VisitOccurrence(new Entity())
         {
            AdditionalFields = new Dictionary<string, string>(),
            StartDate = DateTime.Parse("2011-05-09"),
            EndDate = DateTime.Parse("2011-05-09"),
            ConceptId = 9201
         };
         vo3.AdditionalFields.Add("pat_planid", "952690488174899");

         var vo4 = new VisitOccurrence(new Entity())
         {
            AdditionalFields = new Dictionary<string, string>(),
            StartDate = DateTime.Parse("2014-07-18"),
            EndDate = DateTime.Parse("2014-07-19"),
            ConceptId = 9201
         };
         vo4.AdditionalFields.Add("pat_planid", "952690488174899");

         var vo5 = new VisitOccurrence(new Entity())
         {
            AdditionalFields = new Dictionary<string, string>(),
            StartDate = DateTime.Parse("2014-07-18"),
            EndDate = DateTime.Parse("2014-07-19"),
            ConceptId = 9201
         };
         vo5.AdditionalFields.Add("pat_planid", "952690488174899");

         var result =
            buider.GetIPClaims(new List<VisitOccurrence> { vo5, vo4, vo3, vo2, vo1, vo })
               .OrderBy(v => v.StartDate)
               .ThenBy(v => v.EndDate.Value).ToList();

         Assert.AreEqual(3, result.Count);
         Assert.AreEqual(DateTime.Parse("2008-09-29"), result[0].StartDate);
         Assert.AreEqual(DateTime.Parse("2008-10-05"), result[0].EndDate);

         Assert.AreEqual(DateTime.Parse("2011-04-14"), result[1].StartDate);
         Assert.AreEqual(DateTime.Parse("2011-05-09"), result[1].EndDate);

         Assert.AreEqual(DateTime.Parse("2014-07-18"), result[2].StartDate);
         Assert.AreEqual(DateTime.Parse("2014-07-19"), result[2].EndDate);
      }

      [Test]
      public void TestGetIPClaims3()
      {
         var buider =
            new OptumExtendedSesPersonBuilder();

         var vo = new VisitOccurrence(new Entity())
         {
            AdditionalFields = new Dictionary<string, string>(),
            StartDate = DateTime.Parse("2008-09-29"),
            EndDate = DateTime.Parse("2011-05-09"),
            ConceptId = 9201
         };
         vo.AdditionalFields.Add("pat_planid", "952690485125145");

         var vo1 = new VisitOccurrence(new Entity())
         {
            AdditionalFields = new Dictionary<string, string>(),
            StartDate = DateTime.Parse("2011-04-14"),
            EndDate = DateTime.Parse("2011-04-16"),
            ConceptId = 9201
         };
         vo1.AdditionalFields.Add("pat_planid", "952690488174899");

         var vo2 = new VisitOccurrence(new Entity())
         {
            AdditionalFields = new Dictionary<string, string>(),
            StartDate = DateTime.Parse("2011-04-14"),
            EndDate = DateTime.Parse("2011-05-09"),
            ConceptId = 9201
         };
         vo2.AdditionalFields.Add("pat_planid", "952690488174899");

         var vo3 = new VisitOccurrence(new Entity())
         {
            AdditionalFields = new Dictionary<string, string>(),
            StartDate = DateTime.Parse("2011-05-09"),
            EndDate = DateTime.Parse("2011-05-09"),
            ConceptId = 9201
         };
         vo3.AdditionalFields.Add("pat_planid", "952690488174899");

         var vo4 = new VisitOccurrence(new Entity())
         {
            AdditionalFields = new Dictionary<string, string>(),
            StartDate = DateTime.Parse("2014-07-18"),
            EndDate = DateTime.Parse("2014-07-19"),
            ConceptId = 9201
         };
         vo4.AdditionalFields.Add("pat_planid", "952690488174899");

         var vo5 = new VisitOccurrence(new Entity())
         {
            AdditionalFields = new Dictionary<string, string>(),
            StartDate = DateTime.Parse("2014-07-18"),
            EndDate = DateTime.Parse("2014-07-19"),
            ConceptId = 9201
         };
         vo5.AdditionalFields.Add("pat_planid", "952690488174899");

         var result =
            buider.GetIPClaims(new List<VisitOccurrence> { vo5, vo4, vo3, vo2, vo1, vo })
               .OrderBy(v => v.StartDate)
               .ThenBy(v => v.EndDate.Value).ToList();

         Assert.AreEqual(3, result.Count);
         Assert.AreEqual(DateTime.Parse("2008-09-29"), result[0].StartDate);
         Assert.AreEqual(DateTime.Parse("2011-05-09"), result[0].EndDate);

         Assert.AreEqual(DateTime.Parse("2011-04-14"), result[1].StartDate);
         Assert.AreEqual(DateTime.Parse("2011-05-09"), result[1].EndDate);

         Assert.AreEqual(DateTime.Parse("2014-07-18"), result[2].StartDate);
         Assert.AreEqual(DateTime.Parse("2014-07-19"), result[2].EndDate);
      }

      [Test]
      //HIX-1225
      public void TestGetIPClaims4()
      {
         var buider =
            new OptumExtendedSesPersonBuilder();

         var vo = new VisitOccurrence(new Entity())
         {
            AdditionalFields = new Dictionary<string, string>(),
            StartDate = DateTime.Parse("2008-12-12"),
            EndDate = DateTime.Parse("2008-12-14"),
            ConceptId = 9201,
            ProviderId = 9555473479
         };
         vo.AdditionalFields.Add("pat_planid", "208426549285164");
         vo.AdditionalFields.Add("prov", "9555473479");
         vo.AdditionalFields.Add("provcat", "0001");

         var vo1 = new VisitOccurrence(new Entity())
         {
            AdditionalFields = new Dictionary<string, string>(),
            StartDate = DateTime.Parse("2008-12-12"),
            EndDate = DateTime.Parse("2008-12-14"),
            ConceptId = 9201,
            ProviderId = 9555473479
         };
         vo1.AdditionalFields.Add("pat_planid", "208426549285164");
         vo1.AdditionalFields.Add("prov", "9555473479");
         vo1.AdditionalFields.Add("provcat", "0001");

         var vo2 = new VisitOccurrence(new Entity())
         {
            AdditionalFields = new Dictionary<string, string>(),
            StartDate = DateTime.Parse("2008-12-12"),
            EndDate = DateTime.Parse("2008-12-14"),
            ConceptId = 9201,
            ProviderId = 9559292731
         };
         vo2.AdditionalFields.Add("pat_planid", "208426549893784");
         vo2.AdditionalFields.Add("prov", "9559292731");
         vo2.AdditionalFields.Add("provcat", "0001");

         var vo3 = new VisitOccurrence(new Entity())
         {
            AdditionalFields = new Dictionary<string, string>(),
            StartDate = DateTime.Parse("2008-12-12"),
            EndDate = DateTime.Parse("2008-12-14"),
            ConceptId = 9201,
            ProviderId = 9559292731
         };
         vo3.AdditionalFields.Add("pat_planid", "208426549893784");
         vo3.AdditionalFields.Add("prov", "9559292731");
         vo3.AdditionalFields.Add("provcat", "0001");
         
         var result =
            buider.GetIPClaims(new List<VisitOccurrence> { vo3, vo2, vo1, vo })
               .OrderBy(v => v.StartDate)
               .ThenBy(v => v.EndDate.Value).ToList();

         Assert.AreEqual(1, result.Count);
         Assert.AreEqual(DateTime.Parse("2008-12-12"), result[0].StartDate);
         Assert.AreEqual(DateTime.Parse("2008-12-14"), result[0].EndDate);
      }

   }
}
