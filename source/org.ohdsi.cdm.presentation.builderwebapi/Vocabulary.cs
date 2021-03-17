using Microsoft.AspNetCore.SignalR;
using Npgsql;
using org.ohdsi.cdm.framework.common.Definitions;
using org.ohdsi.cdm.framework.common.Lookups;
using org.ohdsi.cdm.framework.common.PregnancyAlgorithm;
using org.ohdsi.cdm.framework.desktop.Helpers;
using org.ohdsi.cdm.presentation.builderwebapi.Hubs;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Odbc;
using System.Diagnostics;
using System.IO;
using System.Linq;


namespace org.ohdsi.cdm.presentation.builderwebapi
{
    public class Vocabulary : IVocabulary
    {
        private readonly Dictionary<string, Lookup> _lookups = new Dictionary<string, Lookup>();
        private GenderLookup _genderConcepts;
        private PregnancyConcepts _pregnancyConcepts;
        private Settings _settings;
        private readonly IHubContext<LogHub> _logHub;

        public Vocabulary(Settings settings, IHubContext<LogHub> logHub)
        {
            _settings = settings;
            _logHub = logHub;
        }

        private static LookupValue CreateLookupValue(IDataRecord reader)
        {
            //source_code,	target_concept_id,	target_domain_id,	validstartdate,	validenddate,	source_vocabulary_id,	source_target_concept_id,	source_validstartdate,	source_validenddate,	ingredient_concept_id
            //    1                       2                 3                  4               5               6                       7                                 8                    9                        10


            //source_code,	target_concept_id,	target_domain_id,	validstartdate,	validenddate
            //    1                       2                 3                  4               5


            var sourceCode = string.Intern(reader[0].ToString().Trim());
            int conceptId = -1;
            if (int.TryParse(reader[1].ToString(), out var cptId))
                conceptId = cptId;

            if (!DateTime.TryParse(reader[3].ToString(), out var validStartDate))
                validStartDate = DateTime.MinValue;

            if (!DateTime.TryParse(reader[4].ToString(), out var validEndDate))
                validEndDate = DateTime.MaxValue;

            var lv = new LookupValue
            {
                ConceptId = conceptId,
                SourceCode = sourceCode,
                Domain = string.Intern(reader[2].ToString().Trim()),
                ValidStartDate = validStartDate,
                ValidEndDate = validEndDate,
                Ingredients = new HashSet<int>()
            };

            if (reader.FieldCount > 5)
            {
                lv.SourceConceptId = int.TryParse(reader[6].ToString(), out var scptId) ? scptId : 0;

                if (int.TryParse(reader[9].ToString(), out var ingredient))
                    lv.Ingredients.Add(ingredient);
            }


            return lv;
        }

        private void LoadPregnancyDrug()
        {
            return; //TMP
        }


