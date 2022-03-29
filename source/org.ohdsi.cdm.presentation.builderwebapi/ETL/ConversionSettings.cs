using org.ohdsi.cdm.framework.common.Base;
using System;
using System.Collections.Generic;
using System.Reflection;

namespace org.ohdsi.cdm.presentation.builderwebapi.ETL
{
    public class ConversionSettings
    {
        public object ConversionId { get; set; }
        public string ContentKey { get; set; }
        public string SourceEngine { get; set; }
        public string DestinationEngine { get; set; }
        public string VocabularyEngine { get; set; }

        public string SourceServer { get; set; }
        public string DestinationServer { get; set; }
        public string VocabularyServer { get; set; }

        public string SourceSchema { get; set; }
        public string DestinationSchema { get; set; }
        public string VocabularySchema { get; set; }

        public string SourceDatabase { get; set; }
        public string DestinationDatabase { get; set; }
        public string VocabularyDatabase { get; set; }

        public string SourceUser { get; set; }
        public string DestinationUser { get; set; }
        public string VocabularyUser { get; set; }

        public string SourcePassword { get; set; }
        public string DestinationPassword { get; set; }
        public string VocabularyPassword { get; set; }

        public object SourcePort { get; set; }
        public object DestinationPort { get; set; }
        public object VocabularyPort { get; set; }

        public string MappingsName { get; set; }
        public string CdmVersion { get; set; } = "v5.3";

        public BuildSettings BuildSettings { get; set; } = new BuildSettings();

        public static IEnumerable<Tuple<string, string>> GetProperties(object atype)
        {
            if (atype == null)
                return new List<Tuple<string, string>>();

            Type t = atype.GetType();
            PropertyInfo[] props = t.GetProperties();
            var result = new List<Tuple<string, string>>();
            foreach (PropertyInfo prp in props)
            {
                if (prp.Name == "BuildSettings")
                    continue;

                object value = prp.GetValue(atype, new object[] { });
                result.Add(new Tuple<string, string>(prp.Name, value == null ? "" : value.ToString()));
            }
            return result;
        }

        public static ConversionSettings SetProperties(Dictionary<string, string> properties)
        {
            var result = new ConversionSettings();
            Type t = result.GetType();
            PropertyInfo[] props = t.GetProperties();
            foreach (PropertyInfo prp in props)
            {
                if (prp.Name == "BuildSettings")
                    continue;

                if (properties.ContainsKey(prp.Name))
                    prp.SetValue(result, properties[prp.Name]);
            }

            return result;
        }
    }
}
