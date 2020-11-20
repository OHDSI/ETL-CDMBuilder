using org.ohdsi.cdm.framework.common.Extensions;
using org.ohdsi.cdm.framework.common.Lookups;
using org.ohdsi.cdm.framework.common.Omop;
using System;
using System.Collections.Generic;
using System.Linq;

namespace org.ohdsi.cdm.framework.common.PregnancyAlgorithm
{
    public class PregnancyAlgorithm
    {
        private readonly OutcomeLimit[] _outcomeLimits;
        private readonly TermDurations[] _termDurations;
        private readonly GestEst[] _gestEsts;

        public PregnancyAlgorithm()
        {
            _outcomeLimits = new[]
            {
                new OutcomeLimit {Id = 1, FirstPregCategory = "LB", OutcomePregCategory = "LB", MinDays = 182},
                new OutcomeLimit {Id = 2, FirstPregCategory = "LB", OutcomePregCategory = "SB", MinDays = 168},
                new OutcomeLimit {Id = 3, FirstPregCategory = "LB", OutcomePregCategory = "DELIV", MinDays = 168},
                new OutcomeLimit {Id = 4, FirstPregCategory = "LB", OutcomePregCategory = "TRO", MinDays = 70},
                new OutcomeLimit {Id = 5, FirstPregCategory = "LB", OutcomePregCategory = "ECT", MinDays = 70},
                new OutcomeLimit {Id = 6, FirstPregCategory = "LB", OutcomePregCategory = "AB", MinDays = 70},
                new OutcomeLimit {Id = 7, FirstPregCategory = "LB", OutcomePregCategory = "SA", MinDays = 70},
                new OutcomeLimit {Id = 8, FirstPregCategory = "SB", OutcomePregCategory = "LB", MinDays = 182},
                new OutcomeLimit {Id = 11, FirstPregCategory = "SB", OutcomePregCategory = "SB", MinDays = 168},
                new OutcomeLimit {Id = 12, FirstPregCategory = "SB", OutcomePregCategory = "DELIV", MinDays = 168},
                new OutcomeLimit {Id = 13, FirstPregCategory = "SB", OutcomePregCategory = "TRO", MinDays = 70},
                new OutcomeLimit {Id = 14, FirstPregCategory = "SB", OutcomePregCategory = "ECT", MinDays = 70},
                new OutcomeLimit {Id = 15, FirstPregCategory = "SB", OutcomePregCategory = "AB", MinDays = 70},
                new OutcomeLimit {Id = 16, FirstPregCategory = "SB", OutcomePregCategory = "SA", MinDays = 70},
                new OutcomeLimit {Id = 17, FirstPregCategory = "DELIV", OutcomePregCategory = "LB", MinDays = 182},
                new OutcomeLimit {Id = 18, FirstPregCategory = "DELIV", OutcomePregCategory = "SB", MinDays = 168},
                new OutcomeLimit {Id = 19, FirstPregCategory = "DELIV", OutcomePregCategory = "DELIV", MinDays = 168},
                new OutcomeLimit {Id = 20, FirstPregCategory = "DELIV", OutcomePregCategory = "TRO", MinDays = 70},
                new OutcomeLimit {Id = 21, FirstPregCategory = "DELIV", OutcomePregCategory = "ECT", MinDays = 70},
                new OutcomeLimit {Id = 22, FirstPregCategory = "DELIV", OutcomePregCategory = "AB", MinDays = 70},
                new OutcomeLimit {Id = 23, FirstPregCategory = "DELIV", OutcomePregCategory = "SA", MinDays = 70},
                new OutcomeLimit {Id = 24, FirstPregCategory = "TRO", OutcomePregCategory = "LB", MinDays = 168},
                new OutcomeLimit {Id = 25, FirstPregCategory = "TRO", OutcomePregCategory = "SB", MinDays = 154},
                new OutcomeLimit {Id = 26, FirstPregCategory = "TRO", OutcomePregCategory = "DELIV", MinDays = 154},
                new OutcomeLimit {Id = 27, FirstPregCategory = "TRO", OutcomePregCategory = "TRO", MinDays = 730},
                new OutcomeLimit {Id = 28, FirstPregCategory = "TRO", OutcomePregCategory = "ECT", MinDays = 56},
                new OutcomeLimit {Id = 29, FirstPregCategory = "TRO", OutcomePregCategory = "AB", MinDays = 56},
                new OutcomeLimit {Id = 30, FirstPregCategory = "TRO", OutcomePregCategory = "SA", MinDays = 365},
                new OutcomeLimit {Id = 31, FirstPregCategory = "ECT", OutcomePregCategory = "LB", MinDays = 168},
                new OutcomeLimit {Id = 32, FirstPregCategory = "ECT", OutcomePregCategory = "SB", MinDays = 154},
                new OutcomeLimit {Id = 33, FirstPregCategory = "ECT", OutcomePregCategory = "DELIV", MinDays = 154},
                new OutcomeLimit {Id = 34, FirstPregCategory = "ECT", OutcomePregCategory = "TRO", MinDays = 365},
                new OutcomeLimit {Id = 35, FirstPregCategory = "ECT", OutcomePregCategory = "ECT", MinDays = 56},
                new OutcomeLimit {Id = 36, FirstPregCategory = "ECT", OutcomePregCategory = "AB", MinDays = 56},
                new OutcomeLimit {Id = 37, FirstPregCategory = "ECT", OutcomePregCategory = "SA", MinDays = 56},
                new OutcomeLimit {Id = 38, FirstPregCategory = "AB", OutcomePregCategory = "LB", MinDays = 168},
                new OutcomeLimit {Id = 39, FirstPregCategory = "AB", OutcomePregCategory = "SB", MinDays = 154},
                new OutcomeLimit {Id = 40, FirstPregCategory = "AB", OutcomePregCategory = "DELIV", MinDays = 154},
                new OutcomeLimit {Id = 41, FirstPregCategory = "AB", OutcomePregCategory = "TRO", MinDays = 365},
                new OutcomeLimit {Id = 42, FirstPregCategory = "AB", OutcomePregCategory = "ECT", MinDays = 56},
                new OutcomeLimit {Id = 43, FirstPregCategory = "AB", OutcomePregCategory = "AB", MinDays = 56},
                new OutcomeLimit {Id = 44, FirstPregCategory = "AB", OutcomePregCategory = "SA", MinDays = 56},
                new OutcomeLimit {Id = 45, FirstPregCategory = "SA", OutcomePregCategory = "LB", MinDays = 168},
                new OutcomeLimit {Id = 46, FirstPregCategory = "SA", OutcomePregCategory = "SB", MinDays = 154},
                new OutcomeLimit {Id = 47, FirstPregCategory = "SA", OutcomePregCategory = "DELIV", MinDays = 154},
                new OutcomeLimit {Id = 48, FirstPregCategory = "SA", OutcomePregCategory = "TRO", MinDays = 365},
                new OutcomeLimit {Id = 49, FirstPregCategory = "SA", OutcomePregCategory = "ECT", MinDays = 56},
                new OutcomeLimit {Id = 50, FirstPregCategory = "SA", OutcomePregCategory = "AB", MinDays = 56},
                new OutcomeLimit {Id = 51, FirstPregCategory = "SA", OutcomePregCategory = "SA", MinDays = 56}
            };

            _termDurations = new[]
            {
                new TermDurations { Category = "LB"   , MaxTerm = 301, MinTerm = 161, Retry = 28},
                new TermDurations { Category = "SB"   , MaxTerm = 301, MinTerm = 100, Retry = 28},
                new TermDurations { Category = "DELIV", MaxTerm = 301, MinTerm = 140, Retry = 28},
                new TermDurations { Category = "TRO"  , MaxTerm = 365, MinTerm = 42 , Retry = 14},
                new TermDurations { Category = "ECT"  , MaxTerm = 84 , MinTerm = 42 , Retry = 14},
                new TermDurations { Category = "AB"   , MaxTerm = 168, MinTerm = 42 , Retry = 14},
                new TermDurations { Category = "SA"   , MaxTerm = 139, MinTerm = 28 , Retry = 14}
            };

            _gestEsts = new[]
            {
                new GestEst { Id = 1, Category ="LB"   , PreTerm = 245, PostTerm = 285, FullTerm = 280, NoData = 280},
                new GestEst { Id = 2, Category ="SB"   , PreTerm = 196, PostTerm = 285, FullTerm = 280, NoData = 196},
                new GestEst { Id = 3, Category ="DELIV", PreTerm = 245, PostTerm = 285, FullTerm = 280, NoData = 280},
                new GestEst { Id = 4, Category ="TRO"  , PreTerm = 56 , PostTerm = 56 , FullTerm = 56 , NoData = 56},
                new GestEst { Id = 5, Category ="ECT"  , PreTerm = 56 , PostTerm = 56 , FullTerm = 56 , NoData = 56},
                new GestEst { Id = 6, Category ="AB"   , PreTerm = 70 , PostTerm = 70 , FullTerm = 70 , NoData = 70},
                new GestEst { Id = 7, Category ="SA"   , PreTerm = 70 , PostTerm = 70 , FullTerm = 70 , NoData = 70}
            };
        }

