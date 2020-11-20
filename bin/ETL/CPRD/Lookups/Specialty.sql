SELECT distinct SOURCE_CODE, TARGET_CONCEPT_ID, 'None' as Domain, NULL AS valid_start_date, NULL AS valid_end_date
FROM {sc}.SOURCE_TO_CONCEPT_MAP
where lower(source_vocabulary_id) in ('jnj_cprd_prov_spec')