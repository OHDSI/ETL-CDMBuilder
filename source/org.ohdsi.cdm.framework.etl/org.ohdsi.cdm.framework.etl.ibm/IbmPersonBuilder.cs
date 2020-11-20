﻿using org.ohdsi.cdm.framework.common.Base;
using org.ohdsi.cdm.framework.common.Builder;
using org.ohdsi.cdm.framework.common.Extensions;
using org.ohdsi.cdm.framework.common.Omop;
using org.ohdsi.cdm.framework.common.PregnancyAlgorithm;
using org.ohdsi.cdm.framework.common.Validators;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;

namespace org.ohdsi.cdm.framework.etl.ibm
{
    /// <summary>
    ///  Implementation of PersonBuilder for Truven CCAE/MDCR/MDCD, based on CDM Build spec
    /// </summary>
    public class IbmPersonBuilder : PersonBuilder
    {
        private readonly Dictionary<Guid, VisitOccurrence> _rawVisits = new Dictionary<Guid, VisitOccurrence>();
        private readonly Dictionary<Guid, VisitDetail> _visitDetails = new Dictionary<Guid, VisitDetail>();
        private readonly Dictionary<Guid, List<IEntity>> _medicalRecords = new Dictionary<Guid, List<IEntity>>();

        private readonly Dictionary<string, HashSet<VisitOccurrence>> _caseidVisits =
            new Dictionary<string, HashSet<VisitOccurrence>>();

        private readonly Dictionary<string, HashSet<VisitOccurrence>> _fachidVisits =
            new Dictionary<string, HashSet<VisitOccurrence>>();

        private readonly Dictionary<long, HashSet<DateTime>> _potentialChilds = new Dictionary<long, HashSet<DateTime>>();

        public override string GetFolder()
        {
            return "ETL\\IBM";
        }

        /// <summary>
        /// Projects Enumeration of payerPlanPeriod from the raw set of payerPlanPeriod entities.
        /// </summary>
        /// <param name="payerPlanPeriods">raw set of payerPlanPeriod entities</param>
        /// <param name="visitOccurrences">the visit occurrence entities for current person</param>
        /// <returns>Enumeration of payerPlanPeriod entities</returns>
        public override IEnumerable<PayerPlanPeriod> BuildPayerPlanPeriods(PayerPlanPeriod[] payerPlanPeriods,
            Dictionary<long, VisitOccurrence> visitOccurrences)
        {
            return base.BuildPayerPlanPeriods(CleanPayerPlanPeriods(payerPlanPeriods).ToArray(), visitOccurrences);
        }

