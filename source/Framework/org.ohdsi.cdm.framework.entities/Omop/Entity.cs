using System;
using System.Collections.Generic;
using org.ohdsi.cdm.framework.shared.Enums;

namespace org.ohdsi.cdm.framework.entities.Omop
{
   public class Entity : IEntity
   {
      public bool IdUndefined { get; set; }
      public bool IsUnique { get; set; }

      public Guid SourceRecordGuid { get; set; }

      public long Id { get; set; }
      public long PersonId { get; set; }
      public long ConceptId { get; set; }
      public DateTime StartDate { get; set; }
      public DateTime? EndDate { get; set; }
      public int? TypeConceptId { get; set; }
      public long? VisitOccurrenceId { get; set; }
      public string SourceValue { get; set; }

      public long? ProviderId { get; set; }
      public string ProviderKey { get; set; }
      
      public Dictionary<string, string> AdditionalFields { get; set; }

      // CDM v5 props
      public long? SourceConceptId { get; set; }
      public string Domain { get; set; }
      public string SourceVocabularyId { get; set; }

      public string LookupKey { get; set; }

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

      public virtual HashSet<long?> GetEraConceptIds()
      {
          return new HashSet<long?> { ConceptId };
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
         SourceValue = ent.SourceValue;
         ProviderId = ent.ProviderId;
         ProviderKey = ent.ProviderKey;
         AdditionalFields = ent.AdditionalFields;
         ValidStartDate = ent.ValidStartDate;
         ValidEndDate = ent.ValidEndDate;
         SourceConceptId = ent.SourceConceptId;
         Domain = ent.Domain;
         SourceVocabularyId = ent.SourceVocabularyId;
         LookupKey = ent.LookupKey;
      }
   }
}
