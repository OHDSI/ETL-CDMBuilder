using System.Data;
using org.ohdsi.cdm.framework.shared.Enums;
using org.ohdsi.cdm.framework.shared.Extensions;

namespace org.ohdsi.cdm.framework.entities.Builder
{
   public class Builder
   {
      public int Id { get; private set; }
      public BuilderState State { get; set; }

      public void SetFrom(IDataReader reader)
      {
         Id = reader.GetInt("Id").Value;
         State = (BuilderState) reader.GetInt("StateId").Value;
      }
   }
}
