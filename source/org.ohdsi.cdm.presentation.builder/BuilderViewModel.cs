using org.ohdsi.cdm.framework.common.Extensions;
using org.ohdsi.cdm.framework.desktop.Enums;
using org.ohdsi.cdm.presentation.builder.Controllers;
using System;
using System.ComponentModel;
using System.Linq;
using System.Windows;
using System.Windows.Input;

namespace org.ohdsi.cdm.presentation.builder
{

    public class BuilderViewModel : INotifyPropertyChanged
    {
        #region Variables


        private string _sourceServer;
        private string _sourceDb;
        private string _sourceSchema;
        private string _sourceUser;
        public string SourcePswd { get; set; }

        private string _cdmServer;
        private string _cdmDb;
        private string _cdmSchema;
        private string _cdmUser;
        public string CdmPswd { get; set; }

        private string _vocabServer;
        private string _vocabDb;
        private string _vocabSchema;
        private string _vocabUser;
        public string VocabPswd { get; set; }


        private BuildingController _buildingController;
        private bool _buttonEnabled;
        private bool _settingUnlocked;

        private readonly System.Timers.Timer _timer = new System.Timers.Timer { Interval = 1000 };
        private readonly System.Timers.Timer _timerUi = new System.Timers.Timer { Interval = 1000 };
        private int _errorsCount;

        #endregion

        #region Properties

        public event PropertyChangedEventHandler PropertyChanged;

        public string SourceServer
        {
            get => _sourceServer;
            set
            {
                if (value != _sourceServer)
                {
                    _sourceServer = value;
                    PropertyChanged?.Invoke(this, new PropertyChangedEventArgs("SourceServer"));
                }
            }
        }

        public string SourceDb
        {
            get => _sourceDb;
            set
            {
                if (value != _sourceDb)
                {
                    _sourceDb = value;
                    PropertyChanged?.Invoke(this, new PropertyChangedEventArgs("SourceDb"));
                    UpdateSettings();
                    Settings.Current.Load();
                }
            }
        }

        public string SourceSchema
        {
            get => _sourceSchema;
            set
            {
                if (value != _sourceSchema)
                {
                    _sourceSchema = value;
                    PropertyChanged?.Invoke(this, new PropertyChangedEventArgs("SourceSchema"));
                }
            }
        }

        public string SourceUser
        {
            get => _sourceUser;
            set
            {
                if (value != _sourceUser)
                {
                    _sourceUser = value;
                    PropertyChanged?.Invoke(this, new PropertyChangedEventArgs("SourceUser"));
                }
            }
        }

        public string CdmServer
        {
            get => _cdmServer;
            set
            {
                if (value != _cdmServer)
                {
                    _cdmServer = value;
                    PropertyChanged?.Invoke(this, new PropertyChangedEventArgs("CdmServer"));
                }
            }
        }

        public string CdmDb
        {
            get => _cdmDb;
            set
            {
                if (value != _cdmDb)
                {
                    _cdmDb = value;
                    PropertyChanged?.Invoke(this, new PropertyChangedEventArgs("CdmDb"));
                    UpdateSettings();
                    Settings.Current.Load();
                }
            }
        }

        public string CdmSchema
        {
            get => _cdmSchema;
            set
            {
                if (value != _cdmSchema)
                {
                    _cdmSchema = value;
                    PropertyChanged?.Invoke(this, new PropertyChangedEventArgs("CdmSchema"));
                }
            }
        }

        public string CdmUser
        {
            get => _cdmUser;
            set
            {
                if (value != _cdmUser)
                {
                    _cdmUser = value;
                    PropertyChanged?.Invoke(this, new PropertyChangedEventArgs("CdmUser"));
                }
            }
        }

        public string VocabServer
        {
            get => _vocabServer;
            set
            {
                if (value != _vocabServer)
                {
                    _vocabServer = value;
                    PropertyChanged?.Invoke(this, new PropertyChangedEventArgs("VocabServer"));
                }
            }
        }

