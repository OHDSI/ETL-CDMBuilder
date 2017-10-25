createConditionEraTests <- function()
{
  testDiag <- '7061'
  testConditionConceptId <- 141095
  
  patient <- createPatient();
  claim <- createClaim();
  declareTest("Patient has Medical records (some which are Concept_ID = 0) that both collapse and stay separate in the Condition Era table", source_pid = patient$patid, cdm_pid = patient$person_id)
  add_member_detail(aso = 'N', bus = 'COM', cdhp = 3, eligeff = '2010-05-01', eligend = '2013-10-31',
                    gdr_cd = 'F', patid = patient$patid, pat_planid = patient$patid, product = 'HMO', yrdob = 1969)
  add_medical_claims(clmid = claim$clmid, clmseq = '001', diag1 = testDiag, lst_dt = '2013-07-01',
                     icd_flag = '9', pat_planid = patient$patid, patid = patient$patid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  add_medical_claims(clmid = claim$clmid, clmseq = '001', diag1 = testDiag, lst_dt = '2013-07-01',
                     icd_flag = '9', pat_planid = patient$patid, patid = patient$patid, fst_dt = '2013-07-25', prov = '111111', provcat = '5678')
  add_medical_claims(clmid = claim$clmid, clmseq = '001', diag1 = '7872', lst_dt = '2013-07-01',
                     icd_flag = '9', pat_planid = patient$patid, patid = patient$patid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678')
  add_medical_claims(clmid = claim$clmid, clmseq = '001', diag1 = 'V1582', lst_dt = '2013-07-01',
                     icd_flag = '9', pat_planid = patient$patid, patid = patient$patid, fst_dt = '2013-07-01', prov = '111111', provcat = '5678')

  expect_condition_era(person_id = patient$person_id, condition_concept_id = testConditionConceptId, condition_occurrence_count = 2)
  expect_condition_era(person_id = patient$person_id, condition_concept_id = 31317, condition_occurrence_count = 1)
  expect_no_condition_era(person_id = patient$person_id, condition_concept_id = 0)
}
