createDeviceExposureTests <- function()
{
  patient <- createPatient()
  claim <- createClaim()
  declareTest("Patient has diag1-25 source codes mapping to domain Device and visit_place_of_service of IP does not get mapped to Condition", source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  add_medical_claims(clmid = claim$clmid, clmseq = '001', lst_dt = '2013-07-01', rvnu_cd = '0100', pos = '20',
                     pat_planid = patient$patid, patid = patient$patid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  add_med_diagnosis(patid = patient$patid, pat_planid = patient$patid, icd_flag = "10", diag = "Y731", clmid = claim$clmid, diag_position = 1)
  expect_visit_occurrence(person_id = patient$person_id, visit_concept_id = 9201)
  expect_device_exposure(person_id = patient$person_id, device_source_value = 'Y731')
  expect_no_condition_occurrence(person_id = patient$person_id, condition_source_value = 'Y731')
  

  patient <- createPatient()
  claim <- createClaim()
  declareTest("Patient has diag1-5 source codes mapping to domain Observation and visit_place_of_service of OP does not get mapped to Condition", source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  add_medical_claims(clmid = claim$clmid, clmseq = '001', lst_dt = '2013-07-01',
                     pat_planid = patient$patid, patid = patient$patid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  add_med_diagnosis(patid = patient$patid, pat_planid = patient$patid, icd_flag = "10", diag = "Y731", clmid = claim$clmid, diag_position = 1)
  expect_visit_occurrence(person_id = patient$person_id, visit_concept_id = 9202)
  expect_device_exposure(person_id = patient$person_id, device_source_value = 'Y731')
  expect_no_condition_occurrence(person_id = patient$person_id, condition_source_value = 'Y731')
  
  
  patient <- createPatient()
  claim <- createClaim()
  declareTest("Patient has proc1-25 source codes mapping to domain Device and visit_place_of_service of IP does not get mapped to Procedure", source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  add_medical_claims(clmid = claim$clmid, clmseq = '001', lst_dt = '2013-07-01', rvnu_cd = '0100', pos = '20',
                     pat_planid = patient$patid, patid = patient$patid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  add_med_procedure(patid = patient$patid, pat_planid = patient$patid, proc = "K0901", proc_position = 1, clmid = claim$clmid)
  expect_visit_occurrence(person_id = patient$person_id, visit_concept_id = 9201)
  expect_device_exposure(person_id = patient$person_id, device_source_value = 'K0901')
  expect_no_procedure_occurrence(person_id = patient$person_id, procedure_source_value = 'K0901')
  
  
  patient <- createPatient()
  claim <- createClaim()
  declareTest("Patient has proc1-3 source codes mapping to domain Device and visit_place_of_service of OP does not get mapped to Procedure", source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  add_medical_claims(clmid = claim$clmid, clmseq = '001', lst_dt = '2013-07-01',
                     pat_planid = patient$patid, patid = patient$patid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  add_med_procedure(patid = patient$patid, pat_planid = patient$patid, proc = "K0901", proc_position = 1, clmid = claim$clmid)
  expect_visit_occurrence(person_id = patient$person_id, visit_concept_id = 9202)
  expect_device_exposure(person_id = patient$person_id, device_source_value = 'K0901')
  expect_no_procedure_occurrence(person_id = patient$person_id, procedure_source_value = 'K0901')
}
