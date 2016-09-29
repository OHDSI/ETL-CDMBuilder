using System.Collections.Generic;
using System.Linq;
using org.ohdsi.cdm.framework.core.Base;
using org.ohdsi.cdm.framework.shared.Enums;

namespace org.ohdsi.cdm.builders.eras_v5
{
   public class ErasV5PersonBuilder : PersonBuilder
   {
      public override void Build(Dictionary<string, long> providers)
      {
         var drugEra = BuildDrugEra(drugExposuresRaw.ToArray()).ToArray();
         var conditionEra = BuildConditionEra(conditionOccurrencesRaw.ToArray()).ToArray();
         
         foreach (var eraEntity in drugEra)
         {
            chunkData.AddData(eraEntity, EntityType.DrugEra);
         }

         foreach (var eraEntity in conditionEra)
         {
            chunkData.AddData(eraEntity, EntityType.ConditionEra);
         }

      }
   }
}
