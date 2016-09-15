using System;
using System.Collections.Generic;
using System.Linq;
using NUnit.Framework;
using org.ohdsi.cdm.builders.seer;
using org.ohdsi.cdm.framework.core.Base;
using org.ohdsi.cdm.framework.entities.Omop;

namespace org.ohdsi.cdm.tests
{
   [TestFixture]
   public class TSeerPersonBuilder
   {
     
      //[Test]
      //public void TestPayerPlanPeriods1()
      //{
      //   var builder = new SeerPersonBuilder();
      //   builder.JoinToChunkBuilder(new ChunkBuilder(1));

      //   var input = new List<PayerPlanPeriod>();
      //   SeerPersonBuilder.AddPeriods(input, "plan06_01", "n", "plan");
         
      //   SeerPersonBuilder.AddPeriods(input, "plan06_02", "h", "plan");
      //   SeerPersonBuilder.AddPeriods(input, "plan06_02", "h", "plan");
      //   SeerPersonBuilder.AddPeriods(input, "plan06_03", "h", "plan");
      //   SeerPersonBuilder.AddPeriods(input, "plan06_04", "h", "plan");
      //   SeerPersonBuilder.AddPeriods(input, "plan06_05", "h", "plan");
      //   SeerPersonBuilder.AddPeriods(input, "plan06_06", "h", "plan");
      //   SeerPersonBuilder.AddPeriods(input, "plan06_07", "h", "plan");
      //   SeerPersonBuilder.AddPeriods(input, "plan06_08", "h", "plan");
      //   SeerPersonBuilder.AddPeriods(input, "plan06_09", "h", "plan");
         
      //   SeerPersonBuilder.AddPeriods(input, "plan06_10", "0", "plan");
      //   SeerPersonBuilder.AddPeriods(input, "plan06_11", "0", "plan");
      //   SeerPersonBuilder.AddPeriods(input, "plan06_12", "0", "plan");

      //   SeerPersonBuilder.AddPeriods(input, "plan07_01", "null", "plan");

      //   var result = builder.BuildPayerPlanPeriods(input, 1);
      //   Assert.AreEqual(1, result.Count);
         
      //   Assert.AreEqual(new DateTime(2006, 2, 1), result[0].StartDate);
      //   Assert.AreEqual(new DateTime(2006, 9, 30), result[0].EndDate);
      //}

      //[Test]
      //public void TestPayerPlanPeriods2()
      //{
      //   var builder = new SeerPersonBuilder();
      //   builder.JoinToChunkBuilder(new ChunkBuilder(1));

      //   var input = new List<PayerPlanPeriod>();
      //   SeerPersonBuilder.AddPeriods(input, "mon16", "3", "mon");
      //   SeerPersonBuilder.AddPeriods(input, "mon17", "3", "mon");
      //   SeerPersonBuilder.AddPeriods(input, "mon18", "3", "mon");
      //   SeerPersonBuilder.AddPeriods(input, "mon22", "3", "mon");
      //   SeerPersonBuilder.AddPeriods(input, "mon23", "3", "mon");
      //   SeerPersonBuilder.AddPeriods(input, "mon200", "3", "mon");

      //   SeerPersonBuilder.AddPeriods(input, "gho19", "c", "gho");
      //   SeerPersonBuilder.AddPeriods(input, "gho20", "4", "gho");
      //   SeerPersonBuilder.AddPeriods(input, "gho21", "0", "gho");

         
      //   var result = builder.BuildPayerPlanPeriods(input, 1).OrderBy(p=>p.StartDate).ToList();

      //   Assert.AreEqual(4, result.Count);
      //   Assert.AreEqual(new DateTime(1992, 4, 1), result[0].StartDate);
      //   Assert.AreEqual(new DateTime(1992, 6, 30), result[0].EndDate);
      //   Assert.AreEqual("Part A and B", result[0].PlanSourceValue);

      //   Assert.AreEqual(new DateTime(1992, 7, 1), result[1].StartDate);
      //   Assert.AreEqual(new DateTime(1992, 8, 31), result[1].EndDate);
      //   Assert.AreEqual("HMO Member", result[1].PlanSourceValue);

      //   Assert.AreEqual(new DateTime(1992, 10, 1), result[2].StartDate);
      //   Assert.AreEqual(new DateTime(1992, 11, 30), result[2].EndDate);
      //   Assert.AreEqual("Part A and B", result[2].PlanSourceValue);

      //   Assert.AreEqual(new DateTime(2007, 8, 1), result[3].StartDate);
      //   Assert.AreEqual(new DateTime(2007, 8, 31), result[3].EndDate);
      //   Assert.AreEqual("Part A and B", result[3].PlanSourceValue);
         
