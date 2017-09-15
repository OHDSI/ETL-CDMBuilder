select c.concept_code, c1.concept_id
from {sc}.concept c
join {sc}.concept_relationship cr on c.concept_id = cr.concept_id_1 and lower(cr.relationship_id)='maps to'
join {sc}.concept c1 on cr.concept_id_2 = c1.concept_id and (lower(c1.vocabulary_id) = 'rxnorm')
where lower(c.vocabulary_id)='read'