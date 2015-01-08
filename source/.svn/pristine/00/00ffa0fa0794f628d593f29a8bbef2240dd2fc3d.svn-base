using System;
using System.Data;
using System.IO;
using org.ohdsi.cdm.framework.shared.Extensions;
using org.ohdsi.cdm.framework.shared.Helpers;

namespace org.ohdsi.cdm.framework.core.Lookups
{
   public class DaysSupplyLookup : BaseLookup
   {
      private readonly string definitionsFolder;
      public DaysSupplyLookup(string connectionString, string sqlFileDestination, string definitionsFolder)
         : base(connectionString, sqlFileDestination)
      {
         this.definitionsFolder = definitionsFolder;
      }

      public override void Load()
      {
         if(Path.GetExtension(sqlFileDestination).Equals(".sql", StringComparison.CurrentCultureIgnoreCase))
            base.Load();
         else
         {
            var folder = sqlFileDestination;

            if (!string.IsNullOrEmpty(definitionsFolder))
            {
               folder = Path.Combine(definitionsFolder, sqlFileDestination);
            }

            var isFirstLine = true;
            foreach (var line in File.ReadAllLines(folder))
            {
               if (isFirstLine)
               {
                  isFirstLine = false;
                  continue;
               }

               //prodcode	ndd	qty	numpacks	dayssupply
               var values = line.Split('\t');
               int? prodcode = null;
               decimal? ndd = null;
               decimal? quantity = null;
               int? numpacks = null;
               int? dayssupply = null;

               if (values.Length > 0)
                  prodcode = int.Parse(values[0]);

               if (values.Length > 1)
                  ndd = decimal.Parse(values[1]);

               if (values.Length > 2)
                  quantity = decimal.Parse(values[2]);

               if (values.Length > 3)
                  numpacks = int.Parse(values[3]);

               if (values.Length > 4)
                  dayssupply = int.Parse(values[4]);

               if (prodcode.HasValue && dayssupply.HasValue)
               {
                  var key = CompositeKeyHelper.GetCprdDaysSupplyKey(prodcode.Value, ndd, quantity, numpacks);

                  if (!lookup.ContainsKey(key))
                  {
                     lookup.Add(key, dayssupply.Value);
                  }
               }
            }
         }
      }

      public override void AddRecord(IDataReader reader)
      {
         var prodcode = reader.GetInt("prodcode");

         var ndd = reader.GetDecimal("ndd");
         var quantity = reader.GetDecimal("qty");
         var numpacks = reader.GetInt("numpacks");
         var dayssupply = reader.GetInt("numdays");

         if (prodcode.HasValue && dayssupply.HasValue)
         {
            var key = CompositeKeyHelper.GetCprdDaysSupplyKey(prodcode.Value, ndd, quantity, numpacks);

            if (!lookup.ContainsKey(key))
            {
               lookup.Add(key, dayssupply.Value);
            }
         }
      }
   }
}
