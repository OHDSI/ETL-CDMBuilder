createPersonTests <- function () {
  patient <- createPatient();
  declareTest("Tests Unknown gender does not get loaded", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Unknown',
              first_month_active = '200701', last_month_active = '201001')
  expect_no_person(person_id = patient$person_id)


  patient <- createPatient();
  declareTest("Tests Male gender", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male',
              first_month_active = '200701', last_month_active = '201001')
  expect_person(person_id = patient$person_id, year_of_birth = 1950, gender_concept_id = 8507)


  patient <- createPatient();
  declareTest("Tests Female gender", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Female',
              first_month_active = '200701', last_month_active = '201001')
  expect_person(person_id = patient$person_id, year_of_birth = 1950, gender_concept_id = 8532)


  patient <- createPatient();
  declareTest("Tests Unknown birth year", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid=patient$ptid, birth_yr = 'Unknown', gender = 'Male',
              first_month_active = '200701', last_month_active = '201001')
  expect_no_person(person_id = patient$person_id)


  patient <- createPatient();
  declareTest("Tests 1927 and earlier birth year", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid=patient$ptid, birth_yr = '1927 and earlier', gender = 'Male',
              first_month_active = '200701', last_month_active = '201001')
  expect_person(person_id = patient$person_id, gender_concept_id = 8507, year_of_birth = 1927)

  patient <- createPatient();
  declareTest("Tests 1930 birth year", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid=patient$ptid, birth_yr = '1930', gender = 'Male',
              first_month_active = '200701', last_month_active = '201001')
  expect_person(person_id = patient$person_id, gender_concept_id = 8507, year_of_birth = 1930)


  patient <- createPatient();
  declareTest("Tests Asian race", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male', race = 'Asian',
              first_month_active = '200701', last_month_active = '201001')
  expect_person(person_id = patient$person_id, gender_concept_id = 8507, year_of_birth = 1950, race_concept_id = 8515,
                ethnicity_concept_id = 0)


  patient <- createPatient();
  declareTest("Tests African American race", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male', race = 'African American',
              first_month_active = '200701', last_month_active = '201001')
  expect_person(person_id = patient$person_id, gender_concept_id = 8507, year_of_birth = 1950, race_concept_id = 8516,
                ethnicity_concept_id = 0)


  patient <- createPatient();
  declareTest("Tests Caucasian race", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male', race = 'Caucasian',
              first_month_active = '200701', last_month_active = '201001')
  expect_person(person_id = patient$person_id, gender_concept_id = 8507, year_of_birth = 1950, race_concept_id = 8527,
                ethnicity_concept_id = 0)


  patient <- createPatient();
  declareTest("Tests Unknown race", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male', race = 'Other/Unknown',
              first_month_active = '200701', last_month_active = '201001')
  expect_person(person_id = patient$person_id, gender_concept_id = 8507, year_of_birth = 1950, race_concept_id = 0,
                ethnicity_concept_id = 0)


  patient <- createPatient();
  declareTest("Tests Hispanic ethnicity, Asian race", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male', race = 'Asian',
              first_month_active = '200701', last_month_active = '201001',
              ethnicity = 'Hispanic')
  expect_person(person_id = patient$person_id, gender_concept_id = 8507, year_of_birth = 1950, race_concept_id = 8515,
                ethnicity_concept_id = 38003563)


  patient <- createPatient();
  declareTest("Tests Hispanic ethnicity, African American race", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male', race = 'African American',
              first_month_active = '200701', last_month_active = '201001',
              ethnicity = 'Hispanic')
  expect_person(person_id = patient$person_id, gender_concept_id = 8507, year_of_birth = 1950, race_concept_id = 8516,
                ethnicity_concept_id = 38003563)


  patient <- createPatient();
  declareTest("Tests Hispanic ethnicity, Caucasian race", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male', race = 'Caucasian',
              first_month_active = '200701', last_month_active = '201001',
              ethnicity = 'Hispanic')
  expect_person(person_id = patient$person_id, gender_concept_id = 8507, year_of_birth = 1950, race_concept_id = 8527,
                ethnicity_concept_id = 38003563)


  patient <- createPatient();
  declareTest("Tests Hispanic ethnicity, unknown race", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male', race = 'Other/Unknown',
              first_month_active = '200701', last_month_active = '201001',
              ethnicity = 'Hispanic')
  expect_person(person_id = patient$person_id, gender_concept_id = 8507, year_of_birth = 1950, race_concept_id = 0,
                ethnicity_concept_id = 38003563)
  # TODO: add test of location_id
  # TODO: add test of provider_id
}
