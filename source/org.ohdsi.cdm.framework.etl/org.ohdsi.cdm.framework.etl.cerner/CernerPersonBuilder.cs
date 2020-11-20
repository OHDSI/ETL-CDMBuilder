using org.ohdsi.cdm.framework.common.Base;
using org.ohdsi.cdm.framework.common.Builder;
using org.ohdsi.cdm.framework.common.Extensions;
using org.ohdsi.cdm.framework.common.Omop;
using org.ohdsi.cdm.framework.common.PregnancyAlgorithm;
using System;
using System.Collections.Generic;
using System.Linq;

namespace org.ohdsi.cdm.framework.etl.cerner
{
    public class CernerPersonBuilder : PersonBuilder
    {
        private readonly Dictionary<long, VisitOccurrence> rawVisits = new Dictionary<long, VisitOccurrence>();

        public override string GetFolder()
        {
            return "ETL\\CERNER";
        }

        public override KeyValuePair<Person, Attrition> BuildPerson(List<Person> records)
        {
            if (records == null || records.Count == 0)
                return new KeyValuePair<Person, Attrition>(null, Attrition.UnacceptablePatientQuality);

            var ordered = records.OrderByDescending(p => p.StartDate);
            var person = ordered.Take(1).First();


            if (person.GenderConceptId == 8551)
            {
                return new KeyValuePair<Person, Attrition>(null, Attrition.UnknownGender);
            }

            // male - 8507, female - 8532
            // If a person's gender changes (male to female or female to male) at any point in their record then exclude.
            if (person.GenderConceptId == 8507 && records.Any(p => p.GenderConceptId == 8532))
            {
                return new KeyValuePair<Person, Attrition>(null, Attrition.GenderChanges);
            }

            if (person.GenderConceptId == 8532 && records.Any(p => p.GenderConceptId == 8507))
            {
                return new KeyValuePair<Person, Attrition>(null, Attrition.GenderChanges);
            }


            return new KeyValuePair<Person, Attrition>(person, Attrition.None);
        }

        private static int GetProcedureTypeConceptId(int position, long visitTypeId)
        {
            if (visitTypeId == 9201)
            {
                if (position > 15)
                    position = 15;

                return 38000250 + position;
            }

            if (position > 6)
                position = 6;

            return 38000268 + position;
        }

        private static int GetConditionTypeConceptId(int position, long visitTypeId)
        {
            if (position > 15)
                position = 15;

            if (visitTypeId == 9201)
            {
                return 38000199 + position;
            }


            return 38000229 + position;
        }

        public override IEnumerable<PayerPlanPeriod> BuildPayerPlanPeriods(PayerPlanPeriod[] payerPlanPeriods,
            Dictionary<long, VisitOccurrence> visitOccurrences)
        {
            if (!payerPlanPeriods.Any()) yield break;

            foreach (var groupedById in payerPlanPeriods.GroupBy(p => p.Id))
            {
                var startDate = groupedById.Min(p => p.StartDate);
                var endDate = groupedById.Max(p => p.EndDate);

                var pp = groupedById.First();
                pp.StartDate = startDate;
                pp.EndDate = endDate;
                yield return pp;
            }
        }

        public override IEnumerable<ObservationPeriod> BuildObservationPeriods(int gap, EraEntity[] observationPeriods)
        {
            foreach (var op in observationPeriods)
            {
                if (op.EndDate.Value < op.StartDate)
                    op.EndDate = op.StartDate;
            }

            return base.BuildObservationPeriods(0, observationPeriods);
        }

