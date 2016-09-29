using System.Collections.Generic;
using System.Linq;
using org.ohdsi.cdm.framework.core.Definitions;

namespace org.ohdsi.cdm.framework.core.Databases
{
   public class QueryGenerator
   {
      public IEnumerable<DynamicQuery> GetQueries(IDatabaseEngine engine, DynamicQuery query, int chunkId)
      {
         var rulesByTable =
            query.Rules.FindAll(r => !string.IsNullOrEmpty(r.TableName) && string.IsNullOrEmpty(r.ColumnName))
               .ToDictionary(r => r.TableName, r => r);
         
         var isIncludeRule = rulesByTable.Values.ToList().Exists(r => r.Type == RuleType.Included);

         var requiredColumn =
            query.Rules.FindAll(r => !string.IsNullOrEmpty(r.ColumnName) && r.Type == RuleType.Required)
               .ToDictionary(r => r.ColumnName, r => r);
         
         var excludedColumn =
            query.Rules.FindAll(r => !string.IsNullOrEmpty(r.ColumnName) && r.Type == RuleType.Excluded)
               .ToDictionary(r => r.ColumnName, r => r);
         
         var includedColumn =
            query.Rules.FindAll(r => !string.IsNullOrEmpty(r.ColumnName) && r.Type == RuleType.Included)
               .ToDictionary(r => r.ColumnName, r => r);
         

         foreach (var table in engine.GetAllTables())
         {
            if ((!isIncludeRule || !rulesByTable.ContainsKey(table)) &&
                (isIncludeRule || rulesByTable.ContainsKey(table))) continue;

            var columns = engine.GetAllColumns(table).ToList();
            if (requiredColumn.Count > 0 && requiredColumn.Keys.Intersect(columns).Count() < requiredColumn.Count)
               continue;

            var filteredColumns = new List<string>();
            foreach (var column in columns)
            {
               if (excludedColumn.Count == 0 && includedColumn.Count > 0 && (!includedColumn.ContainsKey(column) ||
                                                 (!string.IsNullOrEmpty(excludedColumn[column].TableName) &&
                                                  excludedColumn[column].TableName != table)))
                  continue;

               if (excludedColumn.Count > 0 && excludedColumn.ContainsKey(column) &&
                   (string.IsNullOrEmpty(excludedColumn[column].TableName) ||
                    excludedColumn[column].TableName == table))
                  continue;

               filteredColumns.Add(column);
            }

            yield return new DynamicQuery
            {
               Columns = query.Columns,
               Rules = query.Rules,
               Transformations = query.Transformations,
               TableName = table,
               Query = engine.GetSql(table, filteredColumns, chunkId, query.PersonIdField)
            
            };
         }
      }
   }
}
