{Source_to_Standard}
SELECT distinct SOURCE_CODE, TARGET_CONCEPT_ID
FROM CTE_VOCAB_MAP
where 
(
lower(SOURCE_VOCABULARY_ID) IN ('jnj_pmr_proc_chrg_cd', 'cpt4', 'hcpcs', 'icd10cm', 'icd10pcs', 'icd9cm', 'icd9proc') AND lower(TARGET_DOMAIN_ID) ='procedure' AND lower(SOURCE_CONCEPT_CLASS_ID) NOT IN ('cpt4 modifier', 'icd10pcs hierarchy')
)
OR
(
lower(SOURCE_VOCABULARY_ID) IN ('jnj_pmr_proc_chrg_cd') AND TARGET_CONCEPT_ID=0
)



