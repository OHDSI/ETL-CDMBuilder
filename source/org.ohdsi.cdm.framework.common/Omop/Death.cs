using org.ohdsi.cdm.framework.common.Enums;
using System;

namespace org.ohdsi.cdm.framework.common.Omop
{
    public class Death : Entity, IEquatable<Death>
    {
        public bool Primary { get; set; }
        public int? CauseConceptId { get; set; }
        public string CauseSource { get; set; }

        public Death(Entity ent)
        {
            Init(ent);

            var death = ent as Death;
            if (death != null)
            {
                Primary = death.Primary;
                SourceConceptId = death.SourceConceptId;
            }
        }

        public bool Equals(Death other)
        {
            return this.PersonId.Equals(other.PersonId) &&
                   this.ConceptId.Equals(other.ConceptId) &&
                   this.StartDate.Equals(other.StartDate) &&
                   this.EndDate.Equals(other.EndDate) &&
                   this.VisitOccurrenceId.Equals(other.VisitOccurrenceId) &&
                   this.SourceConceptId.Equals(other.SourceConceptId) &&
                   this.TypeConceptId.Equals(other.TypeConceptId) &&
                   this.SourceValue.Equals(other.SourceValue);
        }

        public override int GetHashCode()
        {
            return PersonId.GetHashCode() ^
                   ConceptId.GetHashCode() ^
                   (StartDate.GetHashCode()) ^
                   (EndDate.GetHashCode()) ^
                   TypeConceptId.GetHashCode() ^
                   SourceConceptId.GetHashCode() ^
                   VisitOccurrenceId.GetHashCode() ^
                   (SourceValue != null ? SourceValue.GetHashCode() : 0);
        }

        public override EntityType GeEntityType()
        {
            return EntityType.Death;
        }
    }
}
