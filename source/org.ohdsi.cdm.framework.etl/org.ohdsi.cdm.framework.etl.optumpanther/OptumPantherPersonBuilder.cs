using org.ohdsi.cdm.framework.common.Base;
using org.ohdsi.cdm.framework.common.Builder;
using org.ohdsi.cdm.framework.common.Extensions;
using org.ohdsi.cdm.framework.common.Omop;
using org.ohdsi.cdm.framework.common.PregnancyAlgorithm;
using System;
using System.Collections.Generic;
using System.Linq;

namespace org.ohdsi.cdm.framework.etl.optumpanther
{
    /// <summary>
    ///  Implementation of PersonBuilder for Optum, based on CDM Build spec
    /// </summary>
    public class OptumPantherPersonBuilder : PersonBuilder
    {
        //private readonly Dictionary<Guid, VisitDetail> _visitDetails = new Dictionary<Guid, VisitDetail>();
        private readonly Dictionary<Guid, VisitOccurrence> _rawVisits = new Dictionary<Guid, VisitOccurrence>();
        private readonly Dictionary<string, long> _visitIds = new Dictionary<string, long>();
        private readonly Dictionary<string, long> _visitDetailIds = new Dictionary<string, long>();

        public override string GetFolder()
        {
            return "ETL\\OPTUMPANTHER";
        }

        public override KeyValuePair<Person, Attrition> BuildPerson(List<Person> records)
        {
            if (records == null || records.Count == 0)
                return new KeyValuePair<Person, Attrition>(null, Attrition.UnacceptablePatientQuality);

            var ordered = records.OrderByDescending(p => p.StartDate).ThenBy(p => p.EndDate);
            var person = ordered.Take(1).Last();

            person.LocationId = Entity.GetId(person.LocationSourceValue);

            if (person.GenderConceptId == 8551) //UNKNOWN
            {
                return new KeyValuePair<Person, Attrition>(null, Attrition.UnknownGender);
            }

            if (!person.YearOfBirth.HasValue)
            {
                return new KeyValuePair<Person, Attrition>(null, Attrition.UnknownYearOfBirth);
            }

            return new KeyValuePair<Person, Attrition>(person, Attrition.None);
        }

        private static IEnumerable<DrugExposure> PrepareDrugExposures(IEnumerable<DrugExposure> drugExposures)
        {
            var ndcDrugs = new Dictionary<Guid, List<DrugExposure>>();
            foreach (var de in drugExposures)
            {
                if (de.TypeConceptId == 44787730 ||
                    de.TypeConceptId == 43542358 ||
                    de.TypeConceptId == 38000177 ||
                    de.TypeConceptId == 38000180)
                {
                    if (!ndcDrugs.ContainsKey(de.SourceRecordGuid))
                        ndcDrugs.Add(de.SourceRecordGuid, new List<DrugExposure>());

                    ndcDrugs[de.SourceRecordGuid].Add(de);
                    continue;
                }

                yield return de;

            }

            foreach (var similarDrugs in ndcDrugs.SelectMany(drugs => drugs.Value.GroupBy(d => d.SourceValue)))
            {
                var drugs = similarDrugs.Where(d => d.ConceptId > 0).ToArray();
                if (drugs.Length > 0)
                {
                    yield return drugs.OrderBy(d => d.ConceptIdKey.Length).Last();
                    continue;
                }

                var drugs1 = similarDrugs.Where(d => d.SourceConceptId > 0)
                    .ToArray();
                if (drugs1.Length > 0)
                {
                    yield return drugs1.OrderBy(d => d.ConceptIdKey.Length)
                        .Last();
                    continue;
                }

                yield return similarDrugs.OrderBy(d => d.ConceptIdKey.Length).Last();
            }
        }

