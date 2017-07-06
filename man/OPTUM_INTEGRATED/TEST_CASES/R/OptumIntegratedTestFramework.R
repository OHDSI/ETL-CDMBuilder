frameworkContext <- new.env(parent = emptyenv());
initFramework <- function() {
  frameworkContext$groupIndex <- 0;
  insertSql <- c()
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema._version;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.care_area;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.diagnosis;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.encounter;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.encounter_provider;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.immunizations;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.inpatient_confinement;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.insurance;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.lab_results;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.labs;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.lu_abnl_cd;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.lu_ahfsclss;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.lu_bus_line;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.lu_cdhp;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.lu_cob;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.lu_daw;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.lu_diagnosis;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.lu_dischstatus;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.lu_drg;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.lu_encounter;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.lu_form_ind;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.lu_form_typ;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.lu_fst_fill;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.lu_gnrc_ind;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.lu_hccc;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.lu_icd_flag;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.lu_ipstatus;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.lu_loc_cd;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.lu_ndc;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.lu_poa;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.lu_pos;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.lu_prc_typ;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.lu_procedure;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.lu_procmod;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.lu_product;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.lu_provcat;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.lu_rvnu_cd;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.lu_specclss;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.lu_tos_cd;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.medical_claims;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.medication_administrations;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.member_detail;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.microbiology;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.nlp_biomarkers;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.nlp_custom;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.nlp_drug_rationale;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.nlp_measurement;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.nlp_sds;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.nlp_sds_family;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.observations;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.patient;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.patient_reported_medications;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.prescriptions_written;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.[procedure];")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.provider;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.rx_claims;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.visit;")
  frameworkContext$insertSql <- insertSql;
  testSql <- c()
  testSql <- c(testSql, "IF OBJECT_ID('@cdm_schema.test_results', 'U') IS NOT NULL")
  testSql <- c(testSql, "  DROP TABLE @cdm_schema.test_results;")
  testSql <- c(testSql, "")
  testSql <- c(testSql, "CREATE TABLE @cdm_schema.test_results (id INT, description VARCHAR(512), test VARCHAR(256), source_pid VARCHAR(50), cdm_pid int, status VARCHAR(5));")
  testSql <- c(testSql, "")
  frameworkContext$testSql <- testSql;
  frameworkContext$testId = 0;
  frameworkContext$testDescription = "";

  patient <- {}
  patient$source_pid <- NULL
  patient$cdm_pid <- NULL
  frameworkContext$patient = patient;

  frameworkContext$defaultValues =new.env(parent = emptyenv());

  defaults <- new.env(parent = emptyenv())
  frameworkContext$defaultValues$U_version = defaults;

  defaults <- new.env(parent = emptyenv())
  defaults$ptid <- "PT272312122"
  defaults$encid <- "E00006204133821"
  defaults$carearea <- "UNKNOWN CARE AREA"
  defaults$carearea_time <- "1900-01-01.000000"
  frameworkContext$defaultValues$care_area = defaults;

  defaults <- new.env(parent = emptyenv())
  defaults$ptid <- "PT300705138"
  defaults$diag_date <- "2014-05-02"
  defaults$diag_time <- "1900-01-01.000000"
  defaults$diagnosis_cd <- "4019"
  defaults$diagnosis_cd_type <- "ICD9"
  defaults$diagnosis_status <- "Diagnosis of"
  defaults$poa <- "0"
  defaults$admitting_diagnosis <- "0"
  defaults$discharge_diagnosis <- "0"
  defaults$primary_diagnosis <- "0"
  defaults$problem_list <- "N"
  frameworkContext$defaultValues$diagnosis = defaults;

  defaults <- new.env(parent = emptyenv())
  defaults$ptid <- "PT219141949"
  defaults$interaction_type <- "Office or clinic patient"
  defaults$interaction_date <- "2016-09-08"
  defaults$interaction_time <- "1900-01-01.000000"
  frameworkContext$defaultValues$encounter = defaults;

  defaults <- new.env(parent = emptyenv())
  defaults$provid <- "15368571"
  defaults$provider_role <- "ATTENDING"
  frameworkContext$defaultValues$encounter_provider = defaults;

  defaults <- new.env(parent = emptyenv())
  defaults$ptid <- "PT228862369"
  defaults$immunization_desc <- "INFLUENZA VIRUS VACCINE; INACTIVATED"
  defaults$mapped_name <- "Influenza Inactivated Vaccine"
  defaults$ndc <- "49281039765"
  defaults$ndc_source <- "Derived"
  defaults$pt_reported <- " "
  frameworkContext$defaultValues$immunizations = defaults;

  defaults <- new.env(parent = emptyenv())
  defaults$ptid <- "PT279675848"
  defaults$pat_planid <- "98430515592"
  defaults$prov <- "774563973"
  defaults$admit_date <- "2012-07-01"
  defaults$disch_date <- "2016-09-30"
  defaults$dstatus <- "01"
  defaults$los <- "1"
  defaults$icd_flag <- "9"
  defaults$diag1 <- "V5789"
  defaults$proc1 <- "0000"
  defaults$proc2 <- "0000"
  defaults$proc3 <- "0000"
  defaults$proc4 <- "0000"
  defaults$proc5 <- "0000"
  defaults$pos <- "21"
  defaults$coins <- "0.00"
  defaults$copay <- "0.00"
  defaults$deduct <- "0.00"
  defaults$std_cost <- "0.00"
  defaults$std_cost_yr <- "2015"
  defaults$ipstatus <- "Z"
  defaults$tos_cd <- "FAC_IP.ACUTE"
  defaults$version <- "6.0"
  defaults$extract_ym <- "201612"
  frameworkContext$defaultValues$inpatient_confinement = defaults;

  defaults <- new.env(parent = emptyenv())
  defaults$insurance_date <- "2015-01-14"
  defaults$insurance_time <- "1900-01-01.000000"
  defaults$ins_type <- "Commercial"
  frameworkContext$defaultValues$insurance = defaults;

  defaults <- new.env(parent = emptyenv())
  defaults$ptid <- "PT092140809"
  defaults$pat_planid <- "98660407242"
  defaults$fst_dt <- "2016-02-04"
  defaults$rslt_nbr <- "0.000000"
  defaults$low_nrml <- "0.0000"
  defaults$hi_nrml <- "0.0000"
  defaults$labclmid <- "."
  defaults$anlytseq <- "01"
  defaults$source <- "LC"
  defaults$version <- "6.0"
  defaults$extract_ym <- "201612"
  frameworkContext$defaultValues$lab_results = defaults;

  defaults <- new.env(parent = emptyenv())
  defaults$ptid <- "PT143823525"
  defaults$test_name <- "Oxygen saturation (SpO2).pulse oximetry"
  defaults$result_time <- "1900-01-01.000000"
  defaults$test_result <- "negative"
  defaults$result_unit <- "%"
  defaults$evaluated_for_range <- "N"
  defaults$value_within_range <- "U"
  frameworkContext$defaultValues$labs = defaults;

  defaults <- new.env(parent = emptyenv())
  frameworkContext$defaultValues$lu_abnl_cd = defaults;

  defaults <- new.env(parent = emptyenv())
  frameworkContext$defaultValues$lu_ahfsclss = defaults;

  defaults <- new.env(parent = emptyenv())
  frameworkContext$defaultValues$lu_bus_line = defaults;

  defaults <- new.env(parent = emptyenv())
  frameworkContext$defaultValues$lu_cdhp = defaults;

  defaults <- new.env(parent = emptyenv())
  frameworkContext$defaultValues$lu_cob = defaults;

  defaults <- new.env(parent = emptyenv())
  frameworkContext$defaultValues$lu_daw = defaults;

  defaults <- new.env(parent = emptyenv())
  defaults$diag_desc <- "UNKNOWN DIAGNOSIS"
  defaults$gdr_spec_cd <- "f"
  defaults$diag_fst3_cd <- "S82"
  defaults$diag_fst3_desc <- "UNKNOWN DIAGNOSIS"
  defaults$diag_fst4_desc <- "UNKNOWN DIAGNOSIS"
  defaults$mdc_code <- "00"
  defaults$mdc_cd_desc <- "UNKNOWN MAJOR DIAGNOSTIC CATEGORY"
  defaults$icd_ver_cd <- "9 "
  frameworkContext$defaultValues$lu_diagnosis = defaults;

  defaults <- new.env(parent = emptyenv())
  defaults$description <- "RESERVED FOR NATIONAL ASSIGNMENT                                      "
  defaults$discharge_status_category <- "RESERVED FOR NATIONAL ASSIGNMENT"
  frameworkContext$defaultValues$lu_dischstatus = defaults;

  defaults <- new.env(parent = emptyenv())
  defaults$drg <- "014"
  defaults$eff_date <- "2007-10-01"
  defaults$end_date <- "9999-12-31"
  frameworkContext$defaultValues$lu_drg = defaults;

  defaults <- new.env(parent = emptyenv())
  frameworkContext$defaultValues$lu_encounter = defaults;

  defaults <- new.env(parent = emptyenv())
  frameworkContext$defaultValues$lu_form_ind = defaults;

  defaults <- new.env(parent = emptyenv())
  frameworkContext$defaultValues$lu_form_typ = defaults;

  defaults <- new.env(parent = emptyenv())
  frameworkContext$defaultValues$lu_fst_fill = defaults;

  defaults <- new.env(parent = emptyenv())
  frameworkContext$defaultValues$lu_gnrc_ind = defaults;

  defaults <- new.env(parent = emptyenv())
  frameworkContext$defaultValues$lu_hccc = defaults;

  defaults <- new.env(parent = emptyenv())
  frameworkContext$defaultValues$lu_icd_flag = defaults;

  defaults <- new.env(parent = emptyenv())
  frameworkContext$defaultValues$lu_ipstatus = defaults;

  defaults <- new.env(parent = emptyenv())
  frameworkContext$defaultValues$lu_loc_cd = defaults;

  defaults <- new.env(parent = emptyenv())
  defaults$ahfsclss <- "UNK"
  defaults$ahfsclss_desc <- "UNKNOWN"
  defaults$dosage_fm_desc <- "TABLET"
  defaults$drg_strgth_nbr <- "0.0"
  defaults$drg_strgth_unit_desc <- "mg"
  defaults$drg_strgth_vol_nbr <- "0.0"
  defaults$gnrc_ind <- "1"
  defaults$gnrc_nbr <- "094200"
  defaults$gnrc_sqnc_nbr <- "000000"
  defaults$ndc_drg_row_eff_dt <- "1900-01-01"
  defaults$ndc_drg_row_end_dt <- "9999-12-31"
  defaults$usc_id <- "     "
  frameworkContext$defaultValues$lu_ndc = defaults;

  defaults <- new.env(parent = emptyenv())
  frameworkContext$defaultValues$lu_poa = defaults;

  defaults <- new.env(parent = emptyenv())
  defaults$category <- "OTHER OUTPATIENT PLACE OF SERVICE"
  frameworkContext$defaultValues$lu_pos = defaults;

  defaults <- new.env(parent = emptyenv())
  frameworkContext$defaultValues$lu_prc_typ = defaults;

  defaults <- new.env(parent = emptyenv())
  defaults$category_dtl_cd <- "999  "
  defaults$category_dtl_code_desc <- "NOT ASSIGNED"
  defaults$category_genl_cd <- "16   "
  defaults$category_genl_cd_desc <- "MISC DIAG THERAPEUTIC"
  defaults$proc_desc <- "UNKNOWN PROCEDURE"
  defaults$proc_end_date <- "9999-12-31"
  defaults$proc_typ_cd <- "UNKN "
  frameworkContext$defaultValues$lu_procedure = defaults;

  defaults <- new.env(parent = emptyenv())
  defaults$description <- "UNKNOWN MODIFIER"
  frameworkContext$defaultValues$lu_procmod = defaults;

  defaults <- new.env(parent = emptyenv())
  frameworkContext$defaultValues$lu_product = defaults;

  defaults <- new.env(parent = emptyenv())
  defaults$description <- "DURABLE MEDICAL EQUIPMENT"
  defaults$catgy_rol_up_1_desc <- "MENTAL HEALTH PROFESSIONAL"
  defaults$catgy_rol_up_2_desc <- "SPECIALIST"
  defaults$catgy_rol_up_3_desc <- "PHYSICIAN"
  defaults$catgy_rol_up_4_desc <- "PROFESSIONAL"
  frameworkContext$defaultValues$lu_provcat = defaults;

  defaults <- new.env(parent = emptyenv())
  defaults$description <- "UNKNOWN REVENUE CODE"
  defaults$rvnu_catgy_desc <- "UNKNOWN"
  frameworkContext$defaultValues$lu_rvnu_cd = defaults;

  defaults <- new.env(parent = emptyenv())
  defaults$description <- "UNKNOWN"
  frameworkContext$defaultValues$lu_specclss = defaults;

  defaults <- new.env(parent = emptyenv())
  defaults$lvl_1_code <- "PROF"
  defaults$lvl_1_desc <- "Professional Services"
  frameworkContext$defaultValues$lu_tos_cd = defaults;

  defaults <- new.env(parent = emptyenv())
  defaults$clmseq <- "001"
  defaults$fst_dt <- "2016-02-22"
  defaults$prov <- "777673341"
  defaults$provcat <- "0001"
  defaults$icd_flag <- "9"
  defaults$diag1 <- "V700"
  defaults$poa1 <- "0"
  defaults$poa2 <- "0"
  defaults$poa3 <- "0"
  defaults$poa4 <- "0"
  defaults$poa5 <- "0"
  defaults$proc_cd <- "99213"
  defaults$procmod <- "UNK"
  defaults$proc1 <- "0000000"
  defaults$proc2 <- "0000000"
  defaults$proc3 <- "0000000"
  defaults$ndc <- "NONE"
  defaults$loc_cd <- "2"
  defaults$rvnu_cd <- "0000"
  defaults$pos <- "11"
  defaults$enctr <- "0"
  defaults$units <- "1"
  defaults$coins <- "0.00"
  defaults$copay <- "0.00"
  defaults$deduct <- "0.00"
  defaults$paid_dt <- "2016-05-23"
  defaults$hccc <- "  "
  defaults$std_cost_yr <- "2015"
  defaults$tos_cd <- "PROF.LAB"
  defaults$version <- "6.0"
  defaults$extract_ym <- "201612"
  frameworkContext$defaultValues$medical_claims = defaults;

  defaults <- new.env(parent = emptyenv())
  defaults$ptid <- "PT089797880"
  defaults$drug_name <- "SODIUM CHLORIDE 0.9 %"
  defaults$ndc <- "00338004904"
  defaults$ndc_source <- "Derived"
  defaults$order_date <- "2016-05-11"
  defaults$order_time <- "1900-01-01 12:00:00.000000"
  defaults$route <- "Intravenous"
  defaults$dosage_form <- "Injection"
  defaults$drug_class <- "Narcotic agonist analgesics"
  frameworkContext$defaultValues$medication_administrations = defaults;

  defaults <- new.env(parent = emptyenv())
  defaults$eligeff <- "2000-05-01"
  defaults$eligend <- "2016-09-30"
  defaults$aso <- "N"
  defaults$product <- "POS"
  defaults$bus <- "COM"
  defaults$cdhp <- "3"
  defaults$group_nbr <- "000722271"
  defaults$medical_coverage_ind <- "Y"
  defaults$pharmacy_coverage_ind <- "Y"
  defaults$version <- "6.0"
  defaults$extract_ym <- "201612"
  frameworkContext$defaultValues$member_detail = defaults;

  defaults <- new.env(parent = emptyenv())
  defaults$ptid <- "PT117446214"
  defaults$order_time <- "1900-01-01.000000"
  defaults$collect_time <- "1900-01-01 12:00:00.000000"
  defaults$result_date <- "2007-11-17"
  defaults$result_time <- "1900-01-01.000000"
  defaults$specimen_source <- "Urine"
  frameworkContext$defaultValues$microbiology = defaults;

  defaults <- new.env(parent = emptyenv())
  defaults$ptid <- "PT084823794"
  defaults$note_date <- "2015-11-04"
  defaults$biomarker <- "EGFR"
  defaults$biomarker_status <- "negative"
  frameworkContext$defaultValues$nlp_biomarkers = defaults;

  defaults <- new.env(parent = emptyenv())
  defaults$ptid <- "PT084388354"
  defaults$note_date <- "2014-04-29"
  defaults$nlp_term <- "radio frequency ablation"
  frameworkContext$defaultValues$nlp_custom = defaults;

  defaults <- new.env(parent = emptyenv())
  defaults$ptid <- "PT201453497"
  defaults$note_date <- "2014-04-29"
  defaults$note_section <- "MEDICATIONS"
  defaults$drug_name <- "ASPIRIN"
  defaults$drug_action <- "N/A"
  defaults$drug_action_preposition <- "OF"
  frameworkContext$defaultValues$nlp_drug_rationale = defaults;

  defaults <- new.env(parent = emptyenv())
  defaults$ptid <- "PT134000335"
  defaults$note_date <- "2014-04-29"
  defaults$measurement_type <- "DBP"
  defaults$measurement_value <- "normal"
  frameworkContext$defaultValues$nlp_measurement = defaults;

  defaults <- new.env(parent = emptyenv())
  defaults$ptid <- "PT205886187"
  defaults$note_date <- "2015-01-01"
  defaults$sds_term <- "pain"
  frameworkContext$defaultValues$nlp_sds = defaults;

  defaults <- new.env(parent = emptyenv())
  defaults$ptid <- "PT153554115"
  defaults$note_date <- "2014-04-29"
  defaults$sds_term <- "cancer"
  defaults$sds_family_member <- "who=family"
  defaults$note_section <- "family medical history"
  frameworkContext$defaultValues$nlp_sds_family = defaults;

  defaults <- new.env(parent = emptyenv())
  defaults$ptid <- "PT275521872"
  defaults$obs_type <- "SBP"
  defaults$nlp <- "N"
  defaults$obs_date <- "2014-10-22"
  defaults$obs_time <- "1900-01-01.000000"
  defaults$obsresult <- "Never smoked"
  defaults$obs_unit <- "mm Hg"
  defaults$evaluated_for_range <- "N"
  defaults$value_within_range <- "U"
  frameworkContext$defaultValues$observations = defaults;

  defaults <- new.env(parent = emptyenv())
  defaults$birth_yr <- "1927 and Earlier"
  defaults$gender <- "Female"
  defaults$race <- "Caucasian"
  defaults$ethnicity <- "Not Hispanic"
  defaults$region <- "Midwest"
  defaults$division <- "South Atl/West South Crl"
  defaults$pct_college_educ <- "26.0"
  defaults$deceased_indicator <- "0"
  defaults$date_of_death <- "      "
  defaults$idn_indicator <- "1"
  defaults$first_month_active <- "200601"
  defaults$last_month_active <- "201609"
  defaults$notes_eligible <- "1"
  defaults$has_notes <- "1"
  defaults$sourceid <- "S0040"
  defaults$source_data_through <- "201609"
  defaults$overlap <- "Y"
  frameworkContext$defaultValues$patient = defaults;

  defaults <- new.env(parent = emptyenv())
  defaults$ptid <- "PT300705138"
  defaults$reported_date <- "2013-06-15"
  defaults$ndc_source <- "Direct"
  defaults$route <- "Oral"
  defaults$strength_unit <- "mg"
  defaults$dosage_form <- "Tabs"
  defaults$drug_class <- "Salicylates"
  frameworkContext$defaultValues$patient_reported_medications = defaults;

  defaults <- new.env(parent = emptyenv())
  defaults$ptid <- "PT131854350"
  defaults$rxdate <- "2016-05-23"
  defaults$rxtime <- "1900-01-01.000000"
  defaults$ndc <- "00406012301"
  defaults$ndc_source <- "Derived"
  defaults$route <- "Oral"
  defaults$strength_unit <- "mg"
  defaults$quantity_per_fill <- "30"
  defaults$num_refills <- "0"
  defaults$drug_class <- "Narcotic & analgesic combinations"
  frameworkContext$defaultValues$prescriptions_written = defaults;

  defaults <- new.env(parent = emptyenv())
  defaults$ptid <- "PT174678825"
  defaults$proc_date <- "2015-12-22"
  defaults$proc_time <- "1900-01-01.000000"
  defaults$proc_code_type <- "CPT4"
  frameworkContext$defaultValues$procedure = defaults;

  defaults <- new.env(parent = emptyenv())
  defaults$specialty <- "Unknown"
  defaults$prim_spec_ind <- "1"
  frameworkContext$defaultValues$provider = defaults;

  defaults <- new.env(parent = emptyenv())
  defaults$chk_dt <- "1900-01-01"
  defaults$fill_dt <- "2015-06-01"
  defaults$ahfsclss <- "24060800"
  defaults$specclss <- "H3A"
  defaults$brnd_nm <- "LISINOPRIL"
  defaults$ndc <- "00071015523"
  defaults$gnrc_ind <- "Y"
  defaults$avgwhlsl <- "0.00"
  defaults$copay <- "10.00"
  defaults$deduct <- "0.00"
  defaults$daw <- "0"
  defaults$form_ind <- "Y"
  defaults$form_typ <- "2"
  defaults$strength <- "10 MG"
  defaults$days_sup <- "30"
  defaults$quantity <- "30.000"
  defaults$fst_fill <- "Y"
  defaults$rfl_nbr <- "00"
  defaults$prc_typ <- "9"
  defaults$std_cost_yr <- "2013"
  defaults$version <- "6.0"
  defaults$extract_ym <- "201612"
  frameworkContext$defaultValues$rx_claims = defaults;

  defaults <- new.env(parent = emptyenv())
  defaults$ptid <- "PT088599322"
  defaults$visit_type <- "Emergency patient"
  defaults$visit_start_date <- "2016-07-11"
  defaults$visit_start_time <- "1900-01-01.000000"
  defaults$visit_end_date <- "2015-06-16"
  defaults$visit_end_time <- "1900-01-01.000000"
  defaults$discharge_disposition <- "01 DISCHARGED TO HOME OR SELF CARE"
  defaults$admission_source <- "Referred by physician or self referral; non-healthcare facility point of origin"
  frameworkContext$defaultValues$visit = defaults;
}

declareTestGroup <- function(groupName) {
  frameworkContext$groupIndex <- frameworkContext$groupIndex + 1 ;
  frameworkContext$currentGroup <- {}

  frameworkContext$currentGroup$groupName <- groupName;
  frameworkContext$currentGroup$groupItemIndex <- -1;
  sql <- c("",paste0("-- ", frameworkContext$groupIndex, ". ", groupName));
  frameworkContext$insertSql = c(frameworkContext$insertSql, sql);
  frameworkContext$testSql = c(frameworkContext$testSql, sql);
}

declareTest <- function(description, source_pid = NULL, cdm_pid = NULL) {
  frameworkContext$testId = frameworkContext$testId + 1;
  frameworkContext$testDescription = description;
  frameworkContext$patient$source_pid = source_pid;
  frameworkContext$patient$cdm_pid = cdm_pid;
  if (is.null(frameworkContext$currentGroup)) {  
    sql <- c(paste0("-- Test ", frameworkContext$testId, ": ", frameworkContext$testDescription));
  } else {
    frameworkContext$currentGroup$groupItemIndex = frameworkContext$currentGroup$groupItemIndex + 1;
    sql <- c(paste0("-- ", frameworkContext$groupIndex, ".", frameworkContext$currentGroup$groupItemIndex, " ", frameworkContext$testDescription, " [Test ID: ", frameworkContext$testId, "]"));
  }
  frameworkContext$insertSql = c(frameworkContext$insertSql, "--",sql,"--");
  frameworkContext$testSql = c(frameworkContext$testSql, "--",sql,"--");
}

set_defaults_U_version <- function(version_id, version_date) {
  defaults <- frameworkContext$defaultValues$U_version;
  if (!missing(version_id)) {
    defaults$version_id <- version_id
  }
  if (!missing(version_date)) {
    defaults$version_date <- version_date
  }
  invisible(defaults)
}

set_defaults_care_area <- function(ptid, encid, carearea, carearea_date, carearea_time) {
  defaults <- frameworkContext$defaultValues$care_area;
  if (!missing(ptid)) {
    defaults$ptid <- ptid
  }
  if (!missing(encid)) {
    defaults$encid <- encid
  }
  if (!missing(carearea)) {
    defaults$carearea <- carearea
  }
  if (!missing(carearea_date)) {
    defaults$carearea_date <- carearea_date
  }
  if (!missing(carearea_time)) {
    defaults$carearea_time <- carearea_time
  }
  invisible(defaults)
}

set_defaults_diagnosis <- function(ptid, encid, diag_date, diag_time, diagnosis_cd, diagnosis_cd_type, diagnosis_status, poa, admitting_diagnosis, discharge_diagnosis, primary_diagnosis, problem_list) {
  defaults <- frameworkContext$defaultValues$diagnosis;
  if (!missing(ptid)) {
    defaults$ptid <- ptid
  }
  if (!missing(encid)) {
    defaults$encid <- encid
  }
  if (!missing(diag_date)) {
    defaults$diag_date <- diag_date
  }
  if (!missing(diag_time)) {
    defaults$diag_time <- diag_time
  }
  if (!missing(diagnosis_cd)) {
    defaults$diagnosis_cd <- diagnosis_cd
  }
  if (!missing(diagnosis_cd_type)) {
    defaults$diagnosis_cd_type <- diagnosis_cd_type
  }
  if (!missing(diagnosis_status)) {
    defaults$diagnosis_status <- diagnosis_status
  }
  if (!missing(poa)) {
    defaults$poa <- poa
  }
  if (!missing(admitting_diagnosis)) {
    defaults$admitting_diagnosis <- admitting_diagnosis
  }
  if (!missing(discharge_diagnosis)) {
    defaults$discharge_diagnosis <- discharge_diagnosis
  }
  if (!missing(primary_diagnosis)) {
    defaults$primary_diagnosis <- primary_diagnosis
  }
  if (!missing(problem_list)) {
    defaults$problem_list <- problem_list
  }
  invisible(defaults)
}

set_defaults_encounter <- function(ptid, visitid, encid, interaction_type, interaction_date, interaction_time) {
  defaults <- frameworkContext$defaultValues$encounter;
  if (!missing(ptid)) {
    defaults$ptid <- ptid
  }
  if (!missing(visitid)) {
    defaults$visitid <- visitid
  }
  if (!missing(encid)) {
    defaults$encid <- encid
  }
  if (!missing(interaction_type)) {
    defaults$interaction_type <- interaction_type
  }
  if (!missing(interaction_date)) {
    defaults$interaction_date <- interaction_date
  }
  if (!missing(interaction_time)) {
    defaults$interaction_time <- interaction_time
  }
  invisible(defaults)
}

set_defaults_encounter_provider <- function(encid, provid, provider_role) {
  defaults <- frameworkContext$defaultValues$encounter_provider;
  if (!missing(encid)) {
    defaults$encid <- encid
  }
  if (!missing(provid)) {
    defaults$provid <- provid
  }
  if (!missing(provider_role)) {
    defaults$provider_role <- provider_role
  }
  invisible(defaults)
}

set_defaults_immunizations <- function(ptid, immunization_date, immunization_desc, mapped_name, ndc, ndc_source, pt_reported) {
  defaults <- frameworkContext$defaultValues$immunizations;
  if (!missing(ptid)) {
    defaults$ptid <- ptid
  }
  if (!missing(immunization_date)) {
    defaults$immunization_date <- immunization_date
  }
  if (!missing(immunization_desc)) {
    defaults$immunization_desc <- immunization_desc
  }
  if (!missing(mapped_name)) {
    defaults$mapped_name <- mapped_name
  }
  if (!missing(ndc)) {
    defaults$ndc <- ndc
  }
  if (!missing(ndc_source)) {
    defaults$ndc_source <- ndc_source
  }
  if (!missing(pt_reported)) {
    defaults$pt_reported <- pt_reported
  }
  invisible(defaults)
}

set_defaults_inpatient_confinement <- function(ptid, pat_planid, conf_id, prov, admit_date, disch_date, dstatus, los, drg, icd_flag, diag1, diag2, diag3, diag4, diag5, proc1, proc2, proc3, proc4, proc5, pos, coins, copay, deduct, std_cost, std_cost_yr, ipstatus, tos_cd, version, extract_ym) {
  defaults <- frameworkContext$defaultValues$inpatient_confinement;
  if (!missing(ptid)) {
    defaults$ptid <- ptid
  }
  if (!missing(pat_planid)) {
    defaults$pat_planid <- pat_planid
  }
  if (!missing(conf_id)) {
    defaults$conf_id <- conf_id
  }
  if (!missing(prov)) {
    defaults$prov <- prov
  }
  if (!missing(admit_date)) {
    defaults$admit_date <- admit_date
  }
  if (!missing(disch_date)) {
    defaults$disch_date <- disch_date
  }
  if (!missing(dstatus)) {
    defaults$dstatus <- dstatus
  }
  if (!missing(los)) {
    defaults$los <- los
  }
  if (!missing(drg)) {
    defaults$drg <- drg
  }
  if (!missing(icd_flag)) {
    defaults$icd_flag <- icd_flag
  }
  if (!missing(diag1)) {
    defaults$diag1 <- diag1
  }
  if (!missing(diag2)) {
    defaults$diag2 <- diag2
  }
  if (!missing(diag3)) {
    defaults$diag3 <- diag3
  }
  if (!missing(diag4)) {
    defaults$diag4 <- diag4
  }
  if (!missing(diag5)) {
    defaults$diag5 <- diag5
  }
  if (!missing(proc1)) {
    defaults$proc1 <- proc1
  }
  if (!missing(proc2)) {
    defaults$proc2 <- proc2
  }
  if (!missing(proc3)) {
    defaults$proc3 <- proc3
  }
  if (!missing(proc4)) {
    defaults$proc4 <- proc4
  }
  if (!missing(proc5)) {
    defaults$proc5 <- proc5
  }
  if (!missing(pos)) {
    defaults$pos <- pos
  }
  if (!missing(coins)) {
    defaults$coins <- coins
  }
  if (!missing(copay)) {
    defaults$copay <- copay
  }
  if (!missing(deduct)) {
    defaults$deduct <- deduct
  }
  if (!missing(std_cost)) {
    defaults$std_cost <- std_cost
  }
  if (!missing(std_cost_yr)) {
    defaults$std_cost_yr <- std_cost_yr
  }
  if (!missing(ipstatus)) {
    defaults$ipstatus <- ipstatus
  }
  if (!missing(tos_cd)) {
    defaults$tos_cd <- tos_cd
  }
  if (!missing(version)) {
    defaults$version <- version
  }
  if (!missing(extract_ym)) {
    defaults$extract_ym <- extract_ym
  }
  invisible(defaults)
}

set_defaults_insurance <- function(ptid, encid, insurance_date, insurance_time, ins_type) {
  defaults <- frameworkContext$defaultValues$insurance;
  if (!missing(ptid)) {
    defaults$ptid <- ptid
  }
  if (!missing(encid)) {
    defaults$encid <- encid
  }
  if (!missing(insurance_date)) {
    defaults$insurance_date <- insurance_date
  }
  if (!missing(insurance_time)) {
    defaults$insurance_time <- insurance_time
  }
  if (!missing(ins_type)) {
    defaults$ins_type <- ins_type
  }
  invisible(defaults)
}

set_defaults_lab_results <- function(ptid, pat_planid, fst_dt, tst_nbr, tst_desc, rslt_txt, rslt_nbr, rslt_unit_nm, low_nrml, hi_nrml, abnl_cd, proc_cd, labclmid, anlytseq, loinc_cd, source, version, extract_ym) {
  defaults <- frameworkContext$defaultValues$lab_results;
  if (!missing(ptid)) {
    defaults$ptid <- ptid
  }
  if (!missing(pat_planid)) {
    defaults$pat_planid <- pat_planid
  }
  if (!missing(fst_dt)) {
    defaults$fst_dt <- fst_dt
  }
  if (!missing(tst_nbr)) {
    defaults$tst_nbr <- tst_nbr
  }
  if (!missing(tst_desc)) {
    defaults$tst_desc <- tst_desc
  }
  if (!missing(rslt_txt)) {
    defaults$rslt_txt <- rslt_txt
  }
  if (!missing(rslt_nbr)) {
    defaults$rslt_nbr <- rslt_nbr
  }
  if (!missing(rslt_unit_nm)) {
    defaults$rslt_unit_nm <- rslt_unit_nm
  }
  if (!missing(low_nrml)) {
    defaults$low_nrml <- low_nrml
  }
  if (!missing(hi_nrml)) {
    defaults$hi_nrml <- hi_nrml
  }
  if (!missing(abnl_cd)) {
    defaults$abnl_cd <- abnl_cd
  }
  if (!missing(proc_cd)) {
    defaults$proc_cd <- proc_cd
  }
  if (!missing(labclmid)) {
    defaults$labclmid <- labclmid
  }
  if (!missing(anlytseq)) {
    defaults$anlytseq <- anlytseq
  }
  if (!missing(loinc_cd)) {
    defaults$loinc_cd <- loinc_cd
  }
  if (!missing(source)) {
    defaults$source <- source
  }
  if (!missing(version)) {
    defaults$version <- version
  }
  if (!missing(extract_ym)) {
    defaults$extract_ym <- extract_ym
  }
  invisible(defaults)
}

set_defaults_labs <- function(ptid, encid, test_name, order_date, order_time, collected_date, collected_time, result_date, result_time, test_result, relative_indicator, result_unit, normal_range, evaluated_for_range, value_within_range) {
  defaults <- frameworkContext$defaultValues$labs;
  if (!missing(ptid)) {
    defaults$ptid <- ptid
  }
  if (!missing(encid)) {
    defaults$encid <- encid
  }
  if (!missing(test_name)) {
    defaults$test_name <- test_name
  }
  if (!missing(order_date)) {
    defaults$order_date <- order_date
  }
  if (!missing(order_time)) {
    defaults$order_time <- order_time
  }
  if (!missing(collected_date)) {
    defaults$collected_date <- collected_date
  }
  if (!missing(collected_time)) {
    defaults$collected_time <- collected_time
  }
  if (!missing(result_date)) {
    defaults$result_date <- result_date
  }
  if (!missing(result_time)) {
    defaults$result_time <- result_time
  }
  if (!missing(test_result)) {
    defaults$test_result <- test_result
  }
  if (!missing(relative_indicator)) {
    defaults$relative_indicator <- relative_indicator
  }
  if (!missing(result_unit)) {
    defaults$result_unit <- result_unit
  }
  if (!missing(normal_range)) {
    defaults$normal_range <- normal_range
  }
  if (!missing(evaluated_for_range)) {
    defaults$evaluated_for_range <- evaluated_for_range
  }
  if (!missing(value_within_range)) {
    defaults$value_within_range <- value_within_range
  }
  invisible(defaults)
}

set_defaults_lu_abnl_cd <- function(abnl_cd, description) {
  defaults <- frameworkContext$defaultValues$lu_abnl_cd;
  if (!missing(abnl_cd)) {
    defaults$abnl_cd <- abnl_cd
  }
  if (!missing(description)) {
    defaults$description <- description
  }
  invisible(defaults)
}

set_defaults_lu_ahfsclss <- function(ahfsclss, description) {
  defaults <- frameworkContext$defaultValues$lu_ahfsclss;
  if (!missing(ahfsclss)) {
    defaults$ahfsclss <- ahfsclss
  }
  if (!missing(description)) {
    defaults$description <- description
  }
  invisible(defaults)
}

set_defaults_lu_bus_line <- function(bus, description) {
  defaults <- frameworkContext$defaultValues$lu_bus_line;
  if (!missing(bus)) {
    defaults$bus <- bus
  }
  if (!missing(description)) {
    defaults$description <- description
  }
  invisible(defaults)
}

set_defaults_lu_cdhp <- function(cdhp_cd, description) {
  defaults <- frameworkContext$defaultValues$lu_cdhp;
  if (!missing(cdhp_cd)) {
    defaults$cdhp_cd <- cdhp_cd
  }
  if (!missing(description)) {
    defaults$description <- description
  }
  invisible(defaults)
}

set_defaults_lu_cob <- function(cob, description) {
  defaults <- frameworkContext$defaultValues$lu_cob;
  if (!missing(cob)) {
    defaults$cob <- cob
  }
  if (!missing(description)) {
    defaults$description <- description
  }
  invisible(defaults)
}

set_defaults_lu_daw <- function(daw, description) {
  defaults <- frameworkContext$defaultValues$lu_daw;
  if (!missing(daw)) {
    defaults$daw <- daw
  }
  if (!missing(description)) {
    defaults$description <- description
  }
  invisible(defaults)
}

set_defaults_lu_diagnosis <- function(diag_cd, diag_desc, gdr_spec_cd, diag_fst3_cd, diag_fst3_desc, diag_fst4_cd, diag_fst4_desc, mdc_code, mdc_cd_desc, icd_ver_cd) {
  defaults <- frameworkContext$defaultValues$lu_diagnosis;
  if (!missing(diag_cd)) {
    defaults$diag_cd <- diag_cd
  }
  if (!missing(diag_desc)) {
    defaults$diag_desc <- diag_desc
  }
  if (!missing(gdr_spec_cd)) {
    defaults$gdr_spec_cd <- gdr_spec_cd
  }
  if (!missing(diag_fst3_cd)) {
    defaults$diag_fst3_cd <- diag_fst3_cd
  }
  if (!missing(diag_fst3_desc)) {
    defaults$diag_fst3_desc <- diag_fst3_desc
  }
  if (!missing(diag_fst4_cd)) {
    defaults$diag_fst4_cd <- diag_fst4_cd
  }
  if (!missing(diag_fst4_desc)) {
    defaults$diag_fst4_desc <- diag_fst4_desc
  }
  if (!missing(mdc_code)) {
    defaults$mdc_code <- mdc_code
  }
  if (!missing(mdc_cd_desc)) {
    defaults$mdc_cd_desc <- mdc_cd_desc
  }
  if (!missing(icd_ver_cd)) {
    defaults$icd_ver_cd <- icd_ver_cd
  }
  invisible(defaults)
}

set_defaults_lu_dischstatus <- function(dstatus, description, discharge_status_category) {
  defaults <- frameworkContext$defaultValues$lu_dischstatus;
  if (!missing(dstatus)) {
    defaults$dstatus <- dstatus
  }
  if (!missing(description)) {
    defaults$description <- description
  }
  if (!missing(discharge_status_category)) {
    defaults$discharge_status_category <- discharge_status_category
  }
  invisible(defaults)
}

set_defaults_lu_drg <- function(drg, description, eff_date, end_date) {
  defaults <- frameworkContext$defaultValues$lu_drg;
  if (!missing(drg)) {
    defaults$drg <- drg
  }
  if (!missing(description)) {
    defaults$description <- description
  }
  if (!missing(eff_date)) {
    defaults$eff_date <- eff_date
  }
  if (!missing(end_date)) {
    defaults$end_date <- end_date
  }
  invisible(defaults)
}

set_defaults_lu_encounter <- function(enctr, description) {
  defaults <- frameworkContext$defaultValues$lu_encounter;
  if (!missing(enctr)) {
    defaults$enctr <- enctr
  }
  if (!missing(description)) {
    defaults$description <- description
  }
  invisible(defaults)
}

set_defaults_lu_form_ind <- function(form_ind, description) {
  defaults <- frameworkContext$defaultValues$lu_form_ind;
  if (!missing(form_ind)) {
    defaults$form_ind <- form_ind
  }
  if (!missing(description)) {
    defaults$description <- description
  }
  invisible(defaults)
}

set_defaults_lu_form_typ <- function(form_typ, description) {
  defaults <- frameworkContext$defaultValues$lu_form_typ;
  if (!missing(form_typ)) {
    defaults$form_typ <- form_typ
  }
  if (!missing(description)) {
    defaults$description <- description
  }
  invisible(defaults)
}

set_defaults_lu_fst_fill <- function(fst_fill, bus, description) {
  defaults <- frameworkContext$defaultValues$lu_fst_fill;
  if (!missing(fst_fill)) {
    defaults$fst_fill <- fst_fill
  }
  if (!missing(bus)) {
    defaults$bus <- bus
  }
  if (!missing(description)) {
    defaults$description <- description
  }
  invisible(defaults)
}

set_defaults_lu_gnrc_ind <- function(gnrc_ind, description) {
  defaults <- frameworkContext$defaultValues$lu_gnrc_ind;
  if (!missing(gnrc_ind)) {
    defaults$gnrc_ind <- gnrc_ind
  }
  if (!missing(description)) {
    defaults$description <- description
  }
  invisible(defaults)
}

set_defaults_lu_hccc <- function(hccc, description, hccc_grp_desc, hccc_sum_desc) {
  defaults <- frameworkContext$defaultValues$lu_hccc;
  if (!missing(hccc)) {
    defaults$hccc <- hccc
  }
  if (!missing(description)) {
    defaults$description <- description
  }
  if (!missing(hccc_grp_desc)) {
    defaults$hccc_grp_desc <- hccc_grp_desc
  }
  if (!missing(hccc_sum_desc)) {
    defaults$hccc_sum_desc <- hccc_sum_desc
  }
  invisible(defaults)
}

set_defaults_lu_icd_flag <- function(icd_flag, description) {
  defaults <- frameworkContext$defaultValues$lu_icd_flag;
  if (!missing(icd_flag)) {
    defaults$icd_flag <- icd_flag
  }
  if (!missing(description)) {
    defaults$description <- description
  }
  invisible(defaults)
}

set_defaults_lu_ipstatus <- function(ipstatus, description) {
  defaults <- frameworkContext$defaultValues$lu_ipstatus;
  if (!missing(ipstatus)) {
    defaults$ipstatus <- ipstatus
  }
  if (!missing(description)) {
    defaults$description <- description
  }
  invisible(defaults)
}

set_defaults_lu_loc_cd <- function(loc_cd, description) {
  defaults <- frameworkContext$defaultValues$lu_loc_cd;
  if (!missing(loc_cd)) {
    defaults$loc_cd <- loc_cd
  }
  if (!missing(description)) {
    defaults$description <- description
  }
  invisible(defaults)
}

set_defaults_lu_ndc <- function(ahfsclss, ahfsclss_desc, brnd_nm, ndc, dosage_fm_desc, drg_strgth_desc, drg_strgth_nbr, drg_strgth_unit_desc, drg_strgth_vol_nbr, drg_strgth_vol_unit_desc, gnrc_ind, gnrc_nm, gnrc_nbr, gnrc_sqnc_nbr, ndc_drg_row_eff_dt, ndc_drg_row_end_dt, usc_id, usc_med_desc) {
  defaults <- frameworkContext$defaultValues$lu_ndc;
  if (!missing(ahfsclss)) {
    defaults$ahfsclss <- ahfsclss
  }
  if (!missing(ahfsclss_desc)) {
    defaults$ahfsclss_desc <- ahfsclss_desc
  }
  if (!missing(brnd_nm)) {
    defaults$brnd_nm <- brnd_nm
  }
  if (!missing(ndc)) {
    defaults$ndc <- ndc
  }
  if (!missing(dosage_fm_desc)) {
    defaults$dosage_fm_desc <- dosage_fm_desc
  }
  if (!missing(drg_strgth_desc)) {
    defaults$drg_strgth_desc <- drg_strgth_desc
  }
  if (!missing(drg_strgth_nbr)) {
    defaults$drg_strgth_nbr <- drg_strgth_nbr
  }
  if (!missing(drg_strgth_unit_desc)) {
    defaults$drg_strgth_unit_desc <- drg_strgth_unit_desc
  }
  if (!missing(drg_strgth_vol_nbr)) {
    defaults$drg_strgth_vol_nbr <- drg_strgth_vol_nbr
  }
  if (!missing(drg_strgth_vol_unit_desc)) {
    defaults$drg_strgth_vol_unit_desc <- drg_strgth_vol_unit_desc
  }
  if (!missing(gnrc_ind)) {
    defaults$gnrc_ind <- gnrc_ind
  }
  if (!missing(gnrc_nm)) {
    defaults$gnrc_nm <- gnrc_nm
  }
  if (!missing(gnrc_nbr)) {
    defaults$gnrc_nbr <- gnrc_nbr
  }
  if (!missing(gnrc_sqnc_nbr)) {
    defaults$gnrc_sqnc_nbr <- gnrc_sqnc_nbr
  }
  if (!missing(ndc_drg_row_eff_dt)) {
    defaults$ndc_drg_row_eff_dt <- ndc_drg_row_eff_dt
  }
  if (!missing(ndc_drg_row_end_dt)) {
    defaults$ndc_drg_row_end_dt <- ndc_drg_row_end_dt
  }
  if (!missing(usc_id)) {
    defaults$usc_id <- usc_id
  }
  if (!missing(usc_med_desc)) {
    defaults$usc_med_desc <- usc_med_desc
  }
  invisible(defaults)
}

set_defaults_lu_poa <- function(poa, description) {
  defaults <- frameworkContext$defaultValues$lu_poa;
  if (!missing(poa)) {
    defaults$poa <- poa
  }
  if (!missing(description)) {
    defaults$description <- description
  }
  invisible(defaults)
}

set_defaults_lu_pos <- function(pos, description, category) {
  defaults <- frameworkContext$defaultValues$lu_pos;
  if (!missing(pos)) {
    defaults$pos <- pos
  }
  if (!missing(description)) {
    defaults$description <- description
  }
  if (!missing(category)) {
    defaults$category <- category
  }
  invisible(defaults)
}

set_defaults_lu_prc_typ <- function(prc_typ, description) {
  defaults <- frameworkContext$defaultValues$lu_prc_typ;
  if (!missing(prc_typ)) {
    defaults$prc_typ <- prc_typ
  }
  if (!missing(description)) {
    defaults$description <- description
  }
  invisible(defaults)
}

set_defaults_lu_procedure <- function(category_dtl_cd, category_dtl_code_desc, category_genl_cd, category_genl_cd_desc, proc_cd, proc_desc, proc_end_date, proc_typ_cd) {
  defaults <- frameworkContext$defaultValues$lu_procedure;
  if (!missing(category_dtl_cd)) {
    defaults$category_dtl_cd <- category_dtl_cd
  }
  if (!missing(category_dtl_code_desc)) {
    defaults$category_dtl_code_desc <- category_dtl_code_desc
  }
  if (!missing(category_genl_cd)) {
    defaults$category_genl_cd <- category_genl_cd
  }
  if (!missing(category_genl_cd_desc)) {
    defaults$category_genl_cd_desc <- category_genl_cd_desc
  }
  if (!missing(proc_cd)) {
    defaults$proc_cd <- proc_cd
  }
  if (!missing(proc_desc)) {
    defaults$proc_desc <- proc_desc
  }
  if (!missing(proc_end_date)) {
    defaults$proc_end_date <- proc_end_date
  }
  if (!missing(proc_typ_cd)) {
    defaults$proc_typ_cd <- proc_typ_cd
  }
  invisible(defaults)
}

set_defaults_lu_procmod <- function(procmod, description, notes) {
  defaults <- frameworkContext$defaultValues$lu_procmod;
  if (!missing(procmod)) {
    defaults$procmod <- procmod
  }
  if (!missing(description)) {
    defaults$description <- description
  }
  if (!missing(notes)) {
    defaults$notes <- notes
  }
  invisible(defaults)
}

set_defaults_lu_product <- function(product, description) {
  defaults <- frameworkContext$defaultValues$lu_product;
  if (!missing(product)) {
    defaults$product <- product
  }
  if (!missing(description)) {
    defaults$description <- description
  }
  invisible(defaults)
}

set_defaults_lu_provcat <- function(provcat, description, catgy_rol_up_1_desc, catgy_rol_up_2_desc, catgy_rol_up_3_desc, catgy_rol_up_4_desc) {
  defaults <- frameworkContext$defaultValues$lu_provcat;
  if (!missing(provcat)) {
    defaults$provcat <- provcat
  }
  if (!missing(description)) {
    defaults$description <- description
  }
  if (!missing(catgy_rol_up_1_desc)) {
    defaults$catgy_rol_up_1_desc <- catgy_rol_up_1_desc
  }
  if (!missing(catgy_rol_up_2_desc)) {
    defaults$catgy_rol_up_2_desc <- catgy_rol_up_2_desc
  }
  if (!missing(catgy_rol_up_3_desc)) {
    defaults$catgy_rol_up_3_desc <- catgy_rol_up_3_desc
  }
  if (!missing(catgy_rol_up_4_desc)) {
    defaults$catgy_rol_up_4_desc <- catgy_rol_up_4_desc
  }
  invisible(defaults)
}

set_defaults_lu_rvnu_cd <- function(rvnu_cd, description, rvnu_catgy_desc) {
  defaults <- frameworkContext$defaultValues$lu_rvnu_cd;
  if (!missing(rvnu_cd)) {
    defaults$rvnu_cd <- rvnu_cd
  }
  if (!missing(description)) {
    defaults$description <- description
  }
  if (!missing(rvnu_catgy_desc)) {
    defaults$rvnu_catgy_desc <- rvnu_catgy_desc
  }
  invisible(defaults)
}

set_defaults_lu_specclss <- function(specclss, description) {
  defaults <- frameworkContext$defaultValues$lu_specclss;
  if (!missing(specclss)) {
    defaults$specclss <- specclss
  }
  if (!missing(description)) {
    defaults$description <- description
  }
  invisible(defaults)
}

set_defaults_lu_tos_cd <- function(tos_cd, lvl_1_code, lvl_1_desc, lvl_2_code, lvl_2_desc) {
  defaults <- frameworkContext$defaultValues$lu_tos_cd;
  if (!missing(tos_cd)) {
    defaults$tos_cd <- tos_cd
  }
  if (!missing(lvl_1_code)) {
    defaults$lvl_1_code <- lvl_1_code
  }
  if (!missing(lvl_1_desc)) {
    defaults$lvl_1_desc <- lvl_1_desc
  }
  if (!missing(lvl_2_code)) {
    defaults$lvl_2_code <- lvl_2_code
  }
  if (!missing(lvl_2_desc)) {
    defaults$lvl_2_desc <- lvl_2_desc
  }
  invisible(defaults)
}

set_defaults_medical_claims <- function(ptid, pat_planid, clmid, clmseq, fst_dt, lst_dt, prov, provcat, drg, icd_flag, diag1, diag2, diag3, diag4, diag5, poa1, poa2, poa3, poa4, poa5, proc_cd, procmod, proc1, proc2, proc3, ndc, dstatus, loc_cd, rvnu_cd, pos, enctr, units, coins, copay, deduct, cob, paid_dt, hccc, conf_id, std_cost, std_cost_yr, tos_cd, version, extract_ym) {
  defaults <- frameworkContext$defaultValues$medical_claims;
  if (!missing(ptid)) {
    defaults$ptid <- ptid
  }
  if (!missing(pat_planid)) {
    defaults$pat_planid <- pat_planid
  }
  if (!missing(clmid)) {
    defaults$clmid <- clmid
  }
  if (!missing(clmseq)) {
    defaults$clmseq <- clmseq
  }
  if (!missing(fst_dt)) {
    defaults$fst_dt <- fst_dt
  }
  if (!missing(lst_dt)) {
    defaults$lst_dt <- lst_dt
  }
  if (!missing(prov)) {
    defaults$prov <- prov
  }
  if (!missing(provcat)) {
    defaults$provcat <- provcat
  }
  if (!missing(drg)) {
    defaults$drg <- drg
  }
  if (!missing(icd_flag)) {
    defaults$icd_flag <- icd_flag
  }
  if (!missing(diag1)) {
    defaults$diag1 <- diag1
  }
  if (!missing(diag2)) {
    defaults$diag2 <- diag2
  }
  if (!missing(diag3)) {
    defaults$diag3 <- diag3
  }
  if (!missing(diag4)) {
    defaults$diag4 <- diag4
  }
  if (!missing(diag5)) {
    defaults$diag5 <- diag5
  }
  if (!missing(poa1)) {
    defaults$poa1 <- poa1
  }
  if (!missing(poa2)) {
    defaults$poa2 <- poa2
  }
  if (!missing(poa3)) {
    defaults$poa3 <- poa3
  }
  if (!missing(poa4)) {
    defaults$poa4 <- poa4
  }
  if (!missing(poa5)) {
    defaults$poa5 <- poa5
  }
  if (!missing(proc_cd)) {
    defaults$proc_cd <- proc_cd
  }
  if (!missing(procmod)) {
    defaults$procmod <- procmod
  }
  if (!missing(proc1)) {
    defaults$proc1 <- proc1
  }
  if (!missing(proc2)) {
    defaults$proc2 <- proc2
  }
  if (!missing(proc3)) {
    defaults$proc3 <- proc3
  }
  if (!missing(ndc)) {
    defaults$ndc <- ndc
  }
  if (!missing(dstatus)) {
    defaults$dstatus <- dstatus
  }
  if (!missing(loc_cd)) {
    defaults$loc_cd <- loc_cd
  }
  if (!missing(rvnu_cd)) {
    defaults$rvnu_cd <- rvnu_cd
  }
  if (!missing(pos)) {
    defaults$pos <- pos
  }
  if (!missing(enctr)) {
    defaults$enctr <- enctr
  }
  if (!missing(units)) {
    defaults$units <- units
  }
  if (!missing(coins)) {
    defaults$coins <- coins
  }
  if (!missing(copay)) {
    defaults$copay <- copay
  }
  if (!missing(deduct)) {
    defaults$deduct <- deduct
  }
  if (!missing(cob)) {
    defaults$cob <- cob
  }
  if (!missing(paid_dt)) {
    defaults$paid_dt <- paid_dt
  }
  if (!missing(hccc)) {
    defaults$hccc <- hccc
  }
  if (!missing(conf_id)) {
    defaults$conf_id <- conf_id
  }
  if (!missing(std_cost)) {
    defaults$std_cost <- std_cost
  }
  if (!missing(std_cost_yr)) {
    defaults$std_cost_yr <- std_cost_yr
  }
  if (!missing(tos_cd)) {
    defaults$tos_cd <- tos_cd
  }
  if (!missing(version)) {
    defaults$version <- version
  }
  if (!missing(extract_ym)) {
    defaults$extract_ym <- extract_ym
  }
  invisible(defaults)
}

set_defaults_medication_administrations <- function(ptid, encid, orderid, drug_name, ndc, ndc_source, order_date, order_time, admin_date, admin_time, provid, route, quantity_of_dose, strength, strength_unit, dosage_form, dose_frequency, generic_desc, drug_class) {
  defaults <- frameworkContext$defaultValues$medication_administrations;
  if (!missing(ptid)) {
    defaults$ptid <- ptid
  }
  if (!missing(encid)) {
    defaults$encid <- encid
  }
  if (!missing(orderid)) {
    defaults$orderid <- orderid
  }
  if (!missing(drug_name)) {
    defaults$drug_name <- drug_name
  }
  if (!missing(ndc)) {
    defaults$ndc <- ndc
  }
  if (!missing(ndc_source)) {
    defaults$ndc_source <- ndc_source
  }
  if (!missing(order_date)) {
    defaults$order_date <- order_date
  }
  if (!missing(order_time)) {
    defaults$order_time <- order_time
  }
  if (!missing(admin_date)) {
    defaults$admin_date <- admin_date
  }
  if (!missing(admin_time)) {
    defaults$admin_time <- admin_time
  }
  if (!missing(provid)) {
    defaults$provid <- provid
  }
  if (!missing(route)) {
    defaults$route <- route
  }
  if (!missing(quantity_of_dose)) {
    defaults$quantity_of_dose <- quantity_of_dose
  }
  if (!missing(strength)) {
    defaults$strength <- strength
  }
  if (!missing(strength_unit)) {
    defaults$strength_unit <- strength_unit
  }
  if (!missing(dosage_form)) {
    defaults$dosage_form <- dosage_form
  }
  if (!missing(dose_frequency)) {
    defaults$dose_frequency <- dose_frequency
  }
  if (!missing(generic_desc)) {
    defaults$generic_desc <- generic_desc
  }
  if (!missing(drug_class)) {
    defaults$drug_class <- drug_class
  }
  invisible(defaults)
}

set_defaults_member_detail <- function(ptid, pat_planid, eligeff, eligend, aso, product, bus, cdhp, group_nbr, medical_coverage_ind, pharmacy_coverage_ind, version, extract_ym) {
  defaults <- frameworkContext$defaultValues$member_detail;
  if (!missing(ptid)) {
    defaults$ptid <- ptid
  }
  if (!missing(pat_planid)) {
    defaults$pat_planid <- pat_planid
  }
  if (!missing(eligeff)) {
    defaults$eligeff <- eligeff
  }
  if (!missing(eligend)) {
    defaults$eligend <- eligend
  }
  if (!missing(aso)) {
    defaults$aso <- aso
  }
  if (!missing(product)) {
    defaults$product <- product
  }
  if (!missing(bus)) {
    defaults$bus <- bus
  }
  if (!missing(cdhp)) {
    defaults$cdhp <- cdhp
  }
  if (!missing(group_nbr)) {
    defaults$group_nbr <- group_nbr
  }
  if (!missing(medical_coverage_ind)) {
    defaults$medical_coverage_ind <- medical_coverage_ind
  }
  if (!missing(pharmacy_coverage_ind)) {
    defaults$pharmacy_coverage_ind <- pharmacy_coverage_ind
  }
  if (!missing(version)) {
    defaults$version <- version
  }
  if (!missing(extract_ym)) {
    defaults$extract_ym <- extract_ym
  }
  invisible(defaults)
}

set_defaults_microbiology <- function(ptid, encid, order_date, order_time, collect_date, collect_time, receive_date, receive_time, result_date, result_time, result_status, specimen_source, organism, mapped_organism_found, mapped_organism_excluded, culture_growth, culture_value, culture_unit, antibiotic, mapped_antibiotic, sensitivity) {
  defaults <- frameworkContext$defaultValues$microbiology;
  if (!missing(ptid)) {
    defaults$ptid <- ptid
  }
  if (!missing(encid)) {
    defaults$encid <- encid
  }
  if (!missing(order_date)) {
    defaults$order_date <- order_date
  }
  if (!missing(order_time)) {
    defaults$order_time <- order_time
  }
  if (!missing(collect_date)) {
    defaults$collect_date <- collect_date
  }
  if (!missing(collect_time)) {
    defaults$collect_time <- collect_time
  }
  if (!missing(receive_date)) {
    defaults$receive_date <- receive_date
  }
  if (!missing(receive_time)) {
    defaults$receive_time <- receive_time
  }
  if (!missing(result_date)) {
    defaults$result_date <- result_date
  }
  if (!missing(result_time)) {
    defaults$result_time <- result_time
  }
  if (!missing(result_status)) {
    defaults$result_status <- result_status
  }
  if (!missing(specimen_source)) {
    defaults$specimen_source <- specimen_source
  }
  if (!missing(organism)) {
    defaults$organism <- organism
  }
  if (!missing(mapped_organism_found)) {
    defaults$mapped_organism_found <- mapped_organism_found
  }
  if (!missing(mapped_organism_excluded)) {
    defaults$mapped_organism_excluded <- mapped_organism_excluded
  }
  if (!missing(culture_growth)) {
    defaults$culture_growth <- culture_growth
  }
  if (!missing(culture_value)) {
    defaults$culture_value <- culture_value
  }
  if (!missing(culture_unit)) {
    defaults$culture_unit <- culture_unit
  }
  if (!missing(antibiotic)) {
    defaults$antibiotic <- antibiotic
  }
  if (!missing(mapped_antibiotic)) {
    defaults$mapped_antibiotic <- mapped_antibiotic
  }
  if (!missing(sensitivity)) {
    defaults$sensitivity <- sensitivity
  }
  invisible(defaults)
}

set_defaults_nlp_biomarkers <- function(ptid, note_date, biomarker, variation_detail, biomarker_status) {
  defaults <- frameworkContext$defaultValues$nlp_biomarkers;
  if (!missing(ptid)) {
    defaults$ptid <- ptid
  }
  if (!missing(note_date)) {
    defaults$note_date <- note_date
  }
  if (!missing(biomarker)) {
    defaults$biomarker <- biomarker
  }
  if (!missing(variation_detail)) {
    defaults$variation_detail <- variation_detail
  }
  if (!missing(biomarker_status)) {
    defaults$biomarker_status <- biomarker_status
  }
  invisible(defaults)
}

set_defaults_nlp_custom <- function(ptid, encid, note_date, nlp_term, nlp_term_attribute1, nlp_term_attribute2, nlp_term_qualifier, note_section) {
  defaults <- frameworkContext$defaultValues$nlp_custom;
  if (!missing(ptid)) {
    defaults$ptid <- ptid
  }
  if (!missing(encid)) {
    defaults$encid <- encid
  }
  if (!missing(note_date)) {
    defaults$note_date <- note_date
  }
  if (!missing(nlp_term)) {
    defaults$nlp_term <- nlp_term
  }
  if (!missing(nlp_term_attribute1)) {
    defaults$nlp_term_attribute1 <- nlp_term_attribute1
  }
  if (!missing(nlp_term_attribute2)) {
    defaults$nlp_term_attribute2 <- nlp_term_attribute2
  }
  if (!missing(nlp_term_qualifier)) {
    defaults$nlp_term_qualifier <- nlp_term_qualifier
  }
  if (!missing(note_section)) {
    defaults$note_section <- note_section
  }
  invisible(defaults)
}

set_defaults_nlp_drug_rationale <- function(ptid, encid, note_date, note_section, drug_name, drug_action, drug_action_preposition, reason_general, sentiment, sentiment_who) {
  defaults <- frameworkContext$defaultValues$nlp_drug_rationale;
  if (!missing(ptid)) {
    defaults$ptid <- ptid
  }
  if (!missing(encid)) {
    defaults$encid <- encid
  }
  if (!missing(note_date)) {
    defaults$note_date <- note_date
  }
  if (!missing(note_section)) {
    defaults$note_section <- note_section
  }
  if (!missing(drug_name)) {
    defaults$drug_name <- drug_name
  }
  if (!missing(drug_action)) {
    defaults$drug_action <- drug_action
  }
  if (!missing(drug_action_preposition)) {
    defaults$drug_action_preposition <- drug_action_preposition
  }
  if (!missing(reason_general)) {
    defaults$reason_general <- reason_general
  }
  if (!missing(sentiment)) {
    defaults$sentiment <- sentiment
  }
  if (!missing(sentiment_who)) {
    defaults$sentiment_who <- sentiment_who
  }
  invisible(defaults)
}

set_defaults_nlp_measurement <- function(ptid, encid, note_date, measurement_type, measurement_value, measurement_detail, note_section, measurement_year, measurement_yearmonth, measurement_date) {
  defaults <- frameworkContext$defaultValues$nlp_measurement;
  if (!missing(ptid)) {
    defaults$ptid <- ptid
  }
  if (!missing(encid)) {
    defaults$encid <- encid
  }
  if (!missing(note_date)) {
    defaults$note_date <- note_date
  }
  if (!missing(measurement_type)) {
    defaults$measurement_type <- measurement_type
  }
  if (!missing(measurement_value)) {
    defaults$measurement_value <- measurement_value
  }
  if (!missing(measurement_detail)) {
    defaults$measurement_detail <- measurement_detail
  }
  if (!missing(note_section)) {
    defaults$note_section <- note_section
  }
  if (!missing(measurement_year)) {
    defaults$measurement_year <- measurement_year
  }
  if (!missing(measurement_yearmonth)) {
    defaults$measurement_yearmonth <- measurement_yearmonth
  }
  if (!missing(measurement_date)) {
    defaults$measurement_date <- measurement_date
  }
  invisible(defaults)
}

set_defaults_nlp_sds <- function(ptid, encid, note_date, sds_term, sds_location, sds_attribute, sds_sentiment, occurrence_year, occurrence_yearmonth, occurrence_date, note_section, sds_concept, sds_timing, sds_severity, sds_extent, sds_duration, sds_change, sds_quality) {
  defaults <- frameworkContext$defaultValues$nlp_sds;
  if (!missing(ptid)) {
    defaults$ptid <- ptid
  }
  if (!missing(encid)) {
    defaults$encid <- encid
  }
  if (!missing(note_date)) {
    defaults$note_date <- note_date
  }
  if (!missing(sds_term)) {
    defaults$sds_term <- sds_term
  }
  if (!missing(sds_location)) {
    defaults$sds_location <- sds_location
  }
  if (!missing(sds_attribute)) {
    defaults$sds_attribute <- sds_attribute
  }
  if (!missing(sds_sentiment)) {
    defaults$sds_sentiment <- sds_sentiment
  }
  if (!missing(occurrence_year)) {
    defaults$occurrence_year <- occurrence_year
  }
  if (!missing(occurrence_yearmonth)) {
    defaults$occurrence_yearmonth <- occurrence_yearmonth
  }
  if (!missing(occurrence_date)) {
    defaults$occurrence_date <- occurrence_date
  }
  if (!missing(note_section)) {
    defaults$note_section <- note_section
  }
  if (!missing(sds_concept)) {
    defaults$sds_concept <- sds_concept
  }
  if (!missing(sds_timing)) {
    defaults$sds_timing <- sds_timing
  }
  if (!missing(sds_severity)) {
    defaults$sds_severity <- sds_severity
  }
  if (!missing(sds_extent)) {
    defaults$sds_extent <- sds_extent
  }
  if (!missing(sds_duration)) {
    defaults$sds_duration <- sds_duration
  }
  if (!missing(sds_change)) {
    defaults$sds_change <- sds_change
  }
  if (!missing(sds_quality)) {
    defaults$sds_quality <- sds_quality
  }
  invisible(defaults)
}

set_defaults_nlp_sds_family <- function(ptid, encid, note_date, sds_term, sds_location, sds_family_member, sds_sentiment, note_section) {
  defaults <- frameworkContext$defaultValues$nlp_sds_family;
  if (!missing(ptid)) {
    defaults$ptid <- ptid
  }
  if (!missing(encid)) {
    defaults$encid <- encid
  }
  if (!missing(note_date)) {
    defaults$note_date <- note_date
  }
  if (!missing(sds_term)) {
    defaults$sds_term <- sds_term
  }
  if (!missing(sds_location)) {
    defaults$sds_location <- sds_location
  }
  if (!missing(sds_family_member)) {
    defaults$sds_family_member <- sds_family_member
  }
  if (!missing(sds_sentiment)) {
    defaults$sds_sentiment <- sds_sentiment
  }
  if (!missing(note_section)) {
    defaults$note_section <- note_section
  }
  invisible(defaults)
}

set_defaults_observations <- function(ptid, encid, obs_type, nlp, obs_date, obs_time, obsresult, obs_unit, evaluated_for_range, value_within_range, result_date) {
  defaults <- frameworkContext$defaultValues$observations;
  if (!missing(ptid)) {
    defaults$ptid <- ptid
  }
  if (!missing(encid)) {
    defaults$encid <- encid
  }
  if (!missing(obs_type)) {
    defaults$obs_type <- obs_type
  }
  if (!missing(nlp)) {
    defaults$nlp <- nlp
  }
  if (!missing(obs_date)) {
    defaults$obs_date <- obs_date
  }
  if (!missing(obs_time)) {
    defaults$obs_time <- obs_time
  }
  if (!missing(obsresult)) {
    defaults$obsresult <- obsresult
  }
  if (!missing(obs_unit)) {
    defaults$obs_unit <- obs_unit
  }
  if (!missing(evaluated_for_range)) {
    defaults$evaluated_for_range <- evaluated_for_range
  }
  if (!missing(value_within_range)) {
    defaults$value_within_range <- value_within_range
  }
  if (!missing(result_date)) {
    defaults$result_date <- result_date
  }
  invisible(defaults)
}

set_defaults_patient <- function(ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, date_of_death, provid_pcp, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through, overlap) {
  defaults <- frameworkContext$defaultValues$patient;
  if (!missing(ptid)) {
    defaults$ptid <- ptid
  }
  if (!missing(birth_yr)) {
    defaults$birth_yr <- birth_yr
  }
  if (!missing(gender)) {
    defaults$gender <- gender
  }
  if (!missing(race)) {
    defaults$race <- race
  }
  if (!missing(ethnicity)) {
    defaults$ethnicity <- ethnicity
  }
  if (!missing(region)) {
    defaults$region <- region
  }
  if (!missing(division)) {
    defaults$division <- division
  }
  if (!missing(avg_hh_income)) {
    defaults$avg_hh_income <- avg_hh_income
  }
  if (!missing(pct_college_educ)) {
    defaults$pct_college_educ <- pct_college_educ
  }
  if (!missing(deceased_indicator)) {
    defaults$deceased_indicator <- deceased_indicator
  }
  if (!missing(date_of_death)) {
    defaults$date_of_death <- date_of_death
  }
  if (!missing(provid_pcp)) {
    defaults$provid_pcp <- provid_pcp
  }
  if (!missing(idn_indicator)) {
    defaults$idn_indicator <- idn_indicator
  }
  if (!missing(first_month_active)) {
    defaults$first_month_active <- first_month_active
  }
  if (!missing(last_month_active)) {
    defaults$last_month_active <- last_month_active
  }
  if (!missing(notes_eligible)) {
    defaults$notes_eligible <- notes_eligible
  }
  if (!missing(has_notes)) {
    defaults$has_notes <- has_notes
  }
  if (!missing(sourceid)) {
    defaults$sourceid <- sourceid
  }
  if (!missing(source_data_through)) {
    defaults$source_data_through <- source_data_through
  }
  if (!missing(overlap)) {
    defaults$overlap <- overlap
  }
  invisible(defaults)
}

set_defaults_patient_reported_medications <- function(ptid, reported_date, drug_name, ndc, ndc_source, provid, route, quantity_of_dose, strength, strength_unit, dosage_form, dose_frequency, generic_desc, drug_class) {
  defaults <- frameworkContext$defaultValues$patient_reported_medications;
  if (!missing(ptid)) {
    defaults$ptid <- ptid
  }
  if (!missing(reported_date)) {
    defaults$reported_date <- reported_date
  }
  if (!missing(drug_name)) {
    defaults$drug_name <- drug_name
  }
  if (!missing(ndc)) {
    defaults$ndc <- ndc
  }
  if (!missing(ndc_source)) {
    defaults$ndc_source <- ndc_source
  }
  if (!missing(provid)) {
    defaults$provid <- provid
  }
  if (!missing(route)) {
    defaults$route <- route
  }
  if (!missing(quantity_of_dose)) {
    defaults$quantity_of_dose <- quantity_of_dose
  }
  if (!missing(strength)) {
    defaults$strength <- strength
  }
  if (!missing(strength_unit)) {
    defaults$strength_unit <- strength_unit
  }
  if (!missing(dosage_form)) {
    defaults$dosage_form <- dosage_form
  }
  if (!missing(dose_frequency)) {
    defaults$dose_frequency <- dose_frequency
  }
  if (!missing(generic_desc)) {
    defaults$generic_desc <- generic_desc
  }
  if (!missing(drug_class)) {
    defaults$drug_class <- drug_class
  }
  invisible(defaults)
}

set_defaults_prescriptions_written <- function(ptid, rxdate, rxtime, drug_name, ndc, ndc_source, provid, route, quantity_of_dose, strength, strength_unit, dosage_form, daily_dose, dose_frequency, quantity_per_fill, num_refills, days_supply, generic_desc, drug_class) {
  defaults <- frameworkContext$defaultValues$prescriptions_written;
  if (!missing(ptid)) {
    defaults$ptid <- ptid
  }
  if (!missing(rxdate)) {
    defaults$rxdate <- rxdate
  }
  if (!missing(rxtime)) {
    defaults$rxtime <- rxtime
  }
  if (!missing(drug_name)) {
    defaults$drug_name <- drug_name
  }
  if (!missing(ndc)) {
    defaults$ndc <- ndc
  }
  if (!missing(ndc_source)) {
    defaults$ndc_source <- ndc_source
  }
  if (!missing(provid)) {
    defaults$provid <- provid
  }
  if (!missing(route)) {
    defaults$route <- route
  }
  if (!missing(quantity_of_dose)) {
    defaults$quantity_of_dose <- quantity_of_dose
  }
  if (!missing(strength)) {
    defaults$strength <- strength
  }
  if (!missing(strength_unit)) {
    defaults$strength_unit <- strength_unit
  }
  if (!missing(dosage_form)) {
    defaults$dosage_form <- dosage_form
  }
  if (!missing(daily_dose)) {
    defaults$daily_dose <- daily_dose
  }
  if (!missing(dose_frequency)) {
    defaults$dose_frequency <- dose_frequency
  }
  if (!missing(quantity_per_fill)) {
    defaults$quantity_per_fill <- quantity_per_fill
  }
  if (!missing(num_refills)) {
    defaults$num_refills <- num_refills
  }
  if (!missing(days_supply)) {
    defaults$days_supply <- days_supply
  }
  if (!missing(generic_desc)) {
    defaults$generic_desc <- generic_desc
  }
  if (!missing(drug_class)) {
    defaults$drug_class <- drug_class
  }
  invisible(defaults)
}

set_defaults_procedure <- function(ptid, encid, proc_date, proc_time, proc_code, proc_desc, proc_code_type, provid_perform, provid_order, betos_code, betos_desc) {
  defaults <- frameworkContext$defaultValues$procedure;
  if (!missing(ptid)) {
    defaults$ptid <- ptid
  }
  if (!missing(encid)) {
    defaults$encid <- encid
  }
  if (!missing(proc_date)) {
    defaults$proc_date <- proc_date
  }
  if (!missing(proc_time)) {
    defaults$proc_time <- proc_time
  }
  if (!missing(proc_code)) {
    defaults$proc_code <- proc_code
  }
  if (!missing(proc_desc)) {
    defaults$proc_desc <- proc_desc
  }
  if (!missing(proc_code_type)) {
    defaults$proc_code_type <- proc_code_type
  }
  if (!missing(provid_perform)) {
    defaults$provid_perform <- provid_perform
  }
  if (!missing(provid_order)) {
    defaults$provid_order <- provid_order
  }
  if (!missing(betos_code)) {
    defaults$betos_code <- betos_code
  }
  if (!missing(betos_desc)) {
    defaults$betos_desc <- betos_desc
  }
  invisible(defaults)
}

set_defaults_provider <- function(provid, specialty, prim_spec_ind) {
  defaults <- frameworkContext$defaultValues$provider;
  if (!missing(provid)) {
    defaults$provid <- provid
  }
  if (!missing(specialty)) {
    defaults$specialty <- specialty
  }
  if (!missing(prim_spec_ind)) {
    defaults$prim_spec_ind <- prim_spec_ind
  }
  invisible(defaults)
}

set_defaults_rx_claims <- function(ptid, pat_planid, clmid, chk_dt, npi, fill_dt, ahfsclss, specclss, brnd_nm, ndc, gnrc_ind, avgwhlsl, copay, deduct, daw, form_ind, form_typ, strength, days_sup, quantity, fst_fill, rfl_nbr, prc_typ, std_cost, std_cost_yr, version, extract_ym) {
  defaults <- frameworkContext$defaultValues$rx_claims;
  if (!missing(ptid)) {
    defaults$ptid <- ptid
  }
  if (!missing(pat_planid)) {
    defaults$pat_planid <- pat_planid
  }
  if (!missing(clmid)) {
    defaults$clmid <- clmid
  }
  if (!missing(chk_dt)) {
    defaults$chk_dt <- chk_dt
  }
  if (!missing(npi)) {
    defaults$npi <- npi
  }
  if (!missing(fill_dt)) {
    defaults$fill_dt <- fill_dt
  }
  if (!missing(ahfsclss)) {
    defaults$ahfsclss <- ahfsclss
  }
  if (!missing(specclss)) {
    defaults$specclss <- specclss
  }
  if (!missing(brnd_nm)) {
    defaults$brnd_nm <- brnd_nm
  }
  if (!missing(ndc)) {
    defaults$ndc <- ndc
  }
  if (!missing(gnrc_ind)) {
    defaults$gnrc_ind <- gnrc_ind
  }
  if (!missing(avgwhlsl)) {
    defaults$avgwhlsl <- avgwhlsl
  }
  if (!missing(copay)) {
    defaults$copay <- copay
  }
  if (!missing(deduct)) {
    defaults$deduct <- deduct
  }
  if (!missing(daw)) {
    defaults$daw <- daw
  }
  if (!missing(form_ind)) {
    defaults$form_ind <- form_ind
  }
  if (!missing(form_typ)) {
    defaults$form_typ <- form_typ
  }
  if (!missing(strength)) {
    defaults$strength <- strength
  }
  if (!missing(days_sup)) {
    defaults$days_sup <- days_sup
  }
  if (!missing(quantity)) {
    defaults$quantity <- quantity
  }
  if (!missing(fst_fill)) {
    defaults$fst_fill <- fst_fill
  }
  if (!missing(rfl_nbr)) {
    defaults$rfl_nbr <- rfl_nbr
  }
  if (!missing(prc_typ)) {
    defaults$prc_typ <- prc_typ
  }
  if (!missing(std_cost)) {
    defaults$std_cost <- std_cost
  }
  if (!missing(std_cost_yr)) {
    defaults$std_cost_yr <- std_cost_yr
  }
  if (!missing(version)) {
    defaults$version <- version
  }
  if (!missing(extract_ym)) {
    defaults$extract_ym <- extract_ym
  }
  invisible(defaults)
}

set_defaults_visit <- function(ptid, visitid, visit_type, visit_start_date, visit_start_time, visit_end_date, visit_end_time, discharge_disposition, admission_source, drg) {
  defaults <- frameworkContext$defaultValues$visit;
  if (!missing(ptid)) {
    defaults$ptid <- ptid
  }
  if (!missing(visitid)) {
    defaults$visitid <- visitid
  }
  if (!missing(visit_type)) {
    defaults$visit_type <- visit_type
  }
  if (!missing(visit_start_date)) {
    defaults$visit_start_date <- visit_start_date
  }
  if (!missing(visit_start_time)) {
    defaults$visit_start_time <- visit_start_time
  }
  if (!missing(visit_end_date)) {
    defaults$visit_end_date <- visit_end_date
  }
  if (!missing(visit_end_time)) {
    defaults$visit_end_time <- visit_end_time
  }
  if (!missing(discharge_disposition)) {
    defaults$discharge_disposition <- discharge_disposition
  }
  if (!missing(admission_source)) {
    defaults$admission_source <- admission_source
  }
  if (!missing(drg)) {
    defaults$drg <- drg
  }
  invisible(defaults)
}

get_defaults_U_version <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_care_area <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_diagnosis <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_encounter <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_encounter_provider <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_immunizations <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_inpatient_confinement <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_insurance <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_lab_results <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_labs <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_lu_abnl_cd <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_lu_ahfsclss <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_lu_bus_line <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_lu_cdhp <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_lu_cob <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_lu_daw <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_lu_diagnosis <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_lu_dischstatus <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_lu_drg <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_lu_encounter <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_lu_form_ind <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_lu_form_typ <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_lu_fst_fill <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_lu_gnrc_ind <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_lu_hccc <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_lu_icd_flag <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_lu_ipstatus <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_lu_loc_cd <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_lu_ndc <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_lu_poa <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_lu_pos <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_lu_prc_typ <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_lu_procedure <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_lu_procmod <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_lu_product <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_lu_provcat <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_lu_rvnu_cd <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_lu_specclss <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_lu_tos_cd <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_medical_claims <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_medication_administrations <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_member_detail <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_microbiology <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_nlp_biomarkers <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_nlp_custom <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_nlp_drug_rationale <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_nlp_measurement <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_nlp_sds <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_nlp_sds_family <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_observations <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_patient <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_patient_reported_medications <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_prescriptions_written <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_procedure <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_provider <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_rx_claims <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_visit <- function() {
  return(frameworkContext$defaultValues)
}

add_U_version <- function(version_id, version_date) {
  defaults <- frameworkContext$defaultValues$U_version;
  insertFields <- c()
  insertValues <- c()
  if (missing(version_id)) {
    version_id <- defaults$version_id
  }
  if (!is.null(version_id)) {
    insertFields <- c(insertFields, "version_id")
    insertValues <- c(insertValues, version_id)
  }

  if (missing(version_date)) {
    version_date <- defaults$version_date
  }
  if (!is.null(version_date)) {
    insertFields <- c(insertFields, "version_date")
    insertValues <- c(insertValues, version_date)
  }

  statement <- paste0("INSERT INTO @source_schema._version (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
  invisible(statement);
}

add_care_area <- function(ptid, encid, carearea, carearea_date, carearea_time) {
  defaults <- frameworkContext$defaultValues$care_area;
  insertFields <- c()
  insertValues <- c()
  if (missing(ptid)) {
    ptid <- defaults$ptid
  }
  if (!is.null(ptid)) {
    insertFields <- c(insertFields, "ptid")
    insertValues <- c(insertValues, ptid)
  }

  if (missing(encid)) {
    encid <- defaults$encid
  }
  if (!is.null(encid)) {
    insertFields <- c(insertFields, "encid")
    insertValues <- c(insertValues, encid)
  }

  if (missing(carearea)) {
    carearea <- defaults$carearea
  }
  if (!is.null(carearea)) {
    insertFields <- c(insertFields, "carearea")
    insertValues <- c(insertValues, carearea)
  }

  if (missing(carearea_date)) {
    carearea_date <- defaults$carearea_date
  }
  if (!is.null(carearea_date)) {
    insertFields <- c(insertFields, "carearea_date")
    insertValues <- c(insertValues, carearea_date)
  }

  if (missing(carearea_time)) {
    carearea_time <- defaults$carearea_time
  }
  if (!is.null(carearea_time)) {
    insertFields <- c(insertFields, "carearea_time")
    insertValues <- c(insertValues, carearea_time)
  }

  statement <- paste0("INSERT INTO @source_schema.care_area (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
  invisible(statement);
}

add_diagnosis <- function(ptid, encid, diag_date, diag_time, diagnosis_cd, diagnosis_cd_type, diagnosis_status, poa, admitting_diagnosis, discharge_diagnosis, primary_diagnosis, problem_list) {
  defaults <- frameworkContext$defaultValues$diagnosis;
  insertFields <- c()
  insertValues <- c()
  if (missing(ptid)) {
    ptid <- defaults$ptid
  }
  if (!is.null(ptid)) {
    insertFields <- c(insertFields, "ptid")
    insertValues <- c(insertValues, ptid)
  }

  if (missing(encid)) {
    encid <- defaults$encid
  }
  if (!is.null(encid)) {
    insertFields <- c(insertFields, "encid")
    insertValues <- c(insertValues, encid)
  }

  if (missing(diag_date)) {
    diag_date <- defaults$diag_date
  }
  if (!is.null(diag_date)) {
    insertFields <- c(insertFields, "diag_date")
    insertValues <- c(insertValues, diag_date)
  }

  if (missing(diag_time)) {
    diag_time <- defaults$diag_time
  }
  if (!is.null(diag_time)) {
    insertFields <- c(insertFields, "diag_time")
    insertValues <- c(insertValues, diag_time)
  }

  if (missing(diagnosis_cd)) {
    diagnosis_cd <- defaults$diagnosis_cd
  }
  if (!is.null(diagnosis_cd)) {
    insertFields <- c(insertFields, "diagnosis_cd")
    insertValues <- c(insertValues, diagnosis_cd)
  }

  if (missing(diagnosis_cd_type)) {
    diagnosis_cd_type <- defaults$diagnosis_cd_type
  }
  if (!is.null(diagnosis_cd_type)) {
    insertFields <- c(insertFields, "diagnosis_cd_type")
    insertValues <- c(insertValues, diagnosis_cd_type)
  }

  if (missing(diagnosis_status)) {
    diagnosis_status <- defaults$diagnosis_status
  }
  if (!is.null(diagnosis_status)) {
    insertFields <- c(insertFields, "diagnosis_status")
    insertValues <- c(insertValues, diagnosis_status)
  }

  if (missing(poa)) {
    poa <- defaults$poa
  }
  if (!is.null(poa)) {
    insertFields <- c(insertFields, "poa")
    insertValues <- c(insertValues, poa)
  }

  if (missing(admitting_diagnosis)) {
    admitting_diagnosis <- defaults$admitting_diagnosis
  }
  if (!is.null(admitting_diagnosis)) {
    insertFields <- c(insertFields, "admitting_diagnosis")
    insertValues <- c(insertValues, admitting_diagnosis)
  }

  if (missing(discharge_diagnosis)) {
    discharge_diagnosis <- defaults$discharge_diagnosis
  }
  if (!is.null(discharge_diagnosis)) {
    insertFields <- c(insertFields, "discharge_diagnosis")
    insertValues <- c(insertValues, discharge_diagnosis)
  }

  if (missing(primary_diagnosis)) {
    primary_diagnosis <- defaults$primary_diagnosis
  }
  if (!is.null(primary_diagnosis)) {
    insertFields <- c(insertFields, "primary_diagnosis")
    insertValues <- c(insertValues, primary_diagnosis)
  }

  if (missing(problem_list)) {
    problem_list <- defaults$problem_list
  }
  if (!is.null(problem_list)) {
    insertFields <- c(insertFields, "problem_list")
    insertValues <- c(insertValues, problem_list)
  }

  statement <- paste0("INSERT INTO @source_schema.diagnosis (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
  invisible(statement);
}

add_encounter <- function(ptid, visitid, encid, interaction_type, interaction_date, interaction_time) {
  defaults <- frameworkContext$defaultValues$encounter;
  insertFields <- c()
  insertValues <- c()
  if (missing(ptid)) {
    ptid <- defaults$ptid
  }
  if (!is.null(ptid)) {
    insertFields <- c(insertFields, "ptid")
    insertValues <- c(insertValues, ptid)
  }

  if (missing(visitid)) {
    visitid <- defaults$visitid
  }
  if (!is.null(visitid)) {
    insertFields <- c(insertFields, "visitid")
    insertValues <- c(insertValues, visitid)
  }

  if (missing(encid)) {
    encid <- defaults$encid
  }
  if (!is.null(encid)) {
    insertFields <- c(insertFields, "encid")
    insertValues <- c(insertValues, encid)
  }

  if (missing(interaction_type)) {
    interaction_type <- defaults$interaction_type
  }
  if (!is.null(interaction_type)) {
    insertFields <- c(insertFields, "interaction_type")
    insertValues <- c(insertValues, interaction_type)
  }

  if (missing(interaction_date)) {
    interaction_date <- defaults$interaction_date
  }
  if (!is.null(interaction_date)) {
    insertFields <- c(insertFields, "interaction_date")
    insertValues <- c(insertValues, interaction_date)
  }

  if (missing(interaction_time)) {
    interaction_time <- defaults$interaction_time
  }
  if (!is.null(interaction_time)) {
    insertFields <- c(insertFields, "interaction_time")
    insertValues <- c(insertValues, interaction_time)
  }

  statement <- paste0("INSERT INTO @source_schema.encounter (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
  invisible(statement);
}

add_encounter_provider <- function(encid, provid, provider_role) {
  defaults <- frameworkContext$defaultValues$encounter_provider;
  insertFields <- c()
  insertValues <- c()
  if (missing(encid)) {
    encid <- defaults$encid
  }
  if (!is.null(encid)) {
    insertFields <- c(insertFields, "encid")
    insertValues <- c(insertValues, encid)
  }

  if (missing(provid)) {
    provid <- defaults$provid
  }
  if (!is.null(provid)) {
    insertFields <- c(insertFields, "provid")
    insertValues <- c(insertValues, provid)
  }

  if (missing(provider_role)) {
    provider_role <- defaults$provider_role
  }
  if (!is.null(provider_role)) {
    insertFields <- c(insertFields, "provider_role")
    insertValues <- c(insertValues, provider_role)
  }

  statement <- paste0("INSERT INTO @source_schema.encounter_provider (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
  invisible(statement);
}

add_immunizations <- function(ptid, immunization_date, immunization_desc, mapped_name, ndc, ndc_source, pt_reported) {
  defaults <- frameworkContext$defaultValues$immunizations;
  insertFields <- c()
  insertValues <- c()
  if (missing(ptid)) {
    ptid <- defaults$ptid
  }
  if (!is.null(ptid)) {
    insertFields <- c(insertFields, "ptid")
    insertValues <- c(insertValues, ptid)
  }

  if (missing(immunization_date)) {
    immunization_date <- defaults$immunization_date
  }
  if (!is.null(immunization_date)) {
    insertFields <- c(insertFields, "immunization_date")
    insertValues <- c(insertValues, immunization_date)
  }

  if (missing(immunization_desc)) {
    immunization_desc <- defaults$immunization_desc
  }
  if (!is.null(immunization_desc)) {
    insertFields <- c(insertFields, "immunization_desc")
    insertValues <- c(insertValues, immunization_desc)
  }

  if (missing(mapped_name)) {
    mapped_name <- defaults$mapped_name
  }
  if (!is.null(mapped_name)) {
    insertFields <- c(insertFields, "mapped_name")
    insertValues <- c(insertValues, mapped_name)
  }

  if (missing(ndc)) {
    ndc <- defaults$ndc
  }
  if (!is.null(ndc)) {
    insertFields <- c(insertFields, "ndc")
    insertValues <- c(insertValues, ndc)
  }

  if (missing(ndc_source)) {
    ndc_source <- defaults$ndc_source
  }
  if (!is.null(ndc_source)) {
    insertFields <- c(insertFields, "ndc_source")
    insertValues <- c(insertValues, ndc_source)
  }

  if (missing(pt_reported)) {
    pt_reported <- defaults$pt_reported
  }
  if (!is.null(pt_reported)) {
    insertFields <- c(insertFields, "pt_reported")
    insertValues <- c(insertValues, pt_reported)
  }

  statement <- paste0("INSERT INTO @source_schema.immunizations (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
  invisible(statement);
}

add_inpatient_confinement <- function(ptid, pat_planid, conf_id, prov, admit_date, disch_date, dstatus, los, drg, icd_flag, diag1, diag2, diag3, diag4, diag5, proc1, proc2, proc3, proc4, proc5, pos, coins, copay, deduct, std_cost, std_cost_yr, ipstatus, tos_cd, version, extract_ym) {
  defaults <- frameworkContext$defaultValues$inpatient_confinement;
  insertFields <- c()
  insertValues <- c()
  if (missing(ptid)) {
    ptid <- defaults$ptid
  }
  if (!is.null(ptid)) {
    insertFields <- c(insertFields, "ptid")
    insertValues <- c(insertValues, ptid)
  }

  if (missing(pat_planid)) {
    pat_planid <- defaults$pat_planid
  }
  if (!is.null(pat_planid)) {
    insertFields <- c(insertFields, "pat_planid")
    insertValues <- c(insertValues, pat_planid)
  }

  if (missing(conf_id)) {
    conf_id <- defaults$conf_id
  }
  if (!is.null(conf_id)) {
    insertFields <- c(insertFields, "conf_id")
    insertValues <- c(insertValues, conf_id)
  }

  if (missing(prov)) {
    prov <- defaults$prov
  }
  if (!is.null(prov)) {
    insertFields <- c(insertFields, "prov")
    insertValues <- c(insertValues, prov)
  }

  if (missing(admit_date)) {
    admit_date <- defaults$admit_date
  }
  if (!is.null(admit_date)) {
    insertFields <- c(insertFields, "admit_date")
    insertValues <- c(insertValues, admit_date)
  }

  if (missing(disch_date)) {
    disch_date <- defaults$disch_date
  }
  if (!is.null(disch_date)) {
    insertFields <- c(insertFields, "disch_date")
    insertValues <- c(insertValues, disch_date)
  }

  if (missing(dstatus)) {
    dstatus <- defaults$dstatus
  }
  if (!is.null(dstatus)) {
    insertFields <- c(insertFields, "dstatus")
    insertValues <- c(insertValues, dstatus)
  }

  if (missing(los)) {
    los <- defaults$los
  }
  if (!is.null(los)) {
    insertFields <- c(insertFields, "los")
    insertValues <- c(insertValues, los)
  }

  if (missing(drg)) {
    drg <- defaults$drg
  }
  if (!is.null(drg)) {
    insertFields <- c(insertFields, "drg")
    insertValues <- c(insertValues, drg)
  }

  if (missing(icd_flag)) {
    icd_flag <- defaults$icd_flag
  }
  if (!is.null(icd_flag)) {
    insertFields <- c(insertFields, "icd_flag")
    insertValues <- c(insertValues, icd_flag)
  }

  if (missing(diag1)) {
    diag1 <- defaults$diag1
  }
  if (!is.null(diag1)) {
    insertFields <- c(insertFields, "diag1")
    insertValues <- c(insertValues, diag1)
  }

  if (missing(diag2)) {
    diag2 <- defaults$diag2
  }
  if (!is.null(diag2)) {
    insertFields <- c(insertFields, "diag2")
    insertValues <- c(insertValues, diag2)
  }

  if (missing(diag3)) {
    diag3 <- defaults$diag3
  }
  if (!is.null(diag3)) {
    insertFields <- c(insertFields, "diag3")
    insertValues <- c(insertValues, diag3)
  }

  if (missing(diag4)) {
    diag4 <- defaults$diag4
  }
  if (!is.null(diag4)) {
    insertFields <- c(insertFields, "diag4")
    insertValues <- c(insertValues, diag4)
  }

  if (missing(diag5)) {
    diag5 <- defaults$diag5
  }
  if (!is.null(diag5)) {
    insertFields <- c(insertFields, "diag5")
    insertValues <- c(insertValues, diag5)
  }

  if (missing(proc1)) {
    proc1 <- defaults$proc1
  }
  if (!is.null(proc1)) {
    insertFields <- c(insertFields, "proc1")
    insertValues <- c(insertValues, proc1)
  }

  if (missing(proc2)) {
    proc2 <- defaults$proc2
  }
  if (!is.null(proc2)) {
    insertFields <- c(insertFields, "proc2")
    insertValues <- c(insertValues, proc2)
  }

  if (missing(proc3)) {
    proc3 <- defaults$proc3
  }
  if (!is.null(proc3)) {
    insertFields <- c(insertFields, "proc3")
    insertValues <- c(insertValues, proc3)
  }

  if (missing(proc4)) {
    proc4 <- defaults$proc4
  }
  if (!is.null(proc4)) {
    insertFields <- c(insertFields, "proc4")
    insertValues <- c(insertValues, proc4)
  }

  if (missing(proc5)) {
    proc5 <- defaults$proc5
  }
  if (!is.null(proc5)) {
    insertFields <- c(insertFields, "proc5")
    insertValues <- c(insertValues, proc5)
  }

  if (missing(pos)) {
    pos <- defaults$pos
  }
  if (!is.null(pos)) {
    insertFields <- c(insertFields, "pos")
    insertValues <- c(insertValues, pos)
  }

  if (missing(coins)) {
    coins <- defaults$coins
  }
  if (!is.null(coins)) {
    insertFields <- c(insertFields, "coins")
    insertValues <- c(insertValues, coins)
  }

  if (missing(copay)) {
    copay <- defaults$copay
  }
  if (!is.null(copay)) {
    insertFields <- c(insertFields, "copay")
    insertValues <- c(insertValues, copay)
  }

  if (missing(deduct)) {
    deduct <- defaults$deduct
  }
  if (!is.null(deduct)) {
    insertFields <- c(insertFields, "deduct")
    insertValues <- c(insertValues, deduct)
  }

  if (missing(std_cost)) {
    std_cost <- defaults$std_cost
  }
  if (!is.null(std_cost)) {
    insertFields <- c(insertFields, "std_cost")
    insertValues <- c(insertValues, std_cost)
  }

  if (missing(std_cost_yr)) {
    std_cost_yr <- defaults$std_cost_yr
  }
  if (!is.null(std_cost_yr)) {
    insertFields <- c(insertFields, "std_cost_yr")
    insertValues <- c(insertValues, std_cost_yr)
  }

  if (missing(ipstatus)) {
    ipstatus <- defaults$ipstatus
  }
  if (!is.null(ipstatus)) {
    insertFields <- c(insertFields, "ipstatus")
    insertValues <- c(insertValues, ipstatus)
  }

  if (missing(tos_cd)) {
    tos_cd <- defaults$tos_cd
  }
  if (!is.null(tos_cd)) {
    insertFields <- c(insertFields, "tos_cd")
    insertValues <- c(insertValues, tos_cd)
  }

  if (missing(version)) {
    version <- defaults$version
  }
  if (!is.null(version)) {
    insertFields <- c(insertFields, "version")
    insertValues <- c(insertValues, version)
  }

  if (missing(extract_ym)) {
    extract_ym <- defaults$extract_ym
  }
  if (!is.null(extract_ym)) {
    insertFields <- c(insertFields, "extract_ym")
    insertValues <- c(insertValues, extract_ym)
  }

  statement <- paste0("INSERT INTO @source_schema.inpatient_confinement (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
  invisible(statement);
}

add_insurance <- function(ptid, encid, insurance_date, insurance_time, ins_type) {
  defaults <- frameworkContext$defaultValues$insurance;
  insertFields <- c()
  insertValues <- c()
  if (missing(ptid)) {
    ptid <- defaults$ptid
  }
  if (!is.null(ptid)) {
    insertFields <- c(insertFields, "ptid")
    insertValues <- c(insertValues, ptid)
  }

  if (missing(encid)) {
    encid <- defaults$encid
  }
  if (!is.null(encid)) {
    insertFields <- c(insertFields, "encid")
    insertValues <- c(insertValues, encid)
  }

  if (missing(insurance_date)) {
    insurance_date <- defaults$insurance_date
  }
  if (!is.null(insurance_date)) {
    insertFields <- c(insertFields, "insurance_date")
    insertValues <- c(insertValues, insurance_date)
  }

  if (missing(insurance_time)) {
    insurance_time <- defaults$insurance_time
  }
  if (!is.null(insurance_time)) {
    insertFields <- c(insertFields, "insurance_time")
    insertValues <- c(insertValues, insurance_time)
  }

  if (missing(ins_type)) {
    ins_type <- defaults$ins_type
  }
  if (!is.null(ins_type)) {
    insertFields <- c(insertFields, "ins_type")
    insertValues <- c(insertValues, ins_type)
  }

  statement <- paste0("INSERT INTO @source_schema.insurance (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
  invisible(statement);
}

add_lab_results <- function(ptid, pat_planid, fst_dt, tst_nbr, tst_desc, rslt_txt, rslt_nbr, rslt_unit_nm, low_nrml, hi_nrml, abnl_cd, proc_cd, labclmid, anlytseq, loinc_cd, source, version, extract_ym) {
  defaults <- frameworkContext$defaultValues$lab_results;
  insertFields <- c()
  insertValues <- c()
  if (missing(ptid)) {
    ptid <- defaults$ptid
  }
  if (!is.null(ptid)) {
    insertFields <- c(insertFields, "ptid")
    insertValues <- c(insertValues, ptid)
  }

  if (missing(pat_planid)) {
    pat_planid <- defaults$pat_planid
  }
  if (!is.null(pat_planid)) {
    insertFields <- c(insertFields, "pat_planid")
    insertValues <- c(insertValues, pat_planid)
  }

  if (missing(fst_dt)) {
    fst_dt <- defaults$fst_dt
  }
  if (!is.null(fst_dt)) {
    insertFields <- c(insertFields, "fst_dt")
    insertValues <- c(insertValues, fst_dt)
  }

  if (missing(tst_nbr)) {
    tst_nbr <- defaults$tst_nbr
  }
  if (!is.null(tst_nbr)) {
    insertFields <- c(insertFields, "tst_nbr")
    insertValues <- c(insertValues, tst_nbr)
  }

  if (missing(tst_desc)) {
    tst_desc <- defaults$tst_desc
  }
  if (!is.null(tst_desc)) {
    insertFields <- c(insertFields, "tst_desc")
    insertValues <- c(insertValues, tst_desc)
  }

  if (missing(rslt_txt)) {
    rslt_txt <- defaults$rslt_txt
  }
  if (!is.null(rslt_txt)) {
    insertFields <- c(insertFields, "rslt_txt")
    insertValues <- c(insertValues, rslt_txt)
  }

  if (missing(rslt_nbr)) {
    rslt_nbr <- defaults$rslt_nbr
  }
  if (!is.null(rslt_nbr)) {
    insertFields <- c(insertFields, "rslt_nbr")
    insertValues <- c(insertValues, rslt_nbr)
  }

  if (missing(rslt_unit_nm)) {
    rslt_unit_nm <- defaults$rslt_unit_nm
  }
  if (!is.null(rslt_unit_nm)) {
    insertFields <- c(insertFields, "rslt_unit_nm")
    insertValues <- c(insertValues, rslt_unit_nm)
  }

  if (missing(low_nrml)) {
    low_nrml <- defaults$low_nrml
  }
  if (!is.null(low_nrml)) {
    insertFields <- c(insertFields, "low_nrml")
    insertValues <- c(insertValues, low_nrml)
  }

  if (missing(hi_nrml)) {
    hi_nrml <- defaults$hi_nrml
  }
  if (!is.null(hi_nrml)) {
    insertFields <- c(insertFields, "hi_nrml")
    insertValues <- c(insertValues, hi_nrml)
  }

  if (missing(abnl_cd)) {
    abnl_cd <- defaults$abnl_cd
  }
  if (!is.null(abnl_cd)) {
    insertFields <- c(insertFields, "abnl_cd")
    insertValues <- c(insertValues, abnl_cd)
  }

  if (missing(proc_cd)) {
    proc_cd <- defaults$proc_cd
  }
  if (!is.null(proc_cd)) {
    insertFields <- c(insertFields, "proc_cd")
    insertValues <- c(insertValues, proc_cd)
  }

  if (missing(labclmid)) {
    labclmid <- defaults$labclmid
  }
  if (!is.null(labclmid)) {
    insertFields <- c(insertFields, "labclmid")
    insertValues <- c(insertValues, labclmid)
  }

  if (missing(anlytseq)) {
    anlytseq <- defaults$anlytseq
  }
  if (!is.null(anlytseq)) {
    insertFields <- c(insertFields, "anlytseq")
    insertValues <- c(insertValues, anlytseq)
  }

  if (missing(loinc_cd)) {
    loinc_cd <- defaults$loinc_cd
  }
  if (!is.null(loinc_cd)) {
    insertFields <- c(insertFields, "loinc_cd")
    insertValues <- c(insertValues, loinc_cd)
  }

  if (missing(source)) {
    source <- defaults$source
  }
  if (!is.null(source)) {
    insertFields <- c(insertFields, "source")
    insertValues <- c(insertValues, source)
  }

  if (missing(version)) {
    version <- defaults$version
  }
  if (!is.null(version)) {
    insertFields <- c(insertFields, "version")
    insertValues <- c(insertValues, version)
  }

  if (missing(extract_ym)) {
    extract_ym <- defaults$extract_ym
  }
  if (!is.null(extract_ym)) {
    insertFields <- c(insertFields, "extract_ym")
    insertValues <- c(insertValues, extract_ym)
  }

  statement <- paste0("INSERT INTO @source_schema.lab_results (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
  invisible(statement);
}

add_labs <- function(ptid, encid, test_name, order_date, order_time, collected_date, collected_time, result_date, result_time, test_result, relative_indicator, result_unit, normal_range, evaluated_for_range, value_within_range) {
  defaults <- frameworkContext$defaultValues$labs;
  insertFields <- c()
  insertValues <- c()
  if (missing(ptid)) {
    ptid <- defaults$ptid
  }
  if (!is.null(ptid)) {
    insertFields <- c(insertFields, "ptid")
    insertValues <- c(insertValues, ptid)
  }

  if (missing(encid)) {
    encid <- defaults$encid
  }
  if (!is.null(encid)) {
    insertFields <- c(insertFields, "encid")
    insertValues <- c(insertValues, encid)
  }

  if (missing(test_name)) {
    test_name <- defaults$test_name
  }
  if (!is.null(test_name)) {
    insertFields <- c(insertFields, "test_name")
    insertValues <- c(insertValues, test_name)
  }

  if (missing(order_date)) {
    order_date <- defaults$order_date
  }
  if (!is.null(order_date)) {
    insertFields <- c(insertFields, "order_date")
    insertValues <- c(insertValues, order_date)
  }

  if (missing(order_time)) {
    order_time <- defaults$order_time
  }
  if (!is.null(order_time)) {
    insertFields <- c(insertFields, "order_time")
    insertValues <- c(insertValues, order_time)
  }

  if (missing(collected_date)) {
    collected_date <- defaults$collected_date
  }
  if (!is.null(collected_date)) {
    insertFields <- c(insertFields, "collected_date")
    insertValues <- c(insertValues, collected_date)
  }

  if (missing(collected_time)) {
    collected_time <- defaults$collected_time
  }
  if (!is.null(collected_time)) {
    insertFields <- c(insertFields, "collected_time")
    insertValues <- c(insertValues, collected_time)
  }

  if (missing(result_date)) {
    result_date <- defaults$result_date
  }
  if (!is.null(result_date)) {
    insertFields <- c(insertFields, "result_date")
    insertValues <- c(insertValues, result_date)
  }

  if (missing(result_time)) {
    result_time <- defaults$result_time
  }
  if (!is.null(result_time)) {
    insertFields <- c(insertFields, "result_time")
    insertValues <- c(insertValues, result_time)
  }

  if (missing(test_result)) {
    test_result <- defaults$test_result
  }
  if (!is.null(test_result)) {
    insertFields <- c(insertFields, "test_result")
    insertValues <- c(insertValues, test_result)
  }

  if (missing(relative_indicator)) {
    relative_indicator <- defaults$relative_indicator
  }
  if (!is.null(relative_indicator)) {
    insertFields <- c(insertFields, "relative_indicator")
    insertValues <- c(insertValues, relative_indicator)
  }

  if (missing(result_unit)) {
    result_unit <- defaults$result_unit
  }
  if (!is.null(result_unit)) {
    insertFields <- c(insertFields, "result_unit")
    insertValues <- c(insertValues, result_unit)
  }

  if (missing(normal_range)) {
    normal_range <- defaults$normal_range
  }
  if (!is.null(normal_range)) {
    insertFields <- c(insertFields, "normal_range")
    insertValues <- c(insertValues, normal_range)
  }

  if (missing(evaluated_for_range)) {
    evaluated_for_range <- defaults$evaluated_for_range
  }
  if (!is.null(evaluated_for_range)) {
    insertFields <- c(insertFields, "evaluated_for_range")
    insertValues <- c(insertValues, evaluated_for_range)
  }

  if (missing(value_within_range)) {
    value_within_range <- defaults$value_within_range
  }
  if (!is.null(value_within_range)) {
    insertFields <- c(insertFields, "value_within_range")
    insertValues <- c(insertValues, value_within_range)
  }

  statement <- paste0("INSERT INTO @source_schema.labs (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
  invisible(statement);
}

add_lu_abnl_cd <- function(abnl_cd, description) {
  defaults <- frameworkContext$defaultValues$lu_abnl_cd;
  insertFields <- c()
  insertValues <- c()
  if (missing(abnl_cd)) {
    abnl_cd <- defaults$abnl_cd
  }
  if (!is.null(abnl_cd)) {
    insertFields <- c(insertFields, "abnl_cd")
    insertValues <- c(insertValues, abnl_cd)
  }

  if (missing(description)) {
    description <- defaults$description
  }
  if (!is.null(description)) {
    insertFields <- c(insertFields, "description")
    insertValues <- c(insertValues, description)
  }

  statement <- paste0("INSERT INTO @source_schema.lu_abnl_cd (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
  invisible(statement);
}

add_lu_ahfsclss <- function(ahfsclss, description) {
  defaults <- frameworkContext$defaultValues$lu_ahfsclss;
  insertFields <- c()
  insertValues <- c()
  if (missing(ahfsclss)) {
    ahfsclss <- defaults$ahfsclss
  }
  if (!is.null(ahfsclss)) {
    insertFields <- c(insertFields, "ahfsclss")
    insertValues <- c(insertValues, ahfsclss)
  }

  if (missing(description)) {
    description <- defaults$description
  }
  if (!is.null(description)) {
    insertFields <- c(insertFields, "description")
    insertValues <- c(insertValues, description)
  }

  statement <- paste0("INSERT INTO @source_schema.lu_ahfsclss (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
  invisible(statement);
}

add_lu_bus_line <- function(bus, description) {
  defaults <- frameworkContext$defaultValues$lu_bus_line;
  insertFields <- c()
  insertValues <- c()
  if (missing(bus)) {
    bus <- defaults$bus
  }
  if (!is.null(bus)) {
    insertFields <- c(insertFields, "bus")
    insertValues <- c(insertValues, bus)
  }

  if (missing(description)) {
    description <- defaults$description
  }
  if (!is.null(description)) {
    insertFields <- c(insertFields, "description")
    insertValues <- c(insertValues, description)
  }

  statement <- paste0("INSERT INTO @source_schema.lu_bus_line (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
  invisible(statement);
}

add_lu_cdhp <- function(cdhp_cd, description) {
  defaults <- frameworkContext$defaultValues$lu_cdhp;
  insertFields <- c()
  insertValues <- c()
  if (missing(cdhp_cd)) {
    cdhp_cd <- defaults$cdhp_cd
  }
  if (!is.null(cdhp_cd)) {
    insertFields <- c(insertFields, "cdhp_cd")
    insertValues <- c(insertValues, cdhp_cd)
  }

  if (missing(description)) {
    description <- defaults$description
  }
  if (!is.null(description)) {
    insertFields <- c(insertFields, "description")
    insertValues <- c(insertValues, description)
  }

  statement <- paste0("INSERT INTO @source_schema.lu_cdhp (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
  invisible(statement);
}

add_lu_cob <- function(cob, description) {
  defaults <- frameworkContext$defaultValues$lu_cob;
  insertFields <- c()
  insertValues <- c()
  if (missing(cob)) {
    cob <- defaults$cob
  }
  if (!is.null(cob)) {
    insertFields <- c(insertFields, "cob")
    insertValues <- c(insertValues, cob)
  }

  if (missing(description)) {
    description <- defaults$description
  }
  if (!is.null(description)) {
    insertFields <- c(insertFields, "description")
    insertValues <- c(insertValues, description)
  }

  statement <- paste0("INSERT INTO @source_schema.lu_cob (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
  invisible(statement);
}

add_lu_daw <- function(daw, description) {
  defaults <- frameworkContext$defaultValues$lu_daw;
  insertFields <- c()
  insertValues <- c()
  if (missing(daw)) {
    daw <- defaults$daw
  }
  if (!is.null(daw)) {
    insertFields <- c(insertFields, "daw")
    insertValues <- c(insertValues, daw)
  }

  if (missing(description)) {
    description <- defaults$description
  }
  if (!is.null(description)) {
    insertFields <- c(insertFields, "description")
    insertValues <- c(insertValues, description)
  }

  statement <- paste0("INSERT INTO @source_schema.lu_daw (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
  invisible(statement);
}

add_lu_diagnosis <- function(diag_cd, diag_desc, gdr_spec_cd, diag_fst3_cd, diag_fst3_desc, diag_fst4_cd, diag_fst4_desc, mdc_code, mdc_cd_desc, icd_ver_cd) {
  defaults <- frameworkContext$defaultValues$lu_diagnosis;
  insertFields <- c()
  insertValues <- c()
  if (missing(diag_cd)) {
    diag_cd <- defaults$diag_cd
  }
  if (!is.null(diag_cd)) {
    insertFields <- c(insertFields, "diag_cd")
    insertValues <- c(insertValues, diag_cd)
  }

  if (missing(diag_desc)) {
    diag_desc <- defaults$diag_desc
  }
  if (!is.null(diag_desc)) {
    insertFields <- c(insertFields, "diag_desc")
    insertValues <- c(insertValues, diag_desc)
  }

  if (missing(gdr_spec_cd)) {
    gdr_spec_cd <- defaults$gdr_spec_cd
  }
  if (!is.null(gdr_spec_cd)) {
    insertFields <- c(insertFields, "gdr_spec_cd")
    insertValues <- c(insertValues, gdr_spec_cd)
  }

  if (missing(diag_fst3_cd)) {
    diag_fst3_cd <- defaults$diag_fst3_cd
  }
  if (!is.null(diag_fst3_cd)) {
    insertFields <- c(insertFields, "diag_fst3_cd")
    insertValues <- c(insertValues, diag_fst3_cd)
  }

  if (missing(diag_fst3_desc)) {
    diag_fst3_desc <- defaults$diag_fst3_desc
  }
  if (!is.null(diag_fst3_desc)) {
    insertFields <- c(insertFields, "diag_fst3_desc")
    insertValues <- c(insertValues, diag_fst3_desc)
  }

  if (missing(diag_fst4_cd)) {
    diag_fst4_cd <- defaults$diag_fst4_cd
  }
  if (!is.null(diag_fst4_cd)) {
    insertFields <- c(insertFields, "diag_fst4_cd")
    insertValues <- c(insertValues, diag_fst4_cd)
  }

  if (missing(diag_fst4_desc)) {
    diag_fst4_desc <- defaults$diag_fst4_desc
  }
  if (!is.null(diag_fst4_desc)) {
    insertFields <- c(insertFields, "diag_fst4_desc")
    insertValues <- c(insertValues, diag_fst4_desc)
  }

  if (missing(mdc_code)) {
    mdc_code <- defaults$mdc_code
  }
  if (!is.null(mdc_code)) {
    insertFields <- c(insertFields, "mdc_code")
    insertValues <- c(insertValues, mdc_code)
  }

  if (missing(mdc_cd_desc)) {
    mdc_cd_desc <- defaults$mdc_cd_desc
  }
  if (!is.null(mdc_cd_desc)) {
    insertFields <- c(insertFields, "mdc_cd_desc")
    insertValues <- c(insertValues, mdc_cd_desc)
  }

  if (missing(icd_ver_cd)) {
    icd_ver_cd <- defaults$icd_ver_cd
  }
  if (!is.null(icd_ver_cd)) {
    insertFields <- c(insertFields, "icd_ver_cd")
    insertValues <- c(insertValues, icd_ver_cd)
  }

  statement <- paste0("INSERT INTO @source_schema.lu_diagnosis (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
  invisible(statement);
}

add_lu_dischstatus <- function(dstatus, description, discharge_status_category) {
  defaults <- frameworkContext$defaultValues$lu_dischstatus;
  insertFields <- c()
  insertValues <- c()
  if (missing(dstatus)) {
    dstatus <- defaults$dstatus
  }
  if (!is.null(dstatus)) {
    insertFields <- c(insertFields, "dstatus")
    insertValues <- c(insertValues, dstatus)
  }

  if (missing(description)) {
    description <- defaults$description
  }
  if (!is.null(description)) {
    insertFields <- c(insertFields, "description")
    insertValues <- c(insertValues, description)
  }

  if (missing(discharge_status_category)) {
    discharge_status_category <- defaults$discharge_status_category
  }
  if (!is.null(discharge_status_category)) {
    insertFields <- c(insertFields, "discharge_status_category")
    insertValues <- c(insertValues, discharge_status_category)
  }

  statement <- paste0("INSERT INTO @source_schema.lu_dischstatus (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
  invisible(statement);
}

add_lu_drg <- function(drg, description, eff_date, end_date) {
  defaults <- frameworkContext$defaultValues$lu_drg;
  insertFields <- c()
  insertValues <- c()
  if (missing(drg)) {
    drg <- defaults$drg
  }
  if (!is.null(drg)) {
    insertFields <- c(insertFields, "drg")
    insertValues <- c(insertValues, drg)
  }

  if (missing(description)) {
    description <- defaults$description
  }
  if (!is.null(description)) {
    insertFields <- c(insertFields, "description")
    insertValues <- c(insertValues, description)
  }

  if (missing(eff_date)) {
    eff_date <- defaults$eff_date
  }
  if (!is.null(eff_date)) {
    insertFields <- c(insertFields, "eff_date")
    insertValues <- c(insertValues, eff_date)
  }

  if (missing(end_date)) {
    end_date <- defaults$end_date
  }
  if (!is.null(end_date)) {
    insertFields <- c(insertFields, "end_date")
    insertValues <- c(insertValues, end_date)
  }

  statement <- paste0("INSERT INTO @source_schema.lu_drg (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
  invisible(statement);
}

add_lu_encounter <- function(enctr, description) {
  defaults <- frameworkContext$defaultValues$lu_encounter;
  insertFields <- c()
  insertValues <- c()
  if (missing(enctr)) {
    enctr <- defaults$enctr
  }
  if (!is.null(enctr)) {
    insertFields <- c(insertFields, "enctr")
    insertValues <- c(insertValues, enctr)
  }

  if (missing(description)) {
    description <- defaults$description
  }
  if (!is.null(description)) {
    insertFields <- c(insertFields, "description")
    insertValues <- c(insertValues, description)
  }

  statement <- paste0("INSERT INTO @source_schema.lu_encounter (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
  invisible(statement);
}

add_lu_form_ind <- function(form_ind, description) {
  defaults <- frameworkContext$defaultValues$lu_form_ind;
  insertFields <- c()
  insertValues <- c()
  if (missing(form_ind)) {
    form_ind <- defaults$form_ind
  }
  if (!is.null(form_ind)) {
    insertFields <- c(insertFields, "form_ind")
    insertValues <- c(insertValues, form_ind)
  }

  if (missing(description)) {
    description <- defaults$description
  }
  if (!is.null(description)) {
    insertFields <- c(insertFields, "description")
    insertValues <- c(insertValues, description)
  }

  statement <- paste0("INSERT INTO @source_schema.lu_form_ind (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
  invisible(statement);
}

add_lu_form_typ <- function(form_typ, description) {
  defaults <- frameworkContext$defaultValues$lu_form_typ;
  insertFields <- c()
  insertValues <- c()
  if (missing(form_typ)) {
    form_typ <- defaults$form_typ
  }
  if (!is.null(form_typ)) {
    insertFields <- c(insertFields, "form_typ")
    insertValues <- c(insertValues, form_typ)
  }

  if (missing(description)) {
    description <- defaults$description
  }
  if (!is.null(description)) {
    insertFields <- c(insertFields, "description")
    insertValues <- c(insertValues, description)
  }

  statement <- paste0("INSERT INTO @source_schema.lu_form_typ (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
  invisible(statement);
}

add_lu_fst_fill <- function(fst_fill, bus, description) {
  defaults <- frameworkContext$defaultValues$lu_fst_fill;
  insertFields <- c()
  insertValues <- c()
  if (missing(fst_fill)) {
    fst_fill <- defaults$fst_fill
  }
  if (!is.null(fst_fill)) {
    insertFields <- c(insertFields, "fst_fill")
    insertValues <- c(insertValues, fst_fill)
  }

  if (missing(bus)) {
    bus <- defaults$bus
  }
  if (!is.null(bus)) {
    insertFields <- c(insertFields, "bus")
    insertValues <- c(insertValues, bus)
  }

  if (missing(description)) {
    description <- defaults$description
  }
  if (!is.null(description)) {
    insertFields <- c(insertFields, "description")
    insertValues <- c(insertValues, description)
  }

  statement <- paste0("INSERT INTO @source_schema.lu_fst_fill (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
  invisible(statement);
}

add_lu_gnrc_ind <- function(gnrc_ind, description) {
  defaults <- frameworkContext$defaultValues$lu_gnrc_ind;
  insertFields <- c()
  insertValues <- c()
  if (missing(gnrc_ind)) {
    gnrc_ind <- defaults$gnrc_ind
  }
  if (!is.null(gnrc_ind)) {
    insertFields <- c(insertFields, "gnrc_ind")
    insertValues <- c(insertValues, gnrc_ind)
  }

  if (missing(description)) {
    description <- defaults$description
  }
  if (!is.null(description)) {
    insertFields <- c(insertFields, "description")
    insertValues <- c(insertValues, description)
  }

  statement <- paste0("INSERT INTO @source_schema.lu_gnrc_ind (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
  invisible(statement);
}

add_lu_hccc <- function(hccc, description, hccc_grp_desc, hccc_sum_desc) {
  defaults <- frameworkContext$defaultValues$lu_hccc;
  insertFields <- c()
  insertValues <- c()
  if (missing(hccc)) {
    hccc <- defaults$hccc
  }
  if (!is.null(hccc)) {
    insertFields <- c(insertFields, "hccc")
    insertValues <- c(insertValues, hccc)
  }

  if (missing(description)) {
    description <- defaults$description
  }
  if (!is.null(description)) {
    insertFields <- c(insertFields, "description")
    insertValues <- c(insertValues, description)
  }

  if (missing(hccc_grp_desc)) {
    hccc_grp_desc <- defaults$hccc_grp_desc
  }
  if (!is.null(hccc_grp_desc)) {
    insertFields <- c(insertFields, "hccc_grp_desc")
    insertValues <- c(insertValues, hccc_grp_desc)
  }

  if (missing(hccc_sum_desc)) {
    hccc_sum_desc <- defaults$hccc_sum_desc
  }
  if (!is.null(hccc_sum_desc)) {
    insertFields <- c(insertFields, "hccc_sum_desc")
    insertValues <- c(insertValues, hccc_sum_desc)
  }

  statement <- paste0("INSERT INTO @source_schema.lu_hccc (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
  invisible(statement);
}

add_lu_icd_flag <- function(icd_flag, description) {
  defaults <- frameworkContext$defaultValues$lu_icd_flag;
  insertFields <- c()
  insertValues <- c()
  if (missing(icd_flag)) {
    icd_flag <- defaults$icd_flag
  }
  if (!is.null(icd_flag)) {
    insertFields <- c(insertFields, "icd_flag")
    insertValues <- c(insertValues, icd_flag)
  }

  if (missing(description)) {
    description <- defaults$description
  }
  if (!is.null(description)) {
    insertFields <- c(insertFields, "description")
    insertValues <- c(insertValues, description)
  }

  statement <- paste0("INSERT INTO @source_schema.lu_icd_flag (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
  invisible(statement);
}

add_lu_ipstatus <- function(ipstatus, description) {
  defaults <- frameworkContext$defaultValues$lu_ipstatus;
  insertFields <- c()
  insertValues <- c()
  if (missing(ipstatus)) {
    ipstatus <- defaults$ipstatus
  }
  if (!is.null(ipstatus)) {
    insertFields <- c(insertFields, "ipstatus")
    insertValues <- c(insertValues, ipstatus)
  }

  if (missing(description)) {
    description <- defaults$description
  }
  if (!is.null(description)) {
    insertFields <- c(insertFields, "description")
    insertValues <- c(insertValues, description)
  }

  statement <- paste0("INSERT INTO @source_schema.lu_ipstatus (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
  invisible(statement);
}

add_lu_loc_cd <- function(loc_cd, description) {
  defaults <- frameworkContext$defaultValues$lu_loc_cd;
  insertFields <- c()
  insertValues <- c()
  if (missing(loc_cd)) {
    loc_cd <- defaults$loc_cd
  }
  if (!is.null(loc_cd)) {
    insertFields <- c(insertFields, "loc_cd")
    insertValues <- c(insertValues, loc_cd)
  }

  if (missing(description)) {
    description <- defaults$description
  }
  if (!is.null(description)) {
    insertFields <- c(insertFields, "description")
    insertValues <- c(insertValues, description)
  }

  statement <- paste0("INSERT INTO @source_schema.lu_loc_cd (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
  invisible(statement);
}

add_lu_ndc <- function(ahfsclss, ahfsclss_desc, brnd_nm, ndc, dosage_fm_desc, drg_strgth_desc, drg_strgth_nbr, drg_strgth_unit_desc, drg_strgth_vol_nbr, drg_strgth_vol_unit_desc, gnrc_ind, gnrc_nm, gnrc_nbr, gnrc_sqnc_nbr, ndc_drg_row_eff_dt, ndc_drg_row_end_dt, usc_id, usc_med_desc) {
  defaults <- frameworkContext$defaultValues$lu_ndc;
  insertFields <- c()
  insertValues <- c()
  if (missing(ahfsclss)) {
    ahfsclss <- defaults$ahfsclss
  }
  if (!is.null(ahfsclss)) {
    insertFields <- c(insertFields, "ahfsclss")
    insertValues <- c(insertValues, ahfsclss)
  }

  if (missing(ahfsclss_desc)) {
    ahfsclss_desc <- defaults$ahfsclss_desc
  }
  if (!is.null(ahfsclss_desc)) {
    insertFields <- c(insertFields, "ahfsclss_desc")
    insertValues <- c(insertValues, ahfsclss_desc)
  }

  if (missing(brnd_nm)) {
    brnd_nm <- defaults$brnd_nm
  }
  if (!is.null(brnd_nm)) {
    insertFields <- c(insertFields, "brnd_nm")
    insertValues <- c(insertValues, brnd_nm)
  }

  if (missing(ndc)) {
    ndc <- defaults$ndc
  }
  if (!is.null(ndc)) {
    insertFields <- c(insertFields, "ndc")
    insertValues <- c(insertValues, ndc)
  }

  if (missing(dosage_fm_desc)) {
    dosage_fm_desc <- defaults$dosage_fm_desc
  }
  if (!is.null(dosage_fm_desc)) {
    insertFields <- c(insertFields, "dosage_fm_desc")
    insertValues <- c(insertValues, dosage_fm_desc)
  }

  if (missing(drg_strgth_desc)) {
    drg_strgth_desc <- defaults$drg_strgth_desc
  }
  if (!is.null(drg_strgth_desc)) {
    insertFields <- c(insertFields, "drg_strgth_desc")
    insertValues <- c(insertValues, drg_strgth_desc)
  }

  if (missing(drg_strgth_nbr)) {
    drg_strgth_nbr <- defaults$drg_strgth_nbr
  }
  if (!is.null(drg_strgth_nbr)) {
    insertFields <- c(insertFields, "drg_strgth_nbr")
    insertValues <- c(insertValues, drg_strgth_nbr)
  }

  if (missing(drg_strgth_unit_desc)) {
    drg_strgth_unit_desc <- defaults$drg_strgth_unit_desc
  }
  if (!is.null(drg_strgth_unit_desc)) {
    insertFields <- c(insertFields, "drg_strgth_unit_desc")
    insertValues <- c(insertValues, drg_strgth_unit_desc)
  }

  if (missing(drg_strgth_vol_nbr)) {
    drg_strgth_vol_nbr <- defaults$drg_strgth_vol_nbr
  }
  if (!is.null(drg_strgth_vol_nbr)) {
    insertFields <- c(insertFields, "drg_strgth_vol_nbr")
    insertValues <- c(insertValues, drg_strgth_vol_nbr)
  }

  if (missing(drg_strgth_vol_unit_desc)) {
    drg_strgth_vol_unit_desc <- defaults$drg_strgth_vol_unit_desc
  }
  if (!is.null(drg_strgth_vol_unit_desc)) {
    insertFields <- c(insertFields, "drg_strgth_vol_unit_desc")
    insertValues <- c(insertValues, drg_strgth_vol_unit_desc)
  }

  if (missing(gnrc_ind)) {
    gnrc_ind <- defaults$gnrc_ind
  }
  if (!is.null(gnrc_ind)) {
    insertFields <- c(insertFields, "gnrc_ind")
    insertValues <- c(insertValues, gnrc_ind)
  }

  if (missing(gnrc_nm)) {
    gnrc_nm <- defaults$gnrc_nm
  }
  if (!is.null(gnrc_nm)) {
    insertFields <- c(insertFields, "gnrc_nm")
    insertValues <- c(insertValues, gnrc_nm)
  }

  if (missing(gnrc_nbr)) {
    gnrc_nbr <- defaults$gnrc_nbr
  }
  if (!is.null(gnrc_nbr)) {
    insertFields <- c(insertFields, "gnrc_nbr")
    insertValues <- c(insertValues, gnrc_nbr)
  }

  if (missing(gnrc_sqnc_nbr)) {
    gnrc_sqnc_nbr <- defaults$gnrc_sqnc_nbr
  }
  if (!is.null(gnrc_sqnc_nbr)) {
    insertFields <- c(insertFields, "gnrc_sqnc_nbr")
    insertValues <- c(insertValues, gnrc_sqnc_nbr)
  }

  if (missing(ndc_drg_row_eff_dt)) {
    ndc_drg_row_eff_dt <- defaults$ndc_drg_row_eff_dt
  }
  if (!is.null(ndc_drg_row_eff_dt)) {
    insertFields <- c(insertFields, "ndc_drg_row_eff_dt")
    insertValues <- c(insertValues, ndc_drg_row_eff_dt)
  }

  if (missing(ndc_drg_row_end_dt)) {
    ndc_drg_row_end_dt <- defaults$ndc_drg_row_end_dt
  }
  if (!is.null(ndc_drg_row_end_dt)) {
    insertFields <- c(insertFields, "ndc_drg_row_end_dt")
    insertValues <- c(insertValues, ndc_drg_row_end_dt)
  }

  if (missing(usc_id)) {
    usc_id <- defaults$usc_id
  }
  if (!is.null(usc_id)) {
    insertFields <- c(insertFields, "usc_id")
    insertValues <- c(insertValues, usc_id)
  }

  if (missing(usc_med_desc)) {
    usc_med_desc <- defaults$usc_med_desc
  }
  if (!is.null(usc_med_desc)) {
    insertFields <- c(insertFields, "usc_med_desc")
    insertValues <- c(insertValues, usc_med_desc)
  }

  statement <- paste0("INSERT INTO @source_schema.lu_ndc (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
  invisible(statement);
}

add_lu_poa <- function(poa, description) {
  defaults <- frameworkContext$defaultValues$lu_poa;
  insertFields <- c()
  insertValues <- c()
  if (missing(poa)) {
    poa <- defaults$poa
  }
  if (!is.null(poa)) {
    insertFields <- c(insertFields, "poa")
    insertValues <- c(insertValues, poa)
  }

  if (missing(description)) {
    description <- defaults$description
  }
  if (!is.null(description)) {
    insertFields <- c(insertFields, "description")
    insertValues <- c(insertValues, description)
  }

  statement <- paste0("INSERT INTO @source_schema.lu_poa (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
  invisible(statement);
}

add_lu_pos <- function(pos, description, category) {
  defaults <- frameworkContext$defaultValues$lu_pos;
  insertFields <- c()
  insertValues <- c()
  if (missing(pos)) {
    pos <- defaults$pos
  }
  if (!is.null(pos)) {
    insertFields <- c(insertFields, "pos")
    insertValues <- c(insertValues, pos)
  }

  if (missing(description)) {
    description <- defaults$description
  }
  if (!is.null(description)) {
    insertFields <- c(insertFields, "description")
    insertValues <- c(insertValues, description)
  }

  if (missing(category)) {
    category <- defaults$category
  }
  if (!is.null(category)) {
    insertFields <- c(insertFields, "category")
    insertValues <- c(insertValues, category)
  }

  statement <- paste0("INSERT INTO @source_schema.lu_pos (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
  invisible(statement);
}

add_lu_prc_typ <- function(prc_typ, description) {
  defaults <- frameworkContext$defaultValues$lu_prc_typ;
  insertFields <- c()
  insertValues <- c()
  if (missing(prc_typ)) {
    prc_typ <- defaults$prc_typ
  }
  if (!is.null(prc_typ)) {
    insertFields <- c(insertFields, "prc_typ")
    insertValues <- c(insertValues, prc_typ)
  }

  if (missing(description)) {
    description <- defaults$description
  }
  if (!is.null(description)) {
    insertFields <- c(insertFields, "description")
    insertValues <- c(insertValues, description)
  }

  statement <- paste0("INSERT INTO @source_schema.lu_prc_typ (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
  invisible(statement);
}

add_lu_procedure <- function(category_dtl_cd, category_dtl_code_desc, category_genl_cd, category_genl_cd_desc, proc_cd, proc_desc, proc_end_date, proc_typ_cd) {
  defaults <- frameworkContext$defaultValues$lu_procedure;
  insertFields <- c()
  insertValues <- c()
  if (missing(category_dtl_cd)) {
    category_dtl_cd <- defaults$category_dtl_cd
  }
  if (!is.null(category_dtl_cd)) {
    insertFields <- c(insertFields, "category_dtl_cd")
    insertValues <- c(insertValues, category_dtl_cd)
  }

  if (missing(category_dtl_code_desc)) {
    category_dtl_code_desc <- defaults$category_dtl_code_desc
  }
  if (!is.null(category_dtl_code_desc)) {
    insertFields <- c(insertFields, "category_dtl_code_desc")
    insertValues <- c(insertValues, category_dtl_code_desc)
  }

  if (missing(category_genl_cd)) {
    category_genl_cd <- defaults$category_genl_cd
  }
  if (!is.null(category_genl_cd)) {
    insertFields <- c(insertFields, "category_genl_cd")
    insertValues <- c(insertValues, category_genl_cd)
  }

  if (missing(category_genl_cd_desc)) {
    category_genl_cd_desc <- defaults$category_genl_cd_desc
  }
  if (!is.null(category_genl_cd_desc)) {
    insertFields <- c(insertFields, "category_genl_cd_desc")
    insertValues <- c(insertValues, category_genl_cd_desc)
  }

  if (missing(proc_cd)) {
    proc_cd <- defaults$proc_cd
  }
  if (!is.null(proc_cd)) {
    insertFields <- c(insertFields, "proc_cd")
    insertValues <- c(insertValues, proc_cd)
  }

  if (missing(proc_desc)) {
    proc_desc <- defaults$proc_desc
  }
  if (!is.null(proc_desc)) {
    insertFields <- c(insertFields, "proc_desc")
    insertValues <- c(insertValues, proc_desc)
  }

  if (missing(proc_end_date)) {
    proc_end_date <- defaults$proc_end_date
  }
  if (!is.null(proc_end_date)) {
    insertFields <- c(insertFields, "proc_end_date")
    insertValues <- c(insertValues, proc_end_date)
  }

  if (missing(proc_typ_cd)) {
    proc_typ_cd <- defaults$proc_typ_cd
  }
  if (!is.null(proc_typ_cd)) {
    insertFields <- c(insertFields, "proc_typ_cd")
    insertValues <- c(insertValues, proc_typ_cd)
  }

  statement <- paste0("INSERT INTO @source_schema.lu_procedure (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
  invisible(statement);
}

add_lu_procmod <- function(procmod, description, notes) {
  defaults <- frameworkContext$defaultValues$lu_procmod;
  insertFields <- c()
  insertValues <- c()
  if (missing(procmod)) {
    procmod <- defaults$procmod
  }
  if (!is.null(procmod)) {
    insertFields <- c(insertFields, "procmod")
    insertValues <- c(insertValues, procmod)
  }

  if (missing(description)) {
    description <- defaults$description
  }
  if (!is.null(description)) {
    insertFields <- c(insertFields, "description")
    insertValues <- c(insertValues, description)
  }

  if (missing(notes)) {
    notes <- defaults$notes
  }
  if (!is.null(notes)) {
    insertFields <- c(insertFields, "notes")
    insertValues <- c(insertValues, notes)
  }

  statement <- paste0("INSERT INTO @source_schema.lu_procmod (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
  invisible(statement);
}

add_lu_product <- function(product, description) {
  defaults <- frameworkContext$defaultValues$lu_product;
  insertFields <- c()
  insertValues <- c()
  if (missing(product)) {
    product <- defaults$product
  }
  if (!is.null(product)) {
    insertFields <- c(insertFields, "product")
    insertValues <- c(insertValues, product)
  }

  if (missing(description)) {
    description <- defaults$description
  }
  if (!is.null(description)) {
    insertFields <- c(insertFields, "description")
    insertValues <- c(insertValues, description)
  }

  statement <- paste0("INSERT INTO @source_schema.lu_product (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
  invisible(statement);
}

add_lu_provcat <- function(provcat, description, catgy_rol_up_1_desc, catgy_rol_up_2_desc, catgy_rol_up_3_desc, catgy_rol_up_4_desc) {
  defaults <- frameworkContext$defaultValues$lu_provcat;
  insertFields <- c()
  insertValues <- c()
  if (missing(provcat)) {
    provcat <- defaults$provcat
  }
  if (!is.null(provcat)) {
    insertFields <- c(insertFields, "provcat")
    insertValues <- c(insertValues, provcat)
  }

  if (missing(description)) {
    description <- defaults$description
  }
  if (!is.null(description)) {
    insertFields <- c(insertFields, "description")
    insertValues <- c(insertValues, description)
  }

  if (missing(catgy_rol_up_1_desc)) {
    catgy_rol_up_1_desc <- defaults$catgy_rol_up_1_desc
  }
  if (!is.null(catgy_rol_up_1_desc)) {
    insertFields <- c(insertFields, "catgy_rol_up_1_desc")
    insertValues <- c(insertValues, catgy_rol_up_1_desc)
  }

  if (missing(catgy_rol_up_2_desc)) {
    catgy_rol_up_2_desc <- defaults$catgy_rol_up_2_desc
  }
  if (!is.null(catgy_rol_up_2_desc)) {
    insertFields <- c(insertFields, "catgy_rol_up_2_desc")
    insertValues <- c(insertValues, catgy_rol_up_2_desc)
  }

  if (missing(catgy_rol_up_3_desc)) {
    catgy_rol_up_3_desc <- defaults$catgy_rol_up_3_desc
  }
  if (!is.null(catgy_rol_up_3_desc)) {
    insertFields <- c(insertFields, "catgy_rol_up_3_desc")
    insertValues <- c(insertValues, catgy_rol_up_3_desc)
  }

  if (missing(catgy_rol_up_4_desc)) {
    catgy_rol_up_4_desc <- defaults$catgy_rol_up_4_desc
  }
  if (!is.null(catgy_rol_up_4_desc)) {
    insertFields <- c(insertFields, "catgy_rol_up_4_desc")
    insertValues <- c(insertValues, catgy_rol_up_4_desc)
  }

  statement <- paste0("INSERT INTO @source_schema.lu_provcat (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
  invisible(statement);
}

add_lu_rvnu_cd <- function(rvnu_cd, description, rvnu_catgy_desc) {
  defaults <- frameworkContext$defaultValues$lu_rvnu_cd;
  insertFields <- c()
  insertValues <- c()
  if (missing(rvnu_cd)) {
    rvnu_cd <- defaults$rvnu_cd
  }
  if (!is.null(rvnu_cd)) {
    insertFields <- c(insertFields, "rvnu_cd")
    insertValues <- c(insertValues, rvnu_cd)
  }

  if (missing(description)) {
    description <- defaults$description
  }
  if (!is.null(description)) {
    insertFields <- c(insertFields, "description")
    insertValues <- c(insertValues, description)
  }

  if (missing(rvnu_catgy_desc)) {
    rvnu_catgy_desc <- defaults$rvnu_catgy_desc
  }
  if (!is.null(rvnu_catgy_desc)) {
    insertFields <- c(insertFields, "rvnu_catgy_desc")
    insertValues <- c(insertValues, rvnu_catgy_desc)
  }

  statement <- paste0("INSERT INTO @source_schema.lu_rvnu_cd (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
  invisible(statement);
}

add_lu_specclss <- function(specclss, description) {
  defaults <- frameworkContext$defaultValues$lu_specclss;
  insertFields <- c()
  insertValues <- c()
  if (missing(specclss)) {
    specclss <- defaults$specclss
  }
  if (!is.null(specclss)) {
    insertFields <- c(insertFields, "specclss")
    insertValues <- c(insertValues, specclss)
  }

  if (missing(description)) {
    description <- defaults$description
  }
  if (!is.null(description)) {
    insertFields <- c(insertFields, "description")
    insertValues <- c(insertValues, description)
  }

  statement <- paste0("INSERT INTO @source_schema.lu_specclss (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
  invisible(statement);
}

add_lu_tos_cd <- function(tos_cd, lvl_1_code, lvl_1_desc, lvl_2_code, lvl_2_desc) {
  defaults <- frameworkContext$defaultValues$lu_tos_cd;
  insertFields <- c()
  insertValues <- c()
  if (missing(tos_cd)) {
    tos_cd <- defaults$tos_cd
  }
  if (!is.null(tos_cd)) {
    insertFields <- c(insertFields, "tos_cd")
    insertValues <- c(insertValues, tos_cd)
  }

  if (missing(lvl_1_code)) {
    lvl_1_code <- defaults$lvl_1_code
  }
  if (!is.null(lvl_1_code)) {
    insertFields <- c(insertFields, "lvl_1_code")
    insertValues <- c(insertValues, lvl_1_code)
  }

  if (missing(lvl_1_desc)) {
    lvl_1_desc <- defaults$lvl_1_desc
  }
  if (!is.null(lvl_1_desc)) {
    insertFields <- c(insertFields, "lvl_1_desc")
    insertValues <- c(insertValues, lvl_1_desc)
  }

  if (missing(lvl_2_code)) {
    lvl_2_code <- defaults$lvl_2_code
  }
  if (!is.null(lvl_2_code)) {
    insertFields <- c(insertFields, "lvl_2_code")
    insertValues <- c(insertValues, lvl_2_code)
  }

  if (missing(lvl_2_desc)) {
    lvl_2_desc <- defaults$lvl_2_desc
  }
  if (!is.null(lvl_2_desc)) {
    insertFields <- c(insertFields, "lvl_2_desc")
    insertValues <- c(insertValues, lvl_2_desc)
  }

  statement <- paste0("INSERT INTO @source_schema.lu_tos_cd (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
  invisible(statement);
}

add_medical_claims <- function(ptid, pat_planid, clmid, clmseq, fst_dt, lst_dt, prov, provcat, drg, icd_flag, diag1, diag2, diag3, diag4, diag5, poa1, poa2, poa3, poa4, poa5, proc_cd, procmod, proc1, proc2, proc3, ndc, dstatus, loc_cd, rvnu_cd, pos, enctr, units, coins, copay, deduct, cob, paid_dt, hccc, conf_id, std_cost, std_cost_yr, tos_cd, version, extract_ym) {
  defaults <- frameworkContext$defaultValues$medical_claims;
  insertFields <- c()
  insertValues <- c()
  if (missing(ptid)) {
    ptid <- defaults$ptid
  }
  if (!is.null(ptid)) {
    insertFields <- c(insertFields, "ptid")
    insertValues <- c(insertValues, ptid)
  }

  if (missing(pat_planid)) {
    pat_planid <- defaults$pat_planid
  }
  if (!is.null(pat_planid)) {
    insertFields <- c(insertFields, "pat_planid")
    insertValues <- c(insertValues, pat_planid)
  }

  if (missing(clmid)) {
    clmid <- defaults$clmid
  }
  if (!is.null(clmid)) {
    insertFields <- c(insertFields, "clmid")
    insertValues <- c(insertValues, clmid)
  }

  if (missing(clmseq)) {
    clmseq <- defaults$clmseq
  }
  if (!is.null(clmseq)) {
    insertFields <- c(insertFields, "clmseq")
    insertValues <- c(insertValues, clmseq)
  }

  if (missing(fst_dt)) {
    fst_dt <- defaults$fst_dt
  }
  if (!is.null(fst_dt)) {
    insertFields <- c(insertFields, "fst_dt")
    insertValues <- c(insertValues, fst_dt)
  }

  if (missing(lst_dt)) {
    lst_dt <- defaults$lst_dt
  }
  if (!is.null(lst_dt)) {
    insertFields <- c(insertFields, "lst_dt")
    insertValues <- c(insertValues, lst_dt)
  }

  if (missing(prov)) {
    prov <- defaults$prov
  }
  if (!is.null(prov)) {
    insertFields <- c(insertFields, "prov")
    insertValues <- c(insertValues, prov)
  }

  if (missing(provcat)) {
    provcat <- defaults$provcat
  }
  if (!is.null(provcat)) {
    insertFields <- c(insertFields, "provcat")
    insertValues <- c(insertValues, provcat)
  }

  if (missing(drg)) {
    drg <- defaults$drg
  }
  if (!is.null(drg)) {
    insertFields <- c(insertFields, "drg")
    insertValues <- c(insertValues, drg)
  }

  if (missing(icd_flag)) {
    icd_flag <- defaults$icd_flag
  }
  if (!is.null(icd_flag)) {
    insertFields <- c(insertFields, "icd_flag")
    insertValues <- c(insertValues, icd_flag)
  }

  if (missing(diag1)) {
    diag1 <- defaults$diag1
  }
  if (!is.null(diag1)) {
    insertFields <- c(insertFields, "diag1")
    insertValues <- c(insertValues, diag1)
  }

  if (missing(diag2)) {
    diag2 <- defaults$diag2
  }
  if (!is.null(diag2)) {
    insertFields <- c(insertFields, "diag2")
    insertValues <- c(insertValues, diag2)
  }

  if (missing(diag3)) {
    diag3 <- defaults$diag3
  }
  if (!is.null(diag3)) {
    insertFields <- c(insertFields, "diag3")
    insertValues <- c(insertValues, diag3)
  }

  if (missing(diag4)) {
    diag4 <- defaults$diag4
  }
  if (!is.null(diag4)) {
    insertFields <- c(insertFields, "diag4")
    insertValues <- c(insertValues, diag4)
  }

  if (missing(diag5)) {
    diag5 <- defaults$diag5
  }
  if (!is.null(diag5)) {
    insertFields <- c(insertFields, "diag5")
    insertValues <- c(insertValues, diag5)
  }

  if (missing(poa1)) {
    poa1 <- defaults$poa1
  }
  if (!is.null(poa1)) {
    insertFields <- c(insertFields, "poa1")
    insertValues <- c(insertValues, poa1)
  }

  if (missing(poa2)) {
    poa2 <- defaults$poa2
  }
  if (!is.null(poa2)) {
    insertFields <- c(insertFields, "poa2")
    insertValues <- c(insertValues, poa2)
  }

  if (missing(poa3)) {
    poa3 <- defaults$poa3
  }
  if (!is.null(poa3)) {
    insertFields <- c(insertFields, "poa3")
    insertValues <- c(insertValues, poa3)
  }

  if (missing(poa4)) {
    poa4 <- defaults$poa4
  }
  if (!is.null(poa4)) {
    insertFields <- c(insertFields, "poa4")
    insertValues <- c(insertValues, poa4)
  }

  if (missing(poa5)) {
    poa5 <- defaults$poa5
  }
  if (!is.null(poa5)) {
    insertFields <- c(insertFields, "poa5")
    insertValues <- c(insertValues, poa5)
  }

  if (missing(proc_cd)) {
    proc_cd <- defaults$proc_cd
  }
  if (!is.null(proc_cd)) {
    insertFields <- c(insertFields, "proc_cd")
    insertValues <- c(insertValues, proc_cd)
  }

  if (missing(procmod)) {
    procmod <- defaults$procmod
  }
  if (!is.null(procmod)) {
    insertFields <- c(insertFields, "procmod")
    insertValues <- c(insertValues, procmod)
  }

  if (missing(proc1)) {
    proc1 <- defaults$proc1
  }
  if (!is.null(proc1)) {
    insertFields <- c(insertFields, "proc1")
    insertValues <- c(insertValues, proc1)
  }

  if (missing(proc2)) {
    proc2 <- defaults$proc2
  }
  if (!is.null(proc2)) {
    insertFields <- c(insertFields, "proc2")
    insertValues <- c(insertValues, proc2)
  }

  if (missing(proc3)) {
    proc3 <- defaults$proc3
  }
  if (!is.null(proc3)) {
    insertFields <- c(insertFields, "proc3")
    insertValues <- c(insertValues, proc3)
  }

  if (missing(ndc)) {
    ndc <- defaults$ndc
  }
  if (!is.null(ndc)) {
    insertFields <- c(insertFields, "ndc")
    insertValues <- c(insertValues, ndc)
  }

  if (missing(dstatus)) {
    dstatus <- defaults$dstatus
  }
  if (!is.null(dstatus)) {
    insertFields <- c(insertFields, "dstatus")
    insertValues <- c(insertValues, dstatus)
  }

  if (missing(loc_cd)) {
    loc_cd <- defaults$loc_cd
  }
  if (!is.null(loc_cd)) {
    insertFields <- c(insertFields, "loc_cd")
    insertValues <- c(insertValues, loc_cd)
  }

  if (missing(rvnu_cd)) {
    rvnu_cd <- defaults$rvnu_cd
  }
  if (!is.null(rvnu_cd)) {
    insertFields <- c(insertFields, "rvnu_cd")
    insertValues <- c(insertValues, rvnu_cd)
  }

  if (missing(pos)) {
    pos <- defaults$pos
  }
  if (!is.null(pos)) {
    insertFields <- c(insertFields, "pos")
    insertValues <- c(insertValues, pos)
  }

  if (missing(enctr)) {
    enctr <- defaults$enctr
  }
  if (!is.null(enctr)) {
    insertFields <- c(insertFields, "enctr")
    insertValues <- c(insertValues, enctr)
  }

  if (missing(units)) {
    units <- defaults$units
  }
  if (!is.null(units)) {
    insertFields <- c(insertFields, "units")
    insertValues <- c(insertValues, units)
  }

  if (missing(coins)) {
    coins <- defaults$coins
  }
  if (!is.null(coins)) {
    insertFields <- c(insertFields, "coins")
    insertValues <- c(insertValues, coins)
  }

  if (missing(copay)) {
    copay <- defaults$copay
  }
  if (!is.null(copay)) {
    insertFields <- c(insertFields, "copay")
    insertValues <- c(insertValues, copay)
  }

  if (missing(deduct)) {
    deduct <- defaults$deduct
  }
  if (!is.null(deduct)) {
    insertFields <- c(insertFields, "deduct")
    insertValues <- c(insertValues, deduct)
  }

  if (missing(cob)) {
    cob <- defaults$cob
  }
  if (!is.null(cob)) {
    insertFields <- c(insertFields, "cob")
    insertValues <- c(insertValues, cob)
  }

  if (missing(paid_dt)) {
    paid_dt <- defaults$paid_dt
  }
  if (!is.null(paid_dt)) {
    insertFields <- c(insertFields, "paid_dt")
    insertValues <- c(insertValues, paid_dt)
  }

  if (missing(hccc)) {
    hccc <- defaults$hccc
  }
  if (!is.null(hccc)) {
    insertFields <- c(insertFields, "hccc")
    insertValues <- c(insertValues, hccc)
  }

  if (missing(conf_id)) {
    conf_id <- defaults$conf_id
  }
  if (!is.null(conf_id)) {
    insertFields <- c(insertFields, "conf_id")
    insertValues <- c(insertValues, conf_id)
  }

  if (missing(std_cost)) {
    std_cost <- defaults$std_cost
  }
  if (!is.null(std_cost)) {
    insertFields <- c(insertFields, "std_cost")
    insertValues <- c(insertValues, std_cost)
  }

  if (missing(std_cost_yr)) {
    std_cost_yr <- defaults$std_cost_yr
  }
  if (!is.null(std_cost_yr)) {
    insertFields <- c(insertFields, "std_cost_yr")
    insertValues <- c(insertValues, std_cost_yr)
  }

  if (missing(tos_cd)) {
    tos_cd <- defaults$tos_cd
  }
  if (!is.null(tos_cd)) {
    insertFields <- c(insertFields, "tos_cd")
    insertValues <- c(insertValues, tos_cd)
  }

  if (missing(version)) {
    version <- defaults$version
  }
  if (!is.null(version)) {
    insertFields <- c(insertFields, "version")
    insertValues <- c(insertValues, version)
  }

  if (missing(extract_ym)) {
    extract_ym <- defaults$extract_ym
  }
  if (!is.null(extract_ym)) {
    insertFields <- c(insertFields, "extract_ym")
    insertValues <- c(insertValues, extract_ym)
  }

  statement <- paste0("INSERT INTO @source_schema.medical_claims (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
  invisible(statement);
}

add_medication_administrations <- function(ptid, encid, orderid, drug_name, ndc, ndc_source, order_date, order_time, admin_date, admin_time, provid, route, quantity_of_dose, strength, strength_unit, dosage_form, dose_frequency, generic_desc, drug_class) {
  defaults <- frameworkContext$defaultValues$medication_administrations;
  insertFields <- c()
  insertValues <- c()
  if (missing(ptid)) {
    ptid <- defaults$ptid
  }
  if (!is.null(ptid)) {
    insertFields <- c(insertFields, "ptid")
    insertValues <- c(insertValues, ptid)
  }

  if (missing(encid)) {
    encid <- defaults$encid
  }
  if (!is.null(encid)) {
    insertFields <- c(insertFields, "encid")
    insertValues <- c(insertValues, encid)
  }

  if (missing(orderid)) {
    orderid <- defaults$orderid
  }
  if (!is.null(orderid)) {
    insertFields <- c(insertFields, "orderid")
    insertValues <- c(insertValues, orderid)
  }

  if (missing(drug_name)) {
    drug_name <- defaults$drug_name
  }
  if (!is.null(drug_name)) {
    insertFields <- c(insertFields, "drug_name")
    insertValues <- c(insertValues, drug_name)
  }

  if (missing(ndc)) {
    ndc <- defaults$ndc
  }
  if (!is.null(ndc)) {
    insertFields <- c(insertFields, "ndc")
    insertValues <- c(insertValues, ndc)
  }

  if (missing(ndc_source)) {
    ndc_source <- defaults$ndc_source
  }
  if (!is.null(ndc_source)) {
    insertFields <- c(insertFields, "ndc_source")
    insertValues <- c(insertValues, ndc_source)
  }

  if (missing(order_date)) {
    order_date <- defaults$order_date
  }
  if (!is.null(order_date)) {
    insertFields <- c(insertFields, "order_date")
    insertValues <- c(insertValues, order_date)
  }

  if (missing(order_time)) {
    order_time <- defaults$order_time
  }
  if (!is.null(order_time)) {
    insertFields <- c(insertFields, "order_time")
    insertValues <- c(insertValues, order_time)
  }

  if (missing(admin_date)) {
    admin_date <- defaults$admin_date
  }
  if (!is.null(admin_date)) {
    insertFields <- c(insertFields, "admin_date")
    insertValues <- c(insertValues, admin_date)
  }

  if (missing(admin_time)) {
    admin_time <- defaults$admin_time
  }
  if (!is.null(admin_time)) {
    insertFields <- c(insertFields, "admin_time")
    insertValues <- c(insertValues, admin_time)
  }

  if (missing(provid)) {
    provid <- defaults$provid
  }
  if (!is.null(provid)) {
    insertFields <- c(insertFields, "provid")
    insertValues <- c(insertValues, provid)
  }

  if (missing(route)) {
    route <- defaults$route
  }
  if (!is.null(route)) {
    insertFields <- c(insertFields, "route")
    insertValues <- c(insertValues, route)
  }

  if (missing(quantity_of_dose)) {
    quantity_of_dose <- defaults$quantity_of_dose
  }
  if (!is.null(quantity_of_dose)) {
    insertFields <- c(insertFields, "quantity_of_dose")
    insertValues <- c(insertValues, quantity_of_dose)
  }

  if (missing(strength)) {
    strength <- defaults$strength
  }
  if (!is.null(strength)) {
    insertFields <- c(insertFields, "strength")
    insertValues <- c(insertValues, strength)
  }

  if (missing(strength_unit)) {
    strength_unit <- defaults$strength_unit
  }
  if (!is.null(strength_unit)) {
    insertFields <- c(insertFields, "strength_unit")
    insertValues <- c(insertValues, strength_unit)
  }

  if (missing(dosage_form)) {
    dosage_form <- defaults$dosage_form
  }
  if (!is.null(dosage_form)) {
    insertFields <- c(insertFields, "dosage_form")
    insertValues <- c(insertValues, dosage_form)
  }

  if (missing(dose_frequency)) {
    dose_frequency <- defaults$dose_frequency
  }
  if (!is.null(dose_frequency)) {
    insertFields <- c(insertFields, "dose_frequency")
    insertValues <- c(insertValues, dose_frequency)
  }

  if (missing(generic_desc)) {
    generic_desc <- defaults$generic_desc
  }
  if (!is.null(generic_desc)) {
    insertFields <- c(insertFields, "generic_desc")
    insertValues <- c(insertValues, generic_desc)
  }

  if (missing(drug_class)) {
    drug_class <- defaults$drug_class
  }
  if (!is.null(drug_class)) {
    insertFields <- c(insertFields, "drug_class")
    insertValues <- c(insertValues, drug_class)
  }

  statement <- paste0("INSERT INTO @source_schema.medication_administrations (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
  invisible(statement);
}

add_member_detail <- function(ptid, pat_planid, eligeff, eligend, aso, product, bus, cdhp, group_nbr, medical_coverage_ind, pharmacy_coverage_ind, version, extract_ym) {
  defaults <- frameworkContext$defaultValues$member_detail;
  insertFields <- c()
  insertValues <- c()
  if (missing(ptid)) {
    ptid <- defaults$ptid
  }
  if (!is.null(ptid)) {
    insertFields <- c(insertFields, "ptid")
    insertValues <- c(insertValues, ptid)
  }

  if (missing(pat_planid)) {
    pat_planid <- defaults$pat_planid
  }
  if (!is.null(pat_planid)) {
    insertFields <- c(insertFields, "pat_planid")
    insertValues <- c(insertValues, pat_planid)
  }

  if (missing(eligeff)) {
    eligeff <- defaults$eligeff
  }
  if (!is.null(eligeff)) {
    insertFields <- c(insertFields, "eligeff")
    insertValues <- c(insertValues, eligeff)
  }

  if (missing(eligend)) {
    eligend <- defaults$eligend
  }
  if (!is.null(eligend)) {
    insertFields <- c(insertFields, "eligend")
    insertValues <- c(insertValues, eligend)
  }

  if (missing(aso)) {
    aso <- defaults$aso
  }
  if (!is.null(aso)) {
    insertFields <- c(insertFields, "aso")
    insertValues <- c(insertValues, aso)
  }

  if (missing(product)) {
    product <- defaults$product
  }
  if (!is.null(product)) {
    insertFields <- c(insertFields, "product")
    insertValues <- c(insertValues, product)
  }

  if (missing(bus)) {
    bus <- defaults$bus
  }
  if (!is.null(bus)) {
    insertFields <- c(insertFields, "bus")
    insertValues <- c(insertValues, bus)
  }

  if (missing(cdhp)) {
    cdhp <- defaults$cdhp
  }
  if (!is.null(cdhp)) {
    insertFields <- c(insertFields, "cdhp")
    insertValues <- c(insertValues, cdhp)
  }

  if (missing(group_nbr)) {
    group_nbr <- defaults$group_nbr
  }
  if (!is.null(group_nbr)) {
    insertFields <- c(insertFields, "group_nbr")
    insertValues <- c(insertValues, group_nbr)
  }

  if (missing(medical_coverage_ind)) {
    medical_coverage_ind <- defaults$medical_coverage_ind
  }
  if (!is.null(medical_coverage_ind)) {
    insertFields <- c(insertFields, "medical_coverage_ind")
    insertValues <- c(insertValues, medical_coverage_ind)
  }

  if (missing(pharmacy_coverage_ind)) {
    pharmacy_coverage_ind <- defaults$pharmacy_coverage_ind
  }
  if (!is.null(pharmacy_coverage_ind)) {
    insertFields <- c(insertFields, "pharmacy_coverage_ind")
    insertValues <- c(insertValues, pharmacy_coverage_ind)
  }

  if (missing(version)) {
    version <- defaults$version
  }
  if (!is.null(version)) {
    insertFields <- c(insertFields, "version")
    insertValues <- c(insertValues, version)
  }

  if (missing(extract_ym)) {
    extract_ym <- defaults$extract_ym
  }
  if (!is.null(extract_ym)) {
    insertFields <- c(insertFields, "extract_ym")
    insertValues <- c(insertValues, extract_ym)
  }

  statement <- paste0("INSERT INTO @source_schema.member_detail (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
  invisible(statement);
}

add_microbiology <- function(ptid, encid, order_date, order_time, collect_date, collect_time, receive_date, receive_time, result_date, result_time, result_status, specimen_source, organism, mapped_organism_found, mapped_organism_excluded, culture_growth, culture_value, culture_unit, antibiotic, mapped_antibiotic, sensitivity) {
  defaults <- frameworkContext$defaultValues$microbiology;
  insertFields <- c()
  insertValues <- c()
  if (missing(ptid)) {
    ptid <- defaults$ptid
  }
  if (!is.null(ptid)) {
    insertFields <- c(insertFields, "ptid")
    insertValues <- c(insertValues, ptid)
  }

  if (missing(encid)) {
    encid <- defaults$encid
  }
  if (!is.null(encid)) {
    insertFields <- c(insertFields, "encid")
    insertValues <- c(insertValues, encid)
  }

  if (missing(order_date)) {
    order_date <- defaults$order_date
  }
  if (!is.null(order_date)) {
    insertFields <- c(insertFields, "order_date")
    insertValues <- c(insertValues, order_date)
  }

  if (missing(order_time)) {
    order_time <- defaults$order_time
  }
  if (!is.null(order_time)) {
    insertFields <- c(insertFields, "order_time")
    insertValues <- c(insertValues, order_time)
  }

  if (missing(collect_date)) {
    collect_date <- defaults$collect_date
  }
  if (!is.null(collect_date)) {
    insertFields <- c(insertFields, "collect_date")
    insertValues <- c(insertValues, collect_date)
  }

  if (missing(collect_time)) {
    collect_time <- defaults$collect_time
  }
  if (!is.null(collect_time)) {
    insertFields <- c(insertFields, "collect_time")
    insertValues <- c(insertValues, collect_time)
  }

  if (missing(receive_date)) {
    receive_date <- defaults$receive_date
  }
  if (!is.null(receive_date)) {
    insertFields <- c(insertFields, "receive_date")
    insertValues <- c(insertValues, receive_date)
  }

  if (missing(receive_time)) {
    receive_time <- defaults$receive_time
  }
  if (!is.null(receive_time)) {
    insertFields <- c(insertFields, "receive_time")
    insertValues <- c(insertValues, receive_time)
  }

  if (missing(result_date)) {
    result_date <- defaults$result_date
  }
  if (!is.null(result_date)) {
    insertFields <- c(insertFields, "result_date")
    insertValues <- c(insertValues, result_date)
  }

  if (missing(result_time)) {
    result_time <- defaults$result_time
  }
  if (!is.null(result_time)) {
    insertFields <- c(insertFields, "result_time")
    insertValues <- c(insertValues, result_time)
  }

  if (missing(result_status)) {
    result_status <- defaults$result_status
  }
  if (!is.null(result_status)) {
    insertFields <- c(insertFields, "result_status")
    insertValues <- c(insertValues, result_status)
  }

  if (missing(specimen_source)) {
    specimen_source <- defaults$specimen_source
  }
  if (!is.null(specimen_source)) {
    insertFields <- c(insertFields, "specimen_source")
    insertValues <- c(insertValues, specimen_source)
  }

  if (missing(organism)) {
    organism <- defaults$organism
  }
  if (!is.null(organism)) {
    insertFields <- c(insertFields, "organism")
    insertValues <- c(insertValues, organism)
  }

  if (missing(mapped_organism_found)) {
    mapped_organism_found <- defaults$mapped_organism_found
  }
  if (!is.null(mapped_organism_found)) {
    insertFields <- c(insertFields, "mapped_organism_found")
    insertValues <- c(insertValues, mapped_organism_found)
  }

  if (missing(mapped_organism_excluded)) {
    mapped_organism_excluded <- defaults$mapped_organism_excluded
  }
  if (!is.null(mapped_organism_excluded)) {
    insertFields <- c(insertFields, "mapped_organism_excluded")
    insertValues <- c(insertValues, mapped_organism_excluded)
  }

  if (missing(culture_growth)) {
    culture_growth <- defaults$culture_growth
  }
  if (!is.null(culture_growth)) {
    insertFields <- c(insertFields, "culture_growth")
    insertValues <- c(insertValues, culture_growth)
  }

  if (missing(culture_value)) {
    culture_value <- defaults$culture_value
  }
  if (!is.null(culture_value)) {
    insertFields <- c(insertFields, "culture_value")
    insertValues <- c(insertValues, culture_value)
  }

  if (missing(culture_unit)) {
    culture_unit <- defaults$culture_unit
  }
  if (!is.null(culture_unit)) {
    insertFields <- c(insertFields, "culture_unit")
    insertValues <- c(insertValues, culture_unit)
  }

  if (missing(antibiotic)) {
    antibiotic <- defaults$antibiotic
  }
  if (!is.null(antibiotic)) {
    insertFields <- c(insertFields, "antibiotic")
    insertValues <- c(insertValues, antibiotic)
  }

  if (missing(mapped_antibiotic)) {
    mapped_antibiotic <- defaults$mapped_antibiotic
  }
  if (!is.null(mapped_antibiotic)) {
    insertFields <- c(insertFields, "mapped_antibiotic")
    insertValues <- c(insertValues, mapped_antibiotic)
  }

  if (missing(sensitivity)) {
    sensitivity <- defaults$sensitivity
  }
  if (!is.null(sensitivity)) {
    insertFields <- c(insertFields, "sensitivity")
    insertValues <- c(insertValues, sensitivity)
  }

  statement <- paste0("INSERT INTO @source_schema.microbiology (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
  invisible(statement);
}

add_nlp_biomarkers <- function(ptid, note_date, biomarker, variation_detail, biomarker_status) {
  defaults <- frameworkContext$defaultValues$nlp_biomarkers;
  insertFields <- c()
  insertValues <- c()
  if (missing(ptid)) {
    ptid <- defaults$ptid
  }
  if (!is.null(ptid)) {
    insertFields <- c(insertFields, "ptid")
    insertValues <- c(insertValues, ptid)
  }

  if (missing(note_date)) {
    note_date <- defaults$note_date
  }
  if (!is.null(note_date)) {
    insertFields <- c(insertFields, "note_date")
    insertValues <- c(insertValues, note_date)
  }

  if (missing(biomarker)) {
    biomarker <- defaults$biomarker
  }
  if (!is.null(biomarker)) {
    insertFields <- c(insertFields, "biomarker")
    insertValues <- c(insertValues, biomarker)
  }

  if (missing(variation_detail)) {
    variation_detail <- defaults$variation_detail
  }
  if (!is.null(variation_detail)) {
    insertFields <- c(insertFields, "variation_detail")
    insertValues <- c(insertValues, variation_detail)
  }

  if (missing(biomarker_status)) {
    biomarker_status <- defaults$biomarker_status
  }
  if (!is.null(biomarker_status)) {
    insertFields <- c(insertFields, "biomarker_status")
    insertValues <- c(insertValues, biomarker_status)
  }

  statement <- paste0("INSERT INTO @source_schema.nlp_biomarkers (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
  invisible(statement);
}

add_nlp_custom <- function(ptid, encid, note_date, nlp_term, nlp_term_attribute1, nlp_term_attribute2, nlp_term_qualifier, note_section) {
  defaults <- frameworkContext$defaultValues$nlp_custom;
  insertFields <- c()
  insertValues <- c()
  if (missing(ptid)) {
    ptid <- defaults$ptid
  }
  if (!is.null(ptid)) {
    insertFields <- c(insertFields, "ptid")
    insertValues <- c(insertValues, ptid)
  }

  if (missing(encid)) {
    encid <- defaults$encid
  }
  if (!is.null(encid)) {
    insertFields <- c(insertFields, "encid")
    insertValues <- c(insertValues, encid)
  }

  if (missing(note_date)) {
    note_date <- defaults$note_date
  }
  if (!is.null(note_date)) {
    insertFields <- c(insertFields, "note_date")
    insertValues <- c(insertValues, note_date)
  }

  if (missing(nlp_term)) {
    nlp_term <- defaults$nlp_term
  }
  if (!is.null(nlp_term)) {
    insertFields <- c(insertFields, "nlp_term")
    insertValues <- c(insertValues, nlp_term)
  }

  if (missing(nlp_term_attribute1)) {
    nlp_term_attribute1 <- defaults$nlp_term_attribute1
  }
  if (!is.null(nlp_term_attribute1)) {
    insertFields <- c(insertFields, "nlp_term_attribute1")
    insertValues <- c(insertValues, nlp_term_attribute1)
  }

  if (missing(nlp_term_attribute2)) {
    nlp_term_attribute2 <- defaults$nlp_term_attribute2
  }
  if (!is.null(nlp_term_attribute2)) {
    insertFields <- c(insertFields, "nlp_term_attribute2")
    insertValues <- c(insertValues, nlp_term_attribute2)
  }

  if (missing(nlp_term_qualifier)) {
    nlp_term_qualifier <- defaults$nlp_term_qualifier
  }
  if (!is.null(nlp_term_qualifier)) {
    insertFields <- c(insertFields, "nlp_term_qualifier")
    insertValues <- c(insertValues, nlp_term_qualifier)
  }

  if (missing(note_section)) {
    note_section <- defaults$note_section
  }
  if (!is.null(note_section)) {
    insertFields <- c(insertFields, "note_section")
    insertValues <- c(insertValues, note_section)
  }

  statement <- paste0("INSERT INTO @source_schema.nlp_custom (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
  invisible(statement);
}

add_nlp_drug_rationale <- function(ptid, encid, note_date, note_section, drug_name, drug_action, drug_action_preposition, reason_general, sentiment, sentiment_who) {
  defaults <- frameworkContext$defaultValues$nlp_drug_rationale;
  insertFields <- c()
  insertValues <- c()
  if (missing(ptid)) {
    ptid <- defaults$ptid
  }
  if (!is.null(ptid)) {
    insertFields <- c(insertFields, "ptid")
    insertValues <- c(insertValues, ptid)
  }

  if (missing(encid)) {
    encid <- defaults$encid
  }
  if (!is.null(encid)) {
    insertFields <- c(insertFields, "encid")
    insertValues <- c(insertValues, encid)
  }

  if (missing(note_date)) {
    note_date <- defaults$note_date
  }
  if (!is.null(note_date)) {
    insertFields <- c(insertFields, "note_date")
    insertValues <- c(insertValues, note_date)
  }

  if (missing(note_section)) {
    note_section <- defaults$note_section
  }
  if (!is.null(note_section)) {
    insertFields <- c(insertFields, "note_section")
    insertValues <- c(insertValues, note_section)
  }

  if (missing(drug_name)) {
    drug_name <- defaults$drug_name
  }
  if (!is.null(drug_name)) {
    insertFields <- c(insertFields, "drug_name")
    insertValues <- c(insertValues, drug_name)
  }

  if (missing(drug_action)) {
    drug_action <- defaults$drug_action
  }
  if (!is.null(drug_action)) {
    insertFields <- c(insertFields, "drug_action")
    insertValues <- c(insertValues, drug_action)
  }

  if (missing(drug_action_preposition)) {
    drug_action_preposition <- defaults$drug_action_preposition
  }
  if (!is.null(drug_action_preposition)) {
    insertFields <- c(insertFields, "drug_action_preposition")
    insertValues <- c(insertValues, drug_action_preposition)
  }

  if (missing(reason_general)) {
    reason_general <- defaults$reason_general
  }
  if (!is.null(reason_general)) {
    insertFields <- c(insertFields, "reason_general")
    insertValues <- c(insertValues, reason_general)
  }

  if (missing(sentiment)) {
    sentiment <- defaults$sentiment
  }
  if (!is.null(sentiment)) {
    insertFields <- c(insertFields, "sentiment")
    insertValues <- c(insertValues, sentiment)
  }

  if (missing(sentiment_who)) {
    sentiment_who <- defaults$sentiment_who
  }
  if (!is.null(sentiment_who)) {
    insertFields <- c(insertFields, "sentiment_who")
    insertValues <- c(insertValues, sentiment_who)
  }

  statement <- paste0("INSERT INTO @source_schema.nlp_drug_rationale (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
  invisible(statement);
}

add_nlp_measurement <- function(ptid, encid, note_date, measurement_type, measurement_value, measurement_detail, note_section, measurement_year, measurement_yearmonth, measurement_date) {
  defaults <- frameworkContext$defaultValues$nlp_measurement;
  insertFields <- c()
  insertValues <- c()
  if (missing(ptid)) {
    ptid <- defaults$ptid
  }
  if (!is.null(ptid)) {
    insertFields <- c(insertFields, "ptid")
    insertValues <- c(insertValues, ptid)
  }

  if (missing(encid)) {
    encid <- defaults$encid
  }
  if (!is.null(encid)) {
    insertFields <- c(insertFields, "encid")
    insertValues <- c(insertValues, encid)
  }

  if (missing(note_date)) {
    note_date <- defaults$note_date
  }
  if (!is.null(note_date)) {
    insertFields <- c(insertFields, "note_date")
    insertValues <- c(insertValues, note_date)
  }

  if (missing(measurement_type)) {
    measurement_type <- defaults$measurement_type
  }
  if (!is.null(measurement_type)) {
    insertFields <- c(insertFields, "measurement_type")
    insertValues <- c(insertValues, measurement_type)
  }

  if (missing(measurement_value)) {
    measurement_value <- defaults$measurement_value
  }
  if (!is.null(measurement_value)) {
    insertFields <- c(insertFields, "measurement_value")
    insertValues <- c(insertValues, measurement_value)
  }

  if (missing(measurement_detail)) {
    measurement_detail <- defaults$measurement_detail
  }
  if (!is.null(measurement_detail)) {
    insertFields <- c(insertFields, "measurement_detail")
    insertValues <- c(insertValues, measurement_detail)
  }

  if (missing(note_section)) {
    note_section <- defaults$note_section
  }
  if (!is.null(note_section)) {
    insertFields <- c(insertFields, "note_section")
    insertValues <- c(insertValues, note_section)
  }

  if (missing(measurement_year)) {
    measurement_year <- defaults$measurement_year
  }
  if (!is.null(measurement_year)) {
    insertFields <- c(insertFields, "measurement_year")
    insertValues <- c(insertValues, measurement_year)
  }

  if (missing(measurement_yearmonth)) {
    measurement_yearmonth <- defaults$measurement_yearmonth
  }
  if (!is.null(measurement_yearmonth)) {
    insertFields <- c(insertFields, "measurement_yearmonth")
    insertValues <- c(insertValues, measurement_yearmonth)
  }

  if (missing(measurement_date)) {
    measurement_date <- defaults$measurement_date
  }
  if (!is.null(measurement_date)) {
    insertFields <- c(insertFields, "measurement_date")
    insertValues <- c(insertValues, measurement_date)
  }

  statement <- paste0("INSERT INTO @source_schema.nlp_measurement (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
  invisible(statement);
}

add_nlp_sds <- function(ptid, encid, note_date, sds_term, sds_location, sds_attribute, sds_sentiment, occurrence_year, occurrence_yearmonth, occurrence_date, note_section, sds_concept, sds_timing, sds_severity, sds_extent, sds_duration, sds_change, sds_quality) {
  defaults <- frameworkContext$defaultValues$nlp_sds;
  insertFields <- c()
  insertValues <- c()
  if (missing(ptid)) {
    ptid <- defaults$ptid
  }
  if (!is.null(ptid)) {
    insertFields <- c(insertFields, "ptid")
    insertValues <- c(insertValues, ptid)
  }

  if (missing(encid)) {
    encid <- defaults$encid
  }
  if (!is.null(encid)) {
    insertFields <- c(insertFields, "encid")
    insertValues <- c(insertValues, encid)
  }

  if (missing(note_date)) {
    note_date <- defaults$note_date
  }
  if (!is.null(note_date)) {
    insertFields <- c(insertFields, "note_date")
    insertValues <- c(insertValues, note_date)
  }

  if (missing(sds_term)) {
    sds_term <- defaults$sds_term
  }
  if (!is.null(sds_term)) {
    insertFields <- c(insertFields, "sds_term")
    insertValues <- c(insertValues, sds_term)
  }

  if (missing(sds_location)) {
    sds_location <- defaults$sds_location
  }
  if (!is.null(sds_location)) {
    insertFields <- c(insertFields, "sds_location")
    insertValues <- c(insertValues, sds_location)
  }

  if (missing(sds_attribute)) {
    sds_attribute <- defaults$sds_attribute
  }
  if (!is.null(sds_attribute)) {
    insertFields <- c(insertFields, "sds_attribute")
    insertValues <- c(insertValues, sds_attribute)
  }

  if (missing(sds_sentiment)) {
    sds_sentiment <- defaults$sds_sentiment
  }
  if (!is.null(sds_sentiment)) {
    insertFields <- c(insertFields, "sds_sentiment")
    insertValues <- c(insertValues, sds_sentiment)
  }

  if (missing(occurrence_year)) {
    occurrence_year <- defaults$occurrence_year
  }
  if (!is.null(occurrence_year)) {
    insertFields <- c(insertFields, "occurrence_year")
    insertValues <- c(insertValues, occurrence_year)
  }

  if (missing(occurrence_yearmonth)) {
    occurrence_yearmonth <- defaults$occurrence_yearmonth
  }
  if (!is.null(occurrence_yearmonth)) {
    insertFields <- c(insertFields, "occurrence_yearmonth")
    insertValues <- c(insertValues, occurrence_yearmonth)
  }

  if (missing(occurrence_date)) {
    occurrence_date <- defaults$occurrence_date
  }
  if (!is.null(occurrence_date)) {
    insertFields <- c(insertFields, "occurrence_date")
    insertValues <- c(insertValues, occurrence_date)
  }

  if (missing(note_section)) {
    note_section <- defaults$note_section
  }
  if (!is.null(note_section)) {
    insertFields <- c(insertFields, "note_section")
    insertValues <- c(insertValues, note_section)
  }

  if (missing(sds_concept)) {
    sds_concept <- defaults$sds_concept
  }
  if (!is.null(sds_concept)) {
    insertFields <- c(insertFields, "sds_concept")
    insertValues <- c(insertValues, sds_concept)
  }

  if (missing(sds_timing)) {
    sds_timing <- defaults$sds_timing
  }
  if (!is.null(sds_timing)) {
    insertFields <- c(insertFields, "sds_timing")
    insertValues <- c(insertValues, sds_timing)
  }

  if (missing(sds_severity)) {
    sds_severity <- defaults$sds_severity
  }
  if (!is.null(sds_severity)) {
    insertFields <- c(insertFields, "sds_severity")
    insertValues <- c(insertValues, sds_severity)
  }

  if (missing(sds_extent)) {
    sds_extent <- defaults$sds_extent
  }
  if (!is.null(sds_extent)) {
    insertFields <- c(insertFields, "sds_extent")
    insertValues <- c(insertValues, sds_extent)
  }

  if (missing(sds_duration)) {
    sds_duration <- defaults$sds_duration
  }
  if (!is.null(sds_duration)) {
    insertFields <- c(insertFields, "sds_duration")
    insertValues <- c(insertValues, sds_duration)
  }

  if (missing(sds_change)) {
    sds_change <- defaults$sds_change
  }
  if (!is.null(sds_change)) {
    insertFields <- c(insertFields, "sds_change")
    insertValues <- c(insertValues, sds_change)
  }

  if (missing(sds_quality)) {
    sds_quality <- defaults$sds_quality
  }
  if (!is.null(sds_quality)) {
    insertFields <- c(insertFields, "sds_quality")
    insertValues <- c(insertValues, sds_quality)
  }

  statement <- paste0("INSERT INTO @source_schema.nlp_sds (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
  invisible(statement);
}

add_nlp_sds_family <- function(ptid, encid, note_date, sds_term, sds_location, sds_family_member, sds_sentiment, note_section) {
  defaults <- frameworkContext$defaultValues$nlp_sds_family;
  insertFields <- c()
  insertValues <- c()
  if (missing(ptid)) {
    ptid <- defaults$ptid
  }
  if (!is.null(ptid)) {
    insertFields <- c(insertFields, "ptid")
    insertValues <- c(insertValues, ptid)
  }

  if (missing(encid)) {
    encid <- defaults$encid
  }
  if (!is.null(encid)) {
    insertFields <- c(insertFields, "encid")
    insertValues <- c(insertValues, encid)
  }

  if (missing(note_date)) {
    note_date <- defaults$note_date
  }
  if (!is.null(note_date)) {
    insertFields <- c(insertFields, "note_date")
    insertValues <- c(insertValues, note_date)
  }

  if (missing(sds_term)) {
    sds_term <- defaults$sds_term
  }
  if (!is.null(sds_term)) {
    insertFields <- c(insertFields, "sds_term")
    insertValues <- c(insertValues, sds_term)
  }

  if (missing(sds_location)) {
    sds_location <- defaults$sds_location
  }
  if (!is.null(sds_location)) {
    insertFields <- c(insertFields, "sds_location")
    insertValues <- c(insertValues, sds_location)
  }

  if (missing(sds_family_member)) {
    sds_family_member <- defaults$sds_family_member
  }
  if (!is.null(sds_family_member)) {
    insertFields <- c(insertFields, "sds_family_member")
    insertValues <- c(insertValues, sds_family_member)
  }

  if (missing(sds_sentiment)) {
    sds_sentiment <- defaults$sds_sentiment
  }
  if (!is.null(sds_sentiment)) {
    insertFields <- c(insertFields, "sds_sentiment")
    insertValues <- c(insertValues, sds_sentiment)
  }

  if (missing(note_section)) {
    note_section <- defaults$note_section
  }
  if (!is.null(note_section)) {
    insertFields <- c(insertFields, "note_section")
    insertValues <- c(insertValues, note_section)
  }

  statement <- paste0("INSERT INTO @source_schema.nlp_sds_family (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
  invisible(statement);
}

add_observations <- function(ptid, encid, obs_type, nlp, obs_date, obs_time, obsresult, obs_unit, evaluated_for_range, value_within_range, result_date) {
  defaults <- frameworkContext$defaultValues$observations;
  insertFields <- c()
  insertValues <- c()
  if (missing(ptid)) {
    ptid <- defaults$ptid
  }
  if (!is.null(ptid)) {
    insertFields <- c(insertFields, "ptid")
    insertValues <- c(insertValues, ptid)
  }

  if (missing(encid)) {
    encid <- defaults$encid
  }
  if (!is.null(encid)) {
    insertFields <- c(insertFields, "encid")
    insertValues <- c(insertValues, encid)
  }

  if (missing(obs_type)) {
    obs_type <- defaults$obs_type
  }
  if (!is.null(obs_type)) {
    insertFields <- c(insertFields, "obs_type")
    insertValues <- c(insertValues, obs_type)
  }

  if (missing(nlp)) {
    nlp <- defaults$nlp
  }
  if (!is.null(nlp)) {
    insertFields <- c(insertFields, "nlp")
    insertValues <- c(insertValues, nlp)
  }

  if (missing(obs_date)) {
    obs_date <- defaults$obs_date
  }
  if (!is.null(obs_date)) {
    insertFields <- c(insertFields, "obs_date")
    insertValues <- c(insertValues, obs_date)
  }

  if (missing(obs_time)) {
    obs_time <- defaults$obs_time
  }
  if (!is.null(obs_time)) {
    insertFields <- c(insertFields, "obs_time")
    insertValues <- c(insertValues, obs_time)
  }

  if (missing(obsresult)) {
    obsresult <- defaults$obsresult
  }
  if (!is.null(obsresult)) {
    insertFields <- c(insertFields, "obsresult")
    insertValues <- c(insertValues, obsresult)
  }

  if (missing(obs_unit)) {
    obs_unit <- defaults$obs_unit
  }
  if (!is.null(obs_unit)) {
    insertFields <- c(insertFields, "obs_unit")
    insertValues <- c(insertValues, obs_unit)
  }

  if (missing(evaluated_for_range)) {
    evaluated_for_range <- defaults$evaluated_for_range
  }
  if (!is.null(evaluated_for_range)) {
    insertFields <- c(insertFields, "evaluated_for_range")
    insertValues <- c(insertValues, evaluated_for_range)
  }

  if (missing(value_within_range)) {
    value_within_range <- defaults$value_within_range
  }
  if (!is.null(value_within_range)) {
    insertFields <- c(insertFields, "value_within_range")
    insertValues <- c(insertValues, value_within_range)
  }

  if (missing(result_date)) {
    result_date <- defaults$result_date
  }
  if (!is.null(result_date)) {
    insertFields <- c(insertFields, "result_date")
    insertValues <- c(insertValues, result_date)
  }

  statement <- paste0("INSERT INTO @source_schema.observations (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
  invisible(statement);
}

add_patient <- function(ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, date_of_death, provid_pcp, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through, overlap) {
  defaults <- frameworkContext$defaultValues$patient;
  insertFields <- c()
  insertValues <- c()
  if (missing(ptid)) {
    ptid <- defaults$ptid
  }
  if (!is.null(ptid)) {
    insertFields <- c(insertFields, "ptid")
    insertValues <- c(insertValues, ptid)
  }

  if (missing(birth_yr)) {
    birth_yr <- defaults$birth_yr
  }
  if (!is.null(birth_yr)) {
    insertFields <- c(insertFields, "birth_yr")
    insertValues <- c(insertValues, birth_yr)
  }

  if (missing(gender)) {
    gender <- defaults$gender
  }
  if (!is.null(gender)) {
    insertFields <- c(insertFields, "gender")
    insertValues <- c(insertValues, gender)
  }

  if (missing(race)) {
    race <- defaults$race
  }
  if (!is.null(race)) {
    insertFields <- c(insertFields, "race")
    insertValues <- c(insertValues, race)
  }

  if (missing(ethnicity)) {
    ethnicity <- defaults$ethnicity
  }
  if (!is.null(ethnicity)) {
    insertFields <- c(insertFields, "ethnicity")
    insertValues <- c(insertValues, ethnicity)
  }

  if (missing(region)) {
    region <- defaults$region
  }
  if (!is.null(region)) {
    insertFields <- c(insertFields, "region")
    insertValues <- c(insertValues, region)
  }

  if (missing(division)) {
    division <- defaults$division
  }
  if (!is.null(division)) {
    insertFields <- c(insertFields, "division")
    insertValues <- c(insertValues, division)
  }

  if (missing(avg_hh_income)) {
    avg_hh_income <- defaults$avg_hh_income
  }
  if (!is.null(avg_hh_income)) {
    insertFields <- c(insertFields, "avg_hh_income")
    insertValues <- c(insertValues, avg_hh_income)
  }

  if (missing(pct_college_educ)) {
    pct_college_educ <- defaults$pct_college_educ
  }
  if (!is.null(pct_college_educ)) {
    insertFields <- c(insertFields, "pct_college_educ")
    insertValues <- c(insertValues, pct_college_educ)
  }

  if (missing(deceased_indicator)) {
    deceased_indicator <- defaults$deceased_indicator
  }
  if (!is.null(deceased_indicator)) {
    insertFields <- c(insertFields, "deceased_indicator")
    insertValues <- c(insertValues, deceased_indicator)
  }

  if (missing(date_of_death)) {
    date_of_death <- defaults$date_of_death
  }
  if (!is.null(date_of_death)) {
    insertFields <- c(insertFields, "date_of_death")
    insertValues <- c(insertValues, date_of_death)
  }

  if (missing(provid_pcp)) {
    provid_pcp <- defaults$provid_pcp
  }
  if (!is.null(provid_pcp)) {
    insertFields <- c(insertFields, "provid_pcp")
    insertValues <- c(insertValues, provid_pcp)
  }

  if (missing(idn_indicator)) {
    idn_indicator <- defaults$idn_indicator
  }
  if (!is.null(idn_indicator)) {
    insertFields <- c(insertFields, "idn_indicator")
    insertValues <- c(insertValues, idn_indicator)
  }

  if (missing(first_month_active)) {
    first_month_active <- defaults$first_month_active
  }
  if (!is.null(first_month_active)) {
    insertFields <- c(insertFields, "first_month_active")
    insertValues <- c(insertValues, first_month_active)
  }

  if (missing(last_month_active)) {
    last_month_active <- defaults$last_month_active
  }
  if (!is.null(last_month_active)) {
    insertFields <- c(insertFields, "last_month_active")
    insertValues <- c(insertValues, last_month_active)
  }

  if (missing(notes_eligible)) {
    notes_eligible <- defaults$notes_eligible
  }
  if (!is.null(notes_eligible)) {
    insertFields <- c(insertFields, "notes_eligible")
    insertValues <- c(insertValues, notes_eligible)
  }

  if (missing(has_notes)) {
    has_notes <- defaults$has_notes
  }
  if (!is.null(has_notes)) {
    insertFields <- c(insertFields, "has_notes")
    insertValues <- c(insertValues, has_notes)
  }

  if (missing(sourceid)) {
    sourceid <- defaults$sourceid
  }
  if (!is.null(sourceid)) {
    insertFields <- c(insertFields, "sourceid")
    insertValues <- c(insertValues, sourceid)
  }

  if (missing(source_data_through)) {
    source_data_through <- defaults$source_data_through
  }
  if (!is.null(source_data_through)) {
    insertFields <- c(insertFields, "source_data_through")
    insertValues <- c(insertValues, source_data_through)
  }

  if (missing(overlap)) {
    overlap <- defaults$overlap
  }
  if (!is.null(overlap)) {
    insertFields <- c(insertFields, "overlap")
    insertValues <- c(insertValues, overlap)
  }

  statement <- paste0("INSERT INTO @source_schema.patient (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
  invisible(statement);
}

add_patient_reported_medications <- function(ptid, reported_date, drug_name, ndc, ndc_source, provid, route, quantity_of_dose, strength, strength_unit, dosage_form, dose_frequency, generic_desc, drug_class) {
  defaults <- frameworkContext$defaultValues$patient_reported_medications;
  insertFields <- c()
  insertValues <- c()
  if (missing(ptid)) {
    ptid <- defaults$ptid
  }
  if (!is.null(ptid)) {
    insertFields <- c(insertFields, "ptid")
    insertValues <- c(insertValues, ptid)
  }

  if (missing(reported_date)) {
    reported_date <- defaults$reported_date
  }
  if (!is.null(reported_date)) {
    insertFields <- c(insertFields, "reported_date")
    insertValues <- c(insertValues, reported_date)
  }

  if (missing(drug_name)) {
    drug_name <- defaults$drug_name
  }
  if (!is.null(drug_name)) {
    insertFields <- c(insertFields, "drug_name")
    insertValues <- c(insertValues, drug_name)
  }

  if (missing(ndc)) {
    ndc <- defaults$ndc
  }
  if (!is.null(ndc)) {
    insertFields <- c(insertFields, "ndc")
    insertValues <- c(insertValues, ndc)
  }

  if (missing(ndc_source)) {
    ndc_source <- defaults$ndc_source
  }
  if (!is.null(ndc_source)) {
    insertFields <- c(insertFields, "ndc_source")
    insertValues <- c(insertValues, ndc_source)
  }

  if (missing(provid)) {
    provid <- defaults$provid
  }
  if (!is.null(provid)) {
    insertFields <- c(insertFields, "provid")
    insertValues <- c(insertValues, provid)
  }

  if (missing(route)) {
    route <- defaults$route
  }
  if (!is.null(route)) {
    insertFields <- c(insertFields, "route")
    insertValues <- c(insertValues, route)
  }

  if (missing(quantity_of_dose)) {
    quantity_of_dose <- defaults$quantity_of_dose
  }
  if (!is.null(quantity_of_dose)) {
    insertFields <- c(insertFields, "quantity_of_dose")
    insertValues <- c(insertValues, quantity_of_dose)
  }

  if (missing(strength)) {
    strength <- defaults$strength
  }
  if (!is.null(strength)) {
    insertFields <- c(insertFields, "strength")
    insertValues <- c(insertValues, strength)
  }

  if (missing(strength_unit)) {
    strength_unit <- defaults$strength_unit
  }
  if (!is.null(strength_unit)) {
    insertFields <- c(insertFields, "strength_unit")
    insertValues <- c(insertValues, strength_unit)
  }

  if (missing(dosage_form)) {
    dosage_form <- defaults$dosage_form
  }
  if (!is.null(dosage_form)) {
    insertFields <- c(insertFields, "dosage_form")
    insertValues <- c(insertValues, dosage_form)
  }

  if (missing(dose_frequency)) {
    dose_frequency <- defaults$dose_frequency
  }
  if (!is.null(dose_frequency)) {
    insertFields <- c(insertFields, "dose_frequency")
    insertValues <- c(insertValues, dose_frequency)
  }

  if (missing(generic_desc)) {
    generic_desc <- defaults$generic_desc
  }
  if (!is.null(generic_desc)) {
    insertFields <- c(insertFields, "generic_desc")
    insertValues <- c(insertValues, generic_desc)
  }

  if (missing(drug_class)) {
    drug_class <- defaults$drug_class
  }
  if (!is.null(drug_class)) {
    insertFields <- c(insertFields, "drug_class")
    insertValues <- c(insertValues, drug_class)
  }

  statement <- paste0("INSERT INTO @source_schema.patient_reported_medications (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
  invisible(statement);
}

add_prescriptions_written <- function(ptid, rxdate, rxtime, drug_name, ndc, ndc_source, provid, route, quantity_of_dose, strength, strength_unit, dosage_form, daily_dose, dose_frequency, quantity_per_fill, num_refills, days_supply, generic_desc, drug_class) {
  defaults <- frameworkContext$defaultValues$prescriptions_written;
  insertFields <- c()
  insertValues <- c()
  if (missing(ptid)) {
    ptid <- defaults$ptid
  }
  if (!is.null(ptid)) {
    insertFields <- c(insertFields, "ptid")
    insertValues <- c(insertValues, ptid)
  }

  if (missing(rxdate)) {
    rxdate <- defaults$rxdate
  }
  if (!is.null(rxdate)) {
    insertFields <- c(insertFields, "rxdate")
    insertValues <- c(insertValues, rxdate)
  }

  if (missing(rxtime)) {
    rxtime <- defaults$rxtime
  }
  if (!is.null(rxtime)) {
    insertFields <- c(insertFields, "rxtime")
    insertValues <- c(insertValues, rxtime)
  }

  if (missing(drug_name)) {
    drug_name <- defaults$drug_name
  }
  if (!is.null(drug_name)) {
    insertFields <- c(insertFields, "drug_name")
    insertValues <- c(insertValues, drug_name)
  }

  if (missing(ndc)) {
    ndc <- defaults$ndc
  }
  if (!is.null(ndc)) {
    insertFields <- c(insertFields, "ndc")
    insertValues <- c(insertValues, ndc)
  }

  if (missing(ndc_source)) {
    ndc_source <- defaults$ndc_source
  }
  if (!is.null(ndc_source)) {
    insertFields <- c(insertFields, "ndc_source")
    insertValues <- c(insertValues, ndc_source)
  }

  if (missing(provid)) {
    provid <- defaults$provid
  }
  if (!is.null(provid)) {
    insertFields <- c(insertFields, "provid")
    insertValues <- c(insertValues, provid)
  }

  if (missing(route)) {
    route <- defaults$route
  }
  if (!is.null(route)) {
    insertFields <- c(insertFields, "route")
    insertValues <- c(insertValues, route)
  }

  if (missing(quantity_of_dose)) {
    quantity_of_dose <- defaults$quantity_of_dose
  }
  if (!is.null(quantity_of_dose)) {
    insertFields <- c(insertFields, "quantity_of_dose")
    insertValues <- c(insertValues, quantity_of_dose)
  }

  if (missing(strength)) {
    strength <- defaults$strength
  }
  if (!is.null(strength)) {
    insertFields <- c(insertFields, "strength")
    insertValues <- c(insertValues, strength)
  }

  if (missing(strength_unit)) {
    strength_unit <- defaults$strength_unit
  }
  if (!is.null(strength_unit)) {
    insertFields <- c(insertFields, "strength_unit")
    insertValues <- c(insertValues, strength_unit)
  }

  if (missing(dosage_form)) {
    dosage_form <- defaults$dosage_form
  }
  if (!is.null(dosage_form)) {
    insertFields <- c(insertFields, "dosage_form")
    insertValues <- c(insertValues, dosage_form)
  }

  if (missing(daily_dose)) {
    daily_dose <- defaults$daily_dose
  }
  if (!is.null(daily_dose)) {
    insertFields <- c(insertFields, "daily_dose")
    insertValues <- c(insertValues, daily_dose)
  }

  if (missing(dose_frequency)) {
    dose_frequency <- defaults$dose_frequency
  }
  if (!is.null(dose_frequency)) {
    insertFields <- c(insertFields, "dose_frequency")
    insertValues <- c(insertValues, dose_frequency)
  }

  if (missing(quantity_per_fill)) {
    quantity_per_fill <- defaults$quantity_per_fill
  }
  if (!is.null(quantity_per_fill)) {
    insertFields <- c(insertFields, "quantity_per_fill")
    insertValues <- c(insertValues, quantity_per_fill)
  }

  if (missing(num_refills)) {
    num_refills <- defaults$num_refills
  }
  if (!is.null(num_refills)) {
    insertFields <- c(insertFields, "num_refills")
    insertValues <- c(insertValues, num_refills)
  }

  if (missing(days_supply)) {
    days_supply <- defaults$days_supply
  }
  if (!is.null(days_supply)) {
    insertFields <- c(insertFields, "days_supply")
    insertValues <- c(insertValues, days_supply)
  }

  if (missing(generic_desc)) {
    generic_desc <- defaults$generic_desc
  }
  if (!is.null(generic_desc)) {
    insertFields <- c(insertFields, "generic_desc")
    insertValues <- c(insertValues, generic_desc)
  }

  if (missing(drug_class)) {
    drug_class <- defaults$drug_class
  }
  if (!is.null(drug_class)) {
    insertFields <- c(insertFields, "drug_class")
    insertValues <- c(insertValues, drug_class)
  }

  statement <- paste0("INSERT INTO @source_schema.prescriptions_written (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
  invisible(statement);
}

add_procedure <- function(ptid, encid, proc_date, proc_time, proc_code, proc_desc, proc_code_type, provid_perform, provid_order, betos_code, betos_desc) {
  defaults <- frameworkContext$defaultValues$procedure;
  insertFields <- c()
  insertValues <- c()
  if (missing(ptid)) {
    ptid <- defaults$ptid
  }
  if (!is.null(ptid)) {
    insertFields <- c(insertFields, "ptid")
    insertValues <- c(insertValues, ptid)
  }

  if (missing(encid)) {
    encid <- defaults$encid
  }
  if (!is.null(encid)) {
    insertFields <- c(insertFields, "encid")
    insertValues <- c(insertValues, encid)
  }

  if (missing(proc_date)) {
    proc_date <- defaults$proc_date
  }
  if (!is.null(proc_date)) {
    insertFields <- c(insertFields, "proc_date")
    insertValues <- c(insertValues, proc_date)
  }

  if (missing(proc_time)) {
    proc_time <- defaults$proc_time
  }
  if (!is.null(proc_time)) {
    insertFields <- c(insertFields, "proc_time")
    insertValues <- c(insertValues, proc_time)
  }

  if (missing(proc_code)) {
    proc_code <- defaults$proc_code
  }
  if (!is.null(proc_code)) {
    insertFields <- c(insertFields, "proc_code")
    insertValues <- c(insertValues, proc_code)
  }

  if (missing(proc_desc)) {
    proc_desc <- defaults$proc_desc
  }
  if (!is.null(proc_desc)) {
    insertFields <- c(insertFields, "proc_desc")
    insertValues <- c(insertValues, proc_desc)
  }

  if (missing(proc_code_type)) {
    proc_code_type <- defaults$proc_code_type
  }
  if (!is.null(proc_code_type)) {
    insertFields <- c(insertFields, "proc_code_type")
    insertValues <- c(insertValues, proc_code_type)
  }

  if (missing(provid_perform)) {
    provid_perform <- defaults$provid_perform
  }
  if (!is.null(provid_perform)) {
    insertFields <- c(insertFields, "provid_perform")
    insertValues <- c(insertValues, provid_perform)
  }

  if (missing(provid_order)) {
    provid_order <- defaults$provid_order
  }
  if (!is.null(provid_order)) {
    insertFields <- c(insertFields, "provid_order")
    insertValues <- c(insertValues, provid_order)
  }

  if (missing(betos_code)) {
    betos_code <- defaults$betos_code
  }
  if (!is.null(betos_code)) {
    insertFields <- c(insertFields, "betos_code")
    insertValues <- c(insertValues, betos_code)
  }

  if (missing(betos_desc)) {
    betos_desc <- defaults$betos_desc
  }
  if (!is.null(betos_desc)) {
    insertFields <- c(insertFields, "betos_desc")
    insertValues <- c(insertValues, betos_desc)
  }

  statement <- paste0("INSERT INTO @source_schema.[procedure] (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
  invisible(statement);
}

add_provider <- function(provid, specialty, prim_spec_ind) {
  defaults <- frameworkContext$defaultValues$provider;
  insertFields <- c()
  insertValues <- c()
  if (missing(provid)) {
    provid <- defaults$provid
  }
  if (!is.null(provid)) {
    insertFields <- c(insertFields, "provid")
    insertValues <- c(insertValues, provid)
  }

  if (missing(specialty)) {
    specialty <- defaults$specialty
  }
  if (!is.null(specialty)) {
    insertFields <- c(insertFields, "specialty")
    insertValues <- c(insertValues, specialty)
  }

  if (missing(prim_spec_ind)) {
    prim_spec_ind <- defaults$prim_spec_ind
  }
  if (!is.null(prim_spec_ind)) {
    insertFields <- c(insertFields, "prim_spec_ind")
    insertValues <- c(insertValues, prim_spec_ind)
  }

  statement <- paste0("INSERT INTO @source_schema.provider (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
  invisible(statement);
}

add_rx_claims <- function(ptid, pat_planid, clmid, chk_dt, npi, fill_dt, ahfsclss, specclss, brnd_nm, ndc, gnrc_ind, avgwhlsl, copay, deduct, daw, form_ind, form_typ, strength, days_sup, quantity, fst_fill, rfl_nbr, prc_typ, std_cost, std_cost_yr, version, extract_ym) {
  defaults <- frameworkContext$defaultValues$rx_claims;
  insertFields <- c()
  insertValues <- c()
  if (missing(ptid)) {
    ptid <- defaults$ptid
  }
  if (!is.null(ptid)) {
    insertFields <- c(insertFields, "ptid")
    insertValues <- c(insertValues, ptid)
  }

  if (missing(pat_planid)) {
    pat_planid <- defaults$pat_planid
  }
  if (!is.null(pat_planid)) {
    insertFields <- c(insertFields, "pat_planid")
    insertValues <- c(insertValues, pat_planid)
  }

  if (missing(clmid)) {
    clmid <- defaults$clmid
  }
  if (!is.null(clmid)) {
    insertFields <- c(insertFields, "clmid")
    insertValues <- c(insertValues, clmid)
  }

  if (missing(chk_dt)) {
    chk_dt <- defaults$chk_dt
  }
  if (!is.null(chk_dt)) {
    insertFields <- c(insertFields, "chk_dt")
    insertValues <- c(insertValues, chk_dt)
  }

  if (missing(npi)) {
    npi <- defaults$npi
  }
  if (!is.null(npi)) {
    insertFields <- c(insertFields, "npi")
    insertValues <- c(insertValues, npi)
  }

  if (missing(fill_dt)) {
    fill_dt <- defaults$fill_dt
  }
  if (!is.null(fill_dt)) {
    insertFields <- c(insertFields, "fill_dt")
    insertValues <- c(insertValues, fill_dt)
  }

  if (missing(ahfsclss)) {
    ahfsclss <- defaults$ahfsclss
  }
  if (!is.null(ahfsclss)) {
    insertFields <- c(insertFields, "ahfsclss")
    insertValues <- c(insertValues, ahfsclss)
  }

  if (missing(specclss)) {
    specclss <- defaults$specclss
  }
  if (!is.null(specclss)) {
    insertFields <- c(insertFields, "specclss")
    insertValues <- c(insertValues, specclss)
  }

  if (missing(brnd_nm)) {
    brnd_nm <- defaults$brnd_nm
  }
  if (!is.null(brnd_nm)) {
    insertFields <- c(insertFields, "brnd_nm")
    insertValues <- c(insertValues, brnd_nm)
  }

  if (missing(ndc)) {
    ndc <- defaults$ndc
  }
  if (!is.null(ndc)) {
    insertFields <- c(insertFields, "ndc")
    insertValues <- c(insertValues, ndc)
  }

  if (missing(gnrc_ind)) {
    gnrc_ind <- defaults$gnrc_ind
  }
  if (!is.null(gnrc_ind)) {
    insertFields <- c(insertFields, "gnrc_ind")
    insertValues <- c(insertValues, gnrc_ind)
  }

  if (missing(avgwhlsl)) {
    avgwhlsl <- defaults$avgwhlsl
  }
  if (!is.null(avgwhlsl)) {
    insertFields <- c(insertFields, "avgwhlsl")
    insertValues <- c(insertValues, avgwhlsl)
  }

  if (missing(copay)) {
    copay <- defaults$copay
  }
  if (!is.null(copay)) {
    insertFields <- c(insertFields, "copay")
    insertValues <- c(insertValues, copay)
  }

  if (missing(deduct)) {
    deduct <- defaults$deduct
  }
  if (!is.null(deduct)) {
    insertFields <- c(insertFields, "deduct")
    insertValues <- c(insertValues, deduct)
  }

  if (missing(daw)) {
    daw <- defaults$daw
  }
  if (!is.null(daw)) {
    insertFields <- c(insertFields, "daw")
    insertValues <- c(insertValues, daw)
  }

  if (missing(form_ind)) {
    form_ind <- defaults$form_ind
  }
  if (!is.null(form_ind)) {
    insertFields <- c(insertFields, "form_ind")
    insertValues <- c(insertValues, form_ind)
  }

  if (missing(form_typ)) {
    form_typ <- defaults$form_typ
  }
  if (!is.null(form_typ)) {
    insertFields <- c(insertFields, "form_typ")
    insertValues <- c(insertValues, form_typ)
  }

  if (missing(strength)) {
    strength <- defaults$strength
  }
  if (!is.null(strength)) {
    insertFields <- c(insertFields, "strength")
    insertValues <- c(insertValues, strength)
  }

  if (missing(days_sup)) {
    days_sup <- defaults$days_sup
  }
  if (!is.null(days_sup)) {
    insertFields <- c(insertFields, "days_sup")
    insertValues <- c(insertValues, days_sup)
  }

  if (missing(quantity)) {
    quantity <- defaults$quantity
  }
  if (!is.null(quantity)) {
    insertFields <- c(insertFields, "quantity")
    insertValues <- c(insertValues, quantity)
  }

  if (missing(fst_fill)) {
    fst_fill <- defaults$fst_fill
  }
  if (!is.null(fst_fill)) {
    insertFields <- c(insertFields, "fst_fill")
    insertValues <- c(insertValues, fst_fill)
  }

  if (missing(rfl_nbr)) {
    rfl_nbr <- defaults$rfl_nbr
  }
  if (!is.null(rfl_nbr)) {
    insertFields <- c(insertFields, "rfl_nbr")
    insertValues <- c(insertValues, rfl_nbr)
  }

  if (missing(prc_typ)) {
    prc_typ <- defaults$prc_typ
  }
  if (!is.null(prc_typ)) {
    insertFields <- c(insertFields, "prc_typ")
    insertValues <- c(insertValues, prc_typ)
  }

  if (missing(std_cost)) {
    std_cost <- defaults$std_cost
  }
  if (!is.null(std_cost)) {
    insertFields <- c(insertFields, "std_cost")
    insertValues <- c(insertValues, std_cost)
  }

  if (missing(std_cost_yr)) {
    std_cost_yr <- defaults$std_cost_yr
  }
  if (!is.null(std_cost_yr)) {
    insertFields <- c(insertFields, "std_cost_yr")
    insertValues <- c(insertValues, std_cost_yr)
  }

  if (missing(version)) {
    version <- defaults$version
  }
  if (!is.null(version)) {
    insertFields <- c(insertFields, "version")
    insertValues <- c(insertValues, version)
  }

  if (missing(extract_ym)) {
    extract_ym <- defaults$extract_ym
  }
  if (!is.null(extract_ym)) {
    insertFields <- c(insertFields, "extract_ym")
    insertValues <- c(insertValues, extract_ym)
  }

  statement <- paste0("INSERT INTO @source_schema.rx_claims (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
  invisible(statement);
}

add_visit <- function(ptid, visitid, visit_type, visit_start_date, visit_start_time, visit_end_date, visit_end_time, discharge_disposition, admission_source, drg) {
  defaults <- frameworkContext$defaultValues$visit;
  insertFields <- c()
  insertValues <- c()
  if (missing(ptid)) {
    ptid <- defaults$ptid
  }
  if (!is.null(ptid)) {
    insertFields <- c(insertFields, "ptid")
    insertValues <- c(insertValues, ptid)
  }

  if (missing(visitid)) {
    visitid <- defaults$visitid
  }
  if (!is.null(visitid)) {
    insertFields <- c(insertFields, "visitid")
    insertValues <- c(insertValues, visitid)
  }

  if (missing(visit_type)) {
    visit_type <- defaults$visit_type
  }
  if (!is.null(visit_type)) {
    insertFields <- c(insertFields, "visit_type")
    insertValues <- c(insertValues, visit_type)
  }

  if (missing(visit_start_date)) {
    visit_start_date <- defaults$visit_start_date
  }
  if (!is.null(visit_start_date)) {
    insertFields <- c(insertFields, "visit_start_date")
    insertValues <- c(insertValues, visit_start_date)
  }

  if (missing(visit_start_time)) {
    visit_start_time <- defaults$visit_start_time
  }
  if (!is.null(visit_start_time)) {
    insertFields <- c(insertFields, "visit_start_time")
    insertValues <- c(insertValues, visit_start_time)
  }

  if (missing(visit_end_date)) {
    visit_end_date <- defaults$visit_end_date
  }
  if (!is.null(visit_end_date)) {
    insertFields <- c(insertFields, "visit_end_date")
    insertValues <- c(insertValues, visit_end_date)
  }

  if (missing(visit_end_time)) {
    visit_end_time <- defaults$visit_end_time
  }
  if (!is.null(visit_end_time)) {
    insertFields <- c(insertFields, "visit_end_time")
    insertValues <- c(insertValues, visit_end_time)
  }

  if (missing(discharge_disposition)) {
    discharge_disposition <- defaults$discharge_disposition
  }
  if (!is.null(discharge_disposition)) {
    insertFields <- c(insertFields, "discharge_disposition")
    insertValues <- c(insertValues, discharge_disposition)
  }

  if (missing(admission_source)) {
    admission_source <- defaults$admission_source
  }
  if (!is.null(admission_source)) {
    insertFields <- c(insertFields, "admission_source")
    insertValues <- c(insertValues, admission_source)
  }

  if (missing(drg)) {
    drg <- defaults$drg
  }
  if (!is.null(drg)) {
    insertFields <- c(insertFields, "drg")
    insertValues <- c(insertValues, drg)
  }

  statement <- paste0("INSERT INTO @source_schema.visit (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
  invisible(statement);
}

expect_location <- function(location_id, address_1, address_2, city, state, zip, county, location_source_value) {

  if (is.null(frameworkContext$currentGroup)) {
    testName <- frameworkContext$testDescription;
  } else {
    testName <- paste0(frameworkContext$groupIndex, ".", frameworkContext$currentGroup$groupItemIndex, " ", frameworkContext$testDescription);
  }

  source_pid <- frameworkContext$patient$source_pid;
  if (is.null(source_pid)) {
    source_pid <- "NULL";
  } else {
    source_pid <- paste0("'", as.character(source_pid), "'");
  }

  cdm_pid <- frameworkContext$patient$cdm_pid;
  if (is.null(cdm_pid)) {
    cdm_pid <- "NULL"
  }

  statement <- paste0("INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT ", frameworkContext$testId, " AS id, '", testName, "' AS description, 'Expect location' AS test, ", source_pid, " as source_pid, ", cdm_pid, " as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.location WHERE ")
  whereClauses = NULL;
  if (!missing(location_id)) {
    if (is.null(location_id)) {
      whereClauses <- c(whereClauses, "location_id IS NULL")
    } else if (is(location_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("location_id = (", as.character(location_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("location_id = '", location_id,"'"))
    }
  }

  if (!missing(address_1)) {
    if (is.null(address_1)) {
      whereClauses <- c(whereClauses, "address_1 IS NULL")
    } else if (is(address_1, "subQuery")){
      whereClauses <- c(whereClauses, paste0("address_1 = (", as.character(address_1), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("address_1 = '", address_1,"'"))
    }
  }

  if (!missing(address_2)) {
    if (is.null(address_2)) {
      whereClauses <- c(whereClauses, "address_2 IS NULL")
    } else if (is(address_2, "subQuery")){
      whereClauses <- c(whereClauses, paste0("address_2 = (", as.character(address_2), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("address_2 = '", address_2,"'"))
    }
  }

  if (!missing(city)) {
    if (is.null(city)) {
      whereClauses <- c(whereClauses, "city IS NULL")
    } else if (is(city, "subQuery")){
      whereClauses <- c(whereClauses, paste0("city = (", as.character(city), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("city = '", city,"'"))
    }
  }

  if (!missing(state)) {
    if (is.null(state)) {
      whereClauses <- c(whereClauses, "state IS NULL")
    } else if (is(state, "subQuery")){
      whereClauses <- c(whereClauses, paste0("state = (", as.character(state), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("state = '", state,"'"))
    }
  }

  if (!missing(zip)) {
    if (is.null(zip)) {
      whereClauses <- c(whereClauses, "zip IS NULL")
    } else if (is(zip, "subQuery")){
      whereClauses <- c(whereClauses, paste0("zip = (", as.character(zip), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("zip = '", zip,"'"))
    }
  }

  if (!missing(county)) {
    if (is.null(county)) {
      whereClauses <- c(whereClauses, "county IS NULL")
    } else if (is(county, "subQuery")){
      whereClauses <- c(whereClauses, paste0("county = (", as.character(county), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("county = '", county,"'"))
    }
  }

  if (!missing(location_source_value)) {
    if (is.null(location_source_value)) {
      whereClauses <- c(whereClauses, "location_source_value IS NULL")
    } else if (is(location_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("location_source_value = (", as.character(location_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("location_source_value = '", location_source_value,"'"))
    }
  }

 statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

expect_person <- function(person_id, gender_concept_id, year_of_birth, month_of_birth, day_of_birth, time_of_birth, race_concept_id, ethnicity_concept_id, location_id, provider_id, care_site_id, person_source_value, gender_source_value, gender_source_concept_id, race_source_value, race_source_concept_id, ethnicity_source_value, ethnicity_source_concept_id) {

  if (is.null(frameworkContext$currentGroup)) {
    testName <- frameworkContext$testDescription;
  } else {
    testName <- paste0(frameworkContext$groupIndex, ".", frameworkContext$currentGroup$groupItemIndex, " ", frameworkContext$testDescription);
  }

  source_pid <- frameworkContext$patient$source_pid;
  if (is.null(source_pid)) {
    source_pid <- "NULL";
  } else {
    source_pid <- paste0("'", as.character(source_pid), "'");
  }

  cdm_pid <- frameworkContext$patient$cdm_pid;
  if (is.null(cdm_pid)) {
    cdm_pid <- "NULL"
  }

  statement <- paste0("INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT ", frameworkContext$testId, " AS id, '", testName, "' AS description, 'Expect person' AS test, ", source_pid, " as source_pid, ", cdm_pid, " as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.person WHERE ")
  whereClauses = NULL;
  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(gender_concept_id)) {
    if (is.null(gender_concept_id)) {
      whereClauses <- c(whereClauses, "gender_concept_id IS NULL")
    } else if (is(gender_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("gender_concept_id = (", as.character(gender_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("gender_concept_id = '", gender_concept_id,"'"))
    }
  }

  if (!missing(year_of_birth)) {
    if (is.null(year_of_birth)) {
      whereClauses <- c(whereClauses, "year_of_birth IS NULL")
    } else if (is(year_of_birth, "subQuery")){
      whereClauses <- c(whereClauses, paste0("year_of_birth = (", as.character(year_of_birth), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("year_of_birth = '", year_of_birth,"'"))
    }
  }

  if (!missing(month_of_birth)) {
    if (is.null(month_of_birth)) {
      whereClauses <- c(whereClauses, "month_of_birth IS NULL")
    } else if (is(month_of_birth, "subQuery")){
      whereClauses <- c(whereClauses, paste0("month_of_birth = (", as.character(month_of_birth), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("month_of_birth = '", month_of_birth,"'"))
    }
  }

  if (!missing(day_of_birth)) {
    if (is.null(day_of_birth)) {
      whereClauses <- c(whereClauses, "day_of_birth IS NULL")
    } else if (is(day_of_birth, "subQuery")){
      whereClauses <- c(whereClauses, paste0("day_of_birth = (", as.character(day_of_birth), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("day_of_birth = '", day_of_birth,"'"))
    }
  }

  if (!missing(time_of_birth)) {
    if (is.null(time_of_birth)) {
      whereClauses <- c(whereClauses, "time_of_birth IS NULL")
    } else if (is(time_of_birth, "subQuery")){
      whereClauses <- c(whereClauses, paste0("time_of_birth = (", as.character(time_of_birth), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("time_of_birth = '", time_of_birth,"'"))
    }
  }

  if (!missing(race_concept_id)) {
    if (is.null(race_concept_id)) {
      whereClauses <- c(whereClauses, "race_concept_id IS NULL")
    } else if (is(race_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("race_concept_id = (", as.character(race_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("race_concept_id = '", race_concept_id,"'"))
    }
  }

  if (!missing(ethnicity_concept_id)) {
    if (is.null(ethnicity_concept_id)) {
      whereClauses <- c(whereClauses, "ethnicity_concept_id IS NULL")
    } else if (is(ethnicity_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("ethnicity_concept_id = (", as.character(ethnicity_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("ethnicity_concept_id = '", ethnicity_concept_id,"'"))
    }
  }

  if (!missing(location_id)) {
    if (is.null(location_id)) {
      whereClauses <- c(whereClauses, "location_id IS NULL")
    } else if (is(location_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("location_id = (", as.character(location_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("location_id = '", location_id,"'"))
    }
  }

  if (!missing(provider_id)) {
    if (is.null(provider_id)) {
      whereClauses <- c(whereClauses, "provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("provider_id = (", as.character(provider_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("provider_id = '", provider_id,"'"))
    }
  }

  if (!missing(care_site_id)) {
    if (is.null(care_site_id)) {
      whereClauses <- c(whereClauses, "care_site_id IS NULL")
    } else if (is(care_site_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("care_site_id = (", as.character(care_site_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("care_site_id = '", care_site_id,"'"))
    }
  }

  if (!missing(person_source_value)) {
    if (is.null(person_source_value)) {
      whereClauses <- c(whereClauses, "person_source_value IS NULL")
    } else if (is(person_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("person_source_value = (", as.character(person_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_source_value = '", person_source_value,"'"))
    }
  }

  if (!missing(gender_source_value)) {
    if (is.null(gender_source_value)) {
      whereClauses <- c(whereClauses, "gender_source_value IS NULL")
    } else if (is(gender_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("gender_source_value = (", as.character(gender_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("gender_source_value = '", gender_source_value,"'"))
    }
  }

  if (!missing(gender_source_concept_id)) {
    if (is.null(gender_source_concept_id)) {
      whereClauses <- c(whereClauses, "gender_source_concept_id IS NULL")
    } else if (is(gender_source_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("gender_source_concept_id = (", as.character(gender_source_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("gender_source_concept_id = '", gender_source_concept_id,"'"))
    }
  }

  if (!missing(race_source_value)) {
    if (is.null(race_source_value)) {
      whereClauses <- c(whereClauses, "race_source_value IS NULL")
    } else if (is(race_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("race_source_value = (", as.character(race_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("race_source_value = '", race_source_value,"'"))
    }
  }

  if (!missing(race_source_concept_id)) {
    if (is.null(race_source_concept_id)) {
      whereClauses <- c(whereClauses, "race_source_concept_id IS NULL")
    } else if (is(race_source_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("race_source_concept_id = (", as.character(race_source_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("race_source_concept_id = '", race_source_concept_id,"'"))
    }
  }

  if (!missing(ethnicity_source_value)) {
    if (is.null(ethnicity_source_value)) {
      whereClauses <- c(whereClauses, "ethnicity_source_value IS NULL")
    } else if (is(ethnicity_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("ethnicity_source_value = (", as.character(ethnicity_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("ethnicity_source_value = '", ethnicity_source_value,"'"))
    }
  }

  if (!missing(ethnicity_source_concept_id)) {
    if (is.null(ethnicity_source_concept_id)) {
      whereClauses <- c(whereClauses, "ethnicity_source_concept_id IS NULL")
    } else if (is(ethnicity_source_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("ethnicity_source_concept_id = (", as.character(ethnicity_source_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("ethnicity_source_concept_id = '", ethnicity_source_concept_id,"'"))
    }
  }

 statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

expect_observation_period <- function(observation_period_id, person_id, observation_period_start_date, observation_period_end_date, period_type_concept_id) {

  if (is.null(frameworkContext$currentGroup)) {
    testName <- frameworkContext$testDescription;
  } else {
    testName <- paste0(frameworkContext$groupIndex, ".", frameworkContext$currentGroup$groupItemIndex, " ", frameworkContext$testDescription);
  }

  source_pid <- frameworkContext$patient$source_pid;
  if (is.null(source_pid)) {
    source_pid <- "NULL";
  } else {
    source_pid <- paste0("'", as.character(source_pid), "'");
  }

  cdm_pid <- frameworkContext$patient$cdm_pid;
  if (is.null(cdm_pid)) {
    cdm_pid <- "NULL"
  }

  statement <- paste0("INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT ", frameworkContext$testId, " AS id, '", testName, "' AS description, 'Expect observation_period' AS test, ", source_pid, " as source_pid, ", cdm_pid, " as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.observation_period WHERE ")
  whereClauses = NULL;
  if (!missing(observation_period_id)) {
    if (is.null(observation_period_id)) {
      whereClauses <- c(whereClauses, "observation_period_id IS NULL")
    } else if (is(observation_period_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("observation_period_id = (", as.character(observation_period_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("observation_period_id = '", observation_period_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(observation_period_start_date)) {
    if (is.null(observation_period_start_date)) {
      whereClauses <- c(whereClauses, "observation_period_start_date IS NULL")
    } else if (is(observation_period_start_date, "subQuery")){
      whereClauses <- c(whereClauses, paste0("observation_period_start_date = (", as.character(observation_period_start_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("observation_period_start_date = '", observation_period_start_date,"'"))
    }
  }

  if (!missing(observation_period_end_date)) {
    if (is.null(observation_period_end_date)) {
      whereClauses <- c(whereClauses, "observation_period_end_date IS NULL")
    } else if (is(observation_period_end_date, "subQuery")){
      whereClauses <- c(whereClauses, paste0("observation_period_end_date = (", as.character(observation_period_end_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("observation_period_end_date = '", observation_period_end_date,"'"))
    }
  }

  if (!missing(period_type_concept_id)) {
    if (is.null(period_type_concept_id)) {
      whereClauses <- c(whereClauses, "period_type_concept_id IS NULL")
    } else if (is(period_type_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("period_type_concept_id = (", as.character(period_type_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("period_type_concept_id = '", period_type_concept_id,"'"))
    }
  }

 statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

expect_care_site <- function(care_site_id, care_site_name, place_of_service_concept_id, location_id, care_site_source_value, place_of_service_source_value) {

  if (is.null(frameworkContext$currentGroup)) {
    testName <- frameworkContext$testDescription;
  } else {
    testName <- paste0(frameworkContext$groupIndex, ".", frameworkContext$currentGroup$groupItemIndex, " ", frameworkContext$testDescription);
  }

  source_pid <- frameworkContext$patient$source_pid;
  if (is.null(source_pid)) {
    source_pid <- "NULL";
  } else {
    source_pid <- paste0("'", as.character(source_pid), "'");
  }

  cdm_pid <- frameworkContext$patient$cdm_pid;
  if (is.null(cdm_pid)) {
    cdm_pid <- "NULL"
  }

  statement <- paste0("INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT ", frameworkContext$testId, " AS id, '", testName, "' AS description, 'Expect care_site' AS test, ", source_pid, " as source_pid, ", cdm_pid, " as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.care_site WHERE ")
  whereClauses = NULL;
  if (!missing(care_site_id)) {
    if (is.null(care_site_id)) {
      whereClauses <- c(whereClauses, "care_site_id IS NULL")
    } else if (is(care_site_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("care_site_id = (", as.character(care_site_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("care_site_id = '", care_site_id,"'"))
    }
  }

  if (!missing(care_site_name)) {
    if (is.null(care_site_name)) {
      whereClauses <- c(whereClauses, "care_site_name IS NULL")
    } else if (is(care_site_name, "subQuery")){
      whereClauses <- c(whereClauses, paste0("care_site_name = (", as.character(care_site_name), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("care_site_name = '", care_site_name,"'"))
    }
  }

  if (!missing(place_of_service_concept_id)) {
    if (is.null(place_of_service_concept_id)) {
      whereClauses <- c(whereClauses, "place_of_service_concept_id IS NULL")
    } else if (is(place_of_service_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("place_of_service_concept_id = (", as.character(place_of_service_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("place_of_service_concept_id = '", place_of_service_concept_id,"'"))
    }
  }

  if (!missing(location_id)) {
    if (is.null(location_id)) {
      whereClauses <- c(whereClauses, "location_id IS NULL")
    } else if (is(location_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("location_id = (", as.character(location_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("location_id = '", location_id,"'"))
    }
  }

  if (!missing(care_site_source_value)) {
    if (is.null(care_site_source_value)) {
      whereClauses <- c(whereClauses, "care_site_source_value IS NULL")
    } else if (is(care_site_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("care_site_source_value = (", as.character(care_site_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("care_site_source_value = '", care_site_source_value,"'"))
    }
  }

  if (!missing(place_of_service_source_value)) {
    if (is.null(place_of_service_source_value)) {
      whereClauses <- c(whereClauses, "place_of_service_source_value IS NULL")
    } else if (is(place_of_service_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("place_of_service_source_value = (", as.character(place_of_service_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("place_of_service_source_value = '", place_of_service_source_value,"'"))
    }
  }

 statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

expect_visit_occurrence <- function(visit_occurrence_id, person_id, visit_concept_id, visit_start_date, visit_start_time, visit_end_date, visit_end_time, visit_type_concept_id, provider_id, care_site_id, visit_source_value, visit_source_concept_id) {

  if (is.null(frameworkContext$currentGroup)) {
    testName <- frameworkContext$testDescription;
  } else {
    testName <- paste0(frameworkContext$groupIndex, ".", frameworkContext$currentGroup$groupItemIndex, " ", frameworkContext$testDescription);
  }

  source_pid <- frameworkContext$patient$source_pid;
  if (is.null(source_pid)) {
    source_pid <- "NULL";
  } else {
    source_pid <- paste0("'", as.character(source_pid), "'");
  }

  cdm_pid <- frameworkContext$patient$cdm_pid;
  if (is.null(cdm_pid)) {
    cdm_pid <- "NULL"
  }

  statement <- paste0("INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT ", frameworkContext$testId, " AS id, '", testName, "' AS description, 'Expect visit_occurrence' AS test, ", source_pid, " as source_pid, ", cdm_pid, " as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.visit_occurrence WHERE ")
  whereClauses = NULL;
  if (!missing(visit_occurrence_id)) {
    if (is.null(visit_occurrence_id)) {
      whereClauses <- c(whereClauses, "visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("visit_occurrence_id = (", as.character(visit_occurrence_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_occurrence_id = '", visit_occurrence_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(visit_concept_id)) {
    if (is.null(visit_concept_id)) {
      whereClauses <- c(whereClauses, "visit_concept_id IS NULL")
    } else if (is(visit_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("visit_concept_id = (", as.character(visit_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_concept_id = '", visit_concept_id,"'"))
    }
  }

  if (!missing(visit_start_date)) {
    if (is.null(visit_start_date)) {
      whereClauses <- c(whereClauses, "visit_start_date IS NULL")
    } else if (is(visit_start_date, "subQuery")){
      whereClauses <- c(whereClauses, paste0("visit_start_date = (", as.character(visit_start_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_start_date = '", visit_start_date,"'"))
    }
  }

  if (!missing(visit_start_time)) {
    if (is.null(visit_start_time)) {
      whereClauses <- c(whereClauses, "visit_start_time IS NULL")
    } else if (is(visit_start_time, "subQuery")){
      whereClauses <- c(whereClauses, paste0("visit_start_time = (", as.character(visit_start_time), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_start_time = '", visit_start_time,"'"))
    }
  }

  if (!missing(visit_end_date)) {
    if (is.null(visit_end_date)) {
      whereClauses <- c(whereClauses, "visit_end_date IS NULL")
    } else if (is(visit_end_date, "subQuery")){
      whereClauses <- c(whereClauses, paste0("visit_end_date = (", as.character(visit_end_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_end_date = '", visit_end_date,"'"))
    }
  }

  if (!missing(visit_end_time)) {
    if (is.null(visit_end_time)) {
      whereClauses <- c(whereClauses, "visit_end_time IS NULL")
    } else if (is(visit_end_time, "subQuery")){
      whereClauses <- c(whereClauses, paste0("visit_end_time = (", as.character(visit_end_time), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_end_time = '", visit_end_time,"'"))
    }
  }

  if (!missing(visit_type_concept_id)) {
    if (is.null(visit_type_concept_id)) {
      whereClauses <- c(whereClauses, "visit_type_concept_id IS NULL")
    } else if (is(visit_type_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("visit_type_concept_id = (", as.character(visit_type_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_type_concept_id = '", visit_type_concept_id,"'"))
    }
  }

  if (!missing(provider_id)) {
    if (is.null(provider_id)) {
      whereClauses <- c(whereClauses, "provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("provider_id = (", as.character(provider_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("provider_id = '", provider_id,"'"))
    }
  }

  if (!missing(care_site_id)) {
    if (is.null(care_site_id)) {
      whereClauses <- c(whereClauses, "care_site_id IS NULL")
    } else if (is(care_site_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("care_site_id = (", as.character(care_site_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("care_site_id = '", care_site_id,"'"))
    }
  }

  if (!missing(visit_source_value)) {
    if (is.null(visit_source_value)) {
      whereClauses <- c(whereClauses, "visit_source_value IS NULL")
    } else if (is(visit_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("visit_source_value = (", as.character(visit_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_source_value = '", visit_source_value,"'"))
    }
  }

  if (!missing(visit_source_concept_id)) {
    if (is.null(visit_source_concept_id)) {
      whereClauses <- c(whereClauses, "visit_source_concept_id IS NULL")
    } else if (is(visit_source_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("visit_source_concept_id = (", as.character(visit_source_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_source_concept_id = '", visit_source_concept_id,"'"))
    }
  }

 statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

expect_provider <- function(provider_id, provider_name, npi, dea, specialty_concept_id, care_site_id, year_of_birth, gender_concept_id, provider_source_value, specialty_source_value, specialty_source_concept_id, gender_source_value, gender_source_concept_id) {

  if (is.null(frameworkContext$currentGroup)) {
    testName <- frameworkContext$testDescription;
  } else {
    testName <- paste0(frameworkContext$groupIndex, ".", frameworkContext$currentGroup$groupItemIndex, " ", frameworkContext$testDescription);
  }

  source_pid <- frameworkContext$patient$source_pid;
  if (is.null(source_pid)) {
    source_pid <- "NULL";
  } else {
    source_pid <- paste0("'", as.character(source_pid), "'");
  }

  cdm_pid <- frameworkContext$patient$cdm_pid;
  if (is.null(cdm_pid)) {
    cdm_pid <- "NULL"
  }

  statement <- paste0("INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT ", frameworkContext$testId, " AS id, '", testName, "' AS description, 'Expect provider' AS test, ", source_pid, " as source_pid, ", cdm_pid, " as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.provider WHERE ")
  whereClauses = NULL;
  if (!missing(provider_id)) {
    if (is.null(provider_id)) {
      whereClauses <- c(whereClauses, "provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("provider_id = (", as.character(provider_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("provider_id = '", provider_id,"'"))
    }
  }

  if (!missing(provider_name)) {
    if (is.null(provider_name)) {
      whereClauses <- c(whereClauses, "provider_name IS NULL")
    } else if (is(provider_name, "subQuery")){
      whereClauses <- c(whereClauses, paste0("provider_name = (", as.character(provider_name), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("provider_name = '", provider_name,"'"))
    }
  }

  if (!missing(npi)) {
    if (is.null(npi)) {
      whereClauses <- c(whereClauses, "npi IS NULL")
    } else if (is(npi, "subQuery")){
      whereClauses <- c(whereClauses, paste0("npi = (", as.character(npi), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("npi = '", npi,"'"))
    }
  }

  if (!missing(dea)) {
    if (is.null(dea)) {
      whereClauses <- c(whereClauses, "dea IS NULL")
    } else if (is(dea, "subQuery")){
      whereClauses <- c(whereClauses, paste0("dea = (", as.character(dea), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("dea = '", dea,"'"))
    }
  }

  if (!missing(specialty_concept_id)) {
    if (is.null(specialty_concept_id)) {
      whereClauses <- c(whereClauses, "specialty_concept_id IS NULL")
    } else if (is(specialty_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("specialty_concept_id = (", as.character(specialty_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("specialty_concept_id = '", specialty_concept_id,"'"))
    }
  }

  if (!missing(care_site_id)) {
    if (is.null(care_site_id)) {
      whereClauses <- c(whereClauses, "care_site_id IS NULL")
    } else if (is(care_site_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("care_site_id = (", as.character(care_site_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("care_site_id = '", care_site_id,"'"))
    }
  }

  if (!missing(year_of_birth)) {
    if (is.null(year_of_birth)) {
      whereClauses <- c(whereClauses, "year_of_birth IS NULL")
    } else if (is(year_of_birth, "subQuery")){
      whereClauses <- c(whereClauses, paste0("year_of_birth = (", as.character(year_of_birth), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("year_of_birth = '", year_of_birth,"'"))
    }
  }

  if (!missing(gender_concept_id)) {
    if (is.null(gender_concept_id)) {
      whereClauses <- c(whereClauses, "gender_concept_id IS NULL")
    } else if (is(gender_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("gender_concept_id = (", as.character(gender_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("gender_concept_id = '", gender_concept_id,"'"))
    }
  }

  if (!missing(provider_source_value)) {
    if (is.null(provider_source_value)) {
      whereClauses <- c(whereClauses, "provider_source_value IS NULL")
    } else if (is(provider_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("provider_source_value = (", as.character(provider_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("provider_source_value = '", provider_source_value,"'"))
    }
  }

  if (!missing(specialty_source_value)) {
    if (is.null(specialty_source_value)) {
      whereClauses <- c(whereClauses, "specialty_source_value IS NULL")
    } else if (is(specialty_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("specialty_source_value = (", as.character(specialty_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("specialty_source_value = '", specialty_source_value,"'"))
    }
  }

  if (!missing(specialty_source_concept_id)) {
    if (is.null(specialty_source_concept_id)) {
      whereClauses <- c(whereClauses, "specialty_source_concept_id IS NULL")
    } else if (is(specialty_source_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("specialty_source_concept_id = (", as.character(specialty_source_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("specialty_source_concept_id = '", specialty_source_concept_id,"'"))
    }
  }

  if (!missing(gender_source_value)) {
    if (is.null(gender_source_value)) {
      whereClauses <- c(whereClauses, "gender_source_value IS NULL")
    } else if (is(gender_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("gender_source_value = (", as.character(gender_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("gender_source_value = '", gender_source_value,"'"))
    }
  }

  if (!missing(gender_source_concept_id)) {
    if (is.null(gender_source_concept_id)) {
      whereClauses <- c(whereClauses, "gender_source_concept_id IS NULL")
    } else if (is(gender_source_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("gender_source_concept_id = (", as.character(gender_source_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("gender_source_concept_id = '", gender_source_concept_id,"'"))
    }
  }

 statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

expect_condition_occurrence <- function(condition_occurrence_id, person_id, condition_concept_id, condition_start_date, condition_end_date, condition_type_concept_id, stop_reason, provider_id, visit_occurrence_id, condition_source_value, condition_source_concept_id) {

  if (is.null(frameworkContext$currentGroup)) {
    testName <- frameworkContext$testDescription;
  } else {
    testName <- paste0(frameworkContext$groupIndex, ".", frameworkContext$currentGroup$groupItemIndex, " ", frameworkContext$testDescription);
  }

  source_pid <- frameworkContext$patient$source_pid;
  if (is.null(source_pid)) {
    source_pid <- "NULL";
  } else {
    source_pid <- paste0("'", as.character(source_pid), "'");
  }

  cdm_pid <- frameworkContext$patient$cdm_pid;
  if (is.null(cdm_pid)) {
    cdm_pid <- "NULL"
  }

  statement <- paste0("INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT ", frameworkContext$testId, " AS id, '", testName, "' AS description, 'Expect condition_occurrence' AS test, ", source_pid, " as source_pid, ", cdm_pid, " as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.condition_occurrence WHERE ")
  whereClauses = NULL;
  if (!missing(condition_occurrence_id)) {
    if (is.null(condition_occurrence_id)) {
      whereClauses <- c(whereClauses, "condition_occurrence_id IS NULL")
    } else if (is(condition_occurrence_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("condition_occurrence_id = (", as.character(condition_occurrence_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("condition_occurrence_id = '", condition_occurrence_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(condition_concept_id)) {
    if (is.null(condition_concept_id)) {
      whereClauses <- c(whereClauses, "condition_concept_id IS NULL")
    } else if (is(condition_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("condition_concept_id = (", as.character(condition_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("condition_concept_id = '", condition_concept_id,"'"))
    }
  }

  if (!missing(condition_start_date)) {
    if (is.null(condition_start_date)) {
      whereClauses <- c(whereClauses, "condition_start_date IS NULL")
    } else if (is(condition_start_date, "subQuery")){
      whereClauses <- c(whereClauses, paste0("condition_start_date = (", as.character(condition_start_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("condition_start_date = '", condition_start_date,"'"))
    }
  }

  if (!missing(condition_end_date)) {
    if (is.null(condition_end_date)) {
      whereClauses <- c(whereClauses, "condition_end_date IS NULL")
    } else if (is(condition_end_date, "subQuery")){
      whereClauses <- c(whereClauses, paste0("condition_end_date = (", as.character(condition_end_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("condition_end_date = '", condition_end_date,"'"))
    }
  }

  if (!missing(condition_type_concept_id)) {
    if (is.null(condition_type_concept_id)) {
      whereClauses <- c(whereClauses, "condition_type_concept_id IS NULL")
    } else if (is(condition_type_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("condition_type_concept_id = (", as.character(condition_type_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("condition_type_concept_id = '", condition_type_concept_id,"'"))
    }
  }

  if (!missing(stop_reason)) {
    if (is.null(stop_reason)) {
      whereClauses <- c(whereClauses, "stop_reason IS NULL")
    } else if (is(stop_reason, "subQuery")){
      whereClauses <- c(whereClauses, paste0("stop_reason = (", as.character(stop_reason), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("stop_reason = '", stop_reason,"'"))
    }
  }

  if (!missing(provider_id)) {
    if (is.null(provider_id)) {
      whereClauses <- c(whereClauses, "provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("provider_id = (", as.character(provider_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("provider_id = '", provider_id,"'"))
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (is.null(visit_occurrence_id)) {
      whereClauses <- c(whereClauses, "visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("visit_occurrence_id = (", as.character(visit_occurrence_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_occurrence_id = '", visit_occurrence_id,"'"))
    }
  }

  if (!missing(condition_source_value)) {
    if (is.null(condition_source_value)) {
      whereClauses <- c(whereClauses, "condition_source_value IS NULL")
    } else if (is(condition_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("condition_source_value = (", as.character(condition_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("condition_source_value = '", condition_source_value,"'"))
    }
  }

  if (!missing(condition_source_concept_id)) {
    if (is.null(condition_source_concept_id)) {
      whereClauses <- c(whereClauses, "condition_source_concept_id IS NULL")
    } else if (is(condition_source_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("condition_source_concept_id = (", as.character(condition_source_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("condition_source_concept_id = '", condition_source_concept_id,"'"))
    }
  }

 statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

expect_death <- function(person_id, death_date, death_type_concept_id, cause_concept_id, cause_source_value, cause_source_concept_id) {

  if (is.null(frameworkContext$currentGroup)) {
    testName <- frameworkContext$testDescription;
  } else {
    testName <- paste0(frameworkContext$groupIndex, ".", frameworkContext$currentGroup$groupItemIndex, " ", frameworkContext$testDescription);
  }

  source_pid <- frameworkContext$patient$source_pid;
  if (is.null(source_pid)) {
    source_pid <- "NULL";
  } else {
    source_pid <- paste0("'", as.character(source_pid), "'");
  }

  cdm_pid <- frameworkContext$patient$cdm_pid;
  if (is.null(cdm_pid)) {
    cdm_pid <- "NULL"
  }

  statement <- paste0("INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT ", frameworkContext$testId, " AS id, '", testName, "' AS description, 'Expect death' AS test, ", source_pid, " as source_pid, ", cdm_pid, " as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.death WHERE ")
  whereClauses = NULL;
  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(death_date)) {
    if (is.null(death_date)) {
      whereClauses <- c(whereClauses, "death_date IS NULL")
    } else if (is(death_date, "subQuery")){
      whereClauses <- c(whereClauses, paste0("death_date = (", as.character(death_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("death_date = '", death_date,"'"))
    }
  }

  if (!missing(death_type_concept_id)) {
    if (is.null(death_type_concept_id)) {
      whereClauses <- c(whereClauses, "death_type_concept_id IS NULL")
    } else if (is(death_type_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("death_type_concept_id = (", as.character(death_type_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("death_type_concept_id = '", death_type_concept_id,"'"))
    }
  }

  if (!missing(cause_concept_id)) {
    if (is.null(cause_concept_id)) {
      whereClauses <- c(whereClauses, "cause_concept_id IS NULL")
    } else if (is(cause_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("cause_concept_id = (", as.character(cause_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cause_concept_id = '", cause_concept_id,"'"))
    }
  }

  if (!missing(cause_source_value)) {
    if (is.null(cause_source_value)) {
      whereClauses <- c(whereClauses, "cause_source_value IS NULL")
    } else if (is(cause_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("cause_source_value = (", as.character(cause_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cause_source_value = '", cause_source_value,"'"))
    }
  }

  if (!missing(cause_source_concept_id)) {
    if (is.null(cause_source_concept_id)) {
      whereClauses <- c(whereClauses, "cause_source_concept_id IS NULL")
    } else if (is(cause_source_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("cause_source_concept_id = (", as.character(cause_source_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cause_source_concept_id = '", cause_source_concept_id,"'"))
    }
  }

 statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

expect_drug_exposure <- function(drug_exposure_id, person_id, drug_concept_id, drug_exposure_start_date, drug_exposure_end_date, drug_type_concept_id, stop_reason, refills, quantity, days_supply, sig, route_concept_id, effective_drug_dose, dose_unit_concept_id, lot_number, provider_id, visit_occurrence_id, drug_source_value, drug_source_concept_id, route_source_value, dose_unit_source_value) {

  if (is.null(frameworkContext$currentGroup)) {
    testName <- frameworkContext$testDescription;
  } else {
    testName <- paste0(frameworkContext$groupIndex, ".", frameworkContext$currentGroup$groupItemIndex, " ", frameworkContext$testDescription);
  }

  source_pid <- frameworkContext$patient$source_pid;
  if (is.null(source_pid)) {
    source_pid <- "NULL";
  } else {
    source_pid <- paste0("'", as.character(source_pid), "'");
  }

  cdm_pid <- frameworkContext$patient$cdm_pid;
  if (is.null(cdm_pid)) {
    cdm_pid <- "NULL"
  }

  statement <- paste0("INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT ", frameworkContext$testId, " AS id, '", testName, "' AS description, 'Expect drug_exposure' AS test, ", source_pid, " as source_pid, ", cdm_pid, " as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.drug_exposure WHERE ")
  whereClauses = NULL;
  if (!missing(drug_exposure_id)) {
    if (is.null(drug_exposure_id)) {
      whereClauses <- c(whereClauses, "drug_exposure_id IS NULL")
    } else if (is(drug_exposure_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("drug_exposure_id = (", as.character(drug_exposure_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("drug_exposure_id = '", drug_exposure_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(drug_concept_id)) {
    if (is.null(drug_concept_id)) {
      whereClauses <- c(whereClauses, "drug_concept_id IS NULL")
    } else if (is(drug_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("drug_concept_id = (", as.character(drug_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("drug_concept_id = '", drug_concept_id,"'"))
    }
  }

  if (!missing(drug_exposure_start_date)) {
    if (is.null(drug_exposure_start_date)) {
      whereClauses <- c(whereClauses, "drug_exposure_start_date IS NULL")
    } else if (is(drug_exposure_start_date, "subQuery")){
      whereClauses <- c(whereClauses, paste0("drug_exposure_start_date = (", as.character(drug_exposure_start_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("drug_exposure_start_date = '", drug_exposure_start_date,"'"))
    }
  }

  if (!missing(drug_exposure_end_date)) {
    if (is.null(drug_exposure_end_date)) {
      whereClauses <- c(whereClauses, "drug_exposure_end_date IS NULL")
    } else if (is(drug_exposure_end_date, "subQuery")){
      whereClauses <- c(whereClauses, paste0("drug_exposure_end_date = (", as.character(drug_exposure_end_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("drug_exposure_end_date = '", drug_exposure_end_date,"'"))
    }
  }

  if (!missing(drug_type_concept_id)) {
    if (is.null(drug_type_concept_id)) {
      whereClauses <- c(whereClauses, "drug_type_concept_id IS NULL")
    } else if (is(drug_type_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("drug_type_concept_id = (", as.character(drug_type_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("drug_type_concept_id = '", drug_type_concept_id,"'"))
    }
  }

  if (!missing(stop_reason)) {
    if (is.null(stop_reason)) {
      whereClauses <- c(whereClauses, "stop_reason IS NULL")
    } else if (is(stop_reason, "subQuery")){
      whereClauses <- c(whereClauses, paste0("stop_reason = (", as.character(stop_reason), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("stop_reason = '", stop_reason,"'"))
    }
  }

  if (!missing(refills)) {
    if (is.null(refills)) {
      whereClauses <- c(whereClauses, "refills IS NULL")
    } else if (is(refills, "subQuery")){
      whereClauses <- c(whereClauses, paste0("refills = (", as.character(refills), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("refills = '", refills,"'"))
    }
  }

  if (!missing(quantity)) {
    if (is.null(quantity)) {
      whereClauses <- c(whereClauses, "quantity IS NULL")
    } else if (is(quantity, "subQuery")){
      whereClauses <- c(whereClauses, paste0("quantity = (", as.character(quantity), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("quantity = '", quantity,"'"))
    }
  }

  if (!missing(days_supply)) {
    if (is.null(days_supply)) {
      whereClauses <- c(whereClauses, "days_supply IS NULL")
    } else if (is(days_supply, "subQuery")){
      whereClauses <- c(whereClauses, paste0("days_supply = (", as.character(days_supply), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("days_supply = '", days_supply,"'"))
    }
  }

  if (!missing(sig)) {
    if (is.null(sig)) {
      whereClauses <- c(whereClauses, "sig IS NULL")
    } else if (is(sig, "subQuery")){
      whereClauses <- c(whereClauses, paste0("sig = (", as.character(sig), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("sig = '", sig,"'"))
    }
  }

  if (!missing(route_concept_id)) {
    if (is.null(route_concept_id)) {
      whereClauses <- c(whereClauses, "route_concept_id IS NULL")
    } else if (is(route_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("route_concept_id = (", as.character(route_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("route_concept_id = '", route_concept_id,"'"))
    }
  }

  if (!missing(effective_drug_dose)) {
    if (is.null(effective_drug_dose)) {
      whereClauses <- c(whereClauses, "effective_drug_dose IS NULL")
    } else if (is(effective_drug_dose, "subQuery")){
      whereClauses <- c(whereClauses, paste0("effective_drug_dose = (", as.character(effective_drug_dose), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("effective_drug_dose = '", effective_drug_dose,"'"))
    }
  }

  if (!missing(dose_unit_concept_id)) {
    if (is.null(dose_unit_concept_id)) {
      whereClauses <- c(whereClauses, "dose_unit_concept_id IS NULL")
    } else if (is(dose_unit_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("dose_unit_concept_id = (", as.character(dose_unit_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("dose_unit_concept_id = '", dose_unit_concept_id,"'"))
    }
  }

  if (!missing(lot_number)) {
    if (is.null(lot_number)) {
      whereClauses <- c(whereClauses, "lot_number IS NULL")
    } else if (is(lot_number, "subQuery")){
      whereClauses <- c(whereClauses, paste0("lot_number = (", as.character(lot_number), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("lot_number = '", lot_number,"'"))
    }
  }

  if (!missing(provider_id)) {
    if (is.null(provider_id)) {
      whereClauses <- c(whereClauses, "provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("provider_id = (", as.character(provider_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("provider_id = '", provider_id,"'"))
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (is.null(visit_occurrence_id)) {
      whereClauses <- c(whereClauses, "visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("visit_occurrence_id = (", as.character(visit_occurrence_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_occurrence_id = '", visit_occurrence_id,"'"))
    }
  }

  if (!missing(drug_source_value)) {
    if (is.null(drug_source_value)) {
      whereClauses <- c(whereClauses, "drug_source_value IS NULL")
    } else if (is(drug_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("drug_source_value = (", as.character(drug_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("drug_source_value = '", drug_source_value,"'"))
    }
  }

  if (!missing(drug_source_concept_id)) {
    if (is.null(drug_source_concept_id)) {
      whereClauses <- c(whereClauses, "drug_source_concept_id IS NULL")
    } else if (is(drug_source_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("drug_source_concept_id = (", as.character(drug_source_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("drug_source_concept_id = '", drug_source_concept_id,"'"))
    }
  }

  if (!missing(route_source_value)) {
    if (is.null(route_source_value)) {
      whereClauses <- c(whereClauses, "route_source_value IS NULL")
    } else if (is(route_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("route_source_value = (", as.character(route_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("route_source_value = '", route_source_value,"'"))
    }
  }

  if (!missing(dose_unit_source_value)) {
    if (is.null(dose_unit_source_value)) {
      whereClauses <- c(whereClauses, "dose_unit_source_value IS NULL")
    } else if (is(dose_unit_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("dose_unit_source_value = (", as.character(dose_unit_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("dose_unit_source_value = '", dose_unit_source_value,"'"))
    }
  }

 statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

expect_device_exposure <- function(device_exposure_id, person_id, device_concept_id, device_exposure_start_date, device_exposure_end_date, device_type_concept_id, unique_device_id, quantity, provider_id, visit_occurrence_id, device_source_value, device_source_concept_id) {

  if (is.null(frameworkContext$currentGroup)) {
    testName <- frameworkContext$testDescription;
  } else {
    testName <- paste0(frameworkContext$groupIndex, ".", frameworkContext$currentGroup$groupItemIndex, " ", frameworkContext$testDescription);
  }

  source_pid <- frameworkContext$patient$source_pid;
  if (is.null(source_pid)) {
    source_pid <- "NULL";
  } else {
    source_pid <- paste0("'", as.character(source_pid), "'");
  }

  cdm_pid <- frameworkContext$patient$cdm_pid;
  if (is.null(cdm_pid)) {
    cdm_pid <- "NULL"
  }

  statement <- paste0("INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT ", frameworkContext$testId, " AS id, '", testName, "' AS description, 'Expect device_exposure' AS test, ", source_pid, " as source_pid, ", cdm_pid, " as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.device_exposure WHERE ")
  whereClauses = NULL;
  if (!missing(device_exposure_id)) {
    if (is.null(device_exposure_id)) {
      whereClauses <- c(whereClauses, "device_exposure_id IS NULL")
    } else if (is(device_exposure_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("device_exposure_id = (", as.character(device_exposure_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("device_exposure_id = '", device_exposure_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(device_concept_id)) {
    if (is.null(device_concept_id)) {
      whereClauses <- c(whereClauses, "device_concept_id IS NULL")
    } else if (is(device_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("device_concept_id = (", as.character(device_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("device_concept_id = '", device_concept_id,"'"))
    }
  }

  if (!missing(device_exposure_start_date)) {
    if (is.null(device_exposure_start_date)) {
      whereClauses <- c(whereClauses, "device_exposure_start_date IS NULL")
    } else if (is(device_exposure_start_date, "subQuery")){
      whereClauses <- c(whereClauses, paste0("device_exposure_start_date = (", as.character(device_exposure_start_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("device_exposure_start_date = '", device_exposure_start_date,"'"))
    }
  }

  if (!missing(device_exposure_end_date)) {
    if (is.null(device_exposure_end_date)) {
      whereClauses <- c(whereClauses, "device_exposure_end_date IS NULL")
    } else if (is(device_exposure_end_date, "subQuery")){
      whereClauses <- c(whereClauses, paste0("device_exposure_end_date = (", as.character(device_exposure_end_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("device_exposure_end_date = '", device_exposure_end_date,"'"))
    }
  }

  if (!missing(device_type_concept_id)) {
    if (is.null(device_type_concept_id)) {
      whereClauses <- c(whereClauses, "device_type_concept_id IS NULL")
    } else if (is(device_type_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("device_type_concept_id = (", as.character(device_type_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("device_type_concept_id = '", device_type_concept_id,"'"))
    }
  }

  if (!missing(unique_device_id)) {
    if (is.null(unique_device_id)) {
      whereClauses <- c(whereClauses, "unique_device_id IS NULL")
    } else if (is(unique_device_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("unique_device_id = (", as.character(unique_device_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("unique_device_id = '", unique_device_id,"'"))
    }
  }

  if (!missing(quantity)) {
    if (is.null(quantity)) {
      whereClauses <- c(whereClauses, "quantity IS NULL")
    } else if (is(quantity, "subQuery")){
      whereClauses <- c(whereClauses, paste0("quantity = (", as.character(quantity), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("quantity = '", quantity,"'"))
    }
  }

  if (!missing(provider_id)) {
    if (is.null(provider_id)) {
      whereClauses <- c(whereClauses, "provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("provider_id = (", as.character(provider_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("provider_id = '", provider_id,"'"))
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (is.null(visit_occurrence_id)) {
      whereClauses <- c(whereClauses, "visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("visit_occurrence_id = (", as.character(visit_occurrence_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_occurrence_id = '", visit_occurrence_id,"'"))
    }
  }

  if (!missing(device_source_value)) {
    if (is.null(device_source_value)) {
      whereClauses <- c(whereClauses, "device_source_value IS NULL")
    } else if (is(device_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("device_source_value = (", as.character(device_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("device_source_value = '", device_source_value,"'"))
    }
  }

  if (!missing(device_source_concept_id)) {
    if (is.null(device_source_concept_id)) {
      whereClauses <- c(whereClauses, "device_source_concept_id IS NULL")
    } else if (is(device_source_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("device_source_concept_id = (", as.character(device_source_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("device_source_concept_id = '", device_source_concept_id,"'"))
    }
  }

 statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

expect_procedure_occurrence <- function(procedure_occurrence_id, person_id, procedure_concept_id, procedure_date, procedure_type_concept_id, modifier_concept_id, quantity, provider_id, visit_occurrence_id, procedure_source_value, procedure_source_concept_id, qualifier_source_value) {

  if (is.null(frameworkContext$currentGroup)) {
    testName <- frameworkContext$testDescription;
  } else {
    testName <- paste0(frameworkContext$groupIndex, ".", frameworkContext$currentGroup$groupItemIndex, " ", frameworkContext$testDescription);
  }

  source_pid <- frameworkContext$patient$source_pid;
  if (is.null(source_pid)) {
    source_pid <- "NULL";
  } else {
    source_pid <- paste0("'", as.character(source_pid), "'");
  }

  cdm_pid <- frameworkContext$patient$cdm_pid;
  if (is.null(cdm_pid)) {
    cdm_pid <- "NULL"
  }

  statement <- paste0("INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT ", frameworkContext$testId, " AS id, '", testName, "' AS description, 'Expect procedure_occurrence' AS test, ", source_pid, " as source_pid, ", cdm_pid, " as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.procedure_occurrence WHERE ")
  whereClauses = NULL;
  if (!missing(procedure_occurrence_id)) {
    if (is.null(procedure_occurrence_id)) {
      whereClauses <- c(whereClauses, "procedure_occurrence_id IS NULL")
    } else if (is(procedure_occurrence_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("procedure_occurrence_id = (", as.character(procedure_occurrence_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("procedure_occurrence_id = '", procedure_occurrence_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(procedure_concept_id)) {
    if (is.null(procedure_concept_id)) {
      whereClauses <- c(whereClauses, "procedure_concept_id IS NULL")
    } else if (is(procedure_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("procedure_concept_id = (", as.character(procedure_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("procedure_concept_id = '", procedure_concept_id,"'"))
    }
  }

  if (!missing(procedure_date)) {
    if (is.null(procedure_date)) {
      whereClauses <- c(whereClauses, "procedure_date IS NULL")
    } else if (is(procedure_date, "subQuery")){
      whereClauses <- c(whereClauses, paste0("procedure_date = (", as.character(procedure_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("procedure_date = '", procedure_date,"'"))
    }
  }

  if (!missing(procedure_type_concept_id)) {
    if (is.null(procedure_type_concept_id)) {
      whereClauses <- c(whereClauses, "procedure_type_concept_id IS NULL")
    } else if (is(procedure_type_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("procedure_type_concept_id = (", as.character(procedure_type_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("procedure_type_concept_id = '", procedure_type_concept_id,"'"))
    }
  }

  if (!missing(modifier_concept_id)) {
    if (is.null(modifier_concept_id)) {
      whereClauses <- c(whereClauses, "modifier_concept_id IS NULL")
    } else if (is(modifier_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("modifier_concept_id = (", as.character(modifier_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("modifier_concept_id = '", modifier_concept_id,"'"))
    }
  }

  if (!missing(quantity)) {
    if (is.null(quantity)) {
      whereClauses <- c(whereClauses, "quantity IS NULL")
    } else if (is(quantity, "subQuery")){
      whereClauses <- c(whereClauses, paste0("quantity = (", as.character(quantity), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("quantity = '", quantity,"'"))
    }
  }

  if (!missing(provider_id)) {
    if (is.null(provider_id)) {
      whereClauses <- c(whereClauses, "provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("provider_id = (", as.character(provider_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("provider_id = '", provider_id,"'"))
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (is.null(visit_occurrence_id)) {
      whereClauses <- c(whereClauses, "visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("visit_occurrence_id = (", as.character(visit_occurrence_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_occurrence_id = '", visit_occurrence_id,"'"))
    }
  }

  if (!missing(procedure_source_value)) {
    if (is.null(procedure_source_value)) {
      whereClauses <- c(whereClauses, "procedure_source_value IS NULL")
    } else if (is(procedure_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("procedure_source_value = (", as.character(procedure_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("procedure_source_value = '", procedure_source_value,"'"))
    }
  }

  if (!missing(procedure_source_concept_id)) {
    if (is.null(procedure_source_concept_id)) {
      whereClauses <- c(whereClauses, "procedure_source_concept_id IS NULL")
    } else if (is(procedure_source_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("procedure_source_concept_id = (", as.character(procedure_source_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("procedure_source_concept_id = '", procedure_source_concept_id,"'"))
    }
  }

  if (!missing(qualifier_source_value)) {
    if (is.null(qualifier_source_value)) {
      whereClauses <- c(whereClauses, "qualifier_source_value IS NULL")
    } else if (is(qualifier_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("qualifier_source_value = (", as.character(qualifier_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("qualifier_source_value = '", qualifier_source_value,"'"))
    }
  }

 statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

expect_measurement <- function(measurement_id, person_id, measurement_concept_id, measurement_date, measurement_time, measurement_type_concept_id, operator_concept_id, value_as_number, value_as_concept_id, unit_concept_id, range_low, range_high, provider_id, visit_occurrence_id, measurement_source_value, measurement_source_concept_id, unit_source_value, value_source_value) {

  if (is.null(frameworkContext$currentGroup)) {
    testName <- frameworkContext$testDescription;
  } else {
    testName <- paste0(frameworkContext$groupIndex, ".", frameworkContext$currentGroup$groupItemIndex, " ", frameworkContext$testDescription);
  }

  source_pid <- frameworkContext$patient$source_pid;
  if (is.null(source_pid)) {
    source_pid <- "NULL";
  } else {
    source_pid <- paste0("'", as.character(source_pid), "'");
  }

  cdm_pid <- frameworkContext$patient$cdm_pid;
  if (is.null(cdm_pid)) {
    cdm_pid <- "NULL"
  }

  statement <- paste0("INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT ", frameworkContext$testId, " AS id, '", testName, "' AS description, 'Expect measurement' AS test, ", source_pid, " as source_pid, ", cdm_pid, " as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.measurement WHERE ")
  whereClauses = NULL;
  if (!missing(measurement_id)) {
    if (is.null(measurement_id)) {
      whereClauses <- c(whereClauses, "measurement_id IS NULL")
    } else if (is(measurement_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("measurement_id = (", as.character(measurement_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("measurement_id = '", measurement_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(measurement_concept_id)) {
    if (is.null(measurement_concept_id)) {
      whereClauses <- c(whereClauses, "measurement_concept_id IS NULL")
    } else if (is(measurement_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("measurement_concept_id = (", as.character(measurement_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("measurement_concept_id = '", measurement_concept_id,"'"))
    }
  }

  if (!missing(measurement_date)) {
    if (is.null(measurement_date)) {
      whereClauses <- c(whereClauses, "measurement_date IS NULL")
    } else if (is(measurement_date, "subQuery")){
      whereClauses <- c(whereClauses, paste0("measurement_date = (", as.character(measurement_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("measurement_date = '", measurement_date,"'"))
    }
  }

  if (!missing(measurement_time)) {
    if (is.null(measurement_time)) {
      whereClauses <- c(whereClauses, "measurement_time IS NULL")
    } else if (is(measurement_time, "subQuery")){
      whereClauses <- c(whereClauses, paste0("measurement_time = (", as.character(measurement_time), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("measurement_time = '", measurement_time,"'"))
    }
  }

  if (!missing(measurement_type_concept_id)) {
    if (is.null(measurement_type_concept_id)) {
      whereClauses <- c(whereClauses, "measurement_type_concept_id IS NULL")
    } else if (is(measurement_type_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("measurement_type_concept_id = (", as.character(measurement_type_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("measurement_type_concept_id = '", measurement_type_concept_id,"'"))
    }
  }

  if (!missing(operator_concept_id)) {
    if (is.null(operator_concept_id)) {
      whereClauses <- c(whereClauses, "operator_concept_id IS NULL")
    } else if (is(operator_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("operator_concept_id = (", as.character(operator_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("operator_concept_id = '", operator_concept_id,"'"))
    }
  }

  if (!missing(value_as_number)) {
    if (is.null(value_as_number)) {
      whereClauses <- c(whereClauses, "value_as_number IS NULL")
    } else if (is(value_as_number, "subQuery")){
      whereClauses <- c(whereClauses, paste0("value_as_number = (", as.character(value_as_number), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("value_as_number = '", value_as_number,"'"))
    }
  }

  if (!missing(value_as_concept_id)) {
    if (is.null(value_as_concept_id)) {
      whereClauses <- c(whereClauses, "value_as_concept_id IS NULL")
    } else if (is(value_as_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("value_as_concept_id = (", as.character(value_as_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("value_as_concept_id = '", value_as_concept_id,"'"))
    }
  }

  if (!missing(unit_concept_id)) {
    if (is.null(unit_concept_id)) {
      whereClauses <- c(whereClauses, "unit_concept_id IS NULL")
    } else if (is(unit_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("unit_concept_id = (", as.character(unit_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("unit_concept_id = '", unit_concept_id,"'"))
    }
  }

  if (!missing(range_low)) {
    if (is.null(range_low)) {
      whereClauses <- c(whereClauses, "range_low IS NULL")
    } else if (is(range_low, "subQuery")){
      whereClauses <- c(whereClauses, paste0("range_low = (", as.character(range_low), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("range_low = '", range_low,"'"))
    }
  }

  if (!missing(range_high)) {
    if (is.null(range_high)) {
      whereClauses <- c(whereClauses, "range_high IS NULL")
    } else if (is(range_high, "subQuery")){
      whereClauses <- c(whereClauses, paste0("range_high = (", as.character(range_high), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("range_high = '", range_high,"'"))
    }
  }

  if (!missing(provider_id)) {
    if (is.null(provider_id)) {
      whereClauses <- c(whereClauses, "provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("provider_id = (", as.character(provider_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("provider_id = '", provider_id,"'"))
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (is.null(visit_occurrence_id)) {
      whereClauses <- c(whereClauses, "visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("visit_occurrence_id = (", as.character(visit_occurrence_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_occurrence_id = '", visit_occurrence_id,"'"))
    }
  }

  if (!missing(measurement_source_value)) {
    if (is.null(measurement_source_value)) {
      whereClauses <- c(whereClauses, "measurement_source_value IS NULL")
    } else if (is(measurement_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("measurement_source_value = (", as.character(measurement_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("measurement_source_value = '", measurement_source_value,"'"))
    }
  }

  if (!missing(measurement_source_concept_id)) {
    if (is.null(measurement_source_concept_id)) {
      whereClauses <- c(whereClauses, "measurement_source_concept_id IS NULL")
    } else if (is(measurement_source_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("measurement_source_concept_id = (", as.character(measurement_source_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("measurement_source_concept_id = '", measurement_source_concept_id,"'"))
    }
  }

  if (!missing(unit_source_value)) {
    if (is.null(unit_source_value)) {
      whereClauses <- c(whereClauses, "unit_source_value IS NULL")
    } else if (is(unit_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("unit_source_value = (", as.character(unit_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("unit_source_value = '", unit_source_value,"'"))
    }
  }

  if (!missing(value_source_value)) {
    if (is.null(value_source_value)) {
      whereClauses <- c(whereClauses, "value_source_value IS NULL")
    } else if (is(value_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("value_source_value = (", as.character(value_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("value_source_value = '", value_source_value,"'"))
    }
  }

 statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

expect_observation <- function(observation_id, person_id, observation_concept_id, observation_date, observation_time, observation_type_concept_id, value_as_number, value_as_string, value_as_concept_id, qualifier_concept_id, unit_concept_id, provider_id, visit_occurrence_id, observation_source_value, observation_source_concept_id, unit_source_value, qualifier_source_value) {

  if (is.null(frameworkContext$currentGroup)) {
    testName <- frameworkContext$testDescription;
  } else {
    testName <- paste0(frameworkContext$groupIndex, ".", frameworkContext$currentGroup$groupItemIndex, " ", frameworkContext$testDescription);
  }

  source_pid <- frameworkContext$patient$source_pid;
  if (is.null(source_pid)) {
    source_pid <- "NULL";
  } else {
    source_pid <- paste0("'", as.character(source_pid), "'");
  }

  cdm_pid <- frameworkContext$patient$cdm_pid;
  if (is.null(cdm_pid)) {
    cdm_pid <- "NULL"
  }

  statement <- paste0("INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT ", frameworkContext$testId, " AS id, '", testName, "' AS description, 'Expect observation' AS test, ", source_pid, " as source_pid, ", cdm_pid, " as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.observation WHERE ")
  whereClauses = NULL;
  if (!missing(observation_id)) {
    if (is.null(observation_id)) {
      whereClauses <- c(whereClauses, "observation_id IS NULL")
    } else if (is(observation_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("observation_id = (", as.character(observation_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("observation_id = '", observation_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(observation_concept_id)) {
    if (is.null(observation_concept_id)) {
      whereClauses <- c(whereClauses, "observation_concept_id IS NULL")
    } else if (is(observation_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("observation_concept_id = (", as.character(observation_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("observation_concept_id = '", observation_concept_id,"'"))
    }
  }

  if (!missing(observation_date)) {
    if (is.null(observation_date)) {
      whereClauses <- c(whereClauses, "observation_date IS NULL")
    } else if (is(observation_date, "subQuery")){
      whereClauses <- c(whereClauses, paste0("observation_date = (", as.character(observation_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("observation_date = '", observation_date,"'"))
    }
  }

  if (!missing(observation_time)) {
    if (is.null(observation_time)) {
      whereClauses <- c(whereClauses, "observation_time IS NULL")
    } else if (is(observation_time, "subQuery")){
      whereClauses <- c(whereClauses, paste0("observation_time = (", as.character(observation_time), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("observation_time = '", observation_time,"'"))
    }
  }

  if (!missing(observation_type_concept_id)) {
    if (is.null(observation_type_concept_id)) {
      whereClauses <- c(whereClauses, "observation_type_concept_id IS NULL")
    } else if (is(observation_type_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("observation_type_concept_id = (", as.character(observation_type_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("observation_type_concept_id = '", observation_type_concept_id,"'"))
    }
  }

  if (!missing(value_as_number)) {
    if (is.null(value_as_number)) {
      whereClauses <- c(whereClauses, "value_as_number IS NULL")
    } else if (is(value_as_number, "subQuery")){
      whereClauses <- c(whereClauses, paste0("value_as_number = (", as.character(value_as_number), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("value_as_number = '", value_as_number,"'"))
    }
  }

  if (!missing(value_as_string)) {
    if (is.null(value_as_string)) {
      whereClauses <- c(whereClauses, "value_as_string IS NULL")
    } else if (is(value_as_string, "subQuery")){
      whereClauses <- c(whereClauses, paste0("value_as_string = (", as.character(value_as_string), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("value_as_string = '", value_as_string,"'"))
    }
  }

  if (!missing(value_as_concept_id)) {
    if (is.null(value_as_concept_id)) {
      whereClauses <- c(whereClauses, "value_as_concept_id IS NULL")
    } else if (is(value_as_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("value_as_concept_id = (", as.character(value_as_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("value_as_concept_id = '", value_as_concept_id,"'"))
    }
  }

  if (!missing(qualifier_concept_id)) {
    if (is.null(qualifier_concept_id)) {
      whereClauses <- c(whereClauses, "qualifier_concept_id IS NULL")
    } else if (is(qualifier_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("qualifier_concept_id = (", as.character(qualifier_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("qualifier_concept_id = '", qualifier_concept_id,"'"))
    }
  }

  if (!missing(unit_concept_id)) {
    if (is.null(unit_concept_id)) {
      whereClauses <- c(whereClauses, "unit_concept_id IS NULL")
    } else if (is(unit_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("unit_concept_id = (", as.character(unit_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("unit_concept_id = '", unit_concept_id,"'"))
    }
  }

  if (!missing(provider_id)) {
    if (is.null(provider_id)) {
      whereClauses <- c(whereClauses, "provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("provider_id = (", as.character(provider_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("provider_id = '", provider_id,"'"))
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (is.null(visit_occurrence_id)) {
      whereClauses <- c(whereClauses, "visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("visit_occurrence_id = (", as.character(visit_occurrence_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_occurrence_id = '", visit_occurrence_id,"'"))
    }
  }

  if (!missing(observation_source_value)) {
    if (is.null(observation_source_value)) {
      whereClauses <- c(whereClauses, "observation_source_value IS NULL")
    } else if (is(observation_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("observation_source_value = (", as.character(observation_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("observation_source_value = '", observation_source_value,"'"))
    }
  }

  if (!missing(observation_source_concept_id)) {
    if (is.null(observation_source_concept_id)) {
      whereClauses <- c(whereClauses, "observation_source_concept_id IS NULL")
    } else if (is(observation_source_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("observation_source_concept_id = (", as.character(observation_source_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("observation_source_concept_id = '", observation_source_concept_id,"'"))
    }
  }

  if (!missing(unit_source_value)) {
    if (is.null(unit_source_value)) {
      whereClauses <- c(whereClauses, "unit_source_value IS NULL")
    } else if (is(unit_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("unit_source_value = (", as.character(unit_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("unit_source_value = '", unit_source_value,"'"))
    }
  }

  if (!missing(qualifier_source_value)) {
    if (is.null(qualifier_source_value)) {
      whereClauses <- c(whereClauses, "qualifier_source_value IS NULL")
    } else if (is(qualifier_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("qualifier_source_value = (", as.character(qualifier_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("qualifier_source_value = '", qualifier_source_value,"'"))
    }
  }

 statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

expect_note <- function(note_id, person_id, note_date, note_time, note_type_concept_id, note_text, provider_id, visit_occurrence_id, note_source_value) {

  if (is.null(frameworkContext$currentGroup)) {
    testName <- frameworkContext$testDescription;
  } else {
    testName <- paste0(frameworkContext$groupIndex, ".", frameworkContext$currentGroup$groupItemIndex, " ", frameworkContext$testDescription);
  }

  source_pid <- frameworkContext$patient$source_pid;
  if (is.null(source_pid)) {
    source_pid <- "NULL";
  } else {
    source_pid <- paste0("'", as.character(source_pid), "'");
  }

  cdm_pid <- frameworkContext$patient$cdm_pid;
  if (is.null(cdm_pid)) {
    cdm_pid <- "NULL"
  }

  statement <- paste0("INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT ", frameworkContext$testId, " AS id, '", testName, "' AS description, 'Expect note' AS test, ", source_pid, " as source_pid, ", cdm_pid, " as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.note WHERE ")
  whereClauses = NULL;
  if (!missing(note_id)) {
    if (is.null(note_id)) {
      whereClauses <- c(whereClauses, "note_id IS NULL")
    } else if (is(note_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("note_id = (", as.character(note_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("note_id = '", note_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(note_date)) {
    if (is.null(note_date)) {
      whereClauses <- c(whereClauses, "note_date IS NULL")
    } else if (is(note_date, "subQuery")){
      whereClauses <- c(whereClauses, paste0("note_date = (", as.character(note_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("note_date = '", note_date,"'"))
    }
  }

  if (!missing(note_time)) {
    if (is.null(note_time)) {
      whereClauses <- c(whereClauses, "note_time IS NULL")
    } else if (is(note_time, "subQuery")){
      whereClauses <- c(whereClauses, paste0("note_time = (", as.character(note_time), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("note_time = '", note_time,"'"))
    }
  }

  if (!missing(note_type_concept_id)) {
    if (is.null(note_type_concept_id)) {
      whereClauses <- c(whereClauses, "note_type_concept_id IS NULL")
    } else if (is(note_type_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("note_type_concept_id = (", as.character(note_type_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("note_type_concept_id = '", note_type_concept_id,"'"))
    }
  }

  if (!missing(note_text)) {
    if (is.null(note_text)) {
      whereClauses <- c(whereClauses, "note_text IS NULL")
    } else if (is(note_text, "subQuery")){
      whereClauses <- c(whereClauses, paste0("note_text = (", as.character(note_text), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("note_text = '", note_text,"'"))
    }
  }

  if (!missing(provider_id)) {
    if (is.null(provider_id)) {
      whereClauses <- c(whereClauses, "provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("provider_id = (", as.character(provider_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("provider_id = '", provider_id,"'"))
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (is.null(visit_occurrence_id)) {
      whereClauses <- c(whereClauses, "visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("visit_occurrence_id = (", as.character(visit_occurrence_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_occurrence_id = '", visit_occurrence_id,"'"))
    }
  }

  if (!missing(note_source_value)) {
    if (is.null(note_source_value)) {
      whereClauses <- c(whereClauses, "note_source_value IS NULL")
    } else if (is(note_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("note_source_value = (", as.character(note_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("note_source_value = '", note_source_value,"'"))
    }
  }

 statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

expect_specimen <- function(specimen_id, person_id, specimen_concept_id, specimen_type_concept_id, specimen_date, specimen_time, quantity, unit_concept_id, anatomic_site_concept_id, disease_status_concept_id, specimen_source_id, specimen_source_value, unit_source_value, anatomic_site_source_value, disease_status_source_value) {

  if (is.null(frameworkContext$currentGroup)) {
    testName <- frameworkContext$testDescription;
  } else {
    testName <- paste0(frameworkContext$groupIndex, ".", frameworkContext$currentGroup$groupItemIndex, " ", frameworkContext$testDescription);
  }

  source_pid <- frameworkContext$patient$source_pid;
  if (is.null(source_pid)) {
    source_pid <- "NULL";
  } else {
    source_pid <- paste0("'", as.character(source_pid), "'");
  }

  cdm_pid <- frameworkContext$patient$cdm_pid;
  if (is.null(cdm_pid)) {
    cdm_pid <- "NULL"
  }

  statement <- paste0("INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT ", frameworkContext$testId, " AS id, '", testName, "' AS description, 'Expect specimen' AS test, ", source_pid, " as source_pid, ", cdm_pid, " as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.specimen WHERE ")
  whereClauses = NULL;
  if (!missing(specimen_id)) {
    if (is.null(specimen_id)) {
      whereClauses <- c(whereClauses, "specimen_id IS NULL")
    } else if (is(specimen_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("specimen_id = (", as.character(specimen_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("specimen_id = '", specimen_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(specimen_concept_id)) {
    if (is.null(specimen_concept_id)) {
      whereClauses <- c(whereClauses, "specimen_concept_id IS NULL")
    } else if (is(specimen_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("specimen_concept_id = (", as.character(specimen_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("specimen_concept_id = '", specimen_concept_id,"'"))
    }
  }

  if (!missing(specimen_type_concept_id)) {
    if (is.null(specimen_type_concept_id)) {
      whereClauses <- c(whereClauses, "specimen_type_concept_id IS NULL")
    } else if (is(specimen_type_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("specimen_type_concept_id = (", as.character(specimen_type_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("specimen_type_concept_id = '", specimen_type_concept_id,"'"))
    }
  }

  if (!missing(specimen_date)) {
    if (is.null(specimen_date)) {
      whereClauses <- c(whereClauses, "specimen_date IS NULL")
    } else if (is(specimen_date, "subQuery")){
      whereClauses <- c(whereClauses, paste0("specimen_date = (", as.character(specimen_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("specimen_date = '", specimen_date,"'"))
    }
  }

  if (!missing(specimen_time)) {
    if (is.null(specimen_time)) {
      whereClauses <- c(whereClauses, "specimen_time IS NULL")
    } else if (is(specimen_time, "subQuery")){
      whereClauses <- c(whereClauses, paste0("specimen_time = (", as.character(specimen_time), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("specimen_time = '", specimen_time,"'"))
    }
  }

  if (!missing(quantity)) {
    if (is.null(quantity)) {
      whereClauses <- c(whereClauses, "quantity IS NULL")
    } else if (is(quantity, "subQuery")){
      whereClauses <- c(whereClauses, paste0("quantity = (", as.character(quantity), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("quantity = '", quantity,"'"))
    }
  }

  if (!missing(unit_concept_id)) {
    if (is.null(unit_concept_id)) {
      whereClauses <- c(whereClauses, "unit_concept_id IS NULL")
    } else if (is(unit_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("unit_concept_id = (", as.character(unit_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("unit_concept_id = '", unit_concept_id,"'"))
    }
  }

  if (!missing(anatomic_site_concept_id)) {
    if (is.null(anatomic_site_concept_id)) {
      whereClauses <- c(whereClauses, "anatomic_site_concept_id IS NULL")
    } else if (is(anatomic_site_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("anatomic_site_concept_id = (", as.character(anatomic_site_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("anatomic_site_concept_id = '", anatomic_site_concept_id,"'"))
    }
  }

  if (!missing(disease_status_concept_id)) {
    if (is.null(disease_status_concept_id)) {
      whereClauses <- c(whereClauses, "disease_status_concept_id IS NULL")
    } else if (is(disease_status_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("disease_status_concept_id = (", as.character(disease_status_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("disease_status_concept_id = '", disease_status_concept_id,"'"))
    }
  }

  if (!missing(specimen_source_id)) {
    if (is.null(specimen_source_id)) {
      whereClauses <- c(whereClauses, "specimen_source_id IS NULL")
    } else if (is(specimen_source_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("specimen_source_id = (", as.character(specimen_source_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("specimen_source_id = '", specimen_source_id,"'"))
    }
  }

  if (!missing(specimen_source_value)) {
    if (is.null(specimen_source_value)) {
      whereClauses <- c(whereClauses, "specimen_source_value IS NULL")
    } else if (is(specimen_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("specimen_source_value = (", as.character(specimen_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("specimen_source_value = '", specimen_source_value,"'"))
    }
  }

  if (!missing(unit_source_value)) {
    if (is.null(unit_source_value)) {
      whereClauses <- c(whereClauses, "unit_source_value IS NULL")
    } else if (is(unit_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("unit_source_value = (", as.character(unit_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("unit_source_value = '", unit_source_value,"'"))
    }
  }

  if (!missing(anatomic_site_source_value)) {
    if (is.null(anatomic_site_source_value)) {
      whereClauses <- c(whereClauses, "anatomic_site_source_value IS NULL")
    } else if (is(anatomic_site_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("anatomic_site_source_value = (", as.character(anatomic_site_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("anatomic_site_source_value = '", anatomic_site_source_value,"'"))
    }
  }

  if (!missing(disease_status_source_value)) {
    if (is.null(disease_status_source_value)) {
      whereClauses <- c(whereClauses, "disease_status_source_value IS NULL")
    } else if (is(disease_status_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("disease_status_source_value = (", as.character(disease_status_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("disease_status_source_value = '", disease_status_source_value,"'"))
    }
  }

 statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

expect_fact_relationship <- function(domain_concept_id_1, fact_id_1, domain_concept_id_2, fact_id_2, relationship_concept_id) {

  if (is.null(frameworkContext$currentGroup)) {
    testName <- frameworkContext$testDescription;
  } else {
    testName <- paste0(frameworkContext$groupIndex, ".", frameworkContext$currentGroup$groupItemIndex, " ", frameworkContext$testDescription);
  }

  source_pid <- frameworkContext$patient$source_pid;
  if (is.null(source_pid)) {
    source_pid <- "NULL";
  } else {
    source_pid <- paste0("'", as.character(source_pid), "'");
  }

  cdm_pid <- frameworkContext$patient$cdm_pid;
  if (is.null(cdm_pid)) {
    cdm_pid <- "NULL"
  }

  statement <- paste0("INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT ", frameworkContext$testId, " AS id, '", testName, "' AS description, 'Expect fact_relationship' AS test, ", source_pid, " as source_pid, ", cdm_pid, " as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.fact_relationship WHERE ")
  whereClauses = NULL;
  if (!missing(domain_concept_id_1)) {
    if (is.null(domain_concept_id_1)) {
      whereClauses <- c(whereClauses, "domain_concept_id_1 IS NULL")
    } else if (is(domain_concept_id_1, "subQuery")){
      whereClauses <- c(whereClauses, paste0("domain_concept_id_1 = (", as.character(domain_concept_id_1), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("domain_concept_id_1 = '", domain_concept_id_1,"'"))
    }
  }

  if (!missing(fact_id_1)) {
    if (is.null(fact_id_1)) {
      whereClauses <- c(whereClauses, "fact_id_1 IS NULL")
    } else if (is(fact_id_1, "subQuery")){
      whereClauses <- c(whereClauses, paste0("fact_id_1 = (", as.character(fact_id_1), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("fact_id_1 = '", fact_id_1,"'"))
    }
  }

  if (!missing(domain_concept_id_2)) {
    if (is.null(domain_concept_id_2)) {
      whereClauses <- c(whereClauses, "domain_concept_id_2 IS NULL")
    } else if (is(domain_concept_id_2, "subQuery")){
      whereClauses <- c(whereClauses, paste0("domain_concept_id_2 = (", as.character(domain_concept_id_2), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("domain_concept_id_2 = '", domain_concept_id_2,"'"))
    }
  }

  if (!missing(fact_id_2)) {
    if (is.null(fact_id_2)) {
      whereClauses <- c(whereClauses, "fact_id_2 IS NULL")
    } else if (is(fact_id_2, "subQuery")){
      whereClauses <- c(whereClauses, paste0("fact_id_2 = (", as.character(fact_id_2), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("fact_id_2 = '", fact_id_2,"'"))
    }
  }

  if (!missing(relationship_concept_id)) {
    if (is.null(relationship_concept_id)) {
      whereClauses <- c(whereClauses, "relationship_concept_id IS NULL")
    } else if (is(relationship_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("relationship_concept_id = (", as.character(relationship_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("relationship_concept_id = '", relationship_concept_id,"'"))
    }
  }

 statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

expect_payer_plan_period <- function(payer_plan_period_id, person_id, payer_plan_period_start_date, payer_plan_period_end_date, payer_source_value, plan_source_value, family_source_value) {

  if (is.null(frameworkContext$currentGroup)) {
    testName <- frameworkContext$testDescription;
  } else {
    testName <- paste0(frameworkContext$groupIndex, ".", frameworkContext$currentGroup$groupItemIndex, " ", frameworkContext$testDescription);
  }

  source_pid <- frameworkContext$patient$source_pid;
  if (is.null(source_pid)) {
    source_pid <- "NULL";
  } else {
    source_pid <- paste0("'", as.character(source_pid), "'");
  }

  cdm_pid <- frameworkContext$patient$cdm_pid;
  if (is.null(cdm_pid)) {
    cdm_pid <- "NULL"
  }

  statement <- paste0("INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT ", frameworkContext$testId, " AS id, '", testName, "' AS description, 'Expect payer_plan_period' AS test, ", source_pid, " as source_pid, ", cdm_pid, " as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.payer_plan_period WHERE ")
  whereClauses = NULL;
  if (!missing(payer_plan_period_id)) {
    if (is.null(payer_plan_period_id)) {
      whereClauses <- c(whereClauses, "payer_plan_period_id IS NULL")
    } else if (is(payer_plan_period_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("payer_plan_period_id = (", as.character(payer_plan_period_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("payer_plan_period_id = '", payer_plan_period_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(payer_plan_period_start_date)) {
    if (is.null(payer_plan_period_start_date)) {
      whereClauses <- c(whereClauses, "payer_plan_period_start_date IS NULL")
    } else if (is(payer_plan_period_start_date, "subQuery")){
      whereClauses <- c(whereClauses, paste0("payer_plan_period_start_date = (", as.character(payer_plan_period_start_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("payer_plan_period_start_date = '", payer_plan_period_start_date,"'"))
    }
  }

  if (!missing(payer_plan_period_end_date)) {
    if (is.null(payer_plan_period_end_date)) {
      whereClauses <- c(whereClauses, "payer_plan_period_end_date IS NULL")
    } else if (is(payer_plan_period_end_date, "subQuery")){
      whereClauses <- c(whereClauses, paste0("payer_plan_period_end_date = (", as.character(payer_plan_period_end_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("payer_plan_period_end_date = '", payer_plan_period_end_date,"'"))
    }
  }

  if (!missing(payer_source_value)) {
    if (is.null(payer_source_value)) {
      whereClauses <- c(whereClauses, "payer_source_value IS NULL")
    } else if (is(payer_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("payer_source_value = (", as.character(payer_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("payer_source_value = '", payer_source_value,"'"))
    }
  }

  if (!missing(plan_source_value)) {
    if (is.null(plan_source_value)) {
      whereClauses <- c(whereClauses, "plan_source_value IS NULL")
    } else if (is(plan_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("plan_source_value = (", as.character(plan_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("plan_source_value = '", plan_source_value,"'"))
    }
  }

  if (!missing(family_source_value)) {
    if (is.null(family_source_value)) {
      whereClauses <- c(whereClauses, "family_source_value IS NULL")
    } else if (is(family_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("family_source_value = (", as.character(family_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("family_source_value = '", family_source_value,"'"))
    }
  }

 statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

expect_drug_era <- function(drug_era_id, person_id, drug_concept_id, drug_era_start_date, drug_era_end_date, drug_exposure_count, gap_days) {

  if (is.null(frameworkContext$currentGroup)) {
    testName <- frameworkContext$testDescription;
  } else {
    testName <- paste0(frameworkContext$groupIndex, ".", frameworkContext$currentGroup$groupItemIndex, " ", frameworkContext$testDescription);
  }

  source_pid <- frameworkContext$patient$source_pid;
  if (is.null(source_pid)) {
    source_pid <- "NULL";
  } else {
    source_pid <- paste0("'", as.character(source_pid), "'");
  }

  cdm_pid <- frameworkContext$patient$cdm_pid;
  if (is.null(cdm_pid)) {
    cdm_pid <- "NULL"
  }

  statement <- paste0("INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT ", frameworkContext$testId, " AS id, '", testName, "' AS description, 'Expect drug_era' AS test, ", source_pid, " as source_pid, ", cdm_pid, " as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.drug_era WHERE ")
  whereClauses = NULL;
  if (!missing(drug_era_id)) {
    if (is.null(drug_era_id)) {
      whereClauses <- c(whereClauses, "drug_era_id IS NULL")
    } else if (is(drug_era_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("drug_era_id = (", as.character(drug_era_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("drug_era_id = '", drug_era_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(drug_concept_id)) {
    if (is.null(drug_concept_id)) {
      whereClauses <- c(whereClauses, "drug_concept_id IS NULL")
    } else if (is(drug_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("drug_concept_id = (", as.character(drug_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("drug_concept_id = '", drug_concept_id,"'"))
    }
  }

  if (!missing(drug_era_start_date)) {
    if (is.null(drug_era_start_date)) {
      whereClauses <- c(whereClauses, "drug_era_start_date IS NULL")
    } else if (is(drug_era_start_date, "subQuery")){
      whereClauses <- c(whereClauses, paste0("drug_era_start_date = (", as.character(drug_era_start_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("drug_era_start_date = '", drug_era_start_date,"'"))
    }
  }

  if (!missing(drug_era_end_date)) {
    if (is.null(drug_era_end_date)) {
      whereClauses <- c(whereClauses, "drug_era_end_date IS NULL")
    } else if (is(drug_era_end_date, "subQuery")){
      whereClauses <- c(whereClauses, paste0("drug_era_end_date = (", as.character(drug_era_end_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("drug_era_end_date = '", drug_era_end_date,"'"))
    }
  }

  if (!missing(drug_exposure_count)) {
    if (is.null(drug_exposure_count)) {
      whereClauses <- c(whereClauses, "drug_exposure_count IS NULL")
    } else if (is(drug_exposure_count, "subQuery")){
      whereClauses <- c(whereClauses, paste0("drug_exposure_count = (", as.character(drug_exposure_count), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("drug_exposure_count = '", drug_exposure_count,"'"))
    }
  }

  if (!missing(gap_days)) {
    if (is.null(gap_days)) {
      whereClauses <- c(whereClauses, "gap_days IS NULL")
    } else if (is(gap_days, "subQuery")){
      whereClauses <- c(whereClauses, paste0("gap_days = (", as.character(gap_days), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("gap_days = '", gap_days,"'"))
    }
  }

 statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

expect_dose_era <- function(dose_era_id, person_id, drug_concept_id, unit_concept_id, dose_value, dose_era_start_date, dose_era_end_date) {

  if (is.null(frameworkContext$currentGroup)) {
    testName <- frameworkContext$testDescription;
  } else {
    testName <- paste0(frameworkContext$groupIndex, ".", frameworkContext$currentGroup$groupItemIndex, " ", frameworkContext$testDescription);
  }

  source_pid <- frameworkContext$patient$source_pid;
  if (is.null(source_pid)) {
    source_pid <- "NULL";
  } else {
    source_pid <- paste0("'", as.character(source_pid), "'");
  }

  cdm_pid <- frameworkContext$patient$cdm_pid;
  if (is.null(cdm_pid)) {
    cdm_pid <- "NULL"
  }

  statement <- paste0("INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT ", frameworkContext$testId, " AS id, '", testName, "' AS description, 'Expect dose_era' AS test, ", source_pid, " as source_pid, ", cdm_pid, " as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.dose_era WHERE ")
  whereClauses = NULL;
  if (!missing(dose_era_id)) {
    if (is.null(dose_era_id)) {
      whereClauses <- c(whereClauses, "dose_era_id IS NULL")
    } else if (is(dose_era_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("dose_era_id = (", as.character(dose_era_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("dose_era_id = '", dose_era_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(drug_concept_id)) {
    if (is.null(drug_concept_id)) {
      whereClauses <- c(whereClauses, "drug_concept_id IS NULL")
    } else if (is(drug_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("drug_concept_id = (", as.character(drug_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("drug_concept_id = '", drug_concept_id,"'"))
    }
  }

  if (!missing(unit_concept_id)) {
    if (is.null(unit_concept_id)) {
      whereClauses <- c(whereClauses, "unit_concept_id IS NULL")
    } else if (is(unit_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("unit_concept_id = (", as.character(unit_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("unit_concept_id = '", unit_concept_id,"'"))
    }
  }

  if (!missing(dose_value)) {
    if (is.null(dose_value)) {
      whereClauses <- c(whereClauses, "dose_value IS NULL")
    } else if (is(dose_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("dose_value = (", as.character(dose_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("dose_value = '", dose_value,"'"))
    }
  }

  if (!missing(dose_era_start_date)) {
    if (is.null(dose_era_start_date)) {
      whereClauses <- c(whereClauses, "dose_era_start_date IS NULL")
    } else if (is(dose_era_start_date, "subQuery")){
      whereClauses <- c(whereClauses, paste0("dose_era_start_date = (", as.character(dose_era_start_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("dose_era_start_date = '", dose_era_start_date,"'"))
    }
  }

  if (!missing(dose_era_end_date)) {
    if (is.null(dose_era_end_date)) {
      whereClauses <- c(whereClauses, "dose_era_end_date IS NULL")
    } else if (is(dose_era_end_date, "subQuery")){
      whereClauses <- c(whereClauses, paste0("dose_era_end_date = (", as.character(dose_era_end_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("dose_era_end_date = '", dose_era_end_date,"'"))
    }
  }

 statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

expect_condition_era <- function(condition_era_id, person_id, condition_concept_id, condition_era_start_date, condition_era_end_date, condition_occurrence_count) {

  if (is.null(frameworkContext$currentGroup)) {
    testName <- frameworkContext$testDescription;
  } else {
    testName <- paste0(frameworkContext$groupIndex, ".", frameworkContext$currentGroup$groupItemIndex, " ", frameworkContext$testDescription);
  }

  source_pid <- frameworkContext$patient$source_pid;
  if (is.null(source_pid)) {
    source_pid <- "NULL";
  } else {
    source_pid <- paste0("'", as.character(source_pid), "'");
  }

  cdm_pid <- frameworkContext$patient$cdm_pid;
  if (is.null(cdm_pid)) {
    cdm_pid <- "NULL"
  }

  statement <- paste0("INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT ", frameworkContext$testId, " AS id, '", testName, "' AS description, 'Expect condition_era' AS test, ", source_pid, " as source_pid, ", cdm_pid, " as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.condition_era WHERE ")
  whereClauses = NULL;
  if (!missing(condition_era_id)) {
    if (is.null(condition_era_id)) {
      whereClauses <- c(whereClauses, "condition_era_id IS NULL")
    } else if (is(condition_era_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("condition_era_id = (", as.character(condition_era_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("condition_era_id = '", condition_era_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(condition_concept_id)) {
    if (is.null(condition_concept_id)) {
      whereClauses <- c(whereClauses, "condition_concept_id IS NULL")
    } else if (is(condition_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("condition_concept_id = (", as.character(condition_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("condition_concept_id = '", condition_concept_id,"'"))
    }
  }

  if (!missing(condition_era_start_date)) {
    if (is.null(condition_era_start_date)) {
      whereClauses <- c(whereClauses, "condition_era_start_date IS NULL")
    } else if (is(condition_era_start_date, "subQuery")){
      whereClauses <- c(whereClauses, paste0("condition_era_start_date = (", as.character(condition_era_start_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("condition_era_start_date = '", condition_era_start_date,"'"))
    }
  }

  if (!missing(condition_era_end_date)) {
    if (is.null(condition_era_end_date)) {
      whereClauses <- c(whereClauses, "condition_era_end_date IS NULL")
    } else if (is(condition_era_end_date, "subQuery")){
      whereClauses <- c(whereClauses, paste0("condition_era_end_date = (", as.character(condition_era_end_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("condition_era_end_date = '", condition_era_end_date,"'"))
    }
  }

  if (!missing(condition_occurrence_count)) {
    if (is.null(condition_occurrence_count)) {
      whereClauses <- c(whereClauses, "condition_occurrence_count IS NULL")
    } else if (is(condition_occurrence_count, "subQuery")){
      whereClauses <- c(whereClauses, paste0("condition_occurrence_count = (", as.character(condition_occurrence_count), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("condition_occurrence_count = '", condition_occurrence_count,"'"))
    }
  }

 statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

expect_cdm_source <- function(cdm_source_name, cdm_source_abbreviation, cdm_holder, source_description, source_documentation_reference, cdm_etl_reference, source_release_date, cdm_release_date, cdm_version, vocabulary_version) {

  if (is.null(frameworkContext$currentGroup)) {
    testName <- frameworkContext$testDescription;
  } else {
    testName <- paste0(frameworkContext$groupIndex, ".", frameworkContext$currentGroup$groupItemIndex, " ", frameworkContext$testDescription);
  }

  source_pid <- frameworkContext$patient$source_pid;
  if (is.null(source_pid)) {
    source_pid <- "NULL";
  } else {
    source_pid <- paste0("'", as.character(source_pid), "'");
  }

  cdm_pid <- frameworkContext$patient$cdm_pid;
  if (is.null(cdm_pid)) {
    cdm_pid <- "NULL"
  }

  statement <- paste0("INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT ", frameworkContext$testId, " AS id, '", testName, "' AS description, 'Expect cdm_source' AS test, ", source_pid, " as source_pid, ", cdm_pid, " as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.cdm_source WHERE ")
  whereClauses = NULL;
  if (!missing(cdm_source_name)) {
    if (is.null(cdm_source_name)) {
      whereClauses <- c(whereClauses, "cdm_source_name IS NULL")
    } else if (is(cdm_source_name, "subQuery")){
      whereClauses <- c(whereClauses, paste0("cdm_source_name = (", as.character(cdm_source_name), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cdm_source_name = '", cdm_source_name,"'"))
    }
  }

  if (!missing(cdm_source_abbreviation)) {
    if (is.null(cdm_source_abbreviation)) {
      whereClauses <- c(whereClauses, "cdm_source_abbreviation IS NULL")
    } else if (is(cdm_source_abbreviation, "subQuery")){
      whereClauses <- c(whereClauses, paste0("cdm_source_abbreviation = (", as.character(cdm_source_abbreviation), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cdm_source_abbreviation = '", cdm_source_abbreviation,"'"))
    }
  }

  if (!missing(cdm_holder)) {
    if (is.null(cdm_holder)) {
      whereClauses <- c(whereClauses, "cdm_holder IS NULL")
    } else if (is(cdm_holder, "subQuery")){
      whereClauses <- c(whereClauses, paste0("cdm_holder = (", as.character(cdm_holder), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cdm_holder = '", cdm_holder,"'"))
    }
  }

  if (!missing(source_description)) {
    if (is.null(source_description)) {
      whereClauses <- c(whereClauses, "source_description IS NULL")
    } else if (is(source_description, "subQuery")){
      whereClauses <- c(whereClauses, paste0("source_description = (", as.character(source_description), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("source_description = '", source_description,"'"))
    }
  }

  if (!missing(source_documentation_reference)) {
    if (is.null(source_documentation_reference)) {
      whereClauses <- c(whereClauses, "source_documentation_reference IS NULL")
    } else if (is(source_documentation_reference, "subQuery")){
      whereClauses <- c(whereClauses, paste0("source_documentation_reference = (", as.character(source_documentation_reference), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("source_documentation_reference = '", source_documentation_reference,"'"))
    }
  }

  if (!missing(cdm_etl_reference)) {
    if (is.null(cdm_etl_reference)) {
      whereClauses <- c(whereClauses, "cdm_etl_reference IS NULL")
    } else if (is(cdm_etl_reference, "subQuery")){
      whereClauses <- c(whereClauses, paste0("cdm_etl_reference = (", as.character(cdm_etl_reference), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cdm_etl_reference = '", cdm_etl_reference,"'"))
    }
  }

  if (!missing(source_release_date)) {
    if (is.null(source_release_date)) {
      whereClauses <- c(whereClauses, "source_release_date IS NULL")
    } else if (is(source_release_date, "subQuery")){
      whereClauses <- c(whereClauses, paste0("source_release_date = (", as.character(source_release_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("source_release_date = '", source_release_date,"'"))
    }
  }

  if (!missing(cdm_release_date)) {
    if (is.null(cdm_release_date)) {
      whereClauses <- c(whereClauses, "cdm_release_date IS NULL")
    } else if (is(cdm_release_date, "subQuery")){
      whereClauses <- c(whereClauses, paste0("cdm_release_date = (", as.character(cdm_release_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cdm_release_date = '", cdm_release_date,"'"))
    }
  }

  if (!missing(cdm_version)) {
    if (is.null(cdm_version)) {
      whereClauses <- c(whereClauses, "cdm_version IS NULL")
    } else if (is(cdm_version, "subQuery")){
      whereClauses <- c(whereClauses, paste0("cdm_version = (", as.character(cdm_version), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cdm_version = '", cdm_version,"'"))
    }
  }

  if (!missing(vocabulary_version)) {
    if (is.null(vocabulary_version)) {
      whereClauses <- c(whereClauses, "vocabulary_version IS NULL")
    } else if (is(vocabulary_version, "subQuery")){
      whereClauses <- c(whereClauses, paste0("vocabulary_version = (", as.character(vocabulary_version), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("vocabulary_version = '", vocabulary_version,"'"))
    }
  }

 statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

expect_cohort <- function(cohort_definition_id, subject_id, cohort_start_date, cohort_end_date) {

  if (is.null(frameworkContext$currentGroup)) {
    testName <- frameworkContext$testDescription;
  } else {
    testName <- paste0(frameworkContext$groupIndex, ".", frameworkContext$currentGroup$groupItemIndex, " ", frameworkContext$testDescription);
  }

  source_pid <- frameworkContext$patient$source_pid;
  if (is.null(source_pid)) {
    source_pid <- "NULL";
  } else {
    source_pid <- paste0("'", as.character(source_pid), "'");
  }

  cdm_pid <- frameworkContext$patient$cdm_pid;
  if (is.null(cdm_pid)) {
    cdm_pid <- "NULL"
  }

  statement <- paste0("INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT ", frameworkContext$testId, " AS id, '", testName, "' AS description, 'Expect cohort' AS test, ", source_pid, " as source_pid, ", cdm_pid, " as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.cohort WHERE ")
  whereClauses = NULL;
  if (!missing(cohort_definition_id)) {
    if (is.null(cohort_definition_id)) {
      whereClauses <- c(whereClauses, "cohort_definition_id IS NULL")
    } else if (is(cohort_definition_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("cohort_definition_id = (", as.character(cohort_definition_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cohort_definition_id = '", cohort_definition_id,"'"))
    }
  }

  if (!missing(subject_id)) {
    if (is.null(subject_id)) {
      whereClauses <- c(whereClauses, "subject_id IS NULL")
    } else if (is(subject_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("subject_id = (", as.character(subject_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("subject_id = '", subject_id,"'"))
    }
  }

  if (!missing(cohort_start_date)) {
    if (is.null(cohort_start_date)) {
      whereClauses <- c(whereClauses, "cohort_start_date IS NULL")
    } else if (is(cohort_start_date, "subQuery")){
      whereClauses <- c(whereClauses, paste0("cohort_start_date = (", as.character(cohort_start_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cohort_start_date = '", cohort_start_date,"'"))
    }
  }

  if (!missing(cohort_end_date)) {
    if (is.null(cohort_end_date)) {
      whereClauses <- c(whereClauses, "cohort_end_date IS NULL")
    } else if (is(cohort_end_date, "subQuery")){
      whereClauses <- c(whereClauses, paste0("cohort_end_date = (", as.character(cohort_end_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cohort_end_date = '", cohort_end_date,"'"))
    }
  }

 statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

expect_cohort_definition <- function(cohort_definition_id, cohort_definition_name, cohort_definition_description, definition_type_concept_id, cohort_definition_syntax, subject_concept_id, cohort_instantiation_date) {

  if (is.null(frameworkContext$currentGroup)) {
    testName <- frameworkContext$testDescription;
  } else {
    testName <- paste0(frameworkContext$groupIndex, ".", frameworkContext$currentGroup$groupItemIndex, " ", frameworkContext$testDescription);
  }

  source_pid <- frameworkContext$patient$source_pid;
  if (is.null(source_pid)) {
    source_pid <- "NULL";
  } else {
    source_pid <- paste0("'", as.character(source_pid), "'");
  }

  cdm_pid <- frameworkContext$patient$cdm_pid;
  if (is.null(cdm_pid)) {
    cdm_pid <- "NULL"
  }

  statement <- paste0("INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT ", frameworkContext$testId, " AS id, '", testName, "' AS description, 'Expect cohort_definition' AS test, ", source_pid, " as source_pid, ", cdm_pid, " as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.cohort_definition WHERE ")
  whereClauses = NULL;
  if (!missing(cohort_definition_id)) {
    if (is.null(cohort_definition_id)) {
      whereClauses <- c(whereClauses, "cohort_definition_id IS NULL")
    } else if (is(cohort_definition_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("cohort_definition_id = (", as.character(cohort_definition_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cohort_definition_id = '", cohort_definition_id,"'"))
    }
  }

  if (!missing(cohort_definition_name)) {
    if (is.null(cohort_definition_name)) {
      whereClauses <- c(whereClauses, "cohort_definition_name IS NULL")
    } else if (is(cohort_definition_name, "subQuery")){
      whereClauses <- c(whereClauses, paste0("cohort_definition_name = (", as.character(cohort_definition_name), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cohort_definition_name = '", cohort_definition_name,"'"))
    }
  }

  if (!missing(cohort_definition_description)) {
    if (is.null(cohort_definition_description)) {
      whereClauses <- c(whereClauses, "cohort_definition_description IS NULL")
    } else if (is(cohort_definition_description, "subQuery")){
      whereClauses <- c(whereClauses, paste0("cohort_definition_description = (", as.character(cohort_definition_description), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cohort_definition_description = '", cohort_definition_description,"'"))
    }
  }

  if (!missing(definition_type_concept_id)) {
    if (is.null(definition_type_concept_id)) {
      whereClauses <- c(whereClauses, "definition_type_concept_id IS NULL")
    } else if (is(definition_type_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("definition_type_concept_id = (", as.character(definition_type_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("definition_type_concept_id = '", definition_type_concept_id,"'"))
    }
  }

  if (!missing(cohort_definition_syntax)) {
    if (is.null(cohort_definition_syntax)) {
      whereClauses <- c(whereClauses, "cohort_definition_syntax IS NULL")
    } else if (is(cohort_definition_syntax, "subQuery")){
      whereClauses <- c(whereClauses, paste0("cohort_definition_syntax = (", as.character(cohort_definition_syntax), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cohort_definition_syntax = '", cohort_definition_syntax,"'"))
    }
  }

  if (!missing(subject_concept_id)) {
    if (is.null(subject_concept_id)) {
      whereClauses <- c(whereClauses, "subject_concept_id IS NULL")
    } else if (is(subject_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("subject_concept_id = (", as.character(subject_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("subject_concept_id = '", subject_concept_id,"'"))
    }
  }

  if (!missing(cohort_instantiation_date)) {
    if (is.null(cohort_instantiation_date)) {
      whereClauses <- c(whereClauses, "cohort_instantiation_date IS NULL")
    } else if (is(cohort_instantiation_date, "subQuery")){
      whereClauses <- c(whereClauses, paste0("cohort_instantiation_date = (", as.character(cohort_instantiation_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cohort_instantiation_date = '", cohort_instantiation_date,"'"))
    }
  }

 statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

expect_cohort_attribute <- function(cohort_definition_id, cohort_start_date, cohort_end_date, subject_id, attribute_definition_id, value_as_number, value_as_concept_id) {

  if (is.null(frameworkContext$currentGroup)) {
    testName <- frameworkContext$testDescription;
  } else {
    testName <- paste0(frameworkContext$groupIndex, ".", frameworkContext$currentGroup$groupItemIndex, " ", frameworkContext$testDescription);
  }

  source_pid <- frameworkContext$patient$source_pid;
  if (is.null(source_pid)) {
    source_pid <- "NULL";
  } else {
    source_pid <- paste0("'", as.character(source_pid), "'");
  }

  cdm_pid <- frameworkContext$patient$cdm_pid;
  if (is.null(cdm_pid)) {
    cdm_pid <- "NULL"
  }

  statement <- paste0("INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT ", frameworkContext$testId, " AS id, '", testName, "' AS description, 'Expect cohort_attribute' AS test, ", source_pid, " as source_pid, ", cdm_pid, " as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.cohort_attribute WHERE ")
  whereClauses = NULL;
  if (!missing(cohort_definition_id)) {
    if (is.null(cohort_definition_id)) {
      whereClauses <- c(whereClauses, "cohort_definition_id IS NULL")
    } else if (is(cohort_definition_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("cohort_definition_id = (", as.character(cohort_definition_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cohort_definition_id = '", cohort_definition_id,"'"))
    }
  }

  if (!missing(cohort_start_date)) {
    if (is.null(cohort_start_date)) {
      whereClauses <- c(whereClauses, "cohort_start_date IS NULL")
    } else if (is(cohort_start_date, "subQuery")){
      whereClauses <- c(whereClauses, paste0("cohort_start_date = (", as.character(cohort_start_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cohort_start_date = '", cohort_start_date,"'"))
    }
  }

  if (!missing(cohort_end_date)) {
    if (is.null(cohort_end_date)) {
      whereClauses <- c(whereClauses, "cohort_end_date IS NULL")
    } else if (is(cohort_end_date, "subQuery")){
      whereClauses <- c(whereClauses, paste0("cohort_end_date = (", as.character(cohort_end_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cohort_end_date = '", cohort_end_date,"'"))
    }
  }

  if (!missing(subject_id)) {
    if (is.null(subject_id)) {
      whereClauses <- c(whereClauses, "subject_id IS NULL")
    } else if (is(subject_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("subject_id = (", as.character(subject_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("subject_id = '", subject_id,"'"))
    }
  }

  if (!missing(attribute_definition_id)) {
    if (is.null(attribute_definition_id)) {
      whereClauses <- c(whereClauses, "attribute_definition_id IS NULL")
    } else if (is(attribute_definition_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("attribute_definition_id = (", as.character(attribute_definition_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("attribute_definition_id = '", attribute_definition_id,"'"))
    }
  }

  if (!missing(value_as_number)) {
    if (is.null(value_as_number)) {
      whereClauses <- c(whereClauses, "value_as_number IS NULL")
    } else if (is(value_as_number, "subQuery")){
      whereClauses <- c(whereClauses, paste0("value_as_number = (", as.character(value_as_number), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("value_as_number = '", value_as_number,"'"))
    }
  }

  if (!missing(value_as_concept_id)) {
    if (is.null(value_as_concept_id)) {
      whereClauses <- c(whereClauses, "value_as_concept_id IS NULL")
    } else if (is(value_as_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("value_as_concept_id = (", as.character(value_as_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("value_as_concept_id = '", value_as_concept_id,"'"))
    }
  }

 statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

expect_attribute_definition <- function(attribute_definition_id, attribute_name, attribute_description, attribute_type_concept_id, attribute_syntax) {

  if (is.null(frameworkContext$currentGroup)) {
    testName <- frameworkContext$testDescription;
  } else {
    testName <- paste0(frameworkContext$groupIndex, ".", frameworkContext$currentGroup$groupItemIndex, " ", frameworkContext$testDescription);
  }

  source_pid <- frameworkContext$patient$source_pid;
  if (is.null(source_pid)) {
    source_pid <- "NULL";
  } else {
    source_pid <- paste0("'", as.character(source_pid), "'");
  }

  cdm_pid <- frameworkContext$patient$cdm_pid;
  if (is.null(cdm_pid)) {
    cdm_pid <- "NULL"
  }

  statement <- paste0("INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT ", frameworkContext$testId, " AS id, '", testName, "' AS description, 'Expect attribute_definition' AS test, ", source_pid, " as source_pid, ", cdm_pid, " as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.attribute_definition WHERE ")
  whereClauses = NULL;
  if (!missing(attribute_definition_id)) {
    if (is.null(attribute_definition_id)) {
      whereClauses <- c(whereClauses, "attribute_definition_id IS NULL")
    } else if (is(attribute_definition_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("attribute_definition_id = (", as.character(attribute_definition_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("attribute_definition_id = '", attribute_definition_id,"'"))
    }
  }

  if (!missing(attribute_name)) {
    if (is.null(attribute_name)) {
      whereClauses <- c(whereClauses, "attribute_name IS NULL")
    } else if (is(attribute_name, "subQuery")){
      whereClauses <- c(whereClauses, paste0("attribute_name = (", as.character(attribute_name), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("attribute_name = '", attribute_name,"'"))
    }
  }

  if (!missing(attribute_description)) {
    if (is.null(attribute_description)) {
      whereClauses <- c(whereClauses, "attribute_description IS NULL")
    } else if (is(attribute_description, "subQuery")){
      whereClauses <- c(whereClauses, paste0("attribute_description = (", as.character(attribute_description), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("attribute_description = '", attribute_description,"'"))
    }
  }

  if (!missing(attribute_type_concept_id)) {
    if (is.null(attribute_type_concept_id)) {
      whereClauses <- c(whereClauses, "attribute_type_concept_id IS NULL")
    } else if (is(attribute_type_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("attribute_type_concept_id = (", as.character(attribute_type_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("attribute_type_concept_id = '", attribute_type_concept_id,"'"))
    }
  }

  if (!missing(attribute_syntax)) {
    if (is.null(attribute_syntax)) {
      whereClauses <- c(whereClauses, "attribute_syntax IS NULL")
    } else if (is(attribute_syntax, "subQuery")){
      whereClauses <- c(whereClauses, paste0("attribute_syntax = (", as.character(attribute_syntax), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("attribute_syntax = '", attribute_syntax,"'"))
    }
  }

 statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

expect_cost <- function(cost_id, cost_event_id, cost_domain_id, cost_type_concept_id, currency_concept_id, total_charge, total_cost, total_paid, paid_by_payer, paid_by_patient, paid_patient_copay, paid_patient_coinsurance, paid_patient_deductible, paid_by_primary, paid_ingredient_cost, paid_dispensing_fee, payer_plan_period_id, amount_allowed, revenue_code_concept_id, revenue_code_source_value) {

  if (is.null(frameworkContext$currentGroup)) {
    testName <- frameworkContext$testDescription;
  } else {
    testName <- paste0(frameworkContext$groupIndex, ".", frameworkContext$currentGroup$groupItemIndex, " ", frameworkContext$testDescription);
  }

  source_pid <- frameworkContext$patient$source_pid;
  if (is.null(source_pid)) {
    source_pid <- "NULL";
  } else {
    source_pid <- paste0("'", as.character(source_pid), "'");
  }

  cdm_pid <- frameworkContext$patient$cdm_pid;
  if (is.null(cdm_pid)) {
    cdm_pid <- "NULL"
  }

  statement <- paste0("INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT ", frameworkContext$testId, " AS id, '", testName, "' AS description, 'Expect cost' AS test, ", source_pid, " as source_pid, ", cdm_pid, " as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.cost WHERE ")
  whereClauses = NULL;
  if (!missing(cost_id)) {
    if (is.null(cost_id)) {
      whereClauses <- c(whereClauses, "cost_id IS NULL")
    } else if (is(cost_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("cost_id = (", as.character(cost_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cost_id = '", cost_id,"'"))
    }
  }

  if (!missing(cost_event_id)) {
    if (is.null(cost_event_id)) {
      whereClauses <- c(whereClauses, "cost_event_id IS NULL")
    } else if (is(cost_event_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("cost_event_id = (", as.character(cost_event_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cost_event_id = '", cost_event_id,"'"))
    }
  }

  if (!missing(cost_domain_id)) {
    if (is.null(cost_domain_id)) {
      whereClauses <- c(whereClauses, "cost_domain_id IS NULL")
    } else if (is(cost_domain_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("cost_domain_id = (", as.character(cost_domain_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cost_domain_id = '", cost_domain_id,"'"))
    }
  }

  if (!missing(cost_type_concept_id)) {
    if (is.null(cost_type_concept_id)) {
      whereClauses <- c(whereClauses, "cost_type_concept_id IS NULL")
    } else if (is(cost_type_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("cost_type_concept_id = (", as.character(cost_type_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cost_type_concept_id = '", cost_type_concept_id,"'"))
    }
  }

  if (!missing(currency_concept_id)) {
    if (is.null(currency_concept_id)) {
      whereClauses <- c(whereClauses, "currency_concept_id IS NULL")
    } else if (is(currency_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("currency_concept_id = (", as.character(currency_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("currency_concept_id = '", currency_concept_id,"'"))
    }
  }

  if (!missing(total_charge)) {
    if (is.null(total_charge)) {
      whereClauses <- c(whereClauses, "total_charge IS NULL")
    } else if (is(total_charge, "subQuery")){
      whereClauses <- c(whereClauses, paste0("total_charge = (", as.character(total_charge), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("total_charge = '", total_charge,"'"))
    }
  }

  if (!missing(total_cost)) {
    if (is.null(total_cost)) {
      whereClauses <- c(whereClauses, "total_cost IS NULL")
    } else if (is(total_cost, "subQuery")){
      whereClauses <- c(whereClauses, paste0("total_cost = (", as.character(total_cost), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("total_cost = '", total_cost,"'"))
    }
  }

  if (!missing(total_paid)) {
    if (is.null(total_paid)) {
      whereClauses <- c(whereClauses, "total_paid IS NULL")
    } else if (is(total_paid, "subQuery")){
      whereClauses <- c(whereClauses, paste0("total_paid = (", as.character(total_paid), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("total_paid = '", total_paid,"'"))
    }
  }

  if (!missing(paid_by_payer)) {
    if (is.null(paid_by_payer)) {
      whereClauses <- c(whereClauses, "paid_by_payer IS NULL")
    } else if (is(paid_by_payer, "subQuery")){
      whereClauses <- c(whereClauses, paste0("paid_by_payer = (", as.character(paid_by_payer), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("paid_by_payer = '", paid_by_payer,"'"))
    }
  }

  if (!missing(paid_by_patient)) {
    if (is.null(paid_by_patient)) {
      whereClauses <- c(whereClauses, "paid_by_patient IS NULL")
    } else if (is(paid_by_patient, "subQuery")){
      whereClauses <- c(whereClauses, paste0("paid_by_patient = (", as.character(paid_by_patient), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("paid_by_patient = '", paid_by_patient,"'"))
    }
  }

  if (!missing(paid_patient_copay)) {
    if (is.null(paid_patient_copay)) {
      whereClauses <- c(whereClauses, "paid_patient_copay IS NULL")
    } else if (is(paid_patient_copay, "subQuery")){
      whereClauses <- c(whereClauses, paste0("paid_patient_copay = (", as.character(paid_patient_copay), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("paid_patient_copay = '", paid_patient_copay,"'"))
    }
  }

  if (!missing(paid_patient_coinsurance)) {
    if (is.null(paid_patient_coinsurance)) {
      whereClauses <- c(whereClauses, "paid_patient_coinsurance IS NULL")
    } else if (is(paid_patient_coinsurance, "subQuery")){
      whereClauses <- c(whereClauses, paste0("paid_patient_coinsurance = (", as.character(paid_patient_coinsurance), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("paid_patient_coinsurance = '", paid_patient_coinsurance,"'"))
    }
  }

  if (!missing(paid_patient_deductible)) {
    if (is.null(paid_patient_deductible)) {
      whereClauses <- c(whereClauses, "paid_patient_deductible IS NULL")
    } else if (is(paid_patient_deductible, "subQuery")){
      whereClauses <- c(whereClauses, paste0("paid_patient_deductible = (", as.character(paid_patient_deductible), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("paid_patient_deductible = '", paid_patient_deductible,"'"))
    }
  }

  if (!missing(paid_by_primary)) {
    if (is.null(paid_by_primary)) {
      whereClauses <- c(whereClauses, "paid_by_primary IS NULL")
    } else if (is(paid_by_primary, "subQuery")){
      whereClauses <- c(whereClauses, paste0("paid_by_primary = (", as.character(paid_by_primary), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("paid_by_primary = '", paid_by_primary,"'"))
    }
  }

  if (!missing(paid_ingredient_cost)) {
    if (is.null(paid_ingredient_cost)) {
      whereClauses <- c(whereClauses, "paid_ingredient_cost IS NULL")
    } else if (is(paid_ingredient_cost, "subQuery")){
      whereClauses <- c(whereClauses, paste0("paid_ingredient_cost = (", as.character(paid_ingredient_cost), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("paid_ingredient_cost = '", paid_ingredient_cost,"'"))
    }
  }

  if (!missing(paid_dispensing_fee)) {
    if (is.null(paid_dispensing_fee)) {
      whereClauses <- c(whereClauses, "paid_dispensing_fee IS NULL")
    } else if (is(paid_dispensing_fee, "subQuery")){
      whereClauses <- c(whereClauses, paste0("paid_dispensing_fee = (", as.character(paid_dispensing_fee), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("paid_dispensing_fee = '", paid_dispensing_fee,"'"))
    }
  }

  if (!missing(payer_plan_period_id)) {
    if (is.null(payer_plan_period_id)) {
      whereClauses <- c(whereClauses, "payer_plan_period_id IS NULL")
    } else if (is(payer_plan_period_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("payer_plan_period_id = (", as.character(payer_plan_period_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("payer_plan_period_id = '", payer_plan_period_id,"'"))
    }
  }

  if (!missing(amount_allowed)) {
    if (is.null(amount_allowed)) {
      whereClauses <- c(whereClauses, "amount_allowed IS NULL")
    } else if (is(amount_allowed, "subQuery")){
      whereClauses <- c(whereClauses, paste0("amount_allowed = (", as.character(amount_allowed), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("amount_allowed = '", amount_allowed,"'"))
    }
  }

  if (!missing(revenue_code_concept_id)) {
    if (is.null(revenue_code_concept_id)) {
      whereClauses <- c(whereClauses, "revenue_code_concept_id IS NULL")
    } else if (is(revenue_code_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("revenue_code_concept_id = (", as.character(revenue_code_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("revenue_code_concept_id = '", revenue_code_concept_id,"'"))
    }
  }

  if (!missing(revenue_code_source_value)) {
    if (is.null(revenue_code_source_value)) {
      whereClauses <- c(whereClauses, "revenue_code_source_value IS NULL")
    } else if (is(revenue_code_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("revenue_code_source_value = (", as.character(revenue_code_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("revenue_code_source_value = '", revenue_code_source_value,"'"))
    }
  }

 statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

expect_no_location <- function(location_id, address_1, address_2, city, state, zip, county, location_source_value) {

  if (is.null(frameworkContext$currentGroup)) {
    testName <- frameworkContext$testDescription;
  } else {
    testName <- paste0(frameworkContext$groupIndex, ".", frameworkContext$currentGroup$groupItemIndex, " ", frameworkContext$testDescription);
  }

  source_pid <- frameworkContext$patient$source_pid;
  if (is.null(source_pid)) {
    source_pid <- "NULL";
  } else {
    source_pid <- paste0("'", as.character(source_pid), "'");
  }

  cdm_pid <- frameworkContext$patient$cdm_pid;
  if (is.null(cdm_pid)) {
    cdm_pid <- "NULL"
  }

  statement <- paste0("INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT ", frameworkContext$testId, " AS id, '", testName, "' AS description, 'Expect location' AS test, ", source_pid, " as source_pid, ", cdm_pid, " as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.location WHERE ")
  whereClauses = NULL;
  if (!missing(location_id)) {
    if (is.null(location_id)) {
      whereClauses <- c(whereClauses, "location_id IS NULL")
    } else if (is(location_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("location_id = (", as.character(location_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("location_id = '", location_id,"'"))
    }
  }

  if (!missing(address_1)) {
    if (is.null(address_1)) {
      whereClauses <- c(whereClauses, "address_1 IS NULL")
    } else if (is(address_1, "subQuery")){
      whereClauses <- c(whereClauses, paste0("address_1 = (", as.character(address_1), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("address_1 = '", address_1,"'"))
    }
  }

  if (!missing(address_2)) {
    if (is.null(address_2)) {
      whereClauses <- c(whereClauses, "address_2 IS NULL")
    } else if (is(address_2, "subQuery")){
      whereClauses <- c(whereClauses, paste0("address_2 = (", as.character(address_2), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("address_2 = '", address_2,"'"))
    }
  }

  if (!missing(city)) {
    if (is.null(city)) {
      whereClauses <- c(whereClauses, "city IS NULL")
    } else if (is(city, "subQuery")){
      whereClauses <- c(whereClauses, paste0("city = (", as.character(city), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("city = '", city,"'"))
    }
  }

  if (!missing(state)) {
    if (is.null(state)) {
      whereClauses <- c(whereClauses, "state IS NULL")
    } else if (is(state, "subQuery")){
      whereClauses <- c(whereClauses, paste0("state = (", as.character(state), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("state = '", state,"'"))
    }
  }

  if (!missing(zip)) {
    if (is.null(zip)) {
      whereClauses <- c(whereClauses, "zip IS NULL")
    } else if (is(zip, "subQuery")){
      whereClauses <- c(whereClauses, paste0("zip = (", as.character(zip), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("zip = '", zip,"'"))
    }
  }

  if (!missing(county)) {
    if (is.null(county)) {
      whereClauses <- c(whereClauses, "county IS NULL")
    } else if (is(county, "subQuery")){
      whereClauses <- c(whereClauses, paste0("county = (", as.character(county), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("county = '", county,"'"))
    }
  }

  if (!missing(location_source_value)) {
    if (is.null(location_source_value)) {
      whereClauses <- c(whereClauses, "location_source_value IS NULL")
    } else if (is(location_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("location_source_value = (", as.character(location_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("location_source_value = '", location_source_value,"'"))
    }
  }

 statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

expect_no_person <- function(person_id, gender_concept_id, year_of_birth, month_of_birth, day_of_birth, time_of_birth, race_concept_id, ethnicity_concept_id, location_id, provider_id, care_site_id, person_source_value, gender_source_value, gender_source_concept_id, race_source_value, race_source_concept_id, ethnicity_source_value, ethnicity_source_concept_id) {

  if (is.null(frameworkContext$currentGroup)) {
    testName <- frameworkContext$testDescription;
  } else {
    testName <- paste0(frameworkContext$groupIndex, ".", frameworkContext$currentGroup$groupItemIndex, " ", frameworkContext$testDescription);
  }

  source_pid <- frameworkContext$patient$source_pid;
  if (is.null(source_pid)) {
    source_pid <- "NULL";
  } else {
    source_pid <- paste0("'", as.character(source_pid), "'");
  }

  cdm_pid <- frameworkContext$patient$cdm_pid;
  if (is.null(cdm_pid)) {
    cdm_pid <- "NULL"
  }

  statement <- paste0("INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT ", frameworkContext$testId, " AS id, '", testName, "' AS description, 'Expect person' AS test, ", source_pid, " as source_pid, ", cdm_pid, " as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.person WHERE ")
  whereClauses = NULL;
  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(gender_concept_id)) {
    if (is.null(gender_concept_id)) {
      whereClauses <- c(whereClauses, "gender_concept_id IS NULL")
    } else if (is(gender_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("gender_concept_id = (", as.character(gender_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("gender_concept_id = '", gender_concept_id,"'"))
    }
  }

  if (!missing(year_of_birth)) {
    if (is.null(year_of_birth)) {
      whereClauses <- c(whereClauses, "year_of_birth IS NULL")
    } else if (is(year_of_birth, "subQuery")){
      whereClauses <- c(whereClauses, paste0("year_of_birth = (", as.character(year_of_birth), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("year_of_birth = '", year_of_birth,"'"))
    }
  }

  if (!missing(month_of_birth)) {
    if (is.null(month_of_birth)) {
      whereClauses <- c(whereClauses, "month_of_birth IS NULL")
    } else if (is(month_of_birth, "subQuery")){
      whereClauses <- c(whereClauses, paste0("month_of_birth = (", as.character(month_of_birth), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("month_of_birth = '", month_of_birth,"'"))
    }
  }

  if (!missing(day_of_birth)) {
    if (is.null(day_of_birth)) {
      whereClauses <- c(whereClauses, "day_of_birth IS NULL")
    } else if (is(day_of_birth, "subQuery")){
      whereClauses <- c(whereClauses, paste0("day_of_birth = (", as.character(day_of_birth), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("day_of_birth = '", day_of_birth,"'"))
    }
  }

  if (!missing(time_of_birth)) {
    if (is.null(time_of_birth)) {
      whereClauses <- c(whereClauses, "time_of_birth IS NULL")
    } else if (is(time_of_birth, "subQuery")){
      whereClauses <- c(whereClauses, paste0("time_of_birth = (", as.character(time_of_birth), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("time_of_birth = '", time_of_birth,"'"))
    }
  }

  if (!missing(race_concept_id)) {
    if (is.null(race_concept_id)) {
      whereClauses <- c(whereClauses, "race_concept_id IS NULL")
    } else if (is(race_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("race_concept_id = (", as.character(race_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("race_concept_id = '", race_concept_id,"'"))
    }
  }

  if (!missing(ethnicity_concept_id)) {
    if (is.null(ethnicity_concept_id)) {
      whereClauses <- c(whereClauses, "ethnicity_concept_id IS NULL")
    } else if (is(ethnicity_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("ethnicity_concept_id = (", as.character(ethnicity_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("ethnicity_concept_id = '", ethnicity_concept_id,"'"))
    }
  }

  if (!missing(location_id)) {
    if (is.null(location_id)) {
      whereClauses <- c(whereClauses, "location_id IS NULL")
    } else if (is(location_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("location_id = (", as.character(location_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("location_id = '", location_id,"'"))
    }
  }

  if (!missing(provider_id)) {
    if (is.null(provider_id)) {
      whereClauses <- c(whereClauses, "provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("provider_id = (", as.character(provider_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("provider_id = '", provider_id,"'"))
    }
  }

  if (!missing(care_site_id)) {
    if (is.null(care_site_id)) {
      whereClauses <- c(whereClauses, "care_site_id IS NULL")
    } else if (is(care_site_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("care_site_id = (", as.character(care_site_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("care_site_id = '", care_site_id,"'"))
    }
  }

  if (!missing(person_source_value)) {
    if (is.null(person_source_value)) {
      whereClauses <- c(whereClauses, "person_source_value IS NULL")
    } else if (is(person_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("person_source_value = (", as.character(person_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_source_value = '", person_source_value,"'"))
    }
  }

  if (!missing(gender_source_value)) {
    if (is.null(gender_source_value)) {
      whereClauses <- c(whereClauses, "gender_source_value IS NULL")
    } else if (is(gender_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("gender_source_value = (", as.character(gender_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("gender_source_value = '", gender_source_value,"'"))
    }
  }

  if (!missing(gender_source_concept_id)) {
    if (is.null(gender_source_concept_id)) {
      whereClauses <- c(whereClauses, "gender_source_concept_id IS NULL")
    } else if (is(gender_source_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("gender_source_concept_id = (", as.character(gender_source_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("gender_source_concept_id = '", gender_source_concept_id,"'"))
    }
  }

  if (!missing(race_source_value)) {
    if (is.null(race_source_value)) {
      whereClauses <- c(whereClauses, "race_source_value IS NULL")
    } else if (is(race_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("race_source_value = (", as.character(race_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("race_source_value = '", race_source_value,"'"))
    }
  }

  if (!missing(race_source_concept_id)) {
    if (is.null(race_source_concept_id)) {
      whereClauses <- c(whereClauses, "race_source_concept_id IS NULL")
    } else if (is(race_source_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("race_source_concept_id = (", as.character(race_source_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("race_source_concept_id = '", race_source_concept_id,"'"))
    }
  }

  if (!missing(ethnicity_source_value)) {
    if (is.null(ethnicity_source_value)) {
      whereClauses <- c(whereClauses, "ethnicity_source_value IS NULL")
    } else if (is(ethnicity_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("ethnicity_source_value = (", as.character(ethnicity_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("ethnicity_source_value = '", ethnicity_source_value,"'"))
    }
  }

  if (!missing(ethnicity_source_concept_id)) {
    if (is.null(ethnicity_source_concept_id)) {
      whereClauses <- c(whereClauses, "ethnicity_source_concept_id IS NULL")
    } else if (is(ethnicity_source_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("ethnicity_source_concept_id = (", as.character(ethnicity_source_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("ethnicity_source_concept_id = '", ethnicity_source_concept_id,"'"))
    }
  }

 statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

expect_no_observation_period <- function(observation_period_id, person_id, observation_period_start_date, observation_period_end_date, period_type_concept_id) {

  if (is.null(frameworkContext$currentGroup)) {
    testName <- frameworkContext$testDescription;
  } else {
    testName <- paste0(frameworkContext$groupIndex, ".", frameworkContext$currentGroup$groupItemIndex, " ", frameworkContext$testDescription);
  }

  source_pid <- frameworkContext$patient$source_pid;
  if (is.null(source_pid)) {
    source_pid <- "NULL";
  } else {
    source_pid <- paste0("'", as.character(source_pid), "'");
  }

  cdm_pid <- frameworkContext$patient$cdm_pid;
  if (is.null(cdm_pid)) {
    cdm_pid <- "NULL"
  }

  statement <- paste0("INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT ", frameworkContext$testId, " AS id, '", testName, "' AS description, 'Expect observation_period' AS test, ", source_pid, " as source_pid, ", cdm_pid, " as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.observation_period WHERE ")
  whereClauses = NULL;
  if (!missing(observation_period_id)) {
    if (is.null(observation_period_id)) {
      whereClauses <- c(whereClauses, "observation_period_id IS NULL")
    } else if (is(observation_period_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("observation_period_id = (", as.character(observation_period_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("observation_period_id = '", observation_period_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(observation_period_start_date)) {
    if (is.null(observation_period_start_date)) {
      whereClauses <- c(whereClauses, "observation_period_start_date IS NULL")
    } else if (is(observation_period_start_date, "subQuery")){
      whereClauses <- c(whereClauses, paste0("observation_period_start_date = (", as.character(observation_period_start_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("observation_period_start_date = '", observation_period_start_date,"'"))
    }
  }

  if (!missing(observation_period_end_date)) {
    if (is.null(observation_period_end_date)) {
      whereClauses <- c(whereClauses, "observation_period_end_date IS NULL")
    } else if (is(observation_period_end_date, "subQuery")){
      whereClauses <- c(whereClauses, paste0("observation_period_end_date = (", as.character(observation_period_end_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("observation_period_end_date = '", observation_period_end_date,"'"))
    }
  }

  if (!missing(period_type_concept_id)) {
    if (is.null(period_type_concept_id)) {
      whereClauses <- c(whereClauses, "period_type_concept_id IS NULL")
    } else if (is(period_type_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("period_type_concept_id = (", as.character(period_type_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("period_type_concept_id = '", period_type_concept_id,"'"))
    }
  }

 statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

expect_no_care_site <- function(care_site_id, care_site_name, place_of_service_concept_id, location_id, care_site_source_value, place_of_service_source_value) {

  if (is.null(frameworkContext$currentGroup)) {
    testName <- frameworkContext$testDescription;
  } else {
    testName <- paste0(frameworkContext$groupIndex, ".", frameworkContext$currentGroup$groupItemIndex, " ", frameworkContext$testDescription);
  }

  source_pid <- frameworkContext$patient$source_pid;
  if (is.null(source_pid)) {
    source_pid <- "NULL";
  } else {
    source_pid <- paste0("'", as.character(source_pid), "'");
  }

  cdm_pid <- frameworkContext$patient$cdm_pid;
  if (is.null(cdm_pid)) {
    cdm_pid <- "NULL"
  }

  statement <- paste0("INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT ", frameworkContext$testId, " AS id, '", testName, "' AS description, 'Expect care_site' AS test, ", source_pid, " as source_pid, ", cdm_pid, " as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.care_site WHERE ")
  whereClauses = NULL;
  if (!missing(care_site_id)) {
    if (is.null(care_site_id)) {
      whereClauses <- c(whereClauses, "care_site_id IS NULL")
    } else if (is(care_site_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("care_site_id = (", as.character(care_site_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("care_site_id = '", care_site_id,"'"))
    }
  }

  if (!missing(care_site_name)) {
    if (is.null(care_site_name)) {
      whereClauses <- c(whereClauses, "care_site_name IS NULL")
    } else if (is(care_site_name, "subQuery")){
      whereClauses <- c(whereClauses, paste0("care_site_name = (", as.character(care_site_name), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("care_site_name = '", care_site_name,"'"))
    }
  }

  if (!missing(place_of_service_concept_id)) {
    if (is.null(place_of_service_concept_id)) {
      whereClauses <- c(whereClauses, "place_of_service_concept_id IS NULL")
    } else if (is(place_of_service_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("place_of_service_concept_id = (", as.character(place_of_service_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("place_of_service_concept_id = '", place_of_service_concept_id,"'"))
    }
  }

  if (!missing(location_id)) {
    if (is.null(location_id)) {
      whereClauses <- c(whereClauses, "location_id IS NULL")
    } else if (is(location_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("location_id = (", as.character(location_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("location_id = '", location_id,"'"))
    }
  }

  if (!missing(care_site_source_value)) {
    if (is.null(care_site_source_value)) {
      whereClauses <- c(whereClauses, "care_site_source_value IS NULL")
    } else if (is(care_site_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("care_site_source_value = (", as.character(care_site_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("care_site_source_value = '", care_site_source_value,"'"))
    }
  }

  if (!missing(place_of_service_source_value)) {
    if (is.null(place_of_service_source_value)) {
      whereClauses <- c(whereClauses, "place_of_service_source_value IS NULL")
    } else if (is(place_of_service_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("place_of_service_source_value = (", as.character(place_of_service_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("place_of_service_source_value = '", place_of_service_source_value,"'"))
    }
  }

 statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

expect_no_visit_occurrence <- function(visit_occurrence_id, person_id, visit_concept_id, visit_start_date, visit_start_time, visit_end_date, visit_end_time, visit_type_concept_id, provider_id, care_site_id, visit_source_value, visit_source_concept_id) {

  if (is.null(frameworkContext$currentGroup)) {
    testName <- frameworkContext$testDescription;
  } else {
    testName <- paste0(frameworkContext$groupIndex, ".", frameworkContext$currentGroup$groupItemIndex, " ", frameworkContext$testDescription);
  }

  source_pid <- frameworkContext$patient$source_pid;
  if (is.null(source_pid)) {
    source_pid <- "NULL";
  } else {
    source_pid <- paste0("'", as.character(source_pid), "'");
  }

  cdm_pid <- frameworkContext$patient$cdm_pid;
  if (is.null(cdm_pid)) {
    cdm_pid <- "NULL"
  }

  statement <- paste0("INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT ", frameworkContext$testId, " AS id, '", testName, "' AS description, 'Expect visit_occurrence' AS test, ", source_pid, " as source_pid, ", cdm_pid, " as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.visit_occurrence WHERE ")
  whereClauses = NULL;
  if (!missing(visit_occurrence_id)) {
    if (is.null(visit_occurrence_id)) {
      whereClauses <- c(whereClauses, "visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("visit_occurrence_id = (", as.character(visit_occurrence_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_occurrence_id = '", visit_occurrence_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(visit_concept_id)) {
    if (is.null(visit_concept_id)) {
      whereClauses <- c(whereClauses, "visit_concept_id IS NULL")
    } else if (is(visit_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("visit_concept_id = (", as.character(visit_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_concept_id = '", visit_concept_id,"'"))
    }
  }

  if (!missing(visit_start_date)) {
    if (is.null(visit_start_date)) {
      whereClauses <- c(whereClauses, "visit_start_date IS NULL")
    } else if (is(visit_start_date, "subQuery")){
      whereClauses <- c(whereClauses, paste0("visit_start_date = (", as.character(visit_start_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_start_date = '", visit_start_date,"'"))
    }
  }

  if (!missing(visit_start_time)) {
    if (is.null(visit_start_time)) {
      whereClauses <- c(whereClauses, "visit_start_time IS NULL")
    } else if (is(visit_start_time, "subQuery")){
      whereClauses <- c(whereClauses, paste0("visit_start_time = (", as.character(visit_start_time), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_start_time = '", visit_start_time,"'"))
    }
  }

  if (!missing(visit_end_date)) {
    if (is.null(visit_end_date)) {
      whereClauses <- c(whereClauses, "visit_end_date IS NULL")
    } else if (is(visit_end_date, "subQuery")){
      whereClauses <- c(whereClauses, paste0("visit_end_date = (", as.character(visit_end_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_end_date = '", visit_end_date,"'"))
    }
  }

  if (!missing(visit_end_time)) {
    if (is.null(visit_end_time)) {
      whereClauses <- c(whereClauses, "visit_end_time IS NULL")
    } else if (is(visit_end_time, "subQuery")){
      whereClauses <- c(whereClauses, paste0("visit_end_time = (", as.character(visit_end_time), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_end_time = '", visit_end_time,"'"))
    }
  }

  if (!missing(visit_type_concept_id)) {
    if (is.null(visit_type_concept_id)) {
      whereClauses <- c(whereClauses, "visit_type_concept_id IS NULL")
    } else if (is(visit_type_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("visit_type_concept_id = (", as.character(visit_type_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_type_concept_id = '", visit_type_concept_id,"'"))
    }
  }

  if (!missing(provider_id)) {
    if (is.null(provider_id)) {
      whereClauses <- c(whereClauses, "provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("provider_id = (", as.character(provider_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("provider_id = '", provider_id,"'"))
    }
  }

  if (!missing(care_site_id)) {
    if (is.null(care_site_id)) {
      whereClauses <- c(whereClauses, "care_site_id IS NULL")
    } else if (is(care_site_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("care_site_id = (", as.character(care_site_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("care_site_id = '", care_site_id,"'"))
    }
  }

  if (!missing(visit_source_value)) {
    if (is.null(visit_source_value)) {
      whereClauses <- c(whereClauses, "visit_source_value IS NULL")
    } else if (is(visit_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("visit_source_value = (", as.character(visit_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_source_value = '", visit_source_value,"'"))
    }
  }

  if (!missing(visit_source_concept_id)) {
    if (is.null(visit_source_concept_id)) {
      whereClauses <- c(whereClauses, "visit_source_concept_id IS NULL")
    } else if (is(visit_source_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("visit_source_concept_id = (", as.character(visit_source_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_source_concept_id = '", visit_source_concept_id,"'"))
    }
  }

 statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

expect_no_provider <- function(provider_id, provider_name, npi, dea, specialty_concept_id, care_site_id, year_of_birth, gender_concept_id, provider_source_value, specialty_source_value, specialty_source_concept_id, gender_source_value, gender_source_concept_id) {

  if (is.null(frameworkContext$currentGroup)) {
    testName <- frameworkContext$testDescription;
  } else {
    testName <- paste0(frameworkContext$groupIndex, ".", frameworkContext$currentGroup$groupItemIndex, " ", frameworkContext$testDescription);
  }

  source_pid <- frameworkContext$patient$source_pid;
  if (is.null(source_pid)) {
    source_pid <- "NULL";
  } else {
    source_pid <- paste0("'", as.character(source_pid), "'");
  }

  cdm_pid <- frameworkContext$patient$cdm_pid;
  if (is.null(cdm_pid)) {
    cdm_pid <- "NULL"
  }

  statement <- paste0("INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT ", frameworkContext$testId, " AS id, '", testName, "' AS description, 'Expect provider' AS test, ", source_pid, " as source_pid, ", cdm_pid, " as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.provider WHERE ")
  whereClauses = NULL;
  if (!missing(provider_id)) {
    if (is.null(provider_id)) {
      whereClauses <- c(whereClauses, "provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("provider_id = (", as.character(provider_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("provider_id = '", provider_id,"'"))
    }
  }

  if (!missing(provider_name)) {
    if (is.null(provider_name)) {
      whereClauses <- c(whereClauses, "provider_name IS NULL")
    } else if (is(provider_name, "subQuery")){
      whereClauses <- c(whereClauses, paste0("provider_name = (", as.character(provider_name), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("provider_name = '", provider_name,"'"))
    }
  }

  if (!missing(npi)) {
    if (is.null(npi)) {
      whereClauses <- c(whereClauses, "npi IS NULL")
    } else if (is(npi, "subQuery")){
      whereClauses <- c(whereClauses, paste0("npi = (", as.character(npi), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("npi = '", npi,"'"))
    }
  }

  if (!missing(dea)) {
    if (is.null(dea)) {
      whereClauses <- c(whereClauses, "dea IS NULL")
    } else if (is(dea, "subQuery")){
      whereClauses <- c(whereClauses, paste0("dea = (", as.character(dea), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("dea = '", dea,"'"))
    }
  }

  if (!missing(specialty_concept_id)) {
    if (is.null(specialty_concept_id)) {
      whereClauses <- c(whereClauses, "specialty_concept_id IS NULL")
    } else if (is(specialty_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("specialty_concept_id = (", as.character(specialty_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("specialty_concept_id = '", specialty_concept_id,"'"))
    }
  }

  if (!missing(care_site_id)) {
    if (is.null(care_site_id)) {
      whereClauses <- c(whereClauses, "care_site_id IS NULL")
    } else if (is(care_site_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("care_site_id = (", as.character(care_site_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("care_site_id = '", care_site_id,"'"))
    }
  }

  if (!missing(year_of_birth)) {
    if (is.null(year_of_birth)) {
      whereClauses <- c(whereClauses, "year_of_birth IS NULL")
    } else if (is(year_of_birth, "subQuery")){
      whereClauses <- c(whereClauses, paste0("year_of_birth = (", as.character(year_of_birth), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("year_of_birth = '", year_of_birth,"'"))
    }
  }

  if (!missing(gender_concept_id)) {
    if (is.null(gender_concept_id)) {
      whereClauses <- c(whereClauses, "gender_concept_id IS NULL")
    } else if (is(gender_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("gender_concept_id = (", as.character(gender_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("gender_concept_id = '", gender_concept_id,"'"))
    }
  }

  if (!missing(provider_source_value)) {
    if (is.null(provider_source_value)) {
      whereClauses <- c(whereClauses, "provider_source_value IS NULL")
    } else if (is(provider_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("provider_source_value = (", as.character(provider_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("provider_source_value = '", provider_source_value,"'"))
    }
  }

  if (!missing(specialty_source_value)) {
    if (is.null(specialty_source_value)) {
      whereClauses <- c(whereClauses, "specialty_source_value IS NULL")
    } else if (is(specialty_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("specialty_source_value = (", as.character(specialty_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("specialty_source_value = '", specialty_source_value,"'"))
    }
  }

  if (!missing(specialty_source_concept_id)) {
    if (is.null(specialty_source_concept_id)) {
      whereClauses <- c(whereClauses, "specialty_source_concept_id IS NULL")
    } else if (is(specialty_source_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("specialty_source_concept_id = (", as.character(specialty_source_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("specialty_source_concept_id = '", specialty_source_concept_id,"'"))
    }
  }

  if (!missing(gender_source_value)) {
    if (is.null(gender_source_value)) {
      whereClauses <- c(whereClauses, "gender_source_value IS NULL")
    } else if (is(gender_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("gender_source_value = (", as.character(gender_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("gender_source_value = '", gender_source_value,"'"))
    }
  }

  if (!missing(gender_source_concept_id)) {
    if (is.null(gender_source_concept_id)) {
      whereClauses <- c(whereClauses, "gender_source_concept_id IS NULL")
    } else if (is(gender_source_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("gender_source_concept_id = (", as.character(gender_source_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("gender_source_concept_id = '", gender_source_concept_id,"'"))
    }
  }

 statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

expect_no_condition_occurrence <- function(condition_occurrence_id, person_id, condition_concept_id, condition_start_date, condition_end_date, condition_type_concept_id, stop_reason, provider_id, visit_occurrence_id, condition_source_value, condition_source_concept_id) {

  if (is.null(frameworkContext$currentGroup)) {
    testName <- frameworkContext$testDescription;
  } else {
    testName <- paste0(frameworkContext$groupIndex, ".", frameworkContext$currentGroup$groupItemIndex, " ", frameworkContext$testDescription);
  }

  source_pid <- frameworkContext$patient$source_pid;
  if (is.null(source_pid)) {
    source_pid <- "NULL";
  } else {
    source_pid <- paste0("'", as.character(source_pid), "'");
  }

  cdm_pid <- frameworkContext$patient$cdm_pid;
  if (is.null(cdm_pid)) {
    cdm_pid <- "NULL"
  }

  statement <- paste0("INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT ", frameworkContext$testId, " AS id, '", testName, "' AS description, 'Expect condition_occurrence' AS test, ", source_pid, " as source_pid, ", cdm_pid, " as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.condition_occurrence WHERE ")
  whereClauses = NULL;
  if (!missing(condition_occurrence_id)) {
    if (is.null(condition_occurrence_id)) {
      whereClauses <- c(whereClauses, "condition_occurrence_id IS NULL")
    } else if (is(condition_occurrence_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("condition_occurrence_id = (", as.character(condition_occurrence_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("condition_occurrence_id = '", condition_occurrence_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(condition_concept_id)) {
    if (is.null(condition_concept_id)) {
      whereClauses <- c(whereClauses, "condition_concept_id IS NULL")
    } else if (is(condition_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("condition_concept_id = (", as.character(condition_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("condition_concept_id = '", condition_concept_id,"'"))
    }
  }

  if (!missing(condition_start_date)) {
    if (is.null(condition_start_date)) {
      whereClauses <- c(whereClauses, "condition_start_date IS NULL")
    } else if (is(condition_start_date, "subQuery")){
      whereClauses <- c(whereClauses, paste0("condition_start_date = (", as.character(condition_start_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("condition_start_date = '", condition_start_date,"'"))
    }
  }

  if (!missing(condition_end_date)) {
    if (is.null(condition_end_date)) {
      whereClauses <- c(whereClauses, "condition_end_date IS NULL")
    } else if (is(condition_end_date, "subQuery")){
      whereClauses <- c(whereClauses, paste0("condition_end_date = (", as.character(condition_end_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("condition_end_date = '", condition_end_date,"'"))
    }
  }

  if (!missing(condition_type_concept_id)) {
    if (is.null(condition_type_concept_id)) {
      whereClauses <- c(whereClauses, "condition_type_concept_id IS NULL")
    } else if (is(condition_type_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("condition_type_concept_id = (", as.character(condition_type_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("condition_type_concept_id = '", condition_type_concept_id,"'"))
    }
  }

  if (!missing(stop_reason)) {
    if (is.null(stop_reason)) {
      whereClauses <- c(whereClauses, "stop_reason IS NULL")
    } else if (is(stop_reason, "subQuery")){
      whereClauses <- c(whereClauses, paste0("stop_reason = (", as.character(stop_reason), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("stop_reason = '", stop_reason,"'"))
    }
  }

  if (!missing(provider_id)) {
    if (is.null(provider_id)) {
      whereClauses <- c(whereClauses, "provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("provider_id = (", as.character(provider_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("provider_id = '", provider_id,"'"))
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (is.null(visit_occurrence_id)) {
      whereClauses <- c(whereClauses, "visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("visit_occurrence_id = (", as.character(visit_occurrence_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_occurrence_id = '", visit_occurrence_id,"'"))
    }
  }

  if (!missing(condition_source_value)) {
    if (is.null(condition_source_value)) {
      whereClauses <- c(whereClauses, "condition_source_value IS NULL")
    } else if (is(condition_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("condition_source_value = (", as.character(condition_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("condition_source_value = '", condition_source_value,"'"))
    }
  }

  if (!missing(condition_source_concept_id)) {
    if (is.null(condition_source_concept_id)) {
      whereClauses <- c(whereClauses, "condition_source_concept_id IS NULL")
    } else if (is(condition_source_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("condition_source_concept_id = (", as.character(condition_source_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("condition_source_concept_id = '", condition_source_concept_id,"'"))
    }
  }

 statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

expect_no_death <- function(person_id, death_date, death_type_concept_id, cause_concept_id, cause_source_value, cause_source_concept_id) {

  if (is.null(frameworkContext$currentGroup)) {
    testName <- frameworkContext$testDescription;
  } else {
    testName <- paste0(frameworkContext$groupIndex, ".", frameworkContext$currentGroup$groupItemIndex, " ", frameworkContext$testDescription);
  }

  source_pid <- frameworkContext$patient$source_pid;
  if (is.null(source_pid)) {
    source_pid <- "NULL";
  } else {
    source_pid <- paste0("'", as.character(source_pid), "'");
  }

  cdm_pid <- frameworkContext$patient$cdm_pid;
  if (is.null(cdm_pid)) {
    cdm_pid <- "NULL"
  }

  statement <- paste0("INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT ", frameworkContext$testId, " AS id, '", testName, "' AS description, 'Expect death' AS test, ", source_pid, " as source_pid, ", cdm_pid, " as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.death WHERE ")
  whereClauses = NULL;
  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(death_date)) {
    if (is.null(death_date)) {
      whereClauses <- c(whereClauses, "death_date IS NULL")
    } else if (is(death_date, "subQuery")){
      whereClauses <- c(whereClauses, paste0("death_date = (", as.character(death_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("death_date = '", death_date,"'"))
    }
  }

  if (!missing(death_type_concept_id)) {
    if (is.null(death_type_concept_id)) {
      whereClauses <- c(whereClauses, "death_type_concept_id IS NULL")
    } else if (is(death_type_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("death_type_concept_id = (", as.character(death_type_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("death_type_concept_id = '", death_type_concept_id,"'"))
    }
  }

  if (!missing(cause_concept_id)) {
    if (is.null(cause_concept_id)) {
      whereClauses <- c(whereClauses, "cause_concept_id IS NULL")
    } else if (is(cause_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("cause_concept_id = (", as.character(cause_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cause_concept_id = '", cause_concept_id,"'"))
    }
  }

  if (!missing(cause_source_value)) {
    if (is.null(cause_source_value)) {
      whereClauses <- c(whereClauses, "cause_source_value IS NULL")
    } else if (is(cause_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("cause_source_value = (", as.character(cause_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cause_source_value = '", cause_source_value,"'"))
    }
  }

  if (!missing(cause_source_concept_id)) {
    if (is.null(cause_source_concept_id)) {
      whereClauses <- c(whereClauses, "cause_source_concept_id IS NULL")
    } else if (is(cause_source_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("cause_source_concept_id = (", as.character(cause_source_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cause_source_concept_id = '", cause_source_concept_id,"'"))
    }
  }

 statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

expect_no_drug_exposure <- function(drug_exposure_id, person_id, drug_concept_id, drug_exposure_start_date, drug_exposure_end_date, drug_type_concept_id, stop_reason, refills, quantity, days_supply, sig, route_concept_id, effective_drug_dose, dose_unit_concept_id, lot_number, provider_id, visit_occurrence_id, drug_source_value, drug_source_concept_id, route_source_value, dose_unit_source_value) {

  if (is.null(frameworkContext$currentGroup)) {
    testName <- frameworkContext$testDescription;
  } else {
    testName <- paste0(frameworkContext$groupIndex, ".", frameworkContext$currentGroup$groupItemIndex, " ", frameworkContext$testDescription);
  }

  source_pid <- frameworkContext$patient$source_pid;
  if (is.null(source_pid)) {
    source_pid <- "NULL";
  } else {
    source_pid <- paste0("'", as.character(source_pid), "'");
  }

  cdm_pid <- frameworkContext$patient$cdm_pid;
  if (is.null(cdm_pid)) {
    cdm_pid <- "NULL"
  }

  statement <- paste0("INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT ", frameworkContext$testId, " AS id, '", testName, "' AS description, 'Expect drug_exposure' AS test, ", source_pid, " as source_pid, ", cdm_pid, " as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.drug_exposure WHERE ")
  whereClauses = NULL;
  if (!missing(drug_exposure_id)) {
    if (is.null(drug_exposure_id)) {
      whereClauses <- c(whereClauses, "drug_exposure_id IS NULL")
    } else if (is(drug_exposure_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("drug_exposure_id = (", as.character(drug_exposure_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("drug_exposure_id = '", drug_exposure_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(drug_concept_id)) {
    if (is.null(drug_concept_id)) {
      whereClauses <- c(whereClauses, "drug_concept_id IS NULL")
    } else if (is(drug_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("drug_concept_id = (", as.character(drug_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("drug_concept_id = '", drug_concept_id,"'"))
    }
  }

  if (!missing(drug_exposure_start_date)) {
    if (is.null(drug_exposure_start_date)) {
      whereClauses <- c(whereClauses, "drug_exposure_start_date IS NULL")
    } else if (is(drug_exposure_start_date, "subQuery")){
      whereClauses <- c(whereClauses, paste0("drug_exposure_start_date = (", as.character(drug_exposure_start_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("drug_exposure_start_date = '", drug_exposure_start_date,"'"))
    }
  }

  if (!missing(drug_exposure_end_date)) {
    if (is.null(drug_exposure_end_date)) {
      whereClauses <- c(whereClauses, "drug_exposure_end_date IS NULL")
    } else if (is(drug_exposure_end_date, "subQuery")){
      whereClauses <- c(whereClauses, paste0("drug_exposure_end_date = (", as.character(drug_exposure_end_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("drug_exposure_end_date = '", drug_exposure_end_date,"'"))
    }
  }

  if (!missing(drug_type_concept_id)) {
    if (is.null(drug_type_concept_id)) {
      whereClauses <- c(whereClauses, "drug_type_concept_id IS NULL")
    } else if (is(drug_type_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("drug_type_concept_id = (", as.character(drug_type_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("drug_type_concept_id = '", drug_type_concept_id,"'"))
    }
  }

  if (!missing(stop_reason)) {
    if (is.null(stop_reason)) {
      whereClauses <- c(whereClauses, "stop_reason IS NULL")
    } else if (is(stop_reason, "subQuery")){
      whereClauses <- c(whereClauses, paste0("stop_reason = (", as.character(stop_reason), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("stop_reason = '", stop_reason,"'"))
    }
  }

  if (!missing(refills)) {
    if (is.null(refills)) {
      whereClauses <- c(whereClauses, "refills IS NULL")
    } else if (is(refills, "subQuery")){
      whereClauses <- c(whereClauses, paste0("refills = (", as.character(refills), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("refills = '", refills,"'"))
    }
  }

  if (!missing(quantity)) {
    if (is.null(quantity)) {
      whereClauses <- c(whereClauses, "quantity IS NULL")
    } else if (is(quantity, "subQuery")){
      whereClauses <- c(whereClauses, paste0("quantity = (", as.character(quantity), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("quantity = '", quantity,"'"))
    }
  }

  if (!missing(days_supply)) {
    if (is.null(days_supply)) {
      whereClauses <- c(whereClauses, "days_supply IS NULL")
    } else if (is(days_supply, "subQuery")){
      whereClauses <- c(whereClauses, paste0("days_supply = (", as.character(days_supply), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("days_supply = '", days_supply,"'"))
    }
  }

  if (!missing(sig)) {
    if (is.null(sig)) {
      whereClauses <- c(whereClauses, "sig IS NULL")
    } else if (is(sig, "subQuery")){
      whereClauses <- c(whereClauses, paste0("sig = (", as.character(sig), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("sig = '", sig,"'"))
    }
  }

  if (!missing(route_concept_id)) {
    if (is.null(route_concept_id)) {
      whereClauses <- c(whereClauses, "route_concept_id IS NULL")
    } else if (is(route_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("route_concept_id = (", as.character(route_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("route_concept_id = '", route_concept_id,"'"))
    }
  }

  if (!missing(effective_drug_dose)) {
    if (is.null(effective_drug_dose)) {
      whereClauses <- c(whereClauses, "effective_drug_dose IS NULL")
    } else if (is(effective_drug_dose, "subQuery")){
      whereClauses <- c(whereClauses, paste0("effective_drug_dose = (", as.character(effective_drug_dose), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("effective_drug_dose = '", effective_drug_dose,"'"))
    }
  }

  if (!missing(dose_unit_concept_id)) {
    if (is.null(dose_unit_concept_id)) {
      whereClauses <- c(whereClauses, "dose_unit_concept_id IS NULL")
    } else if (is(dose_unit_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("dose_unit_concept_id = (", as.character(dose_unit_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("dose_unit_concept_id = '", dose_unit_concept_id,"'"))
    }
  }

  if (!missing(lot_number)) {
    if (is.null(lot_number)) {
      whereClauses <- c(whereClauses, "lot_number IS NULL")
    } else if (is(lot_number, "subQuery")){
      whereClauses <- c(whereClauses, paste0("lot_number = (", as.character(lot_number), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("lot_number = '", lot_number,"'"))
    }
  }

  if (!missing(provider_id)) {
    if (is.null(provider_id)) {
      whereClauses <- c(whereClauses, "provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("provider_id = (", as.character(provider_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("provider_id = '", provider_id,"'"))
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (is.null(visit_occurrence_id)) {
      whereClauses <- c(whereClauses, "visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("visit_occurrence_id = (", as.character(visit_occurrence_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_occurrence_id = '", visit_occurrence_id,"'"))
    }
  }

  if (!missing(drug_source_value)) {
    if (is.null(drug_source_value)) {
      whereClauses <- c(whereClauses, "drug_source_value IS NULL")
    } else if (is(drug_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("drug_source_value = (", as.character(drug_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("drug_source_value = '", drug_source_value,"'"))
    }
  }

  if (!missing(drug_source_concept_id)) {
    if (is.null(drug_source_concept_id)) {
      whereClauses <- c(whereClauses, "drug_source_concept_id IS NULL")
    } else if (is(drug_source_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("drug_source_concept_id = (", as.character(drug_source_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("drug_source_concept_id = '", drug_source_concept_id,"'"))
    }
  }

  if (!missing(route_source_value)) {
    if (is.null(route_source_value)) {
      whereClauses <- c(whereClauses, "route_source_value IS NULL")
    } else if (is(route_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("route_source_value = (", as.character(route_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("route_source_value = '", route_source_value,"'"))
    }
  }

  if (!missing(dose_unit_source_value)) {
    if (is.null(dose_unit_source_value)) {
      whereClauses <- c(whereClauses, "dose_unit_source_value IS NULL")
    } else if (is(dose_unit_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("dose_unit_source_value = (", as.character(dose_unit_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("dose_unit_source_value = '", dose_unit_source_value,"'"))
    }
  }

 statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

expect_no_device_exposure <- function(device_exposure_id, person_id, device_concept_id, device_exposure_start_date, device_exposure_end_date, device_type_concept_id, unique_device_id, quantity, provider_id, visit_occurrence_id, device_source_value, device_source_concept_id) {

  if (is.null(frameworkContext$currentGroup)) {
    testName <- frameworkContext$testDescription;
  } else {
    testName <- paste0(frameworkContext$groupIndex, ".", frameworkContext$currentGroup$groupItemIndex, " ", frameworkContext$testDescription);
  }

  source_pid <- frameworkContext$patient$source_pid;
  if (is.null(source_pid)) {
    source_pid <- "NULL";
  } else {
    source_pid <- paste0("'", as.character(source_pid), "'");
  }

  cdm_pid <- frameworkContext$patient$cdm_pid;
  if (is.null(cdm_pid)) {
    cdm_pid <- "NULL"
  }

  statement <- paste0("INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT ", frameworkContext$testId, " AS id, '", testName, "' AS description, 'Expect device_exposure' AS test, ", source_pid, " as source_pid, ", cdm_pid, " as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.device_exposure WHERE ")
  whereClauses = NULL;
  if (!missing(device_exposure_id)) {
    if (is.null(device_exposure_id)) {
      whereClauses <- c(whereClauses, "device_exposure_id IS NULL")
    } else if (is(device_exposure_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("device_exposure_id = (", as.character(device_exposure_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("device_exposure_id = '", device_exposure_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(device_concept_id)) {
    if (is.null(device_concept_id)) {
      whereClauses <- c(whereClauses, "device_concept_id IS NULL")
    } else if (is(device_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("device_concept_id = (", as.character(device_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("device_concept_id = '", device_concept_id,"'"))
    }
  }

  if (!missing(device_exposure_start_date)) {
    if (is.null(device_exposure_start_date)) {
      whereClauses <- c(whereClauses, "device_exposure_start_date IS NULL")
    } else if (is(device_exposure_start_date, "subQuery")){
      whereClauses <- c(whereClauses, paste0("device_exposure_start_date = (", as.character(device_exposure_start_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("device_exposure_start_date = '", device_exposure_start_date,"'"))
    }
  }

  if (!missing(device_exposure_end_date)) {
    if (is.null(device_exposure_end_date)) {
      whereClauses <- c(whereClauses, "device_exposure_end_date IS NULL")
    } else if (is(device_exposure_end_date, "subQuery")){
      whereClauses <- c(whereClauses, paste0("device_exposure_end_date = (", as.character(device_exposure_end_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("device_exposure_end_date = '", device_exposure_end_date,"'"))
    }
  }

  if (!missing(device_type_concept_id)) {
    if (is.null(device_type_concept_id)) {
      whereClauses <- c(whereClauses, "device_type_concept_id IS NULL")
    } else if (is(device_type_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("device_type_concept_id = (", as.character(device_type_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("device_type_concept_id = '", device_type_concept_id,"'"))
    }
  }

  if (!missing(unique_device_id)) {
    if (is.null(unique_device_id)) {
      whereClauses <- c(whereClauses, "unique_device_id IS NULL")
    } else if (is(unique_device_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("unique_device_id = (", as.character(unique_device_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("unique_device_id = '", unique_device_id,"'"))
    }
  }

  if (!missing(quantity)) {
    if (is.null(quantity)) {
      whereClauses <- c(whereClauses, "quantity IS NULL")
    } else if (is(quantity, "subQuery")){
      whereClauses <- c(whereClauses, paste0("quantity = (", as.character(quantity), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("quantity = '", quantity,"'"))
    }
  }

  if (!missing(provider_id)) {
    if (is.null(provider_id)) {
      whereClauses <- c(whereClauses, "provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("provider_id = (", as.character(provider_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("provider_id = '", provider_id,"'"))
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (is.null(visit_occurrence_id)) {
      whereClauses <- c(whereClauses, "visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("visit_occurrence_id = (", as.character(visit_occurrence_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_occurrence_id = '", visit_occurrence_id,"'"))
    }
  }

  if (!missing(device_source_value)) {
    if (is.null(device_source_value)) {
      whereClauses <- c(whereClauses, "device_source_value IS NULL")
    } else if (is(device_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("device_source_value = (", as.character(device_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("device_source_value = '", device_source_value,"'"))
    }
  }

  if (!missing(device_source_concept_id)) {
    if (is.null(device_source_concept_id)) {
      whereClauses <- c(whereClauses, "device_source_concept_id IS NULL")
    } else if (is(device_source_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("device_source_concept_id = (", as.character(device_source_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("device_source_concept_id = '", device_source_concept_id,"'"))
    }
  }

 statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

expect_no_procedure_occurrence <- function(procedure_occurrence_id, person_id, procedure_concept_id, procedure_date, procedure_type_concept_id, modifier_concept_id, quantity, provider_id, visit_occurrence_id, procedure_source_value, procedure_source_concept_id, qualifier_source_value) {

  if (is.null(frameworkContext$currentGroup)) {
    testName <- frameworkContext$testDescription;
  } else {
    testName <- paste0(frameworkContext$groupIndex, ".", frameworkContext$currentGroup$groupItemIndex, " ", frameworkContext$testDescription);
  }

  source_pid <- frameworkContext$patient$source_pid;
  if (is.null(source_pid)) {
    source_pid <- "NULL";
  } else {
    source_pid <- paste0("'", as.character(source_pid), "'");
  }

  cdm_pid <- frameworkContext$patient$cdm_pid;
  if (is.null(cdm_pid)) {
    cdm_pid <- "NULL"
  }

  statement <- paste0("INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT ", frameworkContext$testId, " AS id, '", testName, "' AS description, 'Expect procedure_occurrence' AS test, ", source_pid, " as source_pid, ", cdm_pid, " as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.procedure_occurrence WHERE ")
  whereClauses = NULL;
  if (!missing(procedure_occurrence_id)) {
    if (is.null(procedure_occurrence_id)) {
      whereClauses <- c(whereClauses, "procedure_occurrence_id IS NULL")
    } else if (is(procedure_occurrence_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("procedure_occurrence_id = (", as.character(procedure_occurrence_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("procedure_occurrence_id = '", procedure_occurrence_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(procedure_concept_id)) {
    if (is.null(procedure_concept_id)) {
      whereClauses <- c(whereClauses, "procedure_concept_id IS NULL")
    } else if (is(procedure_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("procedure_concept_id = (", as.character(procedure_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("procedure_concept_id = '", procedure_concept_id,"'"))
    }
  }

  if (!missing(procedure_date)) {
    if (is.null(procedure_date)) {
      whereClauses <- c(whereClauses, "procedure_date IS NULL")
    } else if (is(procedure_date, "subQuery")){
      whereClauses <- c(whereClauses, paste0("procedure_date = (", as.character(procedure_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("procedure_date = '", procedure_date,"'"))
    }
  }

  if (!missing(procedure_type_concept_id)) {
    if (is.null(procedure_type_concept_id)) {
      whereClauses <- c(whereClauses, "procedure_type_concept_id IS NULL")
    } else if (is(procedure_type_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("procedure_type_concept_id = (", as.character(procedure_type_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("procedure_type_concept_id = '", procedure_type_concept_id,"'"))
    }
  }

  if (!missing(modifier_concept_id)) {
    if (is.null(modifier_concept_id)) {
      whereClauses <- c(whereClauses, "modifier_concept_id IS NULL")
    } else if (is(modifier_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("modifier_concept_id = (", as.character(modifier_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("modifier_concept_id = '", modifier_concept_id,"'"))
    }
  }

  if (!missing(quantity)) {
    if (is.null(quantity)) {
      whereClauses <- c(whereClauses, "quantity IS NULL")
    } else if (is(quantity, "subQuery")){
      whereClauses <- c(whereClauses, paste0("quantity = (", as.character(quantity), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("quantity = '", quantity,"'"))
    }
  }

  if (!missing(provider_id)) {
    if (is.null(provider_id)) {
      whereClauses <- c(whereClauses, "provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("provider_id = (", as.character(provider_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("provider_id = '", provider_id,"'"))
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (is.null(visit_occurrence_id)) {
      whereClauses <- c(whereClauses, "visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("visit_occurrence_id = (", as.character(visit_occurrence_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_occurrence_id = '", visit_occurrence_id,"'"))
    }
  }

  if (!missing(procedure_source_value)) {
    if (is.null(procedure_source_value)) {
      whereClauses <- c(whereClauses, "procedure_source_value IS NULL")
    } else if (is(procedure_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("procedure_source_value = (", as.character(procedure_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("procedure_source_value = '", procedure_source_value,"'"))
    }
  }

  if (!missing(procedure_source_concept_id)) {
    if (is.null(procedure_source_concept_id)) {
      whereClauses <- c(whereClauses, "procedure_source_concept_id IS NULL")
    } else if (is(procedure_source_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("procedure_source_concept_id = (", as.character(procedure_source_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("procedure_source_concept_id = '", procedure_source_concept_id,"'"))
    }
  }

  if (!missing(qualifier_source_value)) {
    if (is.null(qualifier_source_value)) {
      whereClauses <- c(whereClauses, "qualifier_source_value IS NULL")
    } else if (is(qualifier_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("qualifier_source_value = (", as.character(qualifier_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("qualifier_source_value = '", qualifier_source_value,"'"))
    }
  }

 statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

expect_no_measurement <- function(measurement_id, person_id, measurement_concept_id, measurement_date, measurement_time, measurement_type_concept_id, operator_concept_id, value_as_number, value_as_concept_id, unit_concept_id, range_low, range_high, provider_id, visit_occurrence_id, measurement_source_value, measurement_source_concept_id, unit_source_value, value_source_value) {

  if (is.null(frameworkContext$currentGroup)) {
    testName <- frameworkContext$testDescription;
  } else {
    testName <- paste0(frameworkContext$groupIndex, ".", frameworkContext$currentGroup$groupItemIndex, " ", frameworkContext$testDescription);
  }

  source_pid <- frameworkContext$patient$source_pid;
  if (is.null(source_pid)) {
    source_pid <- "NULL";
  } else {
    source_pid <- paste0("'", as.character(source_pid), "'");
  }

  cdm_pid <- frameworkContext$patient$cdm_pid;
  if (is.null(cdm_pid)) {
    cdm_pid <- "NULL"
  }

  statement <- paste0("INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT ", frameworkContext$testId, " AS id, '", testName, "' AS description, 'Expect measurement' AS test, ", source_pid, " as source_pid, ", cdm_pid, " as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.measurement WHERE ")
  whereClauses = NULL;
  if (!missing(measurement_id)) {
    if (is.null(measurement_id)) {
      whereClauses <- c(whereClauses, "measurement_id IS NULL")
    } else if (is(measurement_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("measurement_id = (", as.character(measurement_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("measurement_id = '", measurement_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(measurement_concept_id)) {
    if (is.null(measurement_concept_id)) {
      whereClauses <- c(whereClauses, "measurement_concept_id IS NULL")
    } else if (is(measurement_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("measurement_concept_id = (", as.character(measurement_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("measurement_concept_id = '", measurement_concept_id,"'"))
    }
  }

  if (!missing(measurement_date)) {
    if (is.null(measurement_date)) {
      whereClauses <- c(whereClauses, "measurement_date IS NULL")
    } else if (is(measurement_date, "subQuery")){
      whereClauses <- c(whereClauses, paste0("measurement_date = (", as.character(measurement_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("measurement_date = '", measurement_date,"'"))
    }
  }

  if (!missing(measurement_time)) {
    if (is.null(measurement_time)) {
      whereClauses <- c(whereClauses, "measurement_time IS NULL")
    } else if (is(measurement_time, "subQuery")){
      whereClauses <- c(whereClauses, paste0("measurement_time = (", as.character(measurement_time), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("measurement_time = '", measurement_time,"'"))
    }
  }

  if (!missing(measurement_type_concept_id)) {
    if (is.null(measurement_type_concept_id)) {
      whereClauses <- c(whereClauses, "measurement_type_concept_id IS NULL")
    } else if (is(measurement_type_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("measurement_type_concept_id = (", as.character(measurement_type_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("measurement_type_concept_id = '", measurement_type_concept_id,"'"))
    }
  }

  if (!missing(operator_concept_id)) {
    if (is.null(operator_concept_id)) {
      whereClauses <- c(whereClauses, "operator_concept_id IS NULL")
    } else if (is(operator_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("operator_concept_id = (", as.character(operator_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("operator_concept_id = '", operator_concept_id,"'"))
    }
  }

  if (!missing(value_as_number)) {
    if (is.null(value_as_number)) {
      whereClauses <- c(whereClauses, "value_as_number IS NULL")
    } else if (is(value_as_number, "subQuery")){
      whereClauses <- c(whereClauses, paste0("value_as_number = (", as.character(value_as_number), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("value_as_number = '", value_as_number,"'"))
    }
  }

  if (!missing(value_as_concept_id)) {
    if (is.null(value_as_concept_id)) {
      whereClauses <- c(whereClauses, "value_as_concept_id IS NULL")
    } else if (is(value_as_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("value_as_concept_id = (", as.character(value_as_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("value_as_concept_id = '", value_as_concept_id,"'"))
    }
  }

  if (!missing(unit_concept_id)) {
    if (is.null(unit_concept_id)) {
      whereClauses <- c(whereClauses, "unit_concept_id IS NULL")
    } else if (is(unit_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("unit_concept_id = (", as.character(unit_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("unit_concept_id = '", unit_concept_id,"'"))
    }
  }

  if (!missing(range_low)) {
    if (is.null(range_low)) {
      whereClauses <- c(whereClauses, "range_low IS NULL")
    } else if (is(range_low, "subQuery")){
      whereClauses <- c(whereClauses, paste0("range_low = (", as.character(range_low), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("range_low = '", range_low,"'"))
    }
  }

  if (!missing(range_high)) {
    if (is.null(range_high)) {
      whereClauses <- c(whereClauses, "range_high IS NULL")
    } else if (is(range_high, "subQuery")){
      whereClauses <- c(whereClauses, paste0("range_high = (", as.character(range_high), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("range_high = '", range_high,"'"))
    }
  }

  if (!missing(provider_id)) {
    if (is.null(provider_id)) {
      whereClauses <- c(whereClauses, "provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("provider_id = (", as.character(provider_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("provider_id = '", provider_id,"'"))
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (is.null(visit_occurrence_id)) {
      whereClauses <- c(whereClauses, "visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("visit_occurrence_id = (", as.character(visit_occurrence_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_occurrence_id = '", visit_occurrence_id,"'"))
    }
  }

  if (!missing(measurement_source_value)) {
    if (is.null(measurement_source_value)) {
      whereClauses <- c(whereClauses, "measurement_source_value IS NULL")
    } else if (is(measurement_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("measurement_source_value = (", as.character(measurement_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("measurement_source_value = '", measurement_source_value,"'"))
    }
  }

  if (!missing(measurement_source_concept_id)) {
    if (is.null(measurement_source_concept_id)) {
      whereClauses <- c(whereClauses, "measurement_source_concept_id IS NULL")
    } else if (is(measurement_source_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("measurement_source_concept_id = (", as.character(measurement_source_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("measurement_source_concept_id = '", measurement_source_concept_id,"'"))
    }
  }

  if (!missing(unit_source_value)) {
    if (is.null(unit_source_value)) {
      whereClauses <- c(whereClauses, "unit_source_value IS NULL")
    } else if (is(unit_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("unit_source_value = (", as.character(unit_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("unit_source_value = '", unit_source_value,"'"))
    }
  }

  if (!missing(value_source_value)) {
    if (is.null(value_source_value)) {
      whereClauses <- c(whereClauses, "value_source_value IS NULL")
    } else if (is(value_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("value_source_value = (", as.character(value_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("value_source_value = '", value_source_value,"'"))
    }
  }

 statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

expect_no_observation <- function(observation_id, person_id, observation_concept_id, observation_date, observation_time, observation_type_concept_id, value_as_number, value_as_string, value_as_concept_id, qualifier_concept_id, unit_concept_id, provider_id, visit_occurrence_id, observation_source_value, observation_source_concept_id, unit_source_value, qualifier_source_value) {

  if (is.null(frameworkContext$currentGroup)) {
    testName <- frameworkContext$testDescription;
  } else {
    testName <- paste0(frameworkContext$groupIndex, ".", frameworkContext$currentGroup$groupItemIndex, " ", frameworkContext$testDescription);
  }

  source_pid <- frameworkContext$patient$source_pid;
  if (is.null(source_pid)) {
    source_pid <- "NULL";
  } else {
    source_pid <- paste0("'", as.character(source_pid), "'");
  }

  cdm_pid <- frameworkContext$patient$cdm_pid;
  if (is.null(cdm_pid)) {
    cdm_pid <- "NULL"
  }

  statement <- paste0("INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT ", frameworkContext$testId, " AS id, '", testName, "' AS description, 'Expect observation' AS test, ", source_pid, " as source_pid, ", cdm_pid, " as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.observation WHERE ")
  whereClauses = NULL;
  if (!missing(observation_id)) {
    if (is.null(observation_id)) {
      whereClauses <- c(whereClauses, "observation_id IS NULL")
    } else if (is(observation_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("observation_id = (", as.character(observation_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("observation_id = '", observation_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(observation_concept_id)) {
    if (is.null(observation_concept_id)) {
      whereClauses <- c(whereClauses, "observation_concept_id IS NULL")
    } else if (is(observation_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("observation_concept_id = (", as.character(observation_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("observation_concept_id = '", observation_concept_id,"'"))
    }
  }

  if (!missing(observation_date)) {
    if (is.null(observation_date)) {
      whereClauses <- c(whereClauses, "observation_date IS NULL")
    } else if (is(observation_date, "subQuery")){
      whereClauses <- c(whereClauses, paste0("observation_date = (", as.character(observation_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("observation_date = '", observation_date,"'"))
    }
  }

  if (!missing(observation_time)) {
    if (is.null(observation_time)) {
      whereClauses <- c(whereClauses, "observation_time IS NULL")
    } else if (is(observation_time, "subQuery")){
      whereClauses <- c(whereClauses, paste0("observation_time = (", as.character(observation_time), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("observation_time = '", observation_time,"'"))
    }
  }

  if (!missing(observation_type_concept_id)) {
    if (is.null(observation_type_concept_id)) {
      whereClauses <- c(whereClauses, "observation_type_concept_id IS NULL")
    } else if (is(observation_type_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("observation_type_concept_id = (", as.character(observation_type_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("observation_type_concept_id = '", observation_type_concept_id,"'"))
    }
  }

  if (!missing(value_as_number)) {
    if (is.null(value_as_number)) {
      whereClauses <- c(whereClauses, "value_as_number IS NULL")
    } else if (is(value_as_number, "subQuery")){
      whereClauses <- c(whereClauses, paste0("value_as_number = (", as.character(value_as_number), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("value_as_number = '", value_as_number,"'"))
    }
  }

  if (!missing(value_as_string)) {
    if (is.null(value_as_string)) {
      whereClauses <- c(whereClauses, "value_as_string IS NULL")
    } else if (is(value_as_string, "subQuery")){
      whereClauses <- c(whereClauses, paste0("value_as_string = (", as.character(value_as_string), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("value_as_string = '", value_as_string,"'"))
    }
  }

  if (!missing(value_as_concept_id)) {
    if (is.null(value_as_concept_id)) {
      whereClauses <- c(whereClauses, "value_as_concept_id IS NULL")
    } else if (is(value_as_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("value_as_concept_id = (", as.character(value_as_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("value_as_concept_id = '", value_as_concept_id,"'"))
    }
  }

  if (!missing(qualifier_concept_id)) {
    if (is.null(qualifier_concept_id)) {
      whereClauses <- c(whereClauses, "qualifier_concept_id IS NULL")
    } else if (is(qualifier_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("qualifier_concept_id = (", as.character(qualifier_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("qualifier_concept_id = '", qualifier_concept_id,"'"))
    }
  }

  if (!missing(unit_concept_id)) {
    if (is.null(unit_concept_id)) {
      whereClauses <- c(whereClauses, "unit_concept_id IS NULL")
    } else if (is(unit_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("unit_concept_id = (", as.character(unit_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("unit_concept_id = '", unit_concept_id,"'"))
    }
  }

  if (!missing(provider_id)) {
    if (is.null(provider_id)) {
      whereClauses <- c(whereClauses, "provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("provider_id = (", as.character(provider_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("provider_id = '", provider_id,"'"))
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (is.null(visit_occurrence_id)) {
      whereClauses <- c(whereClauses, "visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("visit_occurrence_id = (", as.character(visit_occurrence_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_occurrence_id = '", visit_occurrence_id,"'"))
    }
  }

  if (!missing(observation_source_value)) {
    if (is.null(observation_source_value)) {
      whereClauses <- c(whereClauses, "observation_source_value IS NULL")
    } else if (is(observation_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("observation_source_value = (", as.character(observation_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("observation_source_value = '", observation_source_value,"'"))
    }
  }

  if (!missing(observation_source_concept_id)) {
    if (is.null(observation_source_concept_id)) {
      whereClauses <- c(whereClauses, "observation_source_concept_id IS NULL")
    } else if (is(observation_source_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("observation_source_concept_id = (", as.character(observation_source_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("observation_source_concept_id = '", observation_source_concept_id,"'"))
    }
  }

  if (!missing(unit_source_value)) {
    if (is.null(unit_source_value)) {
      whereClauses <- c(whereClauses, "unit_source_value IS NULL")
    } else if (is(unit_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("unit_source_value = (", as.character(unit_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("unit_source_value = '", unit_source_value,"'"))
    }
  }

  if (!missing(qualifier_source_value)) {
    if (is.null(qualifier_source_value)) {
      whereClauses <- c(whereClauses, "qualifier_source_value IS NULL")
    } else if (is(qualifier_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("qualifier_source_value = (", as.character(qualifier_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("qualifier_source_value = '", qualifier_source_value,"'"))
    }
  }

 statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

expect_no_note <- function(note_id, person_id, note_date, note_time, note_type_concept_id, note_text, provider_id, visit_occurrence_id, note_source_value) {

  if (is.null(frameworkContext$currentGroup)) {
    testName <- frameworkContext$testDescription;
  } else {
    testName <- paste0(frameworkContext$groupIndex, ".", frameworkContext$currentGroup$groupItemIndex, " ", frameworkContext$testDescription);
  }

  source_pid <- frameworkContext$patient$source_pid;
  if (is.null(source_pid)) {
    source_pid <- "NULL";
  } else {
    source_pid <- paste0("'", as.character(source_pid), "'");
  }

  cdm_pid <- frameworkContext$patient$cdm_pid;
  if (is.null(cdm_pid)) {
    cdm_pid <- "NULL"
  }

  statement <- paste0("INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT ", frameworkContext$testId, " AS id, '", testName, "' AS description, 'Expect note' AS test, ", source_pid, " as source_pid, ", cdm_pid, " as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.note WHERE ")
  whereClauses = NULL;
  if (!missing(note_id)) {
    if (is.null(note_id)) {
      whereClauses <- c(whereClauses, "note_id IS NULL")
    } else if (is(note_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("note_id = (", as.character(note_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("note_id = '", note_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(note_date)) {
    if (is.null(note_date)) {
      whereClauses <- c(whereClauses, "note_date IS NULL")
    } else if (is(note_date, "subQuery")){
      whereClauses <- c(whereClauses, paste0("note_date = (", as.character(note_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("note_date = '", note_date,"'"))
    }
  }

  if (!missing(note_time)) {
    if (is.null(note_time)) {
      whereClauses <- c(whereClauses, "note_time IS NULL")
    } else if (is(note_time, "subQuery")){
      whereClauses <- c(whereClauses, paste0("note_time = (", as.character(note_time), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("note_time = '", note_time,"'"))
    }
  }

  if (!missing(note_type_concept_id)) {
    if (is.null(note_type_concept_id)) {
      whereClauses <- c(whereClauses, "note_type_concept_id IS NULL")
    } else if (is(note_type_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("note_type_concept_id = (", as.character(note_type_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("note_type_concept_id = '", note_type_concept_id,"'"))
    }
  }

  if (!missing(note_text)) {
    if (is.null(note_text)) {
      whereClauses <- c(whereClauses, "note_text IS NULL")
    } else if (is(note_text, "subQuery")){
      whereClauses <- c(whereClauses, paste0("note_text = (", as.character(note_text), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("note_text = '", note_text,"'"))
    }
  }

  if (!missing(provider_id)) {
    if (is.null(provider_id)) {
      whereClauses <- c(whereClauses, "provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("provider_id = (", as.character(provider_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("provider_id = '", provider_id,"'"))
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (is.null(visit_occurrence_id)) {
      whereClauses <- c(whereClauses, "visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("visit_occurrence_id = (", as.character(visit_occurrence_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_occurrence_id = '", visit_occurrence_id,"'"))
    }
  }

  if (!missing(note_source_value)) {
    if (is.null(note_source_value)) {
      whereClauses <- c(whereClauses, "note_source_value IS NULL")
    } else if (is(note_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("note_source_value = (", as.character(note_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("note_source_value = '", note_source_value,"'"))
    }
  }

 statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

expect_no_specimen <- function(specimen_id, person_id, specimen_concept_id, specimen_type_concept_id, specimen_date, specimen_time, quantity, unit_concept_id, anatomic_site_concept_id, disease_status_concept_id, specimen_source_id, specimen_source_value, unit_source_value, anatomic_site_source_value, disease_status_source_value) {

  if (is.null(frameworkContext$currentGroup)) {
    testName <- frameworkContext$testDescription;
  } else {
    testName <- paste0(frameworkContext$groupIndex, ".", frameworkContext$currentGroup$groupItemIndex, " ", frameworkContext$testDescription);
  }

  source_pid <- frameworkContext$patient$source_pid;
  if (is.null(source_pid)) {
    source_pid <- "NULL";
  } else {
    source_pid <- paste0("'", as.character(source_pid), "'");
  }

  cdm_pid <- frameworkContext$patient$cdm_pid;
  if (is.null(cdm_pid)) {
    cdm_pid <- "NULL"
  }

  statement <- paste0("INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT ", frameworkContext$testId, " AS id, '", testName, "' AS description, 'Expect specimen' AS test, ", source_pid, " as source_pid, ", cdm_pid, " as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.specimen WHERE ")
  whereClauses = NULL;
  if (!missing(specimen_id)) {
    if (is.null(specimen_id)) {
      whereClauses <- c(whereClauses, "specimen_id IS NULL")
    } else if (is(specimen_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("specimen_id = (", as.character(specimen_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("specimen_id = '", specimen_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(specimen_concept_id)) {
    if (is.null(specimen_concept_id)) {
      whereClauses <- c(whereClauses, "specimen_concept_id IS NULL")
    } else if (is(specimen_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("specimen_concept_id = (", as.character(specimen_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("specimen_concept_id = '", specimen_concept_id,"'"))
    }
  }

  if (!missing(specimen_type_concept_id)) {
    if (is.null(specimen_type_concept_id)) {
      whereClauses <- c(whereClauses, "specimen_type_concept_id IS NULL")
    } else if (is(specimen_type_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("specimen_type_concept_id = (", as.character(specimen_type_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("specimen_type_concept_id = '", specimen_type_concept_id,"'"))
    }
  }

  if (!missing(specimen_date)) {
    if (is.null(specimen_date)) {
      whereClauses <- c(whereClauses, "specimen_date IS NULL")
    } else if (is(specimen_date, "subQuery")){
      whereClauses <- c(whereClauses, paste0("specimen_date = (", as.character(specimen_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("specimen_date = '", specimen_date,"'"))
    }
  }

  if (!missing(specimen_time)) {
    if (is.null(specimen_time)) {
      whereClauses <- c(whereClauses, "specimen_time IS NULL")
    } else if (is(specimen_time, "subQuery")){
      whereClauses <- c(whereClauses, paste0("specimen_time = (", as.character(specimen_time), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("specimen_time = '", specimen_time,"'"))
    }
  }

  if (!missing(quantity)) {
    if (is.null(quantity)) {
      whereClauses <- c(whereClauses, "quantity IS NULL")
    } else if (is(quantity, "subQuery")){
      whereClauses <- c(whereClauses, paste0("quantity = (", as.character(quantity), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("quantity = '", quantity,"'"))
    }
  }

  if (!missing(unit_concept_id)) {
    if (is.null(unit_concept_id)) {
      whereClauses <- c(whereClauses, "unit_concept_id IS NULL")
    } else if (is(unit_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("unit_concept_id = (", as.character(unit_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("unit_concept_id = '", unit_concept_id,"'"))
    }
  }

  if (!missing(anatomic_site_concept_id)) {
    if (is.null(anatomic_site_concept_id)) {
      whereClauses <- c(whereClauses, "anatomic_site_concept_id IS NULL")
    } else if (is(anatomic_site_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("anatomic_site_concept_id = (", as.character(anatomic_site_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("anatomic_site_concept_id = '", anatomic_site_concept_id,"'"))
    }
  }

  if (!missing(disease_status_concept_id)) {
    if (is.null(disease_status_concept_id)) {
      whereClauses <- c(whereClauses, "disease_status_concept_id IS NULL")
    } else if (is(disease_status_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("disease_status_concept_id = (", as.character(disease_status_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("disease_status_concept_id = '", disease_status_concept_id,"'"))
    }
  }

  if (!missing(specimen_source_id)) {
    if (is.null(specimen_source_id)) {
      whereClauses <- c(whereClauses, "specimen_source_id IS NULL")
    } else if (is(specimen_source_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("specimen_source_id = (", as.character(specimen_source_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("specimen_source_id = '", specimen_source_id,"'"))
    }
  }

  if (!missing(specimen_source_value)) {
    if (is.null(specimen_source_value)) {
      whereClauses <- c(whereClauses, "specimen_source_value IS NULL")
    } else if (is(specimen_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("specimen_source_value = (", as.character(specimen_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("specimen_source_value = '", specimen_source_value,"'"))
    }
  }

  if (!missing(unit_source_value)) {
    if (is.null(unit_source_value)) {
      whereClauses <- c(whereClauses, "unit_source_value IS NULL")
    } else if (is(unit_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("unit_source_value = (", as.character(unit_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("unit_source_value = '", unit_source_value,"'"))
    }
  }

  if (!missing(anatomic_site_source_value)) {
    if (is.null(anatomic_site_source_value)) {
      whereClauses <- c(whereClauses, "anatomic_site_source_value IS NULL")
    } else if (is(anatomic_site_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("anatomic_site_source_value = (", as.character(anatomic_site_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("anatomic_site_source_value = '", anatomic_site_source_value,"'"))
    }
  }

  if (!missing(disease_status_source_value)) {
    if (is.null(disease_status_source_value)) {
      whereClauses <- c(whereClauses, "disease_status_source_value IS NULL")
    } else if (is(disease_status_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("disease_status_source_value = (", as.character(disease_status_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("disease_status_source_value = '", disease_status_source_value,"'"))
    }
  }

 statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

expect_no_fact_relationship <- function(domain_concept_id_1, fact_id_1, domain_concept_id_2, fact_id_2, relationship_concept_id) {

  if (is.null(frameworkContext$currentGroup)) {
    testName <- frameworkContext$testDescription;
  } else {
    testName <- paste0(frameworkContext$groupIndex, ".", frameworkContext$currentGroup$groupItemIndex, " ", frameworkContext$testDescription);
  }

  source_pid <- frameworkContext$patient$source_pid;
  if (is.null(source_pid)) {
    source_pid <- "NULL";
  } else {
    source_pid <- paste0("'", as.character(source_pid), "'");
  }

  cdm_pid <- frameworkContext$patient$cdm_pid;
  if (is.null(cdm_pid)) {
    cdm_pid <- "NULL"
  }

  statement <- paste0("INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT ", frameworkContext$testId, " AS id, '", testName, "' AS description, 'Expect fact_relationship' AS test, ", source_pid, " as source_pid, ", cdm_pid, " as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.fact_relationship WHERE ")
  whereClauses = NULL;
  if (!missing(domain_concept_id_1)) {
    if (is.null(domain_concept_id_1)) {
      whereClauses <- c(whereClauses, "domain_concept_id_1 IS NULL")
    } else if (is(domain_concept_id_1, "subQuery")){
      whereClauses <- c(whereClauses, paste0("domain_concept_id_1 = (", as.character(domain_concept_id_1), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("domain_concept_id_1 = '", domain_concept_id_1,"'"))
    }
  }

  if (!missing(fact_id_1)) {
    if (is.null(fact_id_1)) {
      whereClauses <- c(whereClauses, "fact_id_1 IS NULL")
    } else if (is(fact_id_1, "subQuery")){
      whereClauses <- c(whereClauses, paste0("fact_id_1 = (", as.character(fact_id_1), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("fact_id_1 = '", fact_id_1,"'"))
    }
  }

  if (!missing(domain_concept_id_2)) {
    if (is.null(domain_concept_id_2)) {
      whereClauses <- c(whereClauses, "domain_concept_id_2 IS NULL")
    } else if (is(domain_concept_id_2, "subQuery")){
      whereClauses <- c(whereClauses, paste0("domain_concept_id_2 = (", as.character(domain_concept_id_2), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("domain_concept_id_2 = '", domain_concept_id_2,"'"))
    }
  }

  if (!missing(fact_id_2)) {
    if (is.null(fact_id_2)) {
      whereClauses <- c(whereClauses, "fact_id_2 IS NULL")
    } else if (is(fact_id_2, "subQuery")){
      whereClauses <- c(whereClauses, paste0("fact_id_2 = (", as.character(fact_id_2), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("fact_id_2 = '", fact_id_2,"'"))
    }
  }

  if (!missing(relationship_concept_id)) {
    if (is.null(relationship_concept_id)) {
      whereClauses <- c(whereClauses, "relationship_concept_id IS NULL")
    } else if (is(relationship_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("relationship_concept_id = (", as.character(relationship_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("relationship_concept_id = '", relationship_concept_id,"'"))
    }
  }

 statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

expect_no_payer_plan_period <- function(payer_plan_period_id, person_id, payer_plan_period_start_date, payer_plan_period_end_date, payer_source_value, plan_source_value, family_source_value) {

  if (is.null(frameworkContext$currentGroup)) {
    testName <- frameworkContext$testDescription;
  } else {
    testName <- paste0(frameworkContext$groupIndex, ".", frameworkContext$currentGroup$groupItemIndex, " ", frameworkContext$testDescription);
  }

  source_pid <- frameworkContext$patient$source_pid;
  if (is.null(source_pid)) {
    source_pid <- "NULL";
  } else {
    source_pid <- paste0("'", as.character(source_pid), "'");
  }

  cdm_pid <- frameworkContext$patient$cdm_pid;
  if (is.null(cdm_pid)) {
    cdm_pid <- "NULL"
  }

  statement <- paste0("INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT ", frameworkContext$testId, " AS id, '", testName, "' AS description, 'Expect payer_plan_period' AS test, ", source_pid, " as source_pid, ", cdm_pid, " as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.payer_plan_period WHERE ")
  whereClauses = NULL;
  if (!missing(payer_plan_period_id)) {
    if (is.null(payer_plan_period_id)) {
      whereClauses <- c(whereClauses, "payer_plan_period_id IS NULL")
    } else if (is(payer_plan_period_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("payer_plan_period_id = (", as.character(payer_plan_period_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("payer_plan_period_id = '", payer_plan_period_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(payer_plan_period_start_date)) {
    if (is.null(payer_plan_period_start_date)) {
      whereClauses <- c(whereClauses, "payer_plan_period_start_date IS NULL")
    } else if (is(payer_plan_period_start_date, "subQuery")){
      whereClauses <- c(whereClauses, paste0("payer_plan_period_start_date = (", as.character(payer_plan_period_start_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("payer_plan_period_start_date = '", payer_plan_period_start_date,"'"))
    }
  }

  if (!missing(payer_plan_period_end_date)) {
    if (is.null(payer_plan_period_end_date)) {
      whereClauses <- c(whereClauses, "payer_plan_period_end_date IS NULL")
    } else if (is(payer_plan_period_end_date, "subQuery")){
      whereClauses <- c(whereClauses, paste0("payer_plan_period_end_date = (", as.character(payer_plan_period_end_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("payer_plan_period_end_date = '", payer_plan_period_end_date,"'"))
    }
  }

  if (!missing(payer_source_value)) {
    if (is.null(payer_source_value)) {
      whereClauses <- c(whereClauses, "payer_source_value IS NULL")
    } else if (is(payer_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("payer_source_value = (", as.character(payer_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("payer_source_value = '", payer_source_value,"'"))
    }
  }

  if (!missing(plan_source_value)) {
    if (is.null(plan_source_value)) {
      whereClauses <- c(whereClauses, "plan_source_value IS NULL")
    } else if (is(plan_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("plan_source_value = (", as.character(plan_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("plan_source_value = '", plan_source_value,"'"))
    }
  }

  if (!missing(family_source_value)) {
    if (is.null(family_source_value)) {
      whereClauses <- c(whereClauses, "family_source_value IS NULL")
    } else if (is(family_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("family_source_value = (", as.character(family_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("family_source_value = '", family_source_value,"'"))
    }
  }

 statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

expect_no_drug_era <- function(drug_era_id, person_id, drug_concept_id, drug_era_start_date, drug_era_end_date, drug_exposure_count, gap_days) {

  if (is.null(frameworkContext$currentGroup)) {
    testName <- frameworkContext$testDescription;
  } else {
    testName <- paste0(frameworkContext$groupIndex, ".", frameworkContext$currentGroup$groupItemIndex, " ", frameworkContext$testDescription);
  }

  source_pid <- frameworkContext$patient$source_pid;
  if (is.null(source_pid)) {
    source_pid <- "NULL";
  } else {
    source_pid <- paste0("'", as.character(source_pid), "'");
  }

  cdm_pid <- frameworkContext$patient$cdm_pid;
  if (is.null(cdm_pid)) {
    cdm_pid <- "NULL"
  }

  statement <- paste0("INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT ", frameworkContext$testId, " AS id, '", testName, "' AS description, 'Expect drug_era' AS test, ", source_pid, " as source_pid, ", cdm_pid, " as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.drug_era WHERE ")
  whereClauses = NULL;
  if (!missing(drug_era_id)) {
    if (is.null(drug_era_id)) {
      whereClauses <- c(whereClauses, "drug_era_id IS NULL")
    } else if (is(drug_era_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("drug_era_id = (", as.character(drug_era_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("drug_era_id = '", drug_era_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(drug_concept_id)) {
    if (is.null(drug_concept_id)) {
      whereClauses <- c(whereClauses, "drug_concept_id IS NULL")
    } else if (is(drug_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("drug_concept_id = (", as.character(drug_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("drug_concept_id = '", drug_concept_id,"'"))
    }
  }

  if (!missing(drug_era_start_date)) {
    if (is.null(drug_era_start_date)) {
      whereClauses <- c(whereClauses, "drug_era_start_date IS NULL")
    } else if (is(drug_era_start_date, "subQuery")){
      whereClauses <- c(whereClauses, paste0("drug_era_start_date = (", as.character(drug_era_start_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("drug_era_start_date = '", drug_era_start_date,"'"))
    }
  }

  if (!missing(drug_era_end_date)) {
    if (is.null(drug_era_end_date)) {
      whereClauses <- c(whereClauses, "drug_era_end_date IS NULL")
    } else if (is(drug_era_end_date, "subQuery")){
      whereClauses <- c(whereClauses, paste0("drug_era_end_date = (", as.character(drug_era_end_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("drug_era_end_date = '", drug_era_end_date,"'"))
    }
  }

  if (!missing(drug_exposure_count)) {
    if (is.null(drug_exposure_count)) {
      whereClauses <- c(whereClauses, "drug_exposure_count IS NULL")
    } else if (is(drug_exposure_count, "subQuery")){
      whereClauses <- c(whereClauses, paste0("drug_exposure_count = (", as.character(drug_exposure_count), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("drug_exposure_count = '", drug_exposure_count,"'"))
    }
  }

  if (!missing(gap_days)) {
    if (is.null(gap_days)) {
      whereClauses <- c(whereClauses, "gap_days IS NULL")
    } else if (is(gap_days, "subQuery")){
      whereClauses <- c(whereClauses, paste0("gap_days = (", as.character(gap_days), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("gap_days = '", gap_days,"'"))
    }
  }

 statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

expect_no_dose_era <- function(dose_era_id, person_id, drug_concept_id, unit_concept_id, dose_value, dose_era_start_date, dose_era_end_date) {

  if (is.null(frameworkContext$currentGroup)) {
    testName <- frameworkContext$testDescription;
  } else {
    testName <- paste0(frameworkContext$groupIndex, ".", frameworkContext$currentGroup$groupItemIndex, " ", frameworkContext$testDescription);
  }

  source_pid <- frameworkContext$patient$source_pid;
  if (is.null(source_pid)) {
    source_pid <- "NULL";
  } else {
    source_pid <- paste0("'", as.character(source_pid), "'");
  }

  cdm_pid <- frameworkContext$patient$cdm_pid;
  if (is.null(cdm_pid)) {
    cdm_pid <- "NULL"
  }

  statement <- paste0("INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT ", frameworkContext$testId, " AS id, '", testName, "' AS description, 'Expect dose_era' AS test, ", source_pid, " as source_pid, ", cdm_pid, " as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.dose_era WHERE ")
  whereClauses = NULL;
  if (!missing(dose_era_id)) {
    if (is.null(dose_era_id)) {
      whereClauses <- c(whereClauses, "dose_era_id IS NULL")
    } else if (is(dose_era_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("dose_era_id = (", as.character(dose_era_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("dose_era_id = '", dose_era_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(drug_concept_id)) {
    if (is.null(drug_concept_id)) {
      whereClauses <- c(whereClauses, "drug_concept_id IS NULL")
    } else if (is(drug_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("drug_concept_id = (", as.character(drug_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("drug_concept_id = '", drug_concept_id,"'"))
    }
  }

  if (!missing(unit_concept_id)) {
    if (is.null(unit_concept_id)) {
      whereClauses <- c(whereClauses, "unit_concept_id IS NULL")
    } else if (is(unit_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("unit_concept_id = (", as.character(unit_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("unit_concept_id = '", unit_concept_id,"'"))
    }
  }

  if (!missing(dose_value)) {
    if (is.null(dose_value)) {
      whereClauses <- c(whereClauses, "dose_value IS NULL")
    } else if (is(dose_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("dose_value = (", as.character(dose_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("dose_value = '", dose_value,"'"))
    }
  }

  if (!missing(dose_era_start_date)) {
    if (is.null(dose_era_start_date)) {
      whereClauses <- c(whereClauses, "dose_era_start_date IS NULL")
    } else if (is(dose_era_start_date, "subQuery")){
      whereClauses <- c(whereClauses, paste0("dose_era_start_date = (", as.character(dose_era_start_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("dose_era_start_date = '", dose_era_start_date,"'"))
    }
  }

  if (!missing(dose_era_end_date)) {
    if (is.null(dose_era_end_date)) {
      whereClauses <- c(whereClauses, "dose_era_end_date IS NULL")
    } else if (is(dose_era_end_date, "subQuery")){
      whereClauses <- c(whereClauses, paste0("dose_era_end_date = (", as.character(dose_era_end_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("dose_era_end_date = '", dose_era_end_date,"'"))
    }
  }

 statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

expect_no_condition_era <- function(condition_era_id, person_id, condition_concept_id, condition_era_start_date, condition_era_end_date, condition_occurrence_count) {

  if (is.null(frameworkContext$currentGroup)) {
    testName <- frameworkContext$testDescription;
  } else {
    testName <- paste0(frameworkContext$groupIndex, ".", frameworkContext$currentGroup$groupItemIndex, " ", frameworkContext$testDescription);
  }

  source_pid <- frameworkContext$patient$source_pid;
  if (is.null(source_pid)) {
    source_pid <- "NULL";
  } else {
    source_pid <- paste0("'", as.character(source_pid), "'");
  }

  cdm_pid <- frameworkContext$patient$cdm_pid;
  if (is.null(cdm_pid)) {
    cdm_pid <- "NULL"
  }

  statement <- paste0("INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT ", frameworkContext$testId, " AS id, '", testName, "' AS description, 'Expect condition_era' AS test, ", source_pid, " as source_pid, ", cdm_pid, " as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.condition_era WHERE ")
  whereClauses = NULL;
  if (!missing(condition_era_id)) {
    if (is.null(condition_era_id)) {
      whereClauses <- c(whereClauses, "condition_era_id IS NULL")
    } else if (is(condition_era_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("condition_era_id = (", as.character(condition_era_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("condition_era_id = '", condition_era_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(condition_concept_id)) {
    if (is.null(condition_concept_id)) {
      whereClauses <- c(whereClauses, "condition_concept_id IS NULL")
    } else if (is(condition_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("condition_concept_id = (", as.character(condition_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("condition_concept_id = '", condition_concept_id,"'"))
    }
  }

  if (!missing(condition_era_start_date)) {
    if (is.null(condition_era_start_date)) {
      whereClauses <- c(whereClauses, "condition_era_start_date IS NULL")
    } else if (is(condition_era_start_date, "subQuery")){
      whereClauses <- c(whereClauses, paste0("condition_era_start_date = (", as.character(condition_era_start_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("condition_era_start_date = '", condition_era_start_date,"'"))
    }
  }

  if (!missing(condition_era_end_date)) {
    if (is.null(condition_era_end_date)) {
      whereClauses <- c(whereClauses, "condition_era_end_date IS NULL")
    } else if (is(condition_era_end_date, "subQuery")){
      whereClauses <- c(whereClauses, paste0("condition_era_end_date = (", as.character(condition_era_end_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("condition_era_end_date = '", condition_era_end_date,"'"))
    }
  }

  if (!missing(condition_occurrence_count)) {
    if (is.null(condition_occurrence_count)) {
      whereClauses <- c(whereClauses, "condition_occurrence_count IS NULL")
    } else if (is(condition_occurrence_count, "subQuery")){
      whereClauses <- c(whereClauses, paste0("condition_occurrence_count = (", as.character(condition_occurrence_count), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("condition_occurrence_count = '", condition_occurrence_count,"'"))
    }
  }

 statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

expect_no_cdm_source <- function(cdm_source_name, cdm_source_abbreviation, cdm_holder, source_description, source_documentation_reference, cdm_etl_reference, source_release_date, cdm_release_date, cdm_version, vocabulary_version) {

  if (is.null(frameworkContext$currentGroup)) {
    testName <- frameworkContext$testDescription;
  } else {
    testName <- paste0(frameworkContext$groupIndex, ".", frameworkContext$currentGroup$groupItemIndex, " ", frameworkContext$testDescription);
  }

  source_pid <- frameworkContext$patient$source_pid;
  if (is.null(source_pid)) {
    source_pid <- "NULL";
  } else {
    source_pid <- paste0("'", as.character(source_pid), "'");
  }

  cdm_pid <- frameworkContext$patient$cdm_pid;
  if (is.null(cdm_pid)) {
    cdm_pid <- "NULL"
  }

  statement <- paste0("INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT ", frameworkContext$testId, " AS id, '", testName, "' AS description, 'Expect cdm_source' AS test, ", source_pid, " as source_pid, ", cdm_pid, " as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.cdm_source WHERE ")
  whereClauses = NULL;
  if (!missing(cdm_source_name)) {
    if (is.null(cdm_source_name)) {
      whereClauses <- c(whereClauses, "cdm_source_name IS NULL")
    } else if (is(cdm_source_name, "subQuery")){
      whereClauses <- c(whereClauses, paste0("cdm_source_name = (", as.character(cdm_source_name), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cdm_source_name = '", cdm_source_name,"'"))
    }
  }

  if (!missing(cdm_source_abbreviation)) {
    if (is.null(cdm_source_abbreviation)) {
      whereClauses <- c(whereClauses, "cdm_source_abbreviation IS NULL")
    } else if (is(cdm_source_abbreviation, "subQuery")){
      whereClauses <- c(whereClauses, paste0("cdm_source_abbreviation = (", as.character(cdm_source_abbreviation), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cdm_source_abbreviation = '", cdm_source_abbreviation,"'"))
    }
  }

  if (!missing(cdm_holder)) {
    if (is.null(cdm_holder)) {
      whereClauses <- c(whereClauses, "cdm_holder IS NULL")
    } else if (is(cdm_holder, "subQuery")){
      whereClauses <- c(whereClauses, paste0("cdm_holder = (", as.character(cdm_holder), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cdm_holder = '", cdm_holder,"'"))
    }
  }

  if (!missing(source_description)) {
    if (is.null(source_description)) {
      whereClauses <- c(whereClauses, "source_description IS NULL")
    } else if (is(source_description, "subQuery")){
      whereClauses <- c(whereClauses, paste0("source_description = (", as.character(source_description), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("source_description = '", source_description,"'"))
    }
  }

  if (!missing(source_documentation_reference)) {
    if (is.null(source_documentation_reference)) {
      whereClauses <- c(whereClauses, "source_documentation_reference IS NULL")
    } else if (is(source_documentation_reference, "subQuery")){
      whereClauses <- c(whereClauses, paste0("source_documentation_reference = (", as.character(source_documentation_reference), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("source_documentation_reference = '", source_documentation_reference,"'"))
    }
  }

  if (!missing(cdm_etl_reference)) {
    if (is.null(cdm_etl_reference)) {
      whereClauses <- c(whereClauses, "cdm_etl_reference IS NULL")
    } else if (is(cdm_etl_reference, "subQuery")){
      whereClauses <- c(whereClauses, paste0("cdm_etl_reference = (", as.character(cdm_etl_reference), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cdm_etl_reference = '", cdm_etl_reference,"'"))
    }
  }

  if (!missing(source_release_date)) {
    if (is.null(source_release_date)) {
      whereClauses <- c(whereClauses, "source_release_date IS NULL")
    } else if (is(source_release_date, "subQuery")){
      whereClauses <- c(whereClauses, paste0("source_release_date = (", as.character(source_release_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("source_release_date = '", source_release_date,"'"))
    }
  }

  if (!missing(cdm_release_date)) {
    if (is.null(cdm_release_date)) {
      whereClauses <- c(whereClauses, "cdm_release_date IS NULL")
    } else if (is(cdm_release_date, "subQuery")){
      whereClauses <- c(whereClauses, paste0("cdm_release_date = (", as.character(cdm_release_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cdm_release_date = '", cdm_release_date,"'"))
    }
  }

  if (!missing(cdm_version)) {
    if (is.null(cdm_version)) {
      whereClauses <- c(whereClauses, "cdm_version IS NULL")
    } else if (is(cdm_version, "subQuery")){
      whereClauses <- c(whereClauses, paste0("cdm_version = (", as.character(cdm_version), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cdm_version = '", cdm_version,"'"))
    }
  }

  if (!missing(vocabulary_version)) {
    if (is.null(vocabulary_version)) {
      whereClauses <- c(whereClauses, "vocabulary_version IS NULL")
    } else if (is(vocabulary_version, "subQuery")){
      whereClauses <- c(whereClauses, paste0("vocabulary_version = (", as.character(vocabulary_version), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("vocabulary_version = '", vocabulary_version,"'"))
    }
  }

 statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

expect_no_cohort <- function(cohort_definition_id, subject_id, cohort_start_date, cohort_end_date) {

  if (is.null(frameworkContext$currentGroup)) {
    testName <- frameworkContext$testDescription;
  } else {
    testName <- paste0(frameworkContext$groupIndex, ".", frameworkContext$currentGroup$groupItemIndex, " ", frameworkContext$testDescription);
  }

  source_pid <- frameworkContext$patient$source_pid;
  if (is.null(source_pid)) {
    source_pid <- "NULL";
  } else {
    source_pid <- paste0("'", as.character(source_pid), "'");
  }

  cdm_pid <- frameworkContext$patient$cdm_pid;
  if (is.null(cdm_pid)) {
    cdm_pid <- "NULL"
  }

  statement <- paste0("INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT ", frameworkContext$testId, " AS id, '", testName, "' AS description, 'Expect cohort' AS test, ", source_pid, " as source_pid, ", cdm_pid, " as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.cohort WHERE ")
  whereClauses = NULL;
  if (!missing(cohort_definition_id)) {
    if (is.null(cohort_definition_id)) {
      whereClauses <- c(whereClauses, "cohort_definition_id IS NULL")
    } else if (is(cohort_definition_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("cohort_definition_id = (", as.character(cohort_definition_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cohort_definition_id = '", cohort_definition_id,"'"))
    }
  }

  if (!missing(subject_id)) {
    if (is.null(subject_id)) {
      whereClauses <- c(whereClauses, "subject_id IS NULL")
    } else if (is(subject_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("subject_id = (", as.character(subject_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("subject_id = '", subject_id,"'"))
    }
  }

  if (!missing(cohort_start_date)) {
    if (is.null(cohort_start_date)) {
      whereClauses <- c(whereClauses, "cohort_start_date IS NULL")
    } else if (is(cohort_start_date, "subQuery")){
      whereClauses <- c(whereClauses, paste0("cohort_start_date = (", as.character(cohort_start_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cohort_start_date = '", cohort_start_date,"'"))
    }
  }

  if (!missing(cohort_end_date)) {
    if (is.null(cohort_end_date)) {
      whereClauses <- c(whereClauses, "cohort_end_date IS NULL")
    } else if (is(cohort_end_date, "subQuery")){
      whereClauses <- c(whereClauses, paste0("cohort_end_date = (", as.character(cohort_end_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cohort_end_date = '", cohort_end_date,"'"))
    }
  }

 statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

expect_no_cohort_definition <- function(cohort_definition_id, cohort_definition_name, cohort_definition_description, definition_type_concept_id, cohort_definition_syntax, subject_concept_id, cohort_instantiation_date) {

  if (is.null(frameworkContext$currentGroup)) {
    testName <- frameworkContext$testDescription;
  } else {
    testName <- paste0(frameworkContext$groupIndex, ".", frameworkContext$currentGroup$groupItemIndex, " ", frameworkContext$testDescription);
  }

  source_pid <- frameworkContext$patient$source_pid;
  if (is.null(source_pid)) {
    source_pid <- "NULL";
  } else {
    source_pid <- paste0("'", as.character(source_pid), "'");
  }

  cdm_pid <- frameworkContext$patient$cdm_pid;
  if (is.null(cdm_pid)) {
    cdm_pid <- "NULL"
  }

  statement <- paste0("INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT ", frameworkContext$testId, " AS id, '", testName, "' AS description, 'Expect cohort_definition' AS test, ", source_pid, " as source_pid, ", cdm_pid, " as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.cohort_definition WHERE ")
  whereClauses = NULL;
  if (!missing(cohort_definition_id)) {
    if (is.null(cohort_definition_id)) {
      whereClauses <- c(whereClauses, "cohort_definition_id IS NULL")
    } else if (is(cohort_definition_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("cohort_definition_id = (", as.character(cohort_definition_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cohort_definition_id = '", cohort_definition_id,"'"))
    }
  }

  if (!missing(cohort_definition_name)) {
    if (is.null(cohort_definition_name)) {
      whereClauses <- c(whereClauses, "cohort_definition_name IS NULL")
    } else if (is(cohort_definition_name, "subQuery")){
      whereClauses <- c(whereClauses, paste0("cohort_definition_name = (", as.character(cohort_definition_name), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cohort_definition_name = '", cohort_definition_name,"'"))
    }
  }

  if (!missing(cohort_definition_description)) {
    if (is.null(cohort_definition_description)) {
      whereClauses <- c(whereClauses, "cohort_definition_description IS NULL")
    } else if (is(cohort_definition_description, "subQuery")){
      whereClauses <- c(whereClauses, paste0("cohort_definition_description = (", as.character(cohort_definition_description), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cohort_definition_description = '", cohort_definition_description,"'"))
    }
  }

  if (!missing(definition_type_concept_id)) {
    if (is.null(definition_type_concept_id)) {
      whereClauses <- c(whereClauses, "definition_type_concept_id IS NULL")
    } else if (is(definition_type_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("definition_type_concept_id = (", as.character(definition_type_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("definition_type_concept_id = '", definition_type_concept_id,"'"))
    }
  }

  if (!missing(cohort_definition_syntax)) {
    if (is.null(cohort_definition_syntax)) {
      whereClauses <- c(whereClauses, "cohort_definition_syntax IS NULL")
    } else if (is(cohort_definition_syntax, "subQuery")){
      whereClauses <- c(whereClauses, paste0("cohort_definition_syntax = (", as.character(cohort_definition_syntax), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cohort_definition_syntax = '", cohort_definition_syntax,"'"))
    }
  }

  if (!missing(subject_concept_id)) {
    if (is.null(subject_concept_id)) {
      whereClauses <- c(whereClauses, "subject_concept_id IS NULL")
    } else if (is(subject_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("subject_concept_id = (", as.character(subject_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("subject_concept_id = '", subject_concept_id,"'"))
    }
  }

  if (!missing(cohort_instantiation_date)) {
    if (is.null(cohort_instantiation_date)) {
      whereClauses <- c(whereClauses, "cohort_instantiation_date IS NULL")
    } else if (is(cohort_instantiation_date, "subQuery")){
      whereClauses <- c(whereClauses, paste0("cohort_instantiation_date = (", as.character(cohort_instantiation_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cohort_instantiation_date = '", cohort_instantiation_date,"'"))
    }
  }

 statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

expect_no_cohort_attribute <- function(cohort_definition_id, cohort_start_date, cohort_end_date, subject_id, attribute_definition_id, value_as_number, value_as_concept_id) {

  if (is.null(frameworkContext$currentGroup)) {
    testName <- frameworkContext$testDescription;
  } else {
    testName <- paste0(frameworkContext$groupIndex, ".", frameworkContext$currentGroup$groupItemIndex, " ", frameworkContext$testDescription);
  }

  source_pid <- frameworkContext$patient$source_pid;
  if (is.null(source_pid)) {
    source_pid <- "NULL";
  } else {
    source_pid <- paste0("'", as.character(source_pid), "'");
  }

  cdm_pid <- frameworkContext$patient$cdm_pid;
  if (is.null(cdm_pid)) {
    cdm_pid <- "NULL"
  }

  statement <- paste0("INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT ", frameworkContext$testId, " AS id, '", testName, "' AS description, 'Expect cohort_attribute' AS test, ", source_pid, " as source_pid, ", cdm_pid, " as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.cohort_attribute WHERE ")
  whereClauses = NULL;
  if (!missing(cohort_definition_id)) {
    if (is.null(cohort_definition_id)) {
      whereClauses <- c(whereClauses, "cohort_definition_id IS NULL")
    } else if (is(cohort_definition_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("cohort_definition_id = (", as.character(cohort_definition_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cohort_definition_id = '", cohort_definition_id,"'"))
    }
  }

  if (!missing(cohort_start_date)) {
    if (is.null(cohort_start_date)) {
      whereClauses <- c(whereClauses, "cohort_start_date IS NULL")
    } else if (is(cohort_start_date, "subQuery")){
      whereClauses <- c(whereClauses, paste0("cohort_start_date = (", as.character(cohort_start_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cohort_start_date = '", cohort_start_date,"'"))
    }
  }

  if (!missing(cohort_end_date)) {
    if (is.null(cohort_end_date)) {
      whereClauses <- c(whereClauses, "cohort_end_date IS NULL")
    } else if (is(cohort_end_date, "subQuery")){
      whereClauses <- c(whereClauses, paste0("cohort_end_date = (", as.character(cohort_end_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cohort_end_date = '", cohort_end_date,"'"))
    }
  }

  if (!missing(subject_id)) {
    if (is.null(subject_id)) {
      whereClauses <- c(whereClauses, "subject_id IS NULL")
    } else if (is(subject_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("subject_id = (", as.character(subject_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("subject_id = '", subject_id,"'"))
    }
  }

  if (!missing(attribute_definition_id)) {
    if (is.null(attribute_definition_id)) {
      whereClauses <- c(whereClauses, "attribute_definition_id IS NULL")
    } else if (is(attribute_definition_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("attribute_definition_id = (", as.character(attribute_definition_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("attribute_definition_id = '", attribute_definition_id,"'"))
    }
  }

  if (!missing(value_as_number)) {
    if (is.null(value_as_number)) {
      whereClauses <- c(whereClauses, "value_as_number IS NULL")
    } else if (is(value_as_number, "subQuery")){
      whereClauses <- c(whereClauses, paste0("value_as_number = (", as.character(value_as_number), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("value_as_number = '", value_as_number,"'"))
    }
  }

  if (!missing(value_as_concept_id)) {
    if (is.null(value_as_concept_id)) {
      whereClauses <- c(whereClauses, "value_as_concept_id IS NULL")
    } else if (is(value_as_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("value_as_concept_id = (", as.character(value_as_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("value_as_concept_id = '", value_as_concept_id,"'"))
    }
  }

 statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

expect_no_attribute_definition <- function(attribute_definition_id, attribute_name, attribute_description, attribute_type_concept_id, attribute_syntax) {

  if (is.null(frameworkContext$currentGroup)) {
    testName <- frameworkContext$testDescription;
  } else {
    testName <- paste0(frameworkContext$groupIndex, ".", frameworkContext$currentGroup$groupItemIndex, " ", frameworkContext$testDescription);
  }

  source_pid <- frameworkContext$patient$source_pid;
  if (is.null(source_pid)) {
    source_pid <- "NULL";
  } else {
    source_pid <- paste0("'", as.character(source_pid), "'");
  }

  cdm_pid <- frameworkContext$patient$cdm_pid;
  if (is.null(cdm_pid)) {
    cdm_pid <- "NULL"
  }

  statement <- paste0("INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT ", frameworkContext$testId, " AS id, '", testName, "' AS description, 'Expect attribute_definition' AS test, ", source_pid, " as source_pid, ", cdm_pid, " as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.attribute_definition WHERE ")
  whereClauses = NULL;
  if (!missing(attribute_definition_id)) {
    if (is.null(attribute_definition_id)) {
      whereClauses <- c(whereClauses, "attribute_definition_id IS NULL")
    } else if (is(attribute_definition_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("attribute_definition_id = (", as.character(attribute_definition_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("attribute_definition_id = '", attribute_definition_id,"'"))
    }
  }

  if (!missing(attribute_name)) {
    if (is.null(attribute_name)) {
      whereClauses <- c(whereClauses, "attribute_name IS NULL")
    } else if (is(attribute_name, "subQuery")){
      whereClauses <- c(whereClauses, paste0("attribute_name = (", as.character(attribute_name), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("attribute_name = '", attribute_name,"'"))
    }
  }

  if (!missing(attribute_description)) {
    if (is.null(attribute_description)) {
      whereClauses <- c(whereClauses, "attribute_description IS NULL")
    } else if (is(attribute_description, "subQuery")){
      whereClauses <- c(whereClauses, paste0("attribute_description = (", as.character(attribute_description), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("attribute_description = '", attribute_description,"'"))
    }
  }

  if (!missing(attribute_type_concept_id)) {
    if (is.null(attribute_type_concept_id)) {
      whereClauses <- c(whereClauses, "attribute_type_concept_id IS NULL")
    } else if (is(attribute_type_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("attribute_type_concept_id = (", as.character(attribute_type_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("attribute_type_concept_id = '", attribute_type_concept_id,"'"))
    }
  }

  if (!missing(attribute_syntax)) {
    if (is.null(attribute_syntax)) {
      whereClauses <- c(whereClauses, "attribute_syntax IS NULL")
    } else if (is(attribute_syntax, "subQuery")){
      whereClauses <- c(whereClauses, paste0("attribute_syntax = (", as.character(attribute_syntax), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("attribute_syntax = '", attribute_syntax,"'"))
    }
  }

 statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

expect_no_cost <- function(cost_id, cost_event_id, cost_domain_id, cost_type_concept_id, currency_concept_id, total_charge, total_cost, total_paid, paid_by_payer, paid_by_patient, paid_patient_copay, paid_patient_coinsurance, paid_patient_deductible, paid_by_primary, paid_ingredient_cost, paid_dispensing_fee, payer_plan_period_id, amount_allowed, revenue_code_concept_id, revenue_code_source_value) {

  if (is.null(frameworkContext$currentGroup)) {
    testName <- frameworkContext$testDescription;
  } else {
    testName <- paste0(frameworkContext$groupIndex, ".", frameworkContext$currentGroup$groupItemIndex, " ", frameworkContext$testDescription);
  }

  source_pid <- frameworkContext$patient$source_pid;
  if (is.null(source_pid)) {
    source_pid <- "NULL";
  } else {
    source_pid <- paste0("'", as.character(source_pid), "'");
  }

  cdm_pid <- frameworkContext$patient$cdm_pid;
  if (is.null(cdm_pid)) {
    cdm_pid <- "NULL"
  }

  statement <- paste0("INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT ", frameworkContext$testId, " AS id, '", testName, "' AS description, 'Expect cost' AS test, ", source_pid, " as source_pid, ", cdm_pid, " as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.cost WHERE ")
  whereClauses = NULL;
  if (!missing(cost_id)) {
    if (is.null(cost_id)) {
      whereClauses <- c(whereClauses, "cost_id IS NULL")
    } else if (is(cost_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("cost_id = (", as.character(cost_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cost_id = '", cost_id,"'"))
    }
  }

  if (!missing(cost_event_id)) {
    if (is.null(cost_event_id)) {
      whereClauses <- c(whereClauses, "cost_event_id IS NULL")
    } else if (is(cost_event_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("cost_event_id = (", as.character(cost_event_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cost_event_id = '", cost_event_id,"'"))
    }
  }

  if (!missing(cost_domain_id)) {
    if (is.null(cost_domain_id)) {
      whereClauses <- c(whereClauses, "cost_domain_id IS NULL")
    } else if (is(cost_domain_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("cost_domain_id = (", as.character(cost_domain_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cost_domain_id = '", cost_domain_id,"'"))
    }
  }

  if (!missing(cost_type_concept_id)) {
    if (is.null(cost_type_concept_id)) {
      whereClauses <- c(whereClauses, "cost_type_concept_id IS NULL")
    } else if (is(cost_type_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("cost_type_concept_id = (", as.character(cost_type_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cost_type_concept_id = '", cost_type_concept_id,"'"))
    }
  }

  if (!missing(currency_concept_id)) {
    if (is.null(currency_concept_id)) {
      whereClauses <- c(whereClauses, "currency_concept_id IS NULL")
    } else if (is(currency_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("currency_concept_id = (", as.character(currency_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("currency_concept_id = '", currency_concept_id,"'"))
    }
  }

  if (!missing(total_charge)) {
    if (is.null(total_charge)) {
      whereClauses <- c(whereClauses, "total_charge IS NULL")
    } else if (is(total_charge, "subQuery")){
      whereClauses <- c(whereClauses, paste0("total_charge = (", as.character(total_charge), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("total_charge = '", total_charge,"'"))
    }
  }

  if (!missing(total_cost)) {
    if (is.null(total_cost)) {
      whereClauses <- c(whereClauses, "total_cost IS NULL")
    } else if (is(total_cost, "subQuery")){
      whereClauses <- c(whereClauses, paste0("total_cost = (", as.character(total_cost), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("total_cost = '", total_cost,"'"))
    }
  }

  if (!missing(total_paid)) {
    if (is.null(total_paid)) {
      whereClauses <- c(whereClauses, "total_paid IS NULL")
    } else if (is(total_paid, "subQuery")){
      whereClauses <- c(whereClauses, paste0("total_paid = (", as.character(total_paid), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("total_paid = '", total_paid,"'"))
    }
  }

  if (!missing(paid_by_payer)) {
    if (is.null(paid_by_payer)) {
      whereClauses <- c(whereClauses, "paid_by_payer IS NULL")
    } else if (is(paid_by_payer, "subQuery")){
      whereClauses <- c(whereClauses, paste0("paid_by_payer = (", as.character(paid_by_payer), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("paid_by_payer = '", paid_by_payer,"'"))
    }
  }

  if (!missing(paid_by_patient)) {
    if (is.null(paid_by_patient)) {
      whereClauses <- c(whereClauses, "paid_by_patient IS NULL")
    } else if (is(paid_by_patient, "subQuery")){
      whereClauses <- c(whereClauses, paste0("paid_by_patient = (", as.character(paid_by_patient), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("paid_by_patient = '", paid_by_patient,"'"))
    }
  }

  if (!missing(paid_patient_copay)) {
    if (is.null(paid_patient_copay)) {
      whereClauses <- c(whereClauses, "paid_patient_copay IS NULL")
    } else if (is(paid_patient_copay, "subQuery")){
      whereClauses <- c(whereClauses, paste0("paid_patient_copay = (", as.character(paid_patient_copay), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("paid_patient_copay = '", paid_patient_copay,"'"))
    }
  }

  if (!missing(paid_patient_coinsurance)) {
    if (is.null(paid_patient_coinsurance)) {
      whereClauses <- c(whereClauses, "paid_patient_coinsurance IS NULL")
    } else if (is(paid_patient_coinsurance, "subQuery")){
      whereClauses <- c(whereClauses, paste0("paid_patient_coinsurance = (", as.character(paid_patient_coinsurance), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("paid_patient_coinsurance = '", paid_patient_coinsurance,"'"))
    }
  }

  if (!missing(paid_patient_deductible)) {
    if (is.null(paid_patient_deductible)) {
      whereClauses <- c(whereClauses, "paid_patient_deductible IS NULL")
    } else if (is(paid_patient_deductible, "subQuery")){
      whereClauses <- c(whereClauses, paste0("paid_patient_deductible = (", as.character(paid_patient_deductible), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("paid_patient_deductible = '", paid_patient_deductible,"'"))
    }
  }

  if (!missing(paid_by_primary)) {
    if (is.null(paid_by_primary)) {
      whereClauses <- c(whereClauses, "paid_by_primary IS NULL")
    } else if (is(paid_by_primary, "subQuery")){
      whereClauses <- c(whereClauses, paste0("paid_by_primary = (", as.character(paid_by_primary), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("paid_by_primary = '", paid_by_primary,"'"))
    }
  }

  if (!missing(paid_ingredient_cost)) {
    if (is.null(paid_ingredient_cost)) {
      whereClauses <- c(whereClauses, "paid_ingredient_cost IS NULL")
    } else if (is(paid_ingredient_cost, "subQuery")){
      whereClauses <- c(whereClauses, paste0("paid_ingredient_cost = (", as.character(paid_ingredient_cost), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("paid_ingredient_cost = '", paid_ingredient_cost,"'"))
    }
  }

  if (!missing(paid_dispensing_fee)) {
    if (is.null(paid_dispensing_fee)) {
      whereClauses <- c(whereClauses, "paid_dispensing_fee IS NULL")
    } else if (is(paid_dispensing_fee, "subQuery")){
      whereClauses <- c(whereClauses, paste0("paid_dispensing_fee = (", as.character(paid_dispensing_fee), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("paid_dispensing_fee = '", paid_dispensing_fee,"'"))
    }
  }

  if (!missing(payer_plan_period_id)) {
    if (is.null(payer_plan_period_id)) {
      whereClauses <- c(whereClauses, "payer_plan_period_id IS NULL")
    } else if (is(payer_plan_period_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("payer_plan_period_id = (", as.character(payer_plan_period_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("payer_plan_period_id = '", payer_plan_period_id,"'"))
    }
  }

  if (!missing(amount_allowed)) {
    if (is.null(amount_allowed)) {
      whereClauses <- c(whereClauses, "amount_allowed IS NULL")
    } else if (is(amount_allowed, "subQuery")){
      whereClauses <- c(whereClauses, paste0("amount_allowed = (", as.character(amount_allowed), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("amount_allowed = '", amount_allowed,"'"))
    }
  }

  if (!missing(revenue_code_concept_id)) {
    if (is.null(revenue_code_concept_id)) {
      whereClauses <- c(whereClauses, "revenue_code_concept_id IS NULL")
    } else if (is(revenue_code_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("revenue_code_concept_id = (", as.character(revenue_code_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("revenue_code_concept_id = '", revenue_code_concept_id,"'"))
    }
  }

  if (!missing(revenue_code_source_value)) {
    if (is.null(revenue_code_source_value)) {
      whereClauses <- c(whereClauses, "revenue_code_source_value IS NULL")
    } else if (is(revenue_code_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("revenue_code_source_value = (", as.character(revenue_code_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("revenue_code_source_value = '", revenue_code_source_value,"'"))
    }
  }

 statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

expect_count_location <- function(rowCount, location_id, address_1, address_2, city, state, zip, county, location_source_value) {

  if (is.null(frameworkContext$currentGroup)) {
    testName <- frameworkContext$testDescription;
  } else {
    testName <- paste0(frameworkContext$groupIndex, ".", frameworkContext$currentGroup$groupItemIndex, " ", frameworkContext$testDescription);
  }

  source_pid <- frameworkContext$patient$source_pid;
  if (is.null(source_pid)) {
    source_pid <- "NULL";
  } else {
    source_pid <- paste0("'", as.character(source_pid), "'");
  }

  cdm_pid <- frameworkContext$patient$cdm_pid;
  if (is.null(cdm_pid)) {
    cdm_pid <- "NULL"
  }

  statement <- paste0("INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT ", frameworkContext$testId, " AS id, '", testName, "' AS description, 'Expect location' AS test, ", source_pid, " as source_pid, ", cdm_pid, " as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.location WHERE ")
  whereClauses = NULL;
  if (!missing(location_id)) {
    if (is.null(location_id)) {
      whereClauses <- c(whereClauses, "location_id IS NULL")
    } else if (is(location_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("location_id = (", as.character(location_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("location_id = '", location_id,"'"))
    }
  }

  if (!missing(address_1)) {
    if (is.null(address_1)) {
      whereClauses <- c(whereClauses, "address_1 IS NULL")
    } else if (is(address_1, "subQuery")){
      whereClauses <- c(whereClauses, paste0("address_1 = (", as.character(address_1), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("address_1 = '", address_1,"'"))
    }
  }

  if (!missing(address_2)) {
    if (is.null(address_2)) {
      whereClauses <- c(whereClauses, "address_2 IS NULL")
    } else if (is(address_2, "subQuery")){
      whereClauses <- c(whereClauses, paste0("address_2 = (", as.character(address_2), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("address_2 = '", address_2,"'"))
    }
  }

  if (!missing(city)) {
    if (is.null(city)) {
      whereClauses <- c(whereClauses, "city IS NULL")
    } else if (is(city, "subQuery")){
      whereClauses <- c(whereClauses, paste0("city = (", as.character(city), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("city = '", city,"'"))
    }
  }

  if (!missing(state)) {
    if (is.null(state)) {
      whereClauses <- c(whereClauses, "state IS NULL")
    } else if (is(state, "subQuery")){
      whereClauses <- c(whereClauses, paste0("state = (", as.character(state), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("state = '", state,"'"))
    }
  }

  if (!missing(zip)) {
    if (is.null(zip)) {
      whereClauses <- c(whereClauses, "zip IS NULL")
    } else if (is(zip, "subQuery")){
      whereClauses <- c(whereClauses, paste0("zip = (", as.character(zip), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("zip = '", zip,"'"))
    }
  }

  if (!missing(county)) {
    if (is.null(county)) {
      whereClauses <- c(whereClauses, "county IS NULL")
    } else if (is(county, "subQuery")){
      whereClauses <- c(whereClauses, paste0("county = (", as.character(county), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("county = '", county,"'"))
    }
  }

  if (!missing(location_source_value)) {
    if (is.null(location_source_value)) {
      whereClauses <- c(whereClauses, "location_source_value IS NULL")
    } else if (is(location_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("location_source_value = (", as.character(location_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("location_source_value = '", location_source_value,"'"))
    }
  }

 statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") != ",rowCount ," THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

expect_count_person <- function(rowCount, person_id, gender_concept_id, year_of_birth, month_of_birth, day_of_birth, time_of_birth, race_concept_id, ethnicity_concept_id, location_id, provider_id, care_site_id, person_source_value, gender_source_value, gender_source_concept_id, race_source_value, race_source_concept_id, ethnicity_source_value, ethnicity_source_concept_id) {

  if (is.null(frameworkContext$currentGroup)) {
    testName <- frameworkContext$testDescription;
  } else {
    testName <- paste0(frameworkContext$groupIndex, ".", frameworkContext$currentGroup$groupItemIndex, " ", frameworkContext$testDescription);
  }

  source_pid <- frameworkContext$patient$source_pid;
  if (is.null(source_pid)) {
    source_pid <- "NULL";
  } else {
    source_pid <- paste0("'", as.character(source_pid), "'");
  }

  cdm_pid <- frameworkContext$patient$cdm_pid;
  if (is.null(cdm_pid)) {
    cdm_pid <- "NULL"
  }

  statement <- paste0("INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT ", frameworkContext$testId, " AS id, '", testName, "' AS description, 'Expect person' AS test, ", source_pid, " as source_pid, ", cdm_pid, " as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.person WHERE ")
  whereClauses = NULL;
  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(gender_concept_id)) {
    if (is.null(gender_concept_id)) {
      whereClauses <- c(whereClauses, "gender_concept_id IS NULL")
    } else if (is(gender_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("gender_concept_id = (", as.character(gender_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("gender_concept_id = '", gender_concept_id,"'"))
    }
  }

  if (!missing(year_of_birth)) {
    if (is.null(year_of_birth)) {
      whereClauses <- c(whereClauses, "year_of_birth IS NULL")
    } else if (is(year_of_birth, "subQuery")){
      whereClauses <- c(whereClauses, paste0("year_of_birth = (", as.character(year_of_birth), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("year_of_birth = '", year_of_birth,"'"))
    }
  }

  if (!missing(month_of_birth)) {
    if (is.null(month_of_birth)) {
      whereClauses <- c(whereClauses, "month_of_birth IS NULL")
    } else if (is(month_of_birth, "subQuery")){
      whereClauses <- c(whereClauses, paste0("month_of_birth = (", as.character(month_of_birth), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("month_of_birth = '", month_of_birth,"'"))
    }
  }

  if (!missing(day_of_birth)) {
    if (is.null(day_of_birth)) {
      whereClauses <- c(whereClauses, "day_of_birth IS NULL")
    } else if (is(day_of_birth, "subQuery")){
      whereClauses <- c(whereClauses, paste0("day_of_birth = (", as.character(day_of_birth), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("day_of_birth = '", day_of_birth,"'"))
    }
  }

  if (!missing(time_of_birth)) {
    if (is.null(time_of_birth)) {
      whereClauses <- c(whereClauses, "time_of_birth IS NULL")
    } else if (is(time_of_birth, "subQuery")){
      whereClauses <- c(whereClauses, paste0("time_of_birth = (", as.character(time_of_birth), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("time_of_birth = '", time_of_birth,"'"))
    }
  }

  if (!missing(race_concept_id)) {
    if (is.null(race_concept_id)) {
      whereClauses <- c(whereClauses, "race_concept_id IS NULL")
    } else if (is(race_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("race_concept_id = (", as.character(race_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("race_concept_id = '", race_concept_id,"'"))
    }
  }

  if (!missing(ethnicity_concept_id)) {
    if (is.null(ethnicity_concept_id)) {
      whereClauses <- c(whereClauses, "ethnicity_concept_id IS NULL")
    } else if (is(ethnicity_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("ethnicity_concept_id = (", as.character(ethnicity_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("ethnicity_concept_id = '", ethnicity_concept_id,"'"))
    }
  }

  if (!missing(location_id)) {
    if (is.null(location_id)) {
      whereClauses <- c(whereClauses, "location_id IS NULL")
    } else if (is(location_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("location_id = (", as.character(location_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("location_id = '", location_id,"'"))
    }
  }

  if (!missing(provider_id)) {
    if (is.null(provider_id)) {
      whereClauses <- c(whereClauses, "provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("provider_id = (", as.character(provider_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("provider_id = '", provider_id,"'"))
    }
  }

  if (!missing(care_site_id)) {
    if (is.null(care_site_id)) {
      whereClauses <- c(whereClauses, "care_site_id IS NULL")
    } else if (is(care_site_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("care_site_id = (", as.character(care_site_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("care_site_id = '", care_site_id,"'"))
    }
  }

  if (!missing(person_source_value)) {
    if (is.null(person_source_value)) {
      whereClauses <- c(whereClauses, "person_source_value IS NULL")
    } else if (is(person_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("person_source_value = (", as.character(person_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_source_value = '", person_source_value,"'"))
    }
  }

  if (!missing(gender_source_value)) {
    if (is.null(gender_source_value)) {
      whereClauses <- c(whereClauses, "gender_source_value IS NULL")
    } else if (is(gender_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("gender_source_value = (", as.character(gender_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("gender_source_value = '", gender_source_value,"'"))
    }
  }

  if (!missing(gender_source_concept_id)) {
    if (is.null(gender_source_concept_id)) {
      whereClauses <- c(whereClauses, "gender_source_concept_id IS NULL")
    } else if (is(gender_source_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("gender_source_concept_id = (", as.character(gender_source_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("gender_source_concept_id = '", gender_source_concept_id,"'"))
    }
  }

  if (!missing(race_source_value)) {
    if (is.null(race_source_value)) {
      whereClauses <- c(whereClauses, "race_source_value IS NULL")
    } else if (is(race_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("race_source_value = (", as.character(race_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("race_source_value = '", race_source_value,"'"))
    }
  }

  if (!missing(race_source_concept_id)) {
    if (is.null(race_source_concept_id)) {
      whereClauses <- c(whereClauses, "race_source_concept_id IS NULL")
    } else if (is(race_source_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("race_source_concept_id = (", as.character(race_source_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("race_source_concept_id = '", race_source_concept_id,"'"))
    }
  }

  if (!missing(ethnicity_source_value)) {
    if (is.null(ethnicity_source_value)) {
      whereClauses <- c(whereClauses, "ethnicity_source_value IS NULL")
    } else if (is(ethnicity_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("ethnicity_source_value = (", as.character(ethnicity_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("ethnicity_source_value = '", ethnicity_source_value,"'"))
    }
  }

  if (!missing(ethnicity_source_concept_id)) {
    if (is.null(ethnicity_source_concept_id)) {
      whereClauses <- c(whereClauses, "ethnicity_source_concept_id IS NULL")
    } else if (is(ethnicity_source_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("ethnicity_source_concept_id = (", as.character(ethnicity_source_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("ethnicity_source_concept_id = '", ethnicity_source_concept_id,"'"))
    }
  }

 statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") != ",rowCount ," THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

expect_count_observation_period <- function(rowCount, observation_period_id, person_id, observation_period_start_date, observation_period_end_date, period_type_concept_id) {

  if (is.null(frameworkContext$currentGroup)) {
    testName <- frameworkContext$testDescription;
  } else {
    testName <- paste0(frameworkContext$groupIndex, ".", frameworkContext$currentGroup$groupItemIndex, " ", frameworkContext$testDescription);
  }

  source_pid <- frameworkContext$patient$source_pid;
  if (is.null(source_pid)) {
    source_pid <- "NULL";
  } else {
    source_pid <- paste0("'", as.character(source_pid), "'");
  }

  cdm_pid <- frameworkContext$patient$cdm_pid;
  if (is.null(cdm_pid)) {
    cdm_pid <- "NULL"
  }

  statement <- paste0("INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT ", frameworkContext$testId, " AS id, '", testName, "' AS description, 'Expect observation_period' AS test, ", source_pid, " as source_pid, ", cdm_pid, " as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.observation_period WHERE ")
  whereClauses = NULL;
  if (!missing(observation_period_id)) {
    if (is.null(observation_period_id)) {
      whereClauses <- c(whereClauses, "observation_period_id IS NULL")
    } else if (is(observation_period_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("observation_period_id = (", as.character(observation_period_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("observation_period_id = '", observation_period_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(observation_period_start_date)) {
    if (is.null(observation_period_start_date)) {
      whereClauses <- c(whereClauses, "observation_period_start_date IS NULL")
    } else if (is(observation_period_start_date, "subQuery")){
      whereClauses <- c(whereClauses, paste0("observation_period_start_date = (", as.character(observation_period_start_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("observation_period_start_date = '", observation_period_start_date,"'"))
    }
  }

  if (!missing(observation_period_end_date)) {
    if (is.null(observation_period_end_date)) {
      whereClauses <- c(whereClauses, "observation_period_end_date IS NULL")
    } else if (is(observation_period_end_date, "subQuery")){
      whereClauses <- c(whereClauses, paste0("observation_period_end_date = (", as.character(observation_period_end_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("observation_period_end_date = '", observation_period_end_date,"'"))
    }
  }

  if (!missing(period_type_concept_id)) {
    if (is.null(period_type_concept_id)) {
      whereClauses <- c(whereClauses, "period_type_concept_id IS NULL")
    } else if (is(period_type_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("period_type_concept_id = (", as.character(period_type_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("period_type_concept_id = '", period_type_concept_id,"'"))
    }
  }

 statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") != ",rowCount ," THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

expect_count_care_site <- function(rowCount, care_site_id, care_site_name, place_of_service_concept_id, location_id, care_site_source_value, place_of_service_source_value) {

  if (is.null(frameworkContext$currentGroup)) {
    testName <- frameworkContext$testDescription;
  } else {
    testName <- paste0(frameworkContext$groupIndex, ".", frameworkContext$currentGroup$groupItemIndex, " ", frameworkContext$testDescription);
  }

  source_pid <- frameworkContext$patient$source_pid;
  if (is.null(source_pid)) {
    source_pid <- "NULL";
  } else {
    source_pid <- paste0("'", as.character(source_pid), "'");
  }

  cdm_pid <- frameworkContext$patient$cdm_pid;
  if (is.null(cdm_pid)) {
    cdm_pid <- "NULL"
  }

  statement <- paste0("INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT ", frameworkContext$testId, " AS id, '", testName, "' AS description, 'Expect care_site' AS test, ", source_pid, " as source_pid, ", cdm_pid, " as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.care_site WHERE ")
  whereClauses = NULL;
  if (!missing(care_site_id)) {
    if (is.null(care_site_id)) {
      whereClauses <- c(whereClauses, "care_site_id IS NULL")
    } else if (is(care_site_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("care_site_id = (", as.character(care_site_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("care_site_id = '", care_site_id,"'"))
    }
  }

  if (!missing(care_site_name)) {
    if (is.null(care_site_name)) {
      whereClauses <- c(whereClauses, "care_site_name IS NULL")
    } else if (is(care_site_name, "subQuery")){
      whereClauses <- c(whereClauses, paste0("care_site_name = (", as.character(care_site_name), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("care_site_name = '", care_site_name,"'"))
    }
  }

  if (!missing(place_of_service_concept_id)) {
    if (is.null(place_of_service_concept_id)) {
      whereClauses <- c(whereClauses, "place_of_service_concept_id IS NULL")
    } else if (is(place_of_service_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("place_of_service_concept_id = (", as.character(place_of_service_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("place_of_service_concept_id = '", place_of_service_concept_id,"'"))
    }
  }

  if (!missing(location_id)) {
    if (is.null(location_id)) {
      whereClauses <- c(whereClauses, "location_id IS NULL")
    } else if (is(location_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("location_id = (", as.character(location_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("location_id = '", location_id,"'"))
    }
  }

  if (!missing(care_site_source_value)) {
    if (is.null(care_site_source_value)) {
      whereClauses <- c(whereClauses, "care_site_source_value IS NULL")
    } else if (is(care_site_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("care_site_source_value = (", as.character(care_site_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("care_site_source_value = '", care_site_source_value,"'"))
    }
  }

  if (!missing(place_of_service_source_value)) {
    if (is.null(place_of_service_source_value)) {
      whereClauses <- c(whereClauses, "place_of_service_source_value IS NULL")
    } else if (is(place_of_service_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("place_of_service_source_value = (", as.character(place_of_service_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("place_of_service_source_value = '", place_of_service_source_value,"'"))
    }
  }

 statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") != ",rowCount ," THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

expect_count_visit_occurrence <- function(rowCount, visit_occurrence_id, person_id, visit_concept_id, visit_start_date, visit_start_time, visit_end_date, visit_end_time, visit_type_concept_id, provider_id, care_site_id, visit_source_value, visit_source_concept_id) {

  if (is.null(frameworkContext$currentGroup)) {
    testName <- frameworkContext$testDescription;
  } else {
    testName <- paste0(frameworkContext$groupIndex, ".", frameworkContext$currentGroup$groupItemIndex, " ", frameworkContext$testDescription);
  }

  source_pid <- frameworkContext$patient$source_pid;
  if (is.null(source_pid)) {
    source_pid <- "NULL";
  } else {
    source_pid <- paste0("'", as.character(source_pid), "'");
  }

  cdm_pid <- frameworkContext$patient$cdm_pid;
  if (is.null(cdm_pid)) {
    cdm_pid <- "NULL"
  }

  statement <- paste0("INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT ", frameworkContext$testId, " AS id, '", testName, "' AS description, 'Expect visit_occurrence' AS test, ", source_pid, " as source_pid, ", cdm_pid, " as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.visit_occurrence WHERE ")
  whereClauses = NULL;
  if (!missing(visit_occurrence_id)) {
    if (is.null(visit_occurrence_id)) {
      whereClauses <- c(whereClauses, "visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("visit_occurrence_id = (", as.character(visit_occurrence_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_occurrence_id = '", visit_occurrence_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(visit_concept_id)) {
    if (is.null(visit_concept_id)) {
      whereClauses <- c(whereClauses, "visit_concept_id IS NULL")
    } else if (is(visit_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("visit_concept_id = (", as.character(visit_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_concept_id = '", visit_concept_id,"'"))
    }
  }

  if (!missing(visit_start_date)) {
    if (is.null(visit_start_date)) {
      whereClauses <- c(whereClauses, "visit_start_date IS NULL")
    } else if (is(visit_start_date, "subQuery")){
      whereClauses <- c(whereClauses, paste0("visit_start_date = (", as.character(visit_start_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_start_date = '", visit_start_date,"'"))
    }
  }

  if (!missing(visit_start_time)) {
    if (is.null(visit_start_time)) {
      whereClauses <- c(whereClauses, "visit_start_time IS NULL")
    } else if (is(visit_start_time, "subQuery")){
      whereClauses <- c(whereClauses, paste0("visit_start_time = (", as.character(visit_start_time), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_start_time = '", visit_start_time,"'"))
    }
  }

  if (!missing(visit_end_date)) {
    if (is.null(visit_end_date)) {
      whereClauses <- c(whereClauses, "visit_end_date IS NULL")
    } else if (is(visit_end_date, "subQuery")){
      whereClauses <- c(whereClauses, paste0("visit_end_date = (", as.character(visit_end_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_end_date = '", visit_end_date,"'"))
    }
  }

  if (!missing(visit_end_time)) {
    if (is.null(visit_end_time)) {
      whereClauses <- c(whereClauses, "visit_end_time IS NULL")
    } else if (is(visit_end_time, "subQuery")){
      whereClauses <- c(whereClauses, paste0("visit_end_time = (", as.character(visit_end_time), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_end_time = '", visit_end_time,"'"))
    }
  }

  if (!missing(visit_type_concept_id)) {
    if (is.null(visit_type_concept_id)) {
      whereClauses <- c(whereClauses, "visit_type_concept_id IS NULL")
    } else if (is(visit_type_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("visit_type_concept_id = (", as.character(visit_type_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_type_concept_id = '", visit_type_concept_id,"'"))
    }
  }

  if (!missing(provider_id)) {
    if (is.null(provider_id)) {
      whereClauses <- c(whereClauses, "provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("provider_id = (", as.character(provider_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("provider_id = '", provider_id,"'"))
    }
  }

  if (!missing(care_site_id)) {
    if (is.null(care_site_id)) {
      whereClauses <- c(whereClauses, "care_site_id IS NULL")
    } else if (is(care_site_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("care_site_id = (", as.character(care_site_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("care_site_id = '", care_site_id,"'"))
    }
  }

  if (!missing(visit_source_value)) {
    if (is.null(visit_source_value)) {
      whereClauses <- c(whereClauses, "visit_source_value IS NULL")
    } else if (is(visit_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("visit_source_value = (", as.character(visit_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_source_value = '", visit_source_value,"'"))
    }
  }

  if (!missing(visit_source_concept_id)) {
    if (is.null(visit_source_concept_id)) {
      whereClauses <- c(whereClauses, "visit_source_concept_id IS NULL")
    } else if (is(visit_source_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("visit_source_concept_id = (", as.character(visit_source_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_source_concept_id = '", visit_source_concept_id,"'"))
    }
  }

 statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") != ",rowCount ," THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

expect_count_provider <- function(rowCount, provider_id, provider_name, npi, dea, specialty_concept_id, care_site_id, year_of_birth, gender_concept_id, provider_source_value, specialty_source_value, specialty_source_concept_id, gender_source_value, gender_source_concept_id) {

  if (is.null(frameworkContext$currentGroup)) {
    testName <- frameworkContext$testDescription;
  } else {
    testName <- paste0(frameworkContext$groupIndex, ".", frameworkContext$currentGroup$groupItemIndex, " ", frameworkContext$testDescription);
  }

  source_pid <- frameworkContext$patient$source_pid;
  if (is.null(source_pid)) {
    source_pid <- "NULL";
  } else {
    source_pid <- paste0("'", as.character(source_pid), "'");
  }

  cdm_pid <- frameworkContext$patient$cdm_pid;
  if (is.null(cdm_pid)) {
    cdm_pid <- "NULL"
  }

  statement <- paste0("INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT ", frameworkContext$testId, " AS id, '", testName, "' AS description, 'Expect provider' AS test, ", source_pid, " as source_pid, ", cdm_pid, " as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.provider WHERE ")
  whereClauses = NULL;
  if (!missing(provider_id)) {
    if (is.null(provider_id)) {
      whereClauses <- c(whereClauses, "provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("provider_id = (", as.character(provider_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("provider_id = '", provider_id,"'"))
    }
  }

  if (!missing(provider_name)) {
    if (is.null(provider_name)) {
      whereClauses <- c(whereClauses, "provider_name IS NULL")
    } else if (is(provider_name, "subQuery")){
      whereClauses <- c(whereClauses, paste0("provider_name = (", as.character(provider_name), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("provider_name = '", provider_name,"'"))
    }
  }

  if (!missing(npi)) {
    if (is.null(npi)) {
      whereClauses <- c(whereClauses, "npi IS NULL")
    } else if (is(npi, "subQuery")){
      whereClauses <- c(whereClauses, paste0("npi = (", as.character(npi), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("npi = '", npi,"'"))
    }
  }

  if (!missing(dea)) {
    if (is.null(dea)) {
      whereClauses <- c(whereClauses, "dea IS NULL")
    } else if (is(dea, "subQuery")){
      whereClauses <- c(whereClauses, paste0("dea = (", as.character(dea), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("dea = '", dea,"'"))
    }
  }

  if (!missing(specialty_concept_id)) {
    if (is.null(specialty_concept_id)) {
      whereClauses <- c(whereClauses, "specialty_concept_id IS NULL")
    } else if (is(specialty_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("specialty_concept_id = (", as.character(specialty_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("specialty_concept_id = '", specialty_concept_id,"'"))
    }
  }

  if (!missing(care_site_id)) {
    if (is.null(care_site_id)) {
      whereClauses <- c(whereClauses, "care_site_id IS NULL")
    } else if (is(care_site_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("care_site_id = (", as.character(care_site_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("care_site_id = '", care_site_id,"'"))
    }
  }

  if (!missing(year_of_birth)) {
    if (is.null(year_of_birth)) {
      whereClauses <- c(whereClauses, "year_of_birth IS NULL")
    } else if (is(year_of_birth, "subQuery")){
      whereClauses <- c(whereClauses, paste0("year_of_birth = (", as.character(year_of_birth), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("year_of_birth = '", year_of_birth,"'"))
    }
  }

  if (!missing(gender_concept_id)) {
    if (is.null(gender_concept_id)) {
      whereClauses <- c(whereClauses, "gender_concept_id IS NULL")
    } else if (is(gender_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("gender_concept_id = (", as.character(gender_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("gender_concept_id = '", gender_concept_id,"'"))
    }
  }

  if (!missing(provider_source_value)) {
    if (is.null(provider_source_value)) {
      whereClauses <- c(whereClauses, "provider_source_value IS NULL")
    } else if (is(provider_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("provider_source_value = (", as.character(provider_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("provider_source_value = '", provider_source_value,"'"))
    }
  }

  if (!missing(specialty_source_value)) {
    if (is.null(specialty_source_value)) {
      whereClauses <- c(whereClauses, "specialty_source_value IS NULL")
    } else if (is(specialty_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("specialty_source_value = (", as.character(specialty_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("specialty_source_value = '", specialty_source_value,"'"))
    }
  }

  if (!missing(specialty_source_concept_id)) {
    if (is.null(specialty_source_concept_id)) {
      whereClauses <- c(whereClauses, "specialty_source_concept_id IS NULL")
    } else if (is(specialty_source_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("specialty_source_concept_id = (", as.character(specialty_source_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("specialty_source_concept_id = '", specialty_source_concept_id,"'"))
    }
  }

  if (!missing(gender_source_value)) {
    if (is.null(gender_source_value)) {
      whereClauses <- c(whereClauses, "gender_source_value IS NULL")
    } else if (is(gender_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("gender_source_value = (", as.character(gender_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("gender_source_value = '", gender_source_value,"'"))
    }
  }

  if (!missing(gender_source_concept_id)) {
    if (is.null(gender_source_concept_id)) {
      whereClauses <- c(whereClauses, "gender_source_concept_id IS NULL")
    } else if (is(gender_source_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("gender_source_concept_id = (", as.character(gender_source_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("gender_source_concept_id = '", gender_source_concept_id,"'"))
    }
  }

 statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") != ",rowCount ," THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

expect_count_condition_occurrence <- function(rowCount, condition_occurrence_id, person_id, condition_concept_id, condition_start_date, condition_end_date, condition_type_concept_id, stop_reason, provider_id, visit_occurrence_id, condition_source_value, condition_source_concept_id) {

  if (is.null(frameworkContext$currentGroup)) {
    testName <- frameworkContext$testDescription;
  } else {
    testName <- paste0(frameworkContext$groupIndex, ".", frameworkContext$currentGroup$groupItemIndex, " ", frameworkContext$testDescription);
  }

  source_pid <- frameworkContext$patient$source_pid;
  if (is.null(source_pid)) {
    source_pid <- "NULL";
  } else {
    source_pid <- paste0("'", as.character(source_pid), "'");
  }

  cdm_pid <- frameworkContext$patient$cdm_pid;
  if (is.null(cdm_pid)) {
    cdm_pid <- "NULL"
  }

  statement <- paste0("INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT ", frameworkContext$testId, " AS id, '", testName, "' AS description, 'Expect condition_occurrence' AS test, ", source_pid, " as source_pid, ", cdm_pid, " as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.condition_occurrence WHERE ")
  whereClauses = NULL;
  if (!missing(condition_occurrence_id)) {
    if (is.null(condition_occurrence_id)) {
      whereClauses <- c(whereClauses, "condition_occurrence_id IS NULL")
    } else if (is(condition_occurrence_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("condition_occurrence_id = (", as.character(condition_occurrence_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("condition_occurrence_id = '", condition_occurrence_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(condition_concept_id)) {
    if (is.null(condition_concept_id)) {
      whereClauses <- c(whereClauses, "condition_concept_id IS NULL")
    } else if (is(condition_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("condition_concept_id = (", as.character(condition_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("condition_concept_id = '", condition_concept_id,"'"))
    }
  }

  if (!missing(condition_start_date)) {
    if (is.null(condition_start_date)) {
      whereClauses <- c(whereClauses, "condition_start_date IS NULL")
    } else if (is(condition_start_date, "subQuery")){
      whereClauses <- c(whereClauses, paste0("condition_start_date = (", as.character(condition_start_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("condition_start_date = '", condition_start_date,"'"))
    }
  }

  if (!missing(condition_end_date)) {
    if (is.null(condition_end_date)) {
      whereClauses <- c(whereClauses, "condition_end_date IS NULL")
    } else if (is(condition_end_date, "subQuery")){
      whereClauses <- c(whereClauses, paste0("condition_end_date = (", as.character(condition_end_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("condition_end_date = '", condition_end_date,"'"))
    }
  }

  if (!missing(condition_type_concept_id)) {
    if (is.null(condition_type_concept_id)) {
      whereClauses <- c(whereClauses, "condition_type_concept_id IS NULL")
    } else if (is(condition_type_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("condition_type_concept_id = (", as.character(condition_type_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("condition_type_concept_id = '", condition_type_concept_id,"'"))
    }
  }

  if (!missing(stop_reason)) {
    if (is.null(stop_reason)) {
      whereClauses <- c(whereClauses, "stop_reason IS NULL")
    } else if (is(stop_reason, "subQuery")){
      whereClauses <- c(whereClauses, paste0("stop_reason = (", as.character(stop_reason), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("stop_reason = '", stop_reason,"'"))
    }
  }

  if (!missing(provider_id)) {
    if (is.null(provider_id)) {
      whereClauses <- c(whereClauses, "provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("provider_id = (", as.character(provider_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("provider_id = '", provider_id,"'"))
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (is.null(visit_occurrence_id)) {
      whereClauses <- c(whereClauses, "visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("visit_occurrence_id = (", as.character(visit_occurrence_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_occurrence_id = '", visit_occurrence_id,"'"))
    }
  }

  if (!missing(condition_source_value)) {
    if (is.null(condition_source_value)) {
      whereClauses <- c(whereClauses, "condition_source_value IS NULL")
    } else if (is(condition_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("condition_source_value = (", as.character(condition_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("condition_source_value = '", condition_source_value,"'"))
    }
  }

  if (!missing(condition_source_concept_id)) {
    if (is.null(condition_source_concept_id)) {
      whereClauses <- c(whereClauses, "condition_source_concept_id IS NULL")
    } else if (is(condition_source_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("condition_source_concept_id = (", as.character(condition_source_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("condition_source_concept_id = '", condition_source_concept_id,"'"))
    }
  }

 statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") != ",rowCount ," THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

expect_count_death <- function(rowCount, person_id, death_date, death_type_concept_id, cause_concept_id, cause_source_value, cause_source_concept_id) {

  if (is.null(frameworkContext$currentGroup)) {
    testName <- frameworkContext$testDescription;
  } else {
    testName <- paste0(frameworkContext$groupIndex, ".", frameworkContext$currentGroup$groupItemIndex, " ", frameworkContext$testDescription);
  }

  source_pid <- frameworkContext$patient$source_pid;
  if (is.null(source_pid)) {
    source_pid <- "NULL";
  } else {
    source_pid <- paste0("'", as.character(source_pid), "'");
  }

  cdm_pid <- frameworkContext$patient$cdm_pid;
  if (is.null(cdm_pid)) {
    cdm_pid <- "NULL"
  }

  statement <- paste0("INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT ", frameworkContext$testId, " AS id, '", testName, "' AS description, 'Expect death' AS test, ", source_pid, " as source_pid, ", cdm_pid, " as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.death WHERE ")
  whereClauses = NULL;
  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(death_date)) {
    if (is.null(death_date)) {
      whereClauses <- c(whereClauses, "death_date IS NULL")
    } else if (is(death_date, "subQuery")){
      whereClauses <- c(whereClauses, paste0("death_date = (", as.character(death_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("death_date = '", death_date,"'"))
    }
  }

  if (!missing(death_type_concept_id)) {
    if (is.null(death_type_concept_id)) {
      whereClauses <- c(whereClauses, "death_type_concept_id IS NULL")
    } else if (is(death_type_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("death_type_concept_id = (", as.character(death_type_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("death_type_concept_id = '", death_type_concept_id,"'"))
    }
  }

  if (!missing(cause_concept_id)) {
    if (is.null(cause_concept_id)) {
      whereClauses <- c(whereClauses, "cause_concept_id IS NULL")
    } else if (is(cause_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("cause_concept_id = (", as.character(cause_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cause_concept_id = '", cause_concept_id,"'"))
    }
  }

  if (!missing(cause_source_value)) {
    if (is.null(cause_source_value)) {
      whereClauses <- c(whereClauses, "cause_source_value IS NULL")
    } else if (is(cause_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("cause_source_value = (", as.character(cause_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cause_source_value = '", cause_source_value,"'"))
    }
  }

  if (!missing(cause_source_concept_id)) {
    if (is.null(cause_source_concept_id)) {
      whereClauses <- c(whereClauses, "cause_source_concept_id IS NULL")
    } else if (is(cause_source_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("cause_source_concept_id = (", as.character(cause_source_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cause_source_concept_id = '", cause_source_concept_id,"'"))
    }
  }

 statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") != ",rowCount ," THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

expect_count_drug_exposure <- function(rowCount, drug_exposure_id, person_id, drug_concept_id, drug_exposure_start_date, drug_exposure_end_date, drug_type_concept_id, stop_reason, refills, quantity, days_supply, sig, route_concept_id, effective_drug_dose, dose_unit_concept_id, lot_number, provider_id, visit_occurrence_id, drug_source_value, drug_source_concept_id, route_source_value, dose_unit_source_value) {

  if (is.null(frameworkContext$currentGroup)) {
    testName <- frameworkContext$testDescription;
  } else {
    testName <- paste0(frameworkContext$groupIndex, ".", frameworkContext$currentGroup$groupItemIndex, " ", frameworkContext$testDescription);
  }

  source_pid <- frameworkContext$patient$source_pid;
  if (is.null(source_pid)) {
    source_pid <- "NULL";
  } else {
    source_pid <- paste0("'", as.character(source_pid), "'");
  }

  cdm_pid <- frameworkContext$patient$cdm_pid;
  if (is.null(cdm_pid)) {
    cdm_pid <- "NULL"
  }

  statement <- paste0("INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT ", frameworkContext$testId, " AS id, '", testName, "' AS description, 'Expect drug_exposure' AS test, ", source_pid, " as source_pid, ", cdm_pid, " as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.drug_exposure WHERE ")
  whereClauses = NULL;
  if (!missing(drug_exposure_id)) {
    if (is.null(drug_exposure_id)) {
      whereClauses <- c(whereClauses, "drug_exposure_id IS NULL")
    } else if (is(drug_exposure_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("drug_exposure_id = (", as.character(drug_exposure_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("drug_exposure_id = '", drug_exposure_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(drug_concept_id)) {
    if (is.null(drug_concept_id)) {
      whereClauses <- c(whereClauses, "drug_concept_id IS NULL")
    } else if (is(drug_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("drug_concept_id = (", as.character(drug_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("drug_concept_id = '", drug_concept_id,"'"))
    }
  }

  if (!missing(drug_exposure_start_date)) {
    if (is.null(drug_exposure_start_date)) {
      whereClauses <- c(whereClauses, "drug_exposure_start_date IS NULL")
    } else if (is(drug_exposure_start_date, "subQuery")){
      whereClauses <- c(whereClauses, paste0("drug_exposure_start_date = (", as.character(drug_exposure_start_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("drug_exposure_start_date = '", drug_exposure_start_date,"'"))
    }
  }

  if (!missing(drug_exposure_end_date)) {
    if (is.null(drug_exposure_end_date)) {
      whereClauses <- c(whereClauses, "drug_exposure_end_date IS NULL")
    } else if (is(drug_exposure_end_date, "subQuery")){
      whereClauses <- c(whereClauses, paste0("drug_exposure_end_date = (", as.character(drug_exposure_end_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("drug_exposure_end_date = '", drug_exposure_end_date,"'"))
    }
  }

  if (!missing(drug_type_concept_id)) {
    if (is.null(drug_type_concept_id)) {
      whereClauses <- c(whereClauses, "drug_type_concept_id IS NULL")
    } else if (is(drug_type_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("drug_type_concept_id = (", as.character(drug_type_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("drug_type_concept_id = '", drug_type_concept_id,"'"))
    }
  }

  if (!missing(stop_reason)) {
    if (is.null(stop_reason)) {
      whereClauses <- c(whereClauses, "stop_reason IS NULL")
    } else if (is(stop_reason, "subQuery")){
      whereClauses <- c(whereClauses, paste0("stop_reason = (", as.character(stop_reason), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("stop_reason = '", stop_reason,"'"))
    }
  }

  if (!missing(refills)) {
    if (is.null(refills)) {
      whereClauses <- c(whereClauses, "refills IS NULL")
    } else if (is(refills, "subQuery")){
      whereClauses <- c(whereClauses, paste0("refills = (", as.character(refills), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("refills = '", refills,"'"))
    }
  }

  if (!missing(quantity)) {
    if (is.null(quantity)) {
      whereClauses <- c(whereClauses, "quantity IS NULL")
    } else if (is(quantity, "subQuery")){
      whereClauses <- c(whereClauses, paste0("quantity = (", as.character(quantity), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("quantity = '", quantity,"'"))
    }
  }

  if (!missing(days_supply)) {
    if (is.null(days_supply)) {
      whereClauses <- c(whereClauses, "days_supply IS NULL")
    } else if (is(days_supply, "subQuery")){
      whereClauses <- c(whereClauses, paste0("days_supply = (", as.character(days_supply), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("days_supply = '", days_supply,"'"))
    }
  }

  if (!missing(sig)) {
    if (is.null(sig)) {
      whereClauses <- c(whereClauses, "sig IS NULL")
    } else if (is(sig, "subQuery")){
      whereClauses <- c(whereClauses, paste0("sig = (", as.character(sig), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("sig = '", sig,"'"))
    }
  }

  if (!missing(route_concept_id)) {
    if (is.null(route_concept_id)) {
      whereClauses <- c(whereClauses, "route_concept_id IS NULL")
    } else if (is(route_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("route_concept_id = (", as.character(route_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("route_concept_id = '", route_concept_id,"'"))
    }
  }

  if (!missing(effective_drug_dose)) {
    if (is.null(effective_drug_dose)) {
      whereClauses <- c(whereClauses, "effective_drug_dose IS NULL")
    } else if (is(effective_drug_dose, "subQuery")){
      whereClauses <- c(whereClauses, paste0("effective_drug_dose = (", as.character(effective_drug_dose), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("effective_drug_dose = '", effective_drug_dose,"'"))
    }
  }

  if (!missing(dose_unit_concept_id)) {
    if (is.null(dose_unit_concept_id)) {
      whereClauses <- c(whereClauses, "dose_unit_concept_id IS NULL")
    } else if (is(dose_unit_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("dose_unit_concept_id = (", as.character(dose_unit_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("dose_unit_concept_id = '", dose_unit_concept_id,"'"))
    }
  }

  if (!missing(lot_number)) {
    if (is.null(lot_number)) {
      whereClauses <- c(whereClauses, "lot_number IS NULL")
    } else if (is(lot_number, "subQuery")){
      whereClauses <- c(whereClauses, paste0("lot_number = (", as.character(lot_number), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("lot_number = '", lot_number,"'"))
    }
  }

  if (!missing(provider_id)) {
    if (is.null(provider_id)) {
      whereClauses <- c(whereClauses, "provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("provider_id = (", as.character(provider_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("provider_id = '", provider_id,"'"))
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (is.null(visit_occurrence_id)) {
      whereClauses <- c(whereClauses, "visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("visit_occurrence_id = (", as.character(visit_occurrence_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_occurrence_id = '", visit_occurrence_id,"'"))
    }
  }

  if (!missing(drug_source_value)) {
    if (is.null(drug_source_value)) {
      whereClauses <- c(whereClauses, "drug_source_value IS NULL")
    } else if (is(drug_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("drug_source_value = (", as.character(drug_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("drug_source_value = '", drug_source_value,"'"))
    }
  }

  if (!missing(drug_source_concept_id)) {
    if (is.null(drug_source_concept_id)) {
      whereClauses <- c(whereClauses, "drug_source_concept_id IS NULL")
    } else if (is(drug_source_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("drug_source_concept_id = (", as.character(drug_source_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("drug_source_concept_id = '", drug_source_concept_id,"'"))
    }
  }

  if (!missing(route_source_value)) {
    if (is.null(route_source_value)) {
      whereClauses <- c(whereClauses, "route_source_value IS NULL")
    } else if (is(route_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("route_source_value = (", as.character(route_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("route_source_value = '", route_source_value,"'"))
    }
  }

  if (!missing(dose_unit_source_value)) {
    if (is.null(dose_unit_source_value)) {
      whereClauses <- c(whereClauses, "dose_unit_source_value IS NULL")
    } else if (is(dose_unit_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("dose_unit_source_value = (", as.character(dose_unit_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("dose_unit_source_value = '", dose_unit_source_value,"'"))
    }
  }

 statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") != ",rowCount ," THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

expect_count_device_exposure <- function(rowCount, device_exposure_id, person_id, device_concept_id, device_exposure_start_date, device_exposure_end_date, device_type_concept_id, unique_device_id, quantity, provider_id, visit_occurrence_id, device_source_value, device_source_concept_id) {

  if (is.null(frameworkContext$currentGroup)) {
    testName <- frameworkContext$testDescription;
  } else {
    testName <- paste0(frameworkContext$groupIndex, ".", frameworkContext$currentGroup$groupItemIndex, " ", frameworkContext$testDescription);
  }

  source_pid <- frameworkContext$patient$source_pid;
  if (is.null(source_pid)) {
    source_pid <- "NULL";
  } else {
    source_pid <- paste0("'", as.character(source_pid), "'");
  }

  cdm_pid <- frameworkContext$patient$cdm_pid;
  if (is.null(cdm_pid)) {
    cdm_pid <- "NULL"
  }

  statement <- paste0("INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT ", frameworkContext$testId, " AS id, '", testName, "' AS description, 'Expect device_exposure' AS test, ", source_pid, " as source_pid, ", cdm_pid, " as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.device_exposure WHERE ")
  whereClauses = NULL;
  if (!missing(device_exposure_id)) {
    if (is.null(device_exposure_id)) {
      whereClauses <- c(whereClauses, "device_exposure_id IS NULL")
    } else if (is(device_exposure_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("device_exposure_id = (", as.character(device_exposure_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("device_exposure_id = '", device_exposure_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(device_concept_id)) {
    if (is.null(device_concept_id)) {
      whereClauses <- c(whereClauses, "device_concept_id IS NULL")
    } else if (is(device_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("device_concept_id = (", as.character(device_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("device_concept_id = '", device_concept_id,"'"))
    }
  }

  if (!missing(device_exposure_start_date)) {
    if (is.null(device_exposure_start_date)) {
      whereClauses <- c(whereClauses, "device_exposure_start_date IS NULL")
    } else if (is(device_exposure_start_date, "subQuery")){
      whereClauses <- c(whereClauses, paste0("device_exposure_start_date = (", as.character(device_exposure_start_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("device_exposure_start_date = '", device_exposure_start_date,"'"))
    }
  }

  if (!missing(device_exposure_end_date)) {
    if (is.null(device_exposure_end_date)) {
      whereClauses <- c(whereClauses, "device_exposure_end_date IS NULL")
    } else if (is(device_exposure_end_date, "subQuery")){
      whereClauses <- c(whereClauses, paste0("device_exposure_end_date = (", as.character(device_exposure_end_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("device_exposure_end_date = '", device_exposure_end_date,"'"))
    }
  }

  if (!missing(device_type_concept_id)) {
    if (is.null(device_type_concept_id)) {
      whereClauses <- c(whereClauses, "device_type_concept_id IS NULL")
    } else if (is(device_type_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("device_type_concept_id = (", as.character(device_type_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("device_type_concept_id = '", device_type_concept_id,"'"))
    }
  }

  if (!missing(unique_device_id)) {
    if (is.null(unique_device_id)) {
      whereClauses <- c(whereClauses, "unique_device_id IS NULL")
    } else if (is(unique_device_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("unique_device_id = (", as.character(unique_device_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("unique_device_id = '", unique_device_id,"'"))
    }
  }

  if (!missing(quantity)) {
    if (is.null(quantity)) {
      whereClauses <- c(whereClauses, "quantity IS NULL")
    } else if (is(quantity, "subQuery")){
      whereClauses <- c(whereClauses, paste0("quantity = (", as.character(quantity), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("quantity = '", quantity,"'"))
    }
  }

  if (!missing(provider_id)) {
    if (is.null(provider_id)) {
      whereClauses <- c(whereClauses, "provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("provider_id = (", as.character(provider_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("provider_id = '", provider_id,"'"))
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (is.null(visit_occurrence_id)) {
      whereClauses <- c(whereClauses, "visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("visit_occurrence_id = (", as.character(visit_occurrence_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_occurrence_id = '", visit_occurrence_id,"'"))
    }
  }

  if (!missing(device_source_value)) {
    if (is.null(device_source_value)) {
      whereClauses <- c(whereClauses, "device_source_value IS NULL")
    } else if (is(device_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("device_source_value = (", as.character(device_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("device_source_value = '", device_source_value,"'"))
    }
  }

  if (!missing(device_source_concept_id)) {
    if (is.null(device_source_concept_id)) {
      whereClauses <- c(whereClauses, "device_source_concept_id IS NULL")
    } else if (is(device_source_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("device_source_concept_id = (", as.character(device_source_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("device_source_concept_id = '", device_source_concept_id,"'"))
    }
  }

 statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") != ",rowCount ," THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

expect_count_procedure_occurrence <- function(rowCount, procedure_occurrence_id, person_id, procedure_concept_id, procedure_date, procedure_type_concept_id, modifier_concept_id, quantity, provider_id, visit_occurrence_id, procedure_source_value, procedure_source_concept_id, qualifier_source_value) {

  if (is.null(frameworkContext$currentGroup)) {
    testName <- frameworkContext$testDescription;
  } else {
    testName <- paste0(frameworkContext$groupIndex, ".", frameworkContext$currentGroup$groupItemIndex, " ", frameworkContext$testDescription);
  }

  source_pid <- frameworkContext$patient$source_pid;
  if (is.null(source_pid)) {
    source_pid <- "NULL";
  } else {
    source_pid <- paste0("'", as.character(source_pid), "'");
  }

  cdm_pid <- frameworkContext$patient$cdm_pid;
  if (is.null(cdm_pid)) {
    cdm_pid <- "NULL"
  }

  statement <- paste0("INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT ", frameworkContext$testId, " AS id, '", testName, "' AS description, 'Expect procedure_occurrence' AS test, ", source_pid, " as source_pid, ", cdm_pid, " as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.procedure_occurrence WHERE ")
  whereClauses = NULL;
  if (!missing(procedure_occurrence_id)) {
    if (is.null(procedure_occurrence_id)) {
      whereClauses <- c(whereClauses, "procedure_occurrence_id IS NULL")
    } else if (is(procedure_occurrence_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("procedure_occurrence_id = (", as.character(procedure_occurrence_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("procedure_occurrence_id = '", procedure_occurrence_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(procedure_concept_id)) {
    if (is.null(procedure_concept_id)) {
      whereClauses <- c(whereClauses, "procedure_concept_id IS NULL")
    } else if (is(procedure_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("procedure_concept_id = (", as.character(procedure_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("procedure_concept_id = '", procedure_concept_id,"'"))
    }
  }

  if (!missing(procedure_date)) {
    if (is.null(procedure_date)) {
      whereClauses <- c(whereClauses, "procedure_date IS NULL")
    } else if (is(procedure_date, "subQuery")){
      whereClauses <- c(whereClauses, paste0("procedure_date = (", as.character(procedure_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("procedure_date = '", procedure_date,"'"))
    }
  }

  if (!missing(procedure_type_concept_id)) {
    if (is.null(procedure_type_concept_id)) {
      whereClauses <- c(whereClauses, "procedure_type_concept_id IS NULL")
    } else if (is(procedure_type_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("procedure_type_concept_id = (", as.character(procedure_type_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("procedure_type_concept_id = '", procedure_type_concept_id,"'"))
    }
  }

  if (!missing(modifier_concept_id)) {
    if (is.null(modifier_concept_id)) {
      whereClauses <- c(whereClauses, "modifier_concept_id IS NULL")
    } else if (is(modifier_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("modifier_concept_id = (", as.character(modifier_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("modifier_concept_id = '", modifier_concept_id,"'"))
    }
  }

  if (!missing(quantity)) {
    if (is.null(quantity)) {
      whereClauses <- c(whereClauses, "quantity IS NULL")
    } else if (is(quantity, "subQuery")){
      whereClauses <- c(whereClauses, paste0("quantity = (", as.character(quantity), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("quantity = '", quantity,"'"))
    }
  }

  if (!missing(provider_id)) {
    if (is.null(provider_id)) {
      whereClauses <- c(whereClauses, "provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("provider_id = (", as.character(provider_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("provider_id = '", provider_id,"'"))
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (is.null(visit_occurrence_id)) {
      whereClauses <- c(whereClauses, "visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("visit_occurrence_id = (", as.character(visit_occurrence_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_occurrence_id = '", visit_occurrence_id,"'"))
    }
  }

  if (!missing(procedure_source_value)) {
    if (is.null(procedure_source_value)) {
      whereClauses <- c(whereClauses, "procedure_source_value IS NULL")
    } else if (is(procedure_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("procedure_source_value = (", as.character(procedure_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("procedure_source_value = '", procedure_source_value,"'"))
    }
  }

  if (!missing(procedure_source_concept_id)) {
    if (is.null(procedure_source_concept_id)) {
      whereClauses <- c(whereClauses, "procedure_source_concept_id IS NULL")
    } else if (is(procedure_source_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("procedure_source_concept_id = (", as.character(procedure_source_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("procedure_source_concept_id = '", procedure_source_concept_id,"'"))
    }
  }

  if (!missing(qualifier_source_value)) {
    if (is.null(qualifier_source_value)) {
      whereClauses <- c(whereClauses, "qualifier_source_value IS NULL")
    } else if (is(qualifier_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("qualifier_source_value = (", as.character(qualifier_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("qualifier_source_value = '", qualifier_source_value,"'"))
    }
  }

 statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") != ",rowCount ," THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

expect_count_measurement <- function(rowCount, measurement_id, person_id, measurement_concept_id, measurement_date, measurement_time, measurement_type_concept_id, operator_concept_id, value_as_number, value_as_concept_id, unit_concept_id, range_low, range_high, provider_id, visit_occurrence_id, measurement_source_value, measurement_source_concept_id, unit_source_value, value_source_value) {

  if (is.null(frameworkContext$currentGroup)) {
    testName <- frameworkContext$testDescription;
  } else {
    testName <- paste0(frameworkContext$groupIndex, ".", frameworkContext$currentGroup$groupItemIndex, " ", frameworkContext$testDescription);
  }

  source_pid <- frameworkContext$patient$source_pid;
  if (is.null(source_pid)) {
    source_pid <- "NULL";
  } else {
    source_pid <- paste0("'", as.character(source_pid), "'");
  }

  cdm_pid <- frameworkContext$patient$cdm_pid;
  if (is.null(cdm_pid)) {
    cdm_pid <- "NULL"
  }

  statement <- paste0("INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT ", frameworkContext$testId, " AS id, '", testName, "' AS description, 'Expect measurement' AS test, ", source_pid, " as source_pid, ", cdm_pid, " as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.measurement WHERE ")
  whereClauses = NULL;
  if (!missing(measurement_id)) {
    if (is.null(measurement_id)) {
      whereClauses <- c(whereClauses, "measurement_id IS NULL")
    } else if (is(measurement_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("measurement_id = (", as.character(measurement_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("measurement_id = '", measurement_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(measurement_concept_id)) {
    if (is.null(measurement_concept_id)) {
      whereClauses <- c(whereClauses, "measurement_concept_id IS NULL")
    } else if (is(measurement_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("measurement_concept_id = (", as.character(measurement_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("measurement_concept_id = '", measurement_concept_id,"'"))
    }
  }

  if (!missing(measurement_date)) {
    if (is.null(measurement_date)) {
      whereClauses <- c(whereClauses, "measurement_date IS NULL")
    } else if (is(measurement_date, "subQuery")){
      whereClauses <- c(whereClauses, paste0("measurement_date = (", as.character(measurement_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("measurement_date = '", measurement_date,"'"))
    }
  }

  if (!missing(measurement_time)) {
    if (is.null(measurement_time)) {
      whereClauses <- c(whereClauses, "measurement_time IS NULL")
    } else if (is(measurement_time, "subQuery")){
      whereClauses <- c(whereClauses, paste0("measurement_time = (", as.character(measurement_time), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("measurement_time = '", measurement_time,"'"))
    }
  }

  if (!missing(measurement_type_concept_id)) {
    if (is.null(measurement_type_concept_id)) {
      whereClauses <- c(whereClauses, "measurement_type_concept_id IS NULL")
    } else if (is(measurement_type_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("measurement_type_concept_id = (", as.character(measurement_type_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("measurement_type_concept_id = '", measurement_type_concept_id,"'"))
    }
  }

  if (!missing(operator_concept_id)) {
    if (is.null(operator_concept_id)) {
      whereClauses <- c(whereClauses, "operator_concept_id IS NULL")
    } else if (is(operator_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("operator_concept_id = (", as.character(operator_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("operator_concept_id = '", operator_concept_id,"'"))
    }
  }

  if (!missing(value_as_number)) {
    if (is.null(value_as_number)) {
      whereClauses <- c(whereClauses, "value_as_number IS NULL")
    } else if (is(value_as_number, "subQuery")){
      whereClauses <- c(whereClauses, paste0("value_as_number = (", as.character(value_as_number), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("value_as_number = '", value_as_number,"'"))
    }
  }

  if (!missing(value_as_concept_id)) {
    if (is.null(value_as_concept_id)) {
      whereClauses <- c(whereClauses, "value_as_concept_id IS NULL")
    } else if (is(value_as_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("value_as_concept_id = (", as.character(value_as_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("value_as_concept_id = '", value_as_concept_id,"'"))
    }
  }

  if (!missing(unit_concept_id)) {
    if (is.null(unit_concept_id)) {
      whereClauses <- c(whereClauses, "unit_concept_id IS NULL")
    } else if (is(unit_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("unit_concept_id = (", as.character(unit_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("unit_concept_id = '", unit_concept_id,"'"))
    }
  }

  if (!missing(range_low)) {
    if (is.null(range_low)) {
      whereClauses <- c(whereClauses, "range_low IS NULL")
    } else if (is(range_low, "subQuery")){
      whereClauses <- c(whereClauses, paste0("range_low = (", as.character(range_low), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("range_low = '", range_low,"'"))
    }
  }

  if (!missing(range_high)) {
    if (is.null(range_high)) {
      whereClauses <- c(whereClauses, "range_high IS NULL")
    } else if (is(range_high, "subQuery")){
      whereClauses <- c(whereClauses, paste0("range_high = (", as.character(range_high), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("range_high = '", range_high,"'"))
    }
  }

  if (!missing(provider_id)) {
    if (is.null(provider_id)) {
      whereClauses <- c(whereClauses, "provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("provider_id = (", as.character(provider_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("provider_id = '", provider_id,"'"))
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (is.null(visit_occurrence_id)) {
      whereClauses <- c(whereClauses, "visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("visit_occurrence_id = (", as.character(visit_occurrence_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_occurrence_id = '", visit_occurrence_id,"'"))
    }
  }

  if (!missing(measurement_source_value)) {
    if (is.null(measurement_source_value)) {
      whereClauses <- c(whereClauses, "measurement_source_value IS NULL")
    } else if (is(measurement_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("measurement_source_value = (", as.character(measurement_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("measurement_source_value = '", measurement_source_value,"'"))
    }
  }

  if (!missing(measurement_source_concept_id)) {
    if (is.null(measurement_source_concept_id)) {
      whereClauses <- c(whereClauses, "measurement_source_concept_id IS NULL")
    } else if (is(measurement_source_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("measurement_source_concept_id = (", as.character(measurement_source_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("measurement_source_concept_id = '", measurement_source_concept_id,"'"))
    }
  }

  if (!missing(unit_source_value)) {
    if (is.null(unit_source_value)) {
      whereClauses <- c(whereClauses, "unit_source_value IS NULL")
    } else if (is(unit_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("unit_source_value = (", as.character(unit_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("unit_source_value = '", unit_source_value,"'"))
    }
  }

  if (!missing(value_source_value)) {
    if (is.null(value_source_value)) {
      whereClauses <- c(whereClauses, "value_source_value IS NULL")
    } else if (is(value_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("value_source_value = (", as.character(value_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("value_source_value = '", value_source_value,"'"))
    }
  }

 statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") != ",rowCount ," THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

expect_count_observation <- function(rowCount, observation_id, person_id, observation_concept_id, observation_date, observation_time, observation_type_concept_id, value_as_number, value_as_string, value_as_concept_id, qualifier_concept_id, unit_concept_id, provider_id, visit_occurrence_id, observation_source_value, observation_source_concept_id, unit_source_value, qualifier_source_value) {

  if (is.null(frameworkContext$currentGroup)) {
    testName <- frameworkContext$testDescription;
  } else {
    testName <- paste0(frameworkContext$groupIndex, ".", frameworkContext$currentGroup$groupItemIndex, " ", frameworkContext$testDescription);
  }

  source_pid <- frameworkContext$patient$source_pid;
  if (is.null(source_pid)) {
    source_pid <- "NULL";
  } else {
    source_pid <- paste0("'", as.character(source_pid), "'");
  }

  cdm_pid <- frameworkContext$patient$cdm_pid;
  if (is.null(cdm_pid)) {
    cdm_pid <- "NULL"
  }

  statement <- paste0("INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT ", frameworkContext$testId, " AS id, '", testName, "' AS description, 'Expect observation' AS test, ", source_pid, " as source_pid, ", cdm_pid, " as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.observation WHERE ")
  whereClauses = NULL;
  if (!missing(observation_id)) {
    if (is.null(observation_id)) {
      whereClauses <- c(whereClauses, "observation_id IS NULL")
    } else if (is(observation_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("observation_id = (", as.character(observation_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("observation_id = '", observation_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(observation_concept_id)) {
    if (is.null(observation_concept_id)) {
      whereClauses <- c(whereClauses, "observation_concept_id IS NULL")
    } else if (is(observation_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("observation_concept_id = (", as.character(observation_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("observation_concept_id = '", observation_concept_id,"'"))
    }
  }

  if (!missing(observation_date)) {
    if (is.null(observation_date)) {
      whereClauses <- c(whereClauses, "observation_date IS NULL")
    } else if (is(observation_date, "subQuery")){
      whereClauses <- c(whereClauses, paste0("observation_date = (", as.character(observation_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("observation_date = '", observation_date,"'"))
    }
  }

  if (!missing(observation_time)) {
    if (is.null(observation_time)) {
      whereClauses <- c(whereClauses, "observation_time IS NULL")
    } else if (is(observation_time, "subQuery")){
      whereClauses <- c(whereClauses, paste0("observation_time = (", as.character(observation_time), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("observation_time = '", observation_time,"'"))
    }
  }

  if (!missing(observation_type_concept_id)) {
    if (is.null(observation_type_concept_id)) {
      whereClauses <- c(whereClauses, "observation_type_concept_id IS NULL")
    } else if (is(observation_type_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("observation_type_concept_id = (", as.character(observation_type_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("observation_type_concept_id = '", observation_type_concept_id,"'"))
    }
  }

  if (!missing(value_as_number)) {
    if (is.null(value_as_number)) {
      whereClauses <- c(whereClauses, "value_as_number IS NULL")
    } else if (is(value_as_number, "subQuery")){
      whereClauses <- c(whereClauses, paste0("value_as_number = (", as.character(value_as_number), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("value_as_number = '", value_as_number,"'"))
    }
  }

  if (!missing(value_as_string)) {
    if (is.null(value_as_string)) {
      whereClauses <- c(whereClauses, "value_as_string IS NULL")
    } else if (is(value_as_string, "subQuery")){
      whereClauses <- c(whereClauses, paste0("value_as_string = (", as.character(value_as_string), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("value_as_string = '", value_as_string,"'"))
    }
  }

  if (!missing(value_as_concept_id)) {
    if (is.null(value_as_concept_id)) {
      whereClauses <- c(whereClauses, "value_as_concept_id IS NULL")
    } else if (is(value_as_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("value_as_concept_id = (", as.character(value_as_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("value_as_concept_id = '", value_as_concept_id,"'"))
    }
  }

  if (!missing(qualifier_concept_id)) {
    if (is.null(qualifier_concept_id)) {
      whereClauses <- c(whereClauses, "qualifier_concept_id IS NULL")
    } else if (is(qualifier_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("qualifier_concept_id = (", as.character(qualifier_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("qualifier_concept_id = '", qualifier_concept_id,"'"))
    }
  }

  if (!missing(unit_concept_id)) {
    if (is.null(unit_concept_id)) {
      whereClauses <- c(whereClauses, "unit_concept_id IS NULL")
    } else if (is(unit_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("unit_concept_id = (", as.character(unit_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("unit_concept_id = '", unit_concept_id,"'"))
    }
  }

  if (!missing(provider_id)) {
    if (is.null(provider_id)) {
      whereClauses <- c(whereClauses, "provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("provider_id = (", as.character(provider_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("provider_id = '", provider_id,"'"))
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (is.null(visit_occurrence_id)) {
      whereClauses <- c(whereClauses, "visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("visit_occurrence_id = (", as.character(visit_occurrence_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_occurrence_id = '", visit_occurrence_id,"'"))
    }
  }

  if (!missing(observation_source_value)) {
    if (is.null(observation_source_value)) {
      whereClauses <- c(whereClauses, "observation_source_value IS NULL")
    } else if (is(observation_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("observation_source_value = (", as.character(observation_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("observation_source_value = '", observation_source_value,"'"))
    }
  }

  if (!missing(observation_source_concept_id)) {
    if (is.null(observation_source_concept_id)) {
      whereClauses <- c(whereClauses, "observation_source_concept_id IS NULL")
    } else if (is(observation_source_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("observation_source_concept_id = (", as.character(observation_source_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("observation_source_concept_id = '", observation_source_concept_id,"'"))
    }
  }

  if (!missing(unit_source_value)) {
    if (is.null(unit_source_value)) {
      whereClauses <- c(whereClauses, "unit_source_value IS NULL")
    } else if (is(unit_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("unit_source_value = (", as.character(unit_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("unit_source_value = '", unit_source_value,"'"))
    }
  }

  if (!missing(qualifier_source_value)) {
    if (is.null(qualifier_source_value)) {
      whereClauses <- c(whereClauses, "qualifier_source_value IS NULL")
    } else if (is(qualifier_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("qualifier_source_value = (", as.character(qualifier_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("qualifier_source_value = '", qualifier_source_value,"'"))
    }
  }

 statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") != ",rowCount ," THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

expect_count_note <- function(rowCount, note_id, person_id, note_date, note_time, note_type_concept_id, note_text, provider_id, visit_occurrence_id, note_source_value) {

  if (is.null(frameworkContext$currentGroup)) {
    testName <- frameworkContext$testDescription;
  } else {
    testName <- paste0(frameworkContext$groupIndex, ".", frameworkContext$currentGroup$groupItemIndex, " ", frameworkContext$testDescription);
  }

  source_pid <- frameworkContext$patient$source_pid;
  if (is.null(source_pid)) {
    source_pid <- "NULL";
  } else {
    source_pid <- paste0("'", as.character(source_pid), "'");
  }

  cdm_pid <- frameworkContext$patient$cdm_pid;
  if (is.null(cdm_pid)) {
    cdm_pid <- "NULL"
  }

  statement <- paste0("INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT ", frameworkContext$testId, " AS id, '", testName, "' AS description, 'Expect note' AS test, ", source_pid, " as source_pid, ", cdm_pid, " as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.note WHERE ")
  whereClauses = NULL;
  if (!missing(note_id)) {
    if (is.null(note_id)) {
      whereClauses <- c(whereClauses, "note_id IS NULL")
    } else if (is(note_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("note_id = (", as.character(note_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("note_id = '", note_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(note_date)) {
    if (is.null(note_date)) {
      whereClauses <- c(whereClauses, "note_date IS NULL")
    } else if (is(note_date, "subQuery")){
      whereClauses <- c(whereClauses, paste0("note_date = (", as.character(note_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("note_date = '", note_date,"'"))
    }
  }

  if (!missing(note_time)) {
    if (is.null(note_time)) {
      whereClauses <- c(whereClauses, "note_time IS NULL")
    } else if (is(note_time, "subQuery")){
      whereClauses <- c(whereClauses, paste0("note_time = (", as.character(note_time), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("note_time = '", note_time,"'"))
    }
  }

  if (!missing(note_type_concept_id)) {
    if (is.null(note_type_concept_id)) {
      whereClauses <- c(whereClauses, "note_type_concept_id IS NULL")
    } else if (is(note_type_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("note_type_concept_id = (", as.character(note_type_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("note_type_concept_id = '", note_type_concept_id,"'"))
    }
  }

  if (!missing(note_text)) {
    if (is.null(note_text)) {
      whereClauses <- c(whereClauses, "note_text IS NULL")
    } else if (is(note_text, "subQuery")){
      whereClauses <- c(whereClauses, paste0("note_text = (", as.character(note_text), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("note_text = '", note_text,"'"))
    }
  }

  if (!missing(provider_id)) {
    if (is.null(provider_id)) {
      whereClauses <- c(whereClauses, "provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("provider_id = (", as.character(provider_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("provider_id = '", provider_id,"'"))
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (is.null(visit_occurrence_id)) {
      whereClauses <- c(whereClauses, "visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("visit_occurrence_id = (", as.character(visit_occurrence_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_occurrence_id = '", visit_occurrence_id,"'"))
    }
  }

  if (!missing(note_source_value)) {
    if (is.null(note_source_value)) {
      whereClauses <- c(whereClauses, "note_source_value IS NULL")
    } else if (is(note_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("note_source_value = (", as.character(note_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("note_source_value = '", note_source_value,"'"))
    }
  }

 statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") != ",rowCount ," THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

expect_count_specimen <- function(rowCount, specimen_id, person_id, specimen_concept_id, specimen_type_concept_id, specimen_date, specimen_time, quantity, unit_concept_id, anatomic_site_concept_id, disease_status_concept_id, specimen_source_id, specimen_source_value, unit_source_value, anatomic_site_source_value, disease_status_source_value) {

  if (is.null(frameworkContext$currentGroup)) {
    testName <- frameworkContext$testDescription;
  } else {
    testName <- paste0(frameworkContext$groupIndex, ".", frameworkContext$currentGroup$groupItemIndex, " ", frameworkContext$testDescription);
  }

  source_pid <- frameworkContext$patient$source_pid;
  if (is.null(source_pid)) {
    source_pid <- "NULL";
  } else {
    source_pid <- paste0("'", as.character(source_pid), "'");
  }

  cdm_pid <- frameworkContext$patient$cdm_pid;
  if (is.null(cdm_pid)) {
    cdm_pid <- "NULL"
  }

  statement <- paste0("INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT ", frameworkContext$testId, " AS id, '", testName, "' AS description, 'Expect specimen' AS test, ", source_pid, " as source_pid, ", cdm_pid, " as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.specimen WHERE ")
  whereClauses = NULL;
  if (!missing(specimen_id)) {
    if (is.null(specimen_id)) {
      whereClauses <- c(whereClauses, "specimen_id IS NULL")
    } else if (is(specimen_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("specimen_id = (", as.character(specimen_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("specimen_id = '", specimen_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(specimen_concept_id)) {
    if (is.null(specimen_concept_id)) {
      whereClauses <- c(whereClauses, "specimen_concept_id IS NULL")
    } else if (is(specimen_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("specimen_concept_id = (", as.character(specimen_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("specimen_concept_id = '", specimen_concept_id,"'"))
    }
  }

  if (!missing(specimen_type_concept_id)) {
    if (is.null(specimen_type_concept_id)) {
      whereClauses <- c(whereClauses, "specimen_type_concept_id IS NULL")
    } else if (is(specimen_type_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("specimen_type_concept_id = (", as.character(specimen_type_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("specimen_type_concept_id = '", specimen_type_concept_id,"'"))
    }
  }

  if (!missing(specimen_date)) {
    if (is.null(specimen_date)) {
      whereClauses <- c(whereClauses, "specimen_date IS NULL")
    } else if (is(specimen_date, "subQuery")){
      whereClauses <- c(whereClauses, paste0("specimen_date = (", as.character(specimen_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("specimen_date = '", specimen_date,"'"))
    }
  }

  if (!missing(specimen_time)) {
    if (is.null(specimen_time)) {
      whereClauses <- c(whereClauses, "specimen_time IS NULL")
    } else if (is(specimen_time, "subQuery")){
      whereClauses <- c(whereClauses, paste0("specimen_time = (", as.character(specimen_time), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("specimen_time = '", specimen_time,"'"))
    }
  }

  if (!missing(quantity)) {
    if (is.null(quantity)) {
      whereClauses <- c(whereClauses, "quantity IS NULL")
    } else if (is(quantity, "subQuery")){
      whereClauses <- c(whereClauses, paste0("quantity = (", as.character(quantity), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("quantity = '", quantity,"'"))
    }
  }

  if (!missing(unit_concept_id)) {
    if (is.null(unit_concept_id)) {
      whereClauses <- c(whereClauses, "unit_concept_id IS NULL")
    } else if (is(unit_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("unit_concept_id = (", as.character(unit_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("unit_concept_id = '", unit_concept_id,"'"))
    }
  }

  if (!missing(anatomic_site_concept_id)) {
    if (is.null(anatomic_site_concept_id)) {
      whereClauses <- c(whereClauses, "anatomic_site_concept_id IS NULL")
    } else if (is(anatomic_site_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("anatomic_site_concept_id = (", as.character(anatomic_site_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("anatomic_site_concept_id = '", anatomic_site_concept_id,"'"))
    }
  }

  if (!missing(disease_status_concept_id)) {
    if (is.null(disease_status_concept_id)) {
      whereClauses <- c(whereClauses, "disease_status_concept_id IS NULL")
    } else if (is(disease_status_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("disease_status_concept_id = (", as.character(disease_status_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("disease_status_concept_id = '", disease_status_concept_id,"'"))
    }
  }

  if (!missing(specimen_source_id)) {
    if (is.null(specimen_source_id)) {
      whereClauses <- c(whereClauses, "specimen_source_id IS NULL")
    } else if (is(specimen_source_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("specimen_source_id = (", as.character(specimen_source_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("specimen_source_id = '", specimen_source_id,"'"))
    }
  }

  if (!missing(specimen_source_value)) {
    if (is.null(specimen_source_value)) {
      whereClauses <- c(whereClauses, "specimen_source_value IS NULL")
    } else if (is(specimen_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("specimen_source_value = (", as.character(specimen_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("specimen_source_value = '", specimen_source_value,"'"))
    }
  }

  if (!missing(unit_source_value)) {
    if (is.null(unit_source_value)) {
      whereClauses <- c(whereClauses, "unit_source_value IS NULL")
    } else if (is(unit_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("unit_source_value = (", as.character(unit_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("unit_source_value = '", unit_source_value,"'"))
    }
  }

  if (!missing(anatomic_site_source_value)) {
    if (is.null(anatomic_site_source_value)) {
      whereClauses <- c(whereClauses, "anatomic_site_source_value IS NULL")
    } else if (is(anatomic_site_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("anatomic_site_source_value = (", as.character(anatomic_site_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("anatomic_site_source_value = '", anatomic_site_source_value,"'"))
    }
  }

  if (!missing(disease_status_source_value)) {
    if (is.null(disease_status_source_value)) {
      whereClauses <- c(whereClauses, "disease_status_source_value IS NULL")
    } else if (is(disease_status_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("disease_status_source_value = (", as.character(disease_status_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("disease_status_source_value = '", disease_status_source_value,"'"))
    }
  }

 statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") != ",rowCount ," THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

expect_count_fact_relationship <- function(rowCount, domain_concept_id_1, fact_id_1, domain_concept_id_2, fact_id_2, relationship_concept_id) {

  if (is.null(frameworkContext$currentGroup)) {
    testName <- frameworkContext$testDescription;
  } else {
    testName <- paste0(frameworkContext$groupIndex, ".", frameworkContext$currentGroup$groupItemIndex, " ", frameworkContext$testDescription);
  }

  source_pid <- frameworkContext$patient$source_pid;
  if (is.null(source_pid)) {
    source_pid <- "NULL";
  } else {
    source_pid <- paste0("'", as.character(source_pid), "'");
  }

  cdm_pid <- frameworkContext$patient$cdm_pid;
  if (is.null(cdm_pid)) {
    cdm_pid <- "NULL"
  }

  statement <- paste0("INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT ", frameworkContext$testId, " AS id, '", testName, "' AS description, 'Expect fact_relationship' AS test, ", source_pid, " as source_pid, ", cdm_pid, " as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.fact_relationship WHERE ")
  whereClauses = NULL;
  if (!missing(domain_concept_id_1)) {
    if (is.null(domain_concept_id_1)) {
      whereClauses <- c(whereClauses, "domain_concept_id_1 IS NULL")
    } else if (is(domain_concept_id_1, "subQuery")){
      whereClauses <- c(whereClauses, paste0("domain_concept_id_1 = (", as.character(domain_concept_id_1), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("domain_concept_id_1 = '", domain_concept_id_1,"'"))
    }
  }

  if (!missing(fact_id_1)) {
    if (is.null(fact_id_1)) {
      whereClauses <- c(whereClauses, "fact_id_1 IS NULL")
    } else if (is(fact_id_1, "subQuery")){
      whereClauses <- c(whereClauses, paste0("fact_id_1 = (", as.character(fact_id_1), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("fact_id_1 = '", fact_id_1,"'"))
    }
  }

  if (!missing(domain_concept_id_2)) {
    if (is.null(domain_concept_id_2)) {
      whereClauses <- c(whereClauses, "domain_concept_id_2 IS NULL")
    } else if (is(domain_concept_id_2, "subQuery")){
      whereClauses <- c(whereClauses, paste0("domain_concept_id_2 = (", as.character(domain_concept_id_2), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("domain_concept_id_2 = '", domain_concept_id_2,"'"))
    }
  }

  if (!missing(fact_id_2)) {
    if (is.null(fact_id_2)) {
      whereClauses <- c(whereClauses, "fact_id_2 IS NULL")
    } else if (is(fact_id_2, "subQuery")){
      whereClauses <- c(whereClauses, paste0("fact_id_2 = (", as.character(fact_id_2), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("fact_id_2 = '", fact_id_2,"'"))
    }
  }

  if (!missing(relationship_concept_id)) {
    if (is.null(relationship_concept_id)) {
      whereClauses <- c(whereClauses, "relationship_concept_id IS NULL")
    } else if (is(relationship_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("relationship_concept_id = (", as.character(relationship_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("relationship_concept_id = '", relationship_concept_id,"'"))
    }
  }

 statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") != ",rowCount ," THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

expect_count_payer_plan_period <- function(rowCount, payer_plan_period_id, person_id, payer_plan_period_start_date, payer_plan_period_end_date, payer_source_value, plan_source_value, family_source_value) {

  if (is.null(frameworkContext$currentGroup)) {
    testName <- frameworkContext$testDescription;
  } else {
    testName <- paste0(frameworkContext$groupIndex, ".", frameworkContext$currentGroup$groupItemIndex, " ", frameworkContext$testDescription);
  }

  source_pid <- frameworkContext$patient$source_pid;
  if (is.null(source_pid)) {
    source_pid <- "NULL";
  } else {
    source_pid <- paste0("'", as.character(source_pid), "'");
  }

  cdm_pid <- frameworkContext$patient$cdm_pid;
  if (is.null(cdm_pid)) {
    cdm_pid <- "NULL"
  }

  statement <- paste0("INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT ", frameworkContext$testId, " AS id, '", testName, "' AS description, 'Expect payer_plan_period' AS test, ", source_pid, " as source_pid, ", cdm_pid, " as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.payer_plan_period WHERE ")
  whereClauses = NULL;
  if (!missing(payer_plan_period_id)) {
    if (is.null(payer_plan_period_id)) {
      whereClauses <- c(whereClauses, "payer_plan_period_id IS NULL")
    } else if (is(payer_plan_period_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("payer_plan_period_id = (", as.character(payer_plan_period_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("payer_plan_period_id = '", payer_plan_period_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(payer_plan_period_start_date)) {
    if (is.null(payer_plan_period_start_date)) {
      whereClauses <- c(whereClauses, "payer_plan_period_start_date IS NULL")
    } else if (is(payer_plan_period_start_date, "subQuery")){
      whereClauses <- c(whereClauses, paste0("payer_plan_period_start_date = (", as.character(payer_plan_period_start_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("payer_plan_period_start_date = '", payer_plan_period_start_date,"'"))
    }
  }

  if (!missing(payer_plan_period_end_date)) {
    if (is.null(payer_plan_period_end_date)) {
      whereClauses <- c(whereClauses, "payer_plan_period_end_date IS NULL")
    } else if (is(payer_plan_period_end_date, "subQuery")){
      whereClauses <- c(whereClauses, paste0("payer_plan_period_end_date = (", as.character(payer_plan_period_end_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("payer_plan_period_end_date = '", payer_plan_period_end_date,"'"))
    }
  }

  if (!missing(payer_source_value)) {
    if (is.null(payer_source_value)) {
      whereClauses <- c(whereClauses, "payer_source_value IS NULL")
    } else if (is(payer_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("payer_source_value = (", as.character(payer_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("payer_source_value = '", payer_source_value,"'"))
    }
  }

  if (!missing(plan_source_value)) {
    if (is.null(plan_source_value)) {
      whereClauses <- c(whereClauses, "plan_source_value IS NULL")
    } else if (is(plan_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("plan_source_value = (", as.character(plan_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("plan_source_value = '", plan_source_value,"'"))
    }
  }

  if (!missing(family_source_value)) {
    if (is.null(family_source_value)) {
      whereClauses <- c(whereClauses, "family_source_value IS NULL")
    } else if (is(family_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("family_source_value = (", as.character(family_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("family_source_value = '", family_source_value,"'"))
    }
  }

 statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") != ",rowCount ," THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

expect_count_drug_era <- function(rowCount, drug_era_id, person_id, drug_concept_id, drug_era_start_date, drug_era_end_date, drug_exposure_count, gap_days) {

  if (is.null(frameworkContext$currentGroup)) {
    testName <- frameworkContext$testDescription;
  } else {
    testName <- paste0(frameworkContext$groupIndex, ".", frameworkContext$currentGroup$groupItemIndex, " ", frameworkContext$testDescription);
  }

  source_pid <- frameworkContext$patient$source_pid;
  if (is.null(source_pid)) {
    source_pid <- "NULL";
  } else {
    source_pid <- paste0("'", as.character(source_pid), "'");
  }

  cdm_pid <- frameworkContext$patient$cdm_pid;
  if (is.null(cdm_pid)) {
    cdm_pid <- "NULL"
  }

  statement <- paste0("INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT ", frameworkContext$testId, " AS id, '", testName, "' AS description, 'Expect drug_era' AS test, ", source_pid, " as source_pid, ", cdm_pid, " as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.drug_era WHERE ")
  whereClauses = NULL;
  if (!missing(drug_era_id)) {
    if (is.null(drug_era_id)) {
      whereClauses <- c(whereClauses, "drug_era_id IS NULL")
    } else if (is(drug_era_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("drug_era_id = (", as.character(drug_era_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("drug_era_id = '", drug_era_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(drug_concept_id)) {
    if (is.null(drug_concept_id)) {
      whereClauses <- c(whereClauses, "drug_concept_id IS NULL")
    } else if (is(drug_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("drug_concept_id = (", as.character(drug_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("drug_concept_id = '", drug_concept_id,"'"))
    }
  }

  if (!missing(drug_era_start_date)) {
    if (is.null(drug_era_start_date)) {
      whereClauses <- c(whereClauses, "drug_era_start_date IS NULL")
    } else if (is(drug_era_start_date, "subQuery")){
      whereClauses <- c(whereClauses, paste0("drug_era_start_date = (", as.character(drug_era_start_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("drug_era_start_date = '", drug_era_start_date,"'"))
    }
  }

  if (!missing(drug_era_end_date)) {
    if (is.null(drug_era_end_date)) {
      whereClauses <- c(whereClauses, "drug_era_end_date IS NULL")
    } else if (is(drug_era_end_date, "subQuery")){
      whereClauses <- c(whereClauses, paste0("drug_era_end_date = (", as.character(drug_era_end_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("drug_era_end_date = '", drug_era_end_date,"'"))
    }
  }

  if (!missing(drug_exposure_count)) {
    if (is.null(drug_exposure_count)) {
      whereClauses <- c(whereClauses, "drug_exposure_count IS NULL")
    } else if (is(drug_exposure_count, "subQuery")){
      whereClauses <- c(whereClauses, paste0("drug_exposure_count = (", as.character(drug_exposure_count), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("drug_exposure_count = '", drug_exposure_count,"'"))
    }
  }

  if (!missing(gap_days)) {
    if (is.null(gap_days)) {
      whereClauses <- c(whereClauses, "gap_days IS NULL")
    } else if (is(gap_days, "subQuery")){
      whereClauses <- c(whereClauses, paste0("gap_days = (", as.character(gap_days), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("gap_days = '", gap_days,"'"))
    }
  }

 statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") != ",rowCount ," THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

expect_count_dose_era <- function(rowCount, dose_era_id, person_id, drug_concept_id, unit_concept_id, dose_value, dose_era_start_date, dose_era_end_date) {

  if (is.null(frameworkContext$currentGroup)) {
    testName <- frameworkContext$testDescription;
  } else {
    testName <- paste0(frameworkContext$groupIndex, ".", frameworkContext$currentGroup$groupItemIndex, " ", frameworkContext$testDescription);
  }

  source_pid <- frameworkContext$patient$source_pid;
  if (is.null(source_pid)) {
    source_pid <- "NULL";
  } else {
    source_pid <- paste0("'", as.character(source_pid), "'");
  }

  cdm_pid <- frameworkContext$patient$cdm_pid;
  if (is.null(cdm_pid)) {
    cdm_pid <- "NULL"
  }

  statement <- paste0("INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT ", frameworkContext$testId, " AS id, '", testName, "' AS description, 'Expect dose_era' AS test, ", source_pid, " as source_pid, ", cdm_pid, " as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.dose_era WHERE ")
  whereClauses = NULL;
  if (!missing(dose_era_id)) {
    if (is.null(dose_era_id)) {
      whereClauses <- c(whereClauses, "dose_era_id IS NULL")
    } else if (is(dose_era_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("dose_era_id = (", as.character(dose_era_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("dose_era_id = '", dose_era_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(drug_concept_id)) {
    if (is.null(drug_concept_id)) {
      whereClauses <- c(whereClauses, "drug_concept_id IS NULL")
    } else if (is(drug_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("drug_concept_id = (", as.character(drug_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("drug_concept_id = '", drug_concept_id,"'"))
    }
  }

  if (!missing(unit_concept_id)) {
    if (is.null(unit_concept_id)) {
      whereClauses <- c(whereClauses, "unit_concept_id IS NULL")
    } else if (is(unit_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("unit_concept_id = (", as.character(unit_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("unit_concept_id = '", unit_concept_id,"'"))
    }
  }

  if (!missing(dose_value)) {
    if (is.null(dose_value)) {
      whereClauses <- c(whereClauses, "dose_value IS NULL")
    } else if (is(dose_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("dose_value = (", as.character(dose_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("dose_value = '", dose_value,"'"))
    }
  }

  if (!missing(dose_era_start_date)) {
    if (is.null(dose_era_start_date)) {
      whereClauses <- c(whereClauses, "dose_era_start_date IS NULL")
    } else if (is(dose_era_start_date, "subQuery")){
      whereClauses <- c(whereClauses, paste0("dose_era_start_date = (", as.character(dose_era_start_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("dose_era_start_date = '", dose_era_start_date,"'"))
    }
  }

  if (!missing(dose_era_end_date)) {
    if (is.null(dose_era_end_date)) {
      whereClauses <- c(whereClauses, "dose_era_end_date IS NULL")
    } else if (is(dose_era_end_date, "subQuery")){
      whereClauses <- c(whereClauses, paste0("dose_era_end_date = (", as.character(dose_era_end_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("dose_era_end_date = '", dose_era_end_date,"'"))
    }
  }

 statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") != ",rowCount ," THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

expect_count_condition_era <- function(rowCount, condition_era_id, person_id, condition_concept_id, condition_era_start_date, condition_era_end_date, condition_occurrence_count) {

  if (is.null(frameworkContext$currentGroup)) {
    testName <- frameworkContext$testDescription;
  } else {
    testName <- paste0(frameworkContext$groupIndex, ".", frameworkContext$currentGroup$groupItemIndex, " ", frameworkContext$testDescription);
  }

  source_pid <- frameworkContext$patient$source_pid;
  if (is.null(source_pid)) {
    source_pid <- "NULL";
  } else {
    source_pid <- paste0("'", as.character(source_pid), "'");
  }

  cdm_pid <- frameworkContext$patient$cdm_pid;
  if (is.null(cdm_pid)) {
    cdm_pid <- "NULL"
  }

  statement <- paste0("INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT ", frameworkContext$testId, " AS id, '", testName, "' AS description, 'Expect condition_era' AS test, ", source_pid, " as source_pid, ", cdm_pid, " as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.condition_era WHERE ")
  whereClauses = NULL;
  if (!missing(condition_era_id)) {
    if (is.null(condition_era_id)) {
      whereClauses <- c(whereClauses, "condition_era_id IS NULL")
    } else if (is(condition_era_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("condition_era_id = (", as.character(condition_era_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("condition_era_id = '", condition_era_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(condition_concept_id)) {
    if (is.null(condition_concept_id)) {
      whereClauses <- c(whereClauses, "condition_concept_id IS NULL")
    } else if (is(condition_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("condition_concept_id = (", as.character(condition_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("condition_concept_id = '", condition_concept_id,"'"))
    }
  }

  if (!missing(condition_era_start_date)) {
    if (is.null(condition_era_start_date)) {
      whereClauses <- c(whereClauses, "condition_era_start_date IS NULL")
    } else if (is(condition_era_start_date, "subQuery")){
      whereClauses <- c(whereClauses, paste0("condition_era_start_date = (", as.character(condition_era_start_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("condition_era_start_date = '", condition_era_start_date,"'"))
    }
  }

  if (!missing(condition_era_end_date)) {
    if (is.null(condition_era_end_date)) {
      whereClauses <- c(whereClauses, "condition_era_end_date IS NULL")
    } else if (is(condition_era_end_date, "subQuery")){
      whereClauses <- c(whereClauses, paste0("condition_era_end_date = (", as.character(condition_era_end_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("condition_era_end_date = '", condition_era_end_date,"'"))
    }
  }

  if (!missing(condition_occurrence_count)) {
    if (is.null(condition_occurrence_count)) {
      whereClauses <- c(whereClauses, "condition_occurrence_count IS NULL")
    } else if (is(condition_occurrence_count, "subQuery")){
      whereClauses <- c(whereClauses, paste0("condition_occurrence_count = (", as.character(condition_occurrence_count), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("condition_occurrence_count = '", condition_occurrence_count,"'"))
    }
  }

 statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") != ",rowCount ," THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

expect_count_cdm_source <- function(rowCount, cdm_source_name, cdm_source_abbreviation, cdm_holder, source_description, source_documentation_reference, cdm_etl_reference, source_release_date, cdm_release_date, cdm_version, vocabulary_version) {

  if (is.null(frameworkContext$currentGroup)) {
    testName <- frameworkContext$testDescription;
  } else {
    testName <- paste0(frameworkContext$groupIndex, ".", frameworkContext$currentGroup$groupItemIndex, " ", frameworkContext$testDescription);
  }

  source_pid <- frameworkContext$patient$source_pid;
  if (is.null(source_pid)) {
    source_pid <- "NULL";
  } else {
    source_pid <- paste0("'", as.character(source_pid), "'");
  }

  cdm_pid <- frameworkContext$patient$cdm_pid;
  if (is.null(cdm_pid)) {
    cdm_pid <- "NULL"
  }

  statement <- paste0("INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT ", frameworkContext$testId, " AS id, '", testName, "' AS description, 'Expect cdm_source' AS test, ", source_pid, " as source_pid, ", cdm_pid, " as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.cdm_source WHERE ")
  whereClauses = NULL;
  if (!missing(cdm_source_name)) {
    if (is.null(cdm_source_name)) {
      whereClauses <- c(whereClauses, "cdm_source_name IS NULL")
    } else if (is(cdm_source_name, "subQuery")){
      whereClauses <- c(whereClauses, paste0("cdm_source_name = (", as.character(cdm_source_name), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cdm_source_name = '", cdm_source_name,"'"))
    }
  }

  if (!missing(cdm_source_abbreviation)) {
    if (is.null(cdm_source_abbreviation)) {
      whereClauses <- c(whereClauses, "cdm_source_abbreviation IS NULL")
    } else if (is(cdm_source_abbreviation, "subQuery")){
      whereClauses <- c(whereClauses, paste0("cdm_source_abbreviation = (", as.character(cdm_source_abbreviation), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cdm_source_abbreviation = '", cdm_source_abbreviation,"'"))
    }
  }

  if (!missing(cdm_holder)) {
    if (is.null(cdm_holder)) {
      whereClauses <- c(whereClauses, "cdm_holder IS NULL")
    } else if (is(cdm_holder, "subQuery")){
      whereClauses <- c(whereClauses, paste0("cdm_holder = (", as.character(cdm_holder), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cdm_holder = '", cdm_holder,"'"))
    }
  }

  if (!missing(source_description)) {
    if (is.null(source_description)) {
      whereClauses <- c(whereClauses, "source_description IS NULL")
    } else if (is(source_description, "subQuery")){
      whereClauses <- c(whereClauses, paste0("source_description = (", as.character(source_description), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("source_description = '", source_description,"'"))
    }
  }

  if (!missing(source_documentation_reference)) {
    if (is.null(source_documentation_reference)) {
      whereClauses <- c(whereClauses, "source_documentation_reference IS NULL")
    } else if (is(source_documentation_reference, "subQuery")){
      whereClauses <- c(whereClauses, paste0("source_documentation_reference = (", as.character(source_documentation_reference), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("source_documentation_reference = '", source_documentation_reference,"'"))
    }
  }

  if (!missing(cdm_etl_reference)) {
    if (is.null(cdm_etl_reference)) {
      whereClauses <- c(whereClauses, "cdm_etl_reference IS NULL")
    } else if (is(cdm_etl_reference, "subQuery")){
      whereClauses <- c(whereClauses, paste0("cdm_etl_reference = (", as.character(cdm_etl_reference), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cdm_etl_reference = '", cdm_etl_reference,"'"))
    }
  }

  if (!missing(source_release_date)) {
    if (is.null(source_release_date)) {
      whereClauses <- c(whereClauses, "source_release_date IS NULL")
    } else if (is(source_release_date, "subQuery")){
      whereClauses <- c(whereClauses, paste0("source_release_date = (", as.character(source_release_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("source_release_date = '", source_release_date,"'"))
    }
  }

  if (!missing(cdm_release_date)) {
    if (is.null(cdm_release_date)) {
      whereClauses <- c(whereClauses, "cdm_release_date IS NULL")
    } else if (is(cdm_release_date, "subQuery")){
      whereClauses <- c(whereClauses, paste0("cdm_release_date = (", as.character(cdm_release_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cdm_release_date = '", cdm_release_date,"'"))
    }
  }

  if (!missing(cdm_version)) {
    if (is.null(cdm_version)) {
      whereClauses <- c(whereClauses, "cdm_version IS NULL")
    } else if (is(cdm_version, "subQuery")){
      whereClauses <- c(whereClauses, paste0("cdm_version = (", as.character(cdm_version), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cdm_version = '", cdm_version,"'"))
    }
  }

  if (!missing(vocabulary_version)) {
    if (is.null(vocabulary_version)) {
      whereClauses <- c(whereClauses, "vocabulary_version IS NULL")
    } else if (is(vocabulary_version, "subQuery")){
      whereClauses <- c(whereClauses, paste0("vocabulary_version = (", as.character(vocabulary_version), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("vocabulary_version = '", vocabulary_version,"'"))
    }
  }

 statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") != ",rowCount ," THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

expect_count_cohort <- function(rowCount, cohort_definition_id, subject_id, cohort_start_date, cohort_end_date) {

  if (is.null(frameworkContext$currentGroup)) {
    testName <- frameworkContext$testDescription;
  } else {
    testName <- paste0(frameworkContext$groupIndex, ".", frameworkContext$currentGroup$groupItemIndex, " ", frameworkContext$testDescription);
  }

  source_pid <- frameworkContext$patient$source_pid;
  if (is.null(source_pid)) {
    source_pid <- "NULL";
  } else {
    source_pid <- paste0("'", as.character(source_pid), "'");
  }

  cdm_pid <- frameworkContext$patient$cdm_pid;
  if (is.null(cdm_pid)) {
    cdm_pid <- "NULL"
  }

  statement <- paste0("INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT ", frameworkContext$testId, " AS id, '", testName, "' AS description, 'Expect cohort' AS test, ", source_pid, " as source_pid, ", cdm_pid, " as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.cohort WHERE ")
  whereClauses = NULL;
  if (!missing(cohort_definition_id)) {
    if (is.null(cohort_definition_id)) {
      whereClauses <- c(whereClauses, "cohort_definition_id IS NULL")
    } else if (is(cohort_definition_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("cohort_definition_id = (", as.character(cohort_definition_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cohort_definition_id = '", cohort_definition_id,"'"))
    }
  }

  if (!missing(subject_id)) {
    if (is.null(subject_id)) {
      whereClauses <- c(whereClauses, "subject_id IS NULL")
    } else if (is(subject_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("subject_id = (", as.character(subject_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("subject_id = '", subject_id,"'"))
    }
  }

  if (!missing(cohort_start_date)) {
    if (is.null(cohort_start_date)) {
      whereClauses <- c(whereClauses, "cohort_start_date IS NULL")
    } else if (is(cohort_start_date, "subQuery")){
      whereClauses <- c(whereClauses, paste0("cohort_start_date = (", as.character(cohort_start_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cohort_start_date = '", cohort_start_date,"'"))
    }
  }

  if (!missing(cohort_end_date)) {
    if (is.null(cohort_end_date)) {
      whereClauses <- c(whereClauses, "cohort_end_date IS NULL")
    } else if (is(cohort_end_date, "subQuery")){
      whereClauses <- c(whereClauses, paste0("cohort_end_date = (", as.character(cohort_end_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cohort_end_date = '", cohort_end_date,"'"))
    }
  }

 statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") != ",rowCount ," THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

expect_count_cohort_definition <- function(rowCount, cohort_definition_id, cohort_definition_name, cohort_definition_description, definition_type_concept_id, cohort_definition_syntax, subject_concept_id, cohort_instantiation_date) {

  if (is.null(frameworkContext$currentGroup)) {
    testName <- frameworkContext$testDescription;
  } else {
    testName <- paste0(frameworkContext$groupIndex, ".", frameworkContext$currentGroup$groupItemIndex, " ", frameworkContext$testDescription);
  }

  source_pid <- frameworkContext$patient$source_pid;
  if (is.null(source_pid)) {
    source_pid <- "NULL";
  } else {
    source_pid <- paste0("'", as.character(source_pid), "'");
  }

  cdm_pid <- frameworkContext$patient$cdm_pid;
  if (is.null(cdm_pid)) {
    cdm_pid <- "NULL"
  }

  statement <- paste0("INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT ", frameworkContext$testId, " AS id, '", testName, "' AS description, 'Expect cohort_definition' AS test, ", source_pid, " as source_pid, ", cdm_pid, " as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.cohort_definition WHERE ")
  whereClauses = NULL;
  if (!missing(cohort_definition_id)) {
    if (is.null(cohort_definition_id)) {
      whereClauses <- c(whereClauses, "cohort_definition_id IS NULL")
    } else if (is(cohort_definition_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("cohort_definition_id = (", as.character(cohort_definition_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cohort_definition_id = '", cohort_definition_id,"'"))
    }
  }

  if (!missing(cohort_definition_name)) {
    if (is.null(cohort_definition_name)) {
      whereClauses <- c(whereClauses, "cohort_definition_name IS NULL")
    } else if (is(cohort_definition_name, "subQuery")){
      whereClauses <- c(whereClauses, paste0("cohort_definition_name = (", as.character(cohort_definition_name), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cohort_definition_name = '", cohort_definition_name,"'"))
    }
  }

  if (!missing(cohort_definition_description)) {
    if (is.null(cohort_definition_description)) {
      whereClauses <- c(whereClauses, "cohort_definition_description IS NULL")
    } else if (is(cohort_definition_description, "subQuery")){
      whereClauses <- c(whereClauses, paste0("cohort_definition_description = (", as.character(cohort_definition_description), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cohort_definition_description = '", cohort_definition_description,"'"))
    }
  }

  if (!missing(definition_type_concept_id)) {
    if (is.null(definition_type_concept_id)) {
      whereClauses <- c(whereClauses, "definition_type_concept_id IS NULL")
    } else if (is(definition_type_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("definition_type_concept_id = (", as.character(definition_type_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("definition_type_concept_id = '", definition_type_concept_id,"'"))
    }
  }

  if (!missing(cohort_definition_syntax)) {
    if (is.null(cohort_definition_syntax)) {
      whereClauses <- c(whereClauses, "cohort_definition_syntax IS NULL")
    } else if (is(cohort_definition_syntax, "subQuery")){
      whereClauses <- c(whereClauses, paste0("cohort_definition_syntax = (", as.character(cohort_definition_syntax), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cohort_definition_syntax = '", cohort_definition_syntax,"'"))
    }
  }

  if (!missing(subject_concept_id)) {
    if (is.null(subject_concept_id)) {
      whereClauses <- c(whereClauses, "subject_concept_id IS NULL")
    } else if (is(subject_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("subject_concept_id = (", as.character(subject_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("subject_concept_id = '", subject_concept_id,"'"))
    }
  }

  if (!missing(cohort_instantiation_date)) {
    if (is.null(cohort_instantiation_date)) {
      whereClauses <- c(whereClauses, "cohort_instantiation_date IS NULL")
    } else if (is(cohort_instantiation_date, "subQuery")){
      whereClauses <- c(whereClauses, paste0("cohort_instantiation_date = (", as.character(cohort_instantiation_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cohort_instantiation_date = '", cohort_instantiation_date,"'"))
    }
  }

 statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") != ",rowCount ," THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

expect_count_cohort_attribute <- function(rowCount, cohort_definition_id, cohort_start_date, cohort_end_date, subject_id, attribute_definition_id, value_as_number, value_as_concept_id) {

  if (is.null(frameworkContext$currentGroup)) {
    testName <- frameworkContext$testDescription;
  } else {
    testName <- paste0(frameworkContext$groupIndex, ".", frameworkContext$currentGroup$groupItemIndex, " ", frameworkContext$testDescription);
  }

  source_pid <- frameworkContext$patient$source_pid;
  if (is.null(source_pid)) {
    source_pid <- "NULL";
  } else {
    source_pid <- paste0("'", as.character(source_pid), "'");
  }

  cdm_pid <- frameworkContext$patient$cdm_pid;
  if (is.null(cdm_pid)) {
    cdm_pid <- "NULL"
  }

  statement <- paste0("INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT ", frameworkContext$testId, " AS id, '", testName, "' AS description, 'Expect cohort_attribute' AS test, ", source_pid, " as source_pid, ", cdm_pid, " as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.cohort_attribute WHERE ")
  whereClauses = NULL;
  if (!missing(cohort_definition_id)) {
    if (is.null(cohort_definition_id)) {
      whereClauses <- c(whereClauses, "cohort_definition_id IS NULL")
    } else if (is(cohort_definition_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("cohort_definition_id = (", as.character(cohort_definition_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cohort_definition_id = '", cohort_definition_id,"'"))
    }
  }

  if (!missing(cohort_start_date)) {
    if (is.null(cohort_start_date)) {
      whereClauses <- c(whereClauses, "cohort_start_date IS NULL")
    } else if (is(cohort_start_date, "subQuery")){
      whereClauses <- c(whereClauses, paste0("cohort_start_date = (", as.character(cohort_start_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cohort_start_date = '", cohort_start_date,"'"))
    }
  }

  if (!missing(cohort_end_date)) {
    if (is.null(cohort_end_date)) {
      whereClauses <- c(whereClauses, "cohort_end_date IS NULL")
    } else if (is(cohort_end_date, "subQuery")){
      whereClauses <- c(whereClauses, paste0("cohort_end_date = (", as.character(cohort_end_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cohort_end_date = '", cohort_end_date,"'"))
    }
  }

  if (!missing(subject_id)) {
    if (is.null(subject_id)) {
      whereClauses <- c(whereClauses, "subject_id IS NULL")
    } else if (is(subject_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("subject_id = (", as.character(subject_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("subject_id = '", subject_id,"'"))
    }
  }

  if (!missing(attribute_definition_id)) {
    if (is.null(attribute_definition_id)) {
      whereClauses <- c(whereClauses, "attribute_definition_id IS NULL")
    } else if (is(attribute_definition_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("attribute_definition_id = (", as.character(attribute_definition_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("attribute_definition_id = '", attribute_definition_id,"'"))
    }
  }

  if (!missing(value_as_number)) {
    if (is.null(value_as_number)) {
      whereClauses <- c(whereClauses, "value_as_number IS NULL")
    } else if (is(value_as_number, "subQuery")){
      whereClauses <- c(whereClauses, paste0("value_as_number = (", as.character(value_as_number), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("value_as_number = '", value_as_number,"'"))
    }
  }

  if (!missing(value_as_concept_id)) {
    if (is.null(value_as_concept_id)) {
      whereClauses <- c(whereClauses, "value_as_concept_id IS NULL")
    } else if (is(value_as_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("value_as_concept_id = (", as.character(value_as_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("value_as_concept_id = '", value_as_concept_id,"'"))
    }
  }

 statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") != ",rowCount ," THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

expect_count_attribute_definition <- function(rowCount, attribute_definition_id, attribute_name, attribute_description, attribute_type_concept_id, attribute_syntax) {

  if (is.null(frameworkContext$currentGroup)) {
    testName <- frameworkContext$testDescription;
  } else {
    testName <- paste0(frameworkContext$groupIndex, ".", frameworkContext$currentGroup$groupItemIndex, " ", frameworkContext$testDescription);
  }

  source_pid <- frameworkContext$patient$source_pid;
  if (is.null(source_pid)) {
    source_pid <- "NULL";
  } else {
    source_pid <- paste0("'", as.character(source_pid), "'");
  }

  cdm_pid <- frameworkContext$patient$cdm_pid;
  if (is.null(cdm_pid)) {
    cdm_pid <- "NULL"
  }

  statement <- paste0("INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT ", frameworkContext$testId, " AS id, '", testName, "' AS description, 'Expect attribute_definition' AS test, ", source_pid, " as source_pid, ", cdm_pid, " as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.attribute_definition WHERE ")
  whereClauses = NULL;
  if (!missing(attribute_definition_id)) {
    if (is.null(attribute_definition_id)) {
      whereClauses <- c(whereClauses, "attribute_definition_id IS NULL")
    } else if (is(attribute_definition_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("attribute_definition_id = (", as.character(attribute_definition_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("attribute_definition_id = '", attribute_definition_id,"'"))
    }
  }

  if (!missing(attribute_name)) {
    if (is.null(attribute_name)) {
      whereClauses <- c(whereClauses, "attribute_name IS NULL")
    } else if (is(attribute_name, "subQuery")){
      whereClauses <- c(whereClauses, paste0("attribute_name = (", as.character(attribute_name), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("attribute_name = '", attribute_name,"'"))
    }
  }

  if (!missing(attribute_description)) {
    if (is.null(attribute_description)) {
      whereClauses <- c(whereClauses, "attribute_description IS NULL")
    } else if (is(attribute_description, "subQuery")){
      whereClauses <- c(whereClauses, paste0("attribute_description = (", as.character(attribute_description), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("attribute_description = '", attribute_description,"'"))
    }
  }

  if (!missing(attribute_type_concept_id)) {
    if (is.null(attribute_type_concept_id)) {
      whereClauses <- c(whereClauses, "attribute_type_concept_id IS NULL")
    } else if (is(attribute_type_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("attribute_type_concept_id = (", as.character(attribute_type_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("attribute_type_concept_id = '", attribute_type_concept_id,"'"))
    }
  }

  if (!missing(attribute_syntax)) {
    if (is.null(attribute_syntax)) {
      whereClauses <- c(whereClauses, "attribute_syntax IS NULL")
    } else if (is(attribute_syntax, "subQuery")){
      whereClauses <- c(whereClauses, paste0("attribute_syntax = (", as.character(attribute_syntax), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("attribute_syntax = '", attribute_syntax,"'"))
    }
  }

 statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") != ",rowCount ," THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

expect_count_cost <- function(rowCount, cost_id, cost_event_id, cost_domain_id, cost_type_concept_id, currency_concept_id, total_charge, total_cost, total_paid, paid_by_payer, paid_by_patient, paid_patient_copay, paid_patient_coinsurance, paid_patient_deductible, paid_by_primary, paid_ingredient_cost, paid_dispensing_fee, payer_plan_period_id, amount_allowed, revenue_code_concept_id, revenue_code_source_value) {

  if (is.null(frameworkContext$currentGroup)) {
    testName <- frameworkContext$testDescription;
  } else {
    testName <- paste0(frameworkContext$groupIndex, ".", frameworkContext$currentGroup$groupItemIndex, " ", frameworkContext$testDescription);
  }

  source_pid <- frameworkContext$patient$source_pid;
  if (is.null(source_pid)) {
    source_pid <- "NULL";
  } else {
    source_pid <- paste0("'", as.character(source_pid), "'");
  }

  cdm_pid <- frameworkContext$patient$cdm_pid;
  if (is.null(cdm_pid)) {
    cdm_pid <- "NULL"
  }

  statement <- paste0("INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT ", frameworkContext$testId, " AS id, '", testName, "' AS description, 'Expect cost' AS test, ", source_pid, " as source_pid, ", cdm_pid, " as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.cost WHERE ")
  whereClauses = NULL;
  if (!missing(cost_id)) {
    if (is.null(cost_id)) {
      whereClauses <- c(whereClauses, "cost_id IS NULL")
    } else if (is(cost_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("cost_id = (", as.character(cost_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cost_id = '", cost_id,"'"))
    }
  }

  if (!missing(cost_event_id)) {
    if (is.null(cost_event_id)) {
      whereClauses <- c(whereClauses, "cost_event_id IS NULL")
    } else if (is(cost_event_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("cost_event_id = (", as.character(cost_event_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cost_event_id = '", cost_event_id,"'"))
    }
  }

  if (!missing(cost_domain_id)) {
    if (is.null(cost_domain_id)) {
      whereClauses <- c(whereClauses, "cost_domain_id IS NULL")
    } else if (is(cost_domain_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("cost_domain_id = (", as.character(cost_domain_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cost_domain_id = '", cost_domain_id,"'"))
    }
  }

  if (!missing(cost_type_concept_id)) {
    if (is.null(cost_type_concept_id)) {
      whereClauses <- c(whereClauses, "cost_type_concept_id IS NULL")
    } else if (is(cost_type_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("cost_type_concept_id = (", as.character(cost_type_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cost_type_concept_id = '", cost_type_concept_id,"'"))
    }
  }

  if (!missing(currency_concept_id)) {
    if (is.null(currency_concept_id)) {
      whereClauses <- c(whereClauses, "currency_concept_id IS NULL")
    } else if (is(currency_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("currency_concept_id = (", as.character(currency_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("currency_concept_id = '", currency_concept_id,"'"))
    }
  }

  if (!missing(total_charge)) {
    if (is.null(total_charge)) {
      whereClauses <- c(whereClauses, "total_charge IS NULL")
    } else if (is(total_charge, "subQuery")){
      whereClauses <- c(whereClauses, paste0("total_charge = (", as.character(total_charge), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("total_charge = '", total_charge,"'"))
    }
  }

  if (!missing(total_cost)) {
    if (is.null(total_cost)) {
      whereClauses <- c(whereClauses, "total_cost IS NULL")
    } else if (is(total_cost, "subQuery")){
      whereClauses <- c(whereClauses, paste0("total_cost = (", as.character(total_cost), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("total_cost = '", total_cost,"'"))
    }
  }

  if (!missing(total_paid)) {
    if (is.null(total_paid)) {
      whereClauses <- c(whereClauses, "total_paid IS NULL")
    } else if (is(total_paid, "subQuery")){
      whereClauses <- c(whereClauses, paste0("total_paid = (", as.character(total_paid), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("total_paid = '", total_paid,"'"))
    }
  }

  if (!missing(paid_by_payer)) {
    if (is.null(paid_by_payer)) {
      whereClauses <- c(whereClauses, "paid_by_payer IS NULL")
    } else if (is(paid_by_payer, "subQuery")){
      whereClauses <- c(whereClauses, paste0("paid_by_payer = (", as.character(paid_by_payer), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("paid_by_payer = '", paid_by_payer,"'"))
    }
  }

  if (!missing(paid_by_patient)) {
    if (is.null(paid_by_patient)) {
      whereClauses <- c(whereClauses, "paid_by_patient IS NULL")
    } else if (is(paid_by_patient, "subQuery")){
      whereClauses <- c(whereClauses, paste0("paid_by_patient = (", as.character(paid_by_patient), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("paid_by_patient = '", paid_by_patient,"'"))
    }
  }

  if (!missing(paid_patient_copay)) {
    if (is.null(paid_patient_copay)) {
      whereClauses <- c(whereClauses, "paid_patient_copay IS NULL")
    } else if (is(paid_patient_copay, "subQuery")){
      whereClauses <- c(whereClauses, paste0("paid_patient_copay = (", as.character(paid_patient_copay), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("paid_patient_copay = '", paid_patient_copay,"'"))
    }
  }

  if (!missing(paid_patient_coinsurance)) {
    if (is.null(paid_patient_coinsurance)) {
      whereClauses <- c(whereClauses, "paid_patient_coinsurance IS NULL")
    } else if (is(paid_patient_coinsurance, "subQuery")){
      whereClauses <- c(whereClauses, paste0("paid_patient_coinsurance = (", as.character(paid_patient_coinsurance), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("paid_patient_coinsurance = '", paid_patient_coinsurance,"'"))
    }
  }

  if (!missing(paid_patient_deductible)) {
    if (is.null(paid_patient_deductible)) {
      whereClauses <- c(whereClauses, "paid_patient_deductible IS NULL")
    } else if (is(paid_patient_deductible, "subQuery")){
      whereClauses <- c(whereClauses, paste0("paid_patient_deductible = (", as.character(paid_patient_deductible), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("paid_patient_deductible = '", paid_patient_deductible,"'"))
    }
  }

  if (!missing(paid_by_primary)) {
    if (is.null(paid_by_primary)) {
      whereClauses <- c(whereClauses, "paid_by_primary IS NULL")
    } else if (is(paid_by_primary, "subQuery")){
      whereClauses <- c(whereClauses, paste0("paid_by_primary = (", as.character(paid_by_primary), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("paid_by_primary = '", paid_by_primary,"'"))
    }
  }

  if (!missing(paid_ingredient_cost)) {
    if (is.null(paid_ingredient_cost)) {
      whereClauses <- c(whereClauses, "paid_ingredient_cost IS NULL")
    } else if (is(paid_ingredient_cost, "subQuery")){
      whereClauses <- c(whereClauses, paste0("paid_ingredient_cost = (", as.character(paid_ingredient_cost), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("paid_ingredient_cost = '", paid_ingredient_cost,"'"))
    }
  }

  if (!missing(paid_dispensing_fee)) {
    if (is.null(paid_dispensing_fee)) {
      whereClauses <- c(whereClauses, "paid_dispensing_fee IS NULL")
    } else if (is(paid_dispensing_fee, "subQuery")){
      whereClauses <- c(whereClauses, paste0("paid_dispensing_fee = (", as.character(paid_dispensing_fee), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("paid_dispensing_fee = '", paid_dispensing_fee,"'"))
    }
  }

  if (!missing(payer_plan_period_id)) {
    if (is.null(payer_plan_period_id)) {
      whereClauses <- c(whereClauses, "payer_plan_period_id IS NULL")
    } else if (is(payer_plan_period_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("payer_plan_period_id = (", as.character(payer_plan_period_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("payer_plan_period_id = '", payer_plan_period_id,"'"))
    }
  }

  if (!missing(amount_allowed)) {
    if (is.null(amount_allowed)) {
      whereClauses <- c(whereClauses, "amount_allowed IS NULL")
    } else if (is(amount_allowed, "subQuery")){
      whereClauses <- c(whereClauses, paste0("amount_allowed = (", as.character(amount_allowed), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("amount_allowed = '", amount_allowed,"'"))
    }
  }

  if (!missing(revenue_code_concept_id)) {
    if (is.null(revenue_code_concept_id)) {
      whereClauses <- c(whereClauses, "revenue_code_concept_id IS NULL")
    } else if (is(revenue_code_concept_id, "subQuery")){
      whereClauses <- c(whereClauses, paste0("revenue_code_concept_id = (", as.character(revenue_code_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("revenue_code_concept_id = '", revenue_code_concept_id,"'"))
    }
  }

  if (!missing(revenue_code_source_value)) {
    if (is.null(revenue_code_source_value)) {
      whereClauses <- c(whereClauses, "revenue_code_source_value IS NULL")
    } else if (is(revenue_code_source_value, "subQuery")){
      whereClauses <- c(whereClauses, paste0("revenue_code_source_value = (", as.character(revenue_code_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("revenue_code_source_value = '", revenue_code_source_value,"'"))
    }
  }

 statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") != ",rowCount ," THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

lookup_location <- function(fetchField, location_id, address_1, address_2, city, state, zip, county, location_source_value) {
  whereClauses = NULL;
  statement <- paste0("SELECT ", fetchField , " FROM @cdm_schema.location WHERE ")
  if (!missing(location_id)) {
    if (is.null(location_id)) {
      whereClauses <- c(whereClauses, "location_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("location_id = '", location_id,"'"))
    }
  }

  if (!missing(address_1)) {
    if (is.null(address_1)) {
      whereClauses <- c(whereClauses, "address_1 IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("address_1 = '", address_1,"'"))
    }
  }

  if (!missing(address_2)) {
    if (is.null(address_2)) {
      whereClauses <- c(whereClauses, "address_2 IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("address_2 = '", address_2,"'"))
    }
  }

  if (!missing(city)) {
    if (is.null(city)) {
      whereClauses <- c(whereClauses, "city IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("city = '", city,"'"))
    }
  }

  if (!missing(state)) {
    if (is.null(state)) {
      whereClauses <- c(whereClauses, "state IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("state = '", state,"'"))
    }
  }

  if (!missing(zip)) {
    if (is.null(zip)) {
      whereClauses <- c(whereClauses, "zip IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("zip = '", zip,"'"))
    }
  }

  if (!missing(county)) {
    if (is.null(county)) {
      whereClauses <- c(whereClauses, "county IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("county = '", county,"'"))
    }
  }

  if (!missing(location_source_value)) {
    if (is.null(location_source_value)) {
      whereClauses <- c(whereClauses, "location_source_value IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("location_source_value = '", location_source_value,"'"))
    }
  }

  statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  class(statement) <- "subQuery"
  return(statement)
}

lookup_person <- function(fetchField, person_id, gender_concept_id, year_of_birth, month_of_birth, day_of_birth, time_of_birth, race_concept_id, ethnicity_concept_id, location_id, provider_id, care_site_id, person_source_value, gender_source_value, gender_source_concept_id, race_source_value, race_source_concept_id, ethnicity_source_value, ethnicity_source_concept_id) {
  whereClauses = NULL;
  statement <- paste0("SELECT ", fetchField , " FROM @cdm_schema.person WHERE ")
  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(gender_concept_id)) {
    if (is.null(gender_concept_id)) {
      whereClauses <- c(whereClauses, "gender_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("gender_concept_id = '", gender_concept_id,"'"))
    }
  }

  if (!missing(year_of_birth)) {
    if (is.null(year_of_birth)) {
      whereClauses <- c(whereClauses, "year_of_birth IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("year_of_birth = '", year_of_birth,"'"))
    }
  }

  if (!missing(month_of_birth)) {
    if (is.null(month_of_birth)) {
      whereClauses <- c(whereClauses, "month_of_birth IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("month_of_birth = '", month_of_birth,"'"))
    }
  }

  if (!missing(day_of_birth)) {
    if (is.null(day_of_birth)) {
      whereClauses <- c(whereClauses, "day_of_birth IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("day_of_birth = '", day_of_birth,"'"))
    }
  }

  if (!missing(time_of_birth)) {
    if (is.null(time_of_birth)) {
      whereClauses <- c(whereClauses, "time_of_birth IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("time_of_birth = '", time_of_birth,"'"))
    }
  }

  if (!missing(race_concept_id)) {
    if (is.null(race_concept_id)) {
      whereClauses <- c(whereClauses, "race_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("race_concept_id = '", race_concept_id,"'"))
    }
  }

  if (!missing(ethnicity_concept_id)) {
    if (is.null(ethnicity_concept_id)) {
      whereClauses <- c(whereClauses, "ethnicity_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("ethnicity_concept_id = '", ethnicity_concept_id,"'"))
    }
  }

  if (!missing(location_id)) {
    if (is.null(location_id)) {
      whereClauses <- c(whereClauses, "location_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("location_id = '", location_id,"'"))
    }
  }

  if (!missing(provider_id)) {
    if (is.null(provider_id)) {
      whereClauses <- c(whereClauses, "provider_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("provider_id = '", provider_id,"'"))
    }
  }

  if (!missing(care_site_id)) {
    if (is.null(care_site_id)) {
      whereClauses <- c(whereClauses, "care_site_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("care_site_id = '", care_site_id,"'"))
    }
  }

  if (!missing(person_source_value)) {
    if (is.null(person_source_value)) {
      whereClauses <- c(whereClauses, "person_source_value IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("person_source_value = '", person_source_value,"'"))
    }
  }

  if (!missing(gender_source_value)) {
    if (is.null(gender_source_value)) {
      whereClauses <- c(whereClauses, "gender_source_value IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("gender_source_value = '", gender_source_value,"'"))
    }
  }

  if (!missing(gender_source_concept_id)) {
    if (is.null(gender_source_concept_id)) {
      whereClauses <- c(whereClauses, "gender_source_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("gender_source_concept_id = '", gender_source_concept_id,"'"))
    }
  }

  if (!missing(race_source_value)) {
    if (is.null(race_source_value)) {
      whereClauses <- c(whereClauses, "race_source_value IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("race_source_value = '", race_source_value,"'"))
    }
  }

  if (!missing(race_source_concept_id)) {
    if (is.null(race_source_concept_id)) {
      whereClauses <- c(whereClauses, "race_source_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("race_source_concept_id = '", race_source_concept_id,"'"))
    }
  }

  if (!missing(ethnicity_source_value)) {
    if (is.null(ethnicity_source_value)) {
      whereClauses <- c(whereClauses, "ethnicity_source_value IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("ethnicity_source_value = '", ethnicity_source_value,"'"))
    }
  }

  if (!missing(ethnicity_source_concept_id)) {
    if (is.null(ethnicity_source_concept_id)) {
      whereClauses <- c(whereClauses, "ethnicity_source_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("ethnicity_source_concept_id = '", ethnicity_source_concept_id,"'"))
    }
  }

  statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  class(statement) <- "subQuery"
  return(statement)
}

lookup_observation_period <- function(fetchField, observation_period_id, person_id, observation_period_start_date, observation_period_end_date, period_type_concept_id) {
  whereClauses = NULL;
  statement <- paste0("SELECT ", fetchField , " FROM @cdm_schema.observation_period WHERE ")
  if (!missing(observation_period_id)) {
    if (is.null(observation_period_id)) {
      whereClauses <- c(whereClauses, "observation_period_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("observation_period_id = '", observation_period_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(observation_period_start_date)) {
    if (is.null(observation_period_start_date)) {
      whereClauses <- c(whereClauses, "observation_period_start_date IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("observation_period_start_date = '", observation_period_start_date,"'"))
    }
  }

  if (!missing(observation_period_end_date)) {
    if (is.null(observation_period_end_date)) {
      whereClauses <- c(whereClauses, "observation_period_end_date IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("observation_period_end_date = '", observation_period_end_date,"'"))
    }
  }

  if (!missing(period_type_concept_id)) {
    if (is.null(period_type_concept_id)) {
      whereClauses <- c(whereClauses, "period_type_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("period_type_concept_id = '", period_type_concept_id,"'"))
    }
  }

  statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  class(statement) <- "subQuery"
  return(statement)
}

lookup_care_site <- function(fetchField, care_site_id, care_site_name, place_of_service_concept_id, location_id, care_site_source_value, place_of_service_source_value) {
  whereClauses = NULL;
  statement <- paste0("SELECT ", fetchField , " FROM @cdm_schema.care_site WHERE ")
  if (!missing(care_site_id)) {
    if (is.null(care_site_id)) {
      whereClauses <- c(whereClauses, "care_site_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("care_site_id = '", care_site_id,"'"))
    }
  }

  if (!missing(care_site_name)) {
    if (is.null(care_site_name)) {
      whereClauses <- c(whereClauses, "care_site_name IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("care_site_name = '", care_site_name,"'"))
    }
  }

  if (!missing(place_of_service_concept_id)) {
    if (is.null(place_of_service_concept_id)) {
      whereClauses <- c(whereClauses, "place_of_service_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("place_of_service_concept_id = '", place_of_service_concept_id,"'"))
    }
  }

  if (!missing(location_id)) {
    if (is.null(location_id)) {
      whereClauses <- c(whereClauses, "location_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("location_id = '", location_id,"'"))
    }
  }

  if (!missing(care_site_source_value)) {
    if (is.null(care_site_source_value)) {
      whereClauses <- c(whereClauses, "care_site_source_value IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("care_site_source_value = '", care_site_source_value,"'"))
    }
  }

  if (!missing(place_of_service_source_value)) {
    if (is.null(place_of_service_source_value)) {
      whereClauses <- c(whereClauses, "place_of_service_source_value IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("place_of_service_source_value = '", place_of_service_source_value,"'"))
    }
  }

  statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  class(statement) <- "subQuery"
  return(statement)
}

lookup_visit_occurrence <- function(fetchField, visit_occurrence_id, person_id, visit_concept_id, visit_start_date, visit_start_time, visit_end_date, visit_end_time, visit_type_concept_id, provider_id, care_site_id, visit_source_value, visit_source_concept_id) {
  whereClauses = NULL;
  statement <- paste0("SELECT ", fetchField , " FROM @cdm_schema.visit_occurrence WHERE ")
  if (!missing(visit_occurrence_id)) {
    if (is.null(visit_occurrence_id)) {
      whereClauses <- c(whereClauses, "visit_occurrence_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("visit_occurrence_id = '", visit_occurrence_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(visit_concept_id)) {
    if (is.null(visit_concept_id)) {
      whereClauses <- c(whereClauses, "visit_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("visit_concept_id = '", visit_concept_id,"'"))
    }
  }

  if (!missing(visit_start_date)) {
    if (is.null(visit_start_date)) {
      whereClauses <- c(whereClauses, "visit_start_date IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("visit_start_date = '", visit_start_date,"'"))
    }
  }

  if (!missing(visit_start_time)) {
    if (is.null(visit_start_time)) {
      whereClauses <- c(whereClauses, "visit_start_time IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("visit_start_time = '", visit_start_time,"'"))
    }
  }

  if (!missing(visit_end_date)) {
    if (is.null(visit_end_date)) {
      whereClauses <- c(whereClauses, "visit_end_date IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("visit_end_date = '", visit_end_date,"'"))
    }
  }

  if (!missing(visit_end_time)) {
    if (is.null(visit_end_time)) {
      whereClauses <- c(whereClauses, "visit_end_time IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("visit_end_time = '", visit_end_time,"'"))
    }
  }

  if (!missing(visit_type_concept_id)) {
    if (is.null(visit_type_concept_id)) {
      whereClauses <- c(whereClauses, "visit_type_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("visit_type_concept_id = '", visit_type_concept_id,"'"))
    }
  }

  if (!missing(provider_id)) {
    if (is.null(provider_id)) {
      whereClauses <- c(whereClauses, "provider_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("provider_id = '", provider_id,"'"))
    }
  }

  if (!missing(care_site_id)) {
    if (is.null(care_site_id)) {
      whereClauses <- c(whereClauses, "care_site_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("care_site_id = '", care_site_id,"'"))
    }
  }

  if (!missing(visit_source_value)) {
    if (is.null(visit_source_value)) {
      whereClauses <- c(whereClauses, "visit_source_value IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("visit_source_value = '", visit_source_value,"'"))
    }
  }

  if (!missing(visit_source_concept_id)) {
    if (is.null(visit_source_concept_id)) {
      whereClauses <- c(whereClauses, "visit_source_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("visit_source_concept_id = '", visit_source_concept_id,"'"))
    }
  }

  statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  class(statement) <- "subQuery"
  return(statement)
}

lookup_provider <- function(fetchField, provider_id, provider_name, npi, dea, specialty_concept_id, care_site_id, year_of_birth, gender_concept_id, provider_source_value, specialty_source_value, specialty_source_concept_id, gender_source_value, gender_source_concept_id) {
  whereClauses = NULL;
  statement <- paste0("SELECT ", fetchField , " FROM @cdm_schema.provider WHERE ")
  if (!missing(provider_id)) {
    if (is.null(provider_id)) {
      whereClauses <- c(whereClauses, "provider_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("provider_id = '", provider_id,"'"))
    }
  }

  if (!missing(provider_name)) {
    if (is.null(provider_name)) {
      whereClauses <- c(whereClauses, "provider_name IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("provider_name = '", provider_name,"'"))
    }
  }

  if (!missing(npi)) {
    if (is.null(npi)) {
      whereClauses <- c(whereClauses, "npi IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("npi = '", npi,"'"))
    }
  }

  if (!missing(dea)) {
    if (is.null(dea)) {
      whereClauses <- c(whereClauses, "dea IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("dea = '", dea,"'"))
    }
  }

  if (!missing(specialty_concept_id)) {
    if (is.null(specialty_concept_id)) {
      whereClauses <- c(whereClauses, "specialty_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("specialty_concept_id = '", specialty_concept_id,"'"))
    }
  }

  if (!missing(care_site_id)) {
    if (is.null(care_site_id)) {
      whereClauses <- c(whereClauses, "care_site_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("care_site_id = '", care_site_id,"'"))
    }
  }

  if (!missing(year_of_birth)) {
    if (is.null(year_of_birth)) {
      whereClauses <- c(whereClauses, "year_of_birth IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("year_of_birth = '", year_of_birth,"'"))
    }
  }

  if (!missing(gender_concept_id)) {
    if (is.null(gender_concept_id)) {
      whereClauses <- c(whereClauses, "gender_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("gender_concept_id = '", gender_concept_id,"'"))
    }
  }

  if (!missing(provider_source_value)) {
    if (is.null(provider_source_value)) {
      whereClauses <- c(whereClauses, "provider_source_value IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("provider_source_value = '", provider_source_value,"'"))
    }
  }

  if (!missing(specialty_source_value)) {
    if (is.null(specialty_source_value)) {
      whereClauses <- c(whereClauses, "specialty_source_value IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("specialty_source_value = '", specialty_source_value,"'"))
    }
  }

  if (!missing(specialty_source_concept_id)) {
    if (is.null(specialty_source_concept_id)) {
      whereClauses <- c(whereClauses, "specialty_source_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("specialty_source_concept_id = '", specialty_source_concept_id,"'"))
    }
  }

  if (!missing(gender_source_value)) {
    if (is.null(gender_source_value)) {
      whereClauses <- c(whereClauses, "gender_source_value IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("gender_source_value = '", gender_source_value,"'"))
    }
  }

  if (!missing(gender_source_concept_id)) {
    if (is.null(gender_source_concept_id)) {
      whereClauses <- c(whereClauses, "gender_source_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("gender_source_concept_id = '", gender_source_concept_id,"'"))
    }
  }

  statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  class(statement) <- "subQuery"
  return(statement)
}

lookup_condition_occurrence <- function(fetchField, condition_occurrence_id, person_id, condition_concept_id, condition_start_date, condition_end_date, condition_type_concept_id, stop_reason, provider_id, visit_occurrence_id, condition_source_value, condition_source_concept_id) {
  whereClauses = NULL;
  statement <- paste0("SELECT ", fetchField , " FROM @cdm_schema.condition_occurrence WHERE ")
  if (!missing(condition_occurrence_id)) {
    if (is.null(condition_occurrence_id)) {
      whereClauses <- c(whereClauses, "condition_occurrence_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("condition_occurrence_id = '", condition_occurrence_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(condition_concept_id)) {
    if (is.null(condition_concept_id)) {
      whereClauses <- c(whereClauses, "condition_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("condition_concept_id = '", condition_concept_id,"'"))
    }
  }

  if (!missing(condition_start_date)) {
    if (is.null(condition_start_date)) {
      whereClauses <- c(whereClauses, "condition_start_date IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("condition_start_date = '", condition_start_date,"'"))
    }
  }

  if (!missing(condition_end_date)) {
    if (is.null(condition_end_date)) {
      whereClauses <- c(whereClauses, "condition_end_date IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("condition_end_date = '", condition_end_date,"'"))
    }
  }

  if (!missing(condition_type_concept_id)) {
    if (is.null(condition_type_concept_id)) {
      whereClauses <- c(whereClauses, "condition_type_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("condition_type_concept_id = '", condition_type_concept_id,"'"))
    }
  }

  if (!missing(stop_reason)) {
    if (is.null(stop_reason)) {
      whereClauses <- c(whereClauses, "stop_reason IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("stop_reason = '", stop_reason,"'"))
    }
  }

  if (!missing(provider_id)) {
    if (is.null(provider_id)) {
      whereClauses <- c(whereClauses, "provider_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("provider_id = '", provider_id,"'"))
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (is.null(visit_occurrence_id)) {
      whereClauses <- c(whereClauses, "visit_occurrence_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("visit_occurrence_id = '", visit_occurrence_id,"'"))
    }
  }

  if (!missing(condition_source_value)) {
    if (is.null(condition_source_value)) {
      whereClauses <- c(whereClauses, "condition_source_value IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("condition_source_value = '", condition_source_value,"'"))
    }
  }

  if (!missing(condition_source_concept_id)) {
    if (is.null(condition_source_concept_id)) {
      whereClauses <- c(whereClauses, "condition_source_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("condition_source_concept_id = '", condition_source_concept_id,"'"))
    }
  }

  statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  class(statement) <- "subQuery"
  return(statement)
}

lookup_death <- function(fetchField, person_id, death_date, death_type_concept_id, cause_concept_id, cause_source_value, cause_source_concept_id) {
  whereClauses = NULL;
  statement <- paste0("SELECT ", fetchField , " FROM @cdm_schema.death WHERE ")
  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(death_date)) {
    if (is.null(death_date)) {
      whereClauses <- c(whereClauses, "death_date IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("death_date = '", death_date,"'"))
    }
  }

  if (!missing(death_type_concept_id)) {
    if (is.null(death_type_concept_id)) {
      whereClauses <- c(whereClauses, "death_type_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("death_type_concept_id = '", death_type_concept_id,"'"))
    }
  }

  if (!missing(cause_concept_id)) {
    if (is.null(cause_concept_id)) {
      whereClauses <- c(whereClauses, "cause_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("cause_concept_id = '", cause_concept_id,"'"))
    }
  }

  if (!missing(cause_source_value)) {
    if (is.null(cause_source_value)) {
      whereClauses <- c(whereClauses, "cause_source_value IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("cause_source_value = '", cause_source_value,"'"))
    }
  }

  if (!missing(cause_source_concept_id)) {
    if (is.null(cause_source_concept_id)) {
      whereClauses <- c(whereClauses, "cause_source_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("cause_source_concept_id = '", cause_source_concept_id,"'"))
    }
  }

  statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  class(statement) <- "subQuery"
  return(statement)
}

lookup_drug_exposure <- function(fetchField, drug_exposure_id, person_id, drug_concept_id, drug_exposure_start_date, drug_exposure_end_date, drug_type_concept_id, stop_reason, refills, quantity, days_supply, sig, route_concept_id, effective_drug_dose, dose_unit_concept_id, lot_number, provider_id, visit_occurrence_id, drug_source_value, drug_source_concept_id, route_source_value, dose_unit_source_value) {
  whereClauses = NULL;
  statement <- paste0("SELECT ", fetchField , " FROM @cdm_schema.drug_exposure WHERE ")
  if (!missing(drug_exposure_id)) {
    if (is.null(drug_exposure_id)) {
      whereClauses <- c(whereClauses, "drug_exposure_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("drug_exposure_id = '", drug_exposure_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(drug_concept_id)) {
    if (is.null(drug_concept_id)) {
      whereClauses <- c(whereClauses, "drug_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("drug_concept_id = '", drug_concept_id,"'"))
    }
  }

  if (!missing(drug_exposure_start_date)) {
    if (is.null(drug_exposure_start_date)) {
      whereClauses <- c(whereClauses, "drug_exposure_start_date IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("drug_exposure_start_date = '", drug_exposure_start_date,"'"))
    }
  }

  if (!missing(drug_exposure_end_date)) {
    if (is.null(drug_exposure_end_date)) {
      whereClauses <- c(whereClauses, "drug_exposure_end_date IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("drug_exposure_end_date = '", drug_exposure_end_date,"'"))
    }
  }

  if (!missing(drug_type_concept_id)) {
    if (is.null(drug_type_concept_id)) {
      whereClauses <- c(whereClauses, "drug_type_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("drug_type_concept_id = '", drug_type_concept_id,"'"))
    }
  }

  if (!missing(stop_reason)) {
    if (is.null(stop_reason)) {
      whereClauses <- c(whereClauses, "stop_reason IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("stop_reason = '", stop_reason,"'"))
    }
  }

  if (!missing(refills)) {
    if (is.null(refills)) {
      whereClauses <- c(whereClauses, "refills IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("refills = '", refills,"'"))
    }
  }

  if (!missing(quantity)) {
    if (is.null(quantity)) {
      whereClauses <- c(whereClauses, "quantity IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("quantity = '", quantity,"'"))
    }
  }

  if (!missing(days_supply)) {
    if (is.null(days_supply)) {
      whereClauses <- c(whereClauses, "days_supply IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("days_supply = '", days_supply,"'"))
    }
  }

  if (!missing(sig)) {
    if (is.null(sig)) {
      whereClauses <- c(whereClauses, "sig IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("sig = '", sig,"'"))
    }
  }

  if (!missing(route_concept_id)) {
    if (is.null(route_concept_id)) {
      whereClauses <- c(whereClauses, "route_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("route_concept_id = '", route_concept_id,"'"))
    }
  }

  if (!missing(effective_drug_dose)) {
    if (is.null(effective_drug_dose)) {
      whereClauses <- c(whereClauses, "effective_drug_dose IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("effective_drug_dose = '", effective_drug_dose,"'"))
    }
  }

  if (!missing(dose_unit_concept_id)) {
    if (is.null(dose_unit_concept_id)) {
      whereClauses <- c(whereClauses, "dose_unit_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("dose_unit_concept_id = '", dose_unit_concept_id,"'"))
    }
  }

  if (!missing(lot_number)) {
    if (is.null(lot_number)) {
      whereClauses <- c(whereClauses, "lot_number IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("lot_number = '", lot_number,"'"))
    }
  }

  if (!missing(provider_id)) {
    if (is.null(provider_id)) {
      whereClauses <- c(whereClauses, "provider_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("provider_id = '", provider_id,"'"))
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (is.null(visit_occurrence_id)) {
      whereClauses <- c(whereClauses, "visit_occurrence_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("visit_occurrence_id = '", visit_occurrence_id,"'"))
    }
  }

  if (!missing(drug_source_value)) {
    if (is.null(drug_source_value)) {
      whereClauses <- c(whereClauses, "drug_source_value IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("drug_source_value = '", drug_source_value,"'"))
    }
  }

  if (!missing(drug_source_concept_id)) {
    if (is.null(drug_source_concept_id)) {
      whereClauses <- c(whereClauses, "drug_source_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("drug_source_concept_id = '", drug_source_concept_id,"'"))
    }
  }

  if (!missing(route_source_value)) {
    if (is.null(route_source_value)) {
      whereClauses <- c(whereClauses, "route_source_value IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("route_source_value = '", route_source_value,"'"))
    }
  }

  if (!missing(dose_unit_source_value)) {
    if (is.null(dose_unit_source_value)) {
      whereClauses <- c(whereClauses, "dose_unit_source_value IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("dose_unit_source_value = '", dose_unit_source_value,"'"))
    }
  }

  statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  class(statement) <- "subQuery"
  return(statement)
}

lookup_device_exposure <- function(fetchField, device_exposure_id, person_id, device_concept_id, device_exposure_start_date, device_exposure_end_date, device_type_concept_id, unique_device_id, quantity, provider_id, visit_occurrence_id, device_source_value, device_source_concept_id) {
  whereClauses = NULL;
  statement <- paste0("SELECT ", fetchField , " FROM @cdm_schema.device_exposure WHERE ")
  if (!missing(device_exposure_id)) {
    if (is.null(device_exposure_id)) {
      whereClauses <- c(whereClauses, "device_exposure_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("device_exposure_id = '", device_exposure_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(device_concept_id)) {
    if (is.null(device_concept_id)) {
      whereClauses <- c(whereClauses, "device_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("device_concept_id = '", device_concept_id,"'"))
    }
  }

  if (!missing(device_exposure_start_date)) {
    if (is.null(device_exposure_start_date)) {
      whereClauses <- c(whereClauses, "device_exposure_start_date IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("device_exposure_start_date = '", device_exposure_start_date,"'"))
    }
  }

  if (!missing(device_exposure_end_date)) {
    if (is.null(device_exposure_end_date)) {
      whereClauses <- c(whereClauses, "device_exposure_end_date IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("device_exposure_end_date = '", device_exposure_end_date,"'"))
    }
  }

  if (!missing(device_type_concept_id)) {
    if (is.null(device_type_concept_id)) {
      whereClauses <- c(whereClauses, "device_type_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("device_type_concept_id = '", device_type_concept_id,"'"))
    }
  }

  if (!missing(unique_device_id)) {
    if (is.null(unique_device_id)) {
      whereClauses <- c(whereClauses, "unique_device_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("unique_device_id = '", unique_device_id,"'"))
    }
  }

  if (!missing(quantity)) {
    if (is.null(quantity)) {
      whereClauses <- c(whereClauses, "quantity IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("quantity = '", quantity,"'"))
    }
  }

  if (!missing(provider_id)) {
    if (is.null(provider_id)) {
      whereClauses <- c(whereClauses, "provider_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("provider_id = '", provider_id,"'"))
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (is.null(visit_occurrence_id)) {
      whereClauses <- c(whereClauses, "visit_occurrence_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("visit_occurrence_id = '", visit_occurrence_id,"'"))
    }
  }

  if (!missing(device_source_value)) {
    if (is.null(device_source_value)) {
      whereClauses <- c(whereClauses, "device_source_value IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("device_source_value = '", device_source_value,"'"))
    }
  }

  if (!missing(device_source_concept_id)) {
    if (is.null(device_source_concept_id)) {
      whereClauses <- c(whereClauses, "device_source_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("device_source_concept_id = '", device_source_concept_id,"'"))
    }
  }

  statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  class(statement) <- "subQuery"
  return(statement)
}

lookup_procedure_occurrence <- function(fetchField, procedure_occurrence_id, person_id, procedure_concept_id, procedure_date, procedure_type_concept_id, modifier_concept_id, quantity, provider_id, visit_occurrence_id, procedure_source_value, procedure_source_concept_id, qualifier_source_value) {
  whereClauses = NULL;
  statement <- paste0("SELECT ", fetchField , " FROM @cdm_schema.procedure_occurrence WHERE ")
  if (!missing(procedure_occurrence_id)) {
    if (is.null(procedure_occurrence_id)) {
      whereClauses <- c(whereClauses, "procedure_occurrence_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("procedure_occurrence_id = '", procedure_occurrence_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(procedure_concept_id)) {
    if (is.null(procedure_concept_id)) {
      whereClauses <- c(whereClauses, "procedure_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("procedure_concept_id = '", procedure_concept_id,"'"))
    }
  }

  if (!missing(procedure_date)) {
    if (is.null(procedure_date)) {
      whereClauses <- c(whereClauses, "procedure_date IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("procedure_date = '", procedure_date,"'"))
    }
  }

  if (!missing(procedure_type_concept_id)) {
    if (is.null(procedure_type_concept_id)) {
      whereClauses <- c(whereClauses, "procedure_type_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("procedure_type_concept_id = '", procedure_type_concept_id,"'"))
    }
  }

  if (!missing(modifier_concept_id)) {
    if (is.null(modifier_concept_id)) {
      whereClauses <- c(whereClauses, "modifier_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("modifier_concept_id = '", modifier_concept_id,"'"))
    }
  }

  if (!missing(quantity)) {
    if (is.null(quantity)) {
      whereClauses <- c(whereClauses, "quantity IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("quantity = '", quantity,"'"))
    }
  }

  if (!missing(provider_id)) {
    if (is.null(provider_id)) {
      whereClauses <- c(whereClauses, "provider_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("provider_id = '", provider_id,"'"))
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (is.null(visit_occurrence_id)) {
      whereClauses <- c(whereClauses, "visit_occurrence_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("visit_occurrence_id = '", visit_occurrence_id,"'"))
    }
  }

  if (!missing(procedure_source_value)) {
    if (is.null(procedure_source_value)) {
      whereClauses <- c(whereClauses, "procedure_source_value IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("procedure_source_value = '", procedure_source_value,"'"))
    }
  }

  if (!missing(procedure_source_concept_id)) {
    if (is.null(procedure_source_concept_id)) {
      whereClauses <- c(whereClauses, "procedure_source_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("procedure_source_concept_id = '", procedure_source_concept_id,"'"))
    }
  }

  if (!missing(qualifier_source_value)) {
    if (is.null(qualifier_source_value)) {
      whereClauses <- c(whereClauses, "qualifier_source_value IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("qualifier_source_value = '", qualifier_source_value,"'"))
    }
  }

  statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  class(statement) <- "subQuery"
  return(statement)
}

lookup_measurement <- function(fetchField, measurement_id, person_id, measurement_concept_id, measurement_date, measurement_time, measurement_type_concept_id, operator_concept_id, value_as_number, value_as_concept_id, unit_concept_id, range_low, range_high, provider_id, visit_occurrence_id, measurement_source_value, measurement_source_concept_id, unit_source_value, value_source_value) {
  whereClauses = NULL;
  statement <- paste0("SELECT ", fetchField , " FROM @cdm_schema.measurement WHERE ")
  if (!missing(measurement_id)) {
    if (is.null(measurement_id)) {
      whereClauses <- c(whereClauses, "measurement_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("measurement_id = '", measurement_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(measurement_concept_id)) {
    if (is.null(measurement_concept_id)) {
      whereClauses <- c(whereClauses, "measurement_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("measurement_concept_id = '", measurement_concept_id,"'"))
    }
  }

  if (!missing(measurement_date)) {
    if (is.null(measurement_date)) {
      whereClauses <- c(whereClauses, "measurement_date IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("measurement_date = '", measurement_date,"'"))
    }
  }

  if (!missing(measurement_time)) {
    if (is.null(measurement_time)) {
      whereClauses <- c(whereClauses, "measurement_time IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("measurement_time = '", measurement_time,"'"))
    }
  }

  if (!missing(measurement_type_concept_id)) {
    if (is.null(measurement_type_concept_id)) {
      whereClauses <- c(whereClauses, "measurement_type_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("measurement_type_concept_id = '", measurement_type_concept_id,"'"))
    }
  }

  if (!missing(operator_concept_id)) {
    if (is.null(operator_concept_id)) {
      whereClauses <- c(whereClauses, "operator_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("operator_concept_id = '", operator_concept_id,"'"))
    }
  }

  if (!missing(value_as_number)) {
    if (is.null(value_as_number)) {
      whereClauses <- c(whereClauses, "value_as_number IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("value_as_number = '", value_as_number,"'"))
    }
  }

  if (!missing(value_as_concept_id)) {
    if (is.null(value_as_concept_id)) {
      whereClauses <- c(whereClauses, "value_as_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("value_as_concept_id = '", value_as_concept_id,"'"))
    }
  }

  if (!missing(unit_concept_id)) {
    if (is.null(unit_concept_id)) {
      whereClauses <- c(whereClauses, "unit_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("unit_concept_id = '", unit_concept_id,"'"))
    }
  }

  if (!missing(range_low)) {
    if (is.null(range_low)) {
      whereClauses <- c(whereClauses, "range_low IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("range_low = '", range_low,"'"))
    }
  }

  if (!missing(range_high)) {
    if (is.null(range_high)) {
      whereClauses <- c(whereClauses, "range_high IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("range_high = '", range_high,"'"))
    }
  }

  if (!missing(provider_id)) {
    if (is.null(provider_id)) {
      whereClauses <- c(whereClauses, "provider_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("provider_id = '", provider_id,"'"))
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (is.null(visit_occurrence_id)) {
      whereClauses <- c(whereClauses, "visit_occurrence_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("visit_occurrence_id = '", visit_occurrence_id,"'"))
    }
  }

  if (!missing(measurement_source_value)) {
    if (is.null(measurement_source_value)) {
      whereClauses <- c(whereClauses, "measurement_source_value IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("measurement_source_value = '", measurement_source_value,"'"))
    }
  }

  if (!missing(measurement_source_concept_id)) {
    if (is.null(measurement_source_concept_id)) {
      whereClauses <- c(whereClauses, "measurement_source_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("measurement_source_concept_id = '", measurement_source_concept_id,"'"))
    }
  }

  if (!missing(unit_source_value)) {
    if (is.null(unit_source_value)) {
      whereClauses <- c(whereClauses, "unit_source_value IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("unit_source_value = '", unit_source_value,"'"))
    }
  }

  if (!missing(value_source_value)) {
    if (is.null(value_source_value)) {
      whereClauses <- c(whereClauses, "value_source_value IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("value_source_value = '", value_source_value,"'"))
    }
  }

  statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  class(statement) <- "subQuery"
  return(statement)
}

lookup_observation <- function(fetchField, observation_id, person_id, observation_concept_id, observation_date, observation_time, observation_type_concept_id, value_as_number, value_as_string, value_as_concept_id, qualifier_concept_id, unit_concept_id, provider_id, visit_occurrence_id, observation_source_value, observation_source_concept_id, unit_source_value, qualifier_source_value) {
  whereClauses = NULL;
  statement <- paste0("SELECT ", fetchField , " FROM @cdm_schema.observation WHERE ")
  if (!missing(observation_id)) {
    if (is.null(observation_id)) {
      whereClauses <- c(whereClauses, "observation_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("observation_id = '", observation_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(observation_concept_id)) {
    if (is.null(observation_concept_id)) {
      whereClauses <- c(whereClauses, "observation_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("observation_concept_id = '", observation_concept_id,"'"))
    }
  }

  if (!missing(observation_date)) {
    if (is.null(observation_date)) {
      whereClauses <- c(whereClauses, "observation_date IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("observation_date = '", observation_date,"'"))
    }
  }

  if (!missing(observation_time)) {
    if (is.null(observation_time)) {
      whereClauses <- c(whereClauses, "observation_time IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("observation_time = '", observation_time,"'"))
    }
  }

  if (!missing(observation_type_concept_id)) {
    if (is.null(observation_type_concept_id)) {
      whereClauses <- c(whereClauses, "observation_type_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("observation_type_concept_id = '", observation_type_concept_id,"'"))
    }
  }

  if (!missing(value_as_number)) {
    if (is.null(value_as_number)) {
      whereClauses <- c(whereClauses, "value_as_number IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("value_as_number = '", value_as_number,"'"))
    }
  }

  if (!missing(value_as_string)) {
    if (is.null(value_as_string)) {
      whereClauses <- c(whereClauses, "value_as_string IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("value_as_string = '", value_as_string,"'"))
    }
  }

  if (!missing(value_as_concept_id)) {
    if (is.null(value_as_concept_id)) {
      whereClauses <- c(whereClauses, "value_as_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("value_as_concept_id = '", value_as_concept_id,"'"))
    }
  }

  if (!missing(qualifier_concept_id)) {
    if (is.null(qualifier_concept_id)) {
      whereClauses <- c(whereClauses, "qualifier_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("qualifier_concept_id = '", qualifier_concept_id,"'"))
    }
  }

  if (!missing(unit_concept_id)) {
    if (is.null(unit_concept_id)) {
      whereClauses <- c(whereClauses, "unit_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("unit_concept_id = '", unit_concept_id,"'"))
    }
  }

  if (!missing(provider_id)) {
    if (is.null(provider_id)) {
      whereClauses <- c(whereClauses, "provider_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("provider_id = '", provider_id,"'"))
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (is.null(visit_occurrence_id)) {
      whereClauses <- c(whereClauses, "visit_occurrence_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("visit_occurrence_id = '", visit_occurrence_id,"'"))
    }
  }

  if (!missing(observation_source_value)) {
    if (is.null(observation_source_value)) {
      whereClauses <- c(whereClauses, "observation_source_value IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("observation_source_value = '", observation_source_value,"'"))
    }
  }

  if (!missing(observation_source_concept_id)) {
    if (is.null(observation_source_concept_id)) {
      whereClauses <- c(whereClauses, "observation_source_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("observation_source_concept_id = '", observation_source_concept_id,"'"))
    }
  }

  if (!missing(unit_source_value)) {
    if (is.null(unit_source_value)) {
      whereClauses <- c(whereClauses, "unit_source_value IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("unit_source_value = '", unit_source_value,"'"))
    }
  }

  if (!missing(qualifier_source_value)) {
    if (is.null(qualifier_source_value)) {
      whereClauses <- c(whereClauses, "qualifier_source_value IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("qualifier_source_value = '", qualifier_source_value,"'"))
    }
  }

  statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  class(statement) <- "subQuery"
  return(statement)
}

lookup_note <- function(fetchField, note_id, person_id, note_date, note_time, note_type_concept_id, note_text, provider_id, visit_occurrence_id, note_source_value) {
  whereClauses = NULL;
  statement <- paste0("SELECT ", fetchField , " FROM @cdm_schema.note WHERE ")
  if (!missing(note_id)) {
    if (is.null(note_id)) {
      whereClauses <- c(whereClauses, "note_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("note_id = '", note_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(note_date)) {
    if (is.null(note_date)) {
      whereClauses <- c(whereClauses, "note_date IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("note_date = '", note_date,"'"))
    }
  }

  if (!missing(note_time)) {
    if (is.null(note_time)) {
      whereClauses <- c(whereClauses, "note_time IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("note_time = '", note_time,"'"))
    }
  }

  if (!missing(note_type_concept_id)) {
    if (is.null(note_type_concept_id)) {
      whereClauses <- c(whereClauses, "note_type_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("note_type_concept_id = '", note_type_concept_id,"'"))
    }
  }

  if (!missing(note_text)) {
    if (is.null(note_text)) {
      whereClauses <- c(whereClauses, "note_text IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("note_text = '", note_text,"'"))
    }
  }

  if (!missing(provider_id)) {
    if (is.null(provider_id)) {
      whereClauses <- c(whereClauses, "provider_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("provider_id = '", provider_id,"'"))
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (is.null(visit_occurrence_id)) {
      whereClauses <- c(whereClauses, "visit_occurrence_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("visit_occurrence_id = '", visit_occurrence_id,"'"))
    }
  }

  if (!missing(note_source_value)) {
    if (is.null(note_source_value)) {
      whereClauses <- c(whereClauses, "note_source_value IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("note_source_value = '", note_source_value,"'"))
    }
  }

  statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  class(statement) <- "subQuery"
  return(statement)
}

lookup_specimen <- function(fetchField, specimen_id, person_id, specimen_concept_id, specimen_type_concept_id, specimen_date, specimen_time, quantity, unit_concept_id, anatomic_site_concept_id, disease_status_concept_id, specimen_source_id, specimen_source_value, unit_source_value, anatomic_site_source_value, disease_status_source_value) {
  whereClauses = NULL;
  statement <- paste0("SELECT ", fetchField , " FROM @cdm_schema.specimen WHERE ")
  if (!missing(specimen_id)) {
    if (is.null(specimen_id)) {
      whereClauses <- c(whereClauses, "specimen_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("specimen_id = '", specimen_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(specimen_concept_id)) {
    if (is.null(specimen_concept_id)) {
      whereClauses <- c(whereClauses, "specimen_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("specimen_concept_id = '", specimen_concept_id,"'"))
    }
  }

  if (!missing(specimen_type_concept_id)) {
    if (is.null(specimen_type_concept_id)) {
      whereClauses <- c(whereClauses, "specimen_type_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("specimen_type_concept_id = '", specimen_type_concept_id,"'"))
    }
  }

  if (!missing(specimen_date)) {
    if (is.null(specimen_date)) {
      whereClauses <- c(whereClauses, "specimen_date IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("specimen_date = '", specimen_date,"'"))
    }
  }

  if (!missing(specimen_time)) {
    if (is.null(specimen_time)) {
      whereClauses <- c(whereClauses, "specimen_time IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("specimen_time = '", specimen_time,"'"))
    }
  }

  if (!missing(quantity)) {
    if (is.null(quantity)) {
      whereClauses <- c(whereClauses, "quantity IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("quantity = '", quantity,"'"))
    }
  }

  if (!missing(unit_concept_id)) {
    if (is.null(unit_concept_id)) {
      whereClauses <- c(whereClauses, "unit_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("unit_concept_id = '", unit_concept_id,"'"))
    }
  }

  if (!missing(anatomic_site_concept_id)) {
    if (is.null(anatomic_site_concept_id)) {
      whereClauses <- c(whereClauses, "anatomic_site_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("anatomic_site_concept_id = '", anatomic_site_concept_id,"'"))
    }
  }

  if (!missing(disease_status_concept_id)) {
    if (is.null(disease_status_concept_id)) {
      whereClauses <- c(whereClauses, "disease_status_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("disease_status_concept_id = '", disease_status_concept_id,"'"))
    }
  }

  if (!missing(specimen_source_id)) {
    if (is.null(specimen_source_id)) {
      whereClauses <- c(whereClauses, "specimen_source_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("specimen_source_id = '", specimen_source_id,"'"))
    }
  }

  if (!missing(specimen_source_value)) {
    if (is.null(specimen_source_value)) {
      whereClauses <- c(whereClauses, "specimen_source_value IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("specimen_source_value = '", specimen_source_value,"'"))
    }
  }

  if (!missing(unit_source_value)) {
    if (is.null(unit_source_value)) {
      whereClauses <- c(whereClauses, "unit_source_value IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("unit_source_value = '", unit_source_value,"'"))
    }
  }

  if (!missing(anatomic_site_source_value)) {
    if (is.null(anatomic_site_source_value)) {
      whereClauses <- c(whereClauses, "anatomic_site_source_value IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("anatomic_site_source_value = '", anatomic_site_source_value,"'"))
    }
  }

  if (!missing(disease_status_source_value)) {
    if (is.null(disease_status_source_value)) {
      whereClauses <- c(whereClauses, "disease_status_source_value IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("disease_status_source_value = '", disease_status_source_value,"'"))
    }
  }

  statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  class(statement) <- "subQuery"
  return(statement)
}

lookup_fact_relationship <- function(fetchField, domain_concept_id_1, fact_id_1, domain_concept_id_2, fact_id_2, relationship_concept_id) {
  whereClauses = NULL;
  statement <- paste0("SELECT ", fetchField , " FROM @cdm_schema.fact_relationship WHERE ")
  if (!missing(domain_concept_id_1)) {
    if (is.null(domain_concept_id_1)) {
      whereClauses <- c(whereClauses, "domain_concept_id_1 IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("domain_concept_id_1 = '", domain_concept_id_1,"'"))
    }
  }

  if (!missing(fact_id_1)) {
    if (is.null(fact_id_1)) {
      whereClauses <- c(whereClauses, "fact_id_1 IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("fact_id_1 = '", fact_id_1,"'"))
    }
  }

  if (!missing(domain_concept_id_2)) {
    if (is.null(domain_concept_id_2)) {
      whereClauses <- c(whereClauses, "domain_concept_id_2 IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("domain_concept_id_2 = '", domain_concept_id_2,"'"))
    }
  }

  if (!missing(fact_id_2)) {
    if (is.null(fact_id_2)) {
      whereClauses <- c(whereClauses, "fact_id_2 IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("fact_id_2 = '", fact_id_2,"'"))
    }
  }

  if (!missing(relationship_concept_id)) {
    if (is.null(relationship_concept_id)) {
      whereClauses <- c(whereClauses, "relationship_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("relationship_concept_id = '", relationship_concept_id,"'"))
    }
  }

  statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  class(statement) <- "subQuery"
  return(statement)
}

lookup_payer_plan_period <- function(fetchField, payer_plan_period_id, person_id, payer_plan_period_start_date, payer_plan_period_end_date, payer_source_value, plan_source_value, family_source_value) {
  whereClauses = NULL;
  statement <- paste0("SELECT ", fetchField , " FROM @cdm_schema.payer_plan_period WHERE ")
  if (!missing(payer_plan_period_id)) {
    if (is.null(payer_plan_period_id)) {
      whereClauses <- c(whereClauses, "payer_plan_period_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("payer_plan_period_id = '", payer_plan_period_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(payer_plan_period_start_date)) {
    if (is.null(payer_plan_period_start_date)) {
      whereClauses <- c(whereClauses, "payer_plan_period_start_date IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("payer_plan_period_start_date = '", payer_plan_period_start_date,"'"))
    }
  }

  if (!missing(payer_plan_period_end_date)) {
    if (is.null(payer_plan_period_end_date)) {
      whereClauses <- c(whereClauses, "payer_plan_period_end_date IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("payer_plan_period_end_date = '", payer_plan_period_end_date,"'"))
    }
  }

  if (!missing(payer_source_value)) {
    if (is.null(payer_source_value)) {
      whereClauses <- c(whereClauses, "payer_source_value IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("payer_source_value = '", payer_source_value,"'"))
    }
  }

  if (!missing(plan_source_value)) {
    if (is.null(plan_source_value)) {
      whereClauses <- c(whereClauses, "plan_source_value IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("plan_source_value = '", plan_source_value,"'"))
    }
  }

  if (!missing(family_source_value)) {
    if (is.null(family_source_value)) {
      whereClauses <- c(whereClauses, "family_source_value IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("family_source_value = '", family_source_value,"'"))
    }
  }

  statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  class(statement) <- "subQuery"
  return(statement)
}

lookup_drug_era <- function(fetchField, drug_era_id, person_id, drug_concept_id, drug_era_start_date, drug_era_end_date, drug_exposure_count, gap_days) {
  whereClauses = NULL;
  statement <- paste0("SELECT ", fetchField , " FROM @cdm_schema.drug_era WHERE ")
  if (!missing(drug_era_id)) {
    if (is.null(drug_era_id)) {
      whereClauses <- c(whereClauses, "drug_era_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("drug_era_id = '", drug_era_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(drug_concept_id)) {
    if (is.null(drug_concept_id)) {
      whereClauses <- c(whereClauses, "drug_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("drug_concept_id = '", drug_concept_id,"'"))
    }
  }

  if (!missing(drug_era_start_date)) {
    if (is.null(drug_era_start_date)) {
      whereClauses <- c(whereClauses, "drug_era_start_date IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("drug_era_start_date = '", drug_era_start_date,"'"))
    }
  }

  if (!missing(drug_era_end_date)) {
    if (is.null(drug_era_end_date)) {
      whereClauses <- c(whereClauses, "drug_era_end_date IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("drug_era_end_date = '", drug_era_end_date,"'"))
    }
  }

  if (!missing(drug_exposure_count)) {
    if (is.null(drug_exposure_count)) {
      whereClauses <- c(whereClauses, "drug_exposure_count IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("drug_exposure_count = '", drug_exposure_count,"'"))
    }
  }

  if (!missing(gap_days)) {
    if (is.null(gap_days)) {
      whereClauses <- c(whereClauses, "gap_days IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("gap_days = '", gap_days,"'"))
    }
  }

  statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  class(statement) <- "subQuery"
  return(statement)
}

lookup_dose_era <- function(fetchField, dose_era_id, person_id, drug_concept_id, unit_concept_id, dose_value, dose_era_start_date, dose_era_end_date) {
  whereClauses = NULL;
  statement <- paste0("SELECT ", fetchField , " FROM @cdm_schema.dose_era WHERE ")
  if (!missing(dose_era_id)) {
    if (is.null(dose_era_id)) {
      whereClauses <- c(whereClauses, "dose_era_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("dose_era_id = '", dose_era_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(drug_concept_id)) {
    if (is.null(drug_concept_id)) {
      whereClauses <- c(whereClauses, "drug_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("drug_concept_id = '", drug_concept_id,"'"))
    }
  }

  if (!missing(unit_concept_id)) {
    if (is.null(unit_concept_id)) {
      whereClauses <- c(whereClauses, "unit_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("unit_concept_id = '", unit_concept_id,"'"))
    }
  }

  if (!missing(dose_value)) {
    if (is.null(dose_value)) {
      whereClauses <- c(whereClauses, "dose_value IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("dose_value = '", dose_value,"'"))
    }
  }

  if (!missing(dose_era_start_date)) {
    if (is.null(dose_era_start_date)) {
      whereClauses <- c(whereClauses, "dose_era_start_date IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("dose_era_start_date = '", dose_era_start_date,"'"))
    }
  }

  if (!missing(dose_era_end_date)) {
    if (is.null(dose_era_end_date)) {
      whereClauses <- c(whereClauses, "dose_era_end_date IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("dose_era_end_date = '", dose_era_end_date,"'"))
    }
  }

  statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  class(statement) <- "subQuery"
  return(statement)
}

lookup_condition_era <- function(fetchField, condition_era_id, person_id, condition_concept_id, condition_era_start_date, condition_era_end_date, condition_occurrence_count) {
  whereClauses = NULL;
  statement <- paste0("SELECT ", fetchField , " FROM @cdm_schema.condition_era WHERE ")
  if (!missing(condition_era_id)) {
    if (is.null(condition_era_id)) {
      whereClauses <- c(whereClauses, "condition_era_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("condition_era_id = '", condition_era_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(condition_concept_id)) {
    if (is.null(condition_concept_id)) {
      whereClauses <- c(whereClauses, "condition_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("condition_concept_id = '", condition_concept_id,"'"))
    }
  }

  if (!missing(condition_era_start_date)) {
    if (is.null(condition_era_start_date)) {
      whereClauses <- c(whereClauses, "condition_era_start_date IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("condition_era_start_date = '", condition_era_start_date,"'"))
    }
  }

  if (!missing(condition_era_end_date)) {
    if (is.null(condition_era_end_date)) {
      whereClauses <- c(whereClauses, "condition_era_end_date IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("condition_era_end_date = '", condition_era_end_date,"'"))
    }
  }

  if (!missing(condition_occurrence_count)) {
    if (is.null(condition_occurrence_count)) {
      whereClauses <- c(whereClauses, "condition_occurrence_count IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("condition_occurrence_count = '", condition_occurrence_count,"'"))
    }
  }

  statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  class(statement) <- "subQuery"
  return(statement)
}

lookup_cdm_source <- function(fetchField, cdm_source_name, cdm_source_abbreviation, cdm_holder, source_description, source_documentation_reference, cdm_etl_reference, source_release_date, cdm_release_date, cdm_version, vocabulary_version) {
  whereClauses = NULL;
  statement <- paste0("SELECT ", fetchField , " FROM @cdm_schema.cdm_source WHERE ")
  if (!missing(cdm_source_name)) {
    if (is.null(cdm_source_name)) {
      whereClauses <- c(whereClauses, "cdm_source_name IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("cdm_source_name = '", cdm_source_name,"'"))
    }
  }

  if (!missing(cdm_source_abbreviation)) {
    if (is.null(cdm_source_abbreviation)) {
      whereClauses <- c(whereClauses, "cdm_source_abbreviation IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("cdm_source_abbreviation = '", cdm_source_abbreviation,"'"))
    }
  }

  if (!missing(cdm_holder)) {
    if (is.null(cdm_holder)) {
      whereClauses <- c(whereClauses, "cdm_holder IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("cdm_holder = '", cdm_holder,"'"))
    }
  }

  if (!missing(source_description)) {
    if (is.null(source_description)) {
      whereClauses <- c(whereClauses, "source_description IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("source_description = '", source_description,"'"))
    }
  }

  if (!missing(source_documentation_reference)) {
    if (is.null(source_documentation_reference)) {
      whereClauses <- c(whereClauses, "source_documentation_reference IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("source_documentation_reference = '", source_documentation_reference,"'"))
    }
  }

  if (!missing(cdm_etl_reference)) {
    if (is.null(cdm_etl_reference)) {
      whereClauses <- c(whereClauses, "cdm_etl_reference IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("cdm_etl_reference = '", cdm_etl_reference,"'"))
    }
  }

  if (!missing(source_release_date)) {
    if (is.null(source_release_date)) {
      whereClauses <- c(whereClauses, "source_release_date IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("source_release_date = '", source_release_date,"'"))
    }
  }

  if (!missing(cdm_release_date)) {
    if (is.null(cdm_release_date)) {
      whereClauses <- c(whereClauses, "cdm_release_date IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("cdm_release_date = '", cdm_release_date,"'"))
    }
  }

  if (!missing(cdm_version)) {
    if (is.null(cdm_version)) {
      whereClauses <- c(whereClauses, "cdm_version IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("cdm_version = '", cdm_version,"'"))
    }
  }

  if (!missing(vocabulary_version)) {
    if (is.null(vocabulary_version)) {
      whereClauses <- c(whereClauses, "vocabulary_version IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("vocabulary_version = '", vocabulary_version,"'"))
    }
  }

  statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  class(statement) <- "subQuery"
  return(statement)
}

lookup_cohort <- function(fetchField, cohort_definition_id, subject_id, cohort_start_date, cohort_end_date) {
  whereClauses = NULL;
  statement <- paste0("SELECT ", fetchField , " FROM @cdm_schema.cohort WHERE ")
  if (!missing(cohort_definition_id)) {
    if (is.null(cohort_definition_id)) {
      whereClauses <- c(whereClauses, "cohort_definition_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("cohort_definition_id = '", cohort_definition_id,"'"))
    }
  }

  if (!missing(subject_id)) {
    if (is.null(subject_id)) {
      whereClauses <- c(whereClauses, "subject_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("subject_id = '", subject_id,"'"))
    }
  }

  if (!missing(cohort_start_date)) {
    if (is.null(cohort_start_date)) {
      whereClauses <- c(whereClauses, "cohort_start_date IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("cohort_start_date = '", cohort_start_date,"'"))
    }
  }

  if (!missing(cohort_end_date)) {
    if (is.null(cohort_end_date)) {
      whereClauses <- c(whereClauses, "cohort_end_date IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("cohort_end_date = '", cohort_end_date,"'"))
    }
  }

  statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  class(statement) <- "subQuery"
  return(statement)
}

lookup_cohort_definition <- function(fetchField, cohort_definition_id, cohort_definition_name, cohort_definition_description, definition_type_concept_id, cohort_definition_syntax, subject_concept_id, cohort_instantiation_date) {
  whereClauses = NULL;
  statement <- paste0("SELECT ", fetchField , " FROM @cdm_schema.cohort_definition WHERE ")
  if (!missing(cohort_definition_id)) {
    if (is.null(cohort_definition_id)) {
      whereClauses <- c(whereClauses, "cohort_definition_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("cohort_definition_id = '", cohort_definition_id,"'"))
    }
  }

  if (!missing(cohort_definition_name)) {
    if (is.null(cohort_definition_name)) {
      whereClauses <- c(whereClauses, "cohort_definition_name IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("cohort_definition_name = '", cohort_definition_name,"'"))
    }
  }

  if (!missing(cohort_definition_description)) {
    if (is.null(cohort_definition_description)) {
      whereClauses <- c(whereClauses, "cohort_definition_description IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("cohort_definition_description = '", cohort_definition_description,"'"))
    }
  }

  if (!missing(definition_type_concept_id)) {
    if (is.null(definition_type_concept_id)) {
      whereClauses <- c(whereClauses, "definition_type_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("definition_type_concept_id = '", definition_type_concept_id,"'"))
    }
  }

  if (!missing(cohort_definition_syntax)) {
    if (is.null(cohort_definition_syntax)) {
      whereClauses <- c(whereClauses, "cohort_definition_syntax IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("cohort_definition_syntax = '", cohort_definition_syntax,"'"))
    }
  }

  if (!missing(subject_concept_id)) {
    if (is.null(subject_concept_id)) {
      whereClauses <- c(whereClauses, "subject_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("subject_concept_id = '", subject_concept_id,"'"))
    }
  }

  if (!missing(cohort_instantiation_date)) {
    if (is.null(cohort_instantiation_date)) {
      whereClauses <- c(whereClauses, "cohort_instantiation_date IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("cohort_instantiation_date = '", cohort_instantiation_date,"'"))
    }
  }

  statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  class(statement) <- "subQuery"
  return(statement)
}

lookup_cohort_attribute <- function(fetchField, cohort_definition_id, cohort_start_date, cohort_end_date, subject_id, attribute_definition_id, value_as_number, value_as_concept_id) {
  whereClauses = NULL;
  statement <- paste0("SELECT ", fetchField , " FROM @cdm_schema.cohort_attribute WHERE ")
  if (!missing(cohort_definition_id)) {
    if (is.null(cohort_definition_id)) {
      whereClauses <- c(whereClauses, "cohort_definition_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("cohort_definition_id = '", cohort_definition_id,"'"))
    }
  }

  if (!missing(cohort_start_date)) {
    if (is.null(cohort_start_date)) {
      whereClauses <- c(whereClauses, "cohort_start_date IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("cohort_start_date = '", cohort_start_date,"'"))
    }
  }

  if (!missing(cohort_end_date)) {
    if (is.null(cohort_end_date)) {
      whereClauses <- c(whereClauses, "cohort_end_date IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("cohort_end_date = '", cohort_end_date,"'"))
    }
  }

  if (!missing(subject_id)) {
    if (is.null(subject_id)) {
      whereClauses <- c(whereClauses, "subject_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("subject_id = '", subject_id,"'"))
    }
  }

  if (!missing(attribute_definition_id)) {
    if (is.null(attribute_definition_id)) {
      whereClauses <- c(whereClauses, "attribute_definition_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("attribute_definition_id = '", attribute_definition_id,"'"))
    }
  }

  if (!missing(value_as_number)) {
    if (is.null(value_as_number)) {
      whereClauses <- c(whereClauses, "value_as_number IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("value_as_number = '", value_as_number,"'"))
    }
  }

  if (!missing(value_as_concept_id)) {
    if (is.null(value_as_concept_id)) {
      whereClauses <- c(whereClauses, "value_as_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("value_as_concept_id = '", value_as_concept_id,"'"))
    }
  }

  statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  class(statement) <- "subQuery"
  return(statement)
}

lookup_attribute_definition <- function(fetchField, attribute_definition_id, attribute_name, attribute_description, attribute_type_concept_id, attribute_syntax) {
  whereClauses = NULL;
  statement <- paste0("SELECT ", fetchField , " FROM @cdm_schema.attribute_definition WHERE ")
  if (!missing(attribute_definition_id)) {
    if (is.null(attribute_definition_id)) {
      whereClauses <- c(whereClauses, "attribute_definition_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("attribute_definition_id = '", attribute_definition_id,"'"))
    }
  }

  if (!missing(attribute_name)) {
    if (is.null(attribute_name)) {
      whereClauses <- c(whereClauses, "attribute_name IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("attribute_name = '", attribute_name,"'"))
    }
  }

  if (!missing(attribute_description)) {
    if (is.null(attribute_description)) {
      whereClauses <- c(whereClauses, "attribute_description IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("attribute_description = '", attribute_description,"'"))
    }
  }

  if (!missing(attribute_type_concept_id)) {
    if (is.null(attribute_type_concept_id)) {
      whereClauses <- c(whereClauses, "attribute_type_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("attribute_type_concept_id = '", attribute_type_concept_id,"'"))
    }
  }

  if (!missing(attribute_syntax)) {
    if (is.null(attribute_syntax)) {
      whereClauses <- c(whereClauses, "attribute_syntax IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("attribute_syntax = '", attribute_syntax,"'"))
    }
  }

  statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  class(statement) <- "subQuery"
  return(statement)
}

lookup_cost <- function(fetchField, cost_id, cost_event_id, cost_domain_id, cost_type_concept_id, currency_concept_id, total_charge, total_cost, total_paid, paid_by_payer, paid_by_patient, paid_patient_copay, paid_patient_coinsurance, paid_patient_deductible, paid_by_primary, paid_ingredient_cost, paid_dispensing_fee, payer_plan_period_id, amount_allowed, revenue_code_concept_id, revenue_code_source_value) {
  whereClauses = NULL;
  statement <- paste0("SELECT ", fetchField , " FROM @cdm_schema.cost WHERE ")
  if (!missing(cost_id)) {
    if (is.null(cost_id)) {
      whereClauses <- c(whereClauses, "cost_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("cost_id = '", cost_id,"'"))
    }
  }

  if (!missing(cost_event_id)) {
    if (is.null(cost_event_id)) {
      whereClauses <- c(whereClauses, "cost_event_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("cost_event_id = '", cost_event_id,"'"))
    }
  }

  if (!missing(cost_domain_id)) {
    if (is.null(cost_domain_id)) {
      whereClauses <- c(whereClauses, "cost_domain_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("cost_domain_id = '", cost_domain_id,"'"))
    }
  }

  if (!missing(cost_type_concept_id)) {
    if (is.null(cost_type_concept_id)) {
      whereClauses <- c(whereClauses, "cost_type_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("cost_type_concept_id = '", cost_type_concept_id,"'"))
    }
  }

  if (!missing(currency_concept_id)) {
    if (is.null(currency_concept_id)) {
      whereClauses <- c(whereClauses, "currency_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("currency_concept_id = '", currency_concept_id,"'"))
    }
  }

  if (!missing(total_charge)) {
    if (is.null(total_charge)) {
      whereClauses <- c(whereClauses, "total_charge IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("total_charge = '", total_charge,"'"))
    }
  }

  if (!missing(total_cost)) {
    if (is.null(total_cost)) {
      whereClauses <- c(whereClauses, "total_cost IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("total_cost = '", total_cost,"'"))
    }
  }

  if (!missing(total_paid)) {
    if (is.null(total_paid)) {
      whereClauses <- c(whereClauses, "total_paid IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("total_paid = '", total_paid,"'"))
    }
  }

  if (!missing(paid_by_payer)) {
    if (is.null(paid_by_payer)) {
      whereClauses <- c(whereClauses, "paid_by_payer IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("paid_by_payer = '", paid_by_payer,"'"))
    }
  }

  if (!missing(paid_by_patient)) {
    if (is.null(paid_by_patient)) {
      whereClauses <- c(whereClauses, "paid_by_patient IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("paid_by_patient = '", paid_by_patient,"'"))
    }
  }

  if (!missing(paid_patient_copay)) {
    if (is.null(paid_patient_copay)) {
      whereClauses <- c(whereClauses, "paid_patient_copay IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("paid_patient_copay = '", paid_patient_copay,"'"))
    }
  }

  if (!missing(paid_patient_coinsurance)) {
    if (is.null(paid_patient_coinsurance)) {
      whereClauses <- c(whereClauses, "paid_patient_coinsurance IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("paid_patient_coinsurance = '", paid_patient_coinsurance,"'"))
    }
  }

  if (!missing(paid_patient_deductible)) {
    if (is.null(paid_patient_deductible)) {
      whereClauses <- c(whereClauses, "paid_patient_deductible IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("paid_patient_deductible = '", paid_patient_deductible,"'"))
    }
  }

  if (!missing(paid_by_primary)) {
    if (is.null(paid_by_primary)) {
      whereClauses <- c(whereClauses, "paid_by_primary IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("paid_by_primary = '", paid_by_primary,"'"))
    }
  }

  if (!missing(paid_ingredient_cost)) {
    if (is.null(paid_ingredient_cost)) {
      whereClauses <- c(whereClauses, "paid_ingredient_cost IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("paid_ingredient_cost = '", paid_ingredient_cost,"'"))
    }
  }

  if (!missing(paid_dispensing_fee)) {
    if (is.null(paid_dispensing_fee)) {
      whereClauses <- c(whereClauses, "paid_dispensing_fee IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("paid_dispensing_fee = '", paid_dispensing_fee,"'"))
    }
  }

  if (!missing(payer_plan_period_id)) {
    if (is.null(payer_plan_period_id)) {
      whereClauses <- c(whereClauses, "payer_plan_period_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("payer_plan_period_id = '", payer_plan_period_id,"'"))
    }
  }

  if (!missing(amount_allowed)) {
    if (is.null(amount_allowed)) {
      whereClauses <- c(whereClauses, "amount_allowed IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("amount_allowed = '", amount_allowed,"'"))
    }
  }

  if (!missing(revenue_code_concept_id)) {
    if (is.null(revenue_code_concept_id)) {
      whereClauses <- c(whereClauses, "revenue_code_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("revenue_code_concept_id = '", revenue_code_concept_id,"'"))
    }
  }

  if (!missing(revenue_code_source_value)) {
    if (is.null(revenue_code_source_value)) {
      whereClauses <- c(whereClauses, "revenue_code_source_value IS NULL")
    } else {
      whereClauses <- c(whereClauses, paste0("revenue_code_source_value = '", revenue_code_source_value,"'"))
    }
  }

  statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  class(statement) <- "subQuery"
  return(statement)
}

