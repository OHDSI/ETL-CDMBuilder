using System;
using System.Collections.Generic;
using System.Linq;
using org.ohdsi.cdm.framework.entities.Builder;
using org.ohdsi.cdm.framework.entities.Omop;

namespace org.ohdsi.cdm.framework.core.Helpers
{
    public class EraHelper
    {
        public static IEnumerable<EraEntity> GetEras(IEnumerable<IEntity> entities, int gap1, int type1)
        {
            var filterdEntities = entities.Where(e => e.IncludeInEra()).ToList();
            var eraConceptIds = new Dictionary<long, bool>();
            foreach (var eraConceptId in filterdEntities.SelectMany(entity => entity.GetEraConceptIds().Where(eraConceptId => eraConceptId.HasValue)))
            {
                eraConceptIds[eraConceptId.Value] = false;
            }

            foreach (long eraConceptId in eraConceptIds.Keys)
            {
                long ecId = eraConceptId;
                IEnumerable<IEntity> containedEntities = filterdEntities.Where(d => d.GetEraConceptIds().Contains(ecId));
                List<IEntity> ordered = containedEntities.OrderBy(d => d.StartDate).ThenBy(d => d.EndDate).ToList();

                if (ordered.Count > 1)
                {
                    var era = new EraEntity
                       {
                           PersonId = ordered[0].PersonId,
                           ConceptId = ecId,
                           StartDate = ordered[0].StartDate,
                           EndDate = GetEndDate(ordered[0]),
                           TypeConceptId = type1,
                           GapDays = 0,
                           OccurrenceCount = 1
                       };

                    foreach (var entity in ordered.Skip(1))
                    {
                        var currentGap = entity.StartDate.Subtract(era.EndDate.Value).Days;
                        
                        if (currentGap > gap1)
                        {
                            yield return era;

                            era = new EraEntity
                               {
                                   PersonId = entity.PersonId,
                                   ConceptId = ecId,
                                   StartDate = entity.StartDate,
                                   EndDate = GetEndDate(entity),
                                   TypeConceptId = type1,
                                   GapDays = 0,
                                   OccurrenceCount = 1
                               };
                        }
                        else
                        {
                            if (currentGap > 0)
                              era.GapDays += currentGap;

                            if (GetEndDate(entity) > era.EndDate)
                                era.EndDate = GetEndDate(entity);

                            era.OccurrenceCount++;
                        }
                    }

                    yield return era;
                }
                else
                {
                    yield return new EraEntity
                          {
                              PersonId = ordered[0].PersonId,
                              ConceptId = ecId,
                              StartDate = ordered[0].StartDate,
                              EndDate = GetEndDate(ordered[0]),
                              TypeConceptId = type1,
                              GapDays = 0,
                              OccurrenceCount = 1
                          };
                }
            }
        }

        private static DateTime GetEndDate(IEntity entity)
        {
            return entity.GetEndDate();
        }

        public static List<ObservationPeriod> GetObservationPeriods(int gap, EraEntity[] entities, ChunkData chunkData)
       {
          return
             GetEras(entities, gap, entities[0].TypeConceptId.HasValue ? entities[0].TypeConceptId.Value : -1).Select(
                period =>
                   new ObservationPeriod
                   {
                      Id = chunkData.KeyMasterOffset.ObservationPeriodId,
                      PersonId = period.PersonId,
                      StartDate = period.StartDate,
                      EndDate = period.EndDate.Value,
                      TypeConceptId = period.TypeConceptId
                   }).
                ToList();
       }

        public static List<PayerPlanPeriod> GetPayerPlanPeriods(PayerPlanPeriod[] entities, Func<PayerPlanPeriod, PayerPlanPeriod, bool> canBeCombined, ChunkData chunkData)
        {
           return GetPayerPlanPeriods(entities, 32, canBeCombined, chunkData);
        }

        public static List<PayerPlanPeriod> GetPayerPlanPeriods(PayerPlanPeriod[] entities, int gap, Func<PayerPlanPeriod, PayerPlanPeriod, bool> canBeCombined, ChunkData chunkData)
        {
            var result = new List<PayerPlanPeriod>();
            if (entities.Length == 0) return result;

            var ordered =
               entities.OrderBy(e => e.StartDate).ToList();
            var payerPlanPeriod = ordered[0];
            var list = new List<PayerPlanPeriod>();

            foreach (var entity in ordered)
            {
                if (canBeCombined(entity, payerPlanPeriod))
                {
                    list.Add(entity);
                    continue;
                }

                result.AddRange(GetEras(list, gap, -1).Select(i => new PayerPlanPeriod
                                                                             {
                                                                                 Id = chunkData.KeyMasterOffset.PayerPlanPeriodId,
                                                                                 PersonId = i.PersonId,
                                                                                 StartDate = i.StartDate,
                                                                                 EndDate = i.EndDate,
                                                                                 PayerSourceValue =
                                                                                    payerPlanPeriod.PayerSourceValue,
                                                                                 FamilySourceValue =
                                                                                    payerPlanPeriod.FamilySourceValue,
                                                                                 PlanSourceValue =
                                                                                    payerPlanPeriod.PlanSourceValue
                                                                             }));

                list.Clear();
                payerPlanPeriod = entity;
                list.Add(entity);
            }

            result.AddRange(GetEras(list, gap, -1).Select(i => new PayerPlanPeriod
                                                                         {
                                                                             Id = chunkData.KeyMasterOffset.PayerPlanPeriodId,
                                                                             PersonId = i.PersonId,
                                                                             StartDate = i.StartDate,
                                                                             EndDate = i.EndDate,
                                                                             PayerSourceValue =
                                                                                payerPlanPeriod.PayerSourceValue,
                                                                             FamilySourceValue =
                                                                                payerPlanPeriod.FamilySourceValue,
                                                                             PlanSourceValue =
                                                                                payerPlanPeriod.PlanSourceValue
                                                                         }));


            return result;
        }
    }
}
