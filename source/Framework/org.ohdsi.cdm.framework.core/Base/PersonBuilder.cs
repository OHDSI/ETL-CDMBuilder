using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Linq;
using org.ohdsi.cdm.framework.core.Helpers;
using org.ohdsi.cdm.framework.entities.Omop;
using org.ohdsi.cdm.framework.shared.Extensions;

namespace org.ohdsi.cdm.framework.core.Base
{
   /// <summary>
   ///  Base implementation of PersonBuilder
   /// </summary>
   public class PersonBuilder : IPersonBuilder
   {
      #region Variables
      protected ChunkBuilder chunkBuilder;
      protected readonly ConcurrentStack<EraEntity> observationPeriodsRaw = new ConcurrentStack<EraEntity>();
      protected readonly ConcurrentStack<Person> personRecords = new ConcurrentStack<Person>();
      protected readonly ConcurrentStack<Death> deathRecords = new ConcurrentStack<Death>();
      protected readonly ConcurrentStack<Cohort> cohortRecords = new ConcurrentStack<Cohort>();
      protected readonly ConcurrentStack<PayerPlanPeriod> payerPlanPeriodsRaw = new ConcurrentStack<PayerPlanPeriod>();
      protected readonly ConcurrentStack<ConditionOccurrence> conditionOccurrencesRaw = new ConcurrentStack<ConditionOccurrence>();
      protected readonly ConcurrentStack<DrugExposure> drugExposuresRaw = new ConcurrentStack<DrugExposure>();
      protected readonly ConcurrentStack<ProcedureOccurrence> procedureOccurrencesRaw = new ConcurrentStack<ProcedureOccurrence>();
      protected readonly ConcurrentStack<Observation> observationsRaw = new ConcurrentStack<Observation>();
      protected readonly ConcurrentStack<VisitOccurrence> visitOccurrencesRaw = new ConcurrentStack<VisitOccurrence>();
      #endregion

      #region Constructors
      public PersonBuilder(ChunkBuilder chunkBuilder)
      {
         this.chunkBuilder = chunkBuilder;
      }
      #endregion

      #region Methods
      /// <summary>
      /// Add raw related entities to builder for further build
      /// like: DrugCost & ProcedureCosts
      /// </summary>
      /// <param name="parent">parent entity</param>
      /// <param name="child">child entity</param>
      public void AddChildData(IEntity parent, IEntity child)
      {
         var drugExposure = parent as DrugExposure;
         if (drugExposure != null)
         {
            drugExposure.DrugCost = (DrugCost)child;
         }
         else
         {
            var procedureOccurrence = parent as ProcedureOccurrence;
            if (procedureOccurrence != null)
            {
               procedureOccurrence.ProcedureCosts = new List<ProcedureCost> { (ProcedureCost)child };
            }
         }
      }

      /// <summary>
      /// Add raw entities to builder for further build
      /// </summary>
      /// <param name="data">raw entity</param>
      public void AddData(IEntity data)
      {
         if (data is Person)
         {
            AddEntity((Person)data, personRecords);
            AddEntity(new EraEntity { PersonId = data.PersonId, StartDate = data.StartDate, EndDate = data.EndDate }, observationPeriodsRaw);
         }
         else if (data is Death)
         {
            var death = (Death)data;
            AddEntity(death, deathRecords);
         }
         else if (data is PayerPlanPeriod)
         {
            AddEntity((PayerPlanPeriod)data, payerPlanPeriodsRaw);
         }
         else if (data is ConditionOccurrence)
         {
            AddEntity((ConditionOccurrence)data, conditionOccurrencesRaw);
         }
         else if (data is DrugExposure)
         {
            AddEntity((DrugExposure)data, drugExposuresRaw);
         }
         else if (data is ProcedureOccurrence)
         {
            AddEntity((ProcedureOccurrence)data, procedureOccurrencesRaw);
         }
         else if (data is Observation)
         {
            AddEntity((Observation)data, observationsRaw);
         }
         else if (data is VisitOccurrence)
         {
            AddEntity((VisitOccurrence)data, visitOccurrencesRaw);
         }
         else if (data is Cohort)
         {
             AddEntity((Cohort)data, cohortRecords);
         }
      }

