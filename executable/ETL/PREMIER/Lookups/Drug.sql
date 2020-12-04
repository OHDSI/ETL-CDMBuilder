{base},
Standard as (
SELECT distinct SOURCE_CODE, TARGET_CONCEPT_ID, TARGET_DOMAIN_ID, SOURCE_VALID_START_DATE, SOURCE_VALID_END_DATE
FROM Source_to_Standard
WHERE lower(SOURCE_VOCABULARY_ID) IN ('cpt4', 'hcpcs', 'jnj_pmr_drug_chrg_cd')
AND lower(TARGET_DOMAIN_ID) = 'drug'
)

select distinct Standard.*, NULL AS SOURCE_VOCABULARY_ID, NULL AS SOURCE_TARGET_CONCEPT_ID,	NULL AS SOURCE_VALID_START_DATE, NULL AS SOURCE_VALID_END_DATE, ingredient_level.ingredient_concept_id
from Standard
left join ingredient_level on ingredient_level.concept_id = Standard.TARGET_CONCEPT_ID