using org.ohdsi.cdm.framework.common.Base;
using org.ohdsi.cdm.framework.common.Builder;
using org.ohdsi.cdm.framework.common.Omop;
using org.ohdsi.cdm.framework.common.PregnancyAlgorithm;
using System;
using System.Collections.Generic;
using System.Linq;

namespace org.ohdsi.cdm.framework.etl.nhanes
{
    public class NhanesPersonBuilder : PersonBuilder
    {
        public override string GetFolder()
        {
            return "ETL\\NHANES";
        }

        private static int GetYear(string value)
        {
            if (string.IsNullOrEmpty(value))
                return 2000;

            if (value.Length > 1 || !char.IsLetter(value[0]))
                return 2000;

            // empty -> 2000 'B' -> 2002,  'C' -> 2004, 'D' -> 2006 ....
            return value.ToLower()[0] % 32 * 2 + 1998;
        }

        public override KeyValuePair<Person, Attrition> BuildPerson(List<Person> records)
        {
            if (records.Count == 0)
                return new KeyValuePair<Person, Attrition>(null, Attrition.UnacceptablePatientQuality);

            var person = new Person(records[0]);
            var table = records[0].AdditionalFields["table_name"].ToLower();
            // table names: 'DEMO', 'DEMO_B', 'DEMO_C' ... 
            var yearOfBirth = GetYear(table.Replace("demo", "").Replace("_", ""));
            person.YearOfBirth = yearOfBirth;


            foreach (var record in records)
            {
                var variable = record.AdditionalFields["variable"].ToLower();
                var value = record.AdditionalFields["value"].ToLower();

                if (variable == "ridageyr")
                {
                    if (int.TryParse(value, out var ridageyr))
                    {
                        person.YearOfBirth = yearOfBirth - ridageyr;
                    }
                }
                else if (variable == "riagendr" && !string.IsNullOrEmpty(value))
                {
                    person.GenderConceptId = Vocabulary.LookupGender(value);
                    person.GenderSourceValue = value == "1" ? "MALE" : "FEMALE";
                }
                else if (variable == "ridreth1")
                {

                    switch (value)
                    {
                        case "1":
                            person.RaceConceptId = 0;
                            person.EthnicityConceptId = 38003563;
                            person.RaceSourceValue = "mexican american";
                            person.EthnicitySourceValue = "mexican american";
                            break;

                        case "2":
                            person.RaceConceptId = 0;
                            person.EthnicityConceptId = 38003563;
                            person.RaceSourceValue = "other hispanic";
                            person.EthnicitySourceValue = "other hispanic";
                            break;

                        case "3":
                            person.RaceConceptId = 8527;
                            person.EthnicityConceptId = 38003564;
                            person.RaceSourceValue = "non-hispanic white";
                            person.EthnicitySourceValue = "non-hispanic white";
                            break;

                        case "4":
                            person.RaceConceptId = 8516;
                            person.EthnicityConceptId = 38003564;
                            person.RaceSourceValue = "non-hispanic black";
                            person.EthnicitySourceValue = "non-hispanic black";
                            break;

                        case "5":
                            person.RaceConceptId = 0;
                            person.EthnicityConceptId = 0;
                            person.RaceSourceValue = "other race - including multi-racial";
                            person.EthnicitySourceValue = "other race - including multi-racial";
                            break;

                    }
                }
            }

            if (string.IsNullOrEmpty(person.RaceSourceValue))
            {
                person.RaceConceptId = 0;
                person.EthnicityConceptId = 0;
            }

            if (string.IsNullOrEmpty(person.GenderSourceValue))
                return new KeyValuePair<Person, Attrition>(null, Attrition.UnknownGender);

            return new KeyValuePair<Person, Attrition>(person, Attrition.None);
        }


