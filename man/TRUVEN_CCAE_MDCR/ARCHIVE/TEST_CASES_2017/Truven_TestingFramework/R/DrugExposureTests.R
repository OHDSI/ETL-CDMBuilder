createDrugExposureTests <- function () {
  
  patient <- createPatient()
  encounter <- createEncounter()
  declareTest("Duplicate drug records become one record in the CDM", source_pid = patient$enrolid, cdm_pid = patient$person_id)
  add_enrollment_detail(enrolid=patient$enrolid, dtend = '2012-12-31', dtstart = '2012-01-01')
  add_drug_claims(enrolid = patient$enrolid, ndcnum = '36987257801', year = '2012', svcdate = '02-01-2012')
  add_drug_claims(enrolid = patient$enrolid, ndcnum = '36987257801', year = '2012', svcdate = '02-01-2012')
  expect_drug_exposure(person_id = patient$person_id, drug_concept_id = '40161912', drug_exposure_start_date = '02-01-2012')
  
  patient <- createPatient()
  encounter <- createEncounter()
  declareTest("Negative daysupp should be 0 in cdm", source_pid = patient$enrolid, cdm_pid = patient$person_id)
  add_enrollment_detail(enrolid=patient$enrolid, dtend = '2012-12-31', dtstart = '2012-01-01')
  add_drug_claims(enrolid = patient$enrolid, ndcnum = '58864060830', year = '2012', daysupp = '-30', svcdate = '06-12-2012')
  expect_drug_exposure(person_id = patient$person_id, drug_concept_id = '1545998', days_supply = '0', drug_exposure_start_date = '06-12-2012')
  
  patient <- createPatient()
  encounter <- createEncounter()
  declareTest("Daysupp >365 should be 365 in cdm", source_pid = patient$enrolid, cdm_pid = patient$person_id)
  add_enrollment_detail(enrolid=patient$enrolid, dtend = '2012-12-31', dtstart = '2012-01-01')
  add_drug_claims(enrolid = patient$enrolid, ndcnum = '58864060830', year = '2012', daysupp = '432', svcdate = '08-07-2012')
  expect_drug_exposure(person_id = patient$person_id, drug_concept_id = '1545998', days_supply = '365', drug_exposure_start_date = '08-07-2012')
  
  patient <- createPatient()
  encounter <- createEncounter()
  declareTest("CPT4 drug code in inpatient record moves to drug_exposure", source_pid = patient$enrolid, cdm_pid = patient$person_id)
  add_enrollment_detail(enrolid=patient$enrolid, dtend = '2012-12-31', dtstart = '2012-01-01')
  add_inpatient_services(enrolid = patient$enrolid, proc1 = '90376', svcdate = '2012-08-09', tsvcdat = '2012-08-12', caseid = encounter$caseid, year = '2012')
  expect_drug_exposure(person_id = patient$person_id, drug_concept_id = '2213404', drug_exposure_start_date = '2012-08-09')
  
  patient <- createPatient()
  encounter <- createEncounter()
  declareTest("Patient has 11 digit NDC that doesn''t map, should use first 9 digits instead", source_pid = patient$enrolid, cdm_pid = patient$person_id)
  add_enrollment_detail(enrolid=patient$enrolid, dtend = '2012-12-31', dtstart = '2012-01-01')
  add_drug_claims(enrolid = patient$enrolid, ndcnum = '13533063670', year = '2012', svcdate = '01-17-2012')
  expect_drug_exposure(person_id = patient$person_id, drug_concept_id = '46275250', drug_exposure_start_date = '01-17-2012')
  
  patient <- createPatient()
  encounter <- createEncounter()
  declareTest("Patient has 9 digit NDC that doesn''t map, should use first 9 digits instead, should map to DRUG_CONCEPT_ID=0 because of the date filter", source_pid = patient$enrolid, cdm_pid = patient$person_id)
  add_enrollment_detail(enrolid=patient$enrolid, dtend = '2006-12-31', dtstart = '2006-01-01')
  add_drug_claims(enrolid = patient$enrolid, ndcnum = '00006000543', year = '2006', svcdate = '07-08-2006')
  expect_drug_exposure(person_id = patient$person_id, drug_concept_id = '0', drug_exposure_start_date = '07-08-2006')
  
  patient <- createPatient()
  encounter <- createEncounter()
  declareTest("Patient has 9 digit NDC that doesn''t map, should use first 9 digits instead, should map to correct DRUG_CONCEPT_ID because of the date filter", source_pid = patient$enrolid, cdm_pid = patient$person_id)
  add_enrollment_detail(enrolid=patient$enrolid, dtend = '2014-12-31', dtstart = '2014-01-01')
  add_drug_claims(enrolid = patient$enrolid, ndcnum = '00006032582', year = '2014', svcdate = '09-18-2014')
  expect_drug_exposure(person_id = patient$person_id, drug_concept_id = '45775771', drug_exposure_start_date = '09-18-2014')
}


