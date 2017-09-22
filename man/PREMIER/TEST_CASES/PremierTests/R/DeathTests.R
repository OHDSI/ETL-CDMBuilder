createDeathTests <- function () {

  # note death.death_date = visit_occurrence.visit_end_date

  patient <- createPatient();
  visit1 <- createVisit();
  declareTest(description = "Death from PAT.DISC_STATUS without PATICD.ICD_CODE death codes",
              source_pid  = patient$medrec_key,
              cdm_pid     = patient$person_id);
  add_pat(medrec_key   = patient$medrec_key,
          pat_key      = visit1$pat_key,
          adm_date     = "2010-10-01",
          disc_date    = "2010-10-01",
          disc_mon_seq = 1,
          disc_status  = 20);
  add_patbill(pat_key  = visit1$pat_key,
              serv_day = 4)
  expect_death(person_id             = patient$person_id,
               death_type_concept_id = 38003566,
               death_date            = '2010-10-04');

  patient <- createPatient();
  visit1 <- createVisit();
  declareTest(description = "Death from PAT.DISC_STATUS with PATICD.ICD_CODE death code, use DISC_STATUS",
              source_pid  = patient$medrec_key,
              cdm_pid     = patient$person_id);
  add_pat(medrec_key   = patient$medrec_key,
          pat_key      = visit1$pat_key,
          adm_date     = "2010-10-01",
          disc_date    = "2010-10-01",
          disc_mon_seq = 1,
          disc_status  = 20);
  add_patbill(pat_key  = visit1$pat_key,
              serv_day = 4)
  add_paticd_diag(pat_key     = visit1$pat_key,
                  icd_version = 10,
                  icd_code    = "G93.82")
  expect_death(person_id             = patient$person_id,
               death_type_concept_id = 38003566,
               death_date            = '2010-10-04');


  patient <- createPatient();
  visit1 <- createVisit();
  declareTest(description = "Death PATICD.ICD_CODE death code",
              source_pid  = patient$medrec_key,
              cdm_pid     = patient$person_id);
  add_pat(medrec_key   = patient$medrec_key,
          pat_key      = visit1$pat_key,
          adm_date     = "2010-10-01",
          disc_date    = "2010-10-01",
          disc_mon_seq = 1,
          disc_status  = 99);
  add_patbill(pat_key  = visit1$pat_key,
              serv_day = 4);
  add_paticd_diag(pat_key     = visit1$pat_key,
                  icd_version = 10,
                  icd_code    = "G93.82");
  expect_death(person_id             = patient$person_id,
               death_type_concept_id = 38003567,
               death_date            = '2010-10-04');

  patient <- createPatient();
  visit1 <- createVisit();
  visit2 <- createVisit();
  declareTest(description = "No records populated >32 days after death",
              source_pid  = patient$medrec_key,
              cdm_pid     = patient$person_id);
  add_pat(medrec_key   = patient$medrec_key,
          pat_key      = visit1$pat_key,
          adm_date     = "2010-10-01",
          disc_date    = "2010-10-01",
          disc_mon_seq = 1,
          disc_status  = 20);
  add_patbill(pat_key  = visit1$pat_key,
              serv_day = 4);
  add_pat(medrec_key   = patient$medrec_key,
          pat_key      = visit2$pat_key,
          adm_date     = "2011-01-01",
          disc_date    = "2011-01-01",
          disc_mon_seq = 1,
          disc_status  = 99);
  add_patbill(pat_key  = visit2$pat_key,
              serv_day = 1);
  expect_death(person_id             = patient$person_id,
               death_type_concept_id = 38003566,
               death_date            = '2010-10-04');
  expect_no_visit_occurrence(person_id           = patient$person_id,
                             visit_occurrence_id = visit2$visit_occurrence_id,
                             visit_start_date    = '2011-01-01',
                             visit_end_date      = '2011-01-01')


}
