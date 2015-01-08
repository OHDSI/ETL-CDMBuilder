using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using NUnit.Framework;
using org.ohdsi.cdm.builders.optum;
using org.ohdsi.cdm.builders.truven;
using org.ohdsi.cdm.framework.core.Base;
using org.ohdsi.cdm.framework.entities.Builder;
using org.ohdsi.cdm.framework.entities.Omop;

namespace org.ohdsi.cdm.tests
{
   [TestFixture]
   public class TPayerPlanPeriod
   {
      [Test]
      public void TestTruvenPayerPlanPeriods()
      {
         var raw = GetPayerPlanPeriods("DataSample\\TruvenPayerPlanPeriod.txt").ToArray();

         var builder = new TruvenPersonBuilder(new ChunkBuilder(new ChunkData(), typeof(TruvenPersonBuilder)));
         
         var result = builder.BuildPayerPlanPeriods(raw, null).ToList().OrderBy(p => p.StartDate).ToList();

         Assert.AreEqual(7, result.Count);

         Assert.AreEqual(DateTime.Parse("1/1/2000 12:00:00 AM"), result[0].StartDate);
         Assert.AreEqual(DateTime.Parse("3/31/2000 12:00:00 AM"), result[0].EndDate);
         Assert.AreEqual("3608", result[0].PlanSourceValue);
         Assert.AreEqual("6", result[0].PayerSourceValue);
         Assert.AreEqual(DateTime.Parse("4/1/2000 12:00:00 AM"), result[1].StartDate);
         Assert.AreEqual(DateTime.Parse("12/31/2001 12:00:00 AM"), result[1].EndDate);
         Assert.AreEqual("3610", result[1].PlanSourceValue);
         Assert.AreEqual("6", result[1].PayerSourceValue);
         Assert.AreEqual(DateTime.Parse("1/1/2002 12:00:00 AM"), result[2].StartDate);
         Assert.AreEqual(DateTime.Parse("12/31/2006 12:00:00 AM"), result[2].EndDate);
         Assert.AreEqual(null, result[2].PlanSourceValue);
         Assert.AreEqual("6", result[2].PayerSourceValue);
         Assert.AreEqual(DateTime.Parse("1/1/2007 12:00:00 AM"), result[3].StartDate);
         Assert.AreEqual(DateTime.Parse("12/31/2007 12:00:00 AM"), result[3].EndDate);
         Assert.AreEqual("3611", result[3].PlanSourceValue);
         Assert.AreEqual("6", result[3].PayerSourceValue);
         Assert.AreEqual(DateTime.Parse("1/1/2008 12:00:00 AM"), result[4].StartDate);
         Assert.AreEqual(DateTime.Parse("12/31/2008 12:00:00 AM"), result[4].EndDate);
         Assert.AreEqual(null, result[4].PlanSourceValue);
         Assert.AreEqual("6", result[4].PayerSourceValue);
         Assert.AreEqual(DateTime.Parse("1/1/2009 12:00:00 AM"), result[5].StartDate);
         Assert.AreEqual(DateTime.Parse("12/31/2009 12:00:00 AM"), result[5].EndDate);
         Assert.AreEqual("4202", result[5].PlanSourceValue);
         Assert.AreEqual("6", result[5].PayerSourceValue);
         Assert.AreEqual(DateTime.Parse("1/1/2011 12:00:00 AM"), result[6].StartDate);
         Assert.AreEqual(DateTime.Parse("1/31/2011 12:00:00 AM"), result[6].EndDate);
         Assert.AreEqual("3612", result[6].PlanSourceValue);
         Assert.AreEqual("6", result[6].PayerSourceValue);
      }

