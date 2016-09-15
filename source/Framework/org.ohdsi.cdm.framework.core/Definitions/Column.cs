using System.Xml.Serialization;

namespace org.ohdsi.cdm.framework.core.Definitions
{
   public class Column
   {
      [XmlAttribute("Name")]
      public string Name { get; set; }

      [XmlAttribute("Alias")]
      public string Alias { get; set; }

      [XmlAttribute("IsPersonIdField")]
      public bool IsPersonIdField { get; set; }
   }
}
