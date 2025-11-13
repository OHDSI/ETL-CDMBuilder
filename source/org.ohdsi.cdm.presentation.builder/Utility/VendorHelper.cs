using org.ohdsi.cdm.framework.common.Base;
using org.ohdsi.cdm.framework.common.Enums;
using org.ohdsi.cdm.framework.common.Utility;
using org.ohdsi.cdm.framework.etl.Transformation.CDM;
using org.ohdsi.cdm.framework.etl.Transformation.CPRD;
using org.ohdsi.cdm.framework.etl.Transformation.CprdAurum;
using org.ohdsi.cdm.framework.etl.Transformation.CprdHES;
using org.ohdsi.cdm.framework.etl.Transformation.Era;
using org.ohdsi.cdm.framework.etl.Transformation.HealthVerity;
using org.ohdsi.cdm.framework.etl.Transformation.JMDC;
using org.ohdsi.cdm.framework.etl.Transformation.OptumExtended;
using org.ohdsi.cdm.framework.etl.Transformation.OptumPanther;
using org.ohdsi.cdm.framework.etl.Transformation.PA;
using org.ohdsi.cdm.framework.etl.Transformation.Premier;
using org.ohdsi.cdm.framework.etl.Transformation.Truven;
using System.Data;
using static org.ohdsi.cdm.framework.etl.Transformation.CDM.CdmPersonBuilder;
using static org.ohdsi.cdm.framework.etl.Transformation.CPRD.CprdPersonBuilder;
using static org.ohdsi.cdm.framework.etl.Transformation.CprdAurum.CprdAurumPersonBuilder;
using static org.ohdsi.cdm.framework.etl.Transformation.CprdHES.CprdHESPersonBuilder;
using static org.ohdsi.cdm.framework.etl.Transformation.Era.EraPersonBuilder;
using static org.ohdsi.cdm.framework.etl.Transformation.HealthVerity.HealthVerityPersonBuilder;
using static org.ohdsi.cdm.framework.etl.Transformation.JMDC.JmdcPersonBuilder;
using static org.ohdsi.cdm.framework.etl.Transformation.OptumExtended.OptumExtendedPersonBuilder;
using static org.ohdsi.cdm.framework.etl.Transformation.OptumPanther.OptumPantherPersonBuilder;
using static org.ohdsi.cdm.framework.etl.Transformation.PA.PregnancyAlgorithmPersonBuilder;
using static org.ohdsi.cdm.framework.etl.Transformation.Premier.PremierPersonBuilder;
using static org.ohdsi.cdm.framework.etl.Transformation.Truven.TruvenPersonBuilder;
using EtlTransformation = org.ohdsi.cdm.framework.etl.Transformation;

namespace org.ohdsi.cdm.presentation.builder.Utility
{
    public class VendorHelper
    {
        class Container
        {
            public Vendor Vendor { get; }
            public Func<PersonBuilder> PersonBuilderFactory { get; }
            public string PrimaryKey { get; }

            public Container(
                Func<Vendor> vendorFactory,
                Func<Vendor, PersonBuilder> personBuilderFactory,
                string primaryKey)
            {
                Vendor = vendorFactory();
                PersonBuilderFactory = () => personBuilderFactory(Vendor);
                PrimaryKey = primaryKey;
            }
        }

        static readonly Dictionary<string, Container> VendorFactories =
            new Dictionary<string, Container>(StringComparer.OrdinalIgnoreCase)
            {
                ["CDM"] = new Container(() => new CdmVendor(), v => new CdmPersonBuilder(v), "PERSON_ID"),
                ["Cprd"] = new Container(() => new CprdVendor(), v => new CprdPersonBuilder(v), "patid"),
                ["CprdAurum"] = new Container(() => new CprdAurumVendor(), v => new CprdAurumPersonBuilder(v), "patid"),
                ["CprdHES"] = new Container(() => new CprdHESVendor(), v => new CprdHESPersonBuilder(v), "patid"),
                ["Era"] = new Container(() => new EraVendor(), v => new EraPersonBuilder(v), "PERSON_ID"),
                ["HealthVerity"] = new Container(() => new HealthVerityVendor(), v => new HealthVerityPersonBuilder(v), "hvid"),
                ["OptumExtendedSES"] = new Container(() => new OptumExtendedSESVendor(), v => new OptumExtendedPersonBuilder(v), "patid"),
                ["OptumExtendedDOD"] = new Container(() => new OptumExtendedDODVendor(), v => new OptumExtendedPersonBuilder(v), "patid"),
                ["OptumPanther"] = new Container(() => new OptumPantherVendor(), v => new OptumPantherPersonBuilder(v), "ptid"),
                ["JMDC"] = new Container(() => new JmdcVendor(), v => new JmdcPersonBuilder(v), "member_id"),
                ["PregnancyAlgorithm"] = new Container(() => new PregnancyAlgorithmVendor(), v => new PregnancyAlgorithmPersonBuilder(v), "PERSON_ID"),
                ["Premier"] = new Container(() => new PremierVendor(), v => new PremierPersonBuilder(v), "medrec_key"),
                ["Truven_MDCD"] = new Container(() => new Truven_MDCDVendor(), v => new TruvenPersonBuilder(v), "ENROLID"),
                ["Truven_MDCR"] = new Container(() => new Truven_MDCRVendor(), v => new TruvenPersonBuilder(v), "ENROLID"),
                ["Truven_CCAE"] = new Container(() => new Truven_CCAEVendor(), v => new TruvenPersonBuilder(v), "ENROLID"),
            };

        public static Vendor GetVendor(string vendorName)
        {
            if (!VendorFactories.TryGetValue(vendorName, out var container))
                throw new InvalidOperationException($"Unknown vendor '{vendorName}'");

            return container.Vendor;
        }

        public static PersonBuilder CreatePersonBuilder()
        {
            var vendorName = Settings.Current.Building.VendorToProcess.Name;

            if (!VendorFactories.TryGetValue(vendorName, out var container))
                throw new InvalidOperationException($"Unknown vendor '{vendorName}'");

            return container.PersonBuilderFactory();
        }

        public static string GetVendorPrimaryKeyName()
        {
            var vendorName = Settings.Current.Building.VendorToProcess.Name;

            if (!VendorFactories.TryGetValue(vendorName, out var container))
                throw new InvalidOperationException($"Unknown vendor '{vendorName}'");

            return container.PrimaryKey;
        }
    }
}
