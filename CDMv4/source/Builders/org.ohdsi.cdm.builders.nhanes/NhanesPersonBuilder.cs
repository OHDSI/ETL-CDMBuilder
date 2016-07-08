using System;
using System.Collections.Generic;
using org.ohdsi.cdm.framework.core.Base;
using org.ohdsi.cdm.framework.entities.Omop;

namespace org.ohdsi.cdm.builders.nhanes
{
   /// <summary>
   ///  Implementation of PersonBuilder for Nhanes, based on CDM Build spec
   /// </summary>
   public class NhanesPersonBuilder : PersonBuilder
   {
      /// <summary>
      /// Projects Enumeration of ConditionOccurrence from the raw set of ConditionOccurrence entities. 
      /// 	During build:
      /// 	override the condition's start date using the end date of the corresponding observation period.
      /// </summary>
      /// <param name="conditionOccurrences">raw set of condition occurrence entities</param>
      /// <param name="visitOccurrences">the visit occurrence entities for current person</param>
      /// <param name="observationPeriods">the observation period entities for current person</param>
      /// <returns>Enumeration of condition occurrence entities</returns>
      public override IEnumerable<ConditionOccurrence> BuildConditionOccurrences(
         ConditionOccurrence[] conditionOccurrences, Dictionary<long, VisitOccurrence> visitOccurrences,
         ObservationPeriod[] observationPeriods)
      {
         if (observationPeriods.Length != 0)
         {
            foreach (var conditionOccurrence in conditionOccurrences)
            {
               var sourceValue = conditionOccurrence.SourceValue;
               if (sourceValue.Length < 2) continue;

               if (sourceValue.Substring(sourceValue.Length - 2) != "_1") continue;
               if (conditionOccurrence.ConceptId > 0)
               {
                  conditionOccurrence.StartDate = observationPeriods[0].StartDate;
                  conditionOccurrence.EndDate = null;

                  yield return conditionOccurrence;
               }
            }
         }
      }

      /// <summary>
      /// Projects Enumeration of Observations from the raw set of Observation entities. 
      /// During build:
      /// override the observations start date using the start date of the corresponding observation period.
      /// </summary>
      /// <param name="observations">raw set of observations entities</param>
      /// <param name="visitOccurrences">the visit occurrences entities for current person</param>
      /// <param name="observationPeriods">the observation periods entities for current person</param>
      /// <returns>Enumeration of Observation from the raw set of Observation entities</returns>
      public override IEnumerable<Observation> BuildObservations(Observation[] observations,
         Dictionary<long, VisitOccurrence> visitOccurrences,
         ObservationPeriod[] observationPeriods)
      {
         if (observationPeriods.Length != 0)
         {
            var unique = new HashSet<Observation>();
            foreach (var observation in observations)
            {
               if (observation.ConceptId == -999) continue;
               observation.StartDate = observationPeriods[0].StartDate;
               observation.ValueAsConceptId = Convert.ToInt32(observation.UnitsConceptId);
               observation.UnitsConceptId = null;
               observation.UnitsSourceValue = null;

               unique.Add(observation);
            }

            foreach (var observation in unique)
            {
               yield return observation;
            }
         }
      }

      /// <summary>
      /// 	Projects Enumeration of drug exposure from the raw set of drug exposure entities. 
      /// 	During build:
      ///	override the drug's start/end date using the end date of the corresponding observation period.
      /// </summary>
      /// <param name="drugExposures">raw set of drug exposures entities</param>
      /// <param name="visitOccurrences">the visit occurrences entities for current person</param>
      /// <param name="observationPeriods">the observation periods entities for current person</param>
      /// <returns>Enumeration of drug exposure entities</returns>
      public override IEnumerable<DrugExposure> BuildDrugExposures(DrugExposure[] drugExposures,
         Dictionary<long, VisitOccurrence> visitOccurrences,
         ObservationPeriod[] observationPeriods)
      {
         if (observationPeriods.Length != 0)
         {
            foreach (var drugExposure in drugExposures)
            {
               drugExposure.StartDate = drugExposure.DaysSupply.HasValue
                  ? observationPeriods[0].EndDate.AddDays(drugExposure.DaysSupply.Value*-1)
                  : observationPeriods[0].EndDate;

               drugExposure.EndDate = observationPeriods[0].EndDate;
               yield return drugExposure;
            }
         }
      }

      public NhanesPersonBuilder(ChunkBuilder chunkBuilder)
         : base(chunkBuilder)
      {
      }
   }
}
