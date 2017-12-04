createProcedureCostTests <- function()
{
  patient <- createPatient();
  claim <- createClaim();
  declareTest("Patient has 1 procedure in PROC_CD with a valid pricing in medical_claims, and a second procedure identified in PROC1, in a separate Medical record.", 
              source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  add_medical_claims(clmid = claim$clmid, clmseq = '001', diag1 = 'V5789', lst_dt = '2013-07-01', proc_cd = '64475',
                     icd_flag = '9', pat_planid = patient$patid, patid = patient$patid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678',
                     charge = patient$patid, coins = patient$patid, cob = patient$patid, copay = patient$patid, deduct = patient$patid, std_cost = patient$patid)
  add_medical_claims(clmid = claim$clmid, clmseq = '001', lst_dt = '2013-07-01', proc1 = '0481',
                     icd_flag = '9', pat_planid = patient$patid, patid = patient$patid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678',
                     charge = patient$patid, cob = patient$patid, coins = patient$patid, copay = patient$patid, deduct = patient$patid, std_cost = patient$patid)
  expect_count_procedure_cost(rowCount = 2, paid_copay = patient$patid, paid_coinsurance = patient$patid, paid_toward_deductible = patient$patid, total_paid = patient$patid,
                              total_out_of_pocket = (2*patient$patid), paid_by_coordination_benefits = patient$patid)


  patient <- createPatient();
  claim <- createClaim();
  declareTest("Patient has 1 procedure in PROC_CD with cost, second procedure identified in PROC1 in a separate Medical record but no associated cost.", 
              source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  add_medical_claims(clmid = claim$clmid, clmseq = '001', diag1 = 'V5789', lst_dt = '2013-07-01', proc_cd = '64475',
                     icd_flag = '9', pat_planid = patient$patid, patid = patient$patid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678',
                     charge = patient$patid, coins = patient$patid, cob = patient$patid, copay = patient$patid, deduct = patient$patid, std_cost = patient$patid)
  add_medical_claims(clmid = claim$clmid, clmseq = '001', lst_dt = '2013-07-01', proc1 = '0481',
                     icd_flag = '9', pat_planid = patient$patid, patid = patient$patid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  expect_count_procedure_cost(rowCount = 1, paid_copay = patient$patid, paid_coinsurance = patient$patid, paid_toward_deductible = patient$patid, total_paid = patient$patid,
                              total_out_of_pocket = (2*patient$patid), paid_by_coordination_benefits = patient$patid)


  patient <- createPatient();
  claim <- createClaim();
  declareTest("Patient has procedures that fall within a payer plan period overlap.", 
              source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2013-06-01', eligend = '2014-10-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  add_medical_claims(clmid = claim$clmid, clmseq = '001', diag1 = 'V5789', lst_dt = '2013-07-01', proc_cd = '64475',
                     icd_flag = '9', pat_planid = patient$patid, patid = patient$patid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678',
                     charge = patient$patid, coins = patient$patid, cob = patient$patid, copay = patient$patid, deduct = patient$patid, std_cost = patient$patid)
  add_medical_claims(clmid = claim$clmid, clmseq = '001', lst_dt = '2014-07-01', proc1 = '0481',
                     icd_flag = '9', pat_planid = 802, patid = 802, fst_dt = '2014-07-01', prov = '111111', provcat = '5678',
                     charge = patient$patid, coins = patient$patid, cob = patient$patid, copay = patient$patid, deduct = patient$patid, std_cost = patient$patid)
  expect_payer_plan_period(person_id = patient$person_id, payer_plan_period_start_date = '2010-05-01', payer_plan_period_end_date = '2014-10-31')
  expect_count_procedure_cost(rowCount = 2, paid_copay = patient$patid, paid_coinsurance = patient$patid, paid_toward_deductible = patient$patid, total_paid = patient$patid,
                              total_out_of_pocket = (2*patient$patid), paid_by_coordination_benefits = patient$patid)
}
