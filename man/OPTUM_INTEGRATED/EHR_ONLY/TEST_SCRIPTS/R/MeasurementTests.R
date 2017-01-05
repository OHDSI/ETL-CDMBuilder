createMeasurementTests <- function () {

  ######################################
  # DIAGNOSIS
  ######################################

  patient <- createPatient();
  declareTest("When DIAGNOSIS_STATUS=Diagnosis Of and DIAGNOSIS_CD maps to DOMAIN=MEASUREMENT concept", source_pid = patient$ptid, cdm_pid = patient$person_id)
  enc <- createEncounter();
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male',
              first_month_active = '200701', last_month_active = '201001')
  add_encounter(ptid=patient$ptid, encid = enc$encid, interaction_type='Inpatient', interaction_date='2009-01-01')
  add_diagnosis(ptid=patient$ptid, encid = enc$encid, diagnosis_status = 'Diagnosis of', diagnosis_cd = '7877',
                diagnosis_cd_type = 'ICD9', diag_date = '2009-01-01')
  expect_measurement(person_id=patient$person_id, measurement_concept_id=437671, measurement_date='2009-01-01',
                     measurement_source_value='7877')


  patient <- createPatient();
  declareTest("When DIAGNOSIS_STATUS=Zachary and DIAGNOSIS_CD maps to DOMAIN=MEASUREMENT concept, should not write record", source_pid = patient$ptid, cdm_pid = patient$person_id)
  enc <- createEncounter();
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male',
              first_month_active = '200701', last_month_active = '201001')
  add_encounter(ptid=patient$ptid, encid = enc$encid, interaction_type='Inpatient', interaction_date='2009-01-01')
  add_diagnosis(ptid=patient$ptid, encid = enc$encid, diagnosis_status = 'Zachary', diagnosis_cd = '7877',
                diagnosis_cd_type = 'ICD9', diag_date = '2009-01-01')
  expect_no_measurement(person_id=patient$person_id)


  patient <- createPatient();
  declareTest("When PRIMARY_DIAGNOSIS = 1 Then Type = 44786627", source_pid = patient$ptid, cdm_pid = patient$person_id)
  enc <- createEncounter();
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male',
              first_month_active = '200701', last_month_active = '201001')
  add_encounter(ptid=patient$ptid, encid = enc$encid, interaction_type='Inpatient', interaction_date='2009-01-01')
  add_diagnosis(ptid=patient$ptid, encid = enc$encid, diagnosis_status = 'Diagnosis of', diagnosis_cd = '7877',
                diagnosis_cd_type = 'ICD9', diag_date = '2009-01-01', primary_diagnosis=1)
  expect_measurement(person_id=patient$person_id, measurement_type_concept_id=44786627)

  patient <- createPatient();
  declareTest("When PRIMARY_DIAGNOSIS = 6 Then Type = 44786629", source_pid = patient$ptid, cdm_pid = patient$person_id)
  enc <- createEncounter();
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male',
              first_month_active = '200701', last_month_active = '201001')
  add_encounter(ptid=patient$ptid, encid = enc$encid, interaction_type='Inpatient', interaction_date='2009-01-01')
  add_diagnosis(ptid=patient$ptid, encid = enc$encid, diagnosis_status = 'Diagnosis of', diagnosis_cd = '7877',
                diagnosis_cd_type = 'ICD9', diag_date = '2009-01-01', primary_diagnosis=6)
  expect_measurement(person_id=patient$person_id, measurement_type_concept_id=44786629)


  patient <- createPatient();
  declareTest("MEASUREMENT_SOURCE_CONCEPT_ID for ICD9 787.7 gets mapped properly to 44830446", source_pid = patient$ptid, cdm_pid = patient$person_id)
  enc <- createEncounter();
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male',
              first_month_active = '200701', last_month_active = '201001')
  add_encounter(ptid=patient$ptid, encid = enc$encid, interaction_type='Inpatient', interaction_date='2009-01-01')
  add_diagnosis(ptid=patient$ptid, encid = enc$encid, diagnosis_status = 'Diagnosis of', diagnosis_cd = '7877',
                diagnosis_cd_type = 'ICD9', diag_date = '2009-01-01')
  expect_measurement(person_id=patient$person_id, measurement_source_concept_id=44830446)


  patient <- createPatient();
  declareTest("When DIAGNOSIS_STATUS=Diagnosis Of and Source code is a SNOMED", source_pid = patient$ptid, cdm_pid = patient$person_id)
  enc <- createEncounter();
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male',
              first_month_active = '200701', last_month_active = '201001')
  add_encounter(ptid=patient$ptid, encid = enc$encid, interaction_type='Inpatient', interaction_date='2009-01-01')
  add_diagnosis(ptid=patient$ptid, encid = enc$encid, diagnosis_status = 'Diagnosis of', diagnosis_cd = '129772004',
                diagnosis_cd_type = 'SNOMED', diag_date = '2009-01-01')
  expect_measurement(person_id=patient$person_id, measurement_concept_id=4031867, measurement_date='2009-01-01',
                     measurement_source_value='129772004')


  ######################################
  # LABS
  ######################################

  patient <- createPatient();
  declareTest("Test numeric result and SOURCE_CONCEPT_ID = 0", source_pid = patient$ptid, cdm_pid = patient$person_id)
  enc <- createEncounter();
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male',
              first_month_active = '200701', last_month_active = '201001')
  add_encounter(ptid=patient$ptid, encid = enc$encid, interaction_type='Inpatient', interaction_date='2009-01-01')
  add_labs(ptid=patient$ptid, encid = enc$encid, test_name='O2 saturation.oximetry', test_result='100', result_date='2009-01-01')
  expect_measurement(person_id=patient$person_id,measurement_concept_id=4130729,measurement_date='2009-01-01',
                     measurement_source_value='O2 saturation.oximetry', measurement_source_concept_id=0,
                     value_as_number=100)

  patient <- createPatient();
  declareTest("Test non-numeric result and SOURCE_CONCEPT_ID = 0", source_pid = patient$ptid, cdm_pid = patient$person_id)
  enc <- createEncounter();
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male',
              first_month_active = '200701', last_month_active = '201001')
  add_encounter(ptid=patient$ptid, encid = enc$encid, interaction_type='Inpatient', interaction_date='2009-01-01')
  add_labs(ptid=patient$ptid, encid = enc$encid, test_name='O2 saturation.oximetry', test_result='positive', result_date='2009-01-01')
  expect_measurement(person_id=patient$person_id,measurement_concept_id=4130729,measurement_date='2009-01-01',
                     measurement_source_value='O2 saturation.oximetry', measurement_source_concept_id=0,
                     value_as_number=NULL, value_as_concept_id=45884084)

  patient <- createPatient();
  declareTest("Test valid operator gets an OPERATOR_CONCEPT_ID", source_pid = patient$ptid, cdm_pid = patient$person_id)
  enc <- createEncounter();
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male',
              first_month_active = '200701', last_month_active = '201001')
  add_encounter(ptid=patient$ptid, encid = enc$encid, interaction_type='Inpatient', interaction_date='2009-01-01')
  add_labs(ptid=patient$ptid, encid = enc$encid, test_name='O2 saturation.oximetry', test_result='100', result_date='2009-01-01',
           relative_indicator='<=')
  expect_measurement(person_id=patient$person_id,operator_concept_id=4171754)

  patient <- createPatient();
  declareTest("Test invalid operator gets an OPERATOR_CONCEPT_ID", source_pid = patient$ptid, cdm_pid = patient$person_id)
  enc <- createEncounter();
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male',
              first_month_active = '200701', last_month_active = '201001')
  add_encounter(ptid=patient$ptid, encid = enc$encid, interaction_type='Inpatient', interaction_date='2009-01-01')
  add_labs(ptid=patient$ptid, encid = enc$encid, test_name='O2 saturation.oximetry', test_result='100', result_date='2009-01-01',
           relative_indicator='ZA')
  expect_measurement(person_id=patient$person_id,operator_concept_id=0)

  patient <- createPatient();
  declareTest("map case-sensitive UCUM vocabulary to UNIT_CONCEPT_ID, row count right", source_pid = patient$ptid, cdm_pid = patient$person_id)
  enc <- createEncounter();
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male',
              first_month_active = '200701', last_month_active = '201001')
  add_encounter(ptid=patient$ptid, encid = enc$encid, interaction_type='Inpatient', interaction_date='2009-01-01')
  add_labs(ptid=patient$ptid, encid = enc$encid, test_name='O2 saturation.oximetry', test_result='100', result_date='2009-01-01',
           result_unit='pH')
  expect_measurement(person_id=patient$person_id,unit_concept_id = 8482)
  expect_count_measurement(person_id=patient$person_id,rowCount = 1)

  patient <- createPatient();
  declareTest("Test when normal range has a hyphen", source_pid = patient$ptid, cdm_pid = patient$person_id)
  enc <- createEncounter();
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male',
              first_month_active = '200701', last_month_active = '201001')
  add_encounter(ptid=patient$ptid, encid = enc$encid, interaction_type='Inpatient', interaction_date='2009-01-01')
  add_labs(ptid=patient$ptid, encid = enc$encid, test_name='O2 saturation.oximetry', test_result='100', result_date='2009-01-01',
           normal_range='55-65')
  expect_measurement(person_id=patient$person_id,range_low=55,range_high=65)

  patient <- createPatient();
  declareTest("Test when normal range does not have a hyphen", source_pid = patient$ptid, cdm_pid = patient$person_id)
  enc <- createEncounter();
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male',
              first_month_active = '200701', last_month_active = '201001')
  add_encounter(ptid=patient$ptid, encid = enc$encid, interaction_type='Inpatient', interaction_date='2009-01-01')
  add_labs(ptid=patient$ptid, encid = enc$encid, test_name='O2 saturation.oximetry', test_result='100', result_date='2009-01-01',
           normal_range=55)
  expect_measurement(person_id=patient$person_id,range_low=NULL,range_high=NULL)

  ######################################
  # NLP MEASURESMENTS
  ######################################

  patient <- createPatient();
  declareTest("MEASUREMENT_TYPE gets properly mapped to a CONCEPT_ID from NLP_MEASUREMENTS", source_pid = patient$ptid, cdm_pid = patient$person_id)
  enc <- createEncounter();
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male',
              first_month_active = '200701', last_month_active = '201001')
  add_encounter(ptid=patient$ptid, encid = enc$encid, interaction_type='Inpatient', interaction_date='2009-01-01')
  add_nlp_measurements(ptid=patient$ptid, encid = enc$encid, measurement_type='WEIGHT',measurement_date='2009-01-01',
                       measurement_value=100)
  expect_measurement(person_id=patient$person_id,measurement_concept_id=3025315,measurement_date='2009-01-01',
                     measurement_type_concept_id=45754907,visit_occurrence_id=enc$visit_occurrence_id,
                     measurement_source_concept_id =0, measurement_source_value='WEIGHT')

  patient <- createPatient();
  declareTest("Non-numeric MEASUREMENT_VALUE from NLP_MEASUREMENTS", source_pid = patient$ptid, cdm_pid = patient$person_id)
  enc <- createEncounter();
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male',
              first_month_active = '200701', last_month_active = '201001')
  add_encounter(ptid=patient$ptid, encid = enc$encid, interaction_type='Inpatient', interaction_date='2009-01-01')
  add_nlp_measurements(ptid=patient$ptid, encid = enc$encid, measurement_type='WEIGHT',measurement_date='2009-01-01',
                       measurement_value='positive')
  expect_measurement(person_id=patient$person_id,measurement_concept_id=3025315,measurement_date='2009-01-01',
                     measurement_type_concept_id=45754907,visit_occurrence_id=enc$visit_occurrence_id,
                     measurement_source_concept_id =0, measurement_source_value='WEIGHT',value_as_concept_id=45884084)


  patient <- createPatient();
  declareTest("Measurement_detail gets mapped properly to a case sensitive UCUM from NLP_MEASUREMENTS", source_pid = patient$ptid, cdm_pid = patient$person_id)
  enc <- createEncounter();
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male',
              first_month_active = '200701', last_month_active = '201001')
  add_encounter(ptid=patient$ptid, encid = enc$encid, interaction_type='Inpatient', interaction_date='2009-01-01')
  add_nlp_measurements(ptid=patient$ptid, encid = enc$encid, measurement_type='WEIGHT',measurement_date='2009-01-01',
                       measurement_value='positive',measurement_detail='pH')
  expect_measurement(person_id=patient$person_id,unit_concept_id=8482,unit_source_value='pH')
  expect_count_measurement(person_id=patient$person_id,rowCount = 1)

  ######################################
  # OBSERVATIONS
  ######################################

  patient <- createPatient();
  declareTest("Test that a mappable OBS_TYPE gets a CONCEPT_ID from OBSERVATIONS", source_pid = patient$ptid, cdm_pid = patient$person_id)
  enc <- createEncounter();
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male',
              first_month_active = '200701', last_month_active = '201001')
  add_encounter(ptid=patient$ptid, encid = enc$encid, interaction_type='Inpatient', interaction_date='2009-01-01')
  add_observations(ptid=patient$ptid, encid = enc$encid,obs_type='SBP',obs_date='2009-01-01')
  expect_measurement(person_id=patient$person_id,measurement_concept_id=3004249,measurement_date='2009-01-01',
                     measurement_type_concept_id=45754907,measurement_source_value='SBP')

  patient <- createPatient();
  declareTest("Test that an unmappable OBS_TYPE gets a 0 CONCEPT_ID write a record to OBSERVATION table", source_pid = patient$ptid, cdm_pid = patient$person_id)
  enc <- createEncounter();
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male',
              first_month_active = '200701', last_month_active = '201001')
  add_encounter(ptid=patient$ptid, encid = enc$encid, interaction_type='Inpatient', interaction_date='2009-01-01')
  add_observations(ptid=patient$ptid, encid = enc$encid,obs_type='Zach',obs_date='2009-01-01')
  expect_observation(person_id=patient$person_id,observation_concept_id=0,observation_source_value='Zach')

  patient <- createPatient();
  declareTest("Test VALUE_AS_CONCEPT_ID gets mapped from OBSERVATIONS", source_pid = patient$ptid, cdm_pid = patient$person_id)
  enc <- createEncounter();
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male',
              first_month_active = '200701', last_month_active = '201001')
  add_encounter(ptid=patient$ptid, encid = enc$encid, interaction_type='Inpatient', interaction_date='2009-01-01')
  add_observations(ptid=patient$ptid, encid = enc$encid,obs_type='SBP',obs_date='2009-01-01',
                   obs_result='rare')
  expect_measurement(person_id=patient$person_id,value_as_concept_id=45880295, value_source_value = 'rare',
                     measurement_source_concept_id=0)

  patient <- createPatient();
  declareTest("Test UNIT_CONCEPT_ID gets mapped from OBSERVATIONS", source_pid = patient$ptid, cdm_pid = patient$person_id)
  enc <- createEncounter();
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male',
              first_month_active = '200701', last_month_active = '201001')
  add_encounter(ptid=patient$ptid, encid = enc$encid, interaction_type='Inpatient', interaction_date='2009-01-01')
  add_observations(ptid=patient$ptid, encid = enc$encid,obs_type='SBP',obs_date='2009-01-01',
                   obs_result='rare',obs_unit='pH')
  expect_measurement(person_id=patient$person_id,unit_concept_id = 8482,unit_source_value='pH')
  expect_count_measurement(person_id=patient$person_id,rowCount = 1)


  ######################################
  # PROCEDURE
  ######################################

}
