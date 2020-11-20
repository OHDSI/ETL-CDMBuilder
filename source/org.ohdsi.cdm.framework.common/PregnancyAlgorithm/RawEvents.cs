using org.ohdsi.cdm.framework.common.Enums;
using org.ohdsi.cdm.framework.common.Lookups;
using org.ohdsi.cdm.framework.common.Omop;
using System;
using System.Collections.Generic;

namespace org.ohdsi.cdm.framework.common.PregnancyAlgorithm
{
    public class RawEvents
    {
        public Dictionary<string, List<Event>> PregnancyEvents { get; } = new Dictionary<string, List<Event>>();
        private int _eventId = 0;

        public void Fill(IVocabulary vocab, ConditionOccurrence[] conditionOccurrences,
            ProcedureOccurrence[] procedureOccurrences, Observation[] observations, Measurement[] measurements, DrugExposure[] drugExposures)
        {
            var events = new Dictionary<string, List<PregnancyConcept>>();

            Fill(vocab, conditionOccurrences, events);
            Fill(vocab, procedureOccurrences, events);
            Fill(vocab, observations, events);
            Fill(vocab, measurements, events);
            foreach (var e in GetNonDrug(events))
            {
                if (!PregnancyEvents.ContainsKey(e.Category))
                    PregnancyEvents.Add(e.Category, new List<Event>());

                PregnancyEvents[e.Category].Add(e);
            }

            foreach (var de in drugExposures)
            {
                var res = vocab.Lookup(de.ConceptId.ToString(), "PregnancyDrug", DateTime.MinValue);
                if (res.Count == 0 || !res[0].ConceptId.HasValue) continue;

                foreach (var pc in vocab.LookupPregnancyConcept(res[0].ConceptId.Value))
                {
                    if (pc == null)
                        continue;

                    if (!PregnancyEvents.ContainsKey(pc.Category))
                        PregnancyEvents.Add(pc.Category, new List<Event>());

                    PregnancyEvents[pc.Category].Add(new Event
                    {
                        EventId = _eventId,
                        Category = pc.Category,
                        Date = de.StartDate,
                        PersonId = de.PersonId,
                        GestValue = null
                    });
                    _eventId++;
                }
            }
        }

        private void Fill(IVocabulary vocab, IEnumerable<IEntity> records, Dictionary<string, List<PregnancyConcept>> events)
        {
            foreach (var e in records)
            {
                foreach (var pc in vocab.LookupPregnancyConcept(e.ConceptId))
                {
                    if (pc == null)
                        continue;

                    pc.Entity = e;

                    if (e.GeEntityType() == EntityType.Observation)
                    {
                        var o = (Observation)e;
                        if (!string.IsNullOrEmpty(pc.DataValue) && pc.DataValue != o.ValueAsString)
                        {
                            continue;
                        }

                        pc.ValueAsNumber = o.ValueAsNumber;
                    }
                    else if (e.GeEntityType() == EntityType.Measurement)
                    {
                        var m = (Measurement)e;
                        if (!string.IsNullOrEmpty(pc.DataValue) &&
                            pc.DataValue != m.ValueSourceValue)
                        {
                            continue;
                        }

                        pc.ValueAsNumber = m.ValueAsNumber;
                    }

                    if (!events.ContainsKey(pc.Category))
                        events.Add(pc.Category, new List<PregnancyConcept>());

                    events[pc.Category].Add(new PregnancyConcept
                    {
                        EventId = _eventId,
                        Category = pc.Category,
                        ConceptId = pc.ConceptId,
                        DataValue = pc.DataValue,
                        Entity = e,
                        GestValue = pc.GestValue,
                        ValueAsNumber = pc.ValueAsNumber
                    });

                    _eventId++;
                }
            }
        }

        public IEnumerable<Event> GetNonDrug(Dictionary<string, List<PregnancyConcept>> events)
        {
            if (events.ContainsKey("DIAB") && events.Keys.Count > 1 || // Patients with a Glucose test record, exclude people who have ONLY glucose tests
                events.Keys.Count > 0 && !events.ContainsKey("DIAB"))
            {
                foreach (var category in events.Keys)
                {
                    foreach (var pc in events[category])
                    {
                        decimal? gestValue = null;

                        if (category == "GEST")
                        {
                            if (pc.GestValue.HasValue)
                                gestValue = pc.GestValue * 7;
                            else if (pc.ValueAsNumber.HasValue)
                                gestValue = pc.ValueAsNumber * 7;

                            if (gestValue <= 301)
                                yield return new Event
                                {
                                    EventId = pc.EventId,
                                    Category = pc.Category,
                                    Date = pc.Entity.StartDate,
                                    PersonId = pc.Entity.PersonId,
                                    GestValue = gestValue
                                };
                        }
                        else
                        {
                            yield return new Event
                            {
                                EventId = pc.EventId,
                                Category = pc.Category,
                                Date = pc.Entity.StartDate,
                                PersonId = pc.Entity.PersonId,
                                GestValue = null
                            };
                        }
                    }
                }
            }
        }
    }
}