using CommandLine;
using CommandLine.Text;
using org.ohdsi.cdm.framework.common.Enums;
using org.ohdsi.cdm.framework.desktop.Databases;
using org.ohdsi.cdm.presentation.builder;
using org.ohdsi.cdm.presentation.builder.Controllers;
using org.ohdsi.cdm.presentation.Builder.AnsiConsoleHelpers;
using Spectre.Console;
using System.Data;
using System.Diagnostics;
using FrameworkSettings = org.ohdsi.cdm.framework.desktop.Settings;

namespace org.ohdsi.cdm.RunLocal
{
    class Program
    {
        internal class Options
        {

            [Option("VendorName", Required = true, HelpText = "Name of the vendor")]
            public string VendorName { get; set; }

            [Option("QueryOverwriteFolderPath", Required = false, HelpText = "Path to a folderwith queries to overwrite the original ones. Queries within must be placed in folders named after either rdbms or vendor.")]
            public string QueryOverwriteFolderPath { get; set; } = "";

            [Option("ContinueLoadFromChunk", Required = false, HelpText = "If >0, then chunk generation and previous chunks processing are skipped")]
            public string ContinueLoadFromChunk { get; set; } = "";

            [Option("ChunkSize", Required = false, HelpText = "Amount of Persons to process in one chunk")]
            public string ChunkSize { get; set; } = "1000";

            [Option("QueryTriesAmount", Required = false, HelpText = "If query fails try again the required amounth of times")]
            public string QueryTriesAmount { get; set; } = "5";

            [Option("QueryTriesDelaySeconds", Required = false, HelpText = "Wait this time before trying again")]
            public string QueryTriesDelaySeconds { get; set; } = "300";

            [Option("MaxMemoryBudgetMb", Required = false, HelpText = "How much memory may be used for loading chunks in parallel. To turn off parallellism, set MaxMemoryBudgetMb to 0. No parallellisn if chunks are too big.")]
            public string MaxMemoryBudgetMb { get; set; } = "4000";

            [Option("MemoryPerChunkMarginPercent", Required = false, HelpText = "Must be more than or equal to 0. Chunk loading is considered to take more memory than actual by this amount when calculating possible degree of parallelism. Helps to avoid memory issues")]
            public string MemoryPerChunkMarginPercent { get; set; } = "5";


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
                        QueryOverwriteFolderPath = "",
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
            AnsiConsole.WriteLine($"\r\n\r\n==========START - {DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss")}==========");
            AnsiConsole.WriteLine($"Current process id = " + Process.GetCurrentProcess().Id + " - " + Process.GetCurrentProcess().ProcessName);
            if (args.Length == 0)
            {
                AnsiConsole.WriteLine("The arguments must be provided! For an example, see the file Bats/RunLocalTemplate.bat!");
                AnsiConsole.WriteLine("Then create another .bat file with proper parameters and run it.");
                Console.ReadLine();
                return;
            }

            var sw = new Stopwatch();
            sw.Start();

            Parser.Default.ParseArguments<Options>(args)
                .WithParsed(RunWithOptions)
                .WithNotParsed(HandleParseError);

            var secondsElapsed = Math.Round((double)sw.ElapsedMilliseconds / 1000);
            var hoursElapsed = Math.Round(secondsElapsed / 60 / 60, 1);
            var time = $"{hoursElapsed}h ({secondsElapsed}s";
            var memory = $"{Math.Round(MemoryColumn.MaxMbMemoryProcess)}({Math.Round(MemoryColumn.MaxMbMemoryGC)}";             
            AnsiConsole.MarkupLine($"[green]\r\nThe program has finished! - {time}), Max memory used={memory}) MB[/]");
            Console.ReadLine();
        }

        static void RunWithOptions(Options opts)
        {
            SetSettings(opts);

            bool truncateTargetTables = Settings.Current.Building.ContinueLoadFromChunk > 0 ? false : true;

            Build(Settings.Current.Building.SourceSchema, truncateTargetTables);
        }

        static void HandleParseError(IEnumerable<Error> errs)
        {
            AnsiConsole.WriteLine("Failed to parse command-line arguments.");
            foreach (var error in errs)
            {
                AnsiConsole.WriteLine(error.ToString());
            }
        }

