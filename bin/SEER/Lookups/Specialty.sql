﻿{Source_to_Standard}
SELECT DISTINCT 
CASE
WHEN LEN(SOURCE_CODE) = 1 THEN '0' + SOURCE_CODE
ELSE SOURCE_CODE
END as SOURCE_CODE, TARGET_CONCEPT_ID
FROM CTE_VOCAB_MAP
WHERE lower(SOURCE_VOCABULARY_ID) IN ('specialty')
AND lower(TARGET_VOCABULARY_ID) IN ('specialty')
