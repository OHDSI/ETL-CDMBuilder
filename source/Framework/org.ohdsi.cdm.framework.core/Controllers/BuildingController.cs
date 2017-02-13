using System;
using System.Collections.Generic;
using System.Configuration;
using System.Globalization;
using System.IO;
using System.Threading;
using org.ohdsi.cdm.framework.core.Common.Services;
using org.ohdsi.cdm.framework.data.DbLayer;
using org.ohdsi.cdm.framework.entities.Builder;
using org.ohdsi.cdm.framework.shared.Enums;

namespace org.ohdsi.cdm.framework.core.Controllers
{
   public class BuildingController
   {
      #region Variables

      private readonly BuilderController builderController;

      #endregion

      #region Properties

      public Building Building { get; private set; }

      public Builder Builder
      {
         get { return builderController.Builder; }
      }

      public int GetChunksCount
      {
         get { return builderController.GetChunksCount; }
      }

      public int GetCompleteChunksCount
      {
         get { return builderController.GetCompleteChunksCount; }
      }

      public IEnumerable<string> GetOtherBuilderInfo
      {
         get { return builderController.GetOtherBuilderInfo(); }
      }

      #endregion

      #region Constructor

      public BuildingController()
      {
         builderController = new BuilderController();
         Building = new Building();
      }

      #endregion

      #region Methods

      public void Process()
      {
         if (Builder.State != BuilderState.Stopping && Builder.State != BuilderState.Running)
         {
            builderController.UpdateState(BuilderState.Running);
         }
         else
         {
            Stop();
         }
      }

      public void Stop()
      {
         builderController.UpdateState(BuilderState.Stopping);
      }

      private void TryToStop()
      {
         if (builderController == null) return;
         if (builderController.Builder == null) return;


         builderController.UpdateState(BuilderState.Stopped);
      }

      public void Refresh()
      {
         builderController.RefreshState();
         Load();

         if (Building == null) return;

         if (Builder.State == BuilderState.Stopping)
            TryToStop();

         if (Builder.State == BuilderState.Running)
         {
            if (Settings.Current.Builder.IsLead)
            {
               CreateDestination();
               CreateChunks();
            }

            Build();

            if (Settings.Current.Builder.IsLead && builderController.AllChunksComplete)
            {
               FillPostBuildTables();
               CopyVocabulary();
               CreateIndexes();
               RunAchilles();

               if (Builder.State == BuilderState.Running)
                  builderController.UpdateState(BuilderState.Stopped);
            }

            if (Builder.State == BuilderState.Running)
            {
               if (!Settings.Current.Builder.IsLead && Building.ChunksCreated && builderController.AllChunksStarted)
                  builderController.UpdateState(BuilderState.Stopped);
            }
         }
      }

      private void Load()
      {
         var dbBuilding = new DbBuilding(Settings.Current.Building.BuilderConnectionString);
         foreach (var dataReader in dbBuilding.Load(Settings.Current.Building.Id.Value))
         {
            Building.SetFrom(dataReader);
         }

         if (!Building.Id.HasValue)
         {
            Building.Id = Settings.Current.Building.Id.Value;
            dbBuilding.Create(Settings.Current.Building.Id.Value);
         }
      }

      private void CreateDestination()
      {
         if (Building.DestinationCreated) return;

         UpdateDate("CreateDestinationDbStart");
         builderController.CreateDestination();
         UpdateDate("CreateDestinationDbEnd");
      }

      private void CreateChunks()
      {
         if (Building.ChunksCreated) return;

         UpdateDate("CreateChunksStart");
         builderController.CreateChunks();
         UpdateDate("CreateChunksEnd");
      }

      private void Build()
      {
         if (!Settings.Current.Builder.IsLead && !Building.LookupCreated) return;
         if (Building.BuildingComplete) return;
         if (Builder.State == BuilderState.Error) return;

         using (
            var vocabHost = ServicesManager.CreateServiceHost<VocabularyService>(typeof (IVocabularyService),
               "VocabularyServiceEndpoint"))
         using (
            var redshiftHost = ServicesManager.CreateServiceHost<RedshiftService>(typeof (IRedshiftService),
               "RedshiftServiceEndpoint"))
         {
            ServicesManager.StartSaver();
            if (!Building.LookupCreated)
               UpdateDate("CreateLookupStart");

            builderController.CreateLookup(Building.LookupCreated);

            if (!Building.LookupCreated)
               UpdateDate("CreateLookupEnd");

            if (Building.LookupCreated)
            {
               if (!Building.BuildingStarted)
               {
                  var start = UpdateDate("BuildingStart");
                  AddMetric(Metrics.BuildTimestamp, "", 0, start);
               }

               builderController.Build();

               while (!builderController.AllChunksComplete)
               {
                  if (Builder.State == BuilderState.Error)
                     break;

                  Thread.Sleep(1000);
               }

               if (Builder.State != BuilderState.Error)
               {
                  UpdateDate("BuildingEnd");
                  //AddMetric(Metrics.BuildTimestamp, Building.BuildingStart, Building.BuildingEnd, null);

                  var elapsedMilliseconds = Building.BuildingEnd.Value.Subtract(Building.BuildingStart.Value).TotalMilliseconds;
                  var timePerPatient = elapsedMilliseconds / builderController.TotalPersonCount;

                  AddMetric(Metrics.BuildTimestamp, "", Building.BuildingEnd.Value.Subtract(Building.BuildingStart.Value).TotalMinutes, Building.BuildingEnd);
                  AddMetric(Metrics.TimePerPatient, null, null, timePerPatient);
               }
               
               ServicesManager.StopSaver();

               vocabHost.Close();
               redshiftHost.Close();
            }
         }
      }

