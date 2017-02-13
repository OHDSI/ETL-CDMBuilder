using System.Collections.Generic;
using System.Data;
using System.Globalization;
using org.ohdsi.cdm.framework.entities.Builder;
using org.ohdsi.cdm.framework.entities.Omop;
using org.ohdsi.cdm.framework.shared.Extensions;

namespace org.ohdsi.cdm.framework.core.Definitions
{
   public class CareSiteDefinition : EntityDefinition
   {
      public string LocationId { get; set; }
      public string Name { get; set; }
      public string PlaceOfSvcSourceValue { get; set; }
      public string PlaceOfSvcConceptId { get; set; }
      public string CareSiteSourceValue { get; set; }

      public override IEnumerable<IEntity> GetConcepts(Concept concept, IDataRecord reader, KeyMasterOffset keyOffset)
      {
         var id = string.IsNullOrEmpty(Id) ? KeyMaster.GetCareSiteId() : reader.GetLong(Id);
         long conceptId = 0;
         if (!string.IsNullOrEmpty(PlaceOfSvcConceptId) && reader.GetLong(PlaceOfSvcConceptId).HasValue)
         {
            conceptId = reader.GetLong(PlaceOfSvcConceptId).Value;
         }

         var locationId = reader.GetLong(LocationId);
         var careSiteSourceValue = string.IsNullOrEmpty(CareSiteSourceValue)
            ? id.Value.ToString(CultureInfo.InvariantCulture)
            : reader.GetString(CareSiteSourceValue);

         yield return new CareSite
                         {
                            Id = id.Value,
                            LocationId = locationId.HasValue ? locationId.Value : 0,
                            PlaceOfSvcSourceValue = reader.GetString(PlaceOfSvcSourceValue),
                            ConceptId = conceptId,
                            Name = reader.GetString(Name),
                            SourceValue = careSiteSourceValue
                         };
      }
   }
}
