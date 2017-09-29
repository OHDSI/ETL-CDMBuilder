{Source_to_Standard}
SELECT distinct SOURCE_CODE, TARGET_CONCEPT_ID, TARGET_DOMAIN_ID
FROM CTE_VOCAB_MAP
WHERE lower(SOURCE_VOCABULARY_ID) IN ('hcpcs','cpt4', 'icd9proc','icd10pcs')
AND lower(TARGET_STANDARD_CONCEPT) = 's'
AND (TARGET_INVALID_REASON IS NULL or TARGET_INVALID_REASON = '')
AND lower(TARGET_CONCEPT_CLASS_ID) NOT IN ('hcpcs modifier','cpt4 modifier','icd10pcs hierarchy')
