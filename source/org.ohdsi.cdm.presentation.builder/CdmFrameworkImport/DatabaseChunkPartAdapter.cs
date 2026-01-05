using org.ohdsi.cdm.framework.common.Base;
using org.ohdsi.cdm.framework.common.Builder;
using org.ohdsi.cdm.framework.common.Omop;
using org.ohdsi.cdm.framework.desktop.Helpers;
using org.ohdsi.cdm.framework.desktop.Savers;
using org.ohdsi.cdm.presentation.builder.Utility;
using Spectre.Console;
using System.Data;
using System.Diagnostics;
using System.Text;
using FrameworkSettings = org.ohdsi.cdm.framework.desktop.Settings;

namespace org.ohdsi.cdm.presentation.builder.CdmFrameworkImport
{
    public class DatabaseChunkPartAdapter
    {
        private readonly framework.desktop.Base.DatabaseChunkPart _databaseChunkPart;
        private readonly KeyMasterOffsetManager _offsetManager;
        private readonly int _chunkId;
        private readonly string _prefix;
        private readonly int _attempt;

        public DatabaseChunkPartAdapter(Func<IPersonBuilder> createPersonBuilder, int chunkId, string prefix, int attempt)
        {
            _chunkId = chunkId;
            _prefix = prefix;
            _attempt = attempt;
            _databaseChunkPart = new framework.desktop.Base.DatabaseChunkPart(chunkId, createPersonBuilder, prefix, attempt);            
            _offsetManager = _databaseChunkPart.Offset;            
        }

        public framework.desktop.Base.DatabaseChunkPart GetDatabaseChunkPart()
        {
            return _databaseChunkPart;
        }

        public void Reset()
        {
            _databaseChunkPart.Reset();
        }

        public KeyValuePair<string, Exception> Load(ProgressTask chunkTask)
        {
            Stopwatch stopwatch = new Stopwatch();
            stopwatch.Start();

            var queries = FrameworkSettings.Settings.Current.Building.SourceQueryDefinitions;

            for (int i = 0; i < queries.Count; i++)
            {
                var query = queries[i];
                var fileName = query.FileName;
                try
                {
                    if (query.Query.Database != null)
                    {
                        var settingsDb = Settings.Current.Building.SourceDb + "." + Settings.Current.Building.SourceSchema;
                        var dbs = query.Query.Database.Split(new[] { "," }, StringSplitOptions.RemoveEmptyEntries);
                        if (!dbs.Any(s => settingsDb.Contains(s, StringComparison.InvariantCultureIgnoreCase)))
                            continue; //do not process query if the database requirements are not met
                    }

                    chunkTask.Description = $"Chunk {_chunkId} | {fileName}({i}/{queries.Count})";
                    LoadQuery(query);
                }
                catch (Exception e)
                {
                    //error info is written in LoadQuery catch
                    AnsiConsole.WriteLine("\n\rFileName is " + queries[i].FileName + ". Query number is " + i + "\n\r");
                    throw;
                }
            }
            chunkTask.Description = $"Chunk {_chunkId}";

            stopwatch.Stop();

            return new KeyValuePair<string, Exception>(null, null);
        }

        public void Build(ProgressTask progressTask, ProgressTask overallTask)
        {
            var timer = new Stopwatch();
            timer.Start();

            foreach (KeyValuePair<long, Lazy<IPersonBuilder>> personBuilder in _databaseChunkPart.PersonBuilders)
                try
                {
                    Attrition attrition = personBuilder.Value.Value.Build(_databaseChunkPart.ChunkData, _offsetManager);
                    _databaseChunkPart.ChunkData.AddAttrition(personBuilder.Key, attrition);
                    
                    progressTask.Increment(1);
                    overallTask.Increment(1);
                }
                catch (Exception e)
                {
                    Logger.Write(_chunkId, Logger.LogMessageTypes.Error, $"PersonBuilder fails at id {personBuilder.Key}!\r\n{e.Message}\r\n{e.InnerException?.Message ?? ""}");
                    throw; 
                }
            _databaseChunkPart.PersonBuilders.Clear();
            _databaseChunkPart.PersonBuilders = null;
        }

        public void Save()
        {
            if (FrameworkSettings.Settings.Current.Building.Vendor.Name != "PregnancyAlgorithm"
                && FrameworkSettings.Settings.Current.Building.Vendor.Name != "Era"
                && _databaseChunkPart.ChunkData.Persons.Count == 0)
            {
                _databaseChunkPart.ChunkData.Clean();
                return;
            }
            ISaver frameworkSaver = FrameworkSettings.Settings.Current.Building.DestinationEngine.GetSaver();
            var saver = CdmFrameworkImport.Savers.Saver.GetSaverFromFrameworkSaver(frameworkSaver);
            Stopwatch stopwatch = new Stopwatch();

            try
            {
                stopwatch.Start();
                using (saver)
                {
                    var createdSaver = saver.Create(FrameworkSettings.Settings.Current.Building.DestinationConnectionString);
                    createdSaver.Save(_databaseChunkPart.ChunkData, _offsetManager);
                }
                stopwatch.Stop();
                _databaseChunkPart.ChunkData.Clean();
                GC.Collect();
            }
            catch (Exception e)
            {
                string eMes = e.Message;
                throw;
            }
        }

