using System;
using System.Collections.Generic;
using System.Data;
using NUnit.Framework;
using org.ohdsi.cdm.framework.core.Definitions;
using org.ohdsi.cdm.framework.entities.Omop;

namespace org.ohdsi.cdm.tests
{
   class TEntityDefinition
   {
      [Test]
      public void TestGetConcepts()
      {
         var result = GetEntities(new List<Field> { new Field { Key = "Key", SourceKey = "Field", TypeId = "TypeId" } });
         Assert.AreEqual(1, result.Count);
         Assert.AreEqual(result[0].SourceValue, "Field");

         result = GetEntities(new List<Field> { new Field { Key = "Key", IsNullable = true, TypeId = "TypeId" } });
         Assert.AreEqual(3, result.Count);

         result = GetEntities(new List<Field> { new Field { Key = "Key", TypeId = "TypeId" } });
         Assert.AreEqual(result.Count, 1);

         result = GetEntities(new List<Field> { new Field { Key = "Key", DefaultSource = "value", TypeId = "TypeId" } });
         Assert.AreEqual(result.Count, 3);

         result = GetEntities(new List<Field> { new Field { Key = "Key", DefaultSource = "value", TypeId = "TypeId" } }, true);
         Assert.AreEqual(result.Count, 0);

         result = GetEntities(new List<Field> { new Field { Key = "Key", DefaultSource = "DefaultSource", TypeId = "TypeId" } });
         Assert.AreEqual(result.Count, 3);
         Assert.AreEqual(result[0].SourceValue, "DefaultSource");
         Assert.AreEqual(result[1].SourceValue, "DefaultSource");
         Assert.AreEqual(result[2].SourceValue, "DefaultSource");

         result = GetEntities(new List<Field> { new Field { Key = "Key", DefaultConceptId = 555, TypeId = "TypeId" } });
         Assert.AreEqual(result.Count, 3);
         Assert.AreEqual(result[0].ConceptId, 555);
         Assert.AreEqual(result[1].ConceptId, 555);
         Assert.AreEqual(result[2].ConceptId, 555);

         result = GetEntities(new List<Field> { new Field { Key = "Key", DefaultConceptId = 555, TypeId = "TypeId" } }, true);
         Assert.AreEqual(result.Count, 3);

         result = GetEntities2(new List<Field> { new Field { Key = "Key", DefaultSource = "value", TypeId = "TypeId" } });
         Assert.AreEqual(result.Count, 0);
      }

      private static List<IEntity> GetEntities(List<Field> fields, bool idRequired = false)
      {
         var result = new List<IEntity>();
         var reader = CreateDataReader();
         var def = CreateDefinition(fields.ToArray());
         def.Concepts[0].IdRequired = idRequired;

         while (reader.Read())
         {
            result.AddRange(def.GetConcepts(def.Concepts[0], reader, null));
         }
         return result;
      }

      private static List<IEntity> GetEntities2(List<Field> fields)
      {
         var result = new List<IEntity>();
         var reader = CreateDataReader();
         var def = CreateDefinition2(fields.ToArray());
         def.Concepts[0].IdRequired = true;
         def.Concepts[1].IdRequired = false;

         while (reader.Read())
         {
            result.AddRange(def.GetConcepts(def.Concepts[0], reader, null));
         }
         return result;
      }


      private static IDataReader CreateDataReader()
      {
         var data = new DataTable();
         data.Columns.Add("PersonId", typeof(string));
         data.Columns.Add("StartDate", typeof (DateTime));
         data.Columns.Add("Key", typeof (string));
         data.Columns.Add("TypeId", typeof(int));
         data.Columns.Add("Field", typeof(string));

         data.Rows.Add(new object[] {"1", DateTime.Now, "", 1});
         data.Rows.Add(new object[] {"2", DateTime.Now, null, 2 });
         data.Rows.Add(new object[] {"3", DateTime.Now, "1", 3, "Field" });
         data.Rows.Add(new object[] {null, DateTime.Now, "1", 4 });
         return data.CreateDataReader();
      }

      private static EntityDefinition CreateDefinition(Field[] fields)
      {
         var concept = new Concept { Fields = fields };
         
         var def = new EntityDefinition {PersonId = "PersonId", StartDate = "StartDate", Concepts = new Concept[1]};
         def.Concepts[0] = concept;
         return def;
      }

      private static EntityDefinition CreateDefinition2(Field[] fields)
      {
         var concept = new Concept { Fields = fields };
         var concept1 = new Concept { Fields = fields };

         var def = new EntityDefinition { PersonId = "PersonId", StartDate = "StartDate", Concepts = new Concept[2] };
         def.Concepts[0] = concept;
         def.Concepts[1] = concept1;
         return def;
      }
   }
}
