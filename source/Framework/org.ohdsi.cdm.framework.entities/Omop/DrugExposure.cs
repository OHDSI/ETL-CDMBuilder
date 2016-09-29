using System;
using System.Collections.Generic;
using org.ohdsi.cdm.framework.shared.Enums;

namespace org.ohdsi.cdm.framework.entities.Omop 
{
   public class DrugExposure : Entity, IEquatable<DrugExposure>
   {
      public DrugCost DrugCost { get; set; }
      public Func<long, HashSet<long?>> GetEraConceptIdsCall;

      public DrugExposure(IEntity ent)
      {
         Init(ent);
      }

      public string StopReason { get; set; }
      public int? Refills { get; set; }
      public decimal? Quantity { get; set; }
      public int? DaysSupply { get; set; }
      public int? CalculatedDaysSupply { get; set; }
      public string Sig { get; set; }
      public long? RelevantConditionConceptId { get; set; }

      // CDM v5 props
      public long? RouteConceptId { get; set; }
      public decimal? EffectiveDrugDose { get; set; }
      public long? DoseUnitConceptId { get; set; }
      public string LotNumber  { get; set; }
      public string RouteSourceValue  { get; set; }
      public string DoseUnitSourceValue { get; set; }

      public bool Equals(DrugExposure other)
      {
         return this.PersonId.Equals(other.PersonId) &&
                this.ConceptId == other.ConceptId &&
                this.TypeConceptId == other.TypeConceptId &&
                this.SourceValue == other.SourceValue &&
                this.StopReason == other.StopReason &&
                this.Refills == other.Refills &&
                this.Quantity == other.Quantity &&
                this.DaysSupply == other.DaysSupply &&
                this.Sig == other.Sig &&
                this.RouteConceptId == other.RouteConceptId &&
                this.EffectiveDrugDose == other.EffectiveDrugDose &&
                this.DoseUnitConceptId == other.DoseUnitConceptId &&
                this.SourceConceptId == other.SourceConceptId &&
                this.LotNumber == other.LotNumber &&
                this.RouteSourceValue == other.RouteSourceValue &&
                this.DoseUnitSourceValue == other.DoseUnitSourceValue &&
                this.ProviderId == other.ProviderId &&
                this.RelevantConditionConceptId == other.RelevantConditionConceptId &&
                this.VisitOccurrenceId == other.VisitOccurrenceId &&
                this.StartDate == other.StartDate &&
                this.EndDate == other.EndDate;
      }

      public override int GetHashCode()
      {
         return PersonId.GetHashCode() ^
                ConceptId.GetHashCode() ^
                TypeConceptId.GetHashCode() ^
                (SourceValue != null ? SourceValue.GetHashCode() : 0) ^
                (StopReason != null ? StopReason.GetHashCode() : 0) ^
                Refills.GetHashCode() ^
                VisitOccurrenceId.GetHashCode() ^
                Quantity.GetHashCode() ^
                DaysSupply.GetHashCode() ^
                RouteConceptId.GetHashCode() ^
                EffectiveDrugDose.GetHashCode() ^
                DoseUnitConceptId.GetHashCode() ^
                SourceConceptId.GetHashCode() ^
                (Sig != null ? Sig.GetHashCode() : 0) ^
                (LotNumber != null ? LotNumber.GetHashCode() : 0) ^
                (RouteSourceValue != null ? RouteSourceValue.GetHashCode() : 0) ^
                (DoseUnitSourceValue != null ? DoseUnitSourceValue.GetHashCode() : 0) ^
                ProviderId.GetHashCode() ^
                RelevantConditionConceptId.GetHashCode() ^
                (StartDate.GetHashCode()) ^
                (EndDate.GetHashCode());
      }

      public override HashSet<long?> GetEraConceptIds()
      {
         return GetEraConceptIdsCall(ConceptId);
      }

      public override bool IncludeInEra()
      {
         if (ConceptId == 0) return false;
         
         return base.IncludeInEra();
      }

      public override DateTime GetEndDate()
      {
         if (TypeConceptId == 38000175 || TypeConceptId == 38000176)
         {
            if (DaysSupply.HasValue)
            {
               return StartDate.AddDays(DaysSupply.Value);
            }
         }

         return base.GetEndDate();
      }

      public override EntityType GeEntityType()
      {
         return EntityType.DrugExposure;
      }
   }
}
