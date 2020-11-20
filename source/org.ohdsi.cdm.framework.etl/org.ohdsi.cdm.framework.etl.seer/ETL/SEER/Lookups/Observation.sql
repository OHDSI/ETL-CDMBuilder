{base},
Standard as (
SELECT distinct SOURCE_CODE, TARGET_CONCEPT_ID, TARGET_DOMAIN_ID, SOURCE_VALID_START_DATE, SOURCE_VALID_END_DATE
FROM Source_to_Standard
where lower(SOURCE_VOCABULARY_ID) = 'jnj_seer_registry'
)

select distinct Standard.*
from Standard