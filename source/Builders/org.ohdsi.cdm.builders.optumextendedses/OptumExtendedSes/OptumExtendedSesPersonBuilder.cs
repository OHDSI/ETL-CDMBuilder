using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using org.ohdsi.cdm.framework.core.Base;
using org.ohdsi.cdm.framework.entities.Omop;
using org.ohdsi.cdm.framework.shared.Extensions;
using org.ohdsi.cdm.framework.shared.Validators;

namespace org.ohdsi.cdm.builders.optumextendedses
{
   /// <summary>
   ///  Implementation of PersonBuilder for Optum, based on CDM Build spec
   /// </summary>
   public class OptumExtendedSesPersonBuilder : PersonBuilder
   {
      private readonly Dictionary<Guid, VisitOccurrence> rawVisits = new Dictionary<Guid, VisitOccurrence>();


      private static IEnumerable<VisitOccurrence> CleanVisitOccurrences(IEnumerable<VisitOccurrence> visitOccurrences, ObservationPeriod[] observationPeriods)
      {
         foreach (var visitOccurrence in visitOccurrences)
         {
            if (!visitOccurrence.EndDate.HasValue || visitOccurrence.EndDate < visitOccurrence.StartDate)
               visitOccurrence.EndDate = visitOccurrence.StartDate;

            var observationPeriod = observationPeriods.FirstOrDefault(op => visitOccurrence.StartDate.Between(op.StartDate, op.EndDate.Value) || visitOccurrence.EndDate.Value.Between(op.StartDate, op.EndDate.Value));

            if (observationPeriod == null) continue;

            if (visitOccurrence.StartDate < observationPeriod.StartDate)
               visitOccurrence.StartDate = observationPeriod.StartDate;

            if (visitOccurrence.EndDate > observationPeriod.EndDate)
               visitOccurrence.EndDate = observationPeriod.EndDate;

            yield return visitOccurrence;
         }
      }

      public IEnumerable<VisitOccurrence> GetIPClaims(IEnumerable<VisitOccurrence> visitOccurrences)
      {
         foreach (var ipGroup in visitOccurrences.GroupBy(vo => vo.AdditionalFields["pat_planid"]))
         {
            var ipVisits = new List<VisitOccurrence>();
            foreach (var claim in ipGroup.Where(vo => vo.ConceptId == 9201).OrderBy(vo => vo.StartDate).ThenBy(vo => vo.EndDate))//IP - 9201
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

                     if (!rawVisits.ContainsKey(claim.SourceRecordGuid))
                        rawVisits.Add(claim.SourceRecordGuid, previousClaim);

                     if (claim.VisitCosts != null && claim.VisitCosts.Count > 0)
                     {
                        if(previousClaim.VisitCosts == null)
                           previousClaim.VisitCosts = new List<VisitCost>();

                        previousClaim.VisitCosts.AddRange(claim.VisitCosts);
                     }

                     continue;
                  }
               }

               if (!rawVisits.ContainsKey(claim.SourceRecordGuid))
                  rawVisits.Add(claim.SourceRecordGuid, claim);

               ipVisits.Add(claim);
            }