        // Outcome Types: LB: Livebirth, SB: Stillbirth, ECT: Ectopic Pregnancy, AB: Spontaneous and induced abortion, DELIV: Delivery 
        private readonly string[] _outcomeTypes = { "LB", "SB", "ECT", "AB", "SA", "DELIV" };

        // Invalid windows are spans of time around prior valid outcomes where a new outcome cannot occur
        private static bool HasInvalidWindow(Event e,
            Dictionary<string, Dictionary<string, OutcomeLimit>> outcomeLimits,
            Dictionary<string, List<Event>> validOutcomes)
        {
            foreach (var category in validOutcomes.Keys)
            {
                foreach (var pe in validOutcomes[category])
                {
                    if (pe.Guid == e.Guid)
                        continue;

                    if (!outcomeLimits.ContainsKey(e.Category) || !outcomeLimits.ContainsKey(pe.Category))
                        continue;

                    if (pe.Date <= e.Date) // prior
                    {
                        if (!outcomeLimits.ContainsKey(pe.Category)) continue;
                        if (!outcomeLimits[pe.Category].ContainsKey(e.Category)) continue;

                        if (e.Category == "LB")
                        {
                            if (e.Date.Subtract(pe.Date).TotalDays + 1 < outcomeLimits[pe.Category][e.Category].MinDays)
                                return true;
                        }
                        else if (e.Date.Subtract(pe.Date).TotalDays - 1 < outcomeLimits[pe.Category][e.Category].MinDays)
                            return true;
                    }
                    else if (pe.Date > e.Date)
                    {
                        if (!outcomeLimits.ContainsKey(e.Category)) continue;
                        if (!outcomeLimits[e.Category].ContainsKey(pe.Category)) continue;

                        if (pe.Date.Subtract(e.Date).TotalDays + 1 < outcomeLimits[e.Category][pe.Category].MinDays)
                            return true;
                    }
                }
            }

            return false;
        }

