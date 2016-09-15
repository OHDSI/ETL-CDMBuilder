using System.Collections.Generic;
using System.Data;
using System.Data.Odbc;
using System.Linq;
using org.ohdsi.cdm.framework.core.Definitions;
using org.ohdsi.cdm.framework.entities.Omop;
using org.ohdsi.cdm.framework.shared.Helpers;

namespace org.ohdsi.cdm.framework.core.Lookups
{
   public class EntityLookup<T> : ILookup where T : Entity
   {
      private readonly string connectionString;
      private readonly string schemaName;
      protected Dictionary<string, T> lookup = new Dictionary<string, T>();

      public Dictionary<string, T> Lookup
      {
         get { return lookup; }
      }

      public EntityLookup(string connectionString, string schemaName)
      {
         this.connectionString = connectionString;
         this.schemaName = schemaName;
      }

      public void Load(QueryDefinition qd, EntityDefinition ed)
      {
         var sql = qd.GetSql(Settings.Current.Building.SourceEngine.Database, Settings.Current.Building.Vendor, schemaName);
         if (string.IsNullOrEmpty(sql)) return;

         using (var conn = SqlConnectionHelper.OpenOdbcConnection(connectionString))
         {
            using (var c = new OdbcCommand(sql, conn))
            {
               c.CommandTimeout = 30000;
               using (var reader = c.ExecuteReader())
               {
                  while (reader.Read())
                  {
                     Concept conceptDef = null;
                     if (ed.Concepts != null && ed.Concepts.Any())
                        conceptDef = ed.Concepts[0];

                     var concept = (T)ed.GetConcepts(conceptDef, reader, null).ToList()[0];

                     var key = concept.GetKey();
                     if (key == null) continue;
                     
                     if (!lookup.ContainsKey(key))
                        lookup.Add(key, concept);
                  }
               }
            }
         }
      }

      public virtual void AddRecord(IDataRecord reader)
      {
         throw new System.NotImplementedException();
      }

      public void Load()
      {
         throw new System.NotImplementedException();
      }

      public virtual long? LookupValue(string sourceValue)
      {
         if(lookup.ContainsKey(sourceValue))
         {
            return lookup[sourceValue].Id;
         }

         return null;
      }

      public string LookupSource(string key)
      {
         throw new System.NotImplementedException();
      }
   }
}
