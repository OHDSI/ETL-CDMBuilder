using System.Threading.Tasks;

namespace org.ohdsi.cdm.framework.core.Base
{
   interface IChunkBuilder
   {
      ChunkBuilder Load();
      ChunkBuilder Build();

      Task Save();
   }
}