        public override Attrition Build(ChunkData data, KeyMasterOffsetManager offset)
        {
            Offset = offset;
            ChunkData = data;

            var p = new List<Person>();
            var op = new List<ObservationPeriod>();
            var vo = new List<VisitOccurrence>();

            var co = new List<ConditionOccurrence>();
            var de = new List<DrugExposure>();
            var o = new List<Observation>();

            foreach (var record in PersonRecords)
            {
                var table = record.AdditionalFields["table_name"]?.ToLower();
                var variable = record.AdditionalFields["variable"]?.ToLower();
                var value = record.AdditionalFields["value"]?.ToLower();
                var description = string.Empty;

                if (record.AdditionalFields.ContainsKey("value_description"))
                    description = record.AdditionalFields["value_description"]?.ToLower();

                if (string.IsNullOrEmpty(table) || string.IsNullOrEmpty(variable))
                    continue;

                decimal? decimalValue = null;
                if (decimal.TryParse(value, out var dValue))
                    decimalValue = dValue;

                var valueAsString = value;
                if (!string.IsNullOrEmpty(description))
                {
                    valueAsString = description;
                }

                var year = 2000;
                if (table.StartsWith("demo"))
                {
                    p.Add(record);

                    // GetYear => empty -> 2000 'B' -> 2002,  'C' -> 2004, 'D' -> 2006 ....
                    year = GetYear(table.Replace("demo", "").Replace("_", ""));

                    if (op.Count == 0)
                    {
                        op.Add(new ObservationPeriod
                        {
                            Id = Offset.GetKeyOffset(record.PersonId).ObservationId,
                            PersonId = record.PersonId,
                            TypeConceptId = 0,
                            StartDate = new DateTime(year - 1, 1, 1),
                            EndDate = new DateTime(year, 12, 31)
                        });

                        vo.Add(new VisitOccurrence(record)
                        {
                            Id = Offset.GetKeyOffset(record.PersonId).VisitOccurrenceId,
                            ConceptId = 0,
                            StartDate = new DateTime(year - 1, 1, 1),
                            EndDate = new DateTime(year - 1, 1, 1),
                            TypeConceptId = 44818519
                        });
                    }
                }
                else if (table.StartsWith("rxq_rx") && (variable.StartsWith("rxddrgid") || variable.StartsWith("rxddrug")))
                {
                    year = GetYear(table.Replace("rxq_rx", "").Replace("_", ""));
                    string sourceValue = null;
                    if (!string.IsNullOrEmpty(value) && value.Contains('_'))
                    {
                        var values = value.Split('_');
                        // use the characters after the last underscore(_)
                        // 60000_1_7__d00910
                        if (table == "rxq_rx" || table == "rxq_rx_b")
                        {
                            sourceValue = values.Last();
                        }
                        // use the characters before the first underscore (_)
                        // d00848_365_1_DICLOFENAC
                        else
                        {
                            sourceValue = values[0];
                        }
                    }

                    var result = Vocabulary.Lookup(sourceValue, "Drug", DateTime.MinValue);

                    if (result.Any())
                    {
                        foreach (var lookupValue in result)
                        {
                            var conceptId = lookupValue.ConceptId;
                            if (conceptId.HasValue)
                            {
                                de.Add(new DrugExposure(record)
                                {
                                    Id = Offset.GetKeyOffset(record.PersonId).DrugExposureId,
                                    ConceptId = conceptId.Value,
                                    StartDate = new DateTime(year - 1, 1, 1),
                                    EndDate = new DateTime(year - 1, 1, 1),
                                    SourceValue = sourceValue,
                                    TypeConceptId = 44787730
                                });
                            }
                        }
                    }


                }
                else if (!string.IsNullOrEmpty(value))
                {
                    var yearField = table.Split('_').Last();
                    year = GetYear(yearField == table ? null : yearField);

                    var sourceValue = variable + "_" + value;

                    if (variable == "bmxbmi")
                    {
                        int? conceptId = null;
                        if (double.TryParse(value, out var bmxbmi))
                        {
                            if (bmxbmi < 18.5)
                            {
                                conceptId = 435372;
                            }
                            else if (bmxbmi > 25.0 && bmxbmi < 29.9)
                            {
                                conceptId = 437525;
                            }
                            else
                            {
                                conceptId = 4215968;
                            }
                        }

                        co.Add(new ConditionOccurrence(record)
                        {
                            Id = Offset.GetKeyOffset(record.PersonId).ConditionOccurrenceId,
                            ConceptId = conceptId.Value,
                            StartDate = new DateTime(year, 1, 1),
                            EndDate = null,
                            TypeConceptId = 45905770,
                            SourceValue = sourceValue
                        });
                    }
                    else
                    {
                        var result = Vocabulary.Lookup(sourceValue, "Condition", DateTime.MinValue);

                        if (result.Any())
                        {
                            foreach (var lookupValue in result)
                            {
                                var conceptId = lookupValue.ConceptId;

                                if (conceptId.HasValue)
                                {
                                    co.Add(new ConditionOccurrence(record)
                                    {
                                        Id = Offset.GetKeyOffset(record.PersonId).ConditionOccurrenceId,
                                        ConceptId = conceptId.Value,
                                        StartDate = new DateTime(year, 1, 1),
                                        EndDate = null,
                                        TypeConceptId = 45905770,
                                        SourceValue = sourceValue
                                    });
                                }
                            }
                        }
                    }


                }

                o.Add(new Observation(record)
                {
                    Id = Offset.GetKeyOffset(record.PersonId).ObservationId,
                    ValueAsNumber = decimalValue,
                    ValueAsString = decimalValue.HasValue ? valueAsString : value,
                    ConceptId = 0,
                    TypeConceptId = 44814721,
                    SourceValue = variable,
                    StartDate = new DateTime(year, 1, 1)
                });
            }

            var r = BuildPerson(p);
            var person = r.Key;
            if (person == null)
            {
                Complete = true;
                return r.Value;
            }

            if (vo.Count > 0)
            {
                foreach (var entity in o)
                {
                    entity.VisitOccurrenceId = vo[0].Id;
                }

                foreach (var entity in de)
                {
                    entity.VisitOccurrenceId = vo[0].Id;
                }

                foreach (var entity in co)
                {
                    entity.VisitOccurrenceId = vo[0].Id;
                }
            }

            AddToChunk(person, null, op.ToArray(), new PayerPlanPeriod[0], de.ToArray(),
                co.ToArray(), new ProcedureOccurrence[0], o.ToArray(), new Measurement[0],
                vo.ToArray(), new VisitDetail[0], new Cohort[0], new DeviceExposure[0], new Note[0]);

            Complete = true;

            var pg = new PregnancyAlgorithm();
            foreach (var pe in pg.GetPregnancyEpisodes(Vocabulary, person, op.ToArray(),
                ChunkData.ConditionOccurrences.Where(e => e.PersonId == person.PersonId).ToArray(),
                ChunkData.ProcedureOccurrences.Where(e => e.PersonId == person.PersonId).ToArray(),
                ChunkData.Observations.Where(e => e.PersonId == person.PersonId).ToArray(),
                ChunkData.Measurements.Where(e => e.PersonId == person.PersonId).ToArray(),
                ChunkData.DrugExposures.Where(e => e.PersonId == person.PersonId).ToArray()))
            {
                pe.Id = Offset.GetKeyOffset(pe.PersonId).ConditionEraId;
                ChunkData.ConditionEra.Add(pe);
            }

            return Attrition.None;
        }
    }
}
