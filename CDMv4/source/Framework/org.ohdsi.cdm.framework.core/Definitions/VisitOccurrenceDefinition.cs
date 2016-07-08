using System.Collections.Generic;
using System.Data;
using System.Linq;
using org.ohdsi.cdm.framework.entities.Builder;
using org.ohdsi.cdm.framework.entities.Omop;
using org.ohdsi.cdm.framework.shared.Extensions;

namespace org.ohdsi.cdm.framework.core.Definitions
{
   public class VisitOccurrenceDefinition : EntityDefinition
   {
      public string CareSiteId { get; set; }

      public override IEnumerable<IEntity> GetConcepts(Concept concept, IDataReader reader, KeyMasterOffset keyMaster)
      {
         var visitOccurrences = base.GetConcepts(concept, reader, keyMaster).ToList();
         
         if(visitOccurrences.Count > 0)
         {
            var id = reader.GetLong(Id);
            var visitOccurrence = new VisitOccurrence((Entity) visitOccurrences[0])
                                     {
                                        CareSiteId = reader.GetInt(CareSiteId) ?? 0
                                     };
            if(id.HasValue)
            {
               visitOccurrence.Id = id.Value;
            }
            else
            {
               visitOccurrence.IdUndefined = true;
            }

            yield return visitOccurrence;
         }
      }
   }
}
