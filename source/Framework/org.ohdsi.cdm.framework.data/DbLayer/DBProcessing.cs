using System;
using System.Data;
using System.Data.SqlClient;
using org.ohdsi.cdm.framework.shared.Enums;
using org.ohdsi.cdm.framework.shared.Helpers;

namespace org.ohdsi.cdm.framework.data.DbLayer
{
   public class DBProcessing
   {
      private readonly string connectionString;

      public DBProcessing(string connectionString)
      {
         this.connectionString = connectionString;
      }

      private int GetResultId(int loadId, Metrics metric)
      {
         const string query =
            "SELECT ResultId FROM Result WHERE LoadId = @loadId and MetricId = @metricId";
         using (var connection = SqlConnectionHelper.OpenMSSQLConnection(connectionString))
         using (var cmd = new SqlCommand(query, connection) {CommandTimeout = 0})
         {
            cmd.Parameters.Add("@loadId", SqlDbType.Int);
            cmd.Parameters["@loadId"].Value = loadId;

            cmd.Parameters.Add("@metricId", SqlDbType.Int);
            cmd.Parameters["@metricId"].Value = (int)metric;

            return Convert.ToInt32(cmd.ExecuteScalar());
         }
      }

      public void AddMetric(int loadId, Metrics metric, string valueAsString, double? valueAsNumber,
         DateTime? valueAsDateTime)
      {
         var resultId  = GetResultId(loadId, metric);

         if(resultId > 0)
            UpdateMetric(resultId, valueAsString, valueAsNumber, valueAsDateTime);
         else
            InsertMetric(loadId, metric, valueAsString, valueAsNumber, valueAsDateTime);
      }

      public void InsertMetric(int loadId, Metrics metric, string valueAsString, double? valueAsNumber, DateTime? valueAsDateTime)
      {
         const string query =
            "INSERT INTO Result (LoadId,MetricId,Value_As_String,Value_As_Number,Value_As_DateTime) VALUES (@loadId, @metricId, @valueAsString, @valueAsNumber,  @valueAsDateTime)";

         using (var connection = SqlConnectionHelper.OpenMSSQLConnection(connectionString))
         using (var cmd = new SqlCommand(query, connection) { CommandTimeout = 0 })
         {
            cmd.Parameters.Add("@loadId", SqlDbType.Int);
            cmd.Parameters["@loadId"].Value = loadId;

            cmd.Parameters.Add("@metricId", SqlDbType.Int);
            cmd.Parameters["@metricId"].Value = (int)metric;

            cmd.Parameters.Add("@valueAsString", SqlDbType.VarChar);
            cmd.Parameters["@valueAsString"].Value = valueAsString;

            cmd.Parameters.Add("@valueAsNumber", SqlDbType.Float);
            cmd.Parameters["@valueAsNumber"].Value = valueAsNumber.HasValue ? valueAsNumber : (object)DBNull.Value;

            cmd.Parameters.Add("@valueAsDateTime", SqlDbType.DateTime);
            cmd.Parameters["@valueAsDateTime"].Value = valueAsDateTime.HasValue ? valueAsDateTime : (object)DBNull.Value;

            cmd.ExecuteNonQuery();
         }
      }

      public void UpdateMetric(int resultId, string valueAsString, double? valueAsNumber, DateTime? valueAsDateTime)
      {
         const string query =
             "UPDATE Result SET Value_As_String = @valueAsString, Value_As_Number = @valueAsNumber, Value_As_DateTime = @valueAsDateTime WHERE ResultId = @resultId";

         using (var connection = SqlConnectionHelper.OpenMSSQLConnection(connectionString))
         using (var cmd = new SqlCommand(query, connection) { CommandTimeout = 0 })
         {
            cmd.Parameters.Add("@resultId", SqlDbType.Int);
            cmd.Parameters["@resultId"].Value = resultId;

            cmd.Parameters.Add("@valueAsString", SqlDbType.VarChar);
            cmd.Parameters["@valueAsString"].Value = valueAsString;

            cmd.Parameters.Add("@valueAsNumber", SqlDbType.Float);
            cmd.Parameters["@valueAsNumber"].Value = valueAsNumber.HasValue ? valueAsNumber : (object)DBNull.Value;

            cmd.Parameters.Add("@valueAsDateTime", SqlDbType.DateTime);
            cmd.Parameters["@valueAsDateTime"].Value = valueAsDateTime.HasValue ? valueAsDateTime : (object)DBNull.Value;

            cmd.ExecuteNonQuery();
         }
      }
   }
}
