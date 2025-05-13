using org.ohdsi.cdm.framework.common.Definitions;
using org.ohdsi.cdm.framework.common.Lookups;
using org.ohdsi.cdm.framework.common.PregnancyAlgorithm;
using org.ohdsi.cdm.framework.desktop.Enums;
using org.ohdsi.cdm.framework.desktop.Helpers;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Odbc;
using System.Diagnostics;
using System.IO;
using System.Linq;

namespace org.ohdsi.cdm.presentation.builder
{
    public class Vocabulary : IVocabulary
    {
        private readonly Dictionary<string, Lookup> _lookups = new Dictionary<string, Lookup>();
        private GenderLookup _genderConcepts;
        private PregnancyConcepts _pregnancyConcepts;

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
                Ingredients = new HashSet<long>()
            };

            if (reader.FieldCount > 5)
            {
                var sourceConceptId = int.TryParse(reader[6].ToString(), out var scptId) ? scptId : 0;
                lv.SourceConcepts = new HashSet<SourceConcepts>() { new SourceConcepts() { ConceptId = sourceConceptId } };

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
                                var vendorFolder = Settings.Current.Building.VendorToProcess.Folder;

                                var baseSql = string.Empty;
                                var sqlFileDestination = string.Empty;

                                baseSql = File.ReadAllText(Path.Combine(Settings.Current.BuilderFolder,
                                    @"ETL\Common\Lookups\Base.sql"));

                                sqlFileDestination = Path.Combine(Settings.Current.BuilderFolder,
                                                                  vendorFolder,
                                                                  "Lookups",
                                                                  conceptIdMapper.Lookup + ".sql");

                                sql = File.ReadAllText(sqlFileDestination);

                                sql = sql.Replace("{base}", baseSql);
                                sql = sql.Replace("{sc}", Settings.Current.Building.VocabSchema);

                                try
                                {
                                    Console.WriteLine(conceptIdMapper.Lookup + " - Loading...");

                                    var timer = new Stopwatch();
                                    timer.Start();


                                    Logger.Write(null, Logger.LogMessageTypes.Info, conceptIdMapper.Lookup + " - Loading into RAM...");

                                    using (var connection = SqlConnectionHelper.OpenOdbcConnection(Settings.Current.Building.VocabularyConnectionString))
                                    using (var command = new OdbcCommand(sql, connection) { CommandTimeout = 0 })
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

                                    Console.WriteLine(conceptIdMapper.Lookup + " - Done");
                                    timer.Stop();
                                    Logger.Write(null, Logger.LogMessageTypes.Info,
                                        $"DONE - {timer.ElapsedMilliseconds} ms | KeysCount={_lookups[conceptIdMapper.Lookup].KeysCount}");
                                }
                                catch (Exception e)
                                {
                                    Console.WriteLine("Lookup error [file]: " + sqlFileDestination);
                                    Console.WriteLine("Lookup error [query]: " + sql);
                                    Logger.WriteWarning("Lookup error [file]: " + sqlFileDestination);
                                    Logger.WriteWarning("Lookup error [query]: " + sql);
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
            if (Settings.Current.Building.SourceQueryDefinitions == null)
                throw new NoNullAllowedException("Settings.Current.Building.SourceQueryDefinitions is null!");

            _genderConcepts = new GenderLookup();
            _genderConcepts.Load();

            _pregnancyConcepts = new PregnancyConcepts(null);
                        
            foreach (var qd in Settings.Current.Building.SourceQueryDefinitions)
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

        public IEnumerable<PregnancyConcept> LookupPregnancyConcept(long conceptId)
        {
            return _pregnancyConcepts.GetConcepts(conceptId);
        }

        public string GetSourceVocabularyId(long conceptId)
        {
            throw new NotImplementedException();
        }

        public string GetSourceDomain(long conceptId)
        {
            throw new NotImplementedException();
        }
    }
}
