SELECT DISTINCT {0} row_number() over (order by ptid) person_id, ptid
FROM {sc}.patient
order by 1