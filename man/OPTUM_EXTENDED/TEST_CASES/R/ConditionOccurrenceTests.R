createConditionOccurrenceTests <- function()
{
  patient <- createPatient();
  claim <- createClaim();
  declareTest("Patient has 1 Medical Record with the same diag code listed in diag1-diag5", source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  add_medical_claims(clmid = claim$clmid, clmseq = '001', diag1 = '7061', diag2 = '7061', diag3 = '7061', diag4 = '7061', diag5 = '7061', 
                     lst_dt = '2013-07-01', icd_flag = '9', pat_planid = patient$patid, patid = patient$patid, 
                     fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  expect_condition_occurrence(person_id = patient$person_id, condition_concept_id = 141095)
  expect_count_condition_occurrence(person_id = patient$person_id, rowCount = 1)

  
  patient <- createPatient();
  clmid <- createClaim();
  declareTest("Patient has medical records which have some valid and invalid formatted DIAG codes.", source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  add_medical_claims(clmid = claim$clmid, clmseq = '001', diag1 = '7061', diag2 = '99999', lst_dt = '2013-07-01',
                     icd_flag = '9', pat_planid = patient$person_id, patid = patient$person_id, fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  expect_condition_occurrence(person_id = patient$person_id, condition_concept_id = 141095)
  expect_condition_occurrence(person_id = patient$person_id, condition_source_value = '99999', condition_concept_id = 0)

  
  patient <- createPatient();
  clmid <- createClaim();
  declareTest("Patient has a series of 3 inpatient visits with same dates and diagnoses in separate records.", source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  add_medical_claims(clmid = claim$clmid, clmseq = '001', diag1 = '7061', lst_dt = '2013-07-01', rvnu_cd = '0100', pos = '20',
                     icd_flag = '9', pat_planid = patient$patid, patid = patient$patid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  add_medical_claims(clmid = claim$clmid, clmseq = '002', diag1 = '7061', lst_dt = '2013-07-01', rvnu_cd = '0100', pos = '20',
                     icd_flag = '9', pat_planid = patient$patid, patid = patient$patid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  add_medical_claims(clmid = claim$clmid, clmseq = '003', diag1 = '7061', lst_dt = '2013-07-01', rvnu_cd = '0100', pos = '20',
                     icd_flag = '9', pat_planid = patient$patid, patid = patient$patid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  expect_condition_occurrence(person_id = patient$person_id, condition_concept_id = 141095)
  expect_count_condition_occurrence(person_id = patient$person_id, rowCount = 1)


  patient <- createPatient();
  clmid <- createClaim();
  declareTest("Creates two Condition Occurrences from a single Medical row that specifies an ICD9 code that has multiple SNOMED mappings.", source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  add_medical_claims(clmid = claim$clmid, clmseq = '001', diag1 = '24910', lst_dt = '2013-07-01',
                     icd_flag = '9', pat_planid = patient$patid, patid = patient$patid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  expect_condition_occurrence(person_id = patient$person_id, condition_source_value = '24910', condition_concept_id = 443727)
  expect_condition_occurrence(person_id = patient$person_id, condition_source_value = '24910', condition_concept_id = 195771)
  expect_count_condition_occurrence(person_id = patient$person_id, rowCount = 2)
  
  
  patient <- createPatient();
  clmid <- createClaim();
  declareTest("Tests ICD10 CM vs International", source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  add_medical_claims(clmid = claim$clmid, clmseq = '001', diag1 = 'S112', lst_dt = '2013-07-01',
                     icd_flag = '10', pat_planid = patient$patid, patid = patient$patid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  expect_condition_occurrence(person_id = patient$person_id, condition_source_value = 'S112', condition_concept_id = 4053597)
  expect_no_condition_occurrence(person_id = patient$person_id, condition_source_value = 'S112', condition_concept_id = 4051128)
}