        private static bool AnyWithin(string outcomeType, int days, Event e, Dictionary<string, List<Event>> validOutcomes, bool canBeEqual)
        {
            if (!validOutcomes.ContainsKey(outcomeType))
                return false;

            if (canBeEqual)
                return validOutcomes[outcomeType].Any(pe => pe.Guid != e.Guid && pe.Date >= e.Date && pe.Date.Subtract(e.Date).TotalDays <= days);

            return validOutcomes[outcomeType].Any(pe => pe.Guid != e.Guid && pe.Date > e.Date && pe.Date.Subtract(e.Date).TotalDays <= days);
        }

        // Determine if a pregnancy outcome event is valid 
        private static bool IsValid(Event e, Dictionary<string, List<Event>> validOutcomes)
        {
            switch (e.Category)
            {
                case "SB":
                case "SA":
                case "AB":
                case "DELIV":
                    {
                        // no antenatal or pregnancy confirmation within 42 days of outcome date 
                        if (AnyWithin("AGP", 42, e, validOutcomes, false))
                            return false;
                        if (AnyWithin("PCONF", 42, e, validOutcomes, false))
                            return false;
                        break;
                    }
                case "ECT":
                    if (AnyWithin("AGP", 42, e, validOutcomes, false))
                        return false;
                    if (AnyWithin("PCONF", 42, e, validOutcomes, false))
                        return false;

                    //validate ectopic pregnancy, surgery or MTX or disporop concept within 2 weeks
                    return AnyWithin("ECT_SURG1", 14, e, validOutcomes, true) || AnyWithin("ECT_SURG2", 14, e, validOutcomes, true) || AnyWithin("MTX", 14, e, validOutcomes, true);
            }

            return true;
        }


