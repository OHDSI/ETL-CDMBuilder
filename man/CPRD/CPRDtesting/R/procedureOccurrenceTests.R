createProcedureOccurrenceTests <- function()
{
  add_medical(medcode = 48653, read_code = '7J46z00')
  add_medical(medcode = 45832, read_code = '7414200')
  add_medical(medcode = 69651, read_code = '744C.00')

  # 1) -- clinical procedure with visit
  #also add hes visit with same date to test 9202

  patient <- createPatient();
  declareTest("Read clinical procedure with visit",source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01', pracid = patient$pracid)
  add_clinical(patid = patient$patid, eventdate = '2012-01-01', medcode = 48653, staffid = 1001)
  add_consultation(patid = patient$patid, eventdate = '2012-01-01', staffid = 1001)
  expect_procedure_occurrence(person_id = patient$person_id, procedure_date='2012-01-01', procedure_source_value='7J46z00',
                              procedure_type_concept_id=38000275, provider_id=1001, visit_occurrence_id=(as.integer(patient$person_id)* 100000000 + (2012*10000) +  (1* 100) + 1),
                              procedure_source_concept_id=45419444, procedure_concept_id=4074106)


  # 2) clinical procedure without visit
  patient <- createPatient();
  declareTest("clinical procedure without visit",source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01', pracid = patient$pracid)
  add_clinical(patid = patient$patid, eventdate = '2012-03-01', medcode = 45832, staffid = 1001)
  expect_procedure_occurrence(person_id = patient$person_id, procedure_date='2012-03-01',
                              procedure_source_value='7414200',
                              procedure_type_concept_id=38000275, provider_id=1001, visit_occurrence_id=NULL,
                              procedure_source_concept_id=45425628, procedure_concept_id=4336549)

  # 3) -- clinical procedure outside observation period
  patient <- createPatient();
  declareTest("clinical procedure outside observation period",source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01', pracid = patient$pracid)
  add_clinical(patid = patient$patid, eventdate = '2009-03-01', medcode = 69651, staffid = 1001)
  expect_no_procedure_occurrence(person_id = patient$person_id)

  # 4) ---- immunisation procedure
  patient <- createPatient();
  declareTest("immunisation procedure",source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01', pracid = patient$pracid)
  add_immunisation(patid = patient$patid, eventdate = '2011-03-01', medcode = 69651, staffid = 1001)
  expect_procedure_occurrence(person_id =patient$person_id, procedure_date='2011-03-01', procedure_source_value='744C.00',
                              procedure_type_concept_id=43542354, provider_id=1001, visit_occurrence_id=NULL,
                              procedure_source_concept_id=45425639, procedure_concept_id=4192131)



  # 5) ---- referral procedure
  patient <- createPatient();
  declareTest("referral procedure",source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01', pracid = patient$pracid)
  add_referral(patid = patient$patid, eventdate = '2011-03-01', medcode = 69651, staffid = 1001)
  expect_procedure_occurrence(person_id = patient$person_id, procedure_date='2011-03-01', procedure_source_value='744C.00',
                              procedure_type_concept_id=42898141, provider_id=1001, visit_occurrence_id=NULL,
                              procedure_source_concept_id=45425639, procedure_concept_id=4192131)


  # 6) ---- test procedure
  patient <- createPatient();
  declareTest("test procedure",source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01', pracid = patient$pracid)
  add_test(patid = patient$patid, eventdate = '2011-03-01', medcode = 69651, staffid = 1001)
  expect_procedure_occurrence(person_id = patient$person_id, procedure_date='2011-03-01', procedure_source_value='744C.00',
                              procedure_type_concept_id=38003621, provider_id=1001, visit_occurrence_id=NULL,
                              procedure_source_concept_id=45425639, procedure_concept_id=4192131)

  # 7) --ICD10 codes from HES_primary_diag_hosp, entire hosp not within HES obs period
  #patient <- createPatient();
  #declareTest("ICD10 codes from HES_primary_diag_hosp, entire hosp not within HES obs period",
  #            source_pid = patient$patid, cdm_pid = patient$person_id)
  #add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01', pracid = patient$pracid)
  #add_hes_primary_diag_hosp(patid = patient$patid, spno = 10, admidate = '2012-01-01', discharged = '2013-03-01', icd = 'Z30.2' )
  #add_hes_hospital(patid = patient$patid, spno = 10, admidate = '2012-01-01', discharged = '2013-03-01')
  #add_hes_linkage_eligibility(patid = patient$patid, pracid = patient$pracid, linkdate = '2013-01-01', hes_e = 1)
  #expect_procedure_occurrence(person_id = patient$person_id, procedure_date='2012-01-01', procedure_source_value ='Z30.2',
  #                            procedure_concept_id=4163273, procedure_type_concept_id=38000183,
  #                            visit_occurrence_id=10, provider_id=NULL, procedure_source_concept_id=45609921)
  #expect_no_procedure_occurrence(person_id = patient$person_id)

  # 8) --ICD10 codes from HES_primary_diag_hosp, entire hosp  within HES obs period
  #patient <- createPatient();
  #declareTest("ICD10 codes from HES_primary_diag_hosp, entire hosp  within HES obs period",
  #            source_pid = patient$patid, cdm_pid = patient$person_id)
  #add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01', pracid = patient$pracid)
  #add_hes_primary_diag_hosp(patid = patient$patid, spno = 10, admidate = '2011-12-31', discharged = '2012-03-01', icd = 'Z30.2' )
  #add_hes_hospital(patid = patient$patid, spno = 10, admidate = '2011-01-01', discharged = '2012-03-01')
  #add_hes_linkage_eligibility(patid = patient$patid, pracid = patient$pracid, linkdate = '2013-01-01', hes_e = 1)
  #expect_procedure_occurrence(person_id = patient$person_id, procedure_date='2011-12-31', procedure_source_value = 'Z30.2',
  #                            procedure_concept_id=4163273, procedure_type_concept_id=38000183, visit_occurrence_id=10,
  #                            provider_id=NULL, procedure_source_concept_id=45609921)


  # 9) --inside HES obs period from HES_diagnosis_epi - provider NULL
  #patient <- createPatient();
  #declareTest("inside HES obs period from HES_diagnosis_epi",
  #            source_pid = patient$patid, cdm_pid = patient$person_id)
  #add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01', pracid = patient$pracid)
  #add_hes_diagnosis_epi(patid = patient$patid, spno = 11, epikey = 2517497, epistart = '2012-01-31',
  #                      epiend = '2012-01-31', d_order = 1, icd = 'Z70.1')
  #add_hes_hospital(patid = patient$patid, spno = 11, admidate = '2012-01-01', discharged = '2012-03-01')
  #add_hes_linkage_eligibility(patid = patient$patid, pracid = patient$pracid, linkdate = '2013-01-01', hes_e = 1)
  #add_hes_episodes(patid = patient$patid, spno = 11, epikey = 2517497, epistart = '2012-01-31', epiend = '2012-01-31',
  #                 tretspef = 250, pconsult = 'T88888')
  #expect_procedure_occurrence(person_id = patient$person_id, procedure_date='2012-01-31', procedure_source_value = 'Z70.1',
  #                            procedure_concept_id=4254477, procedure_type_concept_id=38000184,
  #                            visit_occurrence_id=11, provider_id=5000000004, procedure_source_concept_id=45576175)

  # 10) invalid: --outside HES diagnosis period HES_diagnosis_epi
  #patient <- createPatient();
  #declareTest("outside HES diagnosis period HES_diagnosis_epi",
  #            source_pid = patient$patid, cdm_pid = patient$person_id)
  #add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01', pracid = patient$pracid)
  #add_hes_diagnosis_epi(patid = patient$patid, spno = 11, epikey = 2517498, epistart = '2013-01-31',
  #                      epiend = '2013-01-31', d_order = 1, icd = 'Z36.5')
  #add_hes_hospital(patid = patient$patid, spno = 11, admidate = '2012-01-01', discharged = '2012-03-01')
  #add_hes_linkage_eligibility(patid = patient$patid, pracid = patient$pracid, linkdate = '2013-01-01', hes_e = 1)
  #expect_no_procedure_occurrence(person_id = patient$person_id)

  # 11)--inside HES diagnosis period HES_procedures_epi - provider id null
  #patient <- createPatient();
  #declareTest("inside HES diagnosis period HES_procedures_epi",
  #            source_pid = patient$patid, cdm_pid = patient$person_id)
  #add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01', pracid = patient$pracid)
  #add_hes_procedures_epi(patid = patient$patid, spno = 11, epikey = 2517496, epistart = '2012-01-31',
  #                       epiend = '2012-01-31', evdate = '2012-01-31', opcs = 'A032', p_order = 2)
  #add_hes_hospital(patid = patient$patid, spno = 11, admidate = '2012-01-01', discharged = '2012-03-01')
  #add_hes_linkage_eligibility(patid = patient$patid, pracid = patient$pracid, linkdate = '2013-01-01', hes_e = 1)
  #add_hes_episodes(patid = patient$patid, spno = 11, epikey = 2517496, epistart = '2012-01-31', epiend = '2012-01-31',
  #                 tretspef = 250, pconsult = 'T88888')
  #expect_procedure_occurrence(person_id = patient$person_id, procedure_date='2012-01-31', procedure_source_value ='A032',
  #                            procedure_concept_id=44508236, procedure_type_concept_id=38000185,
  #                            visit_occurrence_id=11, provider_id=5000000004, procedure_source_concept_id=44508236)

  # 12) invalid --outside HES diagnosis period HES_procedures_epi
  #patient <- createPatient();
  #declareTest("outside HES diagnosis period HES_procedures_epi",
  #            source_pid = patient$patid, cdm_pid = patient$person_id)
  #add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01', pracid = patient$pracid)
  #add_hes_procedures_epi(patid =patient$patid, spno = 11, epikey = 2517495, epistart = '2013-01-31',
  #                       epiend = '2013-01-31', evdate = '2013-01-31', opcs = 'T903', p_order = 3)
  #add_hes_hospital(patid = patient$patid, spno = 11, admidate = '2012-01-01', discharged = '2012-03-01')
  #add_hes_linkage_eligibility(patid = patient$patid, pracid = patient$pracid, linkdate = '2013-01-01', hes_e = 1)
  #add_hes_episodes(patid = patient$patid, spno = 11, epikey = 2517495, epistart = '2013-01-31', epiend = '2013-01-31',
  #                 tretspef = 250, pconsult = 'T88888')
  #expect_no_procedure_occurrence(person_id = patient$person_id)

}
