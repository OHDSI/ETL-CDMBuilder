createMeasurementTests <- function()
{
  patient <- createPatient();
  # 1) /*Patient has famnum*/
  declareTest('Patient has famnum',source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01',
              pracid = patient$pracid, famnum = 1764)
  expect_measurement(person_id = patient$person_id, measurement_date='2010-01-01', measurement_type_concept_id=44818704,
                     measurement_source_value='1764', measurement_concept_id=44786681)

  # 2) /*Patient has NULL famnum*/
  patient <- createPatient();
  declareTest('Patient has famnum',source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01',
              pracid = patient$pracid, famnum = NULL)
  expect_no_measurement(person_id = patient$person_id)


  # 3) /*Patient has NULL marital*/
  patient <- createPatient();
  declareTest('Patient has NULL marital',source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01',
              pracid = patient$pracid, marital = NULL)
  expect_no_measurement(person_id = patient$person_id)

  # 4) /*Patient has marital=2*/
  patient <- createPatient();
  declareTest('Patient has marital=2',source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01',
              pracid = patient$pracid, marital = 2)
  expect_measurement(person_id = patient$person_id, measurement_date='2010-01-01', measurement_type_concept_id=44818704,
                     measurement_source_value='2', measurement_concept_id=40766231, value_as_concept_id=45876756,
                     value_source_value='Married')


  # 5) /*Patient has marital=7*/
  patient <- createPatient();
  declareTest( 'Patient has marital=7',source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01',
              pracid = patient$pracid, marital = 7)
  expect_measurement(person_id = patient$person_id, measurement_date='2010-01-01', measurement_type_concept_id=44818704,
                     measurement_source_value='7', measurement_concept_id=40766231, value_as_concept_id=4204399,
                     value_source_value='Engaged')

  # 6) /*Patient has famnum and marital=5*/
  patient <- createPatient();
  declareTest('1) Patient has famnum and marital=5',source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01',
              pracid = patient$pracid, marital = 5, famnum = 1802)
  expect_measurement(person_id = patient$person_id, measurement_source_value='1802', measurement_concept_id=44786681)
  declareTest('2) Patient has famnum and marital=5')
  expect_measurement(person_id = patient$person_id, measurement_source_value='5', measurement_concept_id=40766231,
                     value_as_concept_id=45884459, value_source_value='Separated')

  ##=========================================================================================
  add_medical(medcode = 445, read_code = '8I3F.00')


  # 7) -- clinical procedure with visit
  patient <- createPatient();
  declareTest('clinical procedure with visit',source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01',
              pracid = patient$pracid)
  add_clinical(patid = patient$patid, eventdate = '2012-01-01', medcode = 445, staffid = 1001)
  add_consultation(patid = patient$patid, eventdate = '2012-01-01', staffid = 9001)
  add_hes_hospital(patid = patient$patid, spno = 5, admidate = '2012-01-01')
  expect_measurement(person_id = patient$person_id, measurement_concept_id =  40487136,
                     measurement_date =  '2012-01-01',  measurement_type_concept_id =  38000245,
                     provider_id =   1001, visit_occurrence_id =  (as.integer(patient$patid)*100000000 + (2012*10000) +  (1* 100) + 1),
                     measurement_source_value =  '8I3F.00', measurement_source_concept_id =  45442740)


  # 8) Now testing without hes to give visit_occurrence_id is null - clinical procedure without visit
  patient <- createPatient();
  declareTest('testing without hes to give visit_occurrence_id is null - clinical procedure without visit',
              source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01',
              pracid = patient$pracid)
  add_clinical(patid = patient$patid, eventdate = '2012-01-01', medcode = 445, staffid = 1001)
  expect_measurement(person_id = patient$person_id, measurement_concept_id =  40487136,
                     measurement_date =  '2012-01-01',  measurement_type_concept_id =  38000245,
                     provider_id =   1001, visit_occurrence_id =  NULL,
                     measurement_source_value =  '8I3F.00', measurement_source_concept_id =  45442740)


  # 9) --invalid: Now test gold observation outside patient observation to exclude
  patient <- createPatient();
  declareTest('Now test gold observation outside patient observation to exclude',
              source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01',
              pracid = patient$pracid)
  add_clinical(patid = patient$patid, eventdate = '2009-01-01', medcode = 445, staffid = 1001)
  add_consultation(patid = patient$patid, eventdate = '2009-01-01', staffid = 9001)
  add_hes_hospital(patid = patient$patid, spno = 5, admidate = '2009-01-01')
  expect_no_measurement(person_id = patient$person_id)


  # 10) immunisation procedure
  patient <- createPatient();
  declareTest( 'immunisation proceduret',source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01',
              pracid = patient$pracid)
  add_immunisation(patid = patient$patid, eventdate = '2011-03-01', medcode = 445, staffid = 1001)
  expect_measurement(person_id = patient$person_id, measurement_concept_id =  40487136,#4064622,
                     measurement_date =  '2011-03-01',  measurement_type_concept_id =  38000280,
                     provider_id =   1001, visit_occurrence_id =  NULL,
                     measurement_source_value =  '8I3F.00', measurement_source_concept_id =  45442740)


  # 11) referral procedure
  patient <- createPatient();
  declareTest('referral procedure',source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01',
              pracid =patient$pracid)
  add_referral(patid = patient$patid, eventdate = '2011-03-01', medcode = 445, staffid = 1001)
  expect_measurement(person_id = patient$person_id, measurement_concept_id =  40487136,#4064622,
                     measurement_date =  '2011-03-01',  measurement_type_concept_id =   42898140,
                     provider_id =   1001, visit_occurrence_id =  NULL,
                     measurement_source_value =  '8I3F.00', measurement_source_concept_id =  45442740)

  # 12) test procedure
  patient <- createPatient();
  declareTest('test procedure',source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01',
              pracid = patient$pracid)
  add_test(patid = patient$patid, eventdate = '2011-03-01', medcode = 445, staffid = 1001)
  expect_measurement(person_id = patient$person_id, measurement_concept_id =  40487136,#4064622,
                     measurement_date =  '2011-03-01',  measurement_type_concept_id =   38000280,
                     provider_id =   1001, visit_occurrence_id =  NULL)


  #================================================================

  # !!!!!!!  133 missing??


  #================================================================
  # 13) ICD10 codes from HES_primary_diag_hosp, entire hosp within HES obs period
  patient <- createPatient();
  declareTest('ICD10 codes from HES_primary_diag_hosp, entire hosp within HES obs period',source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01',
              pracid = patient$pracid)
  add_hes_primary_diag_hosp(patid = patient$patid, spno = 10, admidate = '2012-01-01', discharged = '2012-03-01',
                            icd = 'Z01.7')
  add_hes_hospital(patid = patient$patid, spno = 10, admidate = '2012-01-01', discharged = '2012-03-01')
  add_hes_linkage_eligibility(patid = patient$patid, pracid = 111, linkdate = '2013-01-01', hes_e = 1)
  expect_measurement(person_id = patient$person_id, measurement_concept_id = 4034850,
                     measurement_date = '2012-01-01', measurement_type_concept_id =  38000183,
                     visit_occurrence_id = 10, measurement_source_value = 'Z01.7',
                     measurement_source_concept_id =  45556809)




  # 14) invalid --ICD10 codes from HES_primary_diag_hosp, entire hosp not within HES obs period
  patient <- createPatient();
  declareTest('ICD10 codes from HES_primary_diag_hosp, entire hosp not within HES obs period',source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01',
              pracid = patient$pracid)
  add_hes_primary_diag_hosp(patid = patient$patid, spno = 11, admidate = '2012-12-31', discharged = '2013-03-01',
                            icd = 'B22.2')
  add_hes_hospital(patid = patient$patid, spno = 11, admidate = '2012-12-31', discharged = '2013-03-01')
  add_hes_linkage_eligibility(patid = patient$patid, pracid = patient$pracid, linkdate = '2013-01-01', hes_e = 1)
  expect_no_measurement(person_id = patient$person_id)

  # 15) --inside HES obs period from HES_diagnosis_epi
  patient <- createPatient();
  declareTest('ICD10 codes from HES_primary_diag_hosp, entire hosp not within HES obs period',source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01',
              pracid = patient$pracid)
  add_hes_diagnosis_epi(patid = patient$patid, spno = 11, epikey = 2517497, epistart ='2012-01-01',
                        epiend =  '2012-03-01', d_order = 1, icd = 'Z01.7')
  add_hes_hospital(patid = patient$patid, spno = 11, admidate = '2012-01-01', discharged = '2012-03-01')
  add_hes_linkage_eligibility(patid = patient$patid, pracid = patient$pracid, linkdate = '2013-01-01', hes_e = 1)
  add_hes_episodes(patid = patient$patid, spno = 11, epikey = 2517497, epistart ='2012-01-01',
                   epiend =  '2012-03-01', tretspef = 250, pconsult = 'T88888')
  expect_measurement(person_id = patient$person_id, measurement_concept_id = 4034850,
                     measurement_date = '2012-01-01', measurement_type_concept_id =  38000184,
                     visit_occurrence_id = 11, measurement_source_value = 'Z01.7',
                     measurement_source_concept_id =  45556809, provider_id = NULL)

  # 16) invalid - outside HES diagnosis period HES_diagnosis_epi
  patient <- createPatient();
  declareTest('invalid - outside HES diagnosis period HES_diagnosis_epi',source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01',
              pracid = patient$pracid)
  add_hes_diagnosis_epi(patid = patient$patid, spno = 11, epikey = 2517497, epistart = '2012-12-31',
                        epiend = '2013-03-01', d_order = 1, icd = 'H26.9')
  add_hes_hospital(patid = patient$patid, spno = 11, admidate = '2012-12-31', discharged = '2013-03-01')
  add_hes_linkage_eligibility(patid = patient$patid, pracid = patient$pracid, linkdate = '2013-01-01', hes_e = 1)
  add_hes_episodes(patid = patient$patid, spno = 11, epikey = 2517498, epistart = '2012-12-31',
                   epiend = '2013-03-01', tretspef = 250, pconsult = 'T88888')
  expect_no_measurement(person_id = patient$person_id)

  # 17) invalid --HES ICD10 condition not mapped
  patient <- createPatient();
  declareTest('invalid --HES ICD10 condition not mapped',source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01',
              pracid = patient$pracid)
  add_hes_diagnosis_epi(patid = patient$patid, spno = 11, epikey = 2517497, epistart = '2012-01-01',
                        epiend = '2012-03-01', d_order = 1, icd = 'A04.3')
  add_hes_hospital(patid = patient$patid, spno = 11, admidate = '2012-01-01', discharged = '2012-03-01')
  add_hes_linkage_eligibility(patid = patient$patid, pracid = patient$pracid, linkdate = '2013-01-01', hes_e = 1)
  add_hes_episodes(patid = patient$patid, spno = 11, epikey = 2517497, epistart = '2012-01-01',
                   epiend = '2012-03-01', tretspef = 250, pconsult = 'T88888')
  expect_no_measurement(person_id = patient$person_id)



  #=============================================================

  # 18)  -- test observation record 4 fields
  patient <- createPatient();
  declareTest('test observation record 4 fields',source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01',
              pracid = patient$pracid)
  add_test(patid = patient$patid, eventdate = '2012-01-01', medcode = 98196, staffid = 1001, enttype = 209,
           data1 = 9, data2 = NULL, data3 = NULL, data4 = NULL, data5 = NULL, data6 = NULL, data7 = NULL,
           data8_value = NULL, data8_date = NULL)
  expect_measurement(person_id = patient$person_id, measurement_concept_id=3006511,
                     measurement_date='2012-01-01',
                     measurement_type_concept_id=44818702, value_source_value='Normal',
                     measurement_source_value=209, value_as_concept_id=45884153)

  # 19) -- test observation record 7 fields
  patient <- createPatient();
  declareTest('test observation record 7 fields',source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01',
              pracid = patient$pracid)
  add_test(patid = patient$patid, eventdate = '2012-01-01', medcode = 98196, staffid = 1001, enttype = 190,
           data1 = 3, data2 = 3.700, data3 = 1, data4 = 8, data5 = 3.400, data6 = 5.100, data7 = 0,
           data8_value = NULL, data8_date = NULL)
  expect_measurement(person_id = patient$person_id, measurement_concept_id=3005456,
                     measurement_date= '2012-01-01',
                     measurement_type_concept_id=44818702, value_source_value='= 3.700 High',
                     value_as_number=3.7, value_as_concept_id=45876384, operator_concept_id=4172703,
                     range_low=3.4, range_high=5.1, unit_source_value='%')


  # 20) -- test observation record enttype=284
  patient <- createPatient();
  declareTest('test observation record enttype=284',source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01',
              pracid = patient$pracid)
  add_test(patid = patient$patid, eventdate = '2012-01-01', medcode = 98196, staffid = 1001, enttype = 284,
           data1 = 3, data2 = 14.000, data3 = 61.000, data4 = 0, data5 = NULL, data6 = NULL, data7 = 0,
           data8_value = NULL, data8_date = '1998-12-17')
  expect_measurement(person_id = patient$person_id, measurement_concept_id=3011536, measurement_date='2012-01-01',
                     measurement_type_concept_id=44818702, value_source_value='12/17/1998 12:00:00 AM',#17-Dec-1998 00:00:00',
                     measurement_source_value='284-8')


  # 21) -- test observation record enttype=311
  patient <- createPatient();
  declareTest('test observation record enttype=284',source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01',
              pracid = patient$pracid)
  add_test(patid = patient$patid, eventdate = '2012-01-01', medcode = 98196, staffid = 1001, enttype = 311,
           data1 = NULL, data2 = NULL, data3 = NULL, data4 = NULL, data5 = NULL, data6 = NULL, data7 = 1,
           data8_value = NULL, data8_date = NULL)
  expect_measurement(person_id = patient$person_id, measurement_concept_id=3034996, measurement_date='2012-01-01',
                     measurement_type_concept_id=44818702, value_source_value='Wright',
                     measurement_source_value='311-7')

  # 22) -- test observation record enttype=154
  patient <- createPatient();
  declareTest('test observation record enttype=154',source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01',
              pracid = patient$pracid)
  add_test(patid = patient$patid, eventdate = '2012-01-01', medcode = 98196, staffid = 1001, enttype = 154,
           data1 = NULL, data2 = NULL, data3 = NULL, data4 = NULL, data5 = NULL, data6 = NULL, #data7 = 24,
           data8_value = 24, data8_date = NULL)
  expect_measurement(person_id = patient$person_id, measurement_concept_id=0, measurement_date='2012-01-01',
                     measurement_type_concept_id=44818702, value_source_value='24')


  #========================================================================


  # 23) -- additional observation
  patient <- createPatient();
  declareTest('1) additional observation',source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01',
              pracid = patient$pracid)
  add_additional(patid = patient$patid, enttype = 1, adid = 35, data1_value = 80.000, data2_value = 160.000,
                 data3_value = 5.000, data5_value = 3.000)
  add_clinical(patid = patient$patid, eventdate = '2010-01-01', adid = 35)
  add_consultation(patid = patient$patid, eventdate = '2010-01-01', staffid = 1001)
  expect_measurement(person_id=patient$person_id, measurement_date='2010-01-01', value_source_value=80,
                     measurement_source_value='1-1', measurement_type_concept_id=44818701,
                     measurement_concept_id=3004249)
  declareTest( '2) additional observation')
  expect_measurement(person_id=patient$person_id,measurement_date='2010-01-01', value_source_value=160,
                     measurement_source_value='1-2', measurement_type_concept_id=44818701,
                     measurement_concept_id=3012888)

  #observation_table: 3) person_id=1361111;observation_date=2012-01-01; value_as_numbr=5; observation_source_value='1-3'; observation_type _type_concept_id=44818701 4) '1-5' value_source_value='Midline'  )

# 24) -- scores mapped
  patient <- createPatient();
declareTest( 'scores mapped',source_pid = patient$patid, cdm_pid = patient$person_id)
add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01',
            pracid = patient$pracid)
