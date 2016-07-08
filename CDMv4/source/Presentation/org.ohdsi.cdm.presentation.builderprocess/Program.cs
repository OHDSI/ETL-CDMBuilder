using System;
using System.Collections.Generic;
using System.Configuration;
using System.Threading.Tasks;
using org.ohdsi.cdm.builders.cprd;
using org.ohdsi.cdm.builders.drugera;
using org.ohdsi.cdm.builders.nhanes;
using org.ohdsi.cdm.builders.optum;
using org.ohdsi.cdm.builders.premier;
using org.ohdsi.cdm.builders.truven;
using org.ohdsi.cdm.framework.core;
using org.ohdsi.cdm.framework.core.Base;
using org.ohdsi.cdm.framework.core.Controllers;
using org.ohdsi.cdm.framework.data.DbLayer;
using org.ohdsi.cdm.framework.entities.Builder;
using org.ohdsi.cdm.framework.shared.Enums;

namespace org.ohdsi.cdm.presentation.builderprocess
{
   class Program
   {
      private static readonly List<Task> tasks = new List<Task>();

      static void Main(string[] inputArgs)
      {
         if (inputArgs.Length > 0)
         {
            Settings.Initialize(string.Join(" ", inputArgs), Environment.MachineName);
         }
         else
         {
            Settings.Initialize(ConfigurationManager.ConnectionStrings["Builder"].ConnectionString, Environment.MachineName);
         }
         
         var builderController = new BuilderController();
         try
         {
            var vocabulary = new Vocabulary();
            vocabulary.Initialize();

            Build(builderController);
            Task.WaitAll(tasks.ToArray());
         }
         catch (Exception e)
         {
            Logger.WriteError(e);

            builderController.UpdateState(BuilderState.Error);
         }
      }

      private static void Build(BuilderController builderController)
      {
         var dbChunk = new DbChunk(Settings.Current.Building.BuilderConnectionString);
         int? chunkId = null;
         while (true)
         {
            try
            {
               builderController.RefreshState();
               if (builderController.Builder.State == BuilderState.Stopping)
                  break;

               if (builderController.Builder.State == BuilderState.Stopped)
                  break;

               if (builderController.Builder.State == BuilderState.Error)
                  break;

               if (builderController.Builder.State == BuilderState.Unknown || builderController.Builder.State == BuilderState.Idle)
                  continue;


               chunkId = dbChunk.TakeChunk(Settings.Current.Building.Id.Value);
               if (!chunkId.HasValue) break;

               var builder = new ChunkBuilder(new ChunkData { Id = chunkId.Value }, GetBuilderType(Settings.Current.Building.Vendor));
               var loaded_chunk = builder.Load();
               var built_chunk = loaded_chunk.Build();
               var task = built_chunk.Save();
               tasks.Add(task);
            }
            catch (Exception e)
            {
               if (chunkId.HasValue)
                  Logger.WriteError(chunkId, e);
               else
                  Logger.Write(null, Settings.Current.Building.Id.Value, null, LogMessageTypes.Error, Logger.CreateExceptionString(e));


               builderController.UpdateState(BuilderState.Error);
            }
         }
      }

      private static Type GetBuilderType(Vendors vendor)
      {
         switch (vendor)
         {
            case Vendors.Truven:
               return typeof(TruvenPersonBuilder);

            case Vendors.Optum:
               return typeof(OptumPersonBuilder);

            case Vendors.Cprd:
               return typeof(CprdPersonBuilder);

            case Vendors.Premier:
               return typeof(PremierPersonBuilder);

            case Vendors.DrugEra:
               return typeof(DrugEraPersonBuilder);

            case Vendors.Nhanes:
               return typeof(NhanesPersonBuilder);

         }

         return typeof(PersonBuilder);
      }
   }
}
