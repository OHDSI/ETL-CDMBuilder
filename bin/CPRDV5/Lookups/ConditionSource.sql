﻿{Source_to_Source}
SELECT distinct SOURCE_CODE, TARGET_CONCEPT_ID
FROM CTE_VOCAB_MAP
WHERE lower(SOURCE_VOCABULARY_ID) = 'read' AND lower(TARGET_VOCABULARY_ID) = 'read'