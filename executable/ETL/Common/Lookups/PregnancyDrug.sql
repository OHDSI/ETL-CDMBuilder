SELECT distinct c.concept_id, ANCESTOR_CONCEPT_ID
FROM {sc}.concept_ancestor ca
join {sc}.concept c on c.concept_id = ca.DESCENDANT_CONCEPT_ID
where concept_class_id in ('Branded Drug','Branded Pack','Clinical Drug','Clinical Pack','Ingredient')
-- pregnancy_concepts with category in ('CONTRA','MTX','OVULDR')
and ANCESTOR_CONCEPT_ID in (969444, 970277, 1300978, 1305058, 1500211, 1503184, 
1515417, 1515774, 1519936, 1521369,  1521592, 1542948, 
1543112, 1549786, 1552310, 1563600, 1588000, 1589505, 1595461, 
1597235, 1598819, 19092358, 19128258, 40225722, 43077184, 43125784)