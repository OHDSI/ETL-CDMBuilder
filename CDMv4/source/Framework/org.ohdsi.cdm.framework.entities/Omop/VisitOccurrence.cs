using System;

namespace org.ohdsi.cdm.framework.entities.Omop 
{
   public class VisitOccurrence : Entity, IEquatable<VisitOccurrence>
   {
      public int? CareSiteId { get; set; }
      
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
                   this.EndDate == other.EndDate &&
                   this.CareSiteId == other.CareSiteId;
         }

         return this.Id.Equals(other.Id) &&
                this.PersonId.Equals(other.PersonId) &&
                this.ConceptId == other.ConceptId &&
                this.TypeConceptId == other.TypeConceptId &&
                this.SourceValue == other.SourceValue &&
                this.StartDate == other.StartDate &&
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
                (CareSiteId.GetHashCode()) ^
                (StartDate.GetHashCode()) ^
                (EndDate.GetHashCode());
      }
   }
}
