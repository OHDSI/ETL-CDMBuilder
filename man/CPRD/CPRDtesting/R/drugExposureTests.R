createDrugExposureTests <- function()
{
  add_product(prodcode = 2, gemscriptcode = '58976020')
  add_product(prodcode = 9999, gemscriptcode = '89535020')
  add_product(prodcode = 46190, gemscriptcode = '99978020')

  # 1) 9100
  patient <- createPatient();
  declareTest('testing the lookup for numdays does correct end date start+28 days',source_pid = patient$patid, cdm_pid = patient$person_id)
  add_daysupply_decodes(prodcode = 2, ndd = 2, qty = 1, numpacks = 0, numdays = 29)
  add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01', pracid= patient$pracid)
  add_therapy(patid =  patient$patid, eventdate = '2012-01-01', prodcode = 2, ndd=2, qty = 1, numpacks = 0,
              issueseq = 1, numdays = 0, staffid = 9001)
  add_consultation(patid =  patient$patid, eventdate = '2012-01-01', staffid = 9001)
  expect_drug_exposure(person_id =  patient$person_id,drug_concept_id = 19073982,
                       drug_source_value = 58976020, quantity = 1, refills = 1,
                       drug_exposure_end_date = '2012-1-29', sig = '2.000')
  expect_count_drug_exposure(person_id = patient$person_id, rowCount = 1)


  # 2) 9101
  patient <- createPatient();
  declareTest('testing when there is no lookup available default to start dte',source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid =  patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01', pracid= patient$pracid)
  add_therapy(patid =  patient$patid, eventdate = '2012-01-01', prodcode = 2, ndd=81, qty = 1, numpacks = 0,
              issueseq = 1, numdays = 0, staffid = 9001)
  add_consultation(patid =  patient$patid, eventdate = '2012-01-01', staffid = 9001)
  expect_drug_exposure(person_id = patient$person_id,drug_concept_id = 19073982, drug_source_value = 58976020, quantity = 1, refills = 1,
                       drug_exposure_end_date = '2012-1-1', sig = '81.000')
  expect_count_drug_exposure(person_id = patient$person_id, rowCount = 1)


  # 3) 9102
  patient <- createPatient();
  declareTest('The drug records comes in without a valid days supply, no lookup in DAYSSUPPLY_DECODES, no lookups in DAYSSUPPLY_MODES, assume 1 day duration.',
              source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid =  patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01', pracid=patient$pracid)
  add_therapy(patid =  patient$patid, eventdate = '2012-01-01', prodcode = 9999, ndd=81, qty = 1, numpacks = 0,
              issueseq = 1, numdays = 0, staffid = 9001)
  add_consultation(patid =  patient$patid, eventdate = '2012-01-01', staffid = 9001)
  expect_drug_exposure(person_id = patient$person_id,drug_source_value = 89535020, quantity = 1, refills = 1,
                       drug_exposure_end_date = '2012-1-1', sig = '81.000')
  expect_count_drug_exposure(person_id = patient$person_id, rowCount = 1)


  # 4) 9103
  patient <- createPatient();
  declareTest('testing end date: You have a THERAPY.NUMDAYS = 40.',source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01', pracid=patient$pracid)
  add_therapy(patid = patient$patid, eventdate = '2012-01-01', prodcode = 2, ndd=2, qty = 1, numpacks = 0,
              issueseq = 1, numdays = 40, staffid = 9001)
  add_consultation(patid = patient$patid, eventdate = '2012-01-01', staffid = 9001)
  expect_drug_exposure(person_id = patient$person_id,drug_concept_id = 19073982, drug_source_value  = 58976020, quantity = 1, refills = 1,
                       drug_exposure_end_date = '2012-2-9', sig = '2.000')
  expect_count_drug_exposure(person_id = patient$person_id, rowCount = 1)


  # 5) 9104
  patient <- createPatient();
  declareTest('testing end date: You have a THERAPY.NUMDAYS = 366 - show correct to 29 days using lookup.',
              source_pid = patient$patid, cdm_pid = patient$person_id)
  #add_daysupply_decodes(prodcode = 2, ndd = 2, qty = 1, numpacks = 0, numdays = 29)
  add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01', pracid=patient$pracid)
  add_therapy(patid = patient$patid, eventdate = '2012-01-01', prodcode = 2, ndd=2, qty = 1, numpacks = 0,
              issueseq = 1, numdays = 366, staffid = 9001)
  add_consultation(patid = patient$patid, eventdate = '2012-01-01', staffid = 9001)
  expect_drug_exposure(person_id = patient$person_id,drug_concept_id = 19073982, drug_source_value  = 58976020, quantity = 1, refills = 1,
                       drug_exposure_end_date = '2012-1-29', sig = '2.000')
  expect_count_drug_exposure(person_id = patient$person_id, rowCount = 1)


  # 6) 9105
  patient <- createPatient();
  declareTest('Test visit_occurrence_id: Drug is written to DRUG_EXPOSURE and the VISIT_OCCURRENCE_ID = patient$patid * 10000000000 + (2012*10000) +  (3* 100) + 12 = 91050020120312 ',
              source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01', pracid=patient$pracid)
  add_therapy(patid = patient$patid, eventdate = '2012-03-12', prodcode = 2, ndd=2, qty = 1, numpacks = 0,
              issueseq = 1, numdays = 366, staffid = 9001)
  add_consultation(patid = patient$patid, eventdate = '2012-03-12', staffid = 9001)
  expect_drug_exposure(person_id = patient$person_id, visit_occurrence_id = (as.integer(patient$patid)*100000000 + (2012*10000) +  (3* 100) + 12), drug_exposure_start_date = '2012-03-12',
                       drug_concept_id = 19073982, drug_source_value  = 58976020, quantity = 1, refills = 1,
                       sig = '2.000')
  expect_count_drug_exposure(person_id = patient$person_id, rowCount = 1)


  # 7) 9106  - invalid
  patient <- createPatient();
  declareTest('Drug date exists in an invalid visit_occurrence (outside practice dates)',source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01', pracid=patient$pracid)
  add_therapy(patid = patient$patid, eventdate = '2016-01-01', prodcode = 2, ndd=2, qty = 1, numpacks = 0,
              issueseq = 1, numdays = 366, staffid = 9001)
  add_consultation(patid = patient$patid, eventdate = '2016-01-01', staffid = 9001)
  expect_no_drug_exposure(person_id = patient$person_id)


  # 8) 9107
  patient <- createPatient();
  declareTest('Drug date does exist within a valid observation period but does not have a consultation date.',
              source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01', pracid=patient$pracid)
  add_therapy(patid = patient$patid, eventdate = '2012-01-01', prodcode = 2, ndd=2, qty = 1, numpacks = 0,
              issueseq = 1, numdays = 366, staffid = 9001)
  expect_drug_exposure(person_id = patient$person_id, visit_occurrence_id = NULL, drug_exposure_start_date = '2012-01-01',
                       drug_concept_id = 19073982, drug_source_value  = 58976020, quantity = 1, refills = 1,
                       drug_exposure_end_date = '2012-1-29', sig = '2.000')
  expect_count_drug_exposure(person_id = patient$person_id, rowCount = 1)

  # 9) 9108 - invalid
  patient <- createPatient();
  declareTest('PRODCODE = -1 - invalid.',source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01', pracid=patient$pracid)
  add_therapy(patid = patient$patid, eventdate = '2012-01-01', prodcode = -1, ndd=2, qty = 1, numpacks = 0,
              issueseq = 1, numdays = 366, staffid = 9001)
  add_consultation(patid = patient$patid, eventdate = '2012-01-01', staffid = 9001)
  expect_no_drug_exposure(person_id = patient$person_id)

  # 10) 9109
  patient <- createPatient();
  declareTest('You have a valid PRODCODE but doesnt get an VOCAB mapping.PRODCODE = 46190.',source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01', pracid=patient$pracid)
  add_therapy(patid = patient$patid, eventdate = '2012-01-01', prodcode = 46190, ndd=2, qty = 1, numpacks = 0,
              issueseq = 1, numdays = 366, staffid = 9001)
  add_consultation(patid = patient$patid, eventdate = '2012-01-01', staffid = 9001)
  expect_drug_exposure(person_id = patient$person_id, drug_concept_id = 0, drug_source_value =  99978020,
                       drug_exposure_start_date = '2012-01-01')
  expect_count_drug_exposure(person_id = patient$person_id, rowCount = 1)



  #==============================================================================


  add_medical(medcode = 72, read_code = '65F5.00')
  add_medical(medcode = 28, read_code = '6564.00')
  add_medical(medcode = 58, read_code = '65B..00')
  # add 1058 a condition code?

  # 11) -- invalid status
  patient <- createPatient();
  declareTest('Invalid status',source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01', pracid=patient$pracid)
  add_immunisation(patid = patient$patid, eventdate = '2012-01-01',medcode = 72, staffid = 1001, status=4)
  expect_no_drug_exposure(person_id = patient$person_id)

  # 12) -- immunization with visit -- now goes to procedure
  add_medical(medcode=1, read_code = '65M2.00')
  # old code 65F5.00 goes to 4179181 procedure domain now
  patient <- createPatient();
  declareTest('valid immunization with visit',source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01', pracid=patient$pracid)
  add_immunisation(patid = patient$patid, eventdate = '2012-01-01', medcode = 1, staffid = 1001, status=1)
  add_consultation(patid = patient$patid, eventdate = '2012-01-01', staffid = 9001)
  expect_drug_exposure(person_id = patient$person_id,
                       drug_concept_id = 19136026,
                       drug_source_concept_id = 45432113, drug_source_value = '65M2.00',
                       drug_type_concept_id = 38000179, drug_exposure_start_date = '2012-01-01',
                       drug_exposure_end_date = '2012-01-01', visit_occurrence_id = (as.integer(patient$patid)*100000000 + (2012*10000) +  (1*100) + 1))
  expect_count_drug_exposure(person_id = patient$person_id, rowCount = 1)


  # 13) -- immunization without visit  -- now goes to procedure
  patient <- createPatient();
  declareTest('valid immunization without visit - null visit_occur_id',source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01', pracid=patient$pracid)
  add_immunisation(patid = patient$patid, eventdate = '2012-01-01', medcode = 1, staffid = 1001, status=1)
  expect_drug_exposure(person_id = patient$person_id,
                       drug_concept_id = 19136026,
                       drug_source_concept_id = 45432113, drug_source_value = '65M2.00',
                       drug_type_concept_id = 38000179, drug_exposure_start_date = '2012-01-01',
                       drug_exposure_end_date = '2012-01-01', visit_occurrence_id = NULL)
  expect_count_drug_exposure(person_id = patient$person_id, rowCount = 1)

  # 14) invalid: outside observation period
  patient <- createPatient();
  declareTest('Read  outside observation period',source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01', pracid=patient$pracid)
  add_clinical(patid = patient$patid, eventdate = '2009-03-01', medcode = 1, staffid = 1001)
  expect_no_drug_exposure(person_id = patient$person_id)


  # 14) invalid: outside observation period
  patient <- createPatient();
  declareTest('immunization read code condition goes into conditions',source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01', pracid=patient$pracid)
  add_immunisation(patid = patient$patid, eventdate = '2009-03-01', medcode = 1, staffid = 1001, status = 1)
  expect_no_drug_exposure(person_id = patient$person_id)


  # 15) -- from clinical
  patient <- createPatient();
  declareTest('valid read from clinical',source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01', pracid=patient$pracid)
  add_clinical(patid = patient$patid, eventdate = '2010-03-01', medcode = 1, staffid = 1001)
  expect_drug_exposure(person_id = patient$person_id,
                       drug_concept_id = 19136026,
                       drug_source_concept_id = 45432113, drug_source_value = '65M2.00',
                       drug_type_concept_id=38000178)
  expect_count_drug_exposure(person_id = patient$person_id, rowCount = 1)


  # 16) -- referral
  patient <- createPatient();
  declareTest('valid read from referral',source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01', pracid=patient$pracid)
  add_referral(patid = patient$patid, eventdate = '2010-03-01', medcode = 1, staffid = 1001)
  expect_drug_exposure(person_id = patient$person_id,
                       drug_concept_id = 19136026,
                       drug_source_concept_id = 45432113, drug_source_value = '65M2.00',
                       drug_type_concept_id=38000178)
  expect_count_drug_exposure(person_id = patient$person_id, rowCount = 1)

  # 17) -- test
  patient <- createPatient();
  declareTest( 'valid read from test',source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01', pracid=patient$pracid)
  add_test(patid = patient$patid, eventdate = '2010-03-01', medcode = 1, staffid = 1001)
  expect_drug_exposure(person_id = patient$person_id,
                       drug_concept_id = 19136026,
                       drug_source_concept_id = 45432113, drug_source_value = '65M2.00',
                       drug_type_concept_id=38000178)
  expect_count_drug_exposure(person_id = patient$person_id, rowCount = 1)


  #===========================================================================

  add_medical(medcode = 25169, read_code = '9b20.00')

  # DEVICES

  # 18) valid entry
  patient <- createPatient();
  declareTest( 'valid entry for device exposure',source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01', pracid=patient$pracid)
  add_immunisation(patid = patient$patid, eventdate = '2012-01-01', medcode = 25169, staffid = 1001, status = 1)
  expect_device_exposure(person_id = patient$person_id, device_concept_id=4192787,
                         device_source_value='9b20.00',
                         device_type_concept_id=44818707,
                         device_exposure_start_date='2012-01-01', device_exposure_end_date='2012-01-01')


  # 19) -- clinical
  patient <- createPatient();
  declareTest('valid entry',source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01', pracid=patient$pracid)
  add_clinical(patid = patient$patid, eventdate = '2010-03-01', medcode = 1, staffid = 1001)
  expect_drug_exposure(person_id = patient$person_id,
                       drug_concept_id = 19136026,
                       drug_source_concept_id = 45432113, drug_source_value = '65M2.00',
                       drug_type_concept_id=38000178)
  expect_count_drug_exposure(person_id = patient$person_id, rowCount = 1)

  # device or drug??

  # 20) -- referral
  patient <- createPatient();
  declareTest( 'valid entry',source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01', pracid=patient$pracid)
  add_clinical(patid = patient$patid, eventdate = '2010-03-01', medcode = 1, staffid = 1001)
  expect_drug_exposure(person_id = patient$person_id,
                       drug_concept_id = 19136026,
                       drug_source_concept_id = 45432113, drug_source_value = '65M2.00',
                       drug_type_concept_id=38000178)
  expect_count_drug_exposure(person_id = patient$person_id, rowCount = 1)

  # device or drug??

  # 21) -- test
  patient <- createPatient();
  declareTest('valid entry',source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid = patient$patid, gender = 1, yob = 199, mob = 1, accept = 1, crd = '2010-01-01', pracid=patient$pracid)
  add_test(patid = patient$patid, eventdate = '2010-03-01', medcode = 1, staffid = 1001)
  expect_drug_exposure(person_id = patient$person_id,
                       drug_concept_id = 19136026,
                       drug_source_concept_id = 45432113, drug_source_value = '65M2.00',
                       drug_type_concept_id=38000178)
  expect_count_drug_exposure(person_id = patient$person_id, rowCount = 1)

  # device or drug??




}
