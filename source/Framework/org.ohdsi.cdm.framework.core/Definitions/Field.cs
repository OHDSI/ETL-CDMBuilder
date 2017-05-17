using System.ComponentModel;
using System.Xml.Serialization;

namespace org.ohdsi.cdm.framework.core.Definitions
{
   public class Field
   {
      [XmlAttribute("key")]
      public string Key { get; set; }
      [XmlAttribute("sourceKey")]
      public string SourceKey { get; set; }

      [XmlAttribute("typeId")]
      public string TypeId { get; set; }

      [XmlAttribute("conceptId")]
      public string ConceptId { get; set; }

      [XmlAttribute("eventDate")]
      public string EventDate { get; set; }

      [XmlAttribute("ignoreCase")]
      public bool IgnoreCase { get; set; }
      
      [XmlIgnore]
      public int? DefaultTypeId { get; set; }

      [XmlAttribute("defaultTypeId")]
      public string DefaultTypeIdAsText
      {
         get { return (DefaultTypeId.HasValue) ? DefaultTypeId.ToString() : null; }
         set { DefaultTypeId = !string.IsNullOrEmpty(value) ? int.Parse(value) : default(int?); }
      }

      [XmlIgnore]
      public long? DefaultConceptId { get; set; }

      [XmlAttribute("defaultConceptId")]
      public string DefaultConceptIdAsText
      {
         get { return (DefaultConceptId.HasValue) ? DefaultConceptId.ToString() : null; }
         set { DefaultConceptId = !string.IsNullOrEmpty(value) ? long.Parse(value) : default(long?); }
      }

      [XmlAttribute("defaultSource")]
      public string DefaultSource { get; set; }
      
      [XmlAttribute("conjunctionType")]
      [DefaultValue(ConjunctionTypes.And)]
      public ConjunctionTypes ConjunctionType { get; set; }

      [XmlAttribute("isNullable")]
      public bool IsNullable { get; set; }
   }
}
