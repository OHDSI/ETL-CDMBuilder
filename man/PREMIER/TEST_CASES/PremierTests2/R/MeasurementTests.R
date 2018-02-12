createMeasurementTests <- function () {

  # PATCPT.CPT_CODE CPT4
  patient <- createPatient();
  visit <- createVisit();
  declareTest(description="CPT4 record to measurement table", id = patient$person_id);
  add_pat(medrec_key   = patient$medrec_key,
          pat_key      = visit$pat_key,
          adm_date     = "2004-11-01",
          disc_date    = "2004-11-01",
          disc_mon_seq = 1);
  add_patbill(pat_key  = visit$pat_key,
              serv_day = 1);
  add_patcpt(pat_key  = visit$pat_key,
             cpt_code = "81003");
  expect_measurement(person_id                = patient$person_id,
                     visit_occurrence_id      = visit$visit_occurrence_id,
                     measurement_concept_id   = 2212168,
                     measurement_date         = "2004-11-01",
                     measurement_source_value = "81003");

  # PATCPT.CPT_CODE HCPCS
  patient <- createPatient();
  visit <- createVisit();
  declareTest(description="HCPCS record to measurement table", id = patient$person_id);
  add_pat(medrec_key   = patient$medrec_key,
          pat_key      = visit$pat_key,
          adm_date     = "2012-08-01",
          disc_date    = "2012-08-01",
          disc_mon_seq = 1);
  add_patbill(pat_key  = visit$pat_key,
              serv_day = 1);
  add_patcpt(pat_key  = visit$pat_key,
             cpt_code = "G0432");
  expect_measurement(person_id                = patient$person_id,
                     visit_occurrence_id      = visit$visit_occurrence_id,
                     measurement_concept_id   = 40664440,
                     measurement_date         = "2012-08-01",
                     measurement_source_value = "G0432");

  # PATBILL.STD_CHG_CODE
  patient <- createPatient();
  visit <- createVisit();
  declareTest(description="STD_CHG_CODE record to measurement table with date logic and source value", id = patient$person_id);
  add_pat(medrec_key   = patient$medrec_key,
          pat_key      = visit$pat_key,
          adm_date     = "2013-07-01",
          disc_date    = "2013-07-01",
          disc_mon_seq = 1);
  add_patbill(pat_key      = visit$pat_key,
              std_chg_code = as.numeric(Sys.getenv("std_chg_code_9")),
              serv_day     = 3,
              hosp_chg_id  = -999);
  add_hospchg(hosp_chg_id   = -999,
              hosp_chg_desc = "SEDIMENTATION RATE")
  add_chgmstr(std_chg_code = as.numeric(Sys.getenv("std_chg_code_9")),
              std_chg_desc = "SED RATE RBC AUTO");
  expect_measurement(person_id                = patient$person_id,
                     visit_occurrence_id      = visit$visit_occurrence_id,
                     measurement_concept_id   = 2212737,
                     measurement_date         = "2013-07-03",
                     measurement_source_value = "SED RATE RBC AUTO / SEDIMENTATION RATE")

  # PATICD_DIAG.ICD_CODE ICD9CM
  patient <- createPatient();
  visit <- createVisit();
  declareTest(description="ICD9CM record from PATICD_DIAG to measurement table", id = patient$person_id);
  add_pat(medrec_key   = patient$medrec_key,
          pat_key      = visit$pat_key,
          adm_date     = "2009-12-01",
          disc_date    = "2009-12-01",
          disc_mon_seq = 1);
  add_patbill(pat_key  = visit$pat_key,
              serv_day = 1);
  add_paticd_diag(pat_key     = visit$pat_key,
                  icd_code    = "796.0",
                  icd_version = 9);
  expect_measurement(person_id                = patient$person_id,
                     visit_occurrence_id      = visit$visit_occurrence_id,
                     measurement_concept_id   = 4195512,
                     measurement_date         = "2009-12-01",
                     measurement_source_value = "796.0");

  # PATICD_DIAG.ICD_CODE ICD10CM
  patient <- createPatient();
  visit <- createVisit();
  declareTest(description="ICD10CM record from PATICD_DIAG to measurement table", id = patient$person_id);
  add_pat(medrec_key   = patient$medrec_key,
          pat_key      = visit$pat_key,
          adm_date     = "2009-10-01",
          disc_date    = "2009-10-01",
          disc_mon_seq = 1);
  add_patbill(pat_key  = visit$pat_key,
              serv_day = 1);
  add_paticd_diag(pat_key     = visit$pat_key,
                  icd_code    = "Z01.83",
                  icd_version = 10);
  expect_measurement(person_id                = patient$person_id,
                     visit_occurrence_id      = visit$visit_occurrence_id,
                     measurement_concept_id   = 4258677,
                     measurement_date         = "2009-10-01",
                     measurement_source_value = "Z01.83");

  # procedure operation time tests
  patient <- createPatient();
  visit <- createVisit();
  declareTest(description="PATICD_PROC record with procedure time", id = patient$person_id);
  add_pat(medrec_key   = patient$medrec_key,
          pat_key      = visit$pat_key,
          adm_date     = "2010-01-01",
          disc_date    = "2010-01-01",
          disc_mon_seq = 1);
  add_patbill(pat_key      = visit$pat_key,
              serv_day     = 5,
              std_qty      = 1,
              std_chg_code = as.numeric(Sys.getenv("std_chg_code_10")), #OR MAJOR 2 HR 30 MIN, i.e. 1 * 150 MINS
              hosp_chg_id  = -11325652); #OR TIME 151-180 MIN LEV I
  add_patbill(pat_key      = visit$pat_key,
              serv_day     = 5,
              std_qty      = 4,
              std_chg_code = as.numeric(Sys.getenv("std_chg_code_11")), #OR MINOR ADDL 30 MIN, i.e. 4 * 120 MINS
              hosp_chg_id  = -11395900); #OR TIME-ADDL 30MIN L1-IP
  add_paticd_proc(pat_key     = visit$pat_key,
                  proc_day    = 5,
                  icd_code    = "33.51",
                  icd_version = 9);
  add_chgmstr(std_chg_code  = as.numeric(Sys.getenv("std_chg_code_10")),
              std_chg_desc  = "OR MAJOR 2 HR 30 MIN",
              clin_sum_desc = "SURGERY TIME");
  add_chgmstr(std_chg_code = as.numeric(Sys.getenv("std_chg_code_11")),
              std_chg_desc = "OR MINOR ADDL 30 MIN",
              clin_sum_desc = "SURGERY TIME");
  add_hospchg(hosp_chg_id   = -11325652,
              hosp_chg_desc = "OR TIME 151-180 MIN LEV I");
  add_hospchg(hosp_chg_id   = -11395900,
              hosp_chg_desc = "OR TIME-ADDL 30MIN L1-IP");
  expect_measurement(person_id                   = patient$person_id,
                     visit_occurrence_id         = visit$visit_occurrence_id,
                     measurement_concept_id      = 3016562,
                     measurement_type_concept_id = 45754907,
                     measurement_date            = "2010-01-05",
                     value_as_number             = 270,
                     unit_concept_id             = 8550);
  expect_procedure_occurrence(person_id             = patient$person_id,
                              visit_occurrence_id    = visit$visit_occurrence_id,
                              procedure_date         = "2010-01-05",
                              procedure_concept_id   = 2001374,
                              procedure_source_value = "33.51");
  expect_procedure_occurrence(person_id              = patient$person_id,
                              visit_occurrence_id    = visit$visit_occurrence_id,
                              procedure_date         = "2010-01-05",
                              procedure_concept_id   = 0,
                              procedure_source_value = "OR MAJOR 2 HR 30 MIN / OR TIME 151-180 MIN LEV I");
  expect_procedure_occurrence(person_id              = patient$person_id,
                              visit_occurrence_id    = visit$visit_occurrence_id,
                              procedure_date         = "2010-01-05",
                              procedure_concept_id   = 0,
                              procedure_source_value = "OR MINOR ADDL 30 MIN / OR TIME-ADDL 30MIN L1-IP");



  patient <- createPatient();
  visit <- createVisit();
  declareTest(description="PATICD_PROC record, procedure time on wrong day, no measurement", id = patient$person_id);
  add_pat(medrec_key   = patient$medrec_key,
          pat_key      = visit$pat_key,
          adm_date     = "2010-01-01",
          disc_date    = "2010-01-01",
          disc_mon_seq = 1);
  add_patbill(pat_key      = visit$pat_key,
              serv_day     = 8,
              std_qty      = 1,
              std_chg_code = as.numeric(Sys.getenv("std_chg_code_10"))); #OR MAJOR 2 HR 30 MIN, i.e. 1 * 150 MINS
  add_patbill(pat_key      = visit$pat_key,
              serv_day     = 8,
              std_qty      = 4,
              std_chg_code = as.numeric(Sys.getenv("std_chg_code_11"))); #OR MINOR ADDL 30 MIN, i.e. 4 * 30 MINS
  add_paticd_proc(pat_key     = visit$pat_key,
                  proc_day    = 5,
                  icd_code    = "33.51",
                  icd_version = 9);
  expect_no_measurement(person_id           = patient$person_id,
                        visit_occurrence_id = visit$visit_occurrence_id)

}