        public string VocabDb
        {
            get => _vocabDb;
            set
            {
                if (value != _vocabDb)
                {
                    _vocabDb = value;
                    PropertyChanged?.Invoke(this, new PropertyChangedEventArgs("VocabDb"));
                    UpdateSettings();
                    Settings.Current.Load();
                }
            }
        }

        public string VocabSchema
        {
            get => _vocabSchema;
            set
            {
                if (value != _vocabSchema)
                {
                    _vocabSchema = value;
                    PropertyChanged?.Invoke(this, new PropertyChangedEventArgs("VocabSchema"));
                }
            }
        }

        public string VocabUser
        {
            get => _vocabUser;
            set
            {
                if (value != _vocabUser)
                {
                    _vocabUser = value;
                    PropertyChanged?.Invoke(this, new PropertyChangedEventArgs("VocabUser"));
                }
            }
        }

        public bool ButtonEnabled
        {
            get => _buttonEnabled;
            set
            {
                if (value != _buttonEnabled)
                {
                    _buttonEnabled = value;
                    PropertyChanged?.Invoke(this, new PropertyChangedEventArgs("ButtonEnabled"));
                }
            }
        }

        public bool SettingUnlocked
        {
            get => _settingUnlocked;
            set
            {
                if (value != _settingUnlocked)
                {
                    _settingUnlocked = value;
                    PropertyChanged?.Invoke(this, new PropertyChangedEventArgs("SettingUnlocked"));
                }
            }
        }

        public bool DestinationStarted
        {
            get
            {
                if (_buildingController == null) return false;
                return Settings.Current.Building.BuildingState.DestinationStarted;
            }
        }

        public bool DestinationWorking => DestinationStarted && _buildingController.CurrentState == BuilderState.Running;

        public bool DestinationCreated
        {
            get
            {
                if (_buildingController == null) return false;
                return !DestinationSkipped && Settings.Current.Building.BuildingState.DestinationCreated;
            }
        }

        public bool DestinationSkipped => _buildingController != null && IsSkipped(Settings.Current.Building.BuildingState.CreateDestinationDbStart,
                                              Settings.Current.Building.BuildingState.CreateDestinationDbEnd);

        public string DestinationInfo
        {
            get
            {
                if (DestinationSkipped)
                    return "skipped";

                if (DestinationCreated)
                {
                    return Settings.Current.Building.BuildingState.CreateDestinationDbEnd.Value.Subtract(
                        Settings.Current.Building.BuildingState.CreateDestinationDbStart.Value).ToReadableString();
                }

                return string.Empty;
            }
        }

        public bool ChunksStarted
        {
            get
            {
                if (_buildingController == null) return false;
                return Settings.Current.Building.BuildingState.ChunksStarted;
            }
        }

        public bool ChunksWorking => ChunksStarted && _buildingController.CurrentState == BuilderState.Running;

        public bool ChunksCreated
        {
            get
            {
                if (_buildingController == null) return false;
                return !ChunksSkipped && Settings.Current.Building.BuildingState.ChunksCreated;
            }
        }

        public bool ChunksSkipped => _buildingController != null && IsSkipped(Settings.Current.Building.BuildingState.CreateChunksStart,
                                         Settings.Current.Building.BuildingState.CreateChunksEnd);

        public string ChunksInfo
        {
            get
            {
                if (ChunksSkipped)
                    return "skipped";

                if (ChunksCreated)
                {
                    return Settings.Current.Building.BuildingState.CreateChunksEnd.Value.Subtract(
                        Settings.Current.Building.BuildingState.CreateChunksStart.Value).ToReadableString();
                }

                return string.Empty;
            }
        }

        public bool LookupStarted
        {
            get
            {
                if (_buildingController == null) return false;
                return Settings.Current.Building.BuildingState.LookupStarted;
            }
        }

        public bool LookupWorking => LookupStarted && _buildingController.CurrentState == BuilderState.Running;

