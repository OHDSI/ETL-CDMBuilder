using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Linq;
using System.Windows;
using System.Windows.Input;
using org.ohdsi.cdm.framework.core;
using org.ohdsi.cdm.framework.core.Controllers;
using org.ohdsi.cdm.framework.shared.Attributes;
using org.ohdsi.cdm.framework.shared.Enums;
using org.ohdsi.cdm.framework.shared.Extensions;

namespace org.ohdsi.cdm.presentation.buildingmanager
{
   public class BuilderViewModel : INotifyPropertyChanged
   {
      #region Variables
      private string builder;
      private string hix;
      private string vocabulary;
      private string destination;
      private string apsConnectionString;
      
      
      private string source;
      private Vendors vendor;
      private string saver;
      private bool truncate;
      private int maxDegreeOfParallelism;
      private int batchSize;
      private int batches;
      private BuildingController buildingController;
      private string buttonText;
      private bool buttonEnabled;
      private bool settingUnlocked;

      public event PropertyChangedEventHandler PropertyChanged;
      private readonly System.Timers.Timer timer = new System.Timers.Timer { Interval = 1000 };
      private readonly System.Timers.Timer timerUI = new System.Timers.Timer { Interval = 3000 };
      private int errorsCount;
      private List<string> lastErrors;

      #endregion

      #region Properties
      public int Batches
      {
         get { return batches; }
         set
         {
            if (value != this.batches)
            {
               this.batches = value;
               if (this.PropertyChanged != null)
               {
                  this.PropertyChanged(this, new PropertyChangedEventArgs("Batches"));
               }
            }
         }
      }

      public int BatchSize
      {
         get { return batchSize; }
         set
         {
            if (value != this.batchSize)
            {
               this.batchSize = value;
               if (this.PropertyChanged != null)
               {
                  this.PropertyChanged(this, new PropertyChangedEventArgs("BatchSize"));
               }
            }
         }
      }

      public int MaxDegreeOfParallelism
      {
         get { return maxDegreeOfParallelism; }
         set
         {
            if (value != this.maxDegreeOfParallelism)
            {
               this.maxDegreeOfParallelism = value;
               if (this.PropertyChanged != null)
               {
                  this.PropertyChanged(this, new PropertyChangedEventArgs("MaxDegreeOfParallelism"));
               }
            }
         }
      }

      public string Source
      {
         get { return source; }
         set
         {
            if (value != this.source)
            {
               this.source = value;
               if (this.PropertyChanged != null)
               {
                  this.PropertyChanged(this, new PropertyChangedEventArgs("Source"));
               }
            }
         }
      }

      public Vendors Vendor
      {
         get { return vendor; }
         set
         {
            if (value != this.vendor)
            {
               this.vendor = value;
               if (this.PropertyChanged != null)
               {
                  this.PropertyChanged(this, new PropertyChangedEventArgs("Vendor"));
                  SetVendorDefaultSettings();
               }
            }
         }
      }

      public string Saver
      {
         get { return saver; }
         set
         {
            if (value != this.saver)
            {
               this.saver = value;
               if (this.PropertyChanged != null)
               {
                  this.PropertyChanged(this, new PropertyChangedEventArgs("Saver"));
               }
            }
         }
      }

      public string Destination
      {
         get { return destination; }
         set
         {
            if (value != this.destination)
            {
               this.destination = value;
               if (this.PropertyChanged != null)
               {
                  this.PropertyChanged(this, new PropertyChangedEventArgs("Destination"));
               }
            }
         }
      }

      public string Vocabulary
      {
         get { return vocabulary; }
         set
         {
            if (value != this.vocabulary)
            {
               this.vocabulary = value;
               if (this.PropertyChanged != null)
               {
                  this.PropertyChanged(this, new PropertyChangedEventArgs("Vocabulary"));
               }
            }
         }
      }

      public string Builder
      {
         get { return builder; }
         set
         {
            if (value != this.builder)
            {
               this.builder = value;
               if (this.PropertyChanged != null)
               {
                  this.PropertyChanged(this, new PropertyChangedEventArgs("Builder"));
               }
            }
         }
      }