        public IEnumerable<VisitOccurrence> GetIPClaims(IEnumerable<VisitOccurrence> visitOccurrences)
        {
            var visits = new List<VisitOccurrence>();

            var ipVisits = new List<VisitOccurrence>();
            foreach (
                    var claim in
                    visitOccurrences.Where(vo => vo.ConceptId == 9201).OrderBy(vo => vo.StartDate)
                        .ThenBy(vo => vo.EndDate))
            //IP - 9201
            {
                if (ipVisits.Count > 0)
                {
                    var previousClaim = ipVisits.Last();
                    if (claim.StartDate <= previousClaim.EndDate.Value.AddDays(1))
                    {
                        if (claim.EndDate >= previousClaim.EndDate)
                        {
                            previousClaim.EndDate = claim.EndDate;
                        }

                        if (!rawVisits.ContainsKey(claim.Id))
                            rawVisits.Add(claim.Id, previousClaim);

                        continue;
                    }
                }

                ipVisits.Add(claim);
            }

            visits.AddRange(ipVisits);


            foreach (var groupStartDate in visits.GroupBy(vo => vo.StartDate))
            {
                foreach (var groupEndDate in groupStartDate.GroupBy(vo => vo.EndDate))
                {
                    var visit = groupEndDate.OrderBy(v => v.ProviderId).FirstOrDefault();

                    foreach (var vo in groupEndDate)
                    {
                        if (!rawVisits.ContainsKey(vo.Id))
                            rawVisits.Add(vo.Id, visit);
                    }

                    yield return visit;
                }
            }
        }

        private VisitOccurrence GetVisitOccurrence(IEntity ent, Dictionary<long, VisitOccurrence> visitOccurrences)
        {
            var vId = ent.VisitOccurrenceId;

            if (vId.HasValue)
            {
                if (visitOccurrences.ContainsKey(vId.Value))
                    return visitOccurrences[vId.Value];

                if (rawVisits.ContainsKey(vId.Value))
                    return rawVisits[vId.Value];
            }

            return null;
        }

