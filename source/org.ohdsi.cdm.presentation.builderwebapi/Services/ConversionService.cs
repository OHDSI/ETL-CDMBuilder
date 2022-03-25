using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Hosting;
using org.ohdsi.cdm.presentation.builderwebapi.Database;
using org.ohdsi.cdm.presentation.builderwebapi.Enums;
using org.ohdsi.cdm.presentation.builderwebapi.ETL;
using org.ohdsi.cdm.presentation.builderwebapi.Log;
using System;
using System.Collections.Concurrent;
using System.Threading;
using System.Threading.Tasks;

namespace org.ohdsi.cdm.presentation.builderwebapi
{
    public class ConversionService : BackgroundService
    {
        const int MAX_PARALLEL = 5;

        private IConfiguration _configuration;
        private string _connectionString;

        private ConcurrentDictionary<int, Lazy<Settings>> _settings;


        public ConversionService(IConfiguration configuration)
        {
            _configuration = configuration;
            _connectionString = _configuration.GetConnectionString("DefaultConnection");
            _settings = new ConcurrentDictionary<int, Lazy<Settings>>();
        }

        protected override async Task ExecuteAsync(CancellationToken stoppingToken)
        {
            await BackgroundProcessing(stoppingToken);
        }

        private Settings GetSettings(int conversionId)
        {
            var key = _configuration.GetSection("AppSettings").GetSection("Key").Value;
            var settings = _settings.GetOrAdd(conversionId,
                x => new Lazy<Settings>(
                    () =>
                    {
                        Logger.Write(_connectionString, new LogMessage { ConversionId = conversionId, Type = LogType.Info, Text = "Loading Vocabulary..." });
                        ConversionSettings cs = ConversionSettings.SetProperties(DBBuilder.GetParameters(_connectionString, key, conversionId));
                        var settings = new Settings(cs, _configuration);
                        settings.Load();

                        var vocabulary = new Vocabulary(settings, _connectionString, conversionId);
                        vocabulary.Fill(false, false);
                        Logger.Write(_connectionString, new LogMessage { ConversionId = conversionId, Type = LogType.Info, Text = "Vocabulary DONE." });

                        return settings;
                    }));

            return settings.Value;
        }

        private async Task BackgroundProcessing(CancellationToken stoppingToken)
        {
            var chunksQueue = new BlockingCollection<Tuple<int, int>>();
            Task convertChunk = null;
            Task checker = null;

            try
            {
                convertChunk = Task.Run(() =>
                {
                    while (!stoppingToken.IsCancellationRequested || !chunksQueue.IsCompleted)
                    {
                        Tuple<int, int> chunk = null;
                        try
                        {
                            chunk = chunksQueue.Take();
                        }
                        catch (InvalidOperationException)
                        {

                        }

                        if (chunk != null)
                        {
                            var conversionId = chunk.Item1;
                            var chunkId = chunk.Item2;

                            try
                            {
                                if (DBBuilder.IsConversionAborted(_connectionString, conversionId))
                                {
                                    DBBuilder.CancelChunk(_connectionString, conversionId, chunkId);
                                    return;
                                }

                                var settings = GetSettings(conversionId);

                                var chunkBuilder = new DatabaseChunkBuilder(chunkId);
                                var chunkData = chunkBuilder.Process(settings.SourceEngine,
                                    settings.ConversionSettings.SourceSchema,
                                    settings.SourceQueryDefinitions,
                                    settings.SourceConnectionString,
                                    settings.ConversionSettings.BuildSettings);
                                chunkData.Save(settings.Cdm,
                                    settings.DestinationConnectionString,
                                    settings.DestinationEngine,
                                    settings.ConversionSettings.SourceSchema,
                                    settings.ConversionSettings.DestinationSchema);

                                DBBuilder.CompleteChunk(_connectionString, conversionId, chunkId);
                                Logger.Write(_connectionString, new LogMessage { ConversionId = conversionId, ChunkId = chunkId, Type = LogType.Info, Text = chunkId + " - Chunk coverted" });

                                if (DBBuilder.AreAllChunksConverted(_connectionString, conversionId))
                                {
                                    DBBuilder.CompleteStep(_connectionString, conversionId, Steps.ConvertChunks);
                                    DBBuilder.CompleteConversion(_connectionString, conversionId);
                                    Logger.Write(_connectionString, new LogMessage { ConversionId = conversionId, ChunkId = chunkId, Type = LogType.Info, Text = "Conversion to CDM - DONE" });
                                }
                            }
                            catch (Exception ex)
                            {
                                DBBuilder.FailChunk(_connectionString, conversionId, chunkId);
                                Logger.Write(_connectionString, new LogMessage { ConversionId = conversionId, ChunkId = chunkId, Type = LogType.Error, Text = ex.Message });
                            }
                        }
                    }
                });

                checker = Task.Run(() =>
                {
                    while (!stoppingToken.IsCancellationRequested)
                    {
                        try
                        {
                            var chunk = DBBuilder.StartChunk(_connectionString);
                            if (chunk.Item1.HasValue && chunk.Item2.HasValue)
                            {
                                chunksQueue.Add(new Tuple<int, int>(chunk.Item1.Value, chunk.Item2.Value));
                                while (chunksQueue.Count > MAX_PARALLEL)
                                {
                                    Thread.Sleep(5 * 1000);
                                }
                            }
                        }
                        catch (Exception ex)
                        {
                            Logger.Write(_connectionString, new LogMessage { Type = LogType.Error, Text = ex.Message });
                        }
                        finally
                        {
                            Thread.Sleep(10 * 1000);
                        }
                    }
                });
            }
            catch (Exception ex)
            {
                Logger.Write(_connectionString, new LogMessage { Type = LogType.Error, Text = ex.Message });
            }
            finally
            {
                await convertChunk;
                await checker;
            }
        }

        public override async Task StopAsync(CancellationToken stoppingToken)
        {
            await base.StopAsync(stoppingToken);
        }
    }
}