using System;
using System.Collections.Generic;
using System.Data.Odbc;
using System.Net;
using System.Net.Http;
using System.Threading;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Newtonsoft.Json.Linq;
using org.ohdsi.cdm.framework.desktop.Helpers;
using org.ohdsi.cdm.presentation.builderwebapi.Database;
using org.ohdsi.cdm.presentation.builderwebapi.Enums;
using org.ohdsi.cdm.presentation.builderwebapi.ETL;
using org.ohdsi.cdm.presentation.builderwebapi.Extensions;
using org.ohdsi.cdm.presentation.builderwebapi.Log;

namespace org.ohdsi.cdm.presentation.builderwebapi.Controllers
{
    [ApiController]
    [Route("cdm-builder/api")]
    public class CdmBuilderController : ControllerBase
    {
        private readonly IBackgroundTaskQueue _queue;
        private IConfiguration _configuration;

        public CdmBuilderController(IConfiguration configuration, IBackgroundTaskQueue queue)
        {
            _queue = queue;
            _configuration = configuration;
        }

        [HttpGet]
        public string Get()
        {
            return "Running...";
        }

        [HttpGet]
        [Route("log")]
        public ConversionLogMessage GetLog(int conversionId, int? logId)
        {
            var message = new ConversionLogMessage() { id = conversionId, logs = new List<Log.Message>(), statusName = "IN_PROGRESS", statusCode = 1 };
            var connectionString = _configuration.GetConnectionString("DefaultConnection");
            foreach (var l in DBBuilder.GetLog(connectionString, conversionId, logId))
            {
                if(l.percent == 100)
                {
                    message.statusName = "COMPLETED";
                    message.statusCode = 2;
                }

                if (l.statusName == "Error")
                {
                    message.statusName = "FAILED";
                    message.statusCode = 4;
                }

                message.logs.Add(l);
            }

            if (DBBuilder.IsConversionAborted(connectionString, conversionId))
            {
                message.statusName = "ABORTED";
                message.statusCode = 3;
            }

            return message;
        }

