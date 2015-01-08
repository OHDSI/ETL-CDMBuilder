using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using NUnit.Framework;
using org.ohdsi.cdm.builders.premier;
using org.ohdsi.cdm.framework.core.Base;
using org.ohdsi.cdm.framework.entities.Builder;
using org.ohdsi.cdm.framework.entities.Omop;

namespace org.ohdsi.cdm.tests
{
   [TestFixture]
   class TPremierPayerPlanPeriod
   {
      private static void TestPayerPlanPeriods(string rawData, string resultData)
      {
         var raw = GetPayerPlanPeriods(rawData);
         var correct = GetPayerPlanPeriods(resultData);
         var buider = new PremierPersonBuilder(new ChunkBuilder(new ChunkData(), typeof(PremierPersonBuilder)));

         var visitOccurrences = new Dictionary<long, VisitOccurrence>();
         var index = 0;
         foreach (var payerPlanPeriod in raw)
         {
            payerPlanPeriod.VisitOccurrenceId = index;
            visitOccurrences.Add(index, new VisitOccurrence(payerPlanPeriod));
            index++;
         }

         var result = buider.BuildPayerPlanPeriods(raw.ToArray(), visitOccurrences).OrderBy(r => r.StartDate).ToList();
         
         Assert.AreEqual(correct.Count(), result.Count);
         for (var i = 0; i < result.Count; i++)
         {
            Assert.AreEqual(correct[i].StartDate, result[i].StartDate);
            Assert.AreEqual(correct[i].EndDate, result[i].EndDate);
            Assert.AreEqual(correct[i].SourceValue, result[i].SourceValue);
         }
      }

      [Test]
      public void TestPayerPlanPeriods()
      {
         foreach (var file in Directory.GetFiles("DataSample\\PremierPayerPlanPeriod"))
         {
            if (file.ToUpper().Contains("RES")) continue;

            var fileName = Path.GetFileNameWithoutExtension(file);
            var resFile = file.Replace(fileName, fileName + "_RES");

            TestPayerPlanPeriods(file, resFile);
         }
      }

      private static PayerPlanPeriod[] GetPayerPlanPeriods(string destination)
      {
         var dataText = File.ReadAllLines(destination);
         var data =
            dataText.Select(
               line =>
                  new PayerPlanPeriod
                  {
                     StartDate = DateTime.Parse(line.Split('\t')[0]),
                     EndDate = DateTime.Parse(line.Split('\t')[1]),
                     PayerSourceValue = line.Split('\t')[2],
                     PlanSourceValue =
                        line.Split('\t').Count() == 4 && line.Split('\t')[3].Trim().ToLower() != "null"
                           ? line.Split('\t')[3].Trim()
                           : null
                  }).ToArray();

         return data;
      }
   }
}