        private static DateTime GetRevisedDate(string outcomeType, int window, Event e, Dictionary<string, List<Event>> validOutcomes)
        {
            if (!validOutcomes.ContainsKey(outcomeType))
                return DateTime.MinValue;

            var events = validOutcomes[outcomeType].Where(pe =>
                pe.Guid != e.Guid && pe.Date > e.Date &&
                pe.Date.Subtract(e.Date).TotalDays <= window).ToArray();

            if (events.Length > 0)
            {
                return events.Max(pe => pe.Date);
            }

            return DateTime.MinValue;
        }

        public IEnumerable<ConditionEra> GetPregnancyEpisodes(IVocabulary vocab, Person person, ObservationPeriod[] observationPeriods,
            ConditionOccurrence[] conditionOccurrences,
            ProcedureOccurrence[] procedureOccurrences, Observation[] observations, Measurement[] measurements,
            DrugExposure[] drugExposures)
        {
            if (person.GenderConceptId != 8532)
                yield break;

            var raw = new RawEvents();
            raw.Fill(vocab, conditionOccurrences, procedureOccurrences, observations, measurements, drugExposures);

            if (raw.PregnancyEvents.Count == 0)
                yield break;

            var outcomeLimits = new Dictionary<string, Dictionary<string, OutcomeLimit>>();
            foreach (var ol in _outcomeLimits)
            {
                if (!outcomeLimits.ContainsKey(ol.FirstPregCategory))
                {
                    outcomeLimits.Add(ol.FirstPregCategory, new Dictionary<string, OutcomeLimit>());
                }

                outcomeLimits[ol.FirstPregCategory].Add(ol.OutcomePregCategory, ol);
            }

            var termDurations = _termDurations.ToDictionary(termDuration => termDuration.Category);
            var gestEsts = _gestEsts.ToDictionary(ge => ge.Category);

            var validOutcomes = new Dictionary<string, List<Event>>();
            foreach (var outcomeType in _outcomeTypes)
            {
                if (!raw.PregnancyEvents.ContainsKey(outcomeType)) continue;

                foreach (var g in raw.PregnancyEvents[outcomeType].OrderBy(pe => pe.Date).GroupBy(pe => pe.Date))
                {
                    var e = g.First();
                    if (outcomeType == "AB" || outcomeType == "SA")
                    {
                        // Reassign abortion outcome date to last abortion date within 2 weeks after
                        var revisedDates = new List<DateTime>(2)
                        {
                            GetRevisedDate("SA", 14, e, raw.PregnancyEvents),
                            GetRevisedDate("AB", 14, e, raw.PregnancyEvents)
                        };
                        var revisedDate = revisedDates.Max();
                        if (revisedDate != DateTime.MinValue)
                            e.Date = revisedDate;
                    }
                    else if (outcomeType == "ECT")
                    {
                        // Reassign ectopic pregnancy outcome date to last treatment date within 2 weeks after
                        var revisedDates = new List<DateTime>(2)
                        {
                            GetRevisedDate("ECT_SURG1", 14, e, raw.PregnancyEvents),
                            GetRevisedDate("MTX", 14, e, raw.PregnancyEvents)
                        };

                        var revisedDate = revisedDates.Max();
                        if (revisedDate != DateTime.MinValue)
                            e.Date = revisedDate;
                    }

                    if (!HasInvalidWindow(e, outcomeLimits, validOutcomes) && IsValid(e, raw.PregnancyEvents))
                    {
                        if (!validOutcomes.ContainsKey(e.Category))
                            validOutcomes.Add(e.Category, new List<Event>());

                        validOutcomes[e.Category].Add(e);
                    }
                }
            }


            if (validOutcomes.Count > 0)
            {
                var allEpisodes = FindPregnancEpisodes(validOutcomes, raw, termDurations, gestEsts,
                    new[] { "OVUL", "OVUL2", "NULS", "AFP", "AMEN", "UP" }, true, false).ToList();

                allEpisodes.AddRange(FindPregnancEpisodes(validOutcomes, raw, termDurations, gestEsts,
                    new[] { "LMP", "GEST" }, false, true));

                var pconf = FindPregnancEpisodes(validOutcomes, raw, termDurations, gestEsts,
                    new[] { "PCONF", "AGP", "PCOMP", "TA" }, false, false).ToArray();
                var pconfEpisodes = new List<KeyValuePair<Event, Event>>();
                if (pconf.Any())
                {
                    pconfEpisodes.AddRange(pconf.GroupBy(p => p.Key.Guid)
                        .Select(g => g.OrderBy(e => e.Value.Date).First()));
                }

                var contraEpisodes = FindPregnancEpisodes(validOutcomes, raw, termDurations, gestEsts,
                    new[] { "CONTRA" }, false, true).ToArray();

                var all = GetEpisodesAllStarts(person, allEpisodes, pconfEpisodes, contraEpisodes).ToArray();
                foreach (var episodes in all.GroupBy(e => e.EndDate))
                {
                    var pe = episodes.OrderBy(e => e.TypeConceptId).ThenBy(e => e.StartDate).First();
                    var startDate = pe.StartDate;
                    var endDate = pe.EndDate.Value;
                    if (startDate.Year - person.YearOfBirth >= 12 && startDate.Year - person.YearOfBirth <= 55 &&
                        observationPeriods.Any(op =>
                            startDate >= op.StartDate && endDate.Between(op.StartDate, op.EndDate.Value)))
                    {
                        int cnt = 0;

                        foreach (var c in raw.PregnancyEvents.Keys)
                        {
                            foreach (var e in raw.PregnancyEvents[c])
                            {
                                if (e.Date.Between(
                                    endDate.AddDays(-1 * termDurations[pe.SourceValue].MaxTerm + 1), endDate))
                                {
                                    cnt++;
                                }
                            }
                        }

                        if (cnt >= 2)
                        {
                            pe.ConceptId = GetConceptId(pe);
                            yield return pe;
                        }
                    }
                }
            }

        }