      protected static void AddEntity<T>(T entity, ConcurrentStack<T> list) where T : IEntity
      {
         list.Push(entity);
      }

      protected static bool AddEntity<T>(T entity, ConcurrentDictionary<T, T> dictionary) where T : IEntity
      {
         return dictionary.TryAdd(entity, entity);
      }

      // set corresponding ProviderIds
      protected void SetProviderIds<T>(IEnumerable<T> inputRecords) where T : class, IEntity
      {
         var records = inputRecords as T[] ?? inputRecords.ToArray();
         if (inputRecords == null || !records.Any()) return;

         if (chunkBuilder.ProviderKeys.Count > 0)
         {
            foreach (var e in records.Where(e => !string.IsNullOrEmpty(e.ProviderKey)))
            {
               if (chunkBuilder.ProviderKeys.ContainsKey(e.ProviderKey.ToLower()))
                  e.ProviderId = chunkBuilder.ProviderKeys[e.ProviderKey.ToLower()];
            }
         }
      }

      // set corresponding PlanPeriodIds to drug exposure entities and procedure occurrence entities
      protected virtual void SetPayerPlanPeriodId(PayerPlanPeriod[] payerPlanPeriods, DrugExposure[] drugExposures, ProcedureOccurrence[] procedureOccurrences)
      {
         if (!payerPlanPeriods.Any()) return;

         foreach (var de in drugExposures)
         {
            if (de.DrugCost == null) continue;
            foreach (var planPeriod in payerPlanPeriods)
            {
               if (de.StartDate.Between(planPeriod.StartDate, planPeriod.EndDate.Value))
               {
                  de.DrugCost.PayerPlanPeriodId = planPeriod.Id;
                  break;
               }
            }
         }

         foreach (var po in procedureOccurrences)
         {
            if (po.ProcedureCosts == null) continue;
            foreach (var planPeriod in payerPlanPeriods)
            {
               if (po.StartDate.Between(planPeriod.StartDate, planPeriod.EndDate.Value))
               {
                  foreach (var procedureCost in po.ProcedureCosts)
                  {
                     procedureCost.PayerPlanPeriodId = planPeriod.Id;
                  }

                  break;
               }
            }
         }
      }

      /// <summary>
      /// Projects Enumeration of observation period from the raw set of observation period entities.
      /// </summary>
      /// <param name="gap">persistence window (duration that is allowed to elapse between two periods) </param>
      /// <param name="observationPeriods">raw set of observation period entities</param>
      /// <returns>Enumeration of observation period entities</returns>
      public virtual IEnumerable<ObservationPeriod> BuildObservationPeriods(int gap, EraEntity[] observationPeriods)
      {
         // All overlapping periods will be collapsed into one observation period
         return EraHelper.GetObservationPeriods(gap, observationPeriods);
      }

      /// <summary>
      /// Projects Enumeration of payerPlanPeriod from the raw set of payerPlanPeriod entities.
      /// </summary>
      /// <param name="payerPlanPeriods">raw set of payerPlanPeriod entities</param>
      /// <param name="visitOccurrences">the visit occurrence entities for current person</param>
      /// <returns>Enumeration of payerPlanPeriod entities</returns>
      public virtual IEnumerable<PayerPlanPeriod> BuildPayerPlanPeriods(PayerPlanPeriod[] payerPlanPeriods, Dictionary<long, VisitOccurrence> visitOccurrences)
      {
         // All overlapping periods will be collapsed into one observation period
         return EraHelper.GetPayerPlanPeriods(payerPlanPeriods, CanPayerPlanPeriodBeCombined, chunkBuilder.Chunk.KeyMasterOffset);
      }
     
      /// <summary>
      /// Condition for the combining two periods
      /// </summary>
      /// <param name="current">1st period</param>
      /// <param name="other">2nd period</param>
      /// <returns>Can those periods be combined</returns>
      public virtual bool CanPayerPlanPeriodBeCombined(PayerPlanPeriod current, PayerPlanPeriod other)
      {
         if (string.IsNullOrEmpty(current.PlanSourceValue))
            return current.PayerSourceValue == other.PayerSourceValue;

         return current.PlanSourceValue == other.PlanSourceValue && current.PayerSourceValue == other.PayerSourceValue;
      }

