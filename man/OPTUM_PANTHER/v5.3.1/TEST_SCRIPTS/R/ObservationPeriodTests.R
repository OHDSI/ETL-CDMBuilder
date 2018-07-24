createObservationPeriodTests <- function () {
  patient <- createPatient();
  declareTest("Tests if 2 patient durations (where second is subsumed by the first) results in a single observation period", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid = patient$ptid, first_month_active = '201005', last_month_active = '201412')
  add_patient(ptid = patient$ptid, first_month_active = '201006', last_month_active = '201411')
  expect_count_observation_period(rowCount = 1, person_id = patient$person_id)

  patient <- createPatient();
  declareTest("Tests if 2 patient durations (where second is within 30 days of first) results in a single observation period", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid = patient$ptid, first_month_active = '200005', last_month_active = '200512')
  add_patient(ptid = patient$ptid, first_month_active = '200601', last_month_active = '201112')
  expect_count_observation_period(rowCount = 1, person_id = patient$person_id)

  patient <- createPatient();
  declareTest("Tests if 2 patient durations (where second starts 33 days after first) results in two observation periods", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid = patient$ptid, first_month_active = '200104', last_month_active = '200612')
  add_patient(ptid = patient$ptid, first_month_active = '200005', last_month_active = '200012')
  expect_count_observation_period(rowCount = 2, person_id = patient$person_id)

  patient <- createPatient();
  declareTest("Patient duration is 1 month", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid = patient$ptid, first_month_active = '201305', last_month_active = '201305')
  expect_count_observation_period(rowCount = 1, person_id = patient$person_id)
}
