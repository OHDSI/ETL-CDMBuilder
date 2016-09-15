using System.IO;
using System.Xml.Serialization;
using org.ohdsi.cdm.framework.core.Definitions;

namespace org.ohdsi.cdm.framework.core.Extensions
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
