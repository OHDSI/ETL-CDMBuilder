using System.Collections.Generic;
using System.Linq;
using NUnit.Framework;
using org.ohdsi.cdm.framework.core;
using org.ohdsi.cdm.framework.core.Databases;
using org.ohdsi.cdm.framework.core.Definitions;

namespace org.ohdsi.cdm.tests
{
   public class TQueryGenerator
   {
      class TestDatabaseEngine : DatabaseEngine
      {
         public override IEnumerable<string> GetAllTables()
         {
            return new List<string>
            {
               "DR1IFF_F",
               "Table1",
               "codebook",
               "Person"
            };
         }

         public override IEnumerable<string> GetAllColumns(string tableName)
         {
            switch (tableName)
            {
               case "DR1IFF_F":
                  return new List<string>
                  {
                     "SEQN",
                     "DR1ILINE",
                     "Column1"
                  };

               case "Table1":
                  return new List<string>
                  {
                     "SEQN",
                     "Column1"
                  };

               case "codebook":
                  return new List<string>
                  {
                     "SEQN",
                     "Column1"
                  };

               case "Person":
                  return new List<string>
                  {
                     "Column1",
                     "Column2"
                  };

               default:
                  return null;
            }
         }
      }

      [Test]
      public void GetQueries()
      {
         var dq = new DynamicQuery
         {
            Rules = new List<Rule>
            {
               new Rule { Type = RuleType.Required, ColumnName = "SEQN"},
               new Rule { Type = RuleType.Excluded, TableName = "DR1IFF_F", ColumnName = "DR1ILINE" },
               new Rule { Type = RuleType.Excluded, TableName = "codebook" }
            },
            Columns = new List<Column>
            {
               new Column { Name = "person_id", Alias = "PersonId", IsPersonIdField = true}
            }
         };
         var generator = new QueryGenerator();
         var engine = new TestDatabaseEngine();
         var result = new Dictionary<string, List<string>>();

         foreach (var q in generator.GetQueries(engine, dq, 1))
         {
            var columns =
               q.Query.Substring(0, q.Query.IndexOf("from")).Replace("select", "").Split(new[] {','}).Select(c => c.Trim()).ToList();
            result.Add(q.TableName, columns);
         }

         Assert.AreEqual(result.Count, 2);
         Assert.IsFalse(result.ContainsKey("codebook"));

         foreach (var r in result)
         {
            var table = r.Key;
            var columns = r.Value;

            Assert.IsTrue(columns.Contains("SEQN"));
            if (table == "DR1IFF_F")
            {
               Assert.IsFalse(columns.Contains("DR1ILINE"));
               Assert.AreEqual(engine.GetAllColumns(table).Count() - 1, columns.Count);
            }
            else
            {
               Assert.AreEqual(engine.GetAllColumns(table).Count(), columns.Count);
            }
         }
      }

      [Test]
      public void GetQueries1()
      {
         var dq = new DynamicQuery
         {
            Rules = new List<Rule>
            {
               new Rule { Type = RuleType.Required, ColumnName = "SEQN"},
               new Rule { Type = RuleType.Excluded, TableName = "codebook" }
            },
            Columns = new List<Column>
            {
               new Column { Name = "person_id", Alias = "PersonId", IsPersonIdField = true}
            }
         };
         var generator = new QueryGenerator();
         var engine = new TestDatabaseEngine();
         var result = new Dictionary<string, List<string>>();

         foreach (var q in generator.GetQueries(engine, dq, 1))
         {
            var columns =
               q.Query.Substring(0, q.Query.IndexOf("from")).Replace("select", "").Split(new[] { ',' }).Select(c => c.Trim()).ToList();
            result.Add(q.TableName, columns);
         }

         Assert.AreEqual(result.Count, 2);
         Assert.IsFalse(result.ContainsKey("codebook"));

         foreach (var r in result)
         {
            var table = r.Key;
            var columns = r.Value;

            Assert.IsTrue(columns.Contains("SEQN"));
            Assert.AreEqual(engine.GetAllColumns(table).Count(), columns.Count);
         }
      }
   }
}
