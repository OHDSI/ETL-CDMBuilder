using org.ohdsi.cdm.framework.common.Base;
using org.ohdsi.cdm.framework.common.Builder;
using org.ohdsi.cdm.framework.common.Extensions;
using org.ohdsi.cdm.framework.common.Omop;
using org.ohdsi.cdm.framework.common.PregnancyAlgorithm;
using System;
using System.Collections.Generic;
using System.Linq;

namespace org.ohdsi.cdm.framework.etl.optumextended
{
    /// <summary>
    ///  Implementation of PersonBuilder for Optum, based on CDM Build spec
    /// </summary>
    public class OptumExtendedPersonBuilder : PersonBuilder
    {
        private readonly Dictionary<Guid, VisitOccurrence> _rawVisits = new Dictionary<Guid, VisitOccurrence>();

        private readonly Dictionary<string, Dictionary<string, Dictionary<string, List<VisitDetail>>>> _rawVisitDetails =
            new Dictionary<string, Dictionary<string, Dictionary<string, List<VisitDetail>>>>();

        private readonly Dictionary<long, HashSet<DateTime>> _potentialChilds = new Dictionary<long, HashSet<DateTime>>();

        public override string GetFolder()
        {
            return "ETL\\OPTUMEXTENDED";
        }

        public override Death BuildDeath(Death[] deathRaw, Dictionary<long, VisitOccurrence> visitOccurrences,
            ObservationPeriod[] observationPeriods)
        {
            var death = FilterDeathRecords(deathRaw).ToList();

            if (death.Any())
            {
                var dodDeath = death.FirstOrDefault(d => d.TypeConceptId == 32519);
                if (dodDeath != null)
                {
                    var endOfMonth = new DateTime(dodDeath.StartDate.Year,
                        dodDeath.StartDate.Month,
                        DateTime.DaysInMonth(dodDeath.StartDate.Year,
                            dodDeath.StartDate.Month));

                    dodDeath.StartDate = endOfMonth;

                    return dodDeath;
                }

                var maxStartDate = death.Max(d => d.StartDate);
                var result = death.Where(d => d.StartDate == maxStartDate).OrderByDescending(d => d.Primary).First();

                result.CauseConceptId = 0;

                return result;
            }

            return null;
        }

