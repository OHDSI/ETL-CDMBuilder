using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using org.ohdsi.cdm.framework.core.Base;
using org.ohdsi.cdm.framework.entities.Omop;
using org.ohdsi.cdm.framework.shared.Extensions;
using org.ohdsi.cdm.framework.shared.Validators;

namespace org.ohdsi.cdm.builders.optum
{
   /// <summary>
   ///  Implementation of PersonBuilder for Optum, based on CDM Build spec
   /// </summary>
   public class OptumPersonBuilder : PersonBuilder
   {
      private readonly Dictionary<Guid, VisitOccurrence> rawVisits = new Dictionary<Guid, VisitOccurrence>();
      public OptumPersonBuilder(ChunkBuilder chunkBuilder)
         : base(chunkBuilder)
      {
      }

      /// <summary>
      /// Build person entity and all person related entities like: DrugExposures, ConditionOccurrences, ProcedureOccurrences... from raw data sets 
      /// </summary>
      public override void Build()
      {
         var person = BuildPerson(personRecords.ToList());
         if (person == null) return;

         var observationPeriods = BuildObservationPeriods(person.ObservationPeriodGap, observationPeriodsRaw.ToArray()).ToArray();

         if (Excluded(person, observationPeriods)) return;

         var payerPlanPeriods = BuildPayerPlanPeriods(payerPlanPeriodsRaw.ToArray(), null).ToArray();
         var visitOccurrences = new Dictionary<long, VisitOccurrence>();

         foreach (var visitOccurrence in BuildVisitOccurrences(visitOccurrencesRaw.ToArray(), observationPeriods))
         {
            if (visitOccurrence.IdUndefined)
               visitOccurrence.Id = chunkBuilder.Chunk.KeyMasterOffset.VisitOccurrenceId;

            visitOccurrences.Add(visitOccurrence.Id, visitOccurrence);
         }

         var drugExposures = BuildDrugExposures(drugExposuresRaw.ToArray(), visitOccurrences, observationPeriods).ToArray();
         var conditionOccurrences = BuildConditionOccurrences(conditionOccurrencesRaw.ToArray(), visitOccurrences, observationPeriods).ToArray();
         var procedureOccurrences = BuildProcedureOccurrences(procedureOccurrencesRaw.ToArray(), visitOccurrences, observationPeriods).ToArray();
         var observations = BuildObservations(observationsRaw.ToArray(), visitOccurrences, observationPeriods).ToArray();

         drugExposures = UpdateDrugExposureByProcedureOccurrences(drugExposures, procedureOccurrences).ToArray();

         // set corresponding PlanPeriodIds to drug exposure entities and procedure occurrence entities
         SetPayerPlanPeriodId(payerPlanPeriods, drugExposures, procedureOccurrences);

         // set corresponding ProviderIds
         SetProviderIds(drugExposures);
         SetProviderIds(conditionOccurrences);
         SetProviderIds(procedureOccurrences);
         SetProviderIds(observations);

         var drugEra = BuildDrugEra(drugExposures).ToArray();
         var conditionEra = BuildConditionEra(conditionOccurrences).ToArray();

         var death = BuildDeath(deathRecords.ToArray(), visitOccurrences, observationPeriods);
         var drugCosts = BuildDrugCosts(drugExposures).ToArray();
         var procedureCosts = BuildProcedureCosts(procedureOccurrences).ToArray();

         // push built entities to ChunkBuilder for further save to CDM database
         AddToChunk(person, death, observationPeriods, payerPlanPeriods, drugExposures, drugEra, drugCosts,
            conditionOccurrences, conditionEra, procedureOccurrences, procedureCosts, observations, visitOccurrences.Values.ToArray(), new Cohort[0]);
      }

