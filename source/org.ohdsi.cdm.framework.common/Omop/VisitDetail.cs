using org.ohdsi.cdm.framework.common.Enums;
using System;

namespace org.ohdsi.cdm.framework.common.Omop
{
    public class VisitDetail : Entity, IEquatable<VisitDetail>
    {
        public long? CareSiteId { get; set; }

        // CDM v5.2 props
        public int AdmittingSourceConceptId { get; set; }
        public string AdmittingSourceValue { get; set; }
        public int DischargeToConceptId { get; set; }
        public string DischargeToSourceValue { get; set; }
        public long? PrecedingVisitDetailId { get; set; }

        public long? VisitDetailParentId { get; set; }

        public VisitDetail(Entity ent)
        {
            Init(ent);
        }

        public bool Equals(VisitDetail other)
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
                       this.ProviderKey == other.ProviderKey &&
                       this.ProviderId == other.ProviderId &&
                       this.AdmittingSourceConceptId == other.AdmittingSourceConceptId &&
                       this.AdmittingSourceValue == other.AdmittingSourceValue &&
                       this.DischargeToConceptId == other.DischargeToConceptId &&
                       this.DischargeToSourceValue == other.DischargeToSourceValue &&
                       this.PrecedingVisitDetailId == other.PrecedingVisitDetailId &&
                       this.VisitDetailParentId == other.VisitDetailParentId;
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
                   this.ProviderKey == other.ProviderKey &&
                   this.ProviderId == other.ProviderId &&
                   this.AdmittingSourceConceptId == other.AdmittingSourceConceptId &&
                   this.AdmittingSourceValue == other.AdmittingSourceValue &&
                   this.DischargeToConceptId == other.DischargeToConceptId &&
                   this.DischargeToSourceValue == other.DischargeToSourceValue &&
                   this.PrecedingVisitDetailId == other.PrecedingVisitDetailId &&
                   this.VisitDetailParentId == other.VisitDetailParentId;
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
                   (ProviderKey != null ? ProviderKey.GetHashCode() : 0) ^
                   (ProviderId.GetHashCode()) ^
                   DischargeToConceptId.GetHashCode() ^
                   (DischargeToSourceValue != null ? DischargeToSourceValue.GetHashCode() : 0) ^
                   PrecedingVisitDetailId.GetHashCode() ^
                   VisitDetailParentId.GetHashCode();
        }

        public override EntityType GeEntityType()
        {
            return EntityType.VisitDetail;
        }
    }
}
