using org.ohdsi.cdm.framework.common.Omop;
using System.Collections.Generic;

namespace org.ohdsi.cdm.framework.etl.premier
{
    class PatbillMeasurementComparer : IEqualityComparer<Measurement>
    {
        public bool Equals(Measurement x, Measurement y)
        {
            if (ReferenceEquals(x, y)) return true;

            if (ReferenceEquals(x, null) || ReferenceEquals(y, null))
                return false;

            var x_serv_day = "";
            var y_serv_day = "";

            if (x.AdditionalFields != null && x.AdditionalFields.ContainsKey("serv_day"))
                x_serv_day = x.AdditionalFields["serv_day"] ?? "";

            if (y.AdditionalFields != null && y.AdditionalFields.ContainsKey("serv_day"))
                y_serv_day = y.AdditionalFields["serv_day"] ?? "";

            return x.PersonId.Equals(y.PersonId) &&
                   x.ConceptId == y.ConceptId &&
                   x.StartDate == y.StartDate &&
                   x.EndDate == y.EndDate &&
                   x.VisitOccurrenceId == y.VisitOccurrenceId &&
                   x.TypeConceptId == y.TypeConceptId &&
                   x.ValueAsNumber == y.ValueAsNumber &&
                   x.RangeLow == y.RangeLow &&
                   x.RangeHigh == y.RangeHigh &&
                   x.OperatorConceptId == y.OperatorConceptId &&
                   x.ValueAsConceptId == y.ValueAsConceptId &&
                   x.UnitConceptId == y.UnitConceptId &&
                   x.ProviderId == y.ProviderId &&
                   x.ValueSourceValue == y.ValueSourceValue &&
                   x.SourceConceptId == y.SourceConceptId &&
                   x.VisitOccurrenceId == y.VisitOccurrenceId &&
                   x.Time == y.Time &&
                   x.UnitSourceValue == y.UnitSourceValue &&
                   x.SourceValue == y.SourceValue &&
                   x_serv_day == y_serv_day;
        }

        public int GetHashCode(Measurement m)
        {
            if (ReferenceEquals(m, null)) return 0;

            var serv_day = "";

            if (m.AdditionalFields != null && m.AdditionalFields.ContainsKey("serv_day"))
                serv_day = m.AdditionalFields["serv_day"] ?? "";

            return m.PersonId.GetHashCode() ^
                   m.ConceptId.GetHashCode() ^
                   m.StartDate.GetHashCode() ^
                   m.EndDate.GetHashCode() ^
                   m.TypeConceptId.GetHashCode() ^
                   m.VisitOccurrenceId.GetHashCode() ^
                   m.ValueAsNumber.GetHashCode() ^
                   m.RangeLow.GetHashCode() ^
                   m.RangeHigh.GetHashCode() ^
                   m.OperatorConceptId.GetHashCode() ^
                   m.VisitOccurrenceId.GetHashCode() ^
                   m.ValueAsConceptId.GetHashCode() ^
                   (m.Time != null ? m.Time.GetHashCode() : 0) ^
                   m.ProviderId.GetHashCode() ^
                   (m.ValueSourceValue != null ? m.ValueSourceValue.GetHashCode() : 0) ^
                   m.SourceConceptId.GetHashCode() ^
                   m.UnitConceptId.GetHashCode() ^
                   (m.UnitSourceValue != null ? m.UnitSourceValue.GetHashCode() : 0) ^
                   (m.SourceValue != null ? m.SourceValue.GetHashCode() : 0) ^
                   serv_day.GetHashCode();
        }
    }
}
