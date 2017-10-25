# getRepeatedParameters <- function (paramPrefix, numParams, value)
# {
#   params <- lapply(c(1:numParams), function(index) {
#     assign(x = paste0(paramPrefix, index), value = value)
#     paste0(paramPrefix, index)
#   })
#   return (params)
# }

createConditionOccurrenceTests <- function()
{
  testDiag <- '7061'
  testConditionConceptId <- 141095
  
  patient <- createPatient()
  claim <- createClaim()
  declareTest("Patient has 1 Medical Record in diag1", source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  add_medical_claims(clmid = claim$clmid, clmseq = '001', 
                     diag1 = testDiag,
                     lst_dt = '2013-07-01', icd_flag = '9', pat_planid = patient$patid, patid = patient$patid, 
                     fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  expect_condition_occurrence(person_id = patient$person_id, condition_concept_id = testConditionConceptId, 
                              condition_type_concept_id = 38000230, condition_status_concept_id = 46236988)
  
  
  patient <- createPatient()
  claim <- createClaim()
  declareTest("Patient has 1 Medical Record in diag2", source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  add_medical_claims(clmid = claim$clmid, clmseq = '001', 
                     diag2 = testDiag,
                     lst_dt = '2013-07-01', icd_flag = '9', pat_planid = patient$patid, patid = patient$patid, 
                     fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  expect_condition_occurrence(person_id = patient$person_id, condition_concept_id = testConditionConceptId, 
                              condition_type_concept_id = 38000231, condition_status_concept_id = 46236988)
  
  
  
  patient <- createPatient()
  claim <- createClaim()
  declareTest("Patient has 1 Medical Record in diag3", source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  add_medical_claims(clmid = claim$clmid, clmseq = '001', 
                     diag3 = testDiag,
                     lst_dt = '2013-07-01', icd_flag = '9', pat_planid = patient$patid, patid = patient$patid, 
                     fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  expect_condition_occurrence(person_id = patient$person_id, condition_concept_id = testConditionConceptId, 
                              condition_type_concept_id = 38000232, condition_status_concept_id = 46236988)
  
  
  patient <- createPatient()
  claim <- createClaim()
  declareTest("Patient has 1 Medical Record in diag4", source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  add_medical_claims(clmid = claim$clmid, clmseq = '001', 
                     diag4 = testDiag,
                     lst_dt = '2013-07-01', icd_flag = '9', pat_planid = patient$patid, patid = patient$patid, 
                     fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  expect_condition_occurrence(person_id = patient$person_id, condition_concept_id = testConditionConceptId, 
                              condition_type_concept_id = 38000233, condition_status_concept_id = 46236988)
  
  
  patient <- createPatient()
  claim <- createClaim()
  declareTest("Patient has 1 Medical Record in diag5", source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  add_medical_claims(clmid = claim$clmid, clmseq = '001', 
                     diag5 = testDiag,
                     lst_dt = '2013-07-01', icd_flag = '9', pat_planid = patient$patid, patid = patient$patid, 
                     fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  expect_condition_occurrence(person_id = patient$person_id, condition_concept_id = testConditionConceptId, 
                              condition_type_concept_id = 38000234, condition_status_concept_id = 46236988)
  
  
  patient <- createPatient()
  claim <- createClaim()
  declareTest("Patient has 1 Medical Record in diag6", source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  add_medical_claims(clmid = claim$clmid, clmseq = '001', 
                     diag6 = testDiag,
                     lst_dt = '2013-07-01', icd_flag = '9', pat_planid = patient$patid, patid = patient$patid, 
                     fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  expect_condition_occurrence(person_id = patient$person_id, condition_concept_id = testConditionConceptId, 
                              condition_type_concept_id = 38000235, condition_status_concept_id = 0)
  
  patient <- createPatient()
  claim <- createClaim()
  declareTest("Patient has 1 Medical Record in diag7", source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  add_medical_claims(clmid = claim$clmid, clmseq = '001', 
                     diag7 = testDiag,
                     lst_dt = '2013-07-01', icd_flag = '9', pat_planid = patient$patid, patid = patient$patid, 
                     fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  expect_condition_occurrence(person_id = patient$person_id, condition_concept_id = testConditionConceptId, 
                              condition_type_concept_id = 38000236, condition_status_concept_id = 46236988)
  
  
  patient <- createPatient()
  claim <- createClaim()
  declareTest("Patient has 1 Medical Record in diag8", source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  add_medical_claims(clmid = claim$clmid, clmseq = '001', 
                     diag8 = testDiag,
                     lst_dt = '2013-07-01', icd_flag = '9', pat_planid = patient$patid, patid = patient$patid, 
                     fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  expect_condition_occurrence(person_id = patient$person_id, condition_concept_id = testConditionConceptId, 
                              condition_type_concept_id = 38000237, condition_status_concept_id = 0)
  
  
  patient <- createPatient()
  claim <- createClaim()
  declareTest("Patient has 1 Medical Record in diag9", source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  add_medical_claims(clmid = claim$clmid, clmseq = '001', 
                     diag9 = testDiag,
                     lst_dt = '2013-07-01', icd_flag = '9', pat_planid = patient$patid, patid = patient$patid, 
                     fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  expect_condition_occurrence(person_id = patient$person_id, condition_concept_id = testConditionConceptId, 
                              condition_type_concept_id = 38000238, condition_status_concept_id = 46236988)
  
  
  patient <- createPatient()
  claim <- createClaim()
  declareTest("Patient has 1 Medical Record in diag10", source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  add_medical_claims(clmid = claim$clmid, clmseq = '001', 
                     diag10 = testDiag,
                     lst_dt = '2013-07-01', icd_flag = '9', pat_planid = patient$patid, patid = patient$patid, 
                     fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  expect_condition_occurrence(person_id = patient$person_id, condition_concept_id = testConditionConceptId, 
                              condition_type_concept_id = 38000239, condition_status_concept_id = 0)
  
  
  patient <- createPatient()
  claim <- createClaim()
  declareTest("Patient has 1 Medical Record in diag11", source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  add_medical_claims(clmid = claim$clmid, clmseq = '001', 
                     diag11 = testDiag,
                     lst_dt = '2013-07-01', icd_flag = '9', pat_planid = patient$patid, patid = patient$patid, 
                     fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  expect_condition_occurrence(person_id = patient$person_id, condition_concept_id = testConditionConceptId, 
                              condition_type_concept_id = 38000240, condition_status_concept_id = 0)
  
  
  patient <- createPatient()
  claim <- createClaim()
  declareTest("Patient has 1 Medical Record in diag12", source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  add_medical_claims(clmid = claim$clmid, clmseq = '001', 
                     diag12 = testDiag,
                     lst_dt = '2013-07-01', icd_flag = '9', pat_planid = patient$patid, patid = patient$patid, 
                     fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  expect_condition_occurrence(person_id = patient$person_id, condition_concept_id = testConditionConceptId, 
                              condition_type_concept_id = 38000241, condition_status_concept_id = 0)
  
  
  patient <- createPatient()
  claim <- createClaim()
  declareTest("Patient has 1 Medical Record in diag13", source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  add_medical_claims(clmid = claim$clmid, clmseq = '001', 
                     diag13 = testDiag,
                     lst_dt = '2013-07-01', icd_flag = '9', pat_planid = patient$patid, patid = patient$patid, 
                     fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  expect_condition_occurrence(person_id = patient$person_id, condition_concept_id = testConditionConceptId, 
                              condition_type_concept_id = 38000242, condition_status_concept_id = 0)
  
  
  patient <- createPatient()
  claim <- createClaim()
  declareTest("Patient has 1 Medical Record in diag14", source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  add_medical_claims(clmid = claim$clmid, clmseq = '001', 
                     diag14 = testDiag,
                     lst_dt = '2013-07-01', icd_flag = '9', pat_planid = patient$patid, patid = patient$patid, 
                     fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  expect_condition_occurrence(person_id = patient$person_id, condition_concept_id = testConditionConceptId, 
                              condition_type_concept_id = 38000243, condition_status_concept_id = 0)
  
  
  patient <- createPatient()
  claim <- createClaim()
  declareTest("Patient has 1 Medical Record in diag15", source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  add_medical_claims(clmid = claim$clmid, clmseq = '001', 
                     diag15 = testDiag,
                     lst_dt = '2013-07-01', icd_flag = '9', pat_planid = patient$patid, patid = patient$patid, 
                     fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  expect_condition_occurrence(person_id = patient$person_id, condition_concept_id = testConditionConceptId, 
                              condition_type_concept_id = 38000244, condition_status_concept_id = 0)
  
  patient <- createPatient()
  claim <- createClaim()
  declareTest("Patient has 1 Medical Record in diag16", source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  add_medical_claims(clmid = claim$clmid, clmseq = '001', 
                     diag16 = testDiag,
                     lst_dt = '2013-07-01', icd_flag = '9', pat_planid = patient$patid, patid = patient$patid, 
                     fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  expect_condition_occurrence(person_id = patient$person_id, condition_concept_id = testConditionConceptId, 
                              condition_type_concept_id = 38000244, condition_status_concept_id = 0)
  
  patient <- createPatient()
  claim <- createClaim()
  declareTest("Patient has 1 Medical Record in diag17", source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  add_medical_claims(clmid = claim$clmid, clmseq = '001', 
                     diag17 = testDiag,
                     lst_dt = '2013-07-01', icd_flag = '9', pat_planid = patient$patid, patid = patient$patid, 
                     fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  expect_condition_occurrence(person_id = patient$person_id, condition_concept_id = testConditionConceptId, 
                              condition_type_concept_id = 38000244, condition_status_concept_id = 0)
  
  
  patient <- createPatient()
  claim <- createClaim()
  declareTest("Patient has 1 Medical Record in diag18", source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  add_medical_claims(clmid = claim$clmid, clmseq = '001', 
                     diag18 = testDiag,
                     lst_dt = '2013-07-01', icd_flag = '9', pat_planid = patient$patid, patid = patient$patid, 
                     fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  expect_condition_occurrence(person_id = patient$person_id, condition_concept_id = testConditionConceptId, 
                              condition_type_concept_id = 38000244, condition_status_concept_id = 0)
  
  
  patient <- createPatient()
  claim <- createClaim()
  declareTest("Patient has 1 Medical Record in diag19", source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  add_medical_claims(clmid = claim$clmid, clmseq = '001', 
                     diag19 = testDiag,
                     lst_dt = '2013-07-01', icd_flag = '9', pat_planid = patient$patid, patid = patient$patid, 
                     fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  expect_condition_occurrence(person_id = patient$person_id, condition_concept_id = testConditionConceptId, 
                              condition_type_concept_id = 38000244, condition_status_concept_id = 0)
  
  
  patient <- createPatient()
  claim <- createClaim()
  declareTest("Patient has 1 Medical Record in diag20", source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  add_medical_claims(clmid = claim$clmid, clmseq = '001', 
                     diag20 = testDiag,
                     lst_dt = '2013-07-01', icd_flag = '9', pat_planid = patient$patid, patid = patient$patid, 
                     fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  expect_condition_occurrence(person_id = patient$person_id, condition_concept_id = testConditionConceptId, 
                              condition_type_concept_id = 38000244, condition_status_concept_id = 0)
  
  
  
  patient <- createPatient()
  claim <- createClaim()
  declareTest("Patient has 1 Medical Record in diag21", source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  add_medical_claims(clmid = claim$clmid, clmseq = '001', 
                     diag21 = testDiag,
                     lst_dt = '2013-07-01', icd_flag = '9', pat_planid = patient$patid, patid = patient$patid, 
                     fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  expect_condition_occurrence(person_id = patient$person_id, condition_concept_id = testConditionConceptId, 
                              condition_type_concept_id = 38000244, condition_status_concept_id = 0)
  
  
  patient <- createPatient()
  claim <- createClaim()
  declareTest("Patient has 1 Medical Record in diag22", source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  add_medical_claims(clmid = claim$clmid, clmseq = '001', 
                     diag22 = testDiag,
                     lst_dt = '2013-07-01', icd_flag = '9', pat_planid = patient$patid, patid = patient$patid, 
                     fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  expect_condition_occurrence(person_id = patient$person_id, condition_concept_id = testConditionConceptId, 
                              condition_type_concept_id = 38000244, condition_status_concept_id = 0)
  
  
  patient <- createPatient()
  claim <- createClaim()
  declareTest("Patient has 1 Medical Record in diag23", source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  add_medical_claims(clmid = claim$clmid, clmseq = '001', 
                     diag23 = testDiag,
                     lst_dt = '2013-07-01', icd_flag = '9', pat_planid = patient$patid, patid = patient$patid, 
                     fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  expect_condition_occurrence(person_id = patient$person_id, condition_concept_id = testConditionConceptId, 
                              condition_type_concept_id = 38000244, condition_status_concept_id = 0)
  
  patient <- createPatient()
  claim <- createClaim()
  declareTest("Patient has 1 Medical Record in diag24", source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  add_medical_claims(clmid = claim$clmid, clmseq = '001', 
                     diag24 = testDiag,
                     lst_dt = '2013-07-01', icd_flag = '9', pat_planid = patient$patid, patid = patient$patid, 
                     fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  expect_condition_occurrence(person_id = patient$person_id, condition_concept_id = testConditionConceptId, 
                              condition_type_concept_id = 38000244, condition_status_concept_id = 0)
  
  
  patient <- createPatient()
  claim <- createClaim()
  declareTest("Patient has 1 Medical Record in diag25", source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  add_medical_claims(clmid = claim$clmid, clmseq = '001', 
                     diag25 = testDiag,
                     lst_dt = '2013-07-01', icd_flag = '9', pat_planid = patient$patid, patid = patient$patid, 
                     fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  expect_condition_occurrence(person_id = patient$person_id, condition_concept_id = testConditionConceptId, 
                              condition_type_concept_id = 38000244, condition_status_concept_id = 0)

  
  patient <- createPatient()
  claim <- createClaim()
  declareTest("Patient has 1 Medical Record with the same diag code listed in diag1-diag25", source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  add_medical_claims(clmid = claim$clmid, clmseq = '001', 
                     diag1 = testDiag, 
                     diag2 = testDiag, 
                     diag3 = testDiag, 
                     diag4 = testDiag, 
                     diag5 = testDiag, 
                     diag6 = testDiag, 
                     diag7 = testDiag, 
                     diag8 = testDiag, 
                     diag9 = testDiag, 
                     diag10 = testDiag, 
                     diag11 = testDiag, 
                     diag12 = testDiag, 
                     diag13 = testDiag, 
                     diag14 = testDiag, 
                     diag15 = testDiag, 
                     diag16 = testDiag, 
                     diag17 = testDiag, 
                     diag18 = testDiag, 
                     diag19 = testDiag, 
                     diag20 = testDiag, 
                     diag21 = testDiag, 
                     diag22 = testDiag, 
                     diag23 = testDiag, 
                     diag24 = testDiag, 
                     diag25 = testDiag,
                     lst_dt = '2013-07-01', icd_flag = '9', pat_planid = patient$patid, patid = patient$patid, 
                     fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  expect_condition_occurrence(person_id = patient$person_id, condition_concept_id = testConditionConceptId )
  expect_count_condition_occurrence(person_id = patient$person_id, rowCount = 1)

  
  patient <- createPatient();
  clmid <- createClaim();
  declareTest("Patient has medical records which have some valid and invalid formatted DIAG codes.", source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  add_medical_claims(clmid = claim$clmid, clmseq = '001', diag1 = testDiag, diag2 = '99999', lst_dt = '2013-07-01',
                     icd_flag = '9', pat_planid = patient$person_id, patid = patient$person_id, fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  expect_condition_occurrence(person_id = patient$person_id, condition_concept_id = testConditionConceptId )
  expect_condition_occurrence(person_id = patient$person_id, condition_source_value = '99999', condition_concept_id = 0)

  
  patient <- createPatient();
  clmid <- createClaim();
  declareTest("Patient has a series of 3 inpatient visits with same dates and diagnoses in separate records.", source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  add_medical_claims(clmid = claim$clmid, clmseq = '001', diag1 = testDiag, lst_dt = '2013-07-01', rvnu_cd = '0100', pos = '20',
                     icd_flag = '9', pat_planid = patient$patid, patid = patient$patid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  add_medical_claims(clmid = claim$clmid, clmseq = '002', diag1 = testDiag, lst_dt = '2013-07-01', rvnu_cd = '0100', pos = '20',
                     icd_flag = '9', pat_planid = patient$patid, patid = patient$patid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  add_medical_claims(clmid = claim$clmid, clmseq = '003', diag1 = testDiag, lst_dt = '2013-07-01', rvnu_cd = '0100', pos = '20',
                     icd_flag = '9', pat_planid = patient$patid, patid = patient$patid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  expect_condition_occurrence(person_id = patient$person_id, condition_concept_id = testConditionConceptId )
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

  
  # for (i in (1:25))
  # {
  #   patient <- createPatient()
  #   claim <- createClaim()
  #   testPoa <- lapply(c(1:25), function(ordinal) {
  #     ifelse(ordinal == i, 'Y', 'N')
  #   })
  #   declareTest(paste0("Patient has 1 Medical Record in DIAG", i, " with POA in slot ", i), source_pid = patient$patid, cdm_pid = patient$person_id)
  #   add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
  #                     gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  #   add_medical_claims(clmid = claim$clmid, clmseq = '001', poa = paste(testPoa, collapse = "."),
  #                      assign(x = paste0("diag", i), value = testDiag),
  #                      lst_dt = '2013-07-01', icd_flag = '9', pat_planid = patient$patid, patid = patient$patid, 
  #                      fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  #   expect_condition_occurrence(person_id = patient$person_id, condition_concept_id = testConditionConceptId, condition_status_concept_id = )  
  # }
  
}