        public void UpdateVisitOccurrenceId(IEntity entity,
            Dictionary<long, VisitOccurrence> visitOccurrences, Dictionary<long, VisitDetail> visitDetails)
        {
            if (entity.VisitOccurrenceId.HasValue && visitDetails.ContainsKey(entity.VisitOccurrenceId.Value))
            {
                entity.VisitDetailId = entity.VisitOccurrenceId;
            }

            if (entity.VisitOccurrenceId.HasValue && !visitOccurrences.ContainsKey(entity.VisitOccurrenceId.Value) &&
                visitDetails.ContainsKey(entity.VisitOccurrenceId.Value) &&
                visitDetails[entity.VisitOccurrenceId.Value].VisitOccurrenceId.HasValue &&
                visitDetails[entity.VisitOccurrenceId.Value].VisitOccurrenceId.Value > 0)
            {
                entity.VisitOccurrenceId = visitDetails[entity.VisitOccurrenceId.Value].VisitOccurrenceId;
            }
        }


        public override IEnumerable<DrugExposure> BuildDrugExposures(DrugExposure[] drugExposures,
            Dictionary<long, VisitOccurrence> visitOccurrences,
            ObservationPeriod[] observationPeriods)

        {
            foreach (var drugExposure in base.BuildDrugExposures(PrepareDrugExposures(drugExposures).ToArray(), visitOccurrences, observationPeriods))
            {
                if (!drugExposure.Quantity.HasValue && drugExposure.AdditionalFields != null)
                {
                    int? quantity = null;
                    if (drugExposure.AdditionalFields.ContainsKey("quantity_per_fill") &&
                        !string.IsNullOrEmpty(drugExposure.AdditionalFields["quantity_per_fill"]))
                    {
                        var q = drugExposure.AdditionalFields["quantity_per_fill"].Split(' ')[0];
                        if (int.TryParse(q, out var qValue))
                        {
                            quantity = qValue;
                        }
                    }

                    if (quantity == null && drugExposure.AdditionalFields.ContainsKey("quantity_of_dose") &&
                        !string.IsNullOrEmpty(drugExposure.AdditionalFields["quantity_of_dose"]))
                    {
                        var q = drugExposure.AdditionalFields["quantity_of_dose"].Split(' ')[0];
                        if (int.TryParse(q, out var qValue))
                        {
                            quantity = qValue;
                        }
                    }

                    drugExposure.Quantity = quantity;

                }

                yield return drugExposure;
            }
        }

        public override Death BuildDeath(Death[] death, Dictionary<long, VisitOccurrence> visitOccurrences,
            ObservationPeriod[] observationPeriods)
        {
            foreach (var d in death)
            {
                d.StartDate = d.StartDate.AddMonths(1).AddDays(-1);
            }

            return base.BuildDeath(death, visitOccurrences, observationPeriods);
        }

        public override IEnumerable<ObservationPeriod> BuildObservationPeriods(int gap, EraEntity[] observationPeriods)
        {
            foreach (var op in observationPeriods)
            {
                op.EndDate = op.EndDate.Value.AddMonths(1).AddDays(-1);
            }

            return base.BuildObservationPeriods(gap, observationPeriods);
        }

        public override IEnumerable<Observation> BuildObservations(Observation[] observations,
            Dictionary<long, VisitOccurrence> visitOccurrences,
            ObservationPeriod[] observationPeriods)
        {
            foreach (var observation in base.BuildObservations(observations, visitOccurrences, observationPeriods))
            {
                if (observation.AdditionalFields != null && observation.AdditionalFields.ContainsKey("test_result"))
                {
                    if (decimal.TryParse(observation.AdditionalFields["test_result"], out var value))
                        observation.ValueAsNumber = value;
                    else
                        observation.ValueAsString = observation.AdditionalFields["test_result"];
                }

                yield return observation;
            }
        }

        public override IEnumerable<Measurement> BuildMeasurement(Measurement[] measurements,
            Dictionary<long, VisitOccurrence> visitOccurrences,
            ObservationPeriod[] observationPeriods)
        {
            foreach (var measurement in base.BuildMeasurement(measurements, visitOccurrences, observationPeriods))
            {
                if (measurement.AdditionalFields != null && measurement.AdditionalFields.ContainsKey("test_result"))
                {
                    if (decimal.TryParse(measurement.AdditionalFields["test_result"], out var value))
                        measurement.ValueAsNumber = value;
                }

                if (measurement.AdditionalFields != null && measurement.AdditionalFields.ContainsKey("normal_range"))
                {
                    var range = measurement.AdditionalFields["normal_range"];

                    if (!string.IsNullOrEmpty(range) && range.Contains('-'))
                    {
                        var lowValue = range.Split('-')[0];
                        var highValue = range.Split('-')[1];

                        if (decimal.TryParse(lowValue, out var low))
                            measurement.RangeLow = low;

                        if (decimal.TryParse(highValue, out var high))
                            measurement.RangeHigh = high;
                    }
                }

                if (measurement.TypeConceptId == 0)
                    measurement.TypeConceptId = 44818701;

                yield return measurement;
            }
        }

