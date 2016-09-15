SELECT REPLACE(icd10.concept_code, '.', ''), concept_id_2
FROM concept_relationship
INNER JOIN concept icd10
ON icd10.concept_id = concept_id_1
WHERE icd10.vocabulary_id = 'ICD10'
AND relationship_id = 'Maps to value'
AND concept_relationship.invalid_reason IS NULL