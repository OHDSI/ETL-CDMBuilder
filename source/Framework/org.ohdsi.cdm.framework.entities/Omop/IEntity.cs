using System;
using System.Collections.Generic;
using org.ohdsi.cdm.framework.shared.Enums;

namespace org.ohdsi.cdm.framework.entities.Omop
{
   public interface IEntity
   {
      bool IsUnique { get; set; }
      Guid SourceRecordGuid { get; set; }
      long Id { get; set; }

      long PersonId { get; set; }
      long ConceptId { get; set; }
      DateTime StartDate { get; set; }
      DateTime? EndDate { get; set; }
      string StartTime { get; set; }
      string EndTime { get; set; }

      int? TypeConceptId { get; set; }
      long? VisitOccurrenceId { get; set; }
      string SourceValue { get; set; }
      string ProviderKey { get; set; }
      long? ProviderId { get; set; }
      Dictionary<string, string> AdditionalFields { get; set; }

      HashSet<long?> GetEraConceptIds();
      DateTime GetEndDate();
      bool IncludeInEra();
      EntityType GeEntityType();

      DateTime ValidStartDate { get; set; }
      DateTime ValidEndDate { get; set; }

      long? SourceConceptId { get; set; }
      string Domain { get; set; }
      string SourceVocabularyId { get; set; }

      string LookupKey { get; set; }
   }
}
