{base},
Source as (
SELECT distinct SOURCE_CODE_DESCRIPTION, TARGET_CONCEPT_ID, TARGET_DOMAIN_ID, SOURCE_VALID_START_DATE, SOURCE_VALID_END_DATE
FROM Source_to_Source
WHERE lower(SOURCE_VOCABULARY_ID) IN ('jnj_pmr_cost_chrg_cd')
AND lower(TARGET_DOMAIN_ID) IN ('revenue code')
)


select distinct Source.*
from Source
