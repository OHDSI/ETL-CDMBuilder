using org.ohdsi.cdm.framework.common.Base;
using org.ohdsi.cdm.framework.common.Builder;
using org.ohdsi.cdm.framework.common.Omop;
using org.ohdsi.cdm.framework.common.PregnancyAlgorithm;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;

namespace org.ohdsi.cdm.framework.etl.hcup
{
    public class HcupPersonBuilder : PersonBuilder
    {
        private readonly Dictionary<Guid, VisitOccurrence> _rawVisits = new Dictionary<Guid, VisitOccurrence>();
        private Person _currentPerson;
        private int _personAge;

        public override string GetFolder()
        {
            return "ETL\\HCUP";
        }

        public override IEnumerable<ConditionOccurrence> BuildConditionOccurrences(
            ConditionOccurrence[] conditionOccurrences, Dictionary<long, VisitOccurrence> visitOccurrences,
            ObservationPeriod[] observationPeriods)
        {
            foreach (var co in conditionOccurrences)
            {
                PopulateEntity(co);
            }

            return base.BuildConditionOccurrences(conditionOccurrences, visitOccurrences, observationPeriods);
        }

        private void PopulateEntity(IEntity co)
        {
            var vo = GetVisitOccurrence(co);
            if (vo == null)
                return;

            co.VisitOccurrenceId = vo.Id;
            co.StartDate = vo.StartDate;
            co.EndDate = null;

            if (co.TypeConceptId >= 0 && co.TypeConceptId <= 14)
                co.TypeConceptId = 38000184 + co.TypeConceptId;
        }

        public override IEnumerable<Observation> BuildObservations(Observation[] observations,
            Dictionary<long, VisitOccurrence> visitOccurrences,
            ObservationPeriod[] observationPeriods)
        {
            foreach (var o in observations)
            {
                PopulateEntity(o);
            }

            return base.BuildObservations(observations, visitOccurrences, observationPeriods);
        }

        public override IEnumerable<ProcedureOccurrence> BuildProcedureOccurrences(
            ProcedureOccurrence[] procedureOccurrences, Dictionary<long, VisitOccurrence> visitOccurrences,
            ObservationPeriod[] observationPeriods)
        {
            foreach (var po in procedureOccurrences)
            {
                var vo = GetVisitOccurrence(po);
                if (vo == null)
                    continue;

                int prday;
                int.TryParse(po.AdditionalFields[string.Format("prday{0}", po.TypeConceptId + 1)], out prday);

                int lengthOfStay;
                int.TryParse(po.AdditionalFields["los"], out lengthOfStay);

                if (prday > lengthOfStay) continue;

                po.StartDate = prday < 1 ? vo.StartDate : vo.StartDate.AddDays(prday);
                po.VisitOccurrenceId = vo.Id;

                if (po.TypeConceptId >= 0 && po.TypeConceptId <= 14)
                    po.TypeConceptId = 38000251 + po.TypeConceptId;
            }

            return base.BuildProcedureOccurrences(procedureOccurrences, visitOccurrences, observationPeriods);
        }


        public override IEnumerable<ObservationPeriod> BuildObservationPeriods(int gap, EraEntity[] observationPeriods)
        {
            foreach (var op in observationPeriods)
            {
                op.StartDate = CalculateStartDate(op);
                op.EndDate = op.StartDate;
                int lengthOfStay;
                int.TryParse(_currentPerson.AdditionalFields["los"], out lengthOfStay);

                if (lengthOfStay > 0)
                    op.EndDate = op.EndDate.Value.AddDays(lengthOfStay);
            }

            return base.BuildObservationPeriods(gap, observationPeriods);
        }

        public override IEnumerable<VisitOccurrence> BuildVisitOccurrences(VisitOccurrence[] visitOccurrences,
            ObservationPeriod[] observationPeriods)
        {
            foreach (var vo in visitOccurrences)
            {
                var op = observationPeriods.FirstOrDefault();
                if (op == null) continue;

                vo.StartDate = op.StartDate;
                vo.EndDate = op.EndDate;

                _rawVisits.Add(vo.SourceRecordGuid, vo);
            }

            return visitOccurrences;
        }

        private VisitOccurrence GetVisitOccurrence(IEntity ent)
        {
            if (_rawVisits.ContainsKey(ent.SourceRecordGuid))
                return _rawVisits[ent.SourceRecordGuid];

            return null;
        }

