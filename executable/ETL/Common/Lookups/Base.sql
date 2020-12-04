WITH Source_to_Standard AS (
       SELECT c.concept_code AS SOURCE_CODE, c.concept_id AS SOURCE_CONCEPT_ID, c.concept_name AS SOURCE_CODE_DESCRIPTION, c.vocabulary_id AS SOURCE_VOCABULARY_ID, 
                           c.domain_id AS SOURCE_DOMAIN_ID, c.CONCEPT_CLASS_ID AS SOURCE_CONCEPT_CLASS_ID, 
                                                   c.VALID_START_DATE AS SOURCE_VALID_START_DATE, c.VALID_END_DATE AS SOURCE_VALID_END_DATE, c.INVALID_REASON AS SOURCE_INVALID_REASON, 
                           c1.concept_id AS TARGET_CONCEPT_ID, c1.concept_name AS TARGET_CONCEPT_NAME, c1.VOCABULARY_ID AS TARGET_VOCABULARY_ID, c1.domain_id AS TARGET_DOMAIN_ID, c1.concept_class_id AS TARGET_CONCEPT_CLASS_ID, 
                           c1.INVALID_REASON AS TARGET_INVALID_REASON, c1.standard_concept AS TARGET_STANDARD_CONCEPT
       FROM {sc}.CONCEPT C
             JOIN {sc}.CONCEPT_RELATIONSHIP CR
                        ON C.CONCEPT_ID = CR.CONCEPT_ID_1
                        AND (CR.invalid_reason IS NULL or CR.invalid_reason = '')
                        AND (cr.relationship_id) = 'Maps to'
              JOIN {sc}.CONCEPT C1
                        ON CR.CONCEPT_ID_2 = C1.CONCEPT_ID
                        AND (C1.INVALID_REASON IS NULL or C1.INVALID_REASON = '')
	   UNION
       SELECT source_code, SOURCE_CONCEPT_ID, SOURCE_CODE_DESCRIPTION, source_vocabulary_id, c1.domain_id AS SOURCE_DOMAIN_ID, c2.CONCEPT_CLASS_ID AS SOURCE_CONCEPT_CLASS_ID,
                                        c1.VALID_START_DATE AS SOURCE_VALID_START_DATE, c1.VALID_END_DATE AS SOURCE_VALID_END_DATE, 
                     stcm.INVALID_REASON AS SOURCE_INVALID_REASON,target_concept_id, c2.CONCEPT_NAME AS TARGET_CONCEPT_NAME, target_vocabulary_id, c2.domain_id AS TARGET_DOMAIN_ID, c2.concept_class_id AS TARGET_CONCEPT_CLASS_ID, 
                     c2.INVALID_REASON AS TARGET_INVALID_REASON, c2.standard_concept AS TARGET_STANDARD_CONCEPT
       FROM {sc}.source_to_concept_map stcm
              LEFT OUTER JOIN {sc}.CONCEPT c1
                     ON c1.concept_id = stcm.source_concept_id
              LEFT OUTER JOIN {sc}.CONCEPT c2
                     ON c2.CONCEPT_ID = stcm.target_concept_id
       WHERE (stcm.INVALID_REASON IS NULL or stcm.INVALID_REASON = '')
), Source_to_Source as (
       SELECT c.concept_code AS SOURCE_CODE, c.concept_id AS SOURCE_CONCEPT_ID, c.CONCEPT_NAME AS SOURCE_CODE_DESCRIPTION, 
                        c.vocabulary_id AS SOURCE_VOCABULARY_ID, c.domain_id AS SOURCE_DOMAIN_ID, c.concept_class_id AS SOURCE_CONCEPT_CLASS_ID, 
            c.VALID_START_DATE AS SOURCE_VALID_START_DATE, c.VALID_END_DATE AS SOURCE_VALID_END_DATE, c.invalid_reason AS SOURCE_INVALID_REASON, 
            c.concept_ID as TARGET_CONCEPT_ID, c.concept_name AS TARGET_CONCEPT_NAME, c.vocabulary_id AS TARGET_VOCABULARY_ID, c.domain_id AS TARGET_DOMAIN_ID, 
                        c.concept_class_id AS TARGET_CONCEPT_CLASS_ID, c.INVALID_REASON AS TARGET_INVALID_REASON, 
            c.STANDARD_CONCEPT AS TARGET_STANDARD_CONCEPT
       FROM {sc}.CONCEPT C
	   UNION
       SELECT source_code, SOURCE_CONCEPT_ID, SOURCE_CODE_DESCRIPTION, source_vocabulary_id, c1.domain_id AS SOURCE_DOMAIN_ID, c2.CONCEPT_CLASS_ID AS SOURCE_CONCEPT_CLASS_ID, 
                                        c1.VALID_START_DATE AS SOURCE_VALID_START_DATE, c1.VALID_END_DATE AS SOURCE_VALID_END_DATE,stcm.INVALID_REASON AS SOURCE_INVALID_REASON,
                                        target_concept_id, c2.CONCEPT_NAME AS TARGET_CONCEPT_NAME, target_vocabulary_id, c2.domain_id AS TARGET_DOMAIN_ID, c2.concept_class_id AS TARGET_CONCEPT_CLASS_ID, 
                     c2.INVALID_REASON AS TARGET_INVALID_REASON, c2.standard_concept AS TARGET_STANDARD_CONCEPT
       FROM {sc}.source_to_concept_map stcm
              LEFT OUTER JOIN {sc}.CONCEPT c1
                     ON c1.concept_id = stcm.source_concept_id
              LEFT OUTER JOIN {sc}.CONCEPT c2
                     ON c2.CONCEPT_ID = stcm.target_concept_id
       WHERE (stcm.INVALID_REASON IS NULL or stcm.INVALID_REASON = '')
), ingredient_level as (
Select distinct A.concept_id as concept_id,
				C.concept_id as ingredient_concept_id
FROM {sc}.CONCEPT C
JOIN {sc}.CONCEPT_ANCESTOR CA
	ON CA.ancestor_concept_id = C.concept_id
	and (c.vocabulary_id) = 'RxNorm'
	and (c.concept_class_id) = 'Ingredient'
	and (invalid_reason is null or invalid_reason = '')
JOIN {sc}.CONCEPT A
	ON CA.descendant_CONCEPT_ID = A.CONCEPT_ID
)