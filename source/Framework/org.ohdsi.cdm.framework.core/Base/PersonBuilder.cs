using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Linq;
using org.ohdsi.cdm.framework.core.Helpers;
using org.ohdsi.cdm.framework.entities.Builder;
using org.ohdsi.cdm.framework.entities.Omop;
using org.ohdsi.cdm.framework.shared.Enums;
using org.ohdsi.cdm.framework.shared.Extensions;

namespace org.ohdsi.cdm.framework.core.Base
{
   /// <summary>
   ///  Base implementation of PersonBuilder
   /// </summary>
   public class PersonBuilder : IPersonBuilder
   {
      #region Variables
      protected ChunkData chunkData;
      protected Vocabulary vocabulary;
      protected readonly ConcurrentQueue<EraEntity> observationPeriodsRaw = new ConcurrentQueue<EraEntity>();
      protected readonly ConcurrentQueue<Person> personRecords = new ConcurrentQueue<Person>();
      protected readonly ConcurrentQueue<Death> deathRecords = new ConcurrentQueue<Death>();
      protected readonly ConcurrentQueue<Cohort> cohortRecords = new ConcurrentQueue<Cohort>();
      protected readonly ConcurrentQueue<PayerPlanPeriod> payerPlanPeriodsRaw = new ConcurrentQueue<PayerPlanPeriod>();

      protected readonly ConcurrentQueue<ConditionOccurrence> conditionOccurrencesRaw =
         new ConcurrentQueue<ConditionOccurrence>();

      protected readonly ConcurrentQueue<DrugExposure> drugExposuresRaw = new ConcurrentQueue<DrugExposure>();

      protected readonly ConcurrentQueue<ProcedureOccurrence> procedureOccurrencesRaw =
         new ConcurrentQueue<ProcedureOccurrence>();

      protected readonly ConcurrentQueue<Observation> observationsRaw = new ConcurrentQueue<Observation>();
      protected readonly ConcurrentQueue<Measurement> measurementsRaw = new ConcurrentQueue<Measurement>();
      protected readonly ConcurrentQueue<VisitOccurrence> visitOccurrencesRaw = new ConcurrentQueue<VisitOccurrence>();
      protected readonly ConcurrentQueue<VisitCost> visitCostsRaw = new ConcurrentQueue<VisitCost>();
      protected readonly ConcurrentQueue<DeviceExposure> deviceExposureRaw = new ConcurrentQueue<DeviceExposure>();
      protected readonly ConcurrentQueue<DeviceCost> deviceCostRaw = new ConcurrentQueue<DeviceCost>();

      protected readonly List<DrugExposure> drugForEra = new List<DrugExposure>();
      protected readonly List<ConditionOccurrence> conditionForEra = new List<ConditionOccurrence>();

      public ConcurrentDictionary<string, bool> ProviderKeys { get; set; }

      #endregion


      #region Methods

      public PersonBuilder()
      {
         ProviderKeys = new ConcurrentDictionary<string, bool>();
      }

      /// <summary>
      /// Add raw related entities to builder for further build
      /// like: DrugCost & ProcedureCosts
      /// </summary>
      /// <param name="parent">parent entity</param>
      /// <param name="child">child entity</param>
      public void AddChildData(IEntity parent, IEntity child)
      {
         switch (parent.GeEntityType())
         {
            case EntityType.DrugExposure:
            {
               ((DrugExposure) parent).DrugCost = (DrugCost) child;
               break;
            }

            case EntityType.ProcedureOccurrence:
            {
               ((ProcedureOccurrence) parent).ProcedureCosts = new List<ProcedureCost> {(ProcedureCost) child};
               break;
            }

            case EntityType.VisitOccurrence:
            {
               ((VisitOccurrence) parent).VisitCosts = new List<VisitCost> {(VisitCost) child};
               break;
            }

            case EntityType.DeviceExposure:
            {
               ((DeviceExposure) parent).DeviceCosts = new List<DeviceCost> {(DeviceCost) child};
               break;
            }
         }
      }

