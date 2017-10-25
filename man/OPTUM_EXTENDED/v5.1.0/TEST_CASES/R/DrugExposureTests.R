createDrugExposureTests <- function()
{
  patient <- createPatient()
  claim <- createClaim()
  declareTest("Patient has 2 RX records, the first within the enrollment period, the second outside of enrollment.", 
                source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  add_rx_claims(patid = patient$patid, pat_planid = patient$patid, clmid = claim$clmid, ndc = '55111067101', fill_dt = '10/01/2013')
  add_rx_claims(patid = patient$patid, pat_planid = patient$patid, clmid = claim$clmid, ndc = '58487000102', fill_dt = '12/01/2013')
  expect_drug_exposure(person_id = patient$person_id, drug_source_value = '55111067101')
  expect_no_drug_exposure(person_id = patient$person_id, drug_source_value = '58487000102')


  patient <- createPatient()
  claim <- createClaim()
  declareTest("Patient has multiple RX records, all within enrollment period, but have the same patid, pat_planid, ndc.", 
              source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  add_rx_claims(patid = patient$patid, pat_planid = patient$patid, clmid = claim$clmid, ndc = '55111067101', fill_dt = '10/01/2013')
  add_rx_claims(patid = patient$patid, pat_planid = patient$patid, clmid = claim$clmid, ndc = '55111067101', fill_dt = '10/01/2013')
  add_rx_claims(patid = patient$patid, pat_planid = patient$patid, clmid = claim$clmid, ndc = '55111067101', fill_dt = '10/01/2013')
  expect_count_drug_exposure(rowCount = 1, person_id = patient$person_id)


  patient <- createPatient()
  claim <- createClaim()
  declareTest("Patient has multiple RX records, all within enrollment period, but have the same patid, pat_planid, ndc, but different claims which should be collapsed.",
              source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  add_rx_claims(patid = patient$patid, pat_planid = patient$patid, clmid = claim$clmid, ndc = '55111067101', fill_dt = '10/01/2013')
  claim <- createClaim()
  add_rx_claims(patid = patient$patid, pat_planid = patient$patid, clmid = claim$clmid, ndc = '55111067101', fill_dt = '10/01/2013')
  claim <- createClaim()
  add_rx_claims(patid = patient$patid, pat_planid = patient$patid, clmid = claim$clmid, ndc = '55111067101', fill_dt = '10/01/2013')
  expect_count_drug_exposure(rowCount = 1, person_id = patient$person_id)


  patient <- createPatient()
  claim <- createClaim()
  declareTest("Patient has series of drug exposures with the same claim ID, but different fill dates.", 
              source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  add_rx_claims(patid = patient$patid, pat_planid = patient$patid, clmid = , ndc = '55111067101', fill_dt = '10/01/2013')
  claim <- createClaim()
  add_rx_claims(patid = patient$patid, pat_planid = patient$patid, clmid = claim$clmid, ndc = '55111067101', fill_dt = '10/02/2013')
  claim <- createClaim()
  add_rx_claims(patid = patient$patid, pat_planid = patient$patid, clmid = claim$clmid, ndc = '55111067101', fill_dt = '10/03/2013')
  expect_count_drug_exposure(rowCount = 2, person_id = patient$person_id)


  patient <- createPatient()
  claim <- createClaim()
  declareTest("Patient procedure codes from Medical translate to Drug Exposure, and no Procedure Occurrence", 
              source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  add_medical_claims(clmid = claim$clmid, clmseq = '001', lst_dt = '2013-07-01',
                     pat_planid = patient$patid, patid = patient$patid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  add_med_procedure(patid = patient$patid, pat_planid = patient$patid, proc = "90651", clmid = claim$clmid, proc_position = 1)
  expect_drug_exposure(person_id = patient$person_id, drug_source_value = '90651')
  expect_no_procedure_occurrence(person_id = patient$person_id, procedure_source_value = '90651')


  patient <- createPatient()
  claim <- createClaim()
  declareTest("NDC codes from Medical map to drug exposure", source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  add_medical_claims(clmid = claim$clmid, clmseq = '001', ndc = '55111067101', lst_dt = '2013-07-01',
                     pat_planid = patient$patid, patid = patient$patid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  expect_drug_exposure(person_id = patient$person_id, drug_concept_id = 1322189, drug_source_value = '55111067101')
  
  
  patient <- createPatient()
  claim <- createClaim()
  declareTest("Proc codes from lab results map to drug exposure", source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  add_lab_results(labclmid = claim$clmid, pat_planid = patient$patid, patid = patient$patid, fst_dt = '2013-07-01', proc_cd = '90651')
  expect_drug_exposure(person_id = patient$person_id, drug_source_value = '90651')
}
