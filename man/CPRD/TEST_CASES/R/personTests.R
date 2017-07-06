createPersonTests <- function()
{
  #=======================================================================
  add_practice(pracid = 111, region=5, uts='2010-01-01', lcd= '2013-01-01')
  add_practice(pracid = 112, region=5, uts='2008-01-01', lcd= '2014-01-01')
  add_practice(pracid = 113, region=5, uts='2013-01-01', lcd= '2012-12-01')
  add_practice(pracid = 114, region=5, uts='2001-01-01', lcd= '2012-12-01')


  # adding patients
  # observation start is max(uts crd), observation end is min (deathdate lcd todate ) - lcd is always non-null
  #=======================================================================
  # 1) - invalid: accept must be 1
  patient <- createPatient();
  declareTest("accept is 0 so should be deleted",source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid=patient$patid,gender=1, yob=199, mob=1, accept=0, crd='2010-01-01', deathdate=NULL, tod=NULL, pracid=patient$pracid)
  expect_no_person(person_id = patient$person_id)

  # can test accept =1 with other tests:
  # 2) + valid
  patient <- createPatient();
  declareTest("valid",source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid=patient$patid,gender=1, yob=199, mob=1, accept=1, crd='2010-01-01', deathdate=NULL, tod=NULL, pracid=patient$pracid)
  expect_person(person_id = patient$person_id, year_of_birth = 1999, month_of_birth = 1, care_site_id = patient$pracid, gender_concept_id = 8507,
                person_source_value = patient$patid, gender_source_value = 1)

  # 3) - invalid: crd > deathdate
  patient <- createPatient(pracid=112);
  declareTest("invalid: delete because crd 2013-01-01 > deathdate 2012-01-01",source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid=patient$patid,gender=1, yob=199, mob=1, accept=1, crd='2013-01-01', deathdate='2012-01-01', tod=NULL,
              pracid=patient$pracid)
  expect_no_person(person_id = patient$person_id)


  # 4) - invalid: crd > todate
  patient <- createPatient(pracid=112);
  declareTest("invalid: delete because crd 2013-01-01 > todate 2011-05-03",source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid=patient$patid,gender=1, yob=199, mob=1, accept=1, crd='2013-01-01', deathdate=NULL, tod='2011-05-03',
              pracid=patient$pracid)
  expect_no_person(person_id = patient$person_id)

  # 5) - invalid: uts < lcd
  patient <- createPatient(pracid=113);
  declareTest("invalid: delete because uts 2013-01-01 < lcd 2012-12-01",source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid=patient$patid,gender=1, yob=199, mob=1, accept=1, crd='2008-01-01', deathdate='2014-01-01', tod=NULL,
              pracid=patient$pracid)
  expect_no_person(person_id = patient$person_id)

  # 6) + valid but mob =0 then MONTH_OF_BIRTH=NULL
  patient <- createPatient();
  declareTest("valid but mob =0 then MONTH_OF_BIRTH=NULL",source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid=patient$patid,gender=1, yob=199, mob=0, accept=1, crd='2008-01-01', deathdate='2014-01-01', tod=NULL,
              pracid=patient$pracid)
  expect_person(person_id = patient$person_id, year_of_birth = 1999, month_of_birth = NULL, care_site_id = patient$pracid, gender_concept_id = 8507,
                person_source_value = patient$patid, gender_source_value = 1)

  # 7) - invalid: make sure no invalid yob (99 or less, 2014)
  patient <- createPatient(pracid=112);
  declareTest("invalid year of birth 99",source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid=patient$patid,gender=1, yob=99, mob=0, accept=1, crd='2008-01-01', deathdate='2014-01-01', tod=NULL,
              pracid=patient$pracid)
  expect_no_person(person_id = patient$person_id)

  # 8) + valid - test gender 0-4 (1=MALE, 2=FEMALE, others=UNKNOWN)
  patient <- createPatient(pracid=114);
  declareTest("valid gender female",source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid=patient$patid,gender=2, yob=195, mob=6, accept=1, crd='2006-01-01', deathdate=NULL, tod=NULL,
              pracid=patient$pracid)
  expect_person(person_id = patient$person_id, year_of_birth = 1995, month_of_birth = 6, care_site_id = patient$pracid, gender_concept_id = 8532,
                person_source_value = patient$patid, gender_source_value = 2)

  # 9) + valid unknown gender
  patient <- createPatient(pracid=114);
  declareTest("valid not entered gender",source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid=patient$patid,gender=0, yob=195, mob=6, accept=1, crd='2006-01-01', deathdate=NULL, tod=NULL,
              pracid=patient$pracid)
  expect_person(person_id = patient$person_id, year_of_birth = 1995, month_of_birth = 6, care_site_id = patient$pracid, gender_concept_id = 8551,
                person_source_value = patient$patid, gender_source_value = 0)

  # 10) + valid
  patient <- createPatient(pracid=114);
  declareTest("valid Indeterminate gender",source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid=patient$patid,gender=3, yob=195, mob=6, accept=1, crd='2006-01-01', deathdate=NULL, tod=NULL,
              pracid=patient$pracid)
  expect_person(person_id = patient$person_id, year_of_birth = 1995, month_of_birth = 6, care_site_id = patient$pracid, gender_concept_id = 8551,
                person_source_value = patient$patid, gender_source_value = 3)

  # 11) + valid
  patient <- createPatient(pracid=114);
  declareTest("valid unknown gender",source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid=patient$patid,gender=4, yob=195, mob=6, accept=1, crd='2006-01-01', deathdate=NULL, tod=NULL,
              pracid=patient$pracid)
  expect_person(person_id = patient$person_id, year_of_birth = 1995, month_of_birth = 6, care_site_id = patient$pracid, gender_concept_id = 8551,
                person_source_value = patient$patid, gender_source_value = 4)



  # test race:
  # 12) + valid
  patient <- createPatient(pracid=114);
  declareTest("valid chinese race",source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid=patient$patid,gender=1, yob=195, mob=6, accept=1, crd='2006-01-01', deathdate=NULL, tod=NULL,
              pracid=patient$pracid)
  add_hes_patient(patid=patient$patid, ethnos='Chinese')
  expect_person(person_id = patient$person_id, year_of_birth = 1995, month_of_birth = 6, care_site_id = patient$pracid, gender_concept_id = 8507,
                person_source_value = patient$patid, gender_source_value = 1, race_concept_id =38003579, race_source_value = 'Chinese')


  # 13  valid
  patient <- createPatient(pracid=114);
  declareTest("valid Bangladesi race",source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid=patient$patid,gender=1, yob=195, mob=6, accept=1, crd='2006-01-01', deathdate=NULL, tod=NULL,
              pracid=patient$pracid)
  add_hes_patient(patid=patient$patid, ethnos='Bangladesi')
  expect_person(person_id = patient$person_id, year_of_birth = 1995, month_of_birth = 6, care_site_id =patient$pracid, gender_concept_id = 8507,
                person_source_value = patient$patid, gender_source_value = 1, race_concept_id =38003575, race_source_value = 'Bangladesi')

  # 14  valid
  patient <- createPatient(pracid=114);
  declareTest("valid Pakistani race",source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid=patient$patid,gender=1, yob=195, mob=6, accept=1, crd='2006-01-01', deathdate=NULL, tod=NULL,
              pracid=patient$pracid)
  add_hes_patient(patid=patient$patid, ethnos='Pakistani')
  expect_person(person_id = patient$person_id, year_of_birth = 1995, month_of_birth = 6, care_site_id = patient$pracid, gender_concept_id = 8507,
                person_source_value = patient$patid, gender_source_value = 1, race_concept_id =38003589, race_source_value = 'Pakistani')

  # 15  valid
  patient <- createPatient(pracid=114);
  declareTest("valid Unknown race",source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid=patient$patid,gender=1, yob=195, mob=6, accept=1, crd='2006-01-01', deathdate=NULL, tod=NULL,
              pracid=patient$pracid)
  add_hes_patient(patid=patient$patid, ethnos='Unknown')
  expect_person(person_id = patient$person_id, year_of_birth = 1995, month_of_birth = 6, care_site_id = patient$pracid, gender_concept_id = 8507,
                person_source_value = patient$patid, gender_source_value = 1, race_concept_id =8552, race_source_value = 'Unknown')

  # 16  valid
  patient <- createPatient(pracid=114);
  declareTest("valid Oth_Asian race",source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid=patient$patid,gender=1, yob=195, mob=6, accept=1, crd='2006-01-01', deathdate=NULL, tod=NULL,
              pracid=patient$pracid)
  add_hes_patient(patid=patient$patid, ethnos='Oth_Asian')
  expect_person(person_id = patient$person_id, year_of_birth = 1995, month_of_birth = 6, care_site_id = patient$pracid, gender_concept_id = 8507,
                person_source_value = patient$patid, gender_source_value = 1, race_concept_id =8515, race_source_value = 'Oth_Asian')

  # 17  valid
  patient <- createPatient(pracid=114);
  declareTest("valid Mixed race",source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid=patient$patid,gender=1, yob=195, mob=6, accept=1, crd='2006-01-01', deathdate=NULL, tod=NULL,
              pracid=patient$pracid)
  add_hes_patient(patid=patient$patid, ethnos='Mixed')
  expect_person(person_id = patient$person_id, year_of_birth = 1995, month_of_birth = 6, care_site_id = patient$pracid, gender_concept_id = 8507,
                person_source_value = patient$patid, gender_source_value = 1, race_concept_id =8522, race_source_value = 'Mixed')

  # 18  valid
  patient <- createPatient(pracid=114);
  declareTest("valid White race",source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid=patient$patid,gender=1, yob=195, mob=6, accept=1, crd='2006-01-01', deathdate=NULL, tod=NULL,
              pracid=patient$pracid)
  add_hes_patient(patid=patient$patid, ethnos='White')
  expect_person(person_id = patient$person_id, year_of_birth = 1995, month_of_birth = 6, care_site_id = patient$pracid, gender_concept_id = 8507,
                person_source_value = patient$patid, gender_source_value = 1, race_concept_id =8527, race_source_value = 'White')

  # 19  valid
  patient <- createPatient(pracid=114);
  declareTest("valid Bl_Afric race",source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid=patient$patid,gender=1, yob=195, mob=6, accept=1, crd='2006-01-01', deathdate=NULL, tod=NULL,
              pracid=patient$pracid)
  add_hes_patient(patid=patient$patid, ethnos='Bl_Afric')
  expect_person(person_id = patient$person_id, year_of_birth = 1995, month_of_birth = 6, care_site_id = patient$pracid, gender_concept_id = 8507,
                person_source_value = patient$patid, gender_source_value = 1, race_concept_id =38003598, race_source_value = 'Bl_Afric')

  # 20  valid
  patient <- createPatient(pracid=114);
  declareTest("valid Indian race",source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid=patient$patid,gender=1, yob=195, mob=6, accept=1, crd='2006-01-01', deathdate=NULL, tod=NULL,
              pracid=patient$pracid)
  add_hes_patient(patid=patient$patid, ethnos='Indian')
  expect_person(person_id = patient$person_id, year_of_birth = 1995, month_of_birth = 6, care_site_id = patient$pracid, gender_concept_id = 8507,
                person_source_value = patient$patid, gender_source_value = 1, race_concept_id =38003574, race_source_value = 'Indian')

  # 21  valid
  patient <- createPatient(pracid=114);
  declareTest("valid Bl_Other race",source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid=patient$patid,gender=1, yob=195, mob=6, accept=1, crd='2006-01-01', deathdate=NULL, tod=NULL,
              pracid=patient$pracid)
  add_hes_patient(patid=patient$patid, ethnos='Bl_Other')
  expect_person(person_id = patient$person_id, year_of_birth = 1995, month_of_birth = 6, care_site_id = patient$pracid, gender_concept_id = 8507,
                person_source_value = patient$patid, gender_source_value = 1, race_concept_id =38003598, race_source_value = 'Bl_Other')

  # 22  valid
  patient <- createPatient(pracid=114);
  declareTest("valid Bl_Carib race",source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid=patient$patid,gender=1, yob=195, mob=6, accept=1, crd='2006-01-01', deathdate=NULL, tod=NULL,
              pracid=patient$pracid)
  add_hes_patient(patid=patient$patid, ethnos='Bl_Carib')
  expect_person(person_id = patient$person_id, year_of_birth = 1995, month_of_birth = 6, care_site_id = patient$pracid, gender_concept_id = 8507,
                person_source_value = patient$patid, gender_source_value = 1, race_concept_id =38003598, race_source_value = 'Bl_Carib')

  # 23  valid
  patient <- createPatient(pracid=114);
  declareTest("valid Other race",source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid=patient$patid,gender=1, yob=195, mob=6, accept=1, crd='2006-01-01', deathdate=NULL, tod=NULL,
              pracid=patient$pracid)
  add_hes_patient(patid=patient$patid, ethnos='Other')
  expect_person(person_id = patient$person_id, year_of_birth = 1995, month_of_birth = 6, care_site_id = patient$pracid, gender_concept_id = 8507,
                person_source_value = patient$patid, gender_source_value = 1, race_concept_id =8522, race_source_value = 'Other')



}
