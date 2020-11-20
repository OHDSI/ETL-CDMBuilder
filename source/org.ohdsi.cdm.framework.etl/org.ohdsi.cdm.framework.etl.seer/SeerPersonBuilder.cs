using org.ohdsi.cdm.framework.common.Base;
using org.ohdsi.cdm.framework.common.Builder;
using org.ohdsi.cdm.framework.common.Enums;
using org.ohdsi.cdm.framework.common.Extensions;
using org.ohdsi.cdm.framework.common.Helpers;
using org.ohdsi.cdm.framework.common.Omop;
using System;
using System.Collections.Generic;
using System.Linq;

namespace org.ohdsi.cdm.framework.etl.seer
{
    /// <summary>
    ///  Implementation of PersonBuilder for Nhanes, based on CDM Build spec
    /// </summary>
    public class SeerPersonBuilder : PersonBuilder
    {
        private List<PayerPlanPeriod> _payerPlanPeriods;
        private bool _died;
        private readonly HashSet<ProcedureOccurrence> _procedureOccurrence = new HashSet<ProcedureOccurrence>();
        private readonly HashSet<Observation> _observation = new HashSet<Observation>();
        private readonly HashSet<DeviceExposure> _deviceExposure = new HashSet<DeviceExposure>();
        private readonly HashSet<ConditionOccurrence> _conditionOccurrence = new HashSet<ConditionOccurrence>();
        private readonly HashSet<Measurement> _measurement = new HashSet<Measurement>();

        public override string GetFolder()
        {
            return "ETL\\SEER";
        }

        private void AddDeath(Person record, Death death)
        {
            int year;
            int month;

            switch (record.AdditionalFields["name"].ToUpper())
            {
                case "DOD_FLG":
                    if (record.AdditionalFields["value"] != "0")
                    {
                        _died = true;
                    }

                    break;

                case "MED_DODY":
                    if (int.TryParse(record.AdditionalFields["value"], out year) && year > 0)
                    {
                        death.StartDate = new DateTime(year, death.StartDate.Month, death.StartDate.Day);
                    }

                    break;

                case "MED_DODM":
                    if (int.TryParse(record.AdditionalFields["value"], out month) && month > 0)
                    {
                        death.StartDate = new DateTime(death.StartDate.Year, month, death.StartDate.Day);
                    }

                    break;

                case "MED_DODD":
                    int day;
                    if (int.TryParse(record.AdditionalFields["value"], out day) && day > 0)
                    {
                        death.StartDate = new DateTime(death.StartDate.Year, death.StartDate.Month, day);
                    }

                    break;

                case "SER_DODY":
                    if (int.TryParse(record.AdditionalFields["value"], out year) && year > 0)
                    {
                        death.EndDate = new DateTime(year, 1, 1);
                    }

                    break;

                case "SER_DODM":
                    if (death.EndDate.HasValue && int.TryParse(record.AdditionalFields["value"], out month) &&
                        month > 0 &&
                        month <= 12)
                    {
                        death.EndDate = new DateTime(death.EndDate.Value.Year, month, 1);
                    }

                    break;

                case "COD89V":
                    if (death.SourceConceptId == 9)
                    {
                        death.CauseSource = record.AdditionalFields["value"];
                        //var result9 = Vocabulary.Lookup(death.CauseSource, "DeathICD9", DateTime.MinValue, false);
                        var result9 = Vocabulary.Lookup(death.CauseSource, "DeathICD9", DateTime.MinValue);

                        if (result9.Any())
                            death.CauseConceptId = result9[0].ConceptId;

                        //var result9source = Vocabulary.Lookup(death.CauseSource, "DeathICD9Source", DateTime.MinValue, false);
                        var result9source = Vocabulary.Lookup(death.CauseSource, "DeathICD9Source", DateTime.MinValue);

                        if (result9source.Any())
                            death.SourceConceptId = result9source[0].ConceptId ?? 0;
                    }
                    else
                    {
                        death.CauseConceptId = 0;
                        death.SourceConceptId = 0;
                    }

                    break;

                case "COD10V":
                    if (death.SourceConceptId == 10)
                    {
                        death.CauseSource = record.AdditionalFields["value"];
                        //var result10 = Vocabulary.Lookup(death.CauseSource, "DeathICD10", DateTime.MinValue, false);
                        var result10 = Vocabulary.Lookup(death.CauseSource, "DeathICD10", DateTime.MinValue);

                        if (result10.Any())
                            death.CauseConceptId = result10[0].ConceptId;

                        //var result10source = Vocabulary.Lookup(death.CauseSource, "DeathICD10Source", DateTime.MinValue, false);
                        var result10source = Vocabulary.Lookup(death.CauseSource, "DeathICD10Source", DateTime.MinValue);

                        if (result10source.Any())
                            death.SourceConceptId = result10source[0].ConceptId ?? 0;
                    }
                    else
                    {
                        death.CauseConceptId = 0;
                        death.SourceConceptId = 0;
                    }

                    break;

                case "ICD_CODE":
                    if (record.AdditionalFields["value"] == "1")
                    {
                        death.SourceConceptId = 10;
                    }
                    else if (record.AdditionalFields["value"] == "9")
                    {
                        death.SourceConceptId = 9;
                    }
                    else if (record.AdditionalFields["value"] == "8")
                    {
                        death.SourceConceptId = 0;
                    }

                    break;

            }
        }

        public static void AddPeriods(ICollection<PayerPlanPeriod> preiods, string name, string value,
            string variableName)
        {
            if (!name.StartsWith(variableName)) return;
            if (variableName == "plan")
            {
                var planValue = name.Replace(variableName, "");
                var values = planValue.Split(new[] { '_' });
                int year;
                int month;
                if (values.Length == 2 && int.TryParse(values[0], out year) && int.TryParse(values[1], out month))
                {
                    preiods.Add(new PayerPlanPeriod
                    {
                        StartDate = new DateTime(2000 + year, month, 1),
                        PlanSourceValue = value,
                        SourceValue = variableName
                    });
                }
            }
            else
            {
                int index;
                name = name.Replace(variableName, "");
                if (!int.TryParse(name, out index)) return;

                var baseDate = new DateTime(1991, 1, 1);
                preiods.Add(new PayerPlanPeriod
                {
                    StartDate = baseDate.AddMonths(index - 1),
                    PlanSourceValue = value,
                    SourceValue = variableName
                });

            }
        }

