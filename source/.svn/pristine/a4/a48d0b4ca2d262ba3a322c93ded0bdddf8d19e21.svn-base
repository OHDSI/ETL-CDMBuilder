using System.Collections.Generic;
using System.Data;
using System.Linq;
using org.ohdsi.cdm.framework.entities.Builder;
using org.ohdsi.cdm.framework.entities.Omop;

namespace org.ohdsi.cdm.framework.core.Definitions
{
   public class ConditionOccurrenceDefinition : EntityDefinition
   {
      public override IEnumerable<IEntity> GetConcepts(Concept concept, IDataReader reader, KeyMasterOffset keyMaster)
      {
        return base.GetConcepts(concept, reader, keyMaster).Select(e => new ConditionOccurrence((Entity)e));
      }
   }
}
