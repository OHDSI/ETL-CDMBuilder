createDrugEraTests <- function () {
  
  patient <- createPatient()
  encounter <- createEncounter()
  declareTest("Two drugs with same ingredient within 30 days, should be one drug era", source_pid = patient$enrolid, cdm_pid = patient$person_id)
  add_enrollment_detail(enrolid=patient$enrolid, dtend = '2012-12-31', dtstart = '2012-01-01')
  add_drug_claims(enrolid = patient$enrolid, ndcnum = '00463303410', year = '2012', svcdate = '02-04-2012')
  add_drug_claims(enrolid = patient$enrolid, ndcnum = '00463303410', year = '2012', svcdate = '02-22-2012')
  expect_drug_era(person_id = patient$person_id, drug_concept_id = '1134439', drug_era_start_date ='02-04-2012')
  
  patient <- createPatient()
  encounter <- createEncounter()
  declareTest("Two drugs with same ingredient > 30 days apart, should be two drug eras", source_pid = patient$enrolid, cdm_pid = patient$person_id)
  add_enrollment_detail(enrolid=patient$enrolid, dtend = '2012-12-31', dtstart = '2012-01-01')
  add_drug_claims(enrolid = patient$enrolid, ndcnum = '00463303410', year = '2012', svcdate = '09-21-2012')
  add_drug_claims(enrolid = patient$enrolid, ndcnum = '00463303410', year = '2012', svcdate = '12-08-2012')
  expect_drug_era(person_id = patient$person_id, drug_concept_id = '1134439', drug_era_start_date ='09-21-2012')
  expect_drug_era(person_id = patient$person_id, drug_concept_id = '1134439', drug_era_start_date ='12-08-2012')
  
  patient <- createPatient()
  encounter <- createEncounter()
  declareTest("Drug_era_end_date should be drug start date + days supply", source_pid = patient$enrolid, cdm_pid = patient$person_id)
  add_enrollment_detail(enrolid=patient$enrolid, dtend = '2012-12-31', dtstart = '2010-01-01')
  add_drug_claims(enrolid = patient$enrolid, ndcnum = '00349835305', year = '2012', svcdate = '12-08-2010', daysupp = '14')
  expect_drug_era(person_id = patient$person_id, drug_concept_id = '956874', drug_era_start_date ='12-08-2010', drug_era_end_date = '12-22-2010')
  
  patient <- createPatient()
  encounter <- createEncounter()
  declareTest("No drug era created from procedure drugs since they are not related to ingredients", source_pid = patient$enrolid, cdm_pid = patient$person_id)
  add_enrollment_detail(enrolid=patient$enrolid, dtend = '2012-12-31', dtstart = '2012-01-01')
  add_inpatient_services(enrolid = patient$enrolid, proc1 = '90376', svcdate = '2012-03-26', tsvcdat = '2012-03-30', caseid = encounter$caseid, year = '2012')
  expect_no_drug_era(person_id = patient$person_id)
  
  patient <- createPatient()
  encounter <- createEncounter()
  declareTest("Drug with two ingredients should have two drug eras", source_pid = patient$enrolid, cdm_pid = patient$person_id)
  add_enrollment_detail(enrolid=patient$enrolid, dtend = '2012-12-31', dtstart = '2010-01-01')
  add_drug_claims(enrolid = patient$enrolid, ndcnum = '00008419001', year = '2012', svcdate = '05-01-2010')
  expect_drug_era(person_id = patient$person_id, drug_concept_id = '1134439', drug_era_start_date ='05-01-2010')
  expect_drug_era(person_id = patient$person_id, drug_concept_id = '1112807', drug_era_start_date ='05-01-2010')
  
}