using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using org.ohdsi.cdm.framework.core.Base;
using org.ohdsi.cdm.framework.entities.Omop;
using org.ohdsi.cdm.framework.shared.Extensions;


namespace org.ohdsi.cdm.builders.optumintegrated
{
   /// <summary>
   ///  Implementation of PersonBuilder for Optum, based on CDM Build spec
   /// </summary>
   public class OptumIntegratedPersonBuilder : PersonBuilder
   {
      private readonly Dictionary<Guid, VisitOccurrence> rawVisits = new Dictionary<Guid, VisitOccurrence>();

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

      private IEnumerable<DrugExposure> BuildDrugExposuresOncology(DrugExposure[] drugExposures,
         Dictionary<long, VisitOccurrence> visitOccurrences,
         ObservationPeriod[] observationPeriods)
      {
         foreach (var drugExposure in base.BuildDrugExposures(drugExposures, visitOccurrences, observationPeriods))
         {
            if (!drugExposure.Quantity.HasValue && drugExposure.AdditionalFields != null)
            {
               int? quantity = null;
               if (drugExposure.AdditionalFields.ContainsKey("quantity_per_fill") && !string.IsNullOrEmpty(drugExposure.AdditionalFields["quantity_per_fill"]))
               {
                  var q = drugExposure.AdditionalFields["quantity_per_fill"].Split(new[] { ' ' })[0];
                  int qValue;
                  if (int.TryParse(q, out qValue))
                  {
                     quantity = qValue;
                  }
               }

               if (quantity == null && drugExposure.AdditionalFields.ContainsKey("quantity_of_dose") && !string.IsNullOrEmpty(drugExposure.AdditionalFields["quantity_of_dose"]))
               {
                  var q = drugExposure.AdditionalFields["quantity_of_dose"].Split(new[] { ' ' })[0];
                  int qValue;
                  if (int.TryParse(q, out qValue))
                  {
                     quantity = qValue;
                  }
               }

               drugExposure.Quantity = quantity;

            }

            yield return drugExposure;
         }
      }

