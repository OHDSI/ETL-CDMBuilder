using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using org.ohdsi.cdm.framework.shared.Helpers;

namespace org.ohdsi.cdm.framework.core.Lookups
{
   public class BaseLookup : ILookup
   {
      protected readonly string sqlFileDestination;
      protected readonly string connectionString;

      protected Dictionary<string, long> lookup = new Dictionary<string, long>();

      public BaseLookup() : this(null, null)
      {
      }

      public BaseLookup(string connectionString, string sqlFileDestination)
      {
         this.connectionString = connectionString;
         this.sqlFileDestination = sqlFileDestination;
      }

      public virtual void Load()
      {
         lookup.Clear();
         var sql = File.ReadAllText(sqlFileDestination);
         using (var connection = SqlConnectionHelper.OpenConnection(connectionString))
         using (var command = new SqlCommand(sql, connection) { CommandTimeout = 0 })
         using(var reader = command.ExecuteReader(CommandBehavior.SequentialAccess))
         {
            while (reader.Read())
            {
               AddRecord(reader);
            }
         }
      }

      public virtual void AddRecord(IDataReader reader)
      {
         var sourceCode = reader[0].ToString().Trim();
         var source = reader[1].ToString().Trim();
         
         var targetConceptId = long.Parse(source);

         if (!lookup.ContainsKey(sourceCode))
         {
            lookup.Add(sourceCode, targetConceptId);
         }
      }

      public virtual long? LookupValue(string sourceValue)
      {
         if (sourceValue == null) return null;

         if(lookup.ContainsKey(sourceValue))
         {
            return lookup[sourceValue];
         }
         
         return null;
      }
   }
}
