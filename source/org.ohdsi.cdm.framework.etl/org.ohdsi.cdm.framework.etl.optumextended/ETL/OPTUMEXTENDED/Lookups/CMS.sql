﻿{base},
Standard as (
SELECT distinct SOURCE_CODE, TARGET_CONCEPT_ID, TARGET_DOMAIN_ID, SOURCE_VALID_START_DATE, SOURCE_VALID_END_DATE
FROM Source_to_Standard
WHERE lower(SOURCE_VOCABULARY_ID) IN ('cms place of service')
AND lower(TARGET_STANDARD_CONCEPT) = 's'
AND (TARGET_INVALID_REASON IS NULL or TARGET_INVALID_REASON = '')
)

select distinct SOURCE_CODE, TARGET_CONCEPT_ID, TARGET_DOMAIN_ID, SOURCE_VALID_START_DATE, SOURCE_VALID_END_DATE
from Standard