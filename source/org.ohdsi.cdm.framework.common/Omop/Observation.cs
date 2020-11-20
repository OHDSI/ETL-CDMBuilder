﻿using org.ohdsi.cdm.framework.common.Enums;
using System;
using System.Collections.Generic;

namespace org.ohdsi.cdm.framework.common.Omop
{
    public class Observation : Entity, IEquatable<Observation>
    {
        public decimal? ValueAsNumber { get; set; }
        public decimal? RangeLow { get; set; }
        public decimal? RangeHigh { get; set; }

        public string ValueAsString { get; set; }
        public int ValueAsConceptId { get; set; }
        public int UnitsConceptId { get; set; }
        public int? RelevantConditionConceptId { get; set; }

        public string UnitsSourceValue { get; set; }

        // CDM V5 props
        public int QualifierConceptId { get; set; }
        public string QualifierSourceValue { get; set; }

        public List<ObservationCost> ObservationCost { get; set; }

        public long EventId { get; set; }
        public int EventFieldConceptId { get; set; }
        public DateTime? ValueAsDatetime { get; set; }

        public Observation(IEntity ent)
        {
            Init(ent);

            var obs = ent as Observation;
            if (obs != null)
            {
                QualifierConceptId = obs.QualifierConceptId;
                QualifierSourceValue = obs.QualifierSourceValue;
            }

            var mes = ent as Measurement;
            if (mes != null)
            {
                ValueAsNumber = mes.ValueAsNumber;
                RangeLow = mes.RangeLow;
                RangeHigh = mes.RangeHigh;

                ValueAsConceptId = mes.ValueAsConceptId;
                UnitsConceptId = mes.UnitConceptId;
                UnitsSourceValue = mes.UnitSourceValue;
                ValueAsString = mes.ValueSourceValue;
            }
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
                   this.QualifierConceptId == other.QualifierConceptId &&
                   this.SourceConceptId == other.SourceConceptId &&
                   this.QualifierSourceValue == other.QualifierSourceValue &&
                   this.VisitOccurrenceId == other.VisitOccurrenceId &&
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
                   ProviderId.GetHashCode() ^
                   RelevantConditionConceptId.GetHashCode() ^
                   QualifierConceptId.GetHashCode() ^
                   SourceConceptId.GetHashCode() ^
                   UnitsConceptId.GetHashCode() ^
                   (ValueAsString != null ? ValueAsString.GetHashCode() : 0) ^
                   (UnitsSourceValue != null ? UnitsSourceValue.GetHashCode() : 0) ^
                   (QualifierSourceValue != null ? QualifierSourceValue.GetHashCode() : 0) ^
                   (SourceValue != null ? SourceValue.GetHashCode() : 0);
        }

        public override EntityType GeEntityType()
        {
            return EntityType.Observation;
        }
    }
}
