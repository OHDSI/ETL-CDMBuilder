SELECT distinct REPLACE(icd9.concept_code, '.', '') AS source_code, standard.concept_id as CONCEPT_ID, 'None' as Domain, icd9.valid_start_date, icd9.valid_end_date
FROM {sc}.concept icd9
INNER JOIN {sc}.concept_relationship
	ON icd9.concept_id = concept_id_1
INNER JOIN {sc}.concept standard
	ON standard.concept_id = concept_id_2
WHERE lower(icd9.vocabulary_id) = 'icd9cm'
	AND lower(standard.standard_concept) = 's'
	AND lower(relationship_id) = 'maps to value'
	AND (concept_relationship.invalid_reason IS NULL OR concept_relationship.invalid_reason = '')