        private DateTime CalculateStartDate(IEntity op)
        {
            var year = op.StartDate.Year;
            int amonth;
            int.TryParse(_currentPerson.AdditionalFields["amonth"], out amonth);

            if (amonth < 1)
                amonth = GetMonth(op.PersonId.ToString(CultureInfo.InvariantCulture));

            //Logger.Write(null, LogMessageTypes.Debug, "<<<<< " + year + " " + " " + amonth);
            var startDate = new DateTime(year, amonth, 1);

            var isWeekend = _currentPerson.AdditionalFields["aweekend"].Equals("1");
            while (IsWeekend(startDate) != isWeekend)
            {
                startDate = startDate.AddDays(1);
            }

            return startDate;
        }

        private static bool IsWeekend(DateTime date)
        {
            return date.DayOfWeek == DayOfWeek.Saturday || date.DayOfWeek == DayOfWeek.Sunday;
        }

        public override KeyValuePair<Person, Attrition> BuildPerson(List<Person> records)
        {
            if (records == null || records.Count == 0) return
                new KeyValuePair<Person, Attrition>(null, Attrition.UnacceptablePatientQuality);

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

            switch (person.GenderConceptId)
            {
                case 8507:
                    person.GenderSourceValue = "0";
                    break;

                case 8532:
                    person.GenderSourceValue = "1";
                    break;

                default:
                    person.GenderSourceValue = "9";
                    break;
            }
            //if (person.GenderConceptId == 8551) //UNKNOWN
            //   return null;

            return new KeyValuePair<Person, Attrition>(person, Attrition.None);
        }

        public override Death BuildDeath(Death[] death, Dictionary<long, VisitOccurrence> visitOccurrences,
            ObservationPeriod[] observationPeriods)
        {
            var d = death.FirstOrDefault();
            if (d == null)
                return null;

            var vo = GetVisitOccurrence(d);
            if (vo != null)
            {
                d.StartDate = vo.EndDate.Value;
                return d;
            }

            return null;
        }

