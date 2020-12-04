SELECT distinct REPLACE(icd9.concept_code, '.', '') AS source_code, standard.concept_id AS target_concept_id, standard.domain_id as TARGET_DOMAIN_ID, null as  VALID_START_DATE, null as VALID_END_DATE,
null as SOURCE_VOCABULARY_ID, icd9.concept_id AS SOURCE_TARGET_CONCEPT_ID, null as SOURCE_VALID_START_DATE, null as SOURCE_VALID_END_DATE, null as ingredient_concept_id
FROM {sc}.concept icd9
INNER JOIN {sc}.concept_relationship
	ON icd9.concept_id = concept_id_1
INNER JOIN {sc}.concept standard
	ON standard.concept_id = concept_id_2
WHERE lower(icd9.vocabulary_id) = 'icd9cm'
	AND lower(standard.standard_concept) = 's'
	AND lower(relationship_id) = 'maps to'
	AND (concept_relationship.invalid_reason IS NULL OR concept_relationship.invalid_reason = '')