        private void LoadQuery(framework.common.Definitions.QueryDefinition sourceQueryDefinition)
        {
            var building = FrameworkSettings.Settings.Current.Building;

            string sourceQueryDefinitionSql = "";
            string sqlRenderTranslatedSql = "";
            string translatedSql = "";
            string sourceConnectionString = "";
            string sourceEngine = "";

            try
            {
                var sourceQueryDefinitionAdapter = new QueryDefinitionAdapter(sourceQueryDefinition);
                if (sourceQueryDefinitionAdapter.HasAnyProvidersLocationsCareSites)
                    return;

                #region debug remove this after fixing core package
                //NoteDefinition.GetConcepts throws NotImplementedException
                if (new[] { "alz_problem", "nlp_biomarker", "nlp_drug_rationale", "nlp_measurements", "nlp_sds", "nlp_sds_family" }
                    .Any(s => s == sourceQueryDefinition.FileName))
                    return;
                //error at lookup
                if (new[] { "alz_biomarker" }
                    .Any(s => s == sourceQueryDefinition.FileName))
                    return;
                #endregion

                sourceQueryDefinitionSql = sourceQueryDefinitionAdapter.GetSql(building.Vendor, building.SourceSchemaName, building.SourceSchemaName).Trim();

                sqlRenderTranslatedSql = SqlRenderTranslator.Translate(new SqlRenderTranslator.Request(
                    null,
                    building.Vendor.Name,
                    sourceQueryDefinition.FileName,
                    sourceQueryDefinitionSql,
                    building.SourceEngine.Database
                    ));

                translatedSql = Utility.NativeTranslators.GetSqlHelper.TranslateSqlFromRedshift(building.Vendor, building.SourceEngine.Database, sqlRenderTranslatedSql,
                    building.SourceSchemaName, building.SourceSchemaName, sourceQueryDefinitionAdapter.FileName, _chunkId.ToString());

                if (string.IsNullOrEmpty(translatedSql))
                    return;

                sourceConnectionString = building.SourceConnectionString;
                sourceEngine = building.SourceEngine.Database.ToString();

                using (var dbConnection = SqlConnectionHelper.OpenOdbcConnection(building.SourceConnectionString))
                {
                    if (Settings.Current.Building.SourceEngine.Database == framework.desktop.Enums.Database.Postgre)
                        try
                        {
                            //this is absolutely necessary if a huge table cannot be indexed due to lack of space for data or temp, but it is partitioned
                            //does not affect the load for non-partitioned tables

                            using IDbCommand cmdPartitionPruning = building.SourceEngine.GetCommand("SET enable_partition_pruning = on", dbConnection);
                            cmdPartitionPruning.ExecuteNonQuery();

                            using IDbCommand cdmPartitionJoin = building.SourceEngine.GetCommand("SET enable_partitionwise_join = on", dbConnection);
                            cdmPartitionJoin.ExecuteNonQuery();
                        }
                        catch(Exception prepEx)
                        {
                            AnsiConsole.WriteException(prepEx, ExceptionFormats.NoStackTrace);
                            throw;
                        }

                    using IDbCommand cmd = building.SourceEngine.GetCommand(translatedSql, dbConnection);
                    cmd.CommandTimeout = 6000;
                    using IDataReader dataReader = building.SourceEngine.ReadChunkData(dbConnection, cmd, sourceQueryDefinitionAdapter, _chunkId, _prefix);
                    while (dataReader.Read())
                    {
                        _databaseChunkPart.PopulateData(sourceQueryDefinitionAdapter, dataReader);
                    }
                }
            }
            catch (Exception ex)
            {
                StringBuilder stringBuilder = new StringBuilder();
                for (int lineCur = 0; lineCur < 10; lineCur++) 
                    stringBuilder.AppendLine();
                stringBuilder.AppendLine(ex.Message);
                stringBuilder.AppendLine("SourceEngine=" + sourceEngine);
                stringBuilder.AppendLine("SourceConnectionString=" + sourceConnectionString);
                stringBuilder.AppendLine("Query:");
                stringBuilder.AppendLine(translatedSql);
                Logger.WriteError(_chunkId, new Exception(stringBuilder.ToString(), ex));

                throw;
            }
        }
    }
}
