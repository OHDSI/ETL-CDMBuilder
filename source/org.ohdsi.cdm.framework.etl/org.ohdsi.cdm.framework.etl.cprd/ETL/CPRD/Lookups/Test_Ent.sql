{base},
Standard as (
SELECT distinct SOURCE_CODE, TARGET_CONCEPT_ID, TARGET_DOMAIN_ID, SOURCE_VALID_START_DATE as VALID_START_DATE, SOURCE_VALID_END_DATE as VALID_END_DATE, SOURCE_VOCABULARY_ID
FROM Source_to_Standard
WHERE lower(SOURCE_VOCABULARY_ID)='jnj_cprd_test_ent' AND (TARGET_INVALID_REASON is NULL or TARGET_INVALID_REASON = '')
AND lower(TARGET_STANDARD_CONCEPT) = 's'
)

select distinct Standard.SOURCE_CODE, Standard.TARGET_CONCEPT_ID, Standard.TARGET_DOMAIN_ID, Standard.VALID_START_DATE, Standard.VALID_END_DATE, Standard.SOURCE_VOCABULARY_ID, 0 as SOURCE_TARGET_CONCEPT_ID, Standard.VALID_START_DATE as SOURCE_VALID_START_DATE, Standard.VALID_END_DATE, ingredient_level.ingredient_concept_id
from Standard
left join ingredient_level on ingredient_level.concept_id = Standard.TARGET_CONCEPT_ID 