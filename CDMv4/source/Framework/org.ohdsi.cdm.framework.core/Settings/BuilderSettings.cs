using System.Data;
using org.ohdsi.cdm.framework.data.DbLayer;
using org.ohdsi.cdm.framework.shared.Extensions;

namespace org.ohdsi.cdm.framework.core
{
   public class BuilderSettings
   {
      #region Variables

      private readonly DbBuilder dbBuilder;
      #endregion

      #region Properties

      public int? Id { get; private set; }

      public int? BuildingId { get; set; }
      public int MaxDegreeOfParallelism { get; set; }
      public int BatchSize { get; set; }
      public string Folder { get; set; }
      public string MachineName { get; private set; }
      
      public bool IsLead { get; private set; }
      public bool IsNew { get; private set; }
      #endregion

      #region Constructor
      public BuilderSettings(string machineName)
      {
         MachineName = machineName;
         dbBuilder = new DbBuilder(Settings.Current.Building.BuilderConnectionString);
      }
      #endregion

      #region Methods
      private void SetFrom(IDataReader reader)
      {
         Id = reader.GetInt("Id").Value;

         BuildingId = reader.GetInt("BuildingId");
         MaxDegreeOfParallelism = reader.GetInt("MaxDegreeOfParallelism").Value;
         BatchSize = reader.GetInt("BatchSize").Value;
         Folder = reader.GetString("Folder");
         IsNew = false;
      }

      public void Load()
      {
         foreach (var dataReader in dbBuilder.LoadSettings(MachineName))
         {
            SetFrom(dataReader);
         }

         if (!Id.HasValue)
         {
            Id = dbBuilder.CreateSettings(MachineName, Folder, MaxDegreeOfParallelism, BatchSize);
            IsNew = true;
         }
      }

      public void Save()
      {
         dbBuilder.UpdateSettings(MachineName, BuildingId.Value, Folder, MaxDegreeOfParallelism, BatchSize);
         IsLead = dbBuilder.IsLead(Id.Value, BuildingId.Value);
      }
      #endregion
   }
}
