using System.Xml.Serialization;

namespace org.ohdsi.cdm.framework.core.Definitions
{
   public enum ConjunctionTypes
   {
      [XmlEnum(Name = "And")]
      And,
      [XmlEnum(Name = "Or")]
      Or
   }
}
