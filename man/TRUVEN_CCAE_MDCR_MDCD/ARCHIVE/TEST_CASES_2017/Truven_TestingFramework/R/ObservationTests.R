createObservationTests <- function () {
  
  patient <- createPatient()
  encounter <- createEncounter()  
  declareTest("Store Discharge Status", source_pid = patient$enrolid, cdm_pid = patient$person_id)
  add_enrollment_detail(enrolid=patient$enrolid, dtend = '2013-12-31', dtstart = '2012-01-01')
  add_inpatient_services(enrolid = patient$enrolid, svcdate = '2012-07-23', tsvcdat = '2012-07-23', dx1='57411', dxver='9', dstatus = '51')
  expect_observation(person_id = patient$person_id, observation_concept_id = '4202605', observation_source_value = '51')
  
  
  if (Sys.getenv("truvenType") != "MDCD")
  {
    
  patient <- createPatient()
  encounter <- createEncounter()  
  declareTest("SVCDATE is outside of observation_period, observation record created ", source_pid = patient$enrolid, cdm_pid = patient$person_id)
  add_enrollment_detail(enrolid=patient$enrolid, dtend = '2012-12-31', dtstart = '2012-01-01')
  add_health_risk_assessment(enrolid = patient$enrolid, survdate = '2013-10-13', bmi = '20.0')
  expect_observation(person_id = patient$person_id, observation_source_value = 'BMI', value_as_number = '20.0', observation_date = '2013-10-13')
  
  patient <- createPatient()
  encounter <- createEncounter()  
  declareTest("BMI is only question answered bmi is only record created in observation ", source_pid = patient$enrolid, cdm_pid = patient$person_id)
  add_enrollment_detail(enrolid=patient$enrolid, dtend = '2012-12-31', dtstart = '2012-01-01')
  add_health_risk_assessment(enrolid = patient$enrolid, survdate = '2012-09-22', bmi = '28.6')
  expect_observation(person_id = patient$person_id, observation_source_value = 'BMI', value_as_number = '28.6', observation_date = '2012-09-22')
  
  patient <- createPatient()
  encounter <- createEncounter()  
  declareTest("Patient answered 3 for question CGTDUR, value_as_string = 11-20, value_as_number=3", source_pid = patient$enrolid, cdm_pid = patient$person_id)
  add_enrollment_detail(enrolid=patient$enrolid, dtend = '2012-12-31', dtstart = '2012-01-01')
  add_health_risk_assessment(enrolid = patient$enrolid, survdate = '2012-05-25', cgtdur = '3')
  expect_observation(person_id = patient$person_id, observation_source_value = 'CGTDUR', value_as_number = '3', observation_date = '2012-05-25', value_as_string = '11-20')
  
  patient <- createPatient()
  encounter <- createEncounter()  
  declareTest("Patient has weight 201, value_as_string = null, value_as_number=201", source_pid = patient$enrolid, cdm_pid = patient$person_id)
  add_enrollment_detail(enrolid=patient$enrolid, dtend = '2012-12-31', dtstart = '2012-01-01')
  add_health_risk_assessment(enrolid = patient$enrolid, survdate = '2012-07-16', weight = '201')
  expect_observation(person_id = patient$person_id, observation_source_value = 'WEIGHT', value_as_number = '201', observation_date = '2012-07-16')
  
  patient <- createPatient()
  encounter <- createEncounter()  
  declareTest("Patient has 1 in CC_ASTHMA column, observation_source_value=Self-reported Asthma", source_pid = patient$enrolid, cdm_pid = patient$person_id)
  add_enrollment_detail(enrolid=patient$enrolid, dtend = '2012-12-31', dtstart = '2012-01-01')
  add_health_risk_assessment(enrolid = patient$enrolid, survdate = '2012-09-13', cc_asthma = '1')
  expect_observation(person_id = patient$person_id, observation_source_value = 'CC_ASTHMA', value_as_number = '1', observation_date = '2012-09-13')
  
  patient <- createPatient()
  encounter <- createEncounter()  
  declareTest("Patient has 2 in CGTPKAMT column, observation_source_value=1 pack per day or more", source_pid = patient$enrolid, cdm_pid = patient$person_id)
  add_enrollment_detail(enrolid=patient$enrolid, dtend = '2012-12-31', dtstart = '2012-01-01')
  add_health_risk_assessment(enrolid = patient$enrolid, survdate = '2012-03-14', cgtpkamt = '2')
  expect_observation(person_id = patient$person_id, observation_source_value = 'CGTPKAMT', value_as_number = '2', observation_date = '2012-03-14', value_as_string = '1 pack per day or more')
  
  #This will test HIX-1299
  patient <- createPatient()
  encounter <- createEncounter()  
  declareTest("Patient answered 1 for question FLU_SHOT, drug_exposure record created", source_pid = patient$enrolid, cdm_pid = patient$person_id)
  add_enrollment_detail(enrolid=patient$enrolid, dtend = '2012-12-31', dtstart = '2012-01-01')
  add_health_risk_assessment(enrolid = patient$enrolid, survdate = '2012-05-25', flu_shot = '1')
  expect_drug_exposure(person_id = patient$person_id, drug_exposure_end_date = NULL, drug_concept_id = '4214838')
  
  }
}