        public bool LookupCreated
        {
            get
            {
                if (_buildingController == null) return false;
                return !LookupSkipped && Settings.Current.Building.BuildingState.LookupCreated;
            }
        }

        public bool LookupSkipped => _buildingController != null && IsSkipped(Settings.Current.Building.BuildingState.CreateLookupStart,
                                         Settings.Current.Building.BuildingState.CreateLookupEnd);

        public string LookupInfo
        {
            get
            {
                if (LookupSkipped)
                    return "skipped";

                if (LookupCreated)
                {
                    return Settings.Current.Building.BuildingState.CreateLookupEnd.Value.Subtract(
                        Settings.Current.Building.BuildingState.CreateLookupStart.Value).ToReadableString();
                }

                return string.Empty;
            }
        }

        public bool BuildingStarted
        {
            get
            {
                if (_buildingController == null) return false;
                return Settings.Current.Building.BuildingState.BuildingStarted;
            }
        }

        public bool BuildingEnded
        {
            get
            {
                if (_buildingController == null) return false;
                return Settings.Current.Building.BuildingState.BuildingComplete;
            }
        }

        public bool BuildingWorking => BuildingStarted && !BuildingComplete && !BuildingSkipped &&
                                       _buildingController.CurrentState == BuilderState.Running;

        public bool BuildingComplete
        {
            get
            {
                if (_buildingController == null) return false;
                return !BuildingSkipped && Settings.Current.Building.BuildingState.BuildingComplete;
            }
        }

        public bool BuildingSkipped => _buildingController != null && IsSkipped(Settings.Current.Building.BuildingState.BuildingStart,
                                           Settings.Current.Building.BuildingState.BuildingEnd);

        public string BuildingInfo
        {
            get
            {
                if (BuildingSkipped)
                    return "skipped";

                if (BuildingComplete)
                {
                    return Settings.Current.Building.BuildingState.BuildingEnd.Value.Subtract(
                        Settings.Current.Building.BuildingState.BuildingStart.Value).ToReadableString();
                }

                if (BuildingStarted)
                {
                    return $"{_buildingController.CompleteChunksCount} from {_buildingController.ChunksCount}";
                }


                return string.Empty;
            }
        }

        public bool IndexesStarted
        {
            get
            {
                if (_buildingController == null) return false;
                return Settings.Current.Building.BuildingState.IndexesStarted;
            }
        }

        public bool IndexesWorking => IndexesStarted && _buildingController.CurrentState == BuilderState.Running;

        public bool IndexesCreated
        {
            get
            {
                if (_buildingController == null) return false;
                return !IndexesSkipped && Settings.Current.Building.BuildingState.IndexesCreated;
            }
        }

        public bool IndexesSkipped => _buildingController != null && IsSkipped(Settings.Current.Building.BuildingState.CreateIndexesStart,
                                          Settings.Current.Building.BuildingState.CreateIndexesEnd);

        public string IndexesInfo
        {
            get
            {
                if (IndexesSkipped)
                    return "skipped";

                if (IndexesCreated)
                {
                    return Settings.Current.Building.BuildingState.CreateIndexesEnd.Value.Subtract(
                        Settings.Current.Building.BuildingState.CreateIndexesStart.Value).ToReadableString();
                }

                return string.Empty;
            }
        }

        public bool VocabularyStarted
        {
            get
            {
                if (_buildingController == null) return false;
                return Settings.Current.Building.BuildingState.VocabularyStarted;
            }
        }

        public bool VocabularyWorking => VocabularyStarted && _buildingController.CurrentState == BuilderState.Running;

        public bool VocabularyCopied
        {
            get
            {
                if (_buildingController == null) return false;
                return !VocabularySkipped && Settings.Current.Building.BuildingState.VocabularyCopied;
            }
        }

        public bool VocabularySkipped => _buildingController != null && IsSkipped(Settings.Current.Building.BuildingState.CopyVocabularyStart,
                                             Settings.Current.Building.BuildingState.CopyVocabularyEnd);

