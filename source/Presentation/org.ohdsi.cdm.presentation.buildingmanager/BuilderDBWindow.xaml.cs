using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Windows;
using org.ohdsi.cdm.framework.core;
using org.ohdsi.cdm.framework.shared.Helpers;

namespace org.ohdsi.cdm.presentation.buildingmanager
{
   /// <summary>
   /// Interaction logic for SettingsWindow.xaml
   /// </summary>
   public partial class BuilderDBWindow : Window
   {
      public BuilderDBWindow()
      {
         InitializeComponent();
      }

      private void ButtonOk_OnClick(object sender, RoutedEventArgs e)
      {
         try
         {
            var sqlConnectionStringBuilder = new SqlConnectionStringBuilder(builderConnection.Text);
            var builderDb = sqlConnectionStringBuilder["Database"];
            sqlConnectionStringBuilder["Database"] = "master";
            using (var connection = SqlConnectionHelper.OpenMSSQLConnection(sqlConnectionStringBuilder.ConnectionString))
            {
               using (var command = new SqlCommand("create database " + builderDb, connection))
               {
                  command.ExecuteNonQuery();
               }

               using (var command = new SqlCommand(string.Format("ALTER DATABASE {0} SET RECOVERY Simple", builderDb), connection))
               {
                  command.ExecuteNonQuery();
               }
            }

            using (var connection = SqlConnectionHelper.OpenMSSQLConnection(builderConnection.Text))
            {
               foreach (var subQuery in buildingmanager.Resources.Resources.BuilderDbScript.Split(new[] {"\r\nGO"}, StringSplitOptions.None))
               {
                  if (string.IsNullOrEmpty(subQuery)) continue;

                  using (var command = new SqlCommand(subQuery, connection))
                  {
                     command.ExecuteNonQuery();
                  }
               }
            }

            var config = ConfigurationManager.OpenExeConfiguration(ConfigurationUserLevel.None);
            if (config.ConnectionStrings.ConnectionStrings["Builder"] == null)
            {
               config.ConnectionStrings.ConnectionStrings.Add(new ConnectionStringSettings("Builder", builderConnection.Text));
               
            }
            else
            {
               config.ConnectionStrings.ConnectionStrings["Builder"].ConnectionString = builderConnection.Text;
            }

            config.Save(ConfigurationSaveMode.Modified);
            MessageBox.Show("Database created successfully", "Done", MessageBoxButton.OK, MessageBoxImage.None);

            DialogResult = true;
            this.Close();
         }
         catch (Exception ex)
         {
            MessageBox.Show(Logger.CreateExceptionString(ex), "Error", MessageBoxButton.OK, MessageBoxImage.Exclamation);
            DialogResult = false;
            this.Close();
         }
      }

      private void ButtonCancel_OnClick(object sender, RoutedEventArgs e)
      {
         DialogResult = false;
         this.Close();
      }
   }
}
