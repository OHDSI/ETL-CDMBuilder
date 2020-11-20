using org.ohdsi.cdm.framework.common.Base;
using org.ohdsi.cdm.framework.common.Builder;
using org.ohdsi.cdm.framework.common.Extensions;
using org.ohdsi.cdm.framework.common.Omop;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace org.ohdsi.cdm.framework.etl.healthverity
{
    public class HealthVerityPersonBuilder : PersonBuilder
    {
        private readonly Dictionary<Guid, VisitOccurrence> _rawVisits = new Dictionary<Guid, VisitOccurrence>();
        private readonly Dictionary<long, List<VisitDetail>> _visitDetails = new Dictionary<long, List<VisitDetail>>();
        private readonly string[] _covid = {"SARS CORONAVIRUS W/CoV 2 RNA,QL REAL TIME RT PCR",
                                            "SARS Coronavirus w/CoV 2 RNA,QL Real Time RT PCR",
                                            "SARS COV W/COV 2 RNA,PCR",
                                            "SARS-CoV-2 RNA, QL, RT PCR (COVID-19) - Swabs",
                                            "SARS CoV 2(COVID19)IgG,IA",
                                            "SARS-CoV-2 RNA, QL, RT PCR (COVID-19) Swabs"};

        public override string GetFolder()
        {
            return "ETL\\HEALTHVERITY";
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

            return new KeyValuePair<Person, Attrition>(person, Attrition.None);
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
            var ipVisits = CollapseVisits(rawVisitOccurrences.Where(vo => vo.ConceptId == 9201), 1).ToList();
            var ltcpVisits = CollapseVisits(rawVisitOccurrences.Where(vo => vo.ConceptId == 42898160), 32).ToList();

            var erVisits = new List<VisitOccurrence>();
            var opVisits = new List<VisitOccurrence>();
            foreach (
                var visitOccurrence in
                rawVisitOccurrences.Where(
                    visitOccurrence => visitOccurrence.ConceptId != 9201 && visitOccurrence.ConceptId != 42898160))
            {
                var ip = ipVisits.FirstOrDefault(v => visitOccurrence.StartDate.Between(v.StartDate, v.EndDate.Value));

                if (visitOccurrence.ConceptId == 9203)
                {
                    if (ip == null || visitOccurrence.StartDate == ip.StartDate &&
                                       visitOccurrence.EndDate == ip.StartDate)
                    //ER - 9203
                    {
                        erVisits.Add(visitOccurrence);
                    }
                    else
                    {
                        AddRawVisitOccurrence(visitOccurrence, ip);
                    }
                }
                else if (ip == null)
                {
                    opVisits.Add(visitOccurrence);
                }
                else
                {
                    AddRawVisitOccurrence(visitOccurrence, ip);
                }
            }

            foreach (var ipVisit in ipVisits)
            {
                yield return ipVisit;
            }

            foreach (var ltcpVisit in ltcpVisits)
            {
                yield return ltcpVisit;
            }

            foreach (var erGroup in erVisits.GroupBy(v => v.StartDate))
            {
                var visit = erGroup.First();
                visit.EndDate = erGroup.Max(v => v.EndDate);
                foreach (var visitOccurrence in erGroup)
                {
                    AddRawVisitOccurrence(visitOccurrence, visit);
                }

                yield return visit;
            }

            foreach (var opGroup in opVisits.GroupBy(v => v.StartDate))
            {
                foreach (var opGroup1 in opGroup.GroupBy(v => v.ProviderKey))
                {
                    var visit = opGroup1.First();
                    visit.EndDate = opGroup1.Max(v => v.EndDate);
                    foreach (var visitOccurrence in opGroup1)
                    {
                        AddRawVisitOccurrence(visitOccurrence, visit);
                    }

                    yield return visit;
                }
            }
        }

        private IEnumerable<VisitOccurrence> CollapseVisits(IEnumerable<VisitOccurrence> visitOccurrences, int gap)
        {
            var visits = new List<VisitOccurrence>();

            foreach (var claim in visitOccurrences.OrderBy(vo => vo.StartDate).ThenBy(vo => vo.EndDate))
            {
                if (visits.Count > 0)
                {
                    var previousClaim = visits.Last();
                    if (claim.StartDate <= previousClaim.EndDate.Value.AddDays(gap))
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

        public override IEnumerable<VisitDetail> BuildVisitDetails(VisitDetail[] visitDetails,
         VisitOccurrence[] visitOccurrences, ObservationPeriod[] observationPeriods)
        {
            foreach (var visitOccurrence in visitOccurrences)
            {
                var visitDetail =
                    new VisitDetail(visitOccurrence)
                    {
                        Id = Offset.GetKeyOffset(visitOccurrence.PersonId).VisitDetailId
                    };

                if (!visitDetail.EndDate.HasValue)
                    visitDetail.EndDate = visitDetail.StartDate;


                yield return visitDetail;
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

            var obs = ObservationPeriodsRaw.Where(op => op.TypeConceptId > 0).ToArray();
            ObservationPeriod[] observationPeriods;
            if (obs.Length == 0)
            {
                observationPeriods = new ObservationPeriod[0];
            }
            else
            {
                observationPeriods =
                   BuildObservationPeriods(person.ObservationPeriodGap, ObservationPeriodsRaw.Where(op => op.TypeConceptId > 0).ToArray())
                       .ToArray();
            }

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

            Console.WriteLine($"PeronsId={person.PersonSourceValue};" +
                $"cond={conditionOccurrences.Length};" +
                $"drg={drugExposures.Length};" +
                $"proc={procedureOccurrences.Length};" +
                $"mes={measurements.Length};" +
                $"obser={observations.Length};" +
                $"dev={deviceExposure.Length};" +
                $"vo={visitOccurrences.Values.Count};" +
                $"vd={visitDetails.Length}");


            // set corresponding ProviderIds
            SetProviderIds(drugExposures);
            SetProviderIds(conditionOccurrences);
            SetProviderIds(visitOccurrences.Values.ToArray());
            SetProviderIds(procedureOccurrences);
            SetProviderIds(observations);
            SetProviderIds(visitDetails);

            SetVisitDetailId(drugExposures, visitOccurrences.Values.ToArray());
            SetVisitDetailId(conditionOccurrences, visitOccurrences.Values.ToArray());
            SetVisitDetailId(procedureOccurrences, visitOccurrences.Values.ToArray());
            SetVisitDetailId(measurements, visitOccurrences.Values.ToArray());
            SetVisitDetailId(observations, visitOccurrences.Values.ToArray());
            SetVisitDetailId(deviceExposure, visitOccurrences.Values.ToArray());

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

        private void SetVisitDetailId(IEnumerable<IEntity> entities, VisitOccurrence[] visits)
        {
            Parallel.ForEach(entities, e =>
            {
                var vs = visits.Where(vd => e.StartDate.Between(vd.StartDate, vd.EndDate.Value)).ToArray();
                if (vs.Length == 0)
                    return;

                VisitDetail vd = null;
                foreach (var vo in vs)
                {
                    vd = _visitDetails[vo.Id].FirstOrDefault(vd => vd.SourceRecordGuid == e.SourceRecordGuid);

                    if (vd != null)
                    {
                        break;
                    }
                }

                if (vd == null)
                {
                    vd = _visitDetails[vs[0].Id].First();
                }

                if (vd != null)
                {
                    e.VisitDetailId = vd.Id;
                    e.VisitOccurrenceId = vd.VisitOccurrenceId;
                }
            });

            //foreach (var e in entities)
            //{

            //}
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
                        var mes = entity as Measurement ?? new Measurement(entity)
                        {
                            Id = Offset.GetKeyOffset(entity.PersonId).MeasurementId
                        };

                        if (mes.ConceptId == 0 && _covid.Any(c => c == mes.SourceValue))
                        {
                            mes.ConceptId = 700360;
                        }

                        ChunkData.AddData(mes);
                        break;

                    case "Observation":
                        var o = entity as Observation ?? new Observation(entity)
                        {
                            Id = Offset.GetKeyOffset(entity.PersonId).ObservationId
                        };


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

                        DrugForEra.Add(drg);
                        ChunkData.AddData(drg);
                        break;

                }
            }
        }
    }
}
