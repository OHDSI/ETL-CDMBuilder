SELECT DISTINCT {0} patid, patid FROM {sc}.Patient 
WHERE accept = 1 and yob + 1800 > 1899
order by patid