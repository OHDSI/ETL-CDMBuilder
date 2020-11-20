using org.ohdsi.cdm.framework.common.Builder;
using org.ohdsi.cdm.framework.common.Extensions;
using org.ohdsi.cdm.framework.common.Omop;
using System.Collections.Generic;
using System.Data;

namespace org.ohdsi.cdm.framework.common.Definitions
{
    public class DeviceExposureDefinition : EntityDefinition
    {
        public string UniqueDeviceId { get; set; }
        public string Quantity { get; set; }

        public override IEnumerable<IEntity> GetConcepts(Concept concept, IDataRecord reader,
            KeyMasterOffsetManager offset)
        {
            foreach (var entity in base.GetConcepts(concept, reader, offset))
            {
                yield return new DeviceExposure(entity)
                {
                    Id = offset.GetKeyOffset(entity.PersonId).DeviceExposureId,
                    UniqueDeviceId = reader.GetString(UniqueDeviceId),
                    Quantity = reader.GetInt(Quantity) ?? 0
                };
            }
        }
    }
}