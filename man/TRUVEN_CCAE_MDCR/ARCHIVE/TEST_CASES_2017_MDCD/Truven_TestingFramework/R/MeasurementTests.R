createMeasurementTests <- function () {

  
  if (Sys.getenv("truvenType") != "MDCD")
  {
    
  patient <- createPatient()
  encounter <- createEncounter()
  declareTest("LOINC code does not have a dash in the second to last character, record is dropped", source_pid = patient$enrolid, cdm_pid = patient$person_id)
  add_enrollment_detail(enrolid=patient$enrolid, dtend = '2012-12-31', dtstart = '2012-01-01')
  add_lab(enrolid = patient$enrolid, year='2012', svcdate = '2012-03-07', loinccd = '99999')
  expect_no_measurement(person_id = patient$person_id)
  
  patient <- createPatient()
  encounter <- createEncounter()
  declareTest("Svcdate is outside of observation period, record is dropped", source_pid = patient$enrolid, cdm_pid = patient$person_id)
  add_enrollment_detail(enrolid=patient$enrolid, dtend = '2012-12-31', dtstart = '2012-01-01')
  add_lab(enrolid = patient$enrolid, year='2012', svcdate = '2013-07-09', loinccd = '56773-5')
  expect_no_measurement(person_id = patient$person_id)
  
  patient <- createPatient()
  encounter <- createEncounter()
  declareTest("Patient has abnormal=L; value as concept_id = 4267416", source_pid = patient$enrolid, cdm_pid = patient$person_id)
  add_enrollment_detail(enrolid=patient$enrolid, dtend = '2012-12-31', dtstart = '2012-01-01')
  add_lab(enrolid = patient$enrolid, year='2012', svcdate = '2012-12-20', loinccd = '56784-2', abnormal = 'L')
  expect_measurement(person_id = patient$person_id, value_as_concept_id = '4267416')
  
  patient <- createPatient()
  encounter <- createEncounter()
  declareTest("Patient has result ne 0 and > neg 99999, result listed in value as number field", source_pid = patient$enrolid, cdm_pid = patient$person_id)
  add_enrollment_detail(enrolid=patient$enrolid, dtend = '2012-12-31', dtstart = '2012-01-01')
  add_lab(enrolid = patient$enrolid, year='2012', svcdate = '2012-08-24', loinccd = '56789-1', result = '120')
  expect_measurement(person_id = patient$person_id, value_as_number = '120')
  
  patient <- createPatient()
  encounter <- createEncounter()
  declareTest("Patient lowercase units, maps to unit_concept_id 8840", source_pid = patient$enrolid, cdm_pid = patient$person_id)
  add_enrollment_detail(enrolid=patient$enrolid, dtend = '2012-12-31', dtstart = '2012-01-01')
  add_lab(enrolid = patient$enrolid, year='2012', svcdate = '2012-04-06', loinccd = '56789-1', result = '100', resunit = 'mg/dl')
  expect_measurement(person_id = patient$person_id, value_as_number = '100', unit_concept_id = '8840')
  
  }

}
