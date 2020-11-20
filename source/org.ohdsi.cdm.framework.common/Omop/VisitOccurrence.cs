using org.ohdsi.cdm.framework.common.Enums;
using System;
using System.Collections.Generic;

namespace org.ohdsi.cdm.framework.common.Omop
{
    public class VisitOccurrence : Entity, IEquatable<VisitOccurrence>
    {
        public long? CareSiteId { get; set; }

        // CDM v5 props
        public List<VisitCost> VisitCosts { get; set; }


        // CDM v5.2 props
        public int AdmittingSourceConceptId { get; set; }
        public string AdmittingSourceValue { get; set; }
        public int DischargeToConceptId { get; set; }
        public string DischargeToSourceValue { get; set; }
        public long? PrecedingVisitOccurrenceId { get; set; }

        public VisitOccurrence(Entity ent)
        {
            Init(ent);
        }

        public bool Equals(VisitOccurrence other)
        {
            if (IdUndefined)
            {
                return this.PersonId.Equals(other.PersonId) &&
                       this.ConceptId == other.ConceptId &&
                       this.TypeConceptId == other.TypeConceptId &&
                       this.SourceValue == other.SourceValue &&
                       this.StartDate == other.StartDate &&
                       this.SourceConceptId == other.SourceConceptId &&
                       this.EndDate == other.EndDate &&
                       this.CareSiteId == other.CareSiteId &&
                       this.AdmittingSourceConceptId == other.AdmittingSourceConceptId &&
                       this.AdmittingSourceValue == other.AdmittingSourceValue &&
                       this.DischargeToConceptId == other.DischargeToConceptId &&
                       this.DischargeToSourceValue == other.DischargeToSourceValue &&
                       this.PrecedingVisitOccurrenceId == other.PrecedingVisitOccurrenceId;
            }

            return this.Id.Equals(other.Id) &&
                   this.PersonId.Equals(other.PersonId) &&
                   this.ConceptId == other.ConceptId &&
                   this.TypeConceptId == other.TypeConceptId &&
                   this.SourceValue == other.SourceValue &&
                   this.StartDate == other.StartDate &&
                   this.SourceConceptId == other.SourceConceptId &&
                   this.EndDate == other.EndDate &&
                   this.CareSiteId == other.CareSiteId &&
                   this.AdmittingSourceConceptId == other.AdmittingSourceConceptId &&
                   this.AdmittingSourceValue == other.AdmittingSourceValue &&
                   this.DischargeToConceptId == other.DischargeToConceptId &&
                   this.DischargeToSourceValue == other.DischargeToSourceValue &&
                   this.PrecedingVisitOccurrenceId == other.PrecedingVisitOccurrenceId;
        }

        public override int GetHashCode()
        {
            return Id.GetHashCode() ^
                   PersonId.GetHashCode() ^
                   ConceptId.GetHashCode() ^
                   TypeConceptId.GetHashCode() ^
                   (SourceValue != null ? SourceValue.GetHashCode() : 0) ^
                   SourceConceptId.GetHashCode() ^
                   (CareSiteId.GetHashCode()) ^
                   (StartDate.GetHashCode()) ^
                   (EndDate.GetHashCode()) ^
                   AdmittingSourceConceptId.GetHashCode() ^
                   (AdmittingSourceValue != null ? AdmittingSourceValue.GetHashCode() : 0) ^
                   DischargeToConceptId.GetHashCode() ^
                   (DischargeToSourceValue != null ? DischargeToSourceValue.GetHashCode() : 0) ^
                   PrecedingVisitOccurrenceId.GetHashCode();
        }

        public override EntityType GeEntityType()
        {
            return EntityType.VisitOccurrence;
        }
    }
}
