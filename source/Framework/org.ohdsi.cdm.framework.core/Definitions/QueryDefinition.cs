using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading;
using System.Xml.Serialization;
using org.ohdsi.cdm.framework.shared.Enums;
using org.ohdsi.cdm.framework.shared.Helpers;

namespace org.ohdsi.cdm.framework.core.Definitions
{
   [XmlType(TypeName = "Variable")]
   [Serializable]
   public class QueryVariable
   {
      [XmlAttribute("database")]
      public string Database { get; set; }

      [XmlAttribute("name")]
      public string Name { get; set; }

      [XmlText]
      public string Value { get; set; }
   }

   [Serializable]
   public class Query
   {
      [XmlAttribute("database")]
      public string Database { get; set; }

      [XmlText]
      public string Text { get; set; }
   }

   public class QueryDefinition
   {
      private long processedPersonId;
      private long processedRows;

      public Guid Guid { get; set; }
      public Query Query { get; set; }
      public QueryVariable[] Variables { get; set; }
      public DynamicQuery DynamicQuery { get; set; }
      public string FileName { get; set; }

      [XmlIgnore]
      public Dictionary<string, int> FieldHeaders { get; set; }

      public long ProcessedPersonId
      {
         get { return Interlocked.Read(ref processedPersonId); }
         set { Interlocked.Exchange(ref processedPersonId, value); }
      }

      public long ProcessedRows
      {
          get { return Interlocked.Read(ref processedRows); }
          set { Interlocked.Exchange(ref processedRows, value); }
      }

      public PersonDefinition[] Persons { get; set; }
      public PayerPlanPeriodDefinition[] PayerPlanPeriods { get; set; }
      public ConditionOccurrenceDefinition[] ConditionOccurrence { get; set; }
      public DeathDefinition[] Death { get; set; }
      public DrugExposureDefinition[] DrugExposure { get; set; }
      public DrugCostDefinition[] DrugCost { get; set; }
      public ProcedureCostDefinition[] ProcedureCost { get; set; }
      public MeasurementCostDefinition[] MeasurementCost { get; set; }
      public ObservationCostDefinition[] ObservationCost { get; set; }

      public ProcedureOccurrenceDefinition[] ProcedureOccurrence { get; set; }
      public ObservationDefinition[] Observation { get; set; }
      public MeasurementDefinition[] Measurement { get; set; }
      public VisitOccurrenceDefinition[] VisitOccurrence { get; set; }
      public VisitCostDefinition[] VisitCost { get; set; }
      public CohortDefinition[] Cohort { get; set; }
      public DeviceExposureDefinition[] DeviceExposure { get; set; }
      public DeviceCostDefinition[] DeviceCost { get; set; }
      
      public LocationDefinition[] Locations { get; set; }
      public OrganizationDefinition[] Organizations { get; set; }
      public CareSiteDefinition[] CareSites { get; set; }
      public ProviderDefinition[] Providers { get; set; }

      public List<EntityDefinition> FindDefinition(IEnumerable<EntityDefinition> definitions, IDataRecord reader)
      {
         if (definitions == null) return null;
         var result = new List<EntityDefinition>();

         foreach (var definition in definitions)
         {
            if (!definition.Match(reader)) continue;

            result.Add(definition);
         }

         return result;
      }

      public string GetSql(Database sourceDatabase, Vendors vendor, string schemaName)
      {
         return GetSqlHelper.GetSql(sourceDatabase, GetSql(vendor, schemaName), schemaName);
      }

      public string GetSql(Vendors vendor, string schemaName)
      {
         if (!IsSuitable(Query.Database, vendor))
            return null;

         if (Variables == null || !Variables.Any())
            return Query.Text.Replace("{sc}", schemaName);
         
         foreach (var v in Variables)
         {
            if (!IsSuitable(v.Database, vendor))
               continue;

            Query.Text = Query.Text.Replace("{" + v.Name + "}", v.Value);
         }

         return Query.Text.Replace("{sc}", schemaName);
      }

      public bool IsSuitable(string databases, Vendors vendor)
      {
         if(string.IsNullOrEmpty(databases)) 
             return true;

         return
            databases.Split(new[] {","}, StringSplitOptions.RemoveEmptyEntries)
               .Any(db => vendor.ToString().ToLower().Contains(db.Trim().ToLower()));
      }

      public string GetPersonIdFieldName()
      {
         if (Persons != null && Persons.Any())
         {
            return Persons[0].PersonId;
         }

         if (PayerPlanPeriods != null && PayerPlanPeriods.Any())
         {
            return PayerPlanPeriods[0].PersonId;
         }

         if (ConditionOccurrence != null && ConditionOccurrence.Any())
         {
            return ConditionOccurrence[0].PersonId;
         }

         if (Death != null && Death.Any())
         {
            return Death[0].PersonId;
         }

         if (DrugExposure != null && DrugExposure.Any())
         {
            return DrugExposure[0].PersonId;
         }

         if (ProcedureOccurrence != null && ProcedureOccurrence.Any())
         {
            return ProcedureOccurrence[0].PersonId;
         }

         if (Observation != null && Observation.Any())
         {
            return Observation[0].PersonId;
         }

         if (Measurement != null && Measurement.Any())
         {
            return Measurement[0].PersonId;
         }

         if (VisitOccurrence != null && VisitOccurrence.Any())
         {
            return VisitOccurrence[0].PersonId;
         }

         if (Cohort != null && Cohort.Any())
         {
            return Cohort[0].PersonId;
         }

         if (DeviceExposure != null && DeviceExposure.Any())
         {
            return DeviceExposure[0].PersonId;
         }

         throw new Exception("Cant find PersonId FieldName " + this.FileName);
      }
   }
}
