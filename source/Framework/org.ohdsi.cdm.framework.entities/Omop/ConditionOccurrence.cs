using System;
using org.ohdsi.cdm.framework.shared.Enums;

namespace org.ohdsi.cdm.framework.entities.Omop
{
   public class ConditionOccurrence : Entity, IEquatable<ConditionOccurrence>
   {
      public ConditionOccurrence(IEntity ent)
      {
         StopReason = null;
         Init(ent);
      }
      
      public string StopReason { get; set; }
      //public int AssociatedProviderId { get; set; }

      public override bool IncludeInEra()
      {
         if (ConceptId == 0) return false;

         return base.IncludeInEra();
      }

      public bool Equals(ConditionOccurrence other)
      {
         return this.PersonId.Equals(other.PersonId) &&
                this.ConceptId.Equals(other.ConceptId) &&
                this.StartDate.Equals(other.StartDate) &&
                this.EndDate.Equals(other.EndDate) &&
                this.VisitOccurrenceId.Equals(other.VisitOccurrenceId) &&
                this.TypeConceptId.Equals(other.TypeConceptId) &&
                string.Equals(this.StopReason, other.StopReason) &&
                this.SourceConceptId == other.SourceConceptId &&
                this.ProviderId.Equals(other.ProviderId) &&
                this.SourceValue.Equals(other.SourceValue);
      }

      public override int GetHashCode()
      {
         return PersonId.GetHashCode() ^
                ConceptId.GetHashCode() ^
                (StartDate.GetHashCode()) ^
                (EndDate.GetHashCode()) ^
                TypeConceptId.GetHashCode() ^
                VisitOccurrenceId.GetHashCode() ^
                (StopReason != null ? StopReason.GetHashCode() : 0) ^
                (SourceConceptId.HasValue ? SourceConceptId.Value.GetHashCode() : 0) ^
                ProviderId.GetHashCode() ^
                (SourceValue != null ? SourceValue.GetHashCode() : 0);
      }

      public override EntityType GeEntityType()
      {
         return EntityType.ConditionOccurrence;
      }
   }
}
