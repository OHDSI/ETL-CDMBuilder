using org.ohdsi.cdm.framework.common.Definitions;
using org.ohdsi.cdm.framework.common.Enums;
using System.Xml.Serialization;

namespace org.ohdsi.cdm.presentation.builder.Utility.CdmFrameworkImport
{
    [XmlInclude(typeof(QueryDefinition))]
    [Serializable]
    public class QueryDefinitionAdapter
    {
        private static string[] separator => new string[1] { "," };

        public ProviderDefinition[] Providers => _original.Providers ?? Array.Empty<ProviderDefinition>();
        public LocationDefinition[] Locations => _original.Locations ?? Array.Empty<LocationDefinition>();
        public CareSiteDefinition[] CareSites => _original.CareSites ?? Array.Empty<CareSiteDefinition>();

        public bool HasAnyProvidersLocationsCareSites => Providers.Any() || Locations.Any() || CareSites.Any();

        private readonly QueryDefinition _original;

        public QueryDefinitionAdapter(QueryDefinition original)
        {
            _original = original;
        }

        public string GetSql(Vendor vendor, string sourceSchema, string chunkSchema)
        {
            if (_original.Variables == null || _original.Variables.Length == 0)
            {
                return _original.Query.Text.Replace("{sc}", sourceSchema).Replace("{ch_sc}", chunkSchema);
            }

            QueryVariable[] variables = _original.Variables;
            foreach (QueryVariable queryVariable in variables)
            {
                if (IsSuitable(queryVariable.Database, vendor))
                {
                    _original.Query.Text = _original.Query.Text.Replace("{" + queryVariable.Name + "}", queryVariable.Value);
                }
            }

            return _original.Query.Text.Replace("{sc}", sourceSchema).Replace("{ch_sc}", chunkSchema);
        }

        public static bool IsSuitable(string databases, Vendor vendor)
        {
            Vendor vendor2 = vendor;
            if (string.IsNullOrEmpty(databases))
            {
                return true;
            }

            if (databases.Equals("none", StringComparison.OrdinalIgnoreCase))
            {
                return false;
            }

            return databases.Split(separator, StringSplitOptions.RemoveEmptyEntries).Any((db) => vendor2.ToString().Contains(db.Trim(), StringComparison.CurrentCultureIgnoreCase));
        }
    }
}