      /// <summary>
      /// Projects death entity from the raw set of death entities.
      /// During build:
      /// override the death's start date using the end date of the corresponding visit.
      /// </summary>
      /// <param name="death">raw set of death entities</param>
      /// <param name="visitOccurrences">the visit occurrence entities for current person</param>
      /// <param name="observationPeriods">the observation period entities for current person</param>
      /// <returns>death entity</returns>
      public virtual Death BuildDeath(Death[] death, Dictionary<long, VisitOccurrence> visitOccurrences, ObservationPeriod[] observationPeriods)
      {
         var ds = Clean(death, observationPeriods).ToList();
         if (ds.Any())
         {
            var pd = ds.Where(d => d.Primary).ToList();
            return pd.Any() ? pd.OrderBy(d => d.StartDate).Last() : ds.OrderBy(d => d.StartDate).Last();
         }
         return null;
      }

      /// <summary>
      /// Projects person etity from the raw set of persons entities. 
      /// </summary>
      /// <param name="records">raw set of Person entities</param>
      /// <returns>Person entity</returns>
      public virtual Person BuildPerson(List<Person> records)
      {
         if (records == null || records.Count == 0) return null;

         var ordered = records.OrderByDescending(p => p.StartDate);
         var person = ordered.Take(1).First();
         person.StartDate = ordered.Take(1).Last().StartDate;

         var gender = records.GroupBy(p => p.GenderConceptId).OrderByDescending(gp => gp.Count()).Take(1).First().First();
         var race = records.GroupBy(p => p.RaceConceptId).OrderByDescending(gp => gp.Count()).Take(1).First().First();

         person.GenderConceptId = gender.GenderConceptId;
         person.GenderSourceValue = gender.GenderSourceValue;
         person.RaceConceptId = race.RaceConceptId;
         person.RaceSourceValue = race.RaceSourceValue;

         return person;
      }

      /// <summary>
      /// Projects Enumeration of Visit Occurrence from the raw set of Visit Occurrence entities. 
      ///  </summary>
      /// <param name="visitOccurrences">raw set of Visit Occurrence entities</param>
      /// <param name="observationPeriods">the observation periods entities for current person</param>
      /// <returns>Enumeration of Visit Occurrence</returns>
      public virtual IEnumerable<VisitOccurrence> BuildVisitOccurrences(VisitOccurrence[] visitOccurrences, ObservationPeriod[] observationPeriods)
      {
         return Clean(visitOccurrences, observationPeriods).Distinct();
      }

      /// <summary>
      /// 	Projects Enumeration of drug exposure from the raw set of drug exposure entities. 
      /// </summary>
      /// <param name="drugExposures">raw set of drug exposures entities</param>
      /// <param name="visitOccurrences">the visit occurrences entities for current person</param>
      /// <param name="observationPeriods">the observation periods entities for current person</param>
      /// <returns>Enumeration of drug exposure entities</returns>
      public virtual IEnumerable<DrugExposure> BuildDrugExposures(DrugExposure[] drugExposures, Dictionary<long, VisitOccurrence> visitOccurrences, ObservationPeriod[] observationPeriods)
      {
         return BuildEntities(drugExposures, visitOccurrences, observationPeriods);
      }

      /// <summary>
      /// Projects Enumeration of ConditionOccurrence from the raw set of ConditionOccurrence entities. 
      /// </summary>
      /// <param name="conditionOccurrences">raw set of condition occurrence entities</param>
      /// <param name="visitOccurrences">the visit occurrence entities for current person</param>
      /// <param name="observationPeriods">the observation period entities for current person</param>
      /// <returns>Enumeration of condition occurrence entities</returns>
      public virtual IEnumerable<ConditionOccurrence> BuildConditionOccurrences(ConditionOccurrence[] conditionOccurrences, Dictionary<long, VisitOccurrence> visitOccurrences, ObservationPeriod[] observationPeriods)
      {
         return BuildEntities(conditionOccurrences, visitOccurrences, observationPeriods);
      }

