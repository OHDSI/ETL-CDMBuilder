createObservationTests <- function()
{
  patient <- createPatient()
  claim <- createClaim()
  declareTest("Patient has series of observations in lab_results that translates to Observation records.", 
              source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  add_lab_results(pat_planid = patient$patid, patid = patient$patid, loinc_cd = '76345-8', labclmid = claim$clmid, fst_dt = '2013-07-01')
  add_lab_results(pat_planid = patient$patid, patid = patient$patid, loinc_cd = '75415-0', labclmid = claim$clmid, fst_dt = '2013-07-02')
  expect_observation(person_id = patient$person_id, observation_source_value = '76345-8')
  expect_observation(person_id = patient$person_id, observation_source_value = '75415-0')


  patient <- createPatient()
  claim <- createClaim()
  declareTest("Patient has diag1-5 source codes mapping to domain Observation and visit_place_of_service of IP does not get mapped to Condition", 
              source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  add_medical_claims(clmid = claim$clmid, clmseq = '001', lst_dt = '2013-07-01', rvnu_cd = '0100', pos = '20',
                     pat_planid = patient$patid, patid = patient$patid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  add_med_diagnosis(patid = patient$patid, pat_planid = patient$patid, icd_flag = "9", diag = "E001", clmid = claim$clmid, diag_position = 1)
  expect_visit_occurrence(person_id = patient$person_id, visit_concept_id = 9201)
  expect_observation(person_id = patient$person_id, observation_source_value = 'E001')


  patient <- createPatient()
  claim <- createClaim()
  declareTest("Patient has diag1-5 source codes mapping to domain Observation and visit_place_of_service of OP does not get mapped to Condition", 
              source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  add_medical_claims(clmid = claim$clmid, clmseq = '001', lst_dt = '2013-07-01',
                     pat_planid = patient$patid, patid = patient$patid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  add_med_diagnosis(patid = patient$patid, pat_planid = patient$patid, icd_flag = "9", diag = "E001", clmid = claim$clmid, diag_position = 1)
  expect_visit_occurrence(person_id = patient$person_id, visit_concept_id = 9202)
  expect_observation(person_id = patient$person_id, observation_source_value = 'E001')

}
