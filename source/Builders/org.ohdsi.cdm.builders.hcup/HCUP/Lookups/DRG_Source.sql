SELECT distinct old_drg.concept_code AS source_code, old_drg.concept_id AS source_concept_id
FROM concept old_drg
INNER JOIN concept_relationship
	ON old_drg.concept_id = concept_id_1
INNER JOIN concept new_drg
	ON new_drg.concept_id = concept_id_2
WHERE old_drg.vocabulary_id = 'DRG'
	AND relationship_id = 'Maps to'
	AND new_drg.standard_concept = 'S'
	AND new_drg.vocabulary_id = 'DRG'
