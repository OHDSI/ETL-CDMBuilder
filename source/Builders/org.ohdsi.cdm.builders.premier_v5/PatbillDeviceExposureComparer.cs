using System.Collections.Generic;
using org.ohdsi.cdm.framework.entities.Omop;

namespace org.ohdsi.cdm.builders.premier_v5
{
   class PatbillDeviceExposureComparer : IEqualityComparer<DeviceExposure>
   {
      public bool Equals(DeviceExposure x, DeviceExposure y)
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
                x.TypeConceptId == y.TypeConceptId &&
                x.SourceValue == y.SourceValue &&
                x.StartDate == y.StartDate &&
                x.SourceConceptId == y.SourceConceptId &&
                x.UniqueDeviceId == y.UniqueDeviceId &&
                x.Quantity == y.Quantity &&
                x.ProviderId == y.ProviderId &&
                x.EndDate == y.EndDate &&
                x_serv_day == y_serv_day;
      }

      public int GetHashCode(DeviceExposure d)
      {
         if (ReferenceEquals(d, null)) return 0;

         var serv_day = "";

         if (d.AdditionalFields != null && d.AdditionalFields.ContainsKey("serv_day"))
            serv_day = d.AdditionalFields["serv_day"] ?? "";

         return d.PersonId.GetHashCode() ^
                d.ConceptId.GetHashCode() ^
                d.TypeConceptId.GetHashCode() ^
                d.ProviderId.GetHashCode() ^
                d.Quantity.GetHashCode() ^
                (d.SourceValue != null ? d.SourceValue.GetHashCode() : 0) ^
                (d.SourceConceptId.HasValue ? d.SourceConceptId.Value.GetHashCode() : 0) ^
                (d.UniqueDeviceId != null ? d.UniqueDeviceId.GetHashCode() : 0) ^
                (d.StartDate.GetHashCode()) ^
                (d.EndDate.GetHashCode()) ^
                serv_day.GetHashCode();
      }
   }
}