      [Test]
      public void TestTruvenPayerPlanPeriods1()
      {
         var raw = GetPayerPlanPeriods("DataSample\\TruvenPayerPlanPeriod_1.txt").ToArray();

         var builder = new TruvenPersonBuilder(new ChunkBuilder(new ChunkData(), typeof(TruvenPersonBuilder)));
         var result = builder.BuildPayerPlanPeriods(raw, null).ToList().OrderBy(p => p.StartDate).ToList();

         Assert.AreEqual(DateTime.Parse("2001-01-01"), result[0].StartDate);
         Assert.AreEqual(DateTime.Parse("2001-03-29"), result[0].EndDate);
         Assert.AreEqual(null, result[0].PlanSourceValue);
         Assert.AreEqual("4", result[0].PayerSourceValue);
         Assert.AreEqual(DateTime.Parse("2001-03-30"), result[1].StartDate);
         Assert.AreEqual(DateTime.Parse("2001-12-31"), result[1].EndDate);
         Assert.AreEqual("2504", result[1].PlanSourceValue);
         Assert.AreEqual("6", result[1].PayerSourceValue);
      }

      [Test]
      public void TestTruvenPayerPlanPeriods2()
      {
         var raw = GetPayerPlanPeriods("DataSample\\TruvenPayerPlanPeriod_2.txt").ToArray();

         var builder = new TruvenPersonBuilder(new ChunkBuilder(new ChunkData(), typeof(TruvenPersonBuilder)));
         var result = builder.BuildPayerPlanPeriods(raw, null).ToList().OrderBy(p => p.StartDate).ToList();

         Assert.AreEqual(DateTime.Parse("2007-01-01"), result[0].StartDate);
         Assert.AreEqual(DateTime.Parse("2007-12-31"), result[0].EndDate);
         Assert.AreEqual(null, result[0].PlanSourceValue);
         Assert.AreEqual("6", result[0].PayerSourceValue);
         Assert.AreEqual(DateTime.Parse("2008-01-01"), result[1].StartDate);
         Assert.AreEqual(DateTime.Parse("2010-06-30"), result[1].EndDate);
         Assert.AreEqual(null, result[1].PlanSourceValue);
         Assert.AreEqual(null, result[1].PayerSourceValue);
      }

      [Test]
      public void TestOptumPayerPlanPeriods()
      {
          var raw = GetPayerPlanPeriods("DataSample\\OptumPayerPlanPeriod.txt").ToArray();

          var builder = new OptumPersonBuilder(new ChunkBuilder(new ChunkData(), typeof(OptumPersonBuilder)));
          var result = builder.BuildPayerPlanPeriods(raw, null).ToList().OrderBy(p => p.StartDate).ToList();

          Assert.AreEqual(1, result.Count);
          Assert.AreEqual(DateTime.Parse("2005-10-01"), result[0].StartDate);
          Assert.AreEqual(DateTime.Parse("2007-12-31"), result[0].EndDate);
      }

      private static IEnumerable<PayerPlanPeriod> GetPayerPlanPeriods(string destination)
      {
         var dataText = File.ReadAllLines(destination);

         foreach (var line in dataText)
         {
            var pp = new PayerPlanPeriod
               {
                  StartDate = DateTime.Parse(line.Split('\t')[0]),
                  EndDate = DateTime.Parse(line.Split('\t')[1]),
                  PayerSourceValue = line.Split('\t')[2].Trim().ToLower() == "null" ? null : line.Split('\t')[2].Trim(),
                  PlanSourceValue =
                     line.Split('\t').Count() > 3 && line.Split('\t')[3].Trim().ToLower() != "null"
                        ? line.Split('\t')[3].Trim()
                        : null
               };

            pp.AdditionalFields = new Dictionary<string, string>();
            pp.AdditionalFields.Add("plantyp", pp.PayerSourceValue);
            if (line.Split('\t').Count() == 5)
               pp.AdditionalFields.Add("datatyp", line.Split('\t')[4].Trim().ToLower() == "null" ? null : line.Split('\t')[4].Trim());

            yield return pp;
         }
      }
   }
}
