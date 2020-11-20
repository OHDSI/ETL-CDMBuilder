using org.ohdsi.cdm.framework.common.Builder;
using org.ohdsi.cdm.framework.common.Extensions;
using org.ohdsi.cdm.framework.common.Omop;
using System.Collections.Generic;
using System.Data;

namespace org.ohdsi.cdm.framework.common.Definitions
{
    public class CohortDefinition : EntityDefinition
    {
        public string StopReason { get; set; }

        public override IEnumerable<IEntity> GetConcepts(Concept concept, IDataRecord reader, KeyMasterOffsetManager offset)
        {
            var personId = reader.GetLong(PersonId);
            var startDate = reader.GetDateTime(StartDate);
            var endDate = reader.GetDateTime(EndDate);

            Entity e;
            if (concept != null && concept.Fields != null && concept.Fields.Length > 0)
            {
                e = new Entity
                {
                    IsUnique = false,
                    PersonId = personId.Value,
                    SourceValue = " ",
                    ConceptId = concept.Fields[0].DefaultConceptId.Value,
                    TypeConceptId = concept.Fields[0].DefaultTypeId.Value,
                    StartDate = startDate,
                    EndDate = endDate
                };
            }
            else
            {
                e = new Entity
                {
                    IsUnique = false,
                    PersonId = personId.Value,
                    StartDate = startDate,
                    EndDate = endDate
                };
            }

            yield return new Cohort(e)
            {
                Id = reader.GetLong(Id).Value
            };
        }
    }
}
