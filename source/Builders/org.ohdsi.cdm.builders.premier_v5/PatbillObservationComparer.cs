using System.Collections.Generic;
using org.ohdsi.cdm.framework.entities.Omop;

namespace org.ohdsi.cdm.builders.premier_v5
{
   class PatbillObservationComparer : IEqualityComparer<Observation>
   {
      public bool Equals(Observation x, Observation y)
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
                x.ValueAsConceptId == y.ValueAsConceptId &&
                x.ProviderId == y.ProviderId &&
                x.SourceConceptId == y.SourceConceptId &&
                x.VisitOccurrenceId == y.VisitOccurrenceId &&
                x.Time == y.Time &&
                x.SourceValue == y.SourceValue &&
                x_serv_day == y_serv_day;
      }

      public int GetHashCode(Observation m)
      {
         if (ReferenceEquals(m, null)) return 0;

         var serv_day = "";

         if (m.AdditionalFields != null && m.AdditionalFields.ContainsKey("serv_day"))
            serv_day = m.AdditionalFields["serv_day"] ?? "";

         return m.PersonId.GetHashCode() ^
                m.ConceptId.GetHashCode() ^
                (m.StartDate.GetHashCode()) ^
                (m.EndDate.GetHashCode()) ^
                m.TypeConceptId.GetHashCode() ^
                m.VisitOccurrenceId.GetHashCode() ^
                m.ValueAsNumber.GetHashCode() ^
                m.RangeLow.GetHashCode() ^
                m.RangeHigh.GetHashCode() ^
                m.VisitOccurrenceId.GetHashCode() ^
                m.ValueAsConceptId.GetHashCode() ^
                (m.Time != null ? m.Time.GetHashCode() : 0) ^
                m.ProviderId.GetHashCode() ^
                m.SourceConceptId.GetHashCode() ^
                (m.SourceValue != null ? m.SourceValue.GetHashCode() : 0) ^
                serv_day.GetHashCode();
      }
   }
}
