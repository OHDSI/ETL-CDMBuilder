using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using org.ohdsi.cdm.framework.entities.Builder;
using org.ohdsi.cdm.framework.entities.Omop;
using org.ohdsi.cdm.framework.shared.Extensions;

namespace org.ohdsi.cdm.framework.core.Definitions
{
   public class ObservationDefinition : EntityDefinition
   {
      public string[] ValuesAsNumber { get; set; }
      public string[] ValuesAsString { get; set; }

      public string RangeLow { get; set; }
      public string RangeHigh { get; set; }

      public string ValueAsConceptId { get; set; }
      public string UnitsConceptId { get; set; }
      public string AssociatedProviderId { get; set; }
      public string RelevantConditionConceptId { get; set; }

      public string UnitsSourceValue { get; set; }

      public string Time { get; set; }

      public KeyValuePair<long?, string> GetUnitConcept(IDataReader reader)
      {
         if (Concepts.Length < 2)
            return new KeyValuePair<long?, string>(null, string.Empty);
         
         var unitsConcepts = base.GetConcepts(Concepts[1], reader, null).ToList();

         if (unitsConcepts.Count > 0)
         {
            return new KeyValuePair<long?, string>(unitsConcepts[0].ConceptId, unitsConcepts[0].SourceValue);
         }

         return new KeyValuePair<long?, string>(null, string.Empty);
      }

      public override IEnumerable<IEntity> GetConcepts(Concept concept, IDataReader reader, KeyMasterOffset keyMaster)
      {
         var obsConcepts = base.GetConcepts(concept, reader, keyMaster).ToList();

         if (obsConcepts.Count > 0)
         {
            var unitConcept = GetUnitConcept(reader);
            long? relevantConditionConceptId = null;

            if (Concepts.Length == 3)
            {
               var relevantConditionConcepts = Concepts[2].GetValues(Vocabulary, Concepts[2].Fields[0], reader);
               
               if(relevantConditionConcepts.Count > 0)
                   relevantConditionConceptId = relevantConditionConcepts.Min(c => c.ConceptId);
            }

            var createObservation = new Func<Observation>(() => new Observation((Entity)obsConcepts[0])
                                                                   {
                                                                      SourceValue = string.IsNullOrWhiteSpace(obsConcepts[0].SourceValue) ? null : obsConcepts[0].SourceValue,
                                                                      RangeLow = reader.GetDecimal(RangeLow),
                                                                      RangeHigh = reader.GetDecimal(RangeHigh),
                                                                      UnitsConceptId = unitConcept.Key ?? 0,
                                                                      UnitsSourceValue = string.IsNullOrWhiteSpace(unitConcept.Value) ? null : unitConcept.Value,
                                                                      ValueAsConceptId = reader.GetInt(ValueAsConceptId) ?? 0,
                                                                      RelevantConditionConceptId = relevantConditionConceptId ?? 0
                                                                   });

            if (ValuesAsNumber != null && ValuesAsNumber.Length > 1)
            {
               foreach (var valueAsNumber in ValuesAsNumber)
               {
                  var value = reader.GetDecimal(valueAsNumber);
                  if (value != null)
                  {
                     var observation = createObservation();
                    
                     observation.ValueAsNumber = Math.Round(value.Value, 3);
                     observation.SourceValue = observation.ValueAsNumber.ToString();
                     observation.TypeConceptId = 38000277;
                     yield return observation;
                  }
               }
            }
            else if (ValuesAsString != null && ValuesAsString.Length > 1)
            {
               foreach (var valueAsString in ValuesAsString)
               {
                  var value = reader.GetString(valueAsString);
                  if (!string.IsNullOrEmpty(value) && value != "-" && value != "9") //TMP
                  {
                     var observation = createObservation();
                     observation.ValueAsString = reader.GetString(valueAsString);
                     observation.SourceValue = valueAsString;
                     observation.TypeConceptId = 38000278;
                     yield return observation;
                  }
               }
            }
            else if (!string.IsNullOrEmpty(obsConcepts[0].SourceValue))
            {
               var observation = createObservation();
               if (ValuesAsNumber != null && ValuesAsNumber.Length > 0)
               {
                  observation.ValueAsNumber = reader.GetDecimal(ValuesAsNumber[0]);
                  if (observation.ValueAsNumber.HasValue)
                  {
                     observation.ValueAsNumber = Math.Round(observation.ValueAsNumber.Value, 3);
                  }
               }
               if (ValuesAsString != null && ValuesAsString.Length > 0)
               {
                  observation.ValueAsString = reader.GetString(ValuesAsString[0]);

                  // Workaround, map ValueAsString (usind SourceLookup) and reset SourceValue to original value
                  if (observation.AdditionalFields != null && observation.AdditionalFields.ContainsKey("original_source"))
                  {
                     observation.ValueAsString = observation.SourceValue;
                     observation.SourceValue = observation.AdditionalFields["original_source"];
                  }
               }

               yield return observation;
            }
         }
      }
   }
}

