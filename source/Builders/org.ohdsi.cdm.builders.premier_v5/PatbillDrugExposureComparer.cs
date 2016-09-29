using System.Collections.Generic;
using org.ohdsi.cdm.framework.entities.Omop;

namespace org.ohdsi.cdm.builders.premier_v5
{
   class PatbillDrugExposureComparer : IEqualityComparer<DrugExposure>
   {
      public bool Equals(DrugExposure x, DrugExposure y)
      {
         if (ReferenceEquals(x, y)) return true;

         if (ReferenceEquals(x, null) || ReferenceEquals(y, null))
            return false;

         return x.ConceptId == y.ConceptId &&
                x.Quantity == y.Quantity &&
                x.ProviderId == y.ProviderId &&
                x.VisitOccurrenceId == y.VisitOccurrenceId &&
                x.StartDate == y.StartDate &&
                (x.AdditionalFields == null ? "" : x.AdditionalFields["source_value"]) == (y.AdditionalFields == null ? "" : y.AdditionalFields["source_value"])&&
                (x.AdditionalFields == null ? "" : x.AdditionalFields["std_chg_code"]) == (y.AdditionalFields == null ? "" : y.AdditionalFields["std_chg_code"]) &&
                (x.AdditionalFields == null ? "" : x.AdditionalFields["serv_day"]) == (y.AdditionalFields == null ? "" : y.AdditionalFields["serv_day"]);
      }

      public int GetHashCode(DrugExposure drugExposure)
      {
         if (ReferenceEquals(drugExposure, null)) return 0;

         return drugExposure.ConceptId.GetHashCode() ^
               drugExposure.Quantity.GetHashCode() ^
               drugExposure.ProviderId.GetHashCode() ^
               drugExposure.VisitOccurrenceId.GetHashCode() ^
               (drugExposure.StartDate.GetHashCode()) ^
               (drugExposure.AdditionalFields == null ? 0 : drugExposure.AdditionalFields["std_chg_code"].GetHashCode()) ^
               (drugExposure.AdditionalFields == null ? 0 : drugExposure.AdditionalFields["serv_day"].GetHashCode());
      }
   }
}