            foreach (var ipVisit in ipVisits)
            {
               yield return ipVisit;
            }
         }
      }

      public override IEnumerable<VisitCost> BuildVisitCosts(VisitOccurrence[] visitOccurrences)
      {
         foreach (var visitOccurrence in visitOccurrences)
         {
            if (visitOccurrence.ConceptId != 9201 && visitOccurrence.VisitCosts != null)
            {
               visitOccurrence.VisitCosts.Clear();
            }

         }

         return base.BuildVisitCosts(visitOccurrences);
      }

      public override IEnumerable<VisitOccurrence> BuildVisitOccurrences(VisitOccurrence[] rawVisitOccurrences, ObservationPeriod[] observationPeriods)
      {
         var visitOccurrences = CleanVisitOccurrences(rawVisitOccurrences, observationPeriods).ToList();

         var ipVisits = GetIPClaims(visitOccurrences).ToList();
         var erVisits = new List<VisitOccurrence>();
         var opVisits = new List<VisitOccurrence>();

         foreach (var visitOccurrence in visitOccurrences.Where(visitOccurrence => visitOccurrence.ConceptId != 9201))
         {
            var ip = ipVisits.FirstOrDefault(v => visitOccurrence.StartDate.Between(v.StartDate, v.EndDate.Value));

            if (visitOccurrence.ConceptId == 9203)
            {
               if (ip == null || (visitOccurrence.StartDate == ip.StartDate && visitOccurrence.EndDate == ip.StartDate))
               //ER - 9203
               {
                  erVisits.Add(visitOccurrence);
               }
               else
               {
                  if (!rawVisits.ContainsKey(visitOccurrence.SourceRecordGuid))
                     rawVisits.Add(visitOccurrence.SourceRecordGuid, ip);
               }
            }
            else if (ip == null)
            {
               opVisits.Add(visitOccurrence);
            }
            else
            {
               if (!rawVisits.ContainsKey(visitOccurrence.SourceRecordGuid))
                  rawVisits.Add(visitOccurrence.SourceRecordGuid, ip);
            }
         }

         foreach (var ipVisit in ipVisits)
         {
            yield return ipVisit;
         }

         // collapse claims with the same FST_DT in ER table as one unique ER visit
         foreach (var patplanidGroup in erVisits.GroupBy(vo => vo.AdditionalFields["pat_planid"]))
         {
            foreach (var erGroup in patplanidGroup.GroupBy(v => v.StartDate))
            {
               var visit = erGroup.First();
               visit.EndDate = erGroup.Max(v => v.EndDate);
               foreach (
                   var visitOccurrence in
                       erGroup.Where(visitOccurrence => !rawVisits.ContainsKey(visitOccurrence.SourceRecordGuid)))
               {
                  rawVisits.Add(visitOccurrence.SourceRecordGuid, visit);
               }

               yield return visit;
            }
         }

         foreach (var patplanidGroup in opVisits.GroupBy(vo => vo.AdditionalFields["pat_planid"]))
         {
            foreach (var opGroup in patplanidGroup.GroupBy(v => v.StartDate))
            {
               foreach (var opGroup1 in opGroup.GroupBy(v => v.AdditionalFields["prov"]))
               {
                  var visit = opGroup1.First();
                  visit.EndDate = opGroup1.Max(v => v.EndDate);
                  foreach (
                      var visitOccurrence in
                          opGroup1.Where(visitOccurrence => !rawVisits.ContainsKey(visitOccurrence.SourceRecordGuid))
                      )
                  {
                     rawVisits.Add(visitOccurrence.SourceRecordGuid, visit);
                  }

                  yield return visit;
               }
            }
         }
      }

      private VisitOccurrence GetVisitOccurrence(IEntity ent)
      {
         if (rawVisits.ContainsKey(ent.SourceRecordGuid))
            return rawVisits[ent.SourceRecordGuid];

         return null;
      }


      private static int GetConditionTypeConceptId(int position, long visitTypeId)
      {
         if (visitTypeId == 9201)
         {
            switch (position)
            {
               case 1:
                  return 38000200;

               case 2:
                  return 38000201;

               case 3:
                  return 38000202;

               case 4:
                  return 38000203;

               case 5:
                  return 38000204;

               default:
                  return 0;
            }
         }

         switch (position)
         {
            case 1:
               return 38000230;

            case 2:
               return 38000231;

            case 3:
               return 38000232;

            case 4:
               return 38000233;

            case 5:
               return 38000234;

            default:
               return 0;
         }
      }

      private static int GetProcedureTypeConceptId(int position, long visitTypeId)
      {
         if (visitTypeId == 9201)
         {
            switch (position)
            {
               case 1:
                  return 38000251;

               case 2:
                  return 38000252;

               case 3:
                  return 38000253;

               case 4:
                  return 38000254;

               default:
                  return 0;
            }
         }

         switch (position)
         {
            case 1:
               return 38000269;

            case 2:
               return 38000270;

            case 3:
               return 38000271;

            case 4:
               return 38000272;


            default:
               return 0;
         }
      }

      private string GetProviderKey(VisitOccurrence visitOccurrence, IEntity entity,
                                           Dictionary<DateTime, Dictionary<string, List<IEntity>>>
                                              dateClaimTypeDictionary)
      {
         var claimType = visitOccurrence.SourceValue;

         if (!dateClaimTypeDictionary[entity.StartDate].ContainsKey(claimType))
            claimType = entity.AdditionalFields["claim_type"];

         if (claimType.ToUpper() == "OP")
         {
            var cl = dateClaimTypeDictionary[entity.StartDate][claimType]
               .Where(c => c.VisitOccurrenceId == entity.VisitOccurrenceId)
               .OrderBy(c => DateTime.Parse(c.AdditionalFields["visit_start_date"]))
               .ThenBy(c => c.AdditionalFields["prov"])
               .ThenBy(c => DateTime.Parse(c.AdditionalFields["visit_end_date"]))
               .ThenBy(c => c.AdditionalFields["provcat"])
               .FirstOrDefault();
               
               if(cl != null)
                 return cl.ProviderKey;
         }

         if (claimType.ToUpper() == "ER")
         {
            var prov =
               dateClaimTypeDictionary[entity.StartDate][claimType].Where(c => c.VisitOccurrenceId == entity.VisitOccurrenceId)
                                                                   .OrderBy(c => DateTime.Parse(c.AdditionalFields["visit_start_date"]))
                                                                   .ThenBy(c => DateTime.Parse(c.AdditionalFields["visit_end_date"]))
                                                                   .ThenBy(c => c.AdditionalFields["prov"])
                                                                   .ThenBy(c => c.AdditionalFields["provcat"])
                                                                   .FirstOrDefault();

            if (prov != null) return prov.ProviderKey;
         }

         
                var cl2 = dateClaimTypeDictionary[entity.StartDate][claimType].OrderBy(c => DateTime.Parse(c.AdditionalFields["visit_start_date"]))
                                                                      .ThenBy(c => DateTime.Parse(c.AdditionalFields["visit_end_date"]))
                                                                      .ThenBy(c => c.AdditionalFields["prov"])
                                                                      .ThenBy(c => c.AdditionalFields["provcat"])
                                                                      .FirstOrDefault();

          if(cl2 != null)
          {
              entity.ProviderKey = cl2.ProviderKey;
              return cl2.ProviderKey;
          }

          return "";                                         

      }

      private static void AddToDateClaimTypeDictionary(Dictionary<DateTime, Dictionary<string, List<IEntity>>> entities,
                                                       IEntity entity, VisitOccurrence visitOccurrence)
      {
         if (!entities.ContainsKey(entity.StartDate))
            entities.Add(entity.StartDate, new Dictionary<string, List<IEntity>>());

         var claimType = entity.AdditionalFields["claim_type"];
         if (!entities[entity.StartDate].ContainsKey(claimType))
            entities[entity.StartDate][claimType] = new List<IEntity>();

         if (DateTime.Parse(entity.AdditionalFields["visit_end_date"]) > visitOccurrence.EndDate.Value)
            entity.AdditionalFields["visit_end_date"] = visitOccurrence.EndDate.Value.ToString(CultureInfo.InvariantCulture);

         entities[entity.StartDate][claimType].Add(entity);
      }

      public static CodeValidator.IcdVer GetIcdVersion(IEntity entity)
      {
         if (!entity.AdditionalFields.ContainsKey("icd_flag"))
            return CodeValidator.IcdVer.Icd9;

         switch (entity.AdditionalFields["icd_flag"])
         {
            case "10":
               return CodeValidator.IcdVer.Icd10;

            case "9":
               return CodeValidator.IcdVer.Icd9;

            default:
               return CodeValidator.IcdVer.Icd9;
         }
      }

      public override IEnumerable<ConditionOccurrence> BuildConditionOccurrences(ConditionOccurrence[] conditionOccurrences, Dictionary<long, VisitOccurrence> vo, ObservationPeriod[] op)
      {
         var result = new HashSet<ConditionOccurrence>();
         var dateClaimTypeDictionary = new Dictionary<DateTime, Dictionary<string, List<IEntity>>>();
         foreach (var conditionOccurrence in conditionOccurrences)
         {
            var visitOccurrence = GetVisitOccurrence(conditionOccurrence);
            if (visitOccurrence == null)
               continue;

            conditionOccurrence.VisitOccurrenceId = visitOccurrence.Id;

            if (conditionOccurrence.Domain == "Procedure" && visitOccurrence.ConceptId == 9201 && visitOccurrence.EndDate.HasValue)
            {
               conditionOccurrence.StartDate = visitOccurrence.EndDate.Value;
            }
            else
            {
               conditionOccurrence.StartDate = visitOccurrence.StartDate;
            }
            
            conditionOccurrence.EndDate = null;
            conditionOccurrence.TypeConceptId = GetConditionTypeConceptId(conditionOccurrence.TypeConceptId.Value, visitOccurrence.ConceptId);

            AddToDateClaimTypeDictionary(dateClaimTypeDictionary, conditionOccurrence, visitOccurrence);
         }

         foreach (var sameStartDate in conditionOccurrences.Where(c => c.VisitOccurrenceId.HasValue && !string.IsNullOrEmpty(c.SourceValue)).GroupBy(c => c.StartDate))
         {
            foreach (var sameVisit in sameStartDate.GroupBy(c => c.VisitOccurrenceId))
            {
               foreach (var sameSource in sameVisit.GroupBy(c => c.SourceValue))
               {
                  foreach (var sameConcept in sameSource.GroupBy(c => c.ConceptId))
                  {
                     var conditionOccurrence = sameConcept.OrderBy(c => c.TypeConceptId).ToList()[0];

                     //if (!CodeValidator.IsValidIcd(conditionOccurrence.SourceValue, GetIcdVersion(conditionOccurrence))) continue;

                     conditionOccurrence.ProviderKey = GetProviderKey(vo[conditionOccurrence.VisitOccurrenceId.Value],
                                                                      conditionOccurrence, dateClaimTypeDictionary);
                     result.Add(conditionOccurrence);
                  }
               }
            }
         }

         return base.BuildConditionOccurrences(result.ToArray(), vo, op);
      }

      private IEnumerable<ProcedureOccurrence> BuildProceduresCd(IEnumerable<ProcedureOccurrence> procedureOccurrences,
                                                                Dictionary<ProcedureOccurrence, List<ProcedureCost>>
                                                                   costs)
      {
         foreach (var sameStartDate in procedureOccurrences.GroupBy(p => p.StartDate))
         {
            foreach (var sameVisit in sameStartDate.GroupBy(p => p.VisitOccurrenceId))
            {
               foreach (var sameSource in sameVisit.GroupBy(p => p.SourceValue))
               {
                  foreach (var sameConcept in sameSource.GroupBy(p => p.ConceptId))
                  {
                     //VISIT_OCCURRENCE_ID,PROCEDURE_SOURCE_VALUE,PROCEDURE_DATE,DIAG1, PROV and PROVCAT
                     var procedureOccurrence = sameConcept.OrderBy(c => c.AdditionalFields["diag1"])
                                                         .ThenBy(c => c.AdditionalFields["prov"])
                                                         .ThenBy(c => c.AdditionalFields["provcat"]).First();

                     procedureOccurrence.ProcedureCosts.Clear();
                     procedureOccurrence.ProcedureCosts.AddRange(costs[procedureOccurrence]);

                     yield return procedureOccurrence;
                  }
               }
            }
         }
      }

      private IEnumerable<ProcedureOccurrence> BuildProceduresOther(IEnumerable<ProcedureOccurrence> procedureOccurrences, Dictionary<long, VisitOccurrence> visitOccurrences, Dictionary<DateTime, Dictionary<string, List<IEntity>>> dateClaimTypeDictionary)
      {
         foreach (var sameStartDate in procedureOccurrences.GroupBy(p => p.StartDate))
         {
            foreach (var sameVisit in sameStartDate.GroupBy(p => p.VisitOccurrenceId))
            {
               foreach (var sameSource in sameVisit.GroupBy(p => p.SourceValue))
               {
                  foreach (var sameConcept in sameSource.GroupBy(p => p.ConceptId))
                  {
                     //visit_occurrence_id, procedure_source_value, poistion and DIAG1, then pick the first one and assign RELEVANT_CONDITION_CONCEPT_ID
                     var procedureOccurrence = sameConcept.OrderBy(p => p.TypeConceptId).ThenBy(p => p.AdditionalFields["diag1"]).First();
                     procedureOccurrence.ProviderKey =
                        GetProviderKey(visitOccurrences[procedureOccurrence.VisitOccurrenceId.Value],
                                       procedureOccurrence,
                                       dateClaimTypeDictionary);

                     yield return procedureOccurrence;
                  }

               }
            }
         }
      }

      public override IEnumerable<ProcedureOccurrence> BuildProcedureOccurrences(ProcedureOccurrence[] procedureOccurrences, Dictionary<long, VisitOccurrence> visitOccurrences, ObservationPeriod[] observationPeriods)
      {
         var result = new HashSet<ProcedureOccurrence>();
         var cost = new Dictionary<ProcedureOccurrence, List<ProcedureCost>>();
         var dateClaimTypeDictionary = new Dictionary<DateTime, Dictionary<string, List<IEntity>>>();

         var cdProcedures = new List<ProcedureOccurrence>();
         var otherProcedures = new List<ProcedureOccurrence>();

         foreach (var procedureOccurrence in procedureOccurrences)
         {
            if(procedureOccurrence.SourceValue == "0000000")
               continue;

            var visitOccurrence = GetVisitOccurrence(procedureOccurrence);
            if (visitOccurrence == null)
               continue;

            procedureOccurrence.VisitOccurrenceId = visitOccurrence.Id;

            var observationPeriod = observationPeriods.FirstOrDefault(op => op.StartDate.Between(procedureOccurrence.StartDate, procedureOccurrence.EndDate.Value) || op.EndDate.Value.Between(procedureOccurrence.StartDate, procedureOccurrence.EndDate.Value));
            if (observationPeriod != null)
            {
               if (procedureOccurrence.StartDate < observationPeriod.StartDate)
                  procedureOccurrence.StartDate = observationPeriod.StartDate;

               if (procedureOccurrence.StartDate > observationPeriod.EndDate)
                  procedureOccurrence.StartDate = observationPeriod.EndDate.Value;
            }

            procedureOccurrence.EndDate = null;
            procedureOccurrence.TypeConceptId = GetProcedureTypeConceptId(procedureOccurrence.TypeConceptId.Value, visitOccurrence.ConceptId);

            if (procedureOccurrence.TypeConceptId == 38000272 || procedureOccurrence.TypeConceptId == 38000254)
            {
               if (procedureOccurrence.ProcedureCosts != null)
               {
                  if (!cost.ContainsKey(procedureOccurrence))
                     cost.Add(procedureOccurrence, new List<ProcedureCost>());

                  cost[procedureOccurrence].AddRange(procedureOccurrence.ProcedureCosts);
               }
               cdProcedures.Add(procedureOccurrence);
            }
            else
            {
               procedureOccurrence.StartDate = visitOccurrence.EndDate.Value;

               if (procedureOccurrence.Domain != "Procedure" || CodeValidator.IsValidIcdProcedure(procedureOccurrence.SourceValue, GetIcdVersion(procedureOccurrence)))
                  otherProcedures.Add(procedureOccurrence);
            }

            AddToDateClaimTypeDictionary(dateClaimTypeDictionary, procedureOccurrence, visitOccurrence);
         }

         foreach (var procedureOccurrence in BuildProceduresCd(cdProcedures, cost))
         {
            result.Add(procedureOccurrence);
         }

         foreach (var procedureOccurrence in BuildProceduresOther(otherProcedures, visitOccurrences, dateClaimTypeDictionary))
         {
            result.Add(procedureOccurrence);
         }

         return base.BuildProcedureOccurrences(result.ToArray(), visitOccurrences, observationPeriods);
      }

      public override IEnumerable<ProcedureCost> BuildProcedureCosts(ProcedureOccurrence[] procedureOccurrences)
      {
         // Don't put ICD9 procedure for PROC1-PROC3 in this table
         // proc1   TypeId = 38000251, 38000269
         // proc2   TypeId = 38000252, 38000270
         // proc3   TypeId = 38000253, 38000271
         // proc_cd TypeId = 38000254, 38000272
         foreach (var procedureOccurrence in procedureOccurrences)
         {
            if (procedureOccurrence.TypeConceptId != 38000254 && procedureOccurrence.TypeConceptId != 38000272) continue;

            foreach (var procedureCost in procedureOccurrence.ProcedureCosts)
            {
               //TOTAL_OUT_OF_POCKET = COINS + DEDUCT
               procedureCost.TotalOutOfPocket = procedureCost.PaidCoinsurance + procedureCost.PaidTowardDeductible;
               procedureCost.Id = procedureOccurrence.Id;
               yield return procedureCost;
            }
         }
      }

      private static Death CleanUpDeath(IEnumerable<IEntity> items, Death death)
      {
         if(death == null) return null;

         return items.Any(item => item.StartDate > death.StartDate.AddDays(30)) ? null : death;
      }

      public override Death BuildDeath(Death[] deathRaw, Dictionary<long, VisitOccurrence> visitOccurrences, ObservationPeriod[] observationPeriods)
      {
         var death = FilterDeathRecords(deathRaw).ToList();

         if (death.Any())
         {
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
            var visitOccurrence = GetVisitOccurrence(d);
            if (visitOccurrence == null)
            {
               continue;
            }

            d.StartDate = visitOccurrence.EndDate.Value;

            if (d.TypeConceptId == 38003568 && !d.StartDate.Between(d.ValidStartDate, d.ValidEndDate))
            {
               continue;
            }

            yield return d;
         }
      }

      private IEnumerable<DrugExposure> PrepareDrugExposures(IEnumerable<DrugExposure> drugExposures, Dictionary<long, VisitOccurrence> visitOccurrences)
      {
         var rxDrugs = new Dictionary<Guid, List<DrugExposure>>();
         foreach (var drugExposure in drugExposures)
         {
            if (drugExposure.TypeConceptId == 38000175 || drugExposure.TypeConceptId == 38000176)
            {
               if (!rxDrugs.ContainsKey(drugExposure.SourceRecordGuid))
                  rxDrugs.Add(drugExposure.SourceRecordGuid, new List<DrugExposure>());

               rxDrugs[drugExposure.SourceRecordGuid].Add(drugExposure);
            }
         }


         foreach (var similarDrugs in rxDrugs.SelectMany(drugs => drugs.Value.GroupBy(d => d.SourceValue.Length >= 9 ? d.SourceValue.Substring(0, 9) : d.SourceValue)))
         {
            if (similarDrugs.Count(d => d.ConceptId > 0) > 0)
            {
               yield return similarDrugs.Where(d => d.ConceptId > 0).OrderBy(d => d.SourceValue.Length).Last();
               continue;
            }

            yield return similarDrugs.OrderBy(d => d.SourceValue.Length).Last();
         }
      }

      public override IEnumerable<DrugExposure> BuildDrugExposures(DrugExposure[] de, Dictionary<long, VisitOccurrence> visitOccurrences, ObservationPeriod[] observationPeriods)
      {
         var drugExposures = PrepareDrugExposures(de, visitOccurrences).ToArray();
         return base.BuildDrugExposures(drugExposures, visitOccurrences, observationPeriods);
      }

      public override IEnumerable<Observation> BuildObservations(Observation[] observations, Dictionary<long, VisitOccurrence> visitOccurrences,
         ObservationPeriod[] observationPeriods)
      {
         foreach (var observation in base.BuildObservations(observations, visitOccurrences, observationPeriods))
         {
            if (!observation.StartDate.Between(observation.ValidStartDate, observation.ValidEndDate))
            {
               observation.ConceptId = 0;
            }

            yield return observation;
         }
      }

      public override IEnumerable<Measurement> BuildMeasurement(Measurement[] measurements, Dictionary<long, VisitOccurrence> visitOccurrences,
         ObservationPeriod[] observationPeriods)
      {
         var mes = new List<Measurement>();
         foreach (var grouped in measurements.GroupBy(m => m.SourceRecordGuid))
         {
            // First, look for LOINC_CD. If no map exists, then look for PROC_CD
            var isLOINCExsits = grouped.Count() > 1 && grouped.Any(m => m.TypeConceptId == 1 && m.ConceptId > 0);
            foreach (var measurement in grouped)
            {
               if (measurement.Domain == "Measurement" && isLOINCExsits && measurement.TypeConceptId == 2) continue;

               measurement.TypeConceptId = 44818702;
               mes.Add(measurement);
            }
         }

         return base.BuildMeasurement(mes.ToArray(), visitOccurrences, observationPeriods);
      }

      public override bool Excluded(Person person, IEnumerable<ObservationPeriod> periods)
      {
         var priorYearOfBirth =  person.YearOfBirth.Value - 1;
         var beginningOfQ4 = new DateTime(priorYearOfBirth, 10, 1); // Fourth quarter, Q4: 1 October-31 December
         return periods.Any(period => period.StartDate < beginningOfQ4);
      }

      public override void Build(Dictionary<string, long> providers)
      {
         var person = BuildPerson(personRecords.ToList());
         if (person == null) return;

         var observationPeriods = BuildObservationPeriods(person.ObservationPeriodGap, observationPeriodsRaw.ToArray()).ToArray();

         if (Excluded(person, observationPeriods)) return;

         var fisrtOP = observationPeriods.Min(op => op.StartDate);
         if (fisrtOP.Year == person.YearOfBirth)
         {
            person.MonthOfBirth = fisrtOP.Month;
         }

         var payerPlanPeriods = BuildPayerPlanPeriods(payerPlanPeriodsRaw.ToArray(), null).ToArray();
         var visitOccurrences = new Dictionary<long, VisitOccurrence>();

         foreach (var visitOccurrence in BuildVisitOccurrences(visitOccurrencesRaw.ToArray(), observationPeriods))
         {
            if (visitOccurrence.IdUndefined)
            {
               visitOccurrence.Id = chunkData.KeyMasterOffset.VisitOccurrenceId;
               visitOccurrence.IdUndefined = false;
            }
            visitOccurrences.Add(visitOccurrence.Id, visitOccurrence);
         }

         var conditionOccurrences = BuildConditionOccurrences(conditionOccurrencesRaw.ToArray(), visitOccurrences, observationPeriods).ToArray();
         foreach (ConditionOccurrence co in conditionOccurrences)
         {
            co.Id = chunkData.KeyMasterOffset.ConditionOccurrenceId;

            if (co.VisitOccurrenceId.HasValue && visitOccurrences.ContainsKey(co.VisitOccurrenceId.Value) && !co.AdditionalFields.ContainsKey("device_exposure_end_date"))
            {
               co.AdditionalFields.Add("device_exposure_end_date", visitOccurrences[co.VisitOccurrenceId.Value].EndDate.ToString());
            }
         }

         var procedureOccurrences = BuildProcedureOccurrences(procedureOccurrencesRaw.ToArray(), visitOccurrences, observationPeriods).ToArray();
         foreach (var procedureOccurrence in procedureOccurrences)
         {
            procedureOccurrence.Id = chunkData.KeyMasterOffset.ProcedureOccurrenceId;

            if (procedureOccurrence.VisitOccurrenceId.HasValue && visitOccurrences.ContainsKey(procedureOccurrence.VisitOccurrenceId.Value) && !procedureOccurrence.AdditionalFields.ContainsKey("device_exposure_end_date"))
            {
               procedureOccurrence.AdditionalFields.Add("device_exposure_end_date", visitOccurrences[procedureOccurrence.VisitOccurrenceId.Value].EndDate.ToString());
            }
         }

         var observations = BuildObservations(observationsRaw.ToArray(), visitOccurrences, observationPeriods).ToArray();
         var drugExposures = BuildDrugExposures(drugExposuresRaw.ToArray(), visitOccurrences, observationPeriods).ToArray();
         var measurements = BuildMeasurement(measurementsRaw.ToArray(), visitOccurrences, observationPeriods).ToArray();
         var deviceExposure = BuildDeviceExposure(deviceExposureRaw.ToArray(), visitOccurrences, observationPeriods).ToArray();

         // set corresponding PlanPeriodIds to drug exposure entities and procedure occurrence entities
         SetPayerPlanPeriodId(payerPlanPeriods, drugExposures, procedureOccurrences, visitOccurrences.Values.ToArray(), deviceExposure);

         // set corresponding ProviderIds
         SetProviderIds(drugExposures, providers);
         SetProviderIds(conditionOccurrences, providers);
         SetProviderIds(visitOccurrences.Values.ToArray(), providers);
         SetProviderIds(procedureOccurrences, providers);
         SetProviderIds(observations, providers);

         var death = BuildDeath(deathRecords.ToArray(), visitOccurrences, observationPeriods);
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
            death = CleanUpDeath(observations, death);
            death = CleanUpDeath(deviceExposure, death);
         }

         // push built entities to ChunkBuilder for further save to CDM database
         AddToChunk(person, death,
            observationPeriods,
            payerPlanPeriods,
            drugExposures,
            drugCosts,
            conditionOccurrences,
            procedureOccurrences,
            procedureCosts,
            observations,
            measurements,
            visitOccurrences.Values.ToArray(), visitCosts, new Cohort[0], deviceExposure, devicCosts);
      }

      public override void AddToChunk(string domain, IEnumerable<IEntity> entities)
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
                  var mes = entity as Measurement ??
                            new Measurement(entity)
                            {
                               Id = chunkData.KeyMasterOffset.MeasurementId
                            };

                  if (!mes.ValueAsConceptId.HasValue)
                  {
                     var result = vocabulary.Lookup(mes.SourceValue, @"OptumExtendedSes\Lookups\SourcetoValue.sql", DateTime.MinValue);
                     mes.ValueAsConceptId = result.Any() ? result[0].ConceptId : 0;
                  }

                  if (entity.AdditionalFields != null && entity.AdditionalFields.ContainsKey("units"))
                  {
                     decimal valueAsNumber;
                     decimal.TryParse(entity.AdditionalFields["units"], out valueAsNumber);
                     mes.ValueAsNumber = valueAsNumber;
                  }

                  if (entity.AdditionalFields == null || !entity.AdditionalFields.ContainsKey("source") ||
                      entity.AdditionalFields["source"] != "lab")
                  {
                     mes.ValueSourceValue = entity.SourceValue;
                  }

                  chunkData.AddData(mes);
                  break;

               case "Meas Value":
                  chunkData.AddData(entity as Measurement ?? new Measurement(entity) { Id = chunkData.KeyMasterOffset.MeasurementId });
                  break;

               case "Observation":
                  var o = entity as Observation ?? new Observation(entity) { Id = chunkData.KeyMasterOffset.ObservationId };
                  // from LAB
                  if (o.TypeConceptId == 44818702)
                  {
                     o.TypeConceptId = 38000277;
                  }

                  if (entity.AdditionalFields != null && entity.AdditionalFields.ContainsKey("units"))
                  {
                     decimal valueAsNumber;
                     decimal.TryParse(entity.AdditionalFields["units"], out valueAsNumber);
                     o.ValueAsNumber = valueAsNumber;
                  }

                  chunkData.AddData(o);
                  break;

               case "Procedure":
                  chunkData.AddData(entity as ProcedureOccurrence ??
                                                                  new ProcedureOccurrence(entity)
                                                                  {
                                                                     Id =
                                                                        chunkData.KeyMasterOffset
                                                                           .ProcedureOccurrenceId
                                                                  });
                  break;

               case "Device":
                  var dev = entity as DeviceExposure ??
                            new DeviceExposure(entity)
                            {
                               Id = chunkData.KeyMasterOffset.DeviceExposureId
                            };

                  if (entity.AdditionalFields != null && entity.AdditionalFields.ContainsKey("device_exposure_end_date"))
                  {
                     dev.StartDate = DateTime.Parse(entity.AdditionalFields["device_exposure_end_date"]);
                  }

                  chunkData.AddData(dev);
                  
                  break;

               case "Drug":
                  var drg = entity as DrugExposure ??
                            new DrugExposure(entity)
                            {
                               Id = chunkData.KeyMasterOffset.DrugExposureId,
                               GetEraConceptIdsCall = vocabulary.LookupIngredientLevel
                            };

                  var proc = entity as ProcedureOccurrence;
                  if (proc != null)
                  {
                     if (proc.TypeConceptId >= 38000251 && proc.TypeConceptId <= 38000254) //IP
                     {
                        drg.TypeConceptId = 38000180;
                     }
                     else
                     {
                        drg.TypeConceptId = 38000179;
                     }

                     drg.Quantity = proc.Quantity;
                  }

                  drugForEra.Add(drg);
                  chunkData.AddData(drg);
                  break;

            }

            //HIX-823
            if (domain == "Procedure" && entityDomain != "Procedure")
            {
               // only for proc_cd
               if (entity.TypeConceptId == 38000272 || entity.TypeConceptId == 38000254)
               {
                  var po = (ProcedureOccurrence) entity;
                  po.ConceptId = 0;
                  chunkData.AddData(po);
               }
            }

            if (domain == "Observation" && entityDomain != "Observation")
            {
               var o = (Observation)entity;
               o.ConceptId = 0;
               chunkData.AddData(o);
            }
         }
      }

      public override Person BuildPerson(List<Person> records)
      {
         if (records == null || records.Count == 0) return null;

         var ordered = records.OrderByDescending(p => p.StartDate).ThenBy(p => p.EndDate);
         var person = ordered.Take(1).Last();

         person.LocationId = vocabulary.LookupLocation(person.LocationSourceValue) ?? 0;

         if (person.GenderConceptId == 8551) //UNKNOWN
            return null;
         
         return person;
      }
      
   }
}
