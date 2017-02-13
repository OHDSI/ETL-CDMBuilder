using System;
using System.Collections.Generic;
using System.Data;
using org.ohdsi.cdm.framework.core.Lookups;
using org.ohdsi.cdm.framework.shared.Extensions;

namespace org.ohdsi.cdm.framework.core.Definitions
{
   public class ConceptId
   {
      public long? Value { get; set; }
      public DateTime? ValidStartDate { get; set; }
      public DateTime? ValidEndDate { get; set; }
   }

   public class Concept
   {
      public Field[] Fields { get; set; }

      public Mapper[] ConceptIdMappers { get; set; }
      public Mapper[] TypeIdMappers { get; set; }
      public Mapper[] SourceConceptIdMappers { get; set; }
      
      public string SourceLookup { get; set; }
      
      public bool IdRequired { get; set; }

      public string GetConceptIdLookupKey(IDataRecord reader)
      {
         var mapper = FindMapper(ConceptIdMappers, reader);

         return mapper == null ? null : mapper.Lookup;
      }

      public List<LookupValue> GetConceptIdValues(Vocabulary vocabulary, Field field, IDataRecord reader)
      {
         return GetValues(vocabulary, field, reader, ConceptIdMappers);
      }

      public List<LookupValue> GetSourceConceptIdValues(Vocabulary vocabulary, Field field, IDataRecord reader)
      {
         var mapper = FindMapper(SourceConceptIdMappers, reader);

         if (mapper == null)
            return new List<LookupValue> { new LookupValue { ConceptId = 0 } };

         var conceptKey = reader.GetString(field.Key);

         return conceptKey == null
          ? new List<LookupValue> { new LookupValue { ConceptId = 0 } }
          : mapper.Map(vocabulary, field.Key, conceptKey, reader.GetDateTime(field.EventDate));
      }

      private static List<LookupValue> GetValues(Vocabulary vocabulary, Field field, IDataRecord reader, IEnumerable<Mapper> m)
      {
         if (!string.IsNullOrEmpty(field.ConceptId))
         {
            var conceptId = reader.GetInt(field.ConceptId);
            return new List<LookupValue> {new LookupValue {ConceptId = conceptId}};
         }

         var mapper = FindMapper(m, reader);

         if (mapper == null)
            return new List<LookupValue> {new LookupValue {ConceptId = field.DefaultConceptId}};

         var conceptKey = reader.GetString(field.Key);

         return conceptKey == null
            ? new List<LookupValue>()
            : mapper.Map(vocabulary, field.Key, conceptKey, reader.GetDateTime(field.EventDate));
      }

      public int? GetTypeId(Field field, IDataRecord reader)
      {
         if (!string.IsNullOrEmpty(field.TypeId))
         {
            return reader.GetInt(field.TypeId);
         }

         var mapper = FindMapper(TypeIdMappers, reader);
         if (mapper == null)
         {
            return field.DefaultTypeId;
         }

         var typeIds = mapper.Map(null, field.Key, reader.GetString(field.Key), reader.GetDateTime(field.EventDate));

         if (typeIds.Count == 0)
            return null;

         return (int?)typeIds[0].ConceptId;
      }

      private static Mapper FindMapper(IEnumerable<Mapper> mappers, IDataRecord reader)
      {
         if (mappers == null) return null;

         Mapper defaultMapper = null;
         foreach (var mapper in mappers)
         {
            if (string.IsNullOrEmpty(mapper.Condition))
            {
               defaultMapper = mapper;
               continue;
            }

            if (mapper.Match(reader))
               return mapper;
         }

         return defaultMapper;
      }
   }
}