        public override Attrition Build(ChunkData data, KeyMasterOffsetManager o)
        {
            Offset = o;
            ChunkData = data;
            var result = BuildPerson(PersonRecords.ToList());
            var buildPerson = result.Key;
            if (buildPerson == null) return result.Value;
            _currentPerson = buildPerson;

            var observationPeriods =
                BuildObservationPeriods(buildPerson.ObservationPeriodGap, ObservationPeriodsRaw.ToArray()).ToArray();

            int age;
            int.TryParse(PersonRecords.ToArray()[0].AdditionalFields["age"], out age);
            _personAge = age;

            int ageday;
            int.TryParse(PersonRecords.ToArray()[0].AdditionalFields["ageday"], out ageday);

            if (age > 0)
            {
                buildPerson.YearOfBirth = observationPeriods[0].StartDate.Year - age;
            }
            else if (string.IsNullOrEmpty(PersonRecords.ToArray()[0].AdditionalFields["ageday"]) &&
                     PersonRecords.ToArray()[0].AdditionalFields["age_neonate"] == "1")
            {
                buildPerson.YearOfBirth = observationPeriods[0].StartDate.Year;
            }
            else if (PersonRecords.ToArray()[0].AdditionalFields["ageday"] == null &&
                     PersonRecords.ToArray()[0].AdditionalFields["age_neonate"] != "1" || ageday < 0)
            {
                var dateOfBirth = observationPeriods[0].StartDate.AddDays(-180);
                buildPerson.YearOfBirth = dateOfBirth.Year;
            }
            else if (ageday >= 0)
            {
                var dateOfBirth = observationPeriods[0].StartDate.AddDays(ageday * -1);
                buildPerson.YearOfBirth = dateOfBirth.Year;
                buildPerson.DayOfBirth = dateOfBirth.Day;
                buildPerson.MonthOfBirth = dateOfBirth.Month;
            }

            if (!buildPerson.YearOfBirth.HasValue || buildPerson.YearOfBirth < 1907)
            {
                return Attrition.ImplausibleYOBPast; // HIX-1417
            }

            // Delete any individual that has an OBSERVATION_PERIOD that is >= 2 years prior to the YEAR_OF_BIRTH
            if (Excluded(buildPerson, observationPeriods))
            {
                return Attrition.ImplausibleYOBPostEarliestOP;
            }

            var payerPlanPeriods = BuildPayerPlanPeriods(PayerPlanPeriodsRaw.ToArray(), null).ToArray();
            var visitOccurrences = new Dictionary<long, VisitOccurrence>();

            foreach (var visitOccurrence in BuildVisitOccurrences(VisitOccurrencesRaw.ToArray(), observationPeriods))
            {
                if (visitOccurrence.IdUndefined)
                    visitOccurrence.Id = Offset.GetKeyOffset(visitOccurrence.PersonId).VisitOccurrenceId;

                visitOccurrences.Add(visitOccurrence.Id, visitOccurrence);
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


            var death = BuildDeath(DeathRecords.ToArray(), visitOccurrences, observationPeriods);
            var drugCosts = BuildDrugCosts(drugExposures).ToArray();
            var procedureCosts = BuildProcedureCosts(procedureOccurrences).ToArray();
            var visitCosts = BuildVisitCosts(visitOccurrences.Values.ToArray()).ToArray();
            var devicCosts = BuildDeviceCosts(deviceExposure).ToArray();

            foreach (var cost in visitCosts)
            {
                if (cost.TotalPaid == 0) continue;

                var cost52 = new Cost(cost.PersonId)
                {
                    CostId = Offset.GetKeyOffset(cost.PersonId).VisitCostId,
                    CurrencyConceptId = 44818668,
                    TypeId = 5032,
                    Domain = "Visit",
                    EventId = cost.Id,
                    TotalCharge = cost.TotalPaid
                };
                ChunkData.AddCostData(cost52);
            }

            var cohort = BuildCohort(CohortRecords.ToArray(), observationPeriods).ToArray();

            // push built entities to ChunkBuilder for further save to CDM database
            AddToChunk(buildPerson, death, observationPeriods, payerPlanPeriods, drugExposures,
                conditionOccurrences, procedureOccurrences, observations, measurements,
                visitOccurrences.Values.ToArray(), null, cohort, deviceExposure, new Note[0]);

            var pg = new PregnancyAlgorithm();
            foreach (var pe in pg.GetPregnancyEpisodes(Vocabulary, buildPerson, observationPeriods,
                ChunkData.ConditionOccurrences.Where(e => e.PersonId == buildPerson.PersonId).ToArray(),
                ChunkData.ProcedureOccurrences.Where(e => e.PersonId == buildPerson.PersonId).ToArray(),
                ChunkData.Observations.Where(e => e.PersonId == buildPerson.PersonId).ToArray(),
                ChunkData.Measurements.Where(e => e.PersonId == buildPerson.PersonId).ToArray(),
                ChunkData.DrugExposures.Where(e => e.PersonId == buildPerson.PersonId).ToArray()))
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

                        var cond = entity as ConditionOccurrence ??
                                   new ConditionOccurrence(entity)
                                   {
                                       Id = Offset.GetKeyOffset(entity.PersonId).ConditionOccurrenceId
                                   };


                        //Person < 12 years old with live birth. Removing condition_occurrence
                        if (cond.ConceptId == 4014295 && _personAge < 12)
                            continue;

                        //Male with live birth. Removing condition_occurrence
                        if (cond.ConceptId == 4014295 && _currentPerson.GenderConceptId == 8507)
                            continue;

                        ConditionForEra.Add(cond);
                        ChunkData.AddData(cond);

                        break;

                    case "Measurement":
                        var mes = entity as Measurement ??
                                  new Measurement(entity)
                                  {
                                      Id = Offset.GetKeyOffset(entity.PersonId).MeasurementId
                                  };


                        mes.ValueAsConceptId = GetValueAsConceptId(mes, 4181412);


                        ChunkData.AddData(mes);
                        break;

                    case "Meas Value":
                        ChunkData.AddData(entity as Measurement ??
                                          new Measurement(entity) { Id = Offset.GetKeyOffset(entity.PersonId).MeasurementId });
                        break;

                    case "Observation":
                        var obser = entity as Observation ??
                                    new Observation(entity)
                                    {
                                        Id = Offset.GetKeyOffset(entity.PersonId).ObservationId
                                    };


                        obser.ValueAsConceptId = GetValueAsConceptId(obser, 45877994);

                        ChunkData.AddData(obser);
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

        private int GetValueAsConceptId(IEntity mes, int defaultConceptId)
        {
            //var result = Vocabulary.Lookup(mes.SourceValue, "MapsToValue", DateTime.MinValue, false);
            var result = Vocabulary.Lookup(mes.SourceValue, "MapsToValue", DateTime.MinValue);
            int conceptId = defaultConceptId;

            if (result.Any() && result[0].ConceptId.HasValue && result[0].ConceptId > 0)
                conceptId = result[0].ConceptId.Value;
            return conceptId;
        }

        private static int GetMonth(string personKey)
        {
            return Math.Abs(GetHash(personKey) % 12) + 1;
        }

        private static int GetHash(string value)
        {
            var hashCode = value.GetHashCode();
            hashCode ^= hashCode >> 20 ^ hashCode >> 12;
            return hashCode ^ hashCode >> 7 ^ hashCode >> 4;
        }
    }
}
