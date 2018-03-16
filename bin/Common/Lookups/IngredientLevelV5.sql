Select distinct A.concept_id as Drug_EXPOSURE_concept_id,
				C.concept_id as ingredient_concept_id
FROM {sc}.CONCEPT C
JOIN {sc}.CONCEPT_ANCESTOR CA
	ON CA.ancestor_concept_id = C.concept_id
	and lower(c.vocabulary_id) = 'rxnorm'
	and lower(c.concept_class_id) = 'ingredient'
	and (invalid_reason is null or invalid_reason = '')
JOIN {sc}.CONCEPT A
	ON CA.descendant_CONCEPT_ID = A.CONCEPT_ID
