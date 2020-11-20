using org.ohdsi.cdm.framework.common.PregnancyAlgorithm;
using System;
using System.Collections.Generic;

namespace org.ohdsi.cdm.framework.common.Lookups
{
    public interface IVocabulary
    {
        void Fill(bool forLookup, bool readFromS3);

        List<LookupValue> Lookup(string sourceValue, string key, DateTime eventDate);

        int? LookupGender(string genderSourceValue);
        IEnumerable<PregnancyConcept> LookupPregnancyConcept(int conceptId);
    }
}
