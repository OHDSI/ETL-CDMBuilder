using System;

namespace org.ohdsi.cdm.framework.common.Omop
{
    public class FactRelationship : IEquatable<FactRelationship>
    {
        public long DomainConceptId1 { get; set; }

        public long FactId1 { get; set; }

        public long DomainConceptId2 { get; set; }

        public long FactId2 { get; set; }

        public long RelationshipConceptId { get; set; }

        public bool Equals(FactRelationship other)
        {
            return DomainConceptId1 == other.DomainConceptId1 && FactId1 == other.FactId1 &&
                   DomainConceptId2 == other.DomainConceptId2 && FactId2 == other.FactId2 &&
                   RelationshipConceptId == other.RelationshipConceptId;
        }


        public override int GetHashCode()
        {
            return DomainConceptId1.GetHashCode() ^
                   FactId1.GetHashCode() ^
                   DomainConceptId2.GetHashCode() ^
                   FactId2.GetHashCode() ^
                   RelationshipConceptId.GetHashCode();
        }
    }
}
