using org.ohdsi.cdm.framework.common.Enums;
using System;

namespace org.ohdsi.cdm.framework.common.Attributes
{
    public class CdmVersionAttribute : Attribute
    {
        public CdmVersionAttribute(CdmVersions value)
        {
            this.Value = value;
        }

        public CdmVersions Value { get; }
    }
}