add_additional(patid = patient$patid, enttype = 372, adid = 45, data1_value = 500.000, data2_value = 7913.000,
               data3_value = 1373.000)
add_clinical(patid = patient$patid,  eventdate = '2010-01-01', adid = 45)
add_consultation(patid = patient$patid, eventdate = '2010-01-01', staffid = 1001)
expect_measurement(person_id=patient$person_id, measurement_source_value='372-1373-7913',
                   measurement_concept_id=40769009)

# 25) -- additional observation 114-2
patient <- createPatient();
declareTest('additional observation 114-2',source_pid = patient$patid, cdm_pid = patient$person_id)
add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01',
            pracid = patient$pracid)
add_additional(patid = patient$patid, enttype = 114, adid = 35, data1_date = '2003-12-07', data2_value = 3.00,
               data3_value = 1373.000)
add_clinical(patid = patient$patid,  eventdate = '2010-01-01', adid = 35)
add_consultation(patid = patient$patid, eventdate = '2010-01-01', staffid = 1001)
expect_measurement(person_id=patient$person_id, measurement_source_value='114-2',
                   measurement_concept_id=40767416,value_source_value='miscarriage')

# 26) -- additional observation 60-1 with SUM
patient <- createPatient();
declareTest('additional observation 60-1 with SUM',source_pid = patient$patid, cdm_pid = patient$person_id)
add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01',
            pracid = patient$pracid)
add_additional(patid = patient$patid, enttype = 60, adid = 35, data1_value = 8.000, data2_value = 147.000,
               data3_value = 1373.000)
add_clinical(patid = patient$patid, eventdate = '2010-01-01', adid = 35)
add_consultation(patid = patient$patid, eventdate = '2010-01-01', staffid = 1001)
expect_measurement(person_id=patient$person_id, measurement_source_value='60-1',
                   measurement_concept_id=3048230, value_source_value=8, unit_concept_id=8511,
                   unit_source_value='Week')

}