      /// <summary>
      /// 	Projects Enumeration of drug exposure from the raw set of drug exposure & procedure occurrence entities. 
      /// 	During build:
      ///	overide TypeConceptId per CDM Mapping spec. 
      /// </summary>
      /// <param name="de">raw set of drug exposures entities</param>
      /// <param name="visitOccurrences">the visit occurrences entities for current person</param>
      /// <param name="observationPeriods">the observation periods entities for current person</param>
      /// <returns>Enumeration of drug exposure entities</returns>
      public override IEnumerable<DrugExposure> BuildDrugExposures(DrugExposure[] de, Dictionary<long, VisitOccurrence> visitOccurrences, ObservationPeriod[] observationPeriods)
      {
         var drugExposures = PrepareDrugExposures(de, visitOccurrences).ToArray();
         return base.BuildDrugExposures(drugExposures, visitOccurrences, observationPeriods);
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
            conditionOccurrence.StartDate = visitOccurrence.StartDate;
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

                     if (!CodeValidator.IsValidIcd9(conditionOccurrence.SourceValue)) continue;

                     conditionOccurrence.ProviderKey = GetProviderKey(vo[conditionOccurrence.VisitOccurrenceId.Value],
                                                                      conditionOccurrence, dateClaimTypeDictionary);
                     result.Add(conditionOccurrence);
                  }
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
      /// <param name="visitOccurrences">the visit occurrence entities for current person</param>
      /// <param name="observationPeriods">the observation period entities for current person</param>
      /// <returns>Enumeration of procedure occurrence entities</returns>
      public override IEnumerable<ProcedureOccurrence> BuildProcedureOccurrences(ProcedureOccurrence[] procedureOccurrences, Dictionary<long, VisitOccurrence> visitOccurrences, ObservationPeriod[] observationPeriods)
      {
         var result = new HashSet<ProcedureOccurrence>();
         var cost = new Dictionary<ProcedureOccurrence, List<ProcedureCost>>();
         var dateClaimTypeDictionary = new Dictionary<DateTime, Dictionary<string, List<IEntity>>>();

         var cdProcedures = new List<ProcedureOccurrence>();
         var otherProcedures = new List<ProcedureOccurrence>();

         foreach (var procedureOccurrence in procedureOccurrences)
         {
            var visitOccurrence = GetVisitOccurrence(procedureOccurrence);
            if (visitOccurrence == null)
               continue;

            procedureOccurrence.VisitOccurrenceId = visitOccurrence.Id;

            var observationPeriod = observationPeriods.FirstOrDefault(op => op.StartDate.Between(procedureOccurrence.StartDate, procedureOccurrence.EndDate.Value) || op.EndDate.Between(procedureOccurrence.StartDate, procedureOccurrence.EndDate.Value));
            if (observationPeriod != null)
            {
               if (procedureOccurrence.StartDate < observationPeriod.StartDate)
                  procedureOccurrence.StartDate = observationPeriod.StartDate;

               if (procedureOccurrence.StartDate > observationPeriod.EndDate)
                  procedureOccurrence.StartDate = observationPeriod.EndDate;
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

               if (CodeValidator.IsValidIcd9Procedure(procedureOccurrence.SourceValue))
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

      /// <summary>
      /// Projects person etity from the raw set of persons entities. 
      /// </summary>
      /// <param name="records">raw set of Person entities</param>
      /// <returns>Person entity</returns>
      public override Person BuildPerson(List<Person> records)
      {
         if (records == null || records.Count == 0) return null;

         var ordered = records.OrderByDescending(p => p.StartDate);
         var person = ordered.Take(1).First();
         person.StartDate = ordered.Take(1).Last().StartDate;

         return person;
      }

      /// <summary>
      /// Projects Enumeration of Visit Occurrence from the raw set of Visit Occurrence entities. 
      ///  </summary>
      /// <param name="rawVisitOccurrences">raw set of Visit Occurrence entities</param>
      /// <param name="observationPeriods">the observation periods entities for current person</param>
      /// <returns>Enumeration of Visit Occurrence</returns>
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

      /// <summary>
      /// Projects death entity from the raw set of death entities.
      /// </summary>
      /// <param name="deathRaw">raw set of death entities</param>
      /// <param name="visitOccurrences">the visit occurrence entities for current person</param>
      /// <param name="observationPeriods">the observation period entities for current person</param>
      /// <returns>death entity</returns>
      public override Death BuildDeath(Death[] deathRaw, Dictionary<long, VisitOccurrence> visitOccurrences, ObservationPeriod[] observationPeriods)
      {
         var death = FilterDeathRecords(deathRaw).ToList();

         if (death.Any())
         {
            var maxStartDate = death.Max(d => d.StartDate);
            var result = death.Where(d => d.StartDate == maxStartDate).OrderByDescending(d => d.Primary).First();

            result.CauseConceptId = 0;

            var maxVisitStartDate = visitOccurrences.Values.Max(vo => vo.StartDate);

            if (maxVisitStartDate < result.StartDate.AddDays(32))
            {
               return result;
            }
         }

         return null;
      }

      /// <summary>
      /// Projects Enumeration of procedure cost from the set of procedure occurrence entities.
      /// During build:
      /// override the procedure cost Id to the corresponding procedure occurrence Id
      /// calculate TotalOutOfPocket per CDM Mapping spec. 
      /// </summary>
      /// <param name="procedureOccurrences">set of procedure occurrence entities</param>
      /// <returns>set of procedure cost entities</returns>
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

      private static int GetConditionTypeConceptId(int position, long visitTypeId)
      {
         if (visitTypeId == 9201)
         {
            switch (position)
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

      private string GetProviderKey(VisitOccurrence visitOccurrence, IEntity entity,
                                           Dictionary<DateTime, Dictionary<string, List<IEntity>>>
                                              dateClaimTypeDictionary)
      {
         var claimType = visitOccurrence.SourceValue;

         if (!dateClaimTypeDictionary[entity.StartDate].ContainsKey(claimType))
            claimType = entity.AdditionalFields["claim_type"];

         if (claimType.ToUpper() == "OP")
         {
            return dateClaimTypeDictionary[entity.StartDate][claimType]
               .Where(c => c.VisitOccurrenceId == entity.VisitOccurrenceId)
               .OrderBy(c => DateTime.Parse(c.AdditionalFields["visit_start_date"]))
               .ThenBy(c => c.AdditionalFields["prov"])
               .ThenBy(c => DateTime.Parse(c.AdditionalFields["visit_end_date"]))
               .ThenBy(c => c.AdditionalFields["provcat"])
               .First().ProviderKey;
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

         return entity.ProviderKey =
                dateClaimTypeDictionary[entity.StartDate][claimType].OrderBy(c => DateTime.Parse(c.AdditionalFields["visit_start_date"]))
                                                                      .ThenBy(c => DateTime.Parse(c.AdditionalFields["visit_end_date"]))
                                                                      .ThenBy(c => c.AdditionalFields["prov"])
                                                                      .ThenBy(c => c.AdditionalFields["provcat"])
                                                                      .First().ProviderKey;

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

      private static IEnumerable<VisitOccurrence> CleanVisitOccurrences(IEnumerable<VisitOccurrence> visitOccurrences, ObservationPeriod[] observationPeriods)
      {
         foreach (var visitOccurrence in visitOccurrences)
         {
            if (!visitOccurrence.EndDate.HasValue || visitOccurrence.EndDate < visitOccurrence.StartDate)
               visitOccurrence.EndDate = visitOccurrence.StartDate;

            var observationPeriod = observationPeriods.FirstOrDefault(op => visitOccurrence.StartDate.Between(op.StartDate, op.EndDate) || visitOccurrence.EndDate.Value.Between(op.StartDate, op.EndDate));

            if (observationPeriod == null) continue;

            if (visitOccurrence.StartDate < observationPeriod.StartDate)
               visitOccurrence.StartDate = observationPeriod.StartDate;

            if (visitOccurrence.EndDate > observationPeriod.EndDate)
               visitOccurrence.EndDate = observationPeriod.EndDate;

            yield return visitOccurrence;
         }
      }

      private IEnumerable<VisitOccurrence> GetIPClaims(IEnumerable<VisitOccurrence> visitOccurrences)
      {
         var ipVisits = new List<VisitOccurrence>();

          foreach (var ipGroup in visitOccurrences.GroupBy(vo => vo.AdditionalFields["pat_planid"]))
          {
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

                          continue;
                      }
                  }

                  if (!rawVisits.ContainsKey(claim.SourceRecordGuid))
                      rawVisits.Add(claim.SourceRecordGuid, claim);

                  ipVisits.Add(claim);
              }
          }

          return ipVisits;
      }

      public override bool Excluded(Person person, IEnumerable<ObservationPeriod> periods)
      {
         return person.YearOfBirth > person.StartDate.Year + 1;
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

      private VisitOccurrence GetVisitOccurrence(IEntity ent)
      {
         if (rawVisits.ContainsKey(ent.SourceRecordGuid))
            return rawVisits[ent.SourceRecordGuid];

         return null;
      }

      private static IEnumerable<DrugExposure> UpdateDrugExposureByProcedureOccurrences(IEnumerable<DrugExposure> drugExposure, IEnumerable<ProcedureOccurrence> procedureOccurrence)
      {
         var drugs = new Dictionary<Guid, List<DrugExposure>>();

         foreach (var de in drugExposure)
         {
            if (de.TypeConceptId == 38000175 || de.TypeConceptId == 38000176)
            {
               yield return de;
               continue;
            }

            if (!drugs.ContainsKey(de.SourceRecordGuid))
               drugs.Add(de.SourceRecordGuid, new List<DrugExposure>());

            drugs[de.SourceRecordGuid].Add(de);
         }

         foreach (var po in procedureOccurrence)
         {
            if(!drugs.ContainsKey(po.SourceRecordGuid)) continue;

            var de = drugs[po.SourceRecordGuid].FirstOrDefault(d => d.SourceValue == po.SourceValue);
            if (de == null) continue;
            if (de.ConceptId > 0)
            {
               de.StartDate = po.StartDate;
               de.EndDate = null;
               de.ProviderKey = po.ProviderKey;
               de.VisitOccurrenceId = po.VisitOccurrenceId;
               de.RelevantConditionConceptId = po.ReleventConditionConceptId;
               
               yield return de;
            }
         }
      }
     

       protected override void SetPayerPlanPeriodId(PayerPlanPeriod[] payerPlanPeriods, DrugExposure[] drugExposures,
           ProcedureOccurrence[] procedureOccurrences)
       {
           if (!payerPlanPeriods.Any()) return;

           foreach (var de in drugExposures)
           {
               if (de.DrugCost == null) continue;
               foreach (var planPeriod in payerPlanPeriods)
               {
                   if (de.StartDate.Between(planPeriod.StartDate, planPeriod.EndDate.Value) &&
                       !string.IsNullOrEmpty(de.DrugCost.AdditionalFields["pat_planid"]) &&
                       de.DrugCost.AdditionalFields["pat_planid"] == planPeriod.PlanSourceValue)
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
                           if (procedureCost.AdditionalFields["pat_planid"] == planPeriod.PlanSourceValue)
                           {
                               procedureCost.PayerPlanPeriodId = planPeriod.Id;
                           }
                       }
                   }
               }
           }
       }

       private IEnumerable<DrugExposure> PrepareDrugExposures(IEnumerable<DrugExposure> drugExposures, Dictionary<long, VisitOccurrence> visitOccurrences)
       {
          var rxDrugs = new Dictionary<Guid, List<DrugExposure>>();
          var medicalDrugs = new Dictionary<Guid, List<DrugExposure>>();
          foreach (var drugExposure in drugExposures)
          {
             if (drugExposure.TypeConceptId == 38000175 || drugExposure.TypeConceptId == 38000176)
             {
                if (!rxDrugs.ContainsKey(drugExposure.SourceRecordGuid))
                   rxDrugs.Add(drugExposure.SourceRecordGuid, new List<DrugExposure>());

                rxDrugs[drugExposure.SourceRecordGuid].Add(drugExposure);
                continue;
             }

             if (!medicalDrugs.ContainsKey(drugExposure.SourceRecordGuid))
                medicalDrugs.Add(drugExposure.SourceRecordGuid, new List<DrugExposure>());

             medicalDrugs[drugExposure.SourceRecordGuid].Add(drugExposure);
          }

          foreach (var sourceRecordGuid in medicalDrugs.Keys)
          {
             //TypeConceptId == 0, ndc
             var ndcExists = medicalDrugs[sourceRecordGuid].Any(d => d.TypeConceptId == 0);

             foreach (var drugExposure in medicalDrugs[sourceRecordGuid])
             {
                //TypeConceptId == 4, proc_cd
                if (drugExposure.TypeConceptId == 4 && ndcExists)
                   continue;

                var visitOccurrence = GetVisitOccurrence(drugExposure);
                if (visitOccurrence == null)
                   continue;

                drugExposure.VisitOccurrenceId = visitOccurrence.Id;
                drugExposure.TypeConceptId = visitOccurrence.ConceptId == 9201 ? 38000180 : 38000179;

                yield return drugExposure;
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
   }
}
