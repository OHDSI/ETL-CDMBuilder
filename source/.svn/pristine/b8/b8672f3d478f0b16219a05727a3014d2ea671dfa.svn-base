using System.Collections.Generic;
using System.Data;
using org.ohdsi.cdm.framework.entities.Builder;
using org.ohdsi.cdm.framework.entities.Omop;
using org.ohdsi.cdm.framework.shared.Extensions;

namespace org.ohdsi.cdm.framework.core.Definitions
{
   public class CareSiteDefinition : EntityDefinition
   {
      public string LocationId { get; set; }
      public string PlaceOfSvcSourceValue { get; set; }
      public override IEnumerable<IEntity> GetConcepts(Concept concept, IDataReader reader, KeyMasterOffset keyMaster)
      {
         var id = string.IsNullOrEmpty(Id) ? KeyMaster.GetCareSiteId() : int.Parse(reader[Id].ToString());

         yield return new CareSite
                         {
                            Id = id,
                            LocationId = reader.GetLong(LocationId).Value,
                            PlaceOfSvcSourceValue = reader.GetString(PlaceOfSvcSourceValue),
                            SourceValue = id.ToString()
                         };
      }
   }
}