      //}


      //[Test]
      //public void TestObservationPeriods()
      //{
      //   var builder = new SeerPersonBuilder();
      //   builder.JoinToChunkBuilder(new ChunkBuilder(1));

      //   //1992-07-01	2007-06-30	Medicare	Part A and B
      //   //1992-07-01	2006-05-31	Medicare	HMO Member

      //   var op = builder.BuilObservationPeriods(
      //      new List<PayerPlanPeriod>
      //      {
      //         new PayerPlanPeriod {StartDate = DateTime.Parse("1992-07-01"), EndDate = DateTime.Parse("2007-06-30"), PlanSourceValue = "Part A and B"},
      //         new PayerPlanPeriod {StartDate = DateTime.Parse("1992-07-01"), EndDate = DateTime.Parse("2006-05-31"), PlanSourceValue = "HMO Member"}
      //      },
      //      1).ToList();

      //   // OBSERVATION_PERIOD_START_DATE should be 2006-06-01 and the OBSERVATION_PERIOD_END_DATE should be 2007-06-30
      //   Assert.AreEqual(1, op.Count);
      //   Assert.AreEqual(DateTime.Parse("2006-06-01"), op[0].StartDate);
      //   Assert.AreEqual(DateTime.Parse("2007-06-30"), op[0].EndDate);
      //}

      //[Test]
      //public void TestObservationPeriods1()
      //{
      //   var builder = new SeerPersonBuilder();
      //   builder.JoinToChunkBuilder(new ChunkBuilder(1));

      //   //1997-06-01	1997-07-31 Medicare	Part A and B
      //   //2001-08-01	2008-04-30 Medicare	Part A and B
      //   //2001-09-01	2002-04-30 Medicare	HMO Member

      //   var op = builder.BuilObservationPeriods(
      //      new List<PayerPlanPeriod>
      //      {
      //         new PayerPlanPeriod {StartDate = DateTime.Parse("1997-06-01"), EndDate = DateTime.Parse("1997-07-31"), PlanSourceValue = "Part A and B"},
      //         new PayerPlanPeriod {StartDate = DateTime.Parse("2001-08-01"), EndDate = DateTime.Parse("2008-04-30"), PlanSourceValue = "Part A and B"},
      //         new PayerPlanPeriod {StartDate = DateTime.Parse("2001-09-01"), EndDate = DateTime.Parse("2002-04-30"), PlanSourceValue = "HMO Member"}
      //      },
      //      1).ToList();

      //   Assert.AreEqual(3, op.Count);
      //   Assert.AreEqual(DateTime.Parse("1997-06-01"), op[0].StartDate);
      //   Assert.AreEqual(DateTime.Parse("1997-07-31"), op[0].EndDate);

      //   Assert.AreEqual(DateTime.Parse("2001-08-01"), op[1].StartDate);
      //   Assert.AreEqual(DateTime.Parse("2001-08-31"), op[1].EndDate);

      //   Assert.AreEqual(DateTime.Parse("2002-05-01"), op[2].StartDate);
      //   Assert.AreEqual(DateTime.Parse("2008-04-30"), op[2].EndDate);
      //}

      //[Test]
      //public void TestObservationPeriods2()
      //{
      //   var builder = new SeerPersonBuilder();
      //   builder.JoinToChunkBuilder(new ChunkBuilder(1));

      //   //1997-06-01	1997-07-31 Medicare	Part A and B
      //   //2001-08-01	2008-04-30 Medicare	Part A and B
      //   //2001-09-01	2002-04-30 Medicare	HMO Member

      //   var op = builder.BuilObservationPeriods(
      //      new List<PayerPlanPeriod>
      //      {
      //         new PayerPlanPeriod
      //         {
      //            StartDate = DateTime.Parse("1991-09-01"),
      //            EndDate = DateTime.Parse("2011-12-31"),
      //            PlanSourceValue = "Part A and B"
      //         },
      //         new PayerPlanPeriod
      //         {
      //            StartDate = DateTime.Parse("1995-02-01"),
      //            EndDate = DateTime.Parse("1995-02-28"),
      //            PlanSourceValue = "HMO Member"
      //         },
      //         new PayerPlanPeriod
      //         {
      //            StartDate = DateTime.Parse("1995-09-01"),
      //            EndDate = DateTime.Parse("2011-12-31"),
      //            PlanSourceValue = "HMO Member"
      //         }
      //      },
      //      1).ToList();

