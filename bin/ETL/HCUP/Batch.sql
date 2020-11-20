﻿SELECT DISTINCT {0} cast(cast(isnull(cast(key_nis as bigint), [key]) as varchar) + cast(year as varchar) as bigint) AS person_id, isnull(cast(key_nis as bigint), [key])
FROM {sc}.CORE
where [key] is not null or key_nis is not null
order by 1