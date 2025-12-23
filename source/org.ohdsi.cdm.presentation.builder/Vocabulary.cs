using org.ohdsi.cdm.framework.common.Definitions;
using org.ohdsi.cdm.framework.common.Lookups;
using org.ohdsi.cdm.framework.desktop.Helpers;
using org.ohdsi.cdm.presentation.builder.AnsiConsoleColumns;
using Spectre.Console;
using System.Data;
using System.Data.Odbc;
using System.Diagnostics;
using System.Xml;
using System.Text.Json;
using System.Text.Json.Serialization;
using FrameworkSettings = org.ohdsi.cdm.framework.desktop.Settings.Settings;
using Newtonsoft.Json.Linq;
using System.IO;

namespace org.ohdsi.cdm.presentation.builder
{
    public class Vocabulary : IVocabulary
    {
        public int KeysCount => _lookups.Sum(s => s.Key.Count());

        protected string FileCacheFolder => Path.Combine(Directory.GetCurrentDirectory(), 
            "Cache", 
            "Vocabulary", 
            (Settings.Current.Building.VocabDb + "_" + Settings.Current.Building.VocabSchema));

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

            if (reader.FieldCount > 6)
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


        private void Load(List<Mapper> conceptIdMappers)
        {
            if (conceptIdMappers == null) return;

            AnsiConsole.Progress()
                .AutoClear(false)
                .HideCompleted(false)
                .Columns(
                    new TaskDescriptionColumn(),
                    new FrozenElapsedTimeColumn(),
                    new SpinnerColumn())
                .Start(ctx =>
                {
                    if (conceptIdMappers.Count == 0)
                        return;

                    var overallTask = ctx.AddTask($"Reading vocabulary...", maxValue: conceptIdMappers.Count);
                    int i = 0;

                    foreach (var conceptIdMapper in conceptIdMappers)
                    {
                        i++;
                        overallTask.Description = $"Reading vocabulary ({i}/{conceptIdMappers.Count})...";

                        var currentTask = ctx.AddTask($"{conceptIdMapper.Lookup}");

                        var currentLookup = _vendorLookups.First(s => s.Key.EndsWith("." + conceptIdMapper.Lookup + ".sql"));
                        string sqlRedshift = currentLookup.Value;
                        sqlRedshift = sqlRedshift.Replace("{base}", _baseSql);
                        sqlRedshift = sqlRedshift.Replace("{sc}", Settings.Current.Building.VocabSchema);

                        var sqlRender = Utility.SqlRenderTranslator.Translate(new Utility.SqlRenderTranslator.Request(
                            null, 
                            Settings.Current.Building.VendorToProcess.Name,
                            currentLookup.Key,
                            sqlRedshift,
                            Settings.Current.Building.CdmEngine.Database));

                         var sql = Utility.NativeTranslators.GetSqlHelper.TranslateSqlFromRedshift(FrameworkSettings.Current.Building.Vendor, Settings.Current.Building.VocabularyEngine.Database,
                            sqlRender, FrameworkSettings.Current.Building.VocabularySchemaName, FrameworkSettings.Current.Building.VocabularySchemaName, null, null);

                        try
                        {
                            var fromFile = ReadLookupFromFile(conceptIdMapper.Lookup);

                            if (!fromFile)
                            {
                                using (var connection = SqlConnectionHelper.OpenOdbcConnection(Settings.Current.Building.VocabularyConnectionString))
                                using (var command = new OdbcCommand(sql, connection) { CommandTimeout = 0 })
                                using (var reader = command.ExecuteReader())
                                {
                                    var lookup = _lookups.TryGetValue(conceptIdMapper.Lookup, out var existingLookup)
                                        ? existingLookup
                                        : new Lookup();

                                    var lookupPublic = new List<LookupValue>();

                                    while (reader.Read())
                                    {
                                        var lv = CreateLookupValue(reader);
                                        lookup.Add(lv);
                                        lookupPublic.Add(lv);
                                    }

                                    _lookups[conceptIdMapper.Lookup] = lookup;
                                    WriteLookupToFile(conceptIdMapper.Lookup, lookupPublic);
                                }
                            }

                            var fromType = fromFile ? "FromFile" : "FromDB";
                            var keysCount = _lookups[conceptIdMapper.Lookup].KeysCount;
                            currentTask.Description = $"{conceptIdMapper.Lookup} | {fromType} | KeysCount={keysCount}";
                            currentTask.Increment(currentTask.MaxValue - currentTask.Value);
                            currentTask.StopTask();
                        }
                        catch (Exception e)
                        {
                            Logger.WriteWarning("Lookup error [file]: " + conceptIdMapper.Lookup);
                            Logger.WriteWarning("Lookup error [query]: " + sql);
                            throw;
                        }
                    }
                });
        }

