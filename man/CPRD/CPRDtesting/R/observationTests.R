createObservationTests <- function()
{
  add_medical(medcode = 98196, read_code = '65PT.11')
  add_medical(medcode = 35209, read_code = 'Q116.00')
  add_medical(medcode = 1137, read_code = 'R100.00')
  add_medical(medcode = 70038, read_code = 'Z5A6200')
  add_medical(medcode = 14612, read_code = '657E.00')
  add_medical(medcode = 1942, read_code = 'M240012', description = 'Hair loss')


  # 1) -- clinical procedure with visit
  patient <- createPatient();
  declareTest(' clinical procedure with visit', source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01', pracid = patient$pracid)
  add_clinical(patid = patient$patid, eventdate = '2012-01-01', medcode = 98196, staffid = 1001)
  add_consultation(patid = patient$patid, eventdate = '2012-01-01', staffid = 9001)
  # --also add hes visit with same date to test 9202
  #add_hes_hospital(patid = patient$patid, spno = 5, admidate = '2012-01-01')
  expect_observation(person_id = patient$person_id, observation_date='2012-01-01',
                     observation_type_concept_id=38000245,
                     observation_source_value='65PT.11', observation_concept_id=40479404,
                     observation_source_concept_id=45425506,
                     visit_occurrence_id = as.double(patient$person_id)*100000000+2012*10000+1*100+1)
  expect_count_observation(person_id = patient$person_id, rowCount = 1)

  # 2) -- clinical procedure without visit  [! MISSING FROM EXCEL - NEED TO MANUALLY DO THIS]
  patient <- createPatient();
  declareTest(' clinical procedure without visit', source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01', pracid = patient$pracid)
  add_clinical(patid = patient$patid, eventdate = '2012-03-01', medcode = 98196, staffid = 1001)
  expect_observation(person_id = patient$person_id, observation_date='2012-03-01', #observation_type_concept_id=38000245,
                     observation_source_value='65PT.11', visit_occurrence_id = NULL #,observation_concept_id=40479404,
                     #observation_source_concept_id=45425506
  )

  # 3)  -- clinical procedure outside observation period
  patient <- createPatient();
  declareTest(' clinical procedure outside observation period', source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01', pracid = patient$pracid)
  add_clinical(patid = patient$patid, eventdate = '2009-03-01', medcode = 1137, staffid = 1001)
  expect_no_observation(person_id = patient$person_id, observation_date='2010-01-01', observation_source_value='R100.00',
                     observation_concept_id=44801932, observation_source_concept_id=45474099)

  # 4) ---- immunisation procedure
  patient <- createPatient();
  declareTest('immunisation procedure', source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01', pracid = patient$pracid)
  add_immunisation(patid = patient$patid, eventdate = '2011-03-01', medcode = 1137, staffid = 1001)
  expect_observation(person_id = patient$person_id, observation_date='2011-03-01',
                     observation_type_concept_id=38000280,
                     observation_source_value='R100.00', observation_concept_id=4044812,#44801932,
                     observation_source_concept_id=45474099)

  # 5) ---- referral procedure
  patient <- createPatient();
  declareTest('referral procedure', source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01', pracid = patient$pracid)
  add_referral(patid = patient$patid, eventdate = '2011-03-01', medcode = 1137, staffid = 1001)
  expect_observation(person_id = patient$person_id, observation_date='2011-03-01', observation_type_concept_id=42898140,
                     observation_source_value='R100.00', observation_concept_id=4044812,#44801932,
                     observation_source_concept_id=45474099)

  # 6) ---- test procedure
  patient <- createPatient();
  declareTest('test procedure', source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01', pracid = patient$pracid)
  add_test(patid = patient$patid, eventdate = '2011-03-01', medcode = 1137, staffid = 1001)
  expect_observation(person_id = patient$person_id, observation_date='2011-03-01', observation_type_concept_id=38000280,
                     observation_source_value='R100.00', observation_concept_id=4044812,#44801932,
                     observation_source_concept_id=45474099)

  # 7) --- observation not mapped
  patient <- createPatient();
  declareTest('observation not mapped', source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01', pracid = patient$pracid)
  add_test(patid = patient$patid, eventdate = '2011-03-01', medcode = 70038, staffid = 1001)
  expect_observation(person_id = patient$person_id, observation_date='2011-03-01', observation_source_value='Z5A6200',
                     observation_concept_id=0, observation_source_concept_id=0)

  #============================================================

  # 8) --Read clinical medical history condition
  patient <- createPatient();
  declareTest('Read clinical medical history condition', source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01', pracid = patient$pracid)
  add_clinical(patid = patient$patid, eventdate = '2005-01-01', medcode = 1058, staffid = 1001)
  expect_observation(person_id = patient$person_id, observation_date='2010-01-01',
                     observation_type_concept_id=38000245,
                     observation_source_value='F563500', observation_concept_id=43054928,
                     observation_source_concept_id=45436713, value_as_concept_id=75555)

  # 9) --Read referral medical history procedure (75111)
  patient <- createPatient();
  declareTest('Read referral medical history procedure', source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01', pracid = patient$pracid)
  add_referral(patid = patient$patid, eventdate = '2005-01-01', medcode = 69651, staffid = 1001)
  expect_observation(person_id = patient$person_id, observation_date='2010-01-01',
                     observation_type_concept_id=42898140,
                     observation_source_value='744C.00', observation_concept_id=43054928,
                     observation_source_concept_id=45425639, value_as_concept_id=4192131)

  # 10) --Read test medical history observation
  patient <- createPatient();
  declareTest('Read test medical history procedure', source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01', pracid = patient$pracid)
  add_test(patid = patient$patid, eventdate = '2005-01-01', medcode = 1137, staffid = 1001)
  expect_observation(person_id = patient$person_id, observation_date='2010-01-01',
                     observation_type_concept_id=38000280,
                     observation_source_value='R100.00', observation_concept_id=43054928,
                     observation_source_concept_id=45474099, value_as_concept_id=4044812)#44801932)


  # 11) --Read immunisation medical history drug
  patient <- createPatient();
  declareTest('Read immunisation medical history drug', source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01', pracid = patient$pracid)
  add_immunisation(patid = patient$patid, eventdate = '2005-01-01', medcode = 14612, staffid = 1001)
  expect_observation(person_id = patient$person_id, observation_date='2010-01-01', observation_source_value='657E.00',
                     observation_concept_id=43054928, observation_source_concept_id=45472275,
                     value_as_concept_id=4197151)

  # 12) --Read clinical non-medical history condition on observation_period_start_date
  add_medical(medcode = 10584, read_code = '13JW.00')
  patient <- createPatient();
  declareTest('Read clinical non-medical history condition on observation_period_start_date',
              source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01', pracid = patient$pracid)
  add_clinical(patid = patient$patid, eventdate = '2010-01-01', medcode = 10584, staffid = 1001)
  expect_observation(person_id = patient$person_id, observation_date='2010-01-01',
                     observation_source_value='13JW.00',
                     observation_concept_id=4053230, observation_source_concept_id=45471745)

  # 13) --Read clinical medical history condition non-mapped
  patient <- createPatient();
  declareTest('Read clinical medical history condition non-mapped', source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01', pracid = patient$pracid)
  add_clinical(patid = patient$patid, eventdate = '2005-01-01', medcode = 70038, staffid = 1001)
  expect_observation(person_id = patient$person_id, observation_date='2010-01-01', observation_source_value='Z5A6200',
                              observation_concept_id=43054928, observation_source_concept_id=0,
                              value_as_concept_id=0)


  # 14) --Read referral medical history condition non-mapped
  patient <- createPatient();
  declareTest('Read referral medical history condition non-mapped', source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01', pracid = patient$pracid)
  add_referral(patid = patient$patid, eventdate = '2005-01-01', medcode = 70038, staffid = 1001)
  expect_observation(person_id = patient$person_id, observation_date='2010-01-01',
                     observation_source_value='Z5A6200',
                              observation_concept_id=43054928, observation_source_concept_id=0,
                              value_as_concept_id=0)


  # 15) --Read test medical history condition non-mapped
  patient <- createPatient();
  declareTest('Read test medical history condition non-mapped', source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01', pracid = patient$pracid)
  add_test(patid = patient$patid, eventdate = '2005-01-01', medcode = 70038, staffid = 1001)
  expect_observation(person_id = patient$person_id, observation_date='2010-01-01', observation_source_value='Z5A6200',
                              observation_concept_id=43054928, observation_source_concept_id=0,
                              value_as_concept_id=0)

  # 16) --Read immunisatoin medical history condition non-mapped
  patient <- createPatient();
  declareTest('Read immunisatoin medical history condition non-mapped', source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01', pracid = patient$pracid)
  add_immunisation(patid = patient$patid, eventdate = '2005-01-01', medcode = 70038, staffid = 1001)
  expect_observation(person_id = patient$person_id, observation_date='2010-01-01', observation_source_value='Z5A6200',
                              observation_concept_id=43054928, observation_source_concept_id=0,
                              value_as_concept_id=0)


  #=======================================================================


  # 17) --HES acp record
  #patient <- createPatient();
  #declareTest('1) HES acp record', source_pid = patient$patid, cdm_pid = patient$person_id)
  #add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01', pracid = patient$pracid)
  #add_hes_hospital(patid = patient$patid, spno = 10, admidate = '2012-01-01', discharged = '2012-03-01')
  #add_hes_linkage_eligibility(patid = patient$patid, pracid = patient$pracid, linkdate = '2013-01-01', hes_e = 1)
  #add_hes_acp(patid = patient$patid, spno = 10, acpstar = '2012-01-01', acpdur = 2, intdays = NULL,
  #            depdays = 2, acploc = 1, acpsour = 5, acpdisp = 4, acpout = 1, acpplan = 2, acpspef = 190,
  #            orgsup = 0)
  #expect_observation(person_id=patient$person_id, observation_date='2012-01-01',
  #                   observation_type_concept_id=900000007,
  #                   observation_concept_id=40757216, observation_source_value='1-1',
  #                   visit_occurrence_id=10,
  #                   value_as_string='ICU in other hospital')
  #declareTest('2) HES acp record', source_pid = patient$patid, cdm_pid = patient$person_id)
  #expect_observation(person_id=patient$person_id, observation_date='2012-01-01',
  #                   observation_type_concept_id=900000006,
  #                   observation_concept_id=0, observation_source_value='1-2', visit_occurrence_id=10,
   #                  value_as_number=2)
  #declareTest('3) HES acp record', source_pid = patient$patid, cdm_pid = patient$person_id)
  #expect_observation(person_id=patient$person_id, observation_date='2012-01-01',
  #                   observation_type_concept_id=900000007,
  #                   observation_concept_id=0, observation_source_value='1-3', visit_occurrence_id=10,
  #                   value_as_string='General intensive care unit (ICU). Adult intensive care, including wards labelled as surgical or medical ICU, but excluding the specialised units identified by other values. General ICUs may provide a mixture of high dependency unit (HDU) and ICU level care.'  )
  #declareTest('5) HES acp record', source_pid = patient$patid, cdm_pid = patient$person_id)
  #expect_observation(person_id=patient$person_id, observation_date='2012-01-01',
  #                   observation_type_concept_id=900000007,
  #                   observation_concept_id=0, observation_source_value='1-5', visit_occurrence_id=10,
  #                   value_as_string='No')
  #declareTest('6) HES acp record', source_pid = patient$patid, cdm_pid = patient$person_id)
  #expect_observation(person_id=patient$person_id, observation_date='2012-01-01', observation_type_concept_id=900000007,
  #                   observation_concept_id=0, observation_source_value='1-6', visit_occurrence_id=10,
  #                   value_as_string='A&E department in same hospital')
  #declareTest( '8) HES acp record', source_pid = patient$patid, cdm_pid = patient$person_id)
  #expect_observation(person_id=patient$person_id, observation_date='2012-01-01',
  #                   observation_type_concept_id=900000006,
  #                   observation_concept_id=0, observation_source_value='1-8', visit_occurrence_id=10,
  #                   value_as_number=2 )
  #declareTest('9) HES acp record', source_pid = patient$patid, cdm_pid = patient$person_id)
  #expect_observation(person_id=patient$person_id, observation_date='2012-01-01',
  #                   observation_type_concept_id=900000007,
  #                   observation_concept_id=0, observation_source_value='1-9', visit_occurrence_id=10,
  #                   value_as_number=NULL, value_as_string='Not known: a validation error')
  #declareTest('10) HES acp record', source_pid = patient$patid, cdm_pid = patient$person_id)
  #expect_observation(person_id=patient$person_id, observation_date='2012-01-01',
  #                   observation_type_concept_id=900000006,
  #                   observation_concept_id=0, observation_source_value='1-10', visit_occurrence_id=10,
  #                   value_as_number=0)


  # 18) --HES hospital record
  #patient <- createPatient();
  #declareTest('1) HES hospital record', source_pid = patient$patid, cdm_pid = patient$person_id)
  #add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01', pracid = patient$pracid)
  #add_hes_hospital(patid = patient$patid, spno = 10, admidate = '2012-01-01', discharged = '2012-03-01',
  #                 admimeth = 11, admisorc = 19, disdest = 19, dismeth = 1, duration = 1,
  #                 elecdate = '2011-01-01', elecdur = 68)
  #add_hes_linkage_eligibility(patid = patient$patid, pracid = patient$pracid, linkdate = '2013-01-01', hes_e = 1)
  #expect_observation(person_id=patient$person_id, observation_date='2012-01-01', observation_type_concept_id=900000007,
  #                   observation_concept_id=0, observation_source_value='2-1', visit_occurrence_id=10,
  #                   value_as_string='Elective: from waiting list')
  #declareTest('2) HES hospital record', source_pid = patient$patid, cdm_pid = patient$person_id)
  #expect_observation(person_id=patient$person_id, observation_date='2012-01-01', observation_type_concept_id=900000007,
  #                   observation_concept_id=0, observation_source_value='2-2', visit_occurrence_id=10,
  #                   value_as_string='The usual place of residence, including no fixed abode' )
  #declareTest('3) HES hospital record', source_pid = patient$patid, cdm_pid = patient$person_id)
  #expect_observation(person_id=patient$person_id, observation_date='2012-03-01', observation_type_concept_id=900000007,
  #                   observation_concept_id=40757216, observation_source_value='2-3', visit_occurrence_id=10,
  #                   value_as_string='The usual place of residence, including no fixed abode')
  #declareTest('4) HES hospital record', source_pid = patient$patid, cdm_pid = patient$person_id)
  #expect_observation(person_id=patient$person_id, observation_date='2012-01-01', observation_type_concept_id=900000007,
  #                   observation_concept_id=0, observation_source_value='2-6', visit_occurrence_id=10,
  #                   value_as_string='2011-01-01' )

  # 19) --HES maternity record
  #patient <- createPatient();
  #declareTest('1) HES maternity record', source_pid = patient$patid, cdm_pid = patient$person_id)
  #add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01', pracid = patient$pracid)
  #add_hes_maternity(patid = patient$patid, spno = 10, epistart = '2012-01-01', epiend = '2012-01-03', epikey = 5555,
  #                  anasdate = '2012-01-01', antedur = 0, biresus = 1, birordr = 1, birstat = 1, birweit = 3660,
  #                  delchang = 6, delonset = 1, numbaby = 1,matordr = 1)
  #add_hes_hospital(patid = patient$patid, spno = 10, admidate = '2012-01-01', discharged = '2012-03-01',
  #                 admimeth = 11, admisorc = 19, disdest = 19, dismeth = 1, duration = 1,
  #                 elecdate = '2011-01-01', elecdur = 68)
  #add_hes_linkage_eligibility(patid = patient$patid, pracid = patient$pracid, linkdate = '2013-01-01', hes_e = 1)
  #expect_observation(person_id=patient$person_id, observation_date='2012-01-01',
  #                   observation_type_concept_id=900000006,
  #                   observation_concept_id=43533795, observation_source_value='3-4', visit_occurrence_id=10,
  #                   value_as_number=1 )
  #declareTest('2) HES maternity record', source_pid = patient$patid, cdm_pid = patient$person_id)
  #expect_observation(person_id=patient$person_id, observation_date='2012-01-01',
  #                   observation_type_concept_id=900000007,
  #                   observation_concept_id=0, observation_source_value='3-5', visit_occurrence_id=10,
  #                   value_as_string='Positive pressure nil, drugs nil')


  #==============================================================================


  # 20) --ICD10 codes from HES_primary_diag_hosp
  #patient <- createPatient();
  #declareTest('ICD10 codes from HES_primary_diag_hosp', source_pid = patient$patid, cdm_pid = patient$person_id)
  #add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01', pracid = patient$pracid)
  #add_hes_primary_diag_hosp(patid = patient$patid, spno = 10, admidate = '2012-01-01', discharged = '2012-03-01',
  #                          icd = 'V38.7')
  #add_hes_hospital(patid = patient$patid, spno = 10, admidate = '2012-01-01', discharged = '2012-03-01')
  #add_hes_linkage_eligibility(patid = patient$patid, pracid = patient$pracid, linkdate = '2013-01-01', hes_e = 1)
  #expect_observation(person_id=patient$person_id, observation_date='2012-01-01',
  #                   observation_type_concept_id=38000183,
  #                   observation_source_value='V38.7', observation_concept_id=435134,
  #                   observation_source_concept_id=45561213)


  # 21) --inside HES obs period from HES_diagnosis_epi
  #patient <- createPatient();
  #declareTest('inside HES obs period from HES_diagnosis_epi', source_pid = patient$patid, cdm_pid = patient$person_id)
  #add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01', pracid = patient$pracid)
  #add_hes_hospital(patid = patient$patid, spno = 11, admidate = '2012-12-31', discharged = '2013-01-01')
  #add_hes_linkage_eligibility(patid = patient$patid, pracid = patient$pracid, linkdate = '2013-01-01', hes_e = 1)
  #add_hes_diagnosis_epi(patid = patient$patid, spno = 11, epikey = 2517497, epistart = '2012-01-31',
  #                      epiend = '2012-01-31', d_order = 1, icd = 'R71')
  #add_hes_episodes(patid = patient$patid, spno = 11, epikey = 2517497, epistart = '2012-01-31',
  #                 epiend = '2012-01-31', tretspef = 250, pconsult = 'T88888')
  #expect_observation(person_id=patient$person_id, observation_date='2012-01-31', observation_type_concept_id=38000184,
  #                   observation_source_value='R71', observation_concept_id=4044812,
  #                   observation_source_concept_id=45573038)


  # 22) --ICD10 not mapped primary diag
  #patient <- createPatient();
  #declareTest('ICD10 not mapped primary diag', source_pid = patient$patid, cdm_pid = patient$person_id)
  #add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01', pracid = patient$pracid)
  #add_hes_hospital(patid = patient$patid, spno = 10, admidate = '2012-01-01', discharged = '2012-03-01')
  #add_hes_linkage_eligibility(patid = patient$patid, pracid = patient$pracid, linkdate = '2013-01-01', hes_e = 1)
  #add_hes_primary_diag_hosp(patid = patient$patid, spno = 10, admidate = '2012-01-01',
  #                          discharged =  '2012-03-01', icd = 'W12.5')
  #expect_observation(person_id=patient$person_id, observation_date='2012-01-01',
  #                   observation_type_concept_id=38000183,
  #                   observation_source_value='W12.5', observation_concept_id=0,
  #                   observation_source_concept_id=0)



  # 23) --ICD10 not mapped diag epi
  #patient <- createPatient();
  #declareTest('ICD10 not mapped diag epi', source_pid = patient$patid, cdm_pid = patient$person_id)
  #add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01', pracid = patient$pracid)
  #add_hes_hospital(patid = patient$patid, spno = 11, admidate = '2012-12-31', discharged = '2013-01-01')
  #add_hes_linkage_eligibility(patid = patient$patid, pracid = patient$pracid, linkdate = '2013-01-01', hes_e = 1)
  #add_hes_diagnosis_epi(patid = patient$patid, spno = 11, epikey = 2517497, epistart = '2012-01-31',
  #                      epiend = '2012-01-31', d_order = 1, icd = 'X86.5')
  #add_hes_episodes(patid = patient$patid, spno = 11, epikey = 2517497, epistart = '2012-01-31',
  #                 epiend = '2012-01-31', tretspef = 250, pconsult = 'T88888')
  #expect_observation(person_id=patient$person_id, observation_date='2012-01-31', observation_type_concept_id=38000184,
  #                   observation_source_value='X86.5', observation_concept_id=0,
  #                   observation_source_concept_id=0)




  #================================================================

  # 24) -- test observation record 4 fields
  patient <- createPatient();
  declareTest('test observation record 4 fields', source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01', pracid = patient$pracid)
  add_test(patid = patient$patid, eventdate = '2012-01-01', medcode = 98196, staffid = 1001, enttype = 215,
           data1 = 9, data2 = 28.800,data3 = 114.000 ,data4 = 0.000, data5 = NULL, data6 = NULL,
           data7 =0 ,data8_value = NULL,data8_date = NULL)
  add_entity(code = 215, description = 'Clotting tests', filetype = 'Test', category = 'Haematology',
             data_fields = 4, data1 = 'Qualifier', data1lkup = 'TQU',
             data2 = 'Normal range from', data2lkup = NULL,
             data3 = 'Normal range to', data3lkup = NULL,
             data4 = 'Normal range basis', data4lkup = NULL)
  add_lookup(lookup_id = 1156,lookup_type_id = 83, code = 9, text = 'Normal')
  ##add_lookuptype(lookup_type_id = 83, name = 'TQU', description = 'hshshd')
  expect_observation(person_id=patient$person_id, observation_concept_id=3012377,
                     observation_date='2012-01-01',
                     observation_type_concept_id=38000278, value_as_string='Normal',
                     observation_source_value=215, qualifier_concept_id=45884153)

  # 25) -- test observation record 7 fields
  patient <- createPatient();
  declareTest('test observation record 7 fields', source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01', pracid = patient$pracid)
  add_test(patid = patient$patid, eventdate = '2012-01-01', medcode = NULL,#98196,
           staffid = 1001, enttype = 412,
           data1 = 3, data2 = 3.700,data3 = 1 ,data4 = 8, data5 =3.400, data6 = 5.100,
           data7 =0 ,data8_value = NULL,data8_date = NULL)
  add_entity(code = 412, description = 'Airway ...', filetype = 'Test', category = 'Oter Pathology Tests',
             data_fields = 7, data1 = 'Operator', data1lkup = 'OPR',
             data2 = 'Value', data2lkup = NULL,
             data3 = 'Unit of measure', data3lkup = 'SUM',
             data4 = 'Qualifier', data4lkup = 'TQU',
             data5 = 'Normal range from', data5lkup = NULL,
             data6 = 'Normal range to', data6lkup = NULL,
             data7 = 'Normal range basis', data7lkup = 'POP', data8 = NULL, data8lkup = NULL
              )
  add_lookup(lookup_id = 856, lookup_type_id = 81, code = 1, text = '%')
  ##add_lookuptype(lookup_type_id = 81, name = 'SUM', description = 'Specimen ...')
  add_lookup(lookup_id = 1155, lookup_type_id = 83, code = 8, text = 'High')
  ##add_lookuptype(lookup_type_id = 83, name = 'TQU', description = 'Test ...')
  expect_observation(person_id=patient$person_id, observation_concept_id=3000492,#40479404
                     observation_date='2012-01-01',
                     observation_type_concept_id=38000278,
                     value_as_string='= 3.700 High',
                     value_as_number=3.7, observation_source_value=412, qualifier_concept_id=45876384,
                     unit_source_value='%')
  expect_count_observation(rowCount = 1, person_id = patient$person_id)

  #========================================================================
  # DONE TESTS UP TO HERE


  # 26) -- additional observation
  add_product(prodcode=42, gemscriptcode = 72487020, productname = 'Simvastatin 10mg tablets')
  add_medical(medcode = 1942, read_code = 'M240012', 'Hair loss')
  patient <- createPatient();
  declareTest('1) additional observation ', source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01', pracid = patient$pracid)
  add_entity(code = 21, description = 'Allergy', filetype = 'Clinical',category = 'Allergy',
             data_fields = 5,data1 = 'Drug Code', data1lkup = 'Product Dictionary',
             data2 = 'Reaction Type', data2lkup = 'RCT',
             data3 = 'Severity', data3lkup = 'SEV',
             data4 = 'Certainty', data4lkup = 'CER',
             data5 = 'Read Code For Reaction', data5lkup = 'Medical Dictionary')
  add_lookup(lookup_id = 706, lookup_type_id = 69, code = 2, text = 'Intolerance')
  add_lookuptype(lookup_type_id = 69, name = 'RCT', description = 'Reaction Type')
  add_additional(patid = patient$patid, enttype = 21, adid = 35, data1_value  = 42.000, data2_value  = 2.000,
                 data3_value  = 3.000 ,data4_value = 3, data5_value = 1942)
  add_clinical(patid = patient$patid, eventdate = '2010-01-01', adid = 35)
  add_consultation(patid = patient$patid, eventdate = '2010-01-01', staffid = 1001)
  expect_observation(person_id=patient$person_id, observation_date='2010-01-01', observation_source_value='21-1',
                     observation_type_concept_id=38000280, value_as_string='Simvastatin 10mg tablets',
                     observation_concept_id=0, observation_source_concept_id=0)

  declareTest('2) additional observation ', source_pid = patient$patid, cdm_pid = patient$person_id)
  expect_observation(person_id=patient$person_id, observation_concept_id=40757167, observation_date='2010-01-01',
                     observation_source_value='21-2', observation_type_concept_id=38000280,
                     value_as_string='Intolerance', observation_source_concept_id=0 )

  declareTest('3) additional observation ', source_pid = patient$patid, cdm_pid = patient$person_id)
  expect_observation(person_id=patient$person_id, observation_date='2010-01-01',
                     observation_source_value='21-5', observation_type_concept_id=38000280,
                     value_as_string='Hair loss', observation_source_concept_id=0 )




  # 27) --dates
  patient <- createPatient();
  declareTest('1) dates ', source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01', pracid = patient$pracid)
  add_entity(code = 461, description = 'Repeat Medication Review', filetype = 'Clinical', category = 'Miscellaneous',
             data_fields = 4,
             data1 = 'Due date', data1lkup = 'dd/mm/yyyy',
             data2 = 'Seen by', data2lkup = NULL,
             data3 = 'Review date', data3lkup = 'dd/mm/yyyy',
             data4 = 'Next review date', data4lkup = 'dd/mm/yyyy'
            )
  add_additional(patid = patient$patid, enttype = 461, adid = 42, data1_date  = '2007-07-08',
                 data3_date  = '2007-01-08',
                 data4_date  = '2007-07-09')
  add_clinical(patid = patient$patid, eventdate = '2010-01-01', adid = 42)
  add_consultation(patid = patient$patid, eventdate = '2010-01-01', staffid = 1001)
  expect_observation(person_id=patient$person_id, observation_date='2010-01-01',
                     observation_source_value='461-1',
                     observation_type_concept_id=38000280, value_as_string='2007-07-08',
                     observation_concept_id=0, observation_source_concept_id=0)

  declareTest('2) dates', source_pid = patient$patid, cdm_pid = patient$person_id)
  expect_observation(person_id=patient$person_id, observation_concept_id=0, observation_date='2010-01-01',
                     observation_source_value='461-3', observation_type_concept_id=38000280,
                     value_as_string='2007-01-08', observation_source_concept_id=0 )



  # 28) --scores with 0 mapping
  patient <- createPatient();
  declareTest('scores with 0 mapping', source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01', pracid = patient$pracid)
  #add_entity(code = 372, data_fields = 4,
  #           data1 = 'Result of test', data1lkup = NULL,
  #           data2 = 'Condition', data2lkup = 'Medical Dictionary',
  #           data3 = 'Scoring Methodology', data3lkup = 'Scoring',
  #           data4 = 'Qualifier', data4lkup = 'P_N')
  add_additional(patid = patient$patid, enttype = 372, adid = 45,
                 data1_value  = 15.000, data2_value  = 100977.000,
                 data3_value  = 2.000, data4_value = 0)
  add_clinical(patid = patient$patid, eventdate = '2010-01-01', adid = 45)
  add_consultation(patid =patient$patid, eventdate = '2010-01-01', staffid = 1001)
  expect_observation(person_id=patient$person_id, observation_type_concept_id=44814721,
                     observation_concept_id=0, observation_source_value='372-2-100977', value_as_number=15)

  # 29) -- scores mapped (in correct as measurement)
  patient <- createPatient();
  declareTest('scores mapped', source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01', pracid = patient$pracid)
  add_additional(patid = patient$patid, enttype = 372, adid = 45,
                 data1_value  = 500.000, data2_value  = 10302.00,
                 data3_value  = 0.000)
  add_clinical(patid = patient$patid, eventdate = '2010-01-01', adid = 45)
  add_consultation(patid = patient$patid, eventdate = '2010-01-01', staffid = 1001)
  expect_no_observation(person_id=patient$person_id, observation_type_concept_id=44814721,
                     observation_concept_id=40769009, observation_source_value='372-0-10302',
                     value_as_number=500)

}