        private void AddObservation(Person record, HashSet<Observation> observations)
        {
            var obser = new Observation(new Entity());
            var name = record.AdditionalFields["name"];
            var srctable = record.AdditionalFields["srctable"];
            var valueAsString = record.AdditionalFields["value"];

            if (string.IsNullOrEmpty(name) || string.IsNullOrEmpty(srctable))
                return;

            string value = srctable + "_" + name;
            //var result = Vocabulary.Lookup(value.ToLower(), "Observation", DateTime.MinValue, false);
            var result = Vocabulary.Lookup(value.ToLower(), "Observation", DateTime.MinValue);
            if (result.Any() && result[0].ConceptId.HasValue)
            {
                obser.SourceValue = value;
                obser.ValueAsString = valueAsString;
                obser.TypeConceptId = 0;
                observations.Add(obser);
            }
        }

        public override KeyValuePair<Person, Attrition> BuildPerson(List<Person> records)
        {
            if (records == null || records.Count == 0)
                return new KeyValuePair<Person, Attrition>(null, Attrition.UnacceptablePatientQuality);

            var periods = new List<PayerPlanPeriod>();
            var observations = new HashSet<Observation>();
            var person = new Person(new Entity())
            {
                PersonId = records[0].PersonId,
                GenderConceptId = 0,
                GenderSourceConceptId = 0,
                RaceConceptId = 0,
                RaceSourceConceptId = 0,
                EthnicityConceptId = 0,
                EthnicitySourceConceptId = 0
            };

            var death = new Death(new Entity())
            {
                PersonId = records[0].PersonId,
                TypeConceptId = 38003565,
                CauseConceptId = 0,
                SourceConceptId = 0,
                EndDate = null
            };

            foreach (var record in records)
            {
                AddPerson(record, person);
                AddDeath(record, death);
                AddObservation(record, observations);

                var name = record.AdditionalFields["name"].ToLower();
                var value = record.AdditionalFields["value"].ToLower();

                //mon1-mon252
                AddPeriods(periods, name, value, "mon");

                //gho1-gho252
                AddPeriods(periods, name, value, "gho");

                // plan06_01- plan06_12 ...
                AddPeriods(periods, name, value, "plan");
            }

            _payerPlanPeriods = BuildPayerPlanPeriods(periods, person.PersonId);
            foreach (var pp in _payerPlanPeriods)
            {
                pp.Id = Offset.GetKeyOffset(pp.PersonId).PayerPlanPeriodId;
            }

            foreach (var o in observations)
            {
                o.Id = Offset.GetKeyOffset(records[0].PersonId).ObservationId;
                o.PersonId = records[0].PersonId;
                ObservationsRaw.Add(o);
            }

            if (_died)
                DeathRecords.Add(death);

            if (person.GenderConceptId == 8551) //UNKNOWN
            {
                return new KeyValuePair<Person, Attrition>(null, Attrition.UnknownGender);
            }

            return new KeyValuePair<Person, Attrition>(person, Attrition.None);
        }

        private static string GetPlanSourceValue(string variableName, string value)
        {
            string[] partDCoverage = { "h", "r", "s", "e" };
            string[] partAB = { "1", "2", "3" };
            string[] HMOMember = { "1", "2", "4", "a", "b", "c" };

            switch (variableName)
            {
                case "plan":
                    if (partDCoverage.Any(value.Contains))
                        return "Part D Coverage";
                    break;

                case "mon":
                    if (partAB.Any(value.Contains))
                    {
                        switch (value)
                        {
                            case "1":
                                return "Part A Only";

                            case "2":
                                return "Part B Only";

                            case "3":
                                return "Part A and B";
                        }
                    }

                    break;

                case "gho":
                    if (HMOMember.Any(value.Contains))
                    {
                        return "HMO Member";
                    }

                    break;
            }

            return null;
        }

        public List<PayerPlanPeriod> BuildPayerPlanPeriods(List<PayerPlanPeriod> periods, long personId)
        {
            var result = new List<PayerPlanPeriod>();
            if (!periods.Any()) return result;

            foreach (var period in periods)
            {
                period.PersonId = personId;
                period.PayerSourceValue = "Medicare";
                period.PlanSourceValue = GetPlanSourceValue(period.SourceValue, period.PlanSourceValue);
                period.EndDate = period.StartDate.AddMonths(1).AddDays(-1);
            }

            foreach (var grouped in periods.GroupBy(p => p.SourceValue))
            {
                PayerPlanPeriod prev = null;
                PayerPlanPeriod last = null;
                foreach (var p in grouped.OrderBy(p => p.StartDate))
                {
                    if (p.PlanSourceValue != null)
                    {
                        last = p;
                    }

                    if (prev == null)
                    {
                        if (p.PlanSourceValue != null)
                        {
                            prev = p;
                        }
                    }
                    else
                    {
                        if (p.PlanSourceValue == null)
                        {
                            prev.EndDate = p.StartDate.AddDays(-1);
                            result.Add(prev);
                            prev = null;
                        }
                        else
                        {
                            if (p.PlanSourceValue != prev.PlanSourceValue ||
                                p.StartDate.Subtract(prev.EndDate.Value).Days > 1)
                            {
                                result.Add(prev);
                                prev = p;
                            }
                            else
                            {
                                prev.EndDate = p.EndDate;
                            }

                        }
                    }
                }

                if (prev != null && last != null)
                {
                    prev.EndDate = last.StartDate.AddMonths(1).AddDays(-1);
                    result.Add(prev);
                }
            }

            return result;
        }

