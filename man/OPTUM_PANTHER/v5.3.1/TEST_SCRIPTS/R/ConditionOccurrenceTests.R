createConditionOccurrenceTests <- function () {

  ######################################
  # DIAGNOSIS
  ######################################


  patient <- createPatient();
  declareTest("Diagnosis without ''Diagnosis of'' status is not loaded", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male',
              first_month_active = '200701', last_month_active = '201001')
  add_diagnosis(ptid=patient$ptid, diagnosis_status = 'Family history of', diagnosis_cd = '7061',
                diagnosis_cd_type = 'ICD9', diag_date = '2009-01-01')
  expect_no_condition_occurrence(person_id = patient$person_id)


  patient <- createPatient();
  declareTest("Test diag_date to condition_start_date", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male',
              first_month_active = '200701', last_month_active = '201001')
  add_diagnosis(ptid=patient$ptid, diagnosis_status = 'Diagnosis of', diagnosis_cd = '7061',
                diagnosis_cd_type = 'ICD9', diag_date = '2009-01-01')
  expect_condition_occurrence(person_id = patient$person_id, condition_start_date = '2009-01-01')


  patient <- createPatient();
  declareTest("Test diagnosis code type ICD9", source_pid = patient$ptid, cdm_pid = patient$person_id)
  enc <- createEncounter();
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male',
              first_month_active = '200701', last_month_active = '201001')
  add_diagnosis(ptid=patient$ptid, diagnosis_status = 'Diagnosis of', diagnosis_cd = '7061',
                diagnosis_cd_type = 'ICD9', diag_date = '2009-01-01')
  expect_condition_occurrence(person_id = patient$person_id, condition_concept_id = 141095, condition_source_value = '7061')


  patient <- createPatient();
  declareTest("Test diagnosis code type ICD10", source_pid = patient$ptid, cdm_pid = patient$person_id)
  enc <- createEncounter();
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male',
              first_month_active = '200701', last_month_active = '201001')
  add_diagnosis(ptid=patient$ptid, diagnosis_status = 'Diagnosis of', diagnosis_cd = 'H44.611',
                diagnosis_cd_type = 'ICD10', diag_date = '2009-01-01')
  expect_condition_occurrence(person_id = patient$person_id, condition_concept_id = 381850, condition_source_value = 'H44.611')


  patient <- createPatient();
  declareTest("Test primary diagnosis to condition_type_concept_id", source_pid = patient$ptid, cdm_pid = patient$person_id)
  enc <- createEncounter();
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male',
              first_month_active = '200701', last_month_active = '201001')
  add_diagnosis(ptid=patient$ptid, diagnosis_status = 'Diagnosis of', diagnosis_cd = '7061',
                diagnosis_cd_type = 'ICD9', diag_date = '2009-01-01', primary_diagnosis = '1')
  expect_condition_occurrence(person_id = patient$person_id, condition_type_concept_id = 44786627)


  patient <- createPatient();
  declareTest("Test non-primary diagnosis to condition_type_concept_id", source_pid = patient$ptid, cdm_pid = patient$person_id)
  enc <- createEncounter();
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male',
              first_month_active = '200701', last_month_active = '201001')
  add_diagnosis(ptid=patient$ptid, diagnosis_status = 'Diagnosis of', diagnosis_cd = '7061',
                diagnosis_cd_type = 'ICD9', diag_date = '2009-01-01', primary_diagnosis = '0')
  expect_condition_occurrence(person_id = patient$person_id, condition_type_concept_id = 44786629)


  patient <- createPatient();
  declareTest("Test diagnosis code with wrong diagnosis code type", source_pid = patient$ptid, cdm_pid = patient$person_id)
  enc <- createEncounter();
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male',
              first_month_active = '200701', last_month_active = '201001')
  add_diagnosis(ptid=patient$ptid, diagnosis_status = 'Diagnosis of', diagnosis_cd = '44786629',
                diagnosis_cd_type = 'ICD9', diag_date = '2009-01-01')
  expect_condition_occurrence(person_id = patient$person_id, condition_concept_id = 0)


  patient <- createPatient();
  declareTest("Test blank diagnosis code", source_pid = patient$ptid, cdm_pid = patient$person_id)
  enc <- createEncounter();
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male',
              first_month_active = '200701', last_month_active = '201001')
  add_diagnosis(ptid=patient$ptid, diagnosis_status = 'Diagnosis of', diagnosis_cd = NULL,
                diagnosis_cd_type = NULL, diag_date = '2009-01-01')
  expect_condition_occurrence(person_id = patient$person_id, condition_concept_id = 0)

  patient <- createPatient();
  declareTest("Test condition_status_concept_id when poa == 0 and admitting_diagnosis == 1", source_pid = patient$ptid, cdm_pid = patient$person_id)
  enc <- createEncounter();
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male',
              first_month_active = '200701', last_month_active = '201001')
  add_diagnosis(ptid=patient$ptid, diagnosis_status = 'Diagnosis of', diagnosis_cd = '7061',
                diagnosis_cd_type = 'ICD9', diag_date = '2009-01-01', poa = '0', admitting_diagnosis = 1)
  expect_condition_occurrence(person_id = patient$person_id, condition_concept_id = 141095, condition_status_concept_id = 4203942)

  patient <- createPatient();
  declareTest("Test condition_status_concept_id when poa == 0 and discharge_diagnosis == 1", source_pid = patient$ptid, cdm_pid = patient$person_id)
  enc <- createEncounter();
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male',
              first_month_active = '200701', last_month_active = '201001')
  add_diagnosis(ptid=patient$ptid, diagnosis_status = 'Diagnosis of', diagnosis_cd = '7061',
                diagnosis_cd_type = 'ICD9', diag_date = '2009-01-01', poa = '0', discharge_diagnosis = 1)
  expect_condition_occurrence(person_id = patient$person_id, condition_concept_id = 141095, condition_status_concept_id = 4230359)

  patient <- createPatient();
  declareTest("Test condition_status_concept_id when poa == 0 and primary_diagnosis == 1", source_pid = patient$ptid, cdm_pid = patient$person_id)
  enc <- createEncounter();
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male',
              first_month_active = '200701', last_month_active = '201001')
  add_diagnosis(ptid=patient$ptid, diagnosis_status = 'Diagnosis of', diagnosis_cd = '7061',
                diagnosis_cd_type = 'ICD9', diag_date = '2009-01-01', poa = '0', primary_diagnosis = 1)
  expect_condition_occurrence(person_id = patient$person_id, condition_concept_id = 141095, condition_status_concept_id = 3001410)

  patient <- createPatient();
  declareTest("Test condition_status_concept_id when poa == 1", source_pid = patient$ptid, cdm_pid = patient$person_id)
  enc <- createEncounter();
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male',
              first_month_active = '200701', last_month_active = '201001')
  add_diagnosis(ptid=patient$ptid, diagnosis_status = 'Diagnosis of', diagnosis_cd = '7061',
                diagnosis_cd_type = 'ICD9', diag_date = '2009-01-01', poa = '1')
  expect_condition_occurrence(person_id = patient$person_id, condition_concept_id = 141095, condition_status_concept_id = 0)

  ######################################
  # PROCEDURE
  ######################################

  patient <- createPatient();
  declareTest("Test HCPCS derived condition coming from procedure table", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male',
              first_month_active = '200701', last_month_active = '201001')
  add_procedure(ptid=patient$ptid, proc_code = 'G8007', proc_code_type = 'HCPCS', proc_date = '2009-01-01')
  expect_condition_occurrence(person_id = patient$person_id, condition_concept_id = 312327)

  #no conditions in latest vocab originate from ICD9Proc, ICD10PCS, or CPT4

  # Test provider for encounter
  patient <- createPatient();
  provider <- createProvider();
  enc <- createEncounter();
  declareTest("Patient has PROCEDURE record; validate the provider for the encid is mapped to provid", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male',
              first_month_active = '200701', last_month_active = '201001')
  add_provider(provid = provider$provid, specialty = "Internal Medicine", prim_spec_ind = "1")
  add_encounter(encid = enc$encid, ptid = patient$ptid, interaction_type = 'Inpatient', interaction_date = '2009-01-01')
  add_encounter_provider(enc=enc$encid, provid=provider$provid)
  add_procedure(ptid=patient$ptid, proc_code = 'G8007', encid = enc$encid, proc_code_type = 'HCPCS', proc_date = '2009-01-01')
  expect_condition_occurrence(person_id = patient$person_id, provider_id = provider$provid)


  # Test visit_occurrence_id
  patient <- createPatient();
  enc <- createEncounter();
  provider <- createProvider();
  declareTest("Patient has PROCEDURE record; validate the visit_occurrence_id", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male',
              first_month_active = '200701', last_month_active = '201001')
  add_encounter(enc = enc$encid, ptid = patient$ptid, interaction_type = 'Inpatient', interaction_date = '2009-01-01', visitid = enc$encId)
  add_procedure(ptid = patient$ptid, encid = enc$encid, proc_code = 'G8007', proc_code_type = 'HCPCS', proc_date = '2009-01-01')
  expect_condition_occurrence(person_id = patient$person_id, visit_occurrence_id = enc$visit_occurrence_id)
}
