using Castle.DynamicProxy;
using CommandLine;
using CommandLine.Text;
using org.ohdsi.cdm.framework.common.Enums;
using org.ohdsi.cdm.framework.common.Extensions;
using org.ohdsi.cdm.framework.common.Utility;
using org.ohdsi.cdm.framework.desktop.Databases;
using org.ohdsi.cdm.presentation.builder;
using org.ohdsi.cdm.presentation.builder.Controllers;
using org.ohdsi.cdm.presentation.Builder.AnsiConsoleHelpers;
using org.ohdsi.cdm.RunLocal;
using System.Configuration;
using System.Data;
using System.Diagnostics;
using System.Reflection;
using System.Reflection.Metadata;
using FrameworkSettings = org.ohdsi.cdm.framework.desktop.Settings;

namespace RunLocal
{
    class Program
    {
        internal class Options
        {

            [Option("VendorName", Required = true, HelpText = "Name of the vendor")]
            public string VendorName { get; set; }

            [Option("EtlLibraryPath", Required = false, HelpText = "Path to the library with Vendor definition")]
            public string EtlLibraryPath { get; set; } = "";

            [Option("ContinueLoadFromChunk", Required = false, HelpText = "If >0, then chunk generation and previous chunks processing are skipped")]
            public string ContinueLoadFromChunk { get; set; } = "";

            [Option("ChunkSize", Required = false, HelpText = "Amount of Persons to process in one chunk")]
            public string ChunkSize { get; set; } = "10000";


            #region source

            [Option("SourceEngine", Required = true, HelpText = "Source engine")]
            public string SourceEngine { get; set; }

            [Option("SourceServer", Required = true, HelpText = "Source server")]
            public string SourceServer { get; set; }

            [Option("SourceDatabase", Required = true, HelpText = "Source database")]
            public string SourceDatabase { get; set; }

            [Option("SourceSchema", Required = true, HelpText = "Source schema")]
            public string SourceSchema { get; set; }

            [Option("SourceUser", Required = true, HelpText = "Source user")]
            public string SourceUser { get; set; }

            [Option("SourcePassword", Required = true, HelpText = "Source password")]
            public string SourcePassword { get; set; }

            #endregion

            #region destination

            [Option("DestinationEngine", Required = true, HelpText = "Destination engine")]
            public string DestinationEngine { get; set; }

            [Option("DestinationServer", Required = true, HelpText = "Destination server")]
            public string DestinationServer { get; set; }

            [Option("DestinationDatabase", Required = true, HelpText = "Destination database")]
            public string DestinationDatabase { get; set; }

            [Option("DestinationSchema", Required = true, HelpText = "Destination schema")]
            public string DestinationSchema { get; set; }

            [Option("DestinationUser", Required = true, HelpText = "Destination user")]
            public string DestinationUser { get; set; }

            [Option("DestinationPassword", Required = true, HelpText = "Destination password")]
            public string DestinationPassword { get; set; }

            #endregion

            #region Vocabulary

            [Option("VocabularyEngine", Required = true, HelpText = "Vocabulary engine")]
            public string VocabularyEngine { get; set; }

            [Option("VocabularyServer", Required = true, HelpText = "Vocabulary server")]
            public string VocabularyServer { get; set; }

            [Option("VocabularyDatabase", Required = true, HelpText = "Vocabulary database")]
            public string VocabularyDatabase { get; set; }

            [Option("VocabularySchema", Required = true, HelpText = "Vocabulary schema")]
            public string VocabularySchema { get; set; }

            [Option("VocabularyUser", Required = true, HelpText = "Vocabulary user")]
            public string VocabularyUser { get; set; }

            [Option("VocabularyPassword", Required = true, HelpText = "Vocabulary password")]
            public string VocabularyPassword { get; set; }

            #endregion

            [Usage(ApplicationAlias = "RunLocal")]
            public static IEnumerable<Example> Examples
            {
                get
                {
                    var options = new Options()
                    {
                        VendorName = "VendorName",
                        EtlLibraryPath = Directory.GetCurrentDirectory(),
                        SourceEngine = "SourceEngine",
                        SourceServer = "SourceServer",
                        SourceDatabase = "SourceDatabase",
                        SourceSchema = "SourceSchema",
                        SourceUser = "SourceUser",
                        SourcePassword = "SourcePassword",
                        DestinationEngine = "DestinationEngine",
                        DestinationServer = "DestinationServer",
                        DestinationDatabase = "DestinationDatabase",
                        DestinationSchema = "DestinationSchema",
                        DestinationUser = "DestinationUser",
                        DestinationPassword = "DestinationPassword",
                        VocabularyEngine = "VocabularyEngine",
                        VocabularyServer = "VocabularyServer",
                        VocabularyDatabase = "VocabularyDatabase",
                        VocabularySchema = "VocabularySchema",
                        VocabularyUser = "VocabularyUser",
                        VocabularyPassword = "VocabularyPassword",
                        ChunkSize = "10000",
                        ContinueLoadFromChunk = ""
                    };
                    var example = new Example("Example with placeholder arguments", options);
                    string txt = "RunLocal " + string.Join(" ", options.GetType().GetProperties().Where(s => s.Name != "Examples").Select(s => "--" + s.Name + "=\"" + s.Name + "\"")); // to fill program args
                    yield return example;
                }
            }
        }

