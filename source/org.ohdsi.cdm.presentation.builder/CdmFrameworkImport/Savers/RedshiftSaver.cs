using Amazon.S3;
using Amazon.S3.Model;
using org.ohdsi.cdm.framework.common.Builder;
using org.ohdsi.cdm.framework.common.DataReaders.v5;
using org.ohdsi.cdm.framework.common.DataReaders.v5.v54;
using org.ohdsi.cdm.framework.common.Enums;
using org.ohdsi.cdm.framework.common.Extensions;
using org.ohdsi.cdm.framework.common.Omop;
using org.ohdsi.cdm.framework.desktop;
using org.ohdsi.cdm.framework.desktop.DataReaders;
using org.ohdsi.cdm.framework.desktop.Enums;
using org.ohdsi.cdm.framework.desktop.Helpers;
using System.Data;
using System.Data.Odbc;
using FrameworkSettings = org.ohdsi.cdm.framework.desktop.Settings;

namespace org.ohdsi.cdm.presentation.builder.Utility.CdmFrameworkImport.Savers
{
    public class RedshiftSaver : Saver
    {
        private AmazonS3Client _currentClient;
        private string _connectionString;

        public override ISaver Create(string connectionString)
        {
            var config = new AmazonS3Config
            {
                Timeout = TimeSpan.FromMinutes(60),
                RegionEndpoint = Amazon.RegionEndpoint.USEast1,
                MaxErrorRetry = 20,
            };

            _currentClient = new AmazonS3Client(FrameworkSettings.Settings.Current.S3AwsAccessKeyId,
                FrameworkSettings.Settings.Current.S3AwsSecretAccessKey,
                config);

            _connectionString = connectionString;

            return this;
        }

        public override void Write(ChunkData chunk, string table)
        {
            var attempt = 0;
            var copied = false;
            while (!copied)
            {
                try
                {
                    attempt++;
                    foreach (var reader in CreateDataReader(chunk, table))
                    {
                        Write(chunk.ChunkId, chunk.SubChunkId, reader, table);
                    }
                    copied = true;
                }
                catch (Exception e)
                {
                    if (attempt <= 5)
                    {
                        //Logger.Write(chunk.ChunkId, LogMessageTypes.Warning,
                        //    "MoveToS3 attempt=" + attempt + ") | " + table + " | " + Logger.CreateExceptionString(e));

                        Console.WriteLine("MoveToS3 attempt=" + attempt + ") | " + table + " | " + Logger.CreateExceptionString(e));
                    }
                    else
                    {
                        throw;
                    }
                }
            }
        }

        public override void Write(int? chunkId, int? subChunkId, IDataReader reader, string tableName)
        {
            throw new NotImplementedException();
        }

        private static void CopyToRedshift(string bucket, string schemaName, string tableName, string fileName,
            OdbcConnection connection, OdbcTransaction transaction)
        {
            const string query = @"copy {0}.{1} from 's3://{2}/{3}' " +
                                 @"credentials 'aws_access_key_id={4};aws_secret_access_key={5}' " +
                                 @"IGNOREBLANKLINES " +
                                 @"DELIMITER '\t' " +
                                 @"NULL AS '\000' " +
                                 @"csv quote as '`' " +
                                 @"GZIP";

            using var c =
                    new OdbcCommand(
                        string.Format(query, schemaName, tableName, bucket, fileName,
                            FrameworkSettings.Settings.Current.S3AwsAccessKeyId,
                            FrameworkSettings.Settings.Current.S3AwsSecretAccessKey), connection, transaction);
            c.CommandTimeout = 900;
            c.ExecuteNonQuery();
        }

        public void SaveToS3Csv(string bucket, string folder, string tableName, IDataReader reader)
        {
            Console.WriteLine($"{tableName} - Save to S3 started (csv)");

            tableName = tableName.ToUpper();

            var table = tableName;
            var file = tableName;

            if (tableName.Split('.').Length > 0)
            {
                table = tableName.Split('.')[0];
            }

            using var stream = reader.GetStreamCsv();
            var fileName = $"{folder}/{table}/{file}.txt.gz";

            Console.WriteLine("BucketName=" + bucket);
            Console.WriteLine("Key=" + fileName);

            var request = new PutObjectRequest
            {
                BucketName = bucket,
                Key = fileName,
                ServerSideEncryptionMethod = ServerSideEncryptionMethod.AES256,
                StorageClass = S3StorageClass.Standard,
                InputStream = stream
            };

            using var putObject = _currentClient.PutObjectAsync(request);
            putObject.Wait();
        }

        public override void AddChunk(List<ChunkRecord> chunk, int index, string schemaName)
        {
            try
            {

                var tableName = "_chunks" + index;
                var fileName = $"{FrameworkSettings.Settings.Current.Building.Vendor}/{FrameworkSettings.Settings.Current.Building.Id}/{tableName}.txt.gz";
                AmazonS3Helper.CopyFile(_currentClient, FrameworkSettings.Settings.Current.Bucket, fileName, new ChunkDataReader(chunk), "\t", '`', "\0");

                using var currentConnection = SqlConnectionHelper.OpenOdbcConnection(_connectionString);
                using var currentTransaction = currentConnection.BeginTransaction();
                CopyToRedshift(FrameworkSettings.Settings.Current.Bucket, schemaName, "_chunks",
                    fileName,
                    currentConnection,
                    currentTransaction);

                currentTransaction.Commit();
            }
            catch (Exception e)
            {
                Console.WriteLine(Logger.CreateExceptionString(e));
                //Logger.WriteError(e);
                Rollback();
            }
        }

        public void SaveEntityLookup(List<Location> location, int index, string spectrumFolder, string apsFolder, CdmVersions cdm)
        {
            if (location != null && location.Count > 0)
            {
                var tableName = "LOCATION." + index;

                var folder =
                    $"{FrameworkSettings.Settings.Current.Building.Vendor}/" +
                    $"{FrameworkSettings.Settings.Current.Building.Id}/";

                if (cdm == CdmVersions.V54)
                {
                    SaveToS3Csv(FrameworkSettings.Settings.Current.Bucket, folder + apsFolder, tableName, new LocationDataReader54(location));
                }
                else
                {
                    SaveToS3Csv(FrameworkSettings.Settings.Current.Bucket, folder + apsFolder, tableName, new LocationDataReader(location));
                }
            }
        }

        public void SaveEntityLookup(List<CareSite> careSite, int index, string spectrumFolder, string apsFolder)
        {
            if (careSite != null && careSite.Count > 0)
            {
                var tableName = "CARE_SITE." + index;
                var folder =
                    $"{FrameworkSettings.Settings.Current.Building.Vendor}/" +
                    $"{FrameworkSettings.Settings.Current.Building.Id}/";

                SaveToS3Csv(FrameworkSettings.Settings.Current.Bucket, folder + apsFolder, tableName, new CareSiteDataReader(careSite));
            }
        }

        public void SaveEntityLookup(List<Provider> provider, int index, string spectrumFolder, string apsFolder)
        {
            if (provider != null && provider.Count > 0)
            {
                var tableName = "PROVIDER." + index;

                var folder =
                    $"{FrameworkSettings.Settings.Current.Building.Vendor}/" +
                    $"{FrameworkSettings.Settings.Current.Building.Id}/";

                SaveToS3Csv(FrameworkSettings.Settings.Current.Bucket, folder + apsFolder, tableName, new ProviderDataReader(provider));
            }
        }

        public override void Dispose()
        {
            _currentClient.Dispose();
            GC.SuppressFinalize(this);
        }
    }
}