        private static IEnumerable<ConditionEra> GetEpisodesAllStarts(Person person, List<KeyValuePair<Event, Event>> allEpisodes, List<KeyValuePair<Event, Event>> pconfEpisodes, KeyValuePair<Event, Event>[] contraEpisodes)
        {
            var all = new List<ConditionEra>();
            foreach (var episode in allEpisodes)
            {
                var category = episode.Value.Category;
                var rank = episode.Value.Rank;

                var startDate = episode.Value.Date;
                var endDate = episode.Key.Date;

                var e = new ConditionEra
                {
                    SourceRecordGuid = episode.Key.Guid,
                    PersonId = person.PersonId,
                    StartDate = startDate,
                    EndDate = endDate,
                    TypeConceptId = rank,
                    SourceValue = episode.Key.Category
                };

                all.Add(e);
                yield return e;
            }

            foreach (var group in all.GroupBy(e => e.SourceRecordGuid))
            {
                var episode = group.OrderBy(e => e.TypeConceptId).First();
                var rank = episode.TypeConceptId;
                var startDate = episode.StartDate;
                var endDate = episode.EndDate.Value;
                if (rank > 6)
                {
                    if (pconfEpisodes.Count > 0 || contraEpisodes.Length > 0)
                    {
                        bool dateUpdated = false;
                        var pc = pconfEpisodes.Where(e => e.Key.Guid == episode.SourceRecordGuid).ToArray();
                        var cc = contraEpisodes.Where(e => e.Key.Guid == episode.SourceRecordGuid).ToArray();

                        if (!cc.Any() && pc.Any() && pc.Any(e => e.Value.Date < startDate))
                        {
                            startDate = pc.Where(e => e.Value.Date < startDate).OrderBy(e => e.Value.Date).First()
                                .Value.Date;
                            dateUpdated = true;
                        }
                        else if (!pc.Any() && cc.Any() && cc.Any(e => e.Value.Date > startDate))
                        {
                            startDate = cc.Where(e => e.Value.Date > startDate).OrderBy(e => e.Value.Date).First()
                                .Value.Date;
                            dateUpdated = true;
                        }
                        else if (pc.Any() && cc.Any())
                        {
                            var priorPC = pc.Where(e => e.Value.Date < startDate).ToArray();
                            var afterCC = cc.Where(e => e.Value.Date > startDate).ToArray();

                            if (priorPC.Any())
                            {
                                var PCLagerThanCC = priorPC.Where(p => cc.Any(c => c.Value.Date < p.Value.Date))
                                    .ToArray();
                                var CCLagerThanPC = cc.Where(c => priorPC.Any(p => c.Value.Date > p.Value.Date))
                                    .ToArray();

                                if (PCLagerThanCC.Any())
                                {
                                    startDate = PCLagerThanCC.OrderBy(e => e.Value.Date).First().Value.Date;
                                    dateUpdated = true;
                                }
                                else if (CCLagerThanPC.Any())
                                {
                                    startDate = CCLagerThanPC.OrderBy(e => e.Value.Date).First().Value.Date;
                                    dateUpdated = true;
                                }
                            }

                            if (!dateUpdated && afterCC.Any() && pc.Any(e => e.Value.Date > startDate))
                            {
                                startDate = afterCC.OrderBy(e => e.Value.Date).First().Value.Date;
                                dateUpdated = true;
                            }
                        }

                    }

                    yield return new ConditionEra
                    {
                        PersonId = person.PersonId,
                        StartDate = startDate,
                        EndDate = endDate,
                        ConceptId = episode.ConceptId,
                        TypeConceptId = rank - 1,
                        SourceValue = episode.SourceValue
                    };
                }
            }


        }

