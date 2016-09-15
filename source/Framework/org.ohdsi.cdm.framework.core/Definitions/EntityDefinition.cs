using System;
using System.Collections.Generic;
using System.Data;
using System.Xml.Serialization;
using org.ohdsi.cdm.framework.entities.Builder;
using org.ohdsi.cdm.framework.entities.Omop;
using org.ohdsi.cdm.framework.shared.Extensions;

namespace org.ohdsi.cdm.framework.core.Definitions
{
   public class EntityDefinition
   {
      public bool IsUnique { get; set; }

      public string Id { get; set; }
      public string PersonId { get; set; }
      public string StartDate { get; set; }
      public string EndDate { get; set; }
      public string ProviderId { get; set; }
      public string ProviderIdKey { get; set; }

      public string[] AdditionalFields { get; set; }
      
      public string VisitOccurrenceId { get; set; }

      public string Condition { get; set; }
      public Concept[] Concepts { get; set; }

      [XmlIgnore]
      public Vocabulary Vocabulary { get; set; }

      private Condition1 condition;

      public string LookupKey { get; set; }
      
      public bool Match(IDataRecord reader)
      {
         if (string.IsNullOrEmpty(Condition))
            return true;

         if (condition == null)
         {
            condition = new Condition1(Condition);
         }

         return condition.Match(reader);
      }

      public virtual IEnumerable<IEntity> GetConcepts(Concept concept, IDataRecord reader, KeyMasterOffset keyOffset)
      {
         var personId = reader.GetLong(PersonId);

         if (personId.HasValue)
         {
            var startDate = reader.GetDateTime(StartDate);
            var endDate = startDate;
            if (!string.IsNullOrEmpty(EndDate))
               endDate = reader.GetDateTime(EndDate);

            Dictionary<string, string> additionalFields = null;
            if (AdditionalFields != null)
            {
               additionalFields = new Dictionary<string, string>(AdditionalFields.Length);
               foreach (var additionalField in AdditionalFields)
               {
                  //additionalFields.Add(String.Intern(additionalField.ToLower()), reader.GetString(additionalField));
                  additionalFields.Add(additionalField.ToLower(), reader.GetString(additionalField));
               }
            }

            foreach (var field in concept.Fields)
            {
               var sourceValue = field.DefaultSource;
               if (string.IsNullOrEmpty(sourceValue))
                  sourceValue = reader.GetString(field.Key);

               if (!field.IsNullable && string.IsNullOrEmpty(sourceValue) && field.DefaultConceptId == null && field.ConceptId == null)
                  continue;

               // Used when: field.Key used for conceptId mapping and
               // field.SourceKey used for SourceValue (by default field.Key and field.SourceKey are identical)
               if (!string.IsNullOrEmpty(field.SourceKey))
                  sourceValue = reader.GetString(field.SourceKey);

               if(!string.IsNullOrEmpty(concept.SourceLookup))
               {
                  var source = Vocabulary.LookupSource(sourceValue, concept.SourceLookup);
                  if (!string.IsNullOrEmpty(source))
                     sourceValue = source;
               }

               foreach (var lookupValue in concept.GetConceptIdValues(Vocabulary, field, reader))
               {
                  var cId = lookupValue.ConceptId;
                  if (!cId.HasValue && field.DefaultConceptId.HasValue)
                     cId = field.DefaultConceptId;

                  if (!concept.IdRequired || cId.HasValue)
                  {
                     foreach (var sourceConceptId in concept.GetSourceConceptIdValues(Vocabulary, field, reader))
                     {
                        var providerIdKey = reader.GetString(ProviderIdKey);
                        if (!string.IsNullOrEmpty(providerIdKey))
                           providerIdKey = providerIdKey.TrimStart('0');

                        yield return new Entity
                        {
                           IsUnique = IsUnique,
                           PersonId = personId.Value,
                           SourceValue = sourceValue,
                           ConceptId = cId.HasValue ? cId.Value : 0,
                           TypeConceptId = concept.GetTypeId(field, reader),
                           StartDate = startDate,
                           EndDate = endDate == DateTime.MinValue ? (DateTime?) null : endDate,
                           ProviderId = reader.GetInt(ProviderId),
                           ProviderKey = providerIdKey,
                           VisitOccurrenceId = reader.GetLong(VisitOccurrenceId),
                           AdditionalFields = additionalFields,
                           ValidStartDate = lookupValue.ValidStartDate,
                           ValidEndDate = lookupValue.ValidEndDate,
                           SourceConceptId = sourceConceptId.ConceptId.HasValue ? sourceConceptId.ConceptId.Value : 0,
                           Domain = lookupValue.Domain,
                           LookupKey = reader.GetString(LookupKey)
                        };
                     }
                  }
               }
            }
         }
      }
   }
}
