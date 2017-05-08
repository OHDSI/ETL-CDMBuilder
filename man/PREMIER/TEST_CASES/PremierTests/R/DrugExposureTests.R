createDrugExposureTests <- function () {

  # PATCPT.CPT_CODE HCPCS
  patient <- createPatient();
  visit <- createVisit();
  declareTest(description="HCPCS record to drug_exposure table", source_pid=patient$medrec_key, cdm_pid = patient$person_id);
  add_pat(medrec_key   = patient$medrec_key,
          pat_key      = visit$pat_key,
          adm_date     = "2010-04-01",
          disc_date    = "2010-04-01",
          disc_mon_seq = 1);
  add_patbill(pat_key  = visit$pat_key,
              serv_day = 1);
  add_patcpt(pat_key  = visit$pat_key,
             cpt_code = "J9310");
  expect_drug_exposure(person_id                = patient$person_id,
                       visit_occurrence_id      = visit$visit_occurrence_id,
                       drug_concept_id          = 46275076,
                       drug_exposure_start_date = "2010-04-01",
                       drug_source_value        = "J9310");

  # PATCPT.CPT_CODE CPT4
  patient <- createPatient();
  visit <- createVisit();
  declareTest(description="CPT4 record to drug_exposure table", source_pid=patient$medrec_key, cdm_pid = patient$person_id);
  add_pat(medrec_key   = patient$medrec_key,
          pat_key      = visit$pat_key,
          adm_date     = "2010-06-01",
          disc_date    = "2010-06-01",
          disc_mon_seq = 1);
  add_patbill(pat_key  = visit$pat_key,
              serv_day = 1);
  add_patcpt(pat_key  = visit$pat_key,
             cpt_code = "90687");
  expect_drug_exposure(person_id                = patient$person_id,
                       visit_occurrence_id      = visit$visit_occurrence_id,
                       drug_concept_id          = 44816519,
                       drug_exposure_start_date = "2010-06-01",
                       drug_source_value        = "90687");

  # PATBILL.STD_CHG_CODE
  patient <- createPatient();
  visit1 <- createVisit();
  visit2 <- createVisit();
  declareTest(description="STD_CHG_CODE record to drug_exposure table with date logic", source_pid=patient$medrec_key, cdm_pid = patient$person_id);
  add_pat(medrec_key   = patient$medrec_key,
          pat_key      = visit1$pat_key,
          adm_date     = "2011-08-01",
          disc_date    = "2011-08-01",
          disc_mon_seq = 1);
  add_patbill(pat_key  = visit1$pat_key,
              serv_day = 10);
  add_pat(medrec_key   = patient$medrec_key,
          pat_key      = visit2$pat_key,
          adm_date     = "2011-08-01",
          disc_date    = "2011-08-01",
          disc_mon_seq = 2);
  add_patbill(pat_key      = visit2$pat_key,
              std_chg_code = as.numeric(Sys.getenv("std_chg_code_8")),
              serv_day     = 4);
  add_patbill(pat_key      = visit2$pat_key,
              serv_day     = 11);
  expect_drug_exposure(person_id                = patient$person_id,
                       visit_occurrence_id      = visit2$visit_occurrence_id,
                       drug_concept_id          = 19045159,
                       drug_exposure_start_date = "2011-08-14")

}
