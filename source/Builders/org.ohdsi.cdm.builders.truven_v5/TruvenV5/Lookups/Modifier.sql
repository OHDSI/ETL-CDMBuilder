{Source_to_Standard}
SELECT distinct SOURCE_CODE, TARGET_CONCEPT_ID
FROM CTE_VOCAB_MAP
WHERE lower(SOURCE_VOCABULARY_ID) IN ('cpt4')
AND lower(TARGET_VOCABULARY_ID) IN ('cpt4') 
and lower(TARGET_CONCEPT_CLASS_ID) in ('cpt4 modifier') 



