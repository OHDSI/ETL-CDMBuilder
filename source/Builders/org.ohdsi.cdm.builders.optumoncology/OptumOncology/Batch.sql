SELECT DISTINCT {0} cast(replace(lower(ptid), 'pt','') as bigint) AS person_id, ptid
FROM {sc}.patient
order by 1