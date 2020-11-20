using org.ohdsi.cdm.framework.common.Enums;

namespace org.ohdsi.cdm.framework.common.Omop
{
    public class ObservationPeriod : Entity
    {
        public override EntityType GeEntityType()
        {
            return EntityType.ObservationPeriod;
        }
    }
}
