SELECT DISTINCT {0} p.patid, p.patid
FROM {sc}.patient p
join {sc}.linkage_eligible le on le.patid = p.patid
where n_patid_hes <= 5 and hes_e = 1
order by p.patid