using System;
using System.Collections.Generic;
using System.Data;
using org.ohdsi.cdm.framework.entities.Builder;
using org.ohdsi.cdm.framework.entities.Omop;
using org.ohdsi.cdm.framework.shared.Extensions;

namespace org.ohdsi.cdm.framework.core.Definitions
{
   public class DrugCostDefinition : ProcedureOccurrenceDefinition
   {
      public string PaidCopay { get; set; }
      public string PaidCoinsurance { get; set; }
      public string PaidTowardDeductible { get; set; }
      public string PaidByPayer { get; set; }
      public string PaidByCoordinationBenefits { get; set; }
      public string TotalOutOfPocket { get; set; }
      public string TotalPaid { get; set; }
      public string IngredientCost { get; set; }
      public string DispensingFee { get; set; }
      public string AverageWholesalePrice { get; set; }

      public override IEnumerable<IEntity> GetConcepts(Concept concept, IDataReader reader, KeyMasterOffset keyMaster)
      {
         throw new NotImplementedException();
      }

      public DrugCost CreateEnity(DrugExposure drugExposure, IDataReader reader)
      {
         var paidCopay = reader.GetDecimal(PaidCopay);
         var paidCoinsurance = reader.GetDecimal(PaidCoinsurance);
         var paidTowardDeductible = reader.GetDecimal(PaidTowardDeductible);

         return new DrugCost(drugExposure)
                   {
                      PaidCopay = paidCopay,
                      PaidCoinsurance = paidCoinsurance,
                      PaidTowardDeductible = paidTowardDeductible,
                      PaidByPayer = reader.GetDecimal(PaidByPayer),
                      PaidByCoordinationBenefits = reader.GetDecimal(PaidByCoordinationBenefits),
                      TotalPaid = reader.GetDecimal(TotalPaid),
                      IngredientCost = reader.GetDecimal(IngredientCost),
                      DispensingFee = reader.GetDecimal(DispensingFee),
                      AverageWholesalePrice = reader.GetDecimal(AverageWholesalePrice),
                      TotalOutOfPocket = paidCopay + paidCoinsurance + paidTowardDeductible
                   };
      }
   }
}
