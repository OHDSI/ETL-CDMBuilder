using System;
using System.Xml.Serialization;
using org.ohdsi.cdm.framework.core.Lookups;

namespace org.ohdsi.cdm.framework.core.Definitions
{
   public class Transformation
   {
      [XmlAttribute("IfNull")]
      public string IfNull { get; set; }

      //[XmlAttribute("If")]
      //public string If { get; set; }

      [XmlAttribute("Input")]
      public string Input { get; set; }

      [XmlAttribute("ConstantValue")]
      public string ConstantValue { get; set; }

      [XmlAttribute("Format")]
      public string Format { get; set; }

      [XmlAttribute("Lookup")]
      public string LookupPath { get; set; }

      [XmlAttribute("Alias")]
      public string Alias { get; set; }

      [XmlIgnore]
      public object IfNullValue { get; set; }

      [XmlIgnore]
      public ILookup Lookup { get; set; }

      public object Transform(object[] values)
      {
         object result = values[0];

         if (!string.IsNullOrEmpty(IfNull) && IfNullValue != DBNull.Value)
         {
            return IfNullValue;
         }

         if (!string.IsNullOrEmpty(ConstantValue))
            result = ConstantValue;

         if (!string.IsNullOrEmpty(Format))
            result = string.Format(Format, values);

         if (Lookup != null && result != null)
            result = Lookup.LookupSource(result.ToString());

         return result;
      }
   }
}
