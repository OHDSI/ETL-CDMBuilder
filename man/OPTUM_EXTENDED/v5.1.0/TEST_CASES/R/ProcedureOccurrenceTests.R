createProcedureOccurrenceTests <- function()
{
  patient <- createPatient()
  claim <- createClaim()
  declareTest("Patient has 2 medical records which have the same proc code listed in proc1-proc3, with repeated PROC_CD in both records.", 
              source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  add_medical_claims(clmid = claim$clmid, clmseq = '001', proc_cd = '92928', lst_dt = '2013-07-01',
                     pat_planid = patient$patid, patid = patient$patid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  
  add_med_procedure(patid = patient$patid, pat_planid = patient$patid, proc = "70481", clmid = claim$clmid, proc_position = 1)
  add_med_procedure(patid = patient$patid, pat_planid = patient$patid, proc = "70481", clmid = claim$clmid, proc_position = 2)
  add_med_procedure(patid = patient$patid, pat_planid = patient$patid, proc = "70481", clmid = claim$clmid, proc_position = 3)
  
  add_medical_claims(clmid = claim$clmid, clmseq = '002', proc_cd = '92928', lst_dt = '2013-07-01',
                     pat_planid = patient$patid, patid = patient$patid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  
  add_med_procedure(patid = patient$patid, pat_planid = patient$patid, proc = "70481", clmid = claim$clmid, proc_position = 1)
  add_med_procedure(patid = patient$patid, pat_planid = patient$patid, proc = "70481", clmid = claim$clmid, proc_position = 2)
  add_med_procedure(patid = patient$patid, pat_planid = patient$patid, proc = "70481", clmid = claim$clmid, proc_position = 3)
  
  expect_procedure_occurrence(person_id = patient$person_id, procedure_concept_id = 2211331)
  expect_procedure_occurrence(person_id = patient$person_id, procedure_concept_id = 43527998)
  expect_count_procedure_occurrence(person_id = patient$person_id, rowCount = 2)


  patient <- createPatient()
  claim <- createClaim()
  declareTest("Patient has medical records which have some valid and invalid formatted PROC codes.", 
              source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  add_medical_claims(clmid = claim$clmid, clmseq = '001', proc_cd = '92928', lst_dt = '2013-07-01',
                     pat_planid = patient$patid, patid = patient$patid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  add_med_procedure(patid = patient$patid, pat_planid = patient$patid, proc = "2", clmid = claim$clmid, proc_position = 1)
  add_med_procedure(patid = patient$patid, pat_planid = patient$patid, proc = "2", clmid = claim$clmid, proc_position = 2)
  add_med_procedure(patid = patient$patid, pat_planid = patient$patid, proc = "2", clmid = claim$clmid, proc_position = 3)
  expect_procedure_occurrence(person_id = patient$person_id, procedure_concept_id = 43527998)
  expect_procedure_occurrence(person_id = patient$person_id, procedure_source_value = '2', procedure_concept_id = 0)

  
  patient <- createPatient()
  claim <- createClaim()
  declareTest("Patient has a series of 3 inpatient visits with same dates and procedure codes in separate records.", 
              source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  add_medical_claims(clmid = claim$clmid, clmseq = '001', proc_cd = '92928', lst_dt = '2013-07-01', rvnu_cd = '0100', pos = '20',
                     pat_planid = patient$patid, patid = patient$patid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  add_med_procedure(patid = patient$patid, pat_planid = patient$patid, proc = "70481", clmid = claim$clmid, proc_position = 1)
  
  add_medical_claims(clmid = claim$clmid, clmseq = '001', proc_cd = '92928', lst_dt = '2013-07-01', rvnu_cd = '0100', pos = '20',
                     pat_planid = patient$patid, patid = patient$patid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  add_med_procedure(patid = patient$patid, pat_planid = patient$patid, proc = "70481", clmid = claim$clmid, proc_position = 1)
  
  add_medical_claims(clmid = claim$clmid, clmseq = '001', proc_cd = '92928', lst_dt = '2013-07-01', rvnu_cd = '0100', pos = '20',
                     pat_planid = patient$patid, patid = patient$patid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  add_med_procedure(patid = patient$patid, pat_planid = patient$patid, proc = "70481", clmid = claim$clmid, proc_position = 1)
  
  expect_procedure_occurrence(person_id = patient$person_id, procedure_concept_id = 2211331)
  expect_procedure_occurrence(person_id = patient$person_id, procedure_concept_id = 43527998)
  expect_count_procedure_occurrence(person_id = patient$person_id, rowCount = 2)

  
  patient <- createPatient()
  claim <- createClaim()
  declareTest("Patient has series of procedures within a visit that should use the VISIT_END for PROC1-3 or FST_DT for PROC_CD to determine the procedure date.", 
              source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  add_medical_claims(clmid = claim$clmid, clmseq = '001', proc_cd = '92928', lst_dt = '2013-07-01',
                     pat_planid = patient$patid, patid = patient$patid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  add_medical_claims(clmid = claim$clmid, clmseq = '001', lst_dt = '2013-07-01',
                     pat_planid = patient$patid, patid = patient$patid, fst_dt = '2013-07-31', prov = '111111', provcat = '5678')
  add_med_procedure(patid = patient$patid, pat_planid = patient$patid, proc = "70481", clmid = claim$clmid, proc_position = 1)
  expect_procedure_occurrence(person_id = patient$person_id, procedure_concept_id = 43527998, procedure_date = '2013-07-01')
  expect_procedure_occurrence(person_id = patient$person_id, procedure_concept_id = 2211331, procedure_date = '2013-07-31')

  
  patient <- createPatient()
  claim <- createClaim()
  declareTest("Patient has multiple Medical rows with placeholders for procedure codes.", 
              source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  add_medical_claims(clmid = claim$clmid, clmseq = '001', proc_cd = '92928',
                     lst_dt = '2013-07-01', pat_planid = patient$patid, patid = patient$patid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  add_med_procedure(patid = patient$patid, pat_planid = patient$patid, proc = "0000000", clmid = claim$clmid, proc_position = 1)
  add_med_procedure(patid = patient$patid, pat_planid = patient$patid, proc = "0000000", clmid = claim$clmid, proc_position = 2)
  add_med_procedure(patid = patient$patid, pat_planid = patient$patid, proc = "0000000", clmid = claim$clmid, proc_position = 3)
  
  add_medical_claims(clmid = claim$clmid, clmseq = '001', proc_cd = '70481',
                     lst_dt = '2013-07-01', pat_planid = patient$patid, patid = patient$patid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  add_med_procedure(patid = patient$patid, pat_planid = patient$patid, proc = "0000000", clmid = claim$clmid, proc_position = 1)
  add_med_procedure(patid = patient$patid, pat_planid = patient$patid, proc = "0000000", clmid = claim$clmid, proc_position = 2)
  add_med_procedure(patid = patient$patid, pat_planid = patient$patid, proc = "0000000", clmid = claim$clmid, proc_position = 3)
  
  expect_procedure_occurrence(person_id = patient$person_id, procedure_concept_id = 43527998)
  expect_procedure_occurrence(person_id = patient$person_id, procedure_concept_id = 2211331)

  
  patient <- createPatient()
  claim <- createClaim()
  declareTest("Patient has Medical records with a diag1-diag5 that maps to 2 SNOMED concepts, and single procedure.", 
              source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  add_medical_claims(clmid = claim$clmid, clmseq = '001', lst_dt = '2013-07-01', proc_cd = '70481',
                     pat_planid = patient$patid, patid = patient$patid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  add_med_diagnosis(patid = patient$patid, pat_planid = patient$patid, icd_flag = "9", diag = "24910", diag_position = 1, clmid = claim$clmid)
  
  expect_condition_occurrence(person_id = patient$person_id, condition_source_value = '24910', condition_concept_id = 443727)
  expect_condition_occurrence(person_id = patient$person_id, condition_source_value = '24910', condition_concept_id = 195771)
  expect_procedure_occurrence(person_id = patient$person_id, procedure_concept_id = 2211331)

  
  patient <- createPatient()
  claim <- createClaim()
  declareTest("Patient has 2 medical records with 2 different procedures, but only 1 record has diag_1 specified.", 
              source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  add_medical_claims(clmid = claim$clmid, clmseq = '001', lst_dt = '2013-07-01', proc_cd = '92928',
                     pat_planid = patient$patid, patid = patient$patid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  add_med_diagnosis(patid = patient$patid, pat_planid = patient$patid, icd_flag = "9", diag = "7061", diag_position = 1, clmid = claim$clmid)
  
  add_medical_claims(clmid = claim$clmid, clmseq = '001', lst_dt = '2013-07-01', proc_cd = '70481',
                     pat_planid = patient$patid, patid = patient$patid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  
  expect_condition_occurrence(person_id = patient$person_id, condition_concept_id = 141095)
  expect_procedure_occurrence(person_id = patient$person_id, procedure_concept_id = 43527998)
  expect_procedure_occurrence(person_id = patient$person_id, procedure_concept_id = 2211331)

  
  patient <- createPatient()
  claim <- createClaim()
  declareTest("Patient has diag1-25 source codes mapping to domain Procedure and visit_place_of_service of IP does not get mapped to Condition", 
              source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  add_medical_claims(clmid = claim$clmid, clmseq = '001', lst_dt = '2013-07-01', proc_cd = '92928', rvnu_cd = '0100', pos = '20',
                     pat_planid = patient$patid, patid = patient$patid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  add_med_diagnosis(patid = patient$patid, pat_planid = patient$patid, icd_flag = "9", diag = "V5789", diag_position = 1, clmid = claim$clmid)
  
  expect_procedure_occurrence(person_id = patient$person_id, procedure_concept_id = 4180248)
  expect_no_condition_occurrence(person_id = patient$person_id, condition_source_value = 'V5789')
  expect_visit_occurrence(person = patient$person_id, visit_concept_id = 9201)

  
  
  patient <- createPatient()
  claim <- createClaim()
  declareTest("Patient has diag1-25 source codes mapping to domain Procedure and visit_place_of_service of OP does not get mapped to Condition", 
              source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  add_medical_claims(clmid = claim$clmid, clmseq = '001', lst_dt = '2013-07-01', proc_cd = '92928',
                     pat_planid = patient$patid, patid = patient$patid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  add_med_diagnosis(patid = patient$patid, pat_planid = patient$patid, icd_flag = "9", diag = "V5789", diag_position = 1, clmid = claim$clmid)
  
  expect_procedure_occurrence(person_id = patient$person_id, procedure_concept_id = 4180248)
  expect_no_condition_occurrence(person_id = patient$person_id, condition_source_value = 'V5789')
  expect_visit_occurrence(person = patient$person_id, visit_concept_id = 9202)
  
  
  patient <- createPatient()
  claim <- createClaim()
  declareTest("Patient has procedure from a lab result proc_cd", 
              source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  add_lab_results(labclmid = claim$clmid, fst_dt = '2013-07-01', pat_planid = patient$patid, patid = patient$patid, 
                  loinc_cd = '', proc_cd = '70481')
  expect_procedure_occurrence(person_id = patient$person_id, procedure_concept_id = 2211331)
  
}
