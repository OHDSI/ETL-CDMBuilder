{Source_to_Standard}
SELECT distinct REPLACE(SOURCE_CODE, '.', '') AS SOURCE_CODE, TARGET_CONCEPT_ID, TARGET_DOMAIN_ID
FROM CTE_VOCAB_MAP
WHERE lower(SOURCE_VOCABULARY_ID) IN ('icd9cm') AND lower(TARGET_VOCABULARY_ID) IN ('snomed')
AND lower(TARGET_DOMAIN_ID) IN ('condition', 'procedure', 'device', 'measurement', 'observation')

