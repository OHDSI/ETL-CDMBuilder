{Source_to_Source}
SELECT distinct SOURCE_CODE, TARGET_CONCEPT_ID
FROM CTE_VOCAB_MAP
WHERE lower(SOURCE_VOCABULARY_ID) IN ('icd9cm', 'cpt4', 'hcpcs', 'mdc')
AND lower(TARGET_VOCABULARY_ID) IN  ('icd9cm', 'cpt4', 'hcpcs', 'mdc') and lower(TARGET_DOMAIN_ID)='observation'
union
SELECT distinct SOURCE_CODE, TARGET_CONCEPT_ID
FROM CTE_VOCAB_MAP
WHERE lower(SOURCE_VOCABULARY_ID) IN ('drg')
AND lower(TARGET_VOCABULARY_ID) IN  ('drg') and lower(TARGET_DOMAIN_ID)='observation'
