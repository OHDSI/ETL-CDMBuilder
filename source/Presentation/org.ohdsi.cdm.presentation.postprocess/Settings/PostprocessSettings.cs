using System;
using System.Collections.Generic;
using System.Linq;
using org.ohdsi.cdm.framework.core;
using org.ohdsi.cdm.framework.data.DbLayer;
using org.ohdsi.cdm.framework.shared.Enums;
using org.ohdsi.cdm.framework.shared.Extensions;

namespace org.ohdsi.cdm.presentation.postprocess
{
   public class PostprocessSettings
   {
      public List<PostprocessSetting> All { get; private set; }
      public void Load()
      {
         All = new List<PostprocessSetting>();
         var dbPostprocess = new DbPostprocessSettings(Settings.Current.Building.BuilderConnectionString);
         foreach (var reader in dbPostprocess.Load())
         {
            All.Add(new PostprocessSetting
            {
               LoadId = reader.GetInt("LoadId"),
               Vendor = reader.GetString("Vendor"),
               Name = reader.GetString("Name"),
               Value = reader.GetString("Value")
            });
         }
      }

      public string GetSettingValue(Vendors vendor, int loadId, PostprocessSettingName settingName)
      {
         string result = null;

         var commonSetting = All.FirstOrDefault(s => string.IsNullOrEmpty(s.Vendor) && !s.LoadId.HasValue && String.Equals(s.Name, settingName.ToString(), StringComparison.CurrentCultureIgnoreCase));
         if (commonSetting != null)
            result = commonSetting.Value;

         var vendorSetting = All.FirstOrDefault(s => s.Vendor == vendor.ToString() && !s.LoadId.HasValue && String.Equals(s.Name, settingName.ToString(), StringComparison.CurrentCultureIgnoreCase));
         if (vendorSetting != null)
            result = vendorSetting.Value;

         var loadIdSetting = All.FirstOrDefault(s => s.LoadId.HasValue && s.LoadId == loadId && String.Equals(s.Name, settingName.ToString(), StringComparison.CurrentCultureIgnoreCase));
         if (loadIdSetting != null)
            result = loadIdSetting.Value;

         return result;
      }
   }
}
