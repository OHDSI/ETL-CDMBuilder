using System.Collections.Generic;
using System.Linq;
using org.ohdsi.cdm.framework.core.Base;
using org.ohdsi.cdm.framework.entities.Omop;
using org.ohdsi.cdm.framework.shared.Extensions;

namespace org.ohdsi.cdm.builders.cprd
{
   /// <summary>
   ///  Implementation of PersonBuilder for CPRD, based on CDM Build spec
   /// </summary>
   public class CprdPersonBuilder : PersonBuilder
   {
      public CprdPersonBuilder(ChunkBuilder chunkBuilder)
         : base(chunkBuilder)
      {
      }
      
      /// <summary>
      /// Build person entity and all person related entities like: DrugExposures, ConditionOccurrences, ProcedureOccurrences... from raw data sets 
      /// </summary>
      public override void Build()
      {
         var person = BuildPerson(personRecords.ToList());
         if (person == null) return;

         var observationPeriods = BuildObservationPeriods(person.ObservationPeriodGap, observationPeriodsRaw.ToArray()).ToArray();
         var payerPlanPeriods = BuildPayerPlanPeriods(payerPlanPeriodsRaw.ToArray(), null).ToArray();
         var cohort = BuildCohort(cohortRecords.ToArray(), observationPeriods).ToArray();

         // Build and clenaup visit occurrences entities
         var visitOccurrences =
            CleanupVisits(BuildVisitOccurrences(visitOccurrencesRaw.ToArray(), observationPeriods), cohort,
               observationPeriods).ToDictionary(visitOccurrence => visitOccurrence.Id);

         var drugExposures = BuildDrugExposures(drugExposuresRaw.ToArray(), visitOccurrences, observationPeriods).ToArray();
         var conditionOccurrences = Cleanup(BuildConditionOccurrences(conditionOccurrencesRaw.ToArray(), visitOccurrences, observationPeriods), cohort).ToArray();
         var procedureOccurrences = Cleanup(BuildProcedureOccurrences(procedureOccurrencesRaw.ToArray(), visitOccurrences, observationPeriods), cohort).ToArray();
         var observations = Cleanup(BuildObservations(observationsRaw.ToArray(), visitOccurrences, observationPeriods), cohort).ToArray();

         // set corresponding PlanPeriodIds to drug exposure entities and procedure occurrence entities
         SetPayerPlanPeriodId(payerPlanPeriods, drugExposures, procedureOccurrences);

         // set corresponding ProviderIds
         SetProviderIds(drugExposures);
         SetProviderIds(conditionOccurrences);
         SetProviderIds(procedureOccurrences);
         SetProviderIds(observations);

         var drugEra = BuildDrugEra(drugExposures).ToArray();
         var conditionEra = BuildConditionEra(conditionOccurrences).ToArray();

         var death = BuildDeath(deathRecords.ToArray(), visitOccurrences, observationPeriods);
         var drugCosts = BuildDrugCosts(drugExposures).ToArray();
         var procedureCosts = BuildProcedureCosts(procedureOccurrences).ToArray();

         // push built entities to ChunkBuilder for further save to CDM database
         AddToChunk(person, death, observationPeriods, payerPlanPeriods, drugExposures, drugEra, drugCosts,
            conditionOccurrences, conditionEra, procedureOccurrences, procedureCosts, observations, visitOccurrences.Values.ToArray(), cohort);
      }

      /// <summary>
      /// Projects Enumeration of Observations from the raw set of Observation entities. 
      /// During build:
      /// override the observations start date using the start date of the corresponding obervation period.
      /// overide TypeConceptId per CDM Mapping spec.
      /// exclude the observations without observation periods and observation that out of current observation period
      /// </summary>
      /// <param name="observations">raw set of observations entities</param>
      /// <param name="visitOccurrences">the visit occurrences entities for current person</param>
      /// <param name="observationPeriods">the observation periods entities for current person</param>
      /// <returns>Enumeration of Observation from the raw set of Observation entities</returns>
      public override IEnumerable<Observation> BuildObservations(Observation[] observations,
         Dictionary<long, VisitOccurrence> visitOccurrences,
         ObservationPeriod[] observationPeriods)
      {
         foreach (var observation in observations)
         {
            // exclude observations for person without observation periods
            if (!observationPeriods.Any()) continue;

            //Medical History Read code records
            if (observation.TypeConceptId >= 1 && observation.TypeConceptId <= 3)
            {
               // Medical history records are additional observation read code records that occur prior to the observation period start date
               if (observation.StartDate < observationPeriods[0].StartDate)
               {
                  // assign Concept Type:
                  switch (observation.TypeConceptId)
                  {
                     case 1:
                        observation.TypeConceptId = 38000245;
                        break;
                     case 2:
                        observation.TypeConceptId = 38000280;
                        break;
                     case 3:
                        observation.TypeConceptId = 42898140;
                        break;
                  }

                  // set VisitOccurrenceId, ValueAsConceptId, ConceptId, StartDate based on CDM Build spec for Medical History Read code records
                  observation.VisitOccurrenceId = null;
                  observation.ValueAsConceptId = observation.ConceptId;
                  observation.ConceptId = 43054928;
                  observation.StartDate = observationPeriods[0].StartDate;

                  yield return observation;
               }

            }
            else if (observation.StartDate.Between(observationPeriods[0].StartDate, observationPeriods[0].EndDate))
            {
               // set to NULL VisitOccurrenceId for not existing VisitOccurrenceIds
               if (observation.VisitOccurrenceId != null &&
                   !visitOccurrences.ContainsKey(observation.VisitOccurrenceId.Value))
                  observation.VisitOccurrenceId = null;

               yield return observation;
            }
         }
      }

