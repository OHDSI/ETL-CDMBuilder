{Source_to_Standard}
SELECT distinct lower(SOURCE_CODE), TARGET_CONCEPT_ID
FROM CTE_VOCAB_MAP
where lower(SOURCE_VOCABULARY_ID) = 'jnj_seer_registry'