        static void Main(string[] args)
        {
            var sw = new Stopwatch();
            sw.Start();

            string[] paramsLines = new string[0];
            try
            {
                var paramsFile = Path.Combine(Directory.GetCurrentDirectory(), "params.txt");
                var text = File.ReadAllText(paramsFile);
                paramsLines = text
                    .Replace("\"", "")
                    .Split(new[] { "--"}, StringSplitOptions.RemoveEmptyEntries)
                    .Select(s => s.Trim().Replace("\\\\", "\\")) //these get doubled for some reason while in double quotes
                    .Select(s => s.Contains("=") ? "--" + s : s)
                    .Where(s => s != "--RunLocal")
                    .Prepend("RunLocal")
                    .Distinct()
                    .ToArray();
            }
            catch (Exception e)
            { 
            
            }

            string[] argsFinal = args.Length != 0 
                ? args
                : paramsLines;

            Parser.Default.ParseArguments<Options>(argsFinal)
                .WithParsed(RunWithOptions)
                .WithNotParsed(HandleParseError);

            var secondsElapsed = Math.Round((double)sw.ElapsedMilliseconds / 1000);
            var hoursElapsed = Math.Round(secondsElapsed / 60 / 60, 1);
            Console.WriteLine($"\r\nThe program has finished! - {hoursElapsed}h ({secondsElapsed}s), Max memory used={Math.Round(MemoryColumn.MaxMemoryMb)}({Math.Round(MemoryColumn.MaxMemoryGC)}) MB");
            Console.ReadLine();
        }

        static void RunWithOptions(Options opts)
        {
            SetSettings(opts);

            bool truncateTargetTables = Settings.Current.Building.ContinueLoadFromChunk > 0 ? false : true;

            Build(Settings.Current.Building.SourceSchema, Settings.Current.Building.EtlLibraryPath, truncateTargetTables);
        }

        static void HandleParseError(IEnumerable<Error> errs)
        {
            Console.WriteLine("Failed to parse command-line arguments.");
            foreach (var error in errs)
            {
                Console.WriteLine(error.ToString());
            }
        }