        static void SetSettings(Options opts)
        {
            try
            {
                var queryOverwriteFolderPath = opts.QueryOverwriteFolderPath ?? "";

                AnsiConsole.WriteLine("Options:");

                AnsiConsole.WriteLine($"VendorName: {opts.VendorName}");
                AnsiConsole.WriteLine($"QueryOverwriteFolderPath: {queryOverwriteFolderPath}");
                AnsiConsole.WriteLine($"ContinueLoadFromChunk: {opts.ContinueLoadFromChunk}");
                AnsiConsole.WriteLine($"ChunkSize: {opts.ChunkSize}");
                AnsiConsole.WriteLine($"QueryTriesAmount: {opts.QueryTriesAmount}");
                AnsiConsole.WriteLine($"QueryTriesDelaySeconds: {opts.QueryTriesDelaySeconds}");
                AnsiConsole.WriteLine($"MaxMemoryBudgetMb: {opts.MaxMemoryBudgetMb}");
                AnsiConsole.WriteLine($"MemoryPerChunkMarginPercent: {opts.MemoryPerChunkMarginPercent}");

                AnsiConsole.WriteLine($"SourceEngine: {opts.SourceEngine}");
                AnsiConsole.WriteLine($"SourceServer: {opts.SourceServer}");
                AnsiConsole.WriteLine($"SourceDatabase: {opts.SourceDatabase}");
                AnsiConsole.WriteLine($"SourceSchema: {opts.SourceSchema}");
                AnsiConsole.WriteLine($"SourceUser: {opts.SourceUser}");
                AnsiConsole.WriteLine($"SourcePassword: ******");

                AnsiConsole.WriteLine($"DestinationEngine: {opts.DestinationEngine}");
                AnsiConsole.WriteLine($"DestinationServer: {opts.DestinationServer}");
                AnsiConsole.WriteLine($"DestinationDatabase: {opts.DestinationDatabase}");
                AnsiConsole.WriteLine($"DestinationSchema: {opts.DestinationSchema}");
                AnsiConsole.WriteLine($"DestinationUser: {opts.DestinationUser}");
                AnsiConsole.WriteLine($"DestinationPassword: ******");

                AnsiConsole.WriteLine($"VocabularyEngine: {opts.VocabularyEngine}");
                AnsiConsole.WriteLine($"VocabularyServer: {opts.VocabularyServer}");
                AnsiConsole.WriteLine($"VocabularyDatabase: {opts.VocabularyDatabase}");
                AnsiConsole.WriteLine($"VocabularySchema: {opts.VocabularySchema}");
                AnsiConsole.WriteLine($"VocabularyUser: {opts.VocabularyUser}");
                AnsiConsole.WriteLine($"VocabularyPassword: ******");

                AnsiConsole.WriteLine();

                Vendor vendor = presentation.builder.Utility.VendorHelper.GetVendor(opts.VendorName);
                if (!IsVendorWellInitialized(vendor, opts.VendorName))
                    throw new Exception("The Vendor has not been properly initialized!");

                var sourceEngine = GetDatabaseEngine(opts.SourceEngine);
                var cdmEngine = GetDatabaseEngine(opts.DestinationEngine);
                var vocabEngine = GetDatabaseEngine(opts.VocabularyEngine);

                if (!int.TryParse(opts.ContinueLoadFromChunk, out int continueLoadFromChunk))
                    continueLoadFromChunk = 0;

                if (!int.TryParse(opts.ChunkSize, out int chunkSize))
                    chunkSize = 1000;

                if (!int.TryParse(opts.QueryTriesAmount, out int queryTriesAmount))
                    queryTriesAmount = 5;

                if (!int.TryParse(opts.QueryTriesDelaySeconds, out int queryTriesDelaySeconds))
                    queryTriesDelaySeconds = 60;

                if (!int.TryParse(opts.MaxMemoryBudgetMb, out int maxMemoryBudgetMb))
                    maxMemoryBudgetMb = 5000;

                if (!int.TryParse(opts.MemoryPerChunkMarginPercent, out int memoryPerChunkMarginPercent))
                    memoryPerChunkMarginPercent = 5;

                //create instance, nothing drastic is done at init, properties are copied at BuildingSettings properties Set
                //these properties must be filled at the moment of the interaction with the db
                FrameworkSettings.Settings.Initialize("", "");

                Settings.Current = new Settings()
                {
                    Building = new BuildingSettings(sourceEngine, cdmEngine, vocabEngine, vendor, continueLoadFromChunk, 
                        chunkSize, queryTriesAmount, queryTriesDelaySeconds, maxMemoryBudgetMb, memoryPerChunkMarginPercent)
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
                        QueryOverwriteFolderPath = queryOverwriteFolderPath,
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
                //"mysql" => new MySqlDatabaseEngine(),
                "mysql" => throw new Exception("MySQL is not supported as database engine anymore!"),
                "redshift" => new RedshiftDatabaseEngine(),
                "mssql" => new MssqlDatabaseEngine(),
                _ => throw new NotSupportedException($"The database engine '{engine}' is not supported!")
            };
        }

        static void Build(string chunkSchema, bool truncateTargetTables = false)
        {            
            BuilderController builder = new BuilderController();
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

        static bool IsVendorWellInitialized(Vendor vendor, string argsVendorName)
        {
            if(vendor == null)
                throw new ArgumentNullException(nameof(vendor));

            if (!argsVendorName.Equals(vendor.Name, StringComparison.CurrentCultureIgnoreCase))
                return false;

            string normalize(string x) => x.ToLower().Split('v').Last().Replace(".", "");
            var cdmV = normalize(vendor.CdmVersion.ToString());
            var descV = normalize(vendor.Description);
            if (Convert.ToDecimal(cdmV) != Convert.ToDecimal(descV))
                return false;

            return true;
        }
    }
}