        private void Load(IEnumerable<EntityDefinition> definitions)
        {
            if (definitions == null) return;

            foreach (var ed in definitions)
            {
                ed.Vocabulary = this;

                if (ed.Concepts == null) continue;

                foreach (var c in ed.Concepts)
                {
                    if (c.ConceptIdMappers == null) continue;

                    foreach (var conceptIdMapper in c.ConceptIdMappers)
                    {
                        if (!string.IsNullOrEmpty(conceptIdMapper.Lookup))
                        {
                            if (!_lookups.ContainsKey(conceptIdMapper.Lookup))
                            {
                                string sql = string.Empty;
                                
                                var baseSql = string.Empty;
                                var sqlFileDestination = string.Empty;

                                baseSql = File.ReadAllText(Path.Combine(_settings.Folder, "ETL", "Common", "Lookups", "Base.sql"));
                                                               
                                sql = _settings.Lookups[conceptIdMapper.Lookup];

                                sql = sql.Replace("{base}", baseSql);
                                sql = sql.Replace("{sc}", _settings.ConversionSettings.VocabularySchema);

                                try
                                {
                                    Console.WriteLine(conceptIdMapper.Lookup + " - Loading...");

                                    var timer = new Stopwatch();
                                    timer.Start();

                                    WriteLog(Status.Running, string.Format("{0}| {1}", DateTime.Now, conceptIdMapper.Lookup + " - Loading into RAM..."), 0);

                                    using (var connection = _settings.VocabularyEngine.GetConnection(_settings.VocabularyConnectionString))
                                    using (var command = _settings.VocabularyEngine.GetCommand(sql, connection))
                                    {
                                        command.CommandTimeout = 0;
                                        WriteLog(Status.Running, "CommandTimeout=" + command.CommandTimeout, 0);
                                        using (var reader = command.ExecuteReader())
                                        {
                                            Console.WriteLine(conceptIdMapper.Lookup + " - filling");
                                            var lookup = new Lookup();
                                            while (reader.Read())
                                            {
                                                var lv = CreateLookupValue(reader);
                                                lookup.Add(lv);
                                            }

                                            _lookups.Add(conceptIdMapper.Lookup, lookup);
                                        }
                                    }

                                    Console.WriteLine(conceptIdMapper.Lookup + " - Done");
                                    timer.Stop();

                                    WriteLog(Status.Running, string.Format("{0}| {1}", DateTime.Now, $"DONE - {timer.ElapsedMilliseconds} ms | KeysCount={_lookups[conceptIdMapper.Lookup].KeysCount}"), 0);

                                }
                                catch (Exception e)
                                {
                                    Console.WriteLine("Lookup error [file]: " + sqlFileDestination);
                                    Console.WriteLine("Lookup error [query]: " + sql);

                                    WriteLog(Status.Failed, string.Format("{0}| {1}", DateTime.Now, "Lookup error [file]: " + sqlFileDestination), 0);
                                    WriteLog(Status.Failed, string.Format("{0}| {1}", DateTime.Now, "Lookup error [query]: " + sql), 0);
                                    throw;
                                }
                            }
                        }
                    }
                }
            }
        }

        /// <summary>
        /// Fill vocabulary for source to conceptId mapping
        /// </summary>
        /// <param name="forLookup">true - fill vocab. for: CareSites, Providers, Locations; false - rest of us</param>
        public void Fill(bool forLookup, bool readFromS3)
        {
            _genderConcepts = new GenderLookup();
            _genderConcepts.Load();

            _pregnancyConcepts = new PregnancyConcepts();

            foreach (var qd in _settings.SourceQueryDefinitions)
            {
                if (forLookup)
                {
                    Load(qd.CareSites);
                    Load(qd.Providers);
                    Load(qd.Locations);
                }
                else
                {
                    Load(qd.Persons);
                    Load(qd.ConditionOccurrence);
                    Load(qd.DrugExposure);
                    Load(qd.ProcedureOccurrence);
                    Load(qd.Observation);
                    Load(qd.VisitOccurrence);
                    Load(qd.VisitDetail);
                    Load(qd.Death);
                    Load(qd.Measurement);
                    Load(qd.DeviceExposure);
                    Load(qd.Note);

                    Load(qd.VisitCost);
                    Load(qd.ProcedureCost);
                    Load(qd.DeviceCost);
                    Load(qd.ObservationCost);
                    Load(qd.MeasurementCost);
                    Load(qd.DrugCost);
                }
            }
            LoadPregnancyDrug();
        }


        public List<LookupValue> Lookup(string sourceValue, string key, DateTime eventDate)
        {
            if (!_lookups.ContainsKey(key))
                return new List<LookupValue>();

            return _lookups[key].LookupValues(sourceValue, eventDate).ToList();
        }

        public int? LookupGender(string genderSourceValue)
        {
            var res = _genderConcepts.LookupValue(genderSourceValue);
            if (!res.HasValue || res.Value == 0)
                return 8551; // UNKNOWN

            return res;
        }

        public IEnumerable<PregnancyConcept> LookupPregnancyConcept(int conceptId)
        {
            return _pregnancyConcepts.GetConcepts(conceptId);
        }

        private void WriteLog(Status status, string message, Double progress)
        {
            _logHub.Clients.All.SendAsync("Log", new LogMessage { Status = status, Text = message, Progress = progress }).Wait();
        }
    }
}
