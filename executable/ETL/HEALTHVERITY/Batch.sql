SELECT DISTINCT {0} row_number() over (order by hvid) person_id, hvid
from 
(
SELECT distinct hvid FROM {sc}.lab 
where logical_delete_reason is null or logical_delete_reason = '' or logical_delete_reason = 'null'
and upper(result_name) not in ('PATIENT SYMPTOMATIC?','SOURCE:','SOURCE') 
union
SELECT distinct hvid FROM {sc}.pharmacy_claims where logical_delete_reason is null or logical_delete_reason = '' or logical_delete_reason = 'null'
union
SELECT distinct hvid FROM {sc}.medical_claims where logical_delete_reason is null or logical_delete_reason = '' or logical_delete_reason = 'null'
union
SELECT distinct hvid FROM {sc}.enrollment
) a 
order by 1