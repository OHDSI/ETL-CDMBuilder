using org.ohdsi.cdm.framework.common.Base;
using org.ohdsi.cdm.framework.common.Builder;
using org.ohdsi.cdm.framework.common.Extensions;
using org.ohdsi.cdm.framework.common.Omop;
using org.ohdsi.cdm.framework.desktop.Enums;
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

namespace org.ohdsi.cdm.presentation.builder.Utility.CdmFrameworkImportComposition
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
            var building = FrameworkSettings.Settings.Current.Building;

            string sqlClean = "";
            string sourceConnectionString = "";
            string sourceEngine = "";

            try
            {
                Stopwatch stopwatch = new Stopwatch();
                stopwatch.Start();
                foreach (var sourceQueryDefinition in building.SourceQueryDefinitions)
                {
                    var sourceQueryDefinitionTyped = new QueryDefinitionAdapter(sourceQueryDefinition);
                    if (sourceQueryDefinitionTyped.HasAnyProvidersLocationsCareSites)
                        continue;

                    string sourceQueryDefinitionSql = sourceQueryDefinitionTyped.GetSql(building.Vendor, building.SourceSchemaName, building.SourceSchemaName);
                    sqlClean = GetSqlHelper.TranslateSql(building.Vendor, building.SourceEngine.Database, sourceQueryDefinitionSql, building.SourceSchemaName, _chunkId.ToString());
                    if (string.IsNullOrEmpty(sqlClean))
                        continue;

                    //debug
                    if (tableExclusionArray.Any(s => sqlClean.Contains(s, StringComparison.InvariantCultureIgnoreCase)))
                        continue;

                    if (building.SourceEngine.Database != Database.Redshift)
                    {
                        sourceConnectionString = building.SourceConnectionString;
                        sourceEngine = building.SourceEngine.Database.ToString();
                        using (IDbConnection dbConnection = building.SourceEngine.GetConnection(building.SourceConnectionString))
                        {
                            using IDbCommand cmd = building.SourceEngine.GetCommand(sqlClean, dbConnection);
                            using IDataReader dataReader = building.SourceEngine.ReadChunkData(dbConnection, cmd, sourceQueryDefinition, _chunkId, _prefix);
                            while (dataReader.Read())
                            {
                                _databaseChunkPart.PopulateData(sourceQueryDefinition, dataReader);
                            }
                        }
                        continue;
                    }
                    using IDataReader dataReader2 = building.SourceEngine.ReadChunkData(null, null, sourceQueryDefinition, _chunkId, _prefix);
                    while (dataReader2.Read())
                    {
                        _databaseChunkPart.PopulateData(sourceQueryDefinition, dataReader2);
                    }
                }
                stopwatch.Stop();
            }
            catch (Exception value2)
            {
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.AppendLine("SourceEngine=" + sourceEngine);
                stringBuilder.AppendLine("SourceConnectionString=" + sourceConnectionString);
                stringBuilder.AppendLine("Query:");
                stringBuilder.AppendLine(sqlClean);
                return new KeyValuePair<string, Exception>(stringBuilder.ToString(), value2);
            }
            return new KeyValuePair<string, Exception>(null, null);
        }

        public void Build()
        {
            Console.WriteLine($"Building CDM chunkId={_chunkId} ...");
            foreach (KeyValuePair<long, Lazy<IPersonBuilder>> personBuilder in _databaseChunkPart.PersonBuilders)
            {
                Attrition attrition = personBuilder.Value.Value.Build(_databaseChunkPart.ChunkData, _offsetManager);
                _databaseChunkPart.ChunkData.AddAttrition(personBuilder.Key, attrition);
            }
            _databaseChunkPart.PersonBuilders.Clear();
            _databaseChunkPart.PersonBuilders = null;
            Console.WriteLine($"Building CDM chunkId={_chunkId} - complete");
        }

        /// <summary>
        /// Make database specific data preparations
        /// </summary>
        /// <param name="engine"></param>
        /// <exception cref="NotImplementedException"></exception>
        public void MakeDatabaseSpecificDataPreparations(Database engine)
        {
            Console.WriteLine($"Make database specific preparations...");
            switch (engine)
            {
                // avoid SQL Error: 22021: invalid byte sequence for encoding "UTF8": 0x00
                // postgre npgsql driver does not support null characters in strings
                // so solution is to replace all null strings with "" across all properties in all lists
                // alse replace "\0" with ""
                case Database.Postgre:
                    {
                        Console.WriteLine($"Make preparations for Postgre...");
                        var listProperties = _databaseChunkPart.ChunkData.GetType()
                            .GetProperties(BindingFlags.Public | BindingFlags.Instance)
                            .Where(p => p.PropertyType.IsGenericType
                                        && p.PropertyType.GetGenericTypeDefinition() == typeof(List<>))
                            .ToList();

                        foreach (var chunkDataList in listProperties)
                        {
                            var listObject = chunkDataList.GetValue(_databaseChunkPart.ChunkData);
                            if (listObject is not System.Collections.IEnumerable listTyped)
                                throw new NullReferenceException("Failed to get list of data to prepare for Postgre!");

                            var listElementType = chunkDataList.PropertyType.GetGenericArguments().First();
                            var stringProperties = listElementType
                                .GetProperties(BindingFlags.Public | BindingFlags.Instance)
                                .Where(p => p.PropertyType == typeof(string))
                                .ToList();

                            foreach (var listElement in listTyped)
                            {
                                foreach (var prop in stringProperties)
                                {
                                    var value = prop.GetValue(listElement) as string;

                                    if (value == null)
                                    {
                                        prop.SetValue(listElement, string.Empty);
                                    }
                                    else
                                    {
                                        var valueNew = value.Replace("\0", "");
                                        prop.SetValue(listElement, valueNew);
                                    }
                                }
                            }
                        }
                        break;
                    }

                default:
                    throw new NotImplementedException("Data preparation for " + Database.Postgre.ToName() + " is not implemented!");

            }
            Console.WriteLine($"Make database specific preparations... - DONE");
        }

        public void Save()
        {
            Console.WriteLine($"Saving chunkId={_chunkId} ...");
            Console.WriteLine("DestinationConnectionString=" + FrameworkSettings.Settings.Current.Building.DestinationConnectionString);
            if (FrameworkSettings.Settings.Current.Building.Vendor.Name != "PregnancyAlgorithm"
                && FrameworkSettings.Settings.Current.Building.Vendor.Name != "Era"
                && _databaseChunkPart.ChunkData.Persons.Count == 0)
            {
                _databaseChunkPart.ChunkData.Clean();
                return;
            }
            ISaver saver = FrameworkSettings.Settings.Current.Building.DestinationEngine.GetSaver();
            Stopwatch stopwatch = new Stopwatch();

            try
            {
                stopwatch.Start();
                using (saver)
                {
                    #region debug 
                    // Clear is added since these lists cause sql error in postgres - 22021: invalid byte sequence for encoding "UTF8": 0x00
                    // Persons = Npgsql.PostgresException: '42601: syntax error at or near ","
                    var listProperties = _databaseChunkPart.ChunkData.GetType()
                        .GetProperties(BindingFlags.Public | BindingFlags.Instance)
                        .Where(p => p.PropertyType.IsGenericType &&
                                    p.PropertyType.GetGenericTypeDefinition() == typeof(List<>));

                    foreach (var prop in listProperties)
                    {
                        if (true) continue;

                        //whitelist
                        if (new[] { "Persons" }
                                .Any(s => s.Equals(prop.Name, StringComparison.CurrentCultureIgnoreCase)))
                            continue;

                        var list = prop.GetValue(_databaseChunkPart.ChunkData) as System.Collections.IList;
                        list?.Clear();
                    }
                    //observation
                    #endregion
                    var createdSaver = saver.Create(FrameworkSettings.Settings.Current.Building.DestinationConnectionString);
                    createdSaver.Save(_databaseChunkPart.ChunkData, _offsetManager);
                }
                stopwatch.Stop();
                Console.WriteLine($"Saving chunkId={_chunkId} - complete");
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
    }
}