      /// <summary>
      /// Projects Enumeration of Cohort from the raw set of Cohort entities. 
      /// During build:
      /// override the cohort's start date using the start date of the corresponding obervation period.
      /// override the cohort's end date using the end date of the corresponding obervation period.
      /// exclude the cohort's without observation periods
      ///  </summary>
      /// <param name="cohort">raw set of Cohort entities</param>
      /// <param name="observationPeriods">the observation periods entities for current person</param>
      /// <returns>Enumeration of Cohort from the raw set of Cohort entities</returns>
      public override IEnumerable<Cohort> BuildCohort(Cohort[] cohort, ObservationPeriod[] observationPeriods)
      {
         foreach (var c in cohort)
         {
            //exclude the Cohort without observation periods
            if (!observationPeriods.Any()) continue;

            if (c.StartDate < observationPeriods[0].StartDate)
               c.StartDate = observationPeriods[0].StartDate;

            if (c.EndDate > observationPeriods[0].EndDate)
               c.EndDate = observationPeriods[0].EndDate;

            yield return c;
         }
      }

      /// <summary>
      /// Filtering and start/end date adjustment for visit occurrence entities
      /// </summary>
      /// <param name="visits">the visit occurrence entities for current person</param>
      /// <param name="cohorts">the cohort entities for current person</param>
      /// <param name="observationPeriods">the observation period entities for current person</param>
      /// <returns>Enumeration of filtered out and adjusted visit occurrence entities</returns>
      private static IEnumerable<VisitOccurrence> CleanupVisits(IEnumerable<VisitOccurrence> visits, IList<Cohort> cohorts, ObservationPeriod[] observationPeriods)
      {
         foreach (var visitOccurrence in visits)
         {
            if (!observationPeriods.Any()) continue;

            // Adjust visit start/end date for outpatient Visit
            if (visitOccurrence.ConceptId == 9202)
               yield return AdjustVisitDates(visitOccurrence, observationPeriods);
            else
            {
               // exclude not outpatient visit for person without cohort records
               if (!cohorts.Any()) continue;

               // Adjust visit start/end date for not outpatient visit that out of current cohort start & end dates
               if (visitOccurrence.StartDate >= cohorts[0].StartDate && visitOccurrence.EndDate <= cohorts[0].EndDate)
               {
                  yield return AdjustVisitDates(visitOccurrence, observationPeriods);
               }
            }
         }
      }

      /// <summary>
      /// override the visit's start/end date for visit entities that out of current obervation period 
      /// using the start/end date of the corresponding obervation period.
      /// </summary>
      /// <param name="visitOccurrence">the visit occurrence entities for current person</param>
      /// <param name="observationPeriods">the observation period entities for current person</param>
      /// <returns>Enumeration of adjusted visit occurrence entities</returns>
      private static VisitOccurrence AdjustVisitDates(VisitOccurrence visitOccurrence, ObservationPeriod[] observationPeriods)
      {
         if (visitOccurrence.StartDate < observationPeriods[0].StartDate)
            visitOccurrence.StartDate = observationPeriods[0].StartDate;

         if (visitOccurrence.EndDate > observationPeriods[0].EndDate)
            visitOccurrence.EndDate = observationPeriods[0].EndDate;

         return visitOccurrence;
      }

      /// <summary>
      ///  Filtering for HES records
      /// </summary>
      /// <typeparam name="T">IEntity</typeparam>
      /// <param name="items">the set of entities</param>
      /// <param name="cohorts">the cohort entities for current person</param>
      /// <returns>Enumeration of filtered entities</returns>
      private static IEnumerable<T> Cleanup<T>(IEnumerable<T> items, IList<Cohort> cohorts) where T : class, IEntity
      {
         foreach (var item in items)
         {
            // hes records
            if ((item.TypeConceptId >= 38000183 && item.TypeConceptId <= 38000198) ||
                (item.TypeConceptId >= 44818709 && item.TypeConceptId <= 44818713) ||
                (item.TypeConceptId >= 900000006 && item.TypeConceptId <= 900000007))
            {
               // exclude hes records for person without cohort records
               if (!cohorts.Any()) continue;
               //exclude hes records without VisitOccurrenceId
               if (!item.VisitOccurrenceId.HasValue) continue;

               // exclude hes records that out of current cohort start & end dates
               if (item.StartDate >= cohorts[0].StartDate && item.EndDate <= cohorts[0].EndDate)
               {
                  yield return item;
               }
            }
            else
            {
               yield return item;
            }
         }
      }
      
      /// <summary>
      /// Filtering raw set of entities (DrugExposures, ConditionOccurrences, ProcedureOccurrences...)
      /// </summary>
      /// <param name="entitiesToBuild">the raw set of entities</param>
      /// <param name="visitOccurrences">the visit occurrence entities for current person</param>
      /// <param name="observationPeriods">the observation period entities for current person</param>
      /// <returns>Enumeration of filtered entities</returns>
      public override IEnumerable<T> BuildEntities<T>(IEnumerable<T> entitiesToBuild,
          IDictionary<long, VisitOccurrence> visitOccurrences, IEnumerable<ObservationPeriod> observationPeriods)
      {
         var uniqueEntities = new HashSet<T>();
         foreach (var e in Clean(entitiesToBuild, observationPeriods))
         {
            var entity = e;
            if (entity.VisitOccurrenceId != null && !visitOccurrences.ContainsKey(entity.VisitOccurrenceId.Value))
               entity.VisitOccurrenceId = null;

            if (entity.IsUnique)
            {
               uniqueEntities.Add(entity);
            }
            else
            {
               yield return entity;
            }
         }

         foreach (var ue in uniqueEntities)
         {
            yield return ue;
         }
      }

   }
}