      /// <summary>
      /// Add raw entities to builder for further build
      /// </summary>
      /// <param name="data">raw entity</param>
      public void AddData(IEntity data)
      {
         if (!string.IsNullOrEmpty(data.ProviderKey))
         {
            ProviderKeys.GetOrAdd(data.ProviderKey, false);
         }

         switch (data.GeEntityType())
         {
            case EntityType.Person:
            {
               AddEntity((Person) data, personRecords);
               AddEntity(
                  new EraEntity
                  {
                     PersonId = data.PersonId,
                     StartDate = data.StartDate,
                     EndDate = data.EndDate,
                     TypeConceptId = data.TypeConceptId
                  }, observationPeriodsRaw);
               break;
            }

            case EntityType.Death:
            {
               AddEntity((Death) data, deathRecords);
               break;
            }

            case EntityType.PayerPlanPeriod:
            {
               AddEntity((PayerPlanPeriod) data, payerPlanPeriodsRaw);
               break;
            }

            case EntityType.ConditionOccurrence:
            {
               AddEntity((ConditionOccurrence) data, conditionOccurrencesRaw);
               break;
            }

            case EntityType.DrugExposure:
            {
               AddEntity((DrugExposure) data, drugExposuresRaw);
               break;
            }

            case EntityType.ProcedureOccurrence:
            {
               AddEntity((ProcedureOccurrence) data, procedureOccurrencesRaw);
               break;
            }

            case EntityType.Observation:
            {
               AddEntity((Observation) data, observationsRaw);
               break;
            }

            case EntityType.VisitOccurrence:
            {
               AddEntity((VisitOccurrence) data, visitOccurrencesRaw);
               break;
            }

            case EntityType.Cohort:
            {
               AddEntity((Cohort) data, cohortRecords);
               break;
            }

            case EntityType.Measurement:
            {
               AddEntity((Measurement) data, measurementsRaw);
               break;
            }

            case EntityType.DeviceExposure:
            {
               AddEntity((DeviceExposure) data, deviceExposureRaw);
               break;
            }
         }
      }

      protected static void AddEntity<T>(T entity, ConcurrentQueue<T> list) where T : IEntity
      {
         list.Enqueue(entity);
      }

      protected static bool AddEntity<T>(T entity, ConcurrentDictionary<T, T> dictionary) where T : IEntity
      {
         return dictionary.TryAdd(entity, entity);
      }

      // set corresponding ProviderIds
      protected void SetProviderIds<T>(IEnumerable<T> inputRecords, Dictionary<string, long> providers) where T : class, IEntity
      {
         var records = inputRecords as T[] ?? inputRecords.ToArray();
         if (inputRecords == null || !records.Any()) return;

         if (providers.Count > 0)
         {
            foreach (var e in records.Where(e => !string.IsNullOrEmpty(e.ProviderKey)))
            {
               if (providers.ContainsKey(e.ProviderKey.ToLower()))
                  e.ProviderId = providers[e.ProviderKey.ToLower()];
            }
         }
      }

      // set corresponding PlanPeriodIds to drug exposure entities and procedure occurrence entities
      protected virtual void SetPayerPlanPeriodId(PayerPlanPeriod[] payerPlanPeriods, DrugExposure[] drugExposures,
         ProcedureOccurrence[] procedureOccurrences, VisitOccurrence[] visitOccurrences, DeviceExposure[] deviceExposure)
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

         foreach (var vo in visitOccurrences)
         {
            if (vo.VisitCosts == null) continue;
            foreach (var planPeriod in payerPlanPeriods)
            {
               if (vo.StartDate.Between(planPeriod.StartDate, planPeriod.EndDate.Value))
               {
                  foreach (var visitCost in vo.VisitCosts)
                  {
                     visitCost.PayerPlanPeriodId = planPeriod.Id;
                  }

                  break;
               }
            }
         }

