using System;
using System.Collections.Generic;
using System.Data;
using NUnit.Framework;
using NUnit.Framework.Constraints;
using org.ohdsi.cdm.framework.core.Definitions;
using org.ohdsi.cdm.framework.core.Lookups;

namespace org.ohdsi.cdm.tests
{
   [TestFixture]
   public class TDynamicQuery
   {
      class TestLookup : ILookup
      {
         readonly Dictionary<string, string> lookup = new Dictionary<string, string>();
         public TestLookup()
         {
            lookup.Add("test_table_value1_100", "key1");
            lookup.Add("test_table_value2", "key2");
            lookup.Add("test_table_value3_300", "key3");
         }

         public void Load()
         {
         }

         public long? LookupValue(string sourceValue)
         {
            throw new NotImplementedException();
         }

         public string LookupSource(string key)
         {
            if (lookup.ContainsKey(key))
               return lookup[key];

            return null;
         }
      }

      private IDataReader GetData()
      {
         var dataTable = new DataTable();
         dataTable.Columns.Add("p_id", typeof(long));
         dataTable.Columns.Add("value1", typeof(int));
         dataTable.Columns.Add("value2", typeof(int));
         dataTable.Columns.Add("value3", typeof(int));

         var row = dataTable.NewRow();
         row["p_id"] = 1;
         row["value1"] = 100;
         row["value2"] = DBNull.Value;
         row["value3"] = 300;

         dataTable.Rows.Add(row);
         return dataTable.CreateDataReader();
      }

      [Test]
      public void TestUnpivot1()
      {
         var dq = new DynamicQuery
         {
            Columns = new List<Column>
            {
               new Column {Name = "p_id", Alias = "person_id"},
               new Column {Name = "value1", Alias = "value"},
               new Column {Name = "value2", Alias = "value"},
               new Column {Name = "value3", Alias = "value"}
            }
         };

         using (var reader = GetData())
         {
            while (reader.Read())
            {
               var resultTable = new DataTable();
               resultTable.Load(dq.GetResults("test_table", reader));

               ValidateResult(resultTable);
            }
         }
      }

      [Test]
      public void TestUnpivot2()
      {
         var dq = new DynamicQuery
         {
            Columns = new List<Column>
            {
               new Column {Name = "p_id", Alias = "person_id"},
               new Column {Name = "*", Alias = "value"}
            }
         };

         using (var reader = GetData())
         {
            while (reader.Read())
            {
               var resultTable = new DataTable();
               resultTable.Load(dq.GetResults("test_table", reader));

               ValidateResult(resultTable);
            }
         }
      }

