using System;
using System.Data.Odbc;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.SignalR;
using Microsoft.Extensions.Configuration;
using org.ohdsi.cdm.framework.desktop.Helpers;
using org.ohdsi.cdm.presentation.builderwebapi.Hubs;

namespace org.ohdsi.cdm.presentation.builderwebapi.Controllers
{
    [ApiController]
    [Route("cdm-builder/api")]
    public class CdmBuilderController : ControllerBase
    {
        private readonly IHubContext<LogHub> _logHub;
        private readonly IBackgroundTaskQueue _queue;
        private IConfiguration _configuration;

        public CdmBuilderController(IConfiguration configuration, IHubContext<LogHub> hub, IBackgroundTaskQueue queue)
        {
            _logHub = hub;
            _queue = queue;
            _configuration = configuration;
        }

        [HttpGet]
        public string Get()
        {
            return _queue.State;
        }


        [HttpGet("abort")]
        public string Abort()
        {
            _queue.Aborted = true;
            _queue.State = "Aborted";
            WriteLog(Status.Canceled, "Aborted", 100);
            return "Aborted";
        }
                
        [HttpPost("checksourceconnection")]
        [HttpPost("/api/checksourceconnection")]
        [HttpPost("~/api/checksourceconnection")]
        public IActionResult CheckSourceConnection([FromBody] ConversionSettings settings)
        {
            try
            {
                //AllowCrossOrigin();
                ChekConnectionString(settings.SourceEngine,
                                     settings.SourceServer,
                                     settings.SourceDatabase,
                                     settings.SourceUser,
                                     settings.SourcePassword,
                                     settings.SourcePort.ToString());
            }
            catch (Exception e)
            {
                return StatusCode((int)HttpStatusCode.BadRequest, e.Message + e.InnerException);
            }

            return Ok();
        }

        [HttpPost("checkdestinationconnection")]
        public IActionResult CheckDestinationConnection([FromBody] ConversionSettings settings)
        {
            try
            {
                ChekConnectionString(settings.DestinationEngine,
                                     settings.DestinationServer,
                                     settings.DestinationDatabase,
                                     settings.DestinationUser,
                                     settings.DestinationPassword,
                                     settings.DestinationPort.ToString());
            }
            catch (Exception e)
            {
                return StatusCode((int)HttpStatusCode.BadRequest, e.Message + e.InnerException);
            }

            return Ok();
        }

        [HttpPost("checkvocabularyconnection")]
        public IActionResult CheckVocabularyConnection([FromBody] ConversionSettings settings)
        {
            try
            {
                ChekConnectionString(settings.VocabularyEngine,
                                     settings.VocabularyServer,
                                     settings.VocabularyDatabase,
                                     settings.VocabularyUser,
                                     settings.VocabularyPassword,
                                     settings.VocabularyPort.ToString());
            }
            catch (Exception e)
            {
                return StatusCode((int)HttpStatusCode.BadRequest, e.Message);
            }

            return Ok();
        }

        private void ChekConnectionString(string dbType, string server, string db, string user, string pswd, string port)
        {
            var connection = _configuration[dbType].Replace("{server}", server)
                                                   .Replace("{database}", db)
                                                   .Replace("{username}", user)
                                                   .Replace("{password}", pswd)
                                                   .Replace("{port}", port);
            
            var databaseType = framework.desktop.Enums.Database.Postgre;

            if (dbType.ToLower() == "mssql")
                databaseType = framework.desktop.Enums.Database.MsSql;
            else if (dbType.ToLower() == "mysql")
                databaseType = framework.desktop.Enums.Database.MySql;

            using var c = SqlConnectionHelper.OpenConnection(connection, databaseType);
        }

        [HttpPost("vocabularyversion")]
        public string GetVocabularyVersion([FromBody] ConversionSettings settings)
        {
            const string query = "SELECT VOCABULARY_VERSION FROM vocabulary WHERE VOCABULARY_ID = 'None'";

            try
            {
                var cs = _configuration[settings.VocabularyEngine]
                    .Replace("{server}", settings.VocabularyServer)
                    .Replace("{database}", settings.VocabularyDatabase)
                    .Replace("{username}", settings.VocabularyUser)
                    .Replace("{password}", settings.VocabularyPassword);

                using var c = new OdbcConnection(cs);
                using var cmd = new OdbcCommand(query, c);
                using var reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    return reader.GetString(0);
                }
            }
            catch (Exception)
            {
                return "Unknown";
            }

            return "Unknown";
        }

        [HttpPost("addmappings")]
        public async Task<IActionResult> AddMappings([FromForm] Mappings mappings)
        {
            var dir = Path.Combine(AppContext.BaseDirectory, "mappings");
            if (!Directory.Exists(dir))
                Directory.CreateDirectory(dir);

            var filePath = Path.Combine(dir, mappings.Name + ".zip");

            using (var stream = System.IO.File.Create(filePath))
            {
                await mappings.File.CopyToAsync(stream);
            }

            return Ok();
        }


        [HttpPost]
        public async Task<HttpResponseMessage> Post(CancellationToken cancellationToken, [FromBody] ConversionSettings settings)
        {
            HttpResponseMessage returnMessage = new HttpResponseMessage();

            _queue.QueueBackgroundWorkItem(async token =>
            {
                await Task.Run(() =>
                {
                    WriteLog(Status.Started, string.Empty, 0);
                    _queue.State = "Running";

                    var conversion = new ConversionController(_queue, settings, _configuration, _logHub);
                    conversion.Start();

                    _queue.State = "Idle";
                    WriteLog(Status.Finished, string.Empty, 100);
                });
            });

            //WriteLog("conversion done");
            return await Task.FromResult(returnMessage);
        }

        private void WriteLog(Status status, string message, Double progress)
        {
            _logHub.Clients.All.SendAsync("Log", new LogMessage { Status = status, Text = message, Progress = progress }).Wait();
        }
    }   
}
