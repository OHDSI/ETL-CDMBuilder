using org.ohdsi.cdm.framework.common.Enums;
using System;
using System.Collections.Generic;

namespace org.ohdsi.cdm.framework.common.Omop
{
    public interface IEntity
    {
        bool IsUnique { get; set; }
        Guid SourceRecordGuid { get; set; }
        long Id { get; set; }

        long PersonId { get; set; }
        int ConceptId { get; set; }
        string ConceptIdKey { get; set; }
        DateTime StartDate { get; set; }
        DateTime? EndDate { get; set; }

        int? TypeConceptId { get; set; }
        long? VisitOccurrenceId { get; set; }
        long? VisitDetailId { get; set; }
        string SourceValue { get; set; }
        string ProviderKey { get; set; }
        long? ProviderId { get; set; }
        Dictionary<string, string> AdditionalFields { get; set; }

        List<int> Ingredients { get; set; }
        DateTime GetEndDate();
        bool IncludeInEra();
        EntityType GeEntityType();

        DateTime ValidStartDate { get; set; }
        DateTime ValidEndDate { get; set; }

        int SourceConceptId { get; set; }
        string Domain { get; set; }
        //string SourceVocabularyId { get; set; }

        string VocabularySourceValue { get; set; }

        string GetKey();
    }
}
