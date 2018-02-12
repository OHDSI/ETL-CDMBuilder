createDeathTests <- function () {
  
  set_defaults_enrollment_detail(mhsacovg = '0')
  
  patient <- createPatient()
  encounter <- createEncounter()
  declareTest(id = patient$person_id, "Date of death visit end date. Id is PERSON_ID.")
  add_enrollment_detail(enrolid=patient$enrolid, dtend = '2015-12-31', dtstart = '2012-01-01', mhsacovg = 0)
  add_inpatient_services(enrolid=patient$enrolid, year = '2013',  svcdate = '2013-01-06', tsvcdat='2013-01-09')
  add_outpatient_services(enrolid = patient$enrolid, year = '2013', svcdate = '2013-01-07',tsvcdat = '2013-01-07', dx1 = '7981', dxver = '9', fachdid = encounter$caseid)
  add_facility_header(enrolid=patient$enrolid, svcdate = '2013-01-07', tsvcdat = '2013-01-07', dx9 = '7981', fachdid = encounter$caseid, dxver='9')
  expect_death(person_id = patient$person_id, death_date = '2013-01-09')
  
  patient <- createPatient()
  encounter <- createEncounter()
  add_enrollment_detail(enrolid=patient$enrolid, dtend = '2016-12-31', dtstart = '2012-01-01', mhsacovg = '0')
  declareTest(id = patient$person_id, "ICD10 Death and Death Type Correct. Id is PERSON_ID.")
  add_inpatient_services(enrolid=patient$enrolid, year = '2016', svcdate = '2016-01-06', tsvcdat='2016-01-09', dxver = '0', dx1='I461')
  expect_death(person_id = patient$person_id, death_type_concept_id = '38003567')
  
  patient <- createPatient()
  encounter <- createEncounter()
  add_enrollment_detail(enrolid=patient$enrolid, dtend = '2015-12-31', dtstart = '2012-01-01', mhsacovg = '0')
  declareTest(id = patient$person_id, "ICD9 Death and Death Type Correct. Id is PERSON_ID.")
  add_inpatient_services(enrolid=patient$enrolid, year = '2013', svcdate = '2013-01-06', tsvcdat='2013-01-09', dxver = '9', dx1='798')
  expect_death(person_id = patient$person_id, death_type_concept_id = '38003567')
  
  patient <- createPatient()
  encounter <- createEncounter()
  add_enrollment_detail(enrolid=patient$enrolid, dtend = '2013-02-01', dtstart = '2012-01-01', mhsacovg = '0')
  declareTest(id = patient$person_id, "Discharge Status and Death Type Correct. Id is PERSON_ID.")
  add_inpatient_services(enrolid=patient$enrolid, year = '2013', svcdate = '2013-01-06', tsvcdat='2013-01-09', dstatus = '20')
  expect_death(person_id = patient$person_id, death_type_concept_id = '38003566')
  
  patient <- createPatient()
  encounter <- createEncounter()
  add_enrollment_detail(enrolid=patient$enrolid, dtend = '2015-12-31', dtstart = '2012-01-01', mhsacovg = '0')
  declareTest(id = patient$person_id, "Death by ICD9 and Death by Discharge, Keep the Discharge. Id is PERSON_ID.")
  add_inpatient_services(enrolid=patient$enrolid, year = '2013', svcdate = '2013-01-06', tsvcdat='2013-01-09', dstatus = '20',dxver = '9', dx1='798')
  expect_death(person_id = patient$person_id, death_type_concept_id = '38003566')
  
  patient <- createPatient()
  encounter <- createEncounter()
  add_enrollment_detail(enrolid=patient$enrolid, dtend = '2015-12-31', dtstart = '2012-01-01', mhsacovg = '0')
  declareTest(id = patient$person_id, "Death and then contined Activity Cancels Death. Id is PERSON_ID.")
  add_inpatient_services(enrolid=patient$enrolid, year = '2013', svcdate = '2013-01-06', tsvcdat='2013-01-09', dstatus = '20')
  add_outpatient_services(enrolid=patient$enrolid, year = '2013', svcdate = '2013-03-12')
  expect_no_death(person_id=patient$enrolid)
  
  
  if (Sys.getenv("truvenType") == "MDCD")
  {
    patient <- createPatient()
    encounter <- createEncounter()
    declareTest(id = patient$person_id, "Patient has icd9 death cord in ltc, death record created. Id is PERSON_ID.")
    add_enrollment_detail(enrolid=patient$enrolid, dtend = '2012-12-31', dtstart = '2012-01-01')
    add_long_term_care(enrolid = patient$enrolid, dx1 = '798', dxver = '9', svcdate = '11-02-2012', tsvcdat = '11-22-2012')
    expect_death(person_id = patient$person_id)
    }
  
}
