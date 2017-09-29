{Source_to_Source}
SELECT distinct REPLACE(SOURCE_CODE, '.', '') AS SOURCE_CODE, TARGET_CONCEPT_ID
FROM CTE_VOCAB_MAP
WHERE lower(SOURCE_VOCABULARY_ID) IN ('icd9cm', 'icd10cm', 'snomed')
AND lower(target_vocabulary_id) IN ('icd9cm', 'icd10cm', 'snomed')
union
SELECT distinct SOURCE_CODE, TARGET_CONCEPT_ID
FROM CTE_VOCAB_MAP
WHERE lower(SOURCE_VOCABULARY_ID) IN ('icd9cm', 'icd10cm')
AND lower(target_vocabulary_id) IN ('icd9cm', 'icd10cm', 'snomed')