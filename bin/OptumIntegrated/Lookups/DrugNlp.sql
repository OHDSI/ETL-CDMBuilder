﻿{Source_to_Standard}

SELECT SOURCE_CODE, TARGET_CONCEPT_ID, TARGET_DOMAIN_ID
FROM CTE_VOCAB_MAP
WHERE lower(SOURCE_VOCABULARY_ID) = 'jnj_optum_nlp_drug'