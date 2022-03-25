using Microsoft.Extensions.Configuration;
using org.ohdsi.cdm.framework.common.DataReaders.v5;
using org.ohdsi.cdm.framework.common.DataReaders.v5.v54;
using org.ohdsi.cdm.framework.common.Definitions;
using org.ohdsi.cdm.framework.common.Omop;
using org.ohdsi.cdm.framework.desktop.DbLayer;
using org.ohdsi.cdm.framework.desktop.Helpers;
using org.ohdsi.cdm.presentation.builderwebapi.Database;
using org.ohdsi.cdm.presentation.builderwebapi.Enums;
using org.ohdsi.cdm.presentation.builderwebapi.ETL;
using org.ohdsi.cdm.presentation.builderwebapi.Log;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;

namespace org.ohdsi.cdm.presentation.builderwebapi.Controllers
{
    public class ConversionController
    {
        private Settings _settings;

        private int _conversionId;
        private string _connectionString;

        public ConversionController(int conversionId)
        {
            _conversionId = conversionId;
        }

        public void Init(IConfiguration configuration)
        {
            _connectionString = configuration.GetConnectionString("DefaultConnection");
            var key = configuration.GetSection("AppSettings").GetSection("Key").Value;

            ConversionSettings settings = ConversionSettings.SetProperties(DBBuilder.GetParameters(_connectionString, key, _conversionId));
            _settings = new Settings(settings, configuration);
            _settings.Load();
        }

        public void Start()
        {
            if (CreateDestination())
            {
                CreateLookup();
                CreateChunks();
            }
        }

        private void CreateChunks()
        {
            if (DBBuilder.IsConversionAborted(_connectionString, _conversionId))
            {
                DBBuilder.CancelStep(_connectionString, _conversionId, Steps.CreateChunks);
                return;
            }

            DBBuilder.StartStep(_connectionString, _conversionId, Steps.CreateChunks);
            try
            {
                var chunkController = new ChunkController(_settings);
                var chunksCount = chunkController.CreateChunks(_connectionString, _conversionId);
            }
            catch (Exception e)
            {
                DBBuilder.FailStep(_connectionString, _conversionId, Steps.CreateChunks);
                WriteLog(LogType.Error, e.Message, 0);
            }

            DBBuilder.CompleteStep(_connectionString, _conversionId, Steps.CreateChunks);
            DBBuilder.StartStep(_connectionString, _conversionId, Steps.ConvertChunks);
        }

        private void WriteLog(LogType status, string message, Double progress)
        {
            Logger.Write(_connectionString, new LogMessage { ConversionId = _conversionId, Type = status, Text = message });
        }

        private bool CreateDestination()
        {
            WriteLog(LogType.Info, "Creating CDM database...", 0);
            DBBuilder.StartStep(_connectionString, _conversionId, Steps.CreateDestination);

            var dbDestination = new DbDestination(_settings.DestinationConnectionString,
                   _settings.ConversionSettings.DestinationSchema);

            try
            {
                dbDestination.CreateDatabase(_settings.CreateCdmDatabaseScript);
                WriteLog(LogType.Info, "CDM database created", 0);
            }
            catch (Exception e)
            {
                WriteLog(LogType.Warning, "Warning: CDM database exists", 0);
            }

            try
            {
                dbDestination.CreateSchema();
                WriteLog(LogType.Info, "Schema created", 0);
            }
            catch (Exception e)
            {
                WriteLog(LogType.Warning, "Warning: CDM schema exists", 0);
            }

            bool successful;
            try
            {
                dbDestination.ExecuteQuery(_settings.CreateCdmTablesScript);
                WriteLog(LogType.Info, "CDM tables created", 0);
                DBBuilder.CompleteStep(_connectionString, _conversionId, Steps.CreateDestination);

                successful = true;
            }
            catch (Exception e)
            {
                WriteLog(LogType.Warning, "Warning: CDM tables exists" , 0);
                try
                {
                    dbDestination.ExecuteQuery(_settings.TruncateTablesScript);
                    WriteLog(LogType.Info, "CDM tables truncated", 0);
                    successful = true;
                }
                catch (Exception e2)
                {
                    WriteLog(LogType.Error, e2.Message, 0);
                    DBBuilder.FailStep(_connectionString, _conversionId, Steps.CreateDestination);
                    throw e2;
                }
            }

            DBBuilder.CompleteStep(_connectionString, _conversionId, Steps.CreateDestination);

            return successful;
        }

