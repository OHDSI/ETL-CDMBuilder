SELECT distinct [SOURCE_CODE], [TARGET_CONCEPT_ID]
FROM {sc}.[SOURCE_TO_CONCEPT_MAP]
where lower(source_vocabulary_id) in ('jnj_cprd_prov_spec', 'jnj_cprd_prov_cms2')