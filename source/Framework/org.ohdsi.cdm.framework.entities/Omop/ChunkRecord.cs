using System;

namespace org.ohdsi.cdm.framework.entities.Omop
{
   public class ChunkRecord
   {
      public int Id { get; set; }
      public Int64 PersonId { get; set; }
      public string PersonSource { get; set; }
   }
}
