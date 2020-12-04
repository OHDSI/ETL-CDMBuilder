SELECT DISTINCT {0} SEQN, SEQN
FROM {sc}.nhanes_all
where lower(table_name) like 'demo%'
order by 1
