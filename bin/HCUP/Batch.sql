SELECT DISTINCT {0} isnull(cast(key_nis as bigint), [key]) AS person_id, isnull(cast(key_nis as bigint), [key])
FROM {sc}.CORE
where ([key] is not null or key_nis is not null) and (age >= 0 or (age = 0 and ageday < 0))
order by isnull(cast(key_nis as bigint), [key])