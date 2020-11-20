SELECT distinct old_drg.concept_code AS source_code, new_drg.concept_id AS target_concept_id, null as TARGET_DOMAIN_ID, null as  VALID_START_DATE, null as 	VALID_END_DATE,
null as SOURCE_VOCABULARY_ID, old_drg.concept_id AS SOURCE_TARGET_CONCEPT_ID, null as SOURCE_VALID_START_DATE, null as SOURCE_VALID_END_DATE, null as ingredient_concept_id
FROM {sc}.concept old_drg
INNER JOIN {sc}.concept_relationship
	ON old_drg.concept_id = concept_id_1
INNER JOIN {sc}.concept new_drg
	ON new_drg.concept_id = concept_id_2
WHERE lower(old_drg.vocabulary_id) = 'drg'
	AND lower(relationship_id) = 'maps to'
	AND lower(new_drg.standard_concept) = 's'
	AND lower(new_drg.vocabulary_id) = 'drg'
