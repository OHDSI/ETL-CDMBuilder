{base},
Standard as (
SELECT distinct REPLACE(SOURCE_CODE, '.', '') AS SOURCE_CODE, TARGET_CONCEPT_ID, TARGET_DOMAIN_ID, SOURCE_VALID_START_DATE as VALID_START_DATE, SOURCE_VALID_END_DATE as VALID_END_DATE, SOURCE_VOCABULARY_ID
FROM Source_to_Standard
WHERE lower(SOURCE_VOCABULARY_ID) IN ('icd9cm')
AND (lower(TARGET_STANDARD_CONCEPT) = 's')
AND (TARGET_INVALID_REASON IS NULL or TARGET_INVALID_REASON = '')
), Source as (
SELECT distinct REPLACE(SOURCE_CODE, '.', '') as SOURCE_CODE, TARGET_CONCEPT_ID, SOURCE_VALID_START_DATE, SOURCE_VALID_END_DATE
FROM Source_to_Source
WHERE lower(SOURCE_VOCABULARY_ID) IN ('icd9cm')
AND lower(target_vocabulary_id) IN ('icd9cm')
), S_S as
(
select SOURCE_CODE from Standard
union 
select SOURCE_CODE from Source
)

select distinct S_S.SOURCE_CODE, Standard.TARGET_CONCEPT_ID, Standard.TARGET_DOMAIN_ID, Standard.VALID_START_DATE, Standard.VALID_END_DATE, Standard.SOURCE_VOCABULARY_ID, Source.TARGET_CONCEPT_ID as SOURCE_TARGET_CONCEPT_ID, Source.SOURCE_VALID_START_DATE as SOURCE_VALID_START_DATE, Source.SOURCE_VALID_END_DATE, ingredient_level.ingredient_concept_id
from S_S
left join Standard on Standard.SOURCE_CODE = S_S.SOURCE_CODE
left join Source on Source.SOURCE_CODE = S_S.SOURCE_CODE 
left join ingredient_level on ingredient_level.concept_id = Standard.TARGET_CONCEPT_ID