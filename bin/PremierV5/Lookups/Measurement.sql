{Source_to_Standard}
SELECT distinct SOURCE_CODE, TARGET_CONCEPT_ID
FROM CTE_VOCAB_MAP
WHERE lower(SOURCE_VOCABULARY_ID) IN ('cpt4', 'hcpcs', 'icd10cm', 'icd9cm', 'jnj_pmr_proc_chrg_cd', 'jnj_pmr_proc_chrg_cd')
AND lower(TARGET_DOMAIN_ID) = 'measurement'
