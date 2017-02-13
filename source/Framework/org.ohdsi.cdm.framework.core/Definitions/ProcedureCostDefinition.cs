using System;
using System.Collections.Generic;
using System.Data;
using org.ohdsi.cdm.framework.entities.Builder;
using org.ohdsi.cdm.framework.entities.Omop;
using org.ohdsi.cdm.framework.shared.Extensions;

namespace org.ohdsi.cdm.framework.core.Definitions
{
   public class ProcedureCostDefinition : ProcedureOccurrenceDefinition
   {
      public string PaidCopay { get; set; }
      public string PaidCoinsurance { get; set; }
      public string PaidTowardDeductible { get; set; }
      public string PaidByPayer { get; set; }
      public string PaidByCoordinationBenefits { get; set; }
      public string TotalOutOfPocket { get; set; }
      public string TotalPaid { get; set; }

      // CDM v5 props
      public string CurrencyConceptId { get; set; }

      public override IEnumerable<IEntity> GetConcepts(Concept concept, IDataRecord reader, KeyMasterOffset keyOffset)
      {
         throw new NotImplementedException();
      }

      public ProcedureCost CreateEnity(ProcedureOccurrence procedure, IDataRecord reader, KeyMasterOffset keyOffset)
      {
         var paidCopay = reader.GetDecimal(PaidCopay);
         var paidCoinsurance = reader.GetDecimal(PaidCoinsurance);
         var paidTowardDeductible = reader.GetDecimal(PaidTowardDeductible);

         long? revenueCodeConceptId = null;
         string revenueCodeSource = null;
         long? diseaseClassConceptId = null;
         var diseaseClassSource = "";
         string diseaseClassLookupKey = null;

         if (Concepts != null)
         {
            if (Concepts.Length > 0)
            {
               var revenueCodeConcept = Concepts[0];

               if (revenueCodeConcept.Fields.Length > 0)
               {
                  revenueCodeSource = reader.GetString(revenueCodeConcept.Fields[0].Key);

                  var revenueConcepts = revenueCodeConcept.GetConceptIdValues(Vocabulary, revenueCodeConcept.Fields[0], reader);
                  if (revenueConcepts.Count > 0)
                     revenueCodeConceptId = revenueConcepts[0].ConceptId;
               }
            }

            if (Concepts.Length == 2)
            {
               var diseaseClassConcept = Concepts[1];
               diseaseClassSource = reader.GetString(diseaseClassConcept.Fields[0].Key);
               var diseaseConcepts = diseaseClassConcept.GetConceptIdValues(Vocabulary, diseaseClassConcept.Fields[0], reader);

               if (diseaseConcepts.Count > 0)
                  diseaseClassConceptId = diseaseConcepts[0].ConceptId;

               diseaseClassLookupKey = diseaseClassConcept.GetConceptIdLookupKey(reader);
            }
         }

         decimal? totalOutOfPocket = null;

         if (paidCopay.HasValue && paidCoinsurance.HasValue && paidTowardDeductible.HasValue)
         {
            totalOutOfPocket = paidCopay + paidCoinsurance + paidTowardDeductible;
         }
         else if (paidCoinsurance.HasValue && paidTowardDeductible.HasValue)
         {
            totalOutOfPocket = paidCoinsurance + paidTowardDeductible;
         }
         
         return new ProcedureCost(procedure)
                   {
                      ProcedureCostId = keyOffset.ProcedureCostId,
                      PaidCopay = paidCopay,
                      PaidCoinsurance = paidCoinsurance,
                      PaidTowardDeductible = paidTowardDeductible,
                      PaidByPayer = reader.GetDecimal(PaidByPayer),
                      PaidByCoordinationBenefits = reader.GetDecimal(PaidByCoordinationBenefits),
                      TotalPaid = reader.GetDecimal(TotalPaid),
                      TotalOutOfPocket = totalOutOfPocket,
                      RevenueCodeConceptId = revenueCodeConceptId,
                      RevenueCodeSourceValue = revenueCodeSource,
                      DiseaseClassConceptId = diseaseClassConceptId,
                      DiseaseClassSourceValue = diseaseClassSource,
                      DiseaseClassLookupKey = diseaseClassLookupKey,
                      CurrencyConceptId = reader.GetLong(CurrencyConceptId) ?? 0
                   };
      }
   }
}
