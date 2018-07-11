createConditionOccurrenceTests <- function()
{
  testDiag <- '7061'
  testConditionConceptId <- 141095
  
  addDiagPositionTest <- function(diagPosition)
  {
    diagTypeConceptIds <- unlist(list(c(38000230:38000243), rep(38000244, times = 11)))
    patient <- createPatient()
    claim <- createClaim()
    declareTest(paste0("Patient has 1 Medical Record in diag", diagPosition), source_pid = patient$patid, cdm_pid = patient$person_id)
    add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                      gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
    add_medical_claims(clmid = claim$clmid, clmseq = '001', 
                       lst_dt = '2013-07-01', pat_planid = patient$patid, patid = patient$patid, 
                       fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
    add_med_diagnosis(patid = patient$patid, pat_planid = patient$patid, icd_flag = "9", diag = testDiag, clmid = claim$clmid, 
                      diag_position = diagPosition)
    expect_condition_occurrence(person_id = patient$person_id, condition_concept_id = testConditionConceptId, 
                                condition_type_concept_id = diagTypeConceptIds[diagPosition])
  }
  
  for (i in (1:25))
  {
    addDiagPositionTest(diagPosition = i)
  }
  
  patient <- createPatient()
  claim <- createClaim()
  declareTest("Patient has 1 Medical Record with the same diag code listed in diag positions 1-25", source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  add_medical_claims(clmid = claim$clmid, clmseq = '001', 
                     lst_dt = '2013-07-01', pat_planid = patient$patid, patid = patient$patid, 
                     fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  for (i in (1:25))
  {
    add_med_diagnosis(patid = patient$patid, pat_planid = patient$patid, icd_flag = "9", 
                      diag = testDiag, diag_position = i, clmid = claim$clmid)  
  }
  
  expect_condition_occurrence(person_id = patient$person_id, condition_concept_id = testConditionConceptId )
  expect_count_condition_occurrence(person_id = patient$person_id, rowCount = 1)

  
  patient <- createPatient()
  claim <- createClaim()
  declareTest("Patient has medical records which have some valid and invalid formatted DIAG codes.", source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  add_medical_claims(clmid = claim$clmid, clmseq = '001', lst_dt = '2013-07-01',
                     pat_planid = patient$person_id, patid = patient$person_id, fst_dt = '2013-07-01', 
                     prov = '111111', provcat = '5678')
  add_med_diagnosis(patid = patient$patid, pat_planid = patient$patid, icd_flag = "9", diag = testDiag, diag_position = 1, clmid = claim$clmid)
  add_med_diagnosis(patid = patient$patid, pat_planid = patient$patid, icd_flag = "9", diag = "99999", diag_position = 2, clmid = claim$clmid)
  
  expect_condition_occurrence(person_id = patient$person_id, condition_concept_id = testConditionConceptId)
  expect_condition_occurrence(person_id = patient$person_id, condition_source_value = '99999', condition_concept_id = 0)

  
  patient <- createPatient()
  claim <- createClaim()
  declareTest("Patient has a series of 3 inpatient visits with same dates and diagnoses in separate records.", source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  add_medical_claims(clmid = claim$clmid, clmseq = '001', lst_dt = '2013-07-01', rvnu_cd = '0100', pos = '20',
                     pat_planid = patient$patid, patid = patient$patid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  add_med_diagnosis(patid = patient$patid, pat_planid = patient$patid, icd_flag = "9", diag = testDiag, 
                    clmid = claim$clmid, diag_position = 1)
  add_medical_claims(clmid = claim$clmid, clmseq = '002', lst_dt = '2013-07-01', rvnu_cd = '0100', pos = '20',
                     pat_planid = patient$patid, patid = patient$patid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  add_med_diagnosis(patid = patient$patid, pat_planid = patient$patid, icd_flag = "9", diag = testDiag, 
                    clmid = claim$clmid, diag_position = 1)
  add_medical_claims(clmid = claim$clmid, clmseq = '003', lst_dt = '2013-07-01', rvnu_cd = '0100', pos = '20',
                     pat_planid = patient$patid, patid = patient$patid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  add_med_diagnosis(patid = patient$patid, pat_planid = patient$patid, icd_flag = "9", diag = testDiag, 
                    clmid = claim$clmid, diag_position = 1)
  expect_condition_occurrence(person_id = patient$person_id, condition_concept_id = testConditionConceptId )
  expect_count_condition_occurrence(person_id = patient$person_id, rowCount = 1)


  patient <- createPatient()
  claim <- createClaim()
  declareTest("Creates two Condition Occurrences from a single Medical row that specifies an ICD9 code that has multiple SNOMED mappings.", source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  add_medical_claims(clmid = claim$clmid, clmseq = '001', lst_dt = '2013-07-01',
                     pat_planid = patient$patid, patid = patient$patid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  add_med_diagnosis(patid = patient$patid, pat_planid = patient$patid, icd_flag = "9", diag = '24910', 
                    clmid = claim$clmid, diag_position = 1)
  expect_condition_occurrence(person_id = patient$person_id, condition_source_value = '24910', condition_concept_id = 443727)
  expect_condition_occurrence(person_id = patient$person_id, condition_source_value = '24910', condition_concept_id = 195771)
  expect_count_condition_occurrence(person_id = patient$person_id, rowCount = 2)
  
  
  patient <- createPatient()
  claim <- createClaim()
  declareTest("Tests ICD10 CM vs International", source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  add_medical_claims(clmid = claim$clmid, clmseq = '001', lst_dt = '2013-07-01',
                     pat_planid = patient$patid, patid = patient$patid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  add_med_diagnosis(patid = patient$patid, pat_planid = patient$patid, icd_flag = "10", diag = 'Z731', 
                    clmid = claim$clmid, diag_position = 1)
  expect_condition_occurrence(person_id = patient$person_id, condition_source_value = 'Z731', condition_concept_id = 43020481)
  expect_no_condition_occurrence(person_id = patient$person_id, condition_source_value = 'Z731', condition_concept_id = 4284848)
  
  poaMappings <- data.frame(
    sourceValue = c('Y','N','U','W'),
    concept = c(46236988, 0, 0, 0)
  )
  
  for (i in 1:nrow(poaMappings)) {
    patient <- createPatient()
    claim <- createClaim()
    declareTest(sprintf("Tests POA = %s", poaMappings[i,]$sourceValue), source_pid = patient$patid, cdm_pid = patient$person_id)
    add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                      gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
    add_medical_claims(clmid = claim$clmid, clmseq = '001', lst_dt = '2013-07-01', 
                       pat_planid = patient$patid, patid = patient$patid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
    add_med_diagnosis(patid = patient$patid, pat_planid = patient$patid, icd_flag = "10", diag = 'Z731', poa = poaMappings[i,]$sourceValue,
                      clmid = claim$clmid, diag_position = 1)
    expect_condition_occurrence(person_id = patient$person_id, 
                                condition_status_source_value = poaMappings[i,]$sourceValue, 
                                condition_status_concept_id = poaMappings[i,]$concept)
  }
}
