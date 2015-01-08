using System;
using System.Collections.Generic;

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
      int? TypeConceptId { get; set; }
      long? VisitOccurrenceId { get; set; }
      string SourceValue { get; set; }
      string ProviderKey { get; set; }
      long? ProviderId { get; set; }
      Dictionary<string, string> AdditionalFields { get; set; }

      HashSet<long?> GetEraConceptIds();
      DateTime GetEndDate();
      bool IncludeInEra();

      DateTime ValidStartDate { get; set; }
      DateTime ValidEndDate { get; set; }
   }
}
