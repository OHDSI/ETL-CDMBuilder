using org.ohdsi.cdm.framework.common.Base;
using org.ohdsi.cdm.framework.common.Builder;
using org.ohdsi.cdm.framework.common.Omop;
using org.ohdsi.cdm.framework.desktop.Helpers;
using org.ohdsi.cdm.framework.desktop.Savers;
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

        public KeyValuePair<string, Exception> Load()
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

                    LoadQuery(query);
                }
                catch (Exception e)
                {
                    //error info is written in LoadQuery catch
                    Console.WriteLine("\n\rFileName is " + queries[i].FileName + ". Query number is " + i + "\n\r");
                }
            }

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

            //Logger.Write(_chunkId, Logger.LogMessageTypes.Info,
            //    $"ChunkId={_chunkId} has been built - {timer.ElapsedMilliseconds} ms | {GC.GetTotalMemory(false) / 1024f / 1024f} Mb | {_databaseChunkPart.ChunkData.Persons.Count} persons");
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
                //Logger.Write(_chunkId, Logger.LogMessageTypes.Info,
                //    $"ChunkId={_chunkId} was saved - {stopwatch.ElapsedMilliseconds} ms | {GC.GetTotalMemory(false) / 1024f / 1024f} Mb");
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
            string sourceConnectionString = "";
            string sourceEngine = "";

            try
            {
                var sourceQueryDefinitionTyped = new QueryDefinitionAdapter(sourceQueryDefinition);
                if (sourceQueryDefinitionTyped.HasAnyProvidersLocationsCareSites)
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

                // this is a workaround to pass sourceQueryDefinition with a correct code to building.SourceEngine.ReadChunkData()
                // without this chunkId = {0} filter becomes 0 for all chunks and all iterations
                var sourceQueryDefinitionQueryTextBackup = sourceQueryDefinition.Query.Text;

                sourceQueryDefinitionSql = sourceQueryDefinitionTyped.GetSql(building.Vendor, building.SourceSchemaName, building.SourceSchemaName);
                sourceQueryDefinition.Query.Text = Utility.GetSqlHelper.TranslateSqlFromRedshift(building.Vendor, building.SourceEngine.Database, sourceQueryDefinitionSql,
                    building.SourceSchemaName, building.SourceSchemaName, sourceQueryDefinition.FileName, _chunkId.ToString());
                if (string.IsNullOrEmpty(sourceQueryDefinition.Query.Text))
                    return;

                sourceConnectionString = building.SourceConnectionString;
                sourceEngine = building.SourceEngine.Database.ToString();

                using (var dbConnection = SqlConnectionHelper.OpenOdbcConnection(building.SourceConnectionString))
                //using (IDbConnection dbConnection = building.SourceEngine.GetConnection(building.SourceConnectionString))
                {
                    using IDbCommand cmd = building.SourceEngine.GetCommand(sourceQueryDefinition.Query.Text, dbConnection);
                    cmd.CommandTimeout = 6000;
                    using IDataReader dataReader = building.SourceEngine.ReadChunkData(dbConnection, cmd, sourceQueryDefinition, _chunkId, _prefix);
                    while (dataReader.Read())
                    {
                        _databaseChunkPart.PopulateData(sourceQueryDefinition, dataReader);
                    }
                }

                sourceQueryDefinition.Query.Text = sourceQueryDefinitionQueryTextBackup;
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
                stringBuilder.AppendLine(sourceQueryDefinition.Query.Text);
                Logger.WriteError(_chunkId, new Exception(stringBuilder.ToString(), ex));

                throw;
            }
        }
    }
}
