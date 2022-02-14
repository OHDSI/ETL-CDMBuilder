using org.ohdsi.cdm.framework.common.Builder;
using org.ohdsi.cdm.framework.common.Enums;
using org.ohdsi.cdm.framework.common.Extensions;
using org.ohdsi.cdm.framework.common.Helpers;
using org.ohdsi.cdm.framework.common.Lookups;
using org.ohdsi.cdm.framework.common.Omop;
using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Linq;

namespace org.ohdsi.cdm.framework.common.Base
{
    /// <summary>
    ///  Base implementation of PersonBuilder
    /// </summary>
    public class PersonBuilder : IPersonBuilder
    {
        #region Variables

        protected ChunkData ChunkData;
        protected KeyMasterOffsetManager Offset;
        protected IVocabulary Vocabulary;
        protected List<EraEntity> ObservationPeriodsRaw = new List<EraEntity>();
        protected List<Person> PersonRecords = new List<Person>();
        protected List<Death> DeathRecords = new List<Death>();
        protected List<Cohort> CohortRecords = new List<Cohort>();

        protected List<PayerPlanPeriod>
            PayerPlanPeriodsRaw = new List<PayerPlanPeriod>();

        protected List<ConditionOccurrence> ConditionOccurrencesRaw =
            new List<ConditionOccurrence>();

        protected List<DrugExposure> DrugExposuresRaw = new List<DrugExposure>();

        protected List<ProcedureOccurrence> ProcedureOccurrencesRaw =
            new List<ProcedureOccurrence>();

        protected List<Observation> ObservationsRaw = new List<Observation>();
        protected List<Measurement> MeasurementsRaw = new List<Measurement>();

        protected List<VisitOccurrence>
            VisitOccurrencesRaw = new List<VisitOccurrence>();

        protected List<VisitDetail>
            VisitDetailsRaw = new List<VisitDetail>();

        protected List<VisitCost> VisitCostsRaw = new List<VisitCost>();
        protected List<DeviceExposure> DeviceExposureRaw = new List<DeviceExposure>();
        protected List<DeviceCost> DeviceCostRaw = new List<DeviceCost>();

        protected List<DrugExposure> DrugForEra = new List<DrugExposure>();
        protected List<ConditionOccurrence> ConditionForEra = new List<ConditionOccurrence>();

        protected List<Note> NoteRecords = new List<Note>();

        private BuildSettings _settings;

        private readonly Dictionary<Guid, VisitOccurrence> _rawVisits = new Dictionary<Guid, VisitOccurrence>();
        private readonly Dictionary<long, List<VisitDetail>> _visitDetails = new Dictionary<long, List<VisitDetail>>();
        #endregion
        public PersonBuilder(BuildSettings settings)
        {
            _settings = settings;
        }

        public PersonBuilder()
        {
            _settings = new BuildSettings();
        }

        #region Methods

        public bool AddCost(long eventId, IEntity entity, Func<ICostV5, Cost> createCost)
        {
            // TMP
            var costDataExists = false;
            if (entity == null) return false;

            switch (entity.GeEntityType())
            {
                case EntityType.DrugExposure:
                    {
                        var de = (DrugExposure)entity;

                        if (de.DrugCost != null)
                        {
                            costDataExists |= AddCost(eventId, createCost, de, de.DrugCost);
                        }

                        de.DrugCost = null;
                        break;
                    }

                case EntityType.ProcedureOccurrence:
                    {
                        var p = (ProcedureOccurrence)entity;
                        if (p.ProcedureCosts != null && p.ProcedureCosts.Count > 0)
                        {
                            foreach (var pc in p.ProcedureCosts)
                            {
                                costDataExists |= AddCost(eventId, createCost, p, pc);
                            }

                            p.ProcedureCosts.Clear();
                            p.ProcedureCosts = null;
                        }
                        break;
                    }


                case EntityType.Observation:
                    {
                        var o = (Observation)entity;
                        if (o.ObservationCost != null && o.ObservationCost.Count > 0)
                        {
                            foreach (var oc in o.ObservationCost)
                            {
                                costDataExists |= AddCost(eventId, createCost, o, oc);
                            }
                            o.ObservationCost.Clear();
                            o.ObservationCost = null;
                        }
                        break;
                    }

                case EntityType.VisitOccurrence:
                    {
                        var vo = (VisitOccurrence)entity;
                        if (vo.VisitCosts != null && vo.VisitCosts.Count > 0)
                        {
                            foreach (var vc in vo.VisitCosts)
                            {
                                costDataExists |= AddCost(eventId, createCost, vo, vc);
                            }
                            vo.VisitCosts.Clear();
                            vo.VisitCosts = null;
                        }
                        break;
                    }

                case EntityType.Measurement:
                    {
                        var m = (Measurement)entity;
                        if (m.MeasurementCost != null && m.MeasurementCost.Count > 0)
                        {
                            foreach (var mc in m.MeasurementCost)
                            {
                                costDataExists |= AddCost(eventId, createCost, m, mc);
                            }
                            m.MeasurementCost.Clear();
                            m.MeasurementCost = null;
                        }
                        break;
                    }

                case EntityType.DeviceExposure:
                    {
                        var d = (DeviceExposure)entity;
                        if (d.DeviceCosts != null && d.DeviceCosts.Count > 0)
                        {
                            foreach (var dc in d.DeviceCosts)
                            {
                                costDataExists |= AddCost(eventId, createCost, d, dc);
                            }

                            d.DeviceCosts.Clear();
                            d.DeviceCosts = null;
                        }
                        break;
                    }
            }

            return costDataExists;
        }

