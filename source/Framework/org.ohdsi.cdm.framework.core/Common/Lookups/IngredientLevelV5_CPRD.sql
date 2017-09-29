SELECT DISTINCT 
      ca.DESCENDANT_CONCEPT_ID /*this is where you set the DRUG_EXPOSURE.DRUG_CONCEPT_ID to*/, 
   ca.ANCESTOR_CONCEPT_ID /*ingredient level*/ 
FROM {sc}.CONCEPT C1 
      JOIN {sc}.CONCEPT_ANCESTOR ca 
            ON ca.DESCENDANT_CONCEPT_ID = c1.CONCEPT_ID 
      JOIN {sc}.CONCEPT c2 
            ON c2.CONCEPT_ID = ca.ANCESTOR_CONCEPT_ID 
            AND lower(c2.VOCABULARY_ID) in ('rxnorm', 'multilex') 
            and lower(c2.concept_class_id)='ingredient' 
WHERE lower(c1.VOCABULARY_ID) in ('rxnorm', 'multilex') 