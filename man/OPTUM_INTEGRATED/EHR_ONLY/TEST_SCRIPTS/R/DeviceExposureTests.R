createDeviceExposureTests <- function () {

  ######################################
  # PROCEDURE
  ######################################

  patient <- createPatient();
  declareTest("Test HCPCS derived device coming from procedure table", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male',
              first_month_active = '200701', last_month_active = '201001')
  add_procedure(ptid=patient$ptid, proc_code = 'A4217', proc_code_type = 'HCPCS', proc_date = '2009-01-01')
  expect_device_exposure(person_id = patient$person_id, device_concept_id = 2614697, device_source_value = 'A4217', device_source_concept_id = 2614697)



  ######################################
  # DIAGNOSIS
  ######################################

  patient <- createPatient();
  declareTest("Test device derived from diagnosis table", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male',
              first_month_active = '200701', last_month_active = '201001')
  add_diagnosis(ptid=patient$ptid, diagnosis_cd = 'Y73.0', diagnosis_cd_type = 'ICD10', diag_date = '2009-01-01',
                diagnosis_status = 'Diagnosis of')
  expect_device_exposure(person_id = patient$person_id, device_concept_id = 45767866,
                         device_source_value = 'Y73.0', device_source_concept_id = 35224758)
}