      private IEnumerable<DrugExposure> BuildDrugExposuresSES(IEnumerable<DrugExposure> drugExposures,
         Dictionary<long, VisitOccurrence> visitOccurrences,
         ObservationPeriod[] observationPeriods)
      {
         var drugs = PrepareDrugExposures(drugExposures, visitOccurrences).ToArray();
         return base.BuildDrugExposures(drugs, visitOccurrences, observationPeriods);
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

      private VisitOccurrence GetVisitOccurrence(IEntity ent)
      {
         if (rawVisits.ContainsKey(ent.SourceRecordGuid))
            return rawVisits[ent.SourceRecordGuid];

         return null;
      }

      private IEnumerable<DrugExposure> PrepareDrugExposures(IEnumerable<DrugExposure> drugExposures, Dictionary<long, VisitOccurrence> vo)
      {
         var dateClaimTypeDictionary = new Dictionary<DateTime, Dictionary<string, List<IEntity>>>();
         var medicalNdcDrugs = new List<DrugExposure>();
         var result = new HashSet<DrugExposure>();

         var rxDrugs = new Dictionary<Guid, List<DrugExposure>>();
         foreach (var drugExposure in drugExposures)
         {
            if (drugExposure.TypeConceptId == 0)
            {
               var visitOccurrence = GetVisitOccurrence(drugExposure);
               if (visitOccurrence == null)
                  continue;

               drugExposure.VisitOccurrenceId = visitOccurrence.Id;
               drugExposure.StartDate = visitOccurrence.EndDate.Value;
               drugExposure.TypeConceptId = 38000175;

               medicalNdcDrugs.Add(drugExposure);
               AddToDateClaimTypeDictionary(dateClaimTypeDictionary, drugExposure, visitOccurrence);
               continue;
            }

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

         foreach (var sameStartDate in medicalNdcDrugs.Where(c => c.VisitOccurrenceId.HasValue && !string.IsNullOrEmpty(c.SourceValue)).GroupBy(c => c.StartDate))
         {
            foreach (var sameVisit in sameStartDate.GroupBy(c => c.VisitOccurrenceId))
            {
               foreach (var sameSource in sameVisit.GroupBy(c => c.SourceValue))
               {
                  foreach (var sameConcept in sameSource.GroupBy(c => c.ConceptId))
                  {
                     var de = sameConcept.OrderBy(c => c.TypeConceptId).ToList()[0];
                     de.ProviderKey = GetProviderKey(vo[de.VisitOccurrenceId.Value],
                                                                      de, dateClaimTypeDictionary);

                     de.Quantity = sameConcept.Sum(d => d.Quantity);
                     result.Add(de);
                  }
               }
            }
         }

         foreach (var drugExposure in result)
         {
            yield return drugExposure;
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

            if (cl != null)
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

         if (cl2 != null)
         {
            entity.ProviderKey = cl2.ProviderKey;
            return cl2.ProviderKey;
         }

         return "";

      }

      public override IEnumerable<DrugExposure> BuildDrugExposures(DrugExposure[] drugExposures, Dictionary<long, VisitOccurrence> visitOccurrences,
         ObservationPeriod[] observationPeriods)
      {
         var sesRecords = new List<DrugExposure>();
         var oncologyRecords = new List<DrugExposure>();

         foreach (var e in drugExposures)
         {
            if (e.AdditionalFields != null && e.AdditionalFields.ContainsKey("source_type"))
            {
               if (e.AdditionalFields["source_type"] == "ses")
                  sesRecords.Add(e);
               else
                  oncologyRecords.Add(e);
            }
         }

         foreach (var de in BuildDrugExposuresSES(sesRecords, visitOccurrences, observationPeriods))
         {
            yield return de;
         }

         foreach (var de in BuildDrugExposuresOncology(oncologyRecords.ToArray(), visitOccurrences, observationPeriods))
         {
            yield return de;
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

      private IEnumerable<ProcedureOccurrence> BuildProcedureOccurrencesSES(ProcedureOccurrence[] procedureOccurrences, Dictionary<long, VisitOccurrence> visitOccurrences, ObservationPeriod[] observationPeriods)
      {
         var result = new HashSet<ProcedureOccurrence>();
         var cost = new Dictionary<ProcedureOccurrence, List<ProcedureCost>>();
         var dateClaimTypeDictionary = new Dictionary<DateTime, Dictionary<string, List<IEntity>>>();

         var cdProcedures = new List<ProcedureOccurrence>();
         var otherProcedures = new List<ProcedureOccurrence>();

         foreach (var procedureOccurrence in procedureOccurrences)
         {
            if (procedureOccurrence.SourceValue == "0000000")
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

      public override IEnumerable<ProcedureOccurrence> BuildProcedureOccurrences(
         ProcedureOccurrence[] procedureOccurrences, Dictionary<long, VisitOccurrence> visitOccurrences,
         ObservationPeriod[] observationPeriods)
      {
         var sesRecords = new List<ProcedureOccurrence>();
         var oncologyRecords = new List<ProcedureOccurrence>();

         foreach (var e in procedureOccurrences)
         {
            if (e.AdditionalFields != null && e.AdditionalFields.ContainsKey("source_type"))
            {
               if (e.AdditionalFields["source_type"] == "ses")
                  sesRecords.Add(e);
               else
                  oncologyRecords.Add(e);
            }
         }

         foreach (var r in BuildProcedureOccurrencesSES(sesRecords.ToArray(), visitOccurrences, observationPeriods))
         {
            yield return r;
         }

         foreach (var r in base.BuildProcedureOccurrences(oncologyRecords.ToArray(), visitOccurrences, observationPeriods))
         {
            yield return r;
         }
      }

      public override Death BuildDeath(Death[] death, Dictionary<long, VisitOccurrence> visitOccurrences, ObservationPeriod[] observationPeriods)
      {
         foreach (var d in death)
         {
            d.StartDate = d.StartDate.AddMonths(1).AddDays(-1);
         }

         return base.BuildDeath(death, visitOccurrences, observationPeriods);
      }

    //  public override IEnumerable<ObservationPeriod> BuildObservationPeriods(int gap, EraEntity[] observationPeriods)
    //  {

    //     //WHEN DATEDIFF(d, clin_start_date, elig_start_date) < 0 THEN clin_start_date 
    //     //ELSE elig_start_date 
    //     //END expected_observation_period_start_date
    //     //, ot.OBSERVATION_PERIOD_START_DATE
    //     //, CASE 
    //     //WHEN DATEDIFF(d, clin_end_date, elig_end_date) > 0 THEN clin_end_date 
    //     //ELSE elig_end_date 
    //     //END expected_observation_period_end_date
    //     //, ot.OBSERVATION_PERIOD_END_DATE

    //     //LEFT JOIN clinDates p ON ot.source_pid = p.ptid
    //     //INNER JOIN eligDates md ON md.ptid = p.ptid

    //     // eligibility observation periods for claims coverage from MEMBER_DETAIL 
    //     // elig_start_date and elig_end_date 

    //     // clinical observation periods from PATIENT 
    //     // clin_start_date and clin_end_date 

    ////      substring(first_month_active, 1, 4) + '-' + substring(first_month_active, 5, 2) + '-01' as first_month_active,
    ////substring(last_month_active, 1, 4) + '-' + substring(last_month_active, 5, 2) + '-01' as last_month_active,

    ////     eligend,
    ////CASE
    ////WHEN eligeff &lt; '05/01/2000' THEN '05/01/2000'
    ////ELSE eligeff
    ////END as md_startDate,

    //     foreach (var op in observationPeriods)
    //     {
    //        if (op.TypeConceptId == 38000281)
    //           op.EndDate = op.EndDate.Value.AddMonths(1).AddDays(-1);
    //        else
    //           op.TypeConceptId = 38000280;
    //     }

    //     foreach (var period in base.BuildObservationPeriods(gap, observationPeriods.Where(op => op.TypeConceptId == 38000281).ToArray()))
    //     {
    //        yield return period;
    //     }

    //     foreach (var period in base.BuildObservationPeriods(gap, observationPeriods.Where(op => op.TypeConceptId == 38000280).ToArray()))
    //     {
    //        yield return period;
    //     }
    //  }

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

      private IEnumerable<ConditionOccurrence> BuildConditionOccurrencesSES(ConditionOccurrence[] conditionOccurrences, Dictionary<long, VisitOccurrence> vo, ObservationPeriod[] op)
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

      public override IEnumerable<ConditionOccurrence> BuildConditionOccurrences(ConditionOccurrence[] conditionOccurrences, Dictionary<long, VisitOccurrence> vo, ObservationPeriod[] op)
      {
         var sesRecords = new List<ConditionOccurrence>();
         var oncologyRecords = new List<ConditionOccurrence>();

         foreach (var e in conditionOccurrences)
         {
            if (e.AdditionalFields != null && e.AdditionalFields.ContainsKey("source_type"))
            {
               if (e.AdditionalFields["source_type"] == "ses")
                  sesRecords.Add(e);
               else
                  oncologyRecords.Add(e);
            }
         }

         foreach (var r in BuildConditionOccurrencesSES(sesRecords.ToArray(), vo, op))
         {
            yield return r;
         }

         foreach (var r in base.BuildConditionOccurrences(oncologyRecords.ToArray(), vo, op))
         {
            yield return r;
         }
      }

      private IEnumerable<Observation> BuildObservationsOncology(Observation[] observations, Dictionary<long, VisitOccurrence> visitOccurrences,
         ObservationPeriod[] observationPeriods)
      {
         foreach (var observation in base.BuildObservations(observations, visitOccurrences, observationPeriods))
         {
            if (observation.AdditionalFields != null && observation.AdditionalFields.ContainsKey("test_result"))
            {
               decimal value;
               if (decimal.TryParse(observation.AdditionalFields["test_result"], out value))
                  observation.ValueAsNumber = value;
               else
                  observation.ValueAsString = observation.AdditionalFields["test_result"];
            }

            yield return observation;
         }
      }

      private IEnumerable<Observation> BuildObservationsSES(Observation[] observations, Dictionary<long, VisitOccurrence> visitOccurrences,
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
      
      public override IEnumerable<Observation> BuildObservations(Observation[] observations, Dictionary<long, VisitOccurrence> visitOccurrences,
         ObservationPeriod[] observationPeriods)
      {
         var sesRecords = new List<Observation>();
         var oncologyRecords = new List<Observation>();

         foreach (var e in observations)
         {
            if (e.AdditionalFields != null && e.AdditionalFields.ContainsKey("source_type"))
            {
               if (e.AdditionalFields["source_type"] == "ses")
                  sesRecords.Add(e);
               else
                  oncologyRecords.Add(e);
            }
         }

         foreach (var r in BuildObservationsSES(sesRecords.ToArray(), visitOccurrences, observationPeriods))
         {
            yield return r;
         }

         foreach (var r in BuildObservationsOncology(oncologyRecords.ToArray(), visitOccurrences, observationPeriods))
         {
            yield return r;
         }
      }

      private IEnumerable<Measurement> BuildMeasurementOncology(Measurement[] measurements, Dictionary<long, VisitOccurrence> visitOccurrences,
         ObservationPeriod[] observationPeriods)
      {
         foreach (var measurement in base.BuildMeasurement(measurements, visitOccurrences, observationPeriods))
         {
            if (measurement.AdditionalFields != null && measurement.AdditionalFields.ContainsKey("test_result"))
            {
               decimal value;
               if (decimal.TryParse(measurement.AdditionalFields["test_result"], out value))
                  measurement.ValueAsNumber = value;
            }

            if (measurement.AdditionalFields != null && measurement.AdditionalFields.ContainsKey("normal_range"))
            {
               var range = measurement.AdditionalFields["normal_range"];

               if (!string.IsNullOrEmpty(range) && range.Contains('-'))
               {
                  var lowValue = range.Split(new[] { '-' })[0];
                  var highValue = range.Split(new[] { '-' })[1];
                  decimal low, high;

                  if (decimal.TryParse(lowValue, out low))
                     measurement.RangeLow = low;

                  if (decimal.TryParse(highValue, out high))
                     measurement.RangeHigh = high;
               }
            }

            if (measurement.TypeConceptId == 0)
               measurement.TypeConceptId = 44818701;

            yield return measurement;
         }
      }

      private IEnumerable<Measurement> BuildMeasurementSES(Measurement[] measurements, Dictionary<long, VisitOccurrence> visitOccurrences,
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

      public override IEnumerable<Measurement> BuildMeasurement(Measurement[] measurements, Dictionary<long, VisitOccurrence> visitOccurrences,
         ObservationPeriod[] observationPeriods)
      {
         var sesRecords = new List<Measurement>();
         var oncologyRecords = new List<Measurement>();

         foreach (var e in measurements)
         {
            if (e.AdditionalFields != null && e.AdditionalFields.ContainsKey("source_type"))
            {
               if (e.AdditionalFields["source_type"] == "ses")
                  sesRecords.Add(e);
               else
                  oncologyRecords.Add(e);
            }
         }

         foreach (var r in BuildMeasurementSES(sesRecords.ToArray(), visitOccurrences, observationPeriods))
         {
            yield return r;
         }

         foreach (var r in BuildMeasurementOncology(oncologyRecords.ToArray(), visitOccurrences, observationPeriods))
         {
            yield return r;
         }
      }

      private static Death CleanUpDeath(IEnumerable<IEntity> items, Death death)
      {
         if (death == null) return null;

         return items.Any(item => item.StartDate > death.StartDate.AddDays(30)) ? null : death;
      }

      public IEnumerable<VisitOccurrence> GetIPClaims(IEnumerable<VisitOccurrence> visitOccurrences)
      {
         foreach (var ipGroup in visitOccurrences.Where(vo => vo.AdditionalFields != null && vo.AdditionalFields.ContainsKey("pat_planid")).GroupBy(vo => vo.AdditionalFields["pat_planid"]))
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
                        if (previousClaim.VisitCosts == null)
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

      private IEnumerable<VisitOccurrence> BuildVisitOccurrencesSES(IEnumerable<VisitOccurrence> rawVisitOccurrences,
         ObservationPeriod[] observationPeriods)
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
         foreach (var patplanidGroup in erVisits.Where(vo => vo.AdditionalFields != null && vo.AdditionalFields.ContainsKey("pat_planid")).GroupBy(vo => vo.AdditionalFields["pat_planid"]))
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

         foreach (var patplanidGroup in opVisits.Where(vo => vo.AdditionalFields != null && vo.AdditionalFields.ContainsKey("pat_planid")).GroupBy(vo => vo.AdditionalFields["pat_planid"]))
         {
            foreach (var opGroup in patplanidGroup.GroupBy(v => v.StartDate))
            {
               foreach (var opGroup1 in opGroup.Where(vo => vo.AdditionalFields != null && vo.AdditionalFields.ContainsKey("prov")).GroupBy(v => v.AdditionalFields["prov"]))
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

      public override IEnumerable<VisitOccurrence> BuildVisitOccurrences(VisitOccurrence[] rawVisitOccurrences, ObservationPeriod[] observationPeriods)
      {
         //var sesVisits = new List<VisitOccurrence>();
         //var oncologyVisits = new List<VisitOccurrence>();

         //foreach (var v in rawVisitOccurrences)
         //{
         //   if (v.AdditionalFields != null && v.AdditionalFields.ContainsKey("source_type"))
         //   {
         //      if(v.AdditionalFields["source_type"] == "ses")
         //         sesVisits.Add(v);
         //      else
         //         oncologyVisits.Add(v);
         //   }
         //}
         return BuildVisitOccurrencesSES(rawVisitOccurrences, observationPeriods);
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
            person.DayOfBirth = fisrtOP.Day;
         }
         else
         {
            person.MonthOfBirth = null;
            person.DayOfBirth = null;
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

         if (death != null && person.YearOfBirth.HasValue && person.YearOfBirth.Value > 0 &&
             person.YearOfBirth > death.StartDate.Year)
            death = null;

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
                            new Measurement(entity) {Id = chunkData.KeyMasterOffset.MeasurementId};

                  if (entity.AdditionalFields != null && entity.AdditionalFields.ContainsKey("test_result"))
                  {
                     mes.ValueSourceValue = entity.AdditionalFields["test_result"];
                  }

                  if (mes.TypeConceptId != 44786627 && mes.TypeConceptId != 44786629)
                     mes.TypeConceptId = 45754907;

                  chunkData.AddData(mes);
                  break;

               case "Meas Value":
                  var m = entity as Measurement ??
                            new Measurement(entity) {Id = chunkData.KeyMasterOffset.MeasurementId};

                  if (entity.AdditionalFields != null && entity.AdditionalFields.ContainsKey("test_result"))
                  {
                     m.ValueSourceValue = entity.AdditionalFields["test_result"];
                  }

                  if (m.TypeConceptId != 44786627 && m.TypeConceptId != 44786629)
                     m.TypeConceptId = 45754907;

                  m.TypeConceptId = 45754907;
                  chunkData.AddData(m);
                  break;

               case "Observation":
                  chunkData.AddData(entity as Observation ?? new Observation(entity) { Id = chunkData.KeyMasterOffset.ObservationId });
                  break;

               case "Procedure":
                  var proc = entity as ProcedureOccurrence ??
                             new ProcedureOccurrence(entity)
                             {
                                Id =
                                   chunkData.KeyMasterOffset.ProcedureOccurrenceId
                             };

                  chunkData.AddData(proc);

                  if (proc.TypeConceptId == 0)
                     proc.TypeConceptId = 38000275;
                  else if (proc.TypeConceptId == 44786627 || proc.TypeConceptId == 44786629) 
                     proc.TypeConceptId = 42865906;

                  break;

               case "Device":
                  chunkData.AddData(entity as DeviceExposure ??
                                                            new DeviceExposure(entity)
                                                            {
                                                               Id = chunkData.KeyMasterOffset.DeviceExposureId
                                                            });
                  break;

               case "Drug":
                  var drg = entity as DrugExposure ??
                            new DrugExposure(entity)
                            {
                               Id = chunkData.KeyMasterOffset.DrugExposureId,
                               GetEraConceptIdsCall = vocabulary.LookupIngredientLevel
                            };

                  if (drg.TypeConceptId == 0)
                     drg.TypeConceptId = 38000275;

                  drugForEra.Add(drg);
                  chunkData.AddData(drg);
                  break;

            }

            //HIX-823
            if (domain == "Procedure" && entityDomain != "Procedure")
            {
               var po = (ProcedureOccurrence)entity;
               po.ConceptId = 0;
               chunkData.AddData(po);
            }

            if (domain == "Observation" && entityDomain != "Observation")
            {
               var o = (Observation)entity;
               o.ConceptId = 0;
               chunkData.AddData(o);
            }
         }
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
            if (procedureOccurrence.ProcedureCosts == null) continue;
            
            foreach (var procedureCost in procedureOccurrence.ProcedureCosts)
            {
               //TOTAL_OUT_OF_POCKET = COINS + DEDUCT
               procedureCost.TotalOutOfPocket = procedureCost.PaidCoinsurance + procedureCost.PaidTowardDeductible;
               procedureCost.Id = procedureOccurrence.Id;
               yield return procedureCost;
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
   }
}
