createVisitOccurrenceTests <- function()
{
  
  # Execute Optum SES/DOD Tests ----

  patient <- createPatient();
  claim <- createClaim();
  declareTest("Creates an Inpatient Visit Occurrence for a patient with a single medical diagnosis.", 
              source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male', first_month_active = '200701', last_month_active = '201401')
  add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2007-01-01', eligend = '2014-10-31')
  add_medical_claims(clmid = claim$clmid, clmseq = '001', diag1 = '7061', lst_dt = '2013-07-01', rvnu_cd = '0100', pos = '20',
                     icd_flag = '9', pat_planid = patient$pat_planid, ptid = patient$ptid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  expect_visit_occurrence(person_id = patient$person_id, visit_concept_id = 9201)
  
  
  patient <- createPatient();
  claim <- createClaim();
  declareTest("Creates an Outpatient Visit Occurrence for a patient with a single medical diagnosis.", 
              source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male', first_month_active = '200701', last_month_active = '201401')
  add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2007-01-01', eligend = '2014-10-31')
  add_medical_claims(clmid = claim$clmid, clmseq = '001', diag1 = '7061', lst_dt = '2013-07-01',
                     icd_flag = '9', pat_planid = patient$pat_planid, ptid = patient$ptid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  expect_visit_occurrence(person_id = patient$person_id, visit_concept_id = 9202)
  
  
  patient <- createPatient();
  claim <- createClaim();
  declareTest("Creates an Emergency Room Visit Occurrence for a patient with a single medical diagnosis.", 
              source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male', first_month_active = '200701', last_month_active = '201401')
  add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2007-01-01', eligend = '2014-10-31')
  add_medical_claims(clmid = claim$clmid, clmseq = '001', diag1 = '7061', lst_dt = '2013-07-01', rvnu_cd = '0981', pos = '23',
                     icd_flag = '9', pat_planid = patient$pat_planid, ptid = patient$ptid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  expect_visit_occurrence(person_id = patient$person_id, visit_concept_id = 9203)
  
  
  patient <- createPatient();
  claim <- createClaim();
  declareTest("Creates an Long Term Care Visit Occurrence for a patient with a single medical diagnosis.", 
              source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male', first_month_active = '200701', last_month_active = '201401')
  add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2007-01-01', eligend = '2014-10-31')
  add_medical_claims(clmid = claim$clmid, clmseq = '001', diag1 = '7061', lst_dt = '2013-07-01', rvnu_cd = '0100', pos = '13',
                     icd_flag = '9', pat_planid = patient$pat_planid, ptid = patient$ptid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  expect_visit_occurrence(person_id = patient$person_id, visit_concept_id = 42898160)
  
  
  patient <- createPatient();
  claim <- createClaim();
  declareTest("Patient has a series of diagnoses that fall outside of their Observation Period, and therefore dates must be trimmed to fall within the OP range.", 
              source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male', first_month_active = '201001', last_month_active = '201301')
  add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2010-01-01', eligend = '2013-10-31')
  add_medical_claims(clmid = claim$clmid, clmseq = '001', diag1 = '7061', lst_dt = '2009-07-01',
                     icd_flag = '9', pat_planid = patient$pat_planid, ptid = patient$ptid, fst_dt = '2009-07-01', prov = '111111', provcat = '5678')
  expect_no_visit_occurrence(person_id = patient$person_id)
  
  # Execute Optum Oncology Tests ----
  patient <- createPatient();
  declareTest(description="Visit from Diagnosis Test", source_pid = patient$ptid, cdm_pid = patient$person_id)
  encounter1 <- createEncounter();
  encounter2 <- createEncounter();
  visitId <- sequencer$nextSequence();
  
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male', first_month_active = '200701', last_month_active = '201501')
  add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2010-01-01', eligend = '2015-10-31')
  add_diagnosis(ptid=patient$ptid, diagnosis_cd = '4019', diag_date = "2014-03-06", diagnosis_status = 'Diagnosis of', diagnosis_cd_type = 'ICD9', encid = encounter1$encid);
  add_diagnosis(ptid=patient$ptid, diagnosis_cd = '2724', diag_date = "2014-03-07", diagnosis_status = 'Diagnosis of', diagnosis_cd_type = 'ICD9', encid = encounter2$encid);
  add_visit(ptid=patient$ptid, visitid = visitId, visit_start_date = "2014-03-05", visit_end_date = "2014-03-10")
  add_encounter(ptid=patient$ptid, encid = encounter1$encid, visitid = visitId, interaction_date = "2014-03-06")
  add_encounter(ptid=patient$ptid, encid = encounter2$encid, visitid = visitId, interaction_date = "2014-03-07")
  
  expect_count_visit_occurrence(rowCount = 1, person_id = patient$person_id, visit_start_date = "2014-03-05", visit_end_date = "2014-03-10");
  expect_no_visit_occurrence(person_id = patient$person_id, visit_start_date = "2014-03-06")
  expect_no_visit_occurrence(person_id = patient$person_id, visit_start_date = "2014-03-07")
  
  declareTest("Visit from Drug Exposure")
}
