using System;
using System.Collections.Generic;
using System.Data;
using org.ohdsi.cdm.framework.shared.Extensions;

namespace org.ohdsi.cdm.framework.core.Lookups
{
   public class LookupValue
   {
      public string Source { get; set; }
      public long? ConceptId { get; set; }
      public DateTime ValidStartDate { get; set; }
      public DateTime ValidEndDate { get; set; }
   }

   public class MultiLookup : BaseLookup
   {
      private readonly Dictionary<string, List<LookupValue>> mLookup = new Dictionary<string, List<LookupValue>>();

      public MultiLookup(string connectionString, string sqlFileDestination) : base (connectionString, sqlFileDestination)
      {
         
      }

      public override void AddRecord(IDataReader reader)
      {
         var sourceCode = reader[0].ToString().Trim();
         var source = reader[1].ToString().Trim();
         var validStartDate = DateTime.MinValue;
         var validEndDate = DateTime.MaxValue;

         if(reader.FieldCount == 4)
         {
            validStartDate = reader.GetDateTime(2);
            validEndDate = reader.GetDateTime(3);
         }

         var targetConceptId = long.Parse(source);

         if (!mLookup.ContainsKey(sourceCode))
         {
            mLookup.Add(sourceCode, new List<LookupValue>());
         }

         mLookup[sourceCode].Add(new LookupValue
                                    {
                                       ConceptId = targetConceptId,
                                       Source = sourceCode,
                                       ValidStartDate = validStartDate,
                                       ValidEndDate = validEndDate
                                    });
      }

      public IEnumerable<LookupValue> MultiLookupValue(string sourceValue, DateTime? eventDate)
      {
         if(mLookup.ContainsKey(sourceValue))
         {
            foreach (var l in mLookup[sourceValue])
            {
               if (!eventDate.HasValue || eventDate.Value == DateTime.MinValue)
               {
                  yield return l;
               }
               else if (eventDate.Value.Between(l.ValidStartDate, l.ValidEndDate))
               {
                  yield return l;
               }
            }
         }
         else
            yield return new LookupValue { ConceptId = null };
      }
   }
}
