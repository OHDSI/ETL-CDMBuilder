createConditionOccurrenceTests <- function()
{

  add_medical(medcode = 1058, read_code = 'F563500')
  add_medical(medcode = 898, read_code = 'K17y000')
  add_medical(medcode = 100895, read_code = 'N22y700')
  add_medical(medcode = 45999, read_code = 'J040.14')
  add_medical(medcode = 11531, read_code = 'P00..00')
  add_medical(medcode = 35968, read_code = 'PB2z.00')


  # 1) -- clinical condition with visit
  patient <- createPatient(pracid='111');
  declareTest('Read clinical condition with visit',source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01', pracid = patient$pracid)
  add_clinical(patid = patient$patid, eventdate =  '2012-01-01', medcode = 1058, staffid = 1001)
  add_consultation(patid = patient$patid, eventdate = '2012-01-01', staffid = 9001)
  # also add hes visit with same date to test 9202
  #add_hes_hospital(patid = patient$patid, spno = 5, admidate = '2012-01-01')
  expect_condition_occurrence(person_id = patient$person_id, condition_start_date = '2012-01-01', condition_concept_id = 75555,
                              condition_source_concept_id = 45436713, condition_source_value = 'F563500',
                              condition_type_concept_id = 38000245, provider_id = 1001
                              ,visit_occurrence_id = (as.integer(patient$person_id) * 100000000 + (2012*10000) +  (1* 100) + 1)
                              )
  expect_count_condition_occurrence(person_id = patient$person_id, rowCount = 1)




  # 2) -- clinical condition without visit
  patient <- createPatient(pracid='111');
  declareTest('Read clinical condition without visit',source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01', pracid = patient$pracid)
  add_clinical(patid = patient$patid, eventdate =  '2012-03-01', medcode = 898, staffid = 1001)
  add_consultation(patid = patient$patid, eventdate = '2012-01-01', staffid = 9001)
  expect_condition_occurrence(person_id = patient$person_id, condition_start_date = '2012-03-01', condition_concept_id = 195862,
                              condition_source_concept_id = 45453481, condition_source_value = 'K17y000',
                              condition_type_concept_id = 38000245, provider_id = 1001,
                              visit_occurrence_id = NULL)
  expect_count_condition_occurrence(person_id = patient$person_id, rowCount = 1)



  # 3) -- Invalid: clinical condition outside observation period
  patient <- createPatient(pracid='111');
  declareTest('Read clinical condition outside observation period',source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01', pracid = patient$pracid)
  add_clinical(patid = patient$patid, eventdate =  '2009-03-01', medcode = 898, staffid = 1001)
  add_consultation(patid = patient$patid, eventdate = '2012-01-01', staffid = 9001)
  expect_no_condition_occurrence(person_id = patient$person_id)



  # 4) ---- immunisation condition
  patient <- createPatient(pracid='111');
  declareTest('Read immunisation condition with no visit',source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01', pracid = patient$pracid)
  add_clinical(patid = patient$patid, eventdate =  '2011-03-01', medcode = 45999, staffid = 1001)
  expect_condition_occurrence(person_id = patient$person_id, condition_start_date = '2011-03-01', condition_source_value = 'J040.14',
                              condition_type_concept_id = 38000245, provider_id = 1001, visit_occurrence_id=NULL,
                              condition_concept_id=4123595, condition_source_concept_id=45463565)
  expect_count_condition_occurrence(person_id = patient$person_id, rowCount = 1)



  # 5) ---- referral condition
  patient <- createPatient(pracid='111');
  declareTest('Read referral condition  with no visit',source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01', pracid = patient$pracid)
  add_referral(patid = patient$patid, eventdate =  '2011-03-01', medcode = 11531, staffid = 1001)
  expect_condition_occurrence(person_id = patient$person_id, condition_start_date='2011-03-01', condition_source_value='P00..00',
                              condition_type_concept_id=42898140, provider_id=1001, visit_occurrence_id=NULL,
                              condition_source_concept_id=45420722, condition_concept_id=377368)
  expect_count_condition_occurrence(person_id = patient$person_id, rowCount = 1)


  # 6) ---- test condition
  patient <- createPatient(pracid='111');
  declareTest('Read test condition  with no visit',source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01', pracid = patient$pracid)
  add_test(patid = patient$patid, eventdate =  '2011-03-01', medcode = 35968, staffid = 1001)
  expect_condition_occurrence(person_id = patient$person_id, condition_start_date='2011-03-01', condition_source_value='PB2z.00',
                              condition_type_concept_id=38000276, provider_id=1001, visit_occurrence_id=NULL,
                              condition_source_concept_id=45430565, condition_concept_id=198550)
  expect_count_condition_occurrence(person_id = patient$person_id, rowCount = 1)



  # 7) --ICD10 codes from HES_primary_diag_hosp, entire hosp within HES obs period
  #patient <- createPatient(pracid='111');
  #declareTest('ICD10 codes from HES_primary_diag_hosp, entire hosp within HES obs period',source_pid = patient$patid, cdm_pid = patient$person_id)
  #add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01', pracid = patient$pracid)
  #add_hes_primary_diag_hosp(patid = patient$patid, spno = 10, admidate = '2012-01-01', discharged = '2012-03-01',
  #                          icd = 'S42.3')
  #add_hes_hospital(patid=patient$patid, spno=10, admidate = '2012-01-01', discharged = '2012-03-01')
  #add_hes_linkage_eligibility(patid = patient$patid, pracid = 111, linkdate = '2013-01-01', hes_e = 1)
  #expect_condition_occurrence(person_id = patient$person_id, condition_start_date='2012-01-01',condition_end_date='2012-03-01',
  #                            condition_source_value='S42.3', condition_concept_id=4175616, condition_type_concept_id=38000183,
  #                            visit_occurrence_id=10, condition_source_concept_id=45597729)
  #expect_count_condition_occurrence(person_id = patient$person_id, rowCount = 1)


  # 8) --ICD10 codes from HES_primary_diag_hosp, entire hosp not within HES obs period
  #patient <- createPatient(pracid='111');
  #declareTest('ICD10 condition from HES_primary_diag_hosp,part of hosp outside HES obs period',source_pid = patient$patid, cdm_pid = patient$person_id)
  #add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01', pracid = patient$pracid)
  #add_hes_primary_diag_hosp(patid = patient$patid, spno = 11, admidate = '2012-12-31', discharged = '2012-03-01',
  #                          icd = 'S42.3')
  #add_hes_hospital(patid=patient$patid, spno=11, admidate = '2012-12-31', discharged = '2013-03-01')
  #add_hes_linkage_eligibility(patid = patient$patid, pracid = patient$pracid, linkdate = '2013-01-01', hes_e = 1)
  #expect_no_condition_occurrence(person_id = patient$person_id)




  # 9) --inside HES obs period from HES_diagnosis_epi
  #patient <- createPatient(pracid='111');
  #declareTest('inside HES obs period from HES_diagnosis_epi',source_pid = patient$patid, cdm_pid = patient$person_id)
  #add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01', pracid = patient$pracid)
  #add_hes_hospital(patid=patient$patid, spno=11, admidate = '2012-01-01', discharged = '2013-01-01')
  #add_hes_linkage_eligibility(patid = patient$patid, pracid = patient$pracid, linkdate = '2013-01-01', hes_e = 1)
  #add_hes_diagnosis_epi(patid = patient$patid, spno = 11, epikey = 2517497, epistart = '2012-01-31',
  #                      epiend = '2012-01-31', d_order = 1, icd = 'H26.9')
  #add_hes_episodes(patid = patient$patid, spno = 11, epikey = 2517497, epistart = '2012-01-31',
  #                 epiend = '2012-01-31', tretspef = 250, pconsult = 'T88888')
  #need provide table entry of provider_source_value=T88888, provider_id=5000000004 - has so error
  #expect_condition_occurrence(person_id = patient$person_id, condition_start_date='2012-01-31',condition_end_date='2012-01-31',
  #                            condition_source_value ='H26.9', condition_concept_id=375545, condition_type_concept_id=38000184,
  #                            visit_occurrence_id=11, provider_id=5000000004, condition_source_concept_id=45605651)
  #expect_count_condition_occurrence(person_id = patient$person_id, rowCount = 1)


  # 10) invalid: --outside HES diagnosis period HES_diagnosis_epi
  #patient <- createPatient(pracid='111');
  #declareTest('outside HES diagnosis period HES_diagnosis_epi',source_pid = patient$patid, cdm_pid = patient$person_id)
  #add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01', pracid = patient$pracid)
  #add_hes_hospital(patid=patient$patid, spno=11, admidate = '2012-12-31', discharged = '2013-03-01')
  #add_hes_linkage_eligibility(patid = patient$patid, pracid = patient$pracid, linkdate = '2013-01-01', hes_e = 1)
  #add_hes_diagnosis_epi(patid = patient$patid, spno = 11, epikey = 2517498, epistart = '2013-01-31',
  #                      epiend = '2013-01-31', d_order = 1, icd = 'H26.9')
  #add_hes_episodes(patid = patient$patid, spno = 11, epikey = 2517498, epistart = '2013-01-31',
  #                 epiend = '2013-01-31', tretspef = 250, pconsult = 'T88888')
  #expect_no_condition_occurrence(person_id = patient$person_id)

  }
