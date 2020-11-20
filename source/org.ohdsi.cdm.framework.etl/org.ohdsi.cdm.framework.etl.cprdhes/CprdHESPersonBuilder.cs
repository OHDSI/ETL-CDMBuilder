using org.ohdsi.cdm.framework.common.Base;
using org.ohdsi.cdm.framework.common.Builder;
using org.ohdsi.cdm.framework.common.Helpers;
using org.ohdsi.cdm.framework.common.Omop;
using System;
using System.Collections.Generic;
using System.Linq;

namespace org.ohdsi.cdm.framework.etl.cprdhes
{
    /// <summary>
    ///  Implementation of PersonBuilder for CPRD, based on CDM Build spec
    /// </summary>
    public class CprdHESPersonBuilder : PersonBuilder
    {
        private readonly Dictionary<Guid, VisitDetail> _visitDetails = new Dictionary<Guid, VisitDetail>();

        public override string GetFolder()
        {
            return "ETL\\CPRDHES";
        }

        public override IEnumerable<VisitDetail> BuildVisitDetails(VisitDetail[] visitDetails, VisitOccurrence[] visitOccurrences,
            ObservationPeriod[] observationPeriods)
        {
            foreach (var visitDetail in visitDetails)
            {
                visitDetail.Id = Offset.GetKeyOffset(visitDetail.PersonId).VisitDetailId;

                if (!visitDetail.EndDate.HasValue)
                    visitDetail.EndDate = visitDetail.StartDate;

                _visitDetails.Add(visitDetail.SourceRecordGuid, visitDetail);

                yield return visitDetail;
            }
        }

        public override KeyValuePair<Person, Attrition> BuildPerson(List<Person> records)
        {
            if (records == null || records.Count == 0)
                return new KeyValuePair<Person, Attrition>(null, Attrition.UnacceptablePatientQuality);

            var person = records.First();
            person.YearOfBirth = 2020;
            person.GenderConceptId = 0;
            return new KeyValuePair<Person, Attrition>(person, Attrition.None);
        }

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

            var observationPeriods = new[]
            {
                new ObservationPeriod
                {
                    PersonId = person.PersonId,
                    StartDate = DateTime.MinValue,
                    EndDate = DateTime.MaxValue
                }
            };

            var visitDetails = BuildVisitDetails(VisitDetailsRaw.ToArray(), VisitOccurrencesRaw.ToArray(), observationPeriods).ToArray();

            var visitOccurrences = new Dictionary<long, VisitOccurrence>();
            var visitIds = new List<long>();
            foreach (var visitOccurrence in BuildVisitOccurrences(VisitOccurrencesRaw.ToArray(), observationPeriods))
            {
                if (!visitOccurrence.EndDate.HasValue)
                    visitOccurrence.EndDate = visitOccurrence.StartDate;

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
            }

            var observations = BuildObservations(ObservationsRaw.ToArray(), visitOccurrences, observationPeriods)
                .ToArray();

            foreach (var ob in observations)
            {
                ob.Id = Offset.GetKeyOffset(ob.PersonId).ObservationId;
            }

            var drugExposures =
                BuildDrugExposures(DrugExposuresRaw.ToArray(), visitOccurrences, observationPeriods)
                    .ToArray();

            var measurements = BuildMeasurement(MeasurementsRaw.ToArray(), visitOccurrences, observationPeriods)
                .ToArray();

            var deviceExposure = BuildDeviceExposure(DeviceExposureRaw.ToArray(), visitOccurrences, observationPeriods)
                .ToArray();

            SetVisitDetailId(drugExposures);
            SetVisitDetailId(conditionOccurrences);
            SetVisitDetailId(procedureOccurrences);
            SetVisitDetailId(measurements);
            SetVisitDetailId(observations);
            SetVisitDetailId(deviceExposure);

            // set corresponding ProviderIds
            SetProviderIds(drugExposures);
            SetProviderIds(conditionOccurrences);
            SetProviderIds(visitOccurrences.Values.ToArray());
            SetProviderIds(procedureOccurrences);
            SetProviderIds(observations);
            SetProviderIds(visitDetails);

            // push built entities to ChunkBuilder for further save to CDM database
            AddToChunk(person, null,
                new ObservationPeriod[0],
                new PayerPlanPeriod[0],
                drugExposures,
                conditionOccurrences,
                procedureOccurrences,
                observations,
                measurements,
                visitOccurrences.Values.ToArray(), visitDetails, new Cohort[0], deviceExposure, new Note[0]);

            Complete = true;

            return Attrition.None;
        }

        private void SetVisitDetailId(IEnumerable<IEntity> entities)
        {
            foreach (var e in entities)
            {
                var visitDetailIdSet = false;
                if (_visitDetails.ContainsKey(e.SourceRecordGuid))
                {
                    e.VisitDetailId = _visitDetails[e.SourceRecordGuid].Id;
                    visitDetailIdSet = true;
                }

                if (e.AdditionalFields != null && e.AdditionalFields.ContainsKey("description"))
                {
                    var description = e.AdditionalFields["description"];

                    var visitDetails = _visitDetails.Values.Where(vd => vd.SourceValue == description && vd.VisitOccurrenceId == e.VisitOccurrenceId).ToArray();
                    if (!visitDetailIdSet && visitDetails.Any())
                    {
                        e.VisitDetailId = visitDetails[0].VisitDetailId;
                    }

                    foreach (var vd in visitDetails)
                    {
                        if (string.IsNullOrEmpty(vd.ProviderKey)) continue;

                        e.ProviderKey = vd.ProviderKey;
                        break;
                    }
                }
            }
        }

        public override IEnumerable<EraEntity> BuildConditionEra(ConditionOccurrence[] conditionOccurrences, ObservationPeriod[] observationPeriods)
        {
            foreach (var eraEntity in EraHelper.GetEras(conditionOccurrences, 30, 38000247))
            {
                eraEntity.Id = Offset.GetKeyOffset(eraEntity.PersonId).ConditionEraId;
                yield return eraEntity;
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

                        var cond = entity as ConditionOccurrence ??
                                   new ConditionOccurrence(entity)
                                   {
                                       Id = Offset.GetKeyOffset(entity.PersonId).ConditionOccurrenceId
                                   };
                        ConditionForEra.Add(cond);
                        ChunkData.AddData(cond);
                        break;

                    case "Measurement":
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
            }
        }


    }
}
