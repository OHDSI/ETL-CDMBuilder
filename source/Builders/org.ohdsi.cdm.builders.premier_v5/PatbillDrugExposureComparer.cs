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

         var x_serv_day = "";
         var y_serv_day = "";

         if (x.AdditionalFields != null && x.AdditionalFields.ContainsKey("serv_day"))
            x_serv_day = x.AdditionalFields["serv_day"] ?? "";

         if (y.AdditionalFields != null && y.AdditionalFields.ContainsKey("serv_day"))
            y_serv_day = y.AdditionalFields["serv_day"] ?? "";

         var x_source_value = "";
         var y_source_value = "";

         if (x.AdditionalFields != null && x.AdditionalFields.ContainsKey("source_value"))
            x_source_value = x.AdditionalFields["source_value"] ?? "";

         if (y.AdditionalFields != null && y.AdditionalFields.ContainsKey("source_value"))
            y_source_value = y.AdditionalFields["source_value"] ?? "";

         var x_std_chg_code = "";
         var y_std_chg_code = "";

         if (x.AdditionalFields != null && x.AdditionalFields.ContainsKey("std_chg_code"))
            x_std_chg_code = x.AdditionalFields["std_chg_code"] ?? "";

         if (y.AdditionalFields != null && y.AdditionalFields.ContainsKey("std_chg_code"))
            y_std_chg_code = y.AdditionalFields["std_chg_code"] ?? "";

         return x.ConceptId == y.ConceptId &&
                x.Quantity == y.Quantity &&
                x.ProviderId == y.ProviderId &&
                x.VisitOccurrenceId == y.VisitOccurrenceId &&
                x.StartDate == y.StartDate &&
                x_source_value == y_source_value &&
                x_std_chg_code == y_std_chg_code &&
                x_serv_day == y_serv_day;
      }

      public int GetHashCode(DrugExposure drugExposure)
      {
         if (ReferenceEquals(drugExposure, null)) return 0;

         var serv_day = "";

         if (drugExposure.AdditionalFields != null && drugExposure.AdditionalFields.ContainsKey("serv_day"))
            serv_day = drugExposure.AdditionalFields["serv_day"] ?? "";

         var std_chg_code = "";

         if (drugExposure.AdditionalFields != null && drugExposure.AdditionalFields.ContainsKey("std_chg_code"))
            std_chg_code = drugExposure.AdditionalFields["std_chg_code"] ?? "";

         return drugExposure.ConceptId.GetHashCode() ^
               drugExposure.Quantity.GetHashCode() ^
               drugExposure.ProviderId.GetHashCode() ^
               drugExposure.VisitOccurrenceId.GetHashCode() ^
               (drugExposure.StartDate.GetHashCode()) ^
               std_chg_code.GetHashCode() ^
               serv_day.GetHashCode();
      }
   }
}
