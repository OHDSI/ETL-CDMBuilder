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

      // CDM v5.2 props
      public string AdmittingSourceConceptId { get; set; }
      public string AdmittingSourceValue { get; set; }
      public string DischargeToConceptId { get; set; }
      public string DischargeToSourceValue { get; set; }
      public string PrecedingVisitOccurrenceId { get; set; }

      public override IEnumerable<IEntity> GetConcepts(Concept concept, IDataRecord reader, KeyMasterOffset keyOffset)
      {
         var visitOccurrences = base.GetConcepts(concept, reader, keyOffset).ToList();
         
         if(visitOccurrences.Count > 0)
         {
            long? dischargeToConceptId = null;
            string dischargeToSourceValue = null;
            if (Concepts.Length > 1)
            {
               var dischargeConcepts = base.GetConcepts(Concepts[1], reader, null).ToList();
               dischargeToSourceValue = reader.GetString(Concepts[1].Fields[0].Key);
               if (dischargeConcepts.Count > 0)
               {
                  dischargeToConceptId = dischargeConcepts[0].ConceptId;
                  dischargeToSourceValue = dischargeConcepts[0].SourceValue;
               }
            }
            else
            {
               dischargeToConceptId = reader.GetLong(DischargeToConceptId);
               dischargeToSourceValue = reader.GetString(DischargeToSourceValue);
            }


            long? admittingSourceConceptId = null;
            string admittingSourceValue = null;
            if (Concepts.Length > 2)
            {
               var admittingConcepts = base.GetConcepts(Concepts[2], reader, null).ToList();
               admittingSourceValue = reader.GetString(Concepts[2].Fields[0].Key);
               if (admittingConcepts.Count > 0)
               {
                  admittingSourceConceptId = admittingConcepts[0].ConceptId;
                  admittingSourceValue = admittingConcepts[0].SourceValue;
               }
            }
            else
            {
               admittingSourceConceptId = reader.GetLong(AdmittingSourceConceptId);
               admittingSourceValue = reader.GetString(AdmittingSourceValue);
            }
            
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
                                        EndTime = endTime,
                                        AdmittingSourceConceptId = admittingSourceConceptId ?? 0,
                                        AdmittingSourceValue = admittingSourceValue,
                                        DischargeToConceptId = dischargeToConceptId ?? 0,
                                        DischargeToSourceValue = dischargeToSourceValue,
                                        PrecedingVisitOccurrenceId = reader.GetInt(PrecedingVisitOccurrenceId)
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