        static void SetSettings(Options opts)
        {
            try
            {
                var etlLibraryPath = !string.IsNullOrEmpty(opts.EtlLibraryPath) ? opts.EtlLibraryPath : Directory.GetCurrentDirectory();                

                Console.WriteLine("Options:");

                Console.WriteLine($"VendorName: {opts.VendorName}");
                Console.WriteLine($"EtlLibraryPath: {etlLibraryPath}");
                Console.WriteLine($"ContinueLoadFromChunk: {opts.ContinueLoadFromChunk}");
                Console.WriteLine($"ChunkSize: {opts.ChunkSize}");

                Console.WriteLine($"SourceEngine: {opts.SourceEngine}");
                Console.WriteLine($"SourceServer: {opts.SourceServer}");
                Console.WriteLine($"SourceDatabase: {opts.SourceDatabase}");
                Console.WriteLine($"SourceSchema: {opts.SourceSchema}");
                Console.WriteLine($"SourceUser: {opts.SourceUser}");
                Console.WriteLine($"SourcePassword: ******");

                Console.WriteLine($"DestinationEngine: {opts.DestinationEngine}");
                Console.WriteLine($"DestinationServer: {opts.DestinationServer}");
                Console.WriteLine($"DestinationDatabase: {opts.DestinationDatabase}");
                Console.WriteLine($"DestinationSchema: {opts.DestinationSchema}");
                Console.WriteLine($"DestinationUser: {opts.DestinationUser}");
                Console.WriteLine($"DestinationPassword: ******");

                Console.WriteLine($"VocabularyEngine: {opts.VocabularyEngine}");
                Console.WriteLine($"VocabularyServer: {opts.VocabularyServer}");
                Console.WriteLine($"VocabularyDatabase: {opts.VocabularyDatabase}");
                Console.WriteLine($"VocabularySchema: {opts.VocabularySchema}");
                Console.WriteLine($"VocabularyUser: {opts.VocabularyUser}");
                Console.WriteLine($"VocabularyPassword: ******");

                Console.WriteLine();

                #region vendor
                Vendor vendor = EtlLibrary.CreateVendorInstance(etlLibraryPath, opts.VendorName)
                    ?? throw new NoNullAllowedException("Failed to setup the vendor!");

                if (!IsVendorWellInitialized(vendor))
                {
                    var generator = new ProxyGenerator();
                    var vendorType = vendor.GetType();     
                    var interceptor = new CdmVersionInterceptor();
                    var proxied = generator.CreateClassProxyWithTarget(vendorType, vendor, interceptor);
                    vendor = (Vendor)proxied;

                    if (IsVendorWellInitialized(vendor))
                        Console.WriteLine("WARNING! The vendor has not been initialized properly, but the issue was fixed! A subclass with harcoded CdmVersion v5.4 has been created!");
                    else
                        throw new Exception("The Vendor has not been properly initialized!");
                }
                #endregion

                var sourceEngine = GetDatabaseEngine(opts.SourceEngine);
                var cdmEngine = GetDatabaseEngine(opts.DestinationEngine);
                var vocabEngine = GetDatabaseEngine(opts.VocabularyEngine);

                if (!int.TryParse(opts.ContinueLoadFromChunk, out int continueLoadFromChunk))
                    continueLoadFromChunk = 0;

                if (!int.TryParse(opts.ChunkSize, out int chunkSize))
                    chunkSize = 0;

                //create instance, nothing drastic is done at init, properties are copied at BuildingSettings properties Set
                //these properties must be filled at the moment of the interaction with the db
                FrameworkSettings.Settings.Initialize("", "");

                Settings.Current = new Settings()
                {
                    Building = new BuildingSettings(sourceEngine, cdmEngine, vocabEngine, vendor, continueLoadFromChunk, chunkSize)
                    {
                        Batches = 1,

                        SourceServer = opts.SourceServer,
                        SourceDb = opts.SourceDatabase,
                        SourceSchema = opts.SourceSchema,
                        SourceUser = opts.SourceUser,
                        SourcePswd = opts.SourcePassword,

                        CdmServer = opts.DestinationServer,
                        CdmDb = opts.DestinationDatabase,
                        CdmSchema = opts.DestinationSchema,
                        CdmUser = opts.DestinationUser,
                        CdmPswd = opts.DestinationPassword,

                        VocabServer = opts.VocabularyServer,
                        VocabDb = opts.VocabularyDatabase,
                        VocabSchema = opts.VocabularySchema,
                        VocabUser = opts.VocabularyUser,
                        VocabPswd = opts.VocabularyPassword,
                        EtlLibraryPath = etlLibraryPath,
                    },
                    BuilderFolder = vendor.Folder,                    
                };
                Settings.Current.Building.SetFrameworkBuildingSettings();
            }
            catch (Exception e)
            {
                throw;
            }
        }

        static IDatabaseEngine GetDatabaseEngine(string engine)
        {            
            return engine switch
            {
                "postgresql" => new PostgreDatabaseEngine(),
                "mysql" => new MySqlDatabaseEngine(),
                "redshift" => new RedshiftDatabaseEngine(),
                "mssql" => new MssqlDatabaseEngine(),
                _ => throw new NotSupportedException($"The database engine '{engine}' is not supported!")
            };
        }

        static void Build(string chunkSchema, string etlLibraryPath, bool truncateTargetTables = false)
        {
            BuilderController builder = new BuilderController(etlLibraryPath);
            builder.CreateDestination();

            if (truncateTargetTables)
                builder.TruncateTables();
            else
                Logger.Write(0, Logger.LogMessageTypes.Info, 
                    $"Target tables truncation skipped due to loading continuation from chunk {Settings.Current.Building.ContinueLoadFromChunk}!");

            var vocabulary = new Vocabulary();
            vocabulary.Fill(false);
            vocabulary.Fill(true);            

            builder.TruncateLookup();
            builder.CreateLookup(vocabulary, chunkSchema);

            builder.Build(vocabulary, chunkSchema);
        }

        static bool IsVendorWellInitialized(Vendor vendor)
        {
            string normalize(string x) => x.ToLower().Split('v').Last().Replace(".", "");
            var cdmV = normalize(vendor.CdmVersion.ToString());
            var descV = normalize(vendor.Description);
            if (Convert.ToDecimal(cdmV) != Convert.ToDecimal(descV))
                return false;

            return true;
        }
    }
}