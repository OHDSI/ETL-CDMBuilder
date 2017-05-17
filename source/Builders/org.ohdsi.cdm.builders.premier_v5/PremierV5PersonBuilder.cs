using System;
using System.Collections.Generic;
using System.Linq;
using org.ohdsi.cdm.framework.core.Base;
using org.ohdsi.cdm.framework.entities.Omop;
using org.ohdsi.cdm.framework.shared.Enums;

namespace org.ohdsi.cdm.builders.premier_v5
{
   /// <summary>
   ///  Implementation of PersonBuilder for Premier, based on CDM Build spec
   /// </summary>
   public class PremierV5PersonBuilder : PersonBuilder
   {
      private readonly Dictionary<long, int> visitsMaxServDays = new Dictionary<long, int>();

      /// <summary>
      /// Build person entity and all person related entities like: DrugExposures, ConditionOccurrences, ProcedureOccurrences... from raw data sets 
      /// </summary>
      public override void Build(Dictionary<string, long> providers)
      {
         var person = BuildPerson(personRecords.ToList());

         if (person == null) return;
         
         var observationPeriodsFromVisits = new List<EraEntity>();
         
         //Filter out visits with start date before 1999 year
         var visits = CleanVisitOccurrences(visitOccurrencesRaw).ToArray();
         if (!visits.Any()) return;

         var visitOccurrences = BuildVisitOccurrences(visits, null).ToDictionary(vo => vo.Id);
         var death = BuildDeath(deathRecords.ToArray(), visitOccurrences, null);

         //Exclude visits with start date after person death date
         var cleanedVisits = CleanUp(visitOccurrences.Values.ToArray(), death).ToArray();
         visitOccurrences.Clear();

         // Create set of observation period entities from set of visit entities
         var visitsDictionary = new Dictionary<Guid, VisitOccurrence>();
         foreach (var vo in cleanedVisits)
         {
            visitOccurrences.Add(vo.Id, vo);
            visitsDictionary.Add(vo.SourceRecordGuid, vo);
            observationPeriodsFromVisits.Add(new EraEntity
            {
               Id = chunkData.KeyMasterOffset.ObservationPeriodId,
               PersonId = vo.PersonId,
               StartDate = vo.StartDate,
               EndDate = vo.EndDate
            });
         }

         var minYearOfBirth = 9999;
         var maxYearOfBirth = 0;

         // Calculate max/min value of person year of birth
         // MONTH_OF_BIRTH and DAY_OF_BIRTH are not available in Premier, 
         // because age is the only available field. YEAR_OF_BIRTH is calculated from the first admission. 
         // The admission year minus the age results in the YEAR_OF_BIRTH. 
         foreach (var personRecord in personRecords)
         {
            if (!visitsDictionary.ContainsKey(personRecord.SourceRecordGuid)) continue;

            var yearOfBirth = visitsDictionary[personRecord.SourceRecordGuid].StartDate.Year - personRecord.YearOfBirth;

            if(yearOfBirth < 1900)
               continue;

            if (yearOfBirth < minYearOfBirth)
               minYearOfBirth = yearOfBirth.Value;

            if (yearOfBirth > maxYearOfBirth)
               maxYearOfBirth = yearOfBirth.Value;
         }

         // If a person has YEAR_OF_BIRTH that varies over two years then those records are eliminated
         if (maxYearOfBirth - minYearOfBirth > 2) return;
         var minVOYear = visitOccurrences.Values.Min(vo => vo.StartDate).Year;
         //Person year of birth is after minumum visit start
         if (person.YearOfBirth > minVOYear) return;

         person.YearOfBirth = minVOYear - person.YearOfBirth;

         var observationPeriods =
            BuildObservationPeriods(person.ObservationPeriodGap, observationPeriodsFromVisits.Distinct().ToArray())
               .ToArray();

         //Delete any individual that has an OBSERVATION_PERIOD that is >= 2 years prior to the YEAR_OF_BIRTH
         if (Excluded(person, observationPeriods)) return;

         var payerPlanPeriods =
            CleanUp(BuildPayerPlanPeriods(payerPlanPeriodsRaw.ToArray(), visitOccurrences), death).ToArray();

         var drugExposures =
            CleanUp(BuildDrugExposures(drugExposuresRaw.ToArray(), visitOccurrences, observationPeriods), death)
               .ToArray();
         var conditionOccurrences =
            CleanUp(BuildConditionOccurrences(conditionOccurrencesRaw.ToArray(), visitOccurrences, observationPeriods),
               death).ToArray();
         var procedureOccurrences =
            CleanUp(BuildProcedureOccurrences(procedureOccurrencesRaw.ToArray(), visitOccurrences, observationPeriods),
               death).ToArray();
         var observations =
            CleanUp(BuildObservations(observationsRaw.ToArray(), visitOccurrences, observationPeriods), death).ToArray();

         var measurements =
            CleanUp(BuildMeasurement(measurementsRaw.ToArray(), visitOccurrences, observationPeriods), death).ToArray();

         var deviceExposure = CleanUp(BuildDeviceExposure(deviceExposureRaw.ToArray(), visitOccurrences, observationPeriods), death).ToArray();

         // set corresponding ProviderIds
         SetPayerPlanPeriodId(payerPlanPeriods, drugExposures, procedureOccurrences, visitOccurrences.Values.ToArray(), deviceExposure);

         //var drugCosts = BuildDrugCosts(drugExposures).ToArray();
         //var procedureCosts = BuildProcedureCosts(procedureOccurrences).ToArray();
         //var devicCosts = BuildDeviceCosts(deviceExposure).ToArray();
         //var visitCosts = BuildVisitCosts(visitOccurrences.Values.ToArray()).ToArray();

         // push built entities to ChunkBuilder for further save to CDM database
         AddToChunk(person, death,
            observationPeriods,
            payerPlanPeriods,
            drugExposures,
            new DrugCost[0], 
            conditionOccurrences,
            procedureOccurrences,
            new ProcedureCost[0], 
            observations,
            measurements,
            visitOccurrences.Values.ToArray(), new VisitCost[0], new Cohort[0], deviceExposure, new DeviceCost[0]);
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
                  chunkData.AddData(mes);
                  if (mes.MeasurementCost != null && mes.MeasurementCost.Count > 0)
                  {
                     foreach (var mc in mes.MeasurementCost)
                     {
                        chunkData.AddData(new Cost
                        {
                           CostId = chunkData.KeyMasterOffset.VisitCostId, //tmp
                           CurrencyConceptId = mc.CurrencyConceptId.Value,
                           TotalCharge = mc.TotalPaid,
                           TotalCost = mc.PaidByPayer,
                           RevenueCodeConceptId = mc.RevenueCodeConceptId,
                           RevenueCodeSourceValue = mc.RevenueCodeSourceValue,
                           Domain = entityDomain,
                           TypeId = 0,
                           EventId = mes.Id
                        }, EntityType.Cost);
                     }
                  }
                  break;

               case "Meas Value":
                  var mv = entity as Measurement ??
                           new Measurement(entity) {Id = chunkData.KeyMasterOffset.MeasurementId};
                  chunkData.AddData(mv);
                  if (mv.MeasurementCost != null && mv.MeasurementCost.Count > 0)
                  {
                     foreach (var mc in mv.MeasurementCost)
                     {
                        chunkData.AddData(new Cost
                        {
                           CostId = chunkData.KeyMasterOffset.VisitCostId, //tmp
                           CurrencyConceptId = mc.CurrencyConceptId.Value,
                           TotalCharge = mc.TotalPaid,
                           TotalCost = mc.PaidByPayer,
                           RevenueCodeConceptId = mc.RevenueCodeConceptId,
                           RevenueCodeSourceValue = mc.RevenueCodeSourceValue,
                           Domain = entityDomain,
                           TypeId = 0,
                           EventId = mv.Id
                        }, EntityType.Cost);
                     }
                  }
                  break;

               case "Observation":
                  var obser = entity as Observation ??
                              new Observation(entity) {Id = chunkData.KeyMasterOffset.ObservationId};
                  chunkData.AddData(obser);
                  if (obser.ObservationCost != null && obser.ObservationCost.Count > 0)
                  {
                     foreach (var oc in obser.ObservationCost)
                     {
                        chunkData.AddData(new Cost
                        {
                           CostId = chunkData.KeyMasterOffset.VisitCostId, //tmp
                           CurrencyConceptId = oc.CurrencyConceptId.Value,
                           TotalCharge = oc.TotalPaid,
                           TotalCost = oc.PaidByPayer,
                           RevenueCodeConceptId = oc.RevenueCodeConceptId,
                           RevenueCodeSourceValue = oc.RevenueCodeSourceValue,
                           Domain = entityDomain,
                           TypeId = 0,
                           EventId = obser.Id
                        }, EntityType.Cost);
                     }
                  }
                  break;

               case "Procedure":
                  var p = entity as ProcedureOccurrence ??
                             new ProcedureOccurrence(entity)
                             {
                                Id =
                                   chunkData.KeyMasterOffset.ProcedureOccurrenceId
                             };

                  if (entity.AdditionalFields != null && entity.AdditionalFields.ContainsKey("quantity") && !string.IsNullOrEmpty(entity.AdditionalFields["quantity"]))
                  {
                     int qty;
                     int.TryParse(entity.AdditionalFields["quantity"], out qty);
                     p.Quantity = qty;
                  }

                  chunkData.AddData(p);

                  if (p.ProcedureCosts != null && p.ProcedureCosts.Count > 0)
                  {
                     foreach (var pc in p.ProcedureCosts)
                     {
                        chunkData.AddData(new Cost
                        {
                           CostId = chunkData.KeyMasterOffset.VisitCostId, //tmp
                           CurrencyConceptId = pc.CurrencyConceptId,
                           TotalCharge = pc.TotalPaid,
                           TotalCost = pc.PaidByPayer,
                           RevenueCodeConceptId = pc.RevenueCodeConceptId,
                           RevenueCodeSourceValue = pc.RevenueCodeSourceValue,
                           Domain = entityDomain,
                           TypeId = 0,
                           EventId = p.Id
                        }, EntityType.Cost);
                     }

                  }
                  break;

               case "Device":
                  var dev = entity as DeviceExposure ??
                            new DeviceExposure(entity)
                            {
                               Id = chunkData.KeyMasterOffset.DeviceExposureId
                            };
                  chunkData.AddData(dev);
                  if (dev.DeviceCosts != null && dev.DeviceCosts.Count > 0)
                  {
                     foreach (var dc in dev.DeviceCosts)
                     {
                        chunkData.AddData(new Cost
                        {
                           CostId = chunkData.KeyMasterOffset.VisitCostId, //tmp
                           CurrencyConceptId = dc.CurrencyConceptId.Value,
                           TotalCharge = dc.TotalPaid,
                           TotalCost = dc.PaidByPayer,
                           RevenueCodeConceptId = dc.RevenueCodeConceptId,
                           RevenueCodeSourceValue = dc.RevenueCodeSourceValue,
                           Domain = entityDomain,
                           TypeId = 0,
                           EventId = dev.Id
                        }, EntityType.Cost);
                     }
                  }
                  break;

               case "Drug":
                  var drg = entity as DrugExposure ??
                            new DrugExposure(entity)
                            {
                               Id = chunkData.KeyMasterOffset.DrugExposureId,
                               GetEraConceptIdsCall = vocabulary.LookupIngredientLevel
                            };

                  drugForEra.Add(drg);
                  chunkData.AddData(drg);

                  if (drg.DrugCost != null)
                  {
                     chunkData.AddData(new Cost
                     {
                        CostId = chunkData.KeyMasterOffset.VisitCostId, //tmp
                        CurrencyConceptId = drg.DrugCost.CurrencyConceptId.Value,
                        TotalCharge = drg.DrugCost.TotalPaid,
                        TotalCost = drg.DrugCost.PaidByPayer,
                        RevenueCodeConceptId = drg.DrugCost.RevenueCodeConceptId,
                        RevenueCodeSourceValue = drg.DrugCost.RevenueCodeSourceValue,
                        Domain = entityDomain,
                        TypeId = 0,
                        EventId = drg.Id
                     }, EntityType.Cost);
                  }

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

      public override bool Excluded(Person person, IEnumerable<ObservationPeriod> periods)
      {
         //Invalid Year Of Birth (Year of Birth after coverage start)
         return periods.Any(period => person.YearOfBirth > period.StartDate.Year);
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

         var gender = records[0];

         // if a person has multiple genders that are specified then those records are eliminated.
         if (records.Any(p => p.GenderConceptId != gender.GenderConceptId))
            return null;

         if (!records.Any(r => r.YearOfBirth < 130))
            return null;

         // YearOfBirth contains age value, YearOfBirth calculated in Build() method 
         var maxYearOfBirth = records.Where(r => r.YearOfBirth < 130).Max(p => p.YearOfBirth);
         person.YearOfBirth = maxYearOfBirth;

         //take the maximum value of race for people that have multiple values 
         var race = records.OrderBy(p => p.RaceSourceValue).ThenBy(p => p.EthnicitySourceValue).First();

         person.GenderConceptId = gender.GenderConceptId;
         person.GenderSourceValue = gender.GenderSourceValue;
         person.RaceConceptId = race.RaceConceptId;
         person.RaceSourceValue = race.RaceSourceValue;
         person.EthnicitySourceValue = race.EthnicitySourceValue;
         person.EthnicityConceptId = race.EthnicityConceptId;

         //Person has ethnicity value, but no race value
         if (person.EthnicityConceptId.HasValue && person.EthnicityConceptId > 0 &&
             (!person.RaceConceptId.HasValue || person.RaceConceptId == 0))
            return null;

         if (person.GenderConceptId == 8551) //UNKNOWN
            return null;

         return person;
      }

      public static int TryGetInt(string item)
      {
         int i;
         bool success = int.TryParse(item, out i);
         return success ? i : 0;
      }
      
      /// <summary>
      /// Projects Enumeration of Visit Occurrence from the raw set of Visit Occurrence entities. 
      /// During build:
      /// Logic guarantees that length of visits is preserved and the order of visits. 
      /// The specific day of the month in start date or end date is not necessary accurate, and the time between to two visits is not necessary accurate. 
      /// The algorithm will always set the new visit start date plus 1 day or use the backward logic and assume that the visit end date is the first day of the new month.
      ///  </summary>
      /// <param name="visitOccurrences">raw set of Visit Occurrence entities</param>
      /// <param name="observationPeriods">the observation periods entities for current person</param>
      /// <returns>Enumeration of Visit Occurrence</returns>
      public override IEnumerable<VisitOccurrence> BuildVisitOccurrences(VisitOccurrence[] visitOccurrences,
         ObservationPeriod[] observationPeriods)
      {
         // Determinate max service day value for current person. 
         UpdateMaxServDays();
         var lastEndDate = DateTime.MinValue;
         var lastEndMonth = DateTime.MinValue;


         //Logic is defined to take each person, visit, sequence order and add the maximum number of service days to their stay starting with the first of the month. 
         //Each visit that occurs after the first will use the previous end date +1 as the visit start date, 
         //and then the service days are added to the start date to determine to end date.
         foreach (
            var vo in
               visitOccurrences.OrderBy(vo => vo.EndDate).ThenBy(vo => TryGetInt(vo.AdditionalFields["disc_mon_seq"])))
         {
            var maxServDay = 0;

            if (visitsMaxServDays.ContainsKey(vo.Id))
            {
               maxServDay = visitsMaxServDays[vo.Id];
            }

            if (maxServDay == 0)
               maxServDay = 1;

            if (vo.StartDate == vo.EndDate)
            {
               // should only fire on first record or when dis_mon_seq = 1
               if (lastEndMonth < vo.StartDate)
               {
                  vo.EndDate = vo.StartDate.AddDays(maxServDay) < vo.StartDate.AddMonths(1)
                     ? vo.StartDate.AddDays(maxServDay - 1) //if endate falls in month, use it
                     : vo.StartDate.AddMonths(1).AddDays(-1); //otherwise, set to last day of the month

                  lastEndMonth = vo.StartDate;
                  lastEndDate = vo.EndDate.Value;
               }
               else
               {
                  if (lastEndDate < lastEndMonth.AddMonths(1).AddDays(-1))
                  {
                     vo.StartDate = lastEndDate.AddDays(1);
                  }
                  else
                  {
                     vo.StartDate = lastEndMonth.AddMonths(1).AddDays(-1);
                  }

                  vo.EndDate = lastEndDate.AddDays(maxServDay) < lastEndMonth.AddMonths(1).AddDays(-1)
                     ? lastEndDate.AddDays(maxServDay)
                     : lastEndMonth.AddMonths(1).AddDays(-1);
                  lastEndDate = vo.EndDate.Value;
               }
            }
            // startdate <> enddate, which means the visit spans across months
            else
            {
               if (lastEndMonth == vo.StartDate)
               {
                  var incrementValue = 0;
                  if (lastEndDate < lastEndMonth.AddMonths(1).AddDays(-1))
                     incrementValue = 1;

                  if (vo.EndDate.Value.Subtract(lastEndDate.AddDays(incrementValue)).Days > maxServDay)
                     vo.StartDate = vo.EndDate.Value.AddDays((maxServDay - 1)*-1);
                  else
                     vo.StartDate = lastEndDate.AddDays(1);

                  lastEndMonth = vo.EndDate.Value;

                  if (vo.StartDate.AddDays(maxServDay - 1) < vo.EndDate.Value.AddMonths(1))
                     vo.EndDate = vo.StartDate.AddDays(maxServDay - 1);
                  else
                     vo.EndDate = vo.EndDate.Value.AddMonths(1).AddDays(-1);

                  lastEndDate = vo.EndDate.Value;
               }
               else
               {
                  vo.StartDate = vo.EndDate.Value.AddDays((maxServDay - 1)*-1);
                  lastEndMonth = vo.EndDate.Value;
                  lastEndDate = vo.EndDate.Value;
               }
            }

            yield return vo;
         }
      }

      public override IEnumerable<DeviceExposure> BuildDeviceExposure(DeviceExposure[] devExposure, Dictionary<long, VisitOccurrence> visitOccurrences,
         ObservationPeriod[] observationPeriods)
      {
         var uniqueEntities = new HashSet<DeviceExposure>(new PatbillDeviceExposureComparer());
         foreach (var de in devExposure)
         {
            if (!de.VisitOccurrenceId.HasValue) continue;
            if (!visitOccurrences.ContainsKey(de.VisitOccurrenceId.Value)) continue;

            var visitOccurrence = visitOccurrences[de.VisitOccurrenceId.Value];

            if (de.AdditionalFields != null &&
                de.AdditionalFields.ContainsKey("serv_day")) // coming from PATBILL
            {
               SetDate(de, visitOccurrence, de.AdditionalFields["serv_day"]);
            }
            else
            {
               de.StartDate = visitOccurrence.EndDate.Value;
            }

            uniqueEntities.Add(de);
         }

         return uniqueEntities;
      }

      /// <summary>
      /// 	Projects Enumeration of drug exposure from the raw set of drug exposure entities. 
		/// 	During build:
      ///	override the drug's start date using the end date of the corresponding visit.
      ///	overide TypeConceptId per CDM Mapping spec. 
      /// </summary>
      /// <param name="drugExposures">raw set of drug exposures entities</param>
      /// <param name="visitOccurrences">the visit occurrences entities for current person</param>
      /// <param name="observationPeriods">the observation periods entities for current person</param>
      /// <returns>Enumeration of drug exposure entities</returns>
      public override IEnumerable<DrugExposure> BuildDrugExposures(DrugExposure[] drugExposures,
         Dictionary<long, VisitOccurrence> visitOccurrences, ObservationPeriod[] observationPeriods)
      {
         var patbillEntities = new HashSet<DrugExposure>(new PatbillDrugExposureComparer());
         var otherEntities = new HashSet<DrugExposure>();

         foreach (var drugExposure in drugExposures)
         {
            if (!drugExposure.VisitOccurrenceId.HasValue) continue;
            if (!visitOccurrences.ContainsKey(drugExposure.VisitOccurrenceId.Value)) continue;

            var visitOccurrence = visitOccurrences[drugExposure.VisitOccurrenceId.Value];

            if (drugExposure.AdditionalFields != null &&
             drugExposure.AdditionalFields.ContainsKey("serv_day")) // coming from PATBILL
            {
               SetDate(drugExposure, visitOccurrence, drugExposure.AdditionalFields["serv_day"]);

               patbillEntities.Add(drugExposure);
            }
            else //patcpt or paticd
            {
               drugExposure.StartDate = visitOccurrence.EndDate.Value;
               otherEntities.Add(drugExposure);
            }
         }

         foreach (var patbillEntity in patbillEntities)
         {
            yield return patbillEntity;
         }

         foreach (var uniqueEntity in otherEntities)
         {
            yield return uniqueEntity;
         }
      }

      
      /// <summary>
      /// Projects Enumeration of ConditionOccurrence from the raw set of ConditionOccurrence entities. 
		/// 	During build:
		/// 	override the condition's start date using the end date of the corresponding visit.
      /// </summary>
      /// <param name="conditionOccurrences">raw set of condition occurrence entities</param>
      /// <param name="visitOccurrences">the visit occurrence entities for current person</param>
      /// <param name="observationPeriods">the observation period entities for current person</param>
      /// <returns>Enumeration of condition occurrence entities</returns>
		public override IEnumerable<ConditionOccurrence> BuildConditionOccurrences(
         ConditionOccurrence[] conditionOccurrences, Dictionary<long, VisitOccurrence> visitOccurrences,
         ObservationPeriod[] observationPeriods)
      {
         var patbillEntities = new HashSet<ConditionOccurrence>(new PatbillConditionOccurrenceComparer());
         var uniqueEntities = new HashSet<ConditionOccurrence>();
         foreach (var conditionOccurrence in conditionOccurrences)
         {
            if (!conditionOccurrence.VisitOccurrenceId.HasValue) continue;
            if (!visitOccurrences.ContainsKey(conditionOccurrence.VisitOccurrenceId.Value)) continue;

            var visitOccurrence = visitOccurrences[conditionOccurrence.VisitOccurrenceId.Value];

            if (conditionOccurrence.AdditionalFields != null &&
            conditionOccurrence.AdditionalFields.ContainsKey("serv_day")) // coming from PATBILL
            {
               SetDate(conditionOccurrence, visitOccurrence, conditionOccurrence.AdditionalFields["serv_day"]);

               patbillEntities.Add(conditionOccurrence);
            }
            else //patcpt or paticd
            {
               conditionOccurrence.StartDate = visitOccurrence.StartDate;
               uniqueEntities.Add(conditionOccurrence);
            }
         }

         foreach (var patbillEntity in patbillEntities)
         {
            yield return patbillEntity;
         }

         foreach (var uniqueEntity in uniqueEntities)
         {
            yield return uniqueEntity;
         }
      }

      /// <summary>
      /// Projects Enumeration of ProcedureOccurrence from the raw set of ProcedureOccurence entities.
      /// During build:
	   /// override the procedure's start date using the end date of the corresponding visit.
      /// overide TypeConceptId per CDM Mapping spec. 
      /// </summary>
      /// <param name="procedureOccurrences">raw set of procedure occurrence entities</param>
      /// <param name="visitOccurrences">the visit occurrence entities for current person</param>
      /// <param name="observationPeriods">the observation period entities for current person</param>
      /// <returns>Enumeration of procedure occurrence entities</returns>
      public override IEnumerable<ProcedureOccurrence> BuildProcedureOccurrences(
         ProcedureOccurrence[] procedureOccurrences, Dictionary<long, VisitOccurrence> visitOccurrences,
         ObservationPeriod[] observationPeriods)
      {
         var uniqueEntities = new HashSet<ProcedureOccurrence>(new PatbillProcedureOccurrenceComparer());
         foreach (var procedureOccurrence in procedureOccurrences)
         {
            if (!procedureOccurrence.VisitOccurrenceId.HasValue) continue;
            if (!visitOccurrences.ContainsKey(procedureOccurrence.VisitOccurrenceId.Value)) continue;

            var visitOccurrence = visitOccurrences[procedureOccurrence.VisitOccurrenceId.Value];

            // If the procedure is a CPT code or ICD9 procedure code then discharge date is used as procedure date because the exact date is unknown. 
            // If the row is coming from PATBILL then a combination or admit date and service date is used.
            if (procedureOccurrence.AdditionalFields != null &&
                procedureOccurrence.AdditionalFields.ContainsKey("serv_day")) // coming from PATBILL
            {
               SetDate(procedureOccurrence, visitOccurrence, procedureOccurrence.AdditionalFields["serv_day"]);
            }
            else if (procedureOccurrence.AdditionalFields != null &&
            procedureOccurrence.AdditionalFields.ContainsKey("proc_day"))
            {
               SetDate(procedureOccurrence, visitOccurrence, procedureOccurrence.AdditionalFields["proc_day"]);
            }
            else //the procedure is a CPT code or ICD9 procedure code
            {
               procedureOccurrence.StartDate = visitOccurrence.EndDate.Value;
            }

            uniqueEntities.Add(procedureOccurrence);
         }

         return uniqueEntities;
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
         var ppp = new List<PayerPlanPeriod>();
         foreach (var pp in payerPlanPeriods)
         {
            if (!pp.VisitOccurrenceId.HasValue) continue;
            if (!visitOccurrences.ContainsKey(pp.VisitOccurrenceId.Value)) continue;

            var visitOccurrence = visitOccurrences[pp.VisitOccurrenceId.Value];

            pp.StartDate = visitOccurrence.StartDate;
            pp.EndDate = visitOccurrence.EndDate;

            ppp.Add(pp);
         }

         var result = new List<PayerPlanPeriod>();
         foreach (
            var currentPeriod in ppp.OrderBy(p => p.StartDate).ThenBy(p => p.EndDate).ThenBy(p => p.PayerSourceValue))
         {
            if (result.Count == 0)
            {
               result.Add(currentPeriod);
               continue;
            }

            if (result.Last().PayerSourceValue == currentPeriod.PayerSourceValue) // IF PLAN DOESN'T CHANGE
            {
               // IF THERE IS A GAP
               if (currentPeriod.StartDate.Subtract(result.Last().EndDate.Value).Days > 32)
               {
                  result.Add(currentPeriod);
               }
               else // IF THERE IS NO GAP
               {
                  result.Last().EndDate = currentPeriod.EndDate;
               }
            }
            else
            {
               //3.	If plan 1 end date is greater or equal or plan 2 end date, we will drop those records, and only use the first one. 
               if (result.Last().EndDate >= currentPeriod.EndDate)
               {
                  continue;
               }

               //1.	If a person has different payers with plan 1 end date that is less than plan 2 end date and if plan 2 start date is less than or equal to plan 1 end date +1 then plan 2 visit start date will equal plan 1 visit end +1.
               //2.	The second change is when there is an overlap of two periods, we will keep the entire first payer plan period, and then increment the next start date by one day so there is no overlap.
               if (result.Last().EndDate < currentPeriod.EndDate &&
                   currentPeriod.StartDate <= result.Last().EndDate.Value.AddDays(1))
               {
                  currentPeriod.StartDate = result.Last().EndDate.Value.AddDays(1);
               }

               result.Add(currentPeriod);
            }
         }

         foreach (var payerPlanPeriod in result)
         {
            payerPlanPeriod.Id = chunkData.KeyMasterOffset.PayerPlanPeriodId;

            if (payerPlanPeriod.EndDate < payerPlanPeriod.StartDate)
               payerPlanPeriod.EndDate = payerPlanPeriod.StartDate;

            yield return payerPlanPeriod;
         }
      }

      /// <summary>
      /// Projects death entity from the raw set of death entities.
      /// During build:
      /// override the death's start date using the end date of the corresponding visit.
      /// </summary>
      /// <param name="inputDeaths">raw set of death entities</param>
      /// <param name="visitOccurrences">the visit occurrence entities for current person</param>
      /// <param name="observationPeriods">the observation period entities for current person</param>
      /// <returns>death entity</returns>
      public override Death BuildDeath(Death[] inputDeaths, Dictionary<long, VisitOccurrence> visitOccurrences,
         ObservationPeriod[] observationPeriods)
      {
         var deaths = inputDeaths.ToList();
         if (deaths.Count > 0)
         {
            deaths.RemoveAll(
               d => !d.VisitOccurrenceId.HasValue || !visitOccurrences.ContainsKey(d.VisitOccurrenceId.Value));

            if (deaths.Count > 0)
            {
               foreach (var death in deaths)
               {
                  death.StartDate = visitOccurrences[death.VisitOccurrenceId.Value].EndDate.Value;
               }

               // Keep only one record for each patient, if both discharge status and ICD9 codes indicate death, use discharge status first
               var primary_deaths = deaths.Where(d => d.Primary).ToList();
               return primary_deaths.Any()
                  ? primary_deaths.OrderBy(d => d.StartDate).First()
                  : deaths.OrderBy(d => d.StartDate).First();
            }
         }

         return null;
      }

      /// <summary>
      /// Projects Enumeration of Observations from the raw set of Observation entities. 
      /// During build:
      /// override the observations start date using the start date of the corresponding visit.
      /// </summary>
      /// <param name="observations">raw set of observations entities</param>
      /// <param name="visitOccurrences">the visit occurrences entities for current person</param>
      /// <param name="observationPeriods">the observation periods entities for current person</param>
      /// <returns>Enumeration of Observation from the raw set of Observation entities</returns>
      public override IEnumerable<Observation> BuildObservations(Observation[] observations,
         Dictionary<long, VisitOccurrence> visitOccurrences, ObservationPeriod[] observationPeriods)
      {
         var uniqueEntities = new HashSet<Observation>();
         var patbillEntities = new HashSet<Observation>(new PatbillObservationComparer());
         foreach (var observation in observations)
         {
            var valueAsStringConceptIds = new long[]{4053609, 40757183, 40757177, 40769091};
            if (valueAsStringConceptIds.Any(c => c == observation.ConceptId) && string.IsNullOrEmpty(observation.ValueAsString))
            {
               continue;
            }
            
            if (!observation.VisitOccurrenceId.HasValue) continue;
            if (!visitOccurrences.ContainsKey(observation.VisitOccurrenceId.Value)) continue;

            var visitOccurrence = visitOccurrences[observation.VisitOccurrenceId.Value];


            if (observation.AdditionalFields != null &&
            observation.AdditionalFields.ContainsKey("serv_day")) // coming from PATBILL
            {
               SetDate(observation, visitOccurrence, observation.AdditionalFields["serv_day"]);

               patbillEntities.Add(observation);
               
            }
            else //patcpt or paticd
            {
               observation.StartDate = visitOccurrence.StartDate;

               uniqueEntities.Add(observation);
            }
         }

         foreach (var patbillEntity in patbillEntities)
         {
            yield return patbillEntity;
         }

         foreach (var uniqueEntity in uniqueEntities)
         {
            yield return uniqueEntity;
         }
      }

      private static void SetDate(IEntity e, VisitOccurrence visitOccurrence, string value)
      {
         int servDay;
         int.TryParse(value, out servDay);

         if (servDay == 0 || servDay == 1)
         {
            e.StartDate = visitOccurrence.StartDate;
         }
         else if (servDay != 1 && visitOccurrence.StartDate.AddDays(servDay - 1) < visitOccurrence.EndDate)
         {
            e.StartDate = visitOccurrence.StartDate.AddDays(servDay - 1);
         }
         else
         {
            e.StartDate = visitOccurrence.EndDate.Value;
         }
      }

      private static IEnumerable<Measurement> HandleSurgeryMeasurements(IEnumerable<Measurement> measurements, Dictionary<long, VisitOccurrence> visitOccurrences)
      {
         foreach (var samePatKey in measurements.GroupBy(m => m.VisitOccurrenceId))
         {
            var sameDaySurgery = new Dictionary<string, List<Measurement>>();
 
            foreach (var m in samePatKey)
            {
               var day = m.AdditionalFields.ContainsKey("proc_day") ? m.AdditionalFields["proc_day"] : m.AdditionalFields["serv_day"];
               if(string.IsNullOrEmpty(day)) continue;
               if (!m.VisitOccurrenceId.HasValue) continue;
               if (!visitOccurrences.ContainsKey(m.VisitOccurrenceId.Value)) continue;

               if(!sameDaySurgery.ContainsKey(day))
                  sameDaySurgery.Add(day, new List<Measurement>());
               
               m.StartDate = m.StartDate.AddDays(int.Parse(day));
               var visitOccurrence = visitOccurrences[m.VisitOccurrenceId.Value];
               SetDate(m, visitOccurrence, day);

               sameDaySurgery[day].Add(m);
            }
            
            foreach (var surgeryDay in sameDaySurgery.Keys)
            {
               var icd = new Dictionary<string, Measurement>();
               var totalMinutes = new HashSet<int>();
               
               foreach (var m in sameDaySurgery[surgeryDay])
               {
                  if (m.AdditionalFields.ContainsKey("icd_code"))
                  {
                     var icdcode = m.AdditionalFields["icd_code"];
                     if (!string.IsNullOrEmpty(icdcode) && !icd.ContainsKey(icdcode))
                     {
                        icd.Add(icdcode, m);
                     }
                  }

                  if (m.AdditionalFields.ContainsKey("quantity"))
                  {
                     int quantity;
                     int.TryParse(m.AdditionalFields["quantity"], out quantity);
                     var min = GetMinutes(m.AdditionalFields["std_chg_desc"]);
                     totalMinutes.Add(quantity*min);
                  }
               }

               foreach (var measurement in icd.Values)
               {
                  if (totalMinutes.Sum() <= 0) continue;
                  measurement.ValueAsNumber = totalMinutes.Sum();

                  yield return measurement;
               }
            }
         }
      }

      public override IEnumerable<Measurement> BuildMeasurement(Measurement[] measurements, Dictionary<long, VisitOccurrence> visitOccurrences,
         ObservationPeriod[] observationPeriods)
      {
         var uniqueEntities = new HashSet<Measurement>(new PatbillMeasurementComparer());
         var surgeryEntities = new List<Measurement>();
         foreach (var m in measurements)
         {
            if (!m.VisitOccurrenceId.HasValue) continue;
            if (!visitOccurrences.ContainsKey(m.VisitOccurrenceId.Value)) continue;
            
            var visitOccurrence = visitOccurrences[m.VisitOccurrenceId.Value];

            if (m.TypeConceptId == 45754907)
            {
               m.StartDate = visitOccurrence.StartDate;
               m.UnitConceptId = 8550;
               surgeryEntities.Add(m);
               continue;
            }

            if (m.AdditionalFields != null &&
                m.AdditionalFields.ContainsKey("serv_day")) // coming from PATBILL
            {
               SetDate(m, visitOccurrence, m.AdditionalFields["serv_day"]);
            }
            else
            {
               m.StartDate = visitOccurrence.EndDate.Value;
            }

            uniqueEntities.Add(m);
         }

         foreach (var surgeryMeasurement in HandleSurgeryMeasurements(surgeryEntities, visitOccurrences))
         {
            yield return surgeryMeasurement;
         }

         foreach (var measurement in uniqueEntities)
         {
            yield return measurement;
         }
      }


      /// <summary>
      /// Exclude records with start date after person death date
      /// </summary>
      /// <typeparam name="T">IEntity</typeparam>
      /// <param name="items">the set of entities for filtration</param>
      /// <param name="death">the death entity for current person</param>
      /// <returns>Enumeration of records prior to person death date</returns>
      private static IEnumerable<T> CleanUp<T>(IEnumerable<T> items, IEntity death) where T : IEntity
      {
         if (items == null) yield break;
         foreach (var item in items)
         {
            if (death == null)
            {
               yield return item;
            }
            else if (item.StartDate <= death.StartDate)
            {
               yield return item;
            }
         }
      }

      // Determinate max service day value for current person. 
      private void UpdateMaxServDays()
      {
         UpdateMaxServDays(conditionOccurrencesRaw);
         UpdateMaxServDays(drugExposuresRaw);
         UpdateMaxServDays(procedureOccurrencesRaw);
         UpdateMaxServDays(measurementsRaw);
         UpdateMaxServDays(observationsRaw);
         UpdateMaxServDays(deviceExposureRaw);
      }

      // The length of the stay is determined via the PAT.PAT_BILL table using the field SERV_DAY
      private void UpdateMaxServDays(IEnumerable<IEntity> input)
      {
         foreach (var visits in input.GroupBy(d => d.VisitOccurrenceId))
         {
            var maxServDay = 0;
            long? visitOccurrenceId = null;
            foreach (
               var entity in visits.Where(e => e.AdditionalFields != null && e.AdditionalFields.ContainsKey("serv_day"))
               )
            {
               visitOccurrenceId = entity.VisitOccurrenceId;
               int servDay;
               int.TryParse(entity.AdditionalFields["serv_day"], out servDay);

               if (servDay > maxServDay)
                  maxServDay = servDay;
            }

            if (visitOccurrenceId.HasValue)
            {
               if (!visitsMaxServDays.ContainsKey(visitOccurrenceId.Value))
               {
                  visitsMaxServDays.Add(visitOccurrenceId.Value, maxServDay);
               }
               else if (maxServDay > visitsMaxServDays[visitOccurrenceId.Value])
               {
                  visitsMaxServDays[visitOccurrenceId.Value] = maxServDay;
               }
            }
         }
      }

      /// <summary>
      /// Filter out visits with start date before 1999 year
      /// </summary>
      /// <param name="visitOccurrences">the visit occurrence entities for current person</param>
      /// <returns>Enumeration of visits with start date after 1999 year</returns>
      private static IEnumerable<VisitOccurrence> CleanVisitOccurrences(IEnumerable<VisitOccurrence> visitOccurrences)
      {
         return visitOccurrences.Where(visitOccurrence => visitOccurrence.StartDate.Year >= 1999);
      }

      public static int GetMinutes(string description)
      {
         if (string.IsNullOrEmpty(description)) return 0;

         var words = description.Split(new[] { ' ' }, StringSplitOptions.RemoveEmptyEntries);
         string hr = null;
         string min = null;

         for (int i = 0; i < words.Count(); i++)
         {
            if (string.Equals("hr", words[i], StringComparison.InvariantCultureIgnoreCase))
            {
               hr = words[i - 1];
            }
            else if (string.Equals("min", words[i], StringComparison.InvariantCultureIgnoreCase))
            {
               min = words[i - 1];
            }
         }

         int totalMinutes = 0;
         if (!string.IsNullOrEmpty(hr))
         {
            int h;
            if (int.TryParse(hr, out h))
               totalMinutes = 60 * h;
            else
               totalMinutes = 60;
         }

         if (!string.IsNullOrEmpty(min))
         {
            int m;
            if (int.TryParse(min, out m))
               totalMinutes += m;
         }

         return totalMinutes;
      }

   }
}
