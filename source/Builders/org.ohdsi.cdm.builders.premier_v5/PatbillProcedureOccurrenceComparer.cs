using System.Collections.Generic;
using org.ohdsi.cdm.framework.entities.Omop;

namespace org.ohdsi.cdm.builders.premier_v5
{
   class PatbillProcedureOccurrenceComparer : IEqualityComparer<ProcedureOccurrence>
   {
      public bool Equals(ProcedureOccurrence x, ProcedureOccurrence y)
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
                x.ModifierConceptId == y.ModifierConceptId &&
                x.Quantity == y.Quantity &&
                x.SourceConceptId == y.SourceConceptId &&
                x.QualifierSourceValue == y.QualifierSourceValue &&
                x.TypeConceptId == y.TypeConceptId &&
                x.StartDate == y.StartDate &&
                x.VisitOccurrenceId == y.VisitOccurrenceId &&
                x.SourceValue == y.SourceValue &&
                x_serv_day == y_serv_day;
      }

      public int GetHashCode(ProcedureOccurrence p)
      {
         if (ReferenceEquals(p, null)) return 0;

         var serv_day = "";

         if (p.AdditionalFields != null && p.AdditionalFields.ContainsKey("serv_day"))
            serv_day = p.AdditionalFields["serv_day"] ?? "";

         return p.PersonId.GetHashCode() ^
                p.ConceptId.GetHashCode() ^
                p.TypeConceptId.GetHashCode() ^
                p.VisitOccurrenceId.GetHashCode() ^
                p.ModifierConceptId.GetHashCode() ^
                p.Quantity.GetHashCode() ^
                p.SourceConceptId.GetHashCode() ^
                (p.QualifierSourceValue != null ? p.QualifierSourceValue.GetHashCode() : 0) ^
                (p.StartDate.GetHashCode()) ^
                (p.SourceValue != null ? p.SourceValue.GetHashCode() : 0) ^
                serv_day.GetHashCode();
      }
   }
}
