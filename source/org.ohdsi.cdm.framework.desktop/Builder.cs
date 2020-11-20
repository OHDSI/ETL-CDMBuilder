using org.ohdsi.cdm.framework.common.Extensions;
using org.ohdsi.cdm.framework.desktop.Enums;
using System.Data;

namespace org.ohdsi.cdm.framework.desktop
{
    public class Builder
    {
        public int Id { get; private set; }
        public BuilderState State { get; set; }

        public void SetFrom(IDataReader reader)
        {
            Id = reader.GetInt("Id").Value;
            State = (BuilderState)reader.GetInt("StateId").Value;
        }
    }
}
