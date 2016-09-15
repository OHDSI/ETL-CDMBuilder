using System.Collections.Generic;
using System.Data;
using org.ohdsi.cdm.framework.entities.Builder;
using org.ohdsi.cdm.framework.entities.Omop;

namespace org.ohdsi.cdm.framework.core.Definitions
{
   public class OrganizationDefinition : EntityDefinition
   {
      public string LocationId { get; set; }
      public string PlaceOfService { get; set; }

      public override IEnumerable<IEntity> GetConcepts(Concept concept, IDataRecord reader, KeyMasterOffset keyOffset)
      {
         var conceptField = Concepts[0].Fields[0];
         var id = string.IsNullOrEmpty(Id) ? KeyMaster.GetOrganizationId() : int.Parse(reader[Id].ToString());

         yield return new Organization
                         {
                            Id = id,
                            ConceptId = conceptField.DefaultConceptId.HasValue ? conceptField.DefaultConceptId.Value : 0,
                            LocationId = 0, 
                            SourceValue = reader[conceptField.Key].ToString().Trim(),
                            PlaceOfSvcSourceValue = string.IsNullOrEmpty(PlaceOfService) ? "" : reader[PlaceOfService].ToString()
                         };
      }
   }
}
