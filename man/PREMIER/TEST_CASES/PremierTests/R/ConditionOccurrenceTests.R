createConditionOccurrenceTests <- function () {

  # PATICD_DIAG.ICD_CODE ICD9CM
  patient <- createPatient();
  visit <- createVisit();
  declareTest(description="ICD9CM record from PATICD_DIAG to condition_occurrence table", source_pid=patient$medrec_key, cdm_pid = patient$person_id);
  add_pat(medrec_key   = patient$medrec_key,
          pat_key      = visit$pat_key,
          adm_date     = "2005-01-01",
          disc_date    = "2005-01-01",
          disc_mon_seq = 1);
  add_patbill(pat_key  = visit$pat_key,
              serv_day = 1);
  add_paticd_diag(pat_key     = visit$pat_key,
                  icd_code    = "112.89",
                  icd_version = 9);
  expect_condition_occurrence(person_id              = patient$person_id,
                              visit_occurrence_id    = visit$visit_occurrence_id,
                              condition_concept_id   = 433968,
                              condition_start_date   = "2005-01-01",
                              condition_source_value = '112.89');

  # PATICD_DIAG.ICD_CODE ICD10CM
  patient <- createPatient();
  visit <- createVisit();
  declareTest(description="ICD10CM record from PATICD_DIAG to condition_occurrence table", source_pid=patient$medrec_key, cdm_pid = patient$person_id);
  add_pat(medrec_key   = patient$medrec_key,
          pat_key      = visit$pat_key,
          adm_date     = "2004-03-01",
          disc_date    = "2004-03-01",
          disc_mon_seq = 1);
  add_patbill(pat_key  = visit$pat_key,
              serv_day = 1);
  add_paticd_diag(pat_key     = visit$pat_key,
                  icd_code    = "M05.421",
                  icd_version = 10);
  expect_condition_occurrence(person_id              = patient$person_id,
                              visit_occurrence_id    = visit$visit_occurrence_id,
                              condition_concept_id   = 4116440,
                              condition_start_date   = "2004-03-01",
                              condition_source_value = "M05.421");
  expect_condition_occurrence(person_id              = patient$person_id,
                              visit_occurrence_id    = visit$visit_occurrence_id,
                              condition_concept_id   = 4107913, #map to multiple concepts?
                              condition_start_date   = "2004-03-01",
                              condition_source_value = "M05.421");

  # PATBILL.STD_CHG_CODE
  patient <- createPatient();
  visit <- createVisit();
  declareTest(description="STD_CHG_CODE record to condition_occurrence table with date logic, source value, type", source_pid=patient$medrec_key, cdm_pid = patient$person_id);
  add_pat(medrec_key   = patient$medrec_key,
          pat_key      = visit$pat_key,
          adm_date     = "2012-01-01",
          disc_date    = "2012-01-01",
          disc_mon_seq = 1,
          i_o_ind      = "I");
  add_patbill(pat_key      = visit$pat_key,
              std_chg_code = as.numeric(Sys.getenv("std_chg_code_1")),
              serv_day     = 9,
              hosp_chg_id  = -666);
  add_hospchg(hosp_chg_id   = -666,
              hosp_chg_desc = ""); #intentionally blank
  add_chgmstr(std_chg_code = as.numeric(Sys.getenv("std_chg_code_1")),
              std_chg_desc = "ER POSTERIOR EXTRASCLERAL");
  expect_condition_occurrence(person_id                    = patient$person_id,
                              visit_occurrence_id          = visit$visit_occurrence_id,
                              condition_concept_id         = 4263981,
                              condition_type_concept_id    = 38000186,
                              condition_start_date         = "2012-01-09",
                              condition_source_value = "ER POSTERIOR EXTRASCLERAL / ");


  #POA flag to condition_status_concept_id
  poa_vals <- data.frame(
    icd_poa = c('W', 'Y', '9'),
    concept_id = c('46236988', '46236988', '0'));

  for (i in 1:nrow(poa_vals))
  {
    poa_val <- poa_vals[i,]
    patient <- createPatient();
    visit <- createVisit();
    declareTest(description=paste0("PATICD_DIAG.ICD_POA = ", poa_val$icd_poa, " to CONDITION_STATUS_CONCEPT_ID = ", poa_val$concept_id),
                source_pid=patient$medrec_key, cdm_pid = patient$person_id);
    add_pat(medrec_key   = patient$medrec_key,
            pat_key      = visit$pat_key);
    add_paticd_diag(pat_key = visit$pat_key,
                    icd_poa = as.character(poa_val$icd_poa));
    expect_condition_occurrence(person_id                     = patient$person_id,
                                visit_occurrence_id           = visit$visit_occurrence_id,
                                condition_status_concept_id   = poa_val$concept_id,
                                condition_status_source_value = poa_val$icd_poa);
  }

}