      public bool ButtonEnabled
      {
         get { return buttonEnabled; }
         set
         {
            if (value != this.buttonEnabled)
            {
               this.buttonEnabled = value;
               if (this.PropertyChanged != null)
               {
                  this.PropertyChanged(this, new PropertyChangedEventArgs("ButtonEnabled"));
               }
            }
         }
      }
      
      public bool SettingUnlocked
      {
         get { return settingUnlocked; }
         set
         {
            if (value != this.settingUnlocked)
            {
               this.settingUnlocked = value;
               if (this.PropertyChanged != null)
               {
                  this.PropertyChanged(this, new PropertyChangedEventArgs("SettingUnlocked"));
               }
            }
         }
      }

      public bool DestinationStarted
      {
         get
         {
            if (buildingController == null) return false;
            return buildingController.Building.DestinationStarted;
         }
      }

      public bool DestinationWorking
      {
         get
         {
            return DestinationStarted && buildingController.Builder.State == BuilderState.Running;
         }
      }

      public bool DestinationCreated
      {
         get
         {
            if (buildingController == null) return false;
            return !DestinationSkipped && buildingController.Building.DestinationCreated;
         }
      }

      public bool DestinationSkipped
      {
         get
         {
            return buildingController != null && IsSkipped(buildingController.Building.CreateDestinationDbStart,
               buildingController.Building.CreateDestinationDbEnd);
         }
      }

      public string DestinationInfo
      {
         get
         {
            if (DestinationSkipped)
               return "skipped";

            if (DestinationCreated)
            {
               return buildingController.Building.CreateDestinationDbEnd.Value.Subtract(
                  buildingController.Building.CreateDestinationDbStart.Value).ToReadableString();
            }
            
            return string.Empty;
         }
      }

      public bool ChunksStarted
      {
         get
         {
            if (buildingController == null) return false;
            return buildingController.Building.ChunksStarted;
         }
      }

      public bool ChunksWorking
      {
         get { return ChunksStarted && buildingController.Builder.State == BuilderState.Running; }
      }

      public bool ChunksCreated
      {
         get
         {
            if (buildingController == null) return false;
            return !ChunksSkipped && buildingController.Building.ChunksCreated;
         }
      }

      public bool ChunksSkipped
      {
         get
         {
            return buildingController != null && IsSkipped(buildingController.Building.CreateChunksStart,
               buildingController.Building.CreateChunksEnd);
         }
      }

      public string ChunksInfo
      {
         get
         {
            if (ChunksSkipped)
               return "skipped";

            if (ChunksCreated)
            {
               return buildingController.Building.CreateChunksEnd.Value.Subtract(
                  buildingController.Building.CreateChunksStart.Value).ToReadableString();
            }
            
            return string.Empty;
         }
      }
      
      public bool LookupStarted
      {
         get
         {
            if (buildingController == null) return false;
            return buildingController.Building.LookupStarted;
         }
      }

      public bool LookupWorking
      {
         get { return LookupStarted && buildingController.Builder.State == BuilderState.Running; }
      }

      public bool LookupCreated
      {
         get
         {
            if (buildingController == null) return false;
            return !LookupSkipped && buildingController.Building.LookupCreated;
         }
      }

      public bool LookupSkipped
      {
         get
         {
            return buildingController != null && IsSkipped(buildingController.Building.CreateLookupStart,
               buildingController.Building.CreateLookupEnd);
         }
      }

      public string LookupInfo
      {
         get
         {
            if (LookupSkipped)
               return "skipped";

            if (LookupCreated)
            {
               return buildingController.Building.CreateLookupEnd.Value.Subtract(
                  buildingController.Building.CreateLookupStart.Value).ToReadableString();
            }
            
            return string.Empty;
         }
      }
      
      public bool BuildingStarted
      {
         get
         {
            if (buildingController == null) return false;
            return buildingController.Building.BuildingStarted;
         }
      }

      public bool BuildingWorking
      {
         get { return BuildingStarted && !BuildingComplete && !BuildingSkipped && buildingController.Builder.State == BuilderState.Running; }
      }

      public bool BuildingComplete
      {
         get
         {
            if (buildingController == null) return false;
            return !BuildingSkipped && buildingController.Building.BuildingComplete;
         }
      }

      public bool BuildingSkipped
      {
         get
         {
            return buildingController != null && IsSkipped(buildingController.Building.BuildingStart,
               buildingController.Building.BuildingEnd);
         }
      }