        private void CreateLookup()
        {
            if (DBBuilder.IsConversionAborted(_connectionString, _conversionId))
            {
                DBBuilder.CancelStep(_connectionString, _conversionId, Steps.ConvertHealthSystemData);
                return;
            }

            DBBuilder.StartStep(_connectionString, _conversionId, Steps.ConvertHealthSystemData);

            var timer = new Stopwatch();
            timer.Start();
            var vocabulary = new Vocabulary(_settings, _connectionString, _conversionId);
            vocabulary.Fill(true, false);

            var locationConcepts = new List<Location>();
            var careSiteConcepts = new List<CareSite>();
            var providerConcepts = new List<Provider>();

            LoadLocation(locationConcepts);
            LoadCareSite(careSiteConcepts);
            LoadProvider(providerConcepts);
            SaveLookup(timer, locationConcepts, careSiteConcepts, providerConcepts);

            locationConcepts.Clear();
            careSiteConcepts.Clear();
            providerConcepts.Clear();
            locationConcepts = null;
            careSiteConcepts = null;
            providerConcepts = null;
            vocabulary = null;
            GC.Collect();
            GC.WaitForPendingFinalizers();
            DBBuilder.CompleteStep(_connectionString, _conversionId, Steps.ConvertHealthSystemData);
        }

        private void SaveLookup(Stopwatch timer, List<Location> locationConcepts, List<CareSite> careSiteConcepts, List<Provider> providerConcepts)
        {
            if (DBBuilder.IsConversionAborted(_connectionString, _conversionId)) 
                return;

            Console.WriteLine("Saving lookups...");
            WriteLog(LogType.Info, "Saving lookups...", 0);

            var saver = _settings.DestinationEngine.GetSaver();
            using (saver.Create(_settings.DestinationConnectionString,
                _settings.Cdm,
                _settings.ConversionSettings.SourceSchema,
                _settings.ConversionSettings.DestinationSchema))
            {
                saver.SaveEntityLookup(_settings.Cdm, locationConcepts, careSiteConcepts, providerConcepts, null);
            }

            using (saver.Create(_settings.DestinationConnectionString,
                _settings.Cdm,
                _settings.ConversionSettings.SourceSchema,
                _settings.ConversionSettings.DestinationSchema))
            {
                if (_settings.Cdm == framework.common.Enums.CdmVersions.V53)
                {
                    var reader = new CdmSourceDataReader(new CdmSource
                    {
                        CdmSourceName = _settings.ConversionSettings.SourceDatabase,
                        CdmSourceAbbreviation = _settings.ConversionSettings.SourceDatabase,
                        SourceDescription = _settings.ConversionSettings.SourceDatabase,
                        CdmEtlReference = "unknown",
                        SourceDocumentationReference = "None",
                        CdmReleaseDate = DateTime.Now,
                        SourceReleaseDate = DateTime.Now,
                        CdmVersion = _settings.GetCdmScriptsFolder,
                        VocabularyVersion = "5.3",
                        CdmHolder = "unknown"
                    });
                    saver.Write(null, null, reader, "CDM_SOURCE");
                    saver.Commit();
                }
                else if (_settings.Cdm == framework.common.Enums.CdmVersions.V54)
                {
                    var reader = new CdmSourceDataReader54(new CdmSource
                    {
                        CdmSourceName = _settings.ConversionSettings.SourceDatabase,
                        CdmSourceAbbreviation = _settings.ConversionSettings.SourceDatabase,
                        SourceDescription = _settings.ConversionSettings.SourceDatabase,
                        CdmEtlReference = "unknown",
                        SourceDocumentationReference = "None",
                        CdmReleaseDate = DateTime.Now,
                        SourceReleaseDate = DateTime.Now,
                        CdmVersion = _settings.GetCdmScriptsFolder,
                        VocabularyVersion = "5.4",
                        CdmHolder = "unknown"
                    });
                    saver.Write(null, null, reader, "CDM_SOURCE");
                    saver.Commit();
                }
                else
                {
                    var reader = new CdmSourceDataReader(new CdmSource
                    {
                        CdmSourceName = _settings.ConversionSettings.SourceDatabase,
                        CdmSourceAbbreviation = _settings.ConversionSettings.SourceDatabase,
                        SourceDescription = _settings.ConversionSettings.SourceDatabase,
                        CdmEtlReference = "unknown",
                        SourceDocumentationReference = "None",
                        CdmReleaseDate = DateTime.Now,
                        SourceReleaseDate = DateTime.Now,
                        CdmVersion = _settings.GetCdmScriptsFolder,
                        VocabularyVersion = "6.0",
                        CdmHolder = "unknown"
                    });
                    saver.Write(null, null, reader, "CDM_SOURCE");
                    saver.Commit();
                }
            }

            Console.WriteLine("Lookups was saved ");
            WriteLog(LogType.Info, "Lookups was saved", 0);
            timer.Stop();

            //WriteLog(LogType.Info, string.Format("{0}| {1}", DateTime.Now, $"Care site, Location and Provider tables were saved to CDM database - {timer.ElapsedMilliseconds} ms"), 0);
        }

