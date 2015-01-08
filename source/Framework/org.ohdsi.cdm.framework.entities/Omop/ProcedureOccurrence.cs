using System;
using System.Collections.Generic;

namespace org.ohdsi.cdm.framework.entities.Omop
{
   public class ProcedureOccurrence : Entity, IEquatable<ProcedureOccurrence>
   {
      public long? ReleventConditionConceptId { get; set; }
      public List<ProcedureCost> ProcedureCosts { get; set; }

      public ProcedureOccurrence(Entity ent)
      {
         var proc = ent as ProcedureOccurrence;
         if (proc != null)
         {
            ReleventConditionConceptId = proc.ReleventConditionConceptId;
            ProcedureCosts = proc.ProcedureCosts;
         }

         Init(ent);
      }

      public bool Equals(ProcedureOccurrence other)
      {
         return this.PersonId.Equals(other.PersonId) &&
                this.ConceptId == other.ConceptId &&
                this.TypeConceptId == other.TypeConceptId &&
                this.StartDate == other.StartDate &&
                this.VisitOccurrenceId == other.VisitOccurrenceId &&
                this.SourceValue == other.SourceValue;
                //&& this.ReleventConditionConceptId == other.ReleventConditionConceptId;
      }

      public override int GetHashCode()
      {
         return PersonId.GetHashCode() ^
                ConceptId.GetHashCode() ^
                TypeConceptId.GetHashCode() ^
                VisitOccurrenceId.GetHashCode() ^
                (StartDate.GetHashCode()) ^
                (SourceValue != null ? SourceValue.GetHashCode() : 0);
                //^ ReleventConditionConceptId.GetHashCode();
      }
   }
}
