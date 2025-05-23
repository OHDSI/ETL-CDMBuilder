using org.ohdsi.cdm.framework.common.Enums;
using org.ohdsi.cdm.framework.common.Lookups;
using org.ohdsi.cdm.framework.desktop.Databases;
using org.ohdsi.cdm.framework.desktop.Enums;
using System;
using System.Collections.Generic;
using System.Threading;
using static org.ohdsi.cdm.presentation.builder.Controllers.BuilderController;

namespace org.ohdsi.cdm.presentation.builder.Controllers
{
    public class BuildingController
    {
        #region Variables

        private readonly BuilderController _builderController;

        #endregion

        #region Properties

        public int ChunksCount => Settings.Current.Building.ChunksCount;

        public int CompleteChunksCount => _builderController.CompleteChunksCount;

        public BuilderState CurrentState => _builderController.CurrentState;

        #endregion

        #region Constructor

        public BuildingController(string etlLibraryPath)
        {
            _builderController = new BuilderController(etlLibraryPath);
        }

        #endregion

        #region Methods

        public void Process()
        {
            if (_builderController.CurrentState != BuilderState.Stopping && _builderController.CurrentState != BuilderState.Running)
            {
                _builderController.CurrentState = BuilderState.Running;
            }
            else
            {
                Stop();
            }
        }

        public void Stop()
        {
            if (_builderController.CurrentState != BuilderState.Stopped)
                _builderController.CurrentState = BuilderState.Stopping;
        }

        private void TryToStop()
        {
            if (_builderController == null) return;

            _builderController.CurrentState = BuilderState.Stopped;
        }

        public void Refresh()
        {
            if (Settings.Current.Building.BuildingState == null) return;

            if (_builderController.CurrentState == BuilderState.Stopping)
                TryToStop();

            if (_builderController.CurrentState == BuilderState.Running)
            {
                Console.WriteLine("\r\nFilling vocabulary");
                var vocabulary = new Vocabulary();
                vocabulary.Fill(false, false);

                //remove if after implementing ddl for other engines
                if (Settings.Current.Building.CdmEngine is MssqlDatabaseEngine)
                    CreateDestination();
                else
                    Console.WriteLine("\r\n!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!" +
                        "\r\nOnly DDL for MSSQL is supported for now. DDL for databases on other engines must have been executed manually before" +
                        "\r\n!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\r\n");

                CreateLookup(vocabulary);
                Build(vocabulary);
            }
        }

        private void CreateDestination()
        {
            if (Settings.Current.Building.BuildingState.DestinationCreated) return;

            UpdateDate("CreateDestinationDbStart");
            _builderController.CreateDestination();
            UpdateDate("CreateDestinationDbEnd");
        }

        private void CreateLookup(IVocabulary vocabulary)
        {
            if (Settings.Current.Building.BuildingState.LookupCreated) return;

            UpdateDate("CreateLookupStart");
            _builderController.CreateLookup(vocabulary, Settings.Current.Building.CdmSchema);
            UpdateDate("CreateLookupEnd");
        }

        private bool Build(IVocabulary vocabulary)
        {
            while (!Settings.Current.Building.BuildingState.LookupCreated)
            {
                if (_builderController.CurrentState == BuilderState.Error)
                    return false;

                Thread.Sleep(1000);
            }

            var allChunksComplete = false;

            if (Settings.Current.Building.BuildingState.BuildingComplete) return true;
            if (_builderController.CurrentState == BuilderState.Error) return false;


            if (Settings.Current.Building.BuildingState.LookupCreated)
            {
                if (!Settings.Current.Building.BuildingState.BuildingStarted)
                {
                    UpdateDate("BuildingStart");
                }

                var chunkSchema = Settings.Current.Building.SourceSchema;
                _builderController.Build(vocabulary, chunkSchema);

                if (_builderController.CurrentState != BuilderState.Error)
                {
                    allChunksComplete = true;
                    UpdateDate("BuildingEnd");
                }

            }
            return allChunksComplete;
        }

        public void FillPostBuildTables()
        {
        }

        private DateTime? UpdateDate(string fieldName)
        {
            if (_builderController.CurrentState == BuilderState.Error) return null;

            var time = DateTime.Now;
            typeof(Building).GetProperty(fieldName).SetValue(Settings.Current.Building.BuildingState, time, null);

            return time;
        }