        public List<ObservationPeriod> BuilObservationPeriods(List<PayerPlanPeriod> periods, long personId)
        {
            var result = new List<ObservationPeriod>();
            var partAB = periods.Where(p => p.PlanSourceValue == "Part A and B").ToList();
            var hmo = periods.Where(p => p.PlanSourceValue == "HMO Member").ToList();
            var abEras = EraHelper.GetEras(partAB, 0, 0).ToList();
            var hmoEras = EraHelper.GetEras(hmo, 0, 0).ToList();

            foreach (var ab in abEras.OrderBy(p => p.StartDate).ThenBy(p => p.EndDate))
            {
                result.Add(new ObservationPeriod
                {
                    Id = Offset.GetKeyOffset(personId).ObservationPeriodId,
                    PersonId = personId,
                    TypeConceptId = 44814725,
                    StartDate = ab.StartDate,
                    EndDate = ab.EndDate.Value
                });

                EraEntity ab1 = ab;
                foreach (
                    var h in
                    hmoEras.Where(
                            p =>
                                p.StartDate.Between(ab1.StartDate, ab1.EndDate.Value) ||
                                p.EndDate.Value.Between(ab1.StartDate, ab1.EndDate.Value))
                        .OrderBy(p => p.StartDate)
                        .ThenBy(p => p.EndDate))
                {
                    var op = result.Last();

                    if (h.StartDate > op.StartDate)
                    {
                        if (h.EndDate.Value >= op.EndDate)
                        {
                            op.EndDate = h.StartDate.AddDays(-1);
                        }
                        else
                        {
                            result.Add(new ObservationPeriod
                            {
                                Id = Offset.GetKeyOffset(personId).ObservationPeriodId,
                                PersonId = personId,
                                TypeConceptId = 44814725,
                                StartDate = h.EndDate.Value.AddDays(1),
                                EndDate = op.EndDate
                            });

                            op.EndDate = h.StartDate.AddDays(-1);
                        }
                    }
                    else
                    {
                        op.StartDate = h.EndDate.Value.AddDays(1);
                    }
                }
            }

            return result.Where(observationPeriod => observationPeriod.StartDate <= observationPeriod.EndDate).ToList();
        }

        private void AddPerson(Person record, Person person)
        {
            switch (record.AdditionalFields["name"].ToUpper())
            {
                case "BIRTHYR":
                    int yearOfBirth;
                    if (int.TryParse(record.AdditionalFields["value"], out yearOfBirth))
                    {
                        person.YearOfBirth = yearOfBirth;
                    }

                    break;

                case "BIRTHM":
                    int monthOfBirth;
                    if (int.TryParse(record.AdditionalFields["value"], out monthOfBirth))
                    {
                        person.MonthOfBirth = monthOfBirth;
                    }

                    break;

                case "M_SEX":
                    switch (record.AdditionalFields["value"])
                    {
                        case "1":
                            person.GenderSourceValue = "Male";
                            person.GenderConceptId = 8507;
                            break;

                        case "2":
                            person.GenderSourceValue = "Female";
                            person.GenderConceptId = 8532;
                            break;
                    }

                    break;

                case "RACE":
                    switch (record.AdditionalFields["value"])
                    {
                        case "0":
                            person.EthnicitySourceValue = "Unknown";
                            person.RaceSourceValue = person.EthnicitySourceValue;
                            person.RaceConceptId = 0;
                            person.EthnicityConceptId = 0;
                            break;

                        case "1":
                            person.EthnicitySourceValue = "White";
                            person.RaceSourceValue = person.EthnicitySourceValue;
                            person.RaceConceptId = 8527;
                            person.EthnicityConceptId = 38003564;
                            break;

                        case "2":
                            person.EthnicitySourceValue = "Black";
                            person.RaceSourceValue = person.EthnicitySourceValue;
                            person.RaceConceptId = 8516;
                            person.EthnicityConceptId = 38003564;
                            break;

                        case "3":
                            person.EthnicitySourceValue = "Other";
                            person.RaceSourceValue = person.EthnicitySourceValue;
                            person.RaceConceptId = 0;
                            person.EthnicityConceptId = 38003564;
                            break;

                        case "4":
                            person.EthnicitySourceValue = "Asian";
                            person.RaceSourceValue = person.EthnicitySourceValue;
                            person.RaceConceptId = 8515;
                            person.EthnicityConceptId = 38003564;
                            break;

                        case "5":
                            person.EthnicitySourceValue = "Hispanic";
                            person.RaceSourceValue = person.EthnicitySourceValue;
                            person.RaceConceptId = 0;
                            person.EthnicityConceptId = 38003563;
                            break;

                        case "6":
                            person.EthnicitySourceValue = "North American Native";
                            person.RaceSourceValue = person.EthnicitySourceValue;
                            person.RaceConceptId = 8657;
                            person.EthnicityConceptId = 38003564;
                            break;
                    }

                    break;

                case "STATE":
                    var location = record.AdditionalFields["value"];
                    person.LocationId = Entity.GetId(location);
                    break;
            }
        }