        /// <summary>
        /// Fill vocabulary for source to conceptId mapping
        /// </summary>
        /// <param name="forLookup">true - fill vocab. for: CareSites, Providers, Locations; false - rest of them</param>
        public void Fill(bool forLookup)
        {
            if (Settings.Current.Building.SourceQueryDefinitions == null)
                throw new NoNullAllowedException("Settings.Current.Building.SourceQueryDefinitions is null!");

            _genderConcepts = new GenderLookup();
            _genderConcepts.Load();

            _pregnancyConcepts = new PregnancyConcepts(null);

            var vendorFolder = Settings.Current.Building.VendorToProcess.Folder;
            _baseSql = Utility.EmbeddedResourceManager.ReadEmbeddedResources(null, "Base.sql").Values.First();
            _vendorLookups = Utility.EmbeddedResourceManager.ReadEmbeddedResources(null, vendorFolder + ".Lookups");


            var mappers = new List<Mapper>();

            foreach (var qd in Settings.Current.Building.SourceQueryDefinitions)
                try
                {
                    if (forLookup)
                    {
                        mappers.AddRange(GetMappers(qd.CareSites));
                        mappers.AddRange(GetMappers(qd.Providers));
                        mappers.AddRange(GetMappers(qd.Locations));
                    }
                    else
                    {
                        mappers.AddRange(GetMappers(qd.Persons));
                        mappers.AddRange(GetMappers(qd.ConditionOccurrence));
                        mappers.AddRange(GetMappers(qd.DrugExposure));
                        mappers.AddRange(GetMappers(qd.ProcedureOccurrence));
                        mappers.AddRange(GetMappers(qd.Observation));
                        mappers.AddRange(GetMappers(qd.VisitOccurrence));
                        mappers.AddRange(GetMappers(qd.VisitDetail));
                        mappers.AddRange(GetMappers(qd.Death));
                        mappers.AddRange(GetMappers(qd.Measurement));
                        mappers.AddRange(GetMappers(qd.DeviceExposure));
                        mappers.AddRange(GetMappers(qd.Note));

                        mappers.AddRange(GetMappers(qd.VisitCost));
                        mappers.AddRange(GetMappers(qd.ProcedureCost));
                        mappers.AddRange(GetMappers(qd.DeviceCost));
                        mappers.AddRange(GetMappers(qd.ObservationCost));
                        mappers.AddRange(GetMappers(qd.MeasurementCost));
                        mappers.AddRange(GetMappers(qd.DrugCost));
                    }
                }
                catch( Exception e)
                {
                    throw;
                }

            mappers = mappers
                .DistinctBy(s => s.Lookup)
                .OrderBy(s => s.Lookup)
                .ToList();

            Load(mappers);

            LoadPregnancyDrug();
        }

        private List<Mapper> GetMappers(IEnumerable<EntityDefinition> definitions)
        {
            var result = new List<Mapper>();

            if (definitions == null) return result;

            foreach (var item in definitions)
                if (item != null)
                    item.Vocabulary = this;

            result = definitions
                .Where(s => s != null)
                .Where(s => s.Concepts != null)
                .SelectMany(s => s.Concepts)
                .Where(s => s.ConceptIdMappers != null)
                .SelectMany(s => s.ConceptIdMappers)
                .Where(s => !string.IsNullOrEmpty(s.Lookup))
                .Where(s => !_lookups.ContainsKey(s.Lookup))
                .ToList();

            return result;
        }

        private void WriteLookupToFile(string lookupName, List<LookupValue> lookupValues)
        {
            var folder = Path.Combine(this.FileCacheFolder, Settings.Current.Building.VendorToProcess.Name);
            Directory.CreateDirectory(folder);

            var path = Path.Combine(folder, lookupName + ".json");
            var pathTmp = path + ".tmp";
            var json = JsonSerializer.Serialize(lookupValues, new JsonSerializerOptions() 
            {
                WriteIndented = true,
                IncludeFields = true,
                PropertyNameCaseInsensitive = true
            });
            File.WriteAllText(pathTmp, json);

            if (File.Exists(path))
                File.Delete(path);

            File.Move(pathTmp, path);
        }

        private bool ReadLookupFromFile(string lookupName)
        {
            var path = Path.Combine(this.FileCacheFolder, Settings.Current.Building.VendorToProcess.Name, lookupName + ".json");
            if (!File.Exists(path))
                return false;

            try
            {
                var lookup = _lookups.TryGetValue(lookupName, out var existingLookup)
                                        ? existingLookup
                                        : new Lookup();

                var lookupValues = JsonSerializer.Deserialize<List<LookupValue>>(File.ReadAllText(path), new JsonSerializerOptions()
                {
                    IncludeFields = true,
                    PropertyNameCaseInsensitive = true
                });

                foreach(var lv in lookupValues)
                    lookup.Add(lv);

                _lookups[lookupName] = lookup;
            }
            catch(Exception e)
            {
                Logger.WriteWarning("Error reading vocabulary cache file: " + path + "\r\n" + e.Message);
                _lookups.Clear();
                return false;
            }

            return true;
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