        private static int GetConceptId(ConditionEra episode)
        {
            var outcomeCategory = episode.SourceValue;
            var startDate = episode.StartDate;
            var endDate = episode.EndDate.Value;
            if (episode.SourceValue == "SA" || episode.SourceValue == "AB")
            {
                outcomeCategory = "SA/AB";
            }
            else if (episode.SourceValue == "DELIV" || episode.SourceValue == "LB")
            {
                outcomeCategory = "LB/DELIV";
            }
            else if (episode.SourceValue == "SB" && endDate.Subtract(startDate).TotalDays + 1 < 140)
            {
                outcomeCategory = "SA/AB";
            }


            int conceptId = 0;
            switch (outcomeCategory)
            {
                case "SB":
                    conceptId = 443213;
                    break;

                case "LB/DELIV":
                    conceptId = 433260;
                    break;

                case "SA/AB":
                    conceptId = 4067106;
                    break;

                case "ECT":
                    conceptId = 437611;
                    break;
            }

            return conceptId;
        }


        // Pregnancy episode start marker types: LMP: Last menstrual period date, GEST: Gestational age record, FERT: Assisted 
        // conception procedure date, ULS: Nuchal ultrasound date, AFP: Alpha feto protein test date, AMEN: Amenorrhea record date, 
        // URINE: Urine pregnancy test date
        private static IEnumerable<KeyValuePair<Event, Event>> FindPregnancEpisodes(
            Dictionary<string, List<Event>> validOutcomes, RawEvents raw,
            Dictionary<string, TermDurations> termDurations, Dictionary<string, GestEst> gestEst, string[] markers, bool hasDefault, bool desc)
        {
            var outcomes = new List<Event>();
            foreach (var outcomeCategory in validOutcomes.Keys)
            {
                outcomes.AddRange(validOutcomes[outcomeCategory]);
            }

            foreach (var outcome in outcomes)
            {
                var duration = termDurations[outcome.Category];
                var ge = gestEst[outcome.Category];
                var priorOutcomeDate = DateTime.MinValue;
                var priorOutcomes = outcomes.Where(o => o.Date < outcome.Date).ToArray();
                TermDurations durationPrior = null;
                if (priorOutcomes.Any())
                {
                    var po = priorOutcomes.OrderByDescending(o => o.Date).First();
                    priorOutcomeDate = po.Date;
                    durationPrior = termDurations[po.Category];
                }

                foreach (var startEpisodeOutcome in FindPregnancyStartEvent(raw, duration, durationPrior, outcome, priorOutcomeDate,
                    ge, markers, hasDefault, desc))
                {
                    yield return new KeyValuePair<Event, Event>(outcome, startEpisodeOutcome);
                }
            }
        }