      public string BuildingInfo
      {
         get
         {
            if (BuildingSkipped)
               return "skipped";

            if (BuildingComplete)
            {
               return buildingController.Building.BuildingEnd.Value.Subtract(
                  buildingController.Building.BuildingStart.Value).ToReadableString();
            }
            
            if (BuildingStarted)
            {
               return string.Format("{0} from {1}", buildingController.CompleteChunksCount,
                  buildingController.ChunksCount);
            }


            return string.Empty;
         }
      }

      public bool IndexesStarted
      {
         get
         {
            if (buildingController == null) return false;
            return buildingController.Building.IndexesStarted;
         }
      }

      public bool IndexesWorking
      {
         get { return IndexesStarted && buildingController.Builder.State == BuilderState.Running; }
      }

      public bool IndexesCreated
      {
         get
         {
            if (buildingController == null) return false;
            return !IndexesSkipped && buildingController.Building.IndexesCreated;
         }
      }

      public bool IndexesSkipped
      {
         get
         {
            return buildingController != null && IsSkipped(buildingController.Building.CreateIndexesStart,
               buildingController.Building.CreateIndexesEnd);
         }
      }

      public string IndexesInfo
      {
         get
         {
            if (IndexesSkipped)
               return "skipped";

            if (IndexesCreated)
            {
               return buildingController.Building.CreateIndexesEnd.Value.Subtract(
                  buildingController.Building.CreateIndexesStart.Value).ToReadableString();
            }
            
            return string.Empty;
         }
      }

      public bool VocabularyStarted
      {
         get
         {
            if (buildingController == null) return false;
            return buildingController.Building.VocabularyStarted;
         }
      }

      public bool VocabularyWorking
      {
         get { return VocabularyStarted && buildingController.Builder.State == BuilderState.Running; }
      }

      public bool VocabularyCopied
      {
         get
         {
            if (buildingController == null) return false;
            return !VocabularySkipped && buildingController.Building.VocabularyCopied;
         }
      }

      public bool VocabularySkipped
      {
         get
         {
            return buildingController != null && IsSkipped(buildingController.Building.CopyVocabularyStart,
               buildingController.Building.CopyVocabularyEnd);
         }
      }

      public string VocabularyInfo
      {
         get
         {
            if (VocabularySkipped)
               return "skipped";

            if (VocabularyCopied)
            {
               return buildingController.Building.CopyVocabularyEnd.Value.Subtract(
                  buildingController.Building.CopyVocabularyStart.Value).ToReadableString();
            }
            
            return string.Empty;
         }
      }

      
      public bool PostprocessStarted
      {
         get
         {
            if (buildingController == null) return false;
            return buildingController.Building.PostprocessStarted;
         }
      }

      public bool PostprocessWorking
      {
         get { return PostprocessStarted && buildingController.Builder.State == BuilderState.Running; }
      }

      public bool PostprocessFinished
      {
         get
         {
            if (buildingController == null) return false;
            return !PostprocessSkipped && buildingController.Building.PostprocessFinished;
         }
      }

      public bool PostprocessSkipped
      {
         get
         {
            return buildingController != null && IsSkipped(buildingController.Building.PostprocessStart,
               buildingController.Building.PostprocessEnd);
         }
      }

      public string PostprocessInfo
      {
         get
         {
            if (PostprocessSkipped)
               return "skipped";

            if (PostprocessFinished)
            {
               return buildingController.Building.PostprocessEnd.Value.Subtract(
                  buildingController.Building.PostprocessStart.Value).ToReadableString();
            }
            
            return string.Empty;
         }
      }

      public string CurrentState
      {
         get
         {
            if (buildingController == null) return " - Loading... Please wait";

            return string.Format(" - {0}", buildingController.Builder.State);
         }
      }

      //public Brush ProgressColor
      //{
      //   get
      //   {
      //      if (buildingController == null) return Brushes.LightGreen;

      //      if (buildingController.Builder.State == BuilderState.Error)
      //         return Brushes.Red;

      //      return Brushes.LightGreen;
      //   }
      //}

      public string Errors
      {
         get
         {
            if (buildingController == null) return string.Empty;
            var errors = buildingController.GetErrors().ToList();
            //if (errors.Count == 0 && lastErrors != null)
            //{
            //   errors = lastErrors;
            //}

            errorsCount = errors.Count;
            return string.Join(Environment.NewLine, errors.Take(100));
         }
      }
      