        public override IEnumerable<VisitOccurrence> BuildVisitOccurrences(VisitOccurrence[] visitOccurrences,
            ObservationPeriod[] observationPeriods)
        {
            var medpar = visitOccurrences.Where(vo =>
                vo.AdditionalFields["source"] == "medpar" && vo.ConceptId != 42898160 && vo.EndDate.HasValue).ToList();
            var SNFvisits = visitOccurrences.Where(vo =>
                vo.AdditionalFields["source"] == "medpar" && vo.ConceptId == 42898160 && vo.EndDate.HasValue).ToList();


            //After identifying SNF visits (SNFIND=’N’ VISIT_CONCEPT_ID = 42898160)
            //if two visits have the same value for PROVIDER and the discharge date of one is within two days
            //of the admit date of another then collapse the two records into one visit.
            if (SNFvisits.Count > 0)
            {
                foreach (var sameProviderId in SNFvisits.GroupBy(v => v.ProviderId))
                {
                    var visit = new VisitOccurrence(SNFvisits[0]);
                    foreach (var collapsedVisit in EraHelper.GetEras(sameProviderId, 2, 0))
                    {
                        visit.StartDate = collapsedVisit.StartDate;
                        visit.EndDate = collapsedVisit.EndDate;
                        medpar.Add(visit);
                    }
                }
            }

            var outsaf = new List<VisitOccurrence>();
            var nch = new List<VisitOccurrence>();
            var dme = new List<VisitOccurrence>();
            foreach (var vo in visitOccurrences)
            {
                if (!vo.EndDate.HasValue)
                    continue;

                if (vo.AdditionalFields["source"] == "medpar")
                    continue;

                var withinMedpar =
                    medpar.Where(
                        v => vo.StartDate.Between(v.StartDate, v.EndDate.Value) ||
                             vo.EndDate.Value.Between(v.StartDate, v.EndDate.Value)).ToList();


                if (vo.AdditionalFields["source"] == "outsaf")
                {
                    //If an OUTSAF claim line start date (CENDD, CENDM, CENDY or FROM_DTD, FROM_DTM, FROM_DTY) or end date (THRU_DTD, THRU_DTM, THRU_DTY) is entirely within MEDPAR admission and 
                    //discharge dates, the claim line should become part of that MEDPAR VISIT_OCCURRENCE . 
                    //If an OUTSAF claim line starts within a MEDPAR visits but ends after the MEDPAR visit then it should become its own visit. The same should be done 
                    //if an OUTSAF claim starts before a MEDPAR visit but ends within it.
                    if (withinMedpar.Count == 0)
                    {
                        outsaf.Add(vo);
                    }
                    else if (withinMedpar.Any(m =>
                        vo.StartDate.Between(m.StartDate, m.EndDate.Value) && vo.EndDate.Value > m.EndDate.Value))
                    {
                        outsaf.Add(vo);
                    }
                    else if (withinMedpar.Any(m =>
                        vo.EndDate.Value.Between(m.StartDate, m.EndDate.Value) && vo.StartDate < m.StartDate))
                    {
                        outsaf.Add(vo);
                    }

                }
                else
                {
                    //After identifying that an NCH or DME claim line should be rolled into a MEDPAR visit, 
                    if (withinMedpar.Count > 0)
                    {
                        //if the MEDPAR claim has SNFIND = ‘N’ it is a SNF visit 
                        if (withinMedpar.Any(v => v.ConceptId == 42898160))
                        {
                            if (vo.AdditionalFields["suitable_for_medpar_n"] == "1"
                            ) //and the NCH or DME variable PLCSRVC must be in (4,31) 
                                continue; //rolled into a MEDPAR visit
                        }
                        else //If the MEDPAR visit has SNFIND other than ‘N’ 
                        {
                            if (vo.AdditionalFields["suitable_for_medpar_others"] == "1"
                            ) //the NCH or DME variable PLCSRVC must be in (3,21,51,52,55,56,61,65) to be rolled into the MEDPAR 
                                continue; //rolled into a MEDPAR visit
                        }
                    }

                    if (vo.AdditionalFields["source"] == "nch")
                    {
                        nch.Add(vo);
                    }
                    else
                    {
                        dme.Add(vo);
                    }
                }
            }

            var outsafER = new List<VisitOccurrence>();
            var outsafOutpatient = new List<VisitOccurrence>();

            //After identifying the stand-alone OUTSAF visits, apply the following logic to determine if it is an ER visit and should be given VISIT_CONCEPT_ID = 9203:
            //If any claim line in the visit has a revenue center code (CENTER) between ‘0450’ and ‘0459’ or ‘0981’ 
            //or if any claim line in the visit has a HCPCS (HCPCS) code of ’99281’, ‘99282’, ‘99283’, ‘99284’, ‘99285’
            foreach (var v in ClenupOutsaf(outsaf))
            {
                if (v.AdditionalFields["center"] == "0450" || v.AdditionalFields["center"] == "0451" ||
                    v.AdditionalFields["center"] == "0452" || v.AdditionalFields["center"] == "0453" ||
                    v.AdditionalFields["center"] == "0454" || v.AdditionalFields["center"] == "0455" ||
                    v.AdditionalFields["center"] == "0456" || v.AdditionalFields["center"] == "0457" ||
                    v.AdditionalFields["center"] == "0458" || v.AdditionalFields["center"] == "0459" ||
                    v.AdditionalFields["center"] == "0981" ||
                    v.AdditionalFields["hcpcs"] == "99281" || v.AdditionalFields["hcpcs"] == "99282" ||
                    v.AdditionalFields["hcpcs"] == "99283" || v.AdditionalFields["hcpcs"] == "99284" ||
                    v.AdditionalFields["hcpcs"] == "99285")
                {
                    v.ConceptId = 9203;
                    outsafER.Add(v);
                    yield return v;
                }
                else // If an OUTSAF visit does not meet the above criteria for an ER visit then it should be given VISIT_CONCEPT_ID = 9202 (Outpatient visit)
                {
                    v.ConceptId = 9202;
                    outsafOutpatient.Add(v);
                    yield return v;
                }
            }

            foreach (var dmeVisit in ClenupDmeAndNch(dme, outsafER.ToArray(), outsafOutpatient.ToArray()))
            {
                dmeVisit.ConceptId = 9202;
                yield return dmeVisit;
            }

            foreach (var nchVisit in ClenupDmeAndNch(nch, outsafER.ToArray(), outsafOutpatient.ToArray()))
            {
                yield return nchVisit;
            }


            foreach (var vo in medpar.Distinct())
            {
                yield return vo;
            }
        }

        private static IEnumerable<VisitOccurrence> ClenupDmeAndNch(IEnumerable<VisitOccurrence> visits,
            VisitOccurrence[] outsafER, VisitOccurrence[] outsafOutpatient)
        {
            foreach (var vo in visits)
            {
                //If the above conditions for an ER visit are met and an NCH or DME claim line 
                //has a start and end date entirely within the OUTSAF claim start and end dates then the NCH or DME 
                //claim line should be rolled into the OUTSAF visit if the NCH or DME variable PLCSRVC is in (23, 41, 42)
                if (vo.AdditionalFields["suitable_for_outsaf_er"] == "1") //PLCSRVC is in (23, 41, 42)
                {
                    if (!outsafER.Any(
                        v =>
                            vo.StartDate.Between(v.StartDate, v.EndDate.Value) &&
                            vo.EndDate.Value.Between(v.StartDate, v.EndDate.Value)))
                    {
                        //If an NCH or DME claim line has a start and end date entirely within a OUTSAF claim but it does not meet the above conditions
                        //If the variable PLCSRVC is in (23, 41, 42) then this should become a separate visit with VISIT_CONCEPT_ID = 9203
                        vo.ConceptId = 9203;
                        yield return vo;
                        continue;
                    }
                }

                //If an OUTSAF visit is given VISIT_CONCEPT_ID = 9202 and an NCH claim line or DME 
                //claim line start and end dates are entirely contained within the OUTSAF visit start and end dates then 
                // the NCH/DME claim should be rolled into the OUTSAF claim if the following conditions are met: 
                // The NCH or DME claim line has PLCSRVC in (5,8,9,22,26,53,54,60,62,71,72) 
                if (vo.AdditionalFields["suitable_for_outsaf_o"] == "1") // PLCSRVC in (5,8,9,22,26,53,54,60,62,71,72) 
                {
                    if (!outsafOutpatient.Any(
                        v =>
                            vo.StartDate.Between(v.StartDate, v.EndDate.Value) &&
                            vo.EndDate.Value.Between(v.StartDate, v.EndDate.Value)))
                    {
                        vo.ConceptId = 9203;
                        yield return vo;
                        continue;
                    }
                }

                yield return vo;
            }
        }

