
using System.Configuration;
using System.Data;
using System.Diagnostics.SymbolStore;
using System.Numerics;
using System.Reflection;
using System.Runtime.InteropServices;
using CommandLine;
using CommandLine.Text;
using org.ohdsi.cdm.framework.common.Enums;
using org.ohdsi.cdm.framework.common.Utility;
using org.ohdsi.cdm.presentation.builder;
using org.ohdsi.cdm.presentation.builder.Controllers;

namespace RunLocal
{
    class Program
    {
        internal class Options
        {

            [Option("vendorName", Required = true, HelpText = "Name of the vendor")]
            public string VendorName { get; set; }

            [Option("etlLibraryPath", Required = false, HelpText = "Path to the library with Vendor definition")]
            public string EtlLibraryPath { get; set; } = "";

            #region source

            [Option("sourceEngine", Required = true, HelpText = "Source engine")]
            public string SourceEngine { get; set; }

            [Option("sourceServer", Required = true, HelpText = "Source server")]
            public string SourceServer { get; set; }

            [Option("sourceDatabase", Required = true, HelpText = "Source database")]
            public string SourceDatabase { get; set; }

            [Option("sourceSchema", Required = true, HelpText = "Source schema")]
            public string SourceSchema { get; set; }

            [Option("sourceUser", Required = true, HelpText = "Source user")]
            public string SourceUser { get; set; }

            [Option("sourcePassword", Required = true, HelpText = "Source password")]
            public string SourcePassword { get; set; }

            #endregion

            #region destination

            [Option("destinationEngine", Required = true, HelpText = "Destination engine")]
            public string DestinationEngine { get; set; }

            [Option("destinationServer", Required = true, HelpText = "Destination server")]
            public string DestinationServer { get; set; }

            [Option("destinationDatabase", Required = true, HelpText = "Destination database")]
            public string DestinationDatabase { get; set; }

            [Option("destinationSchema", Required = true, HelpText = "Destination schema")]
            public string DestinationSchema { get; set; }

            [Option("destinationUser", Required = true, HelpText = "Destination user")]
            public string DestinationUser { get; set; }

            [Option("destinationPassword", Required = true, HelpText = "Destination password")]
            public string DestinationPassword { get; set; }

            #endregion

            #region Vocabulary

            [Option("vocabularyEngine", Required = true, HelpText = "Vocabulary engine")]
            public string VocabularyEngine { get; set; }

            [Option("vocabularyServer", Required = true, HelpText = "Vocabulary server")]
            public string VocabularyServer { get; set; }

            [Option("vocabularyDatabase", Required = true, HelpText = "Vocabulary database")]
            public string VocabularyDatabase { get; set; }

            [Option("vocabularySchema", Required = true, HelpText = "Vocabulary schema")]
            public string VocabularySchema { get; set; }

            [Option("vocabularyUser", Required = true, HelpText = "Vocabulary user")]
            public string VocabularyUser { get; set; }

            [Option("vocabularyPassword", Required = true, HelpText = "Vocabulary password")]
            public string VocabularyPassword { get; set; }

            #endregion

            [Option("mappingsName", Required = true, HelpText = "Mappings name")]
            public string MappingsName { get; set; }

            [Option("cdmVersion", Required = true, HelpText = "CDM version")]
            public string CdmVersion { get; set; }

            [Usage(ApplicationAlias = "RunLocal")]
            public static IEnumerable<Example> Examples
            {
                get
                {
                    yield return new Example("Process vendor CDM with all options", new Options
                    {
                        VendorName = "CDM",
                        EtlLibraryPath = Directory.GetCurrentDirectory(),
                        SourceEngine = "Redshift",
                        SourceServer = "192.168.0.1",
                        SourceDatabase = "SourceDB",
                        SourceSchema = "SourceSchema",
                        SourceUser = "SourceUser",
                        SourcePassword = "SourcePassword",
                        DestinationEngine = "Redshift",
                        DestinationServer = "192.168.0.1",
                        DestinationDatabase = "DestinationDB",
                        DestinationSchema = "public",
                        DestinationUser = "DestinationUser",
                        DestinationPassword = "DestinationPassword",
                        VocabularyEngine = "Postgre",
                        VocabularyServer = "192.168.0.1",
                        VocabularyDatabase = "VocabularyDB",
                        VocabularySchema = "VocabularySchema",
                        VocabularyUser = "VocabularyUser",
                        VocabularyPassword = "VocabularyPassword",
                        MappingsName = "MappingsName",
                        CdmVersion = "5.4"
                    });
                }
            }
        }

        static void Main(string[] args)
        {
            Parser.Default.ParseArguments<Options>(args)
                .WithParsed(RunWithOptions)
                .WithNotParsed(HandleParseError);

            Console.ReadLine();
        }

        static void RunWithOptions(Options opts)
        {
            SetSettings(opts);
            /*
            Vendor vendor = EtlLibrary.CreateVendorInstance(opts.EtlLibraryPath, opts.VendorName);
            if (vendor is null)
                throw new NoNullAllowedException("Failed to setup the vendor!");
            */
            BuildingController buildingController = new BuildingController(opts.EtlLibraryPath);
            buildingController.Process();
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
            Console.WriteLine($"EtlLibraryPath: {opts.EtlLibraryPath}");
            Console.WriteLine($"SourceEngine: {opts.SourceEngine}");
            Console.WriteLine($"SourceServer: {opts.SourceServer}");
            Console.WriteLine($"SourceDatabase: {opts.SourceDatabase}");
            Console.WriteLine($"SourceSchema: {opts.SourceSchema}");
            Console.WriteLine($"SourceUser: {opts.SourceUser}");
            Console.WriteLine($"SourcePassword: {opts.SourcePassword}");
            Console.WriteLine($"DestinationEngine: {opts.DestinationEngine}");
            Console.WriteLine($"DestinationServer: {opts.DestinationServer}");
            Console.WriteLine($"DestinationDatabase: {opts.DestinationDatabase}");
            Console.WriteLine($"DestinationSchema: {opts.DestinationSchema}");
            Console.WriteLine($"DestinationUser: {opts.DestinationUser}");
            Console.WriteLine($"DestinationPassword: {opts.DestinationPassword}");
            Console.WriteLine($"VocabularyEngine: {opts.VocabularyEngine}");
            Console.WriteLine($"VocabularyServer: {opts.VocabularyServer}");
            Console.WriteLine($"VocabularyDatabase: {opts.VocabularyDatabase}");
            Console.WriteLine($"VocabularySchema: {opts.VocabularySchema}");
            Console.WriteLine($"VocabularyUser: {opts.VocabularyUser}");
            Console.WriteLine($"VocabularyPassword: {opts.VocabularyPassword}");
            Console.WriteLine($"MappingsName: {opts.MappingsName}");
            Console.WriteLine($"CdmVersion: {opts.CdmVersion}");
            Console.WriteLine();

            Settings.Current = new Settings()
            {
                BuilderFolder = opts.EtlLibraryPath,
                Building = new BuildingSettings()
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
                }
            };
        }
    }
}