      /// <summary>
      /// Projects Enumeration of ProcedureOccurrence from the raw set of ProcedureOccurence entities.
      /// </summary>
      /// <param name="procedureOccurrences">raw set of procedure occurrence entities</param>
      /// <param name="visitOccurrences">the visit occurrence entities for current person</param>
      /// <param name="observationPeriods">the observation period entities for current person</param>
      /// <returns>Enumeration of procedure occurrence entities</returns>
      public virtual IEnumerable<ProcedureOccurrence> BuildProcedureOccurrences(ProcedureOccurrence[] procedureOccurrences, Dictionary<long, VisitOccurrence> visitOccurrences, ObservationPeriod[] observationPeriods)
      {
         return BuildEntities(procedureOccurrences, visitOccurrences, observationPeriods);
      }

      /// <summary>
      /// Projects Enumeration of Observations from the raw set of Observation entities. 
      /// </summary>
      /// <param name="observations">raw set of observations entities</param>
      /// <param name="visitOccurrences">the visit occurrences entities for current person</param>
      /// <param name="observationPeriods">the observation periods entities for current person</param>
      /// <returns>Enumeration of Observation from the raw set of Observation entities</returns>
      public virtual IEnumerable<Observation> BuildObservations(Observation[] observations, Dictionary<long, VisitOccurrence> visitOccurrences, ObservationPeriod[] observationPeriods)
      {
         return BuildEntities(observations, visitOccurrences, observationPeriods);
      }

      /// <summary>
      /// CONDITION_ERAs are chronological periods of condition occurrence.  
      /// There will only be one type of persistence window (duration that is allowed to elapse between condition occurrences) applied to this CDM, which is 30 days. 
      /// CONDITION_END_DATE will be the CONDITION_START_DATE.
      /// </summary>
      /// <param name="conditionOccurrences">Set of condition occurrence entities</param>
      /// <returns>Enumeration of condition era</returns>
      public virtual IEnumerable<EraEntity> BuildConditionEra(ConditionOccurrence[] conditionOccurrences)
      {
         return EraHelper.GetEras(conditionOccurrences, 30, 38000247);
      }
      
      /// <summary>
      /// A Drug Era is defined as a span of time when the Person is assumed to be exposed to a particular drug. 
      /// Successive periods of Drug Exposures are combined under certain rules to produce continuous Drug Eras.  
      /// The Drug Era  is populated by pulling from the set of drug exposure.  A drug era is therefore understood as exposure to a certain compound over a certain period of time. 
      /// There will only be one type of persistence window (duration that is allowed to elapse between drug exposures) applied to this CDM, which is 30 days. 
      /// </summary>
      /// <param name="drugExposures">set of drug exposure entities</param>
      /// <returns>Enumeration of drug era</returns>
      public virtual IEnumerable<EraEntity> BuildDrugEra(DrugExposure[] drugExposures)
      {
         return EraHelper.GetEras(drugExposures.ToList(), 30, 38000182);
      }

      /// <summary>
      /// Projects Enumeration of Cohort from the raw set of Cohort entities. 
      ///  </summary>
      /// <param name="cohort">raw set of Cohort entities</param>
      /// <param name="observationPeriods">the observation periods entities for current person</param>
      /// <returns>Enumeration of Cohort from the raw set of Cohort entities</returns>
      public virtual IEnumerable<Cohort> BuildCohort(Cohort[] cohort, ObservationPeriod[] observationPeriods)
      {
          return cohort;
      }

      /// <summary>
      /// Projects Enumeration of drug cost from the set of drug exposure entities.
      /// </summary>
      /// <param name="drugExposures">set of drug exposure entities</param>
      /// <returns>set of drug cost entities</returns>
      public virtual IEnumerable<DrugCost> BuildDrugCosts(DrugExposure[] drugExposures)
      {
         return drugExposures.Where(i => i.DrugCost != null).Select(i => i.DrugCost);
      }

