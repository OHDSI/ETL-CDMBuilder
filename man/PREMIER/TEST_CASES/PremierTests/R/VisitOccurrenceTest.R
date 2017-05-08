createVisitOccurrenceTests <- function () {

  patient <- createPatient()
  declareTest(description = "Creates good visit_occurrence records", source_pid=patient$medrec_key, cdm_pid=patient$person_id);
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

}
