using System.Collections.Generic;
using System.Data;
using org.ohdsi.cdm.framework.entities.Builder;
using org.ohdsi.cdm.framework.entities.Omop;
using org.ohdsi.cdm.framework.shared.Extensions;

namespace org.ohdsi.cdm.framework.core.Definitions
{
   public class PersonDefinition : EntityDefinition
   {
      public string PersonSourceValue { get; set; }
      public string Gender { get; set; }
      public string YearOfBirth { get; set; }
      public string MonthOfBirth { get; set; }
      public string DayOfBirth { get; set; }
      public string Location { get; set; }
      public string Country { get; set; }

      public string CareSiteId { get; set; }

      public string Race { get; set; }
      public string RaceConceptId { get; set; }
      public string Ethnicity { get; set; }
      public string EthnicityConceptId { get; set; }
      public string LocationId { get; set; }
      public string ObservationPeriodGap { get; set; }

      public override IEnumerable<IEntity> GetConcepts(Concept concept, IDataReader reader, KeyMasterOffset keyMaster)
      {
         var locationSourceValue = reader.GetString(Location);
         int? locationId = null;
         if (!string.IsNullOrEmpty(Location))
         {
            locationId = Vocabulary.LookupLocation(locationSourceValue);
         }

         var observationPeriodGap = 32;
         if(!string.IsNullOrEmpty(ObservationPeriodGap))
         {
            observationPeriodGap = int.Parse(ObservationPeriodGap);
         }

         var genderSource = reader.GetString(Gender);
         var genderConceptId = Vocabulary.LookupGender(genderSource);

         var personId = reader.GetLong(PersonId);
         if(personId.HasValue)
         {
            yield return new Person
                            {
                               ObservationPeriodGap = observationPeriodGap,
                               PersonId = personId.Value,
                               StartDate = reader.GetDateTime(StartDate),
                               EndDate = reader.GetDateTime(EndDate),
                               PersonSourceValue = reader.GetString(PersonSourceValue),
                               GenderSourceValue = genderSource,
                               GenderConceptId = genderConceptId,
                               LocationId = locationId,
                               YearOfBirth = reader.GetInt(YearOfBirth),
                               MonthOfBirth = reader.GetInt(MonthOfBirth),
                               DayOfBirth = reader.GetInt(DayOfBirth),
                               LocationSourceValue = locationSourceValue,
                               CareSiteId = reader.GetInt(CareSiteId),
                               EthnicitySourceValue = reader.GetString(Ethnicity),
                               EthnicityConceptId = reader.GetInt(EthnicityConceptId) ?? 0,
                               RaceSourceValue = reader.GetString(Race),
                               RaceConceptId = reader.GetInt(RaceConceptId) ?? 0,
                               ProviderId = reader.GetInt(ProviderId)
                            };
         }
      }
   }
}
