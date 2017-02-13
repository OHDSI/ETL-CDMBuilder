using System;

namespace org.ohdsi.cdm.framework.entities.Omop
{
   public class ChunkRecord
   {
      public int Id { get; set; }
      public Int64 PersonId { get; set; }
      public string PersonSource { get; set; }
   }

   public class SubChunkRecord
   {
      public int ChunkId { get; set; }
      public int Index { get; set; }
      public Int64 MinPersonId { get; set; }
      public Int64 MaxPersonId { get; set; }
      public int Count { get; set; }
      public bool Saved { get; set; }
   }
}
