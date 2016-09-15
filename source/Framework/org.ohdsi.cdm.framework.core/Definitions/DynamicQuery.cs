using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;

namespace org.ohdsi.cdm.framework.core.Definitions
{
   public class DynamicQuery
   {
      public List<Rule> Rules { get; set; }
      public List<Column> Columns { get; set; }
      public List<Transformation> Transformations { get; set; }
      private Dictionary<int, Dictionary<string, string>> nativeColumnNames;

      public string TableName { get; set; }
      public string Query { get; set; }

      public string PersonIdField
      {
         get { return Columns.FirstOrDefault(c => c.IsPersonIdField).Name; }
      }
      
      private void ApplyTransformation(DataTable dt)
      {
         if(Transformations == null) return;

         foreach (var transformation in Transformations)
         {
            if (string.IsNullOrEmpty(transformation.Input) && !string.IsNullOrEmpty(transformation.IfNull))
            {
               transformation.Input = transformation.IfNull;
            }

            var inputColumns = transformation.Input.Split(new[] {','}, StringSplitOptions.RemoveEmptyEntries);

            var outputColumn = string.Empty;
            if (string.IsNullOrEmpty(transformation.Alias))
            {
               if (inputColumns.Length == 1)
               {
                  outputColumn = inputColumns[0];
               }
               else
                  throw new Exception("Transformation with multi fields must have alias. Fields: " + transformation.Input);
            }
            else
            {
               outputColumn = transformation.Alias;
            }

            for (var i = 0; i < dt.Rows.Count; i++)
            {
               var values = GetValues(dt, inputColumns, i);

               transformation.IfNullValue = string.IsNullOrEmpty(transformation.IfNull)
                  ? null
                  : dt.Rows[i][transformation.IfNull];
               dt.Rows[i][outputColumn] = transformation.Transform(values.ToArray());
            }
         }
      }

      private List<object> GetValues(DataTable dt, string[] inputColumns, int i)
      {
         var values = new List<object>(inputColumns.Length);
         foreach (var inputColumn in inputColumns.Select(c => c.Trim()))
         {
            if (inputColumn.StartsWith("{") && inputColumn.EndsWith("}"))
            {
               var value = inputColumn.Substring(1, inputColumn.Length - 2);
               if (value.ToLower() == "#tablename")
               {
                  values.Add(dt.TableName);
               }
               else if (value.ToLower() == "#currentdate")
               {
                  values.Add(DateTime.Now);
               }
               else // set native column name
               {
                  values.Add(nativeColumnNames[i][value]);
               }
            }
            else
               values.Add(dt.Rows[i][inputColumn]);
         }
         return values;
      }

      public IDataReader GetResults(string tableName, IDataReader reader)
      {
         nativeColumnNames = new Dictionary<int, Dictionary<string, string>>();
         var columns = Columns.ToDictionary(c => c.Name, c => c);
         var table = new DataTable(tableName);
  
         var totalColumnCount = reader.FieldCount;
         var singleColumns = new Dictionary<string, Column>();
   
         foreach (var columnsByAlias in Columns.GroupBy(c => c.Alias))
         {
            var column = columnsByAlias.First();

            table.Columns.Add(column.Alias, typeof(object));
            if (columnsByAlias.Count() == 1 && column.Name != "*")
               singleColumns.Add(column.Name, column);
         }

         if (Transformations != null)
         {
            foreach (var transformation in Transformations)
            {
               if (string.IsNullOrEmpty(transformation.Alias) || table.Columns.Contains(transformation.Alias)) continue;

               table.Columns.Add(transformation.Alias, typeof (object));
            }
         }

         var unpivotedRowCount = totalColumnCount - singleColumns.Count;

         for (var i = 0; i < unpivotedRowCount; i++)
         {
            table.Rows.Add(table.NewRow());
         }

         var currentRowIndex = 0;
         for (var i = 0; i < reader.FieldCount; i++)
         {
            var name = reader.GetName(i);
            var value = reader[i];

            var alias = columns.ContainsKey(name) ? columns[name].Alias : columns["*"].Alias;

            if (singleColumns.ContainsKey(name))
            {
               for (var j = 0; j < unpivotedRowCount; j++)
               {
                  table.Rows[j][alias] = value;

                  if (!nativeColumnNames.ContainsKey(j))
                     nativeColumnNames.Add(j, new Dictionary<string, string>());

                  nativeColumnNames[j].Add(alias, name);
               }
            }
            else
            {
               table.Rows[currentRowIndex][alias] = value;

               if (!nativeColumnNames.ContainsKey(currentRowIndex))
                  nativeColumnNames.Add(currentRowIndex, new Dictionary<string, string>());

               nativeColumnNames[currentRowIndex].Add(alias, name);

               currentRowIndex++;
            }
         }

         ApplyTransformation(table);

         return table.CreateDataReader();
      }
   }
}
