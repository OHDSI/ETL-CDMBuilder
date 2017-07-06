createProcedureOccurrenceTests <- function()
{
  
  # Execute Optum SES/DOD Tests ----
  
  patient <- createPatient();
  claim <- createClaim();
  declareTest("Patient has 2 medical records which have the same proc code listed in proc1-proc3, with repeated PROC_CD in both records.", 
              source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male', first_month_active = '200701', last_month_active = '201401')
  add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2010-05-01', eligend = '2013-10-31')
  add_medical_claims(clmid = claim$clmid, clmseq = '001', diag1 = '7061', proc1 = '70481', proc2 = '70481', proc3 = '70481', proc_cd = '92928', lst_dt = '2013-07-01',
                     pat_planid = patient$pat_planid, ptid = patient$ptid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  add_medical_claims(clmid = claim$clmid, clmseq = '002', diag1 = '7061', proc1 = '70481', proc2 = '70481', proc3 = '70481', proc_cd = '92928', lst_dt = '2013-07-01',
                     pat_planid = patient$pat_planid, ptid = patient$ptid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  expect_procedure_occurrence(person_id = patient$person_id, procedure_concept_id = 2211331)
  expect_procedure_occurrence(person_id = patient$person_id, procedure_concept_id = 43527998)
  expect_count_procedure_occurrence(person_id = patient$person_id, rowCount = 2)
  
  
  patient <- createPatient();
  claim <- createClaim();
  declareTest("Patient has medical records which have some valid and invalid formatted PROC codes.", 
              source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male', first_month_active = '200701', last_month_active = '201401')
  add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2010-05-01', eligend = '2013-10-31')
  add_medical_claims(clmid = claim$clmid, clmseq = '001', proc1 = '2', proc2 = '2', proc3 = '2', proc_cd = '92928', lst_dt = '2013-07-01',
                     pat_planid = patient$pat_planid, ptid = patient$ptid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  expect_procedure_occurrence(person_id = patient$person_id, procedure_concept_id = 43527998)
  expect_procedure_occurrence(person_id = patient$person_id, procedure_source_value = '2', procedure_concept_id = 0)
  
  
  patient <- createPatient();
  claim <- createClaim();
  declareTest("Patient has a series of 3 inpatient visits with same dates and procedure codes in separate records.", 
              source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male', first_month_active = '200701', last_month_active = '201401')
  add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2010-05-01', eligend = '2013-10-31')
  add_medical_claims(clmid = claim$clmid, clmseq = '001', diag1 = '7061', proc1 = '70481', proc_cd = '92928', lst_dt = '2013-07-01', rvnu_cd = '0100', pos = '20',
                     pat_planid = patient$pat_planid, ptid = patient$ptid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  add_medical_claims(clmid = claim$clmid, clmseq = '001', diag1 = '7061', proc1 = '70481', proc_cd = '92928', lst_dt = '2013-07-01', rvnu_cd = '0100', pos = '20',
                     pat_planid = patient$pat_planid, ptid = patient$ptid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  add_medical_claims(clmid = claim$clmid, clmseq = '001', diag1 = '7061', proc1 = '70481', proc_cd = '92928', lst_dt = '2013-07-01', rvnu_cd = '0100', pos = '20',
                     pat_planid = patient$pat_planid, ptid = patient$ptid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  expect_procedure_occurrence(person_id = patient$person_id, procedure_concept_id = 2211331)
  expect_procedure_occurrence(person_id = patient$person_id, procedure_concept_id = 43527998)
  expect_count_procedure_occurrence(person_id = patient$person_id, rowCount = 2)
  
  
  patient <- createPatient();
  claim <- createClaim();
  declareTest("Patient has series of procedures within a visit that should use the VISIT_END for PROC1-3 or FST_DT for PROC_CD to determine the procedure date.", 
              source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male', first_month_active = '200701', last_month_active = '201401')
  add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2010-05-01', eligend = '2013-10-31')
  add_medical_claims(clmid = claim$clmid, clmseq = '001', proc_cd = '92928', lst_dt = '2013-07-01',
                     pat_planid = patient$pat_planid, ptid = patient$ptid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  add_medical_claims(clmid = claim$clmid, clmseq = '001', proc1 = '70481', lst_dt = '2013-07-01',
                     pat_planid = patient$pat_planid, ptid = patient$ptid, fst_dt = '2013-07-31', prov = '111111', provcat = '5678')
  expect_procedure_occurrence(person_id = patient$person_id, procedure_concept_id = 43527998, procedure_date = '2013-07-01')
  expect_procedure_occurrence(person_id = patient$person_id, procedure_concept_id = 2211331, procedure_date = '2013-07-31')
  
  
  patient <- createPatient();
  claim <- createClaim();
  declareTest("Patient has multiple Medical rows with placeholders for procedure codes.", 
              source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male', first_month_active = '200701', last_month_active = '201401')
  add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2010-05-01', eligend = '2013-10-31')
  add_medical_claims(clmid = claim$clmid, clmseq = '001', proc1 = '0000000', proc2 = '0000000', proc3 = '0000000', proc_cd = '92928',
                     lst_dt = '2013-07-01', pat_planid = patient$pat_planid, ptid = patient$ptid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  add_medical_claims(clmid = claim$clmid, clmseq = '001', proc1 = '0000000', proc2 = '0000000', proc3 = '0000000', proc_cd = '70481',
                     lst_dt = '2013-07-01', pat_planid = patient$pat_planid, ptid = patient$ptid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  expect_procedure_occurrence(person_id = patient$person_id, procedure_concept_id = 43527998)
  expect_procedure_occurrence(person_id = patient$person_id, procedure_concept_id = 2211331)
  
  
  patient <- createPatient();
  claim <- createClaim();
  declareTest("Patient has Medical records with a diag1-diag5 that maps to 2 SNOMED concepts, and single procedure.", 
              source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male', first_month_active = '200701', last_month_active = '201401')
  add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2010-05-01', eligend = '2013-10-31')
  add_medical_claims(clmid = claim$clmid, clmseq = '001', diag1 = '24910', lst_dt = '2013-07-01', proc_cd = '70481',
                     icd_flag = '9', pat_planid = patient$pat_planid, ptid = patient$ptid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  expect_condition_occurrence(person_id = patient$person_id, condition_source_value = '24910', condition_concept_id = 443727)
  expect_condition_occurrence(person_id = patient$person_id, condition_source_value = '24910', condition_concept_id = 195771)
  expect_procedure_occurrence(person_id = patient$person_id, procedure_concept_id = 2211331)
  
  
  patient <- createPatient();
  claim <- createClaim();
  declareTest("Patient has 2 medical records with 2 different procedures, but only 1 record has diag_1 specified.", 
              source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male', first_month_active = '200701', last_month_active = '201401')
  add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2010-05-01', eligend = '2013-10-31')
  add_medical_claims(clmid = claim$clmid, clmseq = '001', diag1 = '7061', lst_dt = '2013-07-01', proc_cd = '92928',
                     icd_flag = '9', pat_planid = patient$pat_planid, ptid = patient$ptid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  add_medical_claims(clmid = claim$clmid, clmseq = '001', lst_dt = '2013-07-01', proc_cd = '70481',
                     pat_planid = patient$pat_planid, ptid = patient$ptid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  expect_condition_occurrence(person_id = patient$person_id, condition_concept_id = 141095)
  expect_procedure_occurrence(person_id = patient$person_id, procedure_concept_id = 43527998)
  expect_procedure_occurrence(person_id = patient$person_id, procedure_concept_id = 2211331)
  
  
  patient <- createPatient();
  claim <- createClaim();
  declareTest("Patient has diag1-5 source codes mapping to domain Procedure and visit_place_of_service of IP; does not get mapped to Condition", 
              source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male', first_month_active = '200701', last_month_active = '201401')
  add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2010-05-01', eligend = '2013-10-31')
  add_medical_claims(clmid = claim$clmid, clmseq = '001', diag1 = 'V5789', lst_dt = '2013-07-01', proc_cd = '92928', rvnu_cd = '0100', pos = '20',
                     icd_flag = '9', pat_planid = patient$pat_planid, ptid = patient$ptid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  expect_procedure_occurrence(person_id = patient$person_id, procedure_concept_id = 4180248)
  expect_no_condition_occurrence(person_id = patient$person_id, condition_source_value = 'V5789')
  expect_visit_occurrence(person = patient$person_id, visit_concept_id = 9201)
  
  
  
  patient <- createPatient();
  claim <- createClaim();
  declareTest("Patient has diag1-5 source codes mapping to domain Procedure and visit_place_of_service of OP; does not get mapped to Condition", 
              source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male', first_month_active = '200701', last_month_active = '201401')
  add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2010-05-01', eligend = '2013-10-31')
  add_medical_claims(clmid = claim$clmid, clmseq = '001', diag1 = 'V5789', lst_dt = '2013-07-01', proc_cd = '92928',
                     icd_flag = '9', pat_planid = patient$pat_planid, ptid = patient$ptid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  expect_procedure_occurrence(person_id = patient$person_id, procedure_concept_id = 4180248)
  expect_no_condition_occurrence(person_id = patient$person_id, condition_source_value = 'V5789')
  expect_visit_occurrence(person = patient$person_id, visit_concept_id = 9202)
  
  
  patient <- createPatient();
  claim <- createClaim();
  declareTest("Patient has procedure from a lab result proc_cd", 
              source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male', first_month_active = '200701', last_month_active = '201401')
  add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2010-05-01', eligend = '2013-10-31')
  add_lab_results(labclmid = claim$clmid, fst_dt = '2013-07-01', pat_planid = patient$pat_planid, ptid = patient$ptid, 
                  loinc_cd = '', proc_cd = '70481')
  expect_procedure_occurrence(person_id = patient$person_id, procedure_concept_id = 2211331)

  
  # Execute Optum Oncology Tests ----

  
  ######################################
  # PROCEDURE
  ######################################
  patient <- createPatient();
  declareTest("Tests procedure record with proc_code_type CPT4", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male', first_month_active = '200701', last_month_active = '201401')
  add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2010-05-01', eligend = '2013-10-31')
  add_procedure(ptid=patient$ptid, proc_code = '36415', proc_code_type = 'CPT4', proc_date = '2011-01-01')
  expect_procedure_occurrence(person_id = patient$person_id, procedure_concept_id = 2108115, procedure_source_value = '36415')
  
  
  patient <- createPatient();
  declareTest("Tests procedure record with proc_code_type HCPCS", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male', first_month_active = '200701', last_month_active = '201401')
  add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2010-05-01', eligend = '2013-10-31')
  add_procedure(ptid=patient$ptid, proc_code = 'C9743', proc_code_type = 'HCPCS', proc_date = '2011-01-01')
  expect_procedure_occurrence(person_id = patient$person_id, procedure_concept_id = 915607, procedure_source_value = 'C9743')
  
  
  patient <- createPatient();
  declareTest("Tests procedure record with proc_code_type ICD9", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male', first_month_active = '200701', last_month_active = '201401')
  add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2010-05-01', eligend = '2013-10-31')
  add_procedure(ptid=patient$ptid, proc_code = '33.50', proc_code_type = 'ICD9', proc_date = '2011-01-01')
  expect_procedure_occurrence(person_id = patient$person_id, procedure_concept_id = 2001373, procedure_source_value = '33.50')
  
  
  patient <- createPatient();
  declareTest("Tests procedure record with proc_code_type ICD10", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male', first_month_active = '200701', last_month_active = '201401')
  add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2010-05-01', eligend = '2013-10-31')
  add_procedure(ptid=patient$ptid, proc_code = '0J8S0', proc_code_type = 'ICD9', proc_date = '2011-01-01')
  expect_procedure_occurrence(person_id = patient$person_id, procedure_concept_id = 2863829, procedure_source_value = '0J8S0')
  
  
  patient <- createPatient();
  declareTest("Tests procedure type concept", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male', first_month_active = '200701', last_month_active = '201401')
  add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2010-05-01', eligend = '2013-10-31')
  add_procedure(ptid=patient$ptid, proc_date = '2011-01-01', proc_code = '36415', proc_code_type = 'CPT4')
  expect_procedure_occurrence(person_id = patient$person_id, procedure_type_concept_id = 38000275)
  
  
  patient <- createPatient();
  declareTest("Tests procedure record with proc_code_type of blank results in unmapped procedure occurrence", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male', first_month_active = '200701', last_month_active = '201401')
  add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2010-05-01', eligend = '2013-10-31')
  add_procedure(ptid=patient$ptid, proc_code_type = '', proc_date = '2011-01-01', proc_code = '36415')
  expect_procedure_occurrence(person_id = patient$person_id, procedure_concept_id = 0)
  
  
  patient <- createPatient();
  declareTest("Tests procedure record with proc_code_type CUSTOM results in unmapped procedure occurrence", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male', first_month_active = '200701', last_month_active = '201401')
  add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2010-05-01', eligend = '2013-10-31')
  add_procedure(ptid=patient$ptid, proc_code_type = 'CUSTOM', proc_date = '2011-01-01', proc_code = '36415')
  expect_procedure_occurrence(person_id = patient$person_id, procedure_concept_id = 0)
  
  
  patient <- createPatient();
  declareTest("Tests procedure record with proc_code_type REV results in unmapped procedure occurrence", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male', first_month_active = '200701', last_month_active = '201401')
  add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2010-05-01', eligend = '2013-10-31')
  add_procedure(ptid=patient$ptid, proc_code_type = 'REV', proc_date = '2011-01-01', proc_code = '36415')
  expect_procedure_occurrence(person_id = patient$person_id, procedure_concept_id = 0)
  
  
  patient <- createPatient();
  declareTest("Tests procedure record with proc_code_type CLM_UNK results in unmapped procedure occurrence", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male', first_month_active = '200701', last_month_active = '201401')
  add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2010-05-01', eligend = '2013-10-31')
  add_procedure(ptid=patient$ptid, proc_code_type = 'CLM_UNK', proc_date = '2011-01-01', proc_code = '36415')
  expect_procedure_occurrence(person_id = patient$person_id, procedure_concept_id = 0)
  
  ######################################
  # DIAGNOSIS
  ######################################
  
  patient <- createPatient();
  declareTest("Tests procedure type concept id from diagnosis record", source_pid = patient$ptid, cdm_pid = patient$person_id)
  enc <- createEncounter();
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male', first_month_active = '200701', last_month_active = '201401')
  add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2010-05-01', eligend = '2013-10-31')
  add_diagnosis(ptid=patient$ptid, diagnosis_status = 'Diagnosis of', diagnosis_cd = '63491',
                diagnosis_cd_type = 'ICD9', diag_date = '2011-01-01')
  expect_procedure_occurrence(person_id = patient$person_id, procedure_type_concept_id = 42865906)
  
  
  patient <- createPatient();
  declareTest("Diagnosis without ''Diagnosis of'' status is not loaded", source_pid = patient$ptid, cdm_pid = patient$person_id)
  enc <- createEncounter();
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male', first_month_active = '200701', last_month_active = '201401')
  add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2010-05-01', eligend = '2013-10-31')
  add_diagnosis(ptid=patient$ptid, diagnosis_status = 'Family history of', diagnosis_cd = '634.91',
                diagnosis_cd_type = 'ICD9', diag_date = '2011-01-01')
  expect_no_procedure_occurrence(person_id = patient$person_id)
  
  
  patient <- createPatient();
  declareTest("Diagnosis record with diagnosis_cd_type ICD9", source_pid = patient$ptid, cdm_pid = patient$person_id)
  enc <- createEncounter();
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male', first_month_active = '200701', last_month_active = '201401')
  add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2010-05-01', eligend = '2013-10-31')
  add_diagnosis(ptid=patient$ptid, diagnosis_status = 'Diagnosis of', diagnosis_cd = '63491',
                diagnosis_cd_type = 'ICD9', diag_date = '2011-01-01')
  expect_procedure_occurrence(person_id = patient$person_id, procedure_concept_id = 435868, procedure_source_value = '63491')
  
  
  patient <- createPatient();
  declareTest("Diagnosis record with diagnosis_cd_type ICD10", source_pid = patient$ptid, cdm_pid = patient$person_id)
  enc <- createEncounter();
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male', first_month_active = '200701', last_month_active = '201401')
  add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2010-05-01', eligend = '2013-10-31')
  add_diagnosis(ptid=patient$ptid, diagnosis_status = 'Diagnosis of', diagnosis_cd = 'O04.87',
                diagnosis_cd_type = 'ICD10', diag_date = '2011-01-01')
  expect_procedure_occurrence(person_id = patient$person_id, procedure_concept_id = 43530939, procedure_source_value = 'O04.87')
  
  
  patient <- createPatient();
  declareTest("Diagnosis record with diagnosis_cd_type SNOMED", source_pid = patient$ptid, cdm_pid = patient$person_id)
  enc <- createEncounter();
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male', first_month_active = '200701', last_month_active = '201401')
  add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2010-05-01', eligend = '2013-10-31')
  add_diagnosis(ptid=patient$ptid, diagnosis_status = 'Diagnosis of', diagnosis_cd = '10019001',
                diagnosis_cd_type = 'SNOMED', diag_date = '2011-01-01')
  expect_procedure_occurrence(person_id = patient$person_id, procedure_concept_id = 4001760, procedure_source_value = '10019001')
}
