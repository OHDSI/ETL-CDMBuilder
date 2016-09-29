using System;
using System.Collections.Generic;
using org.ohdsi.cdm.framework.shared.Enums;

namespace org.ohdsi.cdm.framework.entities.Omop
{
   public class ProcedureOccurrence : Entity, IEquatable<ProcedureOccurrence>
   {
      public long? ReleventConditionConceptId { get; set; }
      public List<ProcedureCost> ProcedureCosts { get; set; }

      // CDM v5 props
      public long? ModifierConceptId { get; set; }
      public int? Quantity { get; set; }
      public string QualifierSourceValue { get; set; }

      public ProcedureOccurrence(IEntity ent)
      {
         var proc = ent as ProcedureOccurrence;
         if (proc != null)
         {
            ReleventConditionConceptId = proc.ReleventConditionConceptId;
            ProcedureCosts = proc.ProcedureCosts;

            ModifierConceptId = proc.ModifierConceptId;
            Quantity = proc.Quantity;
            SourceConceptId = proc.SourceConceptId;
            QualifierSourceValue = proc.QualifierSourceValue;
         }

         Init(ent);
      }

      public bool Equals(ProcedureOccurrence other)
      {
         return this.PersonId.Equals(other.PersonId) &&
                this.ConceptId == other.ConceptId &&
                this.ModifierConceptId == other.ModifierConceptId &&
                this.Quantity == other.Quantity &&
                this.SourceConceptId == other.SourceConceptId &&
                this.QualifierSourceValue == other.QualifierSourceValue &&
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
                ModifierConceptId.GetHashCode() ^
                Quantity.GetHashCode() ^
                SourceConceptId.GetHashCode() ^
                (QualifierSourceValue != null ? QualifierSourceValue.GetHashCode() : 0) ^
                (StartDate.GetHashCode()) ^
                (SourceValue != null ? SourceValue.GetHashCode() : 0);
                //^ ReleventConditionConceptId.GetHashCode();
      }

      public override EntityType GeEntityType()
      {
         return EntityType.ProcedureOccurrence;
      }
   }
}
