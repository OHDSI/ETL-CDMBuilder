using System;
using System.Collections.Generic;
using org.ohdsi.cdm.framework.shared.Enums;

namespace org.ohdsi.cdm.framework.entities.Omop 
{
   public class VisitOccurrence : Entity, IEquatable<VisitOccurrence>
   {
      public int? CareSiteId { get; set; }

      // CDM v5 props
      public string StartTime { get; set; }
      public string EndTime { get; set; }
      public List<VisitCost> VisitCosts { get; set; }
      
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
                   this.StartTime == other.StartTime &&
                   this.EndTime == other.EndTime &&
                   this.SourceConceptId == other.SourceConceptId &&
                   this.EndDate == other.EndDate &&
                   this.CareSiteId == other.CareSiteId;
         }

         return this.Id.Equals(other.Id) &&
                this.PersonId.Equals(other.PersonId) &&
                this.ConceptId == other.ConceptId &&
                this.TypeConceptId == other.TypeConceptId &&
                this.SourceValue == other.SourceValue &&
                this.StartDate == other.StartDate &&
                this.StartTime == other.StartTime &&
                this.EndTime == other.EndTime &&
                this.SourceConceptId == other.SourceConceptId &&
                this.EndDate == other.EndDate &&
                this.CareSiteId == other.CareSiteId;
      }

      public override int GetHashCode()
      {
         return Id.GetHashCode() ^
                PersonId.GetHashCode() ^
                ConceptId.GetHashCode() ^
                TypeConceptId.GetHashCode() ^
                (SourceValue != null ? SourceValue.GetHashCode() : 0) ^
                (StartTime != null ? StartTime.GetHashCode() : 0) ^
                (EndTime != null ? EndTime.GetHashCode() : 0) ^
                (SourceConceptId.HasValue ? SourceConceptId.Value.GetHashCode() : 0) ^
                (CareSiteId.GetHashCode()) ^
                (StartDate.GetHashCode()) ^
                (EndDate.GetHashCode());
      }

      public override EntityType GeEntityType()
      {
         return EntityType.VisitOccurrence;
      }
   }
}
