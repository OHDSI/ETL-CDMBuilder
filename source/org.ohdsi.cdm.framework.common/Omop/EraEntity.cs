using System;

namespace org.ohdsi.cdm.framework.common.Omop
{
    public class EraEntity : Entity, IEquatable<EraEntity>
    {
        public int OccurrenceCount { get; set; }

        // CDM v5 
        public int GapDays { get; set; }

        public bool Equals(EraEntity other)
        {
            return this.PersonId.Equals(other.PersonId) &&
                   this.ConceptId.Equals(other.ConceptId) &&
                   this.StartDate.Equals(other.StartDate) &&
                   this.EndDate.Equals(other.EndDate) &&
                   this.GapDays.Equals(other.GapDays) &&
                   this.TypeConceptId.Equals(other.TypeConceptId) &&
                   this.OccurrenceCount.Equals(other.OccurrenceCount);
        }

        public override int GetHashCode()
        {
            return PersonId.GetHashCode() ^
                   ConceptId.GetHashCode() ^
                   (StartDate.GetHashCode()) ^
                   (EndDate.GetHashCode()) ^
                   TypeConceptId.GetHashCode() ^
                   GapDays.GetHashCode() ^
                   OccurrenceCount.GetHashCode();
        }
    }
}
