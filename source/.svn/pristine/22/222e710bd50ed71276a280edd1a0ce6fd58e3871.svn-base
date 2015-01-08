using System;

namespace org.ohdsi.cdm.framework.entities.Omop
{
    public class Cohort : Entity, IEquatable<Cohort>
    {
        public string StopReason { get; set; }

        public Cohort(Entity ent)
        {
            Init(ent);

            var cohort = ent as Cohort;
            if (cohort != null)
            {
                StopReason = cohort.StopReason;
            }
        }

        public bool Equals(Cohort other)
        {
            return this.PersonId.Equals(other.PersonId) &&
                   this.ConceptId.Equals(other.ConceptId) &&
                   this.StartDate.Equals(other.StartDate) &&
                   this.StopReason.Equals(other.StopReason) &&
                   this.EndDate.Equals(other.EndDate);
        }

        public override int GetHashCode()
        {
            return PersonId.GetHashCode() ^
                   ConceptId.GetHashCode() ^
                   (StartDate.GetHashCode()) ^
                   (EndDate.GetHashCode()) ^
                   StopReason.GetHashCode();
        }
    }
}
