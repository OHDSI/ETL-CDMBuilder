{Source_to_Standard}
SELECT distinct REPLACE(SOURCE_CODE, '.', '') AS SOURCE_CODE, TARGET_CONCEPT_ID, TARGET_DOMAIN_ID, cast('1900/1/1' as date) as validStartDate, cast('2100/1/1' as date) as validEndDate, SOURCE_VOCABULARY_ID
FROM CTE_VOCAB_MAP
WHERE lower(SOURCE_VOCABULARY_ID) IN ('icd9proc','hcpcs','cpt4', 'icd10pcs')
AND (TARGET_STANDARD_CONCEPT IS NOT NULL or TARGET_STANDARD_CONCEPT != '')
AND (TARGET_INVALID_REASON IS NULL or TARGET_INVALID_REASON = '')
AND lower(TARGET_CONCEPT_CLASS_ID) NOT IN ('hcpcs modifier','cpt4 modifier','icd10pcs hierarchy')
