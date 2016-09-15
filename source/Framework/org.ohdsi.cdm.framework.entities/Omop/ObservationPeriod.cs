using org.ohdsi.cdm.framework.shared.Enums;

namespace org.ohdsi.cdm.framework.entities.Omop
{
   public class ObservationPeriod : Entity
   {
      public override EntityType GeEntityType()
      {
         return EntityType.ObservationPeriod;
      }
   }
}