        private void UpdateDate(string fieldName, DateTime? time)
        {
            if (time.HasValue && time.Value.Year == DateTime.MaxValue.Year)
            {
                var currentValue = typeof(Building).GetProperty(fieldName).GetValue(Settings.Current.Building.BuildingState, null);
                if (currentValue is DateTime)
                {
                    if (((DateTime)currentValue).Year == DateTime.MaxValue.Year)
                    {
                        time = null;
                    }
                }
            }

            typeof(Building).GetProperty(fieldName).SetValue(Settings.Current.Building.BuildingState, time, null);

            Settings.Current.Save(true);
        }

        public IEnumerable<string> GetErrors()
        {
            return Logger.GetErrors();
        }

        public void ResetDbCreationStep()
        {
            _builderController.DropDestination();
            UpdateDate("CreateDestinationDbStart", null);
            UpdateDate("CreateDestinationDbEnd", null);
        }

        public void CreateTablesStep()
        {
            _builderController.CreateTablesStep();
            UpdateDate("CreateDestinationDbStart", DateTime.Now);
            UpdateDate("CreateDestinationDbEnd", DateTime.Now);
        }

        public void SkipDbCreationStep()
        {
            UpdateDate("CreateDestinationDbStart", DateTime.MaxValue);
            UpdateDate("CreateDestinationDbEnd", DateTime.MaxValue);
        }

        public void SkipChunksCreationStep()
        {
            UpdateDate("CreateChunksStart", DateTime.MaxValue);
            UpdateDate("CreateChunksEnd", DateTime.MaxValue);
        }

        public void RestartChunksCreationStep()
        {
            //CreateChunks(true);
        }

        public void ResetChunksCreationStep()
        {
            UpdateDate("CreateChunksStart", null);
            UpdateDate("CreateChunksEnd", null);
        }

        public void ResetLookupCreationStep(bool onlyDataUpdate)
        {
            if (!onlyDataUpdate)
                _builderController.TruncateLookup();

            UpdateDate("CreateLookupStart", null);
            UpdateDate("CreateLookupEnd", null);
        }

        public void SkipLookupCreationStep()
        {
            UpdateDate("CreateLookupStart", DateTime.MaxValue);
            UpdateDate("CreateLookupEnd", DateTime.MaxValue);
        }

        public void ResetBuildingStep(bool onlyDataUpdate)
        {
            if (!onlyDataUpdate)
            {
                _builderController.TruncateWithoutLookupTables();
            }

            UpdateDate("BuildingStart", null);
            UpdateDate("BuildingEnd", null);
            Settings.Current.Building.CompletedChunkIds = new List<int>();
            Settings.Current.Building.ChunksCount = 0;
        }

        public void SkipBuildingStep()
        {
            UpdateDate("BuildingStart", DateTime.MaxValue);
            UpdateDate("BuildingEnd", DateTime.MaxValue);
        }

        public void ResetVocabularyStep(bool onlyDataUpdate)
        {
            if (!onlyDataUpdate)
                _builderController.ResetVocabularyStep();

            UpdateDate("CopyVocabularyStart", null);
            UpdateDate("CopyVocabularyEnd", null);
        }

        public void SkipVocabularyStep()
        {
            UpdateDate("CopyVocabularyStart", DateTime.MaxValue);
            UpdateDate("CopyVocabularyEnd", DateTime.MaxValue);
        }

        public void SkipIndexesStep()
        {
            UpdateDate("CreateIndexesStart", DateTime.MaxValue);
            UpdateDate("CreateIndexesEnd", DateTime.MaxValue);
        }

        public void ResetPostprocessStep()
        {
            UpdateDate("PostprocessStart", null);
            UpdateDate("PostprocessEnd", null);
        }

        public void SkipPostprocessStep()
        {
            UpdateDate("PostprocessStart", DateTime.MaxValue);
            UpdateDate("PostprocessEnd", DateTime.MaxValue);
        }

        public void TruncateTables()
        {
            _builderController.TruncateTables();
        }

        public void TruncateWithoutLookupTables()
        {
            _builderController.TruncateWithoutLookupTables();
        }

        public void ResetSettings()
        {
            Settings.Current.Building.Reset();
            Settings.Current.Building.Save(true);
        }

        public void ResetErrors()
        {
            Logger.ResetErrors();
        }

        #endregion
    }
}
