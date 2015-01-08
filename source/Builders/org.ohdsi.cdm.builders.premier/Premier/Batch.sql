with dups_pat_key as
(
SELECT distinct pat_key
FROM pat
group by pat_key
having count(*) > 1
)
, dups_medrec_key as
(
SELECT distinct medrec_key
FROM pat
where pat_key in (SELECT pat_key FROM dups_pat_key) 
)

SELECT DISTINCT {0}  medrec_key, medrec_key
FROM pat
WHERE medrec_key is not NULL AND (year(adm_date) - age) > 1900 AND (year(adm_date) - age) <= YEAR(getdate())
and medrec_key not in (SELECT medrec_key FROM dups_medrec_key) 