        private static Death CleanUpDeath(IEnumerable<IEntity> items, Death death)
        {
            if (death == null) return null;

            return items.Any(item => item.StartDate > death.StartDate.AddDays(30)) ? null : death;
        }

        protected void SetProviderIds<T>(IEnumerable<T> inputRecords, Dictionary<long, VisitOccurrence> visits)
            where T : class, IEntity
        {
            var records = inputRecords as T[] ?? inputRecords.ToArray();
            if (inputRecords == null || !records.Any()) return;

            if (visits.Count > 0)
            {
                foreach (var e in records.Where(e => !e.ProviderId.HasValue))
                {
                    if (!e.VisitOccurrenceId.HasValue) continue;

                    if (visits.ContainsKey(e.VisitOccurrenceId.Value))
                        e.ProviderId = visits[e.VisitOccurrenceId.Value].ProviderId;
                }
            }
        }

        private long? GetVisitOccurrenceId(IEntity e)
        {
            var encid = string.Empty;
            if (e.AdditionalFields != null && e.AdditionalFields.ContainsKey("encid") && !string.IsNullOrEmpty(e.AdditionalFields["encid"]))
            {
                encid = e.AdditionalFields["encid"];
                if (!_visitIds.ContainsKey(encid))
                    _visitIds.Add(encid, Offset.GetKeyOffset(e.PersonId).VisitOccurrenceId);

                return _visitIds[encid];
            }

            return null;
        }

        private long GetVisitDetailId(IEntity e)
        {
            var encid = string.Empty;
            if (e.AdditionalFields != null && e.AdditionalFields.ContainsKey("encid") && !string.IsNullOrEmpty(e.AdditionalFields["encid"]))
            {
                encid = e.AdditionalFields["encid"];
                if (!_visitDetailIds.ContainsKey(encid))
                    _visitDetailIds.Add(encid, Offset.GetKeyOffset(e.PersonId).VisitDetailId);

                return _visitDetailIds[encid];
            }

            return Offset.GetKeyOffset(e.PersonId).VisitDetailId;
        }

        public override IEnumerable<VisitDetail> BuildVisitDetails(VisitDetail[] visitDetails, VisitOccurrence[] visitOccurrences, ObservationPeriod[] observationPeriods)
        {
            List<VisitDetail> details = new List<VisitDetail>();
            foreach (var visitOccurrence in visitOccurrences)
            {

                var visitDetail =
                    new VisitDetail(visitOccurrence)
                    {
                        Id = GetVisitDetailId(visitOccurrence),
                        DischargeToConceptId = visitOccurrence.DischargeToConceptId,
                        DischargeToSourceValue = visitOccurrence.DischargeToSourceValue
                    };

                details.Add(visitDetail);
            }

            foreach (var visitDetail in Clean(details, observationPeriods, true).Distinct())
            {
                //_visitDetails.Add(visitDetail.SourceRecordGuid, visitDetail);

                if (!visitDetail.EndDate.HasValue)
                    visitDetail.EndDate = visitDetail.StartDate;

                yield return visitDetail;
            }
        }

        //private VisitOccurrence GetVisitOccurrence(IEntity ent)
        //{
        //    if (_rawVisits.ContainsKey(ent.SourceRecordGuid))
        //    {
        //        var vo = _rawVisits[ent.SourceRecordGuid];
        //        if (vo.Id == 0 && _rawVisits.ContainsKey(vo.SourceRecordGuid) &&
        //            _rawVisits[vo.SourceRecordGuid].SourceRecordGuid != ent.SourceRecordGuid)
        //        {
        //            vo = _rawVisits[vo.SourceRecordGuid];
        //        }

