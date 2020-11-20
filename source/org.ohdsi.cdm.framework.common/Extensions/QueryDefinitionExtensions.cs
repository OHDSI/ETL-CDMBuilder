using org.ohdsi.cdm.framework.common.Definitions;
using System.IO;
using System.Xml.Serialization;

namespace org.ohdsi.cdm.framework.common.Extensions
{
    public static class QueryDefinitionExtensions
    {
        public static QueryDefinition DeserializeFromXml(this QueryDefinition qd, string xml)
        {
            var ser = new XmlSerializer(qd.GetType());
            using (var tr = new StringReader(xml))
            {
                return (QueryDefinition)ser.Deserialize(tr);
            }
        }
    }
}
