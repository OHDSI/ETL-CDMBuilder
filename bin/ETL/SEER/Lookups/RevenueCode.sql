{base},
Source as (
SELECT distinct SOURCE_CODE, TARGET_CONCEPT_ID, TARGET_DOMAIN_ID, SOURCE_VALID_START_DATE, SOURCE_VALID_END_DATE
FROM Source_to_Source
WHERE lower(SOURCE_VOCABULARY_ID) IN ('revenue code')
AND lower(TARGET_VOCABULARY_ID) IN ('revenue code') 
)


select distinct Source.*
from Source

