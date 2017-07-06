createPayerPlanPeriodTests <- function()
{
  # Execute Optum SES/DOD Tests ----
  
  patient <- createPatient();
  declareTest("Tests when patient has multiple payers active in the same time window.", source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male', first_month_active = '200701', last_month_active = '201001')
  add_member_detail(aso = 'N', bus = 'CMO', cdhp = 3, eligeff = '2007-10-01', eligend = '2007-10-31',
                    ptid = patient$ptid, pat_planid = patient$pat_planid, product = 'HMO')
  add_member_detail(aso = 'Y', bus = 'CMO', cdhp = 3, eligeff = '2007-10-01', eligend = '2007-10-31',
                    ptid = patient$ptid, pat_planid = patient$pat_planid, product = 'EPO')
  expect_count_payer_plan_period(rowCount = 2, person_id = patient$person_id)
  
  
  patient <- createPatient();
  declareTest("Checks the PAYER_PLAN_SOURCE_VALUE mapping for all combos of source values.", source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male', first_month_active = '200601', last_month_active = '201001')
  add_member_detail(aso = 'N', bus = 'MCR', cdhp = 3, eligeff = '2006-01-01', eligend = '2006-05-31',
                    ptid = patient$ptid, pat_planid = patient$pat_planid, product = 'HMO')
  expect_payer_plan_period(person_id = patient$person_id, payer_source_value = 'MCR Health Maint Org')
  
  
  patient <- createPatient();
  declareTest("Checks the PAYER_PLAN_SOURCE_VALUE mapping for all combos of source values.", source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male', first_month_active = '200701', last_month_active = '201001')
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2007-05-01', eligend = '2015-12-31',
                    ptid = patient$ptid, pat_planid = patient$pat_planid, product = 'HMO')
  expect_payer_plan_period(person_id = patient$person_id, payer_source_value = 'COM Health Maint Org')
  
  
  patient <- createPatient();
  declareTest("Checks the PAYER_PLAN_SOURCE_VALUE mapping for all combos of source values.", source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male', first_month_active = '200701', last_month_active = '201001')
  add_member_detail(aso = 'Y', bus = 'COM', cdhp = 3, eligeff = '2007-05-01', eligend = '2008-06-30',
                    ptid = patient$ptid, pat_planid = patient$pat_planid, product = 'HMO')
  expect_payer_plan_period(person_id = patient$person_id, payer_source_value = 'COM (ASO) Health Maint Org')
  
  
  patient <- createPatient();
  declareTest("Checks the PAYER_PLAN_SOURCE_VALUE mapping for all combos of source values.", source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male', first_month_active = '200701', last_month_active = '201001')
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2007-05-01', eligend = '2008-12-31',
                    ptid = patient$ptid, pat_planid = patient$pat_planid, product = 'HMO')
  expect_payer_plan_period(person_id = patient$person_id, payer_source_value = 'COM Health Maint Org')
  
  
  patient <- createPatient();
  declareTest("Checks the PAYER_PLAN_SOURCE_VALUE mapping for all combos of source values.", source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male', first_month_active = '200701', last_month_active = '201001')
add_member_detail(aso = 'Y', bus = 'COM', cdhp = 3, eligeff = '2007-05-01', eligend = '2008-12-31',
                    ptid = patient$ptid, pat_planid = patient$pat_planid, product = 'EPO')
  expect_payer_plan_period(person_id = patient$person_id, payer_source_value = 'COM (ASO) Exclusive Provider Org')
  
  
  patient <- createPatient();
  declareTest("Checks the PAYER_PLAN_SOURCE_VALUE mapping for all combos of source values.", source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male', first_month_active = '200701', last_month_active = '201001')
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2000-09-01', eligend = '2008-12-31',
                    ptid = patient$ptid, pat_planid = patient$pat_planid, product = 'IND')
  expect_payer_plan_period(person_id = patient$person_id, payer_source_value = 'COM Indemnity')
  
  
  patient <- createPatient();
  declareTest("Checks the PAYER_PLAN_SOURCE_VALUE mapping for all combos of source values.", source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male', first_month_active = '200701', last_month_active = '201001')
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2007-05-01', eligend = '2008-08-31',
                    ptid = patient$ptid, pat_planid = patient$pat_planid, product = 'HMO')
  expect_payer_plan_period(person_id = patient$person_id, payer_source_value = 'COM Health Maint Org')
  
  
  patient <- createPatient();
  declareTest("Checks the PAYER_PLAN_SOURCE_VALUE mapping for all combos of source values.", source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male', first_month_active = '200701', last_month_active = '201001')
  add_member_detail(aso = 'Y', bus = 'COM', cdhp = 3, eligeff = '2007-05-01', eligend = '2008-08-31',
                    ptid = patient$ptid, pat_planid = patient$pat_planid, product = 'PPO')
  expect_payer_plan_period(person_id = patient$person_id, payer_source_value = 'COM (ASO) Preferred Provider Org')
  
  
  patient <- createPatient();
  declareTest("Checks the PAYER_PLAN_SOURCE_VALUE mapping for all combos of source values.", source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male', first_month_active = '200701', last_month_active = '201001')
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2003-11-01', eligend = '2008-01-31',
                    ptid = patient$ptid, pat_planid = patient$pat_planid, product = 'OTH')
  expect_payer_plan_period(person_id = patient$person_id, payer_source_value = 'COM Other')
  
  
  patient <- createPatient();
  declareTest("Checks the PAYER_PLAN_SOURCE_VALUE mapping for all combos of source values.", source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male', first_month_active = '200701', last_month_active = '201001')
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2007-05-01', eligend = '2008-06-30',
                    ptid = patient$ptid, pat_planid = patient$pat_planid, product = 'POS')
  expect_payer_plan_period(person_id = patient$person_id, payer_source_value = 'COM Point of Service')
  
  
  patient <- createPatient();
  declareTest("Patient has multiple payer plan periods that should be collapsed based on PAYER_SOURCE_VALUE and PLAN_SOURCE_VALUE", 
              source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(ptid=patient$ptid, birth_yr = 1950, gender = 'Male', first_month_active = '200701', last_month_active = '201001')
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2007-05-01', eligend = '2008-10-31',
                    ptid = patient$ptid, pat_planid = patient$pat_planid, product = 'HMO')
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2008-12-01', eligend = '2010-08-31',
                    ptid = patient$ptid, pat_planid = patient$pat_planid, product = 'HMO')
  expect_count_payer_plan_period(rowCount = 1, person_id = patient$person_id)
}
