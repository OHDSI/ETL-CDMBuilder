createConditionOccurrenceTests <- function()
{
  
  # Execute Optum SES/DOD Tests ----
  
  patient <- createPatient();
  claim <- createClaim();
  declareTest("Patient has 1 Medical Record with the same diag code listed in diag1-diag5", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male', first_month_active = '201001', last_month_active = '201401')
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    ptid = patient$ptid, pat_planid = patient$pat_planid, product = 'HMO')
  add_medical_claims(clmid = claim$clmid, clmseq = '001', diag1 = '7061', diag2 = '7061', diag3 = '7061', diag4 = '7061', diag5 = '7061', 
                     lst_dt = '2013-07-01', icd_flag = '9', pat_planid = patient$pat_planid, ptid = patient$ptid, 
                     fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  expect_condition_occurrence(person_id = patient$person_id, condition_concept_id = 141095)
  expect_count_condition_occurrence(person_id = patient$person_id, rowCount = 1)
  
  
  patient <- createPatient();
  clmid <- createClaim();
  declareTest("Patient has medical records which have some valid and invalid formatted DIAG codes.", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male', first_month_active = '201001', last_month_active = '201401')
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    ptid = patient$ptid, pat_planid = patient$pat_planid, product = 'HMO')
  add_medical_claims(clmid = claim$clmid, clmseq = '001', diag1 = '7061', diag2 = '99999', lst_dt = '2013-07-01',
                     icd_flag = '9', pat_planid = patient$pat_planid, ptid = patient$ptid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  expect_condition_occurrence(person_id = patient$person_id, condition_concept_id = 141095)
  expect_condition_occurrence(person_id = patient$person_id, condition_source_value = '99999', condition_concept_id = 0)
  
  
  patient <- createPatient();
  clmid <- createClaim();
  declareTest("Patient has a series of 3 inpatient visits with same dates and diagnoses in separate records.", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male', first_month_active = '201001', last_month_active = '201401')
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    ptid = patient$ptid, pat_planid = patient$pat_planid, product = 'HMO')
  add_medical_claims(clmid = claim$clmid, clmseq = '001', diag1 = '7061', lst_dt = '2013-07-01', rvnu_cd = '0100', pos = '20',
                     icd_flag = '9', pat_planid = patient$pat_planid, ptid = patient$ptid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  add_medical_claims(clmid = claim$clmid, clmseq = '002', diag1 = '7061', lst_dt = '2013-07-01', rvnu_cd = '0100', pos = '20',
                     icd_flag = '9', pat_planid = patient$pat_planid, ptid = patient$ptid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  add_medical_claims(clmid = claim$clmid, clmseq = '003', diag1 = '7061', lst_dt = '2013-07-01', rvnu_cd = '0100', pos = '20',
                     icd_flag = '9', pat_planid = patient$pat_planid, ptid = patient$ptid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  expect_condition_occurrence(person_id = patient$person_id, condition_concept_id = 141095)
  expect_count_condition_occurrence(person_id = patient$person_id, rowCount = 1)
  
  
  patient <- createPatient();
  clmid <- createClaim();
  declareTest("Creates two Condition Occurrences from a single Medical row that specifies an ICD9 code that has multiple SNOMED mappings.", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male', first_month_active = '201001', last_month_active = '201401')
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    ptid = patient$ptid, pat_planid = patient$pat_planid, product = 'HMO')
  add_medical_claims(clmid = claim$clmid, clmseq = '001', diag1 = '24910', lst_dt = '2013-07-01',
                     icd_flag = '9', pat_planid = patient$pat_planid, ptid = patient$ptid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  expect_condition_occurrence(person_id = patient$person_id, condition_source_value = '24910', condition_concept_id = 443727)
  expect_condition_occurrence(person_id = patient$person_id, condition_source_value = '24910', condition_concept_id = 195771)
  expect_count_condition_occurrence(person_id = patient$person_id, rowCount = 2)
  
  
  patient <- createPatient();
  clmid <- createClaim();
  declareTest("Tests ICD10 CM vs International", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male', first_month_active = '201001', last_month_active = '201401')
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    ptid = patient$ptid, pat_planid = patient$pat_planid, product = 'HMO')
  add_medical_claims(clmid = claim$clmid, clmseq = '001', diag1 = 'S112', lst_dt = '2013-07-01',
                     icd_flag = '10', pat_planid = patient$pat_planid, ptid = patient$ptid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  expect_condition_occurrence(person_id = patient$person_id, condition_source_value = 'S112', condition_concept_id = 4053597)
  expect_no_condition_occurrence(person_id = patient$person_id, condition_source_value = 'S112', condition_concept_id = 4051128)


  # Execute Optum Oncology Tests ----
  
  
  ######################################
  # DIAGNOSIS
  ######################################
  
  
  patient <- createPatient();
  enc = createEncounter();
  declareTest("Diagnosis without ''Diagnosis of'' status is not loaded", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male', first_month_active = '200801', last_month_active = '201401')
  add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2008-05-01', eligend = '2013-10-31')
  add_encounter(enc=enc$encid, ptid = patient$ptid, interaction_date = '2009-01-01')
  add_diagnosis(ptid=patient$ptid, encid = enc$encid, diagnosis_status = 'Family history of', diagnosis_cd = '7061',
                diagnosis_cd_type = 'ICD9', diag_date = '2009-01-01')
  expect_no_condition_occurrence(person_id = patient$person_id)
  
  
  patient <- createPatient();
  enc = createEncounter();
  declareTest("Test diag_date to condition_start_date", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male', first_month_active = '200801', last_month_active = '201401')
  add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2008-05-01', eligend = '2013-10-31')
  add_encounter(enc=enc$encid, ptid = patient$ptid, interaction_date = '2009-01-01')
  add_diagnosis(ptid=patient$ptid, encid = enc$encid, diagnosis_status = 'Diagnosis of', diagnosis_cd = '7061',
                diagnosis_cd_type = 'ICD9', diag_date = '2009-01-01')
  expect_condition_occurrence(person_id = patient$person_id, condition_start_date = '2009-01-01')
  
  
  patient <- createPatient();
  enc = createEncounter();
  declareTest("Test diagnosis code type ICD9", source_pid = patient$ptid, cdm_pid = patient$person_id)
  enc <- createEncounter();
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male', first_month_active = '200801', last_month_active = '201401')
  add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2008-05-01', eligend = '2013-10-31')
  add_encounter(enc=enc$encid, ptid = patient$ptid, interaction_date = '2009-01-01')
  add_diagnosis(ptid=patient$ptid, encid = enc$encid, diagnosis_status = 'Diagnosis of', diagnosis_cd = '7061',
                diagnosis_cd_type = 'ICD9', diag_date = '2009-01-01')
  expect_condition_occurrence(person_id = patient$person_id, condition_concept_id = 141095, condition_source_value = '7061')
  
  
  patient <- createPatient();
  enc <- createEncounter();
  declareTest("Test diagnosis code type ICD10", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male', first_month_active = '200801', last_month_active = '201401')
  add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2008-05-01', eligend = '2013-10-31')
  add_encounter(enc=enc$encid, ptid = patient$ptid, interaction_date = '2009-01-01')
  add_diagnosis(ptid=patient$ptid, encid = enc$encid, diagnosis_status = 'Diagnosis of', diagnosis_cd = 'H44.611',
                diagnosis_cd_type = 'ICD10', diag_date = '2009-01-01')
  expect_condition_occurrence(person_id = patient$person_id, condition_concept_id = 381850, condition_source_value = 'H44.611')
  
  
  patient <- createPatient();
  enc <- createEncounter();
  declareTest("Test primary diagnosis to condition_type_concept_id", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male', first_month_active = '200801', last_month_active = '201401')
  add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2008-05-01', eligend = '2013-10-31')
  add_encounter(enc=enc$encid, ptid = patient$ptid, interaction_date = '2009-01-01')
  add_diagnosis(ptid=patient$ptid, encid = enc$encid, diagnosis_status = 'Diagnosis of', diagnosis_cd = '7061',
                diagnosis_cd_type = 'ICD9', diag_date = '2009-01-01', primary_diagnosis = '1')
  expect_condition_occurrence(person_id = patient$person_id, condition_type_concept_id = 44786627)
  
  
  patient <- createPatient();
  enc <- createEncounter();
  declareTest("Test non-primary diagnosis to condition_type_concept_id", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male', first_month_active = '200801', last_month_active = '201401')
  add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2008-05-01', eligend = '2013-10-31')
  add_encounter(enc=enc$encid, ptid = patient$ptid, interaction_date = '2009-01-01')
  add_diagnosis(ptid=patient$ptid, encid = enc$encid, diagnosis_status = 'Diagnosis of', diagnosis_cd = '7061',
                diagnosis_cd_type = 'ICD9', diag_date = '2009-01-01', primary_diagnosis = '0')
  expect_condition_occurrence(person_id = patient$person_id, condition_type_concept_id = 44786629)
  
  
  patient <- createPatient();
  enc <- createEncounter();
  declareTest("Test diagnosis code with wrong diagnosis code type", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male', first_month_active = '200801', last_month_active = '201401')
  add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2008-05-01', eligend = '2013-10-31')
  add_encounter(enc=enc$encid, ptid = patient$ptid, interaction_date = '2009-01-01')
  add_diagnosis(ptid=patient$ptid, encid = enc$encid, diagnosis_status = 'Diagnosis of', diagnosis_cd = '44786629',
                diagnosis_cd_type = 'ICD9', diag_date = '2009-01-01')
  expect_condition_occurrence(person_id = patient$person_id, condition_concept_id = 0)
  
  
  patient <- createPatient();
  enc <- createEncounter();
  declareTest("Test blank diagnosis code", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male', first_month_active = '200801', last_month_active = '201401')
  add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2008-05-01', eligend = '2013-10-31')
  add_encounter(enc=enc$encid, ptid = patient$ptid, interaction_date = '2009-01-01')
  add_diagnosis(ptid=patient$ptid, encid = enc$encid, diagnosis_status = 'Diagnosis of', diagnosis_cd = NULL,
                diagnosis_cd_type = NULL, diag_date = '2009-01-01')
  expect_condition_occurrence(person_id = patient$person_id, condition_concept_id = 0)
  
  ######################################
  # PROCEDURE
  ######################################
  
  patient <- createPatient();
  enc <- createEncounter();
  declareTest("Test HCPCS derived condition coming from procedure table", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male', first_month_active = '200801', last_month_active = '201401')
  add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2008-05-01', eligend = '2013-10-31')
  add_encounter(enc=enc$encid, ptid = patient$ptid, interaction_date = '2009-01-01')
  add_procedure(ptid=patient$ptid, encid = enc$encid, proc_code = 'G8007', proc_code_type = 'HCPCS', proc_date = '2009-01-01')
  expect_condition_occurrence(person_id = patient$person_id, condition_concept_id = 312327)
  
  #no conditions in latest vocab originate from ICD9Proc, ICD10PCS, or CPT4
  
  # Test provider for encounter
  patient <- createPatient();
  provider <- createProvider();
  enc <- createEncounter();
  declareTest("Patient has PROCEDURE record; validate the provider for the encid is mapped to provid", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male', first_month_active = '200801', last_month_active = '201401')
  add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2008-05-01', eligend = '2013-10-31')
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
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male', first_month_active = '200801', last_month_active = '201401')
  add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2008-05-01', eligend = '2013-10-31')
  add_encounter(enc = enc$encid, ptid = patient$ptid, interaction_type = 'Inpatient', interaction_date = '2009-01-01', visitid = enc$encId)
  add_procedure(ptid = patient$ptid, encid = enc$encid, proc_code = 'G8007', proc_code_type = 'HCPCS', proc_date = '2009-01-01')
  expect_condition_occurrence(person_id = patient$person_id, visit_occurrence_id = enc$visit_occurrence_id)

}
