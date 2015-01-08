using System;

namespace org.ohdsi.cdm.framework.entities.Omop
{
   public class ConditionOccurrence : Entity, IEquatable<ConditionOccurrence>
   {
      public ConditionOccurrence(Entity ent)
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
                ProviderId.GetHashCode() ^
                (SourceValue != null ? SourceValue.GetHashCode() : 0);
      }
   }
}
