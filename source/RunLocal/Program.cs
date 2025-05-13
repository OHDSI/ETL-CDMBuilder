using System.Configuration;
using System.Data;
using CommandLine;
using CommandLine.Text;
using org.ohdsi.cdm.framework.common.Enums;
using org.ohdsi.cdm.framework.common.Utility;
using org.ohdsi.cdm.framework.desktop.Databases;
using org.ohdsi.cdm.presentation.builder;
using org.ohdsi.cdm.presentation.builder.Controllers;
using FrameworkSettings = org.ohdsi.cdm.framework.desktop.Settings;

namespace RunLocal
{
    class Program
    {
        internal class Options
        {

            [Option("VendorName", Required = true, HelpText = "Name of the vendor")]
            public string VendorName { get; set; }

            //[Option("etlLibraryPath", Required = false, HelpText = "Path to the library with Vendor definition")]
            //public string EtlLibraryPath { get; set; } = "";

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

            [Option("MappingsName", Required = true, HelpText = "Mappings name")]
            public string MappingsName { get; set; }

            [Option("CdmVersion", Required = true, HelpText = "CDM version")]
            public string CdmVersion { get; set; }

            [Usage(ApplicationAlias = "RunLocal")]
            public static IEnumerable<Example> Examples
            {
                get
                {
                    var options = new Options()
                    {
                        VendorName = "VendorName",
                        //EtlLibraryPath = Directory.GetCurrentDirectory(),
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
                        MappingsName = "MappingsName",
                        CdmVersion = "CdmVersion"
                    };
                    var example = new Example("Example with placeholder arguments", options);
                    string txt = "RunLocal " + string.Join(" ", options.GetType().GetProperties().Where(s => s.Name != "Examples").Select(s => "--" + s.Name + "=\"" + s.Name + "\"")); // to fill program args
                    yield return example;
                }
            }
        }

        static void Main(string[] args)
        {
            Parser.Default.ParseArguments<Options>(args)
                .WithParsed(RunWithOptions)
                .WithNotParsed(HandleParseError);

            Console.WriteLine("\r\nThe program finished!");
            Console.ReadLine();
        }

        static void RunWithOptions(Options opts)
        {
            SetSettings(opts);

            BuildingController buildingController = new BuildingController(Directory.GetCurrentDirectory());
            buildingController.Process();
            buildingController.Refresh();
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
            Console.WriteLine("Options:");

            Console.WriteLine($"VendorName: {opts.VendorName}");
            //Console.WriteLine($"EtlLibraryPath: {opts.EtlLibraryPath}");

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

            Console.WriteLine($"MappingsName: {opts.MappingsName}");
            Console.WriteLine($"CdmVersion: {opts.CdmVersion}");

            Console.WriteLine();

            Vendor vendor = EtlLibrary.CreateVendorInstance(Directory.GetCurrentDirectory(), opts.VendorName)
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
                    VocabPswd = opts.VocabularyPassword
                },
                //BuilderFolder = opts.EtlLibraryPath,
                BuilderFolder = Directory.GetCurrentDirectory(),
            };            
        }

        static IDatabaseEngine GetDatabaseEngine(string engine)
        {
            return engine switch
            {
                "postgresql" => new PostgreDatabaseEngine(),
                "mysql" => new MySqlDatabaseEngine(),
                "redshift" => new RedshiftDatabaseEngine(),
                "mssql" => new MssqlDatabaseEngine(),
                _ => throw new NotSupportedException($"The database engine '{engine}' is not supported.")
            };
        }
    }
}