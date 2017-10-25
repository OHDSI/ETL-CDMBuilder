createProviderTests <- function()
{
  patient <- createPatient()
  claim <- createClaim()
  declareTest("Creates a provider entry from a record found in RX and MEDICAL table for a single patient.", 
              source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  add_medical_claims(clmid = claim$clmid, clmseq = '001', lst_dt = '2013-07-01',
                     pat_planid = patient$patid, patid = patient$patid, fst_dt = '2013-07-01', prov = '123456', provcat = '5678')
  add_med_diagnosis(patid = patient$patid, pat_planid = patient$patid, icd_flag = "9", diag = "7061", diag_position = 1)
  
  add_rx_claims(clmid = claim$clmid, patid = patient$patid, pat_planid = patient$patid, ndc = '1111111111', fill_dt = '2013-10-01', 
                npi = paste0('NPI', patient$patid), dea = paste0('DEA', patient$patid))
  expect_provider(provider_source_value = '123456')
  expect_provider(provider_source_value = paste('NPI', patient$person_id, 'DEA', patient$person_id, sep = "-", collapse = ""),
                  npi = paste0('NPI', patient$person_id), 
                  dea = paste0('DEA', patient$person_id))
}
