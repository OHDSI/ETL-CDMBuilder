using org.ohdsi.cdm.framework.common.Builder;
using org.ohdsi.cdm.framework.common.Extensions;
using org.ohdsi.cdm.framework.common.Omop;
using System;
using System.Collections.Generic;
using System.Data;

namespace org.ohdsi.cdm.framework.common.Definitions
{
    public class PersonDefinition : EntityDefinition
    {
        public string PersonSourceValue { get; set; }
        public string Gender { get; set; }
        public string YearOfBirth { get; set; }
        public string MonthOfBirth { get; set; }
        public string DayOfBirth { get; set; }
        public string DeathDatetime { get; set; }
        public string Location { get; set; }
        public string Country { get; set; }

        public string CareSiteId { get; set; }

        public string Race { get; set; }
        public string RaceConceptId { get; set; }
        public string Ethnicity { get; set; }
        public string EthnicityConceptId { get; set; }
        public string LocationId { get; set; }
        public string ObservationPeriodGap { get; set; }

        // CDM v5 props
        public string TimeOfBirth { get; set; }
        public string GenderSourceConceptId { get; set; }
        public string RaceSourceConceptId { get; set; }
        public string EthnicitySourceConceptId { get; set; }
        public string PeriodTypeConceptId { get; set; }

        public string PotentialChildId { get; set; }
        public string PotentialChildBirthDate { get; set; }

        public override IEnumerable<IEntity> GetConcepts(Concept concept, IDataRecord reader,
            KeyMasterOffsetManager keyOffset)
        {
            var locationSourceValue = reader.GetString(Location);
            long? locationId = null;
            if (!string.IsNullOrEmpty(Location))
            {
                locationId = Entity.GetId(locationSourceValue);
            }

            var genderSource = reader.GetString(Gender);
            var genderConceptId = Vocabulary.LookupGender(genderSource);

            var personId = reader.GetLong(PersonId);
            if (personId.HasValue)
            {
                Dictionary<string, string> additionalFields = null;
                if (AdditionalFields != null)
                {
                    additionalFields =
                        new Dictionary<string, string>(AdditionalFields.Length, StringComparer.OrdinalIgnoreCase);
                    foreach (var additionalField in AdditionalFields)
                    {
                        additionalFields.Add(additionalField, reader.GetString(additionalField));
                    }
                }

                var startDate = reader.GetDateTime(StartDate);
                var endDate = reader.GetDateTime(EndDate);
                var startTime = reader.GetTime(StartTime) ??
                                startDate.TimeOfDay;
                var endTime = reader.GetTime(EndTime) ?? endDate.TimeOfDay;

                DateTime? timeOfBirth = null;
                var tob = reader.GetDateTime(TimeOfBirth);
                if (tob > DateTime.MinValue)
                    timeOfBirth = tob;

                var deathDatetime = reader.GetDateTime(DeathDatetime);

                yield return new Person
                {
                    ObservationPeriodGap = reader.GetInt(ObservationPeriodGap) ?? 32,
                    AdditionalFields = additionalFields,
                    PersonId = personId.Value,
                    StartDate = startDate,
                    EndDate = endDate,
                    PersonSourceValue = reader.GetString(PersonSourceValue),
                    GenderSourceValue = genderSource,
                    GenderConceptId = genderConceptId ?? 0,
                    LocationId = locationId,
                    YearOfBirth = reader.GetInt(YearOfBirth),
                    MonthOfBirth = reader.GetInt(MonthOfBirth),
                    DayOfBirth = reader.GetInt(DayOfBirth),
                    TimeOfDeath = deathDatetime == DateTime.MinValue ? (DateTime?)null : deathDatetime,
                    LocationSourceValue = locationSourceValue,
                    CareSiteId = reader.GetLong(CareSiteId),
                    EthnicitySourceValue = reader.GetString(Ethnicity),
                    EthnicityConceptId = reader.GetInt(EthnicityConceptId) ?? 0,
                    RaceSourceValue = reader.GetString(Race),
                    RaceConceptId = reader.GetInt(RaceConceptId) ?? 0,
                    ProviderId = reader.GetLong(ProviderId),
                    TimeOfBirth = timeOfBirth,
                    GenderSourceConceptId = reader.GetInt(GenderSourceConceptId) ?? 0, // CCAE
                    RaceSourceConceptId = reader.GetInt(RaceSourceConceptId) ?? 0,
                    EthnicitySourceConceptId = reader.GetInt(EthnicitySourceConceptId) ?? 0,
                    TypeConceptId = reader.GetInt(PeriodTypeConceptId),
                    PotentialChildId = reader.GetLong(PotentialChildId),
                    PotentialChildBirthDate = reader.GetDateTime(PotentialChildBirthDate)
                };
            }
        }
    }
}
