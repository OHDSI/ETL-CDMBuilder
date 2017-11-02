createPayerPlanPeriodTests <- function()
{
  patient <- createPatient()
  declareTest("Tests when patient has multiple payers active in the same time window.", source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'CMO', cdhp = 3, eligeff = '2000-10-01', eligend = '2000-10-31',
                    gdr_cd = 'M', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  add_member_detail(aso = 'Y', bus = 'CMO', cdhp = 3, eligeff = '2000-10-01', eligend = '2000-10-31',
                    gdr_cd = 'M', patid = patient$patid, pat_planid = patient$patid, product = 'EPO', yrdob = 1969)
  expect_count_payer_plan_period(rowCount = 2, person_id = patient$person_id)


  patient <- createPatient()
  declareTest("Checks the PAYER_PLAN_SOURCE_VALUE mapping for all combos of source values.", source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'MCR', cdhp = 3, eligeff = '2006-01-01', eligend = '2006-05-31',
                    gdr_cd = 'M', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  expect_payer_plan_period(person_id = patient$person_id, payer_source_value = 'MCR Health Maint Org')


  patient <- createPatient()
  declareTest("Checks the PAYER_PLAN_SOURCE_VALUE mapping for all combos of source values.", source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2000-05-01', eligend = '2015-12-31',
                    gdr_cd = 'M', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  expect_payer_plan_period(person_id = patient$person_id, payer_source_value = 'COM Health Maint Org')


  patient <- createPatient()
  declareTest("Checks the PAYER_PLAN_SOURCE_VALUE mapping for all combos of source values.", source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'Y', bus = 'COM', cdhp = 3, eligeff = '2000-05-01', eligend = '2002-06-30',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  expect_payer_plan_period(person_id = patient$person_id, payer_source_value = 'COM (ASO) Health Maint Org')


  patient <- createPatient()
  declareTest("Checks the PAYER_PLAN_SOURCE_VALUE mapping for all combos of source values.", source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2000-05-01', eligend = '2001-12-31',
                    gdr_cd = 'M', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  expect_payer_plan_period(person_id = patient$person_id, payer_source_value = 'COM Health Maint Org')


  patient <- createPatient()
  declareTest("Checks the PAYER_PLAN_SOURCE_VALUE mapping for all combos of source values.", source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'Y', bus = 'COM', cdhp = 3, eligeff = '2000-05-01', eligend = '2001-12-31',
                    gdr_cd = 'M', patid = patient$patid, pat_planid = patient$patid, product = 'EPO', yrdob = 1969)
  expect_payer_plan_period(person_id = patient$person_id, payer_source_value = 'COM (ASO) Exclusive Provider Org')


  patient <- createPatient()
  declareTest("Checks the PAYER_PLAN_SOURCE_VALUE mapping for all combos of source values.", source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2000-09-01', eligend = '2001-12-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'IND', yrdob = 1969)
  expect_payer_plan_period(person_id = patient$person_id, payer_source_value = 'COM Indemnity')


  patient <- createPatient()
  declareTest("Checks the PAYER_PLAN_SOURCE_VALUE mapping for all combos of source values.", source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2000-05-01', eligend = '2000-08-31',
                    gdr_cd = 'M', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  expect_payer_plan_period(person_id = patient$person_id, payer_source_value = 'COM Health Maint Org')


  patient <- createPatient()
  declareTest("Checks the PAYER_PLAN_SOURCE_VALUE mapping for all combos of source values.", source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'Y', bus = 'COM', cdhp = 3, eligeff = '2000-05-01', eligend = '2000-08-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'PPO', yrdob = 1969)
  expect_payer_plan_period(person_id = patient$person_id, payer_source_value = 'COM (ASO) Preferred Provider Org')


  patient <- createPatient()
  declareTest("Checks the PAYER_PLAN_SOURCE_VALUE mapping for all combos of source values.", source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2003-11-01', eligend = '2004-01-31',
                    gdr_cd = 'M', patid = patient$patid, pat_planid = patient$patid, product = 'OTH', yrdob = 1969)
  expect_payer_plan_period(person_id = patient$person_id, payer_source_value = 'COM Other')


  patient <- createPatient()
  declareTest("Checks the PAYER_PLAN_SOURCE_VALUE mapping for all combos of source values.", source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2000-05-01', eligend = '2006-06-30',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'POS', yrdob = 1969)
  expect_payer_plan_period(person_id = patient$person_id, payer_source_value = 'COM Point of Service')


  patient <- createPatient()
  declareTest("Patient has multiple payer plan periods that should be collapsed based on PAYER_SOURCE_VALUE and PLAN_SOURCE_VALUE", 
              source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2000-05-01', eligend = '2000-10-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2000-12-01', eligend = '2004-08-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  expect_count_payer_plan_period(rowCount = 1, person_id = patient$person_id)
}
