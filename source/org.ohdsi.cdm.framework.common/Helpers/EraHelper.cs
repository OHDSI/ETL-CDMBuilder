using org.ohdsi.cdm.framework.common.Builder;
using org.ohdsi.cdm.framework.common.Omop;
using System;
using System.Collections.Generic;
using System.Linq;

namespace org.ohdsi.cdm.framework.common.Helpers
{
    public class EraHelper
    {
        public static IEnumerable<EraEntity> GetEras(IEnumerable<IEntity> entities, int gap1, int type1)
        {
            var filterdEntities = entities.Where(e => e.IncludeInEra()).ToList();
            var eraConceptIds = new HashSet<int>();

            foreach (var entity in filterdEntities)
            {
                if (entity.Ingredients != null && entity.Ingredients.Count > 0)
                {
                    foreach (var ingredient in entity.Ingredients)
                    {
                        eraConceptIds.Add(ingredient);
                    }
                }
                else
                {
                    entity.Ingredients = new List<int> { entity.ConceptId };
                    eraConceptIds.Add(entity.ConceptId);
                }
            }

            foreach (int eraConceptId in eraConceptIds)
            {
                int ecId = eraConceptId;
                IEnumerable<IEntity> containedEntities = filterdEntities.Where(d => d.Ingredients.Contains(ecId));
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

        public static List<ObservationPeriod> GetObservationPeriods(int gap, EraEntity[] entities, KeyMasterOffsetManager offset)
        {
            return
               GetEras(entities, gap, entities[0].TypeConceptId ?? -1).Select(
                  period =>
                     new ObservationPeriod
                     {
                         Id = offset.GetKeyOffset(period.PersonId).ObservationPeriodId,
                         PersonId = period.PersonId,
                         StartDate = period.StartDate,
                         EndDate = period.EndDate.Value,
                         TypeConceptId = period.TypeConceptId
                     }).
                  ToList();
        }

        public static List<PayerPlanPeriod> GetPayerPlanPeriods(PayerPlanPeriod[] entities, Func<PayerPlanPeriod, PayerPlanPeriod, bool> canBeCombined, KeyMasterOffsetManager offset)
        {
            return GetPayerPlanPeriods(entities, 32, canBeCombined, offset);
        }

        public static List<PayerPlanPeriod> GetPayerPlanPeriods(PayerPlanPeriod[] entities, int gap, Func<PayerPlanPeriod, PayerPlanPeriod, bool> canBeCombined, KeyMasterOffsetManager offset)
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
                    Id = offset.GetKeyOffset(i.PersonId).PayerPlanPeriodId,
                    PersonId = i.PersonId,
                    StartDate = i.StartDate,
                    EndDate = i.EndDate,
                    PayerSourceValue =
                                                                                    payerPlanPeriod.PayerSourceValue,
                    FamilySourceValue =
                                                                                    payerPlanPeriod.FamilySourceValue,
                    PlanSourceValue =
                                                                                    payerPlanPeriod.PlanSourceValue,
                    PayerConceptId = payerPlanPeriod.PayerConceptId,
                    PayerSourceConceptId = payerPlanPeriod.PayerSourceConceptId,
                    PlanConceptId = payerPlanPeriod.PlanConceptId,
                    PlanSourceConceptId = payerPlanPeriod.PlanSourceConceptId,
                    SponsorConceptId = payerPlanPeriod.SponsorConceptId,
                    SponsorSourceConceptId = payerPlanPeriod.SponsorSourceConceptId,
                    SponsorSourceValue = payerPlanPeriod.SponsorSourceValue,
                    StopReasonConceptId = payerPlanPeriod.StopReasonConceptId,
                    StopReasonSourceConceptId = payerPlanPeriod.StopReasonSourceConceptId,
                    StopReasonSourceValue = payerPlanPeriod.StopReasonSourceValue,
                    VisitOccurrenceId = i.VisitOccurrenceId
                }));

                list.Clear();
                payerPlanPeriod = entity;
                list.Add(entity);
            }

            result.AddRange(GetEras(list, gap, -1).Select(i => new PayerPlanPeriod
            {
                Id = offset.GetKeyOffset(i.PersonId).PayerPlanPeriodId,
                PersonId = i.PersonId,
                StartDate = i.StartDate,
                EndDate = i.EndDate,
                PayerSourceValue =
                                                                                payerPlanPeriod.PayerSourceValue,
                FamilySourceValue =
                                                                                payerPlanPeriod.FamilySourceValue,
                PlanSourceValue =
                                                                                payerPlanPeriod.PlanSourceValue,
                PayerConceptId = payerPlanPeriod.PayerConceptId,
                PayerSourceConceptId = payerPlanPeriod.PayerSourceConceptId,
                PlanConceptId = payerPlanPeriod.PlanConceptId,
                PlanSourceConceptId = payerPlanPeriod.PlanSourceConceptId,
                SponsorConceptId = payerPlanPeriod.SponsorConceptId,
                SponsorSourceConceptId = payerPlanPeriod.SponsorSourceConceptId,
                SponsorSourceValue = payerPlanPeriod.SponsorSourceValue,
                StopReasonConceptId = payerPlanPeriod.StopReasonConceptId,
                StopReasonSourceConceptId = payerPlanPeriod.StopReasonSourceConceptId,
                StopReasonSourceValue = payerPlanPeriod.StopReasonSourceValue,
                VisitOccurrenceId = i.VisitOccurrenceId
            }));


            return result;
        }
    }
}
