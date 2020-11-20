using org.ohdsi.cdm.framework.common.Base;
using org.ohdsi.cdm.framework.common.Builder;
using org.ohdsi.cdm.framework.common.Extensions;
using org.ohdsi.cdm.framework.common.Omop;
using System;
using System.Collections.Generic;
using System.Linq;

namespace org.ohdsi.cdm.framework.etl.symphonyemr
{
    public class SymphonyEMRPersonBuilder : PersonBuilder
    {
        private readonly Dictionary<Guid, VisitOccurrence> _rawVisits = new Dictionary<Guid, VisitOccurrence>();
        private readonly Dictionary<Guid, VisitDetail> _visitDetails = new Dictionary<Guid, VisitDetail>();
        private readonly Dictionary<long, List<VisitOccurrence>> _visitIdMap = new Dictionary<long, List<VisitOccurrence>>();
        private int? _yob;

        public override string GetFolder()
        {
            return "ETL\\SYMPHONYEMR";
        }

        public override KeyValuePair<Person, Attrition> BuildPerson(List<Person> records)
        {
            if (records == null || records.Count == 0)
                return new KeyValuePair<Person, Attrition>(null, Attrition.UnacceptablePatientQuality);

            if (records.All(p => p.GenderConceptId == 8551))
            {
                return new KeyValuePair<Person, Attrition>(null, Attrition.UnknownGender);
            }

            if (records.All(p => p.YearOfBirth < 1900))
            {
                return new KeyValuePair<Person, Attrition>(null, Attrition.ImplausibleYOBPast);
            }

            if (records.All(p => p.YearOfBirth > DateTime.Now.Year))
            {
                return new KeyValuePair<Person, Attrition>(null, Attrition.ImplausibleYOBFuture);
            }

            var filtered = records.Where(p =>
                p.GenderConceptId != 8551 &&
                p.YearOfBirth >= 1900 &&
                p.YearOfBirth <= DateTime.Now.Year).ToArray();

            if (filtered.Length == 0)
                return new KeyValuePair<Person, Attrition>(null, Attrition.UnacceptablePatientQuality);

            var ordered = filtered.OrderByDescending(p => p.StartDate).ToArray();
            var person = ordered.Take(1).First();
            person.StartDate = ordered.Take(1).Last().StartDate;

            if (person.GenderConceptId == 8551)
            {
                return new KeyValuePair<Person, Attrition>(null, Attrition.UnknownGender);
            }

            if (records.Any(r => r.GenderConceptId != 8551 && r.GenderConceptId != person.GenderConceptId))
            {
                return new KeyValuePair<Person, Attrition>(null, Attrition.GenderChanges); // Gender changed over different enrollment period 
            }

            if (person.YearOfBirth < 1900)
                return new KeyValuePair<Person, Attrition>(null, Attrition.ImplausibleYOBPast);

            if (person.YearOfBirth > DateTime.Now.Year)
                return new KeyValuePair<Person, Attrition>(null, Attrition.ImplausibleYOBFuture);

            if (records.Where(r => r.YearOfBirth.HasValue && r.YearOfBirth > 1900).Max(r => r.YearOfBirth) -
                records.Where(r => r.YearOfBirth.HasValue && r.YearOfBirth > 1900).Min(r => r.YearOfBirth) > 2)
            {
                return new KeyValuePair<Person, Attrition>(null, Attrition.MultipleYearsOfBirth);
            }

            _yob = person.YearOfBirth;
            return new KeyValuePair<Person, Attrition>(person, Attrition.None);
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

        private long? GetVisitOccurrenceId(IEntity ent, Dictionary<long, VisitOccurrence> visitOccurrences)
        {
            if (ent.VisitOccurrenceId.HasValue && visitOccurrences.ContainsKey(ent.VisitOccurrenceId.Value))
                return ent.VisitOccurrenceId;

            foreach (var visitOccurrence in _rawVisits.Values)
            {
                if (visitOccurrence.Id > 0 && visitOccurrence.StartDate >= ent.StartDate &&
                    visitOccurrence.EndDate <= ent.EndDate)
                {
                    return visitOccurrence.Id;
                }
            }

            return null;
        }

        private void AddRawVisitOccurrence(VisitOccurrence rawVisit, VisitOccurrence finalVisit)
        {
            if (!_rawVisits.ContainsKey(rawVisit.SourceRecordGuid))
                _rawVisits.Add(rawVisit.SourceRecordGuid, finalVisit);
            else
                _rawVisits[rawVisit.SourceRecordGuid] = finalVisit;
        }

        public override IEnumerable<VisitOccurrence> BuildVisitOccurrences(VisitOccurrence[] rawVisitOccurrences,
            ObservationPeriod[] observationPeriods)
        {
            foreach (var vo in PrepareVisitOccurrences(rawVisitOccurrences.ToArray(),
                observationPeriods))
            {
                yield return vo;
            }
        }

        private IEnumerable<VisitOccurrence> CollapseVisits(IEnumerable<VisitOccurrence> visitOccurrences)
        {
            var visits = new List<VisitOccurrence>();

            foreach (var claim in visitOccurrences.OrderBy(vo => vo.StartDate).ThenBy(vo => vo.EndDate)) //IP - 9201
            {
                if (visits.Count > 0)
                {
                    var previousClaim = visits.Last();
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

                visits.Add(claim);
            }

            return visits;
        }

        private IEnumerable<VisitOccurrence> PrepareVisitOccurrences(VisitOccurrence[] rawVisitOccurrences,
       ObservationPeriod[] observationPeriods)
        {
            var ipVisits = CollapseVisits(rawVisitOccurrences.Where(vo => vo.ConceptId == 9201)).ToList();
            var opVisits = rawVisitOccurrences.Where(vo => vo.ConceptId == 9202).ToList();

            foreach (var ipVisit in ipVisits)
            {
                yield return ipVisit;
            }

            foreach (var opGroup in opVisits.GroupBy(v => v.StartDate))
            {
                var visit = opGroup.First();
                visit.EndDate = opGroup.Max(v => v.EndDate);
                foreach (var visitOccurrence in opGroup)
                {
                    AddRawVisitOccurrence(visitOccurrence, visit);
                }

                yield return visit;
            }
        }

        public override IEnumerable<VisitDetail> BuildVisitDetails(VisitDetail[] visitDetails, VisitOccurrence[] visitOccurrences, ObservationPeriod[] observationPeriods)
        {
            var details = new HashSet<VisitDetail>();
            foreach (var visitOccurrence in visitOccurrences)
            {
                var visitDetail = new VisitDetail(visitOccurrence);
                details.Add(visitDetail);
            }

            foreach (var visitDetail in Clean(details, observationPeriods, true).Distinct())
            {
                visitDetail.Id = Offset.GetKeyOffset(visitDetail.PersonId).VisitDetailId;
                _visitDetails.Add(visitDetail.SourceRecordGuid, visitDetail);

                if (!visitDetail.EndDate.HasValue)
                    visitDetail.EndDate = visitDetail.StartDate;

                yield return visitDetail;
            }
        }

        public override IEnumerable<ConditionOccurrence> BuildConditionOccurrences(ConditionOccurrence[] conditionOccurrences, Dictionary<long, VisitOccurrence> visitOccurrences,
            ObservationPeriod[] observationPeriods)
        {
            var co = new List<ConditionOccurrence>();
            foreach (var row in conditionOccurrences.GroupBy(e => e.SourceRecordGuid))
            {
                var icd10 = row.FirstOrDefault(r => r.TypeConceptId == 0 && r.ConceptId > 0);
                var icd9 = row.FirstOrDefault(r => r.TypeConceptId == 1 && r.ConceptId > 0);
                var snomed = row.FirstOrDefault(r => r.TypeConceptId == 2 && r.ConceptId > 0);
                var simple = row.FirstOrDefault(r => r.TypeConceptId == 3 && !string.IsNullOrEmpty(r.SourceValue));

                var cpt4 = row.FirstOrDefault(r => r.TypeConceptId == 4 && !string.IsNullOrEmpty(r.SourceValue));

                if (icd10 != null)
                {
                    icd10.TypeConceptId = 32020;
                    icd10.VisitOccurrenceId = GetVisitOccurrenceId(icd10, visitOccurrences);
                    co.Add(icd10);
                }
                else if (icd9 != null)
                {
                    icd9.TypeConceptId = 32020;
                    icd9.VisitOccurrenceId = GetVisitOccurrenceId(icd9, visitOccurrences);
                    co.Add(icd9);
                }
                else if (snomed != null)
                {
                    snomed.TypeConceptId = 32020;
                    snomed.VisitOccurrenceId = GetVisitOccurrenceId(snomed, visitOccurrences);
                    co.Add(snomed);
                }
                else if (simple != null)
                {
                    simple.TypeConceptId = 32020;
                    simple.VisitOccurrenceId = GetVisitOccurrenceId(simple, visitOccurrences);
                    co.Add(simple);
                }

                if (cpt4 != null)
                {
                    cpt4.TypeConceptId = 32020;
                    cpt4.VisitOccurrenceId = GetVisitOccurrenceId(cpt4, visitOccurrences);
                    co.Add(cpt4);
                }
            }

            return base.BuildConditionOccurrences(co.ToArray(), visitOccurrences, observationPeriods);
        }

        public void SetStartDate(IEntity e, Dictionary<long, VisitOccurrence> visitOccurrences)
        {
            if (e.VisitOccurrenceId.HasValue && visitOccurrences.ContainsKey(e.VisitOccurrenceId.Value))
            {
                var vo = visitOccurrences[e.VisitOccurrenceId.Value];
                if (e.StartDate < vo.StartDate || e.StartDate > vo.EndDate)
                {
                    e.StartDate = vo.StartDate;
                }

                if (_yob.HasValue && e.StartDate.Year < _yob)
                {
                    e.StartDate = vo.StartDate;
                }
            }
        }

        public override IEnumerable<DrugExposure> BuildDrugExposures(DrugExposure[] drugExposures, Dictionary<long, VisitOccurrence> visitOccurrences,
            ObservationPeriod[] observationPeriods)
        {
            var de = new List<DrugExposure>();
            foreach (var row in drugExposures.GroupBy(e => e.SourceRecordGuid))
            {
                var ndcMed = row.FirstOrDefault(r => r.TypeConceptId == 0 && r.ConceptId > 0);
                var cvxMed = row.FirstOrDefault(r => r.TypeConceptId == 1 && r.ConceptId > 0);
                var simpleMed = row.FirstOrDefault(r => r.TypeConceptId == 2 && !string.IsNullOrEmpty(r.SourceValue));

                if (ndcMed != null)
                {
                    ndcMed.TypeConceptId = 32020;
                    if (ndcMed.VerbatimEndDate.HasValue && ndcMed.VerbatimEndDate < ndcMed.StartDate)
                        ndcMed.VerbatimEndDate = null;

                    ndcMed.VisitOccurrenceId = GetVisitOccurrenceId(ndcMed, visitOccurrences);
                    SetStartDate(ndcMed, visitOccurrences);

                    de.Add(ndcMed);
                }
                else if (cvxMed != null)
                {
                    cvxMed.TypeConceptId = 32020;
                    if (cvxMed.VerbatimEndDate.HasValue && cvxMed.VerbatimEndDate < cvxMed.StartDate)
                        cvxMed.VerbatimEndDate = null;

                    cvxMed.VisitOccurrenceId = GetVisitOccurrenceId(cvxMed, visitOccurrences);
                    SetStartDate(cvxMed, visitOccurrences);

                    de.Add(cvxMed);
                }
                else if (simpleMed != null)
                {
                    simpleMed.TypeConceptId = 32020;
                    if (simpleMed.VerbatimEndDate.HasValue && simpleMed.VerbatimEndDate < simpleMed.StartDate)
                        simpleMed.VerbatimEndDate = null;

                    simpleMed.VisitOccurrenceId = GetVisitOccurrenceId(simpleMed, visitOccurrences);
                    SetStartDate(simpleMed, visitOccurrences);

                    de.Add(simpleMed);
                }

                var ndcVac = row.FirstOrDefault(r => r.TypeConceptId == 10 && r.ConceptId > 0);
                var cvxVac = row.FirstOrDefault(r => r.TypeConceptId == 11 && r.ConceptId > 0);
                var simpleVac = row.FirstOrDefault(r => r.TypeConceptId == 12 && !string.IsNullOrEmpty(r.SourceValue));

                if (ndcVac != null)
                {
                    ndcVac.TypeConceptId = 32020;
                    ndcVac.VisitOccurrenceId = GetVisitOccurrenceId(ndcVac, visitOccurrences);
                    SetStartDate(ndcVac, visitOccurrences);
                    de.Add(ndcVac);
                }
                else if (cvxVac != null)
                {
                    cvxVac.TypeConceptId = 32020;
                    cvxVac.VisitOccurrenceId = GetVisitOccurrenceId(cvxVac, visitOccurrences);
                    SetStartDate(cvxVac, visitOccurrences);
                    de.Add(cvxVac);
                }
                else if (simpleVac != null)
                {
                    simpleVac.TypeConceptId = 32020;
                    simpleVac.VisitOccurrenceId = GetVisitOccurrenceId(simpleVac, visitOccurrences);
                    SetStartDate(simpleVac, visitOccurrences);
                    de.Add(simpleVac);
                }
            }

            return base.BuildDrugExposures(de.Where(d => d.StartDate < DateTime.Now && d.StartDate.Year >= _yob.Value).ToArray(), visitOccurrences,
                observationPeriods);
        }

        public override IEnumerable<Measurement> BuildMeasurement(Measurement[] measurements, Dictionary<long, VisitOccurrence> visitOccurrences,
            ObservationPeriod[] observationPeriods)
        {
            var m = new List<Measurement>();
            foreach (var row in measurements.GroupBy(e => e.SourceRecordGuid))
            {
                var loinc = row.FirstOrDefault(r => r.TypeConceptId == 0 && r.ConceptId > 0);
                var simple = row.FirstOrDefault(r => r.TypeConceptId == 1 && !string.IsNullOrEmpty(r.SourceValue));

                if (loinc != null)
                {
                    loinc.TypeConceptId = 32020;
                    loinc.VisitOccurrenceId = GetVisitOccurrenceId(loinc, visitOccurrences);
                    m.Add(loinc);
                }
                else if (simple != null)
                {
                    simple.TypeConceptId = 32020;
                    simple.VisitOccurrenceId = GetVisitOccurrenceId(simple, visitOccurrences);
                    m.Add(simple);
                }
            }

            return base.BuildMeasurement(m.ToArray(), visitOccurrences, observationPeriods);
        }

        private void SetVisitId(IEntity e)
        {
            if (!e.VisitOccurrenceId.HasValue)
                return;

            if (!_visitIdMap.ContainsKey(e.VisitOccurrenceId.Value))
            {
                e.VisitOccurrenceId = null;
                return;
            }

            var visit = _visitIdMap[e.VisitOccurrenceId.Value]
                .FirstOrDefault(v => e.StartDate.Between(v.StartDate, v.EndDate.Value));

            if (visit != null)
            {
                e.VisitOccurrenceId = visit.Id;
            }
            else
            {
                e.VisitOccurrenceId = null;
            }
        }

        public override Attrition Build(ChunkData data, KeyMasterOffsetManager o)
        {
            Offset = o;
            ChunkData = data;

            var result = BuildPerson(PersonRecords.ToList());
            var person = result.Key;
            if (person == null)
            {
                Complete = true;
                return result.Value;
            }

            var observationPeriods =
                BuildObservationPeriods(9999, ObservationPeriodsRaw.ToArray())
                    .ToArray();

            if (Excluded(person, observationPeriods))
            {
                Complete = true;
                return Attrition.ImplausibleYOBPostEarliestOP;
            }


            var visitDetails = BuildVisitDetails(null, VisitOccurrencesRaw.ToArray(), observationPeriods).ToArray();

            var visitOccurrences = new Dictionary<long, VisitOccurrence>();
            var visitIds = new List<long>();
            foreach (var visitOccurrence in BuildVisitOccurrences(VisitOccurrencesRaw.ToArray(), observationPeriods))
            {
                if (visitOccurrence.IdUndefined)
                {
                    visitOccurrence.Id = Offset.GetKeyOffset(visitOccurrence.PersonId).VisitOccurrenceId;
                    visitOccurrence.IdUndefined = false;
                }

                if (!visitOccurrences.ContainsKey(visitOccurrence.Id))
                {
                    visitOccurrences.Add(visitOccurrence.Id, visitOccurrence);
                    visitIds.Add(visitOccurrence.Id);
                }

                var ecntrId = visitOccurrence.AdditionalFields["ecntr_id"];
                if (long.TryParse(ecntrId, out var visitId))
                {
                    if (!_visitIdMap.ContainsKey(visitId))
                        _visitIdMap.Add(visitId, new List<VisitOccurrence>());

                    _visitIdMap[visitId].Add(visitOccurrence);
                }
            }

            foreach (var visitDetail in visitDetails)
            {
                var vo = GetVisitOccurrence(visitDetail);
                visitDetail.VisitOccurrenceId = vo?.Id ?? 0;
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

            foreach (var e in ConditionOccurrencesRaw)
            {
                SetVisitId(e);
            }

            foreach (var e in ProcedureOccurrencesRaw)
            {
                SetVisitId(e);
            }

            foreach (var e in ObservationsRaw)
            {
                SetVisitId(e);
            }

            foreach (var e in DrugExposuresRaw)
            {
                SetVisitId(e);
            }

            foreach (var e in MeasurementsRaw)
            {
                SetVisitId(e);
            }

            foreach (var e in DeviceExposureRaw)
            {
                SetVisitId(e);
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
                procedureOccurrence.Id =
                    Offset.GetKeyOffset(procedureOccurrence.PersonId).ProcedureOccurrenceId;
            }

            var observations = BuildObservations(ObservationsRaw.ToArray(), visitOccurrences, observationPeriods)
                .ToArray();
            foreach (var ob in observations)
            {
                ob.Id = Offset.GetKeyOffset(ob.PersonId).ObservationId;
            }

            var drugExposures =
                BuildDrugExposures(DrugExposuresRaw.ToArray(), visitOccurrences, observationPeriods)
                    .ToArray();

            var measurements = BuildMeasurement(MeasurementsRaw.ToArray(), visitOccurrences, observationPeriods)
                .ToArray();
            var deviceExposure = BuildDeviceExposure(DeviceExposureRaw.ToArray(), visitOccurrences, observationPeriods)
                .ToArray();

            // set corresponding ProviderIds
            SetProviderIds(drugExposures);
            SetProviderIds(conditionOccurrences);
            SetProviderIds(visitOccurrences.Values.ToArray());
            SetProviderIds(procedureOccurrences);
            SetProviderIds(observations);
            SetProviderIds(visitDetails);

            // push built entities to ChunkBuilder for further save to CDM database
            AddToChunk(person, null,
                observationPeriods,
                new PayerPlanPeriod[0],
                drugExposures,
                conditionOccurrences,
                procedureOccurrences,
                observations,
                measurements,
                visitOccurrences.Values.ToArray(), visitDetails, new Cohort[0], deviceExposure, new Note[0]);

            Complete = true;

            return Attrition.None;
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
                                           Id = Offset.GetKeyOffset(entity.PersonId)
                                               .ConditionOccurrenceId
                                       };
                            ConditionForEra.Add(cond);
                            ChunkData.AddData(cond);
                        }

                        break;

                    case "Measurement":
                    case "Meas Value":
                        var mes = entity as Measurement ?? new Measurement(entity)
                        {
                            Id = Offset.GetKeyOffset(entity.PersonId).MeasurementId
                        };

                        if (!string.IsNullOrEmpty(mes.SourceValue))
                        {
                            if (decimal.TryParse(mes.SourceValue, out var valueAsNumber))
                            {
                                mes.ValueAsNumber = valueAsNumber;
                            }
                        }

                        ChunkData.AddData(mes);
                        break;

                    case "Observation":
                        var o = entity as Observation ?? new Observation(entity)
                        {
                            Id = Offset.GetKeyOffset(entity.PersonId).ObservationId
                        };

                        if (!string.IsNullOrEmpty(o.SourceValue))
                        {
                            if (decimal.TryParse(o.SourceValue, out var valueAsNumber))
                            {
                                o.ValueAsNumber = valueAsNumber;
                            }
                            else if (string.IsNullOrEmpty(o.ValueAsString))
                            {
                                o.ValueAsString = o.SourceValue;
                            }
                        }

                        ChunkData.AddData(o);
                        break;

                    case "Procedure":
                        ChunkData.AddData(entity as ProcedureOccurrence ??
                                          new ProcedureOccurrence(entity)
                                          {
                                              Id =
                                                  Offset.GetKeyOffset(entity.PersonId)
                                                      .ProcedureOccurrenceId
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

                        //1.Look for day_sply_nbr.If this is not NULL, add the value in days to drug_exposure_start_date to get drug_exposure_end_date
                        //2.If there is a day_sply_nbr and a value in ptnt_mdctn_end_dte_tstmp, use the calculated value from step one as the drug_exposure_end_date
                        //3.If day_sply_nbr is NULL then use the ptnt_mdctn_end_dte_tstmp as the verbatim_end_date and drug_exposure_end_date
                        //4.If both day_sply_nbr is NULL and ptnt_mdctn_end_dte_tstmp is NULL then set the drug_exposure_end_date as the drug_exposure_start_date
                        if (drg.DaysSupply.HasValue && drg.DaysSupply > 0)
                        {
                            drg.EndDate = drg.StartDate.AddDays(drg.DaysSupply.Value);
                        }
                        else if (drg.VerbatimEndDate.HasValue)
                        {
                            drg.EndDate = drg.VerbatimEndDate;
                        }
                        else
                        {
                            drg.EndDate = drg.StartDate;
                        }

                        if (!string.IsNullOrEmpty(drg.Sig) && drg.Sig.Contains("~*~"))
                            drg.Sig = drg.Sig.Replace("~*~", "~x~");

                        DrugForEra.Add(drg);
                        ChunkData.AddData(drg);
                        break;

                }
            }
        }
    }
}
