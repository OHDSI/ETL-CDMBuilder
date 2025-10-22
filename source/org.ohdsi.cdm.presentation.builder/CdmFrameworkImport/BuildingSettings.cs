using org.ohdsi.cdm.framework.common.Base;
using org.ohdsi.cdm.framework.common.Definitions;
using org.ohdsi.cdm.framework.common.Enums;
using org.ohdsi.cdm.framework.common.Utility;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace org.ohdsi.cdm.presentation.builder.Utility.CdmFrameworkImport
{
    public class BuildingSettings : IVendorSettings
    {
        public int? Id { get; set; }

        public Vendor Vendor { get; set; }
        public List<QueryDefinition> SourceQueryDefinitions { get; set; }
        public List<LookupDefinition> CombinedLookupDefinitions { get; set; }

        public int LoadId { get; set; }

        public string BatchScript { get; set; }

        public BuildingSettings(int buildingId, Vendor vendor, string etlLibraryPath)
        {
            Id = buildingId;
            Vendor = vendor;
            EtlLibrary.LoadVendorSettings(etlLibraryPath, this);
        }
    }
}
