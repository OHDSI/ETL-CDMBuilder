using org.ohdsi.cdm.framework.common.Enums;
using System;

namespace org.ohdsi.cdm.framework.common.Omop
{
    public class ConditionOccurrence : Entity, IEquatable<ConditionOccurrence>
    {
        public int StatusConceptId { get; set; }
        public string StatusSourceValue { get; set; }

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
                   this.StatusConceptId.Equals(other.StatusConceptId) &&
                   this.VisitOccurrenceId.Equals(other.VisitOccurrenceId) &&
                   this.TypeConceptId.Equals(other.TypeConceptId) &&
                   string.Equals(this.StopReason, other.StopReason) &&
                   string.Equals(this.StatusSourceValue, other.StatusSourceValue) &&
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
                   StatusConceptId.GetHashCode() ^
                   VisitOccurrenceId.GetHashCode() ^
                   (StopReason != null ? StopReason.GetHashCode() : 0) ^
                   SourceConceptId.GetHashCode() ^
                   ProviderId.GetHashCode() ^
                   (StatusSourceValue != null ? StatusSourceValue.GetHashCode() : 0) ^
                   (SourceValue != null ? SourceValue.GetHashCode() : 0);
        }

        public override EntityType GeEntityType()
        {
            return EntityType.ConditionOccurrence;
        }
    }
}
