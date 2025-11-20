using org.ohdsi.cdm.framework.common.Definitions;
using org.ohdsi.cdm.framework.common.Lookups;
using org.ohdsi.cdm.framework.desktop.Helpers;
using Spectre.Console;
using System.Data;
using System.Data.Odbc;
using System.Diagnostics;
using FrameworkSettings = org.ohdsi.cdm.framework.desktop.Settings.Settings;

namespace org.ohdsi.cdm.presentation.builder
{
    public class Vocabulary : IVocabulary
    {
        private readonly Dictionary<string, Lookup> _lookups = new Dictionary<string, Lookup>();
        private GenderLookup _genderConcepts;
        private PregnancyConcepts _pregnancyConcepts;

        private string _baseSql;
        private Dictionary<string, string> _vendorLookups;

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

            foreach (var item in definitions)
                if (item != null)
                    item.Vocabulary = this;

            var conceptIdMappers = definitions
                .Where(s => s != null)
                .Where(s => s.Concepts != null)
                .SelectMany(s => s.Concepts)
                .Where(s => s.ConceptIdMappers != null)
                .SelectMany(s => s.ConceptIdMappers)
                .Where(s => !string.IsNullOrEmpty(s.Lookup))
                .Where(s => !_lookups.ContainsKey(s.Lookup))
                .ToList();

            foreach (var conceptIdMapper in conceptIdMappers)
            {
                string sqlRedshift = _vendorLookups.First(s => s.Key.EndsWith("." + conceptIdMapper.Lookup + ".sql")).Value;
                sqlRedshift = sqlRedshift.Replace("{base}", _baseSql);
                sqlRedshift = sqlRedshift.Replace("{sc}", Settings.Current.Building.VocabSchema);

                var sql = Utility.GetSqlHelper.TranslateSqlFromRedshift(FrameworkSettings.Current.Building.Vendor, Settings.Current.Building.VocabularyEngine.Database,
                    sqlRedshift, FrameworkSettings.Current.Building.VocabularySchemaName, FrameworkSettings.Current.Building.VocabularySchemaName, null, null);

                try
                {
                    var timer = new Stopwatch();
                    timer.Start();

                    using (var connection = SqlConnectionHelper.OpenOdbcConnection(Settings.Current.Building.VocabularyConnectionString))
                    using (var command = new OdbcCommand(sql, connection) { CommandTimeout = 0 })
                    using (var reader = command.ExecuteReader())
                    {
                        var lookup = _lookups.TryGetValue(conceptIdMapper.Lookup, out var existingLookup)
                            ? existingLookup
                            : new Lookup();

                        while (reader.Read())
                        {
                            var lv = CreateLookupValue(reader);
                            lookup.Add(lv);
                        }

                        _lookups[conceptIdMapper.Lookup] = lookup;
                    }

                    timer.Stop();
                    var elapsedSeconds = Math.Round(Convert.ToDecimal(timer.ElapsedMilliseconds) / 1000, 3);
                    Logger.Write(null, Logger.LogMessageTypes.Info,
                        $"{conceptIdMapper.Lookup} - DONE - {elapsedSeconds} s | KeysCount={_lookups[conceptIdMapper.Lookup].KeysCount}");
                }
                catch (Exception e)
                {
                    Logger.WriteWarning("Lookup error [file]: " + conceptIdMapper.Lookup);
                    Logger.WriteWarning("Lookup error [query]: " + sql);
                    throw;
                }
            }

        }

        /// <summary>
        /// Fill vocabulary for source to conceptId mapping
        /// </summary>
        /// <param name="forLookup">true - fill vocab. for: CareSites, Providers, Locations; false - rest of them</param>
        public void Fill(bool forLookup)
        {
            if (Settings.Current.Building.SourceQueryDefinitions == null)
                throw new NoNullAllowedException("Settings.Current.Building.SourceQueryDefinitions is null!");


            var timer = new Stopwatch();
            timer.Start();

            _genderConcepts = new GenderLookup();
            _genderConcepts.Load();

            _pregnancyConcepts = new PregnancyConcepts(null);

            var vendorFolder = Settings.Current.Building.VendorToProcess.Folder;
            _baseSql = Utility.EmbeddedResourceManager.ReadEmbeddedResources(null, "Base.sql").Values.First();
            _vendorLookups = Utility.EmbeddedResourceManager.ReadEmbeddedResources(null, vendorFolder + ".Lookups");


            AnsiConsole.WriteLine("\r\nLoading lookups");
            foreach (var qd in Settings.Current.Building.SourceQueryDefinitions)
                try
                {
                    //#region debug, remove after fixing Lookup
                    //if (qd.FileName == "alz_biomarker")
                    //    continue;
                    //#endregion

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
                catch( Exception e)
                {
                    throw;
                }
            LoadPregnancyDrug();

            timer.Stop();
            var elapsedSeconds = Math.Round(Convert.ToDecimal(timer.ElapsedMilliseconds) / 1000, 3);
            AnsiConsole.WriteLine($"Loading lookups - DONE - {elapsedSeconds} s\r\n");
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
