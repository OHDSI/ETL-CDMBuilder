using System.ComponentModel;
using org.ohdsi.cdm.framework.shared.Attributes;

namespace org.ohdsi.cdm.framework.shared.Enums
{
   public enum Vendors
   {
      [CDMVersion(CDMVersions.v501)]
      [Folder("TruvenV5")]
      [Description("Truven CCAE v5")]
      [CDMSource("CdmSourceCCAE.sql")]
      [MaxDegreeOfParallelism(15)]
      [NumOfChunks(0)]
      [ChunkSize(1000*1000)]
      Truven_CCAE = 3,

      [CDMVersion(CDMVersions.v501)]
      [Folder("TruvenV5")]
      [Description("Truven MDCR v5")]
      [CDMSource("CdmSourceMDCR.sql")]
      [MaxDegreeOfParallelism(10)]
      [NumOfChunks(0)]
      [ChunkSize(1000 * 1000)]
      Truven_MDCR = 4,

      [CDMVersion(CDMVersions.v501)]
      [Folder("TruvenV5")]
      [BatchFile("BatchMDCD.sql")]
      [Description("Truven MDCD v5")]
      [CDMSource("CdmSourceMDCD.sql")]
      [MaxDegreeOfParallelism(13)]
      [NumOfChunks(0)]
      [ChunkSize(1000 * 1000)]
      Truven_MDCD = 5,

      [CDMVersion(CDMVersions.v5)]
      [Folder("CprdV5")]
      [Description("Cprd v5")]
      [IngredientLevelFileAttribute("IngredientLevelV5_CPRD.sql")]
      [MaxDegreeOfParallelism(7)]
      [NumOfChunks(0)]
      [ChunkSize(1000 * 1000)]
      CprdV5 = 2,

      [CDMVersion(CDMVersions.v501)]
      [Folder("PremierV5")]
      [Description("Premier v5.01")]
      [MaxDegreeOfParallelism(15)]
      [NumOfChunks(0)]
      [ChunkSize(1000 * 1000)]
      PremierV5 = 1,

      [CDMVersion(CDMVersions.v5)]
      [Folder("ERAsV5")]
      [Description("ERAsV5")]
      [MaxDegreeOfParallelism(1)]
      [NumOfChunks(0)]
      [ChunkSize(1000)]
      ErasV5 = 9999, // vendor schema id?

      [CDMVersion(CDMVersions.v5)]
      [Folder("JMDCv5")]
      [Description("JMDC v5")]
      [MaxDegreeOfParallelism(5)]
      [NumOfChunks(0)]
      [ChunkSize(500*1000)]
      JMDCv5 = 13,

      [CDMVersion(CDMVersions.v5)]
      [Folder("SEER")]
      [Description("SEER v5")]
      [MaxDegreeOfParallelism(5)]
      [NumOfChunks(0)]
      [ChunkSize(500 * 1000)]
      SEER = 16,

      [CDMVersion(CDMVersions.v501)]
      [Folder("OptumExtendedSes")]
      [Description("Optum Extended SES v5")]
      [CDMSource("CdmSourceSES.sql")]
      [MaxDegreeOfParallelism(15)]
      [NumOfChunks(0)]
      [ChunkSize(1000 * 1000)]
      OptumExtendedSES = 29,

      [CDMVersion(CDMVersions.v501)]
      [Folder("OptumExtendedSes")]
      [Description("Optum Extended DOD v5")]
      [CDMSource("CdmSourceDOD.sql")]
      [MaxDegreeOfParallelism(15)]
      [NumOfChunks(0)]
      [ChunkSize(1000 * 1000)]
      OptumExtendedDOD = 27,

      [CDMVersion(CDMVersions.v5)]
      [Folder("OptumOncology")]
      [Description("Optum Oncology v5")]
      [MaxDegreeOfParallelism(6)]
      [NumOfChunks(0)]
      [ChunkSize(500 * 1000)]
      OptumOncology = 23,

      [CDMVersion(CDMVersions.v5)]
      [Folder("OptumIntegrated")]
      [Description("Optum Integrated v5")]
      [MaxDegreeOfParallelism(6)]
      [NumOfChunks(0)]
      [ChunkSize(500 * 1000)]
      OptumIntegrated = 12,

      [CDMVersion(CDMVersions.v5)]
      [Folder("HCUP")]
      [Description("HCUP v5")]
      [MaxDegreeOfParallelism(20)]
      [NumOfChunks(0)]
      [ChunkSize(50 * 1000)]
      HCUPv5 = 26
   }
}

