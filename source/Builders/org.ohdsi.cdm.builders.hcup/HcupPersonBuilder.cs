using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using org.ohdsi.cdm.framework.core;
using org.ohdsi.cdm.framework.core.Base;
using org.ohdsi.cdm.framework.entities.Omop;
using org.ohdsi.cdm.framework.shared.Enums;

namespace org.ohdsi.cdm.builders.hcup
{
   public class HcupPersonBuilder : PersonBuilder
	{
      private readonly Dictionary<Guid, VisitOccurrence> rawVisits = new Dictionary<Guid, VisitOccurrence>();
      private Person currentPerson;
      private int personAge;

      public override IEnumerable<ConditionOccurrence> BuildConditionOccurrences(ConditionOccurrence[] conditionOccurrences, Dictionary<long, VisitOccurrence> visitOccurrences,
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

      public override IEnumerable<ProcedureOccurrence> BuildProcedureOccurrences(ProcedureOccurrence[] procedureOccurrences, Dictionary<long, VisitOccurrence> visitOccurrences,
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

            if(prday > lengthOfStay) continue;

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
            int.TryParse(currentPerson.AdditionalFields["los"], out lengthOfStay);

            if(lengthOfStay > 0)
               op.EndDate = op.EndDate.Value.AddDays(lengthOfStay);
         }

         return base.BuildObservationPeriods(gap, observationPeriods);
      }

      public override IEnumerable<VisitOccurrence> BuildVisitOccurrences(VisitOccurrence[] visitOccurrences, ObservationPeriod[] observationPeriods)
      {
         foreach (var vo in visitOccurrences)
         {
            var op = observationPeriods.FirstOrDefault();
            if(op == null) continue;

            vo.StartDate = op.StartDate;
            vo.EndDate = op.EndDate;

            rawVisits.Add(vo.SourceRecordGuid, vo);
         }

         return visitOccurrences;
      }

      private VisitOccurrence GetVisitOccurrence(IEntity ent)
      {
         if (rawVisits.ContainsKey(ent.SourceRecordGuid))
            return rawVisits[ent.SourceRecordGuid];

         return null;
      }
      
