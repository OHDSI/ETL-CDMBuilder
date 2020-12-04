{base},
Standard as (
SELECT distinct SOURCE_CODE, TARGET_CONCEPT_ID, TARGET_DOMAIN_ID, SOURCE_VALID_START_DATE, SOURCE_VALID_END_DATE
FROM Source_to_Standard
WHERE lower(SOURCE_VOCABULARY_ID) IN ('jnj_pmr_proc_chrg_cd')
AND lower(TARGET_DOMAIN_ID) = 'condition'
)

select distinct Standard.*
from Standard