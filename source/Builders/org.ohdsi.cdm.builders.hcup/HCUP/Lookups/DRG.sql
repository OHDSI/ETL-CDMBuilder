SELECT distinct old_drg.concept_code AS source_code, new_drg.concept_id AS target_concept_id
FROM concept old_drg
INNER JOIN concept_relationship
	ON old_drg.concept_id = concept_id_1
INNER JOIN concept new_drg
	ON new_drg.concept_id = concept_id_2
WHERE lower(old_drg.vocabulary_id) = 'drg'
	AND lower(relationship_id) = 'maps to'
	AND lower(new_drg.standard_concept) = 's'
	AND lower(new_drg.vocabulary_id) = 'drg'