      /// <summary>
      /// Projects Enumeration of procedure cost from the set of procedure occurrence entities.
      /// </summary>
      /// <param name="procedureOccurrences">set of procedure occurrence entities</param>
      /// <returns>set of procedure cost entities</returns>
      public virtual IEnumerable<ProcedureCost> BuildProcedureCosts(ProcedureOccurrence[] procedureOccurrences)
      {
         return procedureOccurrences.Where(i => i.ProcedureCosts != null).SelectMany(i => i.ProcedureCosts);
      }

      /// <summary>
      /// Filtering raw set of entities (DrugExposures, ConditionOccurrences, ProcedureOccurrences...)
      /// </summary>
      /// <param name="entitiesToBuild">the raw set of entities</param>
      /// <param name="visitOccurrences">the visit occurrence entities for current person</param>
      /// <param name="observationPeriods">the observation period entities for current person</param>
      /// <returns>Enumeration of filtered entities</returns>
      public virtual IEnumerable<T> BuildEntities<T>(IEnumerable<T> entitiesToBuild, IDictionary<long, VisitOccurrence> visitOccurrences, IEnumerable<ObservationPeriod> observationPeriods) where T : IEntity
      {
         var uniqueEntities = new HashSet<T>();
         foreach (var e in Clean(entitiesToBuild, observationPeriods))
         {
            if (e.VisitOccurrenceId == null || visitOccurrences.ContainsKey(e.VisitOccurrenceId.Value))
            {
               if (e.IsUnique)
               {
                  uniqueEntities.Add(e);
               }
               else
               {
                  yield return e;
               }
            }
         }

         foreach (var ue in uniqueEntities)
         {
            yield return ue;
         }
      }

      /// <summary>
      /// Build person entity and all person related entities like: DrugExposures, ConditionOccurrences, ProcedureOccurrences... from raw data sets 
      /// </summary>
      public virtual void Build()
      {
         var person = BuildPerson(personRecords.ToList());
         if (person == null) return;
         
         var observationPeriods = BuildObservationPeriods(person.ObservationPeriodGap, observationPeriodsRaw.ToArray()).ToArray();

         // Delete any individual that has an OBSERVATION_PERIOD that is >= 2 years prior to the YEAR_OF_BIRTH
         if (Excluded(person, observationPeriods)) return;

         var payerPlanPeriods = BuildPayerPlanPeriods(payerPlanPeriodsRaw.ToArray(), null).ToArray();
         var visitOccurrences = new Dictionary<long, VisitOccurrence>();

         foreach (var visitOccurrence in BuildVisitOccurrences(visitOccurrencesRaw.ToArray(), observationPeriods))
         {
            if (visitOccurrence.IdUndefined)
               visitOccurrence.Id = chunkBuilder.Chunk.KeyMasterOffset.VisitOccurrenceId;

            visitOccurrences.Add(visitOccurrence.Id, visitOccurrence);
         }

         var drugExposures = BuildDrugExposures(drugExposuresRaw.ToArray(), visitOccurrences, observationPeriods).ToArray();
         var conditionOccurrences = BuildConditionOccurrences(conditionOccurrencesRaw.ToArray(), visitOccurrences, observationPeriods).ToArray();
         var procedureOccurrences = BuildProcedureOccurrences(procedureOccurrencesRaw.ToArray(), visitOccurrences, observationPeriods).ToArray();
         var observations = BuildObservations(observationsRaw.ToArray(), visitOccurrences, observationPeriods).ToArray();

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

         var cohort = BuildCohort(cohortRecords.ToArray(), observationPeriods).ToArray();

         // push built entities to ChunkBuilder for further save to CDM database
         AddToChunk(person, death, observationPeriods, payerPlanPeriods, drugExposures, drugEra, drugCosts,
            conditionOccurrences, conditionEra, procedureOccurrences, procedureCosts, observations, visitOccurrences.Values.ToArray(), cohort);
      }


