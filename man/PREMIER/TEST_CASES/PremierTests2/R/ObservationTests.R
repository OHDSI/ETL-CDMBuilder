createObservationTests <- function () {

  # PATCPT.CPT_CODE CPT4
  patient <- createPatient();
  visit <- createVisit();
  declareTest(description="CPT4 record to observation table", id = patient$person_id);
  add_pat(medrec_key   = patient$medrec_key,
          pat_key      = visit$pat_key,
          adm_date     = "2010-10-01",
          disc_date    = "2010-10-01",
          disc_mon_seq = 1);
  add_patbill(pat_key  = visit$pat_key,
              serv_day = 1);
  add_patcpt(pat_key  = visit$pat_key,
             cpt_code = '0581F');
  expect_observation(person_id              = patient$person_id,
                     visit_occurrence_id    = visit$visit_occurrence_id,
                     observation_concept_id = 44816517,
                     observation_date       = "2010-10-01");

  # PATCPT.CPT_CODE HCPCS
  patient <- createPatient();
  visit <- createVisit();
  declareTest(description="HCPCS record to observation table", id = patient$person_id);
  add_pat(medrec_key   = patient$medrec_key,
          pat_key      = visit$pat_key,
          adm_date     = "2012-11-01",
          disc_date    = "2012-11-01",
          disc_mon_seq = 1);
  add_patbill(pat_key = visit$pat_key,
              serv_day = 1);
  add_patcpt(pat_key  = visit$pat_key,
             cpt_code = 'G8997');
  expect_observation(person_id              = patient$person_id,
                     visit_occurrence_id    = visit$visit_occurrence_id,
                     observation_concept_id = 43533318,
                     observation_date       = "2012-11-01")

  # PATBILL.STD_CHG_CODE JNJ_PMR_PROC_CHRG_CD
  patient <- createPatient();
  visit <- createVisit();
  declareTest(description="STD_CHG_CODE record to observation table with date logic", id = patient$person_id);
  add_pat(medrec_key   = patient$medrec_key,
          pat_key      = visit$pat_key,
          adm_date     = "2009-07-01",
          disc_date    = "2009-07-01",
          disc_mon_seq = 1);
  add_patbill(pat_key      = visit$pat_key,
              std_chg_code = as.numeric(Sys.getenv("std_chg_code_14")),
              serv_day     = 3,
              hosp_chg_id  = 465860152);
  add_hospchg(hosp_chg_id   = 465860152,
              hosp_chg_desc = "PF HOME VISIT NEW LEVEL 3");
  add_chgmstr(std_chg_code = as.numeric(Sys.getenv("std_chg_code_14")),
              std_chg_desc = "PF HOME VISIT NEW PATIENT");
  expect_observation(person_id                = patient$person_id,
                     visit_occurrence_id      = visit$visit_occurrence_id,
                     observation_concept_id   = 2514486,
                     observation_date         = "2009-07-03",
                     observation_source_value = "PF HOME VISIT NEW PATIENT / PF HOME VISIT NEW LEVEL 3"); #INCREASE LENGTH!

  # PATBILL.STD_CHG_CODE JNJ_PMR_PROC_CHRG_CD; JNJ_PMR_PROC_CHRG_CD codes aren't in chgmstr?

  # PATICD_PROC.ICD_CODE ICD9CM; note same code as below, just diff icd version
  patient <- createPatient();
  visit <- createVisit();
  declareTest(description="ICD9CM record from PATICD_PROC to observation table", id = patient$person_id);
  add_pat(medrec_key   = patient$medrec_key,
          pat_key      = visit$pat_key,
          adm_date     = "2008-05-01",
          disc_date    = "2008-05-01",
          disc_mon_seq = 1);
  add_patbill(pat_key  = visit$pat_key,
              serv_day = 1);
  add_paticd_proc(pat_key     = visit$pat_key,
                  icd_code    = 'V56.3',
                  icd_version = 9);
  expect_observation(person_id                = patient$person_id,
                     visit_occurrence_id      = visit$visit_occurrence_id,
                     observation_concept_id   = 4268532,
                     observation_date         = "2008-05-01",
                     observation_source_value = "V56.3");

  # PATICD_PROC.ICD_CODE ICD10CM; note same code as above, just diff icd version
  patient <- createPatient();
  visit <- createVisit();
  declareTest(description="ICD10CM record from PATICD_PROC to observation table", id = patient$person_id);
  add_pat(medrec_key   = patient$medrec_key,
          pat_key      = visit$pat_key,
          adm_date     = "2008-10-01",
          disc_date    = "2008-10-01",
          disc_mon_seq = 1);
  add_patbill(pat_key  = visit$pat_key,
              serv_day = 1);
  add_paticd_proc(pat_key     = visit$pat_key,
                  icd_code    = 'V56.3',
                  icd_version = 10);
  expect_observation(person_id                = patient$person_id,
                     visit_occurrence_id      = visit$visit_occurrence_id,
                     observation_concept_id   = 435134,
                     observation_date         = "2008-10-01",
                     observation_source_value = "V56.3");

  # PATICD_DIAG.ICD_CODE ICD9CM
  patient <- createPatient();
  visit <- createVisit();
  declareTest(description="ICD9CM record from PATICD_DIAG to observation table", id = patient$person_id);
  add_pat(medrec_key   = patient$medrec_key,
          pat_key      = visit$pat_key,
          adm_date     = "2005-12-01",
          disc_date    = "2005-12-01",
          disc_mon_seq = 1);
  add_patbill(pat_key  = visit$pat_key,
              serv_day = 1);
  add_paticd_diag(pat_key     = visit$pat_key,
                  icd_code    = "E850.3",
                  icd_version = 9);
  expect_observation(person_id                = patient$person_id,
                     visit_occurrence_id      = visit$visit_occurrence_id,
                     observation_concept_id   = 439994,
                     observation_date         = "2005-12-01",
                     observation_source_value = "E850.3");

  # PATICD_DIAG.ICD_CODE ICD10CM
  patient <- createPatient();
  visit <- createVisit();
  declareTest(description="ICD10CM record from PATICD_DIAG to observation table", id = patient$person_id);
  add_pat(medrec_key   = patient$medrec_key,
          pat_key      = visit$pat_key,
          adm_date     = "2004-12-01",
          disc_date    = "2004-12-01",
          disc_mon_seq = 1);
  add_patbill(pat_key  = visit$pat_key,
              serv_day = 1);
  add_paticd_diag(pat_key     = visit$pat_key,
                  icd_code    = "T71.131",
                  icd_version = 10);
  expect_observation(person_id                = patient$person_id,
                     visit_occurrence_id      = visit$visit_occurrence_id,
                     observation_concept_id   = 439470,
                     observation_date         = "2004-12-01",
                     observation_source_value = "T71.131");

  patient <- createPatient();
  visit <- createVisit();
  declareTest(description=paste0("std_chg_code patbill record maps to oservation table"), id = patient$person_id);
  add_pat(medrec_key   = patient$medrec_key,
          pat_key      = visit$pat_key,
          adm_date     = "2004-12-01",
          disc_date    = "2004-12-01",
          disc_mon_seq = 1);
  add_patbill(pat_key      = visit$pat_key,
              serv_day     = 1,
              std_chg_code = as.numeric(Sys.getenv("std_chg_code_15")));
  expect_observation(person_id                = patient$person_id,
                     visit_occurrence_id      = visit$visit_occurrence_id,
                     observation_concept_id   = 2108550,
                     observation_date         = "2004-12-01");

  patient <- createPatient();
  visit <- createVisit();
  declareTest(description="inpatient visit sampling weight field proj_wgt to observation", id = patient$person_id);
  add_pat(medrec_key = patient$medrec_key,
          pat_key    = visit$pat_key,
          i_o_ind    = 'I',
          proj_wgt   = 33.285000);
  expect_observation(person_id                   = patient$person_id,
                     visit_occurrence_id         = visit$visit_occurrence_id,
                     observation_concept_id      = 37392832,
                     observation_type_concept_id = 900000003,
                     value_as_number             = 33.285000);

  patient <- createPatient();
  visit <- createVisit();
  declareTest(description="outpatient visit where proj_wgt=0 does not move to observation", id = patient$person_id);
  add_pat(medrec_key = patient$medrec_key,
          pat_key    = visit$pat_key,
          i_o_ind    = 'O',
          proj_wgt   = 0.000000);
  expect_no_observation(person_id              = patient$person_id,
                        visit_occurrence_id    = visit$visit_occurrence_id,
                        observation_concept_id = 37392832);

}
