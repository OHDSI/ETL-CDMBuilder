using System.Linq;
using org.ohdsi.cdm.framework.core.Base;

namespace org.ohdsi.cdm.builders.drugera
{
   public class DrugEraPersonBuilder : PersonBuilder
   {
      public DrugEraPersonBuilder(ChunkBuilder chunkBuilder)
         : base(chunkBuilder)
      {
      }
      
      public override void Build()
      {
         var drugEra = BuildDrugEra(drugExposuresRaw.ToArray()).ToArray();

         if (drugEra.Length > 0)
         {
            chunkBuilder.Chunk.DrugEra.PushRange(drugEra);
         }
      }
   }
}
