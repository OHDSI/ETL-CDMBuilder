SELECT REPLACE(icd10.concept_code, '.', ''), concept_id_2
FROM concept_relationship
INNER JOIN concept icd10
ON icd10.concept_id = concept_id_1
WHERE lower(icd10.vocabulary_id) = 'icd10'
AND lower(relationship_id) = 'maps to value'
AND (concept_relationship.invalid_reason IS NULL or concept_relationship.invalid_reason = '')