        public void Reset()
        {
            //ChunkData.Clean();

            Vocabulary = null;
            ObservationPeriodsRaw.Clear();
            ObservationPeriodsRaw = null;

            PersonRecords.Clear();
            PersonRecords = null;
            DeathRecords.Clear();
            DeathRecords = null;
            CohortRecords.Clear();
            CohortRecords = null;

            PayerPlanPeriodsRaw.Clear();
            PayerPlanPeriodsRaw = null;

            ConditionOccurrencesRaw.Clear();
            ConditionOccurrencesRaw = null;

            DrugExposuresRaw.Clear();
            DrugExposuresRaw = null;

            ProcedureOccurrencesRaw.Clear();
            ProcedureOccurrencesRaw = null;

            ObservationsRaw.Clear();
            ObservationsRaw = null;

            MeasurementsRaw.Clear();
            MeasurementsRaw = null;

            VisitOccurrencesRaw.Clear();
            VisitOccurrencesRaw = null;

            VisitDetailsRaw.Clear();
            VisitDetailsRaw = null;

            VisitCostsRaw.Clear();
            VisitCostsRaw = null;

            DeviceExposureRaw.Clear();
            DeviceExposureRaw = null;

            DeviceCostRaw.Clear();
            DeviceCostRaw = null;

            DrugForEra.Clear();
            DrugForEra = null;

            ConditionForEra.Clear();
            ConditionForEra = null;

            NoteRecords.Clear();
            NoteRecords = null;
        }

        private bool AddCost(long eventId, Func<ICostV5, Cost> createCost, IEntity entity, ICostV5 entityCost)
        {
            if (entityCost == null) return false;

            var cost = createCost(entityCost);
            cost.CostId = Offset.GetKeyOffset(entityCost.PersonId).VisitCostId;
            cost.EventId = eventId;

            return ChunkData.AddCostData(cost);
        }
        public ChunkData Result => ChunkData;

        public bool Complete { get; set; }

        public virtual string GetFolder()
        {
            throw new NotImplementedException();
        }

        public void AddChildData(ProcedureOccurrence parent, ProcedureCost pc)
        {
            parent.ProcedureCosts = new List<ProcedureCost> { pc };
        }

        public void AddChildData(DrugExposure parent, DrugCost child)
        {
            parent.DrugCost = child;
        }

        public void AddChildData(DeviceExposure parent, DeviceCost child)
        {
            parent.DeviceCosts = new List<DeviceCost> { child };
        }

        public void AddChildData(Measurement parent, MeasurementCost child)
        {
            parent.MeasurementCost = new List<MeasurementCost> { child };
        }

        public void AddChildData(Observation parent, ObservationCost child)
        {
            parent.ObservationCost = new List<ObservationCost> { child };
        }

        public void AddChildData(VisitOccurrence parent, VisitCost child)
        {
            parent.VisitCosts = new List<VisitCost> { child };
        }

        public void AddNote(Note data)
        {
            NoteRecords.Add(data);
        }

        /// <summary>
        /// Add raw entities to builder for further build
        /// </summary>
        /// <param name="data">raw entity</param>
        public void AddData(IEntity data)
        {
            switch (data.GeEntityType())
            {
                case EntityType.Person:
                    {
                        AddEntity((Person)data, PersonRecords);

                        if (data.StartDate > DateTime.MinValue)
                        {
                            AddEntity(
                                new EraEntity
                                {
                                    PersonId = data.PersonId,
                                    StartDate = data.StartDate,
                                    EndDate = data.EndDate,
                                    TypeConceptId = data.TypeConceptId,
                                    AdditionalFields = data.AdditionalFields
                                }, ObservationPeriodsRaw);
                        }
                        break;
                    }

                case EntityType.ObservationPeriod:
                    {
                        if (data.StartDate > DateTime.MinValue)
                        {
                            AddEntity(
                                new EraEntity
                                {
                                    PersonId = data.PersonId,
                                    StartDate = data.StartDate,
                                    EndDate = data.EndDate,
                                    TypeConceptId = data.TypeConceptId
                                }, ObservationPeriodsRaw);
                        }
                        break;
                    }

                case EntityType.Death:
                    {
                        AddEntity((Death)data, DeathRecords);
                        break;
                    }

                case EntityType.PayerPlanPeriod:
                    {
                        AddEntity((PayerPlanPeriod)data, PayerPlanPeriodsRaw);
                        break;
                    }

                case EntityType.ConditionOccurrence:
                    {
                        AddEntity((ConditionOccurrence)data, ConditionOccurrencesRaw);
                        break;
                    }

                case EntityType.DrugExposure:
                    {
                        AddEntity((DrugExposure)data, DrugExposuresRaw);
                        break;
                    }

                case EntityType.ProcedureOccurrence:
                    {
                        AddEntity((ProcedureOccurrence)data, ProcedureOccurrencesRaw);
                        break;
                    }

                case EntityType.Observation:
                    {
                        AddEntity((Observation)data, ObservationsRaw);
                        break;
                    }

                case EntityType.VisitOccurrence:
                    {
                        AddEntity((VisitOccurrence)data, VisitOccurrencesRaw);
                        break;
                    }

                case EntityType.VisitDetail:
                    {
                        AddEntity((VisitDetail)data, VisitDetailsRaw);
                        break;
                    }

                case EntityType.Cohort:
                    {
                        AddEntity((Cohort)data, CohortRecords);
                        break;
                    }

                case EntityType.Measurement:
                    {
                        AddEntity((Measurement)data, MeasurementsRaw);
                        break;
                    }

                case EntityType.DeviceExposure:
                    {
                        AddEntity((DeviceExposure)data, DeviceExposureRaw);
                        break;
                    }

                case EntityType.Note:
                    {
                        //AddEntity((Note)data, NoteRecords); TMP: NOTE 
                        break;
                    }
            }
        }

