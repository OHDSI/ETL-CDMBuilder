{base},
Standard as (
SELECT distinct SOURCE_CODE, TARGET_CONCEPT_ID, TARGET_DOMAIN_ID, SOURCE_VALID_START_DATE, SOURCE_VALID_END_DATE
FROM Source_to_Standard
WHERE lower(SOURCE_VOCABULARY_ID) IN ('cpt4')
AND lower(TARGET_VOCABULARY_ID) IN ('cpt4') 
and lower(TARGET_CONCEPT_CLASS_ID) in ('cpt4 modifier') 
)

select distinct Standard.*
from Standard