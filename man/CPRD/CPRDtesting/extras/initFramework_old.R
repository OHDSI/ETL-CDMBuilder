frameworkContext <- new.env(parent = emptyenv());
initFramework <- function() {
  frameworkContext$groupIndex <- 0;
  insertSql <- c()
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema._version;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.additional;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.batchnumbers;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.bnfcodes;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.clinical;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.commondosages;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.consultation;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.daysupply_decodes;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.daysupply_modes;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.entity;")
  #insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.hes_acp;")
  #insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.hes_ccare;")
  #insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.hes_diagnosis_epi;")
  #insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.hes_diagnosis_hosp;")
  #insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.hes_episodes;")
  #insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.hes_fielddefinitions;")
  #insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.hes_fieldmappings;")
  #===========   Delete these tables to use the old ones
  #insertSql <- c(insertSql, "DROP TABLE @source_schema.hes_fielddefinitions;")
  #insertSql <- c(insertSql, "DROP TABLE @source_schema.hes_fieldmappings;")
  #===========
  #insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.hes_hospital;")
  #insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.hes_hrg;")
  #insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.hes_linkage_coverage;")
  #insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.hes_linkage_eligibility;")
  #insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.hes_linked_practices;")
  #insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.hes_maternity;")
  #insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.hes_patient;")
  #insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.hes_primary_diag_hosp;")
  #insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.hes_procedures_epi;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.immunisation;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.lookup;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.lookuptype;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.medical;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.packtype;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.patient;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.practice;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.product;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.referral;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.scoringmethod;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.staff;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.test;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.therapy;")
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
  defaults$enttype <- "1"
  defaults$data1_value <- "1.000"
  defaults$data2_value <- "0.000"
  frameworkContext$defaultValues$additional = defaults;

  defaults <- new.env(parent = emptyenv())
  frameworkContext$defaultValues$batchnumbers = defaults;

  defaults <- new.env(parent = emptyenv())
  frameworkContext$defaultValues$bnfcodes = defaults;

  defaults <- new.env(parent = emptyenv())
  #defaults$sysdate <- "2013-07-26"
  defaults$constype <- "3"
  #defaults$medcode <- "1"
  defaults$staffid <- "0"
  defaults$textid <- "0"
  defaults$episode <- "4"
  defaults$enttype <- "2"
  defaults$adid <- "0"
  frameworkContext$defaultValues$clinical = defaults;

  defaults <- new.env(parent = emptyenv())
  defaults$text <- "~~~~~"
  defaults$daily_dose <- "0.0000000"
  defaults$dose_number <- "1.0000000"
  defaults$dose_frequency <- "1.000000"
  defaults$dose_interval <- "1.0000000"
  defaults$choice_of_dose <- "0"
  defaults$dose_max_average <- "0"
  defaults$change_dose <- "0"
  defaults$dose_duration <- "0.0"
  frameworkContext$defaultValues$commondosages = defaults;

  defaults <- new.env(parent = emptyenv())
  defaults$sysdate <- "2007-01-15"
  defaults$constype <- "9"
  defaults$staffid <- "0"
  defaults$duration <- "0"
  frameworkContext$defaultValues$consultation = defaults;

  defaults <- new.env(parent = emptyenv())
  defaults$prodcode <- "2952"
  defaults$ndd <- "0.000"
  defaults$qty <- "1.00"
  defaults$numpacks <- "0"
  defaults$numdays <- "28"
  frameworkContext$defaultValues$daysupply_decodes = defaults;

  defaults <- new.env(parent = emptyenv())
  defaults$numdays <- "28"
  frameworkContext$defaultValues$daysupply_modes = defaults;

  defaults <- new.env(parent = emptyenv())
  defaults$filetype <- "Test"
  defaults$category <- "Biochemistry (Routine)"
  defaults$data_fields <- "4"
  defaults$data1 <- "Qualifier"
  defaults$data1lkup <- "TQU"
  defaults$data2 <- "Normal range from"
  defaults$data3 <- "Normal range to"
  defaults$data4 <- "Normal range basis"
  frameworkContext$defaultValues$entity = defaults;

  #defaults <- new.env(parent = emptyenv())
  #defaults$patid <- "13436042"
  #defaults$spno <- "2738888"
  #defaults$epikey <- "39200477"
  #defaults$epistart <- "2001-02-05"
  #defaults$epiend <- "2000-06-06"
  #defaults$eorder <- "1"
  #defaults$epidur <- "1"
  #defaults$numacp <- "1"
  #defaults$acpn <- "1"
  #defaults$intdays <- "0"
  #defaults$depdays <- "0"
  #defaults$acpout <- "99"
  #defaults$acpplan <- " "
  #defaults$orgsup <- "0"
  #defaults$acpdqind <- " "
  #frameworkContext$defaultValues$hes_acp = defaults;

  #defaults <- new.env(parent = emptyenv())
  #defaults$patid <- "16030344"
  #defaults$spno <- "15408254"
  #defaults$epikey <- "133935676"
  #defaults$admidate <- "2012-04-23"
  #defaults$epistart <- "2012-03-15"
  #defaults$epiend <- "2013-12-23"
  #defaults$eorder <- "1"
  #defaults$ccstartdate <- "2010-08-17"
  #defaults$ccdisdate <- "2010-08-19"
  #defaults$ccdistime <- "17:00:00"
  #defaults$ccadmitype <- "1"
  #defaults$ccadmisorc <- "1"
  #defaults$ccsorcloc <- "1"
  #defaults$ccdisstat <- "1"
  #defaults$ccdisdest <- "1"
  #defaults$ccdisloc <- "1"
  #defaults$cclev2days <- "2"
  #defaults$cclev3days <- "0"
  #defaults$bcardsupdays <- "2"
  #defaults$acardsupdays <- "0"
  #defaults$bressupdays <- "0"
  #defaults$aressupdays <- "0"
  #defaults$gisupdays <- "0"
  #defaults$liversupdays <- "0"
  #defaults$neurosupdays <- "0"
  #defaults$rensupdays <- "0"
  #defaults$dermsupdays <- "0"
  #defaults$orgsupmax <- "1"
  #defaults$ccunitfun <- "1"
  #defaults$unitbedconfig <- "5"
  #defaults$bestmatch <- "1"
  #defaults$ccapcrel <- "2"
  #frameworkContext$defaultValues$hes_ccare = defaults;

  #defaults <- new.env(parent = emptyenv())
  #defaults$patid <- "25763246"
  #defaults$epistart <- "2014-03-17"
  #defaults$epiend <- "2013-11-27"
  #defaults$icd <- "I10"
  #defaults$d_order <- "1"
  #frameworkContext$defaultValues$hes_diagnosis_epi = defaults;

  #defaults <- new.env(parent = emptyenv())
  #defaults$patid <- "25763246"
  #defaults$admidate <- "2012-06-18"
  #defaults$icd <- "I10"
  #frameworkContext$defaultValues$hes_diagnosis_hosp = defaults;

  #defaults <- new.env(parent = emptyenv())
  #defaults$patid <- "1111"
  #defaults$admidate <- "2009-01-05"
  #defaults$epistart <- "2009-05-11"
  #defaults$epiend <- "2013-06-18"
  #defaults$eorder <- "1"
  #defaults$epidur <- "1"
  #defaults$epitype <- "1"
  #defaults$admimeth <- "21"
  #defaults$admisorc <- "19"
  #defaults$disdest <- "19"
  #defaults$dismeth <- "1"
  #defaults$mainspef <- "300"
  #defaults$tretspef <- "300"
  #defaults$pconsult <- "1E0FFF1244C7AC47"
  #defaults$intmanig <- "8"
  #defaults$classpat <- "1"
  #frameworkContext$defaultValues$hes_episodes = defaults;

  #defaults <- new.env(parent = emptyenv())
  #defaults$class <- "Geographical"
  #defaults$lengthformat <- "1n"
  #defaults$availability <- "All years"
  #defaults$iscategorical <- "false"
  #frameworkContext$defaultValues$hes_fielddefinitions = defaults;

  #defaults <- new.env(parent = emptyenv())
  #defaults$fieldid <- "271"
  #defaults$value <- "1"
  #defaults$description <- "Not known"
  #frameworkContext$defaultValues$hes_fieldmappings = defaults;

  #defaults <- new.env(parent = emptyenv())
  #defaults$patid <- "13190042"
  ##defaults$admidate <- "2011-02-02"
  #defaults$admimeth <- "21"
  #defaults$admisorc <- "19"
  #defaults$disdest <- "19"
  #defaults$dismeth <- "1"
  #defaults$duration <- "1"
  #frameworkContext$defaultValues$hes_hospital = defaults;

  #defaults <- new.env(parent = emptyenv())
  #defaults$patid <- "16165672"
  #defaults$domproc <- "     "
  #defaults$hrglate35 <- "    "
  #defaults$hrgnhs <- "    "
  #defaults$hrgnhsvn <- "   "
  #defaults$hrglate <- "    "
  #defaults$hes_yr <- "2011"
  #frameworkContext$defaultValues$hes_hrg = defaults;

  #defaults <- new.env(parent = emptyenv())
  #frameworkContext$defaultValues$hes_linkage_coverage = defaults;

  #defaults <- new.env(parent = emptyenv())
  #defaults$pracid <- "644"
  #defaults$linkdate <- "2014-04-01"
  #defaults$hes_e <- "1"
  #defaults$death_e <- "1"
  #defaults$cr_e <- "1"
  #defaults$minap_e <- "1"
  #defaults$lsoa_e <- "1"
  #frameworkContext$defaultValues$hes_linkage_eligibility = defaults;

  #defaults <- new.env(parent = emptyenv())
  #frameworkContext$defaultValues$hes_linked_practices = defaults;

  #defaults <- new.env(parent = emptyenv())
  #defaults$patid <- "20331035"
  #defaults$epikey <- "53643028"
  #defaults$epistart <- "2000-11-14"
  #defaults$epiend <- "2001-07-10"
  #defaults$eorder <- "1"
  #defaults$epidur <- "1"
  #defaults$numbaby <- "9"
  #defaults$matordr <- "1"
  #defaults$neocare <- "8"
  #defaults$wellbaby <- "N"
  #defaults$birordr <- " "
  #defaults$sexbaby <- " "
  #defaults$delmeth <- " "
  #defaults$delonset <- "9"
  #defaults$delinten <- "9"
  #defaults$delchang <- "9"
  #defaults$delprean <- "9"
  #defaults$delposan <- "9"
  #defaults$numpreg <- "99"
  #defaults$matage <- "0"
  #frameworkContext$defaultValues$hes_maternity = defaults;

  #defaults <- new.env(parent = emptyenv())
  #defaults$pracid <- "670"
  #defaults$ethnos <- "White"
  #defaults$n_patid_hes <- "1"
  #defaults$match_rank <- "1"
  #frameworkContext$defaultValues$hes_patient = defaults;

  #defaults <- new.env(parent = emptyenv())
  #defaults$patid <- "15869615"
  #defaults$admidate <- "2011-11-21"
  #defaults$icd <- "N18.0"
  #frameworkContext$defaultValues$hes_primary_diag_hosp = defaults;

  #defaults <- new.env(parent = emptyenv())
  #defaults$patid <- "29928309"
  #defaults$admidate <- "2014-03-11"
  #defaults$epistart <- "2012-08-02"
  #defaults$epiend <- "2014-03-11"
  #defaults$opcs <- "Z942"
  #defaults$p_order <- "1"
  #frameworkContext$defaultValues$hes_procedures_epi = defaults;

  defaults <- new.env(parent = emptyenv())
  defaults$sysdate <- "2014-07-09"
  defaults$constype <- "4"
  defaults$medcode <- "6"
  defaults$staffid <- "0"
  defaults$textid <- "0"
  defaults$immstype <- "1"
  defaults$stage <- "2"
  defaults$status <- "1"
  defaults$compound <- "0"
  defaults$source <- "1"
  defaults$reason <- "3"
  defaults$method <- "1"
  defaults$batch <- "0"
  frameworkContext$defaultValues$immunisation = defaults;

  defaults <- new.env(parent = emptyenv())
  defaults$lookup_type_id <- "81"
  defaults$code <- "1"
  defaults$text <- "Data Not Entered"
  frameworkContext$defaultValues$lookup = defaults;

  defaults <- new.env(parent = emptyenv())
  frameworkContext$defaultValues$lookuptype = defaults;

  defaults <- new.env(parent = emptyenv())
  frameworkContext$defaultValues$medical = defaults;

  defaults <- new.env(parent = emptyenv())
  defaults$packtype_desc <- "PACKTYPE DATA REMOVED"
  frameworkContext$defaultValues$packtype = defaults;

  defaults <- new.env(parent = emptyenv())
  defaults$vmid <- "0"
  defaults$gender <- "2"
  defaults$yob <- "170"
  defaults$mob <- "0"
  #defaults$marital <- "6"
  #defaults$famnum <- "6184"
  defaults$chsreg <- "2"
  defaults$prescr <- "0"
  defaults$capsup <- "0"
  defaults$ses <- "0"
  #defaults$frd <- "1948-07-05"
  defaults$crd <- "1948-07-05"
  defaults$regstat <- "0"
  defaults$reggap <- "0"
  defaults$internal <- "0"
  defaults$toreason <- "0"
  defaults$accept <- "1"
  #defaults$pracid <- "691"
  #defaults$birth_date <- "1970-01-01"
  #defaults$start_date <- "2015-01-14"
  #defaults$end_date <- "2016-12-19"
  frameworkContext$defaultValues$patient = defaults;

  defaults <- new.env(parent = emptyenv())
  defaults$region <- "9"
  defaults$lcd <- "2016-12-19"
  frameworkContext$defaultValues$practice = defaults;

  defaults <- new.env(parent = emptyenv())
  defaults$bnf <- "00000000"
  defaults$bnf_with_dots <- "00.00.00.00"
  defaults$bnfchapter <- "Unknown"
  frameworkContext$defaultValues$product = defaults;

  defaults <- new.env(parent = emptyenv())
  defaults$patid <- "1280428"
  defaults$eventdate <- "1995-06-19"
  defaults$sysdate <- "2002-08-02"
  defaults$constype <- "4"
  defaults$medcode <- "91"
  defaults$staffid <- "0"
  defaults$textid <- "0"
  defaults$source <- "1"
  defaults$nhsspec <- "0"
  defaults$fhsaspec <- "0"
  defaults$inpatient <- "3"
  defaults$attendance <- "0"
  defaults$urgency <- "0"
  frameworkContext$defaultValues$referral = defaults;

  defaults <- new.env(parent = emptyenv())
  defaults$scoring_method <- "SCORE METHOD REMOVED"
  frameworkContext$defaultValues$scoringmethod = defaults;

  defaults <- new.env(parent = emptyenv())
  defaults$gender <- "0"
  defaults$role <- "33"
  frameworkContext$defaultValues$staff = defaults;

  defaults <- new.env(parent = emptyenv())
  defaults$eventdate <- "2011-12-06"
  defaults$sysdate <- "2013-07-26"
  defaults$constype <- "2"
  defaults$medcode <- "5"
  defaults$staffid <- "0"
  defaults$textid <- "0"
  defaults$enttype <- "165"
  defaults$data1 <- "3"
  defaults$data3 <- "96.000"
  defaults$data4 <- "0.000"
  defaults$data7 <- "0"
  frameworkContext$defaultValues$test = defaults;

  defaults <- new.env(parent = emptyenv())
  defaults$patid <- "1481442"
  defaults$eventdate <- "2009-12-14"
  defaults$sysdate <- "2014-02-09"
  defaults$prodcode <- "3"
  defaults$staffid <- "0"
  defaults$textid <- "1"
  defaults$bnfcode <- "55"
  defaults$qty <- "28.00"
  defaults$ndd <- "1.000"
  defaults$numdays <- "0"
  defaults$numpacks <- "0.00"
  defaults$packtype <- "1"
  defaults$issueseq <- "0"
  frameworkContext$defaultValues$therapy = defaults;
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

set_defaults_additional <- function(patid, enttype, adid, data1_value, data1_date, data2_value, data2_date, data3_value, data3_date, data4_value, data4_date, data5_value, data5_date, data6_value, data6_date, data7_value, data7_date) {
  defaults <- frameworkContext$defaultValues$additional;
  if (!missing(patid)) {
    defaults$patid <- patid
  }
  if (!missing(enttype)) {
    defaults$enttype <- enttype
  }
  if (!missing(adid)) {
    defaults$adid <- adid
  }
  if (!missing(data1_value)) {
    defaults$data1_value <- data1_value
  }
  if (!missing(data1_date)) {
    defaults$data1_date <- data1_date
  }
  if (!missing(data2_value)) {
    defaults$data2_value <- data2_value
  }
  if (!missing(data2_date)) {
    defaults$data2_date <- data2_date
  }
  if (!missing(data3_value)) {
    defaults$data3_value <- data3_value
  }
  if (!missing(data3_date)) {
    defaults$data3_date <- data3_date
  }
  if (!missing(data4_value)) {
    defaults$data4_value <- data4_value
  }
  if (!missing(data4_date)) {
    defaults$data4_date <- data4_date
  }
  if (!missing(data5_value)) {
    defaults$data5_value <- data5_value
  }
  if (!missing(data5_date)) {
    defaults$data5_date <- data5_date
  }
  if (!missing(data6_value)) {
    defaults$data6_value <- data6_value
  }
  if (!missing(data6_date)) {
    defaults$data6_date <- data6_date
  }
  if (!missing(data7_value)) {
    defaults$data7_value <- data7_value
  }
  if (!missing(data7_date)) {
    defaults$data7_date <- data7_date
  }
  invisible(defaults)
}

set_defaults_batchnumbers <- function(batch, batch_number) {
  defaults <- frameworkContext$defaultValues$batchnumbers;
  if (!missing(batch)) {
    defaults$batch <- batch
  }
  if (!missing(batch_number)) {
    defaults$batch_number <- batch_number
  }
  invisible(defaults)
}

set_defaults_bnfcodes <- function(bnfcode, bnf, bnf_with_dots, description) {
  defaults <- frameworkContext$defaultValues$bnfcodes;
  if (!missing(bnfcode)) {
    defaults$bnfcode <- bnfcode
  }
  if (!missing(bnf)) {
    defaults$bnf <- bnf
  }
  if (!missing(bnf_with_dots)) {
    defaults$bnf_with_dots <- bnf_with_dots
  }
  if (!missing(description)) {
    defaults$description <- description
  }
  invisible(defaults)
}

set_defaults_clinical <- function(patid, eventdate, sysdate, constype, consid, medcode, staffid, textid, episode, enttype, adid) {
  defaults <- frameworkContext$defaultValues$clinical;
  if (!missing(patid)) {
    defaults$patid <- patid
  }
  if (!missing(eventdate)) {
    defaults$eventdate <- eventdate
  }
  if (!missing(sysdate)) {
    defaults$sysdate <- sysdate
  }
  if (!missing(constype)) {
    defaults$constype <- constype
  }
  if (!missing(consid)) {
    defaults$consid <- consid
  }
  if (!missing(medcode)) {
    defaults$medcode <- medcode
  }
  if (!missing(staffid)) {
    defaults$staffid <- staffid
  }
  if (!missing(textid)) {
    defaults$textid <- textid
  }
  if (!missing(episode)) {
    defaults$episode <- episode
  }
  if (!missing(enttype)) {
    defaults$enttype <- enttype
  }
  if (!missing(adid)) {
    defaults$adid <- adid
  }
  invisible(defaults)
}

set_defaults_commondosages <- function(textid, text, daily_dose, dose_number, dose_unit, dose_frequency, dose_interval, choice_of_dose, dose_max_average, change_dose, dose_duration) {
  defaults <- frameworkContext$defaultValues$commondosages;
  if (!missing(textid)) {
    defaults$textid <- textid
  }
  if (!missing(text)) {
    defaults$text <- text
  }
  if (!missing(daily_dose)) {
    defaults$daily_dose <- daily_dose
  }
  if (!missing(dose_number)) {
    defaults$dose_number <- dose_number
  }
  if (!missing(dose_unit)) {
    defaults$dose_unit <- dose_unit
  }
  if (!missing(dose_frequency)) {
    defaults$dose_frequency <- dose_frequency
  }
  if (!missing(dose_interval)) {
    defaults$dose_interval <- dose_interval
  }
  if (!missing(choice_of_dose)) {
    defaults$choice_of_dose <- choice_of_dose
  }
  if (!missing(dose_max_average)) {
    defaults$dose_max_average <- dose_max_average
  }
  if (!missing(change_dose)) {
    defaults$change_dose <- change_dose
  }
  if (!missing(dose_duration)) {
    defaults$dose_duration <- dose_duration
  }
  invisible(defaults)
}

set_defaults_consultation <- function(patid, eventdate, sysdate, constype, consid, staffid, duration) {
  defaults <- frameworkContext$defaultValues$consultation;
  if (!missing(patid)) {
    defaults$patid <- patid
  }
  if (!missing(eventdate)) {
    defaults$eventdate <- eventdate
  }
  if (!missing(sysdate)) {
    defaults$sysdate <- sysdate
  }
  if (!missing(constype)) {
    defaults$constype <- constype
  }
  if (!missing(consid)) {
    defaults$consid <- consid
  }
  if (!missing(staffid)) {
    defaults$staffid <- staffid
  }
  if (!missing(duration)) {
    defaults$duration <- duration
  }
  invisible(defaults)
}

set_defaults_daysupply_decodes <- function(prodcode, ndd, qty, numpacks, numdays) {
  defaults <- frameworkContext$defaultValues$daysupply_decodes;
  if (!missing(prodcode)) {
    defaults$prodcode <- prodcode
  }
  if (!missing(ndd)) {
    defaults$ndd <- ndd
  }
  if (!missing(qty)) {
    defaults$qty <- qty
  }
  if (!missing(numpacks)) {
    defaults$numpacks <- numpacks
  }
  if (!missing(numdays)) {
    defaults$numdays <- numdays
  }
  invisible(defaults)
}

set_defaults_daysupply_modes <- function(prodcode, numdays) {
  defaults <- frameworkContext$defaultValues$daysupply_modes;
  if (!missing(prodcode)) {
    defaults$prodcode <- prodcode
  }
  if (!missing(numdays)) {
    defaults$numdays <- numdays
  }
  invisible(defaults)
}

set_defaults_entity <- function(code, description, filetype, category, data_fields, data1, data1lkup, data2, data2lkup, data3, data3lkup, data4, data4lkup, data5, data5lkup, data6, data6lkup, data7, data7lkup, data8, data8lkup) {
  defaults <- frameworkContext$defaultValues$entity;
  if (!missing(code)) {
    defaults$code <- code
  }
  if (!missing(description)) {
    defaults$description <- description
  }
  if (!missing(filetype)) {
    defaults$filetype <- filetype
  }
  if (!missing(category)) {
    defaults$category <- category
  }
  if (!missing(data_fields)) {
    defaults$data_fields <- data_fields
  }
  if (!missing(data1)) {
    defaults$data1 <- data1
  }
  if (!missing(data1lkup)) {
    defaults$data1lkup <- data1lkup
  }
  if (!missing(data2)) {
    defaults$data2 <- data2
  }
  if (!missing(data2lkup)) {
    defaults$data2lkup <- data2lkup
  }
  if (!missing(data3)) {
    defaults$data3 <- data3
  }
  if (!missing(data3lkup)) {
    defaults$data3lkup <- data3lkup
  }
  if (!missing(data4)) {
    defaults$data4 <- data4
  }
  if (!missing(data4lkup)) {
    defaults$data4lkup <- data4lkup
  }
  if (!missing(data5)) {
    defaults$data5 <- data5
  }
  if (!missing(data5lkup)) {
    defaults$data5lkup <- data5lkup
  }
  if (!missing(data6)) {
    defaults$data6 <- data6
  }
  if (!missing(data6lkup)) {
    defaults$data6lkup <- data6lkup
  }
  if (!missing(data7)) {
    defaults$data7 <- data7
  }
  if (!missing(data7lkup)) {
    defaults$data7lkup <- data7lkup
  }
  if (!missing(data8)) {
    defaults$data8 <- data8
  }
  if (!missing(data8lkup)) {
    defaults$data8lkup <- data8lkup
  }
  invisible(defaults)
}

#set_defaults_hes_acp <- function(patid, spno, epikey, epistart, epiend, eorder, epidur, numacp, acpn, acpstar, acpend, acpdur, intdays, depdays, acploc, acpsour, acpdisp, acpout, acpplan, acpspef, orgsup, acpdqind) {
#  defaults <- frameworkContext$defaultValues$hes_acp;
#  if (!missing(patid)) {
#    defaults$patid <- patid
#  }
#  if (!missing(spno)) {
#    defaults$spno <- spno
#  }
#  if (!missing(epikey)) {
#    defaults$epikey <- epikey
#  }
#  if (!missing(epistart)) {
#    defaults$epistart <- epistart
#  }
#  if (!missing(epiend)) {
#    defaults$epiend <- epiend
#  }
#  if (!missing(eorder)) {
#    defaults$eorder <- eorder
#  }
#  if (!missing(epidur)) {
#    defaults$epidur <- epidur
#  }
#  if (!missing(numacp)) {
#    defaults$numacp <- numacp
#  }
#  if (!missing(acpn)) {
#    defaults$acpn <- acpn
#  }
#  if (!missing(acpstar)) {
#    defaults$acpstar <- acpstar
#  }
#  if (!missing(acpend)) {
#    defaults$acpend <- acpend
#  }
#  if (!missing(acpdur)) {
#    defaults$acpdur <- acpdur
#  }
#  if (!missing(intdays)) {
#    defaults$intdays <- intdays
#  }
#  if (!missing(depdays)) {
#    defaults$depdays <- depdays
#  }
#  if (!missing(acploc)) {
#    defaults$acploc <- acploc
#  }
#  if (!missing(acpsour)) {
#    defaults$acpsour <- acpsour
#  }
#  if (!missing(acpdisp)) {
#    defaults$acpdisp <- acpdisp
#  }
#  if (!missing(acpout)) {
#    defaults$acpout <- acpout
#  }
#  if (!missing(acpplan)) {
#    defaults$acpplan <- acpplan
#  }
#  if (!missing(acpspef)) {
#    defaults$acpspef <- acpspef
#  }
#  if (!missing(orgsup)) {
#    defaults$orgsup <- orgsup
#  }
#  if (!missing(acpdqind)) {
#    defaults$acpdqind <- acpdqind
#  }
#  invisible(defaults)
#}

#set_defaults_hes_ccare <- function(patid, spno, epikey, admidate, discharged, epistart, epiend, eorder, ccstartdate, ccstarttime, ccdisrdydate, ccdisrdytime, ccdisdate, ccdistime, ccadmitype, ccadmisorc, ccsorcloc, ccdisstat, ccdisdest, ccdisloc, cclev2days, cclev3days, bcardsupdays, acardsupdays, bressupdays, aressupdays, gisupdays, liversupdays, neurosupdays, rensupdays, dermsupdays, orgsupmax, ccunitfun, unitbedconfig, bestmatch, ccapcrel) {
#  defaults <- frameworkContext$defaultValues$hes_ccare;
#  if (!missing(patid)) {
#    defaults$patid <- patid
#  }
#  if (!missing(spno)) {
#    defaults$spno <- spno
#  }
#  if (!missing(epikey)) {
#    defaults$epikey <- epikey
#  }
#  if (!missing(admidate)) {
#    defaults$admidate <- admidate
#  }
#  if (!missing(discharged)) {
#    defaults$discharged <- discharged
#  }
#  if (!missing(epistart)) {
#    defaults$epistart <- epistart
#  }
#  if (!missing(epiend)) {
#    defaults$epiend <- epiend
#  }
#  if (!missing(eorder)) {
#    defaults$eorder <- eorder
#  }
#  if (!missing(ccstartdate)) {
#    defaults$ccstartdate <- ccstartdate
#  }
#  if (!missing(ccstarttime)) {
#    defaults$ccstarttime <- ccstarttime
#  }
#  if (!missing(ccdisrdydate)) {
#    defaults$ccdisrdydate <- ccdisrdydate
#  }
#  if (!missing(ccdisrdytime)) {
#    defaults$ccdisrdytime <- ccdisrdytime
#  }
#  if (!missing(ccdisdate)) {
#    defaults$ccdisdate <- ccdisdate
#  }
#  if (!missing(ccdistime)) {
#    defaults$ccdistime <- ccdistime
#  }
#  if (!missing(ccadmitype)) {
#    defaults$ccadmitype <- ccadmitype
#  }
#  if (!missing(ccadmisorc)) {
#    defaults$ccadmisorc <- ccadmisorc
#  }
#  if (!missing(ccsorcloc)) {
#    defaults$ccsorcloc <- ccsorcloc
#  }
#  if (!missing(ccdisstat)) {
#    defaults$ccdisstat <- ccdisstat
#  }
#  if (!missing(ccdisdest)) {
#    defaults$ccdisdest <- ccdisdest
#  }
#  if (!missing(ccdisloc)) {
#    defaults$ccdisloc <- ccdisloc
#  }
#  if (!missing(cclev2days)) {
#    defaults$cclev2days <- cclev2days
#  }
#  if (!missing(cclev3days)) {
#    defaults$cclev3days <- cclev3days
#  }
#  if (!missing(bcardsupdays)) {
#    defaults$bcardsupdays <- bcardsupdays
#  }
#  if (!missing(acardsupdays)) {
#    defaults$acardsupdays <- acardsupdays
#  }
#  if (!missing(bressupdays)) {
#    defaults$bressupdays <- bressupdays
#  }
#  if (!missing(aressupdays)) {
#    defaults$aressupdays <- aressupdays
#  }
#  if (!missing(gisupdays)) {
#    defaults$gisupdays <- gisupdays
#  }
#  if (!missing(liversupdays)) {
#    defaults$liversupdays <- liversupdays
#  }
#  if (!missing(neurosupdays)) {
#    defaults$neurosupdays <- neurosupdays
#  }
#  if (!missing(rensupdays)) {
#    defaults$rensupdays <- rensupdays
#  }
#  if (!missing(dermsupdays)) {
#    defaults$dermsupdays <- dermsupdays
#  }
#  if (!missing(orgsupmax)) {
#    defaults$orgsupmax <- orgsupmax
#  }
#  if (!missing(ccunitfun)) {
#    defaults$ccunitfun <- ccunitfun
#  }
#  if (!missing(unitbedconfig)) {
#    defaults$unitbedconfig <- unitbedconfig
#  }
#  if (!missing(bestmatch)) {
#    defaults$bestmatch <- bestmatch
#  }
#  if (!missing(ccapcrel)) {
#    defaults$ccapcrel <- ccapcrel
#  }
#  invisible(defaults)
#}

#set_defaults_hes_diagnosis_epi <- function(patid, spno, epikey, epistart, epiend, icd, icdx, d_order) {
#  defaults <- frameworkContext$defaultValues$hes_diagnosis_epi;
#  if (!missing(patid)) {
#    defaults$patid <- patid
#  }
#  if (!missing(spno)) {
#    defaults$spno <- spno
#  }
#  if (!missing(epikey)) {
#    defaults$epikey <- epikey
#  }
#  if (!missing(epistart)) {
#    defaults$epistart <- epistart
#  }
#  if (!missing(epiend)) {
#    defaults$epiend <- epiend
#  }
#  if (!missing(icd)) {
#    defaults$icd <- icd
#  }
#  if (!missing(icdx)) {
#    defaults$icdx <- icdx
#  }
#  if (!missing(d_order)) {
#    defaults$d_order <- d_order
#  }
#  invisible(defaults)
#}

#set_defaults_hes_diagnosis_hosp <- function(patid, spno, admidate, discharged, icd, icdsx) {
#  defaults <- frameworkContext$defaultValues$hes_diagnosis_hosp;
#  if (!missing(patid)) {
#    defaults$patid <- patid
#  }
#  if (!missing(spno)) {
#    defaults$spno <- spno
#  }
#  if (!missing(admidate)) {
#    defaults$admidate <- admidate
#  }
#  if (!missing(discharged)) {
#    defaults$discharged <- discharged
#  }
#  if (!missing(icd)) {
#    defaults$icd <- icd
#  }
#  if (!missing(icdsx)) {
#    defaults$icdsx <- icdsx
#  }
#  invisible(defaults)
#}

#set_defaults_hes_episodes <- function(patid, spno, epikey, admidate, epistart, epiend, discharged, eorder, epidur, epitype, admimeth, admisorc, disdest, dismeth, mainspef, tretspef, pconsult, intmanig, classpat, firstreg) {
#  defaults <- frameworkContext$defaultValues$hes_episodes;
#  if (!missing(patid)) {
#    defaults$patid <- patid
#  }
#  if (!missing(spno)) {
#    defaults$spno <- spno
#  }
#  if (!missing(epikey)) {
#    defaults$epikey <- epikey
#  }
#  if (!missing(admidate)) {
#    defaults$admidate <- admidate
#  }
#  if (!missing(epistart)) {
#    defaults$epistart <- epistart
#  }
#  if (!missing(epiend)) {
#    defaults$epiend <- epiend
#  }
#  if (!missing(discharged)) {
#    defaults$discharged <- discharged
#  }
#  if (!missing(eorder)) {
#    defaults$eorder <- eorder
#  }
#  if (!missing(epidur)) {
#    defaults$epidur <- epidur
#  }
#  if (!missing(epitype)) {
#    defaults$epitype <- epitype
#  }
#  if (!missing(admimeth)) {
#    defaults$admimeth <- admimeth
#  }
#  if (!missing(admisorc)) {
#    defaults$admisorc <- admisorc
#  }
#  if (!missing(disdest)) {
#    defaults$disdest <- disdest
#  }
#  if (!missing(dismeth)) {
#    defaults$dismeth <- dismeth
#  }
#  if (!missing(mainspef)) {
#    defaults$mainspef <- mainspef
#  }
#  if (!missing(tretspef)) {
#    defaults$tretspef <- tretspef
#  }
#  if (!missing(pconsult)) {
#    defaults$pconsult <- pconsult
#  }
#  if (!missing(intmanig)) {
#    defaults$intmanig <- intmanig
#  }
#  if (!missing(classpat)) {
#    defaults$classpat <- classpat
#  }
#  if (!missing(firstreg)) {
#    defaults$firstreg <- firstreg
#  }
#  invisible(defaults)
#}

#set_defaults_hes_fielddefinitions <- function(fieldid, hes_fieldname, fieldname, description, class, lengthformat, availability, datacleaning, iscategorical) {
#  defaults <- frameworkContext$defaultValues$hes_fielddefinitions;
#  if (!missing(fieldid)) {
#    defaults$fieldid <- fieldid
#  }
#  if (!missing(hes_fieldname)) {
#    defaults$hes_fieldname <- hes_fieldname
#  }
#  if (!missing(fieldname)) {
#    defaults$fieldname <- fieldname
#  }
#  if (!missing(description)) {
#    defaults$description <- description
#  }
#  if (!missing(class)) {
#    defaults$class <- class
#  }
#  if (!missing(lengthformat)) {
#    defaults$lengthformat <- lengthformat
#  }
#  if (!missing(availability)) {
#    defaults$availability <- availability
#  }
#  if (!missing(datacleaning)) {
#    defaults$datacleaning <- datacleaning
#  }
#  if (!missing(iscategorical)) {
#    defaults$iscategorical <- iscategorical
#  }
#  invisible(defaults)
#}

#set_defaults_hes_fieldmappings <- function(mappingid, fieldid, value, description, condition) {
#  defaults <- frameworkContext$defaultValues$hes_fieldmappings;
#  if (!missing(mappingid)) {
#    defaults$mappingid <- mappingid
#  }
#  if (!missing(fieldid)) {
#    defaults$fieldid <- fieldid
#  }
#  if (!missing(value)) {
#    defaults$value <- value
#  }
#  if (!missing(description)) {
#    defaults$description <- description
#  }
#  if (!missing(condition)) {
#    defaults$condition <- condition
#  }
#  invisible(defaults)
#}

#set_defaults_hes_hospital <- function(patid, spno, admidate, discharged, admimeth, admisorc, disdest, dismeth, duration, elecdate, elecdur) {
#  defaults <- frameworkContext$defaultValues$hes_hospital;
#  if (!missing(patid)) {
#    defaults$patid <- patid
#  }
#  if (!missing(spno)) {
#    defaults$spno <- spno
#  }
#  if (!missing(admidate)) {
#    defaults$admidate <- admidate
#  }
#  if (!missing(discharged)) {
#    defaults$discharged <- discharged
#  }
#  if (!missing(admimeth)) {
#    defaults$admimeth <- admimeth
#  }
#  if (!missing(admisorc)) {
#    defaults$admisorc <- admisorc
#  }
#  if (!missing(disdest)) {
#    defaults$disdest <- disdest
#  }
#  if (!missing(dismeth)) {
#    defaults$dismeth <- dismeth
#  }
#  if (!missing(duration)) {
#    defaults$duration <- duration
#  }
#  if (!missing(elecdate)) {
#    defaults$elecdate <- elecdate
#  }
#  if (!missing(elecdur)) {
#    defaults$elecdur <- elecdur
#  }
#  invisible(defaults)
#}

#set_defaults_hes_hrg <- function(patid, epikey, spno, domproc, hrglate35, hrgnhs, hrgnhsvn, suscorehrg, sushrg, sushrgvers, hrglate, hes_yr) {
#  defaults <- frameworkContext$defaultValues$hes_hrg;
#  if (!missing(patid)) {
#    defaults$patid <- patid
#  }
#  if (!missing(epikey)) {
#    defaults$epikey <- epikey
#  }
#  if (!missing(spno)) {
#    defaults$spno <- spno
#  }
#  if (!missing(domproc)) {
#    defaults$domproc <- domproc
#  }
#  if (!missing(hrglate35)) {
#    defaults$hrglate35 <- hrglate35
#  }
#  if (!missing(hrgnhs)) {
#    defaults$hrgnhs <- hrgnhs
#  }
#  if (!missing(hrgnhsvn)) {
#    defaults$hrgnhsvn <- hrgnhsvn
#  }
#  if (!missing(suscorehrg)) {
#    defaults$suscorehrg <- suscorehrg
#  }
#  if (!missing(sushrg)) {
#    defaults$sushrg <- sushrg
#  }
#  if (!missing(sushrgvers)) {
#    defaults$sushrgvers <- sushrgvers
#  }
#  if (!missing(hrglate)) {
#    defaults$hrglate <- hrglate
#  }
#  if (!missing(hes_yr)) {
#    defaults$hes_yr <- hes_yr
#  }
#  invisible(defaults)
#}

#set_defaults_hes_linkage_coverage <- function(data_source, start, end) {
#  defaults <- frameworkContext$defaultValues$hes_linkage_coverage;
#  if (!missing(data_source)) {
#    defaults$data_source <- data_source
#  }
#  if (!missing(start)) {
#    defaults$start <- start
#  }
#  if (!missing(end)) {
#    defaults$end <- end
#  }
#  invisible(defaults)
#}

#set_defaults_hes_linkage_eligibility <- function(patid, pracid, linkdate, hes_e, death_e, cr_e, minap_e, lsoa_e) {
#  defaults <- frameworkContext$defaultValues$hes_linkage_eligibility;
#  if (!missing(patid)) {
#    defaults$patid <- patid
#  }
#  if (!missing(pracid)) {
#    defaults$pracid <- pracid
#  }
#  if (!missing(linkdate)) {
#    defaults$linkdate <- linkdate
#  }
#  if (!missing(hes_e)) {
#    defaults$hes_e <- hes_e
#  }
#  if (!missing(death_e)) {
#    defaults$death_e <- death_e
#  }
#  if (!missing(cr_e)) {
#    defaults$cr_e <- cr_e
#  }
#  if (!missing(minap_e)) {
#    defaults$minap_e <- minap_e
#  }
#  if (!missing(lsoa_e)) {
#    defaults$lsoa_e <- lsoa_e
#  }
#  invisible(defaults)
#}

#set_defaults_hes_linked_practices <- function(pracid) {
#  defaults <- frameworkContext$defaultValues$hes_linked_practices;
#  if (!missing(pracid)) {
#    defaults$pracid <- pracid
#  }
#  invisible(defaults)
#}

#set_defaults_hes_maternity <- function(patid, spno, epikey, epistart, epiend, eorder, epidur, numbaby, numtailb, matordr, neocare, wellbaby, anasdate, birordr, birstat, biresus, sexbaby, birweit, delmeth, delonset, delinten, delplac, delchang, delprean, delposan, delstat, anagest, gestat, numpreg, matage, neodur, antedur, postdur) {
#  defaults <- frameworkContext$defaultValues$hes_maternity;
#  if (!missing(patid)) {
#    defaults$patid <- patid
#  }
#  if (!missing(spno)) {
#    defaults$spno <- spno
#  }
#  if (!missing(epikey)) {
#    defaults$epikey <- epikey
#  }
#  if (!missing(epistart)) {
#    defaults$epistart <- epistart
#  }
#  if (!missing(epiend)) {
#    defaults$epiend <- epiend
#  }
#  if (!missing(eorder)) {
#    defaults$eorder <- eorder
#  }
#  if (!missing(epidur)) {
#    defaults$epidur <- epidur
#  }
#  if (!missing(numbaby)) {
#    defaults$numbaby <- numbaby
#  }
#  if (!missing(numtailb)) {
#    defaults$numtailb <- numtailb
#  }
#  if (!missing(matordr)) {
#    defaults$matordr <- matordr
#  }
#  if (!missing(neocare)) {
#    defaults$neocare <- neocare
#  }
#  if (!missing(wellbaby)) {
#    defaults$wellbaby <- wellbaby
#  }
#  if (!missing(anasdate)) {
#    defaults$anasdate <- anasdate
#  }
#  if (!missing(birordr)) {
#    defaults$birordr <- birordr
#  }
#  if (!missing(birstat)) {
#    defaults$birstat <- birstat
#  }
#  if (!missing(biresus)) {
#    defaults$biresus <- biresus
#  }
#  if (!missing(sexbaby)) {
#    defaults$sexbaby <- sexbaby
#  }
#  if (!missing(birweit)) {
#    defaults$birweit <- birweit
#  }
#  if (!missing(delmeth)) {
#    defaults$delmeth <- delmeth
#  }
#  if (!missing(delonset)) {
#    defaults$delonset <- delonset
#  }
#  if (!missing(delinten)) {
#    defaults$delinten <- delinten
#  }
#  if (!missing(delplac)) {
#    defaults$delplac <- delplac
#  }
#  if (!missing(delchang)) {
#    defaults$delchang <- delchang
#  }
#  if (!missing(delprean)) {
#    defaults$delprean <- delprean
#  }
#  if (!missing(delposan)) {
#    defaults$delposan <- delposan
#  }
#  if (!missing(delstat)) {
#    defaults$delstat <- delstat
#  }
#  if (!missing(anagest)) {
#    defaults$anagest <- anagest
#  }
#  if (!missing(gestat)) {
#    defaults$gestat <- gestat
#  }
#  if (!missing(numpreg)) {
#    defaults$numpreg <- numpreg
#  }
#  if (!missing(matage)) {
#    defaults$matage <- matage
#  }
#  if (!missing(neodur)) {
#    defaults$neodur <- neodur
#  }
#  if (!missing(antedur)) {
#    defaults$antedur <- antedur
#  }
#  if (!missing(postdur)) {
#    defaults$postdur <- postdur
#  }
#  invisible(defaults)
#}

#set_defaults_hes_patient <- function(patid, pracid, ethnos, gen_hesid, n_patid_hes, match_rank) {
#  defaults <- frameworkContext$defaultValues$hes_patient;
#  if (!missing(patid)) {
#    defaults$patid <- patid
#  }
#  if (!missing(pracid)) {
#    defaults$pracid <- pracid
#  }
#  if (!missing(ethnos)) {
#    defaults$ethnos <- ethnos
#  }
#  if (!missing(gen_hesid)) {
#    defaults$gen_hesid <- gen_hesid
#  }
#  if (!missing(n_patid_hes)) {
#    defaults$n_patid_hes <- n_patid_hes
#  }
#  if (!missing(match_rank)) {
#    defaults$match_rank <- match_rank
#  }
#  invisible(defaults)
#}

#set_defaults_hes_primary_diag_hosp <- function(patid, spno, admidate, discharged, icd, icdx) {
#  defaults <- frameworkContext$defaultValues$hes_primary_diag_hosp;
#  if (!missing(patid)) {
#    defaults$patid <- patid
#  }
#  if (!missing(spno)) {
#    defaults$spno <- spno
#  }
#  if (!missing(admidate)) {
#    defaults$admidate <- admidate
#  }
#  if (!missing(discharged)) {
#    defaults$discharged <- discharged
#  }
#  if (!missing(icd)) {
#    defaults$icd <- icd
#  }
#  if (!missing(icdx)) {
#    defaults$icdx <- icdx
#  }
#  invisible(defaults)
#}

#set_defaults_hes_procedures_epi <- function(patid, spno, epikey, admidate, epistart, epiend, discharged, opcs, evdate, p_order) {
#  defaults <- frameworkContext$defaultValues$hes_procedures_epi;
#  if (!missing(patid)) {
#    defaults$patid <- patid
#  }
#  if (!missing(spno)) {
#    defaults$spno <- spno
#  }
#  if (!missing(epikey)) {
#    defaults$epikey <- epikey
#  }
#  if (!missing(admidate)) {
#    defaults$admidate <- admidate
#  }
#  if (!missing(epistart)) {
#    defaults$epistart <- epistart
#  }
#  if (!missing(epiend)) {
#    defaults$epiend <- epiend
#  }
#  if (!missing(discharged)) {
#    defaults$discharged <- discharged
#  }
#  if (!missing(opcs)) {
#    defaults$opcs <- opcs
#  }
#  if (!missing(evdate)) {
#    defaults$evdate <- evdate
#  }
#  if (!missing(p_order)) {
#    defaults$p_order <- p_order
#  }
#  invisible(defaults)
#}

set_defaults_immunisation <- function(patid, eventdate, sysdate, constype, consid, medcode, staffid, textid, immstype, stage, status, compound, source, reason, method, batch) {
  defaults <- frameworkContext$defaultValues$immunisation;
  if (!missing(patid)) {
    defaults$patid <- patid
  }
  if (!missing(eventdate)) {
    defaults$eventdate <- eventdate
  }
  if (!missing(sysdate)) {
    defaults$sysdate <- sysdate
  }
  if (!missing(constype)) {
    defaults$constype <- constype
  }
  if (!missing(consid)) {
    defaults$consid <- consid
  }
  if (!missing(medcode)) {
    defaults$medcode <- medcode
  }
  if (!missing(staffid)) {
    defaults$staffid <- staffid
  }
  if (!missing(textid)) {
    defaults$textid <- textid
  }
  if (!missing(immstype)) {
    defaults$immstype <- immstype
  }
  if (!missing(stage)) {
    defaults$stage <- stage
  }
  if (!missing(status)) {
    defaults$status <- status
  }
  if (!missing(compound)) {
    defaults$compound <- compound
  }
  if (!missing(source)) {
    defaults$source <- source
  }
  if (!missing(reason)) {
    defaults$reason <- reason
  }
  if (!missing(method)) {
    defaults$method <- method
  }
  if (!missing(batch)) {
    defaults$batch <- batch
  }
  invisible(defaults)
}

set_defaults_lookup <- function(lookup_id, lookup_type_id, code, text) {
  defaults <- frameworkContext$defaultValues$lookup;
  if (!missing(lookup_id)) {
    defaults$lookup_id <- lookup_id
  }
  if (!missing(lookup_type_id)) {
    defaults$lookup_type_id <- lookup_type_id
  }
  if (!missing(code)) {
    defaults$code <- code
  }
  if (!missing(text)) {
    defaults$text <- text
  }
  invisible(defaults)
}

set_defaults_lookuptype <- function(lookup_type_id, name, description) {
  defaults <- frameworkContext$defaultValues$lookuptype;
  if (!missing(lookup_type_id)) {
    defaults$lookup_type_id <- lookup_type_id
  }
  if (!missing(name)) {
    defaults$name <- name
  }
  if (!missing(description)) {
    defaults$description <- description
  }
  invisible(defaults)
}

set_defaults_medical <- function(medcode, read_code, description) {
  defaults <- frameworkContext$defaultValues$medical;
  if (!missing(medcode)) {
    defaults$medcode <- medcode
  }
  if (!missing(read_code)) {
    defaults$read_code <- read_code
  }
  if (!missing(description)) {
    defaults$description <- description
  }
  invisible(defaults)
}

set_defaults_packtype <- function(packtype, packtype_desc) {
  defaults <- frameworkContext$defaultValues$packtype;
  if (!missing(packtype)) {
    defaults$packtype <- packtype
  }
  if (!missing(packtype_desc)) {
    defaults$packtype_desc <- packtype_desc
  }
  invisible(defaults)
}

set_defaults_patient <- function(patid, vmid, gender, yob, mob, marital, famnum, chsreg, chsdate, prescr, capsup, ses, frd, crd, regstat, reggap, internal, tod, toreason, deathdate, accept, pracid, birth_date, start_date, end_date) {
  defaults <- frameworkContext$defaultValues$patient;
  if (!missing(patid)) {
    defaults$patid <- patid
  }
  if (!missing(vmid)) {
    defaults$vmid <- vmid
  }
  if (!missing(gender)) {
    defaults$gender <- gender
  }
  if (!missing(yob)) {
    defaults$yob <- yob
  }
  if (!missing(mob)) {
    defaults$mob <- mob
  }
  if (!missing(marital)) {
    defaults$marital <- marital
  }
  if (!missing(famnum)) {
    defaults$famnum <- famnum
  }
  if (!missing(chsreg)) {
    defaults$chsreg <- chsreg
  }
  if (!missing(chsdate)) {
    defaults$chsdate <- chsdate
  }
  if (!missing(prescr)) {
    defaults$prescr <- prescr
  }
  if (!missing(capsup)) {
    defaults$capsup <- capsup
  }
  if (!missing(ses)) {
    defaults$ses <- ses
  }
  if (!missing(frd)) {
    defaults$frd <- frd
  }
  if (!missing(crd)) {
    defaults$crd <- crd
  }
  if (!missing(regstat)) {
    defaults$regstat <- regstat
  }
  if (!missing(reggap)) {
    defaults$reggap <- reggap
  }
  if (!missing(internal)) {
    defaults$internal <- internal
  }
  if (!missing(tod)) {
    defaults$tod <- tod
  }
  if (!missing(toreason)) {
    defaults$toreason <- toreason
  }
  if (!missing(deathdate)) {
    defaults$deathdate <- deathdate
  }
  if (!missing(accept)) {
    defaults$accept <- accept
  }
  if (!missing(pracid)) {
    defaults$pracid <- pracid
  }
  if (!missing(birth_date)) {
    defaults$birth_date <- birth_date
  }
  if (!missing(start_date)) {
    defaults$start_date <- start_date
  }
  if (!missing(end_date)) {
    defaults$end_date <- end_date
  }
  invisible(defaults)
}

set_defaults_practice <- function(pracid, region, lcd, uts) {
  defaults <- frameworkContext$defaultValues$practice;
  if (!missing(pracid)) {
    defaults$pracid <- pracid
  }
  if (!missing(region)) {
    defaults$region <- region
  }
  if (!missing(lcd)) {
    defaults$lcd <- lcd
  }
  if (!missing(uts)) {
    defaults$uts <- uts
  }
  invisible(defaults)
}

set_defaults_product <- function(prodcode, gemscriptcode, productname, drugsubstance, strength, formulation, route, bnf, bnf_with_dots, bnfchapter) {
  defaults <- frameworkContext$defaultValues$product;
  if (!missing(prodcode)) {
    defaults$prodcode <- prodcode
  }
  if (!missing(gemscriptcode)) {
    defaults$gemscriptcode <- gemscriptcode
  }
  if (!missing(productname)) {
    defaults$productname <- productname
  }
  if (!missing(drugsubstance)) {
    defaults$drugsubstance <- drugsubstance
  }
  if (!missing(strength)) {
    defaults$strength <- strength
  }
  if (!missing(formulation)) {
    defaults$formulation <- formulation
  }
  if (!missing(route)) {
    defaults$route <- route
  }
  if (!missing(bnf)) {
    defaults$bnf <- bnf
  }
  if (!missing(bnf_with_dots)) {
    defaults$bnf_with_dots <- bnf_with_dots
  }
  if (!missing(bnfchapter)) {
    defaults$bnfchapter <- bnfchapter
  }
  invisible(defaults)
}

set_defaults_referral <- function(patid, eventdate, sysdate, constype, consid, medcode, staffid, textid, source, nhsspec, fhsaspec, inpatient, attendance, urgency) {
  defaults <- frameworkContext$defaultValues$referral;
  if (!missing(patid)) {
    defaults$patid <- patid
  }
  if (!missing(eventdate)) {
    defaults$eventdate <- eventdate
  }
  if (!missing(sysdate)) {
    defaults$sysdate <- sysdate
  }
  if (!missing(constype)) {
    defaults$constype <- constype
  }
  if (!missing(consid)) {
    defaults$consid <- consid
  }
  if (!missing(medcode)) {
    defaults$medcode <- medcode
  }
  if (!missing(staffid)) {
    defaults$staffid <- staffid
  }
  if (!missing(textid)) {
    defaults$textid <- textid
  }
  if (!missing(source)) {
    defaults$source <- source
  }
  if (!missing(nhsspec)) {
    defaults$nhsspec <- nhsspec
  }
  if (!missing(fhsaspec)) {
    defaults$fhsaspec <- fhsaspec
  }
  if (!missing(inpatient)) {
    defaults$inpatient <- inpatient
  }
  if (!missing(attendance)) {
    defaults$attendance <- attendance
  }
  if (!missing(urgency)) {
    defaults$urgency <- urgency
  }
  invisible(defaults)
}

set_defaults_scoringmethod <- function(code, scoring_method) {
  defaults <- frameworkContext$defaultValues$scoringmethod;
  if (!missing(code)) {
    defaults$code <- code
  }
  if (!missing(scoring_method)) {
    defaults$scoring_method <- scoring_method
  }
  invisible(defaults)
}

set_defaults_staff <- function(staffid, gender, role) {
  defaults <- frameworkContext$defaultValues$staff;
  if (!missing(staffid)) {
    defaults$staffid <- staffid
  }
  if (!missing(gender)) {
    defaults$gender <- gender
  }
  if (!missing(role)) {
    defaults$role <- role
  }
  invisible(defaults)
}

set_defaults_test <- function(patid, eventdate, sysdate, constype, consid, medcode, staffid, textid, enttype, data1, data2, data3, data4, data5, data6, data7, data8_value, data8_date) {
  defaults <- frameworkContext$defaultValues$test;
  if (!missing(patid)) {
    defaults$patid <- patid
  }
  if (!missing(eventdate)) {
    defaults$eventdate <- eventdate
  }
  if (!missing(sysdate)) {
    defaults$sysdate <- sysdate
  }
  if (!missing(constype)) {
    defaults$constype <- constype
  }
  if (!missing(consid)) {
    defaults$consid <- consid
  }
  if (!missing(medcode)) {
    defaults$medcode <- medcode
  }
  if (!missing(staffid)) {
    defaults$staffid <- staffid
  }
  if (!missing(textid)) {
    defaults$textid <- textid
  }
  if (!missing(enttype)) {
    defaults$enttype <- enttype
  }
  if (!missing(data1)) {
    defaults$data1 <- data1
  }
  if (!missing(data2)) {
    defaults$data2 <- data2
  }
  if (!missing(data3)) {
    defaults$data3 <- data3
  }
  if (!missing(data4)) {
    defaults$data4 <- data4
  }
  if (!missing(data5)) {
    defaults$data5 <- data5
  }
  if (!missing(data6)) {
    defaults$data6 <- data6
  }
  if (!missing(data7)) {
    defaults$data7 <- data7
  }
  if (!missing(data8_value)) {
    defaults$data8_value <- data8_value
  }
  if (!missing(data8_date)) {
    defaults$data8_date <- data8_date
  }
  invisible(defaults)
}

set_defaults_therapy <- function(patid, eventdate, sysdate, consid, prodcode, staffid, textid, bnfcode, qty, ndd, numdays, numpacks, packtype, issueseq) {
  defaults <- frameworkContext$defaultValues$therapy;
  if (!missing(patid)) {
    defaults$patid <- patid
  }
  if (!missing(eventdate)) {
    defaults$eventdate <- eventdate
  }
  if (!missing(sysdate)) {
    defaults$sysdate <- sysdate
  }
  if (!missing(consid)) {
    defaults$consid <- consid
  }
  if (!missing(prodcode)) {
    defaults$prodcode <- prodcode
  }
  if (!missing(staffid)) {
    defaults$staffid <- staffid
  }
  if (!missing(textid)) {
    defaults$textid <- textid
  }
  if (!missing(bnfcode)) {
    defaults$bnfcode <- bnfcode
  }
  if (!missing(qty)) {
    defaults$qty <- qty
  }
  if (!missing(ndd)) {
    defaults$ndd <- ndd
  }
  if (!missing(numdays)) {
    defaults$numdays <- numdays
  }
  if (!missing(numpacks)) {
    defaults$numpacks <- numpacks
  }
  if (!missing(packtype)) {
    defaults$packtype <- packtype
  }
  if (!missing(issueseq)) {
    defaults$issueseq <- issueseq
  }
  invisible(defaults)
}

get_defaults_U_version <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_additional <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_batchnumbers <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_bnfcodes <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_clinical <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_commondosages <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_consultation <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_daysupply_decodes <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_daysupply_modes <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_entity <- function() {
  return(frameworkContext$defaultValues)
}

#get_defaults_hes_acp <- function() {
#  return(frameworkContext$defaultValues)
#}

#get_defaults_hes_ccare <- function() {
#  return(frameworkContext$defaultValues)
#}

#get_defaults_hes_diagnosis_epi <- function() {
#  return(frameworkContext$defaultValues)
#}

#get_defaults_hes_diagnosis_hosp <- function() {
#  return(frameworkContext$defaultValues)
#}

#get_defaults_hes_episodes <- function() {
#  return(frameworkContext$defaultValues)
#}

#get_defaults_hes_fielddefinitions <- function() {
#  return(frameworkContext$defaultValues)
#}

#get_defaults_hes_fieldmappings <- function() {
#  return(frameworkContext$defaultValues)
#}

#get_defaults_hes_hospital <- function() {
#  return(frameworkContext$defaultValues)
#}

#get_defaults_hes_hrg <- function() {
#  return(frameworkContext$defaultValues)
#}

#get_defaults_hes_linkage_coverage <- function() {
#  return(frameworkContext$defaultValues)
#}

#get_defaults_hes_linkage_eligibility <- function() {
#  return(frameworkContext$defaultValues)
#}

#get_defaults_hes_linked_practices <- function() {
#  return(frameworkContext$defaultValues)
#}

#get_defaults_hes_maternity <- function() {
#  return(frameworkContext$defaultValues)
#}

#get_defaults_hes_patient <- function() {
#  return(frameworkContext$defaultValues)
#}

#get_defaults_hes_primary_diag_hosp <- function() {
#  return(frameworkContext$defaultValues)
#}

#get_defaults_hes_procedures_epi <- function() {
#  return(frameworkContext$defaultValues)
#}

get_defaults_immunisation <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_lookup <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_lookuptype <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_medical <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_packtype <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_patient <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_practice <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_product <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_referral <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_scoringmethod <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_staff <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_test <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_therapy <- function() {
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

add_additional <- function(patid, enttype, adid, data1_value, data1_date, data2_value, data2_date, data3_value, data3_date, data4_value, data4_date, data5_value, data5_date, data6_value, data6_date, data7_value, data7_date) {
  defaults <- frameworkContext$defaultValues$additional;
  insertFields <- c()
  insertValues <- c()
  if (missing(patid)) {
    patid <- defaults$patid
  }
  if (!is.null(patid)) {
    insertFields <- c(insertFields, "patid")
    insertValues <- c(insertValues, patid)
  }

  if (missing(enttype)) {
    enttype <- defaults$enttype
  }
  if (!is.null(enttype)) {
    insertFields <- c(insertFields, "enttype")
    insertValues <- c(insertValues, enttype)
  }

  if (missing(adid)) {
    adid <- defaults$adid
  }
  if (!is.null(adid)) {
    insertFields <- c(insertFields, "adid")
    insertValues <- c(insertValues, adid)
  }

  if (missing(data1_value)) {
    data1_value <- defaults$data1_value
  }
  if (!is.null(data1_value)) {
    insertFields <- c(insertFields, "data1_value")
    insertValues <- c(insertValues, data1_value)
  }

  if (missing(data1_date)) {
    data1_date <- defaults$data1_date
  }
  if (!is.null(data1_date)) {
    insertFields <- c(insertFields, "data1_date")
    insertValues <- c(insertValues, data1_date)
  }

  if (missing(data2_value)) {
    data2_value <- defaults$data2_value
  }
  if (!is.null(data2_value)) {
    insertFields <- c(insertFields, "data2_value")
    insertValues <- c(insertValues, data2_value)
  }

  if (missing(data2_date)) {
    data2_date <- defaults$data2_date
  }
  if (!is.null(data2_date)) {
    insertFields <- c(insertFields, "data2_date")
    insertValues <- c(insertValues, data2_date)
  }

  if (missing(data3_value)) {
    data3_value <- defaults$data3_value
  }
  if (!is.null(data3_value)) {
    insertFields <- c(insertFields, "data3_value")
    insertValues <- c(insertValues, data3_value)
  }

  if (missing(data3_date)) {
    data3_date <- defaults$data3_date
  }
  if (!is.null(data3_date)) {
    insertFields <- c(insertFields, "data3_date")
    insertValues <- c(insertValues, data3_date)
  }

  if (missing(data4_value)) {
    data4_value <- defaults$data4_value
  }
  if (!is.null(data4_value)) {
    insertFields <- c(insertFields, "data4_value")
    insertValues <- c(insertValues, data4_value)
  }

  if (missing(data4_date)) {
    data4_date <- defaults$data4_date
  }
  if (!is.null(data4_date)) {
    insertFields <- c(insertFields, "data4_date")
    insertValues <- c(insertValues, data4_date)
  }

  if (missing(data5_value)) {
    data5_value <- defaults$data5_value
  }
  if (!is.null(data5_value)) {
    insertFields <- c(insertFields, "data5_value")
    insertValues <- c(insertValues, data5_value)
  }

  if (missing(data5_date)) {
    data5_date <- defaults$data5_date
  }
  if (!is.null(data5_date)) {
    insertFields <- c(insertFields, "data5_date")
    insertValues <- c(insertValues, data5_date)
  }

  if (missing(data6_value)) {
    data6_value <- defaults$data6_value
  }
  if (!is.null(data6_value)) {
    insertFields <- c(insertFields, "data6_value")
    insertValues <- c(insertValues, data6_value)
  }

  if (missing(data6_date)) {
    data6_date <- defaults$data6_date
  }
  if (!is.null(data6_date)) {
    insertFields <- c(insertFields, "data6_date")
    insertValues <- c(insertValues, data6_date)
  }

  if (missing(data7_value)) {
    data7_value <- defaults$data7_value
  }
  if (!is.null(data7_value)) {
    insertFields <- c(insertFields, "data7_value")
    insertValues <- c(insertValues, data7_value)
  }

  if (missing(data7_date)) {
    data7_date <- defaults$data7_date
  }
  if (!is.null(data7_date)) {
    insertFields <- c(insertFields, "data7_date")
    insertValues <- c(insertValues, data7_date)
  }

  statement <- paste0("INSERT INTO @source_schema.additional (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
  invisible(statement);
}

add_batchnumbers <- function(batch, batch_number) {
  defaults <- frameworkContext$defaultValues$batchnumbers;
  insertFields <- c()
  insertValues <- c()
  if (missing(batch)) {
    batch <- defaults$batch
  }
  if (!is.null(batch)) {
    insertFields <- c(insertFields, "batch")
    insertValues <- c(insertValues, batch)
  }

  if (missing(batch_number)) {
    batch_number <- defaults$batch_number
  }
  if (!is.null(batch_number)) {
    insertFields <- c(insertFields, "batch_number")
    insertValues <- c(insertValues, batch_number)
  }

  statement <- paste0("INSERT INTO @source_schema.batchnumbers (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
  invisible(statement);
}

add_bnfcodes <- function(bnfcode, bnf, bnf_with_dots, description) {
  defaults <- frameworkContext$defaultValues$bnfcodes;
  insertFields <- c()
  insertValues <- c()
  if (missing(bnfcode)) {
    bnfcode <- defaults$bnfcode
  }
  if (!is.null(bnfcode)) {
    insertFields <- c(insertFields, "bnfcode")
    insertValues <- c(insertValues, bnfcode)
  }

  if (missing(bnf)) {
    bnf <- defaults$bnf
  }
  if (!is.null(bnf)) {
    insertFields <- c(insertFields, "bnf")
    insertValues <- c(insertValues, bnf)
  }

  if (missing(bnf_with_dots)) {
    bnf_with_dots <- defaults$bnf_with_dots
  }
  if (!is.null(bnf_with_dots)) {
    insertFields <- c(insertFields, "bnf_with_dots")
    insertValues <- c(insertValues, bnf_with_dots)
  }

  if (missing(description)) {
    description <- defaults$description
  }
  if (!is.null(description)) {
    insertFields <- c(insertFields, "description")
    insertValues <- c(insertValues, description)
  }

  statement <- paste0("INSERT INTO @source_schema.bnfcodes (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
  invisible(statement);
}

add_clinical <- function(patid, eventdate, sysdate, constype, consid, medcode, staffid, textid, episode, enttype, adid) {
  defaults <- frameworkContext$defaultValues$clinical;
  insertFields <- c()
  insertValues <- c()
  if (missing(patid)) {
    patid <- defaults$patid
  }
  if (!is.null(patid)) {
    insertFields <- c(insertFields, "patid")
    insertValues <- c(insertValues, patid)
  }

  if (missing(eventdate)) {
    eventdate <- defaults$eventdate
  }
  if (!is.null(eventdate)) {
    insertFields <- c(insertFields, "eventdate")
    insertValues <- c(insertValues, eventdate)
  }

  if (missing(sysdate)) {
    sysdate <- defaults$sysdate
  }
  if (!is.null(sysdate)) {
    insertFields <- c(insertFields, "sysdate")
    insertValues <- c(insertValues, sysdate)
  }

  if (missing(constype)) {
    constype <- defaults$constype
  }
  if (!is.null(constype)) {
    insertFields <- c(insertFields, "constype")
    insertValues <- c(insertValues, constype)
  }

  if (missing(consid)) {
    consid <- defaults$consid
  }
  if (!is.null(consid)) {
    insertFields <- c(insertFields, "consid")
    insertValues <- c(insertValues, consid)
  }

  if (missing(medcode)) {
    medcode <- defaults$medcode
  }
  if (!is.null(medcode)) {
    insertFields <- c(insertFields, "medcode")
    insertValues <- c(insertValues, medcode)
  }

  if (missing(staffid)) {
    staffid <- defaults$staffid
  }
  if (!is.null(staffid)) {
    insertFields <- c(insertFields, "staffid")
    insertValues <- c(insertValues, staffid)
  }

  if (missing(textid)) {
    textid <- defaults$textid
  }
  if (!is.null(textid)) {
    insertFields <- c(insertFields, "textid")
    insertValues <- c(insertValues, textid)
  }

  if (missing(episode)) {
    episode <- defaults$episode
  }
  if (!is.null(episode)) {
    insertFields <- c(insertFields, "episode")
    insertValues <- c(insertValues, episode)
  }

  if (missing(enttype)) {
    enttype <- defaults$enttype
  }
  if (!is.null(enttype)) {
    insertFields <- c(insertFields, "enttype")
    insertValues <- c(insertValues, enttype)
  }

  if (missing(adid)) {
    adid <- defaults$adid
  }
  if (!is.null(adid)) {
    insertFields <- c(insertFields, "adid")
    insertValues <- c(insertValues, adid)
  }

  statement <- paste0("INSERT INTO @source_schema.clinical (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
  invisible(statement);
}

add_commondosages <- function(textid, text, daily_dose, dose_number, dose_unit, dose_frequency, dose_interval, choice_of_dose, dose_max_average, change_dose, dose_duration) {
  defaults <- frameworkContext$defaultValues$commondosages;
  insertFields <- c()
  insertValues <- c()
  if (missing(textid)) {
    textid <- defaults$textid
  }
  if (!is.null(textid)) {
    insertFields <- c(insertFields, "textid")
    insertValues <- c(insertValues, textid)
  }

  if (missing(text)) {
    text <- defaults$text
  }
  if (!is.null(text)) {
    insertFields <- c(insertFields, "text")
    insertValues <- c(insertValues, text)
  }

  if (missing(daily_dose)) {
    daily_dose <- defaults$daily_dose
  }
  if (!is.null(daily_dose)) {
    insertFields <- c(insertFields, "daily_dose")
    insertValues <- c(insertValues, daily_dose)
  }

  if (missing(dose_number)) {
    dose_number <- defaults$dose_number
  }
  if (!is.null(dose_number)) {
    insertFields <- c(insertFields, "dose_number")
    insertValues <- c(insertValues, dose_number)
  }

  if (missing(dose_unit)) {
    dose_unit <- defaults$dose_unit
  }
  if (!is.null(dose_unit)) {
    insertFields <- c(insertFields, "dose_unit")
    insertValues <- c(insertValues, dose_unit)
  }

  if (missing(dose_frequency)) {
    dose_frequency <- defaults$dose_frequency
  }
  if (!is.null(dose_frequency)) {
    insertFields <- c(insertFields, "dose_frequency")
    insertValues <- c(insertValues, dose_frequency)
  }

  if (missing(dose_interval)) {
    dose_interval <- defaults$dose_interval
  }
  if (!is.null(dose_interval)) {
    insertFields <- c(insertFields, "dose_interval")
    insertValues <- c(insertValues, dose_interval)
  }

  if (missing(choice_of_dose)) {
    choice_of_dose <- defaults$choice_of_dose
  }
  if (!is.null(choice_of_dose)) {
    insertFields <- c(insertFields, "choice_of_dose")
    insertValues <- c(insertValues, choice_of_dose)
  }

  if (missing(dose_max_average)) {
    dose_max_average <- defaults$dose_max_average
  }
  if (!is.null(dose_max_average)) {
    insertFields <- c(insertFields, "dose_max_average")
    insertValues <- c(insertValues, dose_max_average)
  }

  if (missing(change_dose)) {
    change_dose <- defaults$change_dose
  }
  if (!is.null(change_dose)) {
    insertFields <- c(insertFields, "change_dose")
    insertValues <- c(insertValues, change_dose)
  }

  if (missing(dose_duration)) {
    dose_duration <- defaults$dose_duration
  }
  if (!is.null(dose_duration)) {
    insertFields <- c(insertFields, "dose_duration")
    insertValues <- c(insertValues, dose_duration)
  }

  statement <- paste0("INSERT INTO @source_schema.commondosages (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
  invisible(statement);
}

add_consultation <- function(patid, eventdate, sysdate, constype, consid, staffid, duration) {
  defaults <- frameworkContext$defaultValues$consultation;
  insertFields <- c()
  insertValues <- c()
  if (missing(patid)) {
    patid <- defaults$patid
  }
  if (!is.null(patid)) {
    insertFields <- c(insertFields, "patid")
    insertValues <- c(insertValues, patid)
  }

  if (missing(eventdate)) {
    eventdate <- defaults$eventdate
  }
  if (!is.null(eventdate)) {
    insertFields <- c(insertFields, "eventdate")
    insertValues <- c(insertValues, eventdate)
  }

  if (missing(sysdate)) {
    sysdate <- defaults$sysdate
  }
  if (!is.null(sysdate)) {
    insertFields <- c(insertFields, "sysdate")
    insertValues <- c(insertValues, sysdate)
  }

  if (missing(constype)) {
    constype <- defaults$constype
  }
  if (!is.null(constype)) {
    insertFields <- c(insertFields, "constype")
    insertValues <- c(insertValues, constype)
  }

  if (missing(consid)) {
    consid <- defaults$consid
  }
  if (!is.null(consid)) {
    insertFields <- c(insertFields, "consid")
    insertValues <- c(insertValues, consid)
  }

  if (missing(staffid)) {
    staffid <- defaults$staffid
  }
  if (!is.null(staffid)) {
    insertFields <- c(insertFields, "staffid")
    insertValues <- c(insertValues, staffid)
  }

  if (missing(duration)) {
    duration <- defaults$duration
  }
  if (!is.null(duration)) {
    insertFields <- c(insertFields, "duration")
    insertValues <- c(insertValues, duration)
  }

  statement <- paste0("INSERT INTO @source_schema.consultation (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
  invisible(statement);
}

add_daysupply_decodes <- function(prodcode, ndd, qty, numpacks, numdays) {
  defaults <- frameworkContext$defaultValues$daysupply_decodes;
  insertFields <- c()
  insertValues <- c()
  if (missing(prodcode)) {
    prodcode <- defaults$prodcode
  }
  if (!is.null(prodcode)) {
    insertFields <- c(insertFields, "prodcode")
    insertValues <- c(insertValues, prodcode)
  }

  if (missing(ndd)) {
    ndd <- defaults$ndd
  }
  if (!is.null(ndd)) {
    insertFields <- c(insertFields, "ndd")
    insertValues <- c(insertValues, ndd)
  }

  if (missing(qty)) {
    qty <- defaults$qty
  }
  if (!is.null(qty)) {
    insertFields <- c(insertFields, "qty")
    insertValues <- c(insertValues, qty)
  }

  if (missing(numpacks)) {
    numpacks <- defaults$numpacks
  }
  if (!is.null(numpacks)) {
    insertFields <- c(insertFields, "numpacks")
    insertValues <- c(insertValues, numpacks)
  }

  if (missing(numdays)) {
    numdays <- defaults$numdays
  }
  if (!is.null(numdays)) {
    insertFields <- c(insertFields, "numdays")
    insertValues <- c(insertValues, numdays)
  }

  statement <- paste0("INSERT INTO @source_schema.daysupply_decodes (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
  invisible(statement);
}

add_daysupply_modes <- function(prodcode, numdays) {
  defaults <- frameworkContext$defaultValues$daysupply_modes;
  insertFields <- c()
  insertValues <- c()
  if (missing(prodcode)) {
    prodcode <- defaults$prodcode
  }
  if (!is.null(prodcode)) {
    insertFields <- c(insertFields, "prodcode")
    insertValues <- c(insertValues, prodcode)
  }

  if (missing(numdays)) {
    numdays <- defaults$numdays
  }
  if (!is.null(numdays)) {
    insertFields <- c(insertFields, "numdays")
    insertValues <- c(insertValues, numdays)
  }

  statement <- paste0("INSERT INTO @source_schema.daysupply_modes (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
  invisible(statement);
}

add_entity <- function(code, description, filetype, category, data_fields, data1, data1lkup, data2, data2lkup, data3, data3lkup, data4, data4lkup, data5, data5lkup, data6, data6lkup, data7, data7lkup, data8, data8lkup) {
  defaults <- frameworkContext$defaultValues$entity;
  insertFields <- c()
  insertValues <- c()
  if (missing(code)) {
    code <- defaults$code
  }
  if (!is.null(code)) {
    insertFields <- c(insertFields, "code")
    insertValues <- c(insertValues, code)
  }

  if (missing(description)) {
    description <- defaults$description
  }
  if (!is.null(description)) {
    insertFields <- c(insertFields, "description")
    insertValues <- c(insertValues, description)
  }

  if (missing(filetype)) {
    filetype <- defaults$filetype
  }
  if (!is.null(filetype)) {
    insertFields <- c(insertFields, "filetype")
    insertValues <- c(insertValues, filetype)
  }

  if (missing(category)) {
    category <- defaults$category
  }
  if (!is.null(category)) {
    insertFields <- c(insertFields, "category")
    insertValues <- c(insertValues, category)
  }

  if (missing(data_fields)) {
    data_fields <- defaults$data_fields
  }
  if (!is.null(data_fields)) {
    insertFields <- c(insertFields, "data_fields")
    insertValues <- c(insertValues, data_fields)
  }

  if (missing(data1)) {
    data1 <- defaults$data1
  }
  if (!is.null(data1)) {
    insertFields <- c(insertFields, "data1")
    insertValues <- c(insertValues, data1)
  }

  if (missing(data1lkup)) {
    data1lkup <- defaults$data1lkup
  }
  if (!is.null(data1lkup)) {
    insertFields <- c(insertFields, "data1lkup")
    insertValues <- c(insertValues, data1lkup)
  }

  if (missing(data2)) {
    data2 <- defaults$data2
  }
  if (!is.null(data2)) {
    insertFields <- c(insertFields, "data2")
    insertValues <- c(insertValues, data2)
  }

  if (missing(data2lkup)) {
    data2lkup <- defaults$data2lkup
  }
  if (!is.null(data2lkup)) {
    insertFields <- c(insertFields, "data2lkup")
    insertValues <- c(insertValues, data2lkup)
  }

  if (missing(data3)) {
    data3 <- defaults$data3
  }
  if (!is.null(data3)) {
    insertFields <- c(insertFields, "data3")
    insertValues <- c(insertValues, data3)
  }

  if (missing(data3lkup)) {
    data3lkup <- defaults$data3lkup
  }
  if (!is.null(data3lkup)) {
    insertFields <- c(insertFields, "data3lkup")
    insertValues <- c(insertValues, data3lkup)
  }

  if (missing(data4)) {
    data4 <- defaults$data4
  }
  if (!is.null(data4)) {
    insertFields <- c(insertFields, "data4")
    insertValues <- c(insertValues, data4)
  }

  if (missing(data4lkup)) {
    data4lkup <- defaults$data4lkup
  }
  if (!is.null(data4lkup)) {
    insertFields <- c(insertFields, "data4lkup")
    insertValues <- c(insertValues, data4lkup)
  }

  if (missing(data5)) {
    data5 <- defaults$data5
  }
  if (!is.null(data5)) {
    insertFields <- c(insertFields, "data5")
    insertValues <- c(insertValues, data5)
  }

  if (missing(data5lkup)) {
    data5lkup <- defaults$data5lkup
  }
  if (!is.null(data5lkup)) {
    insertFields <- c(insertFields, "data5lkup")
    insertValues <- c(insertValues, data5lkup)
  }

  if (missing(data6)) {
    data6 <- defaults$data6
  }
  if (!is.null(data6)) {
    insertFields <- c(insertFields, "data6")
    insertValues <- c(insertValues, data6)
  }

  if (missing(data6lkup)) {
    data6lkup <- defaults$data6lkup
  }
  if (!is.null(data6lkup)) {
    insertFields <- c(insertFields, "data6lkup")
    insertValues <- c(insertValues, data6lkup)
  }

  if (missing(data7)) {
    data7 <- defaults$data7
  }
  if (!is.null(data7)) {
    insertFields <- c(insertFields, "data7")
    insertValues <- c(insertValues, data7)
  }

  if (missing(data7lkup)) {
    data7lkup <- defaults$data7lkup
  }
  if (!is.null(data7lkup)) {
    insertFields <- c(insertFields, "data7lkup")
    insertValues <- c(insertValues, data7lkup)
  }

  if (missing(data8)) {
    data8 <- defaults$data8
  }
  if (!is.null(data8)) {
    insertFields <- c(insertFields, "data8")
    insertValues <- c(insertValues, data8)
  }

  if (missing(data8lkup)) {
    data8lkup <- defaults$data8lkup
  }
  if (!is.null(data8lkup)) {
    insertFields <- c(insertFields, "data8lkup")
    insertValues <- c(insertValues, data8lkup)
  }

  statement <- paste0("INSERT INTO @source_schema.entity (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
  invisible(statement);
}

#add_hes_acp <- function(patid, spno, epikey, epistart, epiend, eorder, epidur, numacp, acpn, acpstar, acpend, acpdur, intdays, depdays, acploc, acpsour, acpdisp, acpout, acpplan, acpspef, orgsup, acpdqind) {
#  defaults <- frameworkContext$defaultValues$hes_acp;
#  insertFields <- c()
#  insertValues <- c()
#  if (missing(patid)) {
#    patid <- defaults$patid
#  }
#  if (!is.null(patid)) {
#    insertFields <- c(insertFields, "patid")
#    insertValues <- c(insertValues, patid)
#  }

#  if (missing(spno)) {
#    spno <- defaults$spno
#  }
#  if (!is.null(spno)) {
#    insertFields <- c(insertFields, "spno")
#    insertValues <- c(insertValues, spno)
#  }

#  if (missing(epikey)) {
#    epikey <- defaults$epikey
#  }
#  if (!is.null(epikey)) {
#    insertFields <- c(insertFields, "epikey")
#    insertValues <- c(insertValues, epikey)
#  }

#  if (missing(epistart)) {
#    epistart <- defaults$epistart
#  }
#  if (!is.null(epistart)) {
#    insertFields <- c(insertFields, "epistart")
#    insertValues <- c(insertValues, epistart)
#  }

#  if (missing(epiend)) {
#    epiend <- defaults$epiend
#  }
#  if (!is.null(epiend)) {
#    insertFields <- c(insertFields, "epiend")
#    insertValues <- c(insertValues, epiend)
#  }

#  if (missing(eorder)) {
#    eorder <- defaults$eorder
#  }
#  if (!is.null(eorder)) {
#    insertFields <- c(insertFields, "eorder")
#    insertValues <- c(insertValues, eorder)
#  }

#  if (missing(epidur)) {
#    epidur <- defaults$epidur
#  }
#  if (!is.null(epidur)) {
#    insertFields <- c(insertFields, "epidur")
#    insertValues <- c(insertValues, epidur)
#  }

#  if (missing(numacp)) {
#    numacp <- defaults$numacp
#  }
#  if (!is.null(numacp)) {
#    insertFields <- c(insertFields, "numacp")
#    insertValues <- c(insertValues, numacp)
#  }

#  if (missing(acpn)) {
#    acpn <- defaults$acpn
#  }
#  if (!is.null(acpn)) {
#    insertFields <- c(insertFields, "acpn")
#    insertValues <- c(insertValues, acpn)
#  }

#  if (missing(acpstar)) {
#    acpstar <- defaults$acpstar
#  }
#  if (!is.null(acpstar)) {
#    insertFields <- c(insertFields, "acpstar")
#    insertValues <- c(insertValues, acpstar)
#  }

#  if (missing(acpend)) {
#    acpend <- defaults$acpend
#  }
#  if (!is.null(acpend)) {
#    insertFields <- c(insertFields, "acpend")
#    insertValues <- c(insertValues, acpend)
#  }

#  if (missing(acpdur)) {
#    acpdur <- defaults$acpdur
#  }
#  if (!is.null(acpdur)) {
#    insertFields <- c(insertFields, "acpdur")
#    insertValues <- c(insertValues, acpdur)
#  }

#  if (missing(intdays)) {
#    intdays <- defaults$intdays
#  }
#  if (!is.null(intdays)) {
#    insertFields <- c(insertFields, "intdays")
#    insertValues <- c(insertValues, intdays)
#  }

#  if (missing(depdays)) {
#    depdays <- defaults$depdays
#  }
#  if (!is.null(depdays)) {
#    insertFields <- c(insertFields, "depdays")
#    insertValues <- c(insertValues, depdays)
#  }
#
#  if (missing(acploc)) {
#    acploc <- defaults$acploc
#  }
#  if (!is.null(acploc)) {
#    insertFields <- c(insertFields, "acploc")
#    insertValues <- c(insertValues, acploc)
#  }
#
#  if (missing(acpsour)) {
#    acpsour <- defaults$acpsour
#  }
#  if (!is.null(acpsour)) {
#    insertFields <- c(insertFields, "acpsour")
#    insertValues <- c(insertValues, acpsour)
#  }

#  if (missing(acpdisp)) {
#    acpdisp <- defaults$acpdisp
#  }
#  if (!is.null(acpdisp)) {
#    insertFields <- c(insertFields, "acpdisp")
#    insertValues <- c(insertValues, acpdisp)
#  }

#  if (missing(acpout)) {
#    acpout <- defaults$acpout
#  }
#  if (!is.null(acpout)) {
#    insertFields <- c(insertFields, "acpout")
#    insertValues <- c(insertValues, acpout)
#  }

#  if (missing(acpplan)) {
#    acpplan <- defaults$acpplan
#  }
#  if (!is.null(acpplan)) {
#    insertFields <- c(insertFields, "acpplan")
#    insertValues <- c(insertValues, acpplan)
#  }

#  if (missing(acpspef)) {
#    acpspef <- defaults$acpspef
#  }
#  if (!is.null(acpspef)) {
#    insertFields <- c(insertFields, "acpspef")
#    insertValues <- c(insertValues, acpspef)
#  }

#  if (missing(orgsup)) {
#    orgsup <- defaults$orgsup
#  }
#  if (!is.null(orgsup)) {
#    insertFields <- c(insertFields, "orgsup")
#    insertValues <- c(insertValues, orgsup)
#  }

#  if (missing(acpdqind)) {
#    acpdqind <- defaults$acpdqind
#  }
#  if (!is.null(acpdqind)) {
#    insertFields <- c(insertFields, "acpdqind")
#    insertValues <- c(insertValues, acpdqind)
#  }

#  statement <- paste0("INSERT INTO @source_schema.hes_acp (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
#  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
#  invisible(statement);
#}

#add_hes_ccare <- function(patid, spno, epikey, admidate, discharged, epistart, epiend, eorder, ccstartdate, ccstarttime, ccdisrdydate, ccdisrdytime, ccdisdate, ccdistime, ccadmitype, ccadmisorc, ccsorcloc, ccdisstat, ccdisdest, ccdisloc, cclev2days, cclev3days, bcardsupdays, acardsupdays, bressupdays, aressupdays, gisupdays, liversupdays, neurosupdays, rensupdays, dermsupdays, orgsupmax, ccunitfun, unitbedconfig, bestmatch, ccapcrel) {
#  defaults <- frameworkContext$defaultValues$hes_ccare;
#  insertFields <- c()
#  insertValues <- c()
#  if (missing(patid)) {
#    patid <- defaults$patid
#  }
#  if (!is.null(patid)) {
#    insertFields <- c(insertFields, "patid")
#    insertValues <- c(insertValues, patid)
#  }
#
#  if (missing(spno)) {
#    spno <- defaults$spno
#  }
#  if (!is.null(spno)) {
#    insertFields <- c(insertFields, "spno")
#    insertValues <- c(insertValues, spno)
#  }

#  if (missing(epikey)) {
#    epikey <- defaults$epikey
#  }
#  if (!is.null(epikey)) {
#    insertFields <- c(insertFields, "epikey")
#    insertValues <- c(insertValues, epikey)
#  }

#  if (missing(admidate)) {
#    admidate <- defaults$admidate
#  }
#  if (!is.null(admidate)) {
#    insertFields <- c(insertFields, "admidate")
#    insertValues <- c(insertValues, admidate)
#  }

#  if (missing(discharged)) {
#    discharged <- defaults$discharged
#  }
#  if (!is.null(discharged)) {
#    insertFields <- c(insertFields, "discharged")
#    insertValues <- c(insertValues, discharged)
#  }

#  if (missing(epistart)) {
#    epistart <- defaults$epistart
#  }
#  if (!is.null(epistart)) {
#    insertFields <- c(insertFields, "epistart")
#    insertValues <- c(insertValues, epistart)
#  }

#  if (missing(epiend)) {
#    epiend <- defaults$epiend
#  }
#  if (!is.null(epiend)) {
#    insertFields <- c(insertFields, "epiend")
#    insertValues <- c(insertValues, epiend)
#  }

#  if (missing(eorder)) {
#    eorder <- defaults$eorder
#  }
#  if (!is.null(eorder)) {
#    insertFields <- c(insertFields, "eorder")
#    insertValues <- c(insertValues, eorder)
#  }

#  if (missing(ccstartdate)) {
#    ccstartdate <- defaults$ccstartdate
#  }
#  if (!is.null(ccstartdate)) {
#    insertFields <- c(insertFields, "ccstartdate")
#    insertValues <- c(insertValues, ccstartdate)
#  }

#  if (missing(ccstarttime)) {
#    ccstarttime <- defaults$ccstarttime
#  }
#  if (!is.null(ccstarttime)) {
#    insertFields <- c(insertFields, "ccstarttime")
#    insertValues <- c(insertValues, ccstarttime)
#  }

#  if (missing(ccdisrdydate)) {
#    ccdisrdydate <- defaults$ccdisrdydate
#  }
#  if (!is.null(ccdisrdydate)) {
#    insertFields <- c(insertFields, "ccdisrdydate")
#    insertValues <- c(insertValues, ccdisrdydate)
#  }

#  if (missing(ccdisrdytime)) {
#    ccdisrdytime <- defaults$ccdisrdytime
#  }
#  if (!is.null(ccdisrdytime)) {
#    insertFields <- c(insertFields, "ccdisrdytime")
#    insertValues <- c(insertValues, ccdisrdytime)
#  }

#  if (missing(ccdisdate)) {
#    ccdisdate <- defaults$ccdisdate
#  }
#  if (!is.null(ccdisdate)) {
#    insertFields <- c(insertFields, "ccdisdate")
#    insertValues <- c(insertValues, ccdisdate)
#  }

#  if (missing(ccdistime)) {
#    ccdistime <- defaults$ccdistime
#  }
#  if (!is.null(ccdistime)) {
#    insertFields <- c(insertFields, "ccdistime")
#    insertValues <- c(insertValues, ccdistime)
#  }

#  if (missing(ccadmitype)) {
#    ccadmitype <- defaults$ccadmitype
#  }
#  if (!is.null(ccadmitype)) {
#    insertFields <- c(insertFields, "ccadmitype")
#    insertValues <- c(insertValues, ccadmitype)
#  }

#  if (missing(ccadmisorc)) {
#    ccadmisorc <- defaults$ccadmisorc
#  }
#  if (!is.null(ccadmisorc)) {
#    insertFields <- c(insertFields, "ccadmisorc")
#    insertValues <- c(insertValues, ccadmisorc)
#  }

#  if (missing(ccsorcloc)) {
#    ccsorcloc <- defaults$ccsorcloc
#  }
#  if (!is.null(ccsorcloc)) {
#    insertFields <- c(insertFields, "ccsorcloc")
#    insertValues <- c(insertValues, ccsorcloc)
#  }

#  if (missing(ccdisstat)) {
#    ccdisstat <- defaults$ccdisstat
#  }
#  if (!is.null(ccdisstat)) {
#    insertFields <- c(insertFields, "ccdisstat")
#    insertValues <- c(insertValues, ccdisstat)
#  }

#  if (missing(ccdisdest)) {
#    ccdisdest <- defaults$ccdisdest
#  }
#  if (!is.null(ccdisdest)) {
#    insertFields <- c(insertFields, "ccdisdest")
#    insertValues <- c(insertValues, ccdisdest)
#  }

#  if (missing(ccdisloc)) {
#    ccdisloc <- defaults$ccdisloc
#  }
#  if (!is.null(ccdisloc)) {
#    insertFields <- c(insertFields, "ccdisloc")
#    insertValues <- c(insertValues, ccdisloc)
#  }

#  if (missing(cclev2days)) {
#    cclev2days <- defaults$cclev2days
#  }
#  if (!is.null(cclev2days)) {
#    insertFields <- c(insertFields, "cclev2days")
#    insertValues <- c(insertValues, cclev2days)
#  }

#  if (missing(cclev3days)) {
#    cclev3days <- defaults$cclev3days
#  }
#  if (!is.null(cclev3days)) {
#    insertFields <- c(insertFields, "cclev3days")
#    insertValues <- c(insertValues, cclev3days)
#  }

#  if (missing(bcardsupdays)) {
#    bcardsupdays <- defaults$bcardsupdays
#  }
#  if (!is.null(bcardsupdays)) {
#    insertFields <- c(insertFields, "bcardsupdays")
#    insertValues <- c(insertValues, bcardsupdays)
#  }

#  if (missing(acardsupdays)) {
#    acardsupdays <- defaults$acardsupdays
#  }
#  if (!is.null(acardsupdays)) {
#    insertFields <- c(insertFields, "acardsupdays")
#    insertValues <- c(insertValues, acardsupdays)
#  }

#  if (missing(bressupdays)) {
#    bressupdays <- defaults$bressupdays
#  }
#  if (!is.null(bressupdays)) {
#    insertFields <- c(insertFields, "bressupdays")
#    insertValues <- c(insertValues, bressupdays)
#  }

#  if (missing(aressupdays)) {
#    aressupdays <- defaults$aressupdays
#  }
#  if (!is.null(aressupdays)) {
#    insertFields <- c(insertFields, "aressupdays")
#    insertValues <- c(insertValues, aressupdays)
#  }

#  if (missing(gisupdays)) {
#    gisupdays <- defaults$gisupdays
#  }
#  if (!is.null(gisupdays)) {
#    insertFields <- c(insertFields, "gisupdays")
#    insertValues <- c(insertValues, gisupdays)
#  }

#  if (missing(liversupdays)) {
#    liversupdays <- defaults$liversupdays
#  }
#  if (!is.null(liversupdays)) {
#    insertFields <- c(insertFields, "liversupdays")
#    insertValues <- c(insertValues, liversupdays)
#  }

#  if (missing(neurosupdays)) {
#    neurosupdays <- defaults$neurosupdays
#  }
#  if (!is.null(neurosupdays)) {
#    insertFields <- c(insertFields, "neurosupdays")
#    insertValues <- c(insertValues, neurosupdays)
#  }

#  if (missing(rensupdays)) {
#    rensupdays <- defaults$rensupdays
#  }
#  if (!is.null(rensupdays)) {
#    insertFields <- c(insertFields, "rensupdays")
#    insertValues <- c(insertValues, rensupdays)
#  }

#  if (missing(dermsupdays)) {
#    dermsupdays <- defaults$dermsupdays
#  }
#  if (!is.null(dermsupdays)) {
#    insertFields <- c(insertFields, "dermsupdays")
#    insertValues <- c(insertValues, dermsupdays)
#  }

#  if (missing(orgsupmax)) {
#    orgsupmax <- defaults$orgsupmax
#  }
#  if (!is.null(orgsupmax)) {
#    insertFields <- c(insertFields, "orgsupmax")
#    insertValues <- c(insertValues, orgsupmax)
#  }

#  if (missing(ccunitfun)) {
#    ccunitfun <- defaults$ccunitfun
#  }
#  if (!is.null(ccunitfun)) {
#    insertFields <- c(insertFields, "ccunitfun")
#    insertValues <- c(insertValues, ccunitfun)
#  }

#  if (missing(unitbedconfig)) {
#    unitbedconfig <- defaults$unitbedconfig
#  }
#  if (!is.null(unitbedconfig)) {
#    insertFields <- c(insertFields, "unitbedconfig")
#    insertValues <- c(insertValues, unitbedconfig)
#  }

#  if (missing(bestmatch)) {
#    bestmatch <- defaults$bestmatch
#  }
#  if (!is.null(bestmatch)) {
#    insertFields <- c(insertFields, "bestmatch")
#    insertValues <- c(insertValues, bestmatch)
#  }

#  if (missing(ccapcrel)) {
#    ccapcrel <- defaults$ccapcrel
#  }
#  if (!is.null(ccapcrel)) {
#    insertFields <- c(insertFields, "ccapcrel")
#    insertValues <- c(insertValues, ccapcrel)
#  }

#  statement <- paste0("INSERT INTO @source_schema.hes_ccare (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
#  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
#  invisible(statement);
#}

#add_hes_diagnosis_epi <- function(patid, spno, epikey, epistart, epiend, icd, icdx, d_order) {
#  defaults <- frameworkContext$defaultValues$hes_diagnosis_epi;
#  insertFields <- c()
#  insertValues <- c()
#  if (missing(patid)) {
#    patid <- defaults$patid
#  }
 # if (!is.null(patid)) {
#    insertFields <- c(insertFields, "patid")
#    insertValues <- c(insertValues, patid)
#  }

#  if (missing(spno)) {
#    spno <- defaults$spno
#  }
#  if (!is.null(spno)) {
#    insertFields <- c(insertFields, "spno")
#    insertValues <- c(insertValues, spno)
#  }

#  if (missing(epikey)) {
#    epikey <- defaults$epikey
#  }
#  if (!is.null(epikey)) {
#    insertFields <- c(insertFields, "epikey")
#    insertValues <- c(insertValues, epikey)
#  }

#  if (missing(epistart)) {
#    epistart <- defaults$epistart
#  }
#  if (!is.null(epistart)) {
#    insertFields <- c(insertFields, "epistart")
#    insertValues <- c(insertValues, epistart)
#  }

#  if (missing(epiend)) {
#    epiend <- defaults$epiend
#  }
#  if (!is.null(epiend)) {
#    insertFields <- c(insertFields, "epiend")
#    insertValues <- c(insertValues, epiend)
#  }

#  if (missing(icd)) {
#    icd <- defaults$icd
#  }
#  if (!is.null(icd)) {
#    insertFields <- c(insertFields, "icd")
#    insertValues <- c(insertValues, icd)
#  }

#  if (missing(icdx)) {
#    icdx <- defaults$icdx
#  }
#  if (!is.null(icdx)) {
#    insertFields <- c(insertFields, "icdx")
#    insertValues <- c(insertValues, icdx)
#  }

#  if (missing(d_order)) {
#    d_order <- defaults$d_order
#  }
#  if (!is.null(d_order)) {
#    insertFields <- c(insertFields, "d_order")
#    insertValues <- c(insertValues, d_order)
#  }

#  statement <- paste0("INSERT INTO @source_schema.hes_diagnosis_epi (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
#  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
#  invisible(statement);
#}

#add_hes_diagnosis_hosp <- function(patid, spno, admidate, discharged, icd, icdsx) {
#  defaults <- frameworkContext$defaultValues$hes_diagnosis_hosp;
#  insertFields <- c()
#  insertValues <- c()
#  if (missing(patid)) {
#    patid <- defaults$patid
#  }
#  if (!is.null(patid)) {
#    insertFields <- c(insertFields, "patid")
#    insertValues <- c(insertValues, patid)
#  }

#  if (missing(spno)) {
#    spno <- defaults$spno
#  }
#  if (!is.null(spno)) {
#    insertFields <- c(insertFields, "spno")
#    insertValues <- c(insertValues, spno)
#  }

#  if (missing(admidate)) {
#    admidate <- defaults$admidate
#  }
#  if (!is.null(admidate)) {
#    insertFields <- c(insertFields, "admidate")
#    insertValues <- c(insertValues, admidate)
#  }

#  if (missing(discharged)) {
#    discharged <- defaults$discharged
#  }
#  if (!is.null(discharged)) {
#    insertFields <- c(insertFields, "discharged")
#    insertValues <- c(insertValues, discharged)
#  }

#  if (missing(icd)) {
#    icd <- defaults$icd
#  }
#  if (!is.null(icd)) {
#    insertFields <- c(insertFields, "icd")
#    insertValues <- c(insertValues, icd)
#  }

#  if (missing(icdsx)) {
#    icdsx <- defaults$icdsx
#  }
#  if (!is.null(icdsx)) {
#    insertFields <- c(insertFields, "icdsx")
#    insertValues <- c(insertValues, icdsx)
#  }

#  statement <- paste0("INSERT INTO @source_schema.hes_diagnosis_hosp (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
#  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
#  invisible(statement);
#}

#add_hes_episodes <- function(patid, spno, epikey, admidate, epistart, epiend, discharged, eorder, epidur, epitype, admimeth, admisorc, disdest, dismeth, mainspef, tretspef, pconsult, intmanig, classpat, firstreg) {
#  defaults <- frameworkContext$defaultValues$hes_episodes;
#  insertFields <- c()
#  insertValues <- c()
#  if (missing(patid)) {
#    patid <- defaults$patid
#  }
#  if (!is.null(patid)) {
#    insertFields <- c(insertFields, "patid")
#    insertValues <- c(insertValues, patid)
#  }

#  if (missing(spno)) {
#    spno <- defaults$spno
#  }
#  if (!is.null(spno)) {
#    insertFields <- c(insertFields, "spno")
#    insertValues <- c(insertValues, spno)
#  }

#  if (missing(epikey)) {
#    epikey <- defaults$epikey
#  }
#  if (!is.null(epikey)) {
#    insertFields <- c(insertFields, "epikey")
#    insertValues <- c(insertValues, epikey)
#  }

#  if (missing(admidate)) {
#    admidate <- defaults$admidate
#  }
#  if (!is.null(admidate)) {
#    insertFields <- c(insertFields, "admidate")
#    insertValues <- c(insertValues, admidate)
#  }

#  if (missing(epistart)) {
#    epistart <- defaults$epistart
#  }
#  if (!is.null(epistart)) {
#    insertFields <- c(insertFields, "epistart")
#    insertValues <- c(insertValues, epistart)
#  }

#  if (missing(epiend)) {
#    epiend <- defaults$epiend
#  }
#  if (!is.null(epiend)) {
#    insertFields <- c(insertFields, "epiend")
#    insertValues <- c(insertValues, epiend)
#  }

#  if (missing(discharged)) {
#    discharged <- defaults$discharged
#  }
#  if (!is.null(discharged)) {
#    insertFields <- c(insertFields, "discharged")
#    insertValues <- c(insertValues, discharged)
#  }

#  if (missing(eorder)) {
#    eorder <- defaults$eorder
#  }
#  if (!is.null(eorder)) {
#    insertFields <- c(insertFields, "eorder")
#    insertValues <- c(insertValues, eorder)
#  }

#  if (missing(epidur)) {
#    epidur <- defaults$epidur
#  }
#  if (!is.null(epidur)) {
#    insertFields <- c(insertFields, "epidur")
#    insertValues <- c(insertValues, epidur)
#  }

#  if (missing(epitype)) {
#    epitype <- defaults$epitype
#  }
#  if (!is.null(epitype)) {
#    insertFields <- c(insertFields, "epitype")
#    insertValues <- c(insertValues, epitype)
#  }

#  if (missing(admimeth)) {
#    admimeth <- defaults$admimeth
#  }
#  if (!is.null(admimeth)) {
#    insertFields <- c(insertFields, "admimeth")
#    insertValues <- c(insertValues, admimeth)
#  }

#  if (missing(admisorc)) {
#    admisorc <- defaults$admisorc
#  }
#  if (!is.null(admisorc)) {
#    insertFields <- c(insertFields, "admisorc")
#    insertValues <- c(insertValues, admisorc)
#  }

#  if (missing(disdest)) {
#    disdest <- defaults$disdest
#  }
#  if (!is.null(disdest)) {
#    insertFields <- c(insertFields, "disdest")
#    insertValues <- c(insertValues, disdest)
#  }

#  if (missing(dismeth)) {
#    dismeth <- defaults$dismeth
#  }
#  if (!is.null(dismeth)) {
#    insertFields <- c(insertFields, "dismeth")
#    insertValues <- c(insertValues, dismeth)
#  }

#  if (missing(mainspef)) {
#    mainspef <- defaults$mainspef
#  }
#  if (!is.null(mainspef)) {
#    insertFields <- c(insertFields, "mainspef")
#    insertValues <- c(insertValues, mainspef)
#  }

#  if (missing(tretspef)) {
#    tretspef <- defaults$tretspef
#  }
#  if (!is.null(tretspef)) {
#    insertFields <- c(insertFields, "tretspef")
#    insertValues <- c(insertValues, tretspef)
#  }
#
#  if (missing(pconsult)) {
#    pconsult <- defaults$pconsult
#  }
#  if (!is.null(pconsult)) {
#    insertFields <- c(insertFields, "pconsult")
#    insertValues <- c(insertValues, pconsult)
#  }
#
#  if (missing(intmanig)) {
#    intmanig <- defaults$intmanig
#  }
#  if (!is.null(intmanig)) {
#    insertFields <- c(insertFields, "intmanig")
#    insertValues <- c(insertValues, intmanig)
#  }
#
#  if (missing(classpat)) {
#    classpat <- defaults$classpat
#  }
#  if (!is.null(classpat)) {
#    insertFields <- c(insertFields, "classpat")
#    insertValues <- c(insertValues, classpat)
#  }
#
#  if (missing(firstreg)) {
#    firstreg <- defaults$firstreg
#  }
#  if (!is.null(firstreg)) {
#    insertFields <- c(insertFields, "firstreg")
#    insertValues <- c(insertValues, firstreg)
#  }
#
#  statement <- paste0("INSERT INTO @source_schema.hes_episodes (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
#  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
#  invisible(statement);
#}

#add_hes_fielddefinitions <- function(fieldid, hes_fieldname, fieldname, description, class, lengthformat, availability, datacleaning, iscategorical) {
#  defaults <- frameworkContext$defaultValues$hes_fielddefinitions;
#  insertFields <- c()
#  insertValues <- c()
#  if (missing(fieldid)) {
#    fieldid <- defaults$fieldid
#  }
#  if (!is.null(fieldid)) {
#    insertFields <- c(insertFields, "fieldid")
#    insertValues <- c(insertValues, fieldid)
#  }
#
#  if (missing(hes_fieldname)) {
#    hes_fieldname <- defaults$hes_fieldname
#  }
#  if (!is.null(hes_fieldname)) {
#    insertFields <- c(insertFields, "hes_fieldname")
#    insertValues <- c(insertValues, hes_fieldname)
#  }
#
#  if (missing(fieldname)) {
#    fieldname <- defaults$fieldname
#  }
#  if (!is.null(fieldname)) {
#    insertFields <- c(insertFields, "fieldname")
#    insertValues <- c(insertValues, fieldname)
#  }
#
#  if (missing(description)) {
#    description <- defaults$description
#  }
#  if (!is.null(description)) {
#    insertFields <- c(insertFields, "description")
#    insertValues <- c(insertValues, description)
#  }
#
#  if (missing(class)) {
#    class <- defaults$class
#  }
#  if (!is.null(class)) {
#    insertFields <- c(insertFields, "class")
#    insertValues <- c(insertValues, class)
#  }
#
#  if (missing(lengthformat)) {
#    lengthformat <- defaults$lengthformat
#  }
#  if (!is.null(lengthformat)) {
#    insertFields <- c(insertFields, "lengthformat")
#    insertValues <- c(insertValues, lengthformat)
#  }
#
#  if (missing(availability)) {
#    availability <- defaults$availability
#  }
#  if (!is.null(availability)) {
#    insertFields <- c(insertFields, "availability")
#    insertValues <- c(insertValues, availability)
#  }
#
#  if (missing(datacleaning)) {
#    datacleaning <- defaults$datacleaning
#  }
#  if (!is.null(datacleaning)) {
#    insertFields <- c(insertFields, "datacleaning")
#    insertValues <- c(insertValues, datacleaning)
#  }
#
#  if (missing(iscategorical)) {
#    iscategorical <- defaults$iscategorical
#  }
#  if (!is.null(iscategorical)) {
#    insertFields <- c(insertFields, "iscategorical")
#    insertValues <- c(insertValues, iscategorical)
#  }
#
#  statement <- paste0("INSERT INTO @source_schema.hes_fielddefinitions (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
#  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
#  invisible(statement);
#}

#add_hes_fieldmappings <- function(mappingid, fieldid, value, description, condition) {
#  defaults <- frameworkContext$defaultValues$hes_fieldmappings;
#  insertFields <- c()
#  insertValues <- c()
#  if (missing(mappingid)) {
#    mappingid <- defaults$mappingid
#  }
#  if (!is.null(mappingid)) {
#    insertFields <- c(insertFields, "mappingid")
#    insertValues <- c(insertValues, mappingid)
#  }
#
#  if (missing(fieldid)) {
#    fieldid <- defaults$fieldid
#  }
#  if (!is.null(fieldid)) {
#    insertFields <- c(insertFields, "fieldid")
#    insertValues <- c(insertValues, fieldid)
#  }
#
#  if (missing(value)) {
#    value <- defaults$value
#  }
#  if (!is.null(value)) {
#    insertFields <- c(insertFields, "value")
#    insertValues <- c(insertValues, value)
#  }
#
#  if (missing(description)) {
#    description <- defaults$description
#  }
#  if (!is.null(description)) {
#    insertFields <- c(insertFields, "description")
#    insertValues <- c(insertValues, description)
#  }
#
#  if (missing(condition)) {
#    condition <- defaults$condition
#  }
#  if (!is.null(condition)) {
#    insertFields <- c(insertFields, "condition")
#    insertValues <- c(insertValues, condition)
#  }
#
#  statement <- paste0("INSERT INTO @source_schema.hes_fieldmappings (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
#  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
#  invisible(statement);
#}

#add_hes_hospital <- function(patid, spno, admidate, discharged, admimeth, admisorc, disdest, dismeth, duration, elecdate, elecdur) {
#  defaults <- frameworkContext$defaultValues$hes_hospital;
#  insertFields <- c()
#  insertValues <- c()
#  if (missing(patid)) {
#    patid <- defaults$patid
#  }
#  if (!is.null(patid)) {
#    insertFields <- c(insertFields, "patid")
#    insertValues <- c(insertValues, patid)
#  }
#
#  if (missing(spno)) {
#    spno <- defaults$spno
#  }
#  if (!is.null(spno)) {
#    insertFields <- c(insertFields, "spno")
#    insertValues <- c(insertValues, spno)
#  }
#
#  if (missing(admidate)) {
#    admidate <- defaults$admidate
#  }
#  if (!is.null(admidate)) {
#    insertFields <- c(insertFields, "admidate")
#    insertValues <- c(insertValues, admidate)
#  }
#
#  if (missing(discharged)) {
#    discharged <- defaults$discharged
#  }
#  if (!is.null(discharged)) {
#    insertFields <- c(insertFields, "discharged")
#    insertValues <- c(insertValues, discharged)
#  }
#
#  if (missing(admimeth)) {
#    admimeth <- defaults$admimeth
#  }
#  if (!is.null(admimeth)) {
#    insertFields <- c(insertFields, "admimeth")
#    insertValues <- c(insertValues, admimeth)
#  }
#
#  if (missing(admisorc)) {
#    admisorc <- defaults$admisorc
#  }
#  if (!is.null(admisorc)) {
#    insertFields <- c(insertFields, "admisorc")
#    insertValues <- c(insertValues, admisorc)
#  }
#
#  if (missing(disdest)) {
#    disdest <- defaults$disdest
#  }
#  if (!is.null(disdest)) {
#    insertFields <- c(insertFields, "disdest")
#    insertValues <- c(insertValues, disdest)
#  }
#
#  if (missing(dismeth)) {
#    dismeth <- defaults$dismeth
#  }
#  if (!is.null(dismeth)) {
#    insertFields <- c(insertFields, "dismeth")
#    insertValues <- c(insertValues, dismeth)
#  }
#
#  if (missing(duration)) {
#    duration <- defaults$duration
#  }
#  if (!is.null(duration)) {
#    insertFields <- c(insertFields, "duration")
#    insertValues <- c(insertValues, duration)
#  }
#
#  if (missing(elecdate)) {
#    elecdate <- defaults$elecdate
#  }
#  if (!is.null(elecdate)) {
#    insertFields <- c(insertFields, "elecdate")
#    insertValues <- c(insertValues, elecdate)
#  }
#
#  if (missing(elecdur)) {
#    elecdur <- defaults$elecdur
#  }
#  if (!is.null(elecdur)) {
#    insertFields <- c(insertFields, "elecdur")
#    insertValues <- c(insertValues, elecdur)
#  }
#
#  statement <- paste0("INSERT INTO @source_schema.hes_hospital (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
#  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
#  invisible(statement);
#}

#add_hes_hrg <- function(patid, epikey, spno, domproc, hrglate35, hrgnhs, hrgnhsvn, suscorehrg, sushrg, sushrgvers, hrglate, hes_yr) {
#  defaults <- frameworkContext$defaultValues$hes_hrg;
#  insertFields <- c()
#  insertValues <- c()
#  if (missing(patid)) {
#    patid <- defaults$patid
#  }
#  if (!is.null(patid)) {
#    insertFields <- c(insertFields, "patid")
#    insertValues <- c(insertValues, patid)
#  }

#  if (missing(epikey)) {
#    epikey <- defaults$epikey
#  }
#  if (!is.null(epikey)) {
#    insertFields <- c(insertFields, "epikey")
#    insertValues <- c(insertValues, epikey)
#  }
#
#  if (missing(spno)) {
#    spno <- defaults$spno
#  }
#  if (!is.null(spno)) {
#    insertFields <- c(insertFields, "spno")
#    insertValues <- c(insertValues, spno)
#  }
#
#  if (missing(domproc)) {
#    domproc <- defaults$domproc
#  }
#  if (!is.null(domproc)) {
#    insertFields <- c(insertFields, "domproc")
#    insertValues <- c(insertValues, domproc)
#  }
#
#  if (missing(hrglate35)) {
#    hrglate35 <- defaults$hrglate35
#  }
#  if (!is.null(hrglate35)) {
#    insertFields <- c(insertFields, "hrglate35")
#    insertValues <- c(insertValues, hrglate35)
#  }
#
#  if (missing(hrgnhs)) {
#    hrgnhs <- defaults$hrgnhs
#  }
#  if (!is.null(hrgnhs)) {
#    insertFields <- c(insertFields, "hrgnhs")
#    insertValues <- c(insertValues, hrgnhs)
#  }

#  if (missing(hrgnhsvn)) {
#    hrgnhsvn <- defaults$hrgnhsvn
#  }
#  if (!is.null(hrgnhsvn)) {
#    insertFields <- c(insertFields, "hrgnhsvn")
#    insertValues <- c(insertValues, hrgnhsvn)
#  }
#
#  if (missing(suscorehrg)) {
#    suscorehrg <- defaults$suscorehrg
#  }
#  if (!is.null(suscorehrg)) {
#    insertFields <- c(insertFields, "suscorehrg")
#    insertValues <- c(insertValues, suscorehrg)
#  }
#
#  if (missing(sushrg)) {
#    sushrg <- defaults$sushrg
#  }
#  if (!is.null(sushrg)) {
#    insertFields <- c(insertFields, "sushrg")
#    insertValues <- c(insertValues, sushrg)
#  }
#
#  if (missing(sushrgvers)) {
#    sushrgvers <- defaults$sushrgvers
#  }
#  if (!is.null(sushrgvers)) {
#    insertFields <- c(insertFields, "sushrgvers")
#    insertValues <- c(insertValues, sushrgvers)
#  }
#
#  if (missing(hrglate)) {
#    hrglate <- defaults$hrglate
#  }
#  if (!is.null(hrglate)) {
#    insertFields <- c(insertFields, "hrglate")
#    insertValues <- c(insertValues, hrglate)
#  }
#
#  if (missing(hes_yr)) {
#    hes_yr <- defaults$hes_yr
#  }
#  if (!is.null(hes_yr)) {
#    insertFields <- c(insertFields, "hes_yr")
#    insertValues <- c(insertValues, hes_yr)
#  }
#
#  statement <- paste0("INSERT INTO @source_schema.hes_hrg (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
#  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
#  invisible(statement);
#}

#add_hes_linkage_coverage <- function(data_source, start, end) {
#  defaults <- frameworkContext$defaultValues$hes_linkage_coverage;
#  insertFields <- c()
#  insertValues <- c()
#  if (missing(data_source)) {
#    data_source <- defaults$data_source
#  }
#  if (!is.null(data_source)) {
#    insertFields <- c(insertFields, "data_source")
#    insertValues <- c(insertValues, data_source)
#  }
#
#  if (missing(start)) {
#    start <- defaults$start
#  }
#  if (!is.null(start)) {
#    insertFields <- c(insertFields, "start")
#    insertValues <- c(insertValues, start)
#  }

#  if (missing(end)) {
#    end <- defaults$end
#  }
#  if (!is.null(end)) {
#    insertFields <- c(insertFields, "[end]")
#    insertValues <- c(insertValues, end)
#  }

#  statement <- paste0("INSERT INTO @source_schema.hes_linkage_coverage (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
#  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
#  invisible(statement);
#}

#add_hes_linkage_eligibility <- function(patid, pracid, linkdate, hes_e, death_e, cr_e, minap_e, lsoa_e) {
#  defaults <- frameworkContext$defaultValues$hes_linkage_eligibility;
#  insertFields <- c()
#  insertValues <- c()
#  if (missing(patid)) {
#    patid <- defaults$patid
#  }
#  if (!is.null(patid)) {
#    insertFields <- c(insertFields, "patid")
#    insertValues <- c(insertValues, patid)
#  }
#
#  if (missing(pracid)) {
#    pracid <- defaults$pracid
#  }
#  if (!is.null(pracid)) {
#    insertFields <- c(insertFields, "pracid")
#    insertValues <- c(insertValues, pracid)
#  }
#
#  if (missing(linkdate)) {
#    linkdate <- defaults$linkdate
#  }
#  if (!is.null(linkdate)) {
#    insertFields <- c(insertFields, "linkdate")
#    insertValues <- c(insertValues, linkdate)
#  }
#
#  if (missing(hes_e)) {
#    hes_e <- defaults$hes_e
#  }
#  if (!is.null(hes_e)) {
#    insertFields <- c(insertFields, "hes_e")
#    insertValues <- c(insertValues, hes_e)
#  }
#
#  if (missing(death_e)) {
#    death_e <- defaults$death_e
#  }
#  if (!is.null(death_e)) {
#    insertFields <- c(insertFields, "death_e")
#    insertValues <- c(insertValues, death_e)
#  }
#
#  if (missing(cr_e)) {
#    cr_e <- defaults$cr_e
#  }
#  if (!is.null(cr_e)) {
#    insertFields <- c(insertFields, "cr_e")
#    insertValues <- c(insertValues, cr_e)
#  }
#
#  if (missing(minap_e)) {
#    minap_e <- defaults$minap_e
#  }
#  if (!is.null(minap_e)) {
#    insertFields <- c(insertFields, "minap_e")
#    insertValues <- c(insertValues, minap_e)
#  }
#
#  if (missing(lsoa_e)) {
#    lsoa_e <- defaults$lsoa_e
#  }
#  if (!is.null(lsoa_e)) {
#    insertFields <- c(insertFields, "lsoa_e")
#    insertValues <- c(insertValues, lsoa_e)
#  }
#
#  statement <- paste0("INSERT INTO @source_schema.hes_linkage_eligibility (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
#  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
#  invisible(statement);
#}

#add_hes_linked_practices <- function(pracid) {
#  defaults <- frameworkContext$defaultValues$hes_linked_practices;
#  insertFields <- c()
#  insertValues <- c()
#  if (missing(pracid)) {
#    pracid <- defaults$pracid
#  }
#  if (!is.null(pracid)) {
#    insertFields <- c(insertFields, "pracid")
#    insertValues <- c(insertValues, pracid)
#  }
#
#  statement <- paste0("INSERT INTO @source_schema.hes_linked_practices (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
#  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
#  invisible(statement);
#}

#add_hes_maternity <- function(patid, spno, epikey, epistart, epiend, eorder, epidur, numbaby, numtailb, matordr, neocare, wellbaby, anasdate, birordr, birstat, biresus, sexbaby, birweit, delmeth, delonset, delinten, delplac, delchang, delprean, delposan, delstat, anagest, gestat, numpreg, matage, neodur, antedur, postdur) {
#  defaults <- frameworkContext$defaultValues$hes_maternity;
#  insertFields <- c()
#  insertValues <- c()
#  if (missing(patid)) {
#    patid <- defaults$patid
#  }
#  if (!is.null(patid)) {
#    insertFields <- c(insertFields, "patid")
#    insertValues <- c(insertValues, patid)
#  }
#
#  if (missing(spno)) {
#    spno <- defaults$spno
#  }
#  if (!is.null(spno)) {
#    insertFields <- c(insertFields, "spno")
#    insertValues <- c(insertValues, spno)
#  }
#  if (missing(epikey)) {
#    epikey <- defaults$epikey
#  }
#  if (!is.null(epikey)) {
#    insertFields <- c(insertFields, "epikey")
#    insertValues <- c(insertValues, epikey)
#  }
#
#  if (missing(epistart)) {
#    epistart <- defaults$epistart
#  }
#  if (!is.null(epistart)) {
#    insertFields <- c(insertFields, "epistart")
#    insertValues <- c(insertValues, epistart)
#  }
#
#  if (missing(epiend)) {
#    epiend <- defaults$epiend
#  }
#  if (!is.null(epiend)) {
#    insertFields <- c(insertFields, "epiend")
#    insertValues <- c(insertValues, epiend)
#  }
#
#  if (missing(eorder)) {
#    eorder <- defaults$eorder
#  }
#  if (!is.null(eorder)) {
#    insertFields <- c(insertFields, "eorder")
#    insertValues <- c(insertValues, eorder)
#  }
#
#
#  if (missing(epidur)) {
#    epidur <- defaults$epidur
#  }
#  if (!is.null(epidur)) {
#    insertFields <- c(insertFields, "epidur")
#    insertValues <- c(insertValues, epidur)
#  }
#
#  if (missing(numbaby)) {
#    numbaby <- defaults$numbaby
#  }
#  if (!is.null(numbaby)) {
#    insertFields <- c(insertFields, "numbaby")
#    insertValues <- c(insertValues, numbaby)
#  }
#
#  if (missing(numtailb)) {
#    numtailb <- defaults$numtailb
#  }
#  if (!is.null(numtailb)) {
#    insertFields <- c(insertFields, "numtailb")
#    insertValues <- c(insertValues, numtailb)
#  }
#
#  if (missing(matordr)) {
#    matordr <- defaults$matordr
#  }
#  if (!is.null(matordr)) {
#    insertFields <- c(insertFields, "matordr")
#    insertValues <- c(insertValues, matordr)
#  }
#
#  if (missing(neocare)) {
#    neocare <- defaults$neocare
#  }
#  if (!is.null(neocare)) {
#    insertFields <- c(insertFields, "neocare")
#    insertValues <- c(insertValues, neocare)
#  }
#
#  if (missing(wellbaby)) {
#    wellbaby <- defaults$wellbaby
#  }
#  if (!is.null(wellbaby)) {
#    insertFields <- c(insertFields, "wellbaby")
#    insertValues <- c(insertValues, wellbaby)
#  }
#
#  if (missing(anasdate)) {
#    anasdate <- defaults$anasdate
#  }
#  if (!is.null(anasdate)) {
#    insertFields <- c(insertFields, "anasdate")
#    insertValues <- c(insertValues, anasdate)
#  }
#
#  if (missing(birordr)) {
#    birordr <- defaults$birordr
#  }
#  if (!is.null(birordr)) {
#    insertFields <- c(insertFields, "birordr")
#    insertValues <- c(insertValues, birordr)
#  }
#
#  if (missing(birstat)) {
#    birstat <- defaults$birstat
#  }
 # if (!is.null(birstat)) {
#    insertFields <- c(insertFields, "birstat")
#    insertValues <- c(insertValues, birstat)
#  }
#
#  if (missing(biresus)) {
#    biresus <- defaults$biresus
#  }
#  if (!is.null(biresus)) {
#    insertFields <- c(insertFields, "biresus")
#    insertValues <- c(insertValues, biresus)
#  }
#
#  if (missing(sexbaby)) {
#    sexbaby <- defaults$sexbaby
#  }
#  if (!is.null(sexbaby)) {
#    insertFields <- c(insertFields, "sexbaby")
#    insertValues <- c(insertValues, sexbaby)
#  }

#  if (missing(birweit)) {
#    birweit <- defaults$birweit
#  }
#  if (!is.null(birweit)) {
#    insertFields <- c(insertFields, "birweit")
#    insertValues <- c(insertValues, birweit)
#  }
#
#  if (missing(delmeth)) {
#    delmeth <- defaults$delmeth
#  }
#  if (!is.null(delmeth)) {
#    insertFields <- c(insertFields, "delmeth")
#    insertValues <- c(insertValues, delmeth)
#  }
#
#  if (missing(delonset)) {
#    delonset <- defaults$delonset
#  }
#  if (!is.null(delonset)) {
#    insertFields <- c(insertFields, "delonset")
#    insertValues <- c(insertValues, delonset)
#  }
#
#  if (missing(delinten)) {
#    delinten <- defaults$delinten
#  }
#  if (!is.null(delinten)) {
#    insertFields <- c(insertFields, "delinten")
#    insertValues <- c(insertValues, delinten)
#  }
#
#  if (missing(delplac)) {
#    delplac <- defaults$delplac
#  }
#  if (!is.null(delplac)) {
#    insertFields <- c(insertFields, "delplac")
#    insertValues <- c(insertValues, delplac)
#  }
#
#  if (missing(delchang)) {
#    delchang <- defaults$delchang
#  }
#  if (!is.null(delchang)) {
#    insertFields <- c(insertFields, "delchang")
#    insertValues <- c(insertValues, delchang)
#  }
#
#  if (missing(delprean)) {
#    delprean <- defaults$delprean
#  }
#  if (!is.null(delprean)) {
#    insertFields <- c(insertFields, "delprean")
#    insertValues <- c(insertValues, delprean)
#  }
#
#  if (missing(delposan)) {
#    delposan <- defaults$delposan
#  }
#  if (!is.null(delposan)) {
#    insertFields <- c(insertFields, "delposan")
#    insertValues <- c(insertValues, delposan)
#  }
#
#  if (missing(delstat)) {
#    delstat <- defaults$delstat
#  }
#  if (!is.null(delstat)) {
#    insertFields <- c(insertFields, "delstat")
#    insertValues <- c(insertValues, delstat)
#  }
#
#  if (missing(anagest)) {
#    anagest <- defaults$anagest
#  }
#  if (!is.null(anagest)) {
#    insertFields <- c(insertFields, "anagest")
#    insertValues <- c(insertValues, anagest)
#  }
#
#  if (missing(gestat)) {
#    gestat <- defaults$gestat
#  }
#  if (!is.null(gestat)) {
#    insertFields <- c(insertFields, "gestat")
#    insertValues <- c(insertValues, gestat)
#  }
#
#  if (missing(numpreg)) {
#    numpreg <- defaults$numpreg
#  }
#  if (!is.null(numpreg)) {
#    insertFields <- c(insertFields, "numpreg")
#    insertValues <- c(insertValues, numpreg)
#  }
#
#  if (missing(matage)) {
#    matage <- defaults$matage
#  }
#  if (!is.null(matage)) {
#    insertFields <- c(insertFields, "matage")
#    insertValues <- c(insertValues, matage)
#  }
#
#  if (missing(neodur)) {
#    neodur <- defaults$neodur
#  }
#  if (!is.null(neodur)) {
#    insertFields <- c(insertFields, "neodur")
#    insertValues <- c(insertValues, neodur)
#  }
#
#  if (missing(antedur)) {
#    antedur <- defaults$antedur
#  }
#  if (!is.null(antedur)) {
#    insertFields <- c(insertFields, "antedur")
#    insertValues <- c(insertValues, antedur)
#  }
#
#  if (missing(postdur)) {
#    postdur <- defaults$postdur
#  }
#  if (!is.null(postdur)) {
#    insertFields <- c(insertFields, "postdur")
#    insertValues <- c(insertValues, postdur)
#  }
#
#  statement <- paste0("INSERT INTO @source_schema.hes_maternity (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
#  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
#  invisible(statement);
#}

#add_hes_patient <- function(patid, pracid, ethnos, gen_hesid, n_patid_hes, match_rank) {
#  defaults <- frameworkContext$defaultValues$hes_patient;
#  insertFields <- c()
#  insertValues <- c()
#  if (missing(patid)) {
#    patid <- defaults$patid
#  }
#  if (!is.null(patid)) {
#    insertFields <- c(insertFields, "patid")
#    insertValues <- c(insertValues, patid)
#  }
#
#  if (missing(pracid)) {
#    pracid <- defaults$pracid
#  }
#  if (!is.null(pracid)) {
#    insertFields <- c(insertFields, "pracid")
#    insertValues <- c(insertValues, pracid)
#  }
#
#  if (missing(ethnos)) {
#    ethnos <- defaults$ethnos
#  }
#  if (!is.null(ethnos)) {
#    insertFields <- c(insertFields, "ethnos")
#    insertValues <- c(insertValues, ethnos)
#  }
#
#  if (missing(gen_hesid)) {
#    gen_hesid <- defaults$gen_hesid
#  }
#  if (!is.null(gen_hesid)) {
#    insertFields <- c(insertFields, "gen_hesid")
#    insertValues <- c(insertValues, gen_hesid)
#  }
#
#  if (missing(n_patid_hes)) {
#    n_patid_hes <- defaults$n_patid_hes
#  }
#  if (!is.null(n_patid_hes)) {
#    insertFields <- c(insertFields, "n_patid_hes")
#    insertValues <- c(insertValues, n_patid_hes)
#  }
#
#  if (missing(match_rank)) {
#    match_rank <- defaults$match_rank
#  }
#  if (!is.null(match_rank)) {
#    insertFields <- c(insertFields, "match_rank")
#    insertValues <- c(insertValues, match_rank)
#  }
#
#  statement <- paste0("INSERT INTO @source_schema.hes_patient (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
#  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
#  invisible(statement);
#}

#add_hes_primary_diag_hosp <- function(patid, spno, admidate, discharged, icd, icdx) {
#  defaults <- frameworkContext$defaultValues$hes_primary_diag_hosp;
#  insertFields <- c()
#  insertValues <- c()
#  if (missing(patid)) {
#    patid <- defaults$patid
#  }
#  if (!is.null(patid)) {
#    insertFields <- c(insertFields, "patid")
#    insertValues <- c(insertValues, patid)
#  }
#
#  if (missing(spno)) {
#    spno <- defaults$spno
#  }
#  if (!is.null(spno)) {
#    insertFields <- c(insertFields, "spno")
#    insertValues <- c(insertValues, spno)
#  }
#
#  if (missing(admidate)) {
#    admidate <- defaults$admidate
#  }
#  if (!is.null(admidate)) {
#    insertFields <- c(insertFields, "admidate")
#    insertValues <- c(insertValues, admidate)
#  }
#
#  if (missing(discharged)) {
#    discharged <- defaults$discharged
#  }
#  if (!is.null(discharged)) {
#    insertFields <- c(insertFields, "discharged")
#    insertValues <- c(insertValues, discharged)
#  }
#
#  if (missing(icd)) {
#    icd <- defaults$icd
#  }
#  if (!is.null(icd)) {
#    insertFields <- c(insertFields, "icd")
#    insertValues <- c(insertValues, icd)
#  }
#
#  if (missing(icdx)) {
#    icdx <- defaults$icdx
#  }
#  if (!is.null(icdx)) {
#    insertFields <- c(insertFields, "icdx")
#    insertValues <- c(insertValues, icdx)
#  }
#
#  statement <- paste0("INSERT INTO @source_schema.hes_primary_diag_hosp (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
#  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
#  invisible(statement);
#}

#add_hes_procedures_epi <- function(patid, spno, epikey, admidate, epistart, epiend, discharged, opcs, evdate, p_order) {
#  defaults <- frameworkContext$defaultValues$hes_procedures_epi;
#  insertFields <- c()
#  insertValues <- c()
#  if (missing(patid)) {
#    patid <- defaults$patid
#  }
#  if (!is.null(patid)) {
#    insertFields <- c(insertFields, "patid")
#    insertValues <- c(insertValues, patid)
#  }
#
#  if (missing(spno)) {
#    spno <- defaults$spno
#  }
#  if (!is.null(spno)) {
#    insertFields <- c(insertFields, "spno")
#    insertValues <- c(insertValues, spno)
#  }
#
#  if (missing(epikey)) {
#    epikey <- defaults$epikey
#  }
#  if (!is.null(epikey)) {
#    insertFields <- c(insertFields, "epikey")
#    insertValues <- c(insertValues, epikey)
#  }
#
#  if (missing(admidate)) {
#    admidate <- defaults$admidate
#  }
#  if (!is.null(admidate)) {
#    insertFields <- c(insertFields, "admidate")
#    insertValues <- c(insertValues, admidate)
#  }
#
#  if (missing(epistart)) {
#    epistart <- defaults$epistart
#  }
#  if (!is.null(epistart)) {
#    insertFields <- c(insertFields, "epistart")
#    insertValues <- c(insertValues, epistart)
#  }
#
#  if (missing(epiend)) {
#    epiend <- defaults$epiend
#  }
#  if (!is.null(epiend)) {
#    insertFields <- c(insertFields, "epiend")
#    insertValues <- c(insertValues, epiend)
#  }
#
#  if (missing(discharged)) {
#    discharged <- defaults$discharged
#  }
#  if (!is.null(discharged)) {
#    insertFields <- c(insertFields, "discharged")
#    insertValues <- c(insertValues, discharged)
#  }
#
#  if (missing(opcs)) {
#    opcs <- defaults$opcs
#  }
#  if (!is.null(opcs)) {
#    insertFields <- c(insertFields, "opcs")
#    insertValues <- c(insertValues, opcs)
#  }
#
#  if (missing(evdate)) {
#    evdate <- defaults$evdate
#  }
#  if (!is.null(evdate)) {
#    insertFields <- c(insertFields, "evdate")
#    insertValues <- c(insertValues, evdate)
#  }
#
#  if (missing(p_order)) {
#    p_order <- defaults$p_order
#  }
 # if (!is.null(p_order)) {
#    insertFields <- c(insertFields, "p_order")
#    insertValues <- c(insertValues, p_order)
#  }
#
#  statement <- paste0("INSERT INTO @source_schema.hes_procedures_epi (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
#  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
#  invisible(statement);
#}

add_immunisation <- function(patid, eventdate, sysdate, constype, consid, medcode, staffid, textid, immstype, stage, status, compound, source, reason, method, batch) {
  defaults <- frameworkContext$defaultValues$immunisation;
  insertFields <- c()
  insertValues <- c()
  if (missing(patid)) {
    patid <- defaults$patid
  }
  if (!is.null(patid)) {
    insertFields <- c(insertFields, "patid")
    insertValues <- c(insertValues, patid)
  }

  if (missing(eventdate)) {
    eventdate <- defaults$eventdate
  }
  if (!is.null(eventdate)) {
    insertFields <- c(insertFields, "eventdate")
    insertValues <- c(insertValues, eventdate)
  }

  if (missing(sysdate)) {
    sysdate <- defaults$sysdate
  }
  if (!is.null(sysdate)) {
    insertFields <- c(insertFields, "sysdate")
    insertValues <- c(insertValues, sysdate)
  }

  if (missing(constype)) {
    constype <- defaults$constype
  }
  if (!is.null(constype)) {
    insertFields <- c(insertFields, "constype")
    insertValues <- c(insertValues, constype)
  }

  if (missing(consid)) {
    consid <- defaults$consid
  }
  if (!is.null(consid)) {
    insertFields <- c(insertFields, "consid")
    insertValues <- c(insertValues, consid)
  }

  if (missing(medcode)) {
    medcode <- defaults$medcode
  }
  if (!is.null(medcode)) {
    insertFields <- c(insertFields, "medcode")
    insertValues <- c(insertValues, medcode)
  }

  if (missing(staffid)) {
    staffid <- defaults$staffid
  }
  if (!is.null(staffid)) {
    insertFields <- c(insertFields, "staffid")
    insertValues <- c(insertValues, staffid)
  }

  if (missing(textid)) {
    textid <- defaults$textid
  }
  if (!is.null(textid)) {
    insertFields <- c(insertFields, "textid")
    insertValues <- c(insertValues, textid)
  }

  if (missing(immstype)) {
    immstype <- defaults$immstype
  }
  if (!is.null(immstype)) {
    insertFields <- c(insertFields, "immstype")
    insertValues <- c(insertValues, immstype)
  }

  if (missing(stage)) {
    stage <- defaults$stage
  }
  if (!is.null(stage)) {
    insertFields <- c(insertFields, "stage")
    insertValues <- c(insertValues, stage)
  }

  if (missing(status)) {
    status <- defaults$status
  }
  if (!is.null(status)) {
    insertFields <- c(insertFields, "status")
    insertValues <- c(insertValues, status)
  }

  if (missing(compound)) {
    compound <- defaults$compound
  }
  if (!is.null(compound)) {
    insertFields <- c(insertFields, "compound")
    insertValues <- c(insertValues, compound)
  }

  if (missing(source)) {
    source <- defaults$source
  }
  if (!is.null(source)) {
    insertFields <- c(insertFields, "source")
    insertValues <- c(insertValues, source)
  }

  if (missing(reason)) {
    reason <- defaults$reason
  }
  if (!is.null(reason)) {
    insertFields <- c(insertFields, "reason")
    insertValues <- c(insertValues, reason)
  }

  if (missing(method)) {
    method <- defaults$method
  }
  if (!is.null(method)) {
    insertFields <- c(insertFields, "method")
    insertValues <- c(insertValues, method)
  }

  if (missing(batch)) {
    batch <- defaults$batch
  }
  if (!is.null(batch)) {
    insertFields <- c(insertFields, "batch")
    insertValues <- c(insertValues, batch)
  }

  statement <- paste0("INSERT INTO @source_schema.immunisation (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
  invisible(statement);
}

add_lookup <- function(lookup_id, lookup_type_id, code, text) {
  defaults <- frameworkContext$defaultValues$lookup;
  insertFields <- c()
  insertValues <- c()
  if (missing(lookup_id)) {
    lookup_id <- defaults$lookup_id
  }
  if (!is.null(lookup_id)) {
    insertFields <- c(insertFields, "lookup_id")
    insertValues <- c(insertValues, lookup_id)
  }

  if (missing(lookup_type_id)) {
    lookup_type_id <- defaults$lookup_type_id
  }
  if (!is.null(lookup_type_id)) {
    insertFields <- c(insertFields, "lookup_type_id")
    insertValues <- c(insertValues, lookup_type_id)
  }

  if (missing(code)) {
    code <- defaults$code
  }
  if (!is.null(code)) {
    insertFields <- c(insertFields, "code")
    insertValues <- c(insertValues, code)
  }

  if (missing(text)) {
    text <- defaults$text
  }
  if (!is.null(text)) {
    insertFields <- c(insertFields, "text")
    insertValues <- c(insertValues, text)
  }

  statement <- paste0("INSERT INTO @source_schema.lookup (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
  invisible(statement);
}

add_lookuptype <- function(lookup_type_id, name, description) {
  defaults <- frameworkContext$defaultValues$lookuptype;
  insertFields <- c()
  insertValues <- c()
  if (missing(lookup_type_id)) {
    lookup_type_id <- defaults$lookup_type_id
  }
  if (!is.null(lookup_type_id)) {
    insertFields <- c(insertFields, "lookup_type_id")
    insertValues <- c(insertValues, lookup_type_id)
  }

  if (missing(name)) {
    name <- defaults$name
  }
  if (!is.null(name)) {
    insertFields <- c(insertFields, "name")
    insertValues <- c(insertValues, name)
  }

  if (missing(description)) {
    description <- defaults$description
  }
  if (!is.null(description)) {
    insertFields <- c(insertFields, "description")
    insertValues <- c(insertValues, description)
  }

  statement <- paste0("INSERT INTO @source_schema.lookuptype (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
  invisible(statement);
}

add_medical <- function(medcode, read_code, description) {
  defaults <- frameworkContext$defaultValues$medical;
  insertFields <- c()
  insertValues <- c()
  if (missing(medcode)) {
    medcode <- defaults$medcode
  }
  if (!is.null(medcode)) {
    insertFields <- c(insertFields, "medcode")
    insertValues <- c(insertValues, medcode)
  }

  if (missing(read_code)) {
    read_code <- defaults$read_code
  }
  if (!is.null(read_code)) {
    insertFields <- c(insertFields, "read_code")
    insertValues <- c(insertValues, read_code)
  }

  if (missing(description)) {
    description <- defaults$description
  }
  if (!is.null(description)) {
    insertFields <- c(insertFields, "description")
    insertValues <- c(insertValues, description)
  }

  statement <- paste0("INSERT INTO @source_schema.medical (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
  invisible(statement);
}

add_packtype <- function(packtype, packtype_desc) {
  defaults <- frameworkContext$defaultValues$packtype;
  insertFields <- c()
  insertValues <- c()
  if (missing(packtype)) {
    packtype <- defaults$packtype
  }
  if (!is.null(packtype)) {
    insertFields <- c(insertFields, "packtype")
    insertValues <- c(insertValues, packtype)
  }

  if (missing(packtype_desc)) {
    packtype_desc <- defaults$packtype_desc
  }
  if (!is.null(packtype_desc)) {
    insertFields <- c(insertFields, "packtype_desc")
    insertValues <- c(insertValues, packtype_desc)
  }

  statement <- paste0("INSERT INTO @source_schema.packtype (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
  invisible(statement);
}

add_patient <- function(patid, vmid, gender, yob, mob, marital, famnum, chsreg, chsdate, prescr, capsup, ses, frd, crd, regstat, reggap, internal, tod, toreason, deathdate, accept, pracid, birth_date, start_date, end_date) {
  defaults <- frameworkContext$defaultValues$patient;
  insertFields <- c()
  insertValues <- c()
  if (missing(patid)) {
    patid <- defaults$patid
  }
  if (!is.null(patid)) {
    insertFields <- c(insertFields, "patid")
    insertValues <- c(insertValues, patid)
  }

  if (missing(vmid)) {
    vmid <- defaults$vmid
  }
  if (!is.null(vmid)) {
    insertFields <- c(insertFields, "vmid")
    insertValues <- c(insertValues, vmid)
  }

  if (missing(gender)) {
    gender <- defaults$gender
  }
  if (!is.null(gender)) {
    insertFields <- c(insertFields, "gender")
    insertValues <- c(insertValues, gender)
  }

  if (missing(yob)) {
    yob <- defaults$yob
  }
  if (!is.null(yob)) {
    insertFields <- c(insertFields, "yob")
    insertValues <- c(insertValues, yob)
  }

  if (missing(mob)) {
    mob <- defaults$mob
  }
  if (!is.null(mob)) {
    insertFields <- c(insertFields, "mob")
    insertValues <- c(insertValues, mob)
  }

  if (missing(marital)) {
    marital <- defaults$marital
  }
  if (!is.null(marital)) {
    insertFields <- c(insertFields, "marital")
    insertValues <- c(insertValues, marital)
  }

  if (missing(famnum)) {
    famnum <- defaults$famnum
  }
  if (!is.null(famnum)) {
    insertFields <- c(insertFields, "famnum")
    insertValues <- c(insertValues, famnum)
  }

  if (missing(chsreg)) {
    chsreg <- defaults$chsreg
  }
  if (!is.null(chsreg)) {
    insertFields <- c(insertFields, "chsreg")
    insertValues <- c(insertValues, chsreg)
  }

  if (missing(chsdate)) {
    chsdate <- defaults$chsdate
  }
  if (!is.null(chsdate)) {
    insertFields <- c(insertFields, "chsdate")
    insertValues <- c(insertValues, chsdate)
  }

  if (missing(prescr)) {
    prescr <- defaults$prescr
  }
  if (!is.null(prescr)) {
    insertFields <- c(insertFields, "prescr")
    insertValues <- c(insertValues, prescr)
  }

  if (missing(capsup)) {
    capsup <- defaults$capsup
  }
  if (!is.null(capsup)) {
    insertFields <- c(insertFields, "capsup")
    insertValues <- c(insertValues, capsup)
  }

  if (missing(ses)) {
    ses <- defaults$ses
  }
  if (!is.null(ses)) {
    insertFields <- c(insertFields, "ses")
    insertValues <- c(insertValues, ses)
  }

  if (missing(frd)) {
    frd <- defaults$frd
  }
  if (!is.null(frd)) {
    insertFields <- c(insertFields, "frd")
    insertValues <- c(insertValues, frd)
  }

  if (missing(crd)) {
    crd <- defaults$crd
  }
  if (!is.null(crd)) {
    insertFields <- c(insertFields, "crd")
    insertValues <- c(insertValues, crd)
  }

  if (missing(regstat)) {
    regstat <- defaults$regstat
  }
  if (!is.null(regstat)) {
    insertFields <- c(insertFields, "regstat")
    insertValues <- c(insertValues, regstat)
  }

  if (missing(reggap)) {
    reggap <- defaults$reggap
  }
  if (!is.null(reggap)) {
    insertFields <- c(insertFields, "reggap")
    insertValues <- c(insertValues, reggap)
  }

  if (missing(internal)) {
    internal <- defaults$internal
  }
  if (!is.null(internal)) {
    insertFields <- c(insertFields, "internal")
    insertValues <- c(insertValues, internal)
  }

  if (missing(tod)) {
    tod <- defaults$tod
  }
  if (!is.null(tod)) {
    insertFields <- c(insertFields, "tod")
    insertValues <- c(insertValues, tod)
  }

  if (missing(toreason)) {
    toreason <- defaults$toreason
  }
  if (!is.null(toreason)) {
    insertFields <- c(insertFields, "toreason")
    insertValues <- c(insertValues, toreason)
  }

  if (missing(deathdate)) {
    deathdate <- defaults$deathdate
  }
  if (!is.null(deathdate)) {
    insertFields <- c(insertFields, "deathdate")
    insertValues <- c(insertValues, deathdate)
  }

  if (missing(accept)) {
    accept <- defaults$accept
  }
  if (!is.null(accept)) {
    insertFields <- c(insertFields, "accept")
    insertValues <- c(insertValues, accept)
  }

  if (missing(pracid)) {
    pracid <- defaults$pracid
  }
  if (!is.null(pracid)) {
    insertFields <- c(insertFields, "pracid")
    insertValues <- c(insertValues, pracid)
  }

  if (missing(birth_date)) {
    birth_date <- defaults$birth_date
  }
  if (!is.null(birth_date)) {
    insertFields <- c(insertFields, "birth_date")
    insertValues <- c(insertValues, birth_date)
  }

  if (missing(start_date)) {
    start_date <- defaults$start_date
  }
  if (!is.null(start_date)) {
    insertFields <- c(insertFields, "start_date")
    insertValues <- c(insertValues, start_date)
  }

  if (missing(end_date)) {
    end_date <- defaults$end_date
  }
  if (!is.null(end_date)) {
    insertFields <- c(insertFields, "end_date")
    insertValues <- c(insertValues, end_date)
  }

  statement <- paste0("INSERT INTO @source_schema.patient (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
  invisible(statement);
}

add_practice <- function(pracid, region, lcd, uts) {
  defaults <- frameworkContext$defaultValues$practice;
  insertFields <- c()
  insertValues <- c()
  if (missing(pracid)) {
    pracid <- defaults$pracid
  }
  if (!is.null(pracid)) {
    insertFields <- c(insertFields, "pracid")
    insertValues <- c(insertValues, pracid)
  }

  if (missing(region)) {
    region <- defaults$region
  }
  if (!is.null(region)) {
    insertFields <- c(insertFields, "region")
    insertValues <- c(insertValues, region)
  }

  if (missing(lcd)) {
    lcd <- defaults$lcd
  }
  if (!is.null(lcd)) {
    insertFields <- c(insertFields, "lcd")
    insertValues <- c(insertValues, lcd)
  }

  if (missing(uts)) {
    uts <- defaults$uts
  }
  if (!is.null(uts)) {
    insertFields <- c(insertFields, "uts")
    insertValues <- c(insertValues, uts)
  }

  statement <- paste0("INSERT INTO @source_schema.practice (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
  invisible(statement);
}

add_product <- function(prodcode, gemscriptcode, productname, drugsubstance, strength, formulation, route, bnf, bnf_with_dots, bnfchapter) {
  defaults <- frameworkContext$defaultValues$product;
  insertFields <- c()
  insertValues <- c()
  if (missing(prodcode)) {
    prodcode <- defaults$prodcode
  }
  if (!is.null(prodcode)) {
    insertFields <- c(insertFields, "prodcode")
    insertValues <- c(insertValues, prodcode)
  }

  if (missing(gemscriptcode)) {
    gemscriptcode <- defaults$gemscriptcode
  }
  if (!is.null(gemscriptcode)) {
    insertFields <- c(insertFields, "gemscriptcode")
    insertValues <- c(insertValues, gemscriptcode)
  }

  if (missing(productname)) {
    productname <- defaults$productname
  }
  if (!is.null(productname)) {
    insertFields <- c(insertFields, "productname")
    insertValues <- c(insertValues, productname)
  }

  if (missing(drugsubstance)) {
    drugsubstance <- defaults$drugsubstance
  }
  if (!is.null(drugsubstance)) {
    insertFields <- c(insertFields, "drugsubstance")
    insertValues <- c(insertValues, drugsubstance)
  }

  if (missing(strength)) {
    strength <- defaults$strength
  }
  if (!is.null(strength)) {
    insertFields <- c(insertFields, "strength")
    insertValues <- c(insertValues, strength)
  }

  if (missing(formulation)) {
    formulation <- defaults$formulation
  }
  if (!is.null(formulation)) {
    insertFields <- c(insertFields, "formulation")
    insertValues <- c(insertValues, formulation)
  }

  if (missing(route)) {
    route <- defaults$route
  }
  if (!is.null(route)) {
    insertFields <- c(insertFields, "route")
    insertValues <- c(insertValues, route)
  }

  if (missing(bnf)) {
    bnf <- defaults$bnf
  }
  if (!is.null(bnf)) {
    insertFields <- c(insertFields, "bnf")
    insertValues <- c(insertValues, bnf)
  }

  if (missing(bnf_with_dots)) {
    bnf_with_dots <- defaults$bnf_with_dots
  }
  if (!is.null(bnf_with_dots)) {
    insertFields <- c(insertFields, "bnf_with_dots")
    insertValues <- c(insertValues, bnf_with_dots)
  }

  if (missing(bnfchapter)) {
    bnfchapter <- defaults$bnfchapter
  }
  if (!is.null(bnfchapter)) {
    insertFields <- c(insertFields, "bnfchapter")
    insertValues <- c(insertValues, bnfchapter)
  }

  statement <- paste0("INSERT INTO @source_schema.product (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
  invisible(statement);
}

add_referral <- function(patid, eventdate, sysdate, constype, consid, medcode, staffid, textid, source, nhsspec, fhsaspec, inpatient, attendance, urgency) {
  defaults <- frameworkContext$defaultValues$referral;
  insertFields <- c()
  insertValues <- c()
  if (missing(patid)) {
    patid <- defaults$patid
  }
  if (!is.null(patid)) {
    insertFields <- c(insertFields, "patid")
    insertValues <- c(insertValues, patid)
  }

  if (missing(eventdate)) {
    eventdate <- defaults$eventdate
  }
  if (!is.null(eventdate)) {
    insertFields <- c(insertFields, "eventdate")
    insertValues <- c(insertValues, eventdate)
  }

  if (missing(sysdate)) {
    sysdate <- defaults$sysdate
  }
  if (!is.null(sysdate)) {
    insertFields <- c(insertFields, "sysdate")
    insertValues <- c(insertValues, sysdate)
  }

  if (missing(constype)) {
    constype <- defaults$constype
  }
  if (!is.null(constype)) {
    insertFields <- c(insertFields, "constype")
    insertValues <- c(insertValues, constype)
  }

  if (missing(consid)) {
    consid <- defaults$consid
  }
  if (!is.null(consid)) {
    insertFields <- c(insertFields, "consid")
    insertValues <- c(insertValues, consid)
  }

  if (missing(medcode)) {
    medcode <- defaults$medcode
  }
  if (!is.null(medcode)) {
    insertFields <- c(insertFields, "medcode")
    insertValues <- c(insertValues, medcode)
  }

  if (missing(staffid)) {
    staffid <- defaults$staffid
  }
  if (!is.null(staffid)) {
    insertFields <- c(insertFields, "staffid")
    insertValues <- c(insertValues, staffid)
  }

  if (missing(textid)) {
    textid <- defaults$textid
  }
  if (!is.null(textid)) {
    insertFields <- c(insertFields, "textid")
    insertValues <- c(insertValues, textid)
  }

  if (missing(source)) {
    source <- defaults$source
  }
  if (!is.null(source)) {
    insertFields <- c(insertFields, "source")
    insertValues <- c(insertValues, source)
  }

  if (missing(nhsspec)) {
    nhsspec <- defaults$nhsspec
  }
  if (!is.null(nhsspec)) {
    insertFields <- c(insertFields, "nhsspec")
    insertValues <- c(insertValues, nhsspec)
  }

  if (missing(fhsaspec)) {
    fhsaspec <- defaults$fhsaspec
  }
  if (!is.null(fhsaspec)) {
    insertFields <- c(insertFields, "fhsaspec")
    insertValues <- c(insertValues, fhsaspec)
  }

  if (missing(inpatient)) {
    inpatient <- defaults$inpatient
  }
  if (!is.null(inpatient)) {
    insertFields <- c(insertFields, "inpatient")
    insertValues <- c(insertValues, inpatient)
  }

  if (missing(attendance)) {
    attendance <- defaults$attendance
  }
  if (!is.null(attendance)) {
    insertFields <- c(insertFields, "attendance")
    insertValues <- c(insertValues, attendance)
  }

  if (missing(urgency)) {
    urgency <- defaults$urgency
  }
  if (!is.null(urgency)) {
    insertFields <- c(insertFields, "urgency")
    insertValues <- c(insertValues, urgency)
  }

  statement <- paste0("INSERT INTO @source_schema.referral (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
  invisible(statement);
}

add_scoringmethod <- function(code, scoring_method) {
  defaults <- frameworkContext$defaultValues$scoringmethod;
  insertFields <- c()
  insertValues <- c()
  if (missing(code)) {
    code <- defaults$code
  }
  if (!is.null(code)) {
    insertFields <- c(insertFields, "code")
    insertValues <- c(insertValues, code)
  }

  if (missing(scoring_method)) {
    scoring_method <- defaults$scoring_method
  }
  if (!is.null(scoring_method)) {
    insertFields <- c(insertFields, "scoring_method")
    insertValues <- c(insertValues, scoring_method)
  }

  statement <- paste0("INSERT INTO @source_schema.scoringmethod (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
  invisible(statement);
}

add_staff <- function(staffid, gender, role) {
  defaults <- frameworkContext$defaultValues$staff;
  insertFields <- c()
  insertValues <- c()
  if (missing(staffid)) {
    staffid <- defaults$staffid
  }
  if (!is.null(staffid)) {
    insertFields <- c(insertFields, "staffid")
    insertValues <- c(insertValues, staffid)
  }

  if (missing(gender)) {
    gender <- defaults$gender
  }
  if (!is.null(gender)) {
    insertFields <- c(insertFields, "gender")
    insertValues <- c(insertValues, gender)
  }

  if (missing(role)) {
    role <- defaults$role
  }
  if (!is.null(role)) {
    insertFields <- c(insertFields, "role")
    insertValues <- c(insertValues, role)
  }

  statement <- paste0("INSERT INTO @source_schema.staff (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
  invisible(statement);
}

add_test <- function(patid, eventdate, sysdate, constype, consid, medcode, staffid, textid, enttype, data1, data2, data3, data4, data5, data6, data7, data8_value, data8_date) {
  defaults <- frameworkContext$defaultValues$test;
  insertFields <- c()
  insertValues <- c()
  if (missing(patid)) {
    patid <- defaults$patid
  }
  if (!is.null(patid)) {
    insertFields <- c(insertFields, "patid")
    insertValues <- c(insertValues, patid)
  }

  if (missing(eventdate)) {
    eventdate <- defaults$eventdate
  }
  if (!is.null(eventdate)) {
    insertFields <- c(insertFields, "eventdate")
    insertValues <- c(insertValues, eventdate)
  }

  if (missing(sysdate)) {
    sysdate <- defaults$sysdate
  }
  if (!is.null(sysdate)) {
    insertFields <- c(insertFields, "sysdate")
    insertValues <- c(insertValues, sysdate)
  }

  if (missing(constype)) {
    constype <- defaults$constype
  }
  if (!is.null(constype)) {
    insertFields <- c(insertFields, "constype")
    insertValues <- c(insertValues, constype)
  }

  if (missing(consid)) {
    consid <- defaults$consid
  }
  if (!is.null(consid)) {
    insertFields <- c(insertFields, "consid")
    insertValues <- c(insertValues, consid)
  }

  if (missing(medcode)) {
    medcode <- defaults$medcode
  }
  if (!is.null(medcode)) {
    insertFields <- c(insertFields, "medcode")
    insertValues <- c(insertValues, medcode)
  }

  if (missing(staffid)) {
    staffid <- defaults$staffid
  }
  if (!is.null(staffid)) {
    insertFields <- c(insertFields, "staffid")
    insertValues <- c(insertValues, staffid)
  }

  if (missing(textid)) {
    textid <- defaults$textid
  }
  if (!is.null(textid)) {
    insertFields <- c(insertFields, "textid")
    insertValues <- c(insertValues, textid)
  }

  if (missing(enttype)) {
    enttype <- defaults$enttype
  }
  if (!is.null(enttype)) {
    insertFields <- c(insertFields, "enttype")
    insertValues <- c(insertValues, enttype)
  }

  if (missing(data1)) {
    data1 <- defaults$data1
  }
  if (!is.null(data1)) {
    insertFields <- c(insertFields, "data1")
    insertValues <- c(insertValues, data1)
  }

  if (missing(data2)) {
    data2 <- defaults$data2
  }
  if (!is.null(data2)) {
    insertFields <- c(insertFields, "data2")
    insertValues <- c(insertValues, data2)
  }

  if (missing(data3)) {
    data3 <- defaults$data3
  }
  if (!is.null(data3)) {
    insertFields <- c(insertFields, "data3")
    insertValues <- c(insertValues, data3)
  }

  if (missing(data4)) {
    data4 <- defaults$data4
  }
  if (!is.null(data4)) {
    insertFields <- c(insertFields, "data4")
    insertValues <- c(insertValues, data4)
  }

  if (missing(data5)) {
    data5 <- defaults$data5
  }
  if (!is.null(data5)) {
    insertFields <- c(insertFields, "data5")
    insertValues <- c(insertValues, data5)
  }

  if (missing(data6)) {
    data6 <- defaults$data6
  }
  if (!is.null(data6)) {
    insertFields <- c(insertFields, "data6")
    insertValues <- c(insertValues, data6)
  }

  if (missing(data7)) {
    data7 <- defaults$data7
  }
  if (!is.null(data7)) {
    insertFields <- c(insertFields, "data7")
    insertValues <- c(insertValues, data7)
  }

  if (missing(data8_value)) {
    data8_value <- defaults$data8_value
  }
  if (!is.null(data8_value)) {
    insertFields <- c(insertFields, "data8_value")
    insertValues <- c(insertValues, data8_value)
  }

  if (missing(data8_date)) {
    data8_date <- defaults$data8_date
  }
  if (!is.null(data8_date)) {
    insertFields <- c(insertFields, "data8_date")
    insertValues <- c(insertValues, data8_date)
  }

  statement <- paste0("INSERT INTO @source_schema.test (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
  invisible(statement);
}

add_therapy <- function(patid, eventdate, sysdate, consid, prodcode, staffid, textid, bnfcode, qty, ndd, numdays, numpacks, packtype, issueseq) {
  defaults <- frameworkContext$defaultValues$therapy;
  insertFields <- c()
  insertValues <- c()
  if (missing(patid)) {
    patid <- defaults$patid
  }
  if (!is.null(patid)) {
    insertFields <- c(insertFields, "patid")
    insertValues <- c(insertValues, patid)
  }

  if (missing(eventdate)) {
    eventdate <- defaults$eventdate
  }
  if (!is.null(eventdate)) {
    insertFields <- c(insertFields, "eventdate")
    insertValues <- c(insertValues, eventdate)
  }

  if (missing(sysdate)) {
    sysdate <- defaults$sysdate
  }
  if (!is.null(sysdate)) {
    insertFields <- c(insertFields, "sysdate")
    insertValues <- c(insertValues, sysdate)
  }

  if (missing(consid)) {
    consid <- defaults$consid
  }
  if (!is.null(consid)) {
    insertFields <- c(insertFields, "consid")
    insertValues <- c(insertValues, consid)
  }

  if (missing(prodcode)) {
    prodcode <- defaults$prodcode
  }
  if (!is.null(prodcode)) {
    insertFields <- c(insertFields, "prodcode")
    insertValues <- c(insertValues, prodcode)
  }

  if (missing(staffid)) {
    staffid <- defaults$staffid
  }
  if (!is.null(staffid)) {
    insertFields <- c(insertFields, "staffid")
    insertValues <- c(insertValues, staffid)
  }

  if (missing(textid)) {
    textid <- defaults$textid
  }
  if (!is.null(textid)) {
    insertFields <- c(insertFields, "textid")
    insertValues <- c(insertValues, textid)
  }

  if (missing(bnfcode)) {
    bnfcode <- defaults$bnfcode
  }
  if (!is.null(bnfcode)) {
    insertFields <- c(insertFields, "bnfcode")
    insertValues <- c(insertValues, bnfcode)
  }

  if (missing(qty)) {
    qty <- defaults$qty
  }
  if (!is.null(qty)) {
    insertFields <- c(insertFields, "qty")
    insertValues <- c(insertValues, qty)
  }

  if (missing(ndd)) {
    ndd <- defaults$ndd
  }
  if (!is.null(ndd)) {
    insertFields <- c(insertFields, "ndd")
    insertValues <- c(insertValues, ndd)
  }

  if (missing(numdays)) {
    numdays <- defaults$numdays
  }
  if (!is.null(numdays)) {
    insertFields <- c(insertFields, "numdays")
    insertValues <- c(insertValues, numdays)
  }

  if (missing(numpacks)) {
    numpacks <- defaults$numpacks
  }
  if (!is.null(numpacks)) {
    insertFields <- c(insertFields, "numpacks")
    insertValues <- c(insertValues, numpacks)
  }

  if (missing(packtype)) {
    packtype <- defaults$packtype
  }
  if (!is.null(packtype)) {
    insertFields <- c(insertFields, "packtype")
    insertValues <- c(insertValues, packtype)
  }

  if (missing(issueseq)) {
    issueseq <- defaults$issueseq
  }
  if (!is.null(issueseq)) {
    insertFields <- c(insertFields, "issueseq")
    insertValues <- c(insertValues, issueseq)
  }

  statement <- paste0("INSERT INTO @source_schema.therapy (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
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