        private void LoadProvider(List<Provider> providerConcepts)
        {
            if (DBBuilder.IsConversionAborted(_connectionString, _conversionId)) 
                return;

            Console.WriteLine("Loading providers...");
            WriteLog(LogType.Info, "Loading providers...", 0);
            var provider = _settings.SourceQueryDefinitions.FirstOrDefault(qd => qd.Providers != null);
            if (provider != null)
            {
                FillList<Provider>(providerConcepts, provider, provider.Providers[0]);
            }
            Console.WriteLine("Providers was loaded");
            WriteLog(LogType.Info, "Providers was loaded", 0);
        }

        private void LoadCareSite(List<CareSite> careSiteConcepts)
        {
            if (DBBuilder.IsConversionAborted(_connectionString, _conversionId)) 
                return;

            Console.WriteLine("Loading care sites...");
            WriteLog(LogType.Info, "Loading care sites...", 0);

            var careSite = _settings.SourceQueryDefinitions.FirstOrDefault(qd => qd.CareSites != null);
            if (careSite != null)
            {
                FillList<CareSite>(careSiteConcepts, careSite, careSite.CareSites[0]);
            }

            if (careSiteConcepts.Count == 0)
                careSiteConcepts.Add(new CareSite { Id = 0, LocationId = 0, OrganizationId = 0, PlaceOfSvcSourceValue = null });
            Console.WriteLine("Care sites was loaded");
            WriteLog(LogType.Info, "Care sites was loaded", 0);
        }

        private void LoadLocation(List<Location> locationConcepts)
        {
            if (DBBuilder.IsConversionAborted(_connectionString, _conversionId)) 
                return;

            Console.WriteLine("Loading locations...");
            WriteLog(LogType.Info, "Loading locations...", 0);
            var location = _settings.SourceQueryDefinitions.FirstOrDefault(qd => qd.Locations != null);
            if (location != null)
            {
                FillList<Location>(locationConcepts, location, location.Locations[0]);
            }

            if (locationConcepts.Count == 0)
                locationConcepts.Add(new Location { Id = Entity.GetId(null) });
            Console.WriteLine("Locations was loaded");
            WriteLog(LogType.Info, "Locations was loaded", 0);
        }

        private void FillList<T>(ICollection<T> list, QueryDefinition qd, EntityDefinition ed) where T : IEntity
        {
            var sql = GetSqlHelper.GetSql(_settings.SourceEngine.Database,
                qd.GetSql("", _settings.ConversionSettings.SourceSchema), _settings.ConversionSettings.SourceSchema);

            if (string.IsNullOrEmpty(sql)) return;

            var keys = new Dictionary<string, bool>();
            using var connection = _settings.SourceEngine.GetConnection(_settings.SourceConnectionString);
            {
                using var c = _settings.SourceEngine.GetCommand(sql, connection);
                c.CommandTimeout = 30000;
                using var reader = c.ExecuteReader();
                while (reader.Read())
                {
                    Concept conceptDef = null;
                    if (ed.Concepts != null && ed.Concepts.Any())
                        conceptDef = ed.Concepts[0];

                    var concept = (T)ed.GetConcepts(conceptDef, reader, null).ToList()[0];

                    var key = concept.GetKey();
                    if (key == null) continue;

                    if (keys.ContainsKey(key))
                        continue;

                    keys.Add(key, false);

                    list.Add(concept);
                }
            }
        }
       
    }
}