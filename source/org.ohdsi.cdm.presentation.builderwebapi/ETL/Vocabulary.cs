using Newtonsoft.Json.Linq;
using org.ohdsi.cdm.framework.common.Definitions;
using org.ohdsi.cdm.framework.common.Lookups;
using org.ohdsi.cdm.framework.common.PregnancyAlgorithm;
using org.ohdsi.cdm.presentation.builderwebapi.Database;
using org.ohdsi.cdm.presentation.builderwebapi.Enums;
using org.ohdsi.cdm.presentation.builderwebapi.Log;
using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.IO;
using System.IO.Compression;
using System.Linq;
using System.Net.Http;
using System.Runtime.Serialization.Formatters.Binary;

namespace org.ohdsi.cdm.presentation.builderwebapi.ETL
{
    public class Vocabulary : IVocabulary
    {
        private readonly Dictionary<string, Lookup> _lookups = new Dictionary<string, Lookup>();
        private GenderLookup _genderConcepts;
        private PregnancyConcepts _pregnancyConcepts;
        private Settings _settings;

        private int _conversionId;
        private string _connectionString;

        public Vocabulary(Settings settings, string connectionString, int conversionId)
        {
            _settings = settings;
            _conversionId = conversionId;
            _connectionString = connectionString;

            _genderConcepts = new GenderLookup();
            _genderConcepts.Load();

            _pregnancyConcepts = new PregnancyConcepts();
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

        private void LoadVisitRollupLogic()
        {
            var sqlFileDestination = string.Empty;

            string baseSql = File.ReadAllText(Path.Combine(_settings.Folder, "ETL", "Common", "Lookups", "Base.sql"));
            string sql = File.ReadAllText(Path.Combine(_settings.Folder, "ETL", "Common", "Lookups", "CMSPlaceOfService.sql"));

            sql = sql.Replace("{base}", baseSql);
            sql = sql.Replace("{sc}", _settings.ConversionSettings.VocabularySchema);

            _settings.Lookups.Add("CMSPlaceOfService", sql);

            try
            {
                Console.WriteLine("CMSPlaceOfService - Loading...");

                var timer = new Stopwatch();
                timer.Start();

                WriteLog(LogType.Info, "CMSPlaceOfService - Loading ...", 0);

                using (var connection = _settings.VocabularyEngine.GetConnection(_settings.VocabularyConnectionString))
                using (var command = _settings.VocabularyEngine.GetCommand(sql, connection))
                {
                    command.CommandTimeout = 0;

                    using var reader = command.ExecuteReader();
                    Console.WriteLine("CMSPlaceOfService -  filling");
                    var lookup = new Lookup();
                    while (reader.Read())
                    {
                        var lv = CreateLookupValue(reader);
                        lookup.Add(lv);
                    }

                    _lookups.Add("CMSPlaceOfService", lookup);
                }

                Console.WriteLine("CMSPlaceOfService - Done");
                timer.Stop();

                WriteLog(LogType.Info, $"DONE - {timer.ElapsedMilliseconds} ms | KeysCount={_lookups["CMSPlaceOfService"].KeysCount}", 0);
            }
            catch (Exception e)
            {
                Console.WriteLine("Lookup error [file]: " + sqlFileDestination);
                Console.WriteLine("Lookup error [query]: " + sql);

                if (e.InnerException != null && e.InnerException.Message != null)
                    WriteLog(LogType.Error, e.InnerException.Message, 0);

                WriteLog(LogType.Error, e.Message, 0);

                WriteLog(LogType.Error, "Lookup error [file]: " + sqlFileDestination, 0);
                WriteLog(LogType.Error, "Lookup error [query]: " + sql, 0);
                throw;
            }
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

                                    //WriteLog(Status.Running, "1 " + _settings.VocabularyConnectionString, 0);
                                    //WriteLog(Status.Running, "2 " + SqlConnectionHelper.GetConnection(_settings.VocabularyConnectionString, _settings.VocabularyEngine.Database), 0);
                                    WriteLog(LogType.Info, conceptIdMapper.Lookup + " - Loading ...", 0);


                                    using (var connection = _settings.VocabularyEngine.GetConnection(_settings.VocabularyConnectionString))
                                    using (var command = _settings.VocabularyEngine.GetCommand(sql, connection))
                                    {
                                        command.CommandTimeout = 0;
                                        //WriteLog(Status.Running, "CommandTimeout=" + command.CommandTimeout, 0);
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

                                    WriteLog(LogType.Info, $"DONE - {timer.ElapsedMilliseconds} ms | KeysCount={_lookups[conceptIdMapper.Lookup].KeysCount}", 0);

                                }
                                catch (Exception e)
                                {
                                    Console.WriteLine("Lookup error [file]: " + sqlFileDestination);
                                    Console.WriteLine("Lookup error [query]: " + sql);

                                    WriteLog(LogType.Error, e.StackTrace, 0);

                                    if (e.InnerException != null && e.InnerException.Message != null)
                                        WriteLog(LogType.Error, e.InnerException.Message, 0);

                                    WriteLog(LogType.Error, e.Message, 0);

                                    WriteLog(LogType.Error, "Lookup error [file]: " + sqlFileDestination, 0);
                                    WriteLog(LogType.Error, "Lookup error [query]: " + sql, 0);
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
                    Load(qd.Episode);
                    Load(qd.EpisodeEvent);

                    Load(qd.VisitCost);
                    Load(qd.ProcedureCost);
                    Load(qd.DeviceCost);
                    Load(qd.ObservationCost);
                    Load(qd.MeasurementCost);
                    Load(qd.DrugCost);
                }
            }

            if (!forLookup)
            {
                LoadPregnancyDrug();
                LoadVisitRollupLogic();
            }
        }

