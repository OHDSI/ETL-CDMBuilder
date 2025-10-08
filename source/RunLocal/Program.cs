using System.Configuration;
using System.Data;
using System.Reflection.Metadata;
using System.Reflection;
using CommandLine;
using CommandLine.Text;
using org.ohdsi.cdm.framework.common.Enums;
using org.ohdsi.cdm.framework.common.Utility;
using org.ohdsi.cdm.framework.desktop.Databases;
using org.ohdsi.cdm.presentation.builder;
using org.ohdsi.cdm.presentation.builder.Controllers;
using FrameworkSettings = org.ohdsi.cdm.framework.desktop.Settings;
using System.Diagnostics;

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
                        VocabularyPassword = "VocabularyPassword"
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
                    .Select(s => "--" + s.Trim().Replace("\\\\", "\\")) //these get doubled for some reason while in double quotes
                    .Where(s => s != "--RunLocal")
                    .Prepend("RunLocal")
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
            Console.WriteLine($"\r\nThe program has finished! - {hoursElapsed}h ({secondsElapsed}s)");
            Console.ReadLine();
        }

        static void RunWithOptions(Options opts)
        {
            SetSettings(opts);

            Build(Settings.Current.Building.SourceSchema, Settings.Current.Building.EtlLibraryPath, true);
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

                Vendor vendor = EtlLibrary.CreateVendorInstance(etlLibraryPath, opts.VendorName)
                    ?? throw new NoNullAllowedException("Failed to setup the vendor!");

                var sourceEngine = GetDatabaseEngine(opts.SourceEngine);
                var cdmEngine = GetDatabaseEngine(opts.DestinationEngine);
                var vocabEngine = GetDatabaseEngine(opts.VocabularyEngine);

                //create instance, nothing drastic is done at init, properties are copied at BuildingSettings properties Set
                //these properties must be filled at the moment of the interaction with the db
                FrameworkSettings.Settings.Initialize("", "");

                Settings.Current = new Settings()
                {
                    Building = new BuildingSettings(sourceEngine, cdmEngine, vocabEngine, vendor)
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
                        EtlLibraryPath = etlLibraryPath
                    },
                    BuilderFolder = vendor.Folder
                };
                Settings.Current.Building.SetFrameworkBuildingSettings();

                Console.WriteLine("\r\nChunk size:" + Settings.Current.Building.ChunkSize);
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

            var vocabulary = new Vocabulary();
            vocabulary.Fill(false, false);
            vocabulary.Fill(true, false);            

            builder.TruncateLookup();
            builder.CreateLookup(vocabulary, chunkSchema);

            builder.Build(vocabulary, chunkSchema);
        }
    }
}