         foreach (var de in deviceExposure)
         {
            if (de.DeviceCosts == null) continue;
            foreach (var planPeriod in payerPlanPeriods)
            {
               if (de.StartDate.Between(planPeriod.StartDate, planPeriod.EndDate.Value))
               {
                  foreach (var deviceCost in de.DeviceCosts)
                  {
                     deviceCost.PayerPlanPeriodId = planPeriod.Id;
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
         return EraHelper.GetObservationPeriods(gap, observationPeriods, chunkData);
      }

      /// <summary>
      /// Projects Enumeration of payerPlanPeriod from the raw set of payerPlanPeriod entities.
      /// </summary>
      /// <param name="payerPlanPeriods">raw set of payerPlanPeriod entities</param>
      /// <param name="visitOccurrences">the visit occurrence entities for current person</param>
      /// <returns>Enumeration of payerPlanPeriod entities</returns>
      public virtual IEnumerable<PayerPlanPeriod> BuildPayerPlanPeriods(PayerPlanPeriod[] payerPlanPeriods,
         Dictionary<long, VisitOccurrence> visitOccurrences)
      {
         // All overlapping periods will be collapsed into one observation period
         return EraHelper.GetPayerPlanPeriods(payerPlanPeriods, CanPayerPlanPeriodBeCombined,
            chunkData);
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
      public virtual Death BuildDeath(Death[] death, Dictionary<long, VisitOccurrence> visitOccurrences,
         ObservationPeriod[] observationPeriods)
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

         var gender =
            records.GroupBy(p => p.GenderConceptId).OrderByDescending(gp => gp.Count()).Take(1).First().First();
         var race = records.GroupBy(p => p.RaceConceptId).OrderByDescending(gp => gp.Count()).Take(1).First().First();

         person.GenderConceptId = gender.GenderConceptId;
         person.GenderSourceValue = gender.GenderSourceValue;
         person.RaceConceptId = race.RaceConceptId;
         person.RaceSourceValue = race.RaceSourceValue;

         if (person.GenderConceptId == 8551) //UNKNOWN
            return null;

         return person;
      }
      
      /// <summary>
      /// Projects Enumeration of Visit Occurrence from the raw set of Visit Occurrence entities. 
      ///  </summary>
      /// <param name="visitOccurrences">raw set of Visit Occurrence entities</param>
      /// <param name="observationPeriods">the observation periods entities for current person</param>
      /// <returns>Enumeration of Visit Occurrence</returns>
      public virtual IEnumerable<VisitOccurrence> BuildVisitOccurrences(VisitOccurrence[] visitOccurrences,
         ObservationPeriod[] observationPeriods)
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
      public virtual IEnumerable<DrugExposure> BuildDrugExposures(DrugExposure[] drugExposures,
         Dictionary<long, VisitOccurrence> visitOccurrences, ObservationPeriod[] observationPeriods)
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
      public virtual IEnumerable<ConditionOccurrence> BuildConditionOccurrences(
         ConditionOccurrence[] conditionOccurrences, Dictionary<long, VisitOccurrence> visitOccurrences,
         ObservationPeriod[] observationPeriods)
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
      public virtual IEnumerable<ProcedureOccurrence> BuildProcedureOccurrences(
         ProcedureOccurrence[] procedureOccurrences, Dictionary<long, VisitOccurrence> visitOccurrences,
         ObservationPeriod[] observationPeriods)
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
      public virtual IEnumerable<Observation> BuildObservations(Observation[] observations,
         Dictionary<long, VisitOccurrence> visitOccurrences, ObservationPeriod[] observationPeriods)
      {
         return BuildEntities(observations, visitOccurrences, observationPeriods);
      }

      public virtual IEnumerable<Measurement> BuildMeasurement(Measurement[] measurements,
         Dictionary<long, VisitOccurrence> visitOccurrences,
         ObservationPeriod[] observationPeriods)
      {
         return BuildEntities(measurements, visitOccurrences, observationPeriods);
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
         foreach (var eraEntity in  EraHelper.GetEras(
               conditionOccurrences.Where(c => string.IsNullOrEmpty(c.Domain) || c.Domain == "Condition"), 30, 38000247))
         {
            eraEntity.Id = chunkData.KeyMasterOffset.ConditionEraId;
            yield return eraEntity;
         }
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
         foreach (var eraEntity in EraHelper.GetEras(drugExposures.Where(d => string.IsNullOrEmpty(d.Domain) || d.Domain == "Drug"), 30, 38000182))
         {
            eraEntity.Id = chunkData.KeyMasterOffset.DrugEraId;
            yield return eraEntity;
         }
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

      public virtual IEnumerable<DeviceExposure> BuildDeviceExposure(DeviceExposure[] devExposure,
         Dictionary<long, VisitOccurrence> visitOccurrences,
         ObservationPeriod[] observationPeriods)
      {
         return BuildEntities(devExposure, visitOccurrences, observationPeriods);
      }

      /// <summary>
      /// Projects Enumeration of drug cost from the set of drug exposure entities.
      /// </summary>
      /// <param name="drugExposures">set of drug exposure entities</param>
      /// <returns>set of drug cost entities</returns>
      public virtual IEnumerable<DrugCost> BuildDrugCosts(DrugExposure[] drugExposures)
      {
         foreach (var drugExposure in drugExposures.Where(drugExposure => drugExposure.DrugCost != null))
         {
            drugExposure.DrugCost.Id = drugExposure.Id;
            yield return drugExposure.DrugCost;
         }
      }

      /// <summary>
      /// Projects Enumeration of procedure cost from the set of procedure occurrence entities.
      /// </summary>
      /// <param name="procedureOccurrences">set of procedure occurrence entities</param>
      /// <returns>set of procedure cost entities</returns>
      public virtual IEnumerable<ProcedureCost> BuildProcedureCosts(ProcedureOccurrence[] procedureOccurrences)
      {
         foreach (var po in procedureOccurrences.Where(i => i.ProcedureCosts != null))
         {
            foreach (var pc in po.ProcedureCosts)
            {
               pc.Id = po.Id;
               yield return pc;
            }
         }
      }

      public virtual IEnumerable<VisitCost> BuildVisitCosts(VisitOccurrence[] visitOccurrences)
      {
         foreach(var vo in visitOccurrences.Where(i => i.VisitCosts != null))
         {
            foreach (var vc in vo.VisitCosts)
            {
               vc.Id = vo.Id;
               yield return vc;
            }
         }
      }

      public virtual IEnumerable<DeviceCost> BuildDeviceCosts(DeviceExposure[] deviceExposure)
      {
         foreach (var de in deviceExposure.Where(i => i.DeviceCosts != null))
         {
            foreach (var dc in de.DeviceCosts)
            {
               dc.Id = de.Id;
               yield return dc;
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
      public virtual IEnumerable<T> BuildEntities<T>(IEnumerable<T> entitiesToBuild,
         IDictionary<long, VisitOccurrence> visitOccurrences, IEnumerable<ObservationPeriod> observationPeriods)
         where T : IEntity
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
      public virtual void Build(Dictionary<string, long> providers)
      {
         var person = BuildPerson(personRecords.ToList());
         if (person == null) return;

         var observationPeriods =
            BuildObservationPeriods(person.ObservationPeriodGap, observationPeriodsRaw.ToArray()).ToArray();

         // Delete any individual that has an OBSERVATION_PERIOD that is >= 2 years prior to the YEAR_OF_BIRTH
         if (Excluded(person, observationPeriods)) return;
         
         var payerPlanPeriods = BuildPayerPlanPeriods(payerPlanPeriodsRaw.ToArray(), null).ToArray();
         var visitOccurrences = new Dictionary<long, VisitOccurrence>();

         foreach (var visitOccurrence in BuildVisitOccurrences(visitOccurrencesRaw.ToArray(), observationPeriods))
         {
            if (visitOccurrence.IdUndefined)
               visitOccurrence.Id = chunkData.KeyMasterOffset.VisitOccurrenceId;

            visitOccurrences.Add(visitOccurrence.Id, visitOccurrence);
         }

         var drugExposures =
            BuildDrugExposures(drugExposuresRaw.ToArray(), visitOccurrences, observationPeriods).ToArray();
         var conditionOccurrences =
            BuildConditionOccurrences(conditionOccurrencesRaw.ToArray(), visitOccurrences, observationPeriods).ToArray();
         var procedureOccurrences =
            BuildProcedureOccurrences(procedureOccurrencesRaw.ToArray(), visitOccurrences, observationPeriods).ToArray();
         var observations = BuildObservations(observationsRaw.ToArray(), visitOccurrences, observationPeriods).ToArray();
         var measurements = BuildMeasurement(measurementsRaw.ToArray(), visitOccurrences, observationPeriods).ToArray();
         var deviceExposure =
            BuildDeviceExposure(deviceExposureRaw.ToArray(), visitOccurrences, observationPeriods).ToArray();

         // set corresponding PlanPeriodIds to drug exposure entities and procedure occurrence entities
         SetPayerPlanPeriodId(payerPlanPeriods, drugExposures, procedureOccurrences, visitOccurrences.Values.ToArray(),
            deviceExposure);

         // set corresponding ProviderIds
         SetProviderIds(drugExposures, providers);
         SetProviderIds(conditionOccurrences, providers);
         SetProviderIds(procedureOccurrences, providers);
         SetProviderIds(observations, providers);
         
         var death = BuildDeath(deathRecords.ToArray(), visitOccurrences, observationPeriods);
         var drugCosts = BuildDrugCosts(drugExposures).ToArray();
         var procedureCosts = BuildProcedureCosts(procedureOccurrences).ToArray();
         var visitCosts = BuildVisitCosts(visitOccurrences.Values.ToArray()).ToArray();
         var devicCosts = BuildDeviceCosts(deviceExposure).ToArray();

         var cohort = BuildCohort(cohortRecords.ToArray(), observationPeriods).ToArray();


         // push built entities to ChunkBuilder for further save to CDM database
         AddToChunk(person, death, observationPeriods, payerPlanPeriods, drugExposures, drugCosts,
            conditionOccurrences, procedureOccurrences, procedureCosts, observations, measurements,
            visitOccurrences.Values.ToArray(), visitCosts, cohort, deviceExposure, devicCosts);
      }

      protected void AddToChunk(Person person, Death death, ObservationPeriod[] observationPeriods,
         PayerPlanPeriod[] ppp, DrugExposure[] drugExposures,
          DrugCost[] drugCosts, ConditionOccurrence[] conditionOccurrences,
         ProcedureOccurrence[] procedureOccurrences, ProcedureCost[] procedureCosts, Observation[] observations,
         VisitOccurrence[] visitOccurrences, Cohort[] cohort)
      {
         AddToChunk(person, death, observationPeriods,
            ppp, drugExposures,
            drugCosts, conditionOccurrences, 
            procedureOccurrences, procedureCosts, observations, new Measurement[] {},
            visitOccurrences, new VisitCost[] {}, cohort, new DeviceExposure[] {}, new DeviceCost[] {});
      }

      /// <summary>
      /// Push built entities to ChunkBuilder for further save to CDM database
      /// </summary>
      /// <param name="person">person entity</param>
      /// <param name="death">death entity</param>
      /// <param name="observationPeriods">the observation period entities for current person</param>
      /// <param name="ppp">the payerplan period entities for current person</param>
      /// <param name="drugExposures">the drug exposure entities for current person</param>
      /// <param name="drugCosts">the drug cost entities for current person</param>
      /// <param name="conditionOccurrences">the condition occurrence entities for current person</param>
      /// <param name="procedureOccurrences">the procedure occurrence entities for current person</param>
      /// <param name="procedureCosts">the procedure cost entities for current person</param>
      /// <param name="observations">the observation entities for current person</param>
      /// <param name="visitOccurrences">the visit occurrence entities for current person</param>
      /// <param name="visitCosts">the visit cost entities for current person</param>
      /// <param name="cohort">the cohort entities for current person</param>
      public virtual void AddToChunk(Person person, Death death, ObservationPeriod[] observationPeriods,
         PayerPlanPeriod[] ppp, DrugExposure[] drugExposures,
         DrugCost[] drugCosts, ConditionOccurrence[] conditionOccurrences,
         ProcedureOccurrence[] procedureOccurrences, ProcedureCost[] procedureCosts, Observation[] observations,
         Measurement[] measurements, VisitOccurrence[] visitOccurrences, VisitCost[] visitCosts, Cohort[] cohort,
         DeviceExposure[] devExposure, DeviceCost[] deviceCost)
      {
         chunkData.AddData(person);

         if (death != null)
         {
            if(!death.CauseConceptId.HasValue)
               death.CauseConceptId = 0;

            chunkData.AddData(death);
         }

         foreach (var observationPeriod in observationPeriods)
         {
            chunkData.AddData(observationPeriod);
         }

         foreach (var payerPlanPeriod in ppp)
         {
            chunkData.AddData(payerPlanPeriod);
         }
 
         foreach (var drugCost in drugCosts)
         {
            chunkData.AddData(drugCost);
         }
         
         foreach (var procedureCost in procedureCosts)
         {
            chunkData.AddData(procedureCost);
         }

         foreach (var visitOccurrence in visitOccurrences)
         {
            chunkData.AddData(visitOccurrence);
         }

         foreach (var visitCost in visitCosts)
         {
            chunkData.AddData(visitCost);
         }

         foreach (var c in cohort)
         {
            chunkData.AddData(c);
         }

         foreach (var dc in deviceCost)
         {
            chunkData.AddData(dc);
         }

         AddToChunk("Condition", conditionOccurrences);
         AddToChunk("Drug", drugExposures);
         AddToChunk("Procedure", procedureOccurrences);
         AddToChunk("Observation", observations);
         AddToChunk("Measurement", measurements);
         AddToChunk("Device", devExposure);

         var drugEra = BuildDrugEra(drugForEra.ToArray()).ToArray();
         var conditionEra = BuildConditionEra(conditionForEra.ToArray()).ToArray();

         foreach (var eraEntity in drugEra)
         {
            chunkData.AddData(eraEntity, EntityType.DrugEra);
         }

         foreach (var eraEntity in conditionEra)
         {
            chunkData.AddData(eraEntity, EntityType.ConditionEra);
         }
      }

      public virtual void AddToChunk(string domain, IEnumerable<IEntity> entities)
      {
         foreach (var entity in entities)
         {
            var entityDomain = entity.Domain;
            if (string.IsNullOrEmpty(entityDomain))
            {
               entityDomain = domain;
            }
                       

            switch (entityDomain)
            {
               case "Condition":
                  var obs = entity as Observation;
                  if (obs == null || obs.ValueAsNumber == 1)
                  {
                     var cond = entity as ConditionOccurrence ??
                                new ConditionOccurrence(entity)
                                {
                                   Id = chunkData.KeyMasterOffset.ConditionOccurrenceId
                                };
                     conditionForEra.Add(cond);
                     chunkData.AddData(cond);
                  }
                  break;

               case "Measurement":
                  chunkData.AddData(entity as Measurement ?? new Measurement(entity) { Id = chunkData.KeyMasterOffset.MeasurementId });
                  break;

               case "Meas Value":
                  chunkData.AddData(entity as Measurement ?? new Measurement(entity) { Id = chunkData.KeyMasterOffset.MeasurementId });
                  break;

               case "Observation":
                  chunkData.AddData(entity as Observation ?? new Observation(entity) { Id = chunkData.KeyMasterOffset.ObservationId });
                  break;

               case "Procedure":
                  chunkData.AddData(entity as ProcedureOccurrence ??
                                                                  new ProcedureOccurrence(entity)
                                                                  {
                                                                     Id =
                                                                        chunkData.KeyMasterOffset.ProcedureOccurrenceId
                                                                  });
                  break;

               case "Device":
                  chunkData.AddData(entity as DeviceExposure ??
                                                            new DeviceExposure(entity)
                                                            {
                                                               Id = chunkData.KeyMasterOffset.DeviceExposureId
                                                            });
                  break;

               case "Drug":
                  var drg = entity as DrugExposure ??
                            new DrugExposure(entity)
                            {
                               Id = chunkData.KeyMasterOffset.DrugExposureId,
                               GetEraConceptIdsCall = vocabulary.LookupIngredientLevel
                            };

                  drugForEra.Add(drg);
                  chunkData.AddData(drg);
                  break;

            }

            //HIX-823
            if (domain == "Procedure" && entityDomain != "Procedure")
            {
                var po = (ProcedureOccurrence)entity;
                po.ConceptId = 0;
                chunkData.AddData(po);
            }

            if (domain == "Observation" && entityDomain != "Observation")
            {
                var o = (Observation)entity;
                o.ConceptId = 0;
                chunkData.AddData(o);
            }
         }
      }


      /// exclude records that out of any available observation period records
      protected static IEnumerable<T> Clean<T>(IEnumerable<T> input, IEnumerable<ObservationPeriod> observationPeriods) where T : IEntity
      {
         return input.Where(item => observationPeriods.FirstOrDefault(p => item.StartDate.Between(p.StartDate, p.EndDate.Value)) != null);
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

      public void JoinToChunkData(ChunkData chunkData)
      {
         this.chunkData = chunkData;
      }

      public void JoinToVocabulary(Vocabulary vocabulary)
      {
          if (this.vocabulary == null)
              this.vocabulary = vocabulary;
      }

      #endregion
   }
}
