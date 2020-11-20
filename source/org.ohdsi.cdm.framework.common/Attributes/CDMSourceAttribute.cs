using System;

namespace org.ohdsi.cdm.framework.common.Attributes
{
    public class CdmSourceAttribute : Attribute
    {
        public CdmSourceAttribute(string value)
        {
            this.Value = value;
        }

        public string Value { get; }
    }
}
