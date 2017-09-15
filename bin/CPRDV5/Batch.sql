with pat as
(
select a.patid, yob,
case when a.crd > b.uts then a.crd
    else b.uts end as observation_period_start_date,
    case when a.tod IS null and a.deathdate IS null then b.lcd
    when a.deathdate IS null and a.tod is not null and a.tod < b.lcd  then a.tod
    when a.deathdate IS null and a.tod is not null and a.tod >= b.lcd  then b.lcd
    when a.tod IS null and a.deathdate is not null and a.deathdate < b.lcd
    then a.deathdate
    when a.tod IS null and a.deathdate is not null and a.deathdate >= b.lcd
    then b.lcd
    when a.deathdate IS not null and a.tod IS not null and
    a.tod <= b.lcd and a.tod <= a.deathdate then a.tod
    when a.deathdate IS not null and a.tod IS not null and
    b.lcd <= a.tod and b.lcd <= a.deathdate then b.lcd
    when  a.deathdate IS not null and a.tod IS not null and
    a.deathdate <= a.tod and a.deathdate <= b.lcd then a.deathdate
    else '23-DEC-2099' end
    as observation_period_end_date
	from {sc}.PATIENT a
    left outer join {sc}.hes_patient c on c.patid=a.patid
    join {sc}.practice b on a.pracid = b.pracid
    where accept = 1 and yob + 1800 > 1899
)
SELECT DISTINCT {0} patid, patid FROM pat
where observation_period_start_date < observation_period_end_date
order by 1