        private static IEnumerable<VisitOccurrence> ClenupOutsaf(IEnumerable<VisitOccurrence> outsaf)
        {
            var visits = new Dictionary<string, bool>();
            foreach (var v in outsaf)
            {
                //Claim lines with CENTER <> ‘0001’ that have the same link_num and the same start and end dates should become one visit. 
                if (v.AdditionalFields["center"] == "0001")
                {
                    yield return v;
                    continue;
                }

                var key = v.SourceValue + ";" + v.StartDate + ";" + v.EndDate;
                if (visits.ContainsKey(key))
                    continue;

                visits.Add(key, false);
                yield return v;
            }
        }

        protected void SetVisitOccurrenceId<T>(IEnumerable<T> inputRecords, VisitOccurrence[] visitOccurrences)
            where T : class, IEntity
        {
            foreach (var entity in inputRecords)
            {
                var visitOccurrence =
                    visitOccurrences.FirstOrDefault(vo =>
                        vo.EndDate.HasValue && entity.StartDate.Between(vo.StartDate, vo.EndDate.Value));
                if (visitOccurrence == null) continue;

                entity.VisitOccurrenceId = visitOccurrence.Id;
            }
        }

        public override IEnumerable<ProcedureOccurrence> BuildProcedureOccurrences(
            ProcedureOccurrence[] procedureOccurrences, Dictionary<long, VisitOccurrence> visitOccurrences,
            ObservationPeriod[] observationPeriods)
        {
            foreach (var po in procedureOccurrences)
            {
                PrepareEntity(po);
            }

            var proc = new Dictionary<ProcedureOccurrence, HashSet<ProcedureCost>>();
            foreach (var po in base.BuildProcedureOccurrences(procedureOccurrences, visitOccurrences,
                observationPeriods))
            {
                if (po.TypeConceptId != 38000215 && po.ProcedureCosts != null)
                    po.ProcedureCosts.Clear();

                if (!proc.ContainsKey(po))
                {
                    proc.Add(po, new HashSet<ProcedureCost>());
                }

                if (po.ProcedureCosts != null && po.ProcedureCosts.Count > 0)
                {
                    foreach (var procedureCost in po.ProcedureCosts)
                    {
                        proc[po].Add(procedureCost);
                    }
                }
            }

            foreach (var p in proc)
            {
                if (p.Key.ProcedureCosts != null && p.Value != null && p.Value.Count > 0)
                {
                    p.Key.ProcedureCosts.Clear();
                    p.Key.ProcedureCosts.AddRange(p.Value);
                }

                yield return p.Key;
            }
        }

        public override IEnumerable<ConditionOccurrence> BuildConditionOccurrences(
            ConditionOccurrence[] conditionOccurrences, Dictionary<long, VisitOccurrence> visitOccurrences,
            ObservationPeriod[] observationPeriods)
        {

            foreach (var co in conditionOccurrences)
            {
                PrepareEntity(co);
            }

            var cond = new HashSet<ConditionOccurrence>();
            foreach (var co in base.BuildConditionOccurrences(conditionOccurrences.ToArray(), visitOccurrences,
                observationPeriods))
            {
                cond.Add(co);
            }

            return cond;
        }

        public override IEnumerable<DeviceExposure> BuildDeviceExposure(DeviceExposure[] devExposure,
            Dictionary<long, VisitOccurrence> visitOccurrences,
            ObservationPeriod[] observationPeriods)
        {
            foreach (var de in devExposure)
            {
                PrepareEntity(de);
            }

            var dev = new Dictionary<DeviceExposure, HashSet<DeviceCost>>();
            foreach (var d in base.BuildDeviceExposure(devExposure, visitOccurrences, observationPeriods))
            {
                if (!dev.ContainsKey(d))
                {
                    dev.Add(d, new HashSet<DeviceCost>());
                }

                if (d.DeviceCosts != null && d.DeviceCosts.Count > 0)
                {
                    foreach (var deviceCost in d.DeviceCosts)
                    {
                        dev[d].Add(deviceCost);
                    }
                }
            }

            foreach (var d in dev)
            {
                if (d.Key.DeviceCosts != null && d.Value != null && d.Value.Count > 0)
                {
                    d.Key.DeviceCosts.Clear();
                    d.Key.DeviceCosts.AddRange(d.Value);
                }

                yield return d.Key;
            }
        }

        private static int GetSurgicalTypeId(IEntity entity)
        {
            var fieldIndex = entity.TypeConceptId.Value - 100;

            if (entity.Domain == "Condition" || entity.Domain == "Observation")
            {
                if (fieldIndex <= 15) //1-15 38000184-38000198
                    return 38000183 + fieldIndex;

                if (fieldIndex <= 20) //16-20 44818709-44818713
                    return 44818693 + fieldIndex;

                return 44818713; //>20 44818713
            }

            if (entity.Domain == "Procedure" || entity.Domain == "Observation")
            {
                if (fieldIndex <= 15) //1-15 38000251-38000265
                    return 38000250 + fieldIndex;

                return 38000265; //>15 38000265
            }

            return 0;
        }

        private static int GetDiagnosisTypeId(IEntity entity)
        {
            var fieldIndex = entity.TypeConceptId.Value;

            if (entity.TypeConceptId == 0)
            {
                if (entity.Domain == "Condition" || entity.Domain == "Observation")
                {
                    if (entity.AdditionalFields["source"] == "dme")
                        return 38000215;

                    if (entity.AdditionalFields["source"] == "nch")
                        return 45756843;
                }

                if (entity.Domain == "Procedure" || entity.Domain == "Observation")
                {
                    return 42865906;
                }
            }

            if (entity.TypeConceptId >= 1 && entity.TypeConceptId <= 25)
            {
                switch (entity.AdditionalFields["source"])
                {
                    case "medpar":
                        if (entity.Domain == "Condition" || entity.Domain == "Observation")
                        {
                            if (fieldIndex <= 15) //1-15 38000200-38000214
                                return 38000199 + fieldIndex;

                            return 38000214; //>15 38000214
                        }

                        if (entity.Domain == "Procedure" || entity.Domain == "Observation")
                        {
                            if (fieldIndex <= 15) //1-15 38000251-38000265
                                return 38000250 + fieldIndex;

                            return 38000265; //>15 38000265
                        }

                        break;

                    case "outsaf":
                    case "dme":
                        if (entity.Domain == "Condition" || entity.Domain == "Observation")
                        {
                            if (fieldIndex <= 15) //1-15 38000230-38000244
                                return 38000229 + fieldIndex;

                            return 38000244; //>15 38000214
                        }

                        if (entity.Domain == "Procedure" || entity.Domain == "Observation")
                        {
                            return 42865906;
                        }

                        break;

                    case "nch":
                        if (entity.Domain == "Condition" || entity.Domain == "Observation")
                        {
                            if (fieldIndex <= 8) //1-8 45756835-45756842
                                return 45756834 + fieldIndex;

                            return 45756842; //>8 45756842
                        }

                        if (entity.Domain == "Procedure" || entity.Domain == "Observation")
                        {
                            return 42865906;
                        }

                        break;
                }

                return 0;
            }

            return entity.TypeConceptId.Value;
        }

