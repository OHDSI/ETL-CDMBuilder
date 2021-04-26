using org.ohdsi.cdm.framework.common.Builder;
using org.ohdsi.cdm.framework.common.Extensions;
using org.ohdsi.cdm.framework.common.Omop;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;

namespace org.ohdsi.cdm.framework.common.Definitions
{
    public class ObservationPeriodDefinition : EntityDefinition
    {
        public string PeriodTypeConceptId { get; set; }

        public override IEnumerable<IEntity> GetConcepts(Concept concept, IDataRecord reader,
           KeyMasterOffsetManager keyOffset)
        {
            var personId = reader.GetLong(PersonId);

            var startDate = reader.GetDateTime(StartDate);
            var endDate = reader.GetDateTime(EndDate);

            if (personId.HasValue)
                yield return new ObservationPeriod()
                {
                    PersonId = personId.Value,
                    StartDate = startDate,
                    EndDate = endDate,
                    TypeConceptId = reader.GetInt(PeriodTypeConceptId)
                };
        }
    }
}