      private void CopyVocabulary()
      {
         if (!Building.BuildingComplete) return;
         if (Building.VocabularyCopied) return;

         var start = UpdateDate("CopyVocabularyStart");
         AddMetric(Metrics.VocabularyCopyTimestamp, "", 0, start);
         builderController.CopyVocabulary();
         var end = UpdateDate("CopyVocabularyEnd");

         //AddMetric(Metrics.VocabularyCopyTimestamp, start, end, null);
         AddMetric(Metrics.VocabularyCopyTimestamp, "", end.Value.Subtract(start.Value).TotalMinutes, end);
      }

      private void FillPostBuildTables()
      {

         var dbDestination = new DbDestination(Settings.Current.Building.DestinationConnectionString, Settings.Current.Building.DestinationSchemaName);

         if (!string.IsNullOrEmpty(Settings.Current.Building.CdmSourceScript))
            dbDestination.FillPostBuildTable(Settings.Current.Building.CdmSourceScript);

         if (!string.IsNullOrEmpty(Settings.Current.Building.CohortDefinitionScript))
            dbDestination.FillPostBuildTable(Settings.Current.Building.CohortDefinitionScript);
      }

      private void CreateIndexes()
      {
         if (!Building.VocabularyCopied) return;
         if (Building.IndexesCreated) return;

         UpdateDate("CreateIndexesStart");
         builderController.CreateIndexes();
         UpdateDate("CreateIndexesEnd");
      }

      private void RunAchilles()
      {
         if (Building.AchillesFinished) return;

         var start = UpdateDate("AchillesStart");
         AddMetric(Metrics.AchillesTimestamp, "", 0, start);
         builderController.RunAchilles();
         var end = UpdateDate("AchillesEnd");
         AddMetric(Metrics.AchillesTimestamp, "", end.Value.Subtract(start.Value).TotalMinutes, end);

         //AddMetric(Metrics.AchillesTimestamp, start, end, null);
      }

      private static void AddMetric(Metrics metric, DateTime? start, DateTime? end, double? valueAsNumber)
      {
         int loadId;
         int.TryParse(ConfigurationManager.AppSettings["loadId"], out loadId);
         string cdmProcessingConnectionStrings = null;
         if (ConfigurationManager.ConnectionStrings["CDM_Processing"] != null)
            cdmProcessingConnectionStrings = ConfigurationManager.ConnectionStrings["CDM_Processing"].ConnectionString;

         if (loadId <= 0 || string.IsNullOrEmpty(cdmProcessingConnectionStrings))
            return;

         var dbProcessing = new DBProcessing(cdmProcessingConnectionStrings);

         if (start.HasValue && end.HasValue)
         {
            var elapsedTime = end.Value.Subtract(start.Value);
            var valueAsString = string.Format("{0}:{1}:{2}", (int) elapsedTime.TotalHours,
               elapsedTime.Minutes > 9
                  ? elapsedTime.Minutes.ToString(CultureInfo.InvariantCulture)
                  : "0" + elapsedTime.Minutes,
               elapsedTime.Seconds > 9
                  ? elapsedTime.Seconds.ToString(CultureInfo.InvariantCulture)
                  : "0" + elapsedTime.Seconds);

            dbProcessing.AddMetric(loadId, metric, valueAsString, null, DateTime.Now);
         }

         if (valueAsNumber.HasValue)
         {
            dbProcessing.AddMetric(loadId, metric, "", valueAsNumber, DateTime.Now);
         }
      }

      public static void AddMetric(Metrics metric, string valueAsString, double? valueAsNumber, DateTime? valueAsDateTime)
      {
         int loadId;
         int.TryParse(ConfigurationManager.AppSettings["loadId"], out loadId);
         string cdmProcessingConnectionStrings = null;
         if (ConfigurationManager.ConnectionStrings["CDM_Processing"] != null)
            cdmProcessingConnectionStrings = ConfigurationManager.ConnectionStrings["CDM_Processing"].ConnectionString;

         if (loadId <= 0 || string.IsNullOrEmpty(cdmProcessingConnectionStrings))
            return;

         var dbProcessing = new DBProcessing(cdmProcessingConnectionStrings);

         dbProcessing.InsertMetric(loadId, metric, valueAsString, valueAsNumber, valueAsDateTime);
      }

