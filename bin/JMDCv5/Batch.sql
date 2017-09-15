SELECT DISTINCT {0} CAST(RIGHT([Member ID], LEN([Member ID]) - 1) AS BIGINT) AS person_id, [Member ID]
FROM {sc}.Enrollment
order by 1