      public string ErrorsInfo
      {
         get
         {
            if (errorsCount == 0)
               return string.Empty;

            return string.Format(" - {0}", errorsCount);
         }
      }

      public string OtherBuilderInfo
      {
         get
         {
            if (buildingController == null) return "None";

            var otherBuilder = buildingController.GetOtherBuilderInfo.ToArray();
            if (otherBuilder.Length == 0)
               return "None";

            return string.Join(Environment.NewLine, otherBuilder);
         }
      }

      public bool PlayButtonChecked
      {
         get
         {
            if (buildingController == null) return false;
            return buildingController.Builder.State == BuilderState.Running;
         }
      }

      public string Title
      {
         get
         {
            var title = "Building Manager";

            if (Settings.Current != null && Settings.Current.Builder != null && Settings.Current.Builder.IsLead)
               return "Building Manager v." + Settings.Current.Builder.Version + " - Lead | Load Id " + Settings.Current.Building.LoadId;

            if (Settings.Current != null && Settings.Current.Builder != null)
               return "Building Manager v." + Settings.Current.Builder.Version + " | Load Id " + Settings.Current.Building.LoadId;

            return title;
         }
      }

      public bool Reset
      {
         get { return false; }
      }

      #region Commands

      public ICommand StartBuildingCommand
      {
         get { return new DelegateCommand(Build); }
      }

      public ICommand SetBuildingCommand
      {
         get { return new DelegateCommand(SetBuilding); }
      }

      public ICommand ResetCommand
      {
         get { return new DelegateCommand(ResetSettings); }
      }

      public ICommand LoadSettingsCommand
      {
         get { return new DelegateCommand(LoadSetting); }
      }

      public ICommand ResetErrorsCommand
      {
         get { return new DelegateCommand(ResetErrors); }
      }

      public ICommand TruncateTablesCommand
      {
         get { return new DelegateCommand(TruncateTables); }
      }

      public ICommand TruncateWithoutLookupTablesCommand
      {
         get { return new DelegateCommand(TruncateWithoutLookupTables); }
      }

      public ICommand CreateTablesStepCommand
      {
         get { return new DelegateCommand(CreateTablesStep); }
      }

      public ICommand SkipDbCreationStepCommand
      {
         get { return new DelegateCommand(SkipDbCreationStep); }
      }

      public ICommand FillPostBuildTableCommand
      {
         get { return new DelegateCommand(FillPostBuildTable); }
      }

      public ICommand ResetDbCreationStepCommand
      {
         get { return new DelegateCommand(ResetDbCreationStep); }
      }

      public ICommand SkipChunksCreationStepCommand
      {
         get { return new DelegateCommand(SkipChunksCreationStep); }
      }

      public ICommand ResetChunksCreationStepCommand
      {
         get { return new DelegateCommand(() => ResetChunksCreationStep(true)); }
      }

      public ICommand SkipLookupCreationStepCommand
      {
         get { return new DelegateCommand(SkipLookupCreationStep); }
      }

      public ICommand ResetLookupCreationStepCommand
      {
         get { return new DelegateCommand(() => ResetLookupCreationStep(true)); }
      }

      public ICommand ResetNotFinishedChunksCommand
      {
         get { return new DelegateCommand(ResetNotFinishedChunks); }
      }

      public ICommand SkipBuildingStepCommand
      {
         get { return new DelegateCommand(SkipBuildingStep); }
      }

      public ICommand ResetBuildingStepCommand
      {
         get { return new DelegateCommand(() => ResetBuildingStep(true)); }
      }

      public ICommand ResetVocabularyStepCommand
      {
         get { return new DelegateCommand(() => ResetVocabularyStep(true)); }
      }

      public ICommand SkipVocabularyStepCommand
      {
         get { return new DelegateCommand(SkipVocabularyStep); }
      }

      //public ICommand ResetIndexesStepCommand
      //{
      //   get { return new DelegateCommand(() => ResetIndexesStep(true)); }
      //}

      public ICommand SkipIndexesStepCommand
      {
         get { return new DelegateCommand(SkipIndexesStep); }
      }

