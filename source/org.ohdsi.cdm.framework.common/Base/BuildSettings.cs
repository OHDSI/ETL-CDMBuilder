using org.ohdsi.cdm.framework.common.Enums;
using System.Collections.Generic;

namespace org.ohdsi.cdm.framework.common.Base
{
    public class BuildSettings
    {
        public bool AllowUnknownGender { get; set; }
        public bool AllowGenderChanges { get; set; }
        public bool AllowMultipleYearsOfBirth { get; set; }
        public bool AllowUnknownYearOfBirth { get; set; }
        public bool AllowInvalidObservationTime { get; set; }
        public int ImplausibleYearOfBirthBefore { get; set; }
        public int ImplausibleYearOfBirthAfter { get; set; }

        public bool UseVisitRollupLogic { get; set; }

        public List<EraSetting> EraSettings { get; set; }
        public List<TableSetting> TableSettings { get; set; }
    }

    public class EraSetting
    {
        public EntityType Table { get; set; }
        public int GapWindow { get; set; }
        public int ConceptId { get; set; }
    }

    public class TableSetting
    {
        public EntityType Table { get; set; }
        public bool WithinTheObservationPeriod { get; set; }
    }
}
