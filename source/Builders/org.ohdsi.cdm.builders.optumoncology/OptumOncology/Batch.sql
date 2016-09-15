SELECT DISTINCT {0} cast(replace(ptid, 'PT','') as bigint) AS person_id, ptid
FROM {sc}.patient