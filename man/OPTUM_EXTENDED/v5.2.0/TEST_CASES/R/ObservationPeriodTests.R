createObservationPeriodTests <- function()
{
  patient <- createPatient()
  declareTest("Tests if 2 enrollment durations (where second is subsumed by the first) results in a single observation period", 
              source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', eligeff = '2000-05-01', eligend = '2008-12-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  add_member_detail(aso = 'N', bus = 'COM', eligeff = '2000-05-01', eligend = '2008-02-29',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  expect_count_observation_period(rowCount = 1, person_id = patient$person_id)


  patient <- createPatient()
  declareTest("Tests if 2 enrollment durations (where second is within 30 days of first) results in a single observation period", 
              source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'Y', bus = 'COM', eligeff = '2000-05-01', eligend = '2005-12-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  add_member_detail(aso = 'Y', bus = 'COM', eligeff = '2006-01-01', eligend = '2011-12-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'EPO', yrdob = 1969)
  expect_count_observation_period(rowCount = 1, person_id = patient$person_id)


  patient <- createPatient()
  declareTest("Tests if 2 enrollment durations (where second starts 33 days after first) results in two observation periods", 
              source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', eligeff = '2001-04-01', eligend = '2006-12-31',
                    gdr_cd = 'M', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  add_member_detail(aso = 'N', bus = 'COM', eligeff = '2000-05-01', eligend = '2000-12-31',
                    gdr_cd = 'M', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  expect_count_observation_period(rowCount = 2, person_id = patient$person_id)
}