        /// <summary>
        /// Projects person etity from the raw set of persons entities. 
        /// </summary>
        /// <param name="records">raw set of Person entities</param>
        /// <returns>Person entity</returns>
        public override KeyValuePair<Person, Attrition> BuildPerson(List<Person> records)
        {
            if (records == null || records.Count == 0)
                return new KeyValuePair<Person, Attrition>(null, Attrition.UnacceptablePatientQuality);

            if (records.All(p => p.GenderConceptId == 8551))
            {
                return new KeyValuePair<Person, Attrition>(null, Attrition.UnknownGender);
            }

            if (records.All(p => p.AdditionalFields["missinginsurance"] == "1"))
            {
                return new KeyValuePair<Person, Attrition>(null, Attrition.MissingInsuranceCoverage);
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
                p.AdditionalFields["missinginsurance"] == "0" &&
                p.YearOfBirth >= 1900 &&
                p.YearOfBirth <= DateTime.Now.Year).ToArray();

            if (filtered.Length == 0)
                return new KeyValuePair<Person, Attrition>(null, Attrition.UnacceptablePatientQuality);

            foreach (var p in filtered)
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

        /// <summary>
        /// Projects death entity from the raw set of death entities.
        /// During build:
        /// override the death's start date using the end date of the corresponding visit.
        /// </summary>
        /// <param name="deathRaw">raw set of death entities</param>
        /// <param name="visitOccurrences">the visit occurrence entities for current person</param>
        /// <param name="observationPeriods">the observation period entities for current person</param>
        /// <returns>death entity</returns>
        public override Death BuildDeath(Death[] deathRaw, Dictionary<long, VisitOccurrence> visitOccurrences,
            ObservationPeriod[] observationPeriods)
        {
            // Filter out death records without visit occurrence and override the death date using the end date of the corresponding visit.
            var death = FilterDeathRecords(deathRaw, visitOccurrences).ToList();

            // Data sources might contain multiple records of death at different dates. 
            // It is the task of the ETL to pick the most plausible or most accurate record to be stored to this table.
            if (death.Any())
            {
                //var maxStartDate = death.Max(d => d.StartDate);

                // Only one record will be kept for each patient. If multiple lines of death records are captured, the death captured by discharge status 
                // has higher priority than those captured by ICD 9 diagnosis codes and the record with latest date of death will be kept.
                //var result = death.Where(d => d.StartDate == maxStartDate).OrderByDescending(d => d.Primary).First();
                var result = death.Where(d => d.Primary).OrderByDescending(d => d.StartDate).FirstOrDefault() ??
                             death.OrderByDescending(d => d.StartDate).First();

                result.CauseConceptId = 0;

                var maxVisitStartDate = visitOccurrences.Values.Max(vo => vo.StartDate);

                // If there are health care visits after 32 days of death date, delete this record
                if (maxVisitStartDate < result.StartDate.AddDays(32))
                {
                    return result;
                }
            }

            return null;
        }

        // Filter out death records without visit occurrence and override the death date using the end date of the corresponding visit.
        private IEnumerable<Death> FilterDeathRecords(IEnumerable<Death> death,
            Dictionary<long, VisitOccurrence> visitOccurrences)
        {
            foreach (var d in JoinVisitOccurrences(death))
            {
                if (!d.VisitOccurrenceId.HasValue || !visitOccurrences.ContainsKey(d.VisitOccurrenceId.Value)) continue;

                var visitOccurrence = visitOccurrences[d.VisitOccurrenceId.Value];

                d.StartDate = visitOccurrence.EndDate.Value;

                if (d.TypeConceptId == 38003568 && !d.StartDate.Between(d.ValidStartDate, d.ValidEndDate))
                {
                    continue;
                }

                yield return d;
            }
        }


        public override bool CanPayerPlanPeriodBeCombined(PayerPlanPeriod current, PayerPlanPeriod other)
        {
            return current.PlanSourceValue == other.PlanSourceValue &&
                   current.PayerSourceValue == other.PayerSourceValue;
        }

        private static IEnumerable<PayerPlanPeriod> CleanPayerPlanPeriods(IList<PayerPlanPeriod> payerPlanPeriods)
        {
            payerPlanPeriods = payerPlanPeriods.OrderBy(p => p.StartDate)
                .ThenBy(p => p.EndDate).ToList();

            for (var i = 0; i < payerPlanPeriods.Count - 1; i++)
            {
                if (payerPlanPeriods[i].EndDate >= payerPlanPeriods[i + 1].StartDate)
                {
                    payerPlanPeriods[i].EndDate = payerPlanPeriods[i + 1].StartDate.AddDays(-1);

                    if (payerPlanPeriods[i].EndDate < payerPlanPeriods[i].StartDate)
                        continue;
                }

                yield return payerPlanPeriods[i];
            }

            yield return payerPlanPeriods.Last();
        }

        // Get corresponding visit occurrence for entity
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

        // Find and assign VisitOccurrenceId to set of entities
        private IEnumerable<T> JoinVisitOccurrences<T>(IEnumerable<T> entities) where T : class, IEntity
        {
            var otherEntities = new List<IEntity>();
            foreach (var entity in entities)
            {
                // IS & OS
                if (entity.AdditionalFields["priority"] == "1")
                {
                    var visitOccurrence = GetVisitOccurrence(entity);
                    if (visitOccurrence == null) continue;

                    entity.VisitOccurrenceId = visitOccurrence.Id;
                    yield return (T)Activator.CreateInstance(typeof(T), entity);
                }
                else // IA & FH
                {
                    otherEntities.Add(entity);
                }
            }

            foreach (var entity in otherEntities)
            {
                var caseidKey = GetCaseidKey(entity);
                var fachidKey = GetFachdidKey(entity);

                if (caseidKey != null) // IA
                {
                    if (!_caseidVisits.ContainsKey(caseidKey)) continue;

                    var visitOccurrence =
                        _caseidVisits[caseidKey].OrderBy(v => v.StartDate).ThenBy(v => v.EndDate).FirstOrDefault();

                    entity.VisitOccurrenceId = visitOccurrence.Id;
                    yield return (T)Activator.CreateInstance(typeof(T), entity);
                }
                else if (fachidKey != null)
                {
                    if (!_fachidVisits.ContainsKey(fachidKey)) continue;

                    var visitOccurrence = (_fachidVisits[fachidKey].Where(fhV => fhV.ConceptId == 9201 && fhV.Id > 0)
                                               .OrderBy(v => v.StartDate).ThenBy(v => v.EndDate).FirstOrDefault() ??
                                           _fachidVisits[fachidKey].Where(fhV => fhV.ConceptId == 9203 && fhV.Id > 0)
                                               .OrderBy(v => v.StartDate).ThenBy(v => v.EndDate).FirstOrDefault()) ??
                                          _fachidVisits[fachidKey].Where(fhV => fhV.ConceptId == 9202 && fhV.Id > 0)
                                              .OrderBy(v => v.StartDate).ThenBy(v => v.EndDate).FirstOrDefault() ??
                                          _fachidVisits[fachidKey].Where(fhV => fhV.ConceptId == 42898160 && fhV.Id > 0)
                                              .OrderBy(v => v.StartDate).ThenBy(v => v.EndDate).FirstOrDefault();

                    if (visitOccurrence == null)
                    {

                        visitOccurrence = (_fachidVisits[fachidKey].Where(fhV => fhV.ConceptId == 9201)
                                               .OrderBy(v => v.StartDate).ThenBy(v => v.EndDate).FirstOrDefault() ??
                                           _fachidVisits[fachidKey].Where(fhV => fhV.ConceptId == 9203)
                                               .OrderBy(v => v.StartDate).ThenBy(v => v.EndDate).FirstOrDefault()) ??
                                          _fachidVisits[fachidKey].Where(fhV => fhV.ConceptId == 9202)
                                              .OrderBy(v => v.StartDate).ThenBy(v => v.EndDate).FirstOrDefault() ??
                                          _fachidVisits[fachidKey].Where(fhV => fhV.ConceptId == 42898160)
                                              .OrderBy(v => v.StartDate).ThenBy(v => v.EndDate).FirstOrDefault();

                        var key = GetFachdidKey(visitOccurrence);

                        if (_fachidVisits.ContainsKey(key))
                        {
                            visitOccurrence = (_fachidVisits[key].Where(fhV => fhV.ConceptId == 9201 && fhV.Id > 0)
                                                   .OrderBy(v => v.StartDate).ThenBy(v => v.EndDate).FirstOrDefault() ??
                                               _fachidVisits[key].Where(fhV => fhV.ConceptId == 9203 && fhV.Id > 0)
                                                   .OrderBy(v => v.StartDate).ThenBy(v => v.EndDate)
                                                   .FirstOrDefault()) ??
                                              _fachidVisits[key].Where(fhV => fhV.ConceptId == 9202 && fhV.Id > 0)
                                                  .OrderBy(v => v.StartDate).ThenBy(v => v.EndDate).FirstOrDefault() ??
                                              _fachidVisits[key].Where(fhV => fhV.ConceptId == 42898160 && fhV.Id > 0)
                                                  .OrderBy(v => v.StartDate).ThenBy(v => v.EndDate).FirstOrDefault();
                        }

                    }

                    entity.VisitOccurrenceId = visitOccurrence.Id;
                    yield return (T)Activator.CreateInstance(typeof(T), entity);
                }
            }
        }

        public static CodeValidator.IcdVer GetIcdVersion(IEntity entity)
        {
            if (!entity.AdditionalFields.ContainsKey("dxver"))
                return CodeValidator.IcdVer.Icd9;

            switch (entity.AdditionalFields["dxver"])
            {
                case "0":
                    return CodeValidator.IcdVer.Icd10;

                case "9":
                    return CodeValidator.IcdVer.Icd9;

                default:
                    return CodeValidator.IcdVer.Icd9;
            }
        }

        /// <summary>
        /// Projects Enumeration of ConditionOccurrence from the raw set of ConditionOccurrence entities. 
        /// 	During build:
        /// 	override the condition's start date using the start date of the corresponding visit.
        ///   overide TypeConceptId per CDM Mapping spec. 
        /// </summary>
        /// <param name="conditionOccurrences">raw set of condition occurrence entities</param>
        /// <param name="vo">the visit occurrence entities for current person</param>
        /// <param name="op">the observation period entities for current person</param>
        /// <returns>Enumeration of condition occurrence entities</returns>
        public override IEnumerable<ConditionOccurrence> BuildConditionOccurrences(
            ConditionOccurrence[] conditionOccurrences, Dictionary<long, VisitOccurrence> vo, ObservationPeriod[] op)
        {
            var filteredConditionOccurrences = new List<ConditionOccurrence>();

            filteredConditionOccurrences.AddRange(conditionOccurrences.Where(
                co => co.AdditionalFields["priority"] == "1" &&
                      CodeValidator.IsValidIcd(co.SourceValue, GetIcdVersion(co))));

            foreach (var sameRow in conditionOccurrences.Where(
                    co => co.AdditionalFields["priority"] == "2" || co.AdditionalFields["priority"] == "3") // I_A + F_H
                .GroupBy(c => c.SourceRecordGuid))
            {
                foreach (var sameSource in sameRow.GroupBy(c => c.SourceValue))
                {
                    var cond = sameSource.Where(c => c.TypeConceptId < 100)
                        .Where(co => CodeValidator.IsValidIcd(co.SourceValue, GetIcdVersion(co))).ToList();

                    var proc = sameSource.Where(c => c.TypeConceptId > 100).ToList();

                    if (cond.Count > 0)
                    {
                        foreach (var co in cond)
                        {
                            var c = co;
                            if (c.ConceptId == 0 && proc.Count > 0)
                            {
                                var po = proc.FirstOrDefault(p =>
                                    p.ConceptId > 0 && p.TypeConceptId - 100 == c.TypeConceptId);
                                filteredConditionOccurrences.Add(po ?? c);
                            }
                            else
                            {
                                filteredConditionOccurrences.Add(c);
                            }
                        }
                    }
                    else if (proc.Count > 0)
                    {
                        filteredConditionOccurrences.AddRange(proc);
                    }
                }
            }

            var result = new HashSet<ConditionOccurrence>();
            foreach (var sameVisit in JoinVisitOccurrences(filteredConditionOccurrences)
                .GroupBy(c => c.VisitOccurrenceId))
            {
                foreach (var sameSource in sameVisit.GroupBy(c => c.SourceValue))
                {
                    foreach (var sameConcept in sameSource.GroupBy(c => c.ConceptId))
                    {
                        var co = sameConcept.OrderBy(c => c.AdditionalFields["priority"])
                            .ThenBy(c => c.TypeConceptId)
                            .First();

                        var visitOccurrence = vo[co.VisitOccurrenceId.Value];

                        co.EndDate = null;

                        if (co.AdditionalFields["priority"] != "1") // HIX-1274
                        {
                            co.StartDate = visitOccurrence.StartDate;
                        }

                        co.TypeConceptId = GetConditionTypeConceptId(co, visitOccurrence.ConceptId);
                        co.ProviderKey = GetProviderKey(visitOccurrence);


                        //co.SourceConceptId = co.ConceptId;

                        result.Add(co);
                    }
                }
            }

            return base.BuildConditionOccurrences(result.ToArray(), vo, op);
        }

        /// <summary>
        /// Projects Enumeration of ProcedureOccurrence from the raw set of ProcedureOccurence entities.
        /// During build:
        /// override the procedure's start date using the end date of the corresponding visit.
        /// overide TypeConceptId per CDM Mapping spec.
        /// truncate procedure's dates to the corresponding observation period dates
        /// </summary>
        /// <param name="procedureOccurrences">raw set of procedure occurrence entities</param>
        /// <param name="vo">the visit occurrence entities for current person</param>
        /// <param name="observationPeriods">the observation period entities for current person</param>
        /// <returns>Enumeration of procedure occurrence entities</returns>
        public override IEnumerable<ProcedureOccurrence> BuildProcedureOccurrences(
            ProcedureOccurrence[] procedureOccurrences, Dictionary<long, VisitOccurrence> vo,
            ObservationPeriod[] observationPeriods)
        {
            var result = new HashSet<ProcedureOccurrence>();
            var procedures = new List<ProcedureOccurrence>();

            var proc = JoinVisitOccurrences(procedureOccurrences).ToList();

            foreach (var po in proc)
            {
                var visitOccurrence = vo[po.VisitOccurrenceId.Value];

                if (po.AdditionalFields["priority"] != "1")
                {
                    if (string.IsNullOrEmpty(po.SourceValue)) continue;

                    po.StartDate = visitOccurrence.EndDate.Value;
                }
                else
                {
                    TruncateDatesToObservationPeriod(observationPeriods, po);
                }

                po.VisitOccurrenceId = visitOccurrence.Id;

                procedures.Add(po);
            }

            foreach (var sameVisit in procedures.GroupBy(c => c.VisitOccurrenceId))
            {
                foreach (var sameStartDate in sameVisit.GroupBy(c => c.StartDate))
                {
                    foreach (var sameSource in sameStartDate.GroupBy(c => c.SourceValue))
                    {
                        foreach (var sameConcept in sameSource.GroupBy(c => c.ConceptId))
                        {
                            var grouped = sameConcept.OrderBy(c => c.AdditionalFields["priority"])
                                .ThenBy(c => c.TypeConceptId).ToArray();
                            var po = grouped.First();

                            var visitOccurrence = vo[po.VisitOccurrenceId.Value];


                            // provid in CCAE/MDCR is int & in MDCD is string
                            var isCcae = po.AdditionalFields["vendor"] != "mdcd";


                            if (po.AdditionalFields["priority"] == "1")
                            {
                                //DX1, PROVID and STDPROV
                                ProcedureOccurrence first;

                                if (isCcae)
                                {
                                    first = grouped.Where(e => e.AdditionalFields["priority"] == "1")
                                        .OrderBy(e => e.AdditionalFields["dx1"])
                                        .ThenBy(
                                            e =>
                                                string.IsNullOrEmpty(e.AdditionalFields["provid"])
                                                    ? 0
                                                    : int.Parse(e.AdditionalFields["provid"]))
                                        .ThenBy(
                                            e =>
                                                string.IsNullOrEmpty(e.AdditionalFields["stdprov"])
                                                    ? 0
                                                    : int.Parse(e.AdditionalFields["stdprov"])).First();
                                }
                                else
                                {
                                    first = grouped.Where(e => e.AdditionalFields["priority"] == "1")
                                        .OrderBy(e => e.AdditionalFields["dx1"])
                                        .ThenBy(e => e.AdditionalFields["provid"].ToLower())
                                        .ThenBy(
                                            e =>
                                                string.IsNullOrEmpty(e.AdditionalFields["stdprov"])
                                                    ? 0
                                                    : int.Parse(e.AdditionalFields["stdprov"])).First();
                                }

                                po.ProviderKey = first.ProviderKey;

                                var costs = new List<ProcedureCost>();
                                foreach (
                                    var procedureOccurrence in
                                    grouped.Where(procedureOccurrence => procedureOccurrence.ProcedureCosts != null))
                                {
                                    costs.AddRange(procedureOccurrence.ProcedureCosts);
                                }

                                po.ProcedureCosts = costs;
                            }
                            else
                            {
                                po.ProviderKey = GetProviderKey(visitOccurrence);
                            }


                            po.EndDate = null;
                            po.TypeConceptId = GetProcedureTypeConceptId(po, visitOccurrence.ConceptId);
                            result.Add(po);
                        }
                    }
                }
            }

            return base.BuildProcedureOccurrences(result.ToArray(), vo, observationPeriods);
        }

        /// <summary>
        /// Projects Enumeration of procedure cost from the set of procedure occurrence entities.
        /// During build:
        /// override the procedure cost Id to the corresponding procedure occurrence Id
        /// calculate TotalOutOfPocket & TotalPaid per CDM Mapping spec. 
        /// </summary>
        /// <param name="procedureOccurrences">set of procedure occurrence entities</param>
        /// <returns>set of procedure cost entities</returns>
        public override IEnumerable<ProcedureCost> BuildProcedureCosts(ProcedureOccurrence[] procedureOccurrences)
        {
            foreach (var procedureOccurrence in procedureOccurrences)
            {
                if (procedureOccurrence.ProcedureCosts == null) continue;

                foreach (var procedureCost in procedureOccurrence.ProcedureCosts)
                {
                    procedureCost.Id = procedureOccurrence.Id;
                    //TOTAL_OUT_OF_POCKET = PAID_COPAY + PAID_COINSURANCE + PAID_TOWARDS_DEDUCTIBLE 
                    procedureCost.TotalOutOfPocket = procedureCost.PaidCopay + procedureCost.PaidCoinsurance +
                                                     procedureCost.PaidTowardDeductible;

                    //TOTAL_PAID = TOTAL_OUT_OF_POCKET + NETPAY + COB
                    procedureCost.TotalPaid = procedureCost.TotalOutOfPocket + procedureCost.PaidByPayer +
                                              procedureCost.PaidByCoordinationBenefits;

                    yield return procedureCost;
                }
            }
        }

        private static int GetProcedureTypeConceptId(IEntity e, long visitTypeId)
        {
            if (e.AdditionalFields["priority"] == "1") // IS OS
            {
                return visitTypeId == 9201 ? 38000249 : 38000267;
            }

            if (visitTypeId == 9201)
            {
                switch (e.TypeConceptId)
                {
                    case 1:
                        return 38000250;

                    case 2:
                        return 38000251;

                    case 3:
                        return 38000252;

                    case 4:
                        return 38000253;

                    case 5:
                        return 38000254;

                    case 6:
                        return 38000255;

                    case 7:
                        return 38000256;

                    case 8:
                        return 38000257;

                    case 9:
                        return 38000258;

                    case 10:
                        return 38000259;

                    case 11:
                        return 38000260;

                    case 12:
                        return 38000261;

                    case 13:
                        return 38000262;

                    case 14:
                        return 38000263;

                    case 15:
                        return 38000264;

                    case 16:
                        return 38000265;

                    default:
                        return 0;
                }
            }

            switch (e.TypeConceptId)
            {
                case 2:
                    return 38000269;

                case 3:
                    return 38000270;

                case 4:
                    return 38000271;

                case 5:
                    return 38000272;

                case 6:
                    return 38000273;

                case 7:
                    return 38000274;

                default:
                    return 0;
            }
        }



        private string GetProviderKey(VisitOccurrence vo)
        {
            var isCcae = vo.AdditionalFields["vendor"] != "mdcd";

            IEntity result;
            if (vo.ConceptId == 9202)
            {
                if (isCcae)
                {
                    result = _medicalRecords[vo.SourceRecordGuid].Where(e => e.ConceptId == vo.ConceptId)
                        .OrderBy(e =>
                            DateTime.ParseExact(e.AdditionalFields["start"], "dd/MM/yyyy",
                                CultureInfo.InvariantCulture))
                        .ThenBy(e =>
                            string.IsNullOrEmpty(e.AdditionalFields["provid"])
                                ? 0
                                : int.Parse(e.AdditionalFields["provid"]))
                        .ThenBy(e =>
                            DateTime.ParseExact(e.AdditionalFields["end"], "dd/MM/yyyy", CultureInfo.InvariantCulture))
                        .ThenBy(e =>
                            string.IsNullOrEmpty(e.AdditionalFields["stdprov"])
                                ? 0
                                : int.Parse(e.AdditionalFields["stdprov"]))
                        .First();
                }
                else
                {
                    result = _medicalRecords[vo.SourceRecordGuid].Where(e => e.ConceptId == vo.ConceptId)
                        .OrderBy(e =>
                            DateTime.ParseExact(e.AdditionalFields["start"], "dd/MM/yyyy",
                                CultureInfo.InvariantCulture))
                        .ThenBy(e => e.AdditionalFields["provid"].ToLower())
                        .ThenBy(e =>
                            DateTime.ParseExact(e.AdditionalFields["end"], "dd/MM/yyyy", CultureInfo.InvariantCulture))
                        .ThenBy(e =>
                            string.IsNullOrEmpty(e.AdditionalFields["stdprov"])
                                ? 0
                                : int.Parse(e.AdditionalFields["stdprov"]))
                        .First();
                }
            }
            else
            {
                if (isCcae)
                {

                    result = _medicalRecords[vo.SourceRecordGuid].Where(e => e.ConceptId == vo.ConceptId)
                        .OrderBy(e =>
                            DateTime.ParseExact(e.AdditionalFields["start"], "dd/MM/yyyy",
                                CultureInfo.InvariantCulture))
                        .ThenBy(e =>
                            DateTime.ParseExact(e.AdditionalFields["end"], "dd/MM/yyyy", CultureInfo.InvariantCulture))
                        .ThenBy(e =>
                            string.IsNullOrEmpty(e.AdditionalFields["provid"])
                                ? 0
                                : int.Parse(e.AdditionalFields["provid"]))
                        .ThenBy(e =>
                            string.IsNullOrEmpty(e.AdditionalFields["stdprov"])
                                ? 0
                                : int.Parse(e.AdditionalFields["stdprov"]))
                        .First();
                }
                else
                {
                    result = _medicalRecords[vo.SourceRecordGuid].Where(e => e.ConceptId == vo.ConceptId)
                        .OrderBy(e =>
                            DateTime.ParseExact(e.AdditionalFields["start"], "dd/MM/yyyy",
                                CultureInfo.InvariantCulture))
                        .ThenBy(e =>
                            DateTime.ParseExact(e.AdditionalFields["end"], "dd/MM/yyyy", CultureInfo.InvariantCulture))
                        .ThenBy(e => e.AdditionalFields["provid"].ToLower())
                        .ThenBy(e =>
                            string.IsNullOrEmpty(e.AdditionalFields["stdprov"])
                                ? 0
                                : int.Parse(e.AdditionalFields["stdprov"]))
                        .First();
                }
            }

            return result.ProviderKey;
        }

        private static int GetConditionTypeConceptId(IEntity e, long visitTypeId)
        {
            var typeConceptId = e.TypeConceptId;
            if (typeConceptId > 100)
            {
                typeConceptId = typeConceptId - 100;
            }

            if (e.AdditionalFields["priority"] == "1") //IS OS
            {
                if (visitTypeId == 9201)
                {
                    switch (typeConceptId)
                    {
                        case 0:
                            return 38000183;

                        case 1:
                            return 38000184;

                        case 2:
                            return 38000185;

                        case 3:
                            return 38000186;

                        case 4:
                            return 38000187;

                        case 5:
                            return 38000188;

                        default:
                            return 0;
                    }
                }

                switch (typeConceptId)
                {
                    case 0:
                        return 38000215;

                    case 1:
                        return 38000215;

                    case 2:
                        return 38000216;

                    case 3:
                        return 38000217;

                    case 4:
                        return 38000218;

                    case 5:
                        return 38000219;

                    default:
                        return 0;
                }
            }

            if (visitTypeId == 9201)
            {
                switch (typeConceptId)
                {
                    case 1:
                        return 38000199;

                    case 2:
                        return 38000200;

                    case 3:
                        return 38000201;

                    case 4:
                        return 38000202;

                    case 5:
                        return 38000203;

                    case 6:
                        return 38000204;

                    case 7:
                        return 38000205;

                    case 8:
                        return 38000206;

                    case 9:
                        return 38000207;

                    case 10:
                        return 38000208;

                    case 11:
                        return 38000209;

                    case 12:
                        return 38000210;

                    case 13:
                        return 38000211;

                    case 14:
                        return 38000212;

                    case 15:
                        return 38000213;

                    case 16:
                        return 38000214;

                    default:
                        return 0;
                }
            }

            switch (typeConceptId)
            {
                case 2:
                    return 38000230;

                case 3:
                    return 38000231;

                case 4:
                    return 38000232;

                case 5:
                    return 38000233;

                case 6:
                    return 38000234;

                case 7:
                    return 38000235;

                case 8:
                    return 38000236;

                case 9:
                    return 38000237;

                case 10:
                    return 38000238;

                default:
                    return 0;
            }
        }

        public override IEnumerable<Observation> BuildObservations(Observation[] observations,
            Dictionary<long, VisitOccurrence> visitOccurrences,
            ObservationPeriod[] observationPeriods)
        {
            var dstatusObservations = new HashSet<Observation>();
            var otherObservations = new List<Observation>();
            foreach (var o in observations)
            {
                if (o.ConceptId == 4202605 && o.TypeConceptId == 38000280)
                    dstatusObservations.Add(o);
                else
                    otherObservations.Add(o);
            }

            foreach (var dsObservation in JoinVisitOccurrences(dstatusObservations))
            {
                if (!dsObservation.VisitOccurrenceId.HasValue) continue;

                var visitOccurrence = visitOccurrences[dsObservation.VisitOccurrenceId.Value];

                dsObservation.StartDate = visitOccurrence.EndDate.Value;
                dsObservation.VisitOccurrenceId = visitOccurrence.Id;

                yield return dsObservation;
            }

            foreach (var o in otherObservations)
            {
                yield return o;
            }
        }

        public override IEnumerable<VisitDetail> BuildVisitDetails(VisitDetail[] visitDetails, VisitOccurrence[] visitOccurrences, ObservationPeriod[] observationPeriods)
        {
            HashSet<VisitDetail> details = new HashSet<VisitDetail>();
            foreach (var visitOccurrence in visitOccurrences)
            {
                if (visitOccurrence.ConceptId == 1) continue;

                var visitDetail =
                    new VisitDetail(visitOccurrence)
                    {
                        DischargeToConceptId = visitOccurrence.DischargeToConceptId,
                        DischargeToSourceValue = visitOccurrence.DischargeToSourceValue
                    };

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

        /// <summary>
        /// Build person entity and all person related entities like: DrugExposures, ConditionOccurrences, ProcedureOccurrences... from raw data sets 
        /// </summary>
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
                BuildObservationPeriods(person.ObservationPeriodGap,
                        ObservationPeriodsRaw.Where(p => p.AdditionalFields["missinginsurance"] == "0").ToArray())
                    .ToArray();

            if (Excluded(person, observationPeriods))
            {
                Complete = true;
                return Attrition.ImplausibleYOBPostEarliestOP;
            }

            var fisrtOp = observationPeriods.Min(op => op.StartDate);
            if (fisrtOp.Year == person.YearOfBirth)
            {
                person.MonthOfBirth = fisrtOp.Month;
                person.DayOfBirth = fisrtOp.Day;
            }
            else
            {
                person.MonthOfBirth = null;
                person.DayOfBirth = null;
            }

            var payerPlanPeriods = BuildPayerPlanPeriods(PayerPlanPeriodsRaw.ToArray(), null).ToArray();

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

                visitOccurrences.Add(visitOccurrence.Id, visitOccurrence);
                visitIds.Add(visitOccurrence.Id);
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
                if (!IsCpt4(procedureOccurrence.SourceValue))
                {
                    procedureOccurrence.ModifierConceptId = 0;
                }
            }

            var observations = BuildObservations(ObservationsRaw.ToArray(), visitOccurrences, observationPeriods)
                .ToArray();
            foreach (var ob in observations)
            {
                ob.Id = Offset.GetKeyOffset(ob.PersonId).ObservationId;
            }


            var drugExposures =
                BuildDrugExposure(DrugExposuresRaw, procedureOccurrences, visitOccurrences, observationPeriods)
                    .ToArray();
            var measurements = BuildMeasurement(MeasurementsRaw.ToArray(), visitOccurrences, observationPeriods)
                .ToArray();
            var deviceExposure = BuildDeviceExposure(DeviceExposureRaw.ToArray(), visitOccurrences, observationPeriods)
                .ToArray();

            foreach (var de in deviceExposure)
            {
                de.Quantity = 1;
            }

            // set corresponding PlanPeriodIds to drug exposure entities and procedure occurrence entities
            SetPayerPlanPeriodId(payerPlanPeriods, drugExposures, procedureOccurrences,
                visitOccurrences.Values.ToArray(), deviceExposure);

            // set corresponding ProviderIds
            SetProviderIds(drugExposures);
            SetProviderIds(conditionOccurrences);
            SetProviderIds(visitOccurrences.Values.ToArray());
            SetProviderIds(procedureOccurrences);
            SetProviderIds(observations);
            SetProviderIds(visitDetails);

            var death = BuildDeath(DeathRecords.ToArray(), visitOccurrences, observationPeriods);
            var drugCosts = BuildDrugCosts(drugExposures).ToArray();
            var procedureCosts = BuildProcedureCosts(procedureOccurrences).ToArray();
            var devicCosts = BuildDeviceCosts(deviceExposure).ToArray();
            var visitCosts = BuildVisitCosts(visitOccurrences.Values.Where(v => v.ConceptId != 1).ToArray()).ToArray();


            if (death != null)
            {
                death = CleanUpDeath(visitOccurrences.Values, death);
                death = CleanUpDeath(drugExposures, death);
                death = CleanUpDeath(conditionOccurrences, death);
                death = CleanUpDeath(procedureOccurrences, death);
                death = CleanUpDeath(measurements, death);
                death = CleanUpDeath(observations.Where(ob => ob.ConceptId != 900000010), death);
                death = CleanUpDeath(deviceExposure, death);
            }

            foreach (var cost in visitCosts)
            {
                var c = cost.CreateCost(Offset.GetKeyOffset(cost.PersonId).VisitCostId);
                c.TypeId = 31968;
                ChunkData.AddCostData(c);
            }

            // push built entities to ChunkBuilder for further save to CDM database
            AddToChunk(person, death,
                observationPeriods,
                payerPlanPeriods,
                drugExposures,
                conditionOccurrences,
                procedureOccurrences,
                observations,
                measurements,
                visitOccurrences.Values.ToArray(), visitDetails, new Cohort[0], deviceExposure, new Note[0]);

            Complete = true;

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
                                //ChunkData.FactRelationships.Add(new FactRelationship
                                //{
                                //    DomainConceptId1 = 56,
                                //    DomainConceptId2 = 56,
                                //    FactId1 = childId,
                                //    FactId2 = episode.PersonId,
                                //    RelationshipConceptId = 40485452
                                //});
                                break;
                            }
                        }

                    }
                }
            }

            return Attrition.None;
        }

        private long? GetVisitDetailId(IEntity ent)
        {
            if (_visitDetails.ContainsKey(ent.SourceRecordGuid))
                return _visitDetails[ent.SourceRecordGuid].Id;

            return null;
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

                            if (cond.TypeConceptId == 44786633 || cond.TypeConceptId == 44786634) //HRA
                            {
                                cond.EndDate = null; //HIX-1299
                            }

                            cond.VisitDetailId = GetVisitDetailId(cond);

                            ConditionForEra.Add(cond);
                            ChunkData.AddData(cond);
                        }

                        break;

                    case "Measurement":
                        var mes = entity as Measurement ??
                                  new Measurement(entity)
                                  {
                                      Id = Offset.GetKeyOffset(entity.PersonId).MeasurementId
                                  };

                        // HIX-1418
                        if (mes.TypeConceptId == 44818702 && mes.ValueAsNumber.HasValue && mes.ValueAsNumber > 100000 &&
                            mes.UnitConceptId == 8739 && (mes.SourceValue == "3142-7" ||
                                                          mes.SourceValue == "29463-7" || mes.SourceValue == "3141-9"))
                        {
                            mes.ValueAsNumber = mes.ValueAsNumber.Value / 10000;
                        }

                        mes.VisitDetailId = GetVisitDetailId(mes);
                        ChunkData.AddData(mes);
                        AddCost(mes.Id, entity, CostV5ToV51("Measurement"));
                        break;

                    case "Meas Value":
                        var mv = entity as Measurement ??
                                 new Measurement(entity)
                                 {
                                     Id = Offset.GetKeyOffset(entity.PersonId).MeasurementId
                                 };

                        mv.VisitDetailId = GetVisitDetailId(mv);
                        ChunkData.AddData(mv);

                        AddCost(mv.Id, entity, CostV5ToV51("Measurement"));
                        break;

                    case "Observation":
                        var obser = entity as Observation ??
                                    new Observation(entity)
                                    {
                                        Id = Offset.GetKeyOffset(entity.PersonId).ObservationId
                                    };

                        obser.VisitDetailId = GetVisitDetailId(obser);
                        ChunkData.AddData(obser);
                        AddCost(obser.Id, entity, CostV5ToV51("Observation"));
                        break;

                    case "Procedure":
                        var p = entity as ProcedureOccurrence ??
                                new ProcedureOccurrence(entity)
                                {
                                    Id =
                                        Offset.GetKeyOffset(entity.PersonId).ProcedureOccurrenceId
                                };

                        if (!IsCpt4(p.SourceValue))
                        {
                            p.ModifierConceptId = 0;
                        }

                        p.VisitDetailId = GetVisitDetailId(p);
                        var costDataExists = AddCost(p.Id, entity, CostV5ToV51("Procedure"));
                        if (costDataExists || !string.IsNullOrEmpty(p.SourceValue))
                            ChunkData.AddData(p);
                        break;

                    case "Device":
                        var dev = entity as DeviceExposure ??
                                  new DeviceExposure(entity)
                                  {
                                      Id = Offset.GetKeyOffset(entity.PersonId).DeviceExposureId
                                  };

                        dev.VisitDetailId = GetVisitDetailId(dev);
                        ChunkData.AddData(dev);
                        AddCost(dev.Id, entity, CostV5ToV51("Device"));
                        break;

                    case "Drug":
                        var drg = entity as DrugExposure ??
                                  new DrugExposure(entity)
                                  {
                                      Id = Offset.GetKeyOffset(entity.PersonId).DrugExposureId
                                  };

                        if (!drg.EndDate.HasValue)
                        {
                            drg.EndDate = drg.StartDate;
                        }

                        drg.VisitDetailId = GetVisitDetailId(drg);
                        DrugForEra.Add(drg);
                        ChunkData.AddData(drg);

                        AddCost(drg.Id, entity, CostV5ToV51("Drug"));

                        break;

                }
            }
        }


        private static Func<ICostV5, Cost> CostV5ToV51(string domain)
        {
            return v5 => new Cost(v5.PersonId)
            {
                CurrencyConceptId = v5.CurrencyConceptId,
                TotalCharge = null,
                TotalCost = v5.AverageWholesalePrice,
                RevenueCodeConceptId = v5.RevenueCodeConceptId,
                RevenueCodeSourceValue = v5.RevenueCodeSourceValue,

                PayerPlanPeriodId = v5.PayerPlanPeriodId,

                PaidPatientCopay = v5.PaidCopay,
                PaidPatientCoinsurance = v5.PaidCoinsurance,
                PaidPatientDeductible = v5.PaidTowardDeductible,
                PaidByPrimary = v5.PaidByCoordinationBenefits,

                DrgConceptId = v5.DrgConceptId ?? 0,
                DrgSourceValue = v5.DrgSourceValue,

                TotalPaid =
                    v5.PaidCopay + v5.PaidCoinsurance + v5.PaidTowardDeductible + v5.PaidByPayer +
                    v5.PaidByCoordinationBenefits,
                PaidByPatient = v5.PaidCopay + v5.PaidCoinsurance + v5.PaidTowardDeductible,
                PaidByPayer = v5.PaidByPayer,

                PaidIngredientCost = v5.IngredientCost,
                PaidDispensingFee = v5.DispensingFee,

                Domain = domain,
                TypeId = 31968
            };
        }

        private static bool IsCpt4(string code)
        {
            if (string.IsNullOrEmpty(code))
                return false;
            return code.Length == 5 && char.IsDigit(code[0]);
        }

        private static Death CleanUpDeath(IEnumerable<IEntity> items, Death death)
        {
            if (death == null) return null;

            return items.Any(item => item.StartDate > death.StartDate.AddDays(30)) ? null : death;
        }

        /// <summary>
        /// 	Projects Enumeration of drug exposure from the raw set of drug exposure & procedure occurrence entities. 
        /// 	During build:
        ///	overide TypeConceptId per CDM Mapping spec. 
        /// </summary>
        /// <param name="drugExposure">raw set of drug exposures entities</param>
        /// <param name="procedureOccurrence">set of procedure occurrence entities</param>
        /// <param name="visitOccurrences">the visit occurrences entities for current person</param>
        /// <param name="observationPeriods">the observation periods entities for current person</param>
        /// <returns>Enumeration of drug exposure entities</returns>
        private IEnumerable<DrugExposure> BuildDrugExposure(IEnumerable<DrugExposure> drugExposure,
            IEnumerable<ProcedureOccurrence> procedureOccurrence, Dictionary<long, VisitOccurrence> visitOccurrences,
            ObservationPeriod[] observationPeriods)
        {
            var drugs = new Dictionary<Guid, List<DrugExposure>>();
            var drugClaims = new Dictionary<Guid, List<DrugExposure>>();

            foreach (var de in drugExposure)
            {
                // 38000175 (Prescription dispensed in pharmacy
                // 38000176 (Prescription dispensed through mail order)
                if (de.TypeConceptId == 38000175 || de.TypeConceptId == 38000176)
                {
                    if (!drugClaims.ContainsKey(de.SourceRecordGuid))
                        drugClaims.Add(de.SourceRecordGuid, new List<DrugExposure>());

                    drugClaims[de.SourceRecordGuid].Add(de);
                    continue;
                }

                if (!drugs.ContainsKey(de.SourceRecordGuid))
                    drugs.Add(de.SourceRecordGuid, new List<DrugExposure>());

                drugs[de.SourceRecordGuid].Add(de);
            }

            // Create drug exposure entities from procedure occurrence
            foreach (var po in procedureOccurrence)
            {
                if (!drugs.ContainsKey(po.SourceRecordGuid)) continue;

                var de = drugs[po.SourceRecordGuid].FirstOrDefault(d => d.SourceValue == po.SourceValue);
                if (de == null) continue;
                if (de.ConceptId > 0)
                {
                    de.StartDate = po.StartDate;
                    de.EndDate = null;
                    de.ProviderKey = po.ProviderKey;
                    de.VisitOccurrenceId = po.VisitOccurrenceId;

                    de.Refills = null;

                    // overide procedure occurrence TypeConceptId to the corresponding drug exposures TypeConceptId per CDM Mapping spec
                    if (po.TypeConceptId >= 38000249 && po.TypeConceptId <= 38000265)
                        de.TypeConceptId = 38000180; // Inpatient administration
                    else
                        de.TypeConceptId = 38000179; // Physician administered drug (identified as procedure)

                    yield return de;
                }
            }

            // Remove duplicate drug claim records as well as eliminate drug claims that have been administratively backed 
            // out with negative values and apply base logic for drug claims records
            foreach (var de in BuildDrugExposures(FilteroutDrugClaims(drugClaims).ToArray(), visitOccurrences,
                observationPeriods))
            {
                yield return de;
            }
        }


        /// <summary>
        /// Remove duplicate drug claim records as well as eliminate drug claims that have been administratively backed out with negative values
        /// </summary>
        /// <param name="drugClaims">set of drug exposure entities</param>
        /// <returns>Enumeration of filtired drug exposure entities</returns>
        private static IEnumerable<DrugExposure> FilteroutDrugClaims(Dictionary<Guid, List<DrugExposure>> drugClaims)
        {
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

        /// <summary>
        /// Projects Enumeration of Visit Occurrence from the raw set of Visit Occurrence entities. 
        ///  </summary>
        /// <param name="rawVisitOccurrences">raw set of Visit Occurrence entities</param>
        /// <param name="observationPeriods">the observation periods entities for current person</param>
        /// <returns>Enumeration of Visit Occurrence</returns>
        public override IEnumerable<VisitOccurrence> BuildVisitOccurrences(VisitOccurrence[] rawVisitOccurrences,
            ObservationPeriod[] observationPeriods)
        {
            var visitsCost = new Dictionary<string, List<VisitCost>>();
            foreach (var vo in rawVisitOccurrences.Where(vo =>
                vo.ConceptId == 1 && vo.VisitCosts != null && vo.VisitCosts.Count > 0))
            {
                var key = GetCaseidKey(vo);
                if (!visitsCost.ContainsKey(key))
                    visitsCost.Add(key, new List<VisitCost>());

                visitsCost[key].AddRange(vo.VisitCosts);
            }

            foreach (var vo in PrepareVisitOccurrences(rawVisitOccurrences.Where(vo => vo.ConceptId != 1).ToArray(),
                observationPeriods))
            {
                vo.ProviderKey = GetProviderKey(vo);
                var caseidKey = GetCaseidKey(vo);
                if (vo.ConceptId == 9201 && caseidKey != null && visitsCost.ContainsKey(caseidKey))
                {
                    vo.VisitCosts = new List<VisitCost>();
                    vo.VisitCosts.AddRange(visitsCost[caseidKey]);
                }

                yield return vo;
            }
        }

        private IEnumerable<VisitOccurrence> PrepareVisitOccurrences(VisitOccurrence[] rawVisitOccurrences,
            ObservationPeriod[] observationPeriods)
        {
            var visitOccurrences = CleanVisitOccurrences(rawVisitOccurrences, observationPeriods).ToList();

            var ipVisits = CollapseVisits(visitOccurrences.Where(vo => vo.ConceptId == 9201)).ToList();
            var erVisits = new List<VisitOccurrence>();
            var opVisits = new List<VisitOccurrence>();

            var ltcpVisits = CollapseLtcpVisits(visitOccurrences.Where(vo => vo.ConceptId == 42898160)).ToList();

            foreach (
                var visitOccurrence in
                visitOccurrences.Where(
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
                TruncateDatesToObservationPeriod(observationPeriods, ltcpVisit);
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
                foreach (var opGroup1 in opGroup.GroupBy(v => v.AdditionalFields["provid"].ToLower()))
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

        private static void TruncateDatesToObservationPeriod(IEnumerable<ObservationPeriod> observationPeriods,
            IEntity entity)
        {
            if (!entity.EndDate.HasValue)
                entity.EndDate = entity.StartDate;
            else if (entity.StartDate > entity.EndDate)
                entity.EndDate = entity.StartDate;

            var observationPeriod = observationPeriods.FirstOrDefault(op =>
                op.StartDate.Between(entity.StartDate, entity.EndDate.Value) ||
                op.EndDate.Value.Between(entity.StartDate, entity.EndDate.Value));
            if (observationPeriod == null) return;

            if (entity.StartDate < observationPeriod.StartDate)
                entity.StartDate = observationPeriod.StartDate;

            if (entity.StartDate > observationPeriod.EndDate)
                entity.StartDate = observationPeriod.EndDate.Value;

            if (entity.EndDate > observationPeriod.EndDate)
                entity.EndDate = observationPeriod.EndDate;
        }

        private IEnumerable<VisitOccurrence> CleanVisitOccurrences(IEnumerable<VisitOccurrence> visitOccurrences,
            ObservationPeriod[] observationPeriods)
        {
            foreach (var visitOccurrence in visitOccurrences)
            {
                if (visitOccurrence.ConceptId == 42898160)
                {
                    var period =
                        observationPeriods.Where(
                                op => visitOccurrence.StartDate.Between(op.StartDate, op.EndDate.Value) ||
                                      visitOccurrence.EndDate.Value.Between(op.StartDate, op.EndDate.Value))
                            .OrderBy(op => op.StartDate)
                            .ThenBy(op => op.EndDate)
                            .FirstOrDefault();

                    if (period == null) continue;

                    visitOccurrence.AdditionalFields.Add("start",
                        visitOccurrence.StartDate.ToString("dd/MM/yyyy", CultureInfo.InvariantCulture));
                    visitOccurrence.AdditionalFields.Add("end",
                        visitOccurrence.EndDate.Value.ToString("dd/MM/yyyy", CultureInfo.InvariantCulture));

                    //Logger.Write(Chunk.ChunkId, LogMessageTypes.Debug, "xxxx 1 " + visitOccurrence.PersonId + " " + visitOccurrence.SourceValue + " " + visitOccurrence.AdditionalFields["start"] + " " + visitOccurrence.AdditionalFields["end"]);
                    yield return visitOccurrence;
                    continue;
                }

                if (!visitOccurrence.EndDate.HasValue || visitOccurrence.EndDate < visitOccurrence.StartDate)
                    visitOccurrence.EndDate = visitOccurrence.StartDate;

                var observationPeriod =
                    observationPeriods.Where(
                            op =>
                                visitOccurrence.StartDate.Between(op.StartDate, op.EndDate.Value) ||
                                visitOccurrence.EndDate.Value.Between(op.StartDate, op.EndDate.Value) ||
                                visitOccurrence.StartDate < op.StartDate && visitOccurrence.EndDate > op.EndDate)
                        .OrderBy(op => op.StartDate)
                        .ThenBy(op => op.EndDate)
                        .FirstOrDefault();

                if (observationPeriod == null) continue;

                if (visitOccurrence.StartDate < observationPeriod.StartDate)
                    visitOccurrence.StartDate = observationPeriod.StartDate;

                if (visitOccurrence.EndDate > observationPeriod.EndDate)
                    visitOccurrence.EndDate = observationPeriod.EndDate;


                //if(!visitOccurrence.AdditionalFields.ContainsKey("start"))
                visitOccurrence.AdditionalFields.Add("start",
                    visitOccurrence.StartDate.ToString("dd/MM/yyyy", CultureInfo.InvariantCulture));

                //if (!visitOccurrence.AdditionalFields.ContainsKey("end"))
                visitOccurrence.AdditionalFields.Add("end",
                    visitOccurrence.EndDate.Value.ToString("dd/MM/yyyy", CultureInfo.InvariantCulture));


                yield return visitOccurrence;
            }
        }

        private IEnumerable<VisitOccurrence> CollapseLtcpVisits(IEnumerable<VisitOccurrence> visitOccurrences)
        {
            var step1 = CollapseVisits(visitOccurrences).ToList();

            foreach (var vo in step1.Where(vo => vo.StartDate == vo.EndDate))
            {
                vo.StartDate = new DateTime(vo.StartDate.Year, vo.StartDate.Month, 1);
                vo.EndDate = new DateTime(vo.StartDate.Year, vo.StartDate.Month,
                    DateTime.DaysInMonth(vo.StartDate.Year, vo.StartDate.Month));
            }

            return CollapseVisits(step1);
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

        private static string GetFachdidKey(IEntity entity)
        {
            if (!entity.AdditionalFields.ContainsKey("fachdid") ||
                string.IsNullOrEmpty(entity.AdditionalFields["fachdid"]))
                return null;

            return string.Format("{0};{1}", entity.AdditionalFields["fachdid"], entity.AdditionalFields["year"]);
        }

        private static string GetCaseidKey(IEntity entity)
        {
            return !entity.AdditionalFields.ContainsKey("caseid")
                ? null
                : string.Format("{0};{1}", entity.AdditionalFields["caseid"], entity.AdditionalFields["year"]);
        }

        private void AddRawVisitOccurrence(VisitOccurrence rawVisit, VisitOccurrence finalVisit)
        {
            if (!_rawVisits.ContainsKey(rawVisit.SourceRecordGuid))
                _rawVisits.Add(rawVisit.SourceRecordGuid, finalVisit);
            else
                _rawVisits[rawVisit.SourceRecordGuid] = finalVisit;

            if (!_medicalRecords.ContainsKey(finalVisit.SourceRecordGuid))
                _medicalRecords.Add(finalVisit.SourceRecordGuid, new List<IEntity>());

            _medicalRecords[finalVisit.SourceRecordGuid].Add(rawVisit);

            var caseidKey = GetCaseidKey(rawVisit);
            var fachidKey = GetFachdidKey(rawVisit);

            if (!string.IsNullOrEmpty(caseidKey) && finalVisit.ConceptId == 9201)
            {
                if (!_caseidVisits.ContainsKey(caseidKey))
                    _caseidVisits.Add(caseidKey, new HashSet<VisitOccurrence>());

                _caseidVisits[caseidKey].Add(finalVisit);
            }

            if (!string.IsNullOrEmpty(fachidKey))
            {
                if (!_fachidVisits.ContainsKey(fachidKey))
                    _fachidVisits.Add(fachidKey, new HashSet<VisitOccurrence>());

                _fachidVisits[fachidKey].Add(finalVisit);
            }
        }

    }
}
