using System.Collections.Generic;
using System.Data;
using org.ohdsi.cdm.framework.entities.Builder;
using org.ohdsi.cdm.framework.entities.Omop;
using org.ohdsi.cdm.framework.shared.Extensions;

namespace org.ohdsi.cdm.framework.core.Definitions
{
   public class OrganizationDefinition : EntityDefinition
   {
      public string LocationId { get; set; }
      public string PlaceOfService { get; set; }

      public override IEnumerable<IEntity> GetConcepts(Concept concept, IDataRecord reader, KeyMasterOffset keyOffset)
      {
         var conceptField = Concepts[0].Fields[0];
         var id = string.IsNullOrEmpty(Id) ? KeyMaster.GetOrganizationId() : reader.GetLong(Id);

         yield return new Organization
                         {
                            Id = id.Value,
                            ConceptId = conceptField.DefaultConceptId.HasValue ? conceptField.DefaultConceptId.Value : 0,
                            LocationId = 0, 
                            SourceValue = reader.GetString(conceptField.Key),
                            PlaceOfSvcSourceValue = string.IsNullOrEmpty(PlaceOfService) ? "" : reader.GetString(PlaceOfService)
                         };
      }
   }
}
