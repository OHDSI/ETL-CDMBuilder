using org.ohdsi.cdm.framework.common.Extensions;
using System.Data;

namespace org.ohdsi.cdm.framework.common.Definitions
{
    public class CostDefinition : EntityDefinition
    {
        public string PaidCopay { get; set; }
        public string PaidCoinsurance { get; set; }
        public string PaidTowardDeductible { get; set; }
        public string PaidByPayer { get; set; }
        public string PaidByCoordinationBenefits { get; set; }
        public string TotalOutOfPocket { get; set; }
        public string TotalPaid { get; set; }

        // CDM v5 props
        public string CurrencyConceptId { get; set; }

        public string IngredientCost { get; set; }
        public string DispensingFee { get; set; }
        public string AverageWholesalePrice { get; set; }

        internal void PopulateOthersConcepts(IDataRecord reader, out int? drgConceptId, out string drgSource,
            out int? revenueCodeConceptId, out string revenueCodeSource)
        {
            revenueCodeConceptId = 0;
            revenueCodeSource = null;
            drgConceptId = 0;
            drgSource = null;

            if (Concepts == null) return;

            if (Concepts != null && Concepts.Length > 0)
            {
                var revenueConcepts = Concepts[0].GetConceptIdValues(Vocabulary, Concepts[0].Fields[0], reader);
                revenueCodeSource = reader.GetString(Concepts[0].Fields[0].Key);

                if (revenueConcepts.Count > 0 && revenueConcepts[0].ConceptId.HasValue)
                {
                    revenueCodeConceptId = revenueConcepts[0].ConceptId;
                    revenueCodeSource = revenueConcepts[0].SourceCode;
                }
            }

            if (Concepts != null && Concepts.Length == 2)
            {
                var drgConcepts = Concepts[1].GetConceptIdValues(Vocabulary, Concepts[1].Fields[0], reader);
                drgSource = reader.GetString(Concepts[1].Fields[0].Key);

                if (drgConcepts.Count > 0 && drgConcepts[0].ConceptId.HasValue)
                {
                    drgConceptId = drgConcepts[0].ConceptId;
                    drgSource = drgConcepts[0].SourceCode;
                }
            }
        }
    }
}
