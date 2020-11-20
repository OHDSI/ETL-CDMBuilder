using org.ohdsi.cdm.framework.common.Builder;
using org.ohdsi.cdm.framework.common.Extensions;
using org.ohdsi.cdm.framework.common.Omop;
using System.Collections.Generic;
using System.Data;

namespace org.ohdsi.cdm.framework.common.Definitions
{
    public class LocationDefinition : EntityDefinition
    {
        public string Zip { get; set; }
        public string Country { get; set; }
        public string State { get; set; }
        public string SourceValue { get; set; }
        public string Address1 { get; set; }
        public string Address2 { get; set; }

        public override IEnumerable<IEntity> GetConcepts(Concept concept, IDataRecord reader,
            KeyMasterOffsetManager keyOffset)
        {
            var loc = new Location
            {
                State = reader.GetString(State),
                SourceValue = reader.GetString(SourceValue),
                County = reader.GetString(Country),
                Address1 = reader.GetString(Address1),
                Address2 = reader.GetString(Address2),
                Zip = reader.GetString(Zip)
            };

            loc.Id = string.IsNullOrEmpty(Id) ? Entity.GetId(loc.GetKey()) : reader.GetLong(Id).Value;
            yield return loc;
        }
    }
}
