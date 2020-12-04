SELECT distinct CONCEPT_CODE, CONCEPT_ID, 'None' as Domain, valid_start_date, valid_end_date
FROM {sc}.concept
WHERE lower(VOCABULARY_ID) = 'visit'