        public override IEnumerable<VisitOccurrence> BuildVisitOccurrences(VisitOccurrence[] rawVisitOccurrences,
            ObservationPeriod[] observationPeriods)
        {

            foreach (var v in rawVisitOccurrences)
            {
                if (v.EndDate.Value < v.StartDate)
                    v.EndDate = v.StartDate;
            }

            var ipVisits = GetIPClaims(rawVisitOccurrences).ToList();
            var erVisits = new List<VisitOccurrence>();
            var opVisits = new List<VisitOccurrence>();

            foreach (var visitOccurrence in rawVisitOccurrences.Where(visitOccurrence =>
                visitOccurrence.ConceptId != 9201)
            )
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
                        if (!rawVisits.ContainsKey(visitOccurrence.Id))
                            rawVisits.Add(visitOccurrence.Id, ip);
                    }
                }
                else if (ip == null)
                {
                    opVisits.Add(visitOccurrence);
                }
                else
                {
                    if (!rawVisits.ContainsKey(visitOccurrence.Id))
                        rawVisits.Add(visitOccurrence.Id, ip);
                }
            }

            foreach (var ipVisit in ipVisits)
            {
                yield return ipVisit;
            }

            foreach (var erGroup in erVisits.GroupBy(v => v.StartDate))
            {
                var visit = erGroup.OrderBy(v => v.ProviderId).First();
                visit.EndDate = erGroup.Max(v => v.EndDate);
                foreach (
                    var visitOccurrence in
                    erGroup.Where(visitOccurrence => !rawVisits.ContainsKey(visitOccurrence.Id)))
                {
                    rawVisits.Add(visitOccurrence.Id, visit);
                }

                yield return visit;
            }


            foreach (var opGroup in opVisits.GroupBy(v => v.StartDate))
            {
                var visit = opGroup.OrderBy(v => v.ProviderId).First();

                visit.EndDate = opGroup.Max(v => v.EndDate);
                foreach (
                    var visitOccurrence in
                    opGroup.Where(visitOccurrence => !rawVisits.ContainsKey(visitOccurrence.Id))
                )
                {
                    rawVisits.Add(visitOccurrence.Id, visit);
                }

                yield return visit;
            }
        }

        public override IEnumerable<ConditionOccurrence> BuildConditionOccurrences(
            ConditionOccurrence[] conditionOccurrences, Dictionary<long, VisitOccurrence> visitOccurrences,
            ObservationPeriod[] observationPeriods)
        {
            //if (conditionOccurrences.Any())
            //   Logger.Write(this.chunkData.ChunkId, LogMessageTypes.Debug, conditionOccurrences[0].PersonId + "; conditionOccurrences.Count=" + conditionOccurrences.Count());
            foreach (var ent in base.BuildConditionOccurrences(conditionOccurrences, visitOccurrences,
                observationPeriods))
            {
                var visitOccurrence = GetVisitOccurrence(ent, visitOccurrences);
                if (visitOccurrence == null)
                    continue;

                ent.VisitOccurrenceId = visitOccurrence.Id;
                ent.TypeConceptId = GetConditionTypeConceptId(ent.TypeConceptId.Value, visitOccurrence.ConceptId);

                yield return ent;
            }
        }

        public override IEnumerable<DeviceExposure> BuildDeviceExposure(DeviceExposure[] devExposure,
            Dictionary<long, VisitOccurrence> visitOccurrences,
            ObservationPeriod[] observationPeriods)
        {
            foreach (var ent in base.BuildDeviceExposure(devExposure, visitOccurrences, observationPeriods))
            {
                var visitOccurrence = GetVisitOccurrence(ent, visitOccurrences);
                if (visitOccurrence == null)
                    continue;

                ent.VisitOccurrenceId = visitOccurrence.Id;

                yield return ent;
            }
        }

        public override IEnumerable<DrugExposure> BuildDrugExposures(DrugExposure[] drugExposures,
            Dictionary<long, VisitOccurrence> visitOccurrences,
            ObservationPeriod[] observationPeriods)
        {
            foreach (var ent in base.BuildDrugExposures(drugExposures, visitOccurrences, observationPeriods))
            {
                var visitOccurrence = GetVisitOccurrence(ent, visitOccurrences);
                if (visitOccurrence == null)
                    continue;

                ent.VisitOccurrenceId = visitOccurrence.Id;

                yield return ent;
            }
        }


        public override IEnumerable<Measurement> BuildMeasurement(Measurement[] measurements,
            Dictionary<long, VisitOccurrence> visitOccurrences,
            ObservationPeriod[] observationPeriods)
        {
            foreach (var ent in base.BuildMeasurement(measurements, visitOccurrences, observationPeriods))
            {
                var visitOccurrence = GetVisitOccurrence(ent, visitOccurrences);
                if (visitOccurrence == null)
                    continue;

                ent.VisitOccurrenceId = visitOccurrence.Id;

                yield return ent;
            }
        }


        public override IEnumerable<Observation> BuildObservations(Observation[] observations,
            Dictionary<long, VisitOccurrence> visitOccurrences,
            ObservationPeriod[] observationPeriods)
        {
            foreach (var ent in base.BuildObservations(observations, visitOccurrences, observationPeriods))
            {
                var visitOccurrence = GetVisitOccurrence(ent, visitOccurrences);
                ent.VisitOccurrenceId = visitOccurrence == null ? 0 : visitOccurrence.Id;

                yield return ent;
            }
        }

        public override IEnumerable<ProcedureOccurrence> BuildProcedureOccurrences(
            ProcedureOccurrence[] procedureOccurrences, Dictionary<long, VisitOccurrence> visitOccurrences,
            ObservationPeriod[] observationPeriods)
        {
            foreach (var ent in base.BuildProcedureOccurrences(procedureOccurrences, visitOccurrences,
                observationPeriods))
            {
                var visitOccurrence = GetVisitOccurrence(ent, visitOccurrences);
                if (visitOccurrence == null)
                    continue;

                ent.VisitOccurrenceId = visitOccurrence.Id;
                ent.TypeConceptId = GetProcedureTypeConceptId(ent.TypeConceptId.Value, visitOccurrence.ConceptId);

                yield return ent;
            }
        }

        public override Attrition Build(ChunkData data, KeyMasterOffsetManager o)
        {
            Offset = o;
            ChunkData = data;

            var result = BuildPerson(PersonRecords.ToList());
            var person = result.Key;
            if (person == null)
                return result.Value;

            var observationPeriods =
                BuildObservationPeriods(person.ObservationPeriodGap, ObservationPeriodsRaw.ToArray()).ToArray();

            // Delete any individual that has an OBSERVATION_PERIOD that is >= 2 years prior to the YEAR_OF_BIRTH
            if (Excluded(person, observationPeriods))
            {
                return Attrition.ImplausibleYOBPostEarliestOP;
            }

            var payerPlanPeriods = BuildPayerPlanPeriods(PayerPlanPeriodsRaw.ToArray(), null).ToArray();
            var visitOccurrences = new Dictionary<long, VisitOccurrence>();

            foreach (var visitOccurrence in BuildVisitOccurrences(VisitOccurrencesRaw.ToArray(), observationPeriods))
            {
                if (visitOccurrence.IdUndefined)
                    visitOccurrence.Id =
                        Offset.GetKeyOffset(visitOccurrence.PersonId).VisitOccurrenceId;

                visitOccurrences.Add(visitOccurrence.Id, visitOccurrence);
            }

            // HIX-1491 Cerner Year_of_birth should use earliest admission
            if (visitOccurrences.Count > 0)
            {
                var minDate = visitOccurrences.Values.Min(vo => vo.StartDate);
                if (person.YearOfBirth > minDate.Year)
                    person.YearOfBirth = minDate.Year;
            }

            if (person.YearOfBirth < 1900)
                return Attrition.ImplausibleYOBPast;

            if (person.YearOfBirth > DateTime.Now.Year)
                return Attrition.ImplausibleYOBFuture;

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
            var drugCosts = BuildDrugCosts(drugExposures).ToArray();
            var procedureCosts = BuildProcedureCosts(procedureOccurrences).ToArray();
            var visitCosts = BuildVisitCosts(visitOccurrences.Values.ToArray()).ToArray();
            var devicCosts = BuildDeviceCosts(deviceExposure).ToArray();

            var cohort = BuildCohort(CohortRecords.ToArray(), observationPeriods).ToArray();
            var notes = BuildNote(NoteRecords.ToArray(), visitOccurrences, observationPeriods).ToArray();

            // push built entities to ChunkBuilder for further save to CDM database
            AddToChunk(person, death, observationPeriods, payerPlanPeriods, drugExposures,
                conditionOccurrences, procedureOccurrences, observations, measurements,
                visitOccurrences.Values.ToArray(), null, cohort, deviceExposure, notes);

            var pg = new PregnancyAlgorithm();
            foreach (var pe in pg.GetPregnancyEpisodes(Vocabulary, person, observationPeriods,
                ChunkData.ConditionOccurrences.Where(e => e.PersonId == person.PersonId).ToArray(),
                ChunkData.ProcedureOccurrences.Where(e => e.PersonId == person.PersonId).ToArray(),
                ChunkData.Observations.Where(e => e.PersonId == person.PersonId).ToArray(),
                ChunkData.Measurements.Where(e => e.PersonId == person.PersonId).ToArray(),
                ChunkData.DrugExposures.Where(e => e.PersonId == person.PersonId).ToArray()))
            {
                pe.Id = Offset.GetKeyOffset(pe.PersonId).ConditionEraId;
                ChunkData.ConditionEra.Add(pe);
            }

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

                        if (drg.TypeConceptId == 581373)
                        {
                            //var result = Vocabulary.Lookup(drg.RouteSourceValue, "Route", DateTime.MinValue, false);
                            var result = Vocabulary.Lookup(drg.RouteSourceValue, "Route", DateTime.MinValue);
                            int conceptId = 0;

                            if (result.Any() && result[0].ConceptId.HasValue && result[0].ConceptId > 0)
                                conceptId = result[0].ConceptId.Value;

                            drg.RouteConceptId = conceptId;
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