        //        return vo;
        //    }

        //    return null;
        //}

        private void AddRawVisitOccurrence(VisitOccurrence rawVisit, VisitOccurrence finalVisit)
        {
            if (!_rawVisits.ContainsKey(rawVisit.SourceRecordGuid))
                _rawVisits.Add(rawVisit.SourceRecordGuid, finalVisit);
            else
                _rawVisits[rawVisit.SourceRecordGuid] = finalVisit;
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

        public override IEnumerable<VisitOccurrence> BuildVisitOccurrences(VisitOccurrence[] rawVisitOccurrences,
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
            foreach (var erGroup in erVisitsRaw.GroupBy(v => v.StartDate.Date))
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
            foreach (var byStart in remaining.GroupBy(v => v.StartDate.Date))
            {
                foreach (var byEnd in byStart.GroupBy(v => v.EndDate.Value.Date))
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


        public override Attrition Build(ChunkData data, KeyMasterOffsetManager om)
        {
            this.Offset = om;
            this.ChunkData = data;

            var result = BuildPerson(PersonRecords.ToList());
            var person = result.Key;
            if (person == null)
                return result.Value;

            var observationPeriods =
                BuildObservationPeriods(person.ObservationPeriodGap, ObservationPeriodsRaw.ToArray()).ToArray();

            var payerPlanPeriods = BuildPayerPlanPeriods(PayerPlanPeriodsRaw.ToArray(), null).ToArray();
            var dedupVisits = VisitOccurrencesRaw.Where(v => v.AdditionalFields["sort_index"] == "1").ToArray();
            var vDetails = BuildVisitDetails(null, dedupVisits, observationPeriods).ToArray();

            var visitOccurrences = new Dictionary<long, VisitOccurrence>();
            var visitIds = new List<long>();
            foreach (var visitOccurrence in BuildVisitOccurrences(dedupVisits, observationPeriods))
            {
                visitOccurrence.Id = Offset.GetKeyOffset(visitOccurrence.PersonId).VisitOccurrenceId;
                visitOccurrence.TypeConceptId = 44818517;
                if (!visitOccurrence.EndDate.HasValue)
                    visitOccurrence.EndDate = visitOccurrence.StartDate;

                if (!_rawVisits.ContainsKey(visitOccurrence.SourceRecordGuid))
                    _rawVisits.Add(visitOccurrence.SourceRecordGuid, visitOccurrence);

                visitOccurrences.Add(visitOccurrence.Id, visitOccurrence);
                visitIds.Add(visitOccurrence.Id);
            }

            var visitDetails = new Dictionary<long, VisitDetail>();
            foreach (var group in vDetails.GroupBy(d => d.Id))
            {
                var vd = group.First();
                var visitOccurrenceId = GetVisitOccurrenceId(vd);
                if (visitOccurrenceId.HasValue && visitOccurrences.ContainsKey(visitOccurrenceId.Value))
                {
                    vd.VisitOccurrenceId = visitOccurrenceId;
                }
                else
                {
                    var visits = visitOccurrences.Values
                        .Where(vo => vd.StartDate.Date >= vo.StartDate.Date
                        && vd.EndDate.Value.Date <= vo.EndDate.Value.Date).ToArray();

                    if (visits.Any())
                        vd.VisitOccurrenceId = visits.First().Id;
                }

                visitDetails.Add(vd.Id, vd);
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

            var notes = BuildNote(NoteRecords.ToArray(), visitOccurrences, observationPeriods).ToArray();

            List<DateTime?> mins = new List<DateTime?>();
            List<DateTime?> maxs = new List<DateTime?>();

            mins.Add(GetMinDate(drugExposures));
            mins.Add(GetMinDate(conditionOccurrences));
            mins.Add(GetMinDate(procedureOccurrences));
            mins.Add(GetMinDate(observations));
            mins.Add(GetMinDate(deviceExposure));
            mins.Add(GetMinDate(measurements));
            mins.Add(GetMinDate(visitOccurrences.Values));
            mins.Add(GetMinDate(visitDetails.Values));

            maxs.Add(GetMaxDate(drugExposures));
            maxs.Add(GetMaxDate(conditionOccurrences));
            maxs.Add(GetMaxDate(procedureOccurrences));
            maxs.Add(GetMaxDate(observations));
            maxs.Add(GetMaxDate(deviceExposure));
            maxs.Add(GetMaxDate(measurements));
            maxs.Add(GetMaxDate(visitOccurrences.Values));
            maxs.Add(GetMaxDate(visitDetails.Values));

            var min = mins.Min();
            var max = maxs.Max();

            var observationPeriodsFinal = new List<ObservationPeriod>(1)
            {
                observationPeriods[0]
            };

            if (min.HasValue)
            {
                observationPeriodsFinal[0].StartDate = min.Value;

                if (max.HasValue)
                    observationPeriodsFinal[0].EndDate = max;
                else
                    observationPeriodsFinal[0].EndDate = min.Value;
            }

            // Delete any individual that has an OBSERVATION_PERIOD that is >= 2 years prior to the YEAR_OF_BIRTH
            if (Excluded(person, observationPeriodsFinal))
            {
                return Attrition.ImplausibleYOBPostEarliestOP;
            }

            // set corresponding ProviderIds
            SetProviderIds(drugExposures);
            SetProviderIds(conditionOccurrences);
            SetProviderIds(procedureOccurrences);
            SetProviderIds(observations);
            SetProviderIds(deviceExposure);
            SetProviderIds(measurements);
            SetProviderIds(visitOccurrences.Values);
            SetProviderIds(visitDetails.Values);

            SetVisitOccurrenceId(conditionOccurrences, visitDetails.Values.ToArray());
            SetVisitOccurrenceId(procedureOccurrences, visitDetails.Values.ToArray());
            SetVisitOccurrenceId(drugExposures, visitDetails.Values.ToArray());
            SetVisitOccurrenceId(deviceExposure, visitDetails.Values.ToArray());
            SetVisitOccurrenceId(observations, visitDetails.Values.ToArray());
            SetVisitOccurrenceId(measurements, visitDetails.Values.ToArray());
            //SetVisitOccurrenceId(visitDetails.Values, visitOccurrences.Values.ToArray());

            SetProviderIds(drugExposures, visitOccurrences);
            SetProviderIds(conditionOccurrences, visitOccurrences);
            SetProviderIds(measurements, visitOccurrences);
            SetProviderIds(procedureOccurrences, visitOccurrences);
            SetProviderIds(deviceExposure, visitOccurrences);
            SetProviderIds(observations, visitOccurrences);

            //SetProviderIds(notes, visitOccurrences); TMP: NOTE 
            if (notes.Any())
            {
                if (visitOccurrences.Count > 0)
                {
                    foreach (var e in notes.Where(e => !e.ProviderId.HasValue))
                    {
                        if (e.AdditionalFields != null && e.AdditionalFields.ContainsKey("encid") && !string.IsNullOrEmpty(e.AdditionalFields["encid"]))
                        {
                            var encid = e.AdditionalFields["encid"];

                            var vd = visitDetails.Values.FirstOrDefault(v => v.AdditionalFields["encid"] == encid);
                            if (vd == null) continue;

                            e.VisitDetailId = vd.Id;
                            e.VisitOccurrenceId = vd.VisitOccurrenceId;
                        }

                        if (!e.VisitOccurrenceId.HasValue) continue;

                        if (visitOccurrences.ContainsKey(e.VisitOccurrenceId.Value))
                            e.ProviderId = visitOccurrences[e.VisitOccurrenceId.Value].ProviderId;
                    }
                }
            }

            var death = BuildDeath(DeathRecords.ToArray(), visitOccurrences, observationPeriodsFinal.ToArray());
            var drugCosts = BuildDrugCosts(drugExposures).ToArray();
            var procedureCosts = BuildProcedureCosts(procedureOccurrences).ToArray();
            var visitCosts = BuildVisitCosts(visitOccurrences.Values.ToArray()).ToArray();
            var devicCosts = BuildDeviceCosts(deviceExposure).ToArray();

            var cohort = BuildCohort(CohortRecords.ToArray(), observationPeriodsFinal.ToArray()).ToArray();


            if (death != null)
            {
                death = CleanUpDeath(visitDetails.Values, death);
                death = CleanUpDeath(visitOccurrences.Values, death);
                death = CleanUpDeath(drugExposures, death);
                death = CleanUpDeath(conditionOccurrences, death);
                death = CleanUpDeath(procedureOccurrences, death);
                death = CleanUpDeath(measurements, death);
                death = CleanUpDeath(observations, death);
                death = CleanUpDeath(deviceExposure, death);
            }



            // push built entities to ChunkBuilder for further save to CDM database
            AddToChunk(person, death, observationPeriodsFinal.ToArray(), payerPlanPeriods, drugExposures,
                conditionOccurrences, procedureOccurrences, observations, measurements,
                visitOccurrences.Values.ToArray(), visitDetails.Values.ToArray(), cohort, deviceExposure, notes);

            var pg = new PregnancyAlgorithm();
            foreach (var r in pg.GetPregnancyEpisodes(Vocabulary, person, observationPeriodsFinal.ToArray(),
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

        protected DateTime? GetMinDate<T>(IEnumerable<T> inputRecords) where T : class, IEntity
        {
            if (inputRecords == null || inputRecords.Count() == 0)
                return null;

            return inputRecords.Min(e => e.StartDate);
        }

        protected DateTime? GetMaxDate<T>(IEnumerable<T> inputRecords) where T : class, IEntity
        {
            if (inputRecords == null || inputRecords.Count() == 0)
                return null;

            if (inputRecords.Any(e => e.EndDate.HasValue))
                return inputRecords.Where(e => e.EndDate.HasValue).Max(e => e.EndDate.Value);

            return null;
        }

        protected void SetVisitOccurrenceId<T>(IEnumerable<T> inputRecords, VisitDetail[] visitDetail)
      where T : class, IEntity
        {
            foreach (var e in inputRecords)
            {
                if (e.AdditionalFields != null && e.AdditionalFields.ContainsKey("encid") && !string.IsNullOrEmpty(e.AdditionalFields["encid"]))
                {
                    var encid = e.AdditionalFields["encid"];

                    var vd = visitDetail.FirstOrDefault(v => v.AdditionalFields["encid"] == encid);
                    if (vd == null) continue;

                    e.VisitDetailId = vd.Id;
                    e.VisitOccurrenceId = vd.VisitOccurrenceId;
                }
            }
        }

        private void UpdateVisitOccurrenceIds(Dictionary<long, VisitOccurrence> visitOccurrences, Dictionary<long, VisitDetail> visitDetails)
        {
            foreach (var e in DrugExposuresRaw)
            {
                UpdateVisitOccurrenceId(e, visitOccurrences, visitDetails);
            }

            foreach (var e in ConditionOccurrencesRaw)
            {
                UpdateVisitOccurrenceId(e, visitOccurrences, visitDetails);
            }

            foreach (var e in ProcedureOccurrencesRaw)
            {
                UpdateVisitOccurrenceId(e, visitOccurrences, visitDetails);
            }

            foreach (var e in ObservationsRaw)
            {
                UpdateVisitOccurrenceId(e, visitOccurrences, visitDetails);
            }

            foreach (var e in MeasurementsRaw)
            {
                UpdateVisitOccurrenceId(e, visitOccurrences, visitDetails);
            }

            foreach (var e in DeviceExposureRaw)
            {
                UpdateVisitOccurrenceId(e, visitOccurrences, visitDetails);
            }

            foreach (var e in NoteRecords)
            {
                if (e.VisitOccurrenceId.HasValue && visitDetails.ContainsKey(e.VisitOccurrenceId.Value))
                {
                    e.VisitDetailId = e.VisitOccurrenceId;
                }

                if (e.VisitOccurrenceId.HasValue && !visitOccurrences.ContainsKey(e.VisitOccurrenceId.Value) &&
                    visitDetails.ContainsKey(e.VisitOccurrenceId.Value) &&
                    visitDetails[e.VisitOccurrenceId.Value].VisitOccurrenceId.HasValue &&
                    visitDetails[e.VisitOccurrenceId.Value].VisitOccurrenceId.Value > 0)
                {
                    e.VisitOccurrenceId = visitDetails[e.VisitOccurrenceId.Value].VisitOccurrenceId;
                }
                //TMP: NOTE
                //UpdateVisitOccurrenceId(e, visitOccurrences, visitDetails);
            }
        }


        public override void AddToChunk(string domain, IEnumerable<IEntity> entities)
        {
            foreach (var entity in entities)
            {
                var entityDomain = GetDomain(domain, entity.Domain);

                switch (entityDomain)
                {
                    case "Condition":
                        var obs = entity as Observation;
                        if (obs == null || obs.ValueAsNumber == 1)
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
                        var mes = entity as Measurement ??
                                  new Measurement(entity) { Id = Offset.GetKeyOffset(entity.PersonId).MeasurementId };

                        if (entity.AdditionalFields != null && entity.AdditionalFields.ContainsKey("test_result"))
                        {
                            mes.ValueSourceValue = entity.AdditionalFields["test_result"];
                        }

                        // HIX-1363
                        //if rslt_nbr is non-zero, take it for both fields, otherwise, 
                        //use NULL for value_as_number and take rslt_txt for value_as_string.
                        if (mes.ValueAsNumber != null && mes.ValueAsNumber != 0)
                        {
                            mes.ValueSourceValue = mes.ValueAsNumber.ToString();
                        }

                        if (mes.TypeConceptId != 44786627 && mes.TypeConceptId != 44786629)
                            mes.TypeConceptId = 45754907;

                        ChunkData.AddData(mes);
                        break;

                    case "Meas Value":
                        var m = entity as Measurement ??
                                new Measurement(entity) { Id = Offset.GetKeyOffset(entity.PersonId).MeasurementId };

                        if (entity.AdditionalFields != null && entity.AdditionalFields.ContainsKey("test_result"))
                        {
                            m.ValueSourceValue = entity.AdditionalFields["test_result"];
                        }

                        if (m.TypeConceptId != 44786627 && m.TypeConceptId != 44786629)
                            m.TypeConceptId = 45754907;

                        m.TypeConceptId = 45754907;
                        ChunkData.AddData(m);
                        break;

                    case "Observation":
                        var o = entity as Observation ??
                            new Observation(entity)
                            {
                                Id = Offset.GetKeyOffset(entity.PersonId).ObservationId
                            };
                        ChunkData.AddData(o);
                        break;

                    case "Procedure":
                        var proc = entity as ProcedureOccurrence ??
                                   new ProcedureOccurrence(entity)
                                   {
                                       Id =
                                           Offset.GetKeyOffset(entity.PersonId).ProcedureOccurrenceId
                                   };


                        if (proc.TypeConceptId == 0)
                            proc.TypeConceptId = 38000275;
                        else if (proc.TypeConceptId == 44786627 || proc.TypeConceptId == 44786629)
                            proc.TypeConceptId = 42865906;

                        ChunkData.AddData(proc);
                        break;

                    case "Device":
                        var dev = entity as DeviceExposure ??
                                  new DeviceExposure(entity)
                                  {
                                      Id = Offset.GetKeyOffset(entity.PersonId).DeviceExposureId
                                  };

                        ChunkData.AddData(dev);
                        break;

                    case "Drug":
                        var drg = entity as DrugExposure ??
                                  new DrugExposure(entity)
                                  {
                                      Id = Offset.GetKeyOffset(entity.PersonId).DrugExposureId
                                  };

                        if (drg.TypeConceptId == 0)
                            drg.TypeConceptId = 38000275;

                        if (!drg.EndDate.HasValue)
                        {
                            drg.EndDate = drg.StartDate;
                        }

                        DrugForEra.Add(drg);
                        ChunkData.AddData(drg);
                        break;

                }

                //HIX-823
                if (domain == "Procedure" && entityDomain != "Procedure")
                {
                    var po = (ProcedureOccurrence)entity;
                    po.ConceptId = 0;
                    ChunkData.AddData(po);
                }

                if (domain == "Observation" && entityDomain != "Observation")
                {
                    var o = (Observation)entity;
                    o.ConceptId = 0;
                    ChunkData.AddData(o);
                }

            }
        }
    }
}