      private DateTime? UpdateDate(string fieldName)
      {
         if (Builder.State == BuilderState.Error) return null;

         var time = DateTime.Now;
         typeof (Building).GetProperty(fieldName).SetValue(Building, time, null);
         var dbBuilding = new DbBuilding(Settings.Current.Building.BuilderConnectionString);
         dbBuilding.SetFieldToNowDate(Building.Id.Value, fieldName);

         return time;
      }

      private void UpdateDate(string fieldName, DateTime? time)
      {
         if (time.HasValue && time.Value.Year == DateTime.MaxValue.Year)
         {
            var currentValue = typeof (Building).GetProperty(fieldName).GetValue(Building, null);
            if (currentValue is DateTime)
            {
               if (((DateTime) currentValue).Year == DateTime.MaxValue.Year)
               {
                  time = null;
               }
            }
         }

         typeof (Building).GetProperty(fieldName).SetValue(Building, time, null);
         var dbBuilding = new DbBuilding(Settings.Current.Building.BuilderConnectionString);
         dbBuilding.SetFieldTo(Building.Id.Value, fieldName, time);
      }

      public IEnumerable<string> GetErrors()
      {
         //if (Builder.State != BuilderState.Error) yield break;

         var log = new DbLog(Settings.Current.Building.BuilderConnectionString);
         foreach (var error in log.GetErrors(Settings.Current.Building.Id.Value))
         {
            yield return error;
         }
      }

      public void ResetDbCreationStep()
      {
         UpdateDate("CreateDestinationDbStart", null);
         builderController.DropDestination();
         UpdateDate("CreateDestinationDbEnd", null);
      }

      public void CreateTablesStep()
      {
         UpdateDate("CreateDestinationDbStart", DateTime.Now);
         builderController.CreateTablesStep();
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

      public void ResetChunksCreationStep()
      {
         UpdateDate("CreateChunksStart", null);
         UpdateDate("CreateChunksEnd", null);
      }

      public void ResetLookupCreationStep(bool onlyDataUpdate)
      {
         UpdateDate("CreateLookupStart", null);
         if (!onlyDataUpdate)
            builderController.TruncateLookup();
         UpdateDate("CreateLookupEnd", null);
      }

      public void SkipLookupCreationStep()
      {
         UpdateDate("CreateLookupStart", DateTime.MaxValue);
         UpdateDate("CreateLookupEnd", DateTime.MaxValue);
      }

      public void ResetBuildingStep(bool onlyDataUpdate)
      {
         UpdateDate("BuildingStart", null);
         if (!onlyDataUpdate)
         {
            builderController.TruncateWithoutLookupTables();
            builderController.ResetChunk();
            builderController.CleanupS3();
         }
         UpdateDate("BuildingEnd", null);
      }

      public void SkipBuildingStep()
      {
         UpdateDate("BuildingStart", DateTime.MaxValue);
         UpdateDate("BuildingEnd", DateTime.MaxValue);
      }

      public void ResetVocabularyStep(bool onlyDataUpdate)
      {
         UpdateDate("CopyVocabularyStart", null);
         if (!onlyDataUpdate)
            builderController.ResetVocabularyStep();
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

      public void ResetAchillesStep()
      {
         UpdateDate("AchillesStart", null);
         UpdateDate("AchillesEnd", null);
      }

      public void SkipAchillesStep()
      {
         UpdateDate("AchillesStart", DateTime.MaxValue);
         UpdateDate("AchillesEnd", DateTime.MaxValue);
      }

      public void ResetNotFinishedChunks()
      {
         builderController.ResetNotFinishedChunks();
      }

      public void TruncateTables()
      {
         builderController.TruncateTables();
      }

      public void TruncateWithoutLookupTables()
      {
         builderController.TruncateWithoutLookupTables();
      }

      public void ResetSettings()
      {
         var setting = new DbBuildingSettings(Settings.Current.Building.BuilderConnectionString);
         setting.Reset();

         var builder = new DbBuilder(Settings.Current.Building.BuilderConnectionString);
         if (Settings.Current.Builder.Id.HasValue)
            builder.Reset(Settings.Current.Builder.Id.Value);
      }

      public void ResetErrors()
      {
         var log = new DbLog(Settings.Current.Building.BuilderConnectionString);
         log.Reset(Settings.Current.Building.Id.Value);

         if (Builder.State == BuilderState.Error)
            builderController.UpdateState(BuilderState.Stopped);
      }

      #endregion
   }
}
