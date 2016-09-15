with dups_pat_key as
(
SELECT distinct pat_key
FROM dbo.pat
WHERE medrec_key is not NULL 
group by pat_key
having count(*) > 1
)
, dups_medrec_key as
(
SELECT distinct dbo.pat.medrec_key
FROM dbo.pat
join dups_pat_key on dups_pat_key.pat_key = dbo.pat.pat_key
),
p as
(
SELECT DISTINCT {0} medrec_key
FROM dbo.pat
WHERE medrec_key is not NULL 
AND (year(adm_date) - age) > 1900 -- Invalid Year Of Birth (Year Prior to 1900)
AND (year(adm_date) - age) <= YEAR(getdate()) -- Invalid Year Of Birth (Year of Birth greater than current year)
)

select p.medrec_key, p.medrec_key
from p
left join dups_medrec_key as dups on (p.medrec_key = dups.medrec_key)
where dups.medrec_key is null