      /// <summary>
      /// Push built entities to ChunkBuilder for further save to CDM database
      /// </summary>
      /// <param name="person">person entity</param>
      /// <param name="death">death entity</param>
      /// <param name="observationPeriods">the observation period entities for current person</param>
      /// <param name="payerPlanPeriods">the payerplan period entities for current person</param>
      /// <param name="drugExposures">the drug exposure entities for current person</param>
      /// <param name="drugEra">the drug era entities for current person</param>
      /// <param name="drugCosts">the drug cost entities for current person</param>
      /// <param name="conditionOccurrences">the condition occurrence entities for current person</param>
      /// <param name="conditionEra">the condition era entities for current person</param>
      /// <param name="procedureOccurrences">the procedure occurrence entities for current person</param>
      /// <param name="procedureCosts">the procedure cost entities for current person</param>
      /// <param name="observations">the observation entities for current person</param>
      /// <param name="visitOccurrences">the visit occurrence entities for current person</param>
      /// <param name="cohort">the cohort entities for current person</param>
      protected void AddToChunk(Person person, Death death, ObservationPeriod[] observationPeriods, PayerPlanPeriod[] payerPlanPeriods, DrugExposure[] drugExposures,
         EraEntity[] drugEra, DrugCost[] drugCosts, ConditionOccurrence[] conditionOccurrences, EraEntity[] conditionEra,
         ProcedureOccurrence[] procedureOccurrences, ProcedureCost[] procedureCosts, Observation[] observations, VisitOccurrence[] visitOccurrences, Cohort[] cohort)
      {
         chunkBuilder.Chunk.Persons.Push(person);

         if (death != null)
         {
            death.CauseConceptId = 0;
            chunkBuilder.Chunk.Deaths.Push(death);
         }

         if (observationPeriods.Length > 0)
            chunkBuilder.Chunk.ObservationPeriods.PushRange(observationPeriods.ToArray());

         if (payerPlanPeriods.Length > 0)
            chunkBuilder.Chunk.PayerPlanPeriods.PushRange(payerPlanPeriods.ToArray());

         if (drugExposures.Length > 0)
            chunkBuilder.Chunk.DrugExposures.PushRange(drugExposures);

         if (drugEra.Length > 0)
            chunkBuilder.Chunk.DrugEra.PushRange(drugEra);
         
         if (drugCosts.Length > 0)
            chunkBuilder.Chunk.DrugCost.PushRange(drugCosts);

         if (conditionOccurrences.Length > 0)
            chunkBuilder.Chunk.ConditionOccurrences.PushRange(conditionOccurrences);

         if (conditionEra.Length > 0)
            chunkBuilder.Chunk.ConditionEra.PushRange(conditionEra);

         if (procedureOccurrences.Length > 0)
            chunkBuilder.Chunk.ProcedureOccurrences.PushRange(procedureOccurrences);

         if (procedureCosts.Length > 0)
            chunkBuilder.Chunk.ProcedureCost.PushRange(procedureCosts);

         if (observations.Length > 0)
            chunkBuilder.Chunk.Observations.PushRange(observations);

         if (visitOccurrences.Length > 0)
            chunkBuilder.Chunk.VisitOccurrences.PushRange(visitOccurrences);

         if (cohort.Length > 0)
             chunkBuilder.Chunk.Cohort.PushRange(cohort);
      }

      /// exclude records that out of any available observation period records
      protected static IEnumerable<T> Clean<T>(IEnumerable<T> input, IEnumerable<ObservationPeriod> observationPeriods) where T : IEntity
      {
         return input.Where(item => observationPeriods.FirstOrDefault(p => item.StartDate.Between(p.StartDate, p.EndDate)) != null);
      }

      /// <summary>
      /// Delete any individual that has an OBSERVATION_PERIOD that is >= 2 years prior to the YEAR_OF_BIRTH
      /// </summary>
      /// <param name="person">the current person entity</param>
      /// <param name="periods">the observation period entities for current person</param>
      /// <returns>Enumeration of filtered entities</returns>
      public virtual bool Excluded(Person person, IEnumerable<ObservationPeriod> periods)
      {
         return periods.Any(period => person.YearOfBirth - period.StartDate.Year >= 2);
      }
      #endregion
   }
}