      public ICommand SkipPostprocessStepCommand
      {
         get { return new DelegateCommand(SkipPostprocessStep); }
      }

      public ICommand ResetPostprocessStepCommand
      {
         get { return new DelegateCommand(() => ResetPostprocessStep(true)); }
      }
      #endregion

      #endregion

      #region Creation Step
      private void ResetDbCreationStep()
      {
         if (buildingController == null) return;
         if(!DestinationCreated) return;
         if(DestinationSkipped) return;
         
         if (MessageBox.Show("All data will be lost, do you want to continue?", "Warning", MessageBoxButton.YesNo,
            MessageBoxImage.Warning) == MessageBoxResult.Yes)
         {
            buildingController.ResetDbCreationStep();
            ResetChunksCreationStep(false);
            ResetLookupCreationStep(false);
            ResetBuildingStep(false);
            ResetVocabularyStep(false);
            //ResetIndexesStep(false);
            ResetPostprocessStep(false);
         }
      }

      private void CreateTablesStep()
      {
         if (buildingController == null) return;

         buildingController.CreateTablesStep();
      }

      private void SkipDbCreationStep()
      {
         if (buildingController == null) return;
         if (DestinationCreated) return;

         buildingController.SkipDbCreationStep();
      }

      private void FillPostBuildTable()
      {
         if (buildingController == null) return;
         if (DestinationCreated) return;

         buildingController.FillPostBuildTables();
      }
      
      #endregion

      #region Chunks step
      private void ResetChunksCreationStep(bool showWarningDialog)
      {
         if (buildingController == null) return;
         if(!ChunksCreated) return;
         if(ChunksSkipped) return;

         const string message = "Chunk data will be lost, do you want to continue?";
         if (!showWarningDialog ||
             MessageBox.Show(message, "Warning", MessageBoxButton.YesNo,
                MessageBoxImage.Warning) == MessageBoxResult.Yes)
         {
            buildingController.ResetChunksCreationStep();
         }
      }

      private void SkipChunksCreationStep()
      {
         if (buildingController == null) return;
         if (ChunksCreated) return;

         buildingController.SkipChunksCreationStep();
      }
      #endregion

      #region Lookup step
      private void ResetLookupCreationStep(bool showWarningDialog)
      {
         if (buildingController == null) return;
         if(!LookupCreated) return;
         if(LookupSkipped) return;
         
         var message = "Following tables will be truncated: CARE_SITE, LOCATION, ORGANIZATION, PROVIDER, do you want to continue?";
         if (!showWarningDialog ||
             MessageBox.Show(message, "Warning", MessageBoxButton.YesNo,
                MessageBoxImage.Warning) == MessageBoxResult.Yes)
         {
            buildingController.ResetLookupCreationStep(!showWarningDialog);
         }
      }

      private void SkipLookupCreationStep()
      {
         if (buildingController == null) return;
         if (LookupCreated) return;

         buildingController.SkipLookupCreationStep();
      }
      #endregion

      #region Building step
      private void ResetNotFinishedChunks()
      {
         if (buildingController == null) return;
         if(!BuildingStarted) return;

         if (buildingController.Builder.State == BuilderState.Running || buildingController.Builder.State == BuilderState.Stopping)
         {
            MessageBox.Show("Please wait until building will be stopped and try again.");
            return;
         }

         buildingController.ResetNotFinishedChunks();
      }

      private void TruncateTables()
      {
         if (buildingController == null) return;

         var message = "Following tables will be truncated: " + Environment.NewLine +
                       "PERSON" + Environment.NewLine +
                       "CONDITION_OCCURRENCE" + Environment.NewLine +
                       "DRUG_EXPOSURE" + Environment.NewLine +
                       "PROCEDURE_OCCURRENCE" + Environment.NewLine +
                       "CONDITION_ERA" + Environment.NewLine +
                       "DRUG_ERA" + Environment.NewLine +
                       "OBSERVATION_PERIOD" + Environment.NewLine +
                       "OBSERVATION" + Environment.NewLine +
                       "VISIT_OCCURRENCE" + Environment.NewLine +
                       "LOCATION" + Environment.NewLine +
                       "ORGANIZATION" + Environment.NewLine +
                       "CARE_SITE" + Environment.NewLine +
                       "PROVIDER" + Environment.NewLine +
                       "PAYER_PLAN_PERIOD" + Environment.NewLine +
                       "DRUG_COST" + Environment.NewLine +
                       "PROCEDURE_COST" + Environment.NewLine +
                       "DEATH" + Environment.NewLine +
                       "COHORT" + Environment.NewLine +
                       "Do you want to continue?";
         if (MessageBox.Show(message, "Warning", MessageBoxButton.YesNo,
                MessageBoxImage.Warning) == MessageBoxResult.Yes)
         {
            buildingController.TruncateTables();
         }
      }