        private static Event FindStart(Event outcome, Event pe, TermDurations duration, DateTime priorOutcomeDate)
        {
            var episodeStartDate = pe.EpisodeStartDate;

            var windowStart = outcome.Date.Date.AddDays(-1 * duration.MaxTerm);
            var windowEnd = outcome.Date.AddDays(-1 * duration.MinTerm);

            if (priorOutcomeDate.AddDays(duration.Retry) > windowStart)
                windowStart = priorOutcomeDate.AddDays(duration.Retry);

            return episodeStartDate.Between(priorOutcomeDate > windowStart ? priorOutcomeDate : windowStart,
                windowEnd) ? new Event { EventId = pe.EventId, Category = pe.Category, Date = episodeStartDate } : null;
        }

        private static IEnumerable<Event> FindPregnancyStartEvent(RawEvents raw, TermDurations duration,
            TermDurations durationPrior, Event outcome, DateTime priorOutcomeDate, GestEst g, string[] markers,
            bool hasDefault, bool desc)
        {
            List<Event> starts = new List<Event>();
            foreach (var startMarker in markers)
            {
                if (!raw.PregnancyEvents.ContainsKey(startMarker))
                    continue;

                foreach (var pe in raw.PregnancyEvents[startMarker]
                    .OrderBy(e => e.Date))
                {
                    var e = FindStart(outcome, pe, duration, priorOutcomeDate);
                    if (e == null) continue;

                    e.OriginalDate = pe.Date;
                    starts.Add(e);
                }
            }

            if (starts.Any())
            {
                foreach (var group in starts.GroupBy(s => s.Category))
                {
                    if (desc)
                    {
                        var maxDate = group.Max(e => e.OriginalDate);
                        yield return group.Where(e => e.OriginalDate == maxDate).OrderBy(e => e.EventId).First();
                    }
                    else
                    {
                        var minDate = group.Min(e => e.OriginalDate);
                        yield return group.Where(e => e.OriginalDate == minDate).OrderBy(e => e.EventId).First();

                    }
                }
            }

            if (hasDefault)
            {
                var wStart = outcome.Date.Date.AddDays(-1 * duration.MaxTerm);
                var wEnd = outcome.Date.AddDays(30);

                if (outcome.Date.Between(priorOutcomeDate > wStart ? priorOutcomeDate : wStart,
                    wEnd))
                {

                    var episodeStartDate = outcome.Date;
                    var category = "DEFAULT";

                    if (raw.PregnancyEvents.ContainsKey("PREM") && raw.PregnancyEvents["PREM"].Count(e =>
                            e.Date.Between(priorOutcomeDate > wStart ? priorOutcomeDate : wStart,
                                wEnd)) > 0)
                    {
                        episodeStartDate = episodeStartDate.Date.AddDays(-1 * g.PreTerm);
                        category = "PREM";
                    }
                    else if (raw.PregnancyEvents.ContainsKey("FT") && raw.PregnancyEvents["FT"].Count(e =>
                                 e.Date.Between(priorOutcomeDate > wStart ? priorOutcomeDate : wStart,
                                     wEnd)) > 0)
                    {
                        episodeStartDate = episodeStartDate.Date.AddDays(-1 * g.FullTerm);
                    }
                    else
                    {
                        episodeStartDate = episodeStartDate.Date.AddDays(-1 * g.NoData);
                    }

                    if (durationPrior != null && priorOutcomeDate.AddDays(durationPrior.Retry) > episodeStartDate)
                        episodeStartDate = priorOutcomeDate.AddDays(durationPrior.Retry);

                    yield return new Event { EventId = outcome.EventId, Category = category, Date = episodeStartDate };
                }
            }
        }
    }
}
