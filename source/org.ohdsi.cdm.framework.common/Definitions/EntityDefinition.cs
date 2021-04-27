using org.ohdsi.cdm.framework.common.Builder;
using org.ohdsi.cdm.framework.common.Extensions;
using org.ohdsi.cdm.framework.common.Lookups;
using org.ohdsi.cdm.framework.common.Omop;
using System;
using System.Collections.Generic;
using System.Data;
using System.Xml.Serialization;

namespace org.ohdsi.cdm.framework.common.Definitions
{
    public class EntityDefinition
    {
        private Condition1 _condition;

        public bool IsUnique { get; set; }

        public string Id { get; set; }
        public string PersonId { get; set; }
        public string StartDate { get; set; }
        public string EndDate { get; set; }
        public string StartTime { get; set; }
        public string EndTime { get; set; }

        public string ProviderId { get; set; }
        public string ProviderIdKey { get; set; }

        public string[] AdditionalFields { get; set; }

        public string VisitOccurrenceId { get; set; }

        public string VisitDetailId { get; set; }

        public string Condition { get; set; }
        public Concept[] Concepts { get; set; }

        [XmlIgnore]
        public IVocabulary Vocabulary { get; set; }

        public bool Match(IDataRecord reader)
        {
            if (string.IsNullOrEmpty(Condition))
                return true;

            if (_condition == null)
            {
                _condition = new Condition1(Condition);
            }

            return _condition.Match(reader);
        }

        public virtual IEnumerable<IEntity> GetConcepts(Concept concept, IDataRecord reader, KeyMasterOffsetManager offset)
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
                    additionalFields =
                        new Dictionary<string, string>(AdditionalFields.Length, StringComparer.OrdinalIgnoreCase);
                    foreach (var additionalField in AdditionalFields)
                    {
                        //additionalFields.Add(String.Intern(additionalField.ToLower()), reader.GetString(additionalField));
                        additionalFields.Add(additionalField, reader.GetString(additionalField));
                    }
                }

                if(concept != null && concept.Fields != null)
                {
                    foreach (var field in concept.Fields)
                    {
                        var sourceValue = field.DefaultSource;
                        if (string.IsNullOrEmpty(sourceValue))
                            sourceValue = reader.GetString(field.Key);

                        if (!field.IsNullable && string.IsNullOrEmpty(sourceValue) && field.DefaultConceptId == null &&
                            field.ConceptId == null)
                            continue;

                        // Used when: field.Key used for conceptId mapping and
                        // field.SourceKey used for SourceValue (by default field.Key and field.SourceKey are identical)
                        if (!string.IsNullOrEmpty(field.SourceKey))
                            sourceValue = reader.GetString(field.SourceKey);

                        foreach (var lookupValue in concept.GetConceptIdValues(Vocabulary, field, reader))
                        {
                            var cId = lookupValue.ConceptId;
                            if (!cId.HasValue && field.DefaultConceptId.HasValue)
                                cId = field.DefaultConceptId;

                            if (!concept.IdRequired || cId.HasValue)
                            {

                                var providerIdKey = reader.GetString(ProviderIdKey);
                                if (!string.IsNullOrEmpty(providerIdKey))
                                    providerIdKey = providerIdKey.TrimStart('0');

                                List<int> ingredients = null;
                                if (lookupValue.Ingredients != null)
                                {
                                    ingredients = new List<int>(lookupValue.Ingredients.Count);
                                    ingredients.AddRange(lookupValue.Ingredients);
                                }


                                if (!string.IsNullOrEmpty(StartTime))
                                {
                                    if (DateTime.TryParse(reader.GetString(StartTime), out var dt))
                                    {
                                        startDate = startDate + dt.TimeOfDay;
                                    }
                                }

                                if (endDate != DateTime.MinValue && !string.IsNullOrEmpty(EndTime))
                                {
                                    if (DateTime.TryParse(reader.GetString(EndTime), out var dt))
                                    {
                                        endDate = endDate + dt.TimeOfDay;
                                    }
                                }

                                yield return new Entity
                                {
                                    IsUnique = IsUnique,
                                    PersonId = personId.Value,
                                    SourceValue = sourceValue,
                                    ConceptId = cId ?? 0,
                                    TypeConceptId = concept.GetTypeId(field, reader) ?? 0,
                                    ConceptIdKey = reader.GetString(field.Key),
                                    StartDate = startDate,
                                    EndDate = endDate == DateTime.MinValue ? (DateTime?)null : endDate,
                                    ProviderId = reader.GetLong(ProviderId),
                                    ProviderKey = providerIdKey,
                                    VisitOccurrenceId = reader.GetLong(VisitOccurrenceId),
                                    VisitDetailId = reader.GetLong(VisitDetailId),
                                    AdditionalFields = additionalFields,
                                    ValidStartDate = lookupValue.ValidStartDate,
                                    ValidEndDate = lookupValue.ValidEndDate,
                                    SourceConceptId = lookupValue.SourceConceptId,
                                    Domain = lookupValue.Domain,
                                    //SourceVocabularyId = lookupValue.SourceVocabularyId,
                                    VocabularySourceValue = lookupValue.SourceCode,
                                    Ingredients = ingredients
                                };

                            }
                        }
                    }
                }
            }
        }
    }
}
