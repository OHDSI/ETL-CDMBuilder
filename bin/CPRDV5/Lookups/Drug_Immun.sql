select c.concept_code, c1.concept_id
FROM {sc}.CONCEPT C
JOIN {sc}.CONCEPT_RELATIONSHIP cr on c.concept_id = cr.concept_id_1 and lower(cr.relationship_id)='maps to'
JOIN {sc}.CONCEPT c1 on cr.concept_id_2 = c1.concept_id and lower(c1.vocabulary_id) = 'rxnorm'
where lower(c.vocabulary_id)='read'