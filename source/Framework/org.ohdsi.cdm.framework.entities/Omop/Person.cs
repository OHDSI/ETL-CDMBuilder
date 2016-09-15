using System;
using org.ohdsi.cdm.framework.shared.Enums;

namespace org.ohdsi.cdm.framework.entities.Omop 
{
   public class Person : Entity, IEquatable<Person>
   {
      public int ObservationPeriodGap { get; set; }
      public int? GenderConceptId { get; set; }
      public int? RaceConceptId { get; set; }
      public int? EthnicityConceptId { get; set; }

      public int? LocationId { get; set; }
      public int? CareSiteId { get; set; }

      public int? YearOfBirth { get; set; }
      public int? MonthOfBirth { get; set; }
      public int? DayOfBirth { get; set; }
      
      public string PersonSourceValue { get; set; }
      public string GenderSourceValue { get; set; }
      public string EthnicitySourceValue { get; set; }
      public string RaceSourceValue { get; set; }
      public string LocationSourceValue { get; set; }

      // CDM v5 props
      public string TimeOfBirth { get; set; }
      public int? GenderSourceConceptId { get; set; }
      public int? RaceSourceConceptId { get; set; }
      public int? EthnicitySourceConceptId { get; set; }

      public Person()
      {
         
      }

      public Person(Entity ent)
      {
         Init(ent);
      }

      public bool Equals(Person other)
      {
         return this.PersonId.Equals(other.PersonId);
      }

      public override string ToString() 
      {
			return PersonId + " : " + PersonSourceValue;
		}

      public override int GetHashCode()
      {
         return PersonId.GetHashCode();
      }

      public override EntityType GeEntityType()
      {
         return EntityType.Person;
      }
   }
}