        private static void PrepareEntity(IEntity entity)
        {
            //Surgical
            if (entity.TypeConceptId >= 101 && entity.TypeConceptId <= 125)
            {
                var fieldIndex = entity.TypeConceptId - 100;
                DateTime date;
                if (DateTime.TryParse(entity.AdditionalFields["sg_date_" + fieldIndex], out date))
                {
                    entity.StartDate = date;
                    entity.EndDate = date;
                }

                entity.TypeConceptId = GetSurgicalTypeId(entity);
            }
            else if (entity.TypeConceptId >= 0 && entity.TypeConceptId <= 25) //Diagnosis
            {
                if (entity.Domain == "Observation" || entity.Domain == "Measurement")
                {
                    //tmp
                }
                else
                {
                    if (entity.TypeConceptId >= 1 && entity.TypeConceptId <= 12 &&
                        (entity is ConditionOccurrence || entity is DeviceExposure) &&
                        (entity.AdditionalFields["source"] == "dme" || entity.AdditionalFields["source"] == "nch"))
                    {
                        entity.StartDate = DateTime.Parse(entity.AdditionalFields["dgnstartdate"]);
                        entity.EndDate = DateTime.Parse(entity.AdditionalFields["dgnenddate"]);
                    }
                    else if (entity.AdditionalFields["source"] == "outsaf" && entity is ConditionOccurrence)
                    {
                        entity.StartDate = DateTime.Parse(entity.AdditionalFields["conditionstartdate"]);
                        entity.EndDate = DateTime.Parse(entity.AdditionalFields["conditionenddate"]);
                    }
                    else if (entity is ProcedureOccurrence && entity.EndDate.HasValue &&
                             (entity.AdditionalFields["source"] != "medpar" || entity.Domain != "Condition"))
                    {
                        entity.StartDate = entity.EndDate.Value;
                    }
                }

                entity.TypeConceptId = GetDiagnosisTypeId(entity);
            }

            if (entity.Domain == "Device")
            {
                entity.TypeConceptId = 44818705;
            }
        }

        public override IEnumerable<ProcedureCost> BuildProcedureCosts(ProcedureOccurrence[] procedureOccurrences)
        {
            foreach (var po in procedureOccurrences.Where(i => i.ProcedureCosts != null))
            {
                var cost = po.ProcedureCosts.Where(
                    p => p.PaidCopay != null || p.PaidCoinsurance != null || p.PaidTowardDeductible != null ||
                         p.PaidByPayer != null || p.PaidByCoordinationBenefits != null || p.TotalOutOfPocket != null ||
                         p.TotalPaid != null).ToArray();

                if (!cost.Any())
                    po.ProcedureCosts.Clear();

                foreach (var pc in cost)
                {
                    pc.Id = po.Id;
                    pc.TotalPaid = pc.PaidByCoordinationBenefits + pc.TotalOutOfPocket + pc.PaidByPayer;
                    yield return pc;
                }
            }
        }

        public override IEnumerable<DeviceCost> BuildDeviceCosts(DeviceExposure[] deviceExposure)
        {
            foreach (var c in base.BuildDeviceCosts(deviceExposure))
            {
                c.TotalPaid = c.PaidByCoordinationBenefits + c.TotalOutOfPocket + c.PaidByPayer;
                yield return c;
            }
        }

        public override IEnumerable<VisitCost> BuildVisitCosts(VisitOccurrence[] visitOccurrences)
        {
            foreach (var c in base.BuildVisitCosts(visitOccurrences))
            {
                c.TotalPaid = c.PaidByCoordinationBenefits + c.TotalOutOfPocket + c.PaidByPayer;
                yield return c;
            }
        }

        public override Death BuildDeath(Death[] death, Dictionary<long, VisitOccurrence> visitOccurrences,
            ObservationPeriod[] observationPeriods)
        {
            //var ds = Clean(death, observationPeriods).ToList();
            if (death.Any())
            {
                var primary = death.FirstOrDefault(d => d.TypeConceptId == 38003565);
                var secondary = death.FirstOrDefault(d => d.TypeConceptId != 38003565);
                if (primary != null)
                {
                    if (secondary != null)
                    {
                        primary.TypeConceptId = secondary.TypeConceptId;
                    }

                    if (primary.StartDate == DateTime.MinValue)
                    {
                        if (secondary != null)
                        {
                            primary.StartDate = secondary.StartDate;
                        }
                        else if (primary.EndDate.HasValue)
                        {
                            primary.StartDate = primary.EndDate.Value;
                        }
                    }

                    if (observationPeriods.Any(p => primary.StartDate.Between(p.StartDate, p.EndDate.Value)))
                        return primary;
                }

                if (secondary != null &&
                    observationPeriods.Any(p => secondary.StartDate.Between(p.StartDate, p.EndDate.Value)))
                    return secondary;
            }

            return null;
        }

        private static IEnumerable<T> CleanUp<T>(IEnumerable<T> items, IEntity death) where T : IEntity
        {
            if (items == null) yield break;
            foreach (var item in items)
            {
                if (death == null)
                {
                    yield return item;
                }
                else if (item.StartDate < death.StartDate.AddDays(30))
                {
                    yield return item;
                }
            }
        }

        public override IEnumerable<Measurement> BuildMeasurement(Measurement[] measurements,
            Dictionary<long, VisitOccurrence> visitOccurrences,
            ObservationPeriod[] observationPeriods)
        {
            foreach (var m in base.BuildMeasurement(measurements, visitOccurrences, observationPeriods))
            {
                // HGB
                if (m.ConceptId == 30000963 || m.ConceptId == 3009542)
                {
                    if (m.VisitOccurrenceId.HasValue &&
                        visitOccurrences.ContainsKey(m.VisitOccurrenceId.Value))
                    {
                        m.StartDate = visitOccurrences[m.VisitOccurrenceId.Value].StartDate;
                    }
                }

                m.TypeConceptId = 44818702;
                yield return m;
            }
        }