        protected static void AddEntity<T>(T entity, List<T> list) where T : IEntity
        {
            list.Add(entity);
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


            foreach (var e in records.Where(e => !string.IsNullOrEmpty(e.ProviderKey)))
            {
                e.ProviderId = Entity.GetId(e.ProviderKey);
            }
        }

        // set corresponding PlanPeriodIds to drug exposure entities and procedure occurrence entities
        protected virtual void SetPayerPlanPeriodId(PayerPlanPeriod[] payerPlanPeriods, DrugExposure[] drugExposures,
            ProcedureOccurrence[] procedureOccurrences, VisitOccurrence[] visitOccurrences,
            DeviceExposure[] deviceExposure)
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
            return EraHelper.GetObservationPeriods(gap, observationPeriods, Offset);
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
                Offset);
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

            return current.PlanSourceValue == other.PlanSourceValue &&
                   current.PayerSourceValue == other.PayerSourceValue;
        }

        private bool WithinTheObservationPeriod(EntityType table)
        {
            if(_settings.TableSettings != null)
            {
                var settings = _settings.TableSettings.FirstOrDefault(s => s.Table == table);

                if (settings != null)
                    return settings.WithinTheObservationPeriod;
            }

            return false;
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
    
            var ds = Clean(death, observationPeriods, WithinTheObservationPeriod(EntityType.Death)).ToList();
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
        public virtual KeyValuePair<Person, Attrition> BuildPerson(List<Person> records)
        {
            if (records == null || records.Count == 0)
                return new KeyValuePair<Person, Attrition>(null, Attrition.UnacceptablePatientQuality);

            if (records.All(p => p.GenderConceptId == 8551))
            {
                return new KeyValuePair<Person, Attrition>(null, Attrition.UnknownGender);
            }

            if (_settings.ImplausibleYearOfBirthBefore != 0 && records.All(p => p.YearOfBirth < _settings.ImplausibleYearOfBirthBefore))
            {
                return new KeyValuePair<Person, Attrition>(null, Attrition.ImplausibleYOBPast);
            }

            if (_settings.ImplausibleYearOfBirthAfter != 0 && records.All(p => p.YearOfBirth > _settings.ImplausibleYearOfBirthAfter))
            {
                return new KeyValuePair<Person, Attrition>(null, Attrition.ImplausibleYOBFuture);
            }

            var ordered = records.OrderByDescending(p => p.StartDate).ToArray();
            var person = ordered.Take(1).First();
            person.StartDate = ordered.Take(1).Last().StartDate;

            var gender =
                records.GroupBy(p => p.GenderConceptId).OrderByDescending(gp => gp.Count()).Take(1).First().First();
            var race = records.GroupBy(p => p.RaceConceptId).OrderByDescending(gp => gp.Count()).Take(1).First()
                .First();

            person.GenderConceptId = gender.GenderConceptId;
            person.GenderSourceValue = gender.GenderSourceValue;
            person.RaceConceptId = race.RaceConceptId;
            person.RaceSourceValue = race.RaceSourceValue;

            if (!_settings.AllowUnknownYearOfBirth && !person.YearOfBirth.HasValue)
            {
                return new KeyValuePair<Person, Attrition>(null, Attrition.UnknownYearOfBirth);
            }

            // TMP
            if (person.YearOfBirth == null)
                person.YearOfBirth = 0;

            if (!_settings.AllowUnknownGender && person.GenderConceptId == 8551) //UNKNOWN
            {
                return new KeyValuePair<Person, Attrition>(null, Attrition.UnknownGender);
            }

            if (!_settings.AllowGenderChanges && records.Any(r => r.GenderConceptId != 8551 && r.GenderConceptId != person.GenderConceptId))
            {
                return new KeyValuePair<Person, Attrition>(null, Attrition.GenderChanges); // Gender changed over different enrollment period 
            }

            if (_settings.ImplausibleYearOfBirthBefore != 0 && person.YearOfBirth < _settings.ImplausibleYearOfBirthBefore)
                return new KeyValuePair<Person, Attrition>(null, Attrition.ImplausibleYOBPast);

            if (_settings.ImplausibleYearOfBirthAfter != 0 && person.YearOfBirth > _settings.ImplausibleYearOfBirthAfter)
                return new KeyValuePair<Person, Attrition>(null, Attrition.ImplausibleYOBFuture);

            if (!_settings.AllowMultipleYearsOfBirth && records.Where(r => r.YearOfBirth.HasValue && r.YearOfBirth > 1900).Max(r => r.YearOfBirth) -
              records.Where(r => r.YearOfBirth.HasValue && r.YearOfBirth > 1900).Min(r => r.YearOfBirth) > 2)
            {
                return new KeyValuePair<Person, Attrition>(null, Attrition.MultipleYearsOfBirth);
            }

            return new KeyValuePair<Person, Attrition>(person, Attrition.None);
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
            if (_settings.UseVisitRollupLogic)
                return BuildVisitOccurrencesWithRollup(visitOccurrences, observationPeriods);

            return Clean(visitOccurrences, observationPeriods, WithinTheObservationPeriod(EntityType.VisitOccurrence)).Distinct();
        }

        private List<VisitOccurrence> CollapseVisits(IEnumerable<VisitOccurrence> visits)
        {
            var collaped = new List<VisitOccurrence>();
            foreach (var claim in visits.OrderBy(vo => vo.StartDate)
                .ThenBy(vo => vo.EndDate))
            {
                if (collaped.Count > 0)
                {
                    var previousClaim = collaped.Last();
                    if (claim.StartDate <= previousClaim.EndDate.Value.AddDays(1))
                    {
                        if (claim.EndDate >= previousClaim.EndDate)
                        {
                            previousClaim.EndDate = claim.EndDate;
                        }

                        AddRawVisitOccurrence(claim, previousClaim);
                        continue;
                    }
                }

                AddRawVisitOccurrence(claim, claim);
                collaped.Add(claim);
            }

            return collaped;
        }


        private void AddRawVisitOccurrence(VisitOccurrence rawVisit, VisitOccurrence finalVisit)
        {
            if (!_rawVisits.ContainsKey(rawVisit.SourceRecordGuid))
                _rawVisits.Add(rawVisit.SourceRecordGuid, finalVisit);
            else
                _rawVisits[rawVisit.SourceRecordGuid] = finalVisit;
        }

        public IEnumerable<VisitOccurrence> BuildVisitOccurrencesWithRollup(VisitOccurrence[] rawVisitOccurrences,
          ObservationPeriod[] observationPeriods)
        {
            var ipVisitsRaw = new List<VisitOccurrence>();
            var erVisitsRaw = new List<VisitOccurrence>();
            var erVisits = new List<VisitOccurrence>();
            var nonHospitalVisitsRaw = new List<VisitOccurrence>();
            var othersRaw = new List<VisitOccurrence>();
            var remainingRaw = new List<VisitOccurrence>();
            var remaining = new List<VisitOccurrence>();

            foreach (var visitOccurrence in rawVisitOccurrences)
            {
                if (!visitOccurrence.EndDate.HasValue)
                    visitOccurrence.EndDate = visitOccurrence.StartDate;


                if (visitOccurrence.StartDate > visitOccurrence.EndDate.Value)
                    visitOccurrence.EndDate = visitOccurrence.StartDate;

                var result = Vocabulary.Lookup(visitOccurrence.ConceptId.ToString(), "CMSPlaceOfService",
                    DateTime.MinValue);

                var conceptId = result.Any() ? result[0].ConceptId ?? 0 : 0;
                visitOccurrence.ConceptId = conceptId;

                if (conceptId == 9201)
                {
                    ipVisitsRaw.Add(visitOccurrence);
                }
                else if (conceptId == 9203)
                {
                    erVisitsRaw.Add(visitOccurrence);
                }
                else
                {
                    othersRaw.Add(visitOccurrence);
                }
            }


            var ipVisits = CollapseVisits(ipVisitsRaw);

            // Collapse records that have the same VISIT_DETAIL_START_DATETIME into one Visit.
            foreach (var erGroup in erVisitsRaw.GroupBy(v => v.StartDate))
            {
                var erVisit = erGroup.First();
                erVisit.EndDate = erGroup.Max(v => v.EndDate);

                var ip = ipVisits.FirstOrDefault(v => erVisit.StartDate.Between(v.StartDate, v.EndDate.Value));
                VisitOccurrence visit = null;
                if (ip != null)
                {
                    //    If an emergency room visit starts on the first day of an Inpatient visit(defined in the step above), then
                    //    Assign the emergency room visit the autogenerated VISIT_OCCURRENCE_ID of the Inpatient visit.
                    //    Set VISIT_CONCEPT_ID = 262(it would previously have been 9201).
                    if (ip.StartDate == erVisit.StartDate)
                    {
                        ip.ConceptId = 262;
                    }

                    if (ip.EndDate < erVisit.EndDate)
                        ip.EndDate = erVisit.EndDate;

                    visit = ip;
                }
                else
                {
                    visit = erVisit;
                    erVisits.Add(visit);
                }

                foreach (var visitOccurrence in erGroup)
                {
                    AddRawVisitOccurrence(visitOccurrence, visit);
                }
            }

            // Rolling additional visit detail into Inpatient
            foreach (var otherVisit in othersRaw)
            {
                var ip = ipVisits.FirstOrDefault(v => otherVisit.StartDate.Between(v.StartDate, v.EndDate.Value));

                //For all other VISIT_DETAIL records, first look to see if they occur at any point within a previously defined inpatient visit.
                if (ip != null)
                {
                    AddRawVisitOccurrence(otherVisit, ip);
                }
                else
                {
                    if (otherVisit.ConceptId == 42898160)
                    {
                        nonHospitalVisitsRaw.Add(otherVisit);
                    }
                    else
                    {
                        remainingRaw.Add(otherVisit);
                    }
                }
            }

            var nonHospitalVisits = CollapseVisits(nonHospitalVisitsRaw);
            // Rolling additional visit detail into Non-hospital institution visit
            foreach (var remainingVisit in remainingRaw)
            {
                var nonHospital =
                    nonHospitalVisits.FirstOrDefault(
                        v => remainingVisit.StartDate.Between(v.StartDate, v.EndDate.Value));
                if (nonHospital != null)
                {
                    AddRawVisitOccurrence(remainingVisit, nonHospital);
                }
                else
                {
                    remaining.Add(remainingVisit);
                }
            }

            // All other VISIT_DETAIL records
            foreach (var byStart in remaining.GroupBy(v => v.StartDate))
            {
                foreach (var byEnd in byStart.GroupBy(v => v.EndDate))
                {
                    foreach (var byCareSiteId in byEnd.GroupBy(v => v.CareSiteId))
                    {
                        var visit = byCareSiteId.OrderBy(v => v.ConceptId).First();

                        //var startDate = byCareSiteId.Min(v => v.StartDate);
                        //var endDate = byCareSiteId.Max(v => v.EndDate);

                        //visit.StartDate = startDate;
                        //visit.EndDate = endDate;

                        foreach (var vo in byCareSiteId)
                        {
                            AddRawVisitOccurrence(vo, visit);
                        }

                        yield return visit;
                    }
                }
            }

            foreach (var visitOccurrence in ipVisits)
            {
                yield return visitOccurrence;
            }

            foreach (var visitOccurrence in erVisits)
            {
                yield return visitOccurrence;
            }

            foreach (var visitOccurrence in nonHospitalVisits)
            {
                yield return visitOccurrence;
            }
        }

        public virtual IEnumerable<VisitDetail> BuildVisitDetails(VisitDetail[] visitDetails, VisitOccurrence[] visitOccurrences,
            ObservationPeriod[] observationPeriods)
        {
            return Clean(visitDetails, observationPeriods, WithinTheObservationPeriod(EntityType.VisitDetail)).Distinct();
        }

        public IEnumerable<Note> BuildNote(Note[] notes, Dictionary<long, VisitOccurrence> visitOccurrences,
            ObservationPeriod[] observationPeriods)
        {
            foreach (var e in notes.Where(item =>
                observationPeriods.FirstOrDefault(p => item.StartDate.Between(p.StartDate, p.EndDate.Value)) !=
                null))
            {
                if (e.VisitOccurrenceId == null || visitOccurrences.ContainsKey(e.VisitOccurrenceId.Value))
                {
                    yield return e;
                }
            }

            //return BuildEntities(notes, visitOccurrences, observationPeriods, true); TMP: NOTE 
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
            return BuildEntities(drugExposures, visitOccurrences, observationPeriods, WithinTheObservationPeriod(EntityType.DrugExposure));
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
            return BuildEntities(conditionOccurrences, visitOccurrences, observationPeriods, WithinTheObservationPeriod(EntityType.ConditionOccurrence));
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
            return BuildEntities(procedureOccurrences, visitOccurrences, observationPeriods, WithinTheObservationPeriod(EntityType.ProcedureOccurrence));
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
            return BuildEntities(observations, visitOccurrences, observationPeriods, WithinTheObservationPeriod(EntityType.Observation));
        }

        public virtual IEnumerable<Measurement> BuildMeasurement(Measurement[] measurements,
            Dictionary<long, VisitOccurrence> visitOccurrences,
            ObservationPeriod[] observationPeriods)
        {
            return BuildEntities(measurements, visitOccurrences, observationPeriods, WithinTheObservationPeriod(EntityType.Measurement));
        }

        /// <summary>
        /// CONDITION_ERAs are chronological periods of condition occurrence.  
        /// There will only be one type of persistence window (duration that is allowed to elapse between condition occurrences) applied to this CDM, which is 30 days. 
        /// CONDITION_END_DATE will be the CONDITION_START_DATE.
        /// </summary>
        /// <param name="conditionOccurrences">Set of condition occurrence entities</param>
        /// <param name="observationPeriods">the observation periods entities for current person</param>
        /// <returns>Enumeration of condition era</returns>
        public virtual IEnumerable<EraEntity> BuildConditionEra(ConditionOccurrence[] conditionOccurrences, ObservationPeriod[] observationPeriods)
        {
            var gap = 30;
            var conceptId = 38000247;
            if (_settings.EraSettings != null)
            {
                var settings = _settings.EraSettings.FirstOrDefault(s => s.Table == EntityType.DrugEra);
                if (settings != null)
                {
                    gap = settings.GapWindow;
                    conceptId = settings.ConceptId;
                }
            }

            foreach (var eraEntity in EraHelper.GetEras(
                Clean(conditionOccurrences, observationPeriods, WithinTheObservationPeriod(EntityType.ConditionEra)).Where(c => string.IsNullOrEmpty(c.Domain) || c.Domain == "Condition"), gap,
                conceptId))
            {
                eraEntity.Id = Offset.GetKeyOffset(eraEntity.PersonId).ConditionEraId;
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
        /// <param name="observationPeriods">the observation periods entities for current person</param>
        /// <returns>Enumeration of drug era</returns>
        public virtual IEnumerable<EraEntity> BuildDrugEra(DrugExposure[] drugExposures, ObservationPeriod[] observationPeriods)
        {
            var gap = 30;
            var conceptId = 38000182;
            if (_settings.EraSettings != null)
            {
                var settings = _settings.EraSettings.FirstOrDefault(s => s.Table == EntityType.DrugEra);
                if(settings != null)
                {
                    gap = settings.GapWindow;
                    conceptId = settings.ConceptId;
                }
            }

            foreach (var eraEntity in EraHelper.GetEras(
            Clean(drugExposures, observationPeriods, WithinTheObservationPeriod(EntityType.DrugEra)).Where(d => string.IsNullOrEmpty(d.Domain) || d.Domain == "Drug"), gap, conceptId))
            {
                eraEntity.Id = Offset.GetKeyOffset(eraEntity.PersonId).DrugEraId;
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

        public IEnumerable<EraEntity> BuildPregnancyEpisodes(ConditionOccurrence[] conditionOccurrences,
            ProcedureOccurrence[] procedureOccurrences, Observation[] observations, Measurement[] measurements, DrugExposure[] drugExposures)
        {

            return null;
        }

        public virtual IEnumerable<DeviceExposure> BuildDeviceExposure(DeviceExposure[] devExposure,
            Dictionary<long, VisitOccurrence> visitOccurrences,
            ObservationPeriod[] observationPeriods)
        {
            return BuildEntities(devExposure, visitOccurrences, observationPeriods, WithinTheObservationPeriod(EntityType.DeviceExposure));
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
            foreach (var vo in visitOccurrences.Where(i => i.VisitCosts != null))
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
        /// <param name="withinTheObservationPeriod">allow records that are only inside of the observation period</param>
        /// <returns>Enumeration of filtered entities</returns>
        public virtual IEnumerable<T> BuildEntities<T>(IEnumerable<T> entitiesToBuild,
            IDictionary<long, VisitOccurrence> visitOccurrences, IEnumerable<ObservationPeriod> observationPeriods, bool withinTheObservationPeriod)
            where T : IEntity
        {
            var uniqueEntities = new HashSet<T>();
            foreach (var e in Clean(entitiesToBuild, observationPeriods, withinTheObservationPeriod))
            {
                // TMP
                if(e.VisitOccurrenceId.HasValue && !visitOccurrences.ContainsKey(e.VisitOccurrenceId.Value))
                {
                    e.VisitOccurrenceId = null;
                }

                //if (e.VisitOccurrenceId == null || visitOccurrences.ContainsKey(e.VisitOccurrenceId.Value))
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

        private VisitOccurrence GetVisitOccurrence(IEntity ent)
        {
            if (_rawVisits.ContainsKey(ent.SourceRecordGuid))
            {
                var vo = _rawVisits[ent.SourceRecordGuid];
                if (vo.Id == 0 && _rawVisits.ContainsKey(vo.SourceRecordGuid) &&
                    _rawVisits[vo.SourceRecordGuid].SourceRecordGuid != ent.SourceRecordGuid)
                {
                    vo = _rawVisits[vo.SourceRecordGuid];
                }

                return vo;
            }

            return null;
        }

        /// <summary>
        /// Build person entity and all person related entities like: DrugExposures, ConditionOccurrences, ProcedureOccurrences... from raw data sets 
        /// </summary>
        public virtual Attrition Build(ChunkData data, KeyMasterOffsetManager o)
        {
            this.Offset = o;
            this.ChunkData = data;

            var result = BuildPerson(PersonRecords.ToList());
            var person = result.Key;
            if (person == null)
            {
                Complete = true;
                return result.Value;
            }

            if (!_settings.AllowInvalidObservationTime)
            {
                var op = ObservationPeriodsRaw.Where(op =>
                   op.StartDate.Year >= person.YearOfBirth &&
                   op.EndDate.Value.Year >= person.YearOfBirth &&
                   op.StartDate.Year <= DateTime.Now.Year).ToArray();

                if (op.Length == 0)
                    return Attrition.InvalidObservationTime;
            }

            var observationPeriods = new ObservationPeriod[0];
            if (ObservationPeriodsRaw.Count > 0)
            {
                var gap = 32;

                if (_settings.EraSettings != null)
                {
                    var settings = _settings.EraSettings.FirstOrDefault(s => s.Table == EntityType.ObservationPeriod);
                    if (settings != null)
                    {
                        gap = settings.GapWindow;
                    }
                }

                observationPeriods =
                    BuildObservationPeriods(gap, ObservationPeriodsRaw.ToArray()).ToArray();
            }

            foreach (var op in observationPeriods)
            {
                if (!op.TypeConceptId.HasValue)
                    op.TypeConceptId = 0;
            }

            // Delete any individual that has an OBSERVATION_PERIOD that is >= 2 years prior to the YEAR_OF_BIRTH
            //if (Excluded(person, observationPeriods))
            //{
            //    Complete = true;
            //    return Attrition.ImplausibleYOBPostEarliestOP;
            //}

            var payerPlanPeriods = BuildPayerPlanPeriods(PayerPlanPeriodsRaw.ToArray(), null).ToArray();

            //var visitOccurrences = new Dictionary<long, VisitOccurrence>();
            //foreach (var visitOccurrence in BuildVisitOccurrences(VisitOccurrencesRaw.ToArray(), observationPeriods))
            //{
            //    if (visitOccurrence.IdUndefined)
            //        visitOccurrence.Id = Offset.GetKeyOffset(visitOccurrence.PersonId).VisitOccurrenceId;

            //    if(!visitOccurrences.ContainsKey(visitOccurrence.Id))
            //        visitOccurrences.Add(visitOccurrence.Id, visitOccurrence);

            //    if (!visitOccurrence.EndDate.HasValue)
            //        visitOccurrence.EndDate = visitOccurrence.StartDate;
            //}

            //var visitDetails = BuildVisitDetails(VisitDetailsRaw.ToArray(), VisitOccurrencesRaw.ToArray(),
            //    observationPeriods).ToArray();

            //foreach (var vd in visitDetails)
            //{
            //    if (!vd.EndDate.HasValue)
            //        vd.EndDate = vd.StartDate;
            //}

            var visitDetails = BuildVisitDetails(null, VisitOccurrencesRaw.ToArray(), observationPeriods).ToArray();

            var visitOccurrences = new Dictionary<long, VisitOccurrence>();
            var visitIds = new List<long>();
            foreach (var visitOccurrence in BuildVisitOccurrences(VisitOccurrencesRaw.ToArray(), observationPeriods))
            {
                visitOccurrence.Id = Offset.GetKeyOffset(visitOccurrence.PersonId).VisitOccurrenceId;

                if (!visitOccurrences.ContainsKey(visitOccurrence.Id))
                {
                    visitOccurrences.Add(visitOccurrence.Id, visitOccurrence);
                    visitIds.Add(visitOccurrence.Id);
                }
            }

            foreach (var visitDetail in visitDetails)
            {
                var vo = GetVisitOccurrence(visitDetail);
                visitDetail.VisitOccurrenceId = vo?.Id ?? 0;

                if (visitDetail.VisitOccurrenceId.HasValue && !_visitDetails.ContainsKey(visitDetail.VisitOccurrenceId.Value))
                {
                    _visitDetails.Add(visitDetail.VisitOccurrenceId.Value, new List<VisitDetail>());
                }

                _visitDetails[visitDetail.VisitOccurrenceId.Value].Add(visitDetail);
            }

            long? prevVisitId = null;
            foreach (var visitId in visitIds.OrderBy(v => v))
            {
                if (prevVisitId.HasValue)
                {
                    visitOccurrences[visitId].PrecedingVisitOccurrenceId = prevVisitId;
                }

                prevVisitId = visitId;
            }

            var drugExposures =
                BuildDrugExposures(DrugExposuresRaw.ToArray(), visitOccurrences, observationPeriods).ToArray();
            var conditionOccurrences =
                BuildConditionOccurrences(ConditionOccurrencesRaw.ToArray(), visitOccurrences, observationPeriods)
                    .ToArray();
            var procedureOccurrences =
                BuildProcedureOccurrences(ProcedureOccurrencesRaw.ToArray(), visitOccurrences, observationPeriods)
                    .ToArray();
            var observations = BuildObservations(ObservationsRaw.ToArray(), visitOccurrences, observationPeriods)
                .ToArray();
            var measurements = BuildMeasurement(MeasurementsRaw.ToArray(), visitOccurrences, observationPeriods)
                .ToArray();
            var deviceExposure =
                BuildDeviceExposure(DeviceExposureRaw.ToArray(), visitOccurrences, observationPeriods).ToArray();

            // set corresponding PlanPeriodIds to drug exposure entities and procedure occurrence entities
            SetPayerPlanPeriodId(payerPlanPeriods, drugExposures, procedureOccurrences,
                visitOccurrences.Values.ToArray(),
                deviceExposure);

            // set corresponding ProviderIds
            SetProviderIds(drugExposures);
            SetProviderIds(conditionOccurrences);
            SetProviderIds(procedureOccurrences);
            SetProviderIds(observations);

            var death = BuildDeath(DeathRecords.ToArray(), visitOccurrences, observationPeriods);

            // TODO: TMP
            var drugCosts = BuildDrugCosts(drugExposures).ToArray();
            var procedureCosts = BuildProcedureCosts(procedureOccurrences).ToArray();
            var visitCosts = BuildVisitCosts(visitOccurrences.Values.ToArray()).ToArray();
            var devicCosts = BuildDeviceCosts(deviceExposure).ToArray();

            var cohort = BuildCohort(CohortRecords.ToArray(), observationPeriods).ToArray();
            var notes = BuildNote(NoteRecords.ToArray(), visitOccurrences, observationPeriods).ToArray();

            // push built entities to ChunkBuilder for further save to CDM database
            AddToChunk(person, death, observationPeriods, payerPlanPeriods, drugExposures,
                conditionOccurrences, procedureOccurrences, observations, measurements,
                visitOccurrences.Values.ToArray(), visitDetails, cohort, deviceExposure, notes);

            Complete = true;

            var pg = new PregnancyAlgorithm.PregnancyAlgorithm();
            foreach (var r in pg.GetPregnancyEpisodes(Vocabulary, person, observationPeriods,
                ChunkData.ConditionOccurrences.Where(e => e.PersonId == person.PersonId).ToArray(),
                ChunkData.ProcedureOccurrences.Where(e => e.PersonId == person.PersonId).ToArray(),
                ChunkData.Observations.Where(e => e.PersonId == person.PersonId).ToArray(),
                ChunkData.Measurements.Where(e => e.PersonId == person.PersonId).ToArray(),
                ChunkData.DrugExposures.Where(e => e.PersonId == person.PersonId).ToArray()))
            {
                r.Id = Offset.GetKeyOffset(r.PersonId).ConditionEraId;
                ChunkData.ConditionEra.Add(r);
            }

            return Attrition.None;
        }

        protected void AddToChunk(Person person, Death death, ObservationPeriod[] observationPeriods,
            PayerPlanPeriod[] ppp, DrugExposure[] drugExposures,
            ConditionOccurrence[] conditionOccurrences,
            ProcedureOccurrence[] procedureOccurrences, Observation[] observations,
            VisitOccurrence[] visitOccurrences, Cohort[] cohort)
        {
            AddToChunk(person, death, observationPeriods,
                ppp, drugExposures,
                conditionOccurrences,
                procedureOccurrences, observations, new Measurement[] { },
                visitOccurrences, null, cohort, new DeviceExposure[] { },
                new Note[] { });
        }

        /// <summary>
        /// Push built entities to ChunkBuilder for further save to CDM database
        /// </summary>
        /// <param name="person">person entity</param>
        /// <param name="death">death entity</param>
        /// <param name="observationPeriods">the observation period entities for current person</param>
        /// <param name="ppp">the payerplan period entities for current person</param>
        /// <param name="drugExposures">the drug exposure entities for current person</param>
        /// <param name="conditionOccurrences">the condition occurrence entities for current person</param>
        /// <param name="procedureOccurrences">the procedure occurrence entities for current person</param>
        /// <param name="observations">the observation entities for current person</param>
        /// <param name="visitOccurrences">the visit occurrence entities for current person</param>

        /// <param name="cohort">the cohort entities for current person</param>
        public virtual void AddToChunk(Person person, Death death, ObservationPeriod[] observationPeriods,
            PayerPlanPeriod[] ppp, DrugExposure[] drugExposures,
            ConditionOccurrence[] conditionOccurrences,
            ProcedureOccurrence[] procedureOccurrences, Observation[] observations,
            Measurement[] measurements, VisitOccurrence[] visitOccurrences, VisitDetail[] visitDetails, Cohort[] cohort,
            DeviceExposure[] devExposure, Note[] notes)
        {
            ChunkData.AddData(person);

            if (death != null)
            {
                if (!death.CauseConceptId.HasValue)
                    death.CauseConceptId = 0;

                ChunkData.AddData(death);
            }

            foreach (var observationPeriod in observationPeriods)
            {
                ChunkData.AddData(observationPeriod);
            }

            foreach (var payerPlanPeriod in ppp)
            {
                ChunkData.AddData(payerPlanPeriod);
            }

            foreach (var visitOccurrence in visitOccurrences)
            {
                ChunkData.AddData(visitOccurrence);
            }

            if (visitDetails != null)
            {
                foreach (var visitDetail in visitDetails)
                {
                    ChunkData.AddData(visitDetail);
                }
            }

            if (cohort != null)
            {
                foreach (var c in cohort)
                {
                    ChunkData.AddData(c);
                }
            }

            if (notes != null)
            {
                foreach (var n in notes)
                {
                    ChunkData.Note.Add(n);
                    //TMP: NOTE
                    //ChunkData.AddData(n);
                }
            }

            AddToChunk("Condition", conditionOccurrences);
            AddToChunk("Drug", drugExposures);
            AddToChunk("Procedure", procedureOccurrences);
            AddToChunk("Observation", observations);
            AddToChunk("Measurement", measurements);
            AddToChunk("Device", devExposure);

            var drugEra = BuildDrugEra(DrugForEra.ToArray(), observationPeriods).ToArray();
            var conditionEra = BuildConditionEra(ConditionForEra.ToArray(), observationPeriods).ToArray();

            foreach (var eraEntity in drugEra)
            {
                ChunkData.AddData(eraEntity, EntityType.DrugEra);
            }

            foreach (var eraEntity in conditionEra)
            {
                ChunkData.AddData(eraEntity, EntityType.ConditionEra);
            }
        }

        public string GetDomain(string entityDomain, string conceptDomain)
        {
            switch (conceptDomain)
            {
                case "Condition":
                case "Measurement":
                case "Meas Value":
                case "Observation":
                case "Procedure":
                case "Device":
                case "Drug":
                    return conceptDomain;

                default:
                    return entityDomain;
            }
        }

        public virtual void AddToChunk(string domain, IEnumerable<IEntity> entities)
        {
            foreach (var entity in entities)
            {
                var entityDomain = GetDomain(domain, entity.Domain);

                switch (entityDomain)
                {
                    case "Condition":
                        {
                            var cond = entity as ConditionOccurrence ??
                                       new ConditionOccurrence(entity)
                                       {
                                           Id = Offset.GetKeyOffset(entity.PersonId).ConditionOccurrenceId
                                       };
                            ConditionForEra.Add(cond);
                            ChunkData.AddData(cond);
                        }

                        break;

                    case "Measurement":
                        ChunkData.AddData(entity as Measurement ?? new Measurement(entity)
                        {
                            Id = Offset.GetKeyOffset(entity.PersonId).MeasurementId
                        });
                        break;

                    case "Meas Value":
                        ChunkData.AddData(entity as Measurement ?? new Measurement(entity)
                        {
                            Id = Offset.GetKeyOffset(entity.PersonId).MeasurementId
                        });
                        break;

                    case "Observation":
                        ChunkData.AddData(entity as Observation ?? new Observation(entity)
                        {
                            Id = Offset.GetKeyOffset(entity.PersonId).ObservationId
                        });
                        break;

                    case "Procedure":
                        ChunkData.AddData(entity as ProcedureOccurrence ??
                                          new ProcedureOccurrence(entity)
                                          {
                                              Id =
                                                  Offset.GetKeyOffset(entity.PersonId).ProcedureOccurrenceId
                                          });
                        break;

                    case "Device":
                        ChunkData.AddData(entity as DeviceExposure ??
                                          new DeviceExposure(entity)
                                          {
                                              Id = Offset.GetKeyOffset(entity.PersonId).DeviceExposureId
                                          });
                        break;

                    case "Drug":
                        var drg = entity as DrugExposure ??
                                  new DrugExposure(entity)
                                  {
                                      Id = Offset.GetKeyOffset(entity.PersonId).DrugExposureId
                                  };

                        DrugForEra.Add(drg);
                        ChunkData.AddData(drg);
                        break;

                }
            }
        }


        /// exclude records that out of any available observation period records
        protected static IEnumerable<T> Clean<T>(IEnumerable<T> input,
            IEnumerable<ObservationPeriod> observationPeriods, bool withinTheObservationPeriod) where T : IEntity
        {
            if (withinTheObservationPeriod)
            {
                return input.Where(item =>
                    observationPeriods.FirstOrDefault(p => item.StartDate.Date.Between(p.StartDate.Date, p.EndDate.Value.Date)) !=
                    null);
            }

            return input;
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

        public void JoinToVocabulary(IVocabulary vocabulary)
        {
            if (Vocabulary == null)
                Vocabulary = vocabulary;
        }

        #endregion
    }
}
