using org.ohdsi.cdm.framework.common.Base;
using org.ohdsi.cdm.framework.common.Enums;
using org.ohdsi.cdm.framework.common.Utility;
using System.Data;
using EtlTransformation = org.ohdsi.cdm.framework.etl.Transformation;

namespace org.ohdsi.cdm.presentation.builder.Utility
{
    public class VendorHelper
    {
        public static Vendor GetVendor(string vendorName)
        {
            return vendorName switch
            {
                "CDM" => new EtlTransformation.CDM.CdmPersonBuilder.CdmVendor(),
                "Cprd" => new EtlTransformation.CPRD.CprdPersonBuilder.CprdVendor(),
                "CprdAurum" => new EtlTransformation.CprdAurum.CprdAurumPersonBuilder.CprdAurumVendor(),
                "CprdHES" => new EtlTransformation.CprdHES.CprdHESPersonBuilder.CprdHESVendor(),
                "Era" => new EtlTransformation.Era.EraPersonBuilder.EraVendor(),
                "HealthVerity" => new EtlTransformation.HealthVerity.HealthVerityPersonBuilder.HealthVerityVendor(),
                "OptumExtendedSES" => new EtlTransformation.OptumExtended.OptumExtendedPersonBuilder.OptumExtendedSESVendor(),
                "OptumExtendedDOD" => new EtlTransformation.OptumExtended.OptumExtendedPersonBuilder.OptumExtendedDODVendor(),
                "OptumPanther" => new EtlTransformation.OptumPanther.OptumPantherPersonBuilder.OptumPantherVendor(),
                "JMDC" => new EtlTransformation.JMDC.JmdcPersonBuilder.JmdcVendor(),
                "PregnancyAlgorithm" => new EtlTransformation.PA.PregnancyAlgorithmPersonBuilder.PregnancyAlgorithmVendor(),
                "Premier" => new EtlTransformation.Premier.PremierPersonBuilder.PremierVendor(),
                "Truven_MDCD" => new EtlTransformation.Truven.TruvenPersonBuilder.Truven_MDCDVendor(),
                "Truven_MDCR" => new EtlTransformation.Truven.TruvenPersonBuilder.Truven_MDCRVendor(),
                "Truven_CCAE" => new EtlTransformation.Truven.TruvenPersonBuilder.Truven_CCAEVendor(),

                _ => EtlLibrary.CreateVendorInstance(Directory.GetCurrentDirectory(), vendorName)
                ?? throw new NoNullAllowedException("Failed to setup the vendor!")
            };
        }

        public static PersonBuilder CreatePersonBuilder()
        {
            var vendor = Settings.Current.Building.VendorToProcess;
            return vendor.Name switch
            {
                "CDM" => new EtlTransformation.CDM.CdmPersonBuilder(vendor),
                "Cprd" => new EtlTransformation.CPRD.CprdPersonBuilder(vendor),
                "CprdAurum" => new EtlTransformation.CprdAurum.CprdAurumPersonBuilder(vendor),
                "CprdHES" => new EtlTransformation.CprdHES.CprdHESPersonBuilder(vendor),
                "Era" => new EtlTransformation.Era.EraPersonBuilder(vendor),
                "HealthVerity" => new EtlTransformation.HealthVerity.HealthVerityPersonBuilder(vendor),
                "OptumExtendedSES" => new EtlTransformation.OptumExtended.OptumExtendedPersonBuilder(vendor),
                "OptumExtendedDOD" => new EtlTransformation.OptumExtended.OptumExtendedPersonBuilder(vendor),
                "OptumPanther" => new EtlTransformation.OptumPanther.OptumPantherPersonBuilder(vendor),
                "JMDC" => new EtlTransformation.JMDC.JmdcPersonBuilder(vendor),
                "PregnancyAlgorithm" => new EtlTransformation.PA.PregnancyAlgorithmPersonBuilder(vendor),
                "Premier" => new EtlTransformation.Premier.PremierPersonBuilder(vendor),
                "Truven_MDCD" => new EtlTransformation.Truven.TruvenPersonBuilder(vendor),
                "Truven_MDCR" => new EtlTransformation.Truven.TruvenPersonBuilder(vendor),
                "Truven_CCAE" => new EtlTransformation.Truven.TruvenPersonBuilder(vendor),

                _ => throw new NotImplementedException("Failed to recognize vendor!")
            };
        }

        public static string GetVendorPrimaryKeyName()
        {
            var vendor = Settings.Current.Building.VendorToProcess;
            return vendor.Name switch
            {
                "CDM" => "PERSON_ID",
                "Cprd" => "patid",
                "CprdAurum" => "patid",
                "CprdHES" => "patid",
                "Era" => "PERSON_ID",
                "HealthVerity" => "hvid",
                "OptumExtendedSES" => "patid",
                "OptumExtendedDOD" => "patid",
                "OptumPanther" => "ptid",
                "JMDC" => "member_id",
                "PregnancyAlgorithm" => "PERSON_ID",
                "Premier" => "medrec_key",
                "Truven_MDCD" => "ENROLID",
                "Truven_MDCR" => "ENROLID",
                "Truven_CCAE" => "ENROLID",

                _ => throw new NotImplementedException("Failed to recognize vendor!")
            };
        }
    }
}