      private void TruncateWithoutLookupTables()
      {
         if (buildingController == null) return;

         var message = "Following tables will be truncated: " + Environment.NewLine +
                       "PERSON" + Environment.NewLine +
                       "CONDITION_OCCURRENCE" + Environment.NewLine +
                       "DRUG_EXPOSURE" + Environment.NewLine +
                       "PROCEDURE_OCCURRENCE" + Environment.NewLine +
                       "CONDITION_ERA" + Environment.NewLine +
                       "DRUG_ERA" + Environment.NewLine +
                       "OBSERVATION_PERIOD" + Environment.NewLine +
                       "OBSERVATION" + Environment.NewLine +
                       "VISIT_OCCURRENCE" + Environment.NewLine +
                       "PAYER_PLAN_PERIOD" + Environment.NewLine +
                       "DRUG_COST" + Environment.NewLine +
                       "PROCEDURE_COST" + Environment.NewLine +
                       "DEATH" + Environment.NewLine +
                       "COHORT" + Environment.NewLine +
                       "Do you want to continue?";
         if (MessageBox.Show(message, "Warning", MessageBoxButton.YesNo,
                MessageBoxImage.Warning) == MessageBoxResult.Yes)
         {
            buildingController.TruncateWithoutLookupTables();
         }
      }

      private void ResetBuildingStep(bool showWarningDialog)
      {
         if (buildingController == null) return;
         if(!BuildingStarted) return;
         if(BuildingSkipped) return;

         var message = "All built data will be lost, do you want to continue?";
         if (!showWarningDialog ||
             MessageBox.Show(message, "Warning", MessageBoxButton.YesNo,
                MessageBoxImage.Warning) == MessageBoxResult.Yes)
         {
            buildingController.ResetBuildingStep(!showWarningDialog);
         }
      }

      private void SkipBuildingStep()
      {
         if (buildingController == null) return;
         if (BuildingStarted) return;

         buildingController.SkipBuildingStep();
      }
      #endregion

      #region Vocabulary step
      private void ResetVocabularyStep(bool showWarningDialog)
      {
         if (buildingController == null) return;
         if (!VocabularyCopied) return;
         if(VocabularySkipped) return;

         var message = "Following tables will be dropped: CONCEPT, CONCEPT_ANCESTOR, CONCEPT_RELATIONSHIP, " + Environment.NewLine + 
            "CONCEPT_SYNONYM, RELATIONSHIP, SOURCE_TO_CONCEPT_MAP, VOCABULARY, do you want to continue?";

         if (!showWarningDialog ||
             MessageBox.Show(message, "Warning", MessageBoxButton.YesNo,
                MessageBoxImage.Warning) == MessageBoxResult.Yes)
         {
            buildingController.ResetVocabularyStep(!showWarningDialog);
         }
      }

      private void SkipVocabularyStep()
      {
         if (buildingController == null) return;
         if (VocabularyCopied) return;

         buildingController.SkipVocabularyStep();
      }
      #endregion

      #region Indexes step
      //private void ResetIndexesStep(bool showWarningDialog)
      //{

      //}

      private void SkipIndexesStep()
      {
         if (buildingController == null) return;
         if (IndexesCreated) return;

         buildingController.SkipIndexesStep();
      }
        #endregion

      #region Postprocess step
      private void ResetPostprocessStep(bool showWarningDialog)
        {
            if (buildingController == null) return;
            if (!PostprocessFinished) return;
            if (PostprocessSkipped) return;

            var message = "Postprocess results will be reset. Continue?";

            if (!showWarningDialog ||
                MessageBox.Show(message, "Warning", MessageBoxButton.YesNo,
                   MessageBoxImage.Warning) == MessageBoxResult.Yes)
            {
                buildingController.ResetPostprocessStep();
            }
        } 
        
