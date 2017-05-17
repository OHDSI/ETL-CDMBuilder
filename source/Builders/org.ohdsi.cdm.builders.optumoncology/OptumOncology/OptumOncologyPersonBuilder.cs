using System.Collections.Generic;
using System.Linq;
using org.ohdsi.cdm.framework.core.Base;
using org.ohdsi.cdm.framework.entities.Omop;


namespace org.ohdsi.cdm.builders.optumoncology
{
   /// <summary>
   ///  Implementation of PersonBuilder for Optum, based on CDM Build spec
   /// </summary>
   public class OptumOncologyPersonBuilder : PersonBuilder
   {
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

      public override IEnumerable<DrugExposure> BuildDrugExposures(DrugExposure[] drugExposures, Dictionary<long, VisitOccurrence> visitOccurrences,
         ObservationPeriod[] observationPeriods)
      {
         foreach (var drugExposure in base.BuildDrugExposures(drugExposures, visitOccurrences, observationPeriods))
         {
            if (!drugExposure.Quantity.HasValue && drugExposure.AdditionalFields != null)
            {
               int? quantity = null;
               if (drugExposure.AdditionalFields.ContainsKey("quantity_per_fill") && !string.IsNullOrEmpty(drugExposure.AdditionalFields["quantity_per_fill"]))
               {
                  var q = drugExposure.AdditionalFields["quantity_per_fill"].Split(new[] {' '})[0];
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

      public override Death BuildDeath(Death[] death, Dictionary<long, VisitOccurrence> visitOccurrences, ObservationPeriod[] observationPeriods)
      {
         foreach (var d in death)
         {
            d.StartDate = d.StartDate.AddMonths(1).AddDays(-1);
         }

         return base.BuildDeath(death, visitOccurrences, observationPeriods);
      }

      public override IEnumerable<ObservationPeriod> BuildObservationPeriods(int gap, EraEntity[] observationPeriods)
      {
         foreach (var op in observationPeriods)
         {
            op.EndDate = op.EndDate.Value.AddMonths(1).AddDays(-1);
         }

         return base.BuildObservationPeriods(gap, observationPeriods);
      }

      public override IEnumerable<Observation> BuildObservations(Observation[] observations, Dictionary<long, VisitOccurrence> visitOccurrences,
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

      public override IEnumerable<Measurement> BuildMeasurement(Measurement[] measurements, Dictionary<long, VisitOccurrence> visitOccurrences,
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
                  var lowValue = range.Split(new[] {'-'})[0];
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

      private static Death CleanUpDeath(IEnumerable<IEntity> items, Death death)
      {
         if (death == null) return null;

         return items.Any(item => item.StartDate > death.StartDate.AddDays(30)) ? null : death;
      }

      public override void Build(Dictionary<string, long> providers)
      {
         var person = BuildPerson(personRecords.ToList());
         if (person == null) return;

         var observationPeriods =
            BuildObservationPeriods(person.ObservationPeriodGap, observationPeriodsRaw.ToArray()).ToArray();

         // Delete any individual that has an OBSERVATION_PERIOD that is >= 2 years prior to the YEAR_OF_BIRTH
         if (Excluded(person, observationPeriods)) return;

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

         // set corresponding PlanPeriodIds to drug exposure entities and procedure occurrence entities
         SetPayerPlanPeriodId(payerPlanPeriods, drugExposures, procedureOccurrences, visitOccurrences.Values.ToArray(),
            deviceExposure);

         // set corresponding ProviderIds
         SetProviderIds(drugExposures, providers);
         SetProviderIds(conditionOccurrences, providers);
         SetProviderIds(procedureOccurrences, providers);
         SetProviderIds(observations, providers);

         var death = BuildDeath(deathRecords.ToArray(), visitOccurrences, observationPeriods);
         var drugCosts = BuildDrugCosts(drugExposures).ToArray();
         var procedureCosts = BuildProcedureCosts(procedureOccurrences).ToArray();
         var visitCosts = BuildVisitCosts(visitOccurrences.Values.ToArray()).ToArray();
         var devicCosts = BuildDeviceCosts(deviceExposure).ToArray();

         var cohort = BuildCohort(cohortRecords.ToArray(), observationPeriods).ToArray();

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
         AddToChunk(person, death, observationPeriods, payerPlanPeriods, drugExposures, drugCosts,
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
   }
}
