using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Hosting;
using org.ohdsi.cdm.presentation.builderwebapi.Controllers;
using org.ohdsi.cdm.presentation.builderwebapi.Database;
using org.ohdsi.cdm.presentation.builderwebapi.Enums;
using org.ohdsi.cdm.presentation.builderwebapi.Log;
using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;

namespace org.ohdsi.cdm.presentation.builderwebapi
{
    public class ETLService : BackgroundService
    {

        private IConfiguration _configuration;
        private string _connectionString;
        const int MAX_PARALLEL = 5;

        public ETLService(IConfiguration configuration)
        {
            _configuration = configuration;
            _connectionString = _configuration.GetConnectionString("DefaultConnection");
        }

        protected override async Task ExecuteAsync(CancellationToken stoppingToken)
        {
            await BackgroundProcessing(stoppingToken);
        }

        private async Task BackgroundProcessing(CancellationToken stoppingToken)
        {
            var conversionsQueue = new BlockingCollection<int>();
            Task сonversion = null;
            Task checker = null;
            var tasks = new List<Task>();

            try
            {
                сonversion = Task.Run(() =>
                {
                    while (!stoppingToken.IsCancellationRequested || !conversionsQueue.IsCompleted)
                    {
                        int? сonversionId = null;
                        try
                        {
                            сonversionId = conversionsQueue.Take();
                        }
                        catch (InvalidOperationException)
                        {

                        }

                        if (сonversionId.HasValue)
                        {
                            var cId = сonversionId.Value;
                            tasks.Add(Task.Run(() =>
                            {
                                try
                                {
                                    var conversionController = new ConversionController(cId);
                                    conversionController.Init(_configuration);
                                    conversionController.Start();
                                }
                                catch (Exception ex)
                                {
                                    Logger.Write(_connectionString, new LogMessage { ConversionId = cId, Type = LogType.Error, Text = ex.Message });
                                }
                            }));
                        }
                    }
                });

                checker = Task.Run(() =>
                {
                    while (!stoppingToken.IsCancellationRequested)
                    {
                        try
                        {
                            var id = DBBuilder.StartConversion(_connectionString);
                            if (id.HasValue)
                            {
                                conversionsQueue.Add(id.Value);
                                while (conversionsQueue.Count > MAX_PARALLEL)
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
                //conversionsQueue.CompleteAdding();
                await сonversion;
                await checker;

                Task.WaitAll(tasks.ToArray());
            }
        }

        public override async Task StopAsync(CancellationToken stoppingToken)
        {
            await base.StopAsync(stoppingToken);
        }
    }
}