        private void Attach()
        {
            foreach (var qd in _settings.SourceQueryDefinitions)
            {
                Attach(qd.Persons);
                Attach(qd.ConditionOccurrence);
                Attach(qd.DrugExposure);
                Attach(qd.ProcedureOccurrence);
                Attach(qd.Observation);
                Attach(qd.VisitOccurrence);
                Attach(qd.VisitDetail);
                Attach(qd.Death);
                Attach(qd.Measurement);
                Attach(qd.DeviceExposure);
                Attach(qd.Note);
                Attach(qd.Episode);
                Attach(qd.EpisodeEvent);

                Attach(qd.VisitCost);
                Attach(qd.ProcedureCost);
                Attach(qd.DeviceCost);
                Attach(qd.ObservationCost);
                Attach(qd.MeasurementCost);
                Attach(qd.DrugCost);
            }
        }

        private void Attach(IEnumerable<EntityDefinition> definitions)
        {
            if (definitions == null) return;

            foreach (var ed in definitions)
            {
                ed.Vocabulary = this;
            }
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

        private void WriteLog(LogType status, string message, double progress)
        {
            Logger.Write(_connectionString, new LogMessage { ConversionId = _conversionId, Type = status, Text = message });
        }

        private static MemoryStream Compress(Stream inputStream)
        {
            inputStream.Position = 0;
            var outputStream = new MemoryStream();
            using (var gz = new BufferedStream(new GZipStream(outputStream, CompressionLevel.Optimal, true)))
            {
                inputStream.CopyTo(gz);
            }

            outputStream.Position = 0;

            return outputStream;
        }

        private static byte[] Decompress(byte[] compressed)
        {
            using var from = new MemoryStream(compressed);
            using var to = new MemoryStream();
            using var gZipStream = new GZipStream(from, CompressionMode.Decompress);
            gZipStream.CopyTo(to);
            return to.ToArray();
        }

        public void LoadVocabularyFromFileManager(string fileManagerUrl, string secureKey)
        {
            foreach (var l in DBBuilder.GetLookups(_connectionString, secureKey, _conversionId))
            {
                var name = l.Key.Replace("Lookup:", "");
                var contentKey = l.Value;

                WriteLog(LogType.Info, name + " - Downloading from File Manager...", 0);

                using var client = new HttpClient();
                var data = client.GetByteArrayAsync(fileManagerUrl + $"/{contentKey}");
                data.Wait();

                var content = Decompress(data.Result);
                using MemoryStream memoryStream = new MemoryStream();
                memoryStream.Write(content, 0, content.Length);

                BinaryFormatter bf = new BinaryFormatter();
                memoryStream.Position = 0;
                var lookupContent = bf.Deserialize(memoryStream);

                var lookup = new Lookup();
                lookup.Fill((Dictionary<string, Dictionary<int, LookupValue>>)lookupContent);
                _lookups.Add(name, lookup);

                Attach();

                WriteLog(LogType.Info, name + " - Downloading DONE", 0);
            }
        }

        public void StoreToFileManager(string userName, string fileManagerUrl, string secureKey)
        {
            var lookupNames = new List<Tuple<string, string>>();
            foreach (var l in _lookups)
            {
                var name = l.Key;
                var lookup = l.Value;

                WriteLog(LogType.Info, name + " - Uploading to File Manager...", 0);

                byte[] zipBytes;

                BinaryFormatter bf = new BinaryFormatter();
                using (var sourceStream = new MemoryStream())
                {
                    bf.Serialize(sourceStream, lookup.Content);
                    var res = sourceStream.ToArray();

                    zipBytes = Compress(sourceStream).ToArray();
                }

                //byte[] hash;
                //using (var md5 = System.Security.Cryptography.MD5.Create())
                //{
                //    md5.TransformFinalBlock(zipBytes, 0, zipBytes.Length);
                //    hash = md5.Hash;
                //}

                //string hashPassword = BitConverter.ToString(hash).Replace("-", "");

                using var client = new HttpClient();
                using var formData = new MultipartFormDataContent();
                {
                    formData.Add(new StringContent(userName), "username");
                    formData.Add(new StringContent(name), "dataKey");
                    formData.Add(new ByteArrayContent(zipBytes), "file", "file.zip");

                    var response = client.PostAsync(fileManagerUrl, formData);
                    response.Wait();
                    var content = response.Result.Content.ReadAsStringAsync();
                    content.Wait();

                    dynamic data = JToken.Parse(content.Result);
                    string contentKey = data.id;

                    lookupNames.Add(new Tuple<string, string>("Lookup:" + name, contentKey));
                };

                DBBuilder.StoreParameters(_connectionString, secureKey, _conversionId, lookupNames);

                WriteLog(LogType.Info, name + " - Uploading DONE", 0);
            }
        }
    }
}
