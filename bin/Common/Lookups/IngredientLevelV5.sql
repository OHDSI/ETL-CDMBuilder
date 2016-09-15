Select distinct A.concept_id as Drug_EXPOSURE_concept_id,
				C.concept_id as ingredient_concept_id
FROM {sc}.CONCEPT C
JOIN CONCEPT_ANCESTOR CA
	ON CA.ancestor_concept_id = C.concept_id
	and c.vocabulary_id = 'RxNorm'
	and c.concept_class_id = 'Ingredient'
	and invalid_reason is null
JOIN {sc}.CONCEPT A
	ON CA.descendant_CONCEPT_ID = A.CONCEPT_ID
