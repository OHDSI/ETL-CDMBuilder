using System;
using System.Collections.Generic;
using org.ohdsi.cdm.framework.shared.Enums;

namespace org.ohdsi.cdm.framework.entities.Omop
{
   public class Measurement  : Entity, IEquatable<Measurement>
   {
      public string Time { get; set; }
      public long? OperatorConceptId { get; set; }
      public decimal? ValueAsNumber { get; set; }
      public long? ValueAsConceptId { get; set; }
      public long? UnitConceptId { get; set; }
      public decimal? RangeLow { get; set; }
      public decimal? RangeHigh { get; set; }
      public string UnitSourceValue { get; set; }
      public string ValueSourceValue { get; set; }

      public List<MeasurementCost> MeasurementCost { get; set; }

      public Measurement(IEntity ent)
      {
         Init(ent);

         var obs = ent as Observation;
         if (obs != null)
         {
            ValueAsNumber = obs.ValueAsNumber;
            RangeLow = obs.RangeLow;
            RangeHigh = obs.RangeHigh;

            ValueAsConceptId = obs.ValueAsConceptId;
            UnitConceptId = obs.UnitsConceptId;
            UnitSourceValue = obs.UnitsSourceValue;
            ValueSourceValue = obs.ValueAsString;
         }
      }

      public bool Equals(Measurement other)
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
                this.OperatorConceptId == other.OperatorConceptId &&
                this.ValueAsConceptId == other.ValueAsConceptId &&
                this.UnitConceptId == other.UnitConceptId &&
                this.ProviderId == other.ProviderId &&
                this.ValueSourceValue == other.ValueSourceValue &&
                this.SourceConceptId == other.SourceConceptId &&
                this.VisitOccurrenceId == other.VisitOccurrenceId &&
                this.Time == other.Time &&
                this.UnitSourceValue == other.UnitSourceValue &&
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
                OperatorConceptId.GetHashCode() ^
                VisitOccurrenceId.GetHashCode() ^
                ValueAsConceptId.GetHashCode() ^
                (Time != null ? Time.GetHashCode() : 0) ^
                ProviderId.GetHashCode() ^
                (ValueSourceValue != null ? ValueSourceValue.GetHashCode() : 0) ^
                SourceConceptId.GetHashCode() ^
                UnitConceptId.GetHashCode() ^
                (UnitSourceValue != null ? UnitSourceValue.GetHashCode() : 0) ^
                (SourceValue != null ? SourceValue.GetHashCode() : 0);
      }

      public override EntityType GeEntityType()
      {
         return EntityType.Measurement;
      }
   }
}
