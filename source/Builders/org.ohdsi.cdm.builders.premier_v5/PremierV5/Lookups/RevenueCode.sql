{Source_to_Standard}
SELECT distinct SOURCE_CODE_DESCRIPTION, TARGET_CONCEPT_ID
FROM CTE_VOCAB_MAP
WHERE lower(SOURCE_VOCABULARY_ID) IN ('jnj_pmr_cost_chrg_cd')
AND lower(TARGET_DOMAIN_ID) IN ('revenue code')