        public string VocabularyInfo
        {
            get
            {
                if (VocabularySkipped)
                    return "skipped";

                if (VocabularyCopied)
                {
                    return Settings.Current.Building.BuildingState.CopyVocabularyEnd.Value.Subtract(
                        Settings.Current.Building.BuildingState.CopyVocabularyStart.Value).ToReadableString();
                }

                return string.Empty;
            }
        }


        public bool PostprocessStarted
        {
            get
            {
                if (_buildingController == null) return false;
                return Settings.Current.Building.BuildingState.PostprocessStarted;
            }
        }

        public bool PostprocessWorking => PostprocessStarted && _buildingController.CurrentState == BuilderState.Running;

        public bool PostprocessFinished
        {
            get
            {
                if (_buildingController == null) return false;
                return !PostprocessSkipped && Settings.Current.Building.BuildingState.PostprocessFinished;
            }
        }

        public bool PostprocessSkipped => _buildingController != null && IsSkipped(Settings.Current.Building.BuildingState.PostprocessStart,
                                              Settings.Current.Building.BuildingState.PostprocessEnd);

        public string PostprocessInfo
        {
            get
            {
                if (PostprocessSkipped)
                    return "skipped";

                if (PostprocessFinished)
                {
                    return Settings.Current.Building.BuildingState.PostprocessEnd.Value.Subtract(
                        Settings.Current.Building.BuildingState.PostprocessStart.Value).ToReadableString();
                }

                return string.Empty;
            }
        }

        public string CurrentState
        {
            get
            {
                if (_buildingController == null) return " - Loading... Please wait";

                return $" - {_buildingController.CurrentState}";
            }
        }


        public string Errors
        {
            get
            {
                if (_buildingController == null) return string.Empty;
                var errors = _buildingController.GetErrors().Reverse().ToList();
                //if (errors.Count == 0 && lastErrors != null)
                //{
                //   errors = lastErrors;
                //}

                _errorsCount = errors.Count;
                return string.Join(Environment.NewLine, errors.Take(200));
            }
        }

        public string ErrorsInfo
        {
            get
            {
                return string.Empty;
            }
        }


        public bool PlayButtonChecked => _buildingController?.CurrentState == BuilderState.Running;

        public string Title
        {
            get
            {
                var title = "Building Manager";
                return title;
            }
        }

        public bool Reset => false;


        #region Commands

        public ICommand StartBuildingCommand => new DelegateCommand(Build);

        public ICommand SetBuildingCommand => new DelegateCommand(SetBuilding);

        public ICommand ResetCommand => new DelegateCommand(ResetSettings);

        public ICommand ResetErrorsCommand => new DelegateCommand(ResetErrors);

        public ICommand ResetAllCommand => new DelegateCommand(ResetAll);

        public ICommand TruncateTablesCommand => new DelegateCommand(TruncateTables);

        public ICommand TruncateWithoutLookupTablesCommand => new DelegateCommand(TruncateWithoutLookupTables);

        public ICommand CreateTablesStepCommand => new DelegateCommand(CreateTablesStep);

        public ICommand SkipDbCreationStepCommand => new DelegateCommand(SkipDbCreationStep);

        public ICommand FillPostBuildTableCommand => new DelegateCommand(FillPostBuildTable);

        public ICommand ResetDbCreationStepCommand => new DelegateCommand(ResetDbCreationStep);

        public ICommand SkipChunksCreationStepCommand => new DelegateCommand(SkipChunksCreationStep);

        public ICommand ResetChunksCreationStepCommand
        {
            get { return new DelegateCommand(() => ResetChunksCreationStep(true)); }
        }

        public ICommand SkipLookupCreationStepCommand => new DelegateCommand(SkipLookupCreationStep);

        public ICommand ResetLookupCreationStepCommand
        {
            get { return new DelegateCommand(() => ResetLookupCreationStep(true)); }
        }

