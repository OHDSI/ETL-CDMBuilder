{Source_to_Source}
SELECT distinct SOURCE_CODE, TARGET_CONCEPT_ID
FROM CTE_VOCAB_MAP
WHERE lower(SOURCE_VOCABULARY_ID) IN ('icd10cm')
and lower(target_vocabulary_id) in ('icd10cm')
