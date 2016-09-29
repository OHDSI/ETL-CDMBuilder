using System.Collections.Generic;
using System.Data;
using System.Data.Odbc;
using System.IO;
using org.ohdsi.cdm.framework.shared.Helpers;

namespace org.ohdsi.cdm.framework.core.Lookups
{
   public class BaseLookup : ILookup
   {
      protected readonly string sqlFileDestination;
      protected readonly string connectionString;
      protected readonly string schemaName;

      protected Dictionary<string, long> lookup = new Dictionary<string, long>();

      public BaseLookup() : this(null, null, null)
      {
      }

      public BaseLookup(string connectionString, string sqlFileDestination, string schemaName)
      {
         this.connectionString = connectionString;
         this.sqlFileDestination = sqlFileDestination;
         this.schemaName = schemaName;
      }

      public virtual void Load()
      {
         lookup.Clear();
         var sql = File.ReadAllText(sqlFileDestination);
         sql = sql.Replace("{sc}", schemaName);
         using (var connection = SqlConnectionHelper.OpenOdbcConnection(connectionString))
         using (var command = new OdbcCommand(sql, connection) { CommandTimeout = 0 })
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

      public virtual string LookupSource(string key)
      {
         throw new System.NotImplementedException();
      }
   }
}
