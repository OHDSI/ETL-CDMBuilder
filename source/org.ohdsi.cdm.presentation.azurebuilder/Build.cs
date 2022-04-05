using System;
using System.IO;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Azure.WebJobs;
using Microsoft.Azure.WebJobs.Extensions.Http;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;
using org.ohdsi.cdm.presentation.builderwebapi.ETL;
using org.ohdsi.cdm.presentation.builderwebapi.Database;
using org.ohdsi.cdm.presentation.builderwebapi.Log;
using org.ohdsi.cdm.presentation.builderwebapi.Enums;
using System.Collections.Generic;

namespace org.ohdsi.cdm.presentation.azurebuilder
{
    public static class Build
    {
        [FunctionName("Build")]
        public static async Task<IActionResult> Run(
            [HttpTrigger(AuthorizationLevel.Function, "get", "post", Route = null)] HttpRequest req,
            ILogger log)
        {
            log.LogInformation($"started");

            int conversionId = int.Parse(req.Query["conversionId"]);
            int chunkId = int.Parse(req.Query["chunkId"]);

            try
            {
                log.LogInformation($"conversionId {conversionId}; chunkId {chunkId}");

                string requestBody = String.Empty;
                using (StreamReader streamReader = new StreamReader(req.Body))
                {
                    requestBody = await streamReader.ReadToEndAsync();
                }
                dynamic data = JsonConvert.DeserializeObject(requestBody);

                string connectionString = data.connectionString;
                string secureKey = data.secureKey;
                string fileManagerUrl = data.fileManagerUrl;

                string sourceTemplate = data.sourceTemplate;
                string destinationTemplate = data.destinationTemplate;
                string vocabularyTemplate = data.vocabularyTemplate;

                log.LogInformation($"conversionId {conversionId}; chunkId {chunkId} | Loading Vocabulary...");
                Logger.Write(connectionString, new LogMessage { ConversionId = conversionId, Type = LogType.Info, Text = "Loading Vocabulary..." });

                ConversionSettings cs = ConversionSettings.SetProperties(DBBuilder.GetParameters(connectionString, secureKey, conversionId));

                Dictionary<string, string> connectionStringTemplates = new Dictionary<string, string>();
                connectionStringTemplates.TryAdd(cs.SourceEngine, sourceTemplate);
                connectionStringTemplates.TryAdd(cs.DestinationEngine, destinationTemplate);
                connectionStringTemplates.TryAdd(cs.VocabularyEngine, vocabularyTemplate);

                var settings = new Settings(cs, fileManagerUrl, connectionStringTemplates);
                settings.Load();

                var vocabulary = new Vocabulary(settings, connectionString, conversionId);
                vocabulary.LoadVocabularyFromFileManager(fileManagerUrl, secureKey);
                Logger.Write(connectionString, new LogMessage { ConversionId = conversionId, Type = LogType.Info, Text = "Vocabulary DONE." });
                log.LogInformation($"conversionId {conversionId}; chunkId {chunkId} | Vocabulary DONE.");

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

                DBBuilder.CompleteChunk(connectionString, conversionId, chunkId);
                Logger.Write(connectionString, new LogMessage { ConversionId = conversionId, ChunkId = chunkId, Type = LogType.Info, Text = chunkId + " - Chunk coverted" });
                log.LogInformation($"conversionId {conversionId}; chunkId {chunkId} |  - Chunk coverted.");

                return new OkObjectResult(conversionId + ";" + chunkId);
            }
            catch (Exception ex)
            {
                log.LogInformation($"conversionId {conversionId}; chunkId {chunkId} |  {ex.Message}");
                return new BadRequestObjectResult(ex);
            }
        }
    }
}
