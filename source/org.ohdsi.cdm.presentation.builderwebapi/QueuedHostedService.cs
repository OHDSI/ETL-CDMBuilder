using Microsoft.AspNetCore.SignalR;
using Microsoft.Extensions.Hosting;
using org.ohdsi.cdm.presentation.builderwebapi.Hubs;
using System;
using System.Threading;
using System.Threading.Tasks;

namespace org.ohdsi.cdm.presentation.builderwebapi
{
    public class QueuedHostedService : BackgroundService
    {
        private readonly IHubContext<LogHub> _logHub;

        public QueuedHostedService(IBackgroundTaskQueue taskQueue,
            IHubContext<LogHub> hub)
        {
            TaskQueue = taskQueue;
            _logHub = hub;
        }

        public IBackgroundTaskQueue TaskQueue { get; }

        protected override async Task ExecuteAsync(CancellationToken stoppingToken)
        {
            WriteLog(Status.None, "Queued Hosted Service is starting.");
            await BackgroundProcessing(stoppingToken);
        }

        private async Task BackgroundProcessing(CancellationToken stoppingToken)
        {
            while (!stoppingToken.IsCancellationRequested)
            {
                var workItem =
                    await TaskQueue.DequeueAsync(stoppingToken);

                try
                {
                    await workItem(stoppingToken);
                }
                catch (Exception ex)
                {
                    WriteLog(Status.Error, "Error occurred executing. " + ex.Message);
                }
            }
        }

        public override async Task StopAsync(CancellationToken stoppingToken)
        {
            WriteLog(Status.None, "Queued Hosted Service is stopping.");

            await base.StopAsync(stoppingToken);
        }

        private void WriteLog(Status status, string message)
        {
            _logHub.Clients.All.SendAsync("Log", new LogMessage { Status = status, Text = message }).Wait();
        }
    }
}
