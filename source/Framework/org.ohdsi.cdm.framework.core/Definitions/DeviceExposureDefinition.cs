using System.Collections.Generic;
using System.Data;
using System.Linq;
using org.ohdsi.cdm.framework.entities.Builder;
using org.ohdsi.cdm.framework.entities.Omop;
using org.ohdsi.cdm.framework.shared.Extensions;

namespace org.ohdsi.cdm.framework.core.Definitions
{
   public class DeviceExposureDefinition : EntityDefinition
   {
      public string UniqueDeviceId { get; set; }
      public string Quantity { get; set; }

      public override IEnumerable<IEntity> GetConcepts(Concept concept, IDataRecord reader, KeyMasterOffset keyOffset)
      {
         var de = base.GetConcepts(concept, reader, keyOffset).ToList();
         
         if(de.Count > 0)
         {
            yield return new DeviceExposure(de[0])
                                     {
                                        Id = keyOffset.DeviceExposureId,
                                        UniqueDeviceId = reader.GetString(UniqueDeviceId),
                                        Quantity = reader.GetInt(Quantity) ?? 0
                                     };
            
         }
      }
   }
}
