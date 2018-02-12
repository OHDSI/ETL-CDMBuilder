createVisitOccurrenceTests <- function ()
{

  patient <- createPatient()
  declareTest(description = "Creates good visit_occurrence records", id = patient$person_id);
  visit1 <- createVisit();
  visit2 <- createVisit();
  visit3 <- createVisit();
  visit4 <- createVisit();

  add_pat(medrec_key = patient$medrec_key, pat_key = visit1$pat_key,
          adm_date   = "2010-10-01", disc_date = "2010-10-01", disc_mon_seq = 1);
  add_patbill(pat_key = visit1$pat_key, serv_day = 4);

  add_pat(medrec_key = patient$medrec_key, pat_key = visit2$pat_key,
          adm_date   = "2010-10-01", disc_date = "2010-11-01", disc_mon_seq = 1);
  add_patbill(pat_key = visit2$pat_key, serv_day = 10);

  add_pat(medrec_key = patient$medrec_key, pat_key = visit3$pat_key,
          adm_date   = "2011-05-01", disc_date = "2011-05-01", disc_mon_seq = 1);
  add_patbill(pat_key = visit3$pat_key, serv_day = 8);

  add_pat(medrec_key = patient$medrec_key, pat_key = visit4$pat_key,
          adm_date   = "2011-05-01", disc_date = "2011-05-01", disc_mon_seq = 2);
  add_patbill(pat_key = visit4$pat_key, serv_day = 3);

  expect_visit_occurrence(person_id        = patient$person_id, visit_occurrence_id = visit1$visit_occurrence_id,
                          visit_start_date = '2010-10-01', visit_end_date = '2010-10-04');
  expect_visit_occurrence(person_id        = patient$person_id, visit_occurrence_id = visit2$visit_occurrence_id,
                          visit_start_date = '2010-10-23', visit_end_date = '2010-11-01');
  expect_visit_occurrence(person_id        = patient$person_id, visit_occurrence_id = visit3$visit_occurrence_id,
                          visit_start_date = '2011-05-01', visit_end_date = '2011-05-08');
  expect_visit_occurrence(person_id        = patient$person_id, visit_occurrence_id = visit4$visit_occurrence_id,
                          visit_start_date = '2011-05-09', visit_end_date = '2011-05-11');


  # fix for inpatient stays only
  # patient <- createPatient()
  # declareTest(description = "Tests time between subsequent visits using readmit.days_from_prior", id = patient$person_id);
  # visit1 <- createVisit();
  # visit2 <- createVisit();
  #
  # add_pat(medrec_key = patient$medrec_key, pat_key = visit1$pat_key, i_o_ind = 'I', adm_source = 7,
  #         adm_date   = "2000-01-01", disc_date = "2001-10-01", disc_mon_seq = 1);
  # add_patbill(pat_key = visit1$pat_key, serv_day = 7);
  #
  # add_pat(medrec_key = patient$medrec_key, pat_key = visit2$pat_key,  i_o_ind = 'I', adm_source = 7,
  #         adm_date   = "2000-01-01", disc_date = "2001-10-01", disc_mon_seq = 2);
  # add_patbill(pat_key = visit2$pat_key, serv_day = 5);
  # add_readmit(medrec_key = patient$medrec_key, pat_key = visit2$pat_key,
  #             days_from_prior = 7);
  #
  # expect_visit_occurrence(person_id        = patient$person_id, visit_occurrence_id = visit1$visit_occurrence_id,
  #                         visit_start_date = '2000-01-01', visit_end_date = '2000-01-07');
  # expect_visit_occurrence(person_id        = patient$person_id, visit_occurrence_id = visit2$visit_occurrence_id,
  #                         visit_start_date = '2000-01-14', visit_end_date = '2000-01-18');


  vo_tests <- data.frame(
    point_of_origin =             c('0',  '1',  '2',  '3',  '4',  '45',   '46', '5',  '6',  '7',  '8',  '9',  'A',  'B',  'C',  'D',  'E',  'F'),
    admitting_source_concept_id = c(8976, 8844, 8716, 8844, 8717, 581384, 8650, 8863, 8844, 8870, 8844, 8844, 8761, 8536, 8536, 8717, 8883, 8546)
  );
  for (i in 1:nrow(vo_tests))
  {
    vo_test <- vo_tests[i,]
    patient <- createPatient();
    declareTest(description = paste0(
      "point_of_origin: ", vo_test$point_of_origin, " to admitting_source_concept_id: ", vo_test$admitting_source_concept_id), id = patient$person_id);
    visit <- createVisit();
    add_pat(medrec_key = patient$medrec_key, pat_key = visit$pat_key, point_of_origin = vo_test$point_of_origin);
    expect_visit_occurrence(person_id                   = patient$person_id,
                            visit_occurrence_id         = visit$visit_occurrence_id,
                            admitting_source_concept_id = vo_test$admitting_source_concept_id);
  }

  #ER visit to inpatient stay
  patient <- createPatient();
  visit <- createVisit();
  declareTest(description = "ER-to-inpatient stay, pat.adm_date<=2010-06-01", id = patient$person_id);
  add_pat(medrec_key = patient$medrec_key,
          pat_key    = visit$pat_key,
          adm_date   = "2005-01-01",
          adm_source = 7,
          i_o_ind    = 'I');
  expect_visit_occurrence(person_id           = patient$person_id,
                          visit_occurrence_id = visit$visit_occurrence_id,
                          visit_concept_id    = 262);

  patient <- createPatient();
  visit <- createVisit();
  declareTest(description = "ER-to-inpatient stay, pat.adm_date>=2010-07-01", id = patient$person_id);
  add_pat(medrec_key      = patient$medrec_key,
          pat_key         = visit$pat_key,
          adm_date        = "2013-01-01",
          point_of_origin = 7,
          i_o_ind         = 'I');
  expect_visit_occurrence(person_id           = patient$person_id,
                          visit_occurrence_id = visit$visit_occurrence_id,
                          visit_concept_id    = 262);





}
