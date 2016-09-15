using System.Collections.Generic;
using System.Data;
using System.Data.Odbc;
using System.Data.SqlClient;
using System.Security.Permissions;
using System.Windows;
using org.ohdsi.cdm.framework.core;
using org.ohdsi.cdm.framework.data.DbLayer;
using org.ohdsi.cdm.framework.shared.Extensions;

namespace org.ohdsi.cdm.presentation.buildingmanager
{
   /// <summary>
   /// Interaction logic for SettingsWindow.xaml
   /// </summary>
   public partial class SettingsWindow : Window
   {
      public int? CurrentBuildingId { get; private set; }

      public SettingsWindow()
      {
         InitializeComponent();

         Loaded += SettingsWindow_Loaded;
      }

      void SettingsWindow_Loaded(object sender, RoutedEventArgs e)
      {
         settingsList.Items.Clear();
         var settings = new DbBuildingSettings(Settings.Current.Building.BuilderConnectionString);

         foreach (var reader in settings.GetList())
         {
            var buildingId = reader.GetInt("BuildingId");
            var source = new OdbcConnectionStringBuilder(reader.GetString("SourceConnectionString"));
            var destination = new OdbcConnectionStringBuilder(reader.GetString("DestinationConnectionString"));
            var vendor = reader.GetString("Vendor");

            var title = string.Format("{0}, {1}.{2} → {3}.{4}", vendor, source["server"], source["database"],
               destination["server"], destination["database"]);

            settingsList.Items.Add(new KeyValuePair<int, string>(buildingId.Value, title));
         }
      }

      private void ButtonOk_OnClick(object sender, RoutedEventArgs e)
      {
         if (settingsList.SelectedItem != null)
         {
            var result = (KeyValuePair<int, string>) settingsList.SelectedItem;
            CurrentBuildingId = result.Key;
         }

         DialogResult = true;
         this.Close();
      }

      private void ButtonCancel_OnClick(object sender, RoutedEventArgs e)
      {
         DialogResult = false;
         this.Close();
      }
   }
}
