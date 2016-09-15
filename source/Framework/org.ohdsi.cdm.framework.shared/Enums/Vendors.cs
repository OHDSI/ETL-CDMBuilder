using System.ComponentModel;
using org.ohdsi.cdm.framework.shared.Attributes;

namespace org.ohdsi.cdm.framework.shared.Enums
{
   public enum Vendors
   {
      [CDMVersion(CDMVersions.v5)]
      [Folder("TruvenV5")]
      [Description("Truven CCAE v5")]
      [CDMSource("CdmSourceCCAE.sql")]
      Truven_CCAE,

      [CDMVersion(CDMVersions.v5)]
      [Folder("TruvenV5")]
      [Description("Truven MDCR v5")]
      [CDMSource("CdmSourceMDCR.sql")]
      Truven_MDCR,

      [CDMVersion(CDMVersions.v5)]
      [Folder("TruvenV5")]
      [BatchFile("BatchMDCD.sql")]
      [Description("Truven MDCD v5")]
      [CDMSource("CdmSourceMDCD.sql")]
      Truven_MDCD,

      [CDMVersion(CDMVersions.v5)]
      [Folder("CprdV5")]
      [Description("Cprd v5")]
      [IngredientLevelFileAttribute("IngredientLevelV5_CPRD.sql")]
      CprdV5,

      [CDMVersion(CDMVersions.v5)]
      [Folder("PremierV5")]
      [Description("Premier v5")]
      PremierV5,

      [CDMVersion(CDMVersions.v5)]
      [Folder("ERAsV5")]
      [Description("ERAsV5")]
      ErasV5,

      [CDMVersion(CDMVersions.v5)]
      [Folder("JMDCv5")]
      [Description("JMDC v5")]
      JMDCv5,

      [CDMVersion(CDMVersions.v5)]
      [Folder("SEER")]
      [Description("SEER v5")]
      SEER,

      [CDMVersion(CDMVersions.v5)]
      [Folder("OptumExtendedSes")]
      [Description("Optum Extended SES v5")]
      OptumExtendedSES,

      [CDMVersion(CDMVersions.v5)]
      [Folder("OptumOncology")]
      [Description("Optum Oncology v5")]
      OptumOncology
   }
}

