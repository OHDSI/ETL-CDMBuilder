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
      public string Domain { get; set; }
      public string SourceVocabularyId { get; set; }
   }

   public class MultiLookup : BaseLookup
   {
      private readonly Dictionary<string, List<LookupValue>> vocab = new Dictionary<string, List<LookupValue>>();
      private readonly Dictionary<string, List<LookupValue>> vocabIgnoreCase = new Dictionary<string, List<LookupValue>>(StringComparer.OrdinalIgnoreCase);

      public MultiLookup(string connectionString, string sqlFileDestination, string schemaName)
         : base(connectionString, sqlFileDestination, schemaName)
      {
         
      }

      public override void AddRecord(IDataReader reader)
      {
         Add(reader, vocab);
         Add(reader, vocabIgnoreCase);
      }

      private static void Add(IDataRecord reader, IDictionary<string, List<LookupValue>> mLookup)
      {
         var sourceCode = reader[0].ToString().Trim();
         var source = reader[1].ToString().Trim();
         var validStartDate = DateTime.MinValue;
         var validEndDate = DateTime.MaxValue;
         string domain = null;
         string sourceVocabularyId = null;

         if (reader.FieldCount == 3)
         {
            domain = reader[2].ToString().Trim();
         }
         else if (reader.FieldCount == 4)
         {
            validStartDate = reader.GetDateTime(2);
            validEndDate = reader.GetDateTime(3);
         }
         else if (reader.FieldCount == 5)
         {
            domain = reader[2].ToString().Trim();
            validStartDate = reader.GetDateTime(3);
            validEndDate = reader.GetDateTime(4);
         }
         else if (reader.FieldCount == 6)
         {
            domain = reader[2].ToString().Trim();
            validStartDate = reader.GetDateTime(3);
            validEndDate = reader.GetDateTime(4);
            sourceVocabularyId = reader[5].ToString().Trim();
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
            ValidEndDate = validEndDate,
            Domain = domain,
            SourceVocabularyId = sourceVocabularyId
         });
      }

      public IEnumerable<LookupValue> MultiLookupValue(string sourceValue, DateTime? eventDate, bool caseSensitive)
      {
         if(vocab.ContainsKey(sourceValue))
         {
            foreach (var lookupValue in GetValues(vocab, sourceValue, eventDate)) 
               yield return lookupValue;
         }
         else if (!caseSensitive && vocabIgnoreCase.ContainsKey(sourceValue))
         {
            foreach (var lookupValue in GetValues(vocabIgnoreCase, sourceValue, eventDate))
               yield return lookupValue;
         }
         else
            yield return new LookupValue { ConceptId = null };
      }

      private static IEnumerable<LookupValue> GetValues(IReadOnlyDictionary<string, List<LookupValue>> v, string sourceValue, DateTime? eventDate)
      {
         foreach (var l in v[sourceValue])
         {
            if (!eventDate.HasValue || eventDate.Value == DateTime.MinValue)
            {
               yield return l;
            }
            else 
            {
               if (eventDate.Value.Between(l.ValidStartDate, l.ValidEndDate))
               {
                  yield return l;
               }
               else
               {
                  l.ConceptId = 0;
                  yield return l;
               }
            }
         }
      }
   }
}
