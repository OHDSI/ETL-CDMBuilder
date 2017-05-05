createObservationTests <- function () {

  # PAT.MS_DRG, 1, 2, 3 digit
  patient <- createPatient();
  visit <- createVisit();
  declareTest(description="MS_DRG record (1 digit) to observation table", source_pid=patient$medrec_key, cdm_pid = patient$person_id);
  add_pat(medrec_key   = patient$medrec_key,
          pat_key      = visit$pat_key,
          adm_date     = "2005-01-01",
          disc_date    = "2005-01-01",
          disc_mon_seq = 1,
          ms_drg       = 1);
  add_patbill(pat_key  = visit$pat_key,
              serv_day = 1);
  expect_observation(person_id              = patient$person_id,
                     visit_occurrence_id    = visit$visit_occurrence_id,
                     observation_concept_id = 38000887, #drg=001
                     observation_date       = "2005-01-01");

  patient <- createPatient();
  visit <- createVisit();
  declareTest(description="MS_DRG record (2 digit) to observation table", source_pid=patient$medrec_key, cdm_pid = patient$person_id);
  add_pat(medrec_key   = patient$medrec_key,
          pat_key      = visit$pat_key,
          adm_date     = "2006-01-01",
          disc_date    = "2006-01-01",
          disc_mon_seq = 1,
          ms_drg       = 14);
  add_patbill(pat_key  = visit$pat_key,
              serv_day = 1);
  expect_observation(person_id              = patient$person_id,
                     visit_occurrence_id    = visit$visit_occurrence_id,
                     observation_concept_id = 38000900, #drg=014
                     observation_date       = "2006-01-01");

  patient <- createPatient();
  visit1 <- createVisit();
  visit2 <- createVisit();
  declareTest(description="MS_DRG record (3 digit) to observation table with date logic", source_pid=patient$medrec_key, cdm_pid = patient$person_id);
  add_pat(medrec_key   = patient$medrec_key,
          pat_key      = visit1$pat_key,
          adm_date     = "2011-05-01",
          disc_date    = "2011-05-01",
          disc_mon_seq = 1);
  add_patbill(pat_key = visit1$pat_key,
             serv_day = 8);
  add_pat(medrec_key   = patient$medrec_key,
          pat_key      = visit2$pat_key,
          adm_date     = "2011-05-01",
          disc_date    = "2011-05-01",
          disc_mon_seq = 2,
          ms_drg       = 263);
  add_patbill(pat_key  = visit2$pat_key,
              serv_day = 3);
  expect_observation(person_id              = patient$person_id,
                     visit_occurrence_id    = visit2$visit_occurrence_id,
                     observation_concept_id = 38001105,
                     observation_date       = "2011-05-09");

  # PATCPT.CPT_CODE CPT4
  patient <- createPatient();
  visit <- createVisit();
  declareTest(description="CPT4 record to observation table", source_pid=patient$medrec_key, cdm_pid = patient$person_id);
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
  declareTest(description="HCPCS record to observation table", source_pid=patient$medrec_key, cdm_pid = patient$person_id);
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
  declareTest(description="STD_CHG_CODE record to observation table with date logic", source_pid=patient$medrec_key, cdm_pid = patient$person_id);
  add_pat(medrec_key   = patient$medrec_key,
          pat_key      = visit$pat_key,
          adm_date     = "2009-07-01",
          disc_date    = "2009-07-01",
          disc_mon_seq = 1);
  add_patbill(pat_key      = visit$pat_key,
              std_chg_code = as.numeric(Sys.getenv("std_chg_code_14")),
              serv_day     = 3,
              hosp_chg_id  = -888);
  add_hospchg(hosp_chg_id   = -888,
              hosp_chg_desc = "CHEST PERCUSSION SUB");
  add_chgmstr(std_chg_code = as.numeric(Sys.getenv("std_chg_code_14")),
              std_chg_desc = "CHEST PHYSIO SUB");
  expect_observation(person_id                = patient$person_id,
                     visit_occurrence_id      = visit$visit_occurrence_id,
                     observation_concept_id   = 4144548,
                     observation_date         = "2009-07-03",
                     observation_source_value = "CHEST PHYSIO SUB / CHEST PERCUSSION SUB"); #INCREASE LENGTH!

  # PATBILL.STD_CHG_CODE JNJ_PMR_PROC_CHRG_CD; JNJ_PMR_PROC_CHRG_CD codes aren't in chgmstr?

  # PATICD_PROC.ICD_CODE ICD9CM; note same code as below, just diff icd version
  patient <- createPatient();
  visit <- createVisit();
  declareTest(description="ICD9CM record from PATICD_PROC to observation table", source_pid=patient$medrec_key, cdm_pid = patient$person_id);
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

  # PATICD_PROC.ICD_CODE ICD10CM; note same code as below, just diff icd version
  patient <- createPatient();
  visit <- createVisit();
  declareTest(description="ICD10CM record from PATICD_PROC to observation table", source_pid=patient$medrec_key, cdm_pid = patient$person_id);
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
  declareTest(description="ICD9CM record from PATICD_DIAG to observation table", source_pid=patient$medrec_key, cdm_pid = patient$person_id);
  add_pat(medrec_key   = patient$medrec_key,
          pat_key      = visit$pat_key,
          adm_date     = "2005-12-01",
          disc_date    = "2005-12-01",
          disc_mon_seq = 1);
  add_patbill(pat_key  = visit$pat_key,
              serv_day = 1);
  add_paticd_diag(pat_key     = visit$pat_key,
                  icd_code    = "995.51",
                  icd_version = 9);
  expect_observation(person_id                = patient$person_id,
                     visit_occurrence_id      = visit$visit_occurrence_id,
                     observation_concept_id   = 43021802,
                     observation_date         = "2005-12-01",
                     observation_source_value = "995.51");

  # PATICD_DIAG.ICD_CODE ICD10CM
  patient <- createPatient();
  visit <- createVisit();
  declareTest(description="ICD10CM record from PATICD_DIAG to observation table", source_pid=patient$medrec_key, cdm_pid = patient$person_id);
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
  declareTest(description=paste0("patbill record ", as.numeric(Sys.getenv("std_chg_code_15"))," maps to 2108550 in oservation table"), source_pid=patient$medrec_key, cdm_pid = patient$person_id);
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
  declareTest(description="inpatient visit sampling weight field proj_wgt to observation",
              source_pid=patient$medrec_key, cdm_pid = patient$person_id);
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
  declareTest(description="outpatient visit where proj_wgt=0 does not move to observation",
              source_pid=patient$medrec_key, cdm_pid = patient$person_id);
  add_pat(medrec_key = patient$medrec_key,
          pat_key    = visit$pat_key,
          i_o_ind    = 'O',
          proj_wgt   = 0.000000);
  expect_no_observation(person_id              = patient$person_id,
                        visit_occurrence_id    = visit$visit_occurrence_id,
                        observation_concept_id = 37392832);



  # PAT.MS_DRG_MDC, 0, 1, 2, 3 digit code, aplha code
  patient <- createPatient();
  visit <- createVisit();
  declareTest(description="MS_DRG_MDC=0000 record to observation table",
              source_pid=patient$medrec_key, cdm_pid = patient$person_id);
  add_pat(medrec_key   = patient$medrec_key,
          pat_key      = visit$pat_key,
          adm_date     = "2005-01-01",
          disc_date    = "2005-01-01",
          disc_mon_seq = 1,
          ms_drg_mdc   = '0000');
  add_patbill(pat_key  = visit$pat_key,
              serv_day = 1);
  expect_observation(person_id                     = patient$person_id,
                     visit_occurrence_id           = visit$visit_occurrence_id,
                     observation_date              = "2005-01-01",
                     observation_concept_id        = 38001640, #concept_code=0
                     observation_source_value      = '0000',
                     observation_source_concept_id = 38001640);

  patient <- createPatient();
  visit <- createVisit();
  declareTest(description="MS_DRG_MDC=00001 record to observation table",
              source_pid=patient$medrec_key, cdm_pid = patient$person_id);
  add_pat(medrec_key   = patient$medrec_key,
          pat_key      = visit$pat_key,
          adm_date     = "2006-01-01",
          disc_date    = "2006-01-01",
          disc_mon_seq = 1,
          ms_drg_mdc   = '00001');
  add_patbill(pat_key  = visit$pat_key,
              serv_day = 1);
  expect_observation(person_id                     = patient$person_id,
                     visit_occurrence_id           = visit$visit_occurrence_id,
                     observation_date              = "2006-01-01",
                     observation_concept_id        = 38001641, #concept_code=1
                     observation_source_value      = '00001',
                     observation_source_concept_id = 38001641);

  patient <- createPatient();
  visit1 <- createVisit();
  declareTest(description="MS_DRG_MDC=00021 record to observation table",
              source_pid=patient$medrec_key, cdm_pid = patient$person_id);
  add_pat(medrec_key   = patient$medrec_key,
          pat_key      = visit1$pat_key,
          adm_date     = "2011-05-01",
          disc_date    = "2011-05-01",
          disc_mon_seq = 1,
          ms_drg_mdc   = '00021');
  add_patbill(pat_key = visit1$pat_key,
             serv_day = 1);
  expect_observation(person_id                     = patient$person_id,
                     visit_occurrence_id           = visit1$visit_occurrence_id,
                     observation_date              = "2011-05-01",
                     observation_concept_id        = 38001661, #concept_code=21
                     observation_source_value      = '00021',
                     observation_source_concept_id = 38001661);

  # patient <- createPatient();
  # visit <- createVisit();
  # declareTest(description="MS_DRG_MDC=00AL record to observation table",
  #             source_pid=patient$medrec_key, cdm_pid = patient$person_id);
  # add_pat(medrec_key   = patient$medrec_key,
  #         pat_key      = visit$pat_key,
  #         adm_date     = "2005-01-01",
  #         disc_date    = "2005-01-01",
  #         disc_mon_seq = 1,
  #         ms_drg_mdc   = '00AL'); #not in vocab, so doesn't move to observation, 00AL='None'
  # add_patbill(pat_key  = visit$pat_key,
  #             serv_day = 1);
  # expect_observation(person_id                     = patient$person_id,
  #                    visit_occurrence_id           = visit$visit_occurrence_id,
  #                    observation_date              = "2005-01-01",
  #                    observation_concept_id        = 38001640, #concept_code=0
  #                    observation_source_value      = '0',
  #                    observation_source_concept_id = 38001640);

}
