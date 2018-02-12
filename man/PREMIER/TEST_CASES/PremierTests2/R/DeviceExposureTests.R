createDeviceExposureTests <- function () {

  # PATBILL.STD_CHG_CODE
  patient <- createPatient();
  visit <- createVisit();
  declareTest(description="STD_CHG_CODE record to device_exposure table", id = patient$person_id);
  add_pat(medrec_key   = patient$medrec_key,
          pat_key      = visit$pat_key,
          adm_date     = "2011-11-01",
          disc_date    = "2011-11-01",
          disc_mon_seq = 1);
  add_patbill(pat_key      = visit$pat_key,
              std_chg_code = as.numeric(Sys.getenv("std_chg_code_7")),
              serv_day     = 13);
  expect_device_exposure(person_id                    = patient$person_id,
                         visit_occurrence_id          = visit$visit_occurrence_id,
                         device_concept_id            = 4063122,
                         device_exposure_start_date   = "2011-11-13");

  # PATICD_DIAG.ICD_CODE ICD10CM
  patient <- createPatient();
  visit <- createVisit();
  declareTest(description="ICD10CM record from PATICD_DIAG to device_exposure table", id = patient$person_id);
  add_pat(medrec_key   = patient$medrec_key,
          pat_key      = visit$pat_key,
          adm_date     = "2007-08-01",
          disc_date    = "2007-08-01",
          disc_mon_seq = 1);
  add_patbill(pat_key  = visit$pat_key,
              serv_day = 1);
  add_paticd_diag(pat_key     = visit$pat_key,
                  icd_code    = "Y73.8",
                  icd_version = 10);
  expect_device_exposure(person_id                  = patient$person_id,
                         visit_occurrence_id        = visit$visit_occurrence_id,
                         device_concept_id          = 45767866,
                         device_exposure_start_date = "2007-08-01",
                         device_source_value        = "Y73.8");

  # PATICD_PROC.ICD_CODE ICD10CM
  patient <- createPatient();
  visit <- createVisit();
  declareTest(description="ICD10CM record from PATICD_PROC to device_exposure table", id = patient$person_id);
  add_pat(medrec_key   = patient$medrec_key,
          pat_key      = visit$pat_key,
          adm_date     = "2004-03-01",
          disc_date    = "2004-03-01",
          disc_mon_seq = 1);
  add_patbill(pat_key  = visit$pat_key,
              serv_day = 4);
  add_paticd_proc(pat_key     = visit$pat_key,
                  icd_code    = "Y77",
                  icd_version = 10);
  expect_device_exposure(person_id                  = patient$person_id,
                         visit_occurrence_id        = visit$visit_occurrence_id,
                         device_concept_id          = 4125343,
                         device_exposure_start_date = "2004-03-04", #on visit end date
                         device_source_value        = "Y77");

  # PATCPT.CPT_CODE HCPCS
  patient <- createPatient();
  visit <- createVisit();
  declareTest(description="HCPCS record to device_exposure table", id = patient$person_id);
  add_pat(medrec_key   = patient$medrec_key,
          pat_key      = visit$pat_key,
          adm_date     = "2012-04-01",
          disc_date    = "2012-04-01",
          disc_mon_seq = 1);
  add_patbill(pat_key  = visit$pat_key,
              serv_day = 1);
  add_patcpt(pat_key  = visit$pat_key,
             cpt_code = "V5245");
  expect_device_exposure(person_id                  = patient$person_id,
                         visit_occurrence_id        = visit$visit_occurrence_id,
                         device_concept_id          = 2721945,
                         device_exposure_start_date = "2012-04-01",
                         device_source_value        = "V5245");

}
