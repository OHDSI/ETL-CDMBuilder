using org.ohdsi.cdm.framework.common.Base;
using org.ohdsi.cdm.framework.common.Builder;
using org.ohdsi.cdm.framework.common.Extensions;
using org.ohdsi.cdm.framework.common.Omop;
using org.ohdsi.cdm.framework.desktop.Enums;
using org.ohdsi.cdm.framework.desktop.Helpers;
using org.ohdsi.cdm.framework.desktop.Savers;
using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using FrameworkSettings = org.ohdsi.cdm.framework.desktop.Settings;

namespace org.ohdsi.cdm.presentation.builder.Utility.CdmFrameworkImport
{
    public class DatabaseChunkPartAdapter
    {
        private static readonly string[] tableExclusionArray = new string[]
        {
            "ccae_tests_native.LONG_TERM_CARE"
        };

        private readonly framework.desktop.Base.DatabaseChunkPart _databaseChunkPart;
        private readonly KeyMasterOffsetManager _offsetManager;
        private readonly int _chunkId;
        private readonly string _prefix;
        private readonly int _attempt;

        public DatabaseChunkPartAdapter(Func<IPersonBuilder> createPersonBuilder, int chunkId, string prefix, int attempt)
        {
            _databaseChunkPart = new framework.desktop.Base.DatabaseChunkPart(chunkId, createPersonBuilder, prefix, attempt);
            _offsetManager = new KeyMasterOffsetManager(_chunkId, int.Parse(prefix), attempt);
            _chunkId = chunkId;
            _prefix = prefix;
            _attempt = attempt;
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
                try
                {                    
                    LoadQuery(queries[i]);
                }
                catch(Exception e)
                {
                    /*
                     * 
                     */
                    //error info is written in LoadQuery catch
                    Console.WriteLine("Query number is " + i);
                    throw;
                }

            stopwatch.Stop();
            Logger.Write(_chunkId, Logger.LogMessageTypes.Info,
                $"ChunkId={_chunkId} has been loaded - {stopwatch.ElapsedMilliseconds} ms | {GC.GetTotalMemory(false) / 1024f / 1024f} Mb");

            return new KeyValuePair<string, Exception>(null, null);
        }

        public void Build()
        {
            while(true) //debug
            try
            {
                var timer = new Stopwatch();
                timer.Start();

                foreach (KeyValuePair<long, Lazy<IPersonBuilder>> personBuilder in _databaseChunkPart.PersonBuilders)
                {
                    Attrition attrition = personBuilder.Value.Value.Build(_databaseChunkPart.ChunkData, _offsetManager);
                    _databaseChunkPart.ChunkData.AddAttrition(personBuilder.Key, attrition);
                }
                _databaseChunkPart.PersonBuilders.Clear();
                _databaseChunkPart.PersonBuilders = null;

                Logger.Write(_chunkId, Logger.LogMessageTypes.Info,
                    $"ChunkId={_chunkId} has been built - {timer.ElapsedMilliseconds} ms | {GC.GetTotalMemory(false) / 1024f / 1024f} Mb | {_databaseChunkPart.ChunkData.Persons.Count} persons");
                    break;
            }
            catch (Exception e)
            {
                //throw;
            }
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
            var saver = Utility.CdmFrameworkImport.Savers.Saver.GetSaverFromFrameworkSaver(frameworkSaver);
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
                Logger.Write(_chunkId, Logger.LogMessageTypes.Info,
                    $"ChunkId={_chunkId} was saved - {stopwatch.ElapsedMilliseconds} ms | {GC.GetTotalMemory(false) / 1024f / 1024f} Mb");
                _databaseChunkPart.ChunkData.Clean();
                GC.Collect();
            }
            catch (Exception e)
            {
                string eMes = e.Message;
                throw;
            }
        }

        public void Clean()
        {
            _databaseChunkPart.ChunkData.Clean();
        }

        private void LoadQuery(framework.common.Definitions.QueryDefinition sourceQueryDefinition)
        {
            var building = FrameworkSettings.Settings.Current.Building;

            string sourceQueryDefinitionSql = "";
            string sqlClean = "";
            string sourceConnectionString = "";
            string sourceEngine = "";

            try
            {
                var sourceQueryDefinitionTyped = new QueryDefinitionAdapter(sourceQueryDefinition);
                if (sourceQueryDefinitionTyped.HasAnyProvidersLocationsCareSites)
                    return;
                                
                sourceQueryDefinitionSql = sourceQueryDefinitionTyped.GetSql(building.Vendor, building.SourceSchemaName, building.SourceSchemaName);
                sqlClean = GetSqlHelper.TranslateSqlFromRedshift(building.Vendor, building.SourceEngine.Database, sourceQueryDefinitionSql, building.SourceSchemaName, _chunkId.ToString());
                if (string.IsNullOrEmpty(sqlClean))
                    return;

               if (tableExclusionArray.Any(s => sqlClean.Replace("`", "").Contains(s, StringComparison.InvariantCultureIgnoreCase)))
                    return;

                if (building.SourceEngine.Database == Database.Redshift)
                {
                    using IDataReader dataReader2 = building.SourceEngine.ReadChunkData(null, null, sourceQueryDefinition, _chunkId, _prefix);
                    while (dataReader2.Read())
                    {
                        _databaseChunkPart.PopulateData(sourceQueryDefinition, dataReader2);
                    }
                    return;
                }
                sourceConnectionString = building.SourceConnectionString;
                sourceEngine = building.SourceEngine.Database.ToString();
                using (var dbConnection = SqlConnectionHelper.OpenOdbcConnection(building.SourceConnectionString))
                //using (IDbConnection dbConnection = building.SourceEngine.GetConnection(building.SourceConnectionString))
                {
                    using IDbCommand cmd = building.SourceEngine.GetCommand(sqlClean, dbConnection);
                    using IDataReader dataReader = building.SourceEngine.ReadChunkData(dbConnection, cmd, sourceQueryDefinition, _chunkId, _prefix);
                    while (dataReader.Read())
                    {
                        _databaseChunkPart.PopulateData(sourceQueryDefinition, dataReader);
                    }
                }
            }
            catch (Exception ex)
            {                
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.AppendLine(ex.Message);
                stringBuilder.AppendLine("SourceEngine=" + sourceEngine);
                stringBuilder.AppendLine("SourceConnectionString=" + sourceConnectionString);
                stringBuilder.AppendLine("Query:");
                stringBuilder.AppendLine(sqlClean);
                Logger.WriteError(_chunkId, new Exception(stringBuilder.ToString(), ex));

                //throw;
            }
        }
    }
}
