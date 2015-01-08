using System;

namespace org.ohdsi.cdm.framework.entities.Omop
{
   public class Observation : Entity, IEquatable<Observation>
   {
      public decimal? ValueAsNumber { get; set; }
      public decimal? RangeLow { get; set; }
      public decimal? RangeHigh { get; set; }

      public string ValueAsString { get; set; }
      public long? ValueAsConceptId { get; set; }
      public long? UnitsConceptId { get; set; }
      public long? RelevantConditionConceptId { get; set; }

      public string UnitsSourceValue { get; set; }

      public TimeSpan? Time { get; set; }

      public Observation(Entity ent)
      {
         Init(ent);
      }

      public bool Equals(Observation other)
      {
         return this.PersonId.Equals(other.PersonId) &&
                this.ConceptId == other.ConceptId &&
                this.StartDate == other.StartDate &&
                this.EndDate == other.EndDate &&
                this.VisitOccurrenceId == other.VisitOccurrenceId &&
                this.TypeConceptId == other.TypeConceptId &&
                this.ValueAsNumber == other.ValueAsNumber &&
                this.RangeLow == other.RangeLow &&
                this.RangeHigh == other.RangeHigh &&
                this.ValueAsString == other.ValueAsString &&
                this.ValueAsConceptId == other.ValueAsConceptId &&
                this.UnitsConceptId == other.UnitsConceptId &&
                this.ProviderId == other.ProviderId &&
                this.RelevantConditionConceptId == other.RelevantConditionConceptId &&
                this.VisitOccurrenceId == other.VisitOccurrenceId &&
                this.Time == other.Time &&
                this.UnitsSourceValue == other.UnitsSourceValue &&
                this.SourceValue == other.SourceValue;
      }

      public override int GetHashCode()
      {
         return PersonId.GetHashCode() ^
                ConceptId.GetHashCode() ^
                (StartDate.GetHashCode()) ^
                (EndDate.GetHashCode()) ^
                TypeConceptId.GetHashCode() ^
                VisitOccurrenceId.GetHashCode() ^
                ValueAsNumber.GetHashCode() ^
                RangeLow.GetHashCode() ^
                RangeHigh.GetHashCode() ^
                VisitOccurrenceId.GetHashCode() ^
                ValueAsConceptId.GetHashCode() ^
                Time.GetHashCode() ^
                ProviderId.GetHashCode() ^
                RelevantConditionConceptId.GetHashCode() ^
                UnitsConceptId.GetHashCode() ^
                (ValueAsString != null ? ValueAsString.GetHashCode() : 0) ^
                (UnitsSourceValue != null ? UnitsSourceValue.GetHashCode() : 0) ^
                (SourceValue != null ? SourceValue.GetHashCode() : 0);
      }
   }
}
