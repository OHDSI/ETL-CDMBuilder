WITH top_level
AS
(SELECT concept_id, concept_name
  FROM {sc}.concept 
  LEFT JOIN {sc}.concept_ancestor 
 	ON concept_id=descendant_concept_id 
    AND ancestor_concept_id!=descendant_concept_id
  WHERE domain_id='Visit' 
 	AND standard_concept='S'
    AND ancestor_concept_id IS NULL
)

/*Find all descendants of those ancestors*/
SELECT distinct descendant.concept_id, top_level.concept_id as terminal_ancestor_concept_id, 'None' as Domain, cast('1900/1/1' as date) as VALID_START_DATE, cast('2100/1/1' as date) as VALID_END_DATE
FROM {sc}.concept_ancestor
JOIN top_level  
	ON top_level.concept_id = ancestor_concept_id
JOIN {sc}.concept descendant 
	ON descendant.concept_id = descendant_concept_id
WHERE descendant.domain_id = 'Visit';