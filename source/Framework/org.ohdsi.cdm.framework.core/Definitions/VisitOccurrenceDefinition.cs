using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using org.ohdsi.cdm.framework.entities.Builder;
using org.ohdsi.cdm.framework.entities.Omop;
using org.ohdsi.cdm.framework.shared.Extensions;

namespace org.ohdsi.cdm.framework.core.Definitions
{
   public class VisitOccurrenceDefinition : EntityDefinition
   {
      public string CareSiteId { get; set; }

      // CDM v5 props
      public string StartTime { get; set; }
      public string EndTime { get; set; }

      public override IEnumerable<IEntity> GetConcepts(Concept concept, IDataRecord reader, KeyMasterOffset keyOffset)
      {
         var visitOccurrences = base.GetConcepts(concept, reader, keyOffset).ToList();
         
         if(visitOccurrences.Count > 0)
         {
            var id = reader.GetLong(Id);

            string startTime = null;
            string endTime = null;

            if (!string.IsNullOrEmpty(StartTime))
            {
               DateTime dt;
               if (DateTime.TryParse(reader.GetString(StartTime), out dt))
               {
                  startTime = dt.ToString("HH:mm:ss", CultureInfo.InvariantCulture);
               }
            }

            if (!string.IsNullOrEmpty(EndTime))
            {
               DateTime dt;
               if (DateTime.TryParse(reader.GetString(EndTime), out dt))
               {
                  endTime = dt.ToString("HH:mm:ss", CultureInfo.InvariantCulture);
               }
            }

            var visitOccurrence = new VisitOccurrence((Entity) visitOccurrences[0])
                                     {
                                        CareSiteId = reader.GetInt(CareSiteId) ?? 0,
                                        StartTime = startTime,
                                        EndTime = endTime
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