        public override Attrition Build(ChunkData data, KeyMasterOffsetManager om)
        {
            Offset = om;
            ChunkData = data;

            var result = BuildPerson(PersonRecords.ToList());
            var person = result.Key;
            if (person == null)
                return result.Value;

            if (person.YearOfBirth < 1900)
            {
                return Attrition.ImplausibleYOBPast;
            }

            if (person.YearOfBirth > 2015)
            {
                return Attrition.ImplausibleYOBFuture;
            }

            var observationPeriods = BuilObservationPeriods(_payerPlanPeriods, person.PersonId).ToArray();
            if (observationPeriods.Any() &&
                observationPeriods.Any(period => person.YearOfBirth - period.StartDate.Year >= 2))
            {
                return Attrition.ImplausibleYOBPostEarliestOP;
            }

            if (observationPeriods.Any())
            {
                var startDate = observationPeriods.Min(op => op.StartDate);
                foreach (var o in ObservationsRaw)
                {
                    o.StartDate = startDate;
                }
            }
            else if (_payerPlanPeriods.Any())
            {
                var startDate = _payerPlanPeriods.Min(op => op.StartDate);
                foreach (var o in ObservationsRaw)
                {
                    o.StartDate = startDate;
                }
            }

            var death = BuildDeath(DeathRecords.ToArray(), null, observationPeriods);

            var visitIds = new List<long>();
            var visitOccurrences = new Dictionary<long, VisitOccurrence>();
            foreach (var visitOccurrence in CleanUp(BuildVisitOccurrences(VisitOccurrencesRaw.ToArray(), null), death))
            {
                if (visitOccurrence.StartDate.Year < person.YearOfBirth ||
                    visitOccurrence.EndDate.Value.Year < person.YearOfBirth) continue;
                if (visitOccurrence.StartDate.Year == person.YearOfBirth &&
                    visitOccurrence.StartDate.Month < person.MonthOfBirth) continue;
                if (visitOccurrence.EndDate.Value.Year == person.YearOfBirth &&
                    visitOccurrence.EndDate.Value.Month < person.MonthOfBirth) continue;

                visitOccurrence.Id = Offset.GetKeyOffset(visitOccurrence.PersonId).VisitOccurrenceId;
                visitOccurrence.IdUndefined = false;

                visitOccurrences.Add(visitOccurrence.Id, visitOccurrence);
                visitIds.Add(visitOccurrence.Id);
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
                CleanUp(
                    BuildConditionOccurrences(ConditionOccurrencesRaw.ToArray(), visitOccurrences, observationPeriods),
                    death).ToArray();

            var drugExposures =
                CleanUp(BuildDrugExposures(DrugExposuresRaw.ToArray(), visitOccurrences, observationPeriods), death)
                    .ToArray();
            var procedureOccurrences =
                CleanUp(
                    BuildProcedureOccurrences(ProcedureOccurrencesRaw.ToArray(), visitOccurrences, observationPeriods),
                    death).ToArray();
            var observations =
                CleanUp(BuildObservations(ObservationsRaw.ToArray(), visitOccurrences, observationPeriods), death)
                    .ToArray();
            var measurements =
                CleanUp(BuildMeasurement(MeasurementsRaw.ToArray(), visitOccurrences, observationPeriods), death)
                    .ToArray();
            var deviceExposures =
                CleanUp(BuildDeviceExposure(DeviceExposureRaw.ToArray(), visitOccurrences, observationPeriods), death)
                    .ToArray();

            // set corresponding PlanPeriodIds to drug exposure entities and procedure occurrence entities
            SetPayerPlanPeriodId(_payerPlanPeriods.ToArray(), drugExposures, procedureOccurrences,
                visitOccurrences.Values.ToArray(),
                deviceExposures);

            // set corresponding ProviderIds
            SetProviderIds(drugExposures);
            SetProviderIds(deviceExposures);
            SetProviderIds(conditionOccurrences);
            SetProviderIds(procedureOccurrences);
            SetProviderIds(observations);
            SetProviderIds(measurements);


            SetVisitOccurrenceId(conditionOccurrences, visitOccurrences.Values.ToArray());
            SetVisitOccurrenceId(procedureOccurrences, visitOccurrences.Values.ToArray());
            SetVisitOccurrenceId(drugExposures, visitOccurrences.Values.ToArray());
            SetVisitOccurrenceId(deviceExposures, visitOccurrences.Values.ToArray());
            SetVisitOccurrenceId(observations, visitOccurrences.Values.ToArray());
            SetVisitOccurrenceId(measurements, visitOccurrences.Values.ToArray());

            var drugCosts = BuildDrugCosts(drugExposures).ToArray();
            var procedureCosts = BuildProcedureCosts(procedureOccurrences).ToArray();
            var visitCosts = BuildVisitCosts(visitOccurrences.Values.ToArray()).ToArray();
            var devicCosts = BuildDeviceCosts(deviceExposures).ToArray();

            var cohort = BuildCohort(CohortRecords.ToArray(), observationPeriods).ToArray();

            foreach (var cost in visitCosts)
            {
                if (cost.PaidCopay == null && cost.PaidCoinsurance == null && cost.PaidTowardDeductible == null &&
                    cost.PaidByPayer == null && cost.PaidByCoordinationBenefits == null &&
                    cost.TotalOutOfPocket == null &&
                    cost.TotalPaid == null)
                    continue;

                var cost52 = new Cost(cost.PersonId)
                {
                    CostId = Offset.GetKeyOffset(cost.PersonId).VisitCostId,
                    CurrencyConceptId = cost.CurrencyConceptId,
                    Domain = "Visit",
                    EventId = cost.Id,

                    RevenueCodeConceptId = cost.RevenueCodeConceptId,
                    RevenueCodeSourceValue = cost.RevenueCodeSourceValue,
                    PaidByPrimary = cost.PaidByCoordinationBenefits,
                    PaidByPayer = cost.PaidByPayer,
                    PaidPatientDeductible = cost.PaidTowardDeductible,
                    PaidPatientCoinsurance = cost.PaidCoinsurance,
                    DrgConceptId = cost.DrgConceptId,
                    DrgSourceValue = cost.DrgSourceValue,

                    TotalPaid = cost.TotalPaid,
                    PaidByPatient = cost.TotalOutOfPocket
                };

                ChunkData.AddCostData(cost52);
            }

            // push built entities to ChunkBuilder for further save to CDM database
            AddToChunk(person, death, observationPeriods,
                _payerPlanPeriods.ToArray(),
                drugExposures,
                conditionOccurrences,
                procedureOccurrences
                    .Where(p => p.ConceptId > 0 || p.ProcedureCosts != null && p.ProcedureCosts.Count > 0).ToArray(),
                observations, measurements,
                visitOccurrences.Values.ToArray(), null, cohort, deviceExposures, new Note[0]);

            return Attrition.None;
        }

        private static Func<ICostV5, Cost> CostV5ToV51(string domain)
        {
            return v5 => new Cost(v5.PersonId)
            {
                CurrencyConceptId = v5.CurrencyConceptId,
                Domain = domain,

                RevenueCodeConceptId = v5.RevenueCodeConceptId,
                RevenueCodeSourceValue = v5.RevenueCodeSourceValue,
                PaidByPrimary = v5.PaidByCoordinationBenefits,
                PaidByPayer = v5.PaidByPayer,
                PaidPatientDeductible = v5.PaidTowardDeductible,
                PaidPatientCoinsurance = v5.PaidCoinsurance,
                DrgConceptId = v5.DrgConceptId,
                DrgSourceValue = v5.DrgSourceValue,

                PayerPlanPeriodId = v5.PayerPlanPeriodId,

                TotalPaid = v5.TotalPaid,
                PaidByPatient = v5.TotalOutOfPocket
            };
        }

        public override void AddToChunk(Person person, Death death, ObservationPeriod[] observationPeriods,
            PayerPlanPeriod[] ppp,
            DrugExposure[] drugExposures, ConditionOccurrence[] conditionOccurrences,
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

            foreach (var c in cohort)
            {
                ChunkData.AddData(c);
            }

            //foreach (var drugCost in drugCosts)
            //{
            //    //ChunkData.AddData(drugCost);
            //    ChunkData.DrugCost.Add(drugCost);
            //}

            //foreach (var procedureCost in procedureCosts)
            //{
            //    //tmp
            //    //ChunkData.AddData(procedureCost);
            //    ChunkData.ProcedureCost.Add(procedureCost);
            //}

            //foreach (var dc in deviceCost)
            //{
            //    //ChunkData.AddData(dc);
            //    ChunkData.DeviceCost.Add(dc);
            //}

            //foreach (var visitCost in visitCosts)
            //{
            //    //ChunkData.AddData(visitCost);
            //    ChunkData.VisitCost.Add(visitCost);
            //}

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

            foreach (var p in _procedureOccurrence)
            {
                ChunkData.AddData(p);
            }

            foreach (var o in observations)
            {
                ChunkData.AddData(o);
            }

            foreach (var d in devExposure)
            {
                ChunkData.AddData(d);
            }

            foreach (var c in _conditionOccurrence)
            {
                ChunkData.AddData(c);
            }

            foreach (var m in _measurement)
            {
                ChunkData.AddData(m);
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

                            if (_conditionOccurrence.Add(cond))
                                ConditionForEra.Add(cond);
                        }

                        break;

                    case "Measurement":
                        var mes = entity as Measurement ??
                                  new Measurement(entity) { Id = Offset.GetKeyOffset(entity.PersonId).MeasurementId };
                        mes.TypeConceptId = 44818702;
                        _measurement.Add(mes);

                        AddCost(mes.Id, entity, CostV5ToV51("Measurement"));
                        break;

                    case "Meas Value":
                        var mv = entity as Measurement ??
                                 new Measurement(entity) { Id = Offset.GetKeyOffset(entity.PersonId).MeasurementId };
                        _measurement.Add(mv);
                        AddCost(mv.Id, entity, CostV5ToV51("Measurement"));
                        break;

                    case "Observation":
                        var ob = entity as Observation ??
                                 new Observation(entity) { Id = Offset.GetKeyOffset(entity.PersonId).ObservationId };
                        _observation.Add(ob);
                        AddCost(ob.Id, entity, CostV5ToV51("Observation"));
                        break;

                    case "Procedure":
                        {
                            var po = entity as ProcedureOccurrence ??
                                     new ProcedureOccurrence(entity)
                                     {
                                         Id =
                                             Offset.GetKeyOffset(entity.PersonId)
                                                 .ProcedureOccurrenceId
                                     };

                            if (po.ConceptId != 0 || po.ProcedureCosts != null && po.ProcedureCosts.Count != 0)
                                _procedureOccurrence.Add(po);

                            AddCost(po.Id, entity, CostV5ToV51("Procedure"));
                        }
                        break;

                    case "Device":
                        var dev = entity as DeviceExposure ??
                                  new DeviceExposure(entity)
                                  {
                                      Id = Offset.GetKeyOffset(entity.PersonId).DeviceExposureId
                                  };
                        _deviceExposure.Add(dev);
                        AddCost(dev.Id, entity, CostV5ToV51("Device"));
                        break;

                    case "Drug":
                        var drg = entity as DrugExposure ??
                                  new DrugExposure(entity)
                                  {
                                      Id = Offset.GetKeyOffset(entity.PersonId).DrugExposureId
                                  };
                        drg.TypeConceptId = 38000179;
                        DrugForEra.Add(drg);
                        ChunkData.AddData(drg);

                        AddCost(drg.Id, entity, CostV5ToV51("Drug"));
                        break;

                }

                //if (domain == "Procedure" && entityDomain != "Procedure")
                //{
                //   if (entity.AdditionalFields == null || !entity.AdditionalFields.ContainsKey("source") ||
                //       entity.AdditionalFields["source"] != "dme")
                //   {
                //      var po = (ProcedureOccurrence)entity;

                //      if (po.ProcedureCosts != null && po.ProcedureCosts.Count > 0)
                //      {
                //         po.ConceptId = 0;
                //         procedureOccurrence.Add(po);
                //      }
                //   }
                //}

                //if (domain == "Observation" && entityDomain != "Observation")
                //{
                //   var o = (Observation)entity;
                //   o.ConceptId = 0;
                //   observation.Add(o);
                //}
            }
        }

        public override IEnumerable<T> BuildEntities<T>(IEnumerable<T> entitiesToBuild,
            IDictionary<long, VisitOccurrence> visitOccurrences, IEnumerable<ObservationPeriod> observationPeriods, bool withinTheObservationPeriod)
        {
            var uniqueEntities = new HashSet<T>();
            foreach (var e in entitiesToBuild)
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
    }
}