      [Test]
      public void TestTransformation()
      {
         var dq = new DynamicQuery
         {
            Columns = new List<Column>
            {
               new Column {Name = "p_id", Alias = "person_id"},
               new Column {Name = "*", Alias = "value"}
            },
            Transformations = new List<Transformation>
            {
               new Transformation {IfNull = "value", ConstantValue = "."},
               new Transformation {Input = "person_id, value", Format = "{0}_{1}", Alias = "personId_value"},
               new Transformation {Input = "{value}, value", Format = "{0}_{1}", Alias = "FieldName_value"},
               new Transformation {Input = "{#TableName}, {value}, value", Format = "{0}_{1}_{2}", Alias = "TableName_FieldName_value"},
               new Transformation {Input = "{#TableName}, {value}, value", Format = "{0}_{1}_{2}", Alias = "MapKey1", Lookup = new TestLookup()},
               new Transformation {Input = "{#TableName}, {value}, value", Format = "{0}_{1}", Alias = "MapKey2", Lookup = new TestLookup()},
               new Transformation {IfNull = "MapKey1", Input = "MapKey2", Alias = "MapKey"}
            }
         };

         using (var reader = GetData())
         {
            while (reader.Read())
            {
               var resultTable = new DataTable();
               resultTable.Load(dq.GetResults("test_table", reader));

               Assert.AreEqual(resultTable.Columns.Count, 8);
               Assert.AreEqual(resultTable.Columns[0].ColumnName, "person_id");
               Assert.AreEqual(resultTable.Columns[1].ColumnName, "value");
               Assert.AreEqual(resultTable.Columns[2].ColumnName, "personId_value");
               Assert.AreEqual(resultTable.Columns[3].ColumnName, "FieldName_value");
               Assert.AreEqual(resultTable.Columns[4].ColumnName, "TableName_FieldName_value");
               Assert.AreEqual(resultTable.Columns[5].ColumnName, "MapKey1");
               Assert.AreEqual(resultTable.Columns[6].ColumnName, "MapKey2");
               Assert.AreEqual(resultTable.Columns[7].ColumnName, "MapKey");
               

               Assert.AreEqual(resultTable.Rows.Count, 3);
               Assert.AreEqual(resultTable.Rows[0]["person_id"], 1);
               Assert.AreEqual(resultTable.Rows[1]["person_id"], 1);
               Assert.AreEqual(resultTable.Rows[2]["person_id"], 1);

               Assert.AreEqual(resultTable.Rows[0]["value"], 100);
               Assert.AreEqual(resultTable.Rows[1]["value"], ".");
               Assert.AreEqual(resultTable.Rows[2]["value"], 300);

               Assert.AreEqual(resultTable.Rows[0]["personId_value"], "1_100");
               Assert.AreEqual(resultTable.Rows[1]["personId_value"], "1_.");
               Assert.AreEqual(resultTable.Rows[2]["personId_value"], "1_300");

               Assert.AreEqual(resultTable.Rows[0]["FieldName_value"], "value1_100");
               Assert.AreEqual(resultTable.Rows[1]["FieldName_value"], "value2_.");
               Assert.AreEqual(resultTable.Rows[2]["FieldName_value"], "value3_300");

               Assert.AreEqual(resultTable.Rows[0]["TableName_FieldName_value"], "test_table_value1_100");
               Assert.AreEqual(resultTable.Rows[1]["TableName_FieldName_value"], "test_table_value2_.");
               Assert.AreEqual(resultTable.Rows[2]["TableName_FieldName_value"], "test_table_value3_300");

               Assert.AreEqual(resultTable.Rows[0]["MapKey1"], "key1");
               Assert.IsTrue(resultTable.Rows[1]["MapKey1"] is DBNull);
               Assert.AreEqual(resultTable.Rows[2]["MapKey1"], "key3");

               Assert.IsTrue(resultTable.Rows[0]["MapKey2"] is DBNull);
               Assert.AreEqual(resultTable.Rows[1]["MapKey2"], "key2");
               Assert.IsTrue(resultTable.Rows[2]["MapKey2"] is DBNull);

               Assert.AreEqual(resultTable.Rows[0]["MapKey"], "key1");
               Assert.AreEqual(resultTable.Rows[1]["MapKey"], "key2");
               Assert.AreEqual(resultTable.Rows[2]["MapKey"], "key3");
            }
         }
      }

      private static void ValidateResult(DataTable resultTable)
      {
         Assert.AreEqual(resultTable.Columns.Count, 2);
         Assert.AreEqual(resultTable.Columns[0].ColumnName, "person_id");
         Assert.AreEqual(resultTable.Columns[1].ColumnName, "value");

         Assert.AreEqual(resultTable.Rows.Count, 3);
         Assert.AreEqual(resultTable.Rows[0]["person_id"], 1);
         Assert.AreEqual(resultTable.Rows[1]["person_id"], 1);
         Assert.AreEqual(resultTable.Rows[2]["person_id"], 1);

         Assert.AreEqual(resultTable.Rows[0]["value"], 100);
         Assert.AreEqual(resultTable.Rows[1]["value"], DBNull.Value);
         Assert.AreEqual(resultTable.Rows[2]["value"], 300);
      }
   }
}
