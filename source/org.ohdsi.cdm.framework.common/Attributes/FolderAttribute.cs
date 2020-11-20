using System;

namespace org.ohdsi.cdm.framework.common.Attributes
{
    public class FolderAttribute : Attribute
    {
        public FolderAttribute(string value)
        {
            this.Value = value;
        }

        public string Value { get; }
    }
}