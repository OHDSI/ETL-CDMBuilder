createDrugCostTests <- function()
{
  patient <- createPatient();
  claim <- createClaim();
  declareTest("Patient has two overlapping payer plan periods and receives RX row that associates one exposure to each payer plan period.", source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  add_member_detail(aso = 'Y', bus = 'COM', cdhp = 1, eligeff = '2013-06-01', eligend = '2014-10-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  add_rx_claims(patid = patient$patid, pat_planid = patient$patid, clmid = claim$clmid, ndc = '55111067101', fill_dt = '2013-10-01', copay = patient$patid, 
                deduct = patient$patid, std_cost = patient$patid, dispfee = patient$patid, avgwhlsl = patient$patid)
  expect_drug_cost(paid_copay = patient$person_id, paid_toward_deductible = patient$person_id, total_paid = patient$person_id, 
                   dispensing_fee = patient$person_id, average_wholesale_price = patient$person_id)
}
