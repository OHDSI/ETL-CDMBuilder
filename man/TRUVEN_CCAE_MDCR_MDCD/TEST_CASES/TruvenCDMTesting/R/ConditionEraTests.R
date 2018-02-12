createConditionEraTests <- function () {

  patient <- createPatient()
  encounter <- createEncounter()  
  declareTest(id = patient$person_id, "Patient condition_concept_id of 0, no condition_era record created. Id is PERSON_ID.")
  add_enrollment_detail(enrolid=patient$enrolid, dtend = '2012-12-31', dtstart = '2012-01-01')
  add_inpatient_services(enrolid=patient$enrolid, pdx = '71978', dx1 = '71978', dxver = '9', svcdate = '2012-04-21', tsvcdat = '2012-04-22')
  expect_no_condition_era(person_id = patient$person_id)

  patient <- createPatient()
  encounter <- createEncounter()  
  declareTest(id = patient$person_id, "Two records with same condition_concept_id are less than 30 days apart, one condition_era record created. Id is PERSON_ID.")
  add_enrollment_detail(enrolid=patient$enrolid, dtend = '2012-12-31', dtstart = '2012-01-01')
  add_outpatient_services(enrolid=patient$enrolid, dx1='37613', dxver = '9', svcdate = '2012-07-01')
  add_outpatient_services(enrolid=patient$enrolid, dx1='37613', dxver = '9', svcdate = '2012-07-12')
  expect_condition_era(person_id=patient$person_id, condition_era_start_date = '2012-07-01', condition_era_end_date = '2012-07-12')

  patient <- createPatient()
  encounter <- createEncounter()  
  declareTest(id = patient$person_id, "Two records with same condition_concept_id are more than 30 days apart, two condition_era records created. Id is PERSON_ID.")
  add_enrollment_detail(enrolid=patient$enrolid, dtend = '2013-12-31', dtstart = '2012-01-01')
  add_outpatient_services(enrolid=patient$enrolid, dx1='37613', dxver = '9', svcdate = '2012-07-01')
  add_outpatient_services(enrolid=patient$enrolid, dx1='37613', dxver = '9', svcdate = '2012-08-12')
  expect_condition_era(person_id=patient$person_id, condition_era_start_date = '2012-07-01')
  expect_condition_era(person_id=patient$person_id, condition_era_start_date = '2012-08-12')
  
}