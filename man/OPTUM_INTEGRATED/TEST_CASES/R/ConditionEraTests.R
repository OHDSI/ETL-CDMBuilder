createConditionEraTests <- function()
{
  
  # Execute Optum SES/DOD Tests ----
  
  patient <- createPatient();
  claim <- createClaim();
  declareTest("Patient has Medical records (some which are Concept_ID = 0) that both collapse and stay separate in the Condition Era table", source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male', first_month_active = '200701', last_month_active = '201401')
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2014-10-31',
                    ptid = patient$ptid, pat_planid = patient$pat_planid, product = 'HMO')
  add_medical_claims(clmid = claim$clmid, clmseq = '001', diag1 = '7061', lst_dt = '2013-07-01',
                     icd_flag = '9', pat_planid = patient$pat_planid, ptid = patient$ptid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  add_medical_claims(clmid = claim$clmid, clmseq = '001', diag1 = '7061', lst_dt = '2013-07-01',
                     icd_flag = '9', pat_planid = patient$pat_planid, ptid = patient$ptid, fst_dt = '2013-07-25', prov = '111111', provcat = '5678')
  add_medical_claims(clmid = claim$clmid, clmseq = '001', diag1 = '7872', lst_dt = '2013-07-01',
                     icd_flag = '9', pat_planid = patient$pat_planid, ptid = patient$ptid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  add_medical_claims(clmid = claim$clmid, clmseq = '001', diag1 = 'V1582', lst_dt = '2013-07-01',
                     icd_flag = '9', pat_planid = patient$pat_planid, ptid = patient$ptid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  
  expect_condition_era(person_id = patient$person_id, condition_concept_id = 141095, condition_occurrence_count = 2)
  expect_condition_era(person_id = patient$person_id, condition_concept_id = 31317, condition_occurrence_count = 1)
  expect_no_condition_era(person_id = patient$person_id, condition_concept_id = 0)
}