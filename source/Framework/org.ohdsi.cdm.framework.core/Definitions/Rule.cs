using System.Xml.Serialization;

namespace org.ohdsi.cdm.framework.core.Definitions
{
   public class Rule
   {
      [XmlAttribute("Table")]
      public string TableName { get; set; }

      [XmlAttribute("Column")]
      public string ColumnName { get; set; }

      [XmlAttribute("Type")]
      public RuleType Type { get; set; }
   }
}