      private void SkipPostprocessStep()
      {
         if (buildingController == null) return;
         if (PostprocessFinished) return;

         buildingController.SkipPostprocessStep();
      }
      #endregion

      private static bool IsSkipped(DateTime? start, DateTime? end)
      {
         return start.HasValue && end.HasValue && start.Value.Year == DateTime.MaxValue.Year && end.Value.Year == DateTime.MaxValue.Year;
      }

      public BuilderViewModel()
      {
         SetDefaultSettings();

         Settings.Initialize(Builder, Environment.MachineName);
         
         if (Settings.Current.Building.Id.HasValue)
         {
            Batches = Settings.Current.Building.Batches;
            BatchSize = Settings.Current.Building.BatchSize;
            
            Source = Settings.Current.Building.RawSourceConnectionString;
            Destination = Settings.Current.Building.RawDestinationConnectionString;
            Vocabulary = Settings.Current.Building.RawVocabularyConnectionString;
            Vendor = Settings.Current.Building.Vendor;
         }

         if (Settings.Current.Builder.Id.HasValue)
         {
            MaxDegreeOfParallelism = Settings.Current.Builder.MaxDegreeOfParallelism;
         }
         
         timer.Elapsed += OnTimer;
         timer.Start();

         timerUI.Elapsed += timerUI_Elapsed;
         timerUI.Start();
      }

      void timerUI_Elapsed(object sender, System.Timers.ElapsedEventArgs e)
      {
         UpdateState();
      }

      private void SetDefaultSettings()
      {
         ConfigurationManager.RefreshSection("connectionStrings");
         
         Source = ConfigurationManager.ConnectionStrings["Source"].ConnectionString;
         Destination = ConfigurationManager.ConnectionStrings["Destination"].ConnectionString;
         Vocabulary = ConfigurationManager.ConnectionStrings["Vocabulary"].ConnectionString;
         Builder = ConfigurationManager.ConnectionStrings["Builder"].ConnectionString;

         Saver = "Db";
         Vendor = Vendors.Truven_CCAE;
         
         ButtonEnabled = true;
         SettingUnlocked = true;
         SetVendorDefaultSettings();
      }

      private void SetVendorDefaultSettings()
      {
         Batches = Vendor.GetAttribute<NumOfChunks>().Value;
         BatchSize = Vendor.GetAttribute<ChunkSize>().Value;
         MaxDegreeOfParallelism = Vendor.GetAttribute<MaxDegreeOfParallelism>().Value; 
      }