        [HttpGet]
        [Route("abort")]
        public string Abort(int conversionId)
        {
            var username = this.HttpContext.Request.Headers["username"].ToString();
            var connectionString = _configuration.GetConnectionString("DefaultConnection");

            DBBuilder.AbortConversion(connectionString, conversionId);
            Logger.Write(connectionString, new LogMessage { User = username, ConversionId = conversionId, Type = LogType.Info, Text = "Conversion aborted." });

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
        public async Task<ConversionLogMessage> AddMappings([FromForm] Mappings mappings)
        {
            int? conversionId = null;
            var connectionString = _configuration.GetConnectionString("DefaultConnection");
            var username = this.HttpContext.Request.Headers["username"].ToString();
            var actionUrl = _configuration.GetSection("AppSettings").GetSection("FilesManagerUrl").Value;
            var key = _configuration.GetSection("AppSettings").GetSection("Key").Value;

            Logger.Write(connectionString, new LogMessage { User = username, Type = LogType.Debug, Text = $"AddMappings {username} | {actionUrl}" });
            try
            {
                conversionId = DBBuilder.AddConversion(connectionString, username, mappings.Name);

                Logger.Write(connectionString, new LogMessage { User = username, Type = LogType.Debug, Text = $"AddMappings conversionId {conversionId.Value}" });

                using (var client = new HttpClient())
                using (var formData = new MultipartFormDataContent())
                {
                    formData.Add(new StringContent(username), "username");
                    formData.Add(new StringContent(mappings.Name), "dataKey");

                    var file = mappings.File.OpenReadStream().GetByteArray();
                    formData.Add(new ByteArrayContent(file), "file", "file.zip");

                    Logger.Write(connectionString, new LogMessage { User = username, Type = LogType.Debug, Text = $"AddMappings stream opened" });

                    var response = await client.PostAsync(actionUrl, formData);
                    var content = response.Content.ReadAsStringAsync();
                    content.Wait();

                    Logger.Write(connectionString, new LogMessage { User = username, Type = LogType.Debug, Text = $"AddMappings data saved" });

                    dynamic data = JToken.Parse(content.Result);
                    string contentKey = data.id;

                    Logger.Write(connectionString, new LogMessage { User = username, Type = LogType.Debug, Text = $"AddMappings contentKey {contentKey}" });
                    
                    DBBuilder.StoreParameters(connectionString, key, conversionId.Value, new List<Tuple<string, string>>() { new Tuple<string, string>("ContentKey", contentKey) });

                    Logger.Write(connectionString, new LogMessage { User = username, Type = LogType.Debug, Text = $"AddMappings parameters stored" });

                    if (!response.IsSuccessStatusCode)
                    {
                        return new ConversionLogMessage() { id = conversionId.Value, statusName = "FAILED", statusCode = 4 };
                    }
                }
            }
            catch (Exception e)
            {
                Logger.Write(connectionString, new LogMessage { User = username, ConversionId = conversionId, Type = LogType.Error, Text = e.Message });
                return new ConversionLogMessage() { id = conversionId.Value, statusName = "FAILED", statusCode = 4, logs = new List<Message> { new Message { message = e.Message } } };
            }
                        
            return new ConversionLogMessage() { id = conversionId.Value, statusName = "IN_PROGRESS", statusCode = 1 };
        }

        [HttpPost]
        public async Task<HttpResponseMessage> Post(CancellationToken cancellationToken, [FromBody] ConversionSettings settings)
        {
            var username = this.HttpContext.Request.Headers["username"].ToString();
            var connectionString = _configuration.GetConnectionString("DefaultConnection");
            int conversionId = int.Parse(settings.ConversionId.ToString());

            try
            {
                if (settings.SourceEngine == null)
                {
                    settings.SourceEngine = _configuration.GetSection("AppSettings").GetSection("SourceEngine").Value;
                    settings.SourceServer = _configuration.GetSection("AppSettings").GetSection("SourceServer").Value;
                    settings.SourcePort = _configuration.GetSection("AppSettings").GetSection("SourcePort").Value;
                    settings.SourceDatabase = _configuration.GetSection("AppSettings").GetSection("SourceDatabase").Value;
                    settings.SourceUser = _configuration.GetSection("AppSettings").GetSection("SourceUser").Value;
                    settings.SourcePassword = _configuration.GetSection("AppSettings").GetSection("SourcePassword").Value;

                    settings.SourceSchema = username;
                }
                else if (settings.SourceEngine.ToLower() == "mysql")
                {
                    settings.SourceEngine = "MySql";
                    settings.SourceSchema = null;
                }

                if (settings.DestinationEngine.ToLower() == "mysql")
                {
                    settings.DestinationEngine = "MySql";
                    settings.DestinationSchema = null;
                }

                if (settings.VocabularyEngine == null)
                {
                    settings.VocabularyEngine = _configuration.GetSection("AppSettings").GetSection("VocabularyEngine").Value;
                    settings.VocabularyServer = _configuration.GetSection("AppSettings").GetSection("VocabularyServer").Value;
                    settings.VocabularyPort = _configuration.GetSection("AppSettings").GetSection("VocabularyPort").Value;
                    settings.VocabularyDatabase = _configuration.GetSection("AppSettings").GetSection("VocabularyDatabase").Value;
                    settings.VocabularySchema = _configuration.GetSection("AppSettings").GetSection("VocabularySchema").Value;
                    settings.VocabularyUser = _configuration.GetSection("AppSettings").GetSection("VocabularyUser").Value;
                    settings.VocabularyPassword = _configuration.GetSection("AppSettings").GetSection("VocabularyPassword").Value;
                }

                var key = _configuration.GetSection("AppSettings").GetSection("Key").Value;
                var properties = ConversionSettings.GetProperties(settings);

                _queue.QueueBackgroundWorkItem(async token =>
                {
                    await Task.Run(() =>
                    {
                        try
                        {
                            DBBuilder.AddConversion(connectionString, username, settings.MappingsName);
                            Logger.Write(connectionString, new LogMessage { User = username, ConversionId = conversionId, Type = LogType.Info, Text = "Conversion started" });
                            DBBuilder.StoreParameters(connectionString, key, conversionId, properties);
                        }
                        catch (Exception e)
                        {
                            Logger.Write(connectionString, new LogMessage { User = username, ConversionId = conversionId, Type = LogType.Error, Text = e.Message });
                        }
                    });
                });
            }
            catch(Exception ex)
            {
                Logger.Write(connectionString, new LogMessage { User = username, ConversionId = conversionId, Type = LogType.Error, Text = ex.Message });
            }
  
            return await Task.FromResult(new HttpResponseMessage() { StatusCode = HttpStatusCode.OK });
        }
    }   
}