        private IEnumerable<Death> FilterDeathRecords(IEnumerable<Death> death)
        {
            foreach (var d in death)
            {
                if (d.TypeConceptId == 32519)
                {
                    yield return d;
                    continue;
                }

                var visitOccurrence = GetVisitOccurrence(d);
                if (visitOccurrence == null)
                {
                    continue;
                }

                d.StartDate = visitOccurrence.EndDate.Value;

                yield return d;
            }
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


        public override IEnumerable<VisitDetail> BuildVisitDetails(VisitDetail[] visitDetails,
            VisitOccurrence[] visitOccurrences, ObservationPeriod[] observationPeriods)
        {
            var mcVisits = new Dictionary<long, VisitDetail>();
            var inConfVisits = new Dictionary<string, long>();
            foreach (var visitOccurrence in visitOccurrences)
            {
                var visitDetail =
                    new VisitDetail(visitOccurrence)
                    {
                        Id = Offset.GetKeyOffset(visitOccurrence.PersonId).VisitDetailId,
                        DischargeToConceptId = visitOccurrence.DischargeToConceptId,
                        DischargeToSourceValue = visitOccurrence.DischargeToSourceValue
                    };

                if (!visitDetail.EndDate.HasValue)
                    visitDetail.EndDate = visitDetail.StartDate;

                if (visitDetail.StartDate > visitDetail.EndDate.Value)
                    visitDetail.EndDate = visitDetail.StartDate;

                //medical_claims
                if (visitDetail.AdditionalFields.ContainsKey("paid_status"))
                    mcVisits.Add(visitDetail.Id, visitDetail);
                else if (visitDetail.TypeConceptId == 32023)
                {
                    visitDetail.VisitDetailParentId = visitDetail.Id;

                    if (!inConfVisits.ContainsKey(visitDetail.SourceValue))
                        inConfVisits.Add(visitDetail.SourceValue, visitDetail.Id);

                    yield return visitDetail;
                }
                else
                    yield return visitDetail;
            }

            foreach (var patplanidGroup in mcVisits.Values.GroupBy(v => v.AdditionalFields["pat_planid"]))
            {
                foreach (var clmidGroup in patplanidGroup.GroupBy(v => v.AdditionalFields["clmid"]))
                {
                    foreach (var clmseqGroup in clmidGroup.GroupBy(v => v.AdditionalFields["clmseq"]))
                    {
                        long? prevVisitId = null;
                        foreach (var vd in clmseqGroup.OrderBy(v => v.AdditionalFields["paid_status"]))
                        {
                            if (prevVisitId.HasValue)
                            {
                                mcVisits[vd.Id].PrecedingVisitDetailId = prevVisitId;
                            }

                            prevVisitId = vd.Id;
                        }
                    }
                }
            }

            foreach (var visitDetail in mcVisits.Values)
            {
                var confId = visitDetail.AdditionalFields["conf_id"];
                if (inConfVisits.ContainsKey(confId))
                    visitDetail.VisitDetailParentId = inConfVisits[confId];

                yield return visitDetail;
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

        //private VisitOccurrence GetVisitOccurrence(IEntity ent)
        //{
        //    VisitOccurrence vo = null;
        //    if (_rawVisits.ContainsKey(ent.SourceRecordGuid))
        //    {
        //        vo = _rawVisits[ent.SourceRecordGuid];

        //        if (vo.ConceptId == -1)
        //            vo = null;

        //    }

        //    return vo;
        //}

        private void SetVisitDetailId(IEnumerable<IEntity> entities)
        {
            foreach (var e in entities)
            {
                if (e.AdditionalFields == null || !e.AdditionalFields.ContainsKey("pat_planid"))
                    continue;

                var patPlanid = e.AdditionalFields["pat_planid"];
                var clmid = string.Empty;
                var locCd = string.Empty;

                if (e.AdditionalFields.ContainsKey("clmid"))
                    clmid = e.AdditionalFields["clmid"];

                if (e.AdditionalFields.ContainsKey("loc_cd"))
                    locCd = e.AdditionalFields["loc_cd"];

                if (_rawVisitDetails.ContainsKey(patPlanid) && _rawVisitDetails[patPlanid].ContainsKey(clmid))
                {
                    VisitDetail vd = null;
                    if (locCd != string.Empty && _rawVisitDetails[patPlanid][clmid].ContainsKey(locCd))
                    {
                        vd = _rawVisitDetails[patPlanid][clmid][locCd]
                            .FirstOrDefault(v => v.SourceRecordGuid == e.SourceRecordGuid);

                        if (vd == null)
                        {
                            vd = _rawVisitDetails[patPlanid][clmid][locCd]
                                .FirstOrDefault(v => v.StartDate == e.StartDate);
                        }

                        if (vd == null)
                        {
                            vd = _rawVisitDetails[patPlanid][clmid][locCd]
                                .FirstOrDefault(v => e.StartDate.Between(v.StartDate, v.EndDate.Value));
                        }
                    }
                    else if (locCd == string.Empty)
                    {
                        VisitDetail vdByDate = null;
                        VisitDetail vdByDate2 = null;
                        foreach (var items in _rawVisitDetails[patPlanid][clmid].Values)
                        {
                            vd = items.FirstOrDefault(v => v.SourceRecordGuid == e.SourceRecordGuid);

                            if (vd == null && vdByDate == null)
                                vdByDate = items.FirstOrDefault(v => v.StartDate == e.StartDate);

                            if (vd == null && vdByDate == null && vdByDate2 == null)
                                vdByDate2 = items.FirstOrDefault(v => e.StartDate.Between(v.StartDate, v.EndDate.Value));

                            if (vd != null)
                                break;
                        }

                        if (vd == null && vdByDate != null)
                            vd = vdByDate;

                        if (vd == null && vdByDate2 != null)
                            vd = vdByDate2;
                    }

                    if (vd != null && vd.ConceptId >= 0)
                    {
                        e.VisitDetailId = vd.Id;
                        e.ProviderId = vd.ProviderId;
                        e.StartDate = vd.StartDate;
                        e.EndDate = vd.EndDate;

                        e.VisitOccurrenceId = vd.VisitOccurrenceId;
                    }
                }
            }
        }

        private static IEnumerable<DrugExposure> FilteroutDrugClaims(IEnumerable<DrugExposure> rawDrugs)
        {
            var drugClaims = new Dictionary<Guid, List<DrugExposure>>();
            foreach (var de in rawDrugs)
            {
                if (!drugClaims.ContainsKey(de.SourceRecordGuid))
                    drugClaims.Add(de.SourceRecordGuid, new List<DrugExposure>());

                drugClaims[de.SourceRecordGuid].Add(de);
            }

            foreach (var similarDrugs in drugClaims.SelectMany(drugs => drugs.Value.GroupBy(d => d.SourceValue)))
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

        public override Attrition Build(ChunkData data, KeyMasterOffsetManager o)
        {
            this.Offset = o;
            this.ChunkData = data;

            var result = BuildPerson(PersonRecords.ToList());
            var person = result.Key;
            if (person == null)
                return result.Value;

            if (person.YearOfBirth > DateTime.Now.Year)
            {
                return Attrition.ImplausibleYOBFuture;
            }

            var op = ObservationPeriodsRaw.Where(op =>
                    op.StartDate.Year >= person.YearOfBirth &&
                    op.EndDate.Value.Year >= person.YearOfBirth &&
                    op.StartDate.Year <= DateTime.Now.Year).ToArray();

            if (op.Length == 0)
                return Attrition.InvalidObservationTime;

            var observationPeriods =
                BuildObservationPeriods(person.ObservationPeriodGap, op).ToArray();

            if (Excluded(person, observationPeriods))
            {
                return Attrition.ImplausibleYOBPostEarliestOP;
            }

            var fisrtOP = observationPeriods.Min(op => op.StartDate);
            if (fisrtOP.Year == person.YearOfBirth)
            {
                person.MonthOfBirth = fisrtOP.Month;
                person.DayOfBirth = fisrtOP.Day;
            }
            else
            {
                person.MonthOfBirth = null;
                person.DayOfBirth = null;
            }

            var payerPlanPeriods = BuildPayerPlanPeriods(PayerPlanPeriodsRaw.Where(pp =>
                    pp.StartDate.Year >= person.YearOfBirth &&
                    pp.EndDate.Value.Year >= person.YearOfBirth &&
                    pp.StartDate.Year <= DateTime.Now.Year).ToArray(), null).ToArray();

            List<VisitDetail> visitDetails = new List<VisitDetail>();
            foreach (var vd in BuildVisitDetails(null, VisitOccurrencesRaw.ToArray(), observationPeriods).Where(vd =>
                    vd.StartDate.Year >= person.YearOfBirth &&
                    vd.EndDate.Value.Year >= person.YearOfBirth &&
                    vd.StartDate.Year <= DateTime.Now.Year))
            {
                if (vd.StartDate.Year < person.YearOfBirth || vd.StartDate.Year > DateTime.Now.Year)
                    continue;

                if (vd.EndDate.HasValue && (
                    vd.EndDate.Value.Year < person.YearOfBirth ||
                    vd.EndDate.Value.Year > DateTime.Now.Year))
                    continue;

                visitDetails.Add(vd);
            }

            var visitOccurrences = new Dictionary<long, VisitOccurrence>();
            var visitIds = new List<long>();
            foreach (var visitOccurrence in BuildVisitOccurrences(VisitOccurrencesRaw.ToArray(), observationPeriods))
            {
                if (visitOccurrence.StartDate.Year < person.YearOfBirth || visitOccurrence.StartDate.Year > DateTime.Now.Year)
                    continue;

                if (visitOccurrence.EndDate.HasValue && (
                    visitOccurrence.EndDate.Value.Year < person.YearOfBirth ||
                    visitOccurrence.EndDate.Value.Year > DateTime.Now.Year))
                    continue;

                //if (visitOccurrence.IdUndefined)
                {
                    visitOccurrence.Id =
                        Offset.GetKeyOffset(visitOccurrence.PersonId).VisitOccurrenceId;
                    visitOccurrence.IdUndefined = false;
                }

                visitOccurrences.Add(visitOccurrence.Id, visitOccurrence);
                visitIds.Add(visitOccurrence.Id);
            }

            foreach (var visitDetail in visitDetails)
            {
                var patPlanid = visitDetail.AdditionalFields["pat_planid"];
                var clmid = string.Empty;
                var locCd = string.Empty;

                if (visitDetail.AdditionalFields.ContainsKey("clmid"))
                    clmid = visitDetail.AdditionalFields["clmid"];

                if (visitDetail.AdditionalFields.ContainsKey("loc_cd"))
                    locCd = visitDetail.AdditionalFields["loc_cd"];

                if (!_rawVisitDetails.ContainsKey(patPlanid))
                    _rawVisitDetails.Add(patPlanid, new Dictionary<string, Dictionary<string, List<VisitDetail>>>());

                if (!_rawVisitDetails[patPlanid].ContainsKey(clmid))
                    _rawVisitDetails[patPlanid].Add(clmid, new Dictionary<string, List<VisitDetail>>());

                if (!_rawVisitDetails[patPlanid][clmid].ContainsKey(locCd))
                    _rawVisitDetails[patPlanid][clmid].Add(locCd, new List<VisitDetail>());

                _rawVisitDetails[patPlanid][clmid][locCd].Add(visitDetail);
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

            var conditionOccurrences =
                BuildConditionOccurrences(ConditionOccurrencesRaw.ToArray(), visitOccurrences, observationPeriods)
                    .ToArray();

            foreach (var co in conditionOccurrences)
            {
                co.Id = Offset.GetKeyOffset(co.PersonId).ConditionOccurrenceId;
            }

            var procedureOccurrences =
                BuildProcedureOccurrences(ProcedureOccurrencesRaw.ToArray(), visitOccurrences, observationPeriods)
                    .ToArray();
            foreach (var procedureOccurrence in procedureOccurrences)
            {
                procedureOccurrence.Id = Offset.GetKeyOffset(procedureOccurrence.PersonId)
                    .ProcedureOccurrenceId;
            }

            var observations = BuildObservations(ObservationsRaw.ToArray(), visitOccurrences, observationPeriods)
                .ToArray();
            var drugExposures = BuildDrugExposures(FilteroutDrugClaims(DrugExposuresRaw).ToArray(), visitOccurrences, observationPeriods)
                .ToArray();
            var measurements = BuildMeasurement(MeasurementsRaw.ToArray(), visitOccurrences, observationPeriods)
                .ToArray();
            var deviceExposure = BuildDeviceExposure(DeviceExposureRaw.ToArray(), visitOccurrences, observationPeriods)
                .ToArray();

            var death = BuildDeath(DeathRecords.ToArray(), visitOccurrences, observationPeriods);

            if (death != null && person.YearOfBirth.HasValue && person.YearOfBirth.Value > 0 &&
                person.YearOfBirth > death.StartDate.Year)
                death = null;

            if (death != null)
            {
                // DOD
                if (death.TypeConceptId == 32519)
                {
                    foreach (var visitOccurrence in visitOccurrences.Values.Where(v => (v.ConceptId == 9202 || v.ConceptId == 581458) && v.StartDate > death.StartDate.AddDays(30)))
                    {
                        visitOccurrence.ConceptId = -1;
                    }

                    if (visitOccurrences.Values.Any(v => (v.ConceptId == 9201 || v.ConceptId == 9203) && v.StartDate > death.StartDate.AddDays(30)))
                    {
                        death = null;
                    }
                }

                if (death != null)
                {
                    if (death.StartDate.Year < person.YearOfBirth || death.StartDate.Year > DateTime.Now.Year)
                        death = null;

                    foreach (var payerPlanPeriod in payerPlanPeriods)
                    {
                        if (payerPlanPeriod.EndDate.Value == death.StartDate)
                            payerPlanPeriod.StopReasonConceptId = 352;
                    }
                }
            }

            foreach (var visitDetail in visitDetails)
            {
                var vo = GetVisitOccurrence(visitDetail);

                if (vo != null && visitOccurrences.ContainsKey(vo.Id))
                {
                    if (visitOccurrences[vo.Id].ConceptId == -1)
                    {
                        visitDetail.ConceptId = -1;
                    }
                    else
                        visitDetail.VisitOccurrenceId = vo.Id;
                }
                else
                {
                    visitDetail.ConceptId = -1;
                }
            }

            SetVisitDetailId(drugExposures);
            SetVisitDetailId(conditionOccurrences);
            SetVisitDetailId(procedureOccurrences);
            SetVisitDetailId(measurements);
            SetVisitDetailId(observations);
            SetVisitDetailId(deviceExposure);


            // push built entities to ChunkBuilder for further save to CDM database
            AddToChunk(person,
                death,
                observationPeriods,
                payerPlanPeriods,
                Clean(drugExposures, person).ToArray(),
                Clean(conditionOccurrences, person).ToArray(),
                Clean(procedureOccurrences, person).ToArray(),
                Clean(observations, person).ToArray(),
                Clean(measurements, person).ToArray(),
                visitOccurrences.Values.Where(v => v.ConceptId >= 0).ToArray(),
                visitDetails.Where(v => v.ConceptId >= 0).ToArray(), new Cohort[0],
                Clean(deviceExposure, person).ToArray(),
                new Note[0]);

            var pg = new PregnancyAlgorithm();
            foreach (var episode in pg.GetPregnancyEpisodes(Vocabulary, person, observationPeriods,
                ChunkData.ConditionOccurrences.Where(e => e.PersonId == person.PersonId).ToArray(),
                ChunkData.ProcedureOccurrences.Where(e => e.PersonId == person.PersonId).ToArray(),
                ChunkData.Observations.Where(e => e.PersonId == person.PersonId).ToArray(),
                ChunkData.Measurements.Where(e => e.PersonId == person.PersonId).ToArray(),
                ChunkData.DrugExposures.Where(e => e.PersonId == person.PersonId).ToArray()))
            {
                episode.Id = Offset.GetKeyOffset(episode.PersonId).ConditionEraId;
                ChunkData.ConditionEra.Add(episode);

                if (episode.ConceptId == 433260 && _potentialChilds.Count > 0)
                {
                    foreach (var child in _potentialChilds)
                    {
                        var childId = child.Key;

                        foreach (var birthdate in child.Value)
                        {
                            if (episode.EndDate.Value.Between(birthdate.AddDays(-60), birthdate.AddDays(60)))
                            {
                                //40485452    Child of subject
                                //40478925    Mother of subject

                                ChunkData.FactRelationships.Add(new FactRelationship
                                {
                                    DomainConceptId1 = 56,
                                    DomainConceptId2 = 56,
                                    FactId1 = episode.PersonId,
                                    FactId2 = childId,
                                    RelationshipConceptId = 40478925
                                });

                                break;
                            }
                        }
                    }
                }
            }

            return Attrition.None;
        }
        public IEnumerable<T> Clean<T>(IEnumerable<T> entities, Person person) where T : class, IEntity
        {
            foreach (var e in entities)
            {
                if (e.StartDate.Year < person.YearOfBirth || e.StartDate.Year > DateTime.Now.Year)
                    continue;

                if (e.EndDate.HasValue && (
                    e.EndDate.Value.Year < person.YearOfBirth ||
                    e.EndDate.Value.Year > DateTime.Now.Year))
                    continue;

                yield return e;
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

                        var cond = entity as ConditionOccurrence ??
                                   new ConditionOccurrence(entity)
                                   {
                                       Id = Offset.GetKeyOffset(entity.PersonId).ConditionOccurrenceId
                                   };

                        if (!cond.EndDate.HasValue)
                            cond.EndDate = cond.StartDate;

                        ConditionForEra.Add(cond);
                        ChunkData.AddData(cond);
                        break;

                    case "Measurement":
                        var mes = entity as Measurement ??
                                  new Measurement(entity)
                                  {
                                      Id = Offset.GetKeyOffset(entity.PersonId).MeasurementId
                                  };

                        ChunkData.AddData(mes);

                        break;

                    case "Meas Value":
                        var mv = entity as Measurement ??
                                 new Measurement(entity) { Id = Offset.GetKeyOffset(entity.PersonId).MeasurementId };

                        ChunkData.AddData(mv);
                        break;

                    case "Observation":
                        var o = entity as Observation ??
                                new Observation(entity) { Id = Offset.GetKeyOffset(entity.PersonId).ObservationId };

                        ChunkData.AddData(o);


                        break;

                    case "Procedure":
                        var p = entity as ProcedureOccurrence ??
                                new ProcedureOccurrence(entity)
                                {
                                    Id =
                                        Offset.GetKeyOffset(entity.PersonId).ProcedureOccurrenceId
                                };

                        ChunkData.AddData(p);
                        break;

                    case "Device":
                        var dev = entity as DeviceExposure ??
                                  new DeviceExposure(entity)
                                  {
                                      Id = Offset.GetKeyOffset(entity.PersonId).DeviceExposureId
                                  };

                        if (!dev.EndDate.HasValue)
                            dev.EndDate = dev.StartDate;

                        ChunkData.AddData(dev);
                        break;

                    case "Drug":
                        var drg = entity as DrugExposure ??
                                  new DrugExposure(entity) { Id = Offset.GetKeyOffset(entity.PersonId).DrugExposureId };

                        if (!drg.EndDate.HasValue)
                            drg.EndDate = drg.StartDate;

                        DrugForEra.Add(drg);
                        ChunkData.AddData(drg);
                        break;

                }
            }
        }

        public override KeyValuePair<Person, Attrition> BuildPerson(List<Person> records)
        {
            if (records == null || records.Count == 0)
                return new KeyValuePair<Person, Attrition>(null, Attrition.UnacceptablePatientQuality);

            var ordered = records.OrderByDescending(p => p.StartDate).ThenBy(p => p.EndDate).ToArray();

            foreach (var p in ordered)
            {
                if (p.PotentialChildId.HasValue && p.PotentialChildBirthDate != DateTime.MinValue)
                {
                    if (!_potentialChilds.ContainsKey(p.PotentialChildId.Value))
                    {
                        _potentialChilds.Add(p.PotentialChildId.Value, new HashSet<DateTime>());
                    }

                    _potentialChilds[p.PotentialChildId.Value].Add(p.PotentialChildBirthDate);
                }
            }

            var person = ordered.Take(1).Last();

            if (records.Where(r => r.YearOfBirth.HasValue && r.YearOfBirth > 1900).Max(r => r.YearOfBirth) -
                records.Where(r => r.YearOfBirth.HasValue && r.YearOfBirth > 1900).Min(r => r.YearOfBirth) > 2)
            {
                return new KeyValuePair<Person, Attrition>(null, Attrition.MultipleYearsOfBirth);
            }

            person.LocationId = Entity.GetId(person.LocationSourceValue);

            if (person.GenderConceptId == 8551) //UNKNOWN
            {
                return new KeyValuePair<Person, Attrition>(null, Attrition.UnknownGender);
            }

            if (person.YearOfBirth < 1900) //UNKNOWN
                return new KeyValuePair<Person, Attrition>(null, Attrition.ImplausibleYOBPast);

            if (records.Any(r => r.GenderConceptId != 8551 && r.GenderConceptId != person.GenderConceptId))
            {
                return new KeyValuePair<Person, Attrition>(null, Attrition.GenderChanges); // Gender changed over different enrollment period 
            }

            return new KeyValuePair<Person, Attrition>(person, Attrition.None);
        }

    }
}
