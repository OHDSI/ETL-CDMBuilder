using System;
using System.Collections.Generic;

namespace org.ohdsi.cdm.framework.common.Omop
{
    //public class Note : Entity, IEquatable<Note>
    public class Note : IEquatable<Note>
    {
        public int EncodingConceptId { get; set; }
        public int LanguageConceptId { get; set; }

        public string Title { get; set; }
        public string Text { get; set; }

        public long Id { get; set; }

        public long PersonId { get; set; }
        public DateTime StartDate { get; set; }


        public long? ProviderId { get; set; }

        public int? TypeConceptId { get; set; }

        public long? VisitOccurrenceId { get; set; }

        public long? VisitDetailId { get; set; }

        public int ConceptId { get; set; }

        public string SourceValue { get; set; }

        public long EventId { get; set; }

        public int EventFieldConceptId { get; set; }

        public Dictionary<string, string> AdditionalFields { get; set; }

        public Note()
        {
        }

        public bool Equals(Note other)
        {
            return this.PersonId.Equals(other.PersonId) &&
                   this.ConceptId.Equals(other.ConceptId) &&
                   this.StartDate.Equals(other.StartDate) &&
                   //this.EndDate.Equals(other.EndDate) &&
                   this.VisitOccurrenceId.Equals(other.VisitOccurrenceId) &&
                   //this.SourceConceptId.Equals(other.SourceConceptId) &&
                   this.TypeConceptId.Equals(other.TypeConceptId) &&
                   this.SourceValue.Equals(other.SourceValue);
        }

        public override int GetHashCode()
        {
            return PersonId.GetHashCode() ^
                   ConceptId.GetHashCode() ^
                   (StartDate.GetHashCode()) ^
                   //(EndDate.GetHashCode()) ^
                   TypeConceptId.GetHashCode() ^
                   //SourceConceptId.GetHashCode() ^
                   VisitOccurrenceId.GetHashCode() ^
                   (SourceValue != null ? SourceValue.GetHashCode() : 0);
        }

        //public override EntityType GeEntityType()
        //{
        //   return EntityType.Note;
        //}
    }
}
