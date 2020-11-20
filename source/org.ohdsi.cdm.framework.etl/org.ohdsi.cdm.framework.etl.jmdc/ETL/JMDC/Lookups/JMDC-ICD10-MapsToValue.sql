SELECT REPLACE(REPLACE(icd10.concept_code, '.', ''), '-', '') as CONCEPT_CODE, concept_id_2 as CONCEPT_ID, 'None' as Domain, icd10.valid_start_date, icd10.valid_end_date
FROM {sc}.concept_relationship
INNER JOIN {sc}.concept icd10 ON icd10.concept_id = concept_id_1
WHERE lower(icd10.vocabulary_id) = 'icd10'
AND lower(relationship_id) = 'maps to value'
AND (concept_relationship.invalid_reason IS NULL or concept_relationship.invalid_reason = '')