using System;
using System.Collections.Generic;
using System.Data;
using org.ohdsi.cdm.framework.entities.Builder;
using org.ohdsi.cdm.framework.entities.Omop;
using org.ohdsi.cdm.framework.shared.Extensions;

namespace org.ohdsi.cdm.framework.core.Definitions
{
   public class PayerPlanPeriodDefinition : EntityDefinition
   {
      public string PayerSource { get; set; }
      public string PlanSource { get; set; }
      public string FamilySource { get; set; }

      public override IEnumerable<IEntity> GetConcepts(Concept concept, IDataRecord reader, KeyMasterOffset keyOffset)
      {
         var personId = reader.GetLong(PersonId);

         var startDate = reader.GetDateTime(StartDate);
         var endDate = reader.GetDateTime(EndDate);


         if (personId.HasValue)
         {
            Dictionary<string, string> additionalFields = null;
            if (AdditionalFields != null)
            {
               additionalFields = new Dictionary<string, string>(AdditionalFields.Length, StringComparer.OrdinalIgnoreCase);
               foreach (var additionalField in AdditionalFields)
               {
                  additionalFields.Add(additionalField, reader.GetString(additionalField));
               }
            }

            var payerSourceValue = reader.GetString(PayerSource);
            if (string.IsNullOrWhiteSpace(payerSourceValue))
               payerSourceValue = null;

            var planSource = reader.GetString(PlanSource);
            if (string.IsNullOrWhiteSpace(planSource))
               planSource = null;
            
            yield return new PayerPlanPeriod
                            {
                               PersonId = personId.Value,
                               StartDate = startDate,
                               EndDate = endDate,
                               PayerSourceValue = payerSourceValue,
                               PlanSourceValue = planSource,
                               FamilySourceValue = reader.GetString(FamilySource),
                               VisitOccurrenceId = reader.GetLong(VisitOccurrenceId),
                               AdditionalFields = additionalFields
                            };
         }
      }
   }
}