      private void UpdateState()
      {
         if (buildingController == null) return;

         
         ButtonEnabled = buildingController.Builder.State != BuilderState.Stopping;
         SettingUnlocked = !(buildingController.Builder.State == BuilderState.Running ||
                         buildingController.Builder.State == BuilderState.Stopping);
  
         if (this.PropertyChanged != null)
         {
            this.PropertyChanged(this, new PropertyChangedEventArgs("DestinationStarted"));
            this.PropertyChanged(this, new PropertyChangedEventArgs("DestinationWorking"));
            this.PropertyChanged(this, new PropertyChangedEventArgs("DestinationCreated"));
            this.PropertyChanged(this, new PropertyChangedEventArgs("DestinationInfo"));

            this.PropertyChanged(this, new PropertyChangedEventArgs("ChunksStarted"));
            this.PropertyChanged(this, new PropertyChangedEventArgs("ChunksWorking"));
            this.PropertyChanged(this, new PropertyChangedEventArgs("ChunksCreated"));
            this.PropertyChanged(this, new PropertyChangedEventArgs("ChunksInfo"));

            this.PropertyChanged(this, new PropertyChangedEventArgs("LookupStarted"));
            this.PropertyChanged(this, new PropertyChangedEventArgs("LookupWorking"));
            this.PropertyChanged(this, new PropertyChangedEventArgs("LookupCreated"));
            this.PropertyChanged(this, new PropertyChangedEventArgs("LookupInfo"));

            this.PropertyChanged(this, new PropertyChangedEventArgs("BuildingStarted"));
            this.PropertyChanged(this, new PropertyChangedEventArgs("BuildingWorking"));
            this.PropertyChanged(this, new PropertyChangedEventArgs("BuildingComplete"));
            this.PropertyChanged(this, new PropertyChangedEventArgs("BuildingInfo"));

            this.PropertyChanged(this, new PropertyChangedEventArgs("IndexesStarted"));
            this.PropertyChanged(this, new PropertyChangedEventArgs("IndexesWorking"));
            this.PropertyChanged(this, new PropertyChangedEventArgs("IndexesCreated"));
            this.PropertyChanged(this, new PropertyChangedEventArgs("IndexesInfo"));

            this.PropertyChanged(this, new PropertyChangedEventArgs("VocabularyStarted"));
            this.PropertyChanged(this, new PropertyChangedEventArgs("VocabularyWorking"));
            this.PropertyChanged(this, new PropertyChangedEventArgs("VocabularyCopied"));
            this.PropertyChanged(this, new PropertyChangedEventArgs("VocabularyInfo"));

            this.PropertyChanged(this, new PropertyChangedEventArgs("PostprocessStarted"));
            this.PropertyChanged(this, new PropertyChangedEventArgs("PostprocessWorking"));
            this.PropertyChanged(this, new PropertyChangedEventArgs("PostprocessFinished"));
            this.PropertyChanged(this, new PropertyChangedEventArgs("PostprocessInfo"));

            this.PropertyChanged(this, new PropertyChangedEventArgs("CurrentState"));
            this.PropertyChanged(this, new PropertyChangedEventArgs("PlayButtonChecked"));
            this.PropertyChanged(this, new PropertyChangedEventArgs("Errors"));
            this.PropertyChanged(this, new PropertyChangedEventArgs("ErrorsInfo"));
            this.PropertyChanged(this, new PropertyChangedEventArgs("OtherBuilderInfo"));
            this.PropertyChanged(this, new PropertyChangedEventArgs("Title"));
         }
      }

      private void SetBuilding()
      {
         if (buildingController != null && (buildingController.Builder.State == BuilderState.Running ||
             buildingController.Builder.State == BuilderState.Stopping)) return;

         timer.Stop();
         UpdateSettings();

         buildingController = new BuildingController();
         //buildingController.Load();

         timer.Start();
      }

      private void ResetSettings()
      {
         if (buildingController == null)
            SetBuilding();

         SetDefaultSettings();
         UpdateState();
         buildingController.ResetSettings();
         this.PropertyChanged(this, new PropertyChangedEventArgs("Reset"));
      }

      private void LoadSetting()
      {
         var settings = new SettingsWindow();
         var dialogResult = settings.ShowDialog();
         if (dialogResult.HasValue && dialogResult.Value)
         {
            if (settings.CurrentBuildingId.HasValue)
            {
               Settings.Current.Building.Load(settings.CurrentBuildingId.Value);

               Source = Settings.Current.Building.RawSourceConnectionString;
               Destination = Settings.Current.Building.RawDestinationConnectionString;
               Vocabulary = Settings.Current.Building.RawVocabularyConnectionString;
               Vendor = Settings.Current.Building.Vendor;

               BatchSize = Settings.Current.Building.Batches;
            }
         }
      }

      private void ResetErrors()
      {
         buildingController.ResetErrors();
         this.PropertyChanged(this, new PropertyChangedEventArgs("Reset"));
      }

      private void Build()
      {
         buildingController.Process();
      }

      public void Stop()
      {
         if(buildingController != null)
            buildingController.Stop();
      }

      private void UpdateSettings()
      {
         Settings.Current.Builder.MaxDegreeOfParallelism = MaxDegreeOfParallelism;
         Settings.Current.Builder.Folder = AppDomain.CurrentDomain.BaseDirectory;

         Settings.Current.Building.BatchSize = BatchSize;
         Settings.Current.Building.RawSourceConnectionString = Source;
         Settings.Current.Building.RawDestinationConnectionString = Destination;
         Settings.Current.Building.RawVocabularyConnectionString = Vocabulary;
         Settings.Current.Building.Vendor = Vendor;
         Settings.Current.Building.Batches = Batches;

         Settings.Current.Save();
      }

      private void OnTimer(object sender, System.Timers.ElapsedEventArgs e)
      {
         if (buildingController == null) return;

         timer.Stop();
         buildingController.Refresh();
         timer.Start();
      }
   }
}
