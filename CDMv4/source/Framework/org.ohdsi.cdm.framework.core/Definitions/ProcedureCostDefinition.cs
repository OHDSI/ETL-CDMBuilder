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

      public override IEnumerable<IEntity> GetConcepts(Concept concept, IDataReader reader, KeyMasterOffset keyMaster)
      {
         throw new NotImplementedException();
      }

      public ProcedureCost CreateEnity(ProcedureOccurrence procedure, IDataReader reader)
      {
         var paidCopay = reader.GetDecimal(PaidCopay);
         var paidCoinsurance = reader.GetDecimal(PaidCoinsurance);
         var paidTowardDeductible = reader.GetDecimal(PaidTowardDeductible);

         long? revenueCodeConceptId = null;
         string revenueCodeSource = null;
         long? diseaseClassConceptId = null;
         var diseaseClassSource = "";
         
         var revenueCodeConcept = Concepts[0];

         if (revenueCodeConcept.Fields.Length > 0)
         {
            revenueCodeSource = reader[revenueCodeConcept.Fields[0].Key].ToString().Trim();

            var revenueConcepts = revenueCodeConcept.GetValues(Vocabulary, revenueCodeConcept.Fields[0], reader);
            if(revenueConcepts.Count > 0)
               revenueCodeConceptId = revenueConcepts[0].ConceptId;
         }

         string diseaseClassLookupKey = null;

         if (Concepts.Length == 2)
         {
            var diseaseClassConcept = Concepts[1];
            diseaseClassSource = reader[diseaseClassConcept.Fields[0].Key].ToString().Trim();
            var diseaseConcepts = diseaseClassConcept.GetValues(Vocabulary, diseaseClassConcept.Fields[0], reader);

            if (diseaseConcepts.Count > 0)
               diseaseClassConceptId = diseaseConcepts[0].ConceptId;

            diseaseClassLookupKey = diseaseClassConcept.GetConceptIdLookupKey(reader);
         }

         return new ProcedureCost(procedure)
                   {
                      PaidCopay = paidCopay,
                      PaidCoinsurance = paidCoinsurance,
                      PaidTowardDeductible = paidTowardDeductible,
                      PaidByPayer = reader.GetDecimal(PaidByPayer),
                      PaidByCoordinationBenefits = reader.GetDecimal(PaidByCoordinationBenefits),
                      TotalPaid = reader.GetDecimal(TotalPaid),
                      TotalOutOfPocket = paidCopay + paidCoinsurance + paidTowardDeductible,
                      RevenueCodeConceptId = revenueCodeConceptId,
                      RevenueCodeSourceValue = revenueCodeSource,
                      DiseaseClassConceptId = diseaseClassConceptId,
                      DiseaseClassSourceValue = diseaseClassSource,
                      DiseaseClassLookupKey = diseaseClassLookupKey
                   };
      }
   }
}