      //   Assert.AreEqual(2, op.Count);
      //   Assert.AreEqual(DateTime.Parse("1991-09-01"), op[0].StartDate);
      //   Assert.AreEqual(DateTime.Parse("1995-01-31"), op[0].EndDate);

      //   Assert.AreEqual(DateTime.Parse("1995-03-01"), op[1].StartDate);
      //   Assert.AreEqual(DateTime.Parse("1995-08-31"), op[1].EndDate);

      //}

      //[Test]
      //public void TestObservationPeriods3()
      //{
      //   var builder = new SeerPersonBuilder();
      //   builder.JoinToChunkBuilder(new ChunkBuilder(1));

  
      //   var op = builder.BuilObservationPeriods(
      //      new List<PayerPlanPeriod>
      //      {
      //         new PayerPlanPeriod {StartDate = DateTime.Parse("1992-07-01"), EndDate = DateTime.Parse("2007-06-30"), PlanSourceValue = "Part A and B"},
      //         new PayerPlanPeriod {StartDate = DateTime.Parse("2000-07-01"), EndDate = DateTime.Parse("2008-05-31"), PlanSourceValue = "HMO Member"}
      //      },
      //      1).ToList();

      //   Assert.AreEqual(1, op.Count);
      //   Assert.AreEqual(DateTime.Parse("1992-07-01"), op[0].StartDate);
      //   Assert.AreEqual(DateTime.Parse("2000-06-30"), op[0].EndDate);
      //}

      //[Test]
      //public void TestObservationPeriods4()
      //{
      //   var builder = new SeerPersonBuilder();
      //   builder.JoinToChunkBuilder(new ChunkBuilder(1));

      //   var op = builder.BuilObservationPeriods(
      //      new List<PayerPlanPeriod>
      //      {
      //         new PayerPlanPeriod {StartDate = DateTime.Parse("1992-07-01"), EndDate = DateTime.Parse("2007-06-30"), PlanSourceValue = "Part A and B"},
      //         new PayerPlanPeriod {StartDate = DateTime.Parse("2000-07-01"), EndDate = DateTime.Parse("2001-05-31"), PlanSourceValue = "HMO Member"}
      //      },
      //      1).ToList();

      //   Assert.AreEqual(2, op.Count);
      //   Assert.AreEqual(DateTime.Parse("1992-07-01"), op[0].StartDate);
      //   Assert.AreEqual(DateTime.Parse("2000-06-30"), op[0].EndDate);

      //   Assert.AreEqual(DateTime.Parse("2001-06-01"), op[1].StartDate);
      //   Assert.AreEqual(DateTime.Parse("2007-06-30"), op[1].EndDate);
      //}

      //[Test]
      //public void TestObservationPeriods5()
      //{
      //   var builder = new SeerPersonBuilder();
      //   builder.JoinToChunkBuilder(new ChunkBuilder(1));

      //   var op = builder.BuilObservationPeriods(
      //      new List<PayerPlanPeriod>
      //      {
      //         new PayerPlanPeriod {StartDate = DateTime.Parse("1992-07-01"), EndDate = DateTime.Parse("2007-06-30"), PlanSourceValue = "Part A and B"},
      //         new PayerPlanPeriod {StartDate = DateTime.Parse("2000-07-01"), EndDate = DateTime.Parse("2001-05-31"), PlanSourceValue = "HMO Member"},
      //         new PayerPlanPeriod {StartDate = DateTime.Parse("2000-08-01"), EndDate = DateTime.Parse("2007-06-30"), PlanSourceValue = "HMO Member"}
      //      },
      //      1).ToList();

      //   Assert.AreEqual(1, op.Count);
      //   Assert.AreEqual(DateTime.Parse("1992-07-01"), op[0].StartDate);
      //   Assert.AreEqual(DateTime.Parse("2000-06-30"), op[0].EndDate);
      //}

      //[Test]
      //public void TestObservationPeriods6()
      //{
      //   var builder = new SeerPersonBuilder();
      //   builder.JoinToChunkBuilder(new ChunkBuilder(1));

      //   var op = builder.BuilObservationPeriods(
      //      new List<PayerPlanPeriod>
      //      {
      //         new PayerPlanPeriod {StartDate = DateTime.Parse("1992-07-01"), EndDate = DateTime.Parse("2007-06-30"), PlanSourceValue = "Part A and B"},
      //         new PayerPlanPeriod {StartDate = DateTime.Parse("1992-07-01"), EndDate = DateTime.Parse("2007-06-30"), PlanSourceValue = "HMO Member"}
      //      },
      //      1).ToList();

      //   Assert.AreEqual(0, op.Count);

      //}
   }
}
