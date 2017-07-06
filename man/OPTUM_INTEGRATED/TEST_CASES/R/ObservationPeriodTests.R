createObservationPeriodTests <- function () {
  
  # Optum Integrated specific tests ----

  patient <- createPatient();
  declareTest("Clinical Period < Eligibility Start", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid = patient$ptid, first_month_active = '201005', last_month_active = '201312')
  add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2011-05-01', eligend = '2014-12-31')
  expect_observation_period(person_id = patient$person_id, 
                            observation_period_start_date = '05-01-2011', 
                            observation_period_end_date = '12-31-2013')
  
  patient <- createPatient();
  declareTest("Clinical Period > Eligibility Start", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid = patient$ptid, first_month_active = '201105', last_month_active = '201312')
  add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2010-01-01', eligend = '2014-12-31')
  expect_observation_period(person_id = patient$person_id, 
                            observation_period_start_date = '05-01-2011', 
                            observation_period_end_date = '12-31-2013')

  patient <- createPatient();
  declareTest("Eligibility Start > Clinical Period < Eligibility Start - aka Eligibility subsumes Clinical Period", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid = patient$ptid, first_month_active = '201105', last_month_active = '201112')
  add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2010-01-01', eligend = '2014-12-31')
  expect_observation_period(person_id = patient$person_id, 
                            observation_period_start_date = '05-01-2011', 
                            observation_period_end_date = '12-31-2011')
  
  patient <- createPatient();
  declareTest("Clinical Start > Eligibility Period < Clinical End - aka Clinical Period subsumes Eligibility", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid = patient$ptid, first_month_active = '201001', last_month_active = '201412')
  add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2011-05-01', eligend = '2011-12-31')
  expect_observation_period(person_id = patient$person_id, 
                            observation_period_start_date = '05-01-2011', 
                            observation_period_end_date = '12-31-2011')
  
  patient <- createPatient();
  declareTest("No overlap in eligibility and clinical periods", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid = patient$ptid, first_month_active = '201001', last_month_active = '201012')
  add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2012-01-01', eligend = '2012-12-31')
  expect_no_observation_period(person_id = patient$person_id)

  # Execute Optum Oncology Tests ----
  patient <- createPatient();
  declareTest("Tests if 2 patient durations (where second is subsumed by the first) results in a single observation period", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2000-05-01', eligend = '2015-12-31')
  add_patient(ptid = patient$ptid, first_month_active = '201005', last_month_active = '201412')
  add_patient(ptid = patient$ptid, first_month_active = '201006', last_month_active = '201411')
  expect_count_observation_period(rowCount = 1, person_id = patient$person_id)
  
  patient <- createPatient();
  declareTest("Tests if 2 patient durations (where second is within 30 days of first) results in a single observation period", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2000-01-01', eligend = '2014-12-31')
  add_patient(ptid = patient$ptid, first_month_active = '200005', last_month_active = '200512')
  add_patient(ptid = patient$ptid, first_month_active = '200601', last_month_active = '201112')
  expect_count_observation_period(rowCount = 1, person_id = patient$person_id)
  
  patient <- createPatient();
  declareTest("Tests if 2 patient durations (where second starts 33 days after first) results in two observation periods", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2000-01-01', eligend = '2012-12-31')
  add_patient(ptid = patient$ptid, first_month_active = '200005', last_month_active = '200012')
  add_patient(ptid = patient$ptid, first_month_active = '200104', last_month_active = '200612')
  expect_count_observation_period(rowCount = 2, person_id = patient$person_id)
  
  patient <- createPatient();
  declareTest("Patient duration is 1 month", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2012-01-01', eligend = '2012-12-31')
  add_patient(ptid = patient$ptid, first_month_active = '201205', last_month_active = '201205')
  expect_count_observation_period(rowCount = 1, person_id = patient$person_id)
}
