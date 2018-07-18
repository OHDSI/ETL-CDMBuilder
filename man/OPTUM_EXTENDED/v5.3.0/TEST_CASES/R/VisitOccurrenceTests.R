createVisitOccurrenceTests <- function() {
  
  patient <- createPatient()
  claim <- createClaim()
  declareTest("Creates multiple IP admission claims with different pat_planids, should get a single IP visit occurrence.", 
              source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid*1000, product = 'HMO', yrdob = 1969)
  add_medical_claims(clmid = claim$clmid, clmseq = '001', lst_dt = '2013-07-01', rvnu_cd = '0100', pos = '20',
                     pat_planid = patient$patid, patid = patient$patid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  add_med_diagnosis(patid = patient$patid, pat_planid = patient$patid, icd_flag = "9", diag = "7061", diag_position = 1, clmid = claim$clmid)
  
  add_medical_claims(clmid = claim$clmid, clmseq = '001', lst_dt = '2013-07-01', rvnu_cd = '0100', pos = '20',
                     pat_planid = patient$patid*1000, patid = patient$patid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  add_med_diagnosis(patid = patient$patid, pat_planid = patient$patid, icd_flag = "9", diag = "7061", diag_position = 1, clmid = claim$clmid)
  expect_count_visit_occurrence(rowCount = 1, person_id = patient$person_id, visit_concept_id = 9201)
  expect_count_visit_detail(rowCount = 1, person_id = patient$person_id, visit_detail_concept_id = 9201)
  
  
  patient <- createPatient()
  claim <- createClaim()
  declareTest("Creates an Inpatient Visit Occurrence for a patient with a single medical diagnosis.", 
              source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  add_medical_claims(clmid = claim$clmid, clmseq = '001', lst_dt = '2013-07-01', rvnu_cd = '0100', pos = '20',
                     pat_planid = patient$patid, patid = patient$patid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  add_med_diagnosis(patid = patient$patid, pat_planid = patient$patid, icd_flag = "9", diag = "7061", diag_position = 1, clmid = claim$clmid)
  expect_visit_occurrence(person_id = patient$person_id, visit_concept_id = 9201)
  expect_visit_detail(person_id = patient$person_id, visit_detail_concept_id = 9201)

  
  patient <- createPatient()
  claim <- createClaim()
  declareTest("Creates an Outpatient Visit Occurrence for a patient with a single medical diagnosis.", 
              source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  add_medical_claims(clmid = claim$clmid, clmseq = '001', lst_dt = '2013-07-01',
                     pat_planid = patient$patid, patid = patient$patid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  add_med_diagnosis(patid = patient$patid, pat_planid = patient$patid, icd_flag = "9", diag = "7061", diag_position = 1, clmid = claim$clmid)
  expect_visit_occurrence(person_id = patient$person_id, visit_concept_id = 9202)
  expect_visit_detail(person_id = patient$person_id, visit_detail_concept_id = 9202)


  patient <- createPatient()
  claim <- createClaim()
  declareTest("Creates an Emergency Room Visit Occurrence for a patient with a single medical diagnosis.", 
              source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  add_medical_claims(clmid = claim$clmid, clmseq = '001', lst_dt = '2013-07-01', rvnu_cd = '0981', pos = '23',
                     pat_planid = patient$patid, patid = patient$patid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  add_med_diagnosis(patid = patient$patid, pat_planid = patient$patid, icd_flag = "9", diag = "7061", diag_position = 1, clmid = claim$clmid)
  expect_visit_occurrence(person_id = patient$person_id, visit_concept_id = 9203)
  expect_visit_detail(person_id = patient$person_id, visit_detail_concept_id = 9203)
  

  patient <- createPatient()
  claim <- createClaim()
  declareTest("Creates an Long Term Care Visit Occurrence for a patient with a single medical diagnosis.", 
              source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  add_medical_claims(clmid = claim$clmid, clmseq = '001', lst_dt = '2013-07-01', rvnu_cd = '0100', pos = '13',
                     pat_planid = patient$patid, patid = patient$patid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  add_med_diagnosis(patid = patient$patid, pat_planid = patient$patid, icd_flag = "9", diag = "7061", diag_position = 1, clmid = claim$clmid)
  expect_visit_occurrence(person_id = patient$person_id, visit_concept_id = 42898160)
  expect_visit_detail(person_id = patient$person_id, visit_detail_concept_id = 42898160)


  patient <- createPatient()
  claim <- createClaim()
  declareTest("Patient has a series of diagnoses that fall outside of their Observation Period, and therefore dates must be trimmed to fall within the OP range.", 
              source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  add_medical_claims(clmid = claim$clmid, clmseq = '001', lst_dt = '2009-07-01',
                     pat_planid = patient$patid, patid = patient$patid, fst_dt = '2009-07-01', prov = '111111', provcat = '5678')
  add_med_diagnosis(patid = patient$patid, pat_planid = patient$patid, icd_flag = "9", diag = "7061", diag_position = 1, clmid = claim$clmid)
  expect_no_visit_occurrence(person_id = patient$person_id)
  expect_no_visit_detail(person_id = patient$person_id)
 
  
  discStats <- read.csv(file = "inst/csv/discharge_status.csv", header = T, as.is = T)
  for (i in 1:nrow(discStats)) {
    patient <- createPatient()
    claim <- createClaim()
    declareTest(sprintf("Test discharge status mapping %s", discStats[i,]$SOURCE_CODE),
                source_pid = patient$patid, cdm_pid = patient$person_id)
    add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                      gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
    add_medical_claims(clmid = claim$clmid, clmseq = '001', lst_dt = '2013-07-01', dstatus = discStats[i,]$SOURCE_CODE,
                         pat_planid = patient$patid, patid = patient$patid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
    add_med_diagnosis(patid = patient$patid, pat_planid = patient$patid, icd_flag = "9", diag = "7061", diag_position = 1, clmid = claim$clmid)
    expect_visit_occurrence(person_id = patient$person_id, 
                            discharge_to_concept_id = discStats[i,]$TARGET_CONCEPT_ID,
                            discharge_to_source_value = discStats[i,]$SOURCE_CODE)
    expect_visit_detail(person_id = patient$person_id, 
                            discharge_to_concept_id = discStats[i,]$TARGET_CONCEPT_ID,
                            discharge_to_source_value = discStats[i,]$SOURCE_CODE)
  }

  patient <- createPatient()
  claim <- createClaim()
  declareTest(sprintf("Patient has a series of visits that are linked by foreign key (%d)", i), 
              source_pid = patient$patid,
              cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  
  add_medical_claims(clmid = claim$clmid, clmseq = '001', lst_dt = '2013-07-01',
                     pat_planid = patient$patid, patid = patient$patid, fst_dt = '2013-07-01', 
                     prov = '111111', provcat = '5678')
  add_med_diagnosis(patid = patient$patid, pat_planid = patient$patid, icd_flag = "9",
                    diag = "7061", diag_position = 1, clmid = claim$clmid)
    
  firstOccurrenceId <- lookup_visit_occurrence(fetchField = "visit_occurrence_id", 
                                               person_id = patient$person_id, visit_start_date = '2013-07-01')
  
  claim <- createClaim()
  add_medical_claims(clmid = claim$clmid, clmseq = '001', lst_dt = '2013-10-01',
                     pat_planid = patient$patid, patid = patient$patid, 
                     fst_dt = '2013-10-01', prov = '111111', provcat = '5678')
  add_med_diagnosis(patid = patient$patid, pat_planid = patient$patid, icd_flag = "9", 
                    diag = "7061", diag_position = 1, clmid = claim$clmid)
  
  expect_visit_occurrence(person_id = patient$person_id,
                          preceding_visit_occurrence_id = firstOccurrenceId)
  expect_visit_detail(person_id = patient$person_id,
                      preceding_visit_detail_id = firstOccurrenceId)
}
