createCostTests <- function()
{
  patient <- createPatient()
  claim <- createClaim()
  declareTest("Patient has drug cost")
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  add_rx_claims(patid = patient$patid, pat_planid = patient$patid, clmid = claim$clmid, ndc = '55111067101', fill_dt = '2013-10-01', 
                charge = 100, copay = 50, deduct = 30, dispfee = 5, std_cost = 40)
  expect_cost(cost_domain_id = "Drug", cost_type_concept_id = 0, currency_concept_id = 44818668, 
              total_charge = 100, paid_patient_copay = 50, paid_patient_deductible = 30, paid_dispensing_fee = 5, amount_allowed = 40)
  
  
  
  patient <- createPatient()
  claim <- createClaim()
  declareTest("Patient has procedure cost")
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  add_medical_claims(clmid = claim$clmid, clmseq = '001', proc_cd = '92928', lst_dt = '2013-07-01',
                     pat_planid = patient$patid, patid = patient$patid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678', 
                     charge = 200, coins = 100, deduct = 75, copay = 10, std_cost = 90)
  
  add_med_procedure(patid = patient$patid, pat_planid = patient$patid, proc = '70481', clmid = claim$clmid, proc_position = 1)
  add_med_procedure(patid = patient$patid, pat_planid = patient$patid, proc = '70481', clmid = claim$clmid, proc_position = 1)
  add_med_procedure(patid = patient$patid, pat_planid = patient$patid, proc = '70481', clmid = claim$clmid, proc_position = 1)
  
  expect_cost(cost_domain_id = "Procedure", cost_type_concept_id = 0, currency_concept_id = 44818668, 
              total_charge = 200, paid_by_patient = 175, paid_patient_copay = 10, paid_patient_coinsurance = 100, 
              paid_patient_deductible = 75, amount_allowed = 90)
  
}