      private DateTime CalculateStartDate(IEntity op)
      {
         var year = op.StartDate.Year;
         int amonth;
         int.TryParse(currentPerson.AdditionalFields["amonth"], out amonth);

         if (amonth < 1)
            amonth = GetMonth(op.PersonId.ToString(CultureInfo.InvariantCulture));

         //Logger.Write(null, LogMessageTypes.Debug, "<<<<< " + year + " " + " " + amonth);
         var startDate = new DateTime(year, amonth, 1);

         var isWeekend = currentPerson.AdditionalFields["aweekend"].Equals("1");
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

      public override Person BuildPerson(List<Person> records)
      {
         if (records == null || records.Count == 0) return null;

         var ordered = records.OrderByDescending(p => p.StartDate);
         var person = ordered.Take(1).First();
         person.StartDate = ordered.Take(1).Last().StartDate;

         var gender =
            records.GroupBy(p => p.GenderConceptId).OrderByDescending(gp => gp.Count()).Take(1).First().First();
         var race = records.GroupBy(p => p.RaceConceptId).OrderByDescending(gp => gp.Count()).Take(1).First().First();

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

         return person;
      }

      public override Death BuildDeath(Death[] death, Dictionary<long, VisitOccurrence> visitOccurrences, ObservationPeriod[] observationPeriods)
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

      public override void Build(Dictionary<string, long> providers)
      {
         var buildPerson = BuildPerson(personRecords.ToList());
         if (buildPerson == null) return;
         this.currentPerson = buildPerson;

         var observationPeriods =
            BuildObservationPeriods(buildPerson.ObservationPeriodGap, observationPeriodsRaw.ToArray()).ToArray();

         int age;
         int.TryParse(personRecords.ToArray()[0].AdditionalFields["age"], out age);
         personAge = age;

         int ageday;
         int.TryParse(personRecords.ToArray()[0].AdditionalFields["ageday"], out ageday);
         
         if (age > 0)
         {
            buildPerson.YearOfBirth = observationPeriods[0].StartDate.Year - age;
         }
         else if (string.IsNullOrEmpty(personRecords.ToArray()[0].AdditionalFields["ageday"]) &&
                  personRecords.ToArray()[0].AdditionalFields["age_neonate"] == "1")
         {
            buildPerson.YearOfBirth = observationPeriods[0].StartDate.Year;
         }
         else if ((personRecords.ToArray()[0].AdditionalFields["ageday"] == null &&
                  personRecords.ToArray()[0].AdditionalFields["age_neonate"] != "1") || ageday < 0)
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

         // Delete any individual that has an OBSERVATION_PERIOD that is >= 2 years prior to the YEAR_OF_BIRTH
         if (Excluded(buildPerson, observationPeriods)) return;
         
         var payerPlanPeriods = BuildPayerPlanPeriods(payerPlanPeriodsRaw.ToArray(), null).ToArray();
         var visitOccurrences = new Dictionary<long, VisitOccurrence>();

         foreach (var visitOccurrence in BuildVisitOccurrences(visitOccurrencesRaw.ToArray(), observationPeriods))
         {
            if (visitOccurrence.IdUndefined)
               visitOccurrence.Id = chunkData.KeyMasterOffset.VisitOccurrenceId;

            visitOccurrences.Add(visitOccurrence.Id, visitOccurrence);
         }

         var drugExposures =
            BuildDrugExposures(drugExposuresRaw.ToArray(), visitOccurrences, observationPeriods).ToArray();
         var conditionOccurrences =
            BuildConditionOccurrences(conditionOccurrencesRaw.ToArray(), visitOccurrences, observationPeriods).ToArray();
         var procedureOccurrences =
            BuildProcedureOccurrences(procedureOccurrencesRaw.ToArray(), visitOccurrences, observationPeriods).ToArray();
         var observations = BuildObservations(observationsRaw.ToArray(), visitOccurrences, observationPeriods).ToArray();
         var measurements = BuildMeasurement(measurementsRaw.ToArray(), visitOccurrences, observationPeriods).ToArray();
         var deviceExposure =
            BuildDeviceExposure(deviceExposureRaw.ToArray(), visitOccurrences, observationPeriods).ToArray();

        
         var death = BuildDeath(deathRecords.ToArray(), visitOccurrences, observationPeriods);
         var drugCosts = BuildDrugCosts(drugExposures).ToArray();
         var procedureCosts = BuildProcedureCosts(procedureOccurrences).ToArray();
         var visitCosts = BuildVisitCosts(visitOccurrences.Values.ToArray()).ToArray();
         var devicCosts = BuildDeviceCosts(deviceExposure).ToArray();

         var cohort = BuildCohort(cohortRecords.ToArray(), observationPeriods).ToArray();


         // push built entities to ChunkBuilder for further save to CDM database
         AddToChunk(buildPerson, death, observationPeriods, payerPlanPeriods, drugExposures, drugCosts,
            conditionOccurrences, procedureOccurrences, procedureCosts, observations, measurements,
            visitOccurrences.Values.ToArray(), visitCosts, cohort, deviceExposure, devicCosts);
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

                  var cond = entity as ConditionOccurrence ??
                             new ConditionOccurrence(entity)
                             {
                                Id = chunkData.KeyMasterOffset.ConditionOccurrenceId
                             };

              
                  //Person < 12 years old with live birth. Removing condition_occurrence
                  if (cond.ConceptId == 4014295 && personAge < 12)
                     continue;

                  //Male with live birth. Removing condition_occurrence
                  if (cond.ConceptId == 4014295 && currentPerson.GenderConceptId == 8507)
                     continue;

                  conditionForEra.Add(cond);
                  chunkData.AddData(cond);

                  break;

               case "Measurement":
                  var mes = entity as Measurement ??
                            new Measurement(entity)
                            {
                               Id = chunkData.KeyMasterOffset.MeasurementId
                            };


                  mes.ValueAsConceptId = GetValueAsConceptId(mes, 4181412);


                  chunkData.AddData(mes);
                  break;

               case "Meas Value":
                  chunkData.AddData(entity as Measurement ??
                                    new Measurement(entity) {Id = chunkData.KeyMasterOffset.MeasurementId});
                  break;

               case "Observation":
                  var obser = entity as Observation ??
                              new Observation(entity)
                              {
                                 Id = chunkData.KeyMasterOffset.ObservationId
                              };


                  obser.ValueAsConceptId = GetValueAsConceptId(obser, 45877994);

                  chunkData.AddData(obser);
                  break;

               case "Procedure":
                  chunkData.AddData(entity as ProcedureOccurrence ??
                                    new ProcedureOccurrence(entity)
                                    {
                                       Id =
                                          chunkData.KeyMasterOffset.ProcedureOccurrenceId
                                    });
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

                  drugForEra.Add(drg);
                  chunkData.AddData(drg);
                  break;

            }

            //HIX-823
            if (domain == "Procedure" && entityDomain != "Procedure")
            {
               var po = (ProcedureOccurrence) entity;
               po.ConceptId = 0;
               chunkData.AddData(po);
            }

            if (domain == "Observation" && entityDomain != "Observation")
            {
               var o = (Observation) entity;
               o.ConceptId = 0;
               chunkData.AddData(o);
            }
         }
      }

      private long GetValueAsConceptId(IEntity mes, long defaultConceptId)
      {
         var result = vocabulary.Lookup(mes.SourceValue, @"HCUP\Lookups\MapsToValue.sql", DateTime.MinValue, false);
         long conceptId = defaultConceptId;

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
         hashCode ^= (hashCode >> 20) ^ (hashCode >> 12);
         return hashCode ^ (hashCode >> 7) ^ (hashCode >> 4);
      }
	}
}
