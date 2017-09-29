{Source_to_Source}
SELECT distinct SOURCE_CODE, TARGET_CONCEPT_ID
FROM CTE_VOCAB_MAP
WHERE lower(SOURCE_VOCABULARY_ID) IN ('icd9proc', 'cpt4', 'hcpcs')
AND lower(TARGET_VOCABULARY_ID) IN ('icd9proc', 'cpt4', 'hcpcs') AND lower(TARGET_DOMAIN_ID)='procedure'
