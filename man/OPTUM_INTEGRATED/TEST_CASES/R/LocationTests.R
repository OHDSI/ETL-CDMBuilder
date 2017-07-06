createLocationTests <- function () {
  
  # Execute Optum Oncology Tests ----
  
  patient <- createPatient();
  declareTest("Simple Location", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male',
              first_month_active = '200701', last_month_active = '201001', region = "REGION", division = "DIVISION");
  add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2000-09-01', eligend = '2000-11-30')
  expect_count_location(rowCount = 1, location_source_value = "REGION_DIVISION");
  
  patient <- createPatient();
  declareTest("No Location Dupes", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male',
              first_month_active = '200701', last_month_active = '201001', region = "DUPE_REGION", division = "DUPE_DIVISION");
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male',
              first_month_active = '200701', last_month_active = '201001', region = "DUPE_REGION", division = "DUPE_DIVISION");
  add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2000-09-01', eligend = '2000-11-30')
  expect_count_location(rowCount = 1, location_source_value = "DUPE_REGION_DUPE_DIVISION");
}
