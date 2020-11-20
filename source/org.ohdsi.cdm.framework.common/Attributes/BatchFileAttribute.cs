using System;

namespace org.ohdsi.cdm.framework.common.Attributes
{
    public class BatchFileAttribute : Attribute
    {
        public BatchFileAttribute(string value)
        {
            this.Value = value;
        }

        public string Value { get; }
    }
}
