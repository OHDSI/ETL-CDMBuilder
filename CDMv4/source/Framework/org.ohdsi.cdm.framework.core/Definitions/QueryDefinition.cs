using System;
using System.Collections.Generic;
using System.Data;

namespace org.ohdsi.cdm.framework.core.Definitions
{
   public class QueryDefinition
   {
      public Guid Guid { get; set; }
      public string Query { get; set; }

      public PersonDefinition[] Persons { get; set; }
      public PayerPlanPeriodDefinition[] PayerPlanPeriods { get; set; }
      public ConditionOccurrenceDefinition[] ConditionOccurrence { get; set; }
      public DeathDefinition[] Death { get; set; }
      public DrugExposureDefinition[] DrugExposure { get; set; }
      public DrugCostDefinition[] DrugCost { get; set; }
      public ProcedureCostDefinition[] ProcedureCost { get; set; }
      public ProcedureOccurrenceDefinition[] ProcedureOccurrence { get; set; }
      public ObservationDefinition[] Observation { get; set; }
      public VisitOccurrenceDefinition[] VisitOccurrence { get; set; }
      public CohortDefinition[] Cohort { get; set; }


      public LocationDefinition[] Locations { get; set; }
      public OrganizationDefinition[] Organizations { get; set; }
      public CareSiteDefinition[] CareSites { get; set; }
      public ProviderDefinition[] Providers { get; set; }

      public List<EntityDefinition> FindDefinition(IEnumerable<EntityDefinition> definitions, IDataReader reader)
      {
         if (definitions == null) return null;
         var result = new List<EntityDefinition>();

         foreach (var definition in definitions)
         {
            if (string.IsNullOrEmpty(definition.Condition))
            {
               result.Add(definition);
               continue;
            }

            if (!definition.Match(reader)) continue;
            result.Add(definition);
            break;
         }

         return result;
      }
   }
}
