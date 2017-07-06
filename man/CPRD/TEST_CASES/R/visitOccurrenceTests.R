createVisitOccurrenceTests <- function()
{
  # add Practice
  #=============================================
  add_practice(pracid = 555, region = 11, lcd = '2013-12-31', uts= '2013-01-01')

  declareTest("hes cohort	check the hes cohort is created")
  add_hes_linkage_coverage(data_source = 'hes', start = '1990-01-01', end = '2014-12-31')
  expect_cohort_definition(cohort_definition_id = 224)

  # 1) + valid
  # 501555	Same event date in CONSULTATION has multiple consids	One VISIT_OCCURRENCE record is created;
  #         visit_start_date='2013-02-01'; visit_end_Date='2013-02-01';visit_occurrence_id=50155520130201
  patient <- createPatient(pracid=555);
  declareTest("Same event date in CONSULTATION has multiple consids	One VISIT_OCCURRENCE record is created",
              source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid = patient$patid, gender=1, yob=172, crd='2013-01-01', tod='2013-12-31', accept=1, pracid = patient$pracid)
  add_consultation(patid = patient$patid, eventdate = '2013-02-01', consid=1, staffid = 500)
  add_consultation(patid = patient$patid, eventdate = '2013-02-01', consid=2, staffid = 600)
  expect_visit_occurrence(person_id = patient$person_id, visit_start_date = '2013-02-01', visit_end_date = '2013-02-01',
                          visit_occurrence_id = as.double(patient$patid)*100000000+20130201)#50155520130201)


  # 2) /*502*/ - invalid
  patient <- createPatient(pracid=555);
  declareTest("eventdate in CONSULTATION is NULL	No VISIT_OCCURRENCE record created",
              source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid = patient$patid, gender=1, yob=172, crd='2013-01-01', tod='2013-12-31', accept=1, pracid = patient$pracid)
  add_consultation(patid = patient$patid, eventdate = NULL, consid=1, staffid =NULL)
  expect_no_visit_occurrence(person_id = patient$person_id)

  # 3 /*503*/ - invalid
  patient <- createPatient(pracid=555);
  declareTest("CONSULTATION record occurs outside of a valid OBSERVATION_PERIOD	No VISIT_OCCURRENCE record created",
              source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid = patient$patid, gender=1, yob=172, crd='2013-01-01', tod='2013-12-31', accept=1, pracid = patient$pracid)
  add_consultation(patid = patient$patid, eventdate = '2012-01-01', consid=1, staffid =NULL)
  expect_no_visit_occurrence(person_id = patient$person_id)

  # 4 /*504*/ - invalid
  patient <- createPatient(pracid=555);
  declareTest("HES hospitalization record has null admidate	No VISIT_OCCURRENCE record created",
              source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid = patient$patid, gender=1, yob=172, crd='2013-01-01', tod='2013-12-31', accept=1, pracid = patient$pracid)
  add_hes_hospital(patid=patient$patid, spno=1, discharged = '2013-03-01')
  add_hes_linkage_eligibility(patid = patient$patid, pracid = patient$pracid, linkdate = '2013-01-01', hes_e = 1 )
  expect_no_visit_occurrence(person_id = patient$person_id)
  declareTest("HES cohort created",source_pid = patient$patid, cdm_pid = patient$person_id)
  expect_cohort(cohort_definition_id = 224, subject_id = patient$person_id, cohort_start_date = '2013-01-01',
                cohort_end_date = '2013-12-31')

  # 5 /*505*/ - invalid
  patient <- createPatient(pracid=555);
  declareTest("HES hospitalization record has null discharge date	No VISIT_OCCURRENCE record created",
              source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid = patient$patid, gender=1, yob=172, crd='2013-01-01', tod='2013-12-31', accept=1, pracid = patient$pracid)
  add_hes_hospital(patid=patient$patid, spno=1, admidate = '2013-03-03')
  add_hes_linkage_eligibility(patid = patient$patid, pracid = patient$pracid, linkdate = '2013-01-01', hes_e = 1 )
  expect_no_visit_occurrence(person_id = patient$person_id)
  declareTest("HES cohort created",source_pid = patient$patid, cdm_pid = patient$person_id)
  expect_cohort(cohort_definition_id = 224, subject_id = patient$person_id, cohort_start_date = '2013-01-01',
                cohort_end_date = '2013-12-31')

  # 6 /*506*/ - invalid
  patient <- createPatient(pracid=555);
  declareTest("HES hospitalization record outside of HES observation period	No VISIT_OCCURRENCE record created",
              source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid = patient$patid, gender=1, yob=172, crd='2013-01-01', tod='2013-12-31', accept=1, pracid = patient$pracid)
  add_hes_hospital(patid=patient$patid, spno=1, admidate = '2011-04-15', discharged = '2011-04-20')
  add_hes_linkage_eligibility(patid = patient$patid, pracid = patient$pracid, linkdate = '2013-01-01', hes_e = 1 )
  expect_no_visit_occurrence(person_id = patient$person_id)
  declareTest("HES cohort created",source_pid = patient$patid, cdm_pid = patient$person_id)
  expect_cohort(cohort_definition_id = 224, subject_id = patient$person_id, cohort_start_date = '2013-01-01',
                cohort_end_date = '2013-12-31')

  # 7 /*507*/ + valid
  patient <- createPatient(pracid=555);
  declareTest("HES hospitalization record inside of HES observation period",source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid = patient$patid, gender=1, yob=172, crd='2013-01-01', tod='2013-12-31', accept=1, pracid = patient$pracid)
  add_hes_hospital(patid=patient$patid, spno=1, admidate = '2013-05-05', discharged = '2013-05-12')
  add_hes_linkage_eligibility(patid = patient$patid, pracid = patient$pracid, linkdate = '2013-01-01', hes_e = 1)
  expect_visit_occurrence(person_id = patient$person_id, visit_occurrence_id = 1, visit_start_date = '2013-05-05',
                          visit_end_date = '2013-05-12')
  declareTest("HES cohort created",source_pid = patient$patid, cdm_pid = patient$person_id)
  expect_cohort(cohort_definition_id = 224, subject_id = patient$person_id, cohort_start_date = '2013-01-01',
                cohort_end_date = '2013-12-31')

  #8 /*508*/ - invalid
  patient <- createPatient(pracid=555);
  declareTest("Cohort_start_date after cohort_end_date ",source_pid = patient$patid, cdm_pid = patient$person_id)
  add_patient(patid = patient$patid, gender=1, yob=172, crd='2014-10-31', tod='2014-12-31', accept=1, pracid = patient$pracid)
  add_hes_hospital(patid=patient$patid, spno=1, admidate = '2014-11-05', discharged = '2014-11-12')
  add_hes_linkage_eligibility(patid = patient$patid, pracid = patient$pracid, linkdate = '2013-01-01', hes_e = 1)
  expect_no_visit_occurrence(person_id = patient$person_id)
  declareTest("HES cohort created",source_pid = patient$patid, cdm_pid = patient$person_id)
  expect_no_cohort(subject_id = patient$person_id)

}
