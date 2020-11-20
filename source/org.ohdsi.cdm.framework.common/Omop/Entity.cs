using org.ohdsi.cdm.framework.common.Enums;
using System;
using System.Collections.Generic;
using System.Security.Cryptography;
using System.Text;

namespace org.ohdsi.cdm.framework.common.Omop
{
    public class Entity : IEntity
    {
        public bool IdUndefined { get; set; }
        public bool IsUnique { get; set; }

        public Guid SourceRecordGuid { get; set; }

        public long Id { get; set; }
        public long PersonId { get; set; }
        public int ConceptId { get; set; }
        public string ConceptIdKey { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime? EndDate { get; set; }

        public int? TypeConceptId { get; set; }
        public long? VisitOccurrenceId { get; set; }
        public long? VisitDetailId { get; set; }

        public string SourceValue { get; set; }

        public long? ProviderId { get; set; }
        public string ProviderKey { get; set; }

        public Dictionary<string, string> AdditionalFields { get; set; }
        public List<int> Ingredients { get; set; }

        // CDM v5 props
        public int SourceConceptId { get; set; }
        public string Domain { get; set; }
        //public string SourceVocabularyId { get; set; }

        public string VocabularySourceValue { get; set; }

        public Entity()
        {

        }

        public Entity(IEntity ent)
        {
            Init(ent);
        }

        public virtual string GetKey()
        {
            throw new NotImplementedException();
        }

        public virtual HashSet<int?> GetEraConceptIds()
        {
            return new HashSet<int?> { ConceptId };
        }

        public virtual DateTime GetEndDate()
        {
            if (!EndDate.HasValue)
                return StartDate;

            return EndDate.Value == DateTime.MinValue ? StartDate : EndDate.Value;
        }

        public virtual bool IncludeInEra()
        {
            return true;
        }

        public virtual EntityType GeEntityType()
        {
            return EntityType.Entity;
        }

        public DateTime ValidStartDate { get; set; }
        public DateTime ValidEndDate { get; set; }

        public void Init(IEntity ent)
        {
            SourceRecordGuid = ent.SourceRecordGuid;
            IsUnique = ent.IsUnique;
            PersonId = ent.PersonId;
            ConceptId = ent.ConceptId;
            StartDate = ent.StartDate;
            EndDate = ent.EndDate;
            TypeConceptId = ent.TypeConceptId;
            VisitOccurrenceId = ent.VisitOccurrenceId;
            VisitDetailId = ent.VisitDetailId;
            SourceValue = ent.SourceValue;
            ProviderId = ent.ProviderId;
            ProviderKey = ent.ProviderKey;
            AdditionalFields = ent.AdditionalFields;
            ValidStartDate = ent.ValidStartDate;
            ValidEndDate = ent.ValidEndDate;
            SourceConceptId = ent.SourceConceptId;
            Domain = ent.Domain;
            //SourceVocabularyId = ent.SourceVocabularyId;
            Ingredients = ent.Ingredients;
            ConceptIdKey = ent.ConceptIdKey;
            VocabularySourceValue = ent.VocabularySourceValue;
        }

        public static long GetId(string key)
        {
            if (string.IsNullOrEmpty(key))
                return 0;

            using (var md5 = MD5.Create())
            {
                return BitConverter.ToInt64(md5.ComputeHash(Encoding.UTF8.GetBytes(key)), 0);
            }
        }

        public static long GetIdOld(string key)
        {
            var result = string.Empty;
            foreach (var c in key)
            {
                if (char.IsPunctuation(c)) continue;

                if (char.IsNumber(c))
                {
                    result += char.GetNumericValue(c);
                }
                else if (char.IsLetter(c))
                {
                    result += c % 32;
                }
            }

            if (string.IsNullOrEmpty(result))
                return long.MinValue;

            return long.TryParse(result, out var id) ? id : result.GetHashCode();
        }
    }
}
