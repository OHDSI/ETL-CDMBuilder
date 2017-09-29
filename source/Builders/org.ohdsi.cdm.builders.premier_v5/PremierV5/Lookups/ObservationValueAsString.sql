{Source_to_Standard}
SELECT distinct SOURCE_CODE_DESCRIPTION, TARGET_CONCEPT_ID
FROM CTE_VOCAB_MAP
WHERE lower(SOURCE_VOCABULARY_ID) IN ('jnj_pmr_obs_code') and lower(TARGET_DOMAIN_ID) = 'observation'