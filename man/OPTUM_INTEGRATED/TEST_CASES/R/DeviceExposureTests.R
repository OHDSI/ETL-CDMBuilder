createDeviceExposureTests <- function()
{
  
  # Execute Optum SES/DOD Tests ----
  
  patient <- createPatient();
  claim <- createClaim();
  declareTest("Patient has diag1-5 source codes mapping to domain Device and visit_place_of_service of IP; does not get mapped to Condition", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male', first_month_active = '201001', last_month_active = '201401')
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    ptid = patient$ptid, pat_planid = patient$pat_planid, product = 'HMO')
  add_medical_claims(clmid = claim$clmid, clmseq = '001', diag1 = 'Y731', lst_dt = '2013-07-01', rvnu_cd = '0100', pos = '20',
                     icd_flag = '10', pat_planid = patient$pat_planid, ptid = patient$ptid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  expect_visit_occurrence(person_id = patient$person_id, visit_concept_id = 9201)
  expect_device_exposure(person_id = patient$person_id, device_source_value = 'Y731')
  expect_no_condition_occurrence(person_id = patient$person_id, condition_source_value = 'Y731')
  
  
  patient <- createPatient();
  claim <- createClaim();
  declareTest("Patient has diag1-5 source codes mapping to domain Observation and visit_place_of_service of OP; does not get mapped to Condition", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male', first_month_active = '201001', last_month_active = '201401')
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    ptid = patient$ptid, pat_planid = patient$pat_planid, product = 'HMO')
  add_medical_claims(clmid = claim$clmid, clmseq = '001', diag1 = 'Y731', lst_dt = '2013-07-01',
                     icd_flag = '10', pat_planid = patient$pat_planid, ptid = patient$ptid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  expect_visit_occurrence(person_id = patient$person_id, visit_concept_id = 9202)
  expect_device_exposure(person_id = patient$person_id, device_source_value = 'Y731')
  expect_no_condition_occurrence(person_id = patient$person_id, condition_source_value = 'Y731')
  
  
  patient <- createPatient();
  claim <- createClaim();
  declareTest("Patient has proc1-3 source codes mapping to domain Device and visit_place_of_service of IP; does not get mapped to Procedure", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male', first_month_active = '201001', last_month_active = '201401')
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    ptid = patient$ptid, pat_planid = patient$pat_planid, product = 'HMO')
  add_medical_claims(clmid = claim$clmid, clmseq = '001', proc1 = 'K0901', lst_dt = '2013-07-01', rvnu_cd = '0100', pos = '20',
                     pat_planid = patient$pat_planid, ptid = patient$ptid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  expect_visit_occurrence(person_id = patient$person_id, visit_concept_id = 9201)
  expect_device_exposure(person_id = patient$person_id, device_source_value = 'K0901')
  expect_no_procedure_occurrence(person_id = patient$person_id, procedure_source_value = 'K0901')
  
  
  patient <- createPatient();
  claim <- createClaim();
  declareTest("Patient has proc1-3 source codes mapping to domain Device and visit_place_of_service of OP; does not get mapped to Procedure", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male', first_month_active = '201001', last_month_active = '201401')
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    ptid = patient$ptid, pat_planid = patient$pat_planid, product = 'HMO')
  add_medical_claims(clmid = claim$clmid, clmseq = '001', proc1 = 'K0901', lst_dt = '2013-07-01',
                     pat_planid = patient$pat_planid, ptid = patient$ptid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  expect_visit_occurrence(person_id = patient$person_id, visit_concept_id = 9202)
  expect_device_exposure(person_id = patient$person_id, device_source_value = 'K0901')
  expect_no_procedure_occurrence(person_id = patient$person_id, procedure_source_value = 'K0901')
  
  
  # Execute Optum Oncology Tests ----

  ######################################
  # PROCEDURE
  ######################################
  
  patient <- createPatient();
  declareTest("Test HCPCS derived device coming from procedure table", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male', first_month_active = '201001', last_month_active = '201401')
  add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2010-05-01', eligend = '2013-10-31')
  add_procedure(ptid=patient$ptid, proc_code = 'A4217', proc_code_type = 'HCPCS', proc_date = '2011-01-01')
  expect_device_exposure(person_id = patient$person_id, device_concept_id = 2614697, device_source_value = 'A4217', device_source_concept_id = 2614697)
  
  
  
  ######################################
  # DIAGNOSIS
  ######################################
  
  patient <- createPatient();
  declareTest("Test device derived from diagnosis table", source_pid = patient$ptid, cdm_pid = patient$person_id)
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male', first_month_active = '201001', last_month_active = '201401')
  add_member_detail(ptid = patient$ptid, pat_planid = patient$pat_planid, eligeff = '2010-05-01', eligend = '2013-10-31')
  add_diagnosis(ptid=patient$ptid, diagnosis_cd = 'Y73.0', diagnosis_cd_type = 'ICD10', diag_date = '2011-01-01',
                diagnosis_status = 'Diagnosis of')
  expect_device_exposure(person_id = patient$person_id, device_concept_id = 45767866,
                         device_source_value = 'Y73.0', device_source_concept_id = 35224758)
  
}
