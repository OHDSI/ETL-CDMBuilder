using System.ComponentModel;
using org.ohdsi.cdm.framework.shared.Attributes;

namespace org.ohdsi.cdm.framework.shared.Enums
{
   public enum Vendors
   {
      [CDMVersion(CDMVersions.v52)]
      [Folder("TruvenV5")]
      [Description("Truven CCAE v5.2")]
      [CDMSource("CdmSourceCCAE.sql")]
      [MaxDegreeOfParallelism(15)]
      [NumOfChunks(0)]
      [ChunkSize(1000*1000)]
      Truven_CCAE = 3,

      [CDMVersion(CDMVersions.v52)]
      [Folder("TruvenV5")]
      [Description("Truven MDCR v5.2")]
      [CDMSource("CdmSourceMDCR.sql")]
      [MaxDegreeOfParallelism(10)]
      [NumOfChunks(0)]
      [ChunkSize(1000 * 1000)]
      Truven_MDCR = 4,

      [CDMVersion(CDMVersions.v52)]
      [Folder("TruvenV5")]
      [BatchFile("BatchMDCD.sql")]
      [Description("Truven MDCD v5.2")]
      [CDMSource("CdmSourceMDCD.sql")]
      [MaxDegreeOfParallelism(13)]
      [NumOfChunks(0)]
      [ChunkSize(1000 * 1000)]
      Truven_MDCD = 5,

      [CDMVersion(CDMVersions.v52)]
      [Folder("CprdV5")]
      [Description("Cprd v5.2")]
      [IngredientLevelFileAttribute("IngredientLevelV5_CPRD.sql")]
      [MaxDegreeOfParallelism(7)]
      [NumOfChunks(0)]
      [ChunkSize(1000 * 1000)]
      CprdV5 = 2,

      [CDMVersion(CDMVersions.v52)]
      [Folder("PremierV5")]
      [Description("Premier v5.2")]
      [MaxDegreeOfParallelism(15)]
      [NumOfChunks(0)]
      [ChunkSize(1000 * 1000)]
      PremierV5 = 1,

      [CDMVersion(CDMVersions.v52)]
      [Folder("ERAsV5")]
      [Description("ERAsV5")]
      [MaxDegreeOfParallelism(1)]
      [NumOfChunks(0)]
      [ChunkSize(1000)]
      ErasV5 = 9999, // vendor schema id?

      [CDMVersion(CDMVersions.v52)]
      [Folder("JMDCv5")]
      [Description("JMDC v5.2")]
      [MaxDegreeOfParallelism(5)]
      [NumOfChunks(0)]
      [ChunkSize(500*1000)]
      JMDCv5 = 13,

      [CDMVersion(CDMVersions.v52)]
      [Folder("SEER")]
      [Description("SEER v5.2")]
      [MaxDegreeOfParallelism(5)]
      [NumOfChunks(0)]
      [ChunkSize(500 * 1000)]
      SEER = 16,

      [CDMVersion(CDMVersions.v52)]
      [Folder("OptumExtendedSes")]
      [Description("Optum Extended SES v5.2")]
      [CDMSource("CdmSourceSES.sql")]
      [MaxDegreeOfParallelism(10)]
      [NumOfChunks(0)]
      [ChunkSize(1000 * 1000)]
      OptumExtendedSES = 29,

      [CDMVersion(CDMVersions.v52)]
      [Folder("OptumExtendedSes")]
      [Description("Optum Extended DOD v5.2")]
      [CDMSource("CdmSourceDOD.sql")]
      [MaxDegreeOfParallelism(10)]
      [NumOfChunks(0)]
      [ChunkSize(1000 * 1000)]
      OptumExtendedDOD = 27,

      [CDMVersion(CDMVersions.v52)]
      [Folder("OptumOncology")]
      [Description("Optum Panther v5.2")]
      [MaxDegreeOfParallelism(6)]
      [NumOfChunks(0)]
      [ChunkSize(500 * 1000)]
      OptumOncology = 23,

      [CDMVersion(CDMVersions.v52)]
      [Folder("OptumIntegrated")]
      [Description("Optum Integrated v5.2")]
      [MaxDegreeOfParallelism(6)]
      [NumOfChunks(0)]
      [ChunkSize(500 * 1000)]
      OptumIntegrated = 12,

      [CDMVersion(CDMVersions.v52)]
      [Folder("HCUP")]
      [Description("HCUP v5.2")]
      [MaxDegreeOfParallelism(20)]
      [NumOfChunks(0)]
      [ChunkSize(50 * 1000)]
      HCUPv5 = 26,

      [CDMVersion(CDMVersions.v52)]
      [Folder("Cerner")]
      [Description("Cerner v5.2")]
      [MaxDegreeOfParallelism(6)]
      [NumOfChunks(0)]
      [ChunkSize(500 * 1000)]
      Cerner = 555,


   }
}

