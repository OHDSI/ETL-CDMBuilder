frameworkContext <- new.env(parent = emptyenv());
initFramework <- function() {
  frameworkContext$groupIndex <- 0;
  insertSql <- c()
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.provider;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.care_area;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.patient;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.encounter_provider;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.visit;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.encounter;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.diagnosis;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.nlp_sds;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.nlp_sds_family;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.[procedure];")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.labs;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.observations;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.nlp_measurements;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.microbiology;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.nlp_biomarker;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.medication_administrations;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.patient_reported_meds;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.prescriptions_written;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.nlp_drug_rationale;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.immunization;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.insurance;")
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
  defaults$specialty <- "Unspecified"
  defaults$prim_spec_ind <- "1"
  frameworkContext$defaultValues$provider = defaults;

  defaults <- new.env(parent = emptyenv())
  defaults$ptid <- "PT095853463"
  defaults$carearea <- "UNKNOWN CARE AREA"
  defaults$carearea_time <- "1900-01-01 00:00:00"
  frameworkContext$defaultValues$care_area = defaults;

  defaults <- new.env(parent = emptyenv())
  defaults$birth_yr <- "1930 and Earlier"
  defaults$gender <- "Male"
  defaults$race <- "Caucasian"
  defaults$ethnicity <- "Not Hispanic"
  defaults$region <- "South"
  defaults$division <- "South Atl/West South Crl"
  defaults$avg_hh_income <- "39005.0"
  defaults$pct_college_educ <- "26.0"
  defaults$deceased_indicator <- "0"
  defaults$idn_indicator <- "1"
  defaults$first_month_active <- "200601"
  defaults$last_month_active <- "201506"
  defaults$notes_eligible <- "1"
  defaults$has_notes <- "1"
  defaults$sourceid <- "S0034"
  defaults$source_data_through <- "201506"
  frameworkContext$defaultValues$patient = defaults;

  defaults <- new.env(parent = emptyenv())
  defaults$provid <- "70371"
  defaults$provider_role <- "ATTENDING"
  frameworkContext$defaultValues$encounter_provider = defaults;

  defaults <- new.env(parent = emptyenv())
  defaults$ptid <- "PT091048451"
  defaults$visit_type <- "Inpatient"
  defaults$visit_start_date <- "2012-08-13"
  defaults$visit_start_time <- "1900-01-01 00:00:00"
  defaults$visit_end_date <- "2014-07-25"
  defaults$visit_end_time <- "1900-01-01 00:00:00"
  defaults$discharge_disposition <- "01 DISCHARGED TO HOME OR SELF CARE"
  defaults$admission_source <- "Referred by physician or self referral; non-healthcare facility point of origin"
  frameworkContext$defaultValues$visit = defaults;

  defaults <- new.env(parent = emptyenv())
  defaults$interaction_type <- "Office or clinic patient"
  defaults$interaction_date <- "2014-06-16"
  defaults$interaction_time <- "1900-01-01 00:00:00"
  frameworkContext$defaultValues$encounter = defaults;

  defaults <- new.env(parent = emptyenv())
  defaults$diagnosis_status <- "Diagnosis of"
  defaults$diagnosis_cd_type <- "ICD9"
  defaults$diag_date <- "2014-05-02"
  defaults$diag_time <- "1900-01-01 00:00:00"
  defaults$primary_diagnosis <- "0"
  defaults$admitting_diagnosis <- "0"
  defaults$discharge_diagnosis <- "0"
  defaults$poa <- "0"
  defaults$problem_list <- "N"
  frameworkContext$defaultValues$diagnosis = defaults;

  defaults <- new.env(parent = emptyenv())
  defaults$note_date <- "2013-04-23"
  defaults$sds_term <- "pain"
  frameworkContext$defaultValues$nlp_sds = defaults;

  defaults <- new.env(parent = emptyenv())
  defaults$ptid <- "PT084524827"
  defaults$note_date <- "2014-07-23"
  defaults$sds_term <- "cancer"
  defaults$sds_family_member <- "who=family"
  defaults$note_section <- "family medical history"
  frameworkContext$defaultValues$nlp_sds_family = defaults;

  defaults <- new.env(parent = emptyenv())
  defaults$proc_code_type <- "CPT4"
  defaults$proc_date <- "2012-10-22"
  defaults$proc_time <- "1900-01-01 00:00:00"
  frameworkContext$defaultValues$procedure = defaults;

  defaults <- new.env(parent = emptyenv())
  defaults$ptid <- "PT143890838"
  defaults$test_name <- "O2 saturation.oximetry"
  defaults$result_time <- "1900-01-01 00:00:00"
  defaults$test_result <- "Negative"
  defaults$result_unit <- "%"
  defaults$evaluated_for_range <- "N"
  defaults$value_within_range <- "U"
  frameworkContext$defaultValues$labs = defaults;

  defaults <- new.env(parent = emptyenv())
  defaults$ptid <- "PT143890838"
  defaults$obs_type <- "SBP"
  defaults$obs_date <- "2014-06-10"
  defaults$obs_time <- "1900-01-01 00:00:00"
  defaults$obs_result <- "18"
  defaults$obs_unit <- "mm Hg"
  defaults$evaluated_for_range <- "N"
  defaults$value_within_range <- "U"
  frameworkContext$defaultValues$observations = defaults;

  defaults <- new.env(parent = emptyenv())
  defaults$ptid <- "PT130234983"
  defaults$note_date <- "2013-04-23"
  defaults$measurement_type <- "DBP"
  defaults$measurement_value <- "2"
  frameworkContext$defaultValues$nlp_measurements = defaults;

  defaults <- new.env(parent = emptyenv())
  defaults$ptid <- "PT117858758"
  defaults$order_time <- "1900-01-01 00:00:00"
  defaults$collect_time <- "1900-01-01 00:00:00"
  defaults$result_date <- "2015-05-22"
  defaults$result_time <- "1900-01-01 00:00:00"
  defaults$specimen_source <- "Urine"
  frameworkContext$defaultValues$microbiology = defaults;

  defaults <- new.env(parent = emptyenv())
  defaults$ptid <- "PT084542965"
  defaults$note_date <- "2013-04-23"
  defaults$biomarker <- "CD20"
  defaults$biomarker_status <- "positive"
  frameworkContext$defaultValues$nlp_biomarker = defaults;

  defaults <- new.env(parent = emptyenv())
  defaults$ptid <- "PT093154612"
  defaults$drug_name <- "SODIUM CHLORIDE 0.9 %"
  defaults$ndc <- "00338004904"
  defaults$ndc_source <- "Derived"
  defaults$order_date <- "2014-10-07"
  defaults$order_time <- "1900-01-01 00:00:00"
  defaults$route <- "Intravenous"
  defaults$generic_desc <- "SODIUM CHLORIDE"
  defaults$drug_class <- "Intravenous nutritional therapy; electrolyte; trace element; metal; vitamin; alone or combinations"
  frameworkContext$defaultValues$medication_administrations = defaults;

  defaults <- new.env(parent = emptyenv())
  defaults$ptid <- "PT155237089"
  defaults$reported_date <- "2009-03-27"
  defaults$ndc <- "49999035930"
  defaults$route <- "Oral"
  defaults$strength_unit <- "mg"
  defaults$dosage_form <- "Tabs"
  defaults$drug_class <- "Salicylates"
  defaults$ndc_source <- "Direct"
  frameworkContext$defaultValues$patient_reported_meds = defaults;

  defaults <- new.env(parent = emptyenv())
  defaults$ptid <- "PT118881881"
  defaults$rxdate <- "2014-02-24"
  defaults$rxtime <- "1900-01-01 00:00:00"
  defaults$ndc <- "00406035705"
  defaults$quantity_per_fill <- "30"
  defaults$num_refills <- "0.0"
  defaults$route <- "Oral"
  defaults$strength_unit <- "mg"
  defaults$ndc_source <- "Direct"
  defaults$drug_class <- "HMG & CoA reductase inhibitors (statins)"
  defaults$dosage_form <- "Tabs"
  frameworkContext$defaultValues$prescriptions_written = defaults;

  defaults <- new.env(parent = emptyenv())
  defaults$ptid <- "PT191017751"
  defaults$note_date <- "2013-04-23"
  defaults$note_section <- "MEDICATIONS"
  defaults$drug_name <- "ASPIRIN"
  defaults$drug_action <- "N/A"
  defaults$drug_action_preposition <- "OF"
  frameworkContext$defaultValues$nlp_drug_rationale = defaults;

  defaults <- new.env(parent = emptyenv())
  defaults$ptid <- "PT194773862"
  defaults$ndc <- "49281001350"
  defaults$ndc_source <- "Derived"
  defaults$immunization_desc <- "INFLUENZA VIRUS VACCINE; INACTIVATED"
  defaults$mapped_name <- "Influenza Inactivated Vaccine"
  frameworkContext$defaultValues$immunization = defaults;

  defaults <- new.env(parent = emptyenv())
  defaults$ptid <- "PT130555350"
  defaults$insurance_date <- "2008-09-15"
  defaults$insurance_time <- "1900-01-01 00:00:00"
  defaults$ins_type <- "Medicare"
  frameworkContext$defaultValues$insurance = defaults;
}

declareTestGroup <- function(groupName) {
  frameworkContext$groupIndex <- frameworkContext$groupIndex + 1 ;
  frameworkContext$currentGroup <- {}

  frameworkContext$currentGroup$groupName <- groupName;
  frameworkContext$currentGroup$groupItemIndex <- -1;
  sql <- c("",paste0("/* ", frameworkContext$groupIndex, ". ", groupName, " */"));
  frameworkContext$insertSql = c(frameworkContext$insertSql, sql);
  frameworkContext$testSql = c(frameworkContext$testSql, sql);
}

declareTest <- function(description, source_pid = NULL, cdm_pid = NULL) {
  frameworkContext$testId = frameworkContext$testId + 1;
  frameworkContext$testDescription = description;
  frameworkContext$patient$source_pid = source_pid;
  frameworkContext$patient$cdm_pid = cdm_pid;
  if (is.null(frameworkContext$currentGroup)) {
    sql <- c(paste0("/* Test ", frameworkContext$testId, ": ", frameworkContext$testDescription, " */"));
  } else {
    frameworkContext$currentGroup$groupItemIndex = frameworkContext$currentGroup$groupItemIndex + 1;
    sql <- c(paste0("/* ", frameworkContext$groupIndex, ".", frameworkContext$currentGroup$groupItemIndex, " ", frameworkContext$testDescription, " [Test ID: ", frameworkContext$testId, "] */"));
  }
  frameworkContext$insertSql = c(frameworkContext$insertSql, "--",sql,"");
  frameworkContext$testSql = c(frameworkContext$testSql, "--",sql,"");
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

set_defaults_patient <- function(ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, date_of_death, provid_pcp, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) {
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

set_defaults_encounter <- function(encid, ptid, visitid, interaction_type, interaction_date, interaction_time) {
  defaults <- frameworkContext$defaultValues$encounter;
  if (!missing(encid)) {
    defaults$encid <- encid
  }
  if (!missing(ptid)) {
    defaults$ptid <- ptid
  }
  if (!missing(visitid)) {
    defaults$visitid <- visitid
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

set_defaults_diagnosis <- function(ptid, diagnosis_status, diagnosis_cd, diagnosis_cd_type, diag_date, diag_time, encid, primary_diagnosis, admitting_diagnosis, discharge_diagnosis, poa, problem_list) {
  defaults <- frameworkContext$defaultValues$diagnosis;
  if (!missing(ptid)) {
    defaults$ptid <- ptid
  }
  if (!missing(diagnosis_status)) {
    defaults$diagnosis_status <- diagnosis_status
  }
  if (!missing(diagnosis_cd)) {
    defaults$diagnosis_cd <- diagnosis_cd
  }
  if (!missing(diagnosis_cd_type)) {
    defaults$diagnosis_cd_type <- diagnosis_cd_type
  }
  if (!missing(diag_date)) {
    defaults$diag_date <- diag_date
  }
  if (!missing(diag_time)) {
    defaults$diag_time <- diag_time
  }
  if (!missing(encid)) {
    defaults$encid <- encid
  }
  if (!missing(primary_diagnosis)) {
    defaults$primary_diagnosis <- primary_diagnosis
  }
  if (!missing(admitting_diagnosis)) {
    defaults$admitting_diagnosis <- admitting_diagnosis
  }
  if (!missing(discharge_diagnosis)) {
    defaults$discharge_diagnosis <- discharge_diagnosis
  }
  if (!missing(poa)) {
    defaults$poa <- poa
  }
  if (!missing(problem_list)) {
    defaults$problem_list <- problem_list
  }
  invisible(defaults)
}

set_defaults_nlp_sds <- function(ptid, encid, note_date, sds_term, sds_location, sds_attribute, sds_sentiment, note_section) {
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
  if (!missing(note_section)) {
    defaults$note_section <- note_section
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

set_defaults_procedure <- function(ptid, proc_code, proc_code_type, proc_date, proc_time, provid_perform, encid, proc_desc, provid_order, betos_code, betos_desc) {
  defaults <- frameworkContext$defaultValues$procedure;
  if (!missing(ptid)) {
    defaults$ptid <- ptid
  }
  if (!missing(proc_code)) {
    defaults$proc_code <- proc_code
  }
  if (!missing(proc_code_type)) {
    defaults$proc_code_type <- proc_code_type
  }
  if (!missing(proc_date)) {
    defaults$proc_date <- proc_date
  }
  if (!missing(proc_time)) {
    defaults$proc_time <- proc_time
  }
  if (!missing(provid_perform)) {
    defaults$provid_perform <- provid_perform
  }
  if (!missing(encid)) {
    defaults$encid <- encid
  }
  if (!missing(proc_desc)) {
    defaults$proc_desc <- proc_desc
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

set_defaults_observations <- function(ptid, encid, obs_type, obs_date, obs_time, obs_result, obs_unit, evaluated_for_range, value_within_range) {
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
  if (!missing(obs_date)) {
    defaults$obs_date <- obs_date
  }
  if (!missing(obs_time)) {
    defaults$obs_time <- obs_time
  }
  if (!missing(obs_result)) {
    defaults$obs_result <- obs_result
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
  invisible(defaults)
}

set_defaults_nlp_measurements <- function(ptid, encid, note_date, measurement_type, measurement_value, measurement_detail, note_section, measurement_date) {
  defaults <- frameworkContext$defaultValues$nlp_measurements;
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
  if (!missing(measurement_date)) {
    defaults$measurement_date <- measurement_date
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

set_defaults_nlp_biomarker <- function(ptid, note_date, biomarker, variation_detail, biomarker_status) {
  defaults <- frameworkContext$defaultValues$nlp_biomarker;
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

set_defaults_medication_administrations <- function(ptid, encid, drug_name, ndc, ndc_source, order_date, order_time, admin_date, admin_time, provid, quantity_of_dose, route, strength, strength_unit, dosage_form, dosefreq, generic_desc, drug_class) {
  defaults <- frameworkContext$defaultValues$medication_administrations;
  if (!missing(ptid)) {
    defaults$ptid <- ptid
  }
  if (!missing(encid)) {
    defaults$encid <- encid
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
  if (!missing(quantity_of_dose)) {
    defaults$quantity_of_dose <- quantity_of_dose
  }
  if (!missing(route)) {
    defaults$route <- route
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
  if (!missing(dosefreq)) {
    defaults$dosefreq <- dosefreq
  }
  if (!missing(generic_desc)) {
    defaults$generic_desc <- generic_desc
  }
  if (!missing(drug_class)) {
    defaults$drug_class <- drug_class
  }
  invisible(defaults)
}

set_defaults_patient_reported_meds <- function(ptid, reported_date, ndc, provid, route, quantity_of_dose, strength, strength_unit, dosage_form, dosefreq, generic_desc, drug_class, drug_name, ndc_source) {
  defaults <- frameworkContext$defaultValues$patient_reported_meds;
  if (!missing(ptid)) {
    defaults$ptid <- ptid
  }
  if (!missing(reported_date)) {
    defaults$reported_date <- reported_date
  }
  if (!missing(ndc)) {
    defaults$ndc <- ndc
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
  if (!missing(dosefreq)) {
    defaults$dosefreq <- dosefreq
  }
  if (!missing(generic_desc)) {
    defaults$generic_desc <- generic_desc
  }
  if (!missing(drug_class)) {
    defaults$drug_class <- drug_class
  }
  if (!missing(drug_name)) {
    defaults$drug_name <- drug_name
  }
  if (!missing(ndc_source)) {
    defaults$ndc_source <- ndc_source
  }
  invisible(defaults)
}

set_defaults_prescriptions_written <- function(ptid, rxdate, rxtime, ndc, quantity_per_fill, num_refills, days_supply, provid, route, quantity_of_dose, strength, strength_unit, generic_desc, ndc_source, drug_class, drug_name, dosefreq, dosage_form) {
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
  if (!missing(ndc)) {
    defaults$ndc <- ndc
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
  if (!missing(generic_desc)) {
    defaults$generic_desc <- generic_desc
  }
  if (!missing(ndc_source)) {
    defaults$ndc_source <- ndc_source
  }
  if (!missing(drug_class)) {
    defaults$drug_class <- drug_class
  }
  if (!missing(drug_name)) {
    defaults$drug_name <- drug_name
  }
  if (!missing(dosefreq)) {
    defaults$dosefreq <- dosefreq
  }
  if (!missing(dosage_form)) {
    defaults$dosage_form <- dosage_form
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

set_defaults_immunization <- function(ptid, immunization_date, ndc, pt_reported, ndc_source, immunization_desc, mapped_name) {
  defaults <- frameworkContext$defaultValues$immunization;
  if (!missing(ptid)) {
    defaults$ptid <- ptid
  }
  if (!missing(immunization_date)) {
    defaults$immunization_date <- immunization_date
  }
  if (!missing(ndc)) {
    defaults$ndc <- ndc
  }
  if (!missing(pt_reported)) {
    defaults$pt_reported <- pt_reported
  }
  if (!missing(ndc_source)) {
    defaults$ndc_source <- ndc_source
  }
  if (!missing(immunization_desc)) {
    defaults$immunization_desc <- immunization_desc
  }
  if (!missing(mapped_name)) {
    defaults$mapped_name <- mapped_name
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

get_defaults_provider <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_care_area <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_patient <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_encounter_provider <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_visit <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_encounter <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_diagnosis <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_nlp_sds <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_nlp_sds_family <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_procedure <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_labs <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_observations <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_nlp_measurements <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_microbiology <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_nlp_biomarker <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_medication_administrations <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_patient_reported_meds <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_prescriptions_written <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_nlp_drug_rationale <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_immunization <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_insurance <- function() {
  return(frameworkContext$defaultValues)
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

add_patient <- function(ptid, birth_yr, gender, race, ethnicity, region, division, avg_hh_income, pct_college_educ, deceased_indicator, date_of_death, provid_pcp, idn_indicator, first_month_active, last_month_active, notes_eligible, has_notes, sourceid, source_data_through) {
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

  statement <- paste0("INSERT INTO @source_schema.patient (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
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

add_encounter <- function(encid, ptid, visitid, interaction_type, interaction_date, interaction_time) {
  defaults <- frameworkContext$defaultValues$encounter;
  insertFields <- c()
  insertValues <- c()
  if (missing(encid)) {
    encid <- defaults$encid
  }
  if (!is.null(encid)) {
    insertFields <- c(insertFields, "encid")
    insertValues <- c(insertValues, encid)
  }

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

add_diagnosis <- function(ptid, diagnosis_status, diagnosis_cd, diagnosis_cd_type, diag_date, diag_time, encid, primary_diagnosis, admitting_diagnosis, discharge_diagnosis, poa, problem_list) {
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

  if (missing(diagnosis_status)) {
    diagnosis_status <- defaults$diagnosis_status
  }
  if (!is.null(diagnosis_status)) {
    insertFields <- c(insertFields, "diagnosis_status")
    insertValues <- c(insertValues, diagnosis_status)
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

  if (missing(encid)) {
    encid <- defaults$encid
  }
  if (!is.null(encid)) {
    insertFields <- c(insertFields, "encid")
    insertValues <- c(insertValues, encid)
  }

  if (missing(primary_diagnosis)) {
    primary_diagnosis <- defaults$primary_diagnosis
  }
  if (!is.null(primary_diagnosis)) {
    insertFields <- c(insertFields, "primary_diagnosis")
    insertValues <- c(insertValues, primary_diagnosis)
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

  if (missing(poa)) {
    poa <- defaults$poa
  }
  if (!is.null(poa)) {
    insertFields <- c(insertFields, "poa")
    insertValues <- c(insertValues, poa)
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

add_nlp_sds <- function(ptid, encid, note_date, sds_term, sds_location, sds_attribute, sds_sentiment, note_section) {
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

  if (missing(note_section)) {
    note_section <- defaults$note_section
  }
  if (!is.null(note_section)) {
    insertFields <- c(insertFields, "note_section")
    insertValues <- c(insertValues, note_section)
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

add_procedure <- function(ptid, proc_code, proc_code_type, proc_date, proc_time, provid_perform, encid, proc_desc, provid_order, betos_code, betos_desc) {
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

  if (missing(proc_code)) {
    proc_code <- defaults$proc_code
  }
  if (!is.null(proc_code)) {
    insertFields <- c(insertFields, "proc_code")
    insertValues <- c(insertValues, proc_code)
  }

  if (missing(proc_code_type)) {
    proc_code_type <- defaults$proc_code_type
  }
  if (!is.null(proc_code_type)) {
    insertFields <- c(insertFields, "proc_code_type")
    insertValues <- c(insertValues, proc_code_type)
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

  if (missing(provid_perform)) {
    provid_perform <- defaults$provid_perform
  }
  if (!is.null(provid_perform)) {
    insertFields <- c(insertFields, "provid_perform")
    insertValues <- c(insertValues, provid_perform)
  }

  if (missing(encid)) {
    encid <- defaults$encid
  }
  if (!is.null(encid)) {
    insertFields <- c(insertFields, "encid")
    insertValues <- c(insertValues, encid)
  }

  if (missing(proc_desc)) {
    proc_desc <- defaults$proc_desc
  }
  if (!is.null(proc_desc)) {
    insertFields <- c(insertFields, "proc_desc")
    insertValues <- c(insertValues, proc_desc)
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

add_observations <- function(ptid, encid, obs_type, obs_date, obs_time, obs_result, obs_unit, evaluated_for_range, value_within_range) {
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

  if (missing(obs_result)) {
    obs_result <- defaults$obs_result
  }
  if (!is.null(obs_result)) {
    insertFields <- c(insertFields, "obs_result")
    insertValues <- c(insertValues, obs_result)
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

  statement <- paste0("INSERT INTO @source_schema.observations (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
  invisible(statement);
}

add_nlp_measurements <- function(ptid, encid, note_date, measurement_type, measurement_value, measurement_detail, note_section, measurement_date) {
  defaults <- frameworkContext$defaultValues$nlp_measurements;
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

  if (missing(measurement_date)) {
    measurement_date <- defaults$measurement_date
  }
  if (!is.null(measurement_date)) {
    insertFields <- c(insertFields, "measurement_date")
    insertValues <- c(insertValues, measurement_date)
  }

  statement <- paste0("INSERT INTO @source_schema.nlp_measurements (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
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

add_nlp_biomarker <- function(ptid, note_date, biomarker, variation_detail, biomarker_status) {
  defaults <- frameworkContext$defaultValues$nlp_biomarker;
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

  statement <- paste0("INSERT INTO @source_schema.nlp_biomarker (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
  invisible(statement);
}

add_medication_administrations <- function(ptid, encid, drug_name, ndc, ndc_source, order_date, order_time, admin_date, admin_time, provid, quantity_of_dose, route, strength, strength_unit, dosage_form, dosefreq, generic_desc, drug_class) {
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

  if (missing(quantity_of_dose)) {
    quantity_of_dose <- defaults$quantity_of_dose
  }
  if (!is.null(quantity_of_dose)) {
    insertFields <- c(insertFields, "quantity_of_dose")
    insertValues <- c(insertValues, quantity_of_dose)
  }

  if (missing(route)) {
    route <- defaults$route
  }
  if (!is.null(route)) {
    insertFields <- c(insertFields, "route")
    insertValues <- c(insertValues, route)
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

  if (missing(dosefreq)) {
    dosefreq <- defaults$dosefreq
  }
  if (!is.null(dosefreq)) {
    insertFields <- c(insertFields, "dosefreq")
    insertValues <- c(insertValues, dosefreq)
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

add_patient_reported_meds <- function(ptid, reported_date, ndc, provid, route, quantity_of_dose, strength, strength_unit, dosage_form, dosefreq, generic_desc, drug_class, drug_name, ndc_source) {
  defaults <- frameworkContext$defaultValues$patient_reported_meds;
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

  if (missing(ndc)) {
    ndc <- defaults$ndc
  }
  if (!is.null(ndc)) {
    insertFields <- c(insertFields, "ndc")
    insertValues <- c(insertValues, ndc)
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

  if (missing(dosefreq)) {
    dosefreq <- defaults$dosefreq
  }
  if (!is.null(dosefreq)) {
    insertFields <- c(insertFields, "dosefreq")
    insertValues <- c(insertValues, dosefreq)
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

  if (missing(drug_name)) {
    drug_name <- defaults$drug_name
  }
  if (!is.null(drug_name)) {
    insertFields <- c(insertFields, "drug_name")
    insertValues <- c(insertValues, drug_name)
  }

  if (missing(ndc_source)) {
    ndc_source <- defaults$ndc_source
  }
  if (!is.null(ndc_source)) {
    insertFields <- c(insertFields, "ndc_source")
    insertValues <- c(insertValues, ndc_source)
  }

  statement <- paste0("INSERT INTO @source_schema.patient_reported_meds (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
  invisible(statement);
}

add_prescriptions_written <- function(ptid, rxdate, rxtime, ndc, quantity_per_fill, num_refills, days_supply, provid, route, quantity_of_dose, strength, strength_unit, generic_desc, ndc_source, drug_class, drug_name, dosefreq, dosage_form) {
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

  if (missing(ndc)) {
    ndc <- defaults$ndc
  }
  if (!is.null(ndc)) {
    insertFields <- c(insertFields, "ndc")
    insertValues <- c(insertValues, ndc)
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

  if (missing(generic_desc)) {
    generic_desc <- defaults$generic_desc
  }
  if (!is.null(generic_desc)) {
    insertFields <- c(insertFields, "generic_desc")
    insertValues <- c(insertValues, generic_desc)
  }

  if (missing(ndc_source)) {
    ndc_source <- defaults$ndc_source
  }
  if (!is.null(ndc_source)) {
    insertFields <- c(insertFields, "ndc_source")
    insertValues <- c(insertValues, ndc_source)
  }

  if (missing(drug_class)) {
    drug_class <- defaults$drug_class
  }
  if (!is.null(drug_class)) {
    insertFields <- c(insertFields, "drug_class")
    insertValues <- c(insertValues, drug_class)
  }

  if (missing(drug_name)) {
    drug_name <- defaults$drug_name
  }
  if (!is.null(drug_name)) {
    insertFields <- c(insertFields, "drug_name")
    insertValues <- c(insertValues, drug_name)
  }

  if (missing(dosefreq)) {
    dosefreq <- defaults$dosefreq
  }
  if (!is.null(dosefreq)) {
    insertFields <- c(insertFields, "dosefreq")
    insertValues <- c(insertValues, dosefreq)
  }

  if (missing(dosage_form)) {
    dosage_form <- defaults$dosage_form
  }
  if (!is.null(dosage_form)) {
    insertFields <- c(insertFields, "dosage_form")
    insertValues <- c(insertValues, dosage_form)
  }

  statement <- paste0("INSERT INTO @source_schema.prescriptions_written (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
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

add_immunization <- function(ptid, immunization_date, ndc, pt_reported, ndc_source, immunization_desc, mapped_name) {
  defaults <- frameworkContext$defaultValues$immunization;
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

  if (missing(ndc)) {
    ndc <- defaults$ndc
  }
  if (!is.null(ndc)) {
    insertFields <- c(insertFields, "ndc")
    insertValues <- c(insertValues, ndc)
  }

  if (missing(pt_reported)) {
    pt_reported <- defaults$pt_reported
  }
  if (!is.null(pt_reported)) {
    insertFields <- c(insertFields, "pt_reported")
    insertValues <- c(insertValues, pt_reported)
  }

  if (missing(ndc_source)) {
    ndc_source <- defaults$ndc_source
  }
  if (!is.null(ndc_source)) {
    insertFields <- c(insertFields, "ndc_source")
    insertValues <- c(insertValues, ndc_source)
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

  statement <- paste0("INSERT INTO @source_schema.immunization (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
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
      whereClasues <- c(whereClasues, paste0("provider_id = (", as.character(provider_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("provider_id = '", provider_id,"'"))
    }
  }

  if (!missing(provider_name)) {
    if (is.null(provider_name)) {
      whereClauses <- c(whereClauses, "provider_name IS NULL")
    } else if (is(provider_name, "subQuery")){
      whereClasues <- c(whereClasues, paste0("provider_name = (", as.character(provider_name), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("provider_name = '", provider_name,"'"))
    }
  }

  if (!missing(npi)) {
    if (is.null(npi)) {
      whereClauses <- c(whereClauses, "npi IS NULL")
    } else if (is(npi, "subQuery")){
      whereClasues <- c(whereClasues, paste0("npi = (", as.character(npi), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("npi = '", npi,"'"))
    }
  }

  if (!missing(dea)) {
    if (is.null(dea)) {
      whereClauses <- c(whereClauses, "dea IS NULL")
    } else if (is(dea, "subQuery")){
      whereClasues <- c(whereClasues, paste0("dea = (", as.character(dea), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("dea = '", dea,"'"))
    }
  }

  if (!missing(specialty_concept_id)) {
    if (is.null(specialty_concept_id)) {
      whereClauses <- c(whereClauses, "specialty_concept_id IS NULL")
    } else if (is(specialty_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("specialty_concept_id = (", as.character(specialty_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("specialty_concept_id = '", specialty_concept_id,"'"))
    }
  }

  if (!missing(care_site_id)) {
    if (is.null(care_site_id)) {
      whereClauses <- c(whereClauses, "care_site_id IS NULL")
    } else if (is(care_site_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("care_site_id = (", as.character(care_site_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("care_site_id = '", care_site_id,"'"))
    }
  }

  if (!missing(year_of_birth)) {
    if (is.null(year_of_birth)) {
      whereClauses <- c(whereClauses, "year_of_birth IS NULL")
    } else if (is(year_of_birth, "subQuery")){
      whereClasues <- c(whereClasues, paste0("year_of_birth = (", as.character(year_of_birth), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("year_of_birth = '", year_of_birth,"'"))
    }
  }

  if (!missing(gender_concept_id)) {
    if (is.null(gender_concept_id)) {
      whereClauses <- c(whereClauses, "gender_concept_id IS NULL")
    } else if (is(gender_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("gender_concept_id = (", as.character(gender_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("gender_concept_id = '", gender_concept_id,"'"))
    }
  }

  if (!missing(provider_source_value)) {
    if (is.null(provider_source_value)) {
      whereClauses <- c(whereClauses, "provider_source_value IS NULL")
    } else if (is(provider_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("provider_source_value = (", as.character(provider_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("provider_source_value = '", provider_source_value,"'"))
    }
  }

  if (!missing(specialty_source_value)) {
    if (is.null(specialty_source_value)) {
      whereClauses <- c(whereClauses, "specialty_source_value IS NULL")
    } else if (is(specialty_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("specialty_source_value = (", as.character(specialty_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("specialty_source_value = '", specialty_source_value,"'"))
    }
  }

  if (!missing(specialty_source_concept_id)) {
    if (is.null(specialty_source_concept_id)) {
      whereClauses <- c(whereClauses, "specialty_source_concept_id IS NULL")
    } else if (is(specialty_source_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("specialty_source_concept_id = (", as.character(specialty_source_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("specialty_source_concept_id = '", specialty_source_concept_id,"'"))
    }
  }

  if (!missing(gender_source_value)) {
    if (is.null(gender_source_value)) {
      whereClauses <- c(whereClauses, "gender_source_value IS NULL")
    } else if (is(gender_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("gender_source_value = (", as.character(gender_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("gender_source_value = '", gender_source_value,"'"))
    }
  }

  if (!missing(gender_source_concept_id)) {
    if (is.null(gender_source_concept_id)) {
      whereClauses <- c(whereClauses, "gender_source_concept_id IS NULL")
    } else if (is(gender_source_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("gender_source_concept_id = (", as.character(gender_source_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("gender_source_concept_id = '", gender_source_concept_id,"'"))
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
      whereClasues <- c(whereClasues, paste0("care_site_id = (", as.character(care_site_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("care_site_id = '", care_site_id,"'"))
    }
  }

  if (!missing(care_site_name)) {
    if (is.null(care_site_name)) {
      whereClauses <- c(whereClauses, "care_site_name IS NULL")
    } else if (is(care_site_name, "subQuery")){
      whereClasues <- c(whereClasues, paste0("care_site_name = (", as.character(care_site_name), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("care_site_name = '", care_site_name,"'"))
    }
  }

  if (!missing(place_of_service_concept_id)) {
    if (is.null(place_of_service_concept_id)) {
      whereClauses <- c(whereClauses, "place_of_service_concept_id IS NULL")
    } else if (is(place_of_service_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("place_of_service_concept_id = (", as.character(place_of_service_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("place_of_service_concept_id = '", place_of_service_concept_id,"'"))
    }
  }

  if (!missing(location_id)) {
    if (is.null(location_id)) {
      whereClauses <- c(whereClauses, "location_id IS NULL")
    } else if (is(location_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("location_id = (", as.character(location_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("location_id = '", location_id,"'"))
    }
  }

  if (!missing(care_site_source_value)) {
    if (is.null(care_site_source_value)) {
      whereClauses <- c(whereClauses, "care_site_source_value IS NULL")
    } else if (is(care_site_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("care_site_source_value = (", as.character(care_site_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("care_site_source_value = '", care_site_source_value,"'"))
    }
  }

  if (!missing(place_of_service_source_value)) {
    if (is.null(place_of_service_source_value)) {
      whereClauses <- c(whereClauses, "place_of_service_source_value IS NULL")
    } else if (is(place_of_service_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("place_of_service_source_value = (", as.character(place_of_service_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("place_of_service_source_value = '", place_of_service_source_value,"'"))
    }
  }

  statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
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
      whereClasues <- c(whereClasues, paste0("location_id = (", as.character(location_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("location_id = '", location_id,"'"))
    }
  }

  if (!missing(address_1)) {
    if (is.null(address_1)) {
      whereClauses <- c(whereClauses, "address_1 IS NULL")
    } else if (is(address_1, "subQuery")){
      whereClasues <- c(whereClasues, paste0("address_1 = (", as.character(address_1), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("address_1 = '", address_1,"'"))
    }
  }

  if (!missing(address_2)) {
    if (is.null(address_2)) {
      whereClauses <- c(whereClauses, "address_2 IS NULL")
    } else if (is(address_2, "subQuery")){
      whereClasues <- c(whereClasues, paste0("address_2 = (", as.character(address_2), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("address_2 = '", address_2,"'"))
    }
  }

  if (!missing(city)) {
    if (is.null(city)) {
      whereClauses <- c(whereClauses, "city IS NULL")
    } else if (is(city, "subQuery")){
      whereClasues <- c(whereClasues, paste0("city = (", as.character(city), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("city = '", city,"'"))
    }
  }

  if (!missing(state)) {
    if (is.null(state)) {
      whereClauses <- c(whereClauses, "state IS NULL")
    } else if (is(state, "subQuery")){
      whereClasues <- c(whereClasues, paste0("state = (", as.character(state), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("state = '", state,"'"))
    }
  }

  if (!missing(zip)) {
    if (is.null(zip)) {
      whereClauses <- c(whereClauses, "zip IS NULL")
    } else if (is(zip, "subQuery")){
      whereClasues <- c(whereClasues, paste0("zip = (", as.character(zip), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("zip = '", zip,"'"))
    }
  }

  if (!missing(county)) {
    if (is.null(county)) {
      whereClauses <- c(whereClauses, "county IS NULL")
    } else if (is(county, "subQuery")){
      whereClasues <- c(whereClasues, paste0("county = (", as.character(county), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("county = '", county,"'"))
    }
  }

  if (!missing(location_source_value)) {
    if (is.null(location_source_value)) {
      whereClauses <- c(whereClauses, "location_source_value IS NULL")
    } else if (is(location_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("location_source_value = (", as.character(location_source_value), ")"))
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
      whereClasues <- c(whereClasues, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(gender_concept_id)) {
    if (is.null(gender_concept_id)) {
      whereClauses <- c(whereClauses, "gender_concept_id IS NULL")
    } else if (is(gender_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("gender_concept_id = (", as.character(gender_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("gender_concept_id = '", gender_concept_id,"'"))
    }
  }

  if (!missing(year_of_birth)) {
    if (is.null(year_of_birth)) {
      whereClauses <- c(whereClauses, "year_of_birth IS NULL")
    } else if (is(year_of_birth, "subQuery")){
      whereClasues <- c(whereClasues, paste0("year_of_birth = (", as.character(year_of_birth), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("year_of_birth = '", year_of_birth,"'"))
    }
  }

  if (!missing(month_of_birth)) {
    if (is.null(month_of_birth)) {
      whereClauses <- c(whereClauses, "month_of_birth IS NULL")
    } else if (is(month_of_birth, "subQuery")){
      whereClasues <- c(whereClasues, paste0("month_of_birth = (", as.character(month_of_birth), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("month_of_birth = '", month_of_birth,"'"))
    }
  }

  if (!missing(day_of_birth)) {
    if (is.null(day_of_birth)) {
      whereClauses <- c(whereClauses, "day_of_birth IS NULL")
    } else if (is(day_of_birth, "subQuery")){
      whereClasues <- c(whereClasues, paste0("day_of_birth = (", as.character(day_of_birth), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("day_of_birth = '", day_of_birth,"'"))
    }
  }

  if (!missing(time_of_birth)) {
    if (is.null(time_of_birth)) {
      whereClauses <- c(whereClauses, "time_of_birth IS NULL")
    } else if (is(time_of_birth, "subQuery")){
      whereClasues <- c(whereClasues, paste0("time_of_birth = (", as.character(time_of_birth), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("time_of_birth = '", time_of_birth,"'"))
    }
  }

  if (!missing(race_concept_id)) {
    if (is.null(race_concept_id)) {
      whereClauses <- c(whereClauses, "race_concept_id IS NULL")
    } else if (is(race_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("race_concept_id = (", as.character(race_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("race_concept_id = '", race_concept_id,"'"))
    }
  }

  if (!missing(ethnicity_concept_id)) {
    if (is.null(ethnicity_concept_id)) {
      whereClauses <- c(whereClauses, "ethnicity_concept_id IS NULL")
    } else if (is(ethnicity_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("ethnicity_concept_id = (", as.character(ethnicity_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("ethnicity_concept_id = '", ethnicity_concept_id,"'"))
    }
  }

  if (!missing(location_id)) {
    if (is.null(location_id)) {
      whereClauses <- c(whereClauses, "location_id IS NULL")
    } else if (is(location_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("location_id = (", as.character(location_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("location_id = '", location_id,"'"))
    }
  }

  if (!missing(provider_id)) {
    if (is.null(provider_id)) {
      whereClauses <- c(whereClauses, "provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("provider_id = (", as.character(provider_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("provider_id = '", provider_id,"'"))
    }
  }

  if (!missing(care_site_id)) {
    if (is.null(care_site_id)) {
      whereClauses <- c(whereClauses, "care_site_id IS NULL")
    } else if (is(care_site_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("care_site_id = (", as.character(care_site_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("care_site_id = '", care_site_id,"'"))
    }
  }

  if (!missing(person_source_value)) {
    if (is.null(person_source_value)) {
      whereClauses <- c(whereClauses, "person_source_value IS NULL")
    } else if (is(person_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("person_source_value = (", as.character(person_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_source_value = '", person_source_value,"'"))
    }
  }

  if (!missing(gender_source_value)) {
    if (is.null(gender_source_value)) {
      whereClauses <- c(whereClauses, "gender_source_value IS NULL")
    } else if (is(gender_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("gender_source_value = (", as.character(gender_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("gender_source_value = '", gender_source_value,"'"))
    }
  }

  if (!missing(gender_source_concept_id)) {
    if (is.null(gender_source_concept_id)) {
      whereClauses <- c(whereClauses, "gender_source_concept_id IS NULL")
    } else if (is(gender_source_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("gender_source_concept_id = (", as.character(gender_source_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("gender_source_concept_id = '", gender_source_concept_id,"'"))
    }
  }

  if (!missing(race_source_value)) {
    if (is.null(race_source_value)) {
      whereClauses <- c(whereClauses, "race_source_value IS NULL")
    } else if (is(race_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("race_source_value = (", as.character(race_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("race_source_value = '", race_source_value,"'"))
    }
  }

  if (!missing(race_source_concept_id)) {
    if (is.null(race_source_concept_id)) {
      whereClauses <- c(whereClauses, "race_source_concept_id IS NULL")
    } else if (is(race_source_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("race_source_concept_id = (", as.character(race_source_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("race_source_concept_id = '", race_source_concept_id,"'"))
    }
  }

  if (!missing(ethnicity_source_value)) {
    if (is.null(ethnicity_source_value)) {
      whereClauses <- c(whereClauses, "ethnicity_source_value IS NULL")
    } else if (is(ethnicity_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("ethnicity_source_value = (", as.character(ethnicity_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("ethnicity_source_value = '", ethnicity_source_value,"'"))
    }
  }

  if (!missing(ethnicity_source_concept_id)) {
    if (is.null(ethnicity_source_concept_id)) {
      whereClauses <- c(whereClauses, "ethnicity_source_concept_id IS NULL")
    } else if (is(ethnicity_source_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("ethnicity_source_concept_id = (", as.character(ethnicity_source_concept_id), ")"))
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
      whereClasues <- c(whereClasues, paste0("observation_period_id = (", as.character(observation_period_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("observation_period_id = '", observation_period_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(observation_period_start_date)) {
    if (is.null(observation_period_start_date)) {
      whereClauses <- c(whereClauses, "observation_period_start_date IS NULL")
    } else if (is(observation_period_start_date, "subQuery")){
      whereClasues <- c(whereClasues, paste0("observation_period_start_date = (", as.character(observation_period_start_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("observation_period_start_date = '", observation_period_start_date,"'"))
    }
  }

  if (!missing(observation_period_end_date)) {
    if (is.null(observation_period_end_date)) {
      whereClauses <- c(whereClauses, "observation_period_end_date IS NULL")
    } else if (is(observation_period_end_date, "subQuery")){
      whereClasues <- c(whereClasues, paste0("observation_period_end_date = (", as.character(observation_period_end_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("observation_period_end_date = '", observation_period_end_date,"'"))
    }
  }

  if (!missing(period_type_concept_id)) {
    if (is.null(period_type_concept_id)) {
      whereClauses <- c(whereClauses, "period_type_concept_id IS NULL")
    } else if (is(period_type_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("period_type_concept_id = (", as.character(period_type_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("period_type_concept_id = '", period_type_concept_id,"'"))
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
      whereClasues <- c(whereClasues, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(death_date)) {
    if (is.null(death_date)) {
      whereClauses <- c(whereClauses, "death_date IS NULL")
    } else if (is(death_date, "subQuery")){
      whereClasues <- c(whereClasues, paste0("death_date = (", as.character(death_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("death_date = '", death_date,"'"))
    }
  }

  if (!missing(death_type_concept_id)) {
    if (is.null(death_type_concept_id)) {
      whereClauses <- c(whereClauses, "death_type_concept_id IS NULL")
    } else if (is(death_type_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("death_type_concept_id = (", as.character(death_type_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("death_type_concept_id = '", death_type_concept_id,"'"))
    }
  }

  if (!missing(cause_concept_id)) {
    if (is.null(cause_concept_id)) {
      whereClauses <- c(whereClauses, "cause_concept_id IS NULL")
    } else if (is(cause_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("cause_concept_id = (", as.character(cause_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cause_concept_id = '", cause_concept_id,"'"))
    }
  }

  if (!missing(cause_source_value)) {
    if (is.null(cause_source_value)) {
      whereClauses <- c(whereClauses, "cause_source_value IS NULL")
    } else if (is(cause_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("cause_source_value = (", as.character(cause_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cause_source_value = '", cause_source_value,"'"))
    }
  }

  if (!missing(cause_source_concept_id)) {
    if (is.null(cause_source_concept_id)) {
      whereClauses <- c(whereClauses, "cause_source_concept_id IS NULL")
    } else if (is(cause_source_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("cause_source_concept_id = (", as.character(cause_source_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cause_source_concept_id = '", cause_source_concept_id,"'"))
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
      whereClasues <- c(whereClasues, paste0("visit_occurrence_id = (", as.character(visit_occurrence_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_occurrence_id = '", visit_occurrence_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(visit_concept_id)) {
    if (is.null(visit_concept_id)) {
      whereClauses <- c(whereClauses, "visit_concept_id IS NULL")
    } else if (is(visit_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("visit_concept_id = (", as.character(visit_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_concept_id = '", visit_concept_id,"'"))
    }
  }

  if (!missing(visit_start_date)) {
    if (is.null(visit_start_date)) {
      whereClauses <- c(whereClauses, "visit_start_date IS NULL")
    } else if (is(visit_start_date, "subQuery")){
      whereClasues <- c(whereClasues, paste0("visit_start_date = (", as.character(visit_start_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_start_date = '", visit_start_date,"'"))
    }
  }

  if (!missing(visit_start_time)) {
    if (is.null(visit_start_time)) {
      whereClauses <- c(whereClauses, "visit_start_time IS NULL")
    } else if (is(visit_start_time, "subQuery")){
      whereClasues <- c(whereClasues, paste0("visit_start_time = (", as.character(visit_start_time), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_start_time = '", visit_start_time,"'"))
    }
  }

  if (!missing(visit_end_date)) {
    if (is.null(visit_end_date)) {
      whereClauses <- c(whereClauses, "visit_end_date IS NULL")
    } else if (is(visit_end_date, "subQuery")){
      whereClasues <- c(whereClasues, paste0("visit_end_date = (", as.character(visit_end_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_end_date = '", visit_end_date,"'"))
    }
  }

  if (!missing(visit_end_time)) {
    if (is.null(visit_end_time)) {
      whereClauses <- c(whereClauses, "visit_end_time IS NULL")
    } else if (is(visit_end_time, "subQuery")){
      whereClasues <- c(whereClasues, paste0("visit_end_time = (", as.character(visit_end_time), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_end_time = '", visit_end_time,"'"))
    }
  }

  if (!missing(visit_type_concept_id)) {
    if (is.null(visit_type_concept_id)) {
      whereClauses <- c(whereClauses, "visit_type_concept_id IS NULL")
    } else if (is(visit_type_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("visit_type_concept_id = (", as.character(visit_type_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_type_concept_id = '", visit_type_concept_id,"'"))
    }
  }

  if (!missing(provider_id)) {
    if (is.null(provider_id)) {
      whereClauses <- c(whereClauses, "provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("provider_id = (", as.character(provider_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("provider_id = '", provider_id,"'"))
    }
  }

  if (!missing(care_site_id)) {
    if (is.null(care_site_id)) {
      whereClauses <- c(whereClauses, "care_site_id IS NULL")
    } else if (is(care_site_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("care_site_id = (", as.character(care_site_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("care_site_id = '", care_site_id,"'"))
    }
  }

  if (!missing(visit_source_value)) {
    if (is.null(visit_source_value)) {
      whereClauses <- c(whereClauses, "visit_source_value IS NULL")
    } else if (is(visit_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("visit_source_value = (", as.character(visit_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_source_value = '", visit_source_value,"'"))
    }
  }

  if (!missing(visit_source_concept_id)) {
    if (is.null(visit_source_concept_id)) {
      whereClauses <- c(whereClauses, "visit_source_concept_id IS NULL")
    } else if (is(visit_source_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("visit_source_concept_id = (", as.character(visit_source_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_source_concept_id = '", visit_source_concept_id,"'"))
    }
  }

  statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

expect_condition_occurrence <- function(condition_occurrence_id, person_id, condition_concept_id, condition_source_concept_id, condition_source_value, condition_start_date, provider_id, visit_occurrence_id, condition_type_concept_id, condition_end_date, stop_reason) {

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
      whereClasues <- c(whereClasues, paste0("condition_occurrence_id = (", as.character(condition_occurrence_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("condition_occurrence_id = '", condition_occurrence_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(condition_concept_id)) {
    if (is.null(condition_concept_id)) {
      whereClauses <- c(whereClauses, "condition_concept_id IS NULL")
    } else if (is(condition_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("condition_concept_id = (", as.character(condition_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("condition_concept_id = '", condition_concept_id,"'"))
    }
  }

  if (!missing(condition_source_concept_id)) {
    if (is.null(condition_source_concept_id)) {
      whereClauses <- c(whereClauses, "condition_source_concept_id IS NULL")
    } else if (is(condition_source_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("condition_source_concept_id = (", as.character(condition_source_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("condition_source_concept_id = '", condition_source_concept_id,"'"))
    }
  }

  if (!missing(condition_source_value)) {
    if (is.null(condition_source_value)) {
      whereClauses <- c(whereClauses, "condition_source_value IS NULL")
    } else if (is(condition_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("condition_source_value = (", as.character(condition_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("condition_source_value = '", condition_source_value,"'"))
    }
  }

  if (!missing(condition_start_date)) {
    if (is.null(condition_start_date)) {
      whereClauses <- c(whereClauses, "condition_start_date IS NULL")
    } else if (is(condition_start_date, "subQuery")){
      whereClasues <- c(whereClasues, paste0("condition_start_date = (", as.character(condition_start_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("condition_start_date = '", condition_start_date,"'"))
    }
  }

  if (!missing(provider_id)) {
    if (is.null(provider_id)) {
      whereClauses <- c(whereClauses, "provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("provider_id = (", as.character(provider_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("provider_id = '", provider_id,"'"))
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (is.null(visit_occurrence_id)) {
      whereClauses <- c(whereClauses, "visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("visit_occurrence_id = (", as.character(visit_occurrence_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_occurrence_id = '", visit_occurrence_id,"'"))
    }
  }

  if (!missing(condition_type_concept_id)) {
    if (is.null(condition_type_concept_id)) {
      whereClauses <- c(whereClauses, "condition_type_concept_id IS NULL")
    } else if (is(condition_type_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("condition_type_concept_id = (", as.character(condition_type_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("condition_type_concept_id = '", condition_type_concept_id,"'"))
    }
  }

  if (!missing(condition_end_date)) {
    if (is.null(condition_end_date)) {
      whereClauses <- c(whereClauses, "condition_end_date IS NULL")
    } else if (is(condition_end_date, "subQuery")){
      whereClasues <- c(whereClasues, paste0("condition_end_date = (", as.character(condition_end_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("condition_end_date = '", condition_end_date,"'"))
    }
  }

  if (!missing(stop_reason)) {
    if (is.null(stop_reason)) {
      whereClauses <- c(whereClauses, "stop_reason IS NULL")
    } else if (is(stop_reason, "subQuery")){
      whereClasues <- c(whereClasues, paste0("stop_reason = (", as.character(stop_reason), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("stop_reason = '", stop_reason,"'"))
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
      whereClasues <- c(whereClasues, paste0("device_exposure_id = (", as.character(device_exposure_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("device_exposure_id = '", device_exposure_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(device_concept_id)) {
    if (is.null(device_concept_id)) {
      whereClauses <- c(whereClauses, "device_concept_id IS NULL")
    } else if (is(device_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("device_concept_id = (", as.character(device_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("device_concept_id = '", device_concept_id,"'"))
    }
  }

  if (!missing(device_exposure_start_date)) {
    if (is.null(device_exposure_start_date)) {
      whereClauses <- c(whereClauses, "device_exposure_start_date IS NULL")
    } else if (is(device_exposure_start_date, "subQuery")){
      whereClasues <- c(whereClasues, paste0("device_exposure_start_date = (", as.character(device_exposure_start_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("device_exposure_start_date = '", device_exposure_start_date,"'"))
    }
  }

  if (!missing(device_exposure_end_date)) {
    if (is.null(device_exposure_end_date)) {
      whereClauses <- c(whereClauses, "device_exposure_end_date IS NULL")
    } else if (is(device_exposure_end_date, "subQuery")){
      whereClasues <- c(whereClasues, paste0("device_exposure_end_date = (", as.character(device_exposure_end_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("device_exposure_end_date = '", device_exposure_end_date,"'"))
    }
  }

  if (!missing(device_type_concept_id)) {
    if (is.null(device_type_concept_id)) {
      whereClauses <- c(whereClauses, "device_type_concept_id IS NULL")
    } else if (is(device_type_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("device_type_concept_id = (", as.character(device_type_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("device_type_concept_id = '", device_type_concept_id,"'"))
    }
  }

  if (!missing(unique_device_id)) {
    if (is.null(unique_device_id)) {
      whereClauses <- c(whereClauses, "unique_device_id IS NULL")
    } else if (is(unique_device_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("unique_device_id = (", as.character(unique_device_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("unique_device_id = '", unique_device_id,"'"))
    }
  }

  if (!missing(quantity)) {
    if (is.null(quantity)) {
      whereClauses <- c(whereClauses, "quantity IS NULL")
    } else if (is(quantity, "subQuery")){
      whereClasues <- c(whereClasues, paste0("quantity = (", as.character(quantity), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("quantity = '", quantity,"'"))
    }
  }

  if (!missing(provider_id)) {
    if (is.null(provider_id)) {
      whereClauses <- c(whereClauses, "provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("provider_id = (", as.character(provider_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("provider_id = '", provider_id,"'"))
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (is.null(visit_occurrence_id)) {
      whereClauses <- c(whereClauses, "visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("visit_occurrence_id = (", as.character(visit_occurrence_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_occurrence_id = '", visit_occurrence_id,"'"))
    }
  }

  if (!missing(device_source_value)) {
    if (is.null(device_source_value)) {
      whereClauses <- c(whereClauses, "device_source_value IS NULL")
    } else if (is(device_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("device_source_value = (", as.character(device_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("device_source_value = '", device_source_value,"'"))
    }
  }

  if (!missing(device_source_concept_id)) {
    if (is.null(device_source_concept_id)) {
      whereClauses <- c(whereClauses, "device_source_concept_id IS NULL")
    } else if (is(device_source_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("device_source_concept_id = (", as.character(device_source_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("device_source_concept_id = '", device_source_concept_id,"'"))
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
      whereClasues <- c(whereClasues, paste0("observation_id = (", as.character(observation_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("observation_id = '", observation_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(observation_concept_id)) {
    if (is.null(observation_concept_id)) {
      whereClauses <- c(whereClauses, "observation_concept_id IS NULL")
    } else if (is(observation_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("observation_concept_id = (", as.character(observation_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("observation_concept_id = '", observation_concept_id,"'"))
    }
  }

  if (!missing(observation_date)) {
    if (is.null(observation_date)) {
      whereClauses <- c(whereClauses, "observation_date IS NULL")
    } else if (is(observation_date, "subQuery")){
      whereClasues <- c(whereClasues, paste0("observation_date = (", as.character(observation_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("observation_date = '", observation_date,"'"))
    }
  }

  if (!missing(observation_time)) {
    if (is.null(observation_time)) {
      whereClauses <- c(whereClauses, "observation_time IS NULL")
    } else if (is(observation_time, "subQuery")){
      whereClasues <- c(whereClasues, paste0("observation_time = (", as.character(observation_time), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("observation_time = '", observation_time,"'"))
    }
  }

  if (!missing(observation_type_concept_id)) {
    if (is.null(observation_type_concept_id)) {
      whereClauses <- c(whereClauses, "observation_type_concept_id IS NULL")
    } else if (is(observation_type_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("observation_type_concept_id = (", as.character(observation_type_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("observation_type_concept_id = '", observation_type_concept_id,"'"))
    }
  }

  if (!missing(value_as_number)) {
    if (is.null(value_as_number)) {
      whereClauses <- c(whereClauses, "value_as_number IS NULL")
    } else if (is(value_as_number, "subQuery")){
      whereClasues <- c(whereClasues, paste0("value_as_number = (", as.character(value_as_number), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("value_as_number = '", value_as_number,"'"))
    }
  }

  if (!missing(value_as_string)) {
    if (is.null(value_as_string)) {
      whereClauses <- c(whereClauses, "value_as_string IS NULL")
    } else if (is(value_as_string, "subQuery")){
      whereClasues <- c(whereClasues, paste0("value_as_string = (", as.character(value_as_string), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("value_as_string = '", value_as_string,"'"))
    }
  }

  if (!missing(value_as_concept_id)) {
    if (is.null(value_as_concept_id)) {
      whereClauses <- c(whereClauses, "value_as_concept_id IS NULL")
    } else if (is(value_as_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("value_as_concept_id = (", as.character(value_as_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("value_as_concept_id = '", value_as_concept_id,"'"))
    }
  }

  if (!missing(qualifier_concept_id)) {
    if (is.null(qualifier_concept_id)) {
      whereClauses <- c(whereClauses, "qualifier_concept_id IS NULL")
    } else if (is(qualifier_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("qualifier_concept_id = (", as.character(qualifier_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("qualifier_concept_id = '", qualifier_concept_id,"'"))
    }
  }

  if (!missing(unit_concept_id)) {
    if (is.null(unit_concept_id)) {
      whereClauses <- c(whereClauses, "unit_concept_id IS NULL")
    } else if (is(unit_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("unit_concept_id = (", as.character(unit_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("unit_concept_id = '", unit_concept_id,"'"))
    }
  }

  if (!missing(provider_id)) {
    if (is.null(provider_id)) {
      whereClauses <- c(whereClauses, "provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("provider_id = (", as.character(provider_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("provider_id = '", provider_id,"'"))
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (is.null(visit_occurrence_id)) {
      whereClauses <- c(whereClauses, "visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("visit_occurrence_id = (", as.character(visit_occurrence_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_occurrence_id = '", visit_occurrence_id,"'"))
    }
  }

  if (!missing(observation_source_value)) {
    if (is.null(observation_source_value)) {
      whereClauses <- c(whereClauses, "observation_source_value IS NULL")
    } else if (is(observation_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("observation_source_value = (", as.character(observation_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("observation_source_value = '", observation_source_value,"'"))
    }
  }

  if (!missing(observation_source_concept_id)) {
    if (is.null(observation_source_concept_id)) {
      whereClauses <- c(whereClauses, "observation_source_concept_id IS NULL")
    } else if (is(observation_source_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("observation_source_concept_id = (", as.character(observation_source_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("observation_source_concept_id = '", observation_source_concept_id,"'"))
    }
  }

  if (!missing(unit_source_value)) {
    if (is.null(unit_source_value)) {
      whereClauses <- c(whereClauses, "unit_source_value IS NULL")
    } else if (is(unit_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("unit_source_value = (", as.character(unit_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("unit_source_value = '", unit_source_value,"'"))
    }
  }

  if (!missing(qualifier_source_value)) {
    if (is.null(qualifier_source_value)) {
      whereClauses <- c(whereClauses, "qualifier_source_value IS NULL")
    } else if (is(qualifier_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("qualifier_source_value = (", as.character(qualifier_source_value), ")"))
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
      whereClasues <- c(whereClasues, paste0("measurement_id = (", as.character(measurement_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("measurement_id = '", measurement_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(measurement_concept_id)) {
    if (is.null(measurement_concept_id)) {
      whereClauses <- c(whereClauses, "measurement_concept_id IS NULL")
    } else if (is(measurement_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("measurement_concept_id = (", as.character(measurement_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("measurement_concept_id = '", measurement_concept_id,"'"))
    }
  }

  if (!missing(measurement_date)) {
    if (is.null(measurement_date)) {
      whereClauses <- c(whereClauses, "measurement_date IS NULL")
    } else if (is(measurement_date, "subQuery")){
      whereClasues <- c(whereClasues, paste0("measurement_date = (", as.character(measurement_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("measurement_date = '", measurement_date,"'"))
    }
  }

  if (!missing(measurement_time)) {
    if (is.null(measurement_time)) {
      whereClauses <- c(whereClauses, "measurement_time IS NULL")
    } else if (is(measurement_time, "subQuery")){
      whereClasues <- c(whereClasues, paste0("measurement_time = (", as.character(measurement_time), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("measurement_time = '", measurement_time,"'"))
    }
  }

  if (!missing(measurement_type_concept_id)) {
    if (is.null(measurement_type_concept_id)) {
      whereClauses <- c(whereClauses, "measurement_type_concept_id IS NULL")
    } else if (is(measurement_type_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("measurement_type_concept_id = (", as.character(measurement_type_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("measurement_type_concept_id = '", measurement_type_concept_id,"'"))
    }
  }

  if (!missing(operator_concept_id)) {
    if (is.null(operator_concept_id)) {
      whereClauses <- c(whereClauses, "operator_concept_id IS NULL")
    } else if (is(operator_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("operator_concept_id = (", as.character(operator_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("operator_concept_id = '", operator_concept_id,"'"))
    }
  }

  if (!missing(value_as_number)) {
    if (is.null(value_as_number)) {
      whereClauses <- c(whereClauses, "value_as_number IS NULL")
    } else if (is(value_as_number, "subQuery")){
      whereClasues <- c(whereClasues, paste0("value_as_number = (", as.character(value_as_number), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("value_as_number = '", value_as_number,"'"))
    }
  }

  if (!missing(value_as_concept_id)) {
    if (is.null(value_as_concept_id)) {
      whereClauses <- c(whereClauses, "value_as_concept_id IS NULL")
    } else if (is(value_as_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("value_as_concept_id = (", as.character(value_as_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("value_as_concept_id = '", value_as_concept_id,"'"))
    }
  }

  if (!missing(unit_concept_id)) {
    if (is.null(unit_concept_id)) {
      whereClauses <- c(whereClauses, "unit_concept_id IS NULL")
    } else if (is(unit_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("unit_concept_id = (", as.character(unit_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("unit_concept_id = '", unit_concept_id,"'"))
    }
  }

  if (!missing(range_low)) {
    if (is.null(range_low)) {
      whereClauses <- c(whereClauses, "range_low IS NULL")
    } else if (is(range_low, "subQuery")){
      whereClasues <- c(whereClasues, paste0("range_low = (", as.character(range_low), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("range_low = '", range_low,"'"))
    }
  }

  if (!missing(range_high)) {
    if (is.null(range_high)) {
      whereClauses <- c(whereClauses, "range_high IS NULL")
    } else if (is(range_high, "subQuery")){
      whereClasues <- c(whereClasues, paste0("range_high = (", as.character(range_high), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("range_high = '", range_high,"'"))
    }
  }

  if (!missing(provider_id)) {
    if (is.null(provider_id)) {
      whereClauses <- c(whereClauses, "provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("provider_id = (", as.character(provider_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("provider_id = '", provider_id,"'"))
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (is.null(visit_occurrence_id)) {
      whereClauses <- c(whereClauses, "visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("visit_occurrence_id = (", as.character(visit_occurrence_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_occurrence_id = '", visit_occurrence_id,"'"))
    }
  }

  if (!missing(measurement_source_value)) {
    if (is.null(measurement_source_value)) {
      whereClauses <- c(whereClauses, "measurement_source_value IS NULL")
    } else if (is(measurement_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("measurement_source_value = (", as.character(measurement_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("measurement_source_value = '", measurement_source_value,"'"))
    }
  }

  if (!missing(measurement_source_concept_id)) {
    if (is.null(measurement_source_concept_id)) {
      whereClauses <- c(whereClauses, "measurement_source_concept_id IS NULL")
    } else if (is(measurement_source_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("measurement_source_concept_id = (", as.character(measurement_source_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("measurement_source_concept_id = '", measurement_source_concept_id,"'"))
    }
  }

  if (!missing(unit_source_value)) {
    if (is.null(unit_source_value)) {
      whereClauses <- c(whereClauses, "unit_source_value IS NULL")
    } else if (is(unit_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("unit_source_value = (", as.character(unit_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("unit_source_value = '", unit_source_value,"'"))
    }
  }

  if (!missing(value_source_value)) {
    if (is.null(value_source_value)) {
      whereClauses <- c(whereClauses, "value_source_value IS NULL")
    } else if (is(value_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("value_source_value = (", as.character(value_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("value_source_value = '", value_source_value,"'"))
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
      whereClasues <- c(whereClasues, paste0("procedure_occurrence_id = (", as.character(procedure_occurrence_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("procedure_occurrence_id = '", procedure_occurrence_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(procedure_concept_id)) {
    if (is.null(procedure_concept_id)) {
      whereClauses <- c(whereClauses, "procedure_concept_id IS NULL")
    } else if (is(procedure_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("procedure_concept_id = (", as.character(procedure_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("procedure_concept_id = '", procedure_concept_id,"'"))
    }
  }

  if (!missing(procedure_date)) {
    if (is.null(procedure_date)) {
      whereClauses <- c(whereClauses, "procedure_date IS NULL")
    } else if (is(procedure_date, "subQuery")){
      whereClasues <- c(whereClasues, paste0("procedure_date = (", as.character(procedure_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("procedure_date = '", procedure_date,"'"))
    }
  }

  if (!missing(procedure_type_concept_id)) {
    if (is.null(procedure_type_concept_id)) {
      whereClauses <- c(whereClauses, "procedure_type_concept_id IS NULL")
    } else if (is(procedure_type_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("procedure_type_concept_id = (", as.character(procedure_type_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("procedure_type_concept_id = '", procedure_type_concept_id,"'"))
    }
  }

  if (!missing(modifier_concept_id)) {
    if (is.null(modifier_concept_id)) {
      whereClauses <- c(whereClauses, "modifier_concept_id IS NULL")
    } else if (is(modifier_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("modifier_concept_id = (", as.character(modifier_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("modifier_concept_id = '", modifier_concept_id,"'"))
    }
  }

  if (!missing(quantity)) {
    if (is.null(quantity)) {
      whereClauses <- c(whereClauses, "quantity IS NULL")
    } else if (is(quantity, "subQuery")){
      whereClasues <- c(whereClasues, paste0("quantity = (", as.character(quantity), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("quantity = '", quantity,"'"))
    }
  }

  if (!missing(provider_id)) {
    if (is.null(provider_id)) {
      whereClauses <- c(whereClauses, "provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("provider_id = (", as.character(provider_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("provider_id = '", provider_id,"'"))
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (is.null(visit_occurrence_id)) {
      whereClauses <- c(whereClauses, "visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("visit_occurrence_id = (", as.character(visit_occurrence_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_occurrence_id = '", visit_occurrence_id,"'"))
    }
  }

  if (!missing(procedure_source_value)) {
    if (is.null(procedure_source_value)) {
      whereClauses <- c(whereClauses, "procedure_source_value IS NULL")
    } else if (is(procedure_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("procedure_source_value = (", as.character(procedure_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("procedure_source_value = '", procedure_source_value,"'"))
    }
  }

  if (!missing(procedure_source_concept_id)) {
    if (is.null(procedure_source_concept_id)) {
      whereClauses <- c(whereClauses, "procedure_source_concept_id IS NULL")
    } else if (is(procedure_source_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("procedure_source_concept_id = (", as.character(procedure_source_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("procedure_source_concept_id = '", procedure_source_concept_id,"'"))
    }
  }

  if (!missing(qualifier_source_value)) {
    if (is.null(qualifier_source_value)) {
      whereClauses <- c(whereClauses, "qualifier_source_value IS NULL")
    } else if (is(qualifier_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("qualifier_source_value = (", as.character(qualifier_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("qualifier_source_value = '", qualifier_source_value,"'"))
    }
  }

  statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

expect_drug_exposure <- function(drug_exposure_id, person_id, drug_exposure_start_date, drug_concept_id, drug_source_value, drug_source_concept_id, drug_type_concept_id, provider_id, visit_occurrence_id, route_concept_id, route_source_value, quantity, refills, days_supply, dose_unit_concept_id, dose_unit_source_value, effective_drug_dose, stop_reason, sig, lot_number, drug_exposure_end_date) {

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
      whereClasues <- c(whereClasues, paste0("drug_exposure_id = (", as.character(drug_exposure_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("drug_exposure_id = '", drug_exposure_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(drug_exposure_start_date)) {
    if (is.null(drug_exposure_start_date)) {
      whereClauses <- c(whereClauses, "drug_exposure_start_date IS NULL")
    } else if (is(drug_exposure_start_date, "subQuery")){
      whereClasues <- c(whereClasues, paste0("drug_exposure_start_date = (", as.character(drug_exposure_start_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("drug_exposure_start_date = '", drug_exposure_start_date,"'"))
    }
  }

  if (!missing(drug_concept_id)) {
    if (is.null(drug_concept_id)) {
      whereClauses <- c(whereClauses, "drug_concept_id IS NULL")
    } else if (is(drug_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("drug_concept_id = (", as.character(drug_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("drug_concept_id = '", drug_concept_id,"'"))
    }
  }

  if (!missing(drug_source_value)) {
    if (is.null(drug_source_value)) {
      whereClauses <- c(whereClauses, "drug_source_value IS NULL")
    } else if (is(drug_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("drug_source_value = (", as.character(drug_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("drug_source_value = '", drug_source_value,"'"))
    }
  }

  if (!missing(drug_source_concept_id)) {
    if (is.null(drug_source_concept_id)) {
      whereClauses <- c(whereClauses, "drug_source_concept_id IS NULL")
    } else if (is(drug_source_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("drug_source_concept_id = (", as.character(drug_source_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("drug_source_concept_id = '", drug_source_concept_id,"'"))
    }
  }

  if (!missing(drug_type_concept_id)) {
    if (is.null(drug_type_concept_id)) {
      whereClauses <- c(whereClauses, "drug_type_concept_id IS NULL")
    } else if (is(drug_type_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("drug_type_concept_id = (", as.character(drug_type_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("drug_type_concept_id = '", drug_type_concept_id,"'"))
    }
  }

  if (!missing(provider_id)) {
    if (is.null(provider_id)) {
      whereClauses <- c(whereClauses, "provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("provider_id = (", as.character(provider_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("provider_id = '", provider_id,"'"))
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (is.null(visit_occurrence_id)) {
      whereClauses <- c(whereClauses, "visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("visit_occurrence_id = (", as.character(visit_occurrence_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_occurrence_id = '", visit_occurrence_id,"'"))
    }
  }

  if (!missing(route_concept_id)) {
    if (is.null(route_concept_id)) {
      whereClauses <- c(whereClauses, "route_concept_id IS NULL")
    } else if (is(route_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("route_concept_id = (", as.character(route_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("route_concept_id = '", route_concept_id,"'"))
    }
  }

  if (!missing(route_source_value)) {
    if (is.null(route_source_value)) {
      whereClauses <- c(whereClauses, "route_source_value IS NULL")
    } else if (is(route_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("route_source_value = (", as.character(route_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("route_source_value = '", route_source_value,"'"))
    }
  }

  if (!missing(quantity)) {
    if (is.null(quantity)) {
      whereClauses <- c(whereClauses, "quantity IS NULL")
    } else if (is(quantity, "subQuery")){
      whereClasues <- c(whereClasues, paste0("quantity = (", as.character(quantity), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("quantity = '", quantity,"'"))
    }
  }

  if (!missing(refills)) {
    if (is.null(refills)) {
      whereClauses <- c(whereClauses, "refills IS NULL")
    } else if (is(refills, "subQuery")){
      whereClasues <- c(whereClasues, paste0("refills = (", as.character(refills), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("refills = '", refills,"'"))
    }
  }

  if (!missing(days_supply)) {
    if (is.null(days_supply)) {
      whereClauses <- c(whereClauses, "days_supply IS NULL")
    } else if (is(days_supply, "subQuery")){
      whereClasues <- c(whereClasues, paste0("days_supply = (", as.character(days_supply), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("days_supply = '", days_supply,"'"))
    }
  }

  if (!missing(dose_unit_concept_id)) {
    if (is.null(dose_unit_concept_id)) {
      whereClauses <- c(whereClauses, "dose_unit_concept_id IS NULL")
    } else if (is(dose_unit_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("dose_unit_concept_id = (", as.character(dose_unit_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("dose_unit_concept_id = '", dose_unit_concept_id,"'"))
    }
  }

  if (!missing(dose_unit_source_value)) {
    if (is.null(dose_unit_source_value)) {
      whereClauses <- c(whereClauses, "dose_unit_source_value IS NULL")
    } else if (is(dose_unit_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("dose_unit_source_value = (", as.character(dose_unit_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("dose_unit_source_value = '", dose_unit_source_value,"'"))
    }
  }

  if (!missing(effective_drug_dose)) {
    if (is.null(effective_drug_dose)) {
      whereClauses <- c(whereClauses, "effective_drug_dose IS NULL")
    } else if (is(effective_drug_dose, "subQuery")){
      whereClasues <- c(whereClasues, paste0("effective_drug_dose = (", as.character(effective_drug_dose), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("effective_drug_dose = '", effective_drug_dose,"'"))
    }
  }

  if (!missing(stop_reason)) {
    if (is.null(stop_reason)) {
      whereClauses <- c(whereClauses, "stop_reason IS NULL")
    } else if (is(stop_reason, "subQuery")){
      whereClasues <- c(whereClasues, paste0("stop_reason = (", as.character(stop_reason), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("stop_reason = '", stop_reason,"'"))
    }
  }

  if (!missing(sig)) {
    if (is.null(sig)) {
      whereClauses <- c(whereClauses, "sig IS NULL")
    } else if (is(sig, "subQuery")){
      whereClasues <- c(whereClasues, paste0("sig = (", as.character(sig), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("sig = '", sig,"'"))
    }
  }

  if (!missing(lot_number)) {
    if (is.null(lot_number)) {
      whereClauses <- c(whereClauses, "lot_number IS NULL")
    } else if (is(lot_number, "subQuery")){
      whereClasues <- c(whereClasues, paste0("lot_number = (", as.character(lot_number), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("lot_number = '", lot_number,"'"))
    }
  }

  if (!missing(drug_exposure_end_date)) {
    if (is.null(drug_exposure_end_date)) {
      whereClauses <- c(whereClauses, "drug_exposure_end_date IS NULL")
    } else if (is(drug_exposure_end_date, "subQuery")){
      whereClasues <- c(whereClasues, paste0("drug_exposure_end_date = (", as.character(drug_exposure_end_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("drug_exposure_end_date = '", drug_exposure_end_date,"'"))
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
      whereClasues <- c(whereClasues, paste0("domain_concept_id_1 = (", as.character(domain_concept_id_1), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("domain_concept_id_1 = '", domain_concept_id_1,"'"))
    }
  }

  if (!missing(fact_id_1)) {
    if (is.null(fact_id_1)) {
      whereClauses <- c(whereClauses, "fact_id_1 IS NULL")
    } else if (is(fact_id_1, "subQuery")){
      whereClasues <- c(whereClasues, paste0("fact_id_1 = (", as.character(fact_id_1), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("fact_id_1 = '", fact_id_1,"'"))
    }
  }

  if (!missing(domain_concept_id_2)) {
    if (is.null(domain_concept_id_2)) {
      whereClauses <- c(whereClauses, "domain_concept_id_2 IS NULL")
    } else if (is(domain_concept_id_2, "subQuery")){
      whereClasues <- c(whereClasues, paste0("domain_concept_id_2 = (", as.character(domain_concept_id_2), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("domain_concept_id_2 = '", domain_concept_id_2,"'"))
    }
  }

  if (!missing(fact_id_2)) {
    if (is.null(fact_id_2)) {
      whereClauses <- c(whereClauses, "fact_id_2 IS NULL")
    } else if (is(fact_id_2, "subQuery")){
      whereClasues <- c(whereClasues, paste0("fact_id_2 = (", as.character(fact_id_2), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("fact_id_2 = '", fact_id_2,"'"))
    }
  }

  if (!missing(relationship_concept_id)) {
    if (is.null(relationship_concept_id)) {
      whereClauses <- c(whereClauses, "relationship_concept_id IS NULL")
    } else if (is(relationship_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("relationship_concept_id = (", as.character(relationship_concept_id), ")"))
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
      whereClasues <- c(whereClasues, paste0("payer_plan_period_id = (", as.character(payer_plan_period_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("payer_plan_period_id = '", payer_plan_period_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(payer_plan_period_start_date)) {
    if (is.null(payer_plan_period_start_date)) {
      whereClauses <- c(whereClauses, "payer_plan_period_start_date IS NULL")
    } else if (is(payer_plan_period_start_date, "subQuery")){
      whereClasues <- c(whereClasues, paste0("payer_plan_period_start_date = (", as.character(payer_plan_period_start_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("payer_plan_period_start_date = '", payer_plan_period_start_date,"'"))
    }
  }

  if (!missing(payer_plan_period_end_date)) {
    if (is.null(payer_plan_period_end_date)) {
      whereClauses <- c(whereClauses, "payer_plan_period_end_date IS NULL")
    } else if (is(payer_plan_period_end_date, "subQuery")){
      whereClasues <- c(whereClasues, paste0("payer_plan_period_end_date = (", as.character(payer_plan_period_end_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("payer_plan_period_end_date = '", payer_plan_period_end_date,"'"))
    }
  }

  if (!missing(payer_source_value)) {
    if (is.null(payer_source_value)) {
      whereClauses <- c(whereClauses, "payer_source_value IS NULL")
    } else if (is(payer_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("payer_source_value = (", as.character(payer_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("payer_source_value = '", payer_source_value,"'"))
    }
  }

  if (!missing(plan_source_value)) {
    if (is.null(plan_source_value)) {
      whereClauses <- c(whereClauses, "plan_source_value IS NULL")
    } else if (is(plan_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("plan_source_value = (", as.character(plan_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("plan_source_value = '", plan_source_value,"'"))
    }
  }

  if (!missing(family_source_value)) {
    if (is.null(family_source_value)) {
      whereClauses <- c(whereClauses, "family_source_value IS NULL")
    } else if (is(family_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("family_source_value = (", as.character(family_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("family_source_value = '", family_source_value,"'"))
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
      whereClasues <- c(whereClasues, paste0("note_id = (", as.character(note_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("note_id = '", note_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(note_date)) {
    if (is.null(note_date)) {
      whereClauses <- c(whereClauses, "note_date IS NULL")
    } else if (is(note_date, "subQuery")){
      whereClasues <- c(whereClasues, paste0("note_date = (", as.character(note_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("note_date = '", note_date,"'"))
    }
  }

  if (!missing(note_time)) {
    if (is.null(note_time)) {
      whereClauses <- c(whereClauses, "note_time IS NULL")
    } else if (is(note_time, "subQuery")){
      whereClasues <- c(whereClasues, paste0("note_time = (", as.character(note_time), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("note_time = '", note_time,"'"))
    }
  }

  if (!missing(note_type_concept_id)) {
    if (is.null(note_type_concept_id)) {
      whereClauses <- c(whereClauses, "note_type_concept_id IS NULL")
    } else if (is(note_type_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("note_type_concept_id = (", as.character(note_type_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("note_type_concept_id = '", note_type_concept_id,"'"))
    }
  }

  if (!missing(note_text)) {
    if (is.null(note_text)) {
      whereClauses <- c(whereClauses, "note_text IS NULL")
    } else if (is(note_text, "subQuery")){
      whereClasues <- c(whereClasues, paste0("note_text = (", as.character(note_text), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("note_text = '", note_text,"'"))
    }
  }

  if (!missing(provider_id)) {
    if (is.null(provider_id)) {
      whereClauses <- c(whereClauses, "provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("provider_id = (", as.character(provider_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("provider_id = '", provider_id,"'"))
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (is.null(visit_occurrence_id)) {
      whereClauses <- c(whereClauses, "visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("visit_occurrence_id = (", as.character(visit_occurrence_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_occurrence_id = '", visit_occurrence_id,"'"))
    }
  }

  if (!missing(note_source_value)) {
    if (is.null(note_source_value)) {
      whereClauses <- c(whereClauses, "note_source_value IS NULL")
    } else if (is(note_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("note_source_value = (", as.character(note_source_value), ")"))
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
      whereClasues <- c(whereClasues, paste0("specimen_id = (", as.character(specimen_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("specimen_id = '", specimen_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(specimen_concept_id)) {
    if (is.null(specimen_concept_id)) {
      whereClauses <- c(whereClauses, "specimen_concept_id IS NULL")
    } else if (is(specimen_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("specimen_concept_id = (", as.character(specimen_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("specimen_concept_id = '", specimen_concept_id,"'"))
    }
  }

  if (!missing(specimen_type_concept_id)) {
    if (is.null(specimen_type_concept_id)) {
      whereClauses <- c(whereClauses, "specimen_type_concept_id IS NULL")
    } else if (is(specimen_type_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("specimen_type_concept_id = (", as.character(specimen_type_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("specimen_type_concept_id = '", specimen_type_concept_id,"'"))
    }
  }

  if (!missing(specimen_date)) {
    if (is.null(specimen_date)) {
      whereClauses <- c(whereClauses, "specimen_date IS NULL")
    } else if (is(specimen_date, "subQuery")){
      whereClasues <- c(whereClasues, paste0("specimen_date = (", as.character(specimen_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("specimen_date = '", specimen_date,"'"))
    }
  }

  if (!missing(specimen_time)) {
    if (is.null(specimen_time)) {
      whereClauses <- c(whereClauses, "specimen_time IS NULL")
    } else if (is(specimen_time, "subQuery")){
      whereClasues <- c(whereClasues, paste0("specimen_time = (", as.character(specimen_time), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("specimen_time = '", specimen_time,"'"))
    }
  }

  if (!missing(quantity)) {
    if (is.null(quantity)) {
      whereClauses <- c(whereClauses, "quantity IS NULL")
    } else if (is(quantity, "subQuery")){
      whereClasues <- c(whereClasues, paste0("quantity = (", as.character(quantity), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("quantity = '", quantity,"'"))
    }
  }

  if (!missing(unit_concept_id)) {
    if (is.null(unit_concept_id)) {
      whereClauses <- c(whereClauses, "unit_concept_id IS NULL")
    } else if (is(unit_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("unit_concept_id = (", as.character(unit_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("unit_concept_id = '", unit_concept_id,"'"))
    }
  }

  if (!missing(anatomic_site_concept_id)) {
    if (is.null(anatomic_site_concept_id)) {
      whereClauses <- c(whereClauses, "anatomic_site_concept_id IS NULL")
    } else if (is(anatomic_site_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("anatomic_site_concept_id = (", as.character(anatomic_site_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("anatomic_site_concept_id = '", anatomic_site_concept_id,"'"))
    }
  }

  if (!missing(disease_status_concept_id)) {
    if (is.null(disease_status_concept_id)) {
      whereClauses <- c(whereClauses, "disease_status_concept_id IS NULL")
    } else if (is(disease_status_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("disease_status_concept_id = (", as.character(disease_status_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("disease_status_concept_id = '", disease_status_concept_id,"'"))
    }
  }

  if (!missing(specimen_source_id)) {
    if (is.null(specimen_source_id)) {
      whereClauses <- c(whereClauses, "specimen_source_id IS NULL")
    } else if (is(specimen_source_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("specimen_source_id = (", as.character(specimen_source_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("specimen_source_id = '", specimen_source_id,"'"))
    }
  }

  if (!missing(specimen_source_value)) {
    if (is.null(specimen_source_value)) {
      whereClauses <- c(whereClauses, "specimen_source_value IS NULL")
    } else if (is(specimen_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("specimen_source_value = (", as.character(specimen_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("specimen_source_value = '", specimen_source_value,"'"))
    }
  }

  if (!missing(unit_source_value)) {
    if (is.null(unit_source_value)) {
      whereClauses <- c(whereClauses, "unit_source_value IS NULL")
    } else if (is(unit_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("unit_source_value = (", as.character(unit_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("unit_source_value = '", unit_source_value,"'"))
    }
  }

  if (!missing(anatomic_site_source_value)) {
    if (is.null(anatomic_site_source_value)) {
      whereClauses <- c(whereClauses, "anatomic_site_source_value IS NULL")
    } else if (is(anatomic_site_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("anatomic_site_source_value = (", as.character(anatomic_site_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("anatomic_site_source_value = '", anatomic_site_source_value,"'"))
    }
  }

  if (!missing(disease_status_source_value)) {
    if (is.null(disease_status_source_value)) {
      whereClauses <- c(whereClauses, "disease_status_source_value IS NULL")
    } else if (is(disease_status_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("disease_status_source_value = (", as.character(disease_status_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("disease_status_source_value = '", disease_status_source_value,"'"))
    }
  }

  statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

expect_procedure_cost <- function(procedure_cost_id, procedure_occurrence_id, currency_concept_id, paid_copay, paid_coinsurance, paid_toward_deductible, paid_by_payer, paid_by_coordination_benefits, total_out_of_pocket, total_paid, revenue_code_concept_id, payer_plan_period_id, revenue_code_source_value) {

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

  statement <- paste0("INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT ", frameworkContext$testId, " AS id, '", testName, "' AS description, 'Expect procedure_cost' AS test, ", source_pid, " as source_pid, ", cdm_pid, " as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.procedure_cost WHERE ")
  whereClauses = NULL;
  if (!missing(procedure_cost_id)) {
    if (is.null(procedure_cost_id)) {
      whereClauses <- c(whereClauses, "procedure_cost_id IS NULL")
    } else if (is(procedure_cost_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("procedure_cost_id = (", as.character(procedure_cost_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("procedure_cost_id = '", procedure_cost_id,"'"))
    }
  }

  if (!missing(procedure_occurrence_id)) {
    if (is.null(procedure_occurrence_id)) {
      whereClauses <- c(whereClauses, "procedure_occurrence_id IS NULL")
    } else if (is(procedure_occurrence_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("procedure_occurrence_id = (", as.character(procedure_occurrence_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("procedure_occurrence_id = '", procedure_occurrence_id,"'"))
    }
  }

  if (!missing(currency_concept_id)) {
    if (is.null(currency_concept_id)) {
      whereClauses <- c(whereClauses, "currency_concept_id IS NULL")
    } else if (is(currency_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("currency_concept_id = (", as.character(currency_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("currency_concept_id = '", currency_concept_id,"'"))
    }
  }

  if (!missing(paid_copay)) {
    if (is.null(paid_copay)) {
      whereClauses <- c(whereClauses, "paid_copay IS NULL")
    } else if (is(paid_copay, "subQuery")){
      whereClasues <- c(whereClasues, paste0("paid_copay = (", as.character(paid_copay), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("paid_copay = '", paid_copay,"'"))
    }
  }

  if (!missing(paid_coinsurance)) {
    if (is.null(paid_coinsurance)) {
      whereClauses <- c(whereClauses, "paid_coinsurance IS NULL")
    } else if (is(paid_coinsurance, "subQuery")){
      whereClasues <- c(whereClasues, paste0("paid_coinsurance = (", as.character(paid_coinsurance), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("paid_coinsurance = '", paid_coinsurance,"'"))
    }
  }

  if (!missing(paid_toward_deductible)) {
    if (is.null(paid_toward_deductible)) {
      whereClauses <- c(whereClauses, "paid_toward_deductible IS NULL")
    } else if (is(paid_toward_deductible, "subQuery")){
      whereClasues <- c(whereClasues, paste0("paid_toward_deductible = (", as.character(paid_toward_deductible), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("paid_toward_deductible = '", paid_toward_deductible,"'"))
    }
  }

  if (!missing(paid_by_payer)) {
    if (is.null(paid_by_payer)) {
      whereClauses <- c(whereClauses, "paid_by_payer IS NULL")
    } else if (is(paid_by_payer, "subQuery")){
      whereClasues <- c(whereClasues, paste0("paid_by_payer = (", as.character(paid_by_payer), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("paid_by_payer = '", paid_by_payer,"'"))
    }
  }

  if (!missing(paid_by_coordination_benefits)) {
    if (is.null(paid_by_coordination_benefits)) {
      whereClauses <- c(whereClauses, "paid_by_coordination_benefits IS NULL")
    } else if (is(paid_by_coordination_benefits, "subQuery")){
      whereClasues <- c(whereClasues, paste0("paid_by_coordination_benefits = (", as.character(paid_by_coordination_benefits), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("paid_by_coordination_benefits = '", paid_by_coordination_benefits,"'"))
    }
  }

  if (!missing(total_out_of_pocket)) {
    if (is.null(total_out_of_pocket)) {
      whereClauses <- c(whereClauses, "total_out_of_pocket IS NULL")
    } else if (is(total_out_of_pocket, "subQuery")){
      whereClasues <- c(whereClasues, paste0("total_out_of_pocket = (", as.character(total_out_of_pocket), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("total_out_of_pocket = '", total_out_of_pocket,"'"))
    }
  }

  if (!missing(total_paid)) {
    if (is.null(total_paid)) {
      whereClauses <- c(whereClauses, "total_paid IS NULL")
    } else if (is(total_paid, "subQuery")){
      whereClasues <- c(whereClasues, paste0("total_paid = (", as.character(total_paid), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("total_paid = '", total_paid,"'"))
    }
  }

  if (!missing(revenue_code_concept_id)) {
    if (is.null(revenue_code_concept_id)) {
      whereClauses <- c(whereClauses, "revenue_code_concept_id IS NULL")
    } else if (is(revenue_code_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("revenue_code_concept_id = (", as.character(revenue_code_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("revenue_code_concept_id = '", revenue_code_concept_id,"'"))
    }
  }

  if (!missing(payer_plan_period_id)) {
    if (is.null(payer_plan_period_id)) {
      whereClauses <- c(whereClauses, "payer_plan_period_id IS NULL")
    } else if (is(payer_plan_period_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("payer_plan_period_id = (", as.character(payer_plan_period_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("payer_plan_period_id = '", payer_plan_period_id,"'"))
    }
  }

  if (!missing(revenue_code_source_value)) {
    if (is.null(revenue_code_source_value)) {
      whereClauses <- c(whereClauses, "revenue_code_source_value IS NULL")
    } else if (is(revenue_code_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("revenue_code_source_value = (", as.character(revenue_code_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("revenue_code_source_value = '", revenue_code_source_value,"'"))
    }
  }

  statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

expect_visit_cost <- function(visit_cost_id, visit_occurrence_id, currency_concept_id, paid_copay, paid_coinsurance, paid_toward_deductible, paid_by_payer, paid_by_coordination_benefits, total_out_of_pocket, total_paid, payer_plan_period_id) {

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

  statement <- paste0("INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT ", frameworkContext$testId, " AS id, '", testName, "' AS description, 'Expect visit_cost' AS test, ", source_pid, " as source_pid, ", cdm_pid, " as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.visit_cost WHERE ")
  whereClauses = NULL;
  if (!missing(visit_cost_id)) {
    if (is.null(visit_cost_id)) {
      whereClauses <- c(whereClauses, "visit_cost_id IS NULL")
    } else if (is(visit_cost_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("visit_cost_id = (", as.character(visit_cost_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_cost_id = '", visit_cost_id,"'"))
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (is.null(visit_occurrence_id)) {
      whereClauses <- c(whereClauses, "visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("visit_occurrence_id = (", as.character(visit_occurrence_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_occurrence_id = '", visit_occurrence_id,"'"))
    }
  }

  if (!missing(currency_concept_id)) {
    if (is.null(currency_concept_id)) {
      whereClauses <- c(whereClauses, "currency_concept_id IS NULL")
    } else if (is(currency_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("currency_concept_id = (", as.character(currency_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("currency_concept_id = '", currency_concept_id,"'"))
    }
  }

  if (!missing(paid_copay)) {
    if (is.null(paid_copay)) {
      whereClauses <- c(whereClauses, "paid_copay IS NULL")
    } else if (is(paid_copay, "subQuery")){
      whereClasues <- c(whereClasues, paste0("paid_copay = (", as.character(paid_copay), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("paid_copay = '", paid_copay,"'"))
    }
  }

  if (!missing(paid_coinsurance)) {
    if (is.null(paid_coinsurance)) {
      whereClauses <- c(whereClauses, "paid_coinsurance IS NULL")
    } else if (is(paid_coinsurance, "subQuery")){
      whereClasues <- c(whereClasues, paste0("paid_coinsurance = (", as.character(paid_coinsurance), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("paid_coinsurance = '", paid_coinsurance,"'"))
    }
  }

  if (!missing(paid_toward_deductible)) {
    if (is.null(paid_toward_deductible)) {
      whereClauses <- c(whereClauses, "paid_toward_deductible IS NULL")
    } else if (is(paid_toward_deductible, "subQuery")){
      whereClasues <- c(whereClasues, paste0("paid_toward_deductible = (", as.character(paid_toward_deductible), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("paid_toward_deductible = '", paid_toward_deductible,"'"))
    }
  }

  if (!missing(paid_by_payer)) {
    if (is.null(paid_by_payer)) {
      whereClauses <- c(whereClauses, "paid_by_payer IS NULL")
    } else if (is(paid_by_payer, "subQuery")){
      whereClasues <- c(whereClasues, paste0("paid_by_payer = (", as.character(paid_by_payer), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("paid_by_payer = '", paid_by_payer,"'"))
    }
  }

  if (!missing(paid_by_coordination_benefits)) {
    if (is.null(paid_by_coordination_benefits)) {
      whereClauses <- c(whereClauses, "paid_by_coordination_benefits IS NULL")
    } else if (is(paid_by_coordination_benefits, "subQuery")){
      whereClasues <- c(whereClasues, paste0("paid_by_coordination_benefits = (", as.character(paid_by_coordination_benefits), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("paid_by_coordination_benefits = '", paid_by_coordination_benefits,"'"))
    }
  }

  if (!missing(total_out_of_pocket)) {
    if (is.null(total_out_of_pocket)) {
      whereClauses <- c(whereClauses, "total_out_of_pocket IS NULL")
    } else if (is(total_out_of_pocket, "subQuery")){
      whereClasues <- c(whereClasues, paste0("total_out_of_pocket = (", as.character(total_out_of_pocket), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("total_out_of_pocket = '", total_out_of_pocket,"'"))
    }
  }

  if (!missing(total_paid)) {
    if (is.null(total_paid)) {
      whereClauses <- c(whereClauses, "total_paid IS NULL")
    } else if (is(total_paid, "subQuery")){
      whereClasues <- c(whereClasues, paste0("total_paid = (", as.character(total_paid), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("total_paid = '", total_paid,"'"))
    }
  }

  if (!missing(payer_plan_period_id)) {
    if (is.null(payer_plan_period_id)) {
      whereClauses <- c(whereClauses, "payer_plan_period_id IS NULL")
    } else if (is(payer_plan_period_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("payer_plan_period_id = (", as.character(payer_plan_period_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("payer_plan_period_id = '", payer_plan_period_id,"'"))
    }
  }

  statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

expect_drug_cost <- function(drug_cost_id, drug_exposure_id, currency_concept_id, paid_copay, paid_coinsurance, paid_toward_deductible, paid_by_payer, paid_by_coordination_benefits, total_out_of_pocket, total_paid, ingredient_cost, dispensing_fee, average_wholesale_price, payer_plan_period_id) {

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

  statement <- paste0("INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT ", frameworkContext$testId, " AS id, '", testName, "' AS description, 'Expect drug_cost' AS test, ", source_pid, " as source_pid, ", cdm_pid, " as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.drug_cost WHERE ")
  whereClauses = NULL;
  if (!missing(drug_cost_id)) {
    if (is.null(drug_cost_id)) {
      whereClauses <- c(whereClauses, "drug_cost_id IS NULL")
    } else if (is(drug_cost_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("drug_cost_id = (", as.character(drug_cost_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("drug_cost_id = '", drug_cost_id,"'"))
    }
  }

  if (!missing(drug_exposure_id)) {
    if (is.null(drug_exposure_id)) {
      whereClauses <- c(whereClauses, "drug_exposure_id IS NULL")
    } else if (is(drug_exposure_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("drug_exposure_id = (", as.character(drug_exposure_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("drug_exposure_id = '", drug_exposure_id,"'"))
    }
  }

  if (!missing(currency_concept_id)) {
    if (is.null(currency_concept_id)) {
      whereClauses <- c(whereClauses, "currency_concept_id IS NULL")
    } else if (is(currency_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("currency_concept_id = (", as.character(currency_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("currency_concept_id = '", currency_concept_id,"'"))
    }
  }

  if (!missing(paid_copay)) {
    if (is.null(paid_copay)) {
      whereClauses <- c(whereClauses, "paid_copay IS NULL")
    } else if (is(paid_copay, "subQuery")){
      whereClasues <- c(whereClasues, paste0("paid_copay = (", as.character(paid_copay), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("paid_copay = '", paid_copay,"'"))
    }
  }

  if (!missing(paid_coinsurance)) {
    if (is.null(paid_coinsurance)) {
      whereClauses <- c(whereClauses, "paid_coinsurance IS NULL")
    } else if (is(paid_coinsurance, "subQuery")){
      whereClasues <- c(whereClasues, paste0("paid_coinsurance = (", as.character(paid_coinsurance), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("paid_coinsurance = '", paid_coinsurance,"'"))
    }
  }

  if (!missing(paid_toward_deductible)) {
    if (is.null(paid_toward_deductible)) {
      whereClauses <- c(whereClauses, "paid_toward_deductible IS NULL")
    } else if (is(paid_toward_deductible, "subQuery")){
      whereClasues <- c(whereClasues, paste0("paid_toward_deductible = (", as.character(paid_toward_deductible), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("paid_toward_deductible = '", paid_toward_deductible,"'"))
    }
  }

  if (!missing(paid_by_payer)) {
    if (is.null(paid_by_payer)) {
      whereClauses <- c(whereClauses, "paid_by_payer IS NULL")
    } else if (is(paid_by_payer, "subQuery")){
      whereClasues <- c(whereClasues, paste0("paid_by_payer = (", as.character(paid_by_payer), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("paid_by_payer = '", paid_by_payer,"'"))
    }
  }

  if (!missing(paid_by_coordination_benefits)) {
    if (is.null(paid_by_coordination_benefits)) {
      whereClauses <- c(whereClauses, "paid_by_coordination_benefits IS NULL")
    } else if (is(paid_by_coordination_benefits, "subQuery")){
      whereClasues <- c(whereClasues, paste0("paid_by_coordination_benefits = (", as.character(paid_by_coordination_benefits), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("paid_by_coordination_benefits = '", paid_by_coordination_benefits,"'"))
    }
  }

  if (!missing(total_out_of_pocket)) {
    if (is.null(total_out_of_pocket)) {
      whereClauses <- c(whereClauses, "total_out_of_pocket IS NULL")
    } else if (is(total_out_of_pocket, "subQuery")){
      whereClasues <- c(whereClasues, paste0("total_out_of_pocket = (", as.character(total_out_of_pocket), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("total_out_of_pocket = '", total_out_of_pocket,"'"))
    }
  }

  if (!missing(total_paid)) {
    if (is.null(total_paid)) {
      whereClauses <- c(whereClauses, "total_paid IS NULL")
    } else if (is(total_paid, "subQuery")){
      whereClasues <- c(whereClasues, paste0("total_paid = (", as.character(total_paid), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("total_paid = '", total_paid,"'"))
    }
  }

  if (!missing(ingredient_cost)) {
    if (is.null(ingredient_cost)) {
      whereClauses <- c(whereClauses, "ingredient_cost IS NULL")
    } else if (is(ingredient_cost, "subQuery")){
      whereClasues <- c(whereClasues, paste0("ingredient_cost = (", as.character(ingredient_cost), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("ingredient_cost = '", ingredient_cost,"'"))
    }
  }

  if (!missing(dispensing_fee)) {
    if (is.null(dispensing_fee)) {
      whereClauses <- c(whereClauses, "dispensing_fee IS NULL")
    } else if (is(dispensing_fee, "subQuery")){
      whereClasues <- c(whereClasues, paste0("dispensing_fee = (", as.character(dispensing_fee), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("dispensing_fee = '", dispensing_fee,"'"))
    }
  }

  if (!missing(average_wholesale_price)) {
    if (is.null(average_wholesale_price)) {
      whereClauses <- c(whereClauses, "average_wholesale_price IS NULL")
    } else if (is(average_wholesale_price, "subQuery")){
      whereClasues <- c(whereClasues, paste0("average_wholesale_price = (", as.character(average_wholesale_price), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("average_wholesale_price = '", average_wholesale_price,"'"))
    }
  }

  if (!missing(payer_plan_period_id)) {
    if (is.null(payer_plan_period_id)) {
      whereClauses <- c(whereClauses, "payer_plan_period_id IS NULL")
    } else if (is(payer_plan_period_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("payer_plan_period_id = (", as.character(payer_plan_period_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("payer_plan_period_id = '", payer_plan_period_id,"'"))
    }
  }

  statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

expect_device_cost <- function(device_cost_id, device_exposure_id, currency_concept_id, paid_copay, paid_coinsurance, paid_toward_deductible, paid_by_payer, paid_by_coordination_benefits, total_out_of_pocket, total_paid, payer_plan_period_id) {

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

  statement <- paste0("INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT ", frameworkContext$testId, " AS id, '", testName, "' AS description, 'Expect device_cost' AS test, ", source_pid, " as source_pid, ", cdm_pid, " as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.device_cost WHERE ")
  whereClauses = NULL;
  if (!missing(device_cost_id)) {
    if (is.null(device_cost_id)) {
      whereClauses <- c(whereClauses, "device_cost_id IS NULL")
    } else if (is(device_cost_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("device_cost_id = (", as.character(device_cost_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("device_cost_id = '", device_cost_id,"'"))
    }
  }

  if (!missing(device_exposure_id)) {
    if (is.null(device_exposure_id)) {
      whereClauses <- c(whereClauses, "device_exposure_id IS NULL")
    } else if (is(device_exposure_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("device_exposure_id = (", as.character(device_exposure_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("device_exposure_id = '", device_exposure_id,"'"))
    }
  }

  if (!missing(currency_concept_id)) {
    if (is.null(currency_concept_id)) {
      whereClauses <- c(whereClauses, "currency_concept_id IS NULL")
    } else if (is(currency_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("currency_concept_id = (", as.character(currency_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("currency_concept_id = '", currency_concept_id,"'"))
    }
  }

  if (!missing(paid_copay)) {
    if (is.null(paid_copay)) {
      whereClauses <- c(whereClauses, "paid_copay IS NULL")
    } else if (is(paid_copay, "subQuery")){
      whereClasues <- c(whereClasues, paste0("paid_copay = (", as.character(paid_copay), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("paid_copay = '", paid_copay,"'"))
    }
  }

  if (!missing(paid_coinsurance)) {
    if (is.null(paid_coinsurance)) {
      whereClauses <- c(whereClauses, "paid_coinsurance IS NULL")
    } else if (is(paid_coinsurance, "subQuery")){
      whereClasues <- c(whereClasues, paste0("paid_coinsurance = (", as.character(paid_coinsurance), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("paid_coinsurance = '", paid_coinsurance,"'"))
    }
  }

  if (!missing(paid_toward_deductible)) {
    if (is.null(paid_toward_deductible)) {
      whereClauses <- c(whereClauses, "paid_toward_deductible IS NULL")
    } else if (is(paid_toward_deductible, "subQuery")){
      whereClasues <- c(whereClasues, paste0("paid_toward_deductible = (", as.character(paid_toward_deductible), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("paid_toward_deductible = '", paid_toward_deductible,"'"))
    }
  }

  if (!missing(paid_by_payer)) {
    if (is.null(paid_by_payer)) {
      whereClauses <- c(whereClauses, "paid_by_payer IS NULL")
    } else if (is(paid_by_payer, "subQuery")){
      whereClasues <- c(whereClasues, paste0("paid_by_payer = (", as.character(paid_by_payer), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("paid_by_payer = '", paid_by_payer,"'"))
    }
  }

  if (!missing(paid_by_coordination_benefits)) {
    if (is.null(paid_by_coordination_benefits)) {
      whereClauses <- c(whereClauses, "paid_by_coordination_benefits IS NULL")
    } else if (is(paid_by_coordination_benefits, "subQuery")){
      whereClasues <- c(whereClasues, paste0("paid_by_coordination_benefits = (", as.character(paid_by_coordination_benefits), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("paid_by_coordination_benefits = '", paid_by_coordination_benefits,"'"))
    }
  }

  if (!missing(total_out_of_pocket)) {
    if (is.null(total_out_of_pocket)) {
      whereClauses <- c(whereClauses, "total_out_of_pocket IS NULL")
    } else if (is(total_out_of_pocket, "subQuery")){
      whereClasues <- c(whereClasues, paste0("total_out_of_pocket = (", as.character(total_out_of_pocket), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("total_out_of_pocket = '", total_out_of_pocket,"'"))
    }
  }

  if (!missing(total_paid)) {
    if (is.null(total_paid)) {
      whereClauses <- c(whereClauses, "total_paid IS NULL")
    } else if (is(total_paid, "subQuery")){
      whereClasues <- c(whereClasues, paste0("total_paid = (", as.character(total_paid), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("total_paid = '", total_paid,"'"))
    }
  }

  if (!missing(payer_plan_period_id)) {
    if (is.null(payer_plan_period_id)) {
      whereClauses <- c(whereClauses, "payer_plan_period_id IS NULL")
    } else if (is(payer_plan_period_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("payer_plan_period_id = (", as.character(payer_plan_period_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("payer_plan_period_id = '", payer_plan_period_id,"'"))
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
      whereClasues <- c(whereClasues, paste0("drug_era_id = (", as.character(drug_era_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("drug_era_id = '", drug_era_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(drug_concept_id)) {
    if (is.null(drug_concept_id)) {
      whereClauses <- c(whereClauses, "drug_concept_id IS NULL")
    } else if (is(drug_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("drug_concept_id = (", as.character(drug_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("drug_concept_id = '", drug_concept_id,"'"))
    }
  }

  if (!missing(drug_era_start_date)) {
    if (is.null(drug_era_start_date)) {
      whereClauses <- c(whereClauses, "drug_era_start_date IS NULL")
    } else if (is(drug_era_start_date, "subQuery")){
      whereClasues <- c(whereClasues, paste0("drug_era_start_date = (", as.character(drug_era_start_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("drug_era_start_date = '", drug_era_start_date,"'"))
    }
  }

  if (!missing(drug_era_end_date)) {
    if (is.null(drug_era_end_date)) {
      whereClauses <- c(whereClauses, "drug_era_end_date IS NULL")
    } else if (is(drug_era_end_date, "subQuery")){
      whereClasues <- c(whereClasues, paste0("drug_era_end_date = (", as.character(drug_era_end_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("drug_era_end_date = '", drug_era_end_date,"'"))
    }
  }

  if (!missing(drug_exposure_count)) {
    if (is.null(drug_exposure_count)) {
      whereClauses <- c(whereClauses, "drug_exposure_count IS NULL")
    } else if (is(drug_exposure_count, "subQuery")){
      whereClasues <- c(whereClasues, paste0("drug_exposure_count = (", as.character(drug_exposure_count), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("drug_exposure_count = '", drug_exposure_count,"'"))
    }
  }

  if (!missing(gap_days)) {
    if (is.null(gap_days)) {
      whereClauses <- c(whereClauses, "gap_days IS NULL")
    } else if (is(gap_days, "subQuery")){
      whereClasues <- c(whereClasues, paste0("gap_days = (", as.character(gap_days), ")"))
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
      whereClasues <- c(whereClasues, paste0("dose_era_id = (", as.character(dose_era_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("dose_era_id = '", dose_era_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(drug_concept_id)) {
    if (is.null(drug_concept_id)) {
      whereClauses <- c(whereClauses, "drug_concept_id IS NULL")
    } else if (is(drug_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("drug_concept_id = (", as.character(drug_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("drug_concept_id = '", drug_concept_id,"'"))
    }
  }

  if (!missing(unit_concept_id)) {
    if (is.null(unit_concept_id)) {
      whereClauses <- c(whereClauses, "unit_concept_id IS NULL")
    } else if (is(unit_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("unit_concept_id = (", as.character(unit_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("unit_concept_id = '", unit_concept_id,"'"))
    }
  }

  if (!missing(dose_value)) {
    if (is.null(dose_value)) {
      whereClauses <- c(whereClauses, "dose_value IS NULL")
    } else if (is(dose_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("dose_value = (", as.character(dose_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("dose_value = '", dose_value,"'"))
    }
  }

  if (!missing(dose_era_start_date)) {
    if (is.null(dose_era_start_date)) {
      whereClauses <- c(whereClauses, "dose_era_start_date IS NULL")
    } else if (is(dose_era_start_date, "subQuery")){
      whereClasues <- c(whereClasues, paste0("dose_era_start_date = (", as.character(dose_era_start_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("dose_era_start_date = '", dose_era_start_date,"'"))
    }
  }

  if (!missing(dose_era_end_date)) {
    if (is.null(dose_era_end_date)) {
      whereClauses <- c(whereClauses, "dose_era_end_date IS NULL")
    } else if (is(dose_era_end_date, "subQuery")){
      whereClasues <- c(whereClasues, paste0("dose_era_end_date = (", as.character(dose_era_end_date), ")"))
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
      whereClasues <- c(whereClasues, paste0("condition_era_id = (", as.character(condition_era_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("condition_era_id = '", condition_era_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(condition_concept_id)) {
    if (is.null(condition_concept_id)) {
      whereClauses <- c(whereClauses, "condition_concept_id IS NULL")
    } else if (is(condition_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("condition_concept_id = (", as.character(condition_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("condition_concept_id = '", condition_concept_id,"'"))
    }
  }

  if (!missing(condition_era_start_date)) {
    if (is.null(condition_era_start_date)) {
      whereClauses <- c(whereClauses, "condition_era_start_date IS NULL")
    } else if (is(condition_era_start_date, "subQuery")){
      whereClasues <- c(whereClasues, paste0("condition_era_start_date = (", as.character(condition_era_start_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("condition_era_start_date = '", condition_era_start_date,"'"))
    }
  }

  if (!missing(condition_era_end_date)) {
    if (is.null(condition_era_end_date)) {
      whereClauses <- c(whereClauses, "condition_era_end_date IS NULL")
    } else if (is(condition_era_end_date, "subQuery")){
      whereClasues <- c(whereClasues, paste0("condition_era_end_date = (", as.character(condition_era_end_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("condition_era_end_date = '", condition_era_end_date,"'"))
    }
  }

  if (!missing(condition_occurrence_count)) {
    if (is.null(condition_occurrence_count)) {
      whereClauses <- c(whereClauses, "condition_occurrence_count IS NULL")
    } else if (is(condition_occurrence_count, "subQuery")){
      whereClasues <- c(whereClasues, paste0("condition_occurrence_count = (", as.character(condition_occurrence_count), ")"))
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
      whereClasues <- c(whereClasues, paste0("cdm_source_name = (", as.character(cdm_source_name), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cdm_source_name = '", cdm_source_name,"'"))
    }
  }

  if (!missing(cdm_source_abbreviation)) {
    if (is.null(cdm_source_abbreviation)) {
      whereClauses <- c(whereClauses, "cdm_source_abbreviation IS NULL")
    } else if (is(cdm_source_abbreviation, "subQuery")){
      whereClasues <- c(whereClasues, paste0("cdm_source_abbreviation = (", as.character(cdm_source_abbreviation), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cdm_source_abbreviation = '", cdm_source_abbreviation,"'"))
    }
  }

  if (!missing(cdm_holder)) {
    if (is.null(cdm_holder)) {
      whereClauses <- c(whereClauses, "cdm_holder IS NULL")
    } else if (is(cdm_holder, "subQuery")){
      whereClasues <- c(whereClasues, paste0("cdm_holder = (", as.character(cdm_holder), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cdm_holder = '", cdm_holder,"'"))
    }
  }

  if (!missing(source_description)) {
    if (is.null(source_description)) {
      whereClauses <- c(whereClauses, "source_description IS NULL")
    } else if (is(source_description, "subQuery")){
      whereClasues <- c(whereClasues, paste0("source_description = (", as.character(source_description), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("source_description = '", source_description,"'"))
    }
  }

  if (!missing(source_documentation_reference)) {
    if (is.null(source_documentation_reference)) {
      whereClauses <- c(whereClauses, "source_documentation_reference IS NULL")
    } else if (is(source_documentation_reference, "subQuery")){
      whereClasues <- c(whereClasues, paste0("source_documentation_reference = (", as.character(source_documentation_reference), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("source_documentation_reference = '", source_documentation_reference,"'"))
    }
  }

  if (!missing(cdm_etl_reference)) {
    if (is.null(cdm_etl_reference)) {
      whereClauses <- c(whereClauses, "cdm_etl_reference IS NULL")
    } else if (is(cdm_etl_reference, "subQuery")){
      whereClasues <- c(whereClasues, paste0("cdm_etl_reference = (", as.character(cdm_etl_reference), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cdm_etl_reference = '", cdm_etl_reference,"'"))
    }
  }

  if (!missing(source_release_date)) {
    if (is.null(source_release_date)) {
      whereClauses <- c(whereClauses, "source_release_date IS NULL")
    } else if (is(source_release_date, "subQuery")){
      whereClasues <- c(whereClasues, paste0("source_release_date = (", as.character(source_release_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("source_release_date = '", source_release_date,"'"))
    }
  }

  if (!missing(cdm_release_date)) {
    if (is.null(cdm_release_date)) {
      whereClauses <- c(whereClauses, "cdm_release_date IS NULL")
    } else if (is(cdm_release_date, "subQuery")){
      whereClasues <- c(whereClasues, paste0("cdm_release_date = (", as.character(cdm_release_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cdm_release_date = '", cdm_release_date,"'"))
    }
  }

  if (!missing(cdm_version)) {
    if (is.null(cdm_version)) {
      whereClauses <- c(whereClauses, "cdm_version IS NULL")
    } else if (is(cdm_version, "subQuery")){
      whereClasues <- c(whereClasues, paste0("cdm_version = (", as.character(cdm_version), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cdm_version = '", cdm_version,"'"))
    }
  }

  if (!missing(vocabulary_version)) {
    if (is.null(vocabulary_version)) {
      whereClauses <- c(whereClauses, "vocabulary_version IS NULL")
    } else if (is(vocabulary_version, "subQuery")){
      whereClasues <- c(whereClasues, paste0("vocabulary_version = (", as.character(vocabulary_version), ")"))
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
      whereClasues <- c(whereClasues, paste0("cohort_definition_id = (", as.character(cohort_definition_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cohort_definition_id = '", cohort_definition_id,"'"))
    }
  }

  if (!missing(subject_id)) {
    if (is.null(subject_id)) {
      whereClauses <- c(whereClauses, "subject_id IS NULL")
    } else if (is(subject_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("subject_id = (", as.character(subject_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("subject_id = '", subject_id,"'"))
    }
  }

  if (!missing(cohort_start_date)) {
    if (is.null(cohort_start_date)) {
      whereClauses <- c(whereClauses, "cohort_start_date IS NULL")
    } else if (is(cohort_start_date, "subQuery")){
      whereClasues <- c(whereClasues, paste0("cohort_start_date = (", as.character(cohort_start_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cohort_start_date = '", cohort_start_date,"'"))
    }
  }

  if (!missing(cohort_end_date)) {
    if (is.null(cohort_end_date)) {
      whereClauses <- c(whereClauses, "cohort_end_date IS NULL")
    } else if (is(cohort_end_date, "subQuery")){
      whereClasues <- c(whereClasues, paste0("cohort_end_date = (", as.character(cohort_end_date), ")"))
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
      whereClasues <- c(whereClasues, paste0("cohort_definition_id = (", as.character(cohort_definition_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cohort_definition_id = '", cohort_definition_id,"'"))
    }
  }

  if (!missing(cohort_definition_name)) {
    if (is.null(cohort_definition_name)) {
      whereClauses <- c(whereClauses, "cohort_definition_name IS NULL")
    } else if (is(cohort_definition_name, "subQuery")){
      whereClasues <- c(whereClasues, paste0("cohort_definition_name = (", as.character(cohort_definition_name), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cohort_definition_name = '", cohort_definition_name,"'"))
    }
  }

  if (!missing(cohort_definition_description)) {
    if (is.null(cohort_definition_description)) {
      whereClauses <- c(whereClauses, "cohort_definition_description IS NULL")
    } else if (is(cohort_definition_description, "subQuery")){
      whereClasues <- c(whereClasues, paste0("cohort_definition_description = (", as.character(cohort_definition_description), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cohort_definition_description = '", cohort_definition_description,"'"))
    }
  }

  if (!missing(definition_type_concept_id)) {
    if (is.null(definition_type_concept_id)) {
      whereClauses <- c(whereClauses, "definition_type_concept_id IS NULL")
    } else if (is(definition_type_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("definition_type_concept_id = (", as.character(definition_type_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("definition_type_concept_id = '", definition_type_concept_id,"'"))
    }
  }

  if (!missing(cohort_definition_syntax)) {
    if (is.null(cohort_definition_syntax)) {
      whereClauses <- c(whereClauses, "cohort_definition_syntax IS NULL")
    } else if (is(cohort_definition_syntax, "subQuery")){
      whereClasues <- c(whereClasues, paste0("cohort_definition_syntax = (", as.character(cohort_definition_syntax), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cohort_definition_syntax = '", cohort_definition_syntax,"'"))
    }
  }

  if (!missing(subject_concept_id)) {
    if (is.null(subject_concept_id)) {
      whereClauses <- c(whereClauses, "subject_concept_id IS NULL")
    } else if (is(subject_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("subject_concept_id = (", as.character(subject_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("subject_concept_id = '", subject_concept_id,"'"))
    }
  }

  if (!missing(cohort_instantiation_date)) {
    if (is.null(cohort_instantiation_date)) {
      whereClauses <- c(whereClauses, "cohort_instantiation_date IS NULL")
    } else if (is(cohort_instantiation_date, "subQuery")){
      whereClasues <- c(whereClasues, paste0("cohort_instantiation_date = (", as.character(cohort_instantiation_date), ")"))
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
      whereClasues <- c(whereClasues, paste0("cohort_definition_id = (", as.character(cohort_definition_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cohort_definition_id = '", cohort_definition_id,"'"))
    }
  }

  if (!missing(cohort_start_date)) {
    if (is.null(cohort_start_date)) {
      whereClauses <- c(whereClauses, "cohort_start_date IS NULL")
    } else if (is(cohort_start_date, "subQuery")){
      whereClasues <- c(whereClasues, paste0("cohort_start_date = (", as.character(cohort_start_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cohort_start_date = '", cohort_start_date,"'"))
    }
  }

  if (!missing(cohort_end_date)) {
    if (is.null(cohort_end_date)) {
      whereClauses <- c(whereClauses, "cohort_end_date IS NULL")
    } else if (is(cohort_end_date, "subQuery")){
      whereClasues <- c(whereClasues, paste0("cohort_end_date = (", as.character(cohort_end_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cohort_end_date = '", cohort_end_date,"'"))
    }
  }

  if (!missing(subject_id)) {
    if (is.null(subject_id)) {
      whereClauses <- c(whereClauses, "subject_id IS NULL")
    } else if (is(subject_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("subject_id = (", as.character(subject_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("subject_id = '", subject_id,"'"))
    }
  }

  if (!missing(attribute_definition_id)) {
    if (is.null(attribute_definition_id)) {
      whereClauses <- c(whereClauses, "attribute_definition_id IS NULL")
    } else if (is(attribute_definition_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("attribute_definition_id = (", as.character(attribute_definition_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("attribute_definition_id = '", attribute_definition_id,"'"))
    }
  }

  if (!missing(value_as_number)) {
    if (is.null(value_as_number)) {
      whereClauses <- c(whereClauses, "value_as_number IS NULL")
    } else if (is(value_as_number, "subQuery")){
      whereClasues <- c(whereClasues, paste0("value_as_number = (", as.character(value_as_number), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("value_as_number = '", value_as_number,"'"))
    }
  }

  if (!missing(value_as_concept_id)) {
    if (is.null(value_as_concept_id)) {
      whereClauses <- c(whereClauses, "value_as_concept_id IS NULL")
    } else if (is(value_as_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("value_as_concept_id = (", as.character(value_as_concept_id), ")"))
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
      whereClasues <- c(whereClasues, paste0("attribute_definition_id = (", as.character(attribute_definition_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("attribute_definition_id = '", attribute_definition_id,"'"))
    }
  }

  if (!missing(attribute_name)) {
    if (is.null(attribute_name)) {
      whereClauses <- c(whereClauses, "attribute_name IS NULL")
    } else if (is(attribute_name, "subQuery")){
      whereClasues <- c(whereClasues, paste0("attribute_name = (", as.character(attribute_name), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("attribute_name = '", attribute_name,"'"))
    }
  }

  if (!missing(attribute_description)) {
    if (is.null(attribute_description)) {
      whereClauses <- c(whereClauses, "attribute_description IS NULL")
    } else if (is(attribute_description, "subQuery")){
      whereClasues <- c(whereClasues, paste0("attribute_description = (", as.character(attribute_description), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("attribute_description = '", attribute_description,"'"))
    }
  }

  if (!missing(attribute_type_concept_id)) {
    if (is.null(attribute_type_concept_id)) {
      whereClauses <- c(whereClauses, "attribute_type_concept_id IS NULL")
    } else if (is(attribute_type_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("attribute_type_concept_id = (", as.character(attribute_type_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("attribute_type_concept_id = '", attribute_type_concept_id,"'"))
    }
  }

  if (!missing(attribute_syntax)) {
    if (is.null(attribute_syntax)) {
      whereClauses <- c(whereClauses, "attribute_syntax IS NULL")
    } else if (is(attribute_syntax, "subQuery")){
      whereClasues <- c(whereClasues, paste0("attribute_syntax = (", as.character(attribute_syntax), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("attribute_syntax = '", attribute_syntax,"'"))
    }
  }

  statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
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
      whereClasues <- c(whereClasues, paste0("provider_id = (", as.character(provider_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("provider_id = '", provider_id,"'"))
    }
  }

  if (!missing(provider_name)) {
    if (is.null(provider_name)) {
      whereClauses <- c(whereClauses, "provider_name IS NULL")
    } else if (is(provider_name, "subQuery")){
      whereClasues <- c(whereClasues, paste0("provider_name = (", as.character(provider_name), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("provider_name = '", provider_name,"'"))
    }
  }

  if (!missing(npi)) {
    if (is.null(npi)) {
      whereClauses <- c(whereClauses, "npi IS NULL")
    } else if (is(npi, "subQuery")){
      whereClasues <- c(whereClasues, paste0("npi = (", as.character(npi), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("npi = '", npi,"'"))
    }
  }

  if (!missing(dea)) {
    if (is.null(dea)) {
      whereClauses <- c(whereClauses, "dea IS NULL")
    } else if (is(dea, "subQuery")){
      whereClasues <- c(whereClasues, paste0("dea = (", as.character(dea), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("dea = '", dea,"'"))
    }
  }

  if (!missing(specialty_concept_id)) {
    if (is.null(specialty_concept_id)) {
      whereClauses <- c(whereClauses, "specialty_concept_id IS NULL")
    } else if (is(specialty_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("specialty_concept_id = (", as.character(specialty_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("specialty_concept_id = '", specialty_concept_id,"'"))
    }
  }

  if (!missing(care_site_id)) {
    if (is.null(care_site_id)) {
      whereClauses <- c(whereClauses, "care_site_id IS NULL")
    } else if (is(care_site_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("care_site_id = (", as.character(care_site_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("care_site_id = '", care_site_id,"'"))
    }
  }

  if (!missing(year_of_birth)) {
    if (is.null(year_of_birth)) {
      whereClauses <- c(whereClauses, "year_of_birth IS NULL")
    } else if (is(year_of_birth, "subQuery")){
      whereClasues <- c(whereClasues, paste0("year_of_birth = (", as.character(year_of_birth), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("year_of_birth = '", year_of_birth,"'"))
    }
  }

  if (!missing(gender_concept_id)) {
    if (is.null(gender_concept_id)) {
      whereClauses <- c(whereClauses, "gender_concept_id IS NULL")
    } else if (is(gender_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("gender_concept_id = (", as.character(gender_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("gender_concept_id = '", gender_concept_id,"'"))
    }
  }

  if (!missing(provider_source_value)) {
    if (is.null(provider_source_value)) {
      whereClauses <- c(whereClauses, "provider_source_value IS NULL")
    } else if (is(provider_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("provider_source_value = (", as.character(provider_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("provider_source_value = '", provider_source_value,"'"))
    }
  }

  if (!missing(specialty_source_value)) {
    if (is.null(specialty_source_value)) {
      whereClauses <- c(whereClauses, "specialty_source_value IS NULL")
    } else if (is(specialty_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("specialty_source_value = (", as.character(specialty_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("specialty_source_value = '", specialty_source_value,"'"))
    }
  }

  if (!missing(specialty_source_concept_id)) {
    if (is.null(specialty_source_concept_id)) {
      whereClauses <- c(whereClauses, "specialty_source_concept_id IS NULL")
    } else if (is(specialty_source_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("specialty_source_concept_id = (", as.character(specialty_source_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("specialty_source_concept_id = '", specialty_source_concept_id,"'"))
    }
  }

  if (!missing(gender_source_value)) {
    if (is.null(gender_source_value)) {
      whereClauses <- c(whereClauses, "gender_source_value IS NULL")
    } else if (is(gender_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("gender_source_value = (", as.character(gender_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("gender_source_value = '", gender_source_value,"'"))
    }
  }

  if (!missing(gender_source_concept_id)) {
    if (is.null(gender_source_concept_id)) {
      whereClauses <- c(whereClauses, "gender_source_concept_id IS NULL")
    } else if (is(gender_source_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("gender_source_concept_id = (", as.character(gender_source_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("gender_source_concept_id = '", gender_source_concept_id,"'"))
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
      whereClasues <- c(whereClasues, paste0("care_site_id = (", as.character(care_site_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("care_site_id = '", care_site_id,"'"))
    }
  }

  if (!missing(care_site_name)) {
    if (is.null(care_site_name)) {
      whereClauses <- c(whereClauses, "care_site_name IS NULL")
    } else if (is(care_site_name, "subQuery")){
      whereClasues <- c(whereClasues, paste0("care_site_name = (", as.character(care_site_name), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("care_site_name = '", care_site_name,"'"))
    }
  }

  if (!missing(place_of_service_concept_id)) {
    if (is.null(place_of_service_concept_id)) {
      whereClauses <- c(whereClauses, "place_of_service_concept_id IS NULL")
    } else if (is(place_of_service_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("place_of_service_concept_id = (", as.character(place_of_service_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("place_of_service_concept_id = '", place_of_service_concept_id,"'"))
    }
  }

  if (!missing(location_id)) {
    if (is.null(location_id)) {
      whereClauses <- c(whereClauses, "location_id IS NULL")
    } else if (is(location_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("location_id = (", as.character(location_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("location_id = '", location_id,"'"))
    }
  }

  if (!missing(care_site_source_value)) {
    if (is.null(care_site_source_value)) {
      whereClauses <- c(whereClauses, "care_site_source_value IS NULL")
    } else if (is(care_site_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("care_site_source_value = (", as.character(care_site_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("care_site_source_value = '", care_site_source_value,"'"))
    }
  }

  if (!missing(place_of_service_source_value)) {
    if (is.null(place_of_service_source_value)) {
      whereClauses <- c(whereClauses, "place_of_service_source_value IS NULL")
    } else if (is(place_of_service_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("place_of_service_source_value = (", as.character(place_of_service_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("place_of_service_source_value = '", place_of_service_source_value,"'"))
    }
  }

  statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
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
      whereClasues <- c(whereClasues, paste0("location_id = (", as.character(location_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("location_id = '", location_id,"'"))
    }
  }

  if (!missing(address_1)) {
    if (is.null(address_1)) {
      whereClauses <- c(whereClauses, "address_1 IS NULL")
    } else if (is(address_1, "subQuery")){
      whereClasues <- c(whereClasues, paste0("address_1 = (", as.character(address_1), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("address_1 = '", address_1,"'"))
    }
  }

  if (!missing(address_2)) {
    if (is.null(address_2)) {
      whereClauses <- c(whereClauses, "address_2 IS NULL")
    } else if (is(address_2, "subQuery")){
      whereClasues <- c(whereClasues, paste0("address_2 = (", as.character(address_2), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("address_2 = '", address_2,"'"))
    }
  }

  if (!missing(city)) {
    if (is.null(city)) {
      whereClauses <- c(whereClauses, "city IS NULL")
    } else if (is(city, "subQuery")){
      whereClasues <- c(whereClasues, paste0("city = (", as.character(city), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("city = '", city,"'"))
    }
  }

  if (!missing(state)) {
    if (is.null(state)) {
      whereClauses <- c(whereClauses, "state IS NULL")
    } else if (is(state, "subQuery")){
      whereClasues <- c(whereClasues, paste0("state = (", as.character(state), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("state = '", state,"'"))
    }
  }

  if (!missing(zip)) {
    if (is.null(zip)) {
      whereClauses <- c(whereClauses, "zip IS NULL")
    } else if (is(zip, "subQuery")){
      whereClasues <- c(whereClasues, paste0("zip = (", as.character(zip), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("zip = '", zip,"'"))
    }
  }

  if (!missing(county)) {
    if (is.null(county)) {
      whereClauses <- c(whereClauses, "county IS NULL")
    } else if (is(county, "subQuery")){
      whereClasues <- c(whereClasues, paste0("county = (", as.character(county), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("county = '", county,"'"))
    }
  }

  if (!missing(location_source_value)) {
    if (is.null(location_source_value)) {
      whereClauses <- c(whereClauses, "location_source_value IS NULL")
    } else if (is(location_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("location_source_value = (", as.character(location_source_value), ")"))
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
      whereClasues <- c(whereClasues, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(gender_concept_id)) {
    if (is.null(gender_concept_id)) {
      whereClauses <- c(whereClauses, "gender_concept_id IS NULL")
    } else if (is(gender_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("gender_concept_id = (", as.character(gender_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("gender_concept_id = '", gender_concept_id,"'"))
    }
  }

  if (!missing(year_of_birth)) {
    if (is.null(year_of_birth)) {
      whereClauses <- c(whereClauses, "year_of_birth IS NULL")
    } else if (is(year_of_birth, "subQuery")){
      whereClasues <- c(whereClasues, paste0("year_of_birth = (", as.character(year_of_birth), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("year_of_birth = '", year_of_birth,"'"))
    }
  }

  if (!missing(month_of_birth)) {
    if (is.null(month_of_birth)) {
      whereClauses <- c(whereClauses, "month_of_birth IS NULL")
    } else if (is(month_of_birth, "subQuery")){
      whereClasues <- c(whereClasues, paste0("month_of_birth = (", as.character(month_of_birth), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("month_of_birth = '", month_of_birth,"'"))
    }
  }

  if (!missing(day_of_birth)) {
    if (is.null(day_of_birth)) {
      whereClauses <- c(whereClauses, "day_of_birth IS NULL")
    } else if (is(day_of_birth, "subQuery")){
      whereClasues <- c(whereClasues, paste0("day_of_birth = (", as.character(day_of_birth), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("day_of_birth = '", day_of_birth,"'"))
    }
  }

  if (!missing(time_of_birth)) {
    if (is.null(time_of_birth)) {
      whereClauses <- c(whereClauses, "time_of_birth IS NULL")
    } else if (is(time_of_birth, "subQuery")){
      whereClasues <- c(whereClasues, paste0("time_of_birth = (", as.character(time_of_birth), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("time_of_birth = '", time_of_birth,"'"))
    }
  }

  if (!missing(race_concept_id)) {
    if (is.null(race_concept_id)) {
      whereClauses <- c(whereClauses, "race_concept_id IS NULL")
    } else if (is(race_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("race_concept_id = (", as.character(race_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("race_concept_id = '", race_concept_id,"'"))
    }
  }

  if (!missing(ethnicity_concept_id)) {
    if (is.null(ethnicity_concept_id)) {
      whereClauses <- c(whereClauses, "ethnicity_concept_id IS NULL")
    } else if (is(ethnicity_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("ethnicity_concept_id = (", as.character(ethnicity_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("ethnicity_concept_id = '", ethnicity_concept_id,"'"))
    }
  }

  if (!missing(location_id)) {
    if (is.null(location_id)) {
      whereClauses <- c(whereClauses, "location_id IS NULL")
    } else if (is(location_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("location_id = (", as.character(location_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("location_id = '", location_id,"'"))
    }
  }

  if (!missing(provider_id)) {
    if (is.null(provider_id)) {
      whereClauses <- c(whereClauses, "provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("provider_id = (", as.character(provider_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("provider_id = '", provider_id,"'"))
    }
  }

  if (!missing(care_site_id)) {
    if (is.null(care_site_id)) {
      whereClauses <- c(whereClauses, "care_site_id IS NULL")
    } else if (is(care_site_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("care_site_id = (", as.character(care_site_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("care_site_id = '", care_site_id,"'"))
    }
  }

  if (!missing(person_source_value)) {
    if (is.null(person_source_value)) {
      whereClauses <- c(whereClauses, "person_source_value IS NULL")
    } else if (is(person_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("person_source_value = (", as.character(person_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_source_value = '", person_source_value,"'"))
    }
  }

  if (!missing(gender_source_value)) {
    if (is.null(gender_source_value)) {
      whereClauses <- c(whereClauses, "gender_source_value IS NULL")
    } else if (is(gender_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("gender_source_value = (", as.character(gender_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("gender_source_value = '", gender_source_value,"'"))
    }
  }

  if (!missing(gender_source_concept_id)) {
    if (is.null(gender_source_concept_id)) {
      whereClauses <- c(whereClauses, "gender_source_concept_id IS NULL")
    } else if (is(gender_source_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("gender_source_concept_id = (", as.character(gender_source_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("gender_source_concept_id = '", gender_source_concept_id,"'"))
    }
  }

  if (!missing(race_source_value)) {
    if (is.null(race_source_value)) {
      whereClauses <- c(whereClauses, "race_source_value IS NULL")
    } else if (is(race_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("race_source_value = (", as.character(race_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("race_source_value = '", race_source_value,"'"))
    }
  }

  if (!missing(race_source_concept_id)) {
    if (is.null(race_source_concept_id)) {
      whereClauses <- c(whereClauses, "race_source_concept_id IS NULL")
    } else if (is(race_source_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("race_source_concept_id = (", as.character(race_source_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("race_source_concept_id = '", race_source_concept_id,"'"))
    }
  }

  if (!missing(ethnicity_source_value)) {
    if (is.null(ethnicity_source_value)) {
      whereClauses <- c(whereClauses, "ethnicity_source_value IS NULL")
    } else if (is(ethnicity_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("ethnicity_source_value = (", as.character(ethnicity_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("ethnicity_source_value = '", ethnicity_source_value,"'"))
    }
  }

  if (!missing(ethnicity_source_concept_id)) {
    if (is.null(ethnicity_source_concept_id)) {
      whereClauses <- c(whereClauses, "ethnicity_source_concept_id IS NULL")
    } else if (is(ethnicity_source_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("ethnicity_source_concept_id = (", as.character(ethnicity_source_concept_id), ")"))
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
      whereClasues <- c(whereClasues, paste0("observation_period_id = (", as.character(observation_period_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("observation_period_id = '", observation_period_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(observation_period_start_date)) {
    if (is.null(observation_period_start_date)) {
      whereClauses <- c(whereClauses, "observation_period_start_date IS NULL")
    } else if (is(observation_period_start_date, "subQuery")){
      whereClasues <- c(whereClasues, paste0("observation_period_start_date = (", as.character(observation_period_start_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("observation_period_start_date = '", observation_period_start_date,"'"))
    }
  }

  if (!missing(observation_period_end_date)) {
    if (is.null(observation_period_end_date)) {
      whereClauses <- c(whereClauses, "observation_period_end_date IS NULL")
    } else if (is(observation_period_end_date, "subQuery")){
      whereClasues <- c(whereClasues, paste0("observation_period_end_date = (", as.character(observation_period_end_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("observation_period_end_date = '", observation_period_end_date,"'"))
    }
  }

  if (!missing(period_type_concept_id)) {
    if (is.null(period_type_concept_id)) {
      whereClauses <- c(whereClauses, "period_type_concept_id IS NULL")
    } else if (is(period_type_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("period_type_concept_id = (", as.character(period_type_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("period_type_concept_id = '", period_type_concept_id,"'"))
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
      whereClasues <- c(whereClasues, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(death_date)) {
    if (is.null(death_date)) {
      whereClauses <- c(whereClauses, "death_date IS NULL")
    } else if (is(death_date, "subQuery")){
      whereClasues <- c(whereClasues, paste0("death_date = (", as.character(death_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("death_date = '", death_date,"'"))
    }
  }

  if (!missing(death_type_concept_id)) {
    if (is.null(death_type_concept_id)) {
      whereClauses <- c(whereClauses, "death_type_concept_id IS NULL")
    } else if (is(death_type_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("death_type_concept_id = (", as.character(death_type_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("death_type_concept_id = '", death_type_concept_id,"'"))
    }
  }

  if (!missing(cause_concept_id)) {
    if (is.null(cause_concept_id)) {
      whereClauses <- c(whereClauses, "cause_concept_id IS NULL")
    } else if (is(cause_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("cause_concept_id = (", as.character(cause_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cause_concept_id = '", cause_concept_id,"'"))
    }
  }

  if (!missing(cause_source_value)) {
    if (is.null(cause_source_value)) {
      whereClauses <- c(whereClauses, "cause_source_value IS NULL")
    } else if (is(cause_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("cause_source_value = (", as.character(cause_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cause_source_value = '", cause_source_value,"'"))
    }
  }

  if (!missing(cause_source_concept_id)) {
    if (is.null(cause_source_concept_id)) {
      whereClauses <- c(whereClauses, "cause_source_concept_id IS NULL")
    } else if (is(cause_source_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("cause_source_concept_id = (", as.character(cause_source_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cause_source_concept_id = '", cause_source_concept_id,"'"))
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
      whereClasues <- c(whereClasues, paste0("visit_occurrence_id = (", as.character(visit_occurrence_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_occurrence_id = '", visit_occurrence_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(visit_concept_id)) {
    if (is.null(visit_concept_id)) {
      whereClauses <- c(whereClauses, "visit_concept_id IS NULL")
    } else if (is(visit_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("visit_concept_id = (", as.character(visit_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_concept_id = '", visit_concept_id,"'"))
    }
  }

  if (!missing(visit_start_date)) {
    if (is.null(visit_start_date)) {
      whereClauses <- c(whereClauses, "visit_start_date IS NULL")
    } else if (is(visit_start_date, "subQuery")){
      whereClasues <- c(whereClasues, paste0("visit_start_date = (", as.character(visit_start_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_start_date = '", visit_start_date,"'"))
    }
  }

  if (!missing(visit_start_time)) {
    if (is.null(visit_start_time)) {
      whereClauses <- c(whereClauses, "visit_start_time IS NULL")
    } else if (is(visit_start_time, "subQuery")){
      whereClasues <- c(whereClasues, paste0("visit_start_time = (", as.character(visit_start_time), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_start_time = '", visit_start_time,"'"))
    }
  }

  if (!missing(visit_end_date)) {
    if (is.null(visit_end_date)) {
      whereClauses <- c(whereClauses, "visit_end_date IS NULL")
    } else if (is(visit_end_date, "subQuery")){
      whereClasues <- c(whereClasues, paste0("visit_end_date = (", as.character(visit_end_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_end_date = '", visit_end_date,"'"))
    }
  }

  if (!missing(visit_end_time)) {
    if (is.null(visit_end_time)) {
      whereClauses <- c(whereClauses, "visit_end_time IS NULL")
    } else if (is(visit_end_time, "subQuery")){
      whereClasues <- c(whereClasues, paste0("visit_end_time = (", as.character(visit_end_time), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_end_time = '", visit_end_time,"'"))
    }
  }

  if (!missing(visit_type_concept_id)) {
    if (is.null(visit_type_concept_id)) {
      whereClauses <- c(whereClauses, "visit_type_concept_id IS NULL")
    } else if (is(visit_type_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("visit_type_concept_id = (", as.character(visit_type_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_type_concept_id = '", visit_type_concept_id,"'"))
    }
  }

  if (!missing(provider_id)) {
    if (is.null(provider_id)) {
      whereClauses <- c(whereClauses, "provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("provider_id = (", as.character(provider_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("provider_id = '", provider_id,"'"))
    }
  }

  if (!missing(care_site_id)) {
    if (is.null(care_site_id)) {
      whereClauses <- c(whereClauses, "care_site_id IS NULL")
    } else if (is(care_site_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("care_site_id = (", as.character(care_site_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("care_site_id = '", care_site_id,"'"))
    }
  }

  if (!missing(visit_source_value)) {
    if (is.null(visit_source_value)) {
      whereClauses <- c(whereClauses, "visit_source_value IS NULL")
    } else if (is(visit_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("visit_source_value = (", as.character(visit_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_source_value = '", visit_source_value,"'"))
    }
  }

  if (!missing(visit_source_concept_id)) {
    if (is.null(visit_source_concept_id)) {
      whereClauses <- c(whereClauses, "visit_source_concept_id IS NULL")
    } else if (is(visit_source_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("visit_source_concept_id = (", as.character(visit_source_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_source_concept_id = '", visit_source_concept_id,"'"))
    }
  }

  statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

expect_no_condition_occurrence <- function(condition_occurrence_id, person_id, condition_concept_id, condition_source_concept_id, condition_source_value, condition_start_date, provider_id, visit_occurrence_id, condition_type_concept_id, condition_end_date, stop_reason) {

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
      whereClasues <- c(whereClasues, paste0("condition_occurrence_id = (", as.character(condition_occurrence_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("condition_occurrence_id = '", condition_occurrence_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(condition_concept_id)) {
    if (is.null(condition_concept_id)) {
      whereClauses <- c(whereClauses, "condition_concept_id IS NULL")
    } else if (is(condition_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("condition_concept_id = (", as.character(condition_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("condition_concept_id = '", condition_concept_id,"'"))
    }
  }

  if (!missing(condition_source_concept_id)) {
    if (is.null(condition_source_concept_id)) {
      whereClauses <- c(whereClauses, "condition_source_concept_id IS NULL")
    } else if (is(condition_source_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("condition_source_concept_id = (", as.character(condition_source_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("condition_source_concept_id = '", condition_source_concept_id,"'"))
    }
  }

  if (!missing(condition_source_value)) {
    if (is.null(condition_source_value)) {
      whereClauses <- c(whereClauses, "condition_source_value IS NULL")
    } else if (is(condition_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("condition_source_value = (", as.character(condition_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("condition_source_value = '", condition_source_value,"'"))
    }
  }

  if (!missing(condition_start_date)) {
    if (is.null(condition_start_date)) {
      whereClauses <- c(whereClauses, "condition_start_date IS NULL")
    } else if (is(condition_start_date, "subQuery")){
      whereClasues <- c(whereClasues, paste0("condition_start_date = (", as.character(condition_start_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("condition_start_date = '", condition_start_date,"'"))
    }
  }

  if (!missing(provider_id)) {
    if (is.null(provider_id)) {
      whereClauses <- c(whereClauses, "provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("provider_id = (", as.character(provider_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("provider_id = '", provider_id,"'"))
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (is.null(visit_occurrence_id)) {
      whereClauses <- c(whereClauses, "visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("visit_occurrence_id = (", as.character(visit_occurrence_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_occurrence_id = '", visit_occurrence_id,"'"))
    }
  }

  if (!missing(condition_type_concept_id)) {
    if (is.null(condition_type_concept_id)) {
      whereClauses <- c(whereClauses, "condition_type_concept_id IS NULL")
    } else if (is(condition_type_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("condition_type_concept_id = (", as.character(condition_type_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("condition_type_concept_id = '", condition_type_concept_id,"'"))
    }
  }

  if (!missing(condition_end_date)) {
    if (is.null(condition_end_date)) {
      whereClauses <- c(whereClauses, "condition_end_date IS NULL")
    } else if (is(condition_end_date, "subQuery")){
      whereClasues <- c(whereClasues, paste0("condition_end_date = (", as.character(condition_end_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("condition_end_date = '", condition_end_date,"'"))
    }
  }

  if (!missing(stop_reason)) {
    if (is.null(stop_reason)) {
      whereClauses <- c(whereClauses, "stop_reason IS NULL")
    } else if (is(stop_reason, "subQuery")){
      whereClasues <- c(whereClasues, paste0("stop_reason = (", as.character(stop_reason), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("stop_reason = '", stop_reason,"'"))
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
      whereClasues <- c(whereClasues, paste0("device_exposure_id = (", as.character(device_exposure_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("device_exposure_id = '", device_exposure_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(device_concept_id)) {
    if (is.null(device_concept_id)) {
      whereClauses <- c(whereClauses, "device_concept_id IS NULL")
    } else if (is(device_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("device_concept_id = (", as.character(device_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("device_concept_id = '", device_concept_id,"'"))
    }
  }

  if (!missing(device_exposure_start_date)) {
    if (is.null(device_exposure_start_date)) {
      whereClauses <- c(whereClauses, "device_exposure_start_date IS NULL")
    } else if (is(device_exposure_start_date, "subQuery")){
      whereClasues <- c(whereClasues, paste0("device_exposure_start_date = (", as.character(device_exposure_start_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("device_exposure_start_date = '", device_exposure_start_date,"'"))
    }
  }

  if (!missing(device_exposure_end_date)) {
    if (is.null(device_exposure_end_date)) {
      whereClauses <- c(whereClauses, "device_exposure_end_date IS NULL")
    } else if (is(device_exposure_end_date, "subQuery")){
      whereClasues <- c(whereClasues, paste0("device_exposure_end_date = (", as.character(device_exposure_end_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("device_exposure_end_date = '", device_exposure_end_date,"'"))
    }
  }

  if (!missing(device_type_concept_id)) {
    if (is.null(device_type_concept_id)) {
      whereClauses <- c(whereClauses, "device_type_concept_id IS NULL")
    } else if (is(device_type_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("device_type_concept_id = (", as.character(device_type_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("device_type_concept_id = '", device_type_concept_id,"'"))
    }
  }

  if (!missing(unique_device_id)) {
    if (is.null(unique_device_id)) {
      whereClauses <- c(whereClauses, "unique_device_id IS NULL")
    } else if (is(unique_device_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("unique_device_id = (", as.character(unique_device_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("unique_device_id = '", unique_device_id,"'"))
    }
  }

  if (!missing(quantity)) {
    if (is.null(quantity)) {
      whereClauses <- c(whereClauses, "quantity IS NULL")
    } else if (is(quantity, "subQuery")){
      whereClasues <- c(whereClasues, paste0("quantity = (", as.character(quantity), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("quantity = '", quantity,"'"))
    }
  }

  if (!missing(provider_id)) {
    if (is.null(provider_id)) {
      whereClauses <- c(whereClauses, "provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("provider_id = (", as.character(provider_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("provider_id = '", provider_id,"'"))
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (is.null(visit_occurrence_id)) {
      whereClauses <- c(whereClauses, "visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("visit_occurrence_id = (", as.character(visit_occurrence_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_occurrence_id = '", visit_occurrence_id,"'"))
    }
  }

  if (!missing(device_source_value)) {
    if (is.null(device_source_value)) {
      whereClauses <- c(whereClauses, "device_source_value IS NULL")
    } else if (is(device_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("device_source_value = (", as.character(device_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("device_source_value = '", device_source_value,"'"))
    }
  }

  if (!missing(device_source_concept_id)) {
    if (is.null(device_source_concept_id)) {
      whereClauses <- c(whereClauses, "device_source_concept_id IS NULL")
    } else if (is(device_source_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("device_source_concept_id = (", as.character(device_source_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("device_source_concept_id = '", device_source_concept_id,"'"))
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
      whereClasues <- c(whereClasues, paste0("observation_id = (", as.character(observation_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("observation_id = '", observation_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(observation_concept_id)) {
    if (is.null(observation_concept_id)) {
      whereClauses <- c(whereClauses, "observation_concept_id IS NULL")
    } else if (is(observation_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("observation_concept_id = (", as.character(observation_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("observation_concept_id = '", observation_concept_id,"'"))
    }
  }

  if (!missing(observation_date)) {
    if (is.null(observation_date)) {
      whereClauses <- c(whereClauses, "observation_date IS NULL")
    } else if (is(observation_date, "subQuery")){
      whereClasues <- c(whereClasues, paste0("observation_date = (", as.character(observation_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("observation_date = '", observation_date,"'"))
    }
  }

  if (!missing(observation_time)) {
    if (is.null(observation_time)) {
      whereClauses <- c(whereClauses, "observation_time IS NULL")
    } else if (is(observation_time, "subQuery")){
      whereClasues <- c(whereClasues, paste0("observation_time = (", as.character(observation_time), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("observation_time = '", observation_time,"'"))
    }
  }

  if (!missing(observation_type_concept_id)) {
    if (is.null(observation_type_concept_id)) {
      whereClauses <- c(whereClauses, "observation_type_concept_id IS NULL")
    } else if (is(observation_type_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("observation_type_concept_id = (", as.character(observation_type_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("observation_type_concept_id = '", observation_type_concept_id,"'"))
    }
  }

  if (!missing(value_as_number)) {
    if (is.null(value_as_number)) {
      whereClauses <- c(whereClauses, "value_as_number IS NULL")
    } else if (is(value_as_number, "subQuery")){
      whereClasues <- c(whereClasues, paste0("value_as_number = (", as.character(value_as_number), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("value_as_number = '", value_as_number,"'"))
    }
  }

  if (!missing(value_as_string)) {
    if (is.null(value_as_string)) {
      whereClauses <- c(whereClauses, "value_as_string IS NULL")
    } else if (is(value_as_string, "subQuery")){
      whereClasues <- c(whereClasues, paste0("value_as_string = (", as.character(value_as_string), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("value_as_string = '", value_as_string,"'"))
    }
  }

  if (!missing(value_as_concept_id)) {
    if (is.null(value_as_concept_id)) {
      whereClauses <- c(whereClauses, "value_as_concept_id IS NULL")
    } else if (is(value_as_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("value_as_concept_id = (", as.character(value_as_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("value_as_concept_id = '", value_as_concept_id,"'"))
    }
  }

  if (!missing(qualifier_concept_id)) {
    if (is.null(qualifier_concept_id)) {
      whereClauses <- c(whereClauses, "qualifier_concept_id IS NULL")
    } else if (is(qualifier_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("qualifier_concept_id = (", as.character(qualifier_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("qualifier_concept_id = '", qualifier_concept_id,"'"))
    }
  }

  if (!missing(unit_concept_id)) {
    if (is.null(unit_concept_id)) {
      whereClauses <- c(whereClauses, "unit_concept_id IS NULL")
    } else if (is(unit_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("unit_concept_id = (", as.character(unit_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("unit_concept_id = '", unit_concept_id,"'"))
    }
  }

  if (!missing(provider_id)) {
    if (is.null(provider_id)) {
      whereClauses <- c(whereClauses, "provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("provider_id = (", as.character(provider_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("provider_id = '", provider_id,"'"))
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (is.null(visit_occurrence_id)) {
      whereClauses <- c(whereClauses, "visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("visit_occurrence_id = (", as.character(visit_occurrence_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_occurrence_id = '", visit_occurrence_id,"'"))
    }
  }

  if (!missing(observation_source_value)) {
    if (is.null(observation_source_value)) {
      whereClauses <- c(whereClauses, "observation_source_value IS NULL")
    } else if (is(observation_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("observation_source_value = (", as.character(observation_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("observation_source_value = '", observation_source_value,"'"))
    }
  }

  if (!missing(observation_source_concept_id)) {
    if (is.null(observation_source_concept_id)) {
      whereClauses <- c(whereClauses, "observation_source_concept_id IS NULL")
    } else if (is(observation_source_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("observation_source_concept_id = (", as.character(observation_source_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("observation_source_concept_id = '", observation_source_concept_id,"'"))
    }
  }

  if (!missing(unit_source_value)) {
    if (is.null(unit_source_value)) {
      whereClauses <- c(whereClauses, "unit_source_value IS NULL")
    } else if (is(unit_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("unit_source_value = (", as.character(unit_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("unit_source_value = '", unit_source_value,"'"))
    }
  }

  if (!missing(qualifier_source_value)) {
    if (is.null(qualifier_source_value)) {
      whereClauses <- c(whereClauses, "qualifier_source_value IS NULL")
    } else if (is(qualifier_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("qualifier_source_value = (", as.character(qualifier_source_value), ")"))
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
      whereClasues <- c(whereClasues, paste0("measurement_id = (", as.character(measurement_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("measurement_id = '", measurement_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(measurement_concept_id)) {
    if (is.null(measurement_concept_id)) {
      whereClauses <- c(whereClauses, "measurement_concept_id IS NULL")
    } else if (is(measurement_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("measurement_concept_id = (", as.character(measurement_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("measurement_concept_id = '", measurement_concept_id,"'"))
    }
  }

  if (!missing(measurement_date)) {
    if (is.null(measurement_date)) {
      whereClauses <- c(whereClauses, "measurement_date IS NULL")
    } else if (is(measurement_date, "subQuery")){
      whereClasues <- c(whereClasues, paste0("measurement_date = (", as.character(measurement_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("measurement_date = '", measurement_date,"'"))
    }
  }

  if (!missing(measurement_time)) {
    if (is.null(measurement_time)) {
      whereClauses <- c(whereClauses, "measurement_time IS NULL")
    } else if (is(measurement_time, "subQuery")){
      whereClasues <- c(whereClasues, paste0("measurement_time = (", as.character(measurement_time), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("measurement_time = '", measurement_time,"'"))
    }
  }

  if (!missing(measurement_type_concept_id)) {
    if (is.null(measurement_type_concept_id)) {
      whereClauses <- c(whereClauses, "measurement_type_concept_id IS NULL")
    } else if (is(measurement_type_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("measurement_type_concept_id = (", as.character(measurement_type_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("measurement_type_concept_id = '", measurement_type_concept_id,"'"))
    }
  }

  if (!missing(operator_concept_id)) {
    if (is.null(operator_concept_id)) {
      whereClauses <- c(whereClauses, "operator_concept_id IS NULL")
    } else if (is(operator_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("operator_concept_id = (", as.character(operator_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("operator_concept_id = '", operator_concept_id,"'"))
    }
  }

  if (!missing(value_as_number)) {
    if (is.null(value_as_number)) {
      whereClauses <- c(whereClauses, "value_as_number IS NULL")
    } else if (is(value_as_number, "subQuery")){
      whereClasues <- c(whereClasues, paste0("value_as_number = (", as.character(value_as_number), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("value_as_number = '", value_as_number,"'"))
    }
  }

  if (!missing(value_as_concept_id)) {
    if (is.null(value_as_concept_id)) {
      whereClauses <- c(whereClauses, "value_as_concept_id IS NULL")
    } else if (is(value_as_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("value_as_concept_id = (", as.character(value_as_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("value_as_concept_id = '", value_as_concept_id,"'"))
    }
  }

  if (!missing(unit_concept_id)) {
    if (is.null(unit_concept_id)) {
      whereClauses <- c(whereClauses, "unit_concept_id IS NULL")
    } else if (is(unit_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("unit_concept_id = (", as.character(unit_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("unit_concept_id = '", unit_concept_id,"'"))
    }
  }

  if (!missing(range_low)) {
    if (is.null(range_low)) {
      whereClauses <- c(whereClauses, "range_low IS NULL")
    } else if (is(range_low, "subQuery")){
      whereClasues <- c(whereClasues, paste0("range_low = (", as.character(range_low), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("range_low = '", range_low,"'"))
    }
  }

  if (!missing(range_high)) {
    if (is.null(range_high)) {
      whereClauses <- c(whereClauses, "range_high IS NULL")
    } else if (is(range_high, "subQuery")){
      whereClasues <- c(whereClasues, paste0("range_high = (", as.character(range_high), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("range_high = '", range_high,"'"))
    }
  }

  if (!missing(provider_id)) {
    if (is.null(provider_id)) {
      whereClauses <- c(whereClauses, "provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("provider_id = (", as.character(provider_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("provider_id = '", provider_id,"'"))
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (is.null(visit_occurrence_id)) {
      whereClauses <- c(whereClauses, "visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("visit_occurrence_id = (", as.character(visit_occurrence_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_occurrence_id = '", visit_occurrence_id,"'"))
    }
  }

  if (!missing(measurement_source_value)) {
    if (is.null(measurement_source_value)) {
      whereClauses <- c(whereClauses, "measurement_source_value IS NULL")
    } else if (is(measurement_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("measurement_source_value = (", as.character(measurement_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("measurement_source_value = '", measurement_source_value,"'"))
    }
  }

  if (!missing(measurement_source_concept_id)) {
    if (is.null(measurement_source_concept_id)) {
      whereClauses <- c(whereClauses, "measurement_source_concept_id IS NULL")
    } else if (is(measurement_source_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("measurement_source_concept_id = (", as.character(measurement_source_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("measurement_source_concept_id = '", measurement_source_concept_id,"'"))
    }
  }

  if (!missing(unit_source_value)) {
    if (is.null(unit_source_value)) {
      whereClauses <- c(whereClauses, "unit_source_value IS NULL")
    } else if (is(unit_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("unit_source_value = (", as.character(unit_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("unit_source_value = '", unit_source_value,"'"))
    }
  }

  if (!missing(value_source_value)) {
    if (is.null(value_source_value)) {
      whereClauses <- c(whereClauses, "value_source_value IS NULL")
    } else if (is(value_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("value_source_value = (", as.character(value_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("value_source_value = '", value_source_value,"'"))
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
      whereClasues <- c(whereClasues, paste0("procedure_occurrence_id = (", as.character(procedure_occurrence_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("procedure_occurrence_id = '", procedure_occurrence_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(procedure_concept_id)) {
    if (is.null(procedure_concept_id)) {
      whereClauses <- c(whereClauses, "procedure_concept_id IS NULL")
    } else if (is(procedure_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("procedure_concept_id = (", as.character(procedure_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("procedure_concept_id = '", procedure_concept_id,"'"))
    }
  }

  if (!missing(procedure_date)) {
    if (is.null(procedure_date)) {
      whereClauses <- c(whereClauses, "procedure_date IS NULL")
    } else if (is(procedure_date, "subQuery")){
      whereClasues <- c(whereClasues, paste0("procedure_date = (", as.character(procedure_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("procedure_date = '", procedure_date,"'"))
    }
  }

  if (!missing(procedure_type_concept_id)) {
    if (is.null(procedure_type_concept_id)) {
      whereClauses <- c(whereClauses, "procedure_type_concept_id IS NULL")
    } else if (is(procedure_type_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("procedure_type_concept_id = (", as.character(procedure_type_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("procedure_type_concept_id = '", procedure_type_concept_id,"'"))
    }
  }

  if (!missing(modifier_concept_id)) {
    if (is.null(modifier_concept_id)) {
      whereClauses <- c(whereClauses, "modifier_concept_id IS NULL")
    } else if (is(modifier_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("modifier_concept_id = (", as.character(modifier_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("modifier_concept_id = '", modifier_concept_id,"'"))
    }
  }

  if (!missing(quantity)) {
    if (is.null(quantity)) {
      whereClauses <- c(whereClauses, "quantity IS NULL")
    } else if (is(quantity, "subQuery")){
      whereClasues <- c(whereClasues, paste0("quantity = (", as.character(quantity), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("quantity = '", quantity,"'"))
    }
  }

  if (!missing(provider_id)) {
    if (is.null(provider_id)) {
      whereClauses <- c(whereClauses, "provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("provider_id = (", as.character(provider_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("provider_id = '", provider_id,"'"))
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (is.null(visit_occurrence_id)) {
      whereClauses <- c(whereClauses, "visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("visit_occurrence_id = (", as.character(visit_occurrence_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_occurrence_id = '", visit_occurrence_id,"'"))
    }
  }

  if (!missing(procedure_source_value)) {
    if (is.null(procedure_source_value)) {
      whereClauses <- c(whereClauses, "procedure_source_value IS NULL")
    } else if (is(procedure_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("procedure_source_value = (", as.character(procedure_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("procedure_source_value = '", procedure_source_value,"'"))
    }
  }

  if (!missing(procedure_source_concept_id)) {
    if (is.null(procedure_source_concept_id)) {
      whereClauses <- c(whereClauses, "procedure_source_concept_id IS NULL")
    } else if (is(procedure_source_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("procedure_source_concept_id = (", as.character(procedure_source_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("procedure_source_concept_id = '", procedure_source_concept_id,"'"))
    }
  }

  if (!missing(qualifier_source_value)) {
    if (is.null(qualifier_source_value)) {
      whereClauses <- c(whereClauses, "qualifier_source_value IS NULL")
    } else if (is(qualifier_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("qualifier_source_value = (", as.character(qualifier_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("qualifier_source_value = '", qualifier_source_value,"'"))
    }
  }

  statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

expect_no_drug_exposure <- function(drug_exposure_id, person_id, drug_exposure_start_date, drug_concept_id, drug_source_value, drug_source_concept_id, drug_type_concept_id, provider_id, visit_occurrence_id, route_concept_id, route_source_value, quantity, refills, days_supply, dose_unit_concept_id, dose_unit_source_value, effective_drug_dose, stop_reason, sig, lot_number, drug_exposure_end_date) {

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
      whereClasues <- c(whereClasues, paste0("drug_exposure_id = (", as.character(drug_exposure_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("drug_exposure_id = '", drug_exposure_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(drug_exposure_start_date)) {
    if (is.null(drug_exposure_start_date)) {
      whereClauses <- c(whereClauses, "drug_exposure_start_date IS NULL")
    } else if (is(drug_exposure_start_date, "subQuery")){
      whereClasues <- c(whereClasues, paste0("drug_exposure_start_date = (", as.character(drug_exposure_start_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("drug_exposure_start_date = '", drug_exposure_start_date,"'"))
    }
  }

  if (!missing(drug_concept_id)) {
    if (is.null(drug_concept_id)) {
      whereClauses <- c(whereClauses, "drug_concept_id IS NULL")
    } else if (is(drug_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("drug_concept_id = (", as.character(drug_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("drug_concept_id = '", drug_concept_id,"'"))
    }
  }

  if (!missing(drug_source_value)) {
    if (is.null(drug_source_value)) {
      whereClauses <- c(whereClauses, "drug_source_value IS NULL")
    } else if (is(drug_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("drug_source_value = (", as.character(drug_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("drug_source_value = '", drug_source_value,"'"))
    }
  }

  if (!missing(drug_source_concept_id)) {
    if (is.null(drug_source_concept_id)) {
      whereClauses <- c(whereClauses, "drug_source_concept_id IS NULL")
    } else if (is(drug_source_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("drug_source_concept_id = (", as.character(drug_source_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("drug_source_concept_id = '", drug_source_concept_id,"'"))
    }
  }

  if (!missing(drug_type_concept_id)) {
    if (is.null(drug_type_concept_id)) {
      whereClauses <- c(whereClauses, "drug_type_concept_id IS NULL")
    } else if (is(drug_type_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("drug_type_concept_id = (", as.character(drug_type_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("drug_type_concept_id = '", drug_type_concept_id,"'"))
    }
  }

  if (!missing(provider_id)) {
    if (is.null(provider_id)) {
      whereClauses <- c(whereClauses, "provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("provider_id = (", as.character(provider_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("provider_id = '", provider_id,"'"))
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (is.null(visit_occurrence_id)) {
      whereClauses <- c(whereClauses, "visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("visit_occurrence_id = (", as.character(visit_occurrence_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_occurrence_id = '", visit_occurrence_id,"'"))
    }
  }

  if (!missing(route_concept_id)) {
    if (is.null(route_concept_id)) {
      whereClauses <- c(whereClauses, "route_concept_id IS NULL")
    } else if (is(route_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("route_concept_id = (", as.character(route_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("route_concept_id = '", route_concept_id,"'"))
    }
  }

  if (!missing(route_source_value)) {
    if (is.null(route_source_value)) {
      whereClauses <- c(whereClauses, "route_source_value IS NULL")
    } else if (is(route_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("route_source_value = (", as.character(route_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("route_source_value = '", route_source_value,"'"))
    }
  }

  if (!missing(quantity)) {
    if (is.null(quantity)) {
      whereClauses <- c(whereClauses, "quantity IS NULL")
    } else if (is(quantity, "subQuery")){
      whereClasues <- c(whereClasues, paste0("quantity = (", as.character(quantity), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("quantity = '", quantity,"'"))
    }
  }

  if (!missing(refills)) {
    if (is.null(refills)) {
      whereClauses <- c(whereClauses, "refills IS NULL")
    } else if (is(refills, "subQuery")){
      whereClasues <- c(whereClasues, paste0("refills = (", as.character(refills), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("refills = '", refills,"'"))
    }
  }

  if (!missing(days_supply)) {
    if (is.null(days_supply)) {
      whereClauses <- c(whereClauses, "days_supply IS NULL")
    } else if (is(days_supply, "subQuery")){
      whereClasues <- c(whereClasues, paste0("days_supply = (", as.character(days_supply), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("days_supply = '", days_supply,"'"))
    }
  }

  if (!missing(dose_unit_concept_id)) {
    if (is.null(dose_unit_concept_id)) {
      whereClauses <- c(whereClauses, "dose_unit_concept_id IS NULL")
    } else if (is(dose_unit_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("dose_unit_concept_id = (", as.character(dose_unit_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("dose_unit_concept_id = '", dose_unit_concept_id,"'"))
    }
  }

  if (!missing(dose_unit_source_value)) {
    if (is.null(dose_unit_source_value)) {
      whereClauses <- c(whereClauses, "dose_unit_source_value IS NULL")
    } else if (is(dose_unit_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("dose_unit_source_value = (", as.character(dose_unit_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("dose_unit_source_value = '", dose_unit_source_value,"'"))
    }
  }

  if (!missing(effective_drug_dose)) {
    if (is.null(effective_drug_dose)) {
      whereClauses <- c(whereClauses, "effective_drug_dose IS NULL")
    } else if (is(effective_drug_dose, "subQuery")){
      whereClasues <- c(whereClasues, paste0("effective_drug_dose = (", as.character(effective_drug_dose), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("effective_drug_dose = '", effective_drug_dose,"'"))
    }
  }

  if (!missing(stop_reason)) {
    if (is.null(stop_reason)) {
      whereClauses <- c(whereClauses, "stop_reason IS NULL")
    } else if (is(stop_reason, "subQuery")){
      whereClasues <- c(whereClasues, paste0("stop_reason = (", as.character(stop_reason), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("stop_reason = '", stop_reason,"'"))
    }
  }

  if (!missing(sig)) {
    if (is.null(sig)) {
      whereClauses <- c(whereClauses, "sig IS NULL")
    } else if (is(sig, "subQuery")){
      whereClasues <- c(whereClasues, paste0("sig = (", as.character(sig), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("sig = '", sig,"'"))
    }
  }

  if (!missing(lot_number)) {
    if (is.null(lot_number)) {
      whereClauses <- c(whereClauses, "lot_number IS NULL")
    } else if (is(lot_number, "subQuery")){
      whereClasues <- c(whereClasues, paste0("lot_number = (", as.character(lot_number), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("lot_number = '", lot_number,"'"))
    }
  }

  if (!missing(drug_exposure_end_date)) {
    if (is.null(drug_exposure_end_date)) {
      whereClauses <- c(whereClauses, "drug_exposure_end_date IS NULL")
    } else if (is(drug_exposure_end_date, "subQuery")){
      whereClasues <- c(whereClasues, paste0("drug_exposure_end_date = (", as.character(drug_exposure_end_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("drug_exposure_end_date = '", drug_exposure_end_date,"'"))
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
      whereClasues <- c(whereClasues, paste0("domain_concept_id_1 = (", as.character(domain_concept_id_1), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("domain_concept_id_1 = '", domain_concept_id_1,"'"))
    }
  }

  if (!missing(fact_id_1)) {
    if (is.null(fact_id_1)) {
      whereClauses <- c(whereClauses, "fact_id_1 IS NULL")
    } else if (is(fact_id_1, "subQuery")){
      whereClasues <- c(whereClasues, paste0("fact_id_1 = (", as.character(fact_id_1), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("fact_id_1 = '", fact_id_1,"'"))
    }
  }

  if (!missing(domain_concept_id_2)) {
    if (is.null(domain_concept_id_2)) {
      whereClauses <- c(whereClauses, "domain_concept_id_2 IS NULL")
    } else if (is(domain_concept_id_2, "subQuery")){
      whereClasues <- c(whereClasues, paste0("domain_concept_id_2 = (", as.character(domain_concept_id_2), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("domain_concept_id_2 = '", domain_concept_id_2,"'"))
    }
  }

  if (!missing(fact_id_2)) {
    if (is.null(fact_id_2)) {
      whereClauses <- c(whereClauses, "fact_id_2 IS NULL")
    } else if (is(fact_id_2, "subQuery")){
      whereClasues <- c(whereClasues, paste0("fact_id_2 = (", as.character(fact_id_2), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("fact_id_2 = '", fact_id_2,"'"))
    }
  }

  if (!missing(relationship_concept_id)) {
    if (is.null(relationship_concept_id)) {
      whereClauses <- c(whereClauses, "relationship_concept_id IS NULL")
    } else if (is(relationship_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("relationship_concept_id = (", as.character(relationship_concept_id), ")"))
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
      whereClasues <- c(whereClasues, paste0("payer_plan_period_id = (", as.character(payer_plan_period_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("payer_plan_period_id = '", payer_plan_period_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(payer_plan_period_start_date)) {
    if (is.null(payer_plan_period_start_date)) {
      whereClauses <- c(whereClauses, "payer_plan_period_start_date IS NULL")
    } else if (is(payer_plan_period_start_date, "subQuery")){
      whereClasues <- c(whereClasues, paste0("payer_plan_period_start_date = (", as.character(payer_plan_period_start_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("payer_plan_period_start_date = '", payer_plan_period_start_date,"'"))
    }
  }

  if (!missing(payer_plan_period_end_date)) {
    if (is.null(payer_plan_period_end_date)) {
      whereClauses <- c(whereClauses, "payer_plan_period_end_date IS NULL")
    } else if (is(payer_plan_period_end_date, "subQuery")){
      whereClasues <- c(whereClasues, paste0("payer_plan_period_end_date = (", as.character(payer_plan_period_end_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("payer_plan_period_end_date = '", payer_plan_period_end_date,"'"))
    }
  }

  if (!missing(payer_source_value)) {
    if (is.null(payer_source_value)) {
      whereClauses <- c(whereClauses, "payer_source_value IS NULL")
    } else if (is(payer_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("payer_source_value = (", as.character(payer_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("payer_source_value = '", payer_source_value,"'"))
    }
  }

  if (!missing(plan_source_value)) {
    if (is.null(plan_source_value)) {
      whereClauses <- c(whereClauses, "plan_source_value IS NULL")
    } else if (is(plan_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("plan_source_value = (", as.character(plan_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("plan_source_value = '", plan_source_value,"'"))
    }
  }

  if (!missing(family_source_value)) {
    if (is.null(family_source_value)) {
      whereClauses <- c(whereClauses, "family_source_value IS NULL")
    } else if (is(family_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("family_source_value = (", as.character(family_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("family_source_value = '", family_source_value,"'"))
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
      whereClasues <- c(whereClasues, paste0("note_id = (", as.character(note_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("note_id = '", note_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(note_date)) {
    if (is.null(note_date)) {
      whereClauses <- c(whereClauses, "note_date IS NULL")
    } else if (is(note_date, "subQuery")){
      whereClasues <- c(whereClasues, paste0("note_date = (", as.character(note_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("note_date = '", note_date,"'"))
    }
  }

  if (!missing(note_time)) {
    if (is.null(note_time)) {
      whereClauses <- c(whereClauses, "note_time IS NULL")
    } else if (is(note_time, "subQuery")){
      whereClasues <- c(whereClasues, paste0("note_time = (", as.character(note_time), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("note_time = '", note_time,"'"))
    }
  }

  if (!missing(note_type_concept_id)) {
    if (is.null(note_type_concept_id)) {
      whereClauses <- c(whereClauses, "note_type_concept_id IS NULL")
    } else if (is(note_type_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("note_type_concept_id = (", as.character(note_type_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("note_type_concept_id = '", note_type_concept_id,"'"))
    }
  }

  if (!missing(note_text)) {
    if (is.null(note_text)) {
      whereClauses <- c(whereClauses, "note_text IS NULL")
    } else if (is(note_text, "subQuery")){
      whereClasues <- c(whereClasues, paste0("note_text = (", as.character(note_text), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("note_text = '", note_text,"'"))
    }
  }

  if (!missing(provider_id)) {
    if (is.null(provider_id)) {
      whereClauses <- c(whereClauses, "provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("provider_id = (", as.character(provider_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("provider_id = '", provider_id,"'"))
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (is.null(visit_occurrence_id)) {
      whereClauses <- c(whereClauses, "visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("visit_occurrence_id = (", as.character(visit_occurrence_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_occurrence_id = '", visit_occurrence_id,"'"))
    }
  }

  if (!missing(note_source_value)) {
    if (is.null(note_source_value)) {
      whereClauses <- c(whereClauses, "note_source_value IS NULL")
    } else if (is(note_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("note_source_value = (", as.character(note_source_value), ")"))
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
      whereClasues <- c(whereClasues, paste0("specimen_id = (", as.character(specimen_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("specimen_id = '", specimen_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(specimen_concept_id)) {
    if (is.null(specimen_concept_id)) {
      whereClauses <- c(whereClauses, "specimen_concept_id IS NULL")
    } else if (is(specimen_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("specimen_concept_id = (", as.character(specimen_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("specimen_concept_id = '", specimen_concept_id,"'"))
    }
  }

  if (!missing(specimen_type_concept_id)) {
    if (is.null(specimen_type_concept_id)) {
      whereClauses <- c(whereClauses, "specimen_type_concept_id IS NULL")
    } else if (is(specimen_type_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("specimen_type_concept_id = (", as.character(specimen_type_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("specimen_type_concept_id = '", specimen_type_concept_id,"'"))
    }
  }

  if (!missing(specimen_date)) {
    if (is.null(specimen_date)) {
      whereClauses <- c(whereClauses, "specimen_date IS NULL")
    } else if (is(specimen_date, "subQuery")){
      whereClasues <- c(whereClasues, paste0("specimen_date = (", as.character(specimen_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("specimen_date = '", specimen_date,"'"))
    }
  }

  if (!missing(specimen_time)) {
    if (is.null(specimen_time)) {
      whereClauses <- c(whereClauses, "specimen_time IS NULL")
    } else if (is(specimen_time, "subQuery")){
      whereClasues <- c(whereClasues, paste0("specimen_time = (", as.character(specimen_time), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("specimen_time = '", specimen_time,"'"))
    }
  }

  if (!missing(quantity)) {
    if (is.null(quantity)) {
      whereClauses <- c(whereClauses, "quantity IS NULL")
    } else if (is(quantity, "subQuery")){
      whereClasues <- c(whereClasues, paste0("quantity = (", as.character(quantity), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("quantity = '", quantity,"'"))
    }
  }

  if (!missing(unit_concept_id)) {
    if (is.null(unit_concept_id)) {
      whereClauses <- c(whereClauses, "unit_concept_id IS NULL")
    } else if (is(unit_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("unit_concept_id = (", as.character(unit_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("unit_concept_id = '", unit_concept_id,"'"))
    }
  }

  if (!missing(anatomic_site_concept_id)) {
    if (is.null(anatomic_site_concept_id)) {
      whereClauses <- c(whereClauses, "anatomic_site_concept_id IS NULL")
    } else if (is(anatomic_site_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("anatomic_site_concept_id = (", as.character(anatomic_site_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("anatomic_site_concept_id = '", anatomic_site_concept_id,"'"))
    }
  }

  if (!missing(disease_status_concept_id)) {
    if (is.null(disease_status_concept_id)) {
      whereClauses <- c(whereClauses, "disease_status_concept_id IS NULL")
    } else if (is(disease_status_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("disease_status_concept_id = (", as.character(disease_status_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("disease_status_concept_id = '", disease_status_concept_id,"'"))
    }
  }

  if (!missing(specimen_source_id)) {
    if (is.null(specimen_source_id)) {
      whereClauses <- c(whereClauses, "specimen_source_id IS NULL")
    } else if (is(specimen_source_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("specimen_source_id = (", as.character(specimen_source_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("specimen_source_id = '", specimen_source_id,"'"))
    }
  }

  if (!missing(specimen_source_value)) {
    if (is.null(specimen_source_value)) {
      whereClauses <- c(whereClauses, "specimen_source_value IS NULL")
    } else if (is(specimen_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("specimen_source_value = (", as.character(specimen_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("specimen_source_value = '", specimen_source_value,"'"))
    }
  }

  if (!missing(unit_source_value)) {
    if (is.null(unit_source_value)) {
      whereClauses <- c(whereClauses, "unit_source_value IS NULL")
    } else if (is(unit_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("unit_source_value = (", as.character(unit_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("unit_source_value = '", unit_source_value,"'"))
    }
  }

  if (!missing(anatomic_site_source_value)) {
    if (is.null(anatomic_site_source_value)) {
      whereClauses <- c(whereClauses, "anatomic_site_source_value IS NULL")
    } else if (is(anatomic_site_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("anatomic_site_source_value = (", as.character(anatomic_site_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("anatomic_site_source_value = '", anatomic_site_source_value,"'"))
    }
  }

  if (!missing(disease_status_source_value)) {
    if (is.null(disease_status_source_value)) {
      whereClauses <- c(whereClauses, "disease_status_source_value IS NULL")
    } else if (is(disease_status_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("disease_status_source_value = (", as.character(disease_status_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("disease_status_source_value = '", disease_status_source_value,"'"))
    }
  }

  statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

expect_no_procedure_cost <- function(procedure_cost_id, procedure_occurrence_id, currency_concept_id, paid_copay, paid_coinsurance, paid_toward_deductible, paid_by_payer, paid_by_coordination_benefits, total_out_of_pocket, total_paid, revenue_code_concept_id, payer_plan_period_id, revenue_code_source_value) {

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

  statement <- paste0("INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT ", frameworkContext$testId, " AS id, '", testName, "' AS description, 'Expect procedure_cost' AS test, ", source_pid, " as source_pid, ", cdm_pid, " as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.procedure_cost WHERE ")
  whereClauses = NULL;
  if (!missing(procedure_cost_id)) {
    if (is.null(procedure_cost_id)) {
      whereClauses <- c(whereClauses, "procedure_cost_id IS NULL")
    } else if (is(procedure_cost_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("procedure_cost_id = (", as.character(procedure_cost_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("procedure_cost_id = '", procedure_cost_id,"'"))
    }
  }

  if (!missing(procedure_occurrence_id)) {
    if (is.null(procedure_occurrence_id)) {
      whereClauses <- c(whereClauses, "procedure_occurrence_id IS NULL")
    } else if (is(procedure_occurrence_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("procedure_occurrence_id = (", as.character(procedure_occurrence_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("procedure_occurrence_id = '", procedure_occurrence_id,"'"))
    }
  }

  if (!missing(currency_concept_id)) {
    if (is.null(currency_concept_id)) {
      whereClauses <- c(whereClauses, "currency_concept_id IS NULL")
    } else if (is(currency_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("currency_concept_id = (", as.character(currency_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("currency_concept_id = '", currency_concept_id,"'"))
    }
  }

  if (!missing(paid_copay)) {
    if (is.null(paid_copay)) {
      whereClauses <- c(whereClauses, "paid_copay IS NULL")
    } else if (is(paid_copay, "subQuery")){
      whereClasues <- c(whereClasues, paste0("paid_copay = (", as.character(paid_copay), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("paid_copay = '", paid_copay,"'"))
    }
  }

  if (!missing(paid_coinsurance)) {
    if (is.null(paid_coinsurance)) {
      whereClauses <- c(whereClauses, "paid_coinsurance IS NULL")
    } else if (is(paid_coinsurance, "subQuery")){
      whereClasues <- c(whereClasues, paste0("paid_coinsurance = (", as.character(paid_coinsurance), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("paid_coinsurance = '", paid_coinsurance,"'"))
    }
  }

  if (!missing(paid_toward_deductible)) {
    if (is.null(paid_toward_deductible)) {
      whereClauses <- c(whereClauses, "paid_toward_deductible IS NULL")
    } else if (is(paid_toward_deductible, "subQuery")){
      whereClasues <- c(whereClasues, paste0("paid_toward_deductible = (", as.character(paid_toward_deductible), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("paid_toward_deductible = '", paid_toward_deductible,"'"))
    }
  }

  if (!missing(paid_by_payer)) {
    if (is.null(paid_by_payer)) {
      whereClauses <- c(whereClauses, "paid_by_payer IS NULL")
    } else if (is(paid_by_payer, "subQuery")){
      whereClasues <- c(whereClasues, paste0("paid_by_payer = (", as.character(paid_by_payer), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("paid_by_payer = '", paid_by_payer,"'"))
    }
  }

  if (!missing(paid_by_coordination_benefits)) {
    if (is.null(paid_by_coordination_benefits)) {
      whereClauses <- c(whereClauses, "paid_by_coordination_benefits IS NULL")
    } else if (is(paid_by_coordination_benefits, "subQuery")){
      whereClasues <- c(whereClasues, paste0("paid_by_coordination_benefits = (", as.character(paid_by_coordination_benefits), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("paid_by_coordination_benefits = '", paid_by_coordination_benefits,"'"))
    }
  }

  if (!missing(total_out_of_pocket)) {
    if (is.null(total_out_of_pocket)) {
      whereClauses <- c(whereClauses, "total_out_of_pocket IS NULL")
    } else if (is(total_out_of_pocket, "subQuery")){
      whereClasues <- c(whereClasues, paste0("total_out_of_pocket = (", as.character(total_out_of_pocket), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("total_out_of_pocket = '", total_out_of_pocket,"'"))
    }
  }

  if (!missing(total_paid)) {
    if (is.null(total_paid)) {
      whereClauses <- c(whereClauses, "total_paid IS NULL")
    } else if (is(total_paid, "subQuery")){
      whereClasues <- c(whereClasues, paste0("total_paid = (", as.character(total_paid), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("total_paid = '", total_paid,"'"))
    }
  }

  if (!missing(revenue_code_concept_id)) {
    if (is.null(revenue_code_concept_id)) {
      whereClauses <- c(whereClauses, "revenue_code_concept_id IS NULL")
    } else if (is(revenue_code_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("revenue_code_concept_id = (", as.character(revenue_code_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("revenue_code_concept_id = '", revenue_code_concept_id,"'"))
    }
  }

  if (!missing(payer_plan_period_id)) {
    if (is.null(payer_plan_period_id)) {
      whereClauses <- c(whereClauses, "payer_plan_period_id IS NULL")
    } else if (is(payer_plan_period_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("payer_plan_period_id = (", as.character(payer_plan_period_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("payer_plan_period_id = '", payer_plan_period_id,"'"))
    }
  }

  if (!missing(revenue_code_source_value)) {
    if (is.null(revenue_code_source_value)) {
      whereClauses <- c(whereClauses, "revenue_code_source_value IS NULL")
    } else if (is(revenue_code_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("revenue_code_source_value = (", as.character(revenue_code_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("revenue_code_source_value = '", revenue_code_source_value,"'"))
    }
  }

  statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

expect_no_visit_cost <- function(visit_cost_id, visit_occurrence_id, currency_concept_id, paid_copay, paid_coinsurance, paid_toward_deductible, paid_by_payer, paid_by_coordination_benefits, total_out_of_pocket, total_paid, payer_plan_period_id) {

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

  statement <- paste0("INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT ", frameworkContext$testId, " AS id, '", testName, "' AS description, 'Expect visit_cost' AS test, ", source_pid, " as source_pid, ", cdm_pid, " as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.visit_cost WHERE ")
  whereClauses = NULL;
  if (!missing(visit_cost_id)) {
    if (is.null(visit_cost_id)) {
      whereClauses <- c(whereClauses, "visit_cost_id IS NULL")
    } else if (is(visit_cost_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("visit_cost_id = (", as.character(visit_cost_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_cost_id = '", visit_cost_id,"'"))
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (is.null(visit_occurrence_id)) {
      whereClauses <- c(whereClauses, "visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("visit_occurrence_id = (", as.character(visit_occurrence_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_occurrence_id = '", visit_occurrence_id,"'"))
    }
  }

  if (!missing(currency_concept_id)) {
    if (is.null(currency_concept_id)) {
      whereClauses <- c(whereClauses, "currency_concept_id IS NULL")
    } else if (is(currency_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("currency_concept_id = (", as.character(currency_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("currency_concept_id = '", currency_concept_id,"'"))
    }
  }

  if (!missing(paid_copay)) {
    if (is.null(paid_copay)) {
      whereClauses <- c(whereClauses, "paid_copay IS NULL")
    } else if (is(paid_copay, "subQuery")){
      whereClasues <- c(whereClasues, paste0("paid_copay = (", as.character(paid_copay), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("paid_copay = '", paid_copay,"'"))
    }
  }

  if (!missing(paid_coinsurance)) {
    if (is.null(paid_coinsurance)) {
      whereClauses <- c(whereClauses, "paid_coinsurance IS NULL")
    } else if (is(paid_coinsurance, "subQuery")){
      whereClasues <- c(whereClasues, paste0("paid_coinsurance = (", as.character(paid_coinsurance), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("paid_coinsurance = '", paid_coinsurance,"'"))
    }
  }

  if (!missing(paid_toward_deductible)) {
    if (is.null(paid_toward_deductible)) {
      whereClauses <- c(whereClauses, "paid_toward_deductible IS NULL")
    } else if (is(paid_toward_deductible, "subQuery")){
      whereClasues <- c(whereClasues, paste0("paid_toward_deductible = (", as.character(paid_toward_deductible), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("paid_toward_deductible = '", paid_toward_deductible,"'"))
    }
  }

  if (!missing(paid_by_payer)) {
    if (is.null(paid_by_payer)) {
      whereClauses <- c(whereClauses, "paid_by_payer IS NULL")
    } else if (is(paid_by_payer, "subQuery")){
      whereClasues <- c(whereClasues, paste0("paid_by_payer = (", as.character(paid_by_payer), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("paid_by_payer = '", paid_by_payer,"'"))
    }
  }

  if (!missing(paid_by_coordination_benefits)) {
    if (is.null(paid_by_coordination_benefits)) {
      whereClauses <- c(whereClauses, "paid_by_coordination_benefits IS NULL")
    } else if (is(paid_by_coordination_benefits, "subQuery")){
      whereClasues <- c(whereClasues, paste0("paid_by_coordination_benefits = (", as.character(paid_by_coordination_benefits), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("paid_by_coordination_benefits = '", paid_by_coordination_benefits,"'"))
    }
  }

  if (!missing(total_out_of_pocket)) {
    if (is.null(total_out_of_pocket)) {
      whereClauses <- c(whereClauses, "total_out_of_pocket IS NULL")
    } else if (is(total_out_of_pocket, "subQuery")){
      whereClasues <- c(whereClasues, paste0("total_out_of_pocket = (", as.character(total_out_of_pocket), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("total_out_of_pocket = '", total_out_of_pocket,"'"))
    }
  }

  if (!missing(total_paid)) {
    if (is.null(total_paid)) {
      whereClauses <- c(whereClauses, "total_paid IS NULL")
    } else if (is(total_paid, "subQuery")){
      whereClasues <- c(whereClasues, paste0("total_paid = (", as.character(total_paid), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("total_paid = '", total_paid,"'"))
    }
  }

  if (!missing(payer_plan_period_id)) {
    if (is.null(payer_plan_period_id)) {
      whereClauses <- c(whereClauses, "payer_plan_period_id IS NULL")
    } else if (is(payer_plan_period_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("payer_plan_period_id = (", as.character(payer_plan_period_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("payer_plan_period_id = '", payer_plan_period_id,"'"))
    }
  }

  statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

expect_no_drug_cost <- function(drug_cost_id, drug_exposure_id, currency_concept_id, paid_copay, paid_coinsurance, paid_toward_deductible, paid_by_payer, paid_by_coordination_benefits, total_out_of_pocket, total_paid, ingredient_cost, dispensing_fee, average_wholesale_price, payer_plan_period_id) {

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

  statement <- paste0("INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT ", frameworkContext$testId, " AS id, '", testName, "' AS description, 'Expect drug_cost' AS test, ", source_pid, " as source_pid, ", cdm_pid, " as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.drug_cost WHERE ")
  whereClauses = NULL;
  if (!missing(drug_cost_id)) {
    if (is.null(drug_cost_id)) {
      whereClauses <- c(whereClauses, "drug_cost_id IS NULL")
    } else if (is(drug_cost_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("drug_cost_id = (", as.character(drug_cost_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("drug_cost_id = '", drug_cost_id,"'"))
    }
  }

  if (!missing(drug_exposure_id)) {
    if (is.null(drug_exposure_id)) {
      whereClauses <- c(whereClauses, "drug_exposure_id IS NULL")
    } else if (is(drug_exposure_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("drug_exposure_id = (", as.character(drug_exposure_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("drug_exposure_id = '", drug_exposure_id,"'"))
    }
  }

  if (!missing(currency_concept_id)) {
    if (is.null(currency_concept_id)) {
      whereClauses <- c(whereClauses, "currency_concept_id IS NULL")
    } else if (is(currency_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("currency_concept_id = (", as.character(currency_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("currency_concept_id = '", currency_concept_id,"'"))
    }
  }

  if (!missing(paid_copay)) {
    if (is.null(paid_copay)) {
      whereClauses <- c(whereClauses, "paid_copay IS NULL")
    } else if (is(paid_copay, "subQuery")){
      whereClasues <- c(whereClasues, paste0("paid_copay = (", as.character(paid_copay), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("paid_copay = '", paid_copay,"'"))
    }
  }

  if (!missing(paid_coinsurance)) {
    if (is.null(paid_coinsurance)) {
      whereClauses <- c(whereClauses, "paid_coinsurance IS NULL")
    } else if (is(paid_coinsurance, "subQuery")){
      whereClasues <- c(whereClasues, paste0("paid_coinsurance = (", as.character(paid_coinsurance), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("paid_coinsurance = '", paid_coinsurance,"'"))
    }
  }

  if (!missing(paid_toward_deductible)) {
    if (is.null(paid_toward_deductible)) {
      whereClauses <- c(whereClauses, "paid_toward_deductible IS NULL")
    } else if (is(paid_toward_deductible, "subQuery")){
      whereClasues <- c(whereClasues, paste0("paid_toward_deductible = (", as.character(paid_toward_deductible), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("paid_toward_deductible = '", paid_toward_deductible,"'"))
    }
  }

  if (!missing(paid_by_payer)) {
    if (is.null(paid_by_payer)) {
      whereClauses <- c(whereClauses, "paid_by_payer IS NULL")
    } else if (is(paid_by_payer, "subQuery")){
      whereClasues <- c(whereClasues, paste0("paid_by_payer = (", as.character(paid_by_payer), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("paid_by_payer = '", paid_by_payer,"'"))
    }
  }

  if (!missing(paid_by_coordination_benefits)) {
    if (is.null(paid_by_coordination_benefits)) {
      whereClauses <- c(whereClauses, "paid_by_coordination_benefits IS NULL")
    } else if (is(paid_by_coordination_benefits, "subQuery")){
      whereClasues <- c(whereClasues, paste0("paid_by_coordination_benefits = (", as.character(paid_by_coordination_benefits), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("paid_by_coordination_benefits = '", paid_by_coordination_benefits,"'"))
    }
  }

  if (!missing(total_out_of_pocket)) {
    if (is.null(total_out_of_pocket)) {
      whereClauses <- c(whereClauses, "total_out_of_pocket IS NULL")
    } else if (is(total_out_of_pocket, "subQuery")){
      whereClasues <- c(whereClasues, paste0("total_out_of_pocket = (", as.character(total_out_of_pocket), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("total_out_of_pocket = '", total_out_of_pocket,"'"))
    }
  }

  if (!missing(total_paid)) {
    if (is.null(total_paid)) {
      whereClauses <- c(whereClauses, "total_paid IS NULL")
    } else if (is(total_paid, "subQuery")){
      whereClasues <- c(whereClasues, paste0("total_paid = (", as.character(total_paid), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("total_paid = '", total_paid,"'"))
    }
  }

  if (!missing(ingredient_cost)) {
    if (is.null(ingredient_cost)) {
      whereClauses <- c(whereClauses, "ingredient_cost IS NULL")
    } else if (is(ingredient_cost, "subQuery")){
      whereClasues <- c(whereClasues, paste0("ingredient_cost = (", as.character(ingredient_cost), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("ingredient_cost = '", ingredient_cost,"'"))
    }
  }

  if (!missing(dispensing_fee)) {
    if (is.null(dispensing_fee)) {
      whereClauses <- c(whereClauses, "dispensing_fee IS NULL")
    } else if (is(dispensing_fee, "subQuery")){
      whereClasues <- c(whereClasues, paste0("dispensing_fee = (", as.character(dispensing_fee), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("dispensing_fee = '", dispensing_fee,"'"))
    }
  }

  if (!missing(average_wholesale_price)) {
    if (is.null(average_wholesale_price)) {
      whereClauses <- c(whereClauses, "average_wholesale_price IS NULL")
    } else if (is(average_wholesale_price, "subQuery")){
      whereClasues <- c(whereClasues, paste0("average_wholesale_price = (", as.character(average_wholesale_price), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("average_wholesale_price = '", average_wholesale_price,"'"))
    }
  }

  if (!missing(payer_plan_period_id)) {
    if (is.null(payer_plan_period_id)) {
      whereClauses <- c(whereClauses, "payer_plan_period_id IS NULL")
    } else if (is(payer_plan_period_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("payer_plan_period_id = (", as.character(payer_plan_period_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("payer_plan_period_id = '", payer_plan_period_id,"'"))
    }
  }

  statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

expect_no_device_cost <- function(device_cost_id, device_exposure_id, currency_concept_id, paid_copay, paid_coinsurance, paid_toward_deductible, paid_by_payer, paid_by_coordination_benefits, total_out_of_pocket, total_paid, payer_plan_period_id) {

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

  statement <- paste0("INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT ", frameworkContext$testId, " AS id, '", testName, "' AS description, 'Expect device_cost' AS test, ", source_pid, " as source_pid, ", cdm_pid, " as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.device_cost WHERE ")
  whereClauses = NULL;
  if (!missing(device_cost_id)) {
    if (is.null(device_cost_id)) {
      whereClauses <- c(whereClauses, "device_cost_id IS NULL")
    } else if (is(device_cost_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("device_cost_id = (", as.character(device_cost_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("device_cost_id = '", device_cost_id,"'"))
    }
  }

  if (!missing(device_exposure_id)) {
    if (is.null(device_exposure_id)) {
      whereClauses <- c(whereClauses, "device_exposure_id IS NULL")
    } else if (is(device_exposure_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("device_exposure_id = (", as.character(device_exposure_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("device_exposure_id = '", device_exposure_id,"'"))
    }
  }

  if (!missing(currency_concept_id)) {
    if (is.null(currency_concept_id)) {
      whereClauses <- c(whereClauses, "currency_concept_id IS NULL")
    } else if (is(currency_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("currency_concept_id = (", as.character(currency_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("currency_concept_id = '", currency_concept_id,"'"))
    }
  }

  if (!missing(paid_copay)) {
    if (is.null(paid_copay)) {
      whereClauses <- c(whereClauses, "paid_copay IS NULL")
    } else if (is(paid_copay, "subQuery")){
      whereClasues <- c(whereClasues, paste0("paid_copay = (", as.character(paid_copay), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("paid_copay = '", paid_copay,"'"))
    }
  }

  if (!missing(paid_coinsurance)) {
    if (is.null(paid_coinsurance)) {
      whereClauses <- c(whereClauses, "paid_coinsurance IS NULL")
    } else if (is(paid_coinsurance, "subQuery")){
      whereClasues <- c(whereClasues, paste0("paid_coinsurance = (", as.character(paid_coinsurance), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("paid_coinsurance = '", paid_coinsurance,"'"))
    }
  }

  if (!missing(paid_toward_deductible)) {
    if (is.null(paid_toward_deductible)) {
      whereClauses <- c(whereClauses, "paid_toward_deductible IS NULL")
    } else if (is(paid_toward_deductible, "subQuery")){
      whereClasues <- c(whereClasues, paste0("paid_toward_deductible = (", as.character(paid_toward_deductible), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("paid_toward_deductible = '", paid_toward_deductible,"'"))
    }
  }

  if (!missing(paid_by_payer)) {
    if (is.null(paid_by_payer)) {
      whereClauses <- c(whereClauses, "paid_by_payer IS NULL")
    } else if (is(paid_by_payer, "subQuery")){
      whereClasues <- c(whereClasues, paste0("paid_by_payer = (", as.character(paid_by_payer), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("paid_by_payer = '", paid_by_payer,"'"))
    }
  }

  if (!missing(paid_by_coordination_benefits)) {
    if (is.null(paid_by_coordination_benefits)) {
      whereClauses <- c(whereClauses, "paid_by_coordination_benefits IS NULL")
    } else if (is(paid_by_coordination_benefits, "subQuery")){
      whereClasues <- c(whereClasues, paste0("paid_by_coordination_benefits = (", as.character(paid_by_coordination_benefits), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("paid_by_coordination_benefits = '", paid_by_coordination_benefits,"'"))
    }
  }

  if (!missing(total_out_of_pocket)) {
    if (is.null(total_out_of_pocket)) {
      whereClauses <- c(whereClauses, "total_out_of_pocket IS NULL")
    } else if (is(total_out_of_pocket, "subQuery")){
      whereClasues <- c(whereClasues, paste0("total_out_of_pocket = (", as.character(total_out_of_pocket), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("total_out_of_pocket = '", total_out_of_pocket,"'"))
    }
  }

  if (!missing(total_paid)) {
    if (is.null(total_paid)) {
      whereClauses <- c(whereClauses, "total_paid IS NULL")
    } else if (is(total_paid, "subQuery")){
      whereClasues <- c(whereClasues, paste0("total_paid = (", as.character(total_paid), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("total_paid = '", total_paid,"'"))
    }
  }

  if (!missing(payer_plan_period_id)) {
    if (is.null(payer_plan_period_id)) {
      whereClauses <- c(whereClauses, "payer_plan_period_id IS NULL")
    } else if (is(payer_plan_period_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("payer_plan_period_id = (", as.character(payer_plan_period_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("payer_plan_period_id = '", payer_plan_period_id,"'"))
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
      whereClasues <- c(whereClasues, paste0("drug_era_id = (", as.character(drug_era_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("drug_era_id = '", drug_era_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(drug_concept_id)) {
    if (is.null(drug_concept_id)) {
      whereClauses <- c(whereClauses, "drug_concept_id IS NULL")
    } else if (is(drug_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("drug_concept_id = (", as.character(drug_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("drug_concept_id = '", drug_concept_id,"'"))
    }
  }

  if (!missing(drug_era_start_date)) {
    if (is.null(drug_era_start_date)) {
      whereClauses <- c(whereClauses, "drug_era_start_date IS NULL")
    } else if (is(drug_era_start_date, "subQuery")){
      whereClasues <- c(whereClasues, paste0("drug_era_start_date = (", as.character(drug_era_start_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("drug_era_start_date = '", drug_era_start_date,"'"))
    }
  }

  if (!missing(drug_era_end_date)) {
    if (is.null(drug_era_end_date)) {
      whereClauses <- c(whereClauses, "drug_era_end_date IS NULL")
    } else if (is(drug_era_end_date, "subQuery")){
      whereClasues <- c(whereClasues, paste0("drug_era_end_date = (", as.character(drug_era_end_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("drug_era_end_date = '", drug_era_end_date,"'"))
    }
  }

  if (!missing(drug_exposure_count)) {
    if (is.null(drug_exposure_count)) {
      whereClauses <- c(whereClauses, "drug_exposure_count IS NULL")
    } else if (is(drug_exposure_count, "subQuery")){
      whereClasues <- c(whereClasues, paste0("drug_exposure_count = (", as.character(drug_exposure_count), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("drug_exposure_count = '", drug_exposure_count,"'"))
    }
  }

  if (!missing(gap_days)) {
    if (is.null(gap_days)) {
      whereClauses <- c(whereClauses, "gap_days IS NULL")
    } else if (is(gap_days, "subQuery")){
      whereClasues <- c(whereClasues, paste0("gap_days = (", as.character(gap_days), ")"))
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
      whereClasues <- c(whereClasues, paste0("dose_era_id = (", as.character(dose_era_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("dose_era_id = '", dose_era_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(drug_concept_id)) {
    if (is.null(drug_concept_id)) {
      whereClauses <- c(whereClauses, "drug_concept_id IS NULL")
    } else if (is(drug_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("drug_concept_id = (", as.character(drug_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("drug_concept_id = '", drug_concept_id,"'"))
    }
  }

  if (!missing(unit_concept_id)) {
    if (is.null(unit_concept_id)) {
      whereClauses <- c(whereClauses, "unit_concept_id IS NULL")
    } else if (is(unit_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("unit_concept_id = (", as.character(unit_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("unit_concept_id = '", unit_concept_id,"'"))
    }
  }

  if (!missing(dose_value)) {
    if (is.null(dose_value)) {
      whereClauses <- c(whereClauses, "dose_value IS NULL")
    } else if (is(dose_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("dose_value = (", as.character(dose_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("dose_value = '", dose_value,"'"))
    }
  }

  if (!missing(dose_era_start_date)) {
    if (is.null(dose_era_start_date)) {
      whereClauses <- c(whereClauses, "dose_era_start_date IS NULL")
    } else if (is(dose_era_start_date, "subQuery")){
      whereClasues <- c(whereClasues, paste0("dose_era_start_date = (", as.character(dose_era_start_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("dose_era_start_date = '", dose_era_start_date,"'"))
    }
  }

  if (!missing(dose_era_end_date)) {
    if (is.null(dose_era_end_date)) {
      whereClauses <- c(whereClauses, "dose_era_end_date IS NULL")
    } else if (is(dose_era_end_date, "subQuery")){
      whereClasues <- c(whereClasues, paste0("dose_era_end_date = (", as.character(dose_era_end_date), ")"))
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
      whereClasues <- c(whereClasues, paste0("condition_era_id = (", as.character(condition_era_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("condition_era_id = '", condition_era_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(condition_concept_id)) {
    if (is.null(condition_concept_id)) {
      whereClauses <- c(whereClauses, "condition_concept_id IS NULL")
    } else if (is(condition_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("condition_concept_id = (", as.character(condition_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("condition_concept_id = '", condition_concept_id,"'"))
    }
  }

  if (!missing(condition_era_start_date)) {
    if (is.null(condition_era_start_date)) {
      whereClauses <- c(whereClauses, "condition_era_start_date IS NULL")
    } else if (is(condition_era_start_date, "subQuery")){
      whereClasues <- c(whereClasues, paste0("condition_era_start_date = (", as.character(condition_era_start_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("condition_era_start_date = '", condition_era_start_date,"'"))
    }
  }

  if (!missing(condition_era_end_date)) {
    if (is.null(condition_era_end_date)) {
      whereClauses <- c(whereClauses, "condition_era_end_date IS NULL")
    } else if (is(condition_era_end_date, "subQuery")){
      whereClasues <- c(whereClasues, paste0("condition_era_end_date = (", as.character(condition_era_end_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("condition_era_end_date = '", condition_era_end_date,"'"))
    }
  }

  if (!missing(condition_occurrence_count)) {
    if (is.null(condition_occurrence_count)) {
      whereClauses <- c(whereClauses, "condition_occurrence_count IS NULL")
    } else if (is(condition_occurrence_count, "subQuery")){
      whereClasues <- c(whereClasues, paste0("condition_occurrence_count = (", as.character(condition_occurrence_count), ")"))
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
      whereClasues <- c(whereClasues, paste0("cdm_source_name = (", as.character(cdm_source_name), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cdm_source_name = '", cdm_source_name,"'"))
    }
  }

  if (!missing(cdm_source_abbreviation)) {
    if (is.null(cdm_source_abbreviation)) {
      whereClauses <- c(whereClauses, "cdm_source_abbreviation IS NULL")
    } else if (is(cdm_source_abbreviation, "subQuery")){
      whereClasues <- c(whereClasues, paste0("cdm_source_abbreviation = (", as.character(cdm_source_abbreviation), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cdm_source_abbreviation = '", cdm_source_abbreviation,"'"))
    }
  }

  if (!missing(cdm_holder)) {
    if (is.null(cdm_holder)) {
      whereClauses <- c(whereClauses, "cdm_holder IS NULL")
    } else if (is(cdm_holder, "subQuery")){
      whereClasues <- c(whereClasues, paste0("cdm_holder = (", as.character(cdm_holder), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cdm_holder = '", cdm_holder,"'"))
    }
  }

  if (!missing(source_description)) {
    if (is.null(source_description)) {
      whereClauses <- c(whereClauses, "source_description IS NULL")
    } else if (is(source_description, "subQuery")){
      whereClasues <- c(whereClasues, paste0("source_description = (", as.character(source_description), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("source_description = '", source_description,"'"))
    }
  }

  if (!missing(source_documentation_reference)) {
    if (is.null(source_documentation_reference)) {
      whereClauses <- c(whereClauses, "source_documentation_reference IS NULL")
    } else if (is(source_documentation_reference, "subQuery")){
      whereClasues <- c(whereClasues, paste0("source_documentation_reference = (", as.character(source_documentation_reference), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("source_documentation_reference = '", source_documentation_reference,"'"))
    }
  }

  if (!missing(cdm_etl_reference)) {
    if (is.null(cdm_etl_reference)) {
      whereClauses <- c(whereClauses, "cdm_etl_reference IS NULL")
    } else if (is(cdm_etl_reference, "subQuery")){
      whereClasues <- c(whereClasues, paste0("cdm_etl_reference = (", as.character(cdm_etl_reference), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cdm_etl_reference = '", cdm_etl_reference,"'"))
    }
  }

  if (!missing(source_release_date)) {
    if (is.null(source_release_date)) {
      whereClauses <- c(whereClauses, "source_release_date IS NULL")
    } else if (is(source_release_date, "subQuery")){
      whereClasues <- c(whereClasues, paste0("source_release_date = (", as.character(source_release_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("source_release_date = '", source_release_date,"'"))
    }
  }

  if (!missing(cdm_release_date)) {
    if (is.null(cdm_release_date)) {
      whereClauses <- c(whereClauses, "cdm_release_date IS NULL")
    } else if (is(cdm_release_date, "subQuery")){
      whereClasues <- c(whereClasues, paste0("cdm_release_date = (", as.character(cdm_release_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cdm_release_date = '", cdm_release_date,"'"))
    }
  }

  if (!missing(cdm_version)) {
    if (is.null(cdm_version)) {
      whereClauses <- c(whereClauses, "cdm_version IS NULL")
    } else if (is(cdm_version, "subQuery")){
      whereClasues <- c(whereClasues, paste0("cdm_version = (", as.character(cdm_version), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cdm_version = '", cdm_version,"'"))
    }
  }

  if (!missing(vocabulary_version)) {
    if (is.null(vocabulary_version)) {
      whereClauses <- c(whereClauses, "vocabulary_version IS NULL")
    } else if (is(vocabulary_version, "subQuery")){
      whereClasues <- c(whereClasues, paste0("vocabulary_version = (", as.character(vocabulary_version), ")"))
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
      whereClasues <- c(whereClasues, paste0("cohort_definition_id = (", as.character(cohort_definition_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cohort_definition_id = '", cohort_definition_id,"'"))
    }
  }

  if (!missing(subject_id)) {
    if (is.null(subject_id)) {
      whereClauses <- c(whereClauses, "subject_id IS NULL")
    } else if (is(subject_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("subject_id = (", as.character(subject_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("subject_id = '", subject_id,"'"))
    }
  }

  if (!missing(cohort_start_date)) {
    if (is.null(cohort_start_date)) {
      whereClauses <- c(whereClauses, "cohort_start_date IS NULL")
    } else if (is(cohort_start_date, "subQuery")){
      whereClasues <- c(whereClasues, paste0("cohort_start_date = (", as.character(cohort_start_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cohort_start_date = '", cohort_start_date,"'"))
    }
  }

  if (!missing(cohort_end_date)) {
    if (is.null(cohort_end_date)) {
      whereClauses <- c(whereClauses, "cohort_end_date IS NULL")
    } else if (is(cohort_end_date, "subQuery")){
      whereClasues <- c(whereClasues, paste0("cohort_end_date = (", as.character(cohort_end_date), ")"))
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
      whereClasues <- c(whereClasues, paste0("cohort_definition_id = (", as.character(cohort_definition_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cohort_definition_id = '", cohort_definition_id,"'"))
    }
  }

  if (!missing(cohort_definition_name)) {
    if (is.null(cohort_definition_name)) {
      whereClauses <- c(whereClauses, "cohort_definition_name IS NULL")
    } else if (is(cohort_definition_name, "subQuery")){
      whereClasues <- c(whereClasues, paste0("cohort_definition_name = (", as.character(cohort_definition_name), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cohort_definition_name = '", cohort_definition_name,"'"))
    }
  }

  if (!missing(cohort_definition_description)) {
    if (is.null(cohort_definition_description)) {
      whereClauses <- c(whereClauses, "cohort_definition_description IS NULL")
    } else if (is(cohort_definition_description, "subQuery")){
      whereClasues <- c(whereClasues, paste0("cohort_definition_description = (", as.character(cohort_definition_description), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cohort_definition_description = '", cohort_definition_description,"'"))
    }
  }

  if (!missing(definition_type_concept_id)) {
    if (is.null(definition_type_concept_id)) {
      whereClauses <- c(whereClauses, "definition_type_concept_id IS NULL")
    } else if (is(definition_type_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("definition_type_concept_id = (", as.character(definition_type_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("definition_type_concept_id = '", definition_type_concept_id,"'"))
    }
  }

  if (!missing(cohort_definition_syntax)) {
    if (is.null(cohort_definition_syntax)) {
      whereClauses <- c(whereClauses, "cohort_definition_syntax IS NULL")
    } else if (is(cohort_definition_syntax, "subQuery")){
      whereClasues <- c(whereClasues, paste0("cohort_definition_syntax = (", as.character(cohort_definition_syntax), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cohort_definition_syntax = '", cohort_definition_syntax,"'"))
    }
  }

  if (!missing(subject_concept_id)) {
    if (is.null(subject_concept_id)) {
      whereClauses <- c(whereClauses, "subject_concept_id IS NULL")
    } else if (is(subject_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("subject_concept_id = (", as.character(subject_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("subject_concept_id = '", subject_concept_id,"'"))
    }
  }

  if (!missing(cohort_instantiation_date)) {
    if (is.null(cohort_instantiation_date)) {
      whereClauses <- c(whereClauses, "cohort_instantiation_date IS NULL")
    } else if (is(cohort_instantiation_date, "subQuery")){
      whereClasues <- c(whereClasues, paste0("cohort_instantiation_date = (", as.character(cohort_instantiation_date), ")"))
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
      whereClasues <- c(whereClasues, paste0("cohort_definition_id = (", as.character(cohort_definition_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cohort_definition_id = '", cohort_definition_id,"'"))
    }
  }

  if (!missing(cohort_start_date)) {
    if (is.null(cohort_start_date)) {
      whereClauses <- c(whereClauses, "cohort_start_date IS NULL")
    } else if (is(cohort_start_date, "subQuery")){
      whereClasues <- c(whereClasues, paste0("cohort_start_date = (", as.character(cohort_start_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cohort_start_date = '", cohort_start_date,"'"))
    }
  }

  if (!missing(cohort_end_date)) {
    if (is.null(cohort_end_date)) {
      whereClauses <- c(whereClauses, "cohort_end_date IS NULL")
    } else if (is(cohort_end_date, "subQuery")){
      whereClasues <- c(whereClasues, paste0("cohort_end_date = (", as.character(cohort_end_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cohort_end_date = '", cohort_end_date,"'"))
    }
  }

  if (!missing(subject_id)) {
    if (is.null(subject_id)) {
      whereClauses <- c(whereClauses, "subject_id IS NULL")
    } else if (is(subject_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("subject_id = (", as.character(subject_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("subject_id = '", subject_id,"'"))
    }
  }

  if (!missing(attribute_definition_id)) {
    if (is.null(attribute_definition_id)) {
      whereClauses <- c(whereClauses, "attribute_definition_id IS NULL")
    } else if (is(attribute_definition_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("attribute_definition_id = (", as.character(attribute_definition_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("attribute_definition_id = '", attribute_definition_id,"'"))
    }
  }

  if (!missing(value_as_number)) {
    if (is.null(value_as_number)) {
      whereClauses <- c(whereClauses, "value_as_number IS NULL")
    } else if (is(value_as_number, "subQuery")){
      whereClasues <- c(whereClasues, paste0("value_as_number = (", as.character(value_as_number), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("value_as_number = '", value_as_number,"'"))
    }
  }

  if (!missing(value_as_concept_id)) {
    if (is.null(value_as_concept_id)) {
      whereClauses <- c(whereClauses, "value_as_concept_id IS NULL")
    } else if (is(value_as_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("value_as_concept_id = (", as.character(value_as_concept_id), ")"))
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
      whereClasues <- c(whereClasues, paste0("attribute_definition_id = (", as.character(attribute_definition_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("attribute_definition_id = '", attribute_definition_id,"'"))
    }
  }

  if (!missing(attribute_name)) {
    if (is.null(attribute_name)) {
      whereClauses <- c(whereClauses, "attribute_name IS NULL")
    } else if (is(attribute_name, "subQuery")){
      whereClasues <- c(whereClasues, paste0("attribute_name = (", as.character(attribute_name), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("attribute_name = '", attribute_name,"'"))
    }
  }

  if (!missing(attribute_description)) {
    if (is.null(attribute_description)) {
      whereClauses <- c(whereClauses, "attribute_description IS NULL")
    } else if (is(attribute_description, "subQuery")){
      whereClasues <- c(whereClasues, paste0("attribute_description = (", as.character(attribute_description), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("attribute_description = '", attribute_description,"'"))
    }
  }

  if (!missing(attribute_type_concept_id)) {
    if (is.null(attribute_type_concept_id)) {
      whereClauses <- c(whereClauses, "attribute_type_concept_id IS NULL")
    } else if (is(attribute_type_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("attribute_type_concept_id = (", as.character(attribute_type_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("attribute_type_concept_id = '", attribute_type_concept_id,"'"))
    }
  }

  if (!missing(attribute_syntax)) {
    if (is.null(attribute_syntax)) {
      whereClauses <- c(whereClauses, "attribute_syntax IS NULL")
    } else if (is(attribute_syntax, "subQuery")){
      whereClasues <- c(whereClasues, paste0("attribute_syntax = (", as.character(attribute_syntax), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("attribute_syntax = '", attribute_syntax,"'"))
    }
  }

  statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status;")
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
      whereClasues <- c(whereClasues, paste0("provider_id = (", as.character(provider_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("provider_id = '", provider_id,"'"))
    }
  }

  if (!missing(provider_name)) {
    if (is.null(provider_name)) {
      whereClauses <- c(whereClauses, "provider_name IS NULL")
    } else if (is(provider_name, "subQuery")){
      whereClasues <- c(whereClasues, paste0("provider_name = (", as.character(provider_name), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("provider_name = '", provider_name,"'"))
    }
  }

  if (!missing(npi)) {
    if (is.null(npi)) {
      whereClauses <- c(whereClauses, "npi IS NULL")
    } else if (is(npi, "subQuery")){
      whereClasues <- c(whereClasues, paste0("npi = (", as.character(npi), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("npi = '", npi,"'"))
    }
  }

  if (!missing(dea)) {
    if (is.null(dea)) {
      whereClauses <- c(whereClauses, "dea IS NULL")
    } else if (is(dea, "subQuery")){
      whereClasues <- c(whereClasues, paste0("dea = (", as.character(dea), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("dea = '", dea,"'"))
    }
  }

  if (!missing(specialty_concept_id)) {
    if (is.null(specialty_concept_id)) {
      whereClauses <- c(whereClauses, "specialty_concept_id IS NULL")
    } else if (is(specialty_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("specialty_concept_id = (", as.character(specialty_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("specialty_concept_id = '", specialty_concept_id,"'"))
    }
  }

  if (!missing(care_site_id)) {
    if (is.null(care_site_id)) {
      whereClauses <- c(whereClauses, "care_site_id IS NULL")
    } else if (is(care_site_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("care_site_id = (", as.character(care_site_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("care_site_id = '", care_site_id,"'"))
    }
  }

  if (!missing(year_of_birth)) {
    if (is.null(year_of_birth)) {
      whereClauses <- c(whereClauses, "year_of_birth IS NULL")
    } else if (is(year_of_birth, "subQuery")){
      whereClasues <- c(whereClasues, paste0("year_of_birth = (", as.character(year_of_birth), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("year_of_birth = '", year_of_birth,"'"))
    }
  }

  if (!missing(gender_concept_id)) {
    if (is.null(gender_concept_id)) {
      whereClauses <- c(whereClauses, "gender_concept_id IS NULL")
    } else if (is(gender_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("gender_concept_id = (", as.character(gender_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("gender_concept_id = '", gender_concept_id,"'"))
    }
  }

  if (!missing(provider_source_value)) {
    if (is.null(provider_source_value)) {
      whereClauses <- c(whereClauses, "provider_source_value IS NULL")
    } else if (is(provider_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("provider_source_value = (", as.character(provider_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("provider_source_value = '", provider_source_value,"'"))
    }
  }

  if (!missing(specialty_source_value)) {
    if (is.null(specialty_source_value)) {
      whereClauses <- c(whereClauses, "specialty_source_value IS NULL")
    } else if (is(specialty_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("specialty_source_value = (", as.character(specialty_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("specialty_source_value = '", specialty_source_value,"'"))
    }
  }

  if (!missing(specialty_source_concept_id)) {
    if (is.null(specialty_source_concept_id)) {
      whereClauses <- c(whereClauses, "specialty_source_concept_id IS NULL")
    } else if (is(specialty_source_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("specialty_source_concept_id = (", as.character(specialty_source_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("specialty_source_concept_id = '", specialty_source_concept_id,"'"))
    }
  }

  if (!missing(gender_source_value)) {
    if (is.null(gender_source_value)) {
      whereClauses <- c(whereClauses, "gender_source_value IS NULL")
    } else if (is(gender_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("gender_source_value = (", as.character(gender_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("gender_source_value = '", gender_source_value,"'"))
    }
  }

  if (!missing(gender_source_concept_id)) {
    if (is.null(gender_source_concept_id)) {
      whereClauses <- c(whereClauses, "gender_source_concept_id IS NULL")
    } else if (is(gender_source_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("gender_source_concept_id = (", as.character(gender_source_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("gender_source_concept_id = '", gender_source_concept_id,"'"))
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
      whereClasues <- c(whereClasues, paste0("care_site_id = (", as.character(care_site_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("care_site_id = '", care_site_id,"'"))
    }
  }

  if (!missing(care_site_name)) {
    if (is.null(care_site_name)) {
      whereClauses <- c(whereClauses, "care_site_name IS NULL")
    } else if (is(care_site_name, "subQuery")){
      whereClasues <- c(whereClasues, paste0("care_site_name = (", as.character(care_site_name), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("care_site_name = '", care_site_name,"'"))
    }
  }

  if (!missing(place_of_service_concept_id)) {
    if (is.null(place_of_service_concept_id)) {
      whereClauses <- c(whereClauses, "place_of_service_concept_id IS NULL")
    } else if (is(place_of_service_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("place_of_service_concept_id = (", as.character(place_of_service_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("place_of_service_concept_id = '", place_of_service_concept_id,"'"))
    }
  }

  if (!missing(location_id)) {
    if (is.null(location_id)) {
      whereClauses <- c(whereClauses, "location_id IS NULL")
    } else if (is(location_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("location_id = (", as.character(location_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("location_id = '", location_id,"'"))
    }
  }

  if (!missing(care_site_source_value)) {
    if (is.null(care_site_source_value)) {
      whereClauses <- c(whereClauses, "care_site_source_value IS NULL")
    } else if (is(care_site_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("care_site_source_value = (", as.character(care_site_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("care_site_source_value = '", care_site_source_value,"'"))
    }
  }

  if (!missing(place_of_service_source_value)) {
    if (is.null(place_of_service_source_value)) {
      whereClauses <- c(whereClauses, "place_of_service_source_value IS NULL")
    } else if (is(place_of_service_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("place_of_service_source_value = (", as.character(place_of_service_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("place_of_service_source_value = '", place_of_service_source_value,"'"))
    }
  }

  statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") != ",rowCount ," THEN 'FAIL' ELSE 'PASS' END AS status;")
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
      whereClasues <- c(whereClasues, paste0("location_id = (", as.character(location_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("location_id = '", location_id,"'"))
    }
  }

  if (!missing(address_1)) {
    if (is.null(address_1)) {
      whereClauses <- c(whereClauses, "address_1 IS NULL")
    } else if (is(address_1, "subQuery")){
      whereClasues <- c(whereClasues, paste0("address_1 = (", as.character(address_1), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("address_1 = '", address_1,"'"))
    }
  }

  if (!missing(address_2)) {
    if (is.null(address_2)) {
      whereClauses <- c(whereClauses, "address_2 IS NULL")
    } else if (is(address_2, "subQuery")){
      whereClasues <- c(whereClasues, paste0("address_2 = (", as.character(address_2), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("address_2 = '", address_2,"'"))
    }
  }

  if (!missing(city)) {
    if (is.null(city)) {
      whereClauses <- c(whereClauses, "city IS NULL")
    } else if (is(city, "subQuery")){
      whereClasues <- c(whereClasues, paste0("city = (", as.character(city), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("city = '", city,"'"))
    }
  }

  if (!missing(state)) {
    if (is.null(state)) {
      whereClauses <- c(whereClauses, "state IS NULL")
    } else if (is(state, "subQuery")){
      whereClasues <- c(whereClasues, paste0("state = (", as.character(state), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("state = '", state,"'"))
    }
  }

  if (!missing(zip)) {
    if (is.null(zip)) {
      whereClauses <- c(whereClauses, "zip IS NULL")
    } else if (is(zip, "subQuery")){
      whereClasues <- c(whereClasues, paste0("zip = (", as.character(zip), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("zip = '", zip,"'"))
    }
  }

  if (!missing(county)) {
    if (is.null(county)) {
      whereClauses <- c(whereClauses, "county IS NULL")
    } else if (is(county, "subQuery")){
      whereClasues <- c(whereClasues, paste0("county = (", as.character(county), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("county = '", county,"'"))
    }
  }

  if (!missing(location_source_value)) {
    if (is.null(location_source_value)) {
      whereClauses <- c(whereClauses, "location_source_value IS NULL")
    } else if (is(location_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("location_source_value = (", as.character(location_source_value), ")"))
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
      whereClasues <- c(whereClasues, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(gender_concept_id)) {
    if (is.null(gender_concept_id)) {
      whereClauses <- c(whereClauses, "gender_concept_id IS NULL")
    } else if (is(gender_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("gender_concept_id = (", as.character(gender_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("gender_concept_id = '", gender_concept_id,"'"))
    }
  }

  if (!missing(year_of_birth)) {
    if (is.null(year_of_birth)) {
      whereClauses <- c(whereClauses, "year_of_birth IS NULL")
    } else if (is(year_of_birth, "subQuery")){
      whereClasues <- c(whereClasues, paste0("year_of_birth = (", as.character(year_of_birth), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("year_of_birth = '", year_of_birth,"'"))
    }
  }

  if (!missing(month_of_birth)) {
    if (is.null(month_of_birth)) {
      whereClauses <- c(whereClauses, "month_of_birth IS NULL")
    } else if (is(month_of_birth, "subQuery")){
      whereClasues <- c(whereClasues, paste0("month_of_birth = (", as.character(month_of_birth), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("month_of_birth = '", month_of_birth,"'"))
    }
  }

  if (!missing(day_of_birth)) {
    if (is.null(day_of_birth)) {
      whereClauses <- c(whereClauses, "day_of_birth IS NULL")
    } else if (is(day_of_birth, "subQuery")){
      whereClasues <- c(whereClasues, paste0("day_of_birth = (", as.character(day_of_birth), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("day_of_birth = '", day_of_birth,"'"))
    }
  }

  if (!missing(time_of_birth)) {
    if (is.null(time_of_birth)) {
      whereClauses <- c(whereClauses, "time_of_birth IS NULL")
    } else if (is(time_of_birth, "subQuery")){
      whereClasues <- c(whereClasues, paste0("time_of_birth = (", as.character(time_of_birth), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("time_of_birth = '", time_of_birth,"'"))
    }
  }

  if (!missing(race_concept_id)) {
    if (is.null(race_concept_id)) {
      whereClauses <- c(whereClauses, "race_concept_id IS NULL")
    } else if (is(race_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("race_concept_id = (", as.character(race_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("race_concept_id = '", race_concept_id,"'"))
    }
  }

  if (!missing(ethnicity_concept_id)) {
    if (is.null(ethnicity_concept_id)) {
      whereClauses <- c(whereClauses, "ethnicity_concept_id IS NULL")
    } else if (is(ethnicity_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("ethnicity_concept_id = (", as.character(ethnicity_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("ethnicity_concept_id = '", ethnicity_concept_id,"'"))
    }
  }

  if (!missing(location_id)) {
    if (is.null(location_id)) {
      whereClauses <- c(whereClauses, "location_id IS NULL")
    } else if (is(location_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("location_id = (", as.character(location_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("location_id = '", location_id,"'"))
    }
  }

  if (!missing(provider_id)) {
    if (is.null(provider_id)) {
      whereClauses <- c(whereClauses, "provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("provider_id = (", as.character(provider_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("provider_id = '", provider_id,"'"))
    }
  }

  if (!missing(care_site_id)) {
    if (is.null(care_site_id)) {
      whereClauses <- c(whereClauses, "care_site_id IS NULL")
    } else if (is(care_site_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("care_site_id = (", as.character(care_site_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("care_site_id = '", care_site_id,"'"))
    }
  }

  if (!missing(person_source_value)) {
    if (is.null(person_source_value)) {
      whereClauses <- c(whereClauses, "person_source_value IS NULL")
    } else if (is(person_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("person_source_value = (", as.character(person_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_source_value = '", person_source_value,"'"))
    }
  }

  if (!missing(gender_source_value)) {
    if (is.null(gender_source_value)) {
      whereClauses <- c(whereClauses, "gender_source_value IS NULL")
    } else if (is(gender_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("gender_source_value = (", as.character(gender_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("gender_source_value = '", gender_source_value,"'"))
    }
  }

  if (!missing(gender_source_concept_id)) {
    if (is.null(gender_source_concept_id)) {
      whereClauses <- c(whereClauses, "gender_source_concept_id IS NULL")
    } else if (is(gender_source_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("gender_source_concept_id = (", as.character(gender_source_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("gender_source_concept_id = '", gender_source_concept_id,"'"))
    }
  }

  if (!missing(race_source_value)) {
    if (is.null(race_source_value)) {
      whereClauses <- c(whereClauses, "race_source_value IS NULL")
    } else if (is(race_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("race_source_value = (", as.character(race_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("race_source_value = '", race_source_value,"'"))
    }
  }

  if (!missing(race_source_concept_id)) {
    if (is.null(race_source_concept_id)) {
      whereClauses <- c(whereClauses, "race_source_concept_id IS NULL")
    } else if (is(race_source_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("race_source_concept_id = (", as.character(race_source_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("race_source_concept_id = '", race_source_concept_id,"'"))
    }
  }

  if (!missing(ethnicity_source_value)) {
    if (is.null(ethnicity_source_value)) {
      whereClauses <- c(whereClauses, "ethnicity_source_value IS NULL")
    } else if (is(ethnicity_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("ethnicity_source_value = (", as.character(ethnicity_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("ethnicity_source_value = '", ethnicity_source_value,"'"))
    }
  }

  if (!missing(ethnicity_source_concept_id)) {
    if (is.null(ethnicity_source_concept_id)) {
      whereClauses <- c(whereClauses, "ethnicity_source_concept_id IS NULL")
    } else if (is(ethnicity_source_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("ethnicity_source_concept_id = (", as.character(ethnicity_source_concept_id), ")"))
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
      whereClasues <- c(whereClasues, paste0("observation_period_id = (", as.character(observation_period_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("observation_period_id = '", observation_period_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(observation_period_start_date)) {
    if (is.null(observation_period_start_date)) {
      whereClauses <- c(whereClauses, "observation_period_start_date IS NULL")
    } else if (is(observation_period_start_date, "subQuery")){
      whereClasues <- c(whereClasues, paste0("observation_period_start_date = (", as.character(observation_period_start_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("observation_period_start_date = '", observation_period_start_date,"'"))
    }
  }

  if (!missing(observation_period_end_date)) {
    if (is.null(observation_period_end_date)) {
      whereClauses <- c(whereClauses, "observation_period_end_date IS NULL")
    } else if (is(observation_period_end_date, "subQuery")){
      whereClasues <- c(whereClasues, paste0("observation_period_end_date = (", as.character(observation_period_end_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("observation_period_end_date = '", observation_period_end_date,"'"))
    }
  }

  if (!missing(period_type_concept_id)) {
    if (is.null(period_type_concept_id)) {
      whereClauses <- c(whereClauses, "period_type_concept_id IS NULL")
    } else if (is(period_type_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("period_type_concept_id = (", as.character(period_type_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("period_type_concept_id = '", period_type_concept_id,"'"))
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
      whereClasues <- c(whereClasues, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(death_date)) {
    if (is.null(death_date)) {
      whereClauses <- c(whereClauses, "death_date IS NULL")
    } else if (is(death_date, "subQuery")){
      whereClasues <- c(whereClasues, paste0("death_date = (", as.character(death_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("death_date = '", death_date,"'"))
    }
  }

  if (!missing(death_type_concept_id)) {
    if (is.null(death_type_concept_id)) {
      whereClauses <- c(whereClauses, "death_type_concept_id IS NULL")
    } else if (is(death_type_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("death_type_concept_id = (", as.character(death_type_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("death_type_concept_id = '", death_type_concept_id,"'"))
    }
  }

  if (!missing(cause_concept_id)) {
    if (is.null(cause_concept_id)) {
      whereClauses <- c(whereClauses, "cause_concept_id IS NULL")
    } else if (is(cause_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("cause_concept_id = (", as.character(cause_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cause_concept_id = '", cause_concept_id,"'"))
    }
  }

  if (!missing(cause_source_value)) {
    if (is.null(cause_source_value)) {
      whereClauses <- c(whereClauses, "cause_source_value IS NULL")
    } else if (is(cause_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("cause_source_value = (", as.character(cause_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cause_source_value = '", cause_source_value,"'"))
    }
  }

  if (!missing(cause_source_concept_id)) {
    if (is.null(cause_source_concept_id)) {
      whereClauses <- c(whereClauses, "cause_source_concept_id IS NULL")
    } else if (is(cause_source_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("cause_source_concept_id = (", as.character(cause_source_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cause_source_concept_id = '", cause_source_concept_id,"'"))
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
      whereClasues <- c(whereClasues, paste0("visit_occurrence_id = (", as.character(visit_occurrence_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_occurrence_id = '", visit_occurrence_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(visit_concept_id)) {
    if (is.null(visit_concept_id)) {
      whereClauses <- c(whereClauses, "visit_concept_id IS NULL")
    } else if (is(visit_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("visit_concept_id = (", as.character(visit_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_concept_id = '", visit_concept_id,"'"))
    }
  }

  if (!missing(visit_start_date)) {
    if (is.null(visit_start_date)) {
      whereClauses <- c(whereClauses, "visit_start_date IS NULL")
    } else if (is(visit_start_date, "subQuery")){
      whereClasues <- c(whereClasues, paste0("visit_start_date = (", as.character(visit_start_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_start_date = '", visit_start_date,"'"))
    }
  }

  if (!missing(visit_start_time)) {
    if (is.null(visit_start_time)) {
      whereClauses <- c(whereClauses, "visit_start_time IS NULL")
    } else if (is(visit_start_time, "subQuery")){
      whereClasues <- c(whereClasues, paste0("visit_start_time = (", as.character(visit_start_time), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_start_time = '", visit_start_time,"'"))
    }
  }

  if (!missing(visit_end_date)) {
    if (is.null(visit_end_date)) {
      whereClauses <- c(whereClauses, "visit_end_date IS NULL")
    } else if (is(visit_end_date, "subQuery")){
      whereClasues <- c(whereClasues, paste0("visit_end_date = (", as.character(visit_end_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_end_date = '", visit_end_date,"'"))
    }
  }

  if (!missing(visit_end_time)) {
    if (is.null(visit_end_time)) {
      whereClauses <- c(whereClauses, "visit_end_time IS NULL")
    } else if (is(visit_end_time, "subQuery")){
      whereClasues <- c(whereClasues, paste0("visit_end_time = (", as.character(visit_end_time), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_end_time = '", visit_end_time,"'"))
    }
  }

  if (!missing(visit_type_concept_id)) {
    if (is.null(visit_type_concept_id)) {
      whereClauses <- c(whereClauses, "visit_type_concept_id IS NULL")
    } else if (is(visit_type_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("visit_type_concept_id = (", as.character(visit_type_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_type_concept_id = '", visit_type_concept_id,"'"))
    }
  }

  if (!missing(provider_id)) {
    if (is.null(provider_id)) {
      whereClauses <- c(whereClauses, "provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("provider_id = (", as.character(provider_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("provider_id = '", provider_id,"'"))
    }
  }

  if (!missing(care_site_id)) {
    if (is.null(care_site_id)) {
      whereClauses <- c(whereClauses, "care_site_id IS NULL")
    } else if (is(care_site_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("care_site_id = (", as.character(care_site_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("care_site_id = '", care_site_id,"'"))
    }
  }

  if (!missing(visit_source_value)) {
    if (is.null(visit_source_value)) {
      whereClauses <- c(whereClauses, "visit_source_value IS NULL")
    } else if (is(visit_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("visit_source_value = (", as.character(visit_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_source_value = '", visit_source_value,"'"))
    }
  }

  if (!missing(visit_source_concept_id)) {
    if (is.null(visit_source_concept_id)) {
      whereClauses <- c(whereClauses, "visit_source_concept_id IS NULL")
    } else if (is(visit_source_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("visit_source_concept_id = (", as.character(visit_source_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_source_concept_id = '", visit_source_concept_id,"'"))
    }
  }

  statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") != ",rowCount ," THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

expect_count_condition_occurrence <- function(rowCount, condition_occurrence_id, person_id, condition_concept_id, condition_source_concept_id, condition_source_value, condition_start_date, provider_id, visit_occurrence_id, condition_type_concept_id, condition_end_date, stop_reason) {

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
      whereClasues <- c(whereClasues, paste0("condition_occurrence_id = (", as.character(condition_occurrence_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("condition_occurrence_id = '", condition_occurrence_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(condition_concept_id)) {
    if (is.null(condition_concept_id)) {
      whereClauses <- c(whereClauses, "condition_concept_id IS NULL")
    } else if (is(condition_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("condition_concept_id = (", as.character(condition_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("condition_concept_id = '", condition_concept_id,"'"))
    }
  }

  if (!missing(condition_source_concept_id)) {
    if (is.null(condition_source_concept_id)) {
      whereClauses <- c(whereClauses, "condition_source_concept_id IS NULL")
    } else if (is(condition_source_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("condition_source_concept_id = (", as.character(condition_source_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("condition_source_concept_id = '", condition_source_concept_id,"'"))
    }
  }

  if (!missing(condition_source_value)) {
    if (is.null(condition_source_value)) {
      whereClauses <- c(whereClauses, "condition_source_value IS NULL")
    } else if (is(condition_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("condition_source_value = (", as.character(condition_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("condition_source_value = '", condition_source_value,"'"))
    }
  }

  if (!missing(condition_start_date)) {
    if (is.null(condition_start_date)) {
      whereClauses <- c(whereClauses, "condition_start_date IS NULL")
    } else if (is(condition_start_date, "subQuery")){
      whereClasues <- c(whereClasues, paste0("condition_start_date = (", as.character(condition_start_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("condition_start_date = '", condition_start_date,"'"))
    }
  }

  if (!missing(provider_id)) {
    if (is.null(provider_id)) {
      whereClauses <- c(whereClauses, "provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("provider_id = (", as.character(provider_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("provider_id = '", provider_id,"'"))
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (is.null(visit_occurrence_id)) {
      whereClauses <- c(whereClauses, "visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("visit_occurrence_id = (", as.character(visit_occurrence_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_occurrence_id = '", visit_occurrence_id,"'"))
    }
  }

  if (!missing(condition_type_concept_id)) {
    if (is.null(condition_type_concept_id)) {
      whereClauses <- c(whereClauses, "condition_type_concept_id IS NULL")
    } else if (is(condition_type_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("condition_type_concept_id = (", as.character(condition_type_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("condition_type_concept_id = '", condition_type_concept_id,"'"))
    }
  }

  if (!missing(condition_end_date)) {
    if (is.null(condition_end_date)) {
      whereClauses <- c(whereClauses, "condition_end_date IS NULL")
    } else if (is(condition_end_date, "subQuery")){
      whereClasues <- c(whereClasues, paste0("condition_end_date = (", as.character(condition_end_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("condition_end_date = '", condition_end_date,"'"))
    }
  }

  if (!missing(stop_reason)) {
    if (is.null(stop_reason)) {
      whereClauses <- c(whereClauses, "stop_reason IS NULL")
    } else if (is(stop_reason, "subQuery")){
      whereClasues <- c(whereClasues, paste0("stop_reason = (", as.character(stop_reason), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("stop_reason = '", stop_reason,"'"))
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
      whereClasues <- c(whereClasues, paste0("device_exposure_id = (", as.character(device_exposure_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("device_exposure_id = '", device_exposure_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(device_concept_id)) {
    if (is.null(device_concept_id)) {
      whereClauses <- c(whereClauses, "device_concept_id IS NULL")
    } else if (is(device_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("device_concept_id = (", as.character(device_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("device_concept_id = '", device_concept_id,"'"))
    }
  }

  if (!missing(device_exposure_start_date)) {
    if (is.null(device_exposure_start_date)) {
      whereClauses <- c(whereClauses, "device_exposure_start_date IS NULL")
    } else if (is(device_exposure_start_date, "subQuery")){
      whereClasues <- c(whereClasues, paste0("device_exposure_start_date = (", as.character(device_exposure_start_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("device_exposure_start_date = '", device_exposure_start_date,"'"))
    }
  }

  if (!missing(device_exposure_end_date)) {
    if (is.null(device_exposure_end_date)) {
      whereClauses <- c(whereClauses, "device_exposure_end_date IS NULL")
    } else if (is(device_exposure_end_date, "subQuery")){
      whereClasues <- c(whereClasues, paste0("device_exposure_end_date = (", as.character(device_exposure_end_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("device_exposure_end_date = '", device_exposure_end_date,"'"))
    }
  }

  if (!missing(device_type_concept_id)) {
    if (is.null(device_type_concept_id)) {
      whereClauses <- c(whereClauses, "device_type_concept_id IS NULL")
    } else if (is(device_type_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("device_type_concept_id = (", as.character(device_type_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("device_type_concept_id = '", device_type_concept_id,"'"))
    }
  }

  if (!missing(unique_device_id)) {
    if (is.null(unique_device_id)) {
      whereClauses <- c(whereClauses, "unique_device_id IS NULL")
    } else if (is(unique_device_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("unique_device_id = (", as.character(unique_device_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("unique_device_id = '", unique_device_id,"'"))
    }
  }

  if (!missing(quantity)) {
    if (is.null(quantity)) {
      whereClauses <- c(whereClauses, "quantity IS NULL")
    } else if (is(quantity, "subQuery")){
      whereClasues <- c(whereClasues, paste0("quantity = (", as.character(quantity), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("quantity = '", quantity,"'"))
    }
  }

  if (!missing(provider_id)) {
    if (is.null(provider_id)) {
      whereClauses <- c(whereClauses, "provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("provider_id = (", as.character(provider_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("provider_id = '", provider_id,"'"))
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (is.null(visit_occurrence_id)) {
      whereClauses <- c(whereClauses, "visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("visit_occurrence_id = (", as.character(visit_occurrence_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_occurrence_id = '", visit_occurrence_id,"'"))
    }
  }

  if (!missing(device_source_value)) {
    if (is.null(device_source_value)) {
      whereClauses <- c(whereClauses, "device_source_value IS NULL")
    } else if (is(device_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("device_source_value = (", as.character(device_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("device_source_value = '", device_source_value,"'"))
    }
  }

  if (!missing(device_source_concept_id)) {
    if (is.null(device_source_concept_id)) {
      whereClauses <- c(whereClauses, "device_source_concept_id IS NULL")
    } else if (is(device_source_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("device_source_concept_id = (", as.character(device_source_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("device_source_concept_id = '", device_source_concept_id,"'"))
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
      whereClasues <- c(whereClasues, paste0("observation_id = (", as.character(observation_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("observation_id = '", observation_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(observation_concept_id)) {
    if (is.null(observation_concept_id)) {
      whereClauses <- c(whereClauses, "observation_concept_id IS NULL")
    } else if (is(observation_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("observation_concept_id = (", as.character(observation_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("observation_concept_id = '", observation_concept_id,"'"))
    }
  }

  if (!missing(observation_date)) {
    if (is.null(observation_date)) {
      whereClauses <- c(whereClauses, "observation_date IS NULL")
    } else if (is(observation_date, "subQuery")){
      whereClasues <- c(whereClasues, paste0("observation_date = (", as.character(observation_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("observation_date = '", observation_date,"'"))
    }
  }

  if (!missing(observation_time)) {
    if (is.null(observation_time)) {
      whereClauses <- c(whereClauses, "observation_time IS NULL")
    } else if (is(observation_time, "subQuery")){
      whereClasues <- c(whereClasues, paste0("observation_time = (", as.character(observation_time), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("observation_time = '", observation_time,"'"))
    }
  }

  if (!missing(observation_type_concept_id)) {
    if (is.null(observation_type_concept_id)) {
      whereClauses <- c(whereClauses, "observation_type_concept_id IS NULL")
    } else if (is(observation_type_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("observation_type_concept_id = (", as.character(observation_type_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("observation_type_concept_id = '", observation_type_concept_id,"'"))
    }
  }

  if (!missing(value_as_number)) {
    if (is.null(value_as_number)) {
      whereClauses <- c(whereClauses, "value_as_number IS NULL")
    } else if (is(value_as_number, "subQuery")){
      whereClasues <- c(whereClasues, paste0("value_as_number = (", as.character(value_as_number), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("value_as_number = '", value_as_number,"'"))
    }
  }

  if (!missing(value_as_string)) {
    if (is.null(value_as_string)) {
      whereClauses <- c(whereClauses, "value_as_string IS NULL")
    } else if (is(value_as_string, "subQuery")){
      whereClasues <- c(whereClasues, paste0("value_as_string = (", as.character(value_as_string), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("value_as_string = '", value_as_string,"'"))
    }
  }

  if (!missing(value_as_concept_id)) {
    if (is.null(value_as_concept_id)) {
      whereClauses <- c(whereClauses, "value_as_concept_id IS NULL")
    } else if (is(value_as_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("value_as_concept_id = (", as.character(value_as_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("value_as_concept_id = '", value_as_concept_id,"'"))
    }
  }

  if (!missing(qualifier_concept_id)) {
    if (is.null(qualifier_concept_id)) {
      whereClauses <- c(whereClauses, "qualifier_concept_id IS NULL")
    } else if (is(qualifier_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("qualifier_concept_id = (", as.character(qualifier_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("qualifier_concept_id = '", qualifier_concept_id,"'"))
    }
  }

  if (!missing(unit_concept_id)) {
    if (is.null(unit_concept_id)) {
      whereClauses <- c(whereClauses, "unit_concept_id IS NULL")
    } else if (is(unit_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("unit_concept_id = (", as.character(unit_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("unit_concept_id = '", unit_concept_id,"'"))
    }
  }

  if (!missing(provider_id)) {
    if (is.null(provider_id)) {
      whereClauses <- c(whereClauses, "provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("provider_id = (", as.character(provider_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("provider_id = '", provider_id,"'"))
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (is.null(visit_occurrence_id)) {
      whereClauses <- c(whereClauses, "visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("visit_occurrence_id = (", as.character(visit_occurrence_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_occurrence_id = '", visit_occurrence_id,"'"))
    }
  }

  if (!missing(observation_source_value)) {
    if (is.null(observation_source_value)) {
      whereClauses <- c(whereClauses, "observation_source_value IS NULL")
    } else if (is(observation_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("observation_source_value = (", as.character(observation_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("observation_source_value = '", observation_source_value,"'"))
    }
  }

  if (!missing(observation_source_concept_id)) {
    if (is.null(observation_source_concept_id)) {
      whereClauses <- c(whereClauses, "observation_source_concept_id IS NULL")
    } else if (is(observation_source_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("observation_source_concept_id = (", as.character(observation_source_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("observation_source_concept_id = '", observation_source_concept_id,"'"))
    }
  }

  if (!missing(unit_source_value)) {
    if (is.null(unit_source_value)) {
      whereClauses <- c(whereClauses, "unit_source_value IS NULL")
    } else if (is(unit_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("unit_source_value = (", as.character(unit_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("unit_source_value = '", unit_source_value,"'"))
    }
  }

  if (!missing(qualifier_source_value)) {
    if (is.null(qualifier_source_value)) {
      whereClauses <- c(whereClauses, "qualifier_source_value IS NULL")
    } else if (is(qualifier_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("qualifier_source_value = (", as.character(qualifier_source_value), ")"))
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
      whereClasues <- c(whereClasues, paste0("measurement_id = (", as.character(measurement_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("measurement_id = '", measurement_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(measurement_concept_id)) {
    if (is.null(measurement_concept_id)) {
      whereClauses <- c(whereClauses, "measurement_concept_id IS NULL")
    } else if (is(measurement_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("measurement_concept_id = (", as.character(measurement_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("measurement_concept_id = '", measurement_concept_id,"'"))
    }
  }

  if (!missing(measurement_date)) {
    if (is.null(measurement_date)) {
      whereClauses <- c(whereClauses, "measurement_date IS NULL")
    } else if (is(measurement_date, "subQuery")){
      whereClasues <- c(whereClasues, paste0("measurement_date = (", as.character(measurement_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("measurement_date = '", measurement_date,"'"))
    }
  }

  if (!missing(measurement_time)) {
    if (is.null(measurement_time)) {
      whereClauses <- c(whereClauses, "measurement_time IS NULL")
    } else if (is(measurement_time, "subQuery")){
      whereClasues <- c(whereClasues, paste0("measurement_time = (", as.character(measurement_time), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("measurement_time = '", measurement_time,"'"))
    }
  }

  if (!missing(measurement_type_concept_id)) {
    if (is.null(measurement_type_concept_id)) {
      whereClauses <- c(whereClauses, "measurement_type_concept_id IS NULL")
    } else if (is(measurement_type_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("measurement_type_concept_id = (", as.character(measurement_type_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("measurement_type_concept_id = '", measurement_type_concept_id,"'"))
    }
  }

  if (!missing(operator_concept_id)) {
    if (is.null(operator_concept_id)) {
      whereClauses <- c(whereClauses, "operator_concept_id IS NULL")
    } else if (is(operator_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("operator_concept_id = (", as.character(operator_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("operator_concept_id = '", operator_concept_id,"'"))
    }
  }

  if (!missing(value_as_number)) {
    if (is.null(value_as_number)) {
      whereClauses <- c(whereClauses, "value_as_number IS NULL")
    } else if (is(value_as_number, "subQuery")){
      whereClasues <- c(whereClasues, paste0("value_as_number = (", as.character(value_as_number), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("value_as_number = '", value_as_number,"'"))
    }
  }

  if (!missing(value_as_concept_id)) {
    if (is.null(value_as_concept_id)) {
      whereClauses <- c(whereClauses, "value_as_concept_id IS NULL")
    } else if (is(value_as_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("value_as_concept_id = (", as.character(value_as_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("value_as_concept_id = '", value_as_concept_id,"'"))
    }
  }

  if (!missing(unit_concept_id)) {
    if (is.null(unit_concept_id)) {
      whereClauses <- c(whereClauses, "unit_concept_id IS NULL")
    } else if (is(unit_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("unit_concept_id = (", as.character(unit_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("unit_concept_id = '", unit_concept_id,"'"))
    }
  }

  if (!missing(range_low)) {
    if (is.null(range_low)) {
      whereClauses <- c(whereClauses, "range_low IS NULL")
    } else if (is(range_low, "subQuery")){
      whereClasues <- c(whereClasues, paste0("range_low = (", as.character(range_low), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("range_low = '", range_low,"'"))
    }
  }

  if (!missing(range_high)) {
    if (is.null(range_high)) {
      whereClauses <- c(whereClauses, "range_high IS NULL")
    } else if (is(range_high, "subQuery")){
      whereClasues <- c(whereClasues, paste0("range_high = (", as.character(range_high), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("range_high = '", range_high,"'"))
    }
  }

  if (!missing(provider_id)) {
    if (is.null(provider_id)) {
      whereClauses <- c(whereClauses, "provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("provider_id = (", as.character(provider_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("provider_id = '", provider_id,"'"))
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (is.null(visit_occurrence_id)) {
      whereClauses <- c(whereClauses, "visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("visit_occurrence_id = (", as.character(visit_occurrence_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_occurrence_id = '", visit_occurrence_id,"'"))
    }
  }

  if (!missing(measurement_source_value)) {
    if (is.null(measurement_source_value)) {
      whereClauses <- c(whereClauses, "measurement_source_value IS NULL")
    } else if (is(measurement_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("measurement_source_value = (", as.character(measurement_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("measurement_source_value = '", measurement_source_value,"'"))
    }
  }

  if (!missing(measurement_source_concept_id)) {
    if (is.null(measurement_source_concept_id)) {
      whereClauses <- c(whereClauses, "measurement_source_concept_id IS NULL")
    } else if (is(measurement_source_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("measurement_source_concept_id = (", as.character(measurement_source_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("measurement_source_concept_id = '", measurement_source_concept_id,"'"))
    }
  }

  if (!missing(unit_source_value)) {
    if (is.null(unit_source_value)) {
      whereClauses <- c(whereClauses, "unit_source_value IS NULL")
    } else if (is(unit_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("unit_source_value = (", as.character(unit_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("unit_source_value = '", unit_source_value,"'"))
    }
  }

  if (!missing(value_source_value)) {
    if (is.null(value_source_value)) {
      whereClauses <- c(whereClauses, "value_source_value IS NULL")
    } else if (is(value_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("value_source_value = (", as.character(value_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("value_source_value = '", value_source_value,"'"))
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
      whereClasues <- c(whereClasues, paste0("procedure_occurrence_id = (", as.character(procedure_occurrence_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("procedure_occurrence_id = '", procedure_occurrence_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(procedure_concept_id)) {
    if (is.null(procedure_concept_id)) {
      whereClauses <- c(whereClauses, "procedure_concept_id IS NULL")
    } else if (is(procedure_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("procedure_concept_id = (", as.character(procedure_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("procedure_concept_id = '", procedure_concept_id,"'"))
    }
  }

  if (!missing(procedure_date)) {
    if (is.null(procedure_date)) {
      whereClauses <- c(whereClauses, "procedure_date IS NULL")
    } else if (is(procedure_date, "subQuery")){
      whereClasues <- c(whereClasues, paste0("procedure_date = (", as.character(procedure_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("procedure_date = '", procedure_date,"'"))
    }
  }

  if (!missing(procedure_type_concept_id)) {
    if (is.null(procedure_type_concept_id)) {
      whereClauses <- c(whereClauses, "procedure_type_concept_id IS NULL")
    } else if (is(procedure_type_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("procedure_type_concept_id = (", as.character(procedure_type_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("procedure_type_concept_id = '", procedure_type_concept_id,"'"))
    }
  }

  if (!missing(modifier_concept_id)) {
    if (is.null(modifier_concept_id)) {
      whereClauses <- c(whereClauses, "modifier_concept_id IS NULL")
    } else if (is(modifier_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("modifier_concept_id = (", as.character(modifier_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("modifier_concept_id = '", modifier_concept_id,"'"))
    }
  }

  if (!missing(quantity)) {
    if (is.null(quantity)) {
      whereClauses <- c(whereClauses, "quantity IS NULL")
    } else if (is(quantity, "subQuery")){
      whereClasues <- c(whereClasues, paste0("quantity = (", as.character(quantity), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("quantity = '", quantity,"'"))
    }
  }

  if (!missing(provider_id)) {
    if (is.null(provider_id)) {
      whereClauses <- c(whereClauses, "provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("provider_id = (", as.character(provider_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("provider_id = '", provider_id,"'"))
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (is.null(visit_occurrence_id)) {
      whereClauses <- c(whereClauses, "visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("visit_occurrence_id = (", as.character(visit_occurrence_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_occurrence_id = '", visit_occurrence_id,"'"))
    }
  }

  if (!missing(procedure_source_value)) {
    if (is.null(procedure_source_value)) {
      whereClauses <- c(whereClauses, "procedure_source_value IS NULL")
    } else if (is(procedure_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("procedure_source_value = (", as.character(procedure_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("procedure_source_value = '", procedure_source_value,"'"))
    }
  }

  if (!missing(procedure_source_concept_id)) {
    if (is.null(procedure_source_concept_id)) {
      whereClauses <- c(whereClauses, "procedure_source_concept_id IS NULL")
    } else if (is(procedure_source_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("procedure_source_concept_id = (", as.character(procedure_source_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("procedure_source_concept_id = '", procedure_source_concept_id,"'"))
    }
  }

  if (!missing(qualifier_source_value)) {
    if (is.null(qualifier_source_value)) {
      whereClauses <- c(whereClauses, "qualifier_source_value IS NULL")
    } else if (is(qualifier_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("qualifier_source_value = (", as.character(qualifier_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("qualifier_source_value = '", qualifier_source_value,"'"))
    }
  }

  statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") != ",rowCount ," THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

expect_count_drug_exposure <- function(rowCount, drug_exposure_id, person_id, drug_exposure_start_date, drug_concept_id, drug_source_value, drug_source_concept_id, drug_type_concept_id, provider_id, visit_occurrence_id, route_concept_id, route_source_value, quantity, refills, days_supply, dose_unit_concept_id, dose_unit_source_value, effective_drug_dose, stop_reason, sig, lot_number, drug_exposure_end_date) {

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
      whereClasues <- c(whereClasues, paste0("drug_exposure_id = (", as.character(drug_exposure_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("drug_exposure_id = '", drug_exposure_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(drug_exposure_start_date)) {
    if (is.null(drug_exposure_start_date)) {
      whereClauses <- c(whereClauses, "drug_exposure_start_date IS NULL")
    } else if (is(drug_exposure_start_date, "subQuery")){
      whereClasues <- c(whereClasues, paste0("drug_exposure_start_date = (", as.character(drug_exposure_start_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("drug_exposure_start_date = '", drug_exposure_start_date,"'"))
    }
  }

  if (!missing(drug_concept_id)) {
    if (is.null(drug_concept_id)) {
      whereClauses <- c(whereClauses, "drug_concept_id IS NULL")
    } else if (is(drug_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("drug_concept_id = (", as.character(drug_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("drug_concept_id = '", drug_concept_id,"'"))
    }
  }

  if (!missing(drug_source_value)) {
    if (is.null(drug_source_value)) {
      whereClauses <- c(whereClauses, "drug_source_value IS NULL")
    } else if (is(drug_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("drug_source_value = (", as.character(drug_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("drug_source_value = '", drug_source_value,"'"))
    }
  }

  if (!missing(drug_source_concept_id)) {
    if (is.null(drug_source_concept_id)) {
      whereClauses <- c(whereClauses, "drug_source_concept_id IS NULL")
    } else if (is(drug_source_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("drug_source_concept_id = (", as.character(drug_source_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("drug_source_concept_id = '", drug_source_concept_id,"'"))
    }
  }

  if (!missing(drug_type_concept_id)) {
    if (is.null(drug_type_concept_id)) {
      whereClauses <- c(whereClauses, "drug_type_concept_id IS NULL")
    } else if (is(drug_type_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("drug_type_concept_id = (", as.character(drug_type_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("drug_type_concept_id = '", drug_type_concept_id,"'"))
    }
  }

  if (!missing(provider_id)) {
    if (is.null(provider_id)) {
      whereClauses <- c(whereClauses, "provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("provider_id = (", as.character(provider_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("provider_id = '", provider_id,"'"))
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (is.null(visit_occurrence_id)) {
      whereClauses <- c(whereClauses, "visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("visit_occurrence_id = (", as.character(visit_occurrence_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_occurrence_id = '", visit_occurrence_id,"'"))
    }
  }

  if (!missing(route_concept_id)) {
    if (is.null(route_concept_id)) {
      whereClauses <- c(whereClauses, "route_concept_id IS NULL")
    } else if (is(route_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("route_concept_id = (", as.character(route_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("route_concept_id = '", route_concept_id,"'"))
    }
  }

  if (!missing(route_source_value)) {
    if (is.null(route_source_value)) {
      whereClauses <- c(whereClauses, "route_source_value IS NULL")
    } else if (is(route_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("route_source_value = (", as.character(route_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("route_source_value = '", route_source_value,"'"))
    }
  }

  if (!missing(quantity)) {
    if (is.null(quantity)) {
      whereClauses <- c(whereClauses, "quantity IS NULL")
    } else if (is(quantity, "subQuery")){
      whereClasues <- c(whereClasues, paste0("quantity = (", as.character(quantity), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("quantity = '", quantity,"'"))
    }
  }

  if (!missing(refills)) {
    if (is.null(refills)) {
      whereClauses <- c(whereClauses, "refills IS NULL")
    } else if (is(refills, "subQuery")){
      whereClasues <- c(whereClasues, paste0("refills = (", as.character(refills), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("refills = '", refills,"'"))
    }
  }

  if (!missing(days_supply)) {
    if (is.null(days_supply)) {
      whereClauses <- c(whereClauses, "days_supply IS NULL")
    } else if (is(days_supply, "subQuery")){
      whereClasues <- c(whereClasues, paste0("days_supply = (", as.character(days_supply), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("days_supply = '", days_supply,"'"))
    }
  }

  if (!missing(dose_unit_concept_id)) {
    if (is.null(dose_unit_concept_id)) {
      whereClauses <- c(whereClauses, "dose_unit_concept_id IS NULL")
    } else if (is(dose_unit_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("dose_unit_concept_id = (", as.character(dose_unit_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("dose_unit_concept_id = '", dose_unit_concept_id,"'"))
    }
  }

  if (!missing(dose_unit_source_value)) {
    if (is.null(dose_unit_source_value)) {
      whereClauses <- c(whereClauses, "dose_unit_source_value IS NULL")
    } else if (is(dose_unit_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("dose_unit_source_value = (", as.character(dose_unit_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("dose_unit_source_value = '", dose_unit_source_value,"'"))
    }
  }

  if (!missing(effective_drug_dose)) {
    if (is.null(effective_drug_dose)) {
      whereClauses <- c(whereClauses, "effective_drug_dose IS NULL")
    } else if (is(effective_drug_dose, "subQuery")){
      whereClasues <- c(whereClasues, paste0("effective_drug_dose = (", as.character(effective_drug_dose), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("effective_drug_dose = '", effective_drug_dose,"'"))
    }
  }

  if (!missing(stop_reason)) {
    if (is.null(stop_reason)) {
      whereClauses <- c(whereClauses, "stop_reason IS NULL")
    } else if (is(stop_reason, "subQuery")){
      whereClasues <- c(whereClasues, paste0("stop_reason = (", as.character(stop_reason), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("stop_reason = '", stop_reason,"'"))
    }
  }

  if (!missing(sig)) {
    if (is.null(sig)) {
      whereClauses <- c(whereClauses, "sig IS NULL")
    } else if (is(sig, "subQuery")){
      whereClasues <- c(whereClasues, paste0("sig = (", as.character(sig), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("sig = '", sig,"'"))
    }
  }

  if (!missing(lot_number)) {
    if (is.null(lot_number)) {
      whereClauses <- c(whereClauses, "lot_number IS NULL")
    } else if (is(lot_number, "subQuery")){
      whereClasues <- c(whereClasues, paste0("lot_number = (", as.character(lot_number), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("lot_number = '", lot_number,"'"))
    }
  }

  if (!missing(drug_exposure_end_date)) {
    if (is.null(drug_exposure_end_date)) {
      whereClauses <- c(whereClauses, "drug_exposure_end_date IS NULL")
    } else if (is(drug_exposure_end_date, "subQuery")){
      whereClasues <- c(whereClasues, paste0("drug_exposure_end_date = (", as.character(drug_exposure_end_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("drug_exposure_end_date = '", drug_exposure_end_date,"'"))
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
      whereClasues <- c(whereClasues, paste0("domain_concept_id_1 = (", as.character(domain_concept_id_1), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("domain_concept_id_1 = '", domain_concept_id_1,"'"))
    }
  }

  if (!missing(fact_id_1)) {
    if (is.null(fact_id_1)) {
      whereClauses <- c(whereClauses, "fact_id_1 IS NULL")
    } else if (is(fact_id_1, "subQuery")){
      whereClasues <- c(whereClasues, paste0("fact_id_1 = (", as.character(fact_id_1), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("fact_id_1 = '", fact_id_1,"'"))
    }
  }

  if (!missing(domain_concept_id_2)) {
    if (is.null(domain_concept_id_2)) {
      whereClauses <- c(whereClauses, "domain_concept_id_2 IS NULL")
    } else if (is(domain_concept_id_2, "subQuery")){
      whereClasues <- c(whereClasues, paste0("domain_concept_id_2 = (", as.character(domain_concept_id_2), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("domain_concept_id_2 = '", domain_concept_id_2,"'"))
    }
  }

  if (!missing(fact_id_2)) {
    if (is.null(fact_id_2)) {
      whereClauses <- c(whereClauses, "fact_id_2 IS NULL")
    } else if (is(fact_id_2, "subQuery")){
      whereClasues <- c(whereClasues, paste0("fact_id_2 = (", as.character(fact_id_2), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("fact_id_2 = '", fact_id_2,"'"))
    }
  }

  if (!missing(relationship_concept_id)) {
    if (is.null(relationship_concept_id)) {
      whereClauses <- c(whereClauses, "relationship_concept_id IS NULL")
    } else if (is(relationship_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("relationship_concept_id = (", as.character(relationship_concept_id), ")"))
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
      whereClasues <- c(whereClasues, paste0("payer_plan_period_id = (", as.character(payer_plan_period_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("payer_plan_period_id = '", payer_plan_period_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(payer_plan_period_start_date)) {
    if (is.null(payer_plan_period_start_date)) {
      whereClauses <- c(whereClauses, "payer_plan_period_start_date IS NULL")
    } else if (is(payer_plan_period_start_date, "subQuery")){
      whereClasues <- c(whereClasues, paste0("payer_plan_period_start_date = (", as.character(payer_plan_period_start_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("payer_plan_period_start_date = '", payer_plan_period_start_date,"'"))
    }
  }

  if (!missing(payer_plan_period_end_date)) {
    if (is.null(payer_plan_period_end_date)) {
      whereClauses <- c(whereClauses, "payer_plan_period_end_date IS NULL")
    } else if (is(payer_plan_period_end_date, "subQuery")){
      whereClasues <- c(whereClasues, paste0("payer_plan_period_end_date = (", as.character(payer_plan_period_end_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("payer_plan_period_end_date = '", payer_plan_period_end_date,"'"))
    }
  }

  if (!missing(payer_source_value)) {
    if (is.null(payer_source_value)) {
      whereClauses <- c(whereClauses, "payer_source_value IS NULL")
    } else if (is(payer_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("payer_source_value = (", as.character(payer_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("payer_source_value = '", payer_source_value,"'"))
    }
  }

  if (!missing(plan_source_value)) {
    if (is.null(plan_source_value)) {
      whereClauses <- c(whereClauses, "plan_source_value IS NULL")
    } else if (is(plan_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("plan_source_value = (", as.character(plan_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("plan_source_value = '", plan_source_value,"'"))
    }
  }

  if (!missing(family_source_value)) {
    if (is.null(family_source_value)) {
      whereClauses <- c(whereClauses, "family_source_value IS NULL")
    } else if (is(family_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("family_source_value = (", as.character(family_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("family_source_value = '", family_source_value,"'"))
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
      whereClasues <- c(whereClasues, paste0("note_id = (", as.character(note_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("note_id = '", note_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(note_date)) {
    if (is.null(note_date)) {
      whereClauses <- c(whereClauses, "note_date IS NULL")
    } else if (is(note_date, "subQuery")){
      whereClasues <- c(whereClasues, paste0("note_date = (", as.character(note_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("note_date = '", note_date,"'"))
    }
  }

  if (!missing(note_time)) {
    if (is.null(note_time)) {
      whereClauses <- c(whereClauses, "note_time IS NULL")
    } else if (is(note_time, "subQuery")){
      whereClasues <- c(whereClasues, paste0("note_time = (", as.character(note_time), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("note_time = '", note_time,"'"))
    }
  }

  if (!missing(note_type_concept_id)) {
    if (is.null(note_type_concept_id)) {
      whereClauses <- c(whereClauses, "note_type_concept_id IS NULL")
    } else if (is(note_type_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("note_type_concept_id = (", as.character(note_type_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("note_type_concept_id = '", note_type_concept_id,"'"))
    }
  }

  if (!missing(note_text)) {
    if (is.null(note_text)) {
      whereClauses <- c(whereClauses, "note_text IS NULL")
    } else if (is(note_text, "subQuery")){
      whereClasues <- c(whereClasues, paste0("note_text = (", as.character(note_text), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("note_text = '", note_text,"'"))
    }
  }

  if (!missing(provider_id)) {
    if (is.null(provider_id)) {
      whereClauses <- c(whereClauses, "provider_id IS NULL")
    } else if (is(provider_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("provider_id = (", as.character(provider_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("provider_id = '", provider_id,"'"))
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (is.null(visit_occurrence_id)) {
      whereClauses <- c(whereClauses, "visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("visit_occurrence_id = (", as.character(visit_occurrence_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_occurrence_id = '", visit_occurrence_id,"'"))
    }
  }

  if (!missing(note_source_value)) {
    if (is.null(note_source_value)) {
      whereClauses <- c(whereClauses, "note_source_value IS NULL")
    } else if (is(note_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("note_source_value = (", as.character(note_source_value), ")"))
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
      whereClasues <- c(whereClasues, paste0("specimen_id = (", as.character(specimen_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("specimen_id = '", specimen_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(specimen_concept_id)) {
    if (is.null(specimen_concept_id)) {
      whereClauses <- c(whereClauses, "specimen_concept_id IS NULL")
    } else if (is(specimen_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("specimen_concept_id = (", as.character(specimen_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("specimen_concept_id = '", specimen_concept_id,"'"))
    }
  }

  if (!missing(specimen_type_concept_id)) {
    if (is.null(specimen_type_concept_id)) {
      whereClauses <- c(whereClauses, "specimen_type_concept_id IS NULL")
    } else if (is(specimen_type_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("specimen_type_concept_id = (", as.character(specimen_type_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("specimen_type_concept_id = '", specimen_type_concept_id,"'"))
    }
  }

  if (!missing(specimen_date)) {
    if (is.null(specimen_date)) {
      whereClauses <- c(whereClauses, "specimen_date IS NULL")
    } else if (is(specimen_date, "subQuery")){
      whereClasues <- c(whereClasues, paste0("specimen_date = (", as.character(specimen_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("specimen_date = '", specimen_date,"'"))
    }
  }

  if (!missing(specimen_time)) {
    if (is.null(specimen_time)) {
      whereClauses <- c(whereClauses, "specimen_time IS NULL")
    } else if (is(specimen_time, "subQuery")){
      whereClasues <- c(whereClasues, paste0("specimen_time = (", as.character(specimen_time), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("specimen_time = '", specimen_time,"'"))
    }
  }

  if (!missing(quantity)) {
    if (is.null(quantity)) {
      whereClauses <- c(whereClauses, "quantity IS NULL")
    } else if (is(quantity, "subQuery")){
      whereClasues <- c(whereClasues, paste0("quantity = (", as.character(quantity), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("quantity = '", quantity,"'"))
    }
  }

  if (!missing(unit_concept_id)) {
    if (is.null(unit_concept_id)) {
      whereClauses <- c(whereClauses, "unit_concept_id IS NULL")
    } else if (is(unit_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("unit_concept_id = (", as.character(unit_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("unit_concept_id = '", unit_concept_id,"'"))
    }
  }

  if (!missing(anatomic_site_concept_id)) {
    if (is.null(anatomic_site_concept_id)) {
      whereClauses <- c(whereClauses, "anatomic_site_concept_id IS NULL")
    } else if (is(anatomic_site_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("anatomic_site_concept_id = (", as.character(anatomic_site_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("anatomic_site_concept_id = '", anatomic_site_concept_id,"'"))
    }
  }

  if (!missing(disease_status_concept_id)) {
    if (is.null(disease_status_concept_id)) {
      whereClauses <- c(whereClauses, "disease_status_concept_id IS NULL")
    } else if (is(disease_status_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("disease_status_concept_id = (", as.character(disease_status_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("disease_status_concept_id = '", disease_status_concept_id,"'"))
    }
  }

  if (!missing(specimen_source_id)) {
    if (is.null(specimen_source_id)) {
      whereClauses <- c(whereClauses, "specimen_source_id IS NULL")
    } else if (is(specimen_source_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("specimen_source_id = (", as.character(specimen_source_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("specimen_source_id = '", specimen_source_id,"'"))
    }
  }

  if (!missing(specimen_source_value)) {
    if (is.null(specimen_source_value)) {
      whereClauses <- c(whereClauses, "specimen_source_value IS NULL")
    } else if (is(specimen_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("specimen_source_value = (", as.character(specimen_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("specimen_source_value = '", specimen_source_value,"'"))
    }
  }

  if (!missing(unit_source_value)) {
    if (is.null(unit_source_value)) {
      whereClauses <- c(whereClauses, "unit_source_value IS NULL")
    } else if (is(unit_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("unit_source_value = (", as.character(unit_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("unit_source_value = '", unit_source_value,"'"))
    }
  }

  if (!missing(anatomic_site_source_value)) {
    if (is.null(anatomic_site_source_value)) {
      whereClauses <- c(whereClauses, "anatomic_site_source_value IS NULL")
    } else if (is(anatomic_site_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("anatomic_site_source_value = (", as.character(anatomic_site_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("anatomic_site_source_value = '", anatomic_site_source_value,"'"))
    }
  }

  if (!missing(disease_status_source_value)) {
    if (is.null(disease_status_source_value)) {
      whereClauses <- c(whereClauses, "disease_status_source_value IS NULL")
    } else if (is(disease_status_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("disease_status_source_value = (", as.character(disease_status_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("disease_status_source_value = '", disease_status_source_value,"'"))
    }
  }

  statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") != ",rowCount ," THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

expect_count_procedure_cost <- function(rowCount, procedure_cost_id, procedure_occurrence_id, currency_concept_id, paid_copay, paid_coinsurance, paid_toward_deductible, paid_by_payer, paid_by_coordination_benefits, total_out_of_pocket, total_paid, revenue_code_concept_id, payer_plan_period_id, revenue_code_source_value) {

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

  statement <- paste0("INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT ", frameworkContext$testId, " AS id, '", testName, "' AS description, 'Expect procedure_cost' AS test, ", source_pid, " as source_pid, ", cdm_pid, " as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.procedure_cost WHERE ")
  whereClauses = NULL;
  if (!missing(procedure_cost_id)) {
    if (is.null(procedure_cost_id)) {
      whereClauses <- c(whereClauses, "procedure_cost_id IS NULL")
    } else if (is(procedure_cost_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("procedure_cost_id = (", as.character(procedure_cost_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("procedure_cost_id = '", procedure_cost_id,"'"))
    }
  }

  if (!missing(procedure_occurrence_id)) {
    if (is.null(procedure_occurrence_id)) {
      whereClauses <- c(whereClauses, "procedure_occurrence_id IS NULL")
    } else if (is(procedure_occurrence_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("procedure_occurrence_id = (", as.character(procedure_occurrence_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("procedure_occurrence_id = '", procedure_occurrence_id,"'"))
    }
  }

  if (!missing(currency_concept_id)) {
    if (is.null(currency_concept_id)) {
      whereClauses <- c(whereClauses, "currency_concept_id IS NULL")
    } else if (is(currency_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("currency_concept_id = (", as.character(currency_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("currency_concept_id = '", currency_concept_id,"'"))
    }
  }

  if (!missing(paid_copay)) {
    if (is.null(paid_copay)) {
      whereClauses <- c(whereClauses, "paid_copay IS NULL")
    } else if (is(paid_copay, "subQuery")){
      whereClasues <- c(whereClasues, paste0("paid_copay = (", as.character(paid_copay), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("paid_copay = '", paid_copay,"'"))
    }
  }

  if (!missing(paid_coinsurance)) {
    if (is.null(paid_coinsurance)) {
      whereClauses <- c(whereClauses, "paid_coinsurance IS NULL")
    } else if (is(paid_coinsurance, "subQuery")){
      whereClasues <- c(whereClasues, paste0("paid_coinsurance = (", as.character(paid_coinsurance), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("paid_coinsurance = '", paid_coinsurance,"'"))
    }
  }

  if (!missing(paid_toward_deductible)) {
    if (is.null(paid_toward_deductible)) {
      whereClauses <- c(whereClauses, "paid_toward_deductible IS NULL")
    } else if (is(paid_toward_deductible, "subQuery")){
      whereClasues <- c(whereClasues, paste0("paid_toward_deductible = (", as.character(paid_toward_deductible), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("paid_toward_deductible = '", paid_toward_deductible,"'"))
    }
  }

  if (!missing(paid_by_payer)) {
    if (is.null(paid_by_payer)) {
      whereClauses <- c(whereClauses, "paid_by_payer IS NULL")
    } else if (is(paid_by_payer, "subQuery")){
      whereClasues <- c(whereClasues, paste0("paid_by_payer = (", as.character(paid_by_payer), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("paid_by_payer = '", paid_by_payer,"'"))
    }
  }

  if (!missing(paid_by_coordination_benefits)) {
    if (is.null(paid_by_coordination_benefits)) {
      whereClauses <- c(whereClauses, "paid_by_coordination_benefits IS NULL")
    } else if (is(paid_by_coordination_benefits, "subQuery")){
      whereClasues <- c(whereClasues, paste0("paid_by_coordination_benefits = (", as.character(paid_by_coordination_benefits), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("paid_by_coordination_benefits = '", paid_by_coordination_benefits,"'"))
    }
  }

  if (!missing(total_out_of_pocket)) {
    if (is.null(total_out_of_pocket)) {
      whereClauses <- c(whereClauses, "total_out_of_pocket IS NULL")
    } else if (is(total_out_of_pocket, "subQuery")){
      whereClasues <- c(whereClasues, paste0("total_out_of_pocket = (", as.character(total_out_of_pocket), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("total_out_of_pocket = '", total_out_of_pocket,"'"))
    }
  }

  if (!missing(total_paid)) {
    if (is.null(total_paid)) {
      whereClauses <- c(whereClauses, "total_paid IS NULL")
    } else if (is(total_paid, "subQuery")){
      whereClasues <- c(whereClasues, paste0("total_paid = (", as.character(total_paid), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("total_paid = '", total_paid,"'"))
    }
  }

  if (!missing(revenue_code_concept_id)) {
    if (is.null(revenue_code_concept_id)) {
      whereClauses <- c(whereClauses, "revenue_code_concept_id IS NULL")
    } else if (is(revenue_code_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("revenue_code_concept_id = (", as.character(revenue_code_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("revenue_code_concept_id = '", revenue_code_concept_id,"'"))
    }
  }

  if (!missing(payer_plan_period_id)) {
    if (is.null(payer_plan_period_id)) {
      whereClauses <- c(whereClauses, "payer_plan_period_id IS NULL")
    } else if (is(payer_plan_period_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("payer_plan_period_id = (", as.character(payer_plan_period_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("payer_plan_period_id = '", payer_plan_period_id,"'"))
    }
  }

  if (!missing(revenue_code_source_value)) {
    if (is.null(revenue_code_source_value)) {
      whereClauses <- c(whereClauses, "revenue_code_source_value IS NULL")
    } else if (is(revenue_code_source_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("revenue_code_source_value = (", as.character(revenue_code_source_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("revenue_code_source_value = '", revenue_code_source_value,"'"))
    }
  }

  statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") != ",rowCount ," THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

expect_count_visit_cost <- function(rowCount, visit_cost_id, visit_occurrence_id, currency_concept_id, paid_copay, paid_coinsurance, paid_toward_deductible, paid_by_payer, paid_by_coordination_benefits, total_out_of_pocket, total_paid, payer_plan_period_id) {

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

  statement <- paste0("INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT ", frameworkContext$testId, " AS id, '", testName, "' AS description, 'Expect visit_cost' AS test, ", source_pid, " as source_pid, ", cdm_pid, " as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.visit_cost WHERE ")
  whereClauses = NULL;
  if (!missing(visit_cost_id)) {
    if (is.null(visit_cost_id)) {
      whereClauses <- c(whereClauses, "visit_cost_id IS NULL")
    } else if (is(visit_cost_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("visit_cost_id = (", as.character(visit_cost_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_cost_id = '", visit_cost_id,"'"))
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (is.null(visit_occurrence_id)) {
      whereClauses <- c(whereClauses, "visit_occurrence_id IS NULL")
    } else if (is(visit_occurrence_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("visit_occurrence_id = (", as.character(visit_occurrence_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("visit_occurrence_id = '", visit_occurrence_id,"'"))
    }
  }

  if (!missing(currency_concept_id)) {
    if (is.null(currency_concept_id)) {
      whereClauses <- c(whereClauses, "currency_concept_id IS NULL")
    } else if (is(currency_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("currency_concept_id = (", as.character(currency_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("currency_concept_id = '", currency_concept_id,"'"))
    }
  }

  if (!missing(paid_copay)) {
    if (is.null(paid_copay)) {
      whereClauses <- c(whereClauses, "paid_copay IS NULL")
    } else if (is(paid_copay, "subQuery")){
      whereClasues <- c(whereClasues, paste0("paid_copay = (", as.character(paid_copay), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("paid_copay = '", paid_copay,"'"))
    }
  }

  if (!missing(paid_coinsurance)) {
    if (is.null(paid_coinsurance)) {
      whereClauses <- c(whereClauses, "paid_coinsurance IS NULL")
    } else if (is(paid_coinsurance, "subQuery")){
      whereClasues <- c(whereClasues, paste0("paid_coinsurance = (", as.character(paid_coinsurance), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("paid_coinsurance = '", paid_coinsurance,"'"))
    }
  }

  if (!missing(paid_toward_deductible)) {
    if (is.null(paid_toward_deductible)) {
      whereClauses <- c(whereClauses, "paid_toward_deductible IS NULL")
    } else if (is(paid_toward_deductible, "subQuery")){
      whereClasues <- c(whereClasues, paste0("paid_toward_deductible = (", as.character(paid_toward_deductible), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("paid_toward_deductible = '", paid_toward_deductible,"'"))
    }
  }

  if (!missing(paid_by_payer)) {
    if (is.null(paid_by_payer)) {
      whereClauses <- c(whereClauses, "paid_by_payer IS NULL")
    } else if (is(paid_by_payer, "subQuery")){
      whereClasues <- c(whereClasues, paste0("paid_by_payer = (", as.character(paid_by_payer), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("paid_by_payer = '", paid_by_payer,"'"))
    }
  }

  if (!missing(paid_by_coordination_benefits)) {
    if (is.null(paid_by_coordination_benefits)) {
      whereClauses <- c(whereClauses, "paid_by_coordination_benefits IS NULL")
    } else if (is(paid_by_coordination_benefits, "subQuery")){
      whereClasues <- c(whereClasues, paste0("paid_by_coordination_benefits = (", as.character(paid_by_coordination_benefits), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("paid_by_coordination_benefits = '", paid_by_coordination_benefits,"'"))
    }
  }

  if (!missing(total_out_of_pocket)) {
    if (is.null(total_out_of_pocket)) {
      whereClauses <- c(whereClauses, "total_out_of_pocket IS NULL")
    } else if (is(total_out_of_pocket, "subQuery")){
      whereClasues <- c(whereClasues, paste0("total_out_of_pocket = (", as.character(total_out_of_pocket), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("total_out_of_pocket = '", total_out_of_pocket,"'"))
    }
  }

  if (!missing(total_paid)) {
    if (is.null(total_paid)) {
      whereClauses <- c(whereClauses, "total_paid IS NULL")
    } else if (is(total_paid, "subQuery")){
      whereClasues <- c(whereClasues, paste0("total_paid = (", as.character(total_paid), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("total_paid = '", total_paid,"'"))
    }
  }

  if (!missing(payer_plan_period_id)) {
    if (is.null(payer_plan_period_id)) {
      whereClauses <- c(whereClauses, "payer_plan_period_id IS NULL")
    } else if (is(payer_plan_period_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("payer_plan_period_id = (", as.character(payer_plan_period_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("payer_plan_period_id = '", payer_plan_period_id,"'"))
    }
  }

  statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") != ",rowCount ," THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

expect_count_drug_cost <- function(rowCount, drug_cost_id, drug_exposure_id, currency_concept_id, paid_copay, paid_coinsurance, paid_toward_deductible, paid_by_payer, paid_by_coordination_benefits, total_out_of_pocket, total_paid, ingredient_cost, dispensing_fee, average_wholesale_price, payer_plan_period_id) {

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

  statement <- paste0("INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT ", frameworkContext$testId, " AS id, '", testName, "' AS description, 'Expect drug_cost' AS test, ", source_pid, " as source_pid, ", cdm_pid, " as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.drug_cost WHERE ")
  whereClauses = NULL;
  if (!missing(drug_cost_id)) {
    if (is.null(drug_cost_id)) {
      whereClauses <- c(whereClauses, "drug_cost_id IS NULL")
    } else if (is(drug_cost_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("drug_cost_id = (", as.character(drug_cost_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("drug_cost_id = '", drug_cost_id,"'"))
    }
  }

  if (!missing(drug_exposure_id)) {
    if (is.null(drug_exposure_id)) {
      whereClauses <- c(whereClauses, "drug_exposure_id IS NULL")
    } else if (is(drug_exposure_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("drug_exposure_id = (", as.character(drug_exposure_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("drug_exposure_id = '", drug_exposure_id,"'"))
    }
  }

  if (!missing(currency_concept_id)) {
    if (is.null(currency_concept_id)) {
      whereClauses <- c(whereClauses, "currency_concept_id IS NULL")
    } else if (is(currency_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("currency_concept_id = (", as.character(currency_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("currency_concept_id = '", currency_concept_id,"'"))
    }
  }

  if (!missing(paid_copay)) {
    if (is.null(paid_copay)) {
      whereClauses <- c(whereClauses, "paid_copay IS NULL")
    } else if (is(paid_copay, "subQuery")){
      whereClasues <- c(whereClasues, paste0("paid_copay = (", as.character(paid_copay), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("paid_copay = '", paid_copay,"'"))
    }
  }

  if (!missing(paid_coinsurance)) {
    if (is.null(paid_coinsurance)) {
      whereClauses <- c(whereClauses, "paid_coinsurance IS NULL")
    } else if (is(paid_coinsurance, "subQuery")){
      whereClasues <- c(whereClasues, paste0("paid_coinsurance = (", as.character(paid_coinsurance), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("paid_coinsurance = '", paid_coinsurance,"'"))
    }
  }

  if (!missing(paid_toward_deductible)) {
    if (is.null(paid_toward_deductible)) {
      whereClauses <- c(whereClauses, "paid_toward_deductible IS NULL")
    } else if (is(paid_toward_deductible, "subQuery")){
      whereClasues <- c(whereClasues, paste0("paid_toward_deductible = (", as.character(paid_toward_deductible), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("paid_toward_deductible = '", paid_toward_deductible,"'"))
    }
  }

  if (!missing(paid_by_payer)) {
    if (is.null(paid_by_payer)) {
      whereClauses <- c(whereClauses, "paid_by_payer IS NULL")
    } else if (is(paid_by_payer, "subQuery")){
      whereClasues <- c(whereClasues, paste0("paid_by_payer = (", as.character(paid_by_payer), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("paid_by_payer = '", paid_by_payer,"'"))
    }
  }

  if (!missing(paid_by_coordination_benefits)) {
    if (is.null(paid_by_coordination_benefits)) {
      whereClauses <- c(whereClauses, "paid_by_coordination_benefits IS NULL")
    } else if (is(paid_by_coordination_benefits, "subQuery")){
      whereClasues <- c(whereClasues, paste0("paid_by_coordination_benefits = (", as.character(paid_by_coordination_benefits), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("paid_by_coordination_benefits = '", paid_by_coordination_benefits,"'"))
    }
  }

  if (!missing(total_out_of_pocket)) {
    if (is.null(total_out_of_pocket)) {
      whereClauses <- c(whereClauses, "total_out_of_pocket IS NULL")
    } else if (is(total_out_of_pocket, "subQuery")){
      whereClasues <- c(whereClasues, paste0("total_out_of_pocket = (", as.character(total_out_of_pocket), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("total_out_of_pocket = '", total_out_of_pocket,"'"))
    }
  }

  if (!missing(total_paid)) {
    if (is.null(total_paid)) {
      whereClauses <- c(whereClauses, "total_paid IS NULL")
    } else if (is(total_paid, "subQuery")){
      whereClasues <- c(whereClasues, paste0("total_paid = (", as.character(total_paid), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("total_paid = '", total_paid,"'"))
    }
  }

  if (!missing(ingredient_cost)) {
    if (is.null(ingredient_cost)) {
      whereClauses <- c(whereClauses, "ingredient_cost IS NULL")
    } else if (is(ingredient_cost, "subQuery")){
      whereClasues <- c(whereClasues, paste0("ingredient_cost = (", as.character(ingredient_cost), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("ingredient_cost = '", ingredient_cost,"'"))
    }
  }

  if (!missing(dispensing_fee)) {
    if (is.null(dispensing_fee)) {
      whereClauses <- c(whereClauses, "dispensing_fee IS NULL")
    } else if (is(dispensing_fee, "subQuery")){
      whereClasues <- c(whereClasues, paste0("dispensing_fee = (", as.character(dispensing_fee), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("dispensing_fee = '", dispensing_fee,"'"))
    }
  }

  if (!missing(average_wholesale_price)) {
    if (is.null(average_wholesale_price)) {
      whereClauses <- c(whereClauses, "average_wholesale_price IS NULL")
    } else if (is(average_wholesale_price, "subQuery")){
      whereClasues <- c(whereClasues, paste0("average_wholesale_price = (", as.character(average_wholesale_price), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("average_wholesale_price = '", average_wholesale_price,"'"))
    }
  }

  if (!missing(payer_plan_period_id)) {
    if (is.null(payer_plan_period_id)) {
      whereClauses <- c(whereClauses, "payer_plan_period_id IS NULL")
    } else if (is(payer_plan_period_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("payer_plan_period_id = (", as.character(payer_plan_period_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("payer_plan_period_id = '", payer_plan_period_id,"'"))
    }
  }

  statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") != ",rowCount ," THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

expect_count_device_cost <- function(rowCount, device_cost_id, device_exposure_id, currency_concept_id, paid_copay, paid_coinsurance, paid_toward_deductible, paid_by_payer, paid_by_coordination_benefits, total_out_of_pocket, total_paid, payer_plan_period_id) {

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

  statement <- paste0("INSERT INTO @cdm_schema.test_results (id, description, test, source_pid, cdm_pid, status) SELECT ", frameworkContext$testId, " AS id, '", testName, "' AS description, 'Expect device_cost' AS test, ", source_pid, " as source_pid, ", cdm_pid, " as cdm_pid, CASE WHEN(SELECT COUNT(*) FROM @cdm_schema.device_cost WHERE ")
  whereClauses = NULL;
  if (!missing(device_cost_id)) {
    if (is.null(device_cost_id)) {
      whereClauses <- c(whereClauses, "device_cost_id IS NULL")
    } else if (is(device_cost_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("device_cost_id = (", as.character(device_cost_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("device_cost_id = '", device_cost_id,"'"))
    }
  }

  if (!missing(device_exposure_id)) {
    if (is.null(device_exposure_id)) {
      whereClauses <- c(whereClauses, "device_exposure_id IS NULL")
    } else if (is(device_exposure_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("device_exposure_id = (", as.character(device_exposure_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("device_exposure_id = '", device_exposure_id,"'"))
    }
  }

  if (!missing(currency_concept_id)) {
    if (is.null(currency_concept_id)) {
      whereClauses <- c(whereClauses, "currency_concept_id IS NULL")
    } else if (is(currency_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("currency_concept_id = (", as.character(currency_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("currency_concept_id = '", currency_concept_id,"'"))
    }
  }

  if (!missing(paid_copay)) {
    if (is.null(paid_copay)) {
      whereClauses <- c(whereClauses, "paid_copay IS NULL")
    } else if (is(paid_copay, "subQuery")){
      whereClasues <- c(whereClasues, paste0("paid_copay = (", as.character(paid_copay), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("paid_copay = '", paid_copay,"'"))
    }
  }

  if (!missing(paid_coinsurance)) {
    if (is.null(paid_coinsurance)) {
      whereClauses <- c(whereClauses, "paid_coinsurance IS NULL")
    } else if (is(paid_coinsurance, "subQuery")){
      whereClasues <- c(whereClasues, paste0("paid_coinsurance = (", as.character(paid_coinsurance), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("paid_coinsurance = '", paid_coinsurance,"'"))
    }
  }

  if (!missing(paid_toward_deductible)) {
    if (is.null(paid_toward_deductible)) {
      whereClauses <- c(whereClauses, "paid_toward_deductible IS NULL")
    } else if (is(paid_toward_deductible, "subQuery")){
      whereClasues <- c(whereClasues, paste0("paid_toward_deductible = (", as.character(paid_toward_deductible), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("paid_toward_deductible = '", paid_toward_deductible,"'"))
    }
  }

  if (!missing(paid_by_payer)) {
    if (is.null(paid_by_payer)) {
      whereClauses <- c(whereClauses, "paid_by_payer IS NULL")
    } else if (is(paid_by_payer, "subQuery")){
      whereClasues <- c(whereClasues, paste0("paid_by_payer = (", as.character(paid_by_payer), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("paid_by_payer = '", paid_by_payer,"'"))
    }
  }

  if (!missing(paid_by_coordination_benefits)) {
    if (is.null(paid_by_coordination_benefits)) {
      whereClauses <- c(whereClauses, "paid_by_coordination_benefits IS NULL")
    } else if (is(paid_by_coordination_benefits, "subQuery")){
      whereClasues <- c(whereClasues, paste0("paid_by_coordination_benefits = (", as.character(paid_by_coordination_benefits), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("paid_by_coordination_benefits = '", paid_by_coordination_benefits,"'"))
    }
  }

  if (!missing(total_out_of_pocket)) {
    if (is.null(total_out_of_pocket)) {
      whereClauses <- c(whereClauses, "total_out_of_pocket IS NULL")
    } else if (is(total_out_of_pocket, "subQuery")){
      whereClasues <- c(whereClasues, paste0("total_out_of_pocket = (", as.character(total_out_of_pocket), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("total_out_of_pocket = '", total_out_of_pocket,"'"))
    }
  }

  if (!missing(total_paid)) {
    if (is.null(total_paid)) {
      whereClauses <- c(whereClauses, "total_paid IS NULL")
    } else if (is(total_paid, "subQuery")){
      whereClasues <- c(whereClasues, paste0("total_paid = (", as.character(total_paid), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("total_paid = '", total_paid,"'"))
    }
  }

  if (!missing(payer_plan_period_id)) {
    if (is.null(payer_plan_period_id)) {
      whereClauses <- c(whereClauses, "payer_plan_period_id IS NULL")
    } else if (is(payer_plan_period_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("payer_plan_period_id = (", as.character(payer_plan_period_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("payer_plan_period_id = '", payer_plan_period_id,"'"))
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
      whereClasues <- c(whereClasues, paste0("drug_era_id = (", as.character(drug_era_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("drug_era_id = '", drug_era_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(drug_concept_id)) {
    if (is.null(drug_concept_id)) {
      whereClauses <- c(whereClauses, "drug_concept_id IS NULL")
    } else if (is(drug_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("drug_concept_id = (", as.character(drug_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("drug_concept_id = '", drug_concept_id,"'"))
    }
  }

  if (!missing(drug_era_start_date)) {
    if (is.null(drug_era_start_date)) {
      whereClauses <- c(whereClauses, "drug_era_start_date IS NULL")
    } else if (is(drug_era_start_date, "subQuery")){
      whereClasues <- c(whereClasues, paste0("drug_era_start_date = (", as.character(drug_era_start_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("drug_era_start_date = '", drug_era_start_date,"'"))
    }
  }

  if (!missing(drug_era_end_date)) {
    if (is.null(drug_era_end_date)) {
      whereClauses <- c(whereClauses, "drug_era_end_date IS NULL")
    } else if (is(drug_era_end_date, "subQuery")){
      whereClasues <- c(whereClasues, paste0("drug_era_end_date = (", as.character(drug_era_end_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("drug_era_end_date = '", drug_era_end_date,"'"))
    }
  }

  if (!missing(drug_exposure_count)) {
    if (is.null(drug_exposure_count)) {
      whereClauses <- c(whereClauses, "drug_exposure_count IS NULL")
    } else if (is(drug_exposure_count, "subQuery")){
      whereClasues <- c(whereClasues, paste0("drug_exposure_count = (", as.character(drug_exposure_count), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("drug_exposure_count = '", drug_exposure_count,"'"))
    }
  }

  if (!missing(gap_days)) {
    if (is.null(gap_days)) {
      whereClauses <- c(whereClauses, "gap_days IS NULL")
    } else if (is(gap_days, "subQuery")){
      whereClasues <- c(whereClasues, paste0("gap_days = (", as.character(gap_days), ")"))
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
      whereClasues <- c(whereClasues, paste0("dose_era_id = (", as.character(dose_era_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("dose_era_id = '", dose_era_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(drug_concept_id)) {
    if (is.null(drug_concept_id)) {
      whereClauses <- c(whereClauses, "drug_concept_id IS NULL")
    } else if (is(drug_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("drug_concept_id = (", as.character(drug_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("drug_concept_id = '", drug_concept_id,"'"))
    }
  }

  if (!missing(unit_concept_id)) {
    if (is.null(unit_concept_id)) {
      whereClauses <- c(whereClauses, "unit_concept_id IS NULL")
    } else if (is(unit_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("unit_concept_id = (", as.character(unit_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("unit_concept_id = '", unit_concept_id,"'"))
    }
  }

  if (!missing(dose_value)) {
    if (is.null(dose_value)) {
      whereClauses <- c(whereClauses, "dose_value IS NULL")
    } else if (is(dose_value, "subQuery")){
      whereClasues <- c(whereClasues, paste0("dose_value = (", as.character(dose_value), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("dose_value = '", dose_value,"'"))
    }
  }

  if (!missing(dose_era_start_date)) {
    if (is.null(dose_era_start_date)) {
      whereClauses <- c(whereClauses, "dose_era_start_date IS NULL")
    } else if (is(dose_era_start_date, "subQuery")){
      whereClasues <- c(whereClasues, paste0("dose_era_start_date = (", as.character(dose_era_start_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("dose_era_start_date = '", dose_era_start_date,"'"))
    }
  }

  if (!missing(dose_era_end_date)) {
    if (is.null(dose_era_end_date)) {
      whereClauses <- c(whereClauses, "dose_era_end_date IS NULL")
    } else if (is(dose_era_end_date, "subQuery")){
      whereClasues <- c(whereClasues, paste0("dose_era_end_date = (", as.character(dose_era_end_date), ")"))
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
      whereClasues <- c(whereClasues, paste0("condition_era_id = (", as.character(condition_era_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("condition_era_id = '", condition_era_id,"'"))
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else if (is(person_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("person_id = (", as.character(person_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("person_id = '", person_id,"'"))
    }
  }

  if (!missing(condition_concept_id)) {
    if (is.null(condition_concept_id)) {
      whereClauses <- c(whereClauses, "condition_concept_id IS NULL")
    } else if (is(condition_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("condition_concept_id = (", as.character(condition_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("condition_concept_id = '", condition_concept_id,"'"))
    }
  }

  if (!missing(condition_era_start_date)) {
    if (is.null(condition_era_start_date)) {
      whereClauses <- c(whereClauses, "condition_era_start_date IS NULL")
    } else if (is(condition_era_start_date, "subQuery")){
      whereClasues <- c(whereClasues, paste0("condition_era_start_date = (", as.character(condition_era_start_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("condition_era_start_date = '", condition_era_start_date,"'"))
    }
  }

  if (!missing(condition_era_end_date)) {
    if (is.null(condition_era_end_date)) {
      whereClauses <- c(whereClauses, "condition_era_end_date IS NULL")
    } else if (is(condition_era_end_date, "subQuery")){
      whereClasues <- c(whereClasues, paste0("condition_era_end_date = (", as.character(condition_era_end_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("condition_era_end_date = '", condition_era_end_date,"'"))
    }
  }

  if (!missing(condition_occurrence_count)) {
    if (is.null(condition_occurrence_count)) {
      whereClauses <- c(whereClauses, "condition_occurrence_count IS NULL")
    } else if (is(condition_occurrence_count, "subQuery")){
      whereClasues <- c(whereClasues, paste0("condition_occurrence_count = (", as.character(condition_occurrence_count), ")"))
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
      whereClasues <- c(whereClasues, paste0("cdm_source_name = (", as.character(cdm_source_name), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cdm_source_name = '", cdm_source_name,"'"))
    }
  }

  if (!missing(cdm_source_abbreviation)) {
    if (is.null(cdm_source_abbreviation)) {
      whereClauses <- c(whereClauses, "cdm_source_abbreviation IS NULL")
    } else if (is(cdm_source_abbreviation, "subQuery")){
      whereClasues <- c(whereClasues, paste0("cdm_source_abbreviation = (", as.character(cdm_source_abbreviation), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cdm_source_abbreviation = '", cdm_source_abbreviation,"'"))
    }
  }

  if (!missing(cdm_holder)) {
    if (is.null(cdm_holder)) {
      whereClauses <- c(whereClauses, "cdm_holder IS NULL")
    } else if (is(cdm_holder, "subQuery")){
      whereClasues <- c(whereClasues, paste0("cdm_holder = (", as.character(cdm_holder), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cdm_holder = '", cdm_holder,"'"))
    }
  }

  if (!missing(source_description)) {
    if (is.null(source_description)) {
      whereClauses <- c(whereClauses, "source_description IS NULL")
    } else if (is(source_description, "subQuery")){
      whereClasues <- c(whereClasues, paste0("source_description = (", as.character(source_description), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("source_description = '", source_description,"'"))
    }
  }

  if (!missing(source_documentation_reference)) {
    if (is.null(source_documentation_reference)) {
      whereClauses <- c(whereClauses, "source_documentation_reference IS NULL")
    } else if (is(source_documentation_reference, "subQuery")){
      whereClasues <- c(whereClasues, paste0("source_documentation_reference = (", as.character(source_documentation_reference), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("source_documentation_reference = '", source_documentation_reference,"'"))
    }
  }

  if (!missing(cdm_etl_reference)) {
    if (is.null(cdm_etl_reference)) {
      whereClauses <- c(whereClauses, "cdm_etl_reference IS NULL")
    } else if (is(cdm_etl_reference, "subQuery")){
      whereClasues <- c(whereClasues, paste0("cdm_etl_reference = (", as.character(cdm_etl_reference), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cdm_etl_reference = '", cdm_etl_reference,"'"))
    }
  }

  if (!missing(source_release_date)) {
    if (is.null(source_release_date)) {
      whereClauses <- c(whereClauses, "source_release_date IS NULL")
    } else if (is(source_release_date, "subQuery")){
      whereClasues <- c(whereClasues, paste0("source_release_date = (", as.character(source_release_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("source_release_date = '", source_release_date,"'"))
    }
  }

  if (!missing(cdm_release_date)) {
    if (is.null(cdm_release_date)) {
      whereClauses <- c(whereClauses, "cdm_release_date IS NULL")
    } else if (is(cdm_release_date, "subQuery")){
      whereClasues <- c(whereClasues, paste0("cdm_release_date = (", as.character(cdm_release_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cdm_release_date = '", cdm_release_date,"'"))
    }
  }

  if (!missing(cdm_version)) {
    if (is.null(cdm_version)) {
      whereClauses <- c(whereClauses, "cdm_version IS NULL")
    } else if (is(cdm_version, "subQuery")){
      whereClasues <- c(whereClasues, paste0("cdm_version = (", as.character(cdm_version), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cdm_version = '", cdm_version,"'"))
    }
  }

  if (!missing(vocabulary_version)) {
    if (is.null(vocabulary_version)) {
      whereClauses <- c(whereClauses, "vocabulary_version IS NULL")
    } else if (is(vocabulary_version, "subQuery")){
      whereClasues <- c(whereClasues, paste0("vocabulary_version = (", as.character(vocabulary_version), ")"))
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
      whereClasues <- c(whereClasues, paste0("cohort_definition_id = (", as.character(cohort_definition_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cohort_definition_id = '", cohort_definition_id,"'"))
    }
  }

  if (!missing(subject_id)) {
    if (is.null(subject_id)) {
      whereClauses <- c(whereClauses, "subject_id IS NULL")
    } else if (is(subject_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("subject_id = (", as.character(subject_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("subject_id = '", subject_id,"'"))
    }
  }

  if (!missing(cohort_start_date)) {
    if (is.null(cohort_start_date)) {
      whereClauses <- c(whereClauses, "cohort_start_date IS NULL")
    } else if (is(cohort_start_date, "subQuery")){
      whereClasues <- c(whereClasues, paste0("cohort_start_date = (", as.character(cohort_start_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cohort_start_date = '", cohort_start_date,"'"))
    }
  }

  if (!missing(cohort_end_date)) {
    if (is.null(cohort_end_date)) {
      whereClauses <- c(whereClauses, "cohort_end_date IS NULL")
    } else if (is(cohort_end_date, "subQuery")){
      whereClasues <- c(whereClasues, paste0("cohort_end_date = (", as.character(cohort_end_date), ")"))
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
      whereClasues <- c(whereClasues, paste0("cohort_definition_id = (", as.character(cohort_definition_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cohort_definition_id = '", cohort_definition_id,"'"))
    }
  }

  if (!missing(cohort_definition_name)) {
    if (is.null(cohort_definition_name)) {
      whereClauses <- c(whereClauses, "cohort_definition_name IS NULL")
    } else if (is(cohort_definition_name, "subQuery")){
      whereClasues <- c(whereClasues, paste0("cohort_definition_name = (", as.character(cohort_definition_name), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cohort_definition_name = '", cohort_definition_name,"'"))
    }
  }

  if (!missing(cohort_definition_description)) {
    if (is.null(cohort_definition_description)) {
      whereClauses <- c(whereClauses, "cohort_definition_description IS NULL")
    } else if (is(cohort_definition_description, "subQuery")){
      whereClasues <- c(whereClasues, paste0("cohort_definition_description = (", as.character(cohort_definition_description), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cohort_definition_description = '", cohort_definition_description,"'"))
    }
  }

  if (!missing(definition_type_concept_id)) {
    if (is.null(definition_type_concept_id)) {
      whereClauses <- c(whereClauses, "definition_type_concept_id IS NULL")
    } else if (is(definition_type_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("definition_type_concept_id = (", as.character(definition_type_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("definition_type_concept_id = '", definition_type_concept_id,"'"))
    }
  }

  if (!missing(cohort_definition_syntax)) {
    if (is.null(cohort_definition_syntax)) {
      whereClauses <- c(whereClauses, "cohort_definition_syntax IS NULL")
    } else if (is(cohort_definition_syntax, "subQuery")){
      whereClasues <- c(whereClasues, paste0("cohort_definition_syntax = (", as.character(cohort_definition_syntax), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cohort_definition_syntax = '", cohort_definition_syntax,"'"))
    }
  }

  if (!missing(subject_concept_id)) {
    if (is.null(subject_concept_id)) {
      whereClauses <- c(whereClauses, "subject_concept_id IS NULL")
    } else if (is(subject_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("subject_concept_id = (", as.character(subject_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("subject_concept_id = '", subject_concept_id,"'"))
    }
  }

  if (!missing(cohort_instantiation_date)) {
    if (is.null(cohort_instantiation_date)) {
      whereClauses <- c(whereClauses, "cohort_instantiation_date IS NULL")
    } else if (is(cohort_instantiation_date, "subQuery")){
      whereClasues <- c(whereClasues, paste0("cohort_instantiation_date = (", as.character(cohort_instantiation_date), ")"))
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
      whereClasues <- c(whereClasues, paste0("cohort_definition_id = (", as.character(cohort_definition_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cohort_definition_id = '", cohort_definition_id,"'"))
    }
  }

  if (!missing(cohort_start_date)) {
    if (is.null(cohort_start_date)) {
      whereClauses <- c(whereClauses, "cohort_start_date IS NULL")
    } else if (is(cohort_start_date, "subQuery")){
      whereClasues <- c(whereClasues, paste0("cohort_start_date = (", as.character(cohort_start_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cohort_start_date = '", cohort_start_date,"'"))
    }
  }

  if (!missing(cohort_end_date)) {
    if (is.null(cohort_end_date)) {
      whereClauses <- c(whereClauses, "cohort_end_date IS NULL")
    } else if (is(cohort_end_date, "subQuery")){
      whereClasues <- c(whereClasues, paste0("cohort_end_date = (", as.character(cohort_end_date), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("cohort_end_date = '", cohort_end_date,"'"))
    }
  }

  if (!missing(subject_id)) {
    if (is.null(subject_id)) {
      whereClauses <- c(whereClauses, "subject_id IS NULL")
    } else if (is(subject_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("subject_id = (", as.character(subject_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("subject_id = '", subject_id,"'"))
    }
  }

  if (!missing(attribute_definition_id)) {
    if (is.null(attribute_definition_id)) {
      whereClauses <- c(whereClauses, "attribute_definition_id IS NULL")
    } else if (is(attribute_definition_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("attribute_definition_id = (", as.character(attribute_definition_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("attribute_definition_id = '", attribute_definition_id,"'"))
    }
  }

  if (!missing(value_as_number)) {
    if (is.null(value_as_number)) {
      whereClauses <- c(whereClauses, "value_as_number IS NULL")
    } else if (is(value_as_number, "subQuery")){
      whereClasues <- c(whereClasues, paste0("value_as_number = (", as.character(value_as_number), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("value_as_number = '", value_as_number,"'"))
    }
  }

  if (!missing(value_as_concept_id)) {
    if (is.null(value_as_concept_id)) {
      whereClauses <- c(whereClauses, "value_as_concept_id IS NULL")
    } else if (is(value_as_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("value_as_concept_id = (", as.character(value_as_concept_id), ")"))
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
      whereClasues <- c(whereClasues, paste0("attribute_definition_id = (", as.character(attribute_definition_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("attribute_definition_id = '", attribute_definition_id,"'"))
    }
  }

  if (!missing(attribute_name)) {
    if (is.null(attribute_name)) {
      whereClauses <- c(whereClauses, "attribute_name IS NULL")
    } else if (is(attribute_name, "subQuery")){
      whereClasues <- c(whereClasues, paste0("attribute_name = (", as.character(attribute_name), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("attribute_name = '", attribute_name,"'"))
    }
  }

  if (!missing(attribute_description)) {
    if (is.null(attribute_description)) {
      whereClauses <- c(whereClauses, "attribute_description IS NULL")
    } else if (is(attribute_description, "subQuery")){
      whereClasues <- c(whereClasues, paste0("attribute_description = (", as.character(attribute_description), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("attribute_description = '", attribute_description,"'"))
    }
  }

  if (!missing(attribute_type_concept_id)) {
    if (is.null(attribute_type_concept_id)) {
      whereClauses <- c(whereClauses, "attribute_type_concept_id IS NULL")
    } else if (is(attribute_type_concept_id, "subQuery")){
      whereClasues <- c(whereClasues, paste0("attribute_type_concept_id = (", as.character(attribute_type_concept_id), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("attribute_type_concept_id = '", attribute_type_concept_id,"'"))
    }
  }

  if (!missing(attribute_syntax)) {
    if (is.null(attribute_syntax)) {
      whereClauses <- c(whereClauses, "attribute_syntax IS NULL")
    } else if (is(attribute_syntax, "subQuery")){
      whereClasues <- c(whereClasues, paste0("attribute_syntax = (", as.character(attribute_syntax), ")"))
    } else {
      whereClauses <- c(whereClauses, paste0("attribute_syntax = '", attribute_syntax,"'"))
    }
  }

  statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  statement <- paste0(statement, ") != ",rowCount ," THEN 'FAIL' ELSE 'PASS' END AS status;")
  frameworkContext$testSql = c(frameworkContext$testSql, statement);
  invisible(statement)
}

lookup_provider <- function(fetchField, provider_id, provider_name, npi, dea, specialty_concept_id, care_site_id, year_of_birth, gender_concept_id, provider_source_value, specialty_source_value, specialty_source_concept_id, gender_source_value, gender_source_concept_id) {
  whereClauses = NULL;
  statement <- paste0("SELECT ", fetchField , " FROM @cdm_schema.provider WHERE ")
  if (!missing(provider_id)) {
    if (is.null(provider_id)) {
      whereClauses <- c(whereClauses, "provider_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "provider_id = '", provider_id,"'")
    }
  }

  if (!missing(provider_name)) {
    if (is.null(provider_name)) {
      whereClauses <- c(whereClauses, "provider_name IS NULL")
    } else {
      whereClauses <- c(whereClauses, "provider_name = '", provider_name,"'")
    }
  }

  if (!missing(npi)) {
    if (is.null(npi)) {
      whereClauses <- c(whereClauses, "npi IS NULL")
    } else {
      whereClauses <- c(whereClauses, "npi = '", npi,"'")
    }
  }

  if (!missing(dea)) {
    if (is.null(dea)) {
      whereClauses <- c(whereClauses, "dea IS NULL")
    } else {
      whereClauses <- c(whereClauses, "dea = '", dea,"'")
    }
  }

  if (!missing(specialty_concept_id)) {
    if (is.null(specialty_concept_id)) {
      whereClauses <- c(whereClauses, "specialty_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "specialty_concept_id = '", specialty_concept_id,"'")
    }
  }

  if (!missing(care_site_id)) {
    if (is.null(care_site_id)) {
      whereClauses <- c(whereClauses, "care_site_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "care_site_id = '", care_site_id,"'")
    }
  }

  if (!missing(year_of_birth)) {
    if (is.null(year_of_birth)) {
      whereClauses <- c(whereClauses, "year_of_birth IS NULL")
    } else {
      whereClauses <- c(whereClauses, "year_of_birth = '", year_of_birth,"'")
    }
  }

  if (!missing(gender_concept_id)) {
    if (is.null(gender_concept_id)) {
      whereClauses <- c(whereClauses, "gender_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "gender_concept_id = '", gender_concept_id,"'")
    }
  }

  if (!missing(provider_source_value)) {
    if (is.null(provider_source_value)) {
      whereClauses <- c(whereClauses, "provider_source_value IS NULL")
    } else {
      whereClauses <- c(whereClauses, "provider_source_value = '", provider_source_value,"'")
    }
  }

  if (!missing(specialty_source_value)) {
    if (is.null(specialty_source_value)) {
      whereClauses <- c(whereClauses, "specialty_source_value IS NULL")
    } else {
      whereClauses <- c(whereClauses, "specialty_source_value = '", specialty_source_value,"'")
    }
  }

  if (!missing(specialty_source_concept_id)) {
    if (is.null(specialty_source_concept_id)) {
      whereClauses <- c(whereClauses, "specialty_source_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "specialty_source_concept_id = '", specialty_source_concept_id,"'")
    }
  }

  if (!missing(gender_source_value)) {
    if (is.null(gender_source_value)) {
      whereClauses <- c(whereClauses, "gender_source_value IS NULL")
    } else {
      whereClauses <- c(whereClauses, "gender_source_value = '", gender_source_value,"'")
    }
  }

  if (!missing(gender_source_concept_id)) {
    if (is.null(gender_source_concept_id)) {
      whereClauses <- c(whereClauses, "gender_source_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "gender_source_concept_id = '", gender_source_concept_id,"'")
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
      whereClauses <- c(whereClauses, "care_site_id = '", care_site_id,"'")
    }
  }

  if (!missing(care_site_name)) {
    if (is.null(care_site_name)) {
      whereClauses <- c(whereClauses, "care_site_name IS NULL")
    } else {
      whereClauses <- c(whereClauses, "care_site_name = '", care_site_name,"'")
    }
  }

  if (!missing(place_of_service_concept_id)) {
    if (is.null(place_of_service_concept_id)) {
      whereClauses <- c(whereClauses, "place_of_service_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "place_of_service_concept_id = '", place_of_service_concept_id,"'")
    }
  }

  if (!missing(location_id)) {
    if (is.null(location_id)) {
      whereClauses <- c(whereClauses, "location_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "location_id = '", location_id,"'")
    }
  }

  if (!missing(care_site_source_value)) {
    if (is.null(care_site_source_value)) {
      whereClauses <- c(whereClauses, "care_site_source_value IS NULL")
    } else {
      whereClauses <- c(whereClauses, "care_site_source_value = '", care_site_source_value,"'")
    }
  }

  if (!missing(place_of_service_source_value)) {
    if (is.null(place_of_service_source_value)) {
      whereClauses <- c(whereClauses, "place_of_service_source_value IS NULL")
    } else {
      whereClauses <- c(whereClauses, "place_of_service_source_value = '", place_of_service_source_value,"'")
    }
  }

  statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  class(statement) <- "subQuery"
  return(statement)
}

lookup_location <- function(fetchField, location_id, address_1, address_2, city, state, zip, county, location_source_value) {
  whereClauses = NULL;
  statement <- paste0("SELECT ", fetchField , " FROM @cdm_schema.location WHERE ")
  if (!missing(location_id)) {
    if (is.null(location_id)) {
      whereClauses <- c(whereClauses, "location_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "location_id = '", location_id,"'")
    }
  }

  if (!missing(address_1)) {
    if (is.null(address_1)) {
      whereClauses <- c(whereClauses, "address_1 IS NULL")
    } else {
      whereClauses <- c(whereClauses, "address_1 = '", address_1,"'")
    }
  }

  if (!missing(address_2)) {
    if (is.null(address_2)) {
      whereClauses <- c(whereClauses, "address_2 IS NULL")
    } else {
      whereClauses <- c(whereClauses, "address_2 = '", address_2,"'")
    }
  }

  if (!missing(city)) {
    if (is.null(city)) {
      whereClauses <- c(whereClauses, "city IS NULL")
    } else {
      whereClauses <- c(whereClauses, "city = '", city,"'")
    }
  }

  if (!missing(state)) {
    if (is.null(state)) {
      whereClauses <- c(whereClauses, "state IS NULL")
    } else {
      whereClauses <- c(whereClauses, "state = '", state,"'")
    }
  }

  if (!missing(zip)) {
    if (is.null(zip)) {
      whereClauses <- c(whereClauses, "zip IS NULL")
    } else {
      whereClauses <- c(whereClauses, "zip = '", zip,"'")
    }
  }

  if (!missing(county)) {
    if (is.null(county)) {
      whereClauses <- c(whereClauses, "county IS NULL")
    } else {
      whereClauses <- c(whereClauses, "county = '", county,"'")
    }
  }

  if (!missing(location_source_value)) {
    if (is.null(location_source_value)) {
      whereClauses <- c(whereClauses, "location_source_value IS NULL")
    } else {
      whereClauses <- c(whereClauses, "location_source_value = '", location_source_value,"'")
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
      whereClauses <- c(whereClauses, "person_id = '", person_id,"'")
    }
  }

  if (!missing(gender_concept_id)) {
    if (is.null(gender_concept_id)) {
      whereClauses <- c(whereClauses, "gender_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "gender_concept_id = '", gender_concept_id,"'")
    }
  }

  if (!missing(year_of_birth)) {
    if (is.null(year_of_birth)) {
      whereClauses <- c(whereClauses, "year_of_birth IS NULL")
    } else {
      whereClauses <- c(whereClauses, "year_of_birth = '", year_of_birth,"'")
    }
  }

  if (!missing(month_of_birth)) {
    if (is.null(month_of_birth)) {
      whereClauses <- c(whereClauses, "month_of_birth IS NULL")
    } else {
      whereClauses <- c(whereClauses, "month_of_birth = '", month_of_birth,"'")
    }
  }

  if (!missing(day_of_birth)) {
    if (is.null(day_of_birth)) {
      whereClauses <- c(whereClauses, "day_of_birth IS NULL")
    } else {
      whereClauses <- c(whereClauses, "day_of_birth = '", day_of_birth,"'")
    }
  }

  if (!missing(time_of_birth)) {
    if (is.null(time_of_birth)) {
      whereClauses <- c(whereClauses, "time_of_birth IS NULL")
    } else {
      whereClauses <- c(whereClauses, "time_of_birth = '", time_of_birth,"'")
    }
  }

  if (!missing(race_concept_id)) {
    if (is.null(race_concept_id)) {
      whereClauses <- c(whereClauses, "race_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "race_concept_id = '", race_concept_id,"'")
    }
  }

  if (!missing(ethnicity_concept_id)) {
    if (is.null(ethnicity_concept_id)) {
      whereClauses <- c(whereClauses, "ethnicity_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "ethnicity_concept_id = '", ethnicity_concept_id,"'")
    }
  }

  if (!missing(location_id)) {
    if (is.null(location_id)) {
      whereClauses <- c(whereClauses, "location_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "location_id = '", location_id,"'")
    }
  }

  if (!missing(provider_id)) {
    if (is.null(provider_id)) {
      whereClauses <- c(whereClauses, "provider_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "provider_id = '", provider_id,"'")
    }
  }

  if (!missing(care_site_id)) {
    if (is.null(care_site_id)) {
      whereClauses <- c(whereClauses, "care_site_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "care_site_id = '", care_site_id,"'")
    }
  }

  if (!missing(person_source_value)) {
    if (is.null(person_source_value)) {
      whereClauses <- c(whereClauses, "person_source_value IS NULL")
    } else {
      whereClauses <- c(whereClauses, "person_source_value = '", person_source_value,"'")
    }
  }

  if (!missing(gender_source_value)) {
    if (is.null(gender_source_value)) {
      whereClauses <- c(whereClauses, "gender_source_value IS NULL")
    } else {
      whereClauses <- c(whereClauses, "gender_source_value = '", gender_source_value,"'")
    }
  }

  if (!missing(gender_source_concept_id)) {
    if (is.null(gender_source_concept_id)) {
      whereClauses <- c(whereClauses, "gender_source_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "gender_source_concept_id = '", gender_source_concept_id,"'")
    }
  }

  if (!missing(race_source_value)) {
    if (is.null(race_source_value)) {
      whereClauses <- c(whereClauses, "race_source_value IS NULL")
    } else {
      whereClauses <- c(whereClauses, "race_source_value = '", race_source_value,"'")
    }
  }

  if (!missing(race_source_concept_id)) {
    if (is.null(race_source_concept_id)) {
      whereClauses <- c(whereClauses, "race_source_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "race_source_concept_id = '", race_source_concept_id,"'")
    }
  }

  if (!missing(ethnicity_source_value)) {
    if (is.null(ethnicity_source_value)) {
      whereClauses <- c(whereClauses, "ethnicity_source_value IS NULL")
    } else {
      whereClauses <- c(whereClauses, "ethnicity_source_value = '", ethnicity_source_value,"'")
    }
  }

  if (!missing(ethnicity_source_concept_id)) {
    if (is.null(ethnicity_source_concept_id)) {
      whereClauses <- c(whereClauses, "ethnicity_source_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "ethnicity_source_concept_id = '", ethnicity_source_concept_id,"'")
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
      whereClauses <- c(whereClauses, "observation_period_id = '", observation_period_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "person_id = '", person_id,"'")
    }
  }

  if (!missing(observation_period_start_date)) {
    if (is.null(observation_period_start_date)) {
      whereClauses <- c(whereClauses, "observation_period_start_date IS NULL")
    } else {
      whereClauses <- c(whereClauses, "observation_period_start_date = '", observation_period_start_date,"'")
    }
  }

  if (!missing(observation_period_end_date)) {
    if (is.null(observation_period_end_date)) {
      whereClauses <- c(whereClauses, "observation_period_end_date IS NULL")
    } else {
      whereClauses <- c(whereClauses, "observation_period_end_date = '", observation_period_end_date,"'")
    }
  }

  if (!missing(period_type_concept_id)) {
    if (is.null(period_type_concept_id)) {
      whereClauses <- c(whereClauses, "period_type_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "period_type_concept_id = '", period_type_concept_id,"'")
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
      whereClauses <- c(whereClauses, "person_id = '", person_id,"'")
    }
  }

  if (!missing(death_date)) {
    if (is.null(death_date)) {
      whereClauses <- c(whereClauses, "death_date IS NULL")
    } else {
      whereClauses <- c(whereClauses, "death_date = '", death_date,"'")
    }
  }

  if (!missing(death_type_concept_id)) {
    if (is.null(death_type_concept_id)) {
      whereClauses <- c(whereClauses, "death_type_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "death_type_concept_id = '", death_type_concept_id,"'")
    }
  }

  if (!missing(cause_concept_id)) {
    if (is.null(cause_concept_id)) {
      whereClauses <- c(whereClauses, "cause_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "cause_concept_id = '", cause_concept_id,"'")
    }
  }

  if (!missing(cause_source_value)) {
    if (is.null(cause_source_value)) {
      whereClauses <- c(whereClauses, "cause_source_value IS NULL")
    } else {
      whereClauses <- c(whereClauses, "cause_source_value = '", cause_source_value,"'")
    }
  }

  if (!missing(cause_source_concept_id)) {
    if (is.null(cause_source_concept_id)) {
      whereClauses <- c(whereClauses, "cause_source_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "cause_source_concept_id = '", cause_source_concept_id,"'")
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
      whereClauses <- c(whereClauses, "visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "person_id = '", person_id,"'")
    }
  }

  if (!missing(visit_concept_id)) {
    if (is.null(visit_concept_id)) {
      whereClauses <- c(whereClauses, "visit_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "visit_concept_id = '", visit_concept_id,"'")
    }
  }

  if (!missing(visit_start_date)) {
    if (is.null(visit_start_date)) {
      whereClauses <- c(whereClauses, "visit_start_date IS NULL")
    } else {
      whereClauses <- c(whereClauses, "visit_start_date = '", visit_start_date,"'")
    }
  }

  if (!missing(visit_start_time)) {
    if (is.null(visit_start_time)) {
      whereClauses <- c(whereClauses, "visit_start_time IS NULL")
    } else {
      whereClauses <- c(whereClauses, "visit_start_time = '", visit_start_time,"'")
    }
  }

  if (!missing(visit_end_date)) {
    if (is.null(visit_end_date)) {
      whereClauses <- c(whereClauses, "visit_end_date IS NULL")
    } else {
      whereClauses <- c(whereClauses, "visit_end_date = '", visit_end_date,"'")
    }
  }

  if (!missing(visit_end_time)) {
    if (is.null(visit_end_time)) {
      whereClauses <- c(whereClauses, "visit_end_time IS NULL")
    } else {
      whereClauses <- c(whereClauses, "visit_end_time = '", visit_end_time,"'")
    }
  }

  if (!missing(visit_type_concept_id)) {
    if (is.null(visit_type_concept_id)) {
      whereClauses <- c(whereClauses, "visit_type_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "visit_type_concept_id = '", visit_type_concept_id,"'")
    }
  }

  if (!missing(provider_id)) {
    if (is.null(provider_id)) {
      whereClauses <- c(whereClauses, "provider_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "provider_id = '", provider_id,"'")
    }
  }

  if (!missing(care_site_id)) {
    if (is.null(care_site_id)) {
      whereClauses <- c(whereClauses, "care_site_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "care_site_id = '", care_site_id,"'")
    }
  }

  if (!missing(visit_source_value)) {
    if (is.null(visit_source_value)) {
      whereClauses <- c(whereClauses, "visit_source_value IS NULL")
    } else {
      whereClauses <- c(whereClauses, "visit_source_value = '", visit_source_value,"'")
    }
  }

  if (!missing(visit_source_concept_id)) {
    if (is.null(visit_source_concept_id)) {
      whereClauses <- c(whereClauses, "visit_source_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "visit_source_concept_id = '", visit_source_concept_id,"'")
    }
  }

  statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  class(statement) <- "subQuery"
  return(statement)
}

lookup_condition_occurrence <- function(fetchField, condition_occurrence_id, person_id, condition_concept_id, condition_source_concept_id, condition_source_value, condition_start_date, provider_id, visit_occurrence_id, condition_type_concept_id, condition_end_date, stop_reason) {
  whereClauses = NULL;
  statement <- paste0("SELECT ", fetchField , " FROM @cdm_schema.condition_occurrence WHERE ")
  if (!missing(condition_occurrence_id)) {
    if (is.null(condition_occurrence_id)) {
      whereClauses <- c(whereClauses, "condition_occurrence_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "condition_occurrence_id = '", condition_occurrence_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "person_id = '", person_id,"'")
    }
  }

  if (!missing(condition_concept_id)) {
    if (is.null(condition_concept_id)) {
      whereClauses <- c(whereClauses, "condition_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "condition_concept_id = '", condition_concept_id,"'")
    }
  }

  if (!missing(condition_source_concept_id)) {
    if (is.null(condition_source_concept_id)) {
      whereClauses <- c(whereClauses, "condition_source_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "condition_source_concept_id = '", condition_source_concept_id,"'")
    }
  }

  if (!missing(condition_source_value)) {
    if (is.null(condition_source_value)) {
      whereClauses <- c(whereClauses, "condition_source_value IS NULL")
    } else {
      whereClauses <- c(whereClauses, "condition_source_value = '", condition_source_value,"'")
    }
  }

  if (!missing(condition_start_date)) {
    if (is.null(condition_start_date)) {
      whereClauses <- c(whereClauses, "condition_start_date IS NULL")
    } else {
      whereClauses <- c(whereClauses, "condition_start_date = '", condition_start_date,"'")
    }
  }

  if (!missing(provider_id)) {
    if (is.null(provider_id)) {
      whereClauses <- c(whereClauses, "provider_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "provider_id = '", provider_id,"'")
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (is.null(visit_occurrence_id)) {
      whereClauses <- c(whereClauses, "visit_occurrence_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }

  if (!missing(condition_type_concept_id)) {
    if (is.null(condition_type_concept_id)) {
      whereClauses <- c(whereClauses, "condition_type_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "condition_type_concept_id = '", condition_type_concept_id,"'")
    }
  }

  if (!missing(condition_end_date)) {
    if (is.null(condition_end_date)) {
      whereClauses <- c(whereClauses, "condition_end_date IS NULL")
    } else {
      whereClauses <- c(whereClauses, "condition_end_date = '", condition_end_date,"'")
    }
  }

  if (!missing(stop_reason)) {
    if (is.null(stop_reason)) {
      whereClauses <- c(whereClauses, "stop_reason IS NULL")
    } else {
      whereClauses <- c(whereClauses, "stop_reason = '", stop_reason,"'")
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
      whereClauses <- c(whereClauses, "device_exposure_id = '", device_exposure_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "person_id = '", person_id,"'")
    }
  }

  if (!missing(device_concept_id)) {
    if (is.null(device_concept_id)) {
      whereClauses <- c(whereClauses, "device_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "device_concept_id = '", device_concept_id,"'")
    }
  }

  if (!missing(device_exposure_start_date)) {
    if (is.null(device_exposure_start_date)) {
      whereClauses <- c(whereClauses, "device_exposure_start_date IS NULL")
    } else {
      whereClauses <- c(whereClauses, "device_exposure_start_date = '", device_exposure_start_date,"'")
    }
  }

  if (!missing(device_exposure_end_date)) {
    if (is.null(device_exposure_end_date)) {
      whereClauses <- c(whereClauses, "device_exposure_end_date IS NULL")
    } else {
      whereClauses <- c(whereClauses, "device_exposure_end_date = '", device_exposure_end_date,"'")
    }
  }

  if (!missing(device_type_concept_id)) {
    if (is.null(device_type_concept_id)) {
      whereClauses <- c(whereClauses, "device_type_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "device_type_concept_id = '", device_type_concept_id,"'")
    }
  }

  if (!missing(unique_device_id)) {
    if (is.null(unique_device_id)) {
      whereClauses <- c(whereClauses, "unique_device_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "unique_device_id = '", unique_device_id,"'")
    }
  }

  if (!missing(quantity)) {
    if (is.null(quantity)) {
      whereClauses <- c(whereClauses, "quantity IS NULL")
    } else {
      whereClauses <- c(whereClauses, "quantity = '", quantity,"'")
    }
  }

  if (!missing(provider_id)) {
    if (is.null(provider_id)) {
      whereClauses <- c(whereClauses, "provider_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "provider_id = '", provider_id,"'")
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (is.null(visit_occurrence_id)) {
      whereClauses <- c(whereClauses, "visit_occurrence_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }

  if (!missing(device_source_value)) {
    if (is.null(device_source_value)) {
      whereClauses <- c(whereClauses, "device_source_value IS NULL")
    } else {
      whereClauses <- c(whereClauses, "device_source_value = '", device_source_value,"'")
    }
  }

  if (!missing(device_source_concept_id)) {
    if (is.null(device_source_concept_id)) {
      whereClauses <- c(whereClauses, "device_source_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "device_source_concept_id = '", device_source_concept_id,"'")
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
      whereClauses <- c(whereClauses, "observation_id = '", observation_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "person_id = '", person_id,"'")
    }
  }

  if (!missing(observation_concept_id)) {
    if (is.null(observation_concept_id)) {
      whereClauses <- c(whereClauses, "observation_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "observation_concept_id = '", observation_concept_id,"'")
    }
  }

  if (!missing(observation_date)) {
    if (is.null(observation_date)) {
      whereClauses <- c(whereClauses, "observation_date IS NULL")
    } else {
      whereClauses <- c(whereClauses, "observation_date = '", observation_date,"'")
    }
  }

  if (!missing(observation_time)) {
    if (is.null(observation_time)) {
      whereClauses <- c(whereClauses, "observation_time IS NULL")
    } else {
      whereClauses <- c(whereClauses, "observation_time = '", observation_time,"'")
    }
  }

  if (!missing(observation_type_concept_id)) {
    if (is.null(observation_type_concept_id)) {
      whereClauses <- c(whereClauses, "observation_type_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "observation_type_concept_id = '", observation_type_concept_id,"'")
    }
  }

  if (!missing(value_as_number)) {
    if (is.null(value_as_number)) {
      whereClauses <- c(whereClauses, "value_as_number IS NULL")
    } else {
      whereClauses <- c(whereClauses, "value_as_number = '", value_as_number,"'")
    }
  }

  if (!missing(value_as_string)) {
    if (is.null(value_as_string)) {
      whereClauses <- c(whereClauses, "value_as_string IS NULL")
    } else {
      whereClauses <- c(whereClauses, "value_as_string = '", value_as_string,"'")
    }
  }

  if (!missing(value_as_concept_id)) {
    if (is.null(value_as_concept_id)) {
      whereClauses <- c(whereClauses, "value_as_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "value_as_concept_id = '", value_as_concept_id,"'")
    }
  }

  if (!missing(qualifier_concept_id)) {
    if (is.null(qualifier_concept_id)) {
      whereClauses <- c(whereClauses, "qualifier_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "qualifier_concept_id = '", qualifier_concept_id,"'")
    }
  }

  if (!missing(unit_concept_id)) {
    if (is.null(unit_concept_id)) {
      whereClauses <- c(whereClauses, "unit_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "unit_concept_id = '", unit_concept_id,"'")
    }
  }

  if (!missing(provider_id)) {
    if (is.null(provider_id)) {
      whereClauses <- c(whereClauses, "provider_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "provider_id = '", provider_id,"'")
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (is.null(visit_occurrence_id)) {
      whereClauses <- c(whereClauses, "visit_occurrence_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }

  if (!missing(observation_source_value)) {
    if (is.null(observation_source_value)) {
      whereClauses <- c(whereClauses, "observation_source_value IS NULL")
    } else {
      whereClauses <- c(whereClauses, "observation_source_value = '", observation_source_value,"'")
    }
  }

  if (!missing(observation_source_concept_id)) {
    if (is.null(observation_source_concept_id)) {
      whereClauses <- c(whereClauses, "observation_source_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "observation_source_concept_id = '", observation_source_concept_id,"'")
    }
  }

  if (!missing(unit_source_value)) {
    if (is.null(unit_source_value)) {
      whereClauses <- c(whereClauses, "unit_source_value IS NULL")
    } else {
      whereClauses <- c(whereClauses, "unit_source_value = '", unit_source_value,"'")
    }
  }

  if (!missing(qualifier_source_value)) {
    if (is.null(qualifier_source_value)) {
      whereClauses <- c(whereClauses, "qualifier_source_value IS NULL")
    } else {
      whereClauses <- c(whereClauses, "qualifier_source_value = '", qualifier_source_value,"'")
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
      whereClauses <- c(whereClauses, "measurement_id = '", measurement_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "person_id = '", person_id,"'")
    }
  }

  if (!missing(measurement_concept_id)) {
    if (is.null(measurement_concept_id)) {
      whereClauses <- c(whereClauses, "measurement_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "measurement_concept_id = '", measurement_concept_id,"'")
    }
  }

  if (!missing(measurement_date)) {
    if (is.null(measurement_date)) {
      whereClauses <- c(whereClauses, "measurement_date IS NULL")
    } else {
      whereClauses <- c(whereClauses, "measurement_date = '", measurement_date,"'")
    }
  }

  if (!missing(measurement_time)) {
    if (is.null(measurement_time)) {
      whereClauses <- c(whereClauses, "measurement_time IS NULL")
    } else {
      whereClauses <- c(whereClauses, "measurement_time = '", measurement_time,"'")
    }
  }

  if (!missing(measurement_type_concept_id)) {
    if (is.null(measurement_type_concept_id)) {
      whereClauses <- c(whereClauses, "measurement_type_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "measurement_type_concept_id = '", measurement_type_concept_id,"'")
    }
  }

  if (!missing(operator_concept_id)) {
    if (is.null(operator_concept_id)) {
      whereClauses <- c(whereClauses, "operator_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "operator_concept_id = '", operator_concept_id,"'")
    }
  }

  if (!missing(value_as_number)) {
    if (is.null(value_as_number)) {
      whereClauses <- c(whereClauses, "value_as_number IS NULL")
    } else {
      whereClauses <- c(whereClauses, "value_as_number = '", value_as_number,"'")
    }
  }

  if (!missing(value_as_concept_id)) {
    if (is.null(value_as_concept_id)) {
      whereClauses <- c(whereClauses, "value_as_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "value_as_concept_id = '", value_as_concept_id,"'")
    }
  }

  if (!missing(unit_concept_id)) {
    if (is.null(unit_concept_id)) {
      whereClauses <- c(whereClauses, "unit_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "unit_concept_id = '", unit_concept_id,"'")
    }
  }

  if (!missing(range_low)) {
    if (is.null(range_low)) {
      whereClauses <- c(whereClauses, "range_low IS NULL")
    } else {
      whereClauses <- c(whereClauses, "range_low = '", range_low,"'")
    }
  }

  if (!missing(range_high)) {
    if (is.null(range_high)) {
      whereClauses <- c(whereClauses, "range_high IS NULL")
    } else {
      whereClauses <- c(whereClauses, "range_high = '", range_high,"'")
    }
  }

  if (!missing(provider_id)) {
    if (is.null(provider_id)) {
      whereClauses <- c(whereClauses, "provider_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "provider_id = '", provider_id,"'")
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (is.null(visit_occurrence_id)) {
      whereClauses <- c(whereClauses, "visit_occurrence_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }

  if (!missing(measurement_source_value)) {
    if (is.null(measurement_source_value)) {
      whereClauses <- c(whereClauses, "measurement_source_value IS NULL")
    } else {
      whereClauses <- c(whereClauses, "measurement_source_value = '", measurement_source_value,"'")
    }
  }

  if (!missing(measurement_source_concept_id)) {
    if (is.null(measurement_source_concept_id)) {
      whereClauses <- c(whereClauses, "measurement_source_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "measurement_source_concept_id = '", measurement_source_concept_id,"'")
    }
  }

  if (!missing(unit_source_value)) {
    if (is.null(unit_source_value)) {
      whereClauses <- c(whereClauses, "unit_source_value IS NULL")
    } else {
      whereClauses <- c(whereClauses, "unit_source_value = '", unit_source_value,"'")
    }
  }

  if (!missing(value_source_value)) {
    if (is.null(value_source_value)) {
      whereClauses <- c(whereClauses, "value_source_value IS NULL")
    } else {
      whereClauses <- c(whereClauses, "value_source_value = '", value_source_value,"'")
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
      whereClauses <- c(whereClauses, "procedure_occurrence_id = '", procedure_occurrence_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "person_id = '", person_id,"'")
    }
  }

  if (!missing(procedure_concept_id)) {
    if (is.null(procedure_concept_id)) {
      whereClauses <- c(whereClauses, "procedure_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "procedure_concept_id = '", procedure_concept_id,"'")
    }
  }

  if (!missing(procedure_date)) {
    if (is.null(procedure_date)) {
      whereClauses <- c(whereClauses, "procedure_date IS NULL")
    } else {
      whereClauses <- c(whereClauses, "procedure_date = '", procedure_date,"'")
    }
  }

  if (!missing(procedure_type_concept_id)) {
    if (is.null(procedure_type_concept_id)) {
      whereClauses <- c(whereClauses, "procedure_type_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "procedure_type_concept_id = '", procedure_type_concept_id,"'")
    }
  }

  if (!missing(modifier_concept_id)) {
    if (is.null(modifier_concept_id)) {
      whereClauses <- c(whereClauses, "modifier_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "modifier_concept_id = '", modifier_concept_id,"'")
    }
  }

  if (!missing(quantity)) {
    if (is.null(quantity)) {
      whereClauses <- c(whereClauses, "quantity IS NULL")
    } else {
      whereClauses <- c(whereClauses, "quantity = '", quantity,"'")
    }
  }

  if (!missing(provider_id)) {
    if (is.null(provider_id)) {
      whereClauses <- c(whereClauses, "provider_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "provider_id = '", provider_id,"'")
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (is.null(visit_occurrence_id)) {
      whereClauses <- c(whereClauses, "visit_occurrence_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }

  if (!missing(procedure_source_value)) {
    if (is.null(procedure_source_value)) {
      whereClauses <- c(whereClauses, "procedure_source_value IS NULL")
    } else {
      whereClauses <- c(whereClauses, "procedure_source_value = '", procedure_source_value,"'")
    }
  }

  if (!missing(procedure_source_concept_id)) {
    if (is.null(procedure_source_concept_id)) {
      whereClauses <- c(whereClauses, "procedure_source_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "procedure_source_concept_id = '", procedure_source_concept_id,"'")
    }
  }

  if (!missing(qualifier_source_value)) {
    if (is.null(qualifier_source_value)) {
      whereClauses <- c(whereClauses, "qualifier_source_value IS NULL")
    } else {
      whereClauses <- c(whereClauses, "qualifier_source_value = '", qualifier_source_value,"'")
    }
  }

  statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  class(statement) <- "subQuery"
  return(statement)
}

lookup_drug_exposure <- function(fetchField, drug_exposure_id, person_id, drug_exposure_start_date, drug_concept_id, drug_source_value, drug_source_concept_id, drug_type_concept_id, provider_id, visit_occurrence_id, route_concept_id, route_source_value, quantity, refills, days_supply, dose_unit_concept_id, dose_unit_source_value, effective_drug_dose, stop_reason, sig, lot_number, drug_exposure_end_date) {
  whereClauses = NULL;
  statement <- paste0("SELECT ", fetchField , " FROM @cdm_schema.drug_exposure WHERE ")
  if (!missing(drug_exposure_id)) {
    if (is.null(drug_exposure_id)) {
      whereClauses <- c(whereClauses, "drug_exposure_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "drug_exposure_id = '", drug_exposure_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "person_id = '", person_id,"'")
    }
  }

  if (!missing(drug_exposure_start_date)) {
    if (is.null(drug_exposure_start_date)) {
      whereClauses <- c(whereClauses, "drug_exposure_start_date IS NULL")
    } else {
      whereClauses <- c(whereClauses, "drug_exposure_start_date = '", drug_exposure_start_date,"'")
    }
  }

  if (!missing(drug_concept_id)) {
    if (is.null(drug_concept_id)) {
      whereClauses <- c(whereClauses, "drug_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "drug_concept_id = '", drug_concept_id,"'")
    }
  }

  if (!missing(drug_source_value)) {
    if (is.null(drug_source_value)) {
      whereClauses <- c(whereClauses, "drug_source_value IS NULL")
    } else {
      whereClauses <- c(whereClauses, "drug_source_value = '", drug_source_value,"'")
    }
  }

  if (!missing(drug_source_concept_id)) {
    if (is.null(drug_source_concept_id)) {
      whereClauses <- c(whereClauses, "drug_source_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "drug_source_concept_id = '", drug_source_concept_id,"'")
    }
  }

  if (!missing(drug_type_concept_id)) {
    if (is.null(drug_type_concept_id)) {
      whereClauses <- c(whereClauses, "drug_type_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "drug_type_concept_id = '", drug_type_concept_id,"'")
    }
  }

  if (!missing(provider_id)) {
    if (is.null(provider_id)) {
      whereClauses <- c(whereClauses, "provider_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "provider_id = '", provider_id,"'")
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (is.null(visit_occurrence_id)) {
      whereClauses <- c(whereClauses, "visit_occurrence_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }

  if (!missing(route_concept_id)) {
    if (is.null(route_concept_id)) {
      whereClauses <- c(whereClauses, "route_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "route_concept_id = '", route_concept_id,"'")
    }
  }

  if (!missing(route_source_value)) {
    if (is.null(route_source_value)) {
      whereClauses <- c(whereClauses, "route_source_value IS NULL")
    } else {
      whereClauses <- c(whereClauses, "route_source_value = '", route_source_value,"'")
    }
  }

  if (!missing(quantity)) {
    if (is.null(quantity)) {
      whereClauses <- c(whereClauses, "quantity IS NULL")
    } else {
      whereClauses <- c(whereClauses, "quantity = '", quantity,"'")
    }
  }

  if (!missing(refills)) {
    if (is.null(refills)) {
      whereClauses <- c(whereClauses, "refills IS NULL")
    } else {
      whereClauses <- c(whereClauses, "refills = '", refills,"'")
    }
  }

  if (!missing(days_supply)) {
    if (is.null(days_supply)) {
      whereClauses <- c(whereClauses, "days_supply IS NULL")
    } else {
      whereClauses <- c(whereClauses, "days_supply = '", days_supply,"'")
    }
  }

  if (!missing(dose_unit_concept_id)) {
    if (is.null(dose_unit_concept_id)) {
      whereClauses <- c(whereClauses, "dose_unit_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "dose_unit_concept_id = '", dose_unit_concept_id,"'")
    }
  }

  if (!missing(dose_unit_source_value)) {
    if (is.null(dose_unit_source_value)) {
      whereClauses <- c(whereClauses, "dose_unit_source_value IS NULL")
    } else {
      whereClauses <- c(whereClauses, "dose_unit_source_value = '", dose_unit_source_value,"'")
    }
  }

  if (!missing(effective_drug_dose)) {
    if (is.null(effective_drug_dose)) {
      whereClauses <- c(whereClauses, "effective_drug_dose IS NULL")
    } else {
      whereClauses <- c(whereClauses, "effective_drug_dose = '", effective_drug_dose,"'")
    }
  }

  if (!missing(stop_reason)) {
    if (is.null(stop_reason)) {
      whereClauses <- c(whereClauses, "stop_reason IS NULL")
    } else {
      whereClauses <- c(whereClauses, "stop_reason = '", stop_reason,"'")
    }
  }

  if (!missing(sig)) {
    if (is.null(sig)) {
      whereClauses <- c(whereClauses, "sig IS NULL")
    } else {
      whereClauses <- c(whereClauses, "sig = '", sig,"'")
    }
  }

  if (!missing(lot_number)) {
    if (is.null(lot_number)) {
      whereClauses <- c(whereClauses, "lot_number IS NULL")
    } else {
      whereClauses <- c(whereClauses, "lot_number = '", lot_number,"'")
    }
  }

  if (!missing(drug_exposure_end_date)) {
    if (is.null(drug_exposure_end_date)) {
      whereClauses <- c(whereClauses, "drug_exposure_end_date IS NULL")
    } else {
      whereClauses <- c(whereClauses, "drug_exposure_end_date = '", drug_exposure_end_date,"'")
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
      whereClauses <- c(whereClauses, "domain_concept_id_1 = '", domain_concept_id_1,"'")
    }
  }

  if (!missing(fact_id_1)) {
    if (is.null(fact_id_1)) {
      whereClauses <- c(whereClauses, "fact_id_1 IS NULL")
    } else {
      whereClauses <- c(whereClauses, "fact_id_1 = '", fact_id_1,"'")
    }
  }

  if (!missing(domain_concept_id_2)) {
    if (is.null(domain_concept_id_2)) {
      whereClauses <- c(whereClauses, "domain_concept_id_2 IS NULL")
    } else {
      whereClauses <- c(whereClauses, "domain_concept_id_2 = '", domain_concept_id_2,"'")
    }
  }

  if (!missing(fact_id_2)) {
    if (is.null(fact_id_2)) {
      whereClauses <- c(whereClauses, "fact_id_2 IS NULL")
    } else {
      whereClauses <- c(whereClauses, "fact_id_2 = '", fact_id_2,"'")
    }
  }

  if (!missing(relationship_concept_id)) {
    if (is.null(relationship_concept_id)) {
      whereClauses <- c(whereClauses, "relationship_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "relationship_concept_id = '", relationship_concept_id,"'")
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
      whereClauses <- c(whereClauses, "payer_plan_period_id = '", payer_plan_period_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "person_id = '", person_id,"'")
    }
  }

  if (!missing(payer_plan_period_start_date)) {
    if (is.null(payer_plan_period_start_date)) {
      whereClauses <- c(whereClauses, "payer_plan_period_start_date IS NULL")
    } else {
      whereClauses <- c(whereClauses, "payer_plan_period_start_date = '", payer_plan_period_start_date,"'")
    }
  }

  if (!missing(payer_plan_period_end_date)) {
    if (is.null(payer_plan_period_end_date)) {
      whereClauses <- c(whereClauses, "payer_plan_period_end_date IS NULL")
    } else {
      whereClauses <- c(whereClauses, "payer_plan_period_end_date = '", payer_plan_period_end_date,"'")
    }
  }

  if (!missing(payer_source_value)) {
    if (is.null(payer_source_value)) {
      whereClauses <- c(whereClauses, "payer_source_value IS NULL")
    } else {
      whereClauses <- c(whereClauses, "payer_source_value = '", payer_source_value,"'")
    }
  }

  if (!missing(plan_source_value)) {
    if (is.null(plan_source_value)) {
      whereClauses <- c(whereClauses, "plan_source_value IS NULL")
    } else {
      whereClauses <- c(whereClauses, "plan_source_value = '", plan_source_value,"'")
    }
  }

  if (!missing(family_source_value)) {
    if (is.null(family_source_value)) {
      whereClauses <- c(whereClauses, "family_source_value IS NULL")
    } else {
      whereClauses <- c(whereClauses, "family_source_value = '", family_source_value,"'")
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
      whereClauses <- c(whereClauses, "note_id = '", note_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "person_id = '", person_id,"'")
    }
  }

  if (!missing(note_date)) {
    if (is.null(note_date)) {
      whereClauses <- c(whereClauses, "note_date IS NULL")
    } else {
      whereClauses <- c(whereClauses, "note_date = '", note_date,"'")
    }
  }

  if (!missing(note_time)) {
    if (is.null(note_time)) {
      whereClauses <- c(whereClauses, "note_time IS NULL")
    } else {
      whereClauses <- c(whereClauses, "note_time = '", note_time,"'")
    }
  }

  if (!missing(note_type_concept_id)) {
    if (is.null(note_type_concept_id)) {
      whereClauses <- c(whereClauses, "note_type_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "note_type_concept_id = '", note_type_concept_id,"'")
    }
  }

  if (!missing(note_text)) {
    if (is.null(note_text)) {
      whereClauses <- c(whereClauses, "note_text IS NULL")
    } else {
      whereClauses <- c(whereClauses, "note_text = '", note_text,"'")
    }
  }

  if (!missing(provider_id)) {
    if (is.null(provider_id)) {
      whereClauses <- c(whereClauses, "provider_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "provider_id = '", provider_id,"'")
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (is.null(visit_occurrence_id)) {
      whereClauses <- c(whereClauses, "visit_occurrence_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }

  if (!missing(note_source_value)) {
    if (is.null(note_source_value)) {
      whereClauses <- c(whereClauses, "note_source_value IS NULL")
    } else {
      whereClauses <- c(whereClauses, "note_source_value = '", note_source_value,"'")
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
      whereClauses <- c(whereClauses, "specimen_id = '", specimen_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "person_id = '", person_id,"'")
    }
  }

  if (!missing(specimen_concept_id)) {
    if (is.null(specimen_concept_id)) {
      whereClauses <- c(whereClauses, "specimen_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "specimen_concept_id = '", specimen_concept_id,"'")
    }
  }

  if (!missing(specimen_type_concept_id)) {
    if (is.null(specimen_type_concept_id)) {
      whereClauses <- c(whereClauses, "specimen_type_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "specimen_type_concept_id = '", specimen_type_concept_id,"'")
    }
  }

  if (!missing(specimen_date)) {
    if (is.null(specimen_date)) {
      whereClauses <- c(whereClauses, "specimen_date IS NULL")
    } else {
      whereClauses <- c(whereClauses, "specimen_date = '", specimen_date,"'")
    }
  }

  if (!missing(specimen_time)) {
    if (is.null(specimen_time)) {
      whereClauses <- c(whereClauses, "specimen_time IS NULL")
    } else {
      whereClauses <- c(whereClauses, "specimen_time = '", specimen_time,"'")
    }
  }

  if (!missing(quantity)) {
    if (is.null(quantity)) {
      whereClauses <- c(whereClauses, "quantity IS NULL")
    } else {
      whereClauses <- c(whereClauses, "quantity = '", quantity,"'")
    }
  }

  if (!missing(unit_concept_id)) {
    if (is.null(unit_concept_id)) {
      whereClauses <- c(whereClauses, "unit_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "unit_concept_id = '", unit_concept_id,"'")
    }
  }

  if (!missing(anatomic_site_concept_id)) {
    if (is.null(anatomic_site_concept_id)) {
      whereClauses <- c(whereClauses, "anatomic_site_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "anatomic_site_concept_id = '", anatomic_site_concept_id,"'")
    }
  }

  if (!missing(disease_status_concept_id)) {
    if (is.null(disease_status_concept_id)) {
      whereClauses <- c(whereClauses, "disease_status_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "disease_status_concept_id = '", disease_status_concept_id,"'")
    }
  }

  if (!missing(specimen_source_id)) {
    if (is.null(specimen_source_id)) {
      whereClauses <- c(whereClauses, "specimen_source_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "specimen_source_id = '", specimen_source_id,"'")
    }
  }

  if (!missing(specimen_source_value)) {
    if (is.null(specimen_source_value)) {
      whereClauses <- c(whereClauses, "specimen_source_value IS NULL")
    } else {
      whereClauses <- c(whereClauses, "specimen_source_value = '", specimen_source_value,"'")
    }
  }

  if (!missing(unit_source_value)) {
    if (is.null(unit_source_value)) {
      whereClauses <- c(whereClauses, "unit_source_value IS NULL")
    } else {
      whereClauses <- c(whereClauses, "unit_source_value = '", unit_source_value,"'")
    }
  }

  if (!missing(anatomic_site_source_value)) {
    if (is.null(anatomic_site_source_value)) {
      whereClauses <- c(whereClauses, "anatomic_site_source_value IS NULL")
    } else {
      whereClauses <- c(whereClauses, "anatomic_site_source_value = '", anatomic_site_source_value,"'")
    }
  }

  if (!missing(disease_status_source_value)) {
    if (is.null(disease_status_source_value)) {
      whereClauses <- c(whereClauses, "disease_status_source_value IS NULL")
    } else {
      whereClauses <- c(whereClauses, "disease_status_source_value = '", disease_status_source_value,"'")
    }
  }

  statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  class(statement) <- "subQuery"
  return(statement)
}

lookup_procedure_cost <- function(fetchField, procedure_cost_id, procedure_occurrence_id, currency_concept_id, paid_copay, paid_coinsurance, paid_toward_deductible, paid_by_payer, paid_by_coordination_benefits, total_out_of_pocket, total_paid, revenue_code_concept_id, payer_plan_period_id, revenue_code_source_value) {
  whereClauses = NULL;
  statement <- paste0("SELECT ", fetchField , " FROM @cdm_schema.procedure_cost WHERE ")
  if (!missing(procedure_cost_id)) {
    if (is.null(procedure_cost_id)) {
      whereClauses <- c(whereClauses, "procedure_cost_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "procedure_cost_id = '", procedure_cost_id,"'")
    }
  }

  if (!missing(procedure_occurrence_id)) {
    if (is.null(procedure_occurrence_id)) {
      whereClauses <- c(whereClauses, "procedure_occurrence_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "procedure_occurrence_id = '", procedure_occurrence_id,"'")
    }
  }

  if (!missing(currency_concept_id)) {
    if (is.null(currency_concept_id)) {
      whereClauses <- c(whereClauses, "currency_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "currency_concept_id = '", currency_concept_id,"'")
    }
  }

  if (!missing(paid_copay)) {
    if (is.null(paid_copay)) {
      whereClauses <- c(whereClauses, "paid_copay IS NULL")
    } else {
      whereClauses <- c(whereClauses, "paid_copay = '", paid_copay,"'")
    }
  }

  if (!missing(paid_coinsurance)) {
    if (is.null(paid_coinsurance)) {
      whereClauses <- c(whereClauses, "paid_coinsurance IS NULL")
    } else {
      whereClauses <- c(whereClauses, "paid_coinsurance = '", paid_coinsurance,"'")
    }
  }

  if (!missing(paid_toward_deductible)) {
    if (is.null(paid_toward_deductible)) {
      whereClauses <- c(whereClauses, "paid_toward_deductible IS NULL")
    } else {
      whereClauses <- c(whereClauses, "paid_toward_deductible = '", paid_toward_deductible,"'")
    }
  }

  if (!missing(paid_by_payer)) {
    if (is.null(paid_by_payer)) {
      whereClauses <- c(whereClauses, "paid_by_payer IS NULL")
    } else {
      whereClauses <- c(whereClauses, "paid_by_payer = '", paid_by_payer,"'")
    }
  }

  if (!missing(paid_by_coordination_benefits)) {
    if (is.null(paid_by_coordination_benefits)) {
      whereClauses <- c(whereClauses, "paid_by_coordination_benefits IS NULL")
    } else {
      whereClauses <- c(whereClauses, "paid_by_coordination_benefits = '", paid_by_coordination_benefits,"'")
    }
  }

  if (!missing(total_out_of_pocket)) {
    if (is.null(total_out_of_pocket)) {
      whereClauses <- c(whereClauses, "total_out_of_pocket IS NULL")
    } else {
      whereClauses <- c(whereClauses, "total_out_of_pocket = '", total_out_of_pocket,"'")
    }
  }

  if (!missing(total_paid)) {
    if (is.null(total_paid)) {
      whereClauses <- c(whereClauses, "total_paid IS NULL")
    } else {
      whereClauses <- c(whereClauses, "total_paid = '", total_paid,"'")
    }
  }

  if (!missing(revenue_code_concept_id)) {
    if (is.null(revenue_code_concept_id)) {
      whereClauses <- c(whereClauses, "revenue_code_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "revenue_code_concept_id = '", revenue_code_concept_id,"'")
    }
  }

  if (!missing(payer_plan_period_id)) {
    if (is.null(payer_plan_period_id)) {
      whereClauses <- c(whereClauses, "payer_plan_period_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "payer_plan_period_id = '", payer_plan_period_id,"'")
    }
  }

  if (!missing(revenue_code_source_value)) {
    if (is.null(revenue_code_source_value)) {
      whereClauses <- c(whereClauses, "revenue_code_source_value IS NULL")
    } else {
      whereClauses <- c(whereClauses, "revenue_code_source_value = '", revenue_code_source_value,"'")
    }
  }

  statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  class(statement) <- "subQuery"
  return(statement)
}

lookup_visit_cost <- function(fetchField, visit_cost_id, visit_occurrence_id, currency_concept_id, paid_copay, paid_coinsurance, paid_toward_deductible, paid_by_payer, paid_by_coordination_benefits, total_out_of_pocket, total_paid, payer_plan_period_id) {
  whereClauses = NULL;
  statement <- paste0("SELECT ", fetchField , " FROM @cdm_schema.visit_cost WHERE ")
  if (!missing(visit_cost_id)) {
    if (is.null(visit_cost_id)) {
      whereClauses <- c(whereClauses, "visit_cost_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "visit_cost_id = '", visit_cost_id,"'")
    }
  }

  if (!missing(visit_occurrence_id)) {
    if (is.null(visit_occurrence_id)) {
      whereClauses <- c(whereClauses, "visit_occurrence_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }

  if (!missing(currency_concept_id)) {
    if (is.null(currency_concept_id)) {
      whereClauses <- c(whereClauses, "currency_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "currency_concept_id = '", currency_concept_id,"'")
    }
  }

  if (!missing(paid_copay)) {
    if (is.null(paid_copay)) {
      whereClauses <- c(whereClauses, "paid_copay IS NULL")
    } else {
      whereClauses <- c(whereClauses, "paid_copay = '", paid_copay,"'")
    }
  }

  if (!missing(paid_coinsurance)) {
    if (is.null(paid_coinsurance)) {
      whereClauses <- c(whereClauses, "paid_coinsurance IS NULL")
    } else {
      whereClauses <- c(whereClauses, "paid_coinsurance = '", paid_coinsurance,"'")
    }
  }

  if (!missing(paid_toward_deductible)) {
    if (is.null(paid_toward_deductible)) {
      whereClauses <- c(whereClauses, "paid_toward_deductible IS NULL")
    } else {
      whereClauses <- c(whereClauses, "paid_toward_deductible = '", paid_toward_deductible,"'")
    }
  }

  if (!missing(paid_by_payer)) {
    if (is.null(paid_by_payer)) {
      whereClauses <- c(whereClauses, "paid_by_payer IS NULL")
    } else {
      whereClauses <- c(whereClauses, "paid_by_payer = '", paid_by_payer,"'")
    }
  }

  if (!missing(paid_by_coordination_benefits)) {
    if (is.null(paid_by_coordination_benefits)) {
      whereClauses <- c(whereClauses, "paid_by_coordination_benefits IS NULL")
    } else {
      whereClauses <- c(whereClauses, "paid_by_coordination_benefits = '", paid_by_coordination_benefits,"'")
    }
  }

  if (!missing(total_out_of_pocket)) {
    if (is.null(total_out_of_pocket)) {
      whereClauses <- c(whereClauses, "total_out_of_pocket IS NULL")
    } else {
      whereClauses <- c(whereClauses, "total_out_of_pocket = '", total_out_of_pocket,"'")
    }
  }

  if (!missing(total_paid)) {
    if (is.null(total_paid)) {
      whereClauses <- c(whereClauses, "total_paid IS NULL")
    } else {
      whereClauses <- c(whereClauses, "total_paid = '", total_paid,"'")
    }
  }

  if (!missing(payer_plan_period_id)) {
    if (is.null(payer_plan_period_id)) {
      whereClauses <- c(whereClauses, "payer_plan_period_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "payer_plan_period_id = '", payer_plan_period_id,"'")
    }
  }

  statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  class(statement) <- "subQuery"
  return(statement)
}

lookup_drug_cost <- function(fetchField, drug_cost_id, drug_exposure_id, currency_concept_id, paid_copay, paid_coinsurance, paid_toward_deductible, paid_by_payer, paid_by_coordination_benefits, total_out_of_pocket, total_paid, ingredient_cost, dispensing_fee, average_wholesale_price, payer_plan_period_id) {
  whereClauses = NULL;
  statement <- paste0("SELECT ", fetchField , " FROM @cdm_schema.drug_cost WHERE ")
  if (!missing(drug_cost_id)) {
    if (is.null(drug_cost_id)) {
      whereClauses <- c(whereClauses, "drug_cost_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "drug_cost_id = '", drug_cost_id,"'")
    }
  }

  if (!missing(drug_exposure_id)) {
    if (is.null(drug_exposure_id)) {
      whereClauses <- c(whereClauses, "drug_exposure_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "drug_exposure_id = '", drug_exposure_id,"'")
    }
  }

  if (!missing(currency_concept_id)) {
    if (is.null(currency_concept_id)) {
      whereClauses <- c(whereClauses, "currency_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "currency_concept_id = '", currency_concept_id,"'")
    }
  }

  if (!missing(paid_copay)) {
    if (is.null(paid_copay)) {
      whereClauses <- c(whereClauses, "paid_copay IS NULL")
    } else {
      whereClauses <- c(whereClauses, "paid_copay = '", paid_copay,"'")
    }
  }

  if (!missing(paid_coinsurance)) {
    if (is.null(paid_coinsurance)) {
      whereClauses <- c(whereClauses, "paid_coinsurance IS NULL")
    } else {
      whereClauses <- c(whereClauses, "paid_coinsurance = '", paid_coinsurance,"'")
    }
  }

  if (!missing(paid_toward_deductible)) {
    if (is.null(paid_toward_deductible)) {
      whereClauses <- c(whereClauses, "paid_toward_deductible IS NULL")
    } else {
      whereClauses <- c(whereClauses, "paid_toward_deductible = '", paid_toward_deductible,"'")
    }
  }

  if (!missing(paid_by_payer)) {
    if (is.null(paid_by_payer)) {
      whereClauses <- c(whereClauses, "paid_by_payer IS NULL")
    } else {
      whereClauses <- c(whereClauses, "paid_by_payer = '", paid_by_payer,"'")
    }
  }

  if (!missing(paid_by_coordination_benefits)) {
    if (is.null(paid_by_coordination_benefits)) {
      whereClauses <- c(whereClauses, "paid_by_coordination_benefits IS NULL")
    } else {
      whereClauses <- c(whereClauses, "paid_by_coordination_benefits = '", paid_by_coordination_benefits,"'")
    }
  }

  if (!missing(total_out_of_pocket)) {
    if (is.null(total_out_of_pocket)) {
      whereClauses <- c(whereClauses, "total_out_of_pocket IS NULL")
    } else {
      whereClauses <- c(whereClauses, "total_out_of_pocket = '", total_out_of_pocket,"'")
    }
  }

  if (!missing(total_paid)) {
    if (is.null(total_paid)) {
      whereClauses <- c(whereClauses, "total_paid IS NULL")
    } else {
      whereClauses <- c(whereClauses, "total_paid = '", total_paid,"'")
    }
  }

  if (!missing(ingredient_cost)) {
    if (is.null(ingredient_cost)) {
      whereClauses <- c(whereClauses, "ingredient_cost IS NULL")
    } else {
      whereClauses <- c(whereClauses, "ingredient_cost = '", ingredient_cost,"'")
    }
  }

  if (!missing(dispensing_fee)) {
    if (is.null(dispensing_fee)) {
      whereClauses <- c(whereClauses, "dispensing_fee IS NULL")
    } else {
      whereClauses <- c(whereClauses, "dispensing_fee = '", dispensing_fee,"'")
    }
  }

  if (!missing(average_wholesale_price)) {
    if (is.null(average_wholesale_price)) {
      whereClauses <- c(whereClauses, "average_wholesale_price IS NULL")
    } else {
      whereClauses <- c(whereClauses, "average_wholesale_price = '", average_wholesale_price,"'")
    }
  }

  if (!missing(payer_plan_period_id)) {
    if (is.null(payer_plan_period_id)) {
      whereClauses <- c(whereClauses, "payer_plan_period_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "payer_plan_period_id = '", payer_plan_period_id,"'")
    }
  }

  statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  class(statement) <- "subQuery"
  return(statement)
}

lookup_device_cost <- function(fetchField, device_cost_id, device_exposure_id, currency_concept_id, paid_copay, paid_coinsurance, paid_toward_deductible, paid_by_payer, paid_by_coordination_benefits, total_out_of_pocket, total_paid, payer_plan_period_id) {
  whereClauses = NULL;
  statement <- paste0("SELECT ", fetchField , " FROM @cdm_schema.device_cost WHERE ")
  if (!missing(device_cost_id)) {
    if (is.null(device_cost_id)) {
      whereClauses <- c(whereClauses, "device_cost_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "device_cost_id = '", device_cost_id,"'")
    }
  }

  if (!missing(device_exposure_id)) {
    if (is.null(device_exposure_id)) {
      whereClauses <- c(whereClauses, "device_exposure_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "device_exposure_id = '", device_exposure_id,"'")
    }
  }

  if (!missing(currency_concept_id)) {
    if (is.null(currency_concept_id)) {
      whereClauses <- c(whereClauses, "currency_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "currency_concept_id = '", currency_concept_id,"'")
    }
  }

  if (!missing(paid_copay)) {
    if (is.null(paid_copay)) {
      whereClauses <- c(whereClauses, "paid_copay IS NULL")
    } else {
      whereClauses <- c(whereClauses, "paid_copay = '", paid_copay,"'")
    }
  }

  if (!missing(paid_coinsurance)) {
    if (is.null(paid_coinsurance)) {
      whereClauses <- c(whereClauses, "paid_coinsurance IS NULL")
    } else {
      whereClauses <- c(whereClauses, "paid_coinsurance = '", paid_coinsurance,"'")
    }
  }

  if (!missing(paid_toward_deductible)) {
    if (is.null(paid_toward_deductible)) {
      whereClauses <- c(whereClauses, "paid_toward_deductible IS NULL")
    } else {
      whereClauses <- c(whereClauses, "paid_toward_deductible = '", paid_toward_deductible,"'")
    }
  }

  if (!missing(paid_by_payer)) {
    if (is.null(paid_by_payer)) {
      whereClauses <- c(whereClauses, "paid_by_payer IS NULL")
    } else {
      whereClauses <- c(whereClauses, "paid_by_payer = '", paid_by_payer,"'")
    }
  }

  if (!missing(paid_by_coordination_benefits)) {
    if (is.null(paid_by_coordination_benefits)) {
      whereClauses <- c(whereClauses, "paid_by_coordination_benefits IS NULL")
    } else {
      whereClauses <- c(whereClauses, "paid_by_coordination_benefits = '", paid_by_coordination_benefits,"'")
    }
  }

  if (!missing(total_out_of_pocket)) {
    if (is.null(total_out_of_pocket)) {
      whereClauses <- c(whereClauses, "total_out_of_pocket IS NULL")
    } else {
      whereClauses <- c(whereClauses, "total_out_of_pocket = '", total_out_of_pocket,"'")
    }
  }

  if (!missing(total_paid)) {
    if (is.null(total_paid)) {
      whereClauses <- c(whereClauses, "total_paid IS NULL")
    } else {
      whereClauses <- c(whereClauses, "total_paid = '", total_paid,"'")
    }
  }

  if (!missing(payer_plan_period_id)) {
    if (is.null(payer_plan_period_id)) {
      whereClauses <- c(whereClauses, "payer_plan_period_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "payer_plan_period_id = '", payer_plan_period_id,"'")
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
      whereClauses <- c(whereClauses, "drug_era_id = '", drug_era_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "person_id = '", person_id,"'")
    }
  }

  if (!missing(drug_concept_id)) {
    if (is.null(drug_concept_id)) {
      whereClauses <- c(whereClauses, "drug_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "drug_concept_id = '", drug_concept_id,"'")
    }
  }

  if (!missing(drug_era_start_date)) {
    if (is.null(drug_era_start_date)) {
      whereClauses <- c(whereClauses, "drug_era_start_date IS NULL")
    } else {
      whereClauses <- c(whereClauses, "drug_era_start_date = '", drug_era_start_date,"'")
    }
  }

  if (!missing(drug_era_end_date)) {
    if (is.null(drug_era_end_date)) {
      whereClauses <- c(whereClauses, "drug_era_end_date IS NULL")
    } else {
      whereClauses <- c(whereClauses, "drug_era_end_date = '", drug_era_end_date,"'")
    }
  }

  if (!missing(drug_exposure_count)) {
    if (is.null(drug_exposure_count)) {
      whereClauses <- c(whereClauses, "drug_exposure_count IS NULL")
    } else {
      whereClauses <- c(whereClauses, "drug_exposure_count = '", drug_exposure_count,"'")
    }
  }

  if (!missing(gap_days)) {
    if (is.null(gap_days)) {
      whereClauses <- c(whereClauses, "gap_days IS NULL")
    } else {
      whereClauses <- c(whereClauses, "gap_days = '", gap_days,"'")
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
      whereClauses <- c(whereClauses, "dose_era_id = '", dose_era_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "person_id = '", person_id,"'")
    }
  }

  if (!missing(drug_concept_id)) {
    if (is.null(drug_concept_id)) {
      whereClauses <- c(whereClauses, "drug_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "drug_concept_id = '", drug_concept_id,"'")
    }
  }

  if (!missing(unit_concept_id)) {
    if (is.null(unit_concept_id)) {
      whereClauses <- c(whereClauses, "unit_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "unit_concept_id = '", unit_concept_id,"'")
    }
  }

  if (!missing(dose_value)) {
    if (is.null(dose_value)) {
      whereClauses <- c(whereClauses, "dose_value IS NULL")
    } else {
      whereClauses <- c(whereClauses, "dose_value = '", dose_value,"'")
    }
  }

  if (!missing(dose_era_start_date)) {
    if (is.null(dose_era_start_date)) {
      whereClauses <- c(whereClauses, "dose_era_start_date IS NULL")
    } else {
      whereClauses <- c(whereClauses, "dose_era_start_date = '", dose_era_start_date,"'")
    }
  }

  if (!missing(dose_era_end_date)) {
    if (is.null(dose_era_end_date)) {
      whereClauses <- c(whereClauses, "dose_era_end_date IS NULL")
    } else {
      whereClauses <- c(whereClauses, "dose_era_end_date = '", dose_era_end_date,"'")
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
      whereClauses <- c(whereClauses, "condition_era_id = '", condition_era_id,"'")
    }
  }

  if (!missing(person_id)) {
    if (is.null(person_id)) {
      whereClauses <- c(whereClauses, "person_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "person_id = '", person_id,"'")
    }
  }

  if (!missing(condition_concept_id)) {
    if (is.null(condition_concept_id)) {
      whereClauses <- c(whereClauses, "condition_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "condition_concept_id = '", condition_concept_id,"'")
    }
  }

  if (!missing(condition_era_start_date)) {
    if (is.null(condition_era_start_date)) {
      whereClauses <- c(whereClauses, "condition_era_start_date IS NULL")
    } else {
      whereClauses <- c(whereClauses, "condition_era_start_date = '", condition_era_start_date,"'")
    }
  }

  if (!missing(condition_era_end_date)) {
    if (is.null(condition_era_end_date)) {
      whereClauses <- c(whereClauses, "condition_era_end_date IS NULL")
    } else {
      whereClauses <- c(whereClauses, "condition_era_end_date = '", condition_era_end_date,"'")
    }
  }

  if (!missing(condition_occurrence_count)) {
    if (is.null(condition_occurrence_count)) {
      whereClauses <- c(whereClauses, "condition_occurrence_count IS NULL")
    } else {
      whereClauses <- c(whereClauses, "condition_occurrence_count = '", condition_occurrence_count,"'")
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
      whereClauses <- c(whereClauses, "cdm_source_name = '", cdm_source_name,"'")
    }
  }

  if (!missing(cdm_source_abbreviation)) {
    if (is.null(cdm_source_abbreviation)) {
      whereClauses <- c(whereClauses, "cdm_source_abbreviation IS NULL")
    } else {
      whereClauses <- c(whereClauses, "cdm_source_abbreviation = '", cdm_source_abbreviation,"'")
    }
  }

  if (!missing(cdm_holder)) {
    if (is.null(cdm_holder)) {
      whereClauses <- c(whereClauses, "cdm_holder IS NULL")
    } else {
      whereClauses <- c(whereClauses, "cdm_holder = '", cdm_holder,"'")
    }
  }

  if (!missing(source_description)) {
    if (is.null(source_description)) {
      whereClauses <- c(whereClauses, "source_description IS NULL")
    } else {
      whereClauses <- c(whereClauses, "source_description = '", source_description,"'")
    }
  }

  if (!missing(source_documentation_reference)) {
    if (is.null(source_documentation_reference)) {
      whereClauses <- c(whereClauses, "source_documentation_reference IS NULL")
    } else {
      whereClauses <- c(whereClauses, "source_documentation_reference = '", source_documentation_reference,"'")
    }
  }

  if (!missing(cdm_etl_reference)) {
    if (is.null(cdm_etl_reference)) {
      whereClauses <- c(whereClauses, "cdm_etl_reference IS NULL")
    } else {
      whereClauses <- c(whereClauses, "cdm_etl_reference = '", cdm_etl_reference,"'")
    }
  }

  if (!missing(source_release_date)) {
    if (is.null(source_release_date)) {
      whereClauses <- c(whereClauses, "source_release_date IS NULL")
    } else {
      whereClauses <- c(whereClauses, "source_release_date = '", source_release_date,"'")
    }
  }

  if (!missing(cdm_release_date)) {
    if (is.null(cdm_release_date)) {
      whereClauses <- c(whereClauses, "cdm_release_date IS NULL")
    } else {
      whereClauses <- c(whereClauses, "cdm_release_date = '", cdm_release_date,"'")
    }
  }

  if (!missing(cdm_version)) {
    if (is.null(cdm_version)) {
      whereClauses <- c(whereClauses, "cdm_version IS NULL")
    } else {
      whereClauses <- c(whereClauses, "cdm_version = '", cdm_version,"'")
    }
  }

  if (!missing(vocabulary_version)) {
    if (is.null(vocabulary_version)) {
      whereClauses <- c(whereClauses, "vocabulary_version IS NULL")
    } else {
      whereClauses <- c(whereClauses, "vocabulary_version = '", vocabulary_version,"'")
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
      whereClauses <- c(whereClauses, "cohort_definition_id = '", cohort_definition_id,"'")
    }
  }

  if (!missing(subject_id)) {
    if (is.null(subject_id)) {
      whereClauses <- c(whereClauses, "subject_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "subject_id = '", subject_id,"'")
    }
  }

  if (!missing(cohort_start_date)) {
    if (is.null(cohort_start_date)) {
      whereClauses <- c(whereClauses, "cohort_start_date IS NULL")
    } else {
      whereClauses <- c(whereClauses, "cohort_start_date = '", cohort_start_date,"'")
    }
  }

  if (!missing(cohort_end_date)) {
    if (is.null(cohort_end_date)) {
      whereClauses <- c(whereClauses, "cohort_end_date IS NULL")
    } else {
      whereClauses <- c(whereClauses, "cohort_end_date = '", cohort_end_date,"'")
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
      whereClauses <- c(whereClauses, "cohort_definition_id = '", cohort_definition_id,"'")
    }
  }

  if (!missing(cohort_definition_name)) {
    if (is.null(cohort_definition_name)) {
      whereClauses <- c(whereClauses, "cohort_definition_name IS NULL")
    } else {
      whereClauses <- c(whereClauses, "cohort_definition_name = '", cohort_definition_name,"'")
    }
  }

  if (!missing(cohort_definition_description)) {
    if (is.null(cohort_definition_description)) {
      whereClauses <- c(whereClauses, "cohort_definition_description IS NULL")
    } else {
      whereClauses <- c(whereClauses, "cohort_definition_description = '", cohort_definition_description,"'")
    }
  }

  if (!missing(definition_type_concept_id)) {
    if (is.null(definition_type_concept_id)) {
      whereClauses <- c(whereClauses, "definition_type_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "definition_type_concept_id = '", definition_type_concept_id,"'")
    }
  }

  if (!missing(cohort_definition_syntax)) {
    if (is.null(cohort_definition_syntax)) {
      whereClauses <- c(whereClauses, "cohort_definition_syntax IS NULL")
    } else {
      whereClauses <- c(whereClauses, "cohort_definition_syntax = '", cohort_definition_syntax,"'")
    }
  }

  if (!missing(subject_concept_id)) {
    if (is.null(subject_concept_id)) {
      whereClauses <- c(whereClauses, "subject_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "subject_concept_id = '", subject_concept_id,"'")
    }
  }

  if (!missing(cohort_instantiation_date)) {
    if (is.null(cohort_instantiation_date)) {
      whereClauses <- c(whereClauses, "cohort_instantiation_date IS NULL")
    } else {
      whereClauses <- c(whereClauses, "cohort_instantiation_date = '", cohort_instantiation_date,"'")
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
      whereClauses <- c(whereClauses, "cohort_definition_id = '", cohort_definition_id,"'")
    }
  }

  if (!missing(cohort_start_date)) {
    if (is.null(cohort_start_date)) {
      whereClauses <- c(whereClauses, "cohort_start_date IS NULL")
    } else {
      whereClauses <- c(whereClauses, "cohort_start_date = '", cohort_start_date,"'")
    }
  }

  if (!missing(cohort_end_date)) {
    if (is.null(cohort_end_date)) {
      whereClauses <- c(whereClauses, "cohort_end_date IS NULL")
    } else {
      whereClauses <- c(whereClauses, "cohort_end_date = '", cohort_end_date,"'")
    }
  }

  if (!missing(subject_id)) {
    if (is.null(subject_id)) {
      whereClauses <- c(whereClauses, "subject_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "subject_id = '", subject_id,"'")
    }
  }

  if (!missing(attribute_definition_id)) {
    if (is.null(attribute_definition_id)) {
      whereClauses <- c(whereClauses, "attribute_definition_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "attribute_definition_id = '", attribute_definition_id,"'")
    }
  }

  if (!missing(value_as_number)) {
    if (is.null(value_as_number)) {
      whereClauses <- c(whereClauses, "value_as_number IS NULL")
    } else {
      whereClauses <- c(whereClauses, "value_as_number = '", value_as_number,"'")
    }
  }

  if (!missing(value_as_concept_id)) {
    if (is.null(value_as_concept_id)) {
      whereClauses <- c(whereClauses, "value_as_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "value_as_concept_id = '", value_as_concept_id,"'")
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
      whereClauses <- c(whereClauses, "attribute_definition_id = '", attribute_definition_id,"'")
    }
  }

  if (!missing(attribute_name)) {
    if (is.null(attribute_name)) {
      whereClauses <- c(whereClauses, "attribute_name IS NULL")
    } else {
      whereClauses <- c(whereClauses, "attribute_name = '", attribute_name,"'")
    }
  }

  if (!missing(attribute_description)) {
    if (is.null(attribute_description)) {
      whereClauses <- c(whereClauses, "attribute_description IS NULL")
    } else {
      whereClauses <- c(whereClauses, "attribute_description = '", attribute_description,"'")
    }
  }

  if (!missing(attribute_type_concept_id)) {
    if (is.null(attribute_type_concept_id)) {
      whereClauses <- c(whereClauses, "attribute_type_concept_id IS NULL")
    } else {
      whereClauses <- c(whereClauses, "attribute_type_concept_id = '", attribute_type_concept_id,"'")
    }
  }

  if (!missing(attribute_syntax)) {
    if (is.null(attribute_syntax)) {
      whereClauses <- c(whereClauses, "attribute_syntax IS NULL")
    } else {
      whereClauses <- c(whereClauses, "attribute_syntax = '", attribute_syntax,"'")
    }
  }

  statement <- paste0(statement, paste0(whereClauses, collapse=" AND "));
  class(statement) <- "subQuery"
  return(statement)
}