        public ICommand RestartChunksCreationStepCommand => new DelegateCommand(RestartChunksCreationStep);



        public ICommand SkipBuildingStepCommand => new DelegateCommand(SkipBuildingStep);

        public ICommand ResetBuildingStepCommand
        {
            get { return new DelegateCommand(() => ResetBuildingStep(true)); }
        }

        public ICommand ResetVocabularyStepCommand
        {
            get { return new DelegateCommand(() => ResetVocabularyStep(true)); }
        }

        public ICommand SkipVocabularyStepCommand => new DelegateCommand(SkipVocabularyStep);

        //public ICommand ResetIndexesStepCommand
        //{
        //   get { return new DelegateCommand(() => ResetIndexesStep(true)); }
        //}

        public ICommand SkipIndexesStepCommand => new DelegateCommand(SkipIndexesStep);

        public ICommand SkipPostprocessStepCommand => new DelegateCommand(SkipPostprocessStep);

        public ICommand ResetPostprocessStepCommand
        {
            get { return new DelegateCommand(() => ResetPostprocessStep(true)); }
        }

        #endregion

        #endregion

        #region Creation Step

        private void ResetDbCreationStep()
        {
            if (_buildingController == null) return;
            if (!DestinationCreated) return;
            if (DestinationSkipped) return;

            if (MessageBox.Show("All data will be lost, do you want to continue?", "Warning", MessageBoxButton.YesNo,
                    MessageBoxImage.Warning) == MessageBoxResult.Yes)
            {
                _buildingController.ResetDbCreationStep();
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
            _buildingController?.CreateTablesStep();
        }

        private void SkipDbCreationStep()
        {
            if (_buildingController == null) return;
            if (DestinationCreated) return;

            _buildingController.SkipDbCreationStep();
        }

        private void FillPostBuildTable()
        {
            if (_buildingController == null) return;
            if (DestinationCreated) return;

            _buildingController.FillPostBuildTables();
        }

        #endregion

        #region Chunks step

        private void ResetChunksCreationStep(bool showWarningDialog)
        {
            if (_buildingController == null) return;
            if (!ChunksCreated) return;
            if (ChunksSkipped) return;

            const string message = "Chunk data will be lost, do you want to continue?";
            if (!showWarningDialog ||
                MessageBox.Show(message, "Warning", MessageBoxButton.YesNo,
                    MessageBoxImage.Warning) == MessageBoxResult.Yes)
            {
                _buildingController.ResetChunksCreationStep();
            }
        }

        private void SkipChunksCreationStep()
        {
            if (_buildingController == null) return;
            if (ChunksCreated) return;

            _buildingController.SkipChunksCreationStep();
        }

        private void RestartChunksCreationStep()
        {
            if (_buildingController == null) return;
            if (ChunksCreated) return;

            _buildingController.RestartChunksCreationStep();
        }

        #endregion

        #region Lookup step

        private void ResetLookupCreationStep(bool showWarningDialog)
        {
            if (_buildingController == null) return;
            if (!LookupCreated) return;
            if (LookupSkipped) return;

            var message =
                "Following tables will be truncated: CARE_SITE, LOCATION, ORGANIZATION, PROVIDER, do you want to continue?";
            if (!showWarningDialog ||
                MessageBox.Show(message, "Warning", MessageBoxButton.YesNo,
                    MessageBoxImage.Warning) == MessageBoxResult.Yes)
            {
                _buildingController.ResetLookupCreationStep(!showWarningDialog);
            }
        }

        private void SkipLookupCreationStep()
        {
            if (_buildingController == null) return;
            if (LookupCreated) return;

            _buildingController.SkipLookupCreationStep();
        }

        #endregion

        #region Building step

        private void TruncateTables()
        {
            if (_buildingController == null) return;

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
                          "VISIT_DETAIL" + Environment.NewLine +
                          "LOCATION" + Environment.NewLine +
                          "ORGANIZATION" + Environment.NewLine +
                          "CARE_SITE" + Environment.NewLine +
                          "PROVIDER" + Environment.NewLine +
                          "PAYER_PLAN_PERIOD" + Environment.NewLine +
                          "DRUG_COST" + Environment.NewLine +
                          "PROCEDURE_COST" + Environment.NewLine +
                          "DEATH" + Environment.NewLine +
                          "COHORT" + Environment.NewLine +
                          "GetPregnancyEpisodes you want to continue?";
            if (MessageBox.Show(message, "Warning", MessageBoxButton.YesNo,
                    MessageBoxImage.Warning) == MessageBoxResult.Yes)
            {
                _buildingController.TruncateTables();
            }
        }

        private void TruncateWithoutLookupTables()
        {
            if (_buildingController == null) return;

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
                          "VISIT_DETAIL" + Environment.NewLine +
                          "PAYER_PLAN_PERIOD" + Environment.NewLine +
                          "DRUG_COST" + Environment.NewLine +
                          "PROCEDURE_COST" + Environment.NewLine +
                          "DEATH" + Environment.NewLine +
                          "COHORT" + Environment.NewLine +
                          "Do you want to continue?";
            if (MessageBox.Show(message, "Warning", MessageBoxButton.YesNo,
                    MessageBoxImage.Warning) == MessageBoxResult.Yes)
            {
                _buildingController.TruncateWithoutLookupTables();
            }
        }

        private void ResetBuildingStep(bool showWarningDialog)
        {
            if (_buildingController == null) return;
            //if (!BuildingStarted) return;
            //if (BuildingSkipped) return;

            var message = "All built data will be lost, do you want to continue?";
            if (!showWarningDialog ||
                MessageBox.Show(message, "Warning", MessageBoxButton.YesNo,
                    MessageBoxImage.Warning) == MessageBoxResult.Yes)
            {
                _buildingController.ResetBuildingStep(!showWarningDialog);
            }
        }

        private void SkipBuildingStep()
        {
            if (_buildingController == null) return;
            if (BuildingComplete) return;

            _buildingController.SkipBuildingStep();
        }

        #endregion

        #region Vocabulary step

        private void ResetVocabularyStep(bool showWarningDialog)
        {
            if (_buildingController == null) return;
            if (!VocabularyCopied) return;
            if (VocabularySkipped) return;

            var message = "Following tables will be dropped: CONCEPT, CONCEPT_ANCESTOR, CONCEPT_RELATIONSHIP, " +
                          Environment.NewLine +
                          "CONCEPT_SYNONYM, RELATIONSHIP, SOURCE_TO_CONCEPT_MAP, VOCABULARY, do you want to continue?";

            if (!showWarningDialog ||
                MessageBox.Show(message, "Warning", MessageBoxButton.YesNo,
                    MessageBoxImage.Warning) == MessageBoxResult.Yes)
            {
                _buildingController.ResetVocabularyStep(!showWarningDialog);
            }
        }

        private void SkipVocabularyStep()
        {
            if (_buildingController == null) return;
            if (VocabularyCopied) return;

            _buildingController.SkipVocabularyStep();
        }

        #endregion

        #region Indexes step

        //private void ResetIndexesStep(bool showWarningDialog)
        //{

        //}

        private void SkipIndexesStep()
        {
            if (_buildingController == null) return;
            if (IndexesCreated) return;

            _buildingController.SkipIndexesStep();
        }

        #endregion

        #region Postprocess step

        private void ResetPostprocessStep(bool showWarningDialog)
        {
            if (_buildingController == null) return;
            if (!PostprocessFinished) return;
            if (PostprocessSkipped) return;

            var message = "Postprocess results will be reset. Continue?";

            if (!showWarningDialog ||
                MessageBox.Show(message, "Warning", MessageBoxButton.YesNo,
                    MessageBoxImage.Warning) == MessageBoxResult.Yes)
            {
                _buildingController.ResetPostprocessStep();
            }
        }

        private void SkipPostprocessStep()
        {
            if (_buildingController == null) return;
            if (PostprocessFinished) return;

            _buildingController.SkipPostprocessStep();
        }

        #endregion

        private static bool IsSkipped(DateTime? start, DateTime? end)
        {
            return start.HasValue && end.HasValue && start.Value.Year == DateTime.MaxValue.Year &&
                   end.Value.Year == DateTime.MaxValue.Year;
        }

        public BuilderViewModel()
        {
            ButtonEnabled = true;
            SettingUnlocked = true;

            Settings.Initialize();

            SourceServer = Settings.Current.Building.SourceServer;
            SourceDb = Settings.Current.Building.SourceDb;
            SourceSchema = Settings.Current.Building.SourceSchema;
            SourceUser = Settings.Current.Building.SourceUser;
            SourcePswd = Settings.Current.Building.SourcePswd;

            CdmServer = Settings.Current.Building.CdmServer;
            CdmDb = Settings.Current.Building.CdmDb;
            CdmSchema = Settings.Current.Building.CdmSchema;
            CdmUser = Settings.Current.Building.CdmUser;
            CdmPswd = Settings.Current.Building.CdmPswd;

            VocabServer = Settings.Current.Building.VocabServer;
            VocabDb = Settings.Current.Building.VocabDb;
            VocabSchema = Settings.Current.Building.VocabSchema;
            VocabUser = Settings.Current.Building.VocabUser;
            VocabPswd = Settings.Current.Building.VocabPswd;

            _timer.Elapsed += OnTimer;
            _timer.Start();

            _timerUi.Elapsed += timerUI_Elapsed;
            _timerUi.Start();
        }

        void timerUI_Elapsed(object sender, System.Timers.ElapsedEventArgs e)
        {
            UpdateState();
        }

        public void UpdateState()
        {
            if (_buildingController == null) return;


            ButtonEnabled = _buildingController.CurrentState != BuilderState.Stopping;
            SettingUnlocked = !(_buildingController.CurrentState == BuilderState.Running ||
                                _buildingController.CurrentState == BuilderState.Stopping);

            if (PropertyChanged != null)
            {
                PropertyChanged(this, new PropertyChangedEventArgs("DestinationStarted"));
                PropertyChanged(this, new PropertyChangedEventArgs("DestinationWorking"));
                PropertyChanged(this, new PropertyChangedEventArgs("DestinationCreated"));
                PropertyChanged(this, new PropertyChangedEventArgs("DestinationInfo"));

                PropertyChanged(this, new PropertyChangedEventArgs("ChunksStarted"));
                PropertyChanged(this, new PropertyChangedEventArgs("ChunksWorking"));
                PropertyChanged(this, new PropertyChangedEventArgs("ChunksCreated"));
                PropertyChanged(this, new PropertyChangedEventArgs("ChunksInfo"));

                PropertyChanged(this, new PropertyChangedEventArgs("LookupStarted"));
                PropertyChanged(this, new PropertyChangedEventArgs("LookupWorking"));
                PropertyChanged(this, new PropertyChangedEventArgs("LookupCreated"));
                PropertyChanged(this, new PropertyChangedEventArgs("LookupInfo"));

                PropertyChanged(this, new PropertyChangedEventArgs("BuildingStarted"));
                PropertyChanged(this, new PropertyChangedEventArgs("BuildingWorking"));
                PropertyChanged(this, new PropertyChangedEventArgs("BuildingComplete"));
                PropertyChanged(this, new PropertyChangedEventArgs("BuildingInfo"));

                PropertyChanged(this, new PropertyChangedEventArgs("IndexesStarted"));
                PropertyChanged(this, new PropertyChangedEventArgs("IndexesWorking"));
                PropertyChanged(this, new PropertyChangedEventArgs("IndexesCreated"));
                PropertyChanged(this, new PropertyChangedEventArgs("IndexesInfo"));

                PropertyChanged(this, new PropertyChangedEventArgs("VocabularyStarted"));
                PropertyChanged(this, new PropertyChangedEventArgs("VocabularyWorking"));
                PropertyChanged(this, new PropertyChangedEventArgs("VocabularyCopied"));
                PropertyChanged(this, new PropertyChangedEventArgs("VocabularyInfo"));

                PropertyChanged(this, new PropertyChangedEventArgs("PostprocessStarted"));
                PropertyChanged(this, new PropertyChangedEventArgs("PostprocessWorking"));
                PropertyChanged(this, new PropertyChangedEventArgs("PostprocessFinished"));
                PropertyChanged(this, new PropertyChangedEventArgs("PostprocessInfo"));

                PropertyChanged(this, new PropertyChangedEventArgs("CurrentState"));
                PropertyChanged(this, new PropertyChangedEventArgs("PlayButtonChecked"));
                PropertyChanged(this, new PropertyChangedEventArgs("Errors"));
                PropertyChanged(this, new PropertyChangedEventArgs("ErrorsInfo"));
                PropertyChanged(this, new PropertyChangedEventArgs("OtherBuilderInfo"));
                PropertyChanged(this, new PropertyChangedEventArgs("Title"));
            }
        }

        private void SetBuilding()
        {
            if (_buildingController != null && (_buildingController.CurrentState == BuilderState.Running ||
                                               _buildingController.CurrentState == BuilderState.Stopping)) return;

            _timer.Stop();
            UpdateSettings();
            Settings.Current.Save(true);

            _buildingController = new BuildingController();
            //buildingController.Load();

            _timer.Start();
        }

        private void ResetSettings()
        {
            if (_buildingController == null)
                SetBuilding();

            UpdateState();
            _buildingController.ResetSettings();
            PropertyChanged(this, new PropertyChangedEventArgs("Reset"));
        }

        private void ResetAll()
        {
            ResetDbCreationStep();
            ResetChunksCreationStep(true);
            ResetLookupCreationStep(true);
            ResetBuildingStep(true);
            ResetVocabularyStep(true);
        }

        private void ResetErrors()
        {
            _buildingController.ResetErrors();
            PropertyChanged(this, new PropertyChangedEventArgs("Reset"));
        }

        private void Build()
        {
            _buildingController.Process();
        }

        public void Stop()
        {
            _buildingController?.Stop();
            UpdateSettings();
            Settings.Current.Save(true);
        }

        private void UpdateSettings()
        {
            //Settings.Settings.Current.MaxDegreeOfParallelism = 1;
            Settings.Current.BuilderFolder = AppDomain.CurrentDomain.BaseDirectory;
            //Settings.Settings.Current.Building.ChunkSize = 1000;

            Settings.Current.Building.SourceServer = SourceServer;
            Settings.Current.Building.SourceDb = SourceDb;
            Settings.Current.Building.SourceSchema = SourceSchema;
            Settings.Current.Building.SourceUser = SourceUser;
            Settings.Current.Building.SourcePswd = SourcePswd;

            Settings.Current.Building.CdmServer = CdmServer;
            Settings.Current.Building.CdmDb = CdmDb;
            Settings.Current.Building.CdmSchema = CdmSchema;
            Settings.Current.Building.CdmUser = CdmUser;
            Settings.Current.Building.CdmPswd = CdmPswd;

            Settings.Current.Building.VocabServer = VocabServer;
            Settings.Current.Building.VocabDb = VocabDb;
            Settings.Current.Building.VocabSchema = VocabSchema;
            Settings.Current.Building.VocabUser = VocabUser;
            Settings.Current.Building.VocabPswd = VocabPswd;
        }


        private void OnTimer(object sender, System.Timers.ElapsedEventArgs e)
        {
            if (_buildingController == null) return;

            _timer.Stop();
            _buildingController.Refresh();
            _timer.Start();
        }
    }
}
