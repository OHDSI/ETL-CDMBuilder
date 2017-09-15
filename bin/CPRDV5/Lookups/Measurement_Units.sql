SELECT distinct concept_name, concept_id
FROM {sc}.concept
where lower(domain_id)='unit' and lower(vocabulary_id)='ucum'