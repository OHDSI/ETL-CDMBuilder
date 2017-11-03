initFramework <- function() {
  insertDf <- data.frame(table = character(), sql = character(), stringsAsFactors = FALSE)
  insertDf[nrow(insertDf) + 1,] <- c('@nativeDatabaseSchema.lab_results', 'TRUNCATE TABLE @nativeDatabaseSchema.lab_results;')
  insertDf[nrow(insertDf) + 1,] <- c('@nativeDatabaseSchema.member_detail', 'TRUNCATE TABLE @nativeDatabaseSchema.member_detail;')
  insertDf[nrow(insertDf) + 1,] <- c('@nativeDatabaseSchema.cost_factor', 'TRUNCATE TABLE @nativeDatabaseSchema.cost_factor;')
  insertDf[nrow(insertDf) + 1,] <- c('@nativeDatabaseSchema.medical_claims', 'TRUNCATE TABLE @nativeDatabaseSchema.medical_claims;')
  insertDf[nrow(insertDf) + 1,] <- c('@nativeDatabaseSchema.provider_bridge', 'TRUNCATE TABLE @nativeDatabaseSchema.provider_bridge;')
  insertDf[nrow(insertDf) + 1,] <- c('@nativeDatabaseSchema.provider', 'TRUNCATE TABLE @nativeDatabaseSchema.provider;')
  insertDf[nrow(insertDf) + 1,] <- c('@nativeDatabaseSchema.med_diagnosis', 'TRUNCATE TABLE @nativeDatabaseSchema.med_diagnosis;')
  
  insertDf[nrow(insertDf) + 1,] <- c('@nativeDatabaseSchema.facility_detail', 'TRUNCATE TABLE @nativeDatabaseSchema.facility_detail;')
  insertDf[nrow(insertDf) + 1,] <- c('@nativeDatabaseSchema.rx_claims', 'TRUNCATE TABLE @nativeDatabaseSchema.rx_claims;')
  insertDf[nrow(insertDf) + 1,] <- c('@nativeDatabaseSchema.med_procedure', 'TRUNCATE TABLE @nativeDatabaseSchema.med_procedure;')
  insertDf[nrow(insertDf) + 1,] <- c('@nativeDatabaseSchema.inpatient_confinement', 'TRUNCATE TABLE @nativeDatabaseSchema.inpatient_confinement;')
  insertDf[nrow(insertDf) + 1,] <- c('@nativeDatabaseSchema.member', 'TRUNCATE TABLE @nativeDatabaseSchema.member;')
  insertDf[nrow(insertDf) + 1,] <- c('@nativeDatabaseSchema.hra', 'TRUNCATE TABLE @nativeDatabaseSchema.hra;')
  
  if (tolower(Sys.getenv("extendedType")) == "dod")
  {
    insertDf[nrow(insertDf) + 1,] <- c('@nativeDatabaseSchema.death', 'TRUNCATE TABLE @nativeDatabaseSchema.death;')
  }
  else if (tolower(Sys.getenv("extendedType")) == "ses")
  {
    insertDf[nrow(insertDf) + 1,] <- c('@nativeDatabaseSchema.ses', 'TRUNCATE TABLE @nativeDatabaseSchema.ses;')
  }
  assign('insertDf', insertDf, envir = globalenv())
  testSql <- c()
  testSql <- c(testSql, "IF OBJECT_ID('@cdmDatabaseSchema.test_results', 'U') IS NOT NULL DROP TABLE @cdmDatabaseSchema.test_results;")
  testSql <- c(testSql, '')
  testSql <- c(testSql, "CREATE TABLE @cdmDatabaseSchema.test_results (id INT, description VARCHAR(512), test VARCHAR(256), source_pid VARCHAR(50), cdm_pid int, status VARCHAR(5));")
  testSql <- c(testSql, '')
  assign('testSql', testSql, envir = globalenv())
  assign('testId', 1, envir = globalenv())
  assign('testDescription', '', envir = globalenv())
  
  defaultValues <- new.env(parent = globalenv())
  assign('defaultValues', defaultValues, envir = globalenv())
  
  defaults <- list()
  defaults$patid <- '33062334062'
  defaults$pat_planid <- '53199538800'
  defaults$anlytseq <- '01'
  defaults$fst_dt <- '2017-01-04'
  defaults$hi_nrml <- '0.0000'
  defaults$loinc_cd <- 'UNLOINC'
  defaults$low_nrml <- '0.0000'
  defaults$rslt_nbr <- '0.000000'
  defaults$source <- 'LC'
  defaults$extract_ym <- '201611'
  defaults$version <- '7.0'
  assign('lab_results', defaults, envir = defaultValues)
  
  defaults <- list()
  defaults$gdr_cd <- 'F'
  defaults$eligeff <- '2000-05-01'
  defaults$eligend <- '2017-06-30'
  defaults$yrdob <- '1927'
  defaults$aso <- 'N'
  defaults$bus <- 'COM'
  defaults$product <- 'POS'
  defaults$cdhp <- '3'
  defaults$group_nbr <- '000702030'
  defaults$health_exch <- '0'
  defaults$lis <- ' '
  defaults$state <- 'CA'
  defaults$division <- "SOUTH ATLANTIC"
  defaults$extract_ym <- '201709'
  defaults$version <- '7.1'
  assign('member_detail', defaults, envir = defaultValues)
  
  defaults <- list()
  defaults$tos <- 'PRF'
  defaults$tos_desc <- 'Facility Outpatient'
  assign('cost_factor', defaults, envir = defaultValues)
  
  defaults <- list()
  defaults$proc_cd <- '99213'
  defaults$pos <- '11'
  defaults$icd_flag <- '9'
  defaults$prov <- '4777572248'
  defaults$provcat <- '0001'
  defaults$fst_dt <- '2016-09-26'
  defaults$admit_type <- ' '
  defaults$bill_prov <- '0'
  defaults$charge <- '0.00'
  defaults$clmseq <- '001'
  defaults$coins <- '0.00'
  defaults$copay <- '0.00'
  defaults$deduct <- '0.00'
  defaults$units <- '1'
  defaults$enctr <- '0'
  defaults$hccc <- '07'
  defaults$loc_cd <- '2'
  defaults$paid_dt <- '2016-05-23'
  defaults$paid_status <- 'P '
  defaults$procmod <- 'UNK'
  defaults$prov_par <- 'P'
  defaults$refer_prov <- '0'
  defaults$service_prov <- '0'
  defaults$std_cost <- '0.00'
  defaults$std_cost_yr <- '2015'
  defaults$tos_cd <- 'PROF.LAB'
  defaults$extract_ym <- '201709'
  defaults$version <- '7.1'
  assign('medical_claims', defaults, envir = defaultValues)
  
  defaults <- list()
  defaults$prov_unique <- '0'
  defaults$extract_ym <- '201709'
  defaults$version <- '7.1'
  assign('provider_bridge', defaults, envir = defaultValues)
  
  defaults <- list()
  defaults$prov_state <- 'CA'
  defaults$prov_type <- '1'
  defaults$provcat <- '5991'
  defaults$taxonomy1 <- '207R00000X'
  defaults$extract_ym <- '201709'
  defaults$version <- '7.1'
  assign('provider', defaults, envir = defaultValues)
  
  defaults <- list()
  defaults$icd_flag <- '9'
  defaults$diag <- '4019'
  defaults$diag_position <- '01'
  defaults$loc_cd <- '2'
  defaults$poa <- 'U'
  defaults$extract_ym <- '201709'
  defaults$version <- '7.1'

  assign('med_diagnosis', defaults, envir = defaultValues)
  
  defaults <- list()
  defaults$ymdod <- '201101'
  defaults$version <- '201709'
  defaults$extract_ym <- '7.1'
  assign('death', defaults, envir = defaultValues)
  
  defaults <- list()
  defaults$patid <- '33006343289'
  defaults$pat_planid <- '53047365359'
  defaults$charge_alloc <- '0.00'
  defaults$clmseq <- '001'
  defaults$detail_line_nbr <- '01'
  defaults$fst_dt <- '2007-10-01'
  defaults$procmod <- 'UNK'
  defaults$rvnu_cd <- '0300'
  defaults$std_cost <- '0.00'
  defaults$std_cost_yr <- '2015'
  defaults$units <- '1'
  defaults$extract_ym <- '201709'
  defaults$version <- '7.1'
  assign('facility_detail', defaults, envir = defaultValues)
  
  defaults <- list()
  defaults$ahfsclss <- '24060800'
  defaults$avgwhlsl <- '0.00'
  defaults$brnd_nm <- 'LISINOPRIL'
  defaults$charge <- '0.00'
  defaults$chk_dt <- '1900-01-01'
  defaults$copay <- '10.00'
  defaults$daw <- '0'
  defaults$days_sup <- '30'
  defaults$deduct <- '0.00'
  defaults$dispfee <- '1.50'
  defaults$fill_dt <- '2016-09-06'
  defaults$form_ind <- 'Y'
  defaults$form_typ <- '2'
  defaults$fst_fill <- 'Y'
  defaults$gnrc_ind <- 'Y'
  defaults$gnrc_nm <- 'LEVOTHYROXINE SODIUM'
  defaults$ndc <- '00071015523'
  defaults$mail_ind <- 'N'
  defaults$pharm <- '100016067'
  defaults$prc_typ <- '9'
  defaults$quantity <- '30.000'
  defaults$rfl_nbr <- '00'
  defaults$spclt_ind <- 'N'
  defaults$specclss <- 'H3A'
  defaults$std_cost <- '0.00'
  defaults$std_cost_yr <- '2013'
  defaults$strength <- '10 MG'
  defaults$extract_ym <- '201611'
  defaults$version <- '7.0'
  defaults$gpi <- '03400010000320'
  assign('rx_claims', defaults, envir = defaultValues)
  
  defaults <- list()
  defaults$patid <- '33013107924'
  defaults$pat_planid <- '53050135093'
  defaults$proc <- '9999'
  defaults$icd_flag <- '9'
  defaults$proc_position <- '01'
  defaults$extract_ym <- '201709'
  defaults$version <- '7.1'
  assign('med_procedure', defaults, envir = defaultValues)
  
  defaults <- list()
  defaults$admit_date <- '2013-02-01'
  defaults$charge <- '0.00'
  defaults$coins <- '0.00'
  defaults$copay <- '0.00'
  defaults$deduct <- '0.00'
  defaults$diag1 <- 'V3000'
  defaults$disch_date <- '2017-06-30'
  defaults$dstatus <- '01'
  defaults$icd_flag <- '9'
  defaults$ipstatus <- 'N'
  defaults$los <- '2'
  defaults$pos <- '21'
  defaults$proc1 <- '0000000'
  defaults$proc2 <- '0000000'
  defaults$proc3 <- '0000000'
  defaults$proc4 <- '0000000'
  defaults$proc5 <- '0000000'
  defaults$prov <- '2771664514'
  defaults$std_cost <- '0.00'
  defaults$std_cost_yr <- '2015'
  defaults$tos_cd <- 'FAC_IP.ACUTE'
  defaults$extract_ym <- '201709'
  defaults$version <- '7.1'
  assign('inpatient_confinement', defaults, envir = defaultValues)
  
  defaults <- list()
  defaults$aso <- 'N'
  defaults$bus <- 'COM'
  defaults$cdhp <- '3'
  defaults$eligeff <- '2000-05-01'
  defaults$eligend <- '2017-06-30'
  defaults$gdr_cd <- 'F'
  defaults$group_nbr <- '000701648'
  defaults$health_exch <- '0'
  defaults$product <- 'POS'
  defaults$state <- 'TX'
  defaults$yrdob <- '1927'
  defaults$extract_ym <- '201709'
  defaults$version <- '7.1'
  assign('member', defaults, envir = defaultValues)
  
  defaults <- list()
  defaults$diag_desc <- 'UNKNOWN DIAGNOSIS'
  defaults$diag_fst3_cd <- 'S82'
  defaults$diag_fst3_desc <- 'UNKNOWN DIAGNOSIS'
  defaults$diag_fst4_desc <- 'UNKNOWN DIAGNOSIS'
  defaults$gdr_spec_cd <- 'f'
  defaults$mdc_cd_desc <- 'UNKNOWN MAJOR DIAGNOSTIC CATEGORY'
  defaults$mdc_code <- '00'
  defaults$icd_ver_cd <- '9 '
  assign('lu_diagnosis', defaults, envir = defaultValues)
  
  defaults <- list()
  defaults$ahfsclss <- 'UNK'
  defaults$ahfsclss_desc <- 'UNKNOWN'
  defaults$dosage_fm_desc <- 'TABLET'
  defaults$drg_strgth_nbr <- '0.0'
  defaults$drg_strgth_unit_desc <- 'mg'
  defaults$drg_strgth_vol_nbr <- '0.0'
  defaults$gnrc_ind <- '1'
  defaults$gnrc_nbr <- '094200'
  defaults$gnrc_sqnc_nbr <- '000000'
  defaults$ndc_drg_row_eff_dt <- '1900-01-01'
  defaults$ndc_drg_row_end_dt <- '9999-12-31'
  defaults$usc_id <- '     '
  assign('lu_ndc', defaults, envir = defaultValues)
  
  defaults <- list()
  defaults$category_dtl_cd <- '999  '
  defaults$category_dtl_code_desc <- 'NOT ASSIGNED'
  defaults$category_genl_cd <- '16   '
  defaults$category_genl_cd_desc <- 'MISC DIAG THERAPEUTIC'
  defaults$proc_desc <- 'UNKNOWN PROCEDURE'
  defaults$proc_end_date <- '9999-12-31'
  defaults$proc_typ_cd <- 'UNKN '
  assign('lu_procedure', defaults, envir = defaultValues)
  
  defaults <- list()
  defaults$h_chronic_pain <- '0'
  defaults$h_height <- '64.00'
  defaults$h_smoking_status <- '3'
  defaults$h_weight <- '180.00'
  defaults$hra_compltd_dt <- '2014-10-01'
  defaults$isa10008 <- 'None of the time'
  defaults$isa1006 <- '0'
  defaults$isa13021 <- 'No'
  defaults$isa13023 <- 'No'
  defaults$isa13040 <- 'No'
  defaults$isa16010 <- 'Slightly'
  defaults$isa17001 <- 'Never Used'
  defaults$isa17015 <- 'Never Used'
  defaults$isa17023 <- 'Never Used'
  defaults$isa19004 <- 'Good'
  defaults$isa19005 <- 'Good'
  defaults$isa20061 <- 'Married or Cohabiting'
  defaults$isa20064 <- 'Unknown'
  defaults$isa20069 <- 'No, I Do not Have This Condition'
  defaults$isa20072 <- 'No, I Do not Have This Condition'
  defaults$isa21001 <- 'None of the time'
  defaults$isa21003 <- 'None of the time'
  defaults$isa21009 <- 'None of the time'
  defaults$isa21015 <- 'None of the time'
  defaults$isa21020 <- 'None of the time'
  defaults$isa21021 <- 'None of the time'
  defaults$isa21025 <- 'None of the time'
  defaults$isa3010 <- 'Yes'
  defaults$isa5001 <- 'Very Good'
  defaults$isa5004 <- 'No Response'
  defaults$isa5010 <- 'No'
  defaults$isa5018 <- 'No Response'
  defaults$isa7018 <- 'No'
  defaults$isa8016 <- '1-2'
  defaults$extract_ym <- '201709'
  defaults$version <- '7.1'
  assign('hra', defaults, envir = defaultValues)
  
  defaults <- list()
  assign('_version', defaults, envir = defaultValues)
  
  defaults <- list()
  defaults$dt_start <- '2009-03-06'
  defaults$dt_end <- '2017-06-30'
  defaults$visit_type <- 'ER'
  assign('_pos_episode_visit', defaults, envir = defaultValues)
  
  defaults <- list()
  defaults$d_education_level_code <- "C"
  defaults$d_fed_poverty_status_code <- "A"
  defaults$d_home_ownership_code <- "1"
  defaults$d_household_income_range_code <- "0"
  defaults$d_networth_range_code <- "2"
  defaults$d_occupation_type_code <- "U"
  defaults$d_race_code <- "W "
  defaults$num_adults <- "2"
  defaults$version <- "6.0"
  defaults$extract_ym <- "201606"
  assign('ses', defaults, envir = defaultValues)
}



#initFramework()

generateInsertSql <- function()
{
  insertSql <<- c()
  tables <- unique(insertDf$table)
  lapply(tables, function(t) {
    insertSql <<- c(insertSql, subset(insertDf, table == t)$sql)
  })
  insertSql
}

declareTest <- function(description, source_pid = NULL, cdm_pid = NULL) {
  testId <- 0
  if (exists('testId', where = globalenv()))
  {
    testId <- get('testId', envir = globalenv())  
  }
  
  assign('testId', testId + 1, envir = globalenv()) 
  assign('testDescription', description, envir = globalenv()) 
  assign('testNewAdded', TRUE, envir = globalenv()) 
  assign('testNewExpected', TRUE, envir = globalenv()) 
  
  assign('source_pid', source_pid, envir = globalenv())
  assign('cdm_pid', cdm_pid, envir = globalenv())
  
  groupItemIndex <- 0
  if (exists('groupItemIndex', where = globalenv()))
  {
    groupItemIndex <- get("groupItemIndex", envir = globalenv())
  }
  assign('groupItemIndex', groupItemIndex + 1, envir = globalenv())
}

declareTestGroup <- function(groupName) 
{
  groupIndex <- 0
  if (exists('groupIndex', where = globalenv()))
  {
    groupIndex <- get("groupIndex", envir = globalenv())
  }
  assign('groupIndex', groupIndex + 1, envir = globalenv())
  assign('currentGroup', groupName, envir = globalenv())
  assign('groupItemIndex', -1, envir = globalenv())
}

set_defaults_ses <- function(patid, d_education_level_code, d_fed_poverty_status_code, d_home_ownership_code, d_household_income_range_code, d_networth_range_code, d_occupation_type_code, d_race_code, child_age_0002_code, child_age_0305_code, child_age_0610_code, child_age_1115_code, child_age_1618_code, num_adults, num_child, version, extract_ym) {
  defaults <- get('ses', envir = defaultValues)
  if (!missing(patid)) {
    defaults$patid <- patid
  }
  if (!missing(d_education_level_code)) {
    defaults$d_education_level_code <- d_education_level_code
  }
  if (!missing(d_fed_poverty_status_code)) {
    defaults$d_fed_poverty_status_code <- d_fed_poverty_status_code
  }
  if (!missing(d_home_ownership_code)) {
    defaults$d_home_ownership_code <- d_home_ownership_code
  }
  if (!missing(d_household_income_range_code)) {
    defaults$d_household_income_range_code <- d_household_income_range_code
  }
  if (!missing(d_networth_range_code)) {
    defaults$d_networth_range_code <- d_networth_range_code
  }
  if (!missing(d_occupation_type_code)) {
    defaults$d_occupation_type_code <- d_occupation_type_code
  }
  if (!missing(d_race_code)) {
    defaults$d_race_code <- d_race_code
  }
  if (!missing(child_age_0002_code)) {
    defaults$child_age_0002_code <- child_age_0002_code
  }
  if (!missing(child_age_0305_code)) {
    defaults$child_age_0305_code <- child_age_0305_code
  }
  if (!missing(child_age_0610_code)) {
    defaults$child_age_0610_code <- child_age_0610_code
  }
  if (!missing(child_age_1115_code)) {
    defaults$child_age_1115_code <- child_age_1115_code
  }
  if (!missing(child_age_1618_code)) {
    defaults$child_age_1618_code <- child_age_1618_code
  }
  if (!missing(num_adults)) {
    defaults$num_adults <- num_adults
  }
  if (!missing(num_child)) {
    defaults$num_child <- num_child
  }
  if (!missing(version)) {
    defaults$version <- version
  }
  if (!missing(extract_ym)) {
    defaults$extract_ym <- extract_ym
  }
  assign('ses', defaults, envir = defaultValues)
  invisible(defaults)
}


set_defaults_lab_results <- function(patid, pat_planid, proc_cd, abnl_cd, anlytseq, fst_dt, hi_nrml, labclmid, loinc_cd, low_nrml, rslt_txt, rslt_nbr, rslt_unit_nm, source, tst_desc, tst_nbr, extract_ym, version) {
  defaults <- get('lab_results', envir = defaultValues)
  if (!missing(patid)) {
    defaults$patid <- patid
  }
  if (!missing(pat_planid)) {
    defaults$pat_planid <- pat_planid
  }
  if (!missing(proc_cd)) {
    defaults$proc_cd <- proc_cd
  }
  if (!missing(abnl_cd)) {
    defaults$abnl_cd <- abnl_cd
  }
  if (!missing(anlytseq)) {
    defaults$anlytseq <- anlytseq
  }
  if (!missing(fst_dt)) {
    defaults$fst_dt <- fst_dt
  }
  if (!missing(hi_nrml)) {
    defaults$hi_nrml <- hi_nrml
  }
  if (!missing(labclmid)) {
    defaults$labclmid <- labclmid
  }
  if (!missing(loinc_cd)) {
    defaults$loinc_cd <- loinc_cd
  }
  if (!missing(low_nrml)) {
    defaults$low_nrml <- low_nrml
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
  if (!missing(source)) {
    defaults$source <- source
  }
  if (!missing(tst_desc)) {
    defaults$tst_desc <- tst_desc
  }
  if (!missing(tst_nbr)) {
    defaults$tst_nbr <- tst_nbr
  }
  if (!missing(extract_ym)) {
    defaults$extract_ym <- extract_ym
  }
  if (!missing(version)) {
    defaults$version <- version
  }
  assign('lab_results', defaults, envir = defaultValues)
  invisible(defaults)
}

set_defaults_member_detail <- function(patid, gdr_cd, eligeff, eligend, yrdob, pat_planid, aso, bus, product, cdhp, family_id, group_nbr, health_exch, lis, state, extract_ym, version) {
  defaults <- get('member_detail', envir = defaultValues)
  if (!missing(patid)) {
    defaults$patid <- patid
  }
  if (!missing(gdr_cd)) {
    defaults$gdr_cd <- gdr_cd
  }
  if (!missing(eligeff)) {
    defaults$eligeff <- eligeff
  }
  if (!missing(eligend)) {
    defaults$eligend <- eligend
  }
  if (!missing(yrdob)) {
    defaults$yrdob <- yrdob
  }
  if (!missing(pat_planid)) {
    defaults$pat_planid <- pat_planid
  }
  if (!missing(aso)) {
    defaults$aso <- aso
  }
  if (!missing(bus)) {
    defaults$bus <- bus
  }
  if (!missing(product)) {
    defaults$product <- product
  }
  if (!missing(cdhp)) {
    defaults$cdhp <- cdhp
  }
  if (!missing(family_id)) {
    defaults$family_id <- family_id
  }
  if (!missing(group_nbr)) {
    defaults$group_nbr <- group_nbr
  }
  if (!missing(health_exch)) {
    defaults$health_exch <- health_exch
  }
  if (!missing(lis)) {
    defaults$lis <- lis
  }
  if (!missing(state)) {
    defaults$state <- state
  }
  if (!missing(extract_ym)) {
    defaults$extract_ym <- extract_ym
  }
  if (!missing(version)) {
    defaults$version <- version
  }
  assign('member_detail', defaults, envir = defaultValues)
  invisible(defaults)
}

set_defaults_cost_factor <- function(tos, tos_desc, cdm_std_price_year, cumulative_factor) {
  defaults <- get('cost_factor', envir = defaultValues)
  if (!missing(tos)) {
    defaults$tos <- tos
  }
  if (!missing(tos_desc)) {
    defaults$tos_desc <- tos_desc
  }
  if (!missing(cdm_std_price_year)) {
    defaults$cdm_std_price_year <- cdm_std_price_year
  }
  if (!missing(cumulative_factor)) {
    defaults$cumulative_factor <- cumulative_factor
  }
  assign('cost_factor', defaults, envir = defaultValues)
  invisible(defaults)
}

set_defaults_medical_claims <- function(pat_planid, patid, proc_cd, pos, ndc, rvnu_cd, icd_flag, prov, provcat, fst_dt, 
                                        admit_chan, lst_dt, admit_type, bill_prov, charge, clmid, clmseq, cob, coins, conf_id, copay, 
                                        deduct, units, drg, dstatus, enctr, hccc, loc_cd, paid_dt, paid_status, procmod, prov_par, 
                                        refer_prov, service_prov, std_cost, std_cost_yr, tos_cd, extract_ym, version) {
  defaults <- get('medical_claims', envir = defaultValues)
  if (!missing(pat_planid)) {
    defaults$pat_planid <- pat_planid
  }
  if (!missing(patid)) {
    defaults$patid <- patid
  }
  if (!missing(proc_cd)) {
    defaults$proc_cd <- proc_cd
  }
  if (!missing(pos)) {
    defaults$pos <- pos
  }
  if (!missing(ndc)) {
    defaults$ndc <- ndc
  }
  if (!missing(rvnu_cd)) {
    defaults$rvnu_cd <- rvnu_cd
  }
  if (!missing(icd_flag)) {
    defaults$icd_flag <- icd_flag
  }
  if (!missing(prov)) {
    defaults$prov <- prov
  }
  if (!missing(provcat)) {
    defaults$provcat <- provcat
  }
  if (!missing(fst_dt)) {
    defaults$fst_dt <- fst_dt
  }
  if (!missing(admit_chan)) {
    defaults$admit_chan <- admit_chan
  }
  if (!missing(lst_dt)) {
    defaults$lst_dt <- lst_dt
  }
  if (!missing(admit_type)) {
    defaults$admit_type <- admit_type
  }
  if (!missing(bill_prov)) {
    defaults$bill_prov <- bill_prov
  }
  if (!missing(charge)) {
    defaults$charge <- charge
  }
  if (!missing(clmid)) {
    defaults$clmid <- clmid
  }
  if (!missing(clmseq)) {
    defaults$clmseq <- clmseq
  }
  if (!missing(cob)) {
    defaults$cob <- cob
  }
  if (!missing(coins)) {
    defaults$coins <- coins
  }
  if (!missing(conf_id)) {
    defaults$conf_id <- conf_id
  }
  if (!missing(copay)) {
    defaults$copay <- copay
  }
  if (!missing(deduct)) {
    defaults$deduct <- deduct
  }
  if (!missing(units)) {
    defaults$units <- units
  }
  if (!missing(drg)) {
    defaults$drg <- drg
  }
  if (!missing(dstatus)) {
    defaults$dstatus <- dstatus
  }
  if (!missing(enctr)) {
    defaults$enctr <- enctr
  }
  if (!missing(hccc)) {
    defaults$hccc <- hccc
  }
  if (!missing(loc_cd)) {
    defaults$loc_cd <- loc_cd
  }
  if (!missing(paid_dt)) {
    defaults$paid_dt <- paid_dt
  }
  if (!missing(paid_status)) {
    defaults$paid_status <- paid_status
  }
  if (!missing(procmod)) {
    defaults$procmod <- procmod
  }
  if (!missing(prov_par)) {
    defaults$prov_par <- prov_par
  }
  if (!missing(refer_prov)) {
    defaults$refer_prov <- refer_prov
  }
  if (!missing(service_prov)) {
    defaults$service_prov <- service_prov
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
  if (!missing(extract_ym)) {
    defaults$extract_ym <- extract_ym
  }
  if (!missing(version)) {
    defaults$version <- version
  }
  
  assign('medical_claims', defaults, envir = defaultValues)
  invisible(defaults)
}

set_defaults_provider_bridge <- function(prov_unique, npi, dea, prov, extract_ym, version) {
  defaults <- get('provider_bridge', envir = defaultValues)
  if (!missing(prov_unique)) {
    defaults$prov_unique <- prov_unique
  }
  if (!missing(npi)) {
    defaults$npi <- npi
  }
  if (!missing(dea)) {
    defaults$dea <- dea
  }
  if (!missing(prov)) {
    defaults$prov <- prov
  }
  if (!missing(extract_ym)) {
    defaults$extract_ym <- extract_ym
  }
  if (!missing(version)) {
    defaults$version <- version
  }
  assign('provider_bridge', defaults, envir = defaultValues)
  invisible(defaults)
}

set_defaults_provider <- function(prov_unique, bed_sz_range, cred_type, grp_practice, hosp_affil, prov_state, prov_type, provcat, taxonomy1, taxonomy2, extract_ym, version) {
  defaults <- get('provider', envir = defaultValues)
  if (!missing(prov_unique)) {
    defaults$prov_unique <- prov_unique
  }
  if (!missing(bed_sz_range)) {
    defaults$bed_sz_range <- bed_sz_range
  }
  if (!missing(cred_type)) {
    defaults$cred_type <- cred_type
  }
  if (!missing(grp_practice)) {
    defaults$grp_practice <- grp_practice
  }
  if (!missing(hosp_affil)) {
    defaults$hosp_affil <- hosp_affil
  }
  if (!missing(prov_state)) {
    defaults$prov_state <- prov_state
  }
  if (!missing(prov_type)) {
    defaults$prov_type <- prov_type
  }
  if (!missing(provcat)) {
    defaults$provcat <- provcat
  }
  if (!missing(taxonomy1)) {
    defaults$taxonomy1 <- taxonomy1
  }
  if (!missing(taxonomy2)) {
    defaults$taxonomy2 <- taxonomy2
  }
  if (!missing(extract_ym)) {
    defaults$extract_ym <- extract_ym
  }
  if (!missing(version)) {
    defaults$version <- version
  }
  assign('provider', defaults, envir = defaultValues)
  invisible(defaults)
}

set_defaults_med_diagnosis <- function(patid, pat_planid, icd_flag, diag, clmid, diag_position, loc_cd, poa, extract_ym, version) {
  defaults <- get('med_diagnosis', envir = defaultValues)
  if (!missing(patid)) {
    defaults$patid <- patid
  }
  if (!missing(pat_planid)) {
    defaults$pat_planid <- pat_planid
  }
  if (!missing(icd_flag)) {
    defaults$icd_flag <- icd_flag
  }
  if (!missing(diag)) {
    defaults$diag <- diag
  }
  if (!missing(clmid)) {
    defaults$clmid <- clmid
  }
  if (!missing(diag_position)) {
    defaults$diag_position <- diag_position
  }
  if (!missing(loc_cd)) {
    defaults$loc_cd <- loc_cd
  }
  if (!missing(poa)) {
    defaults$poa <- poa
  }
  if (!missing(extract_ym)) {
    defaults$extract_ym <- extract_ym
  }
  if (!missing(version)) {
    defaults$version <- version
  }
  assign('med_diagnosis', defaults, envir = defaultValues)
  invisible(defaults)
}

set_defaults_death <- function(patid, ymdod, version, extract_ym) {
  defaults <- get('death', envir = defaultValues)
  if (!missing(patid)) {
    defaults$patid <- patid
  }
  if (!missing(ymdod)) {
    defaults$ymdod <- ymdod
  }
  if (!missing(version)) {
    defaults$version <- version
  }
  if (!missing(extract_ym)) {
    defaults$extract_ym <- extract_ym
  }
  assign('death', defaults, envir = defaultValues)
  invisible(defaults)
}

set_defaults_facility_detail <- function(patid, pat_planid, charge_alloc, clmid, clmseq, detail_line_nbr, fst_dt, proc_cd, procmod, rvnu_cd, std_cost, std_cost_yr, units, extract_ym, version) {
  defaults <- get('facility_detail', envir = defaultValues)
  if (!missing(patid)) {
    defaults$patid <- patid
  }
  if (!missing(pat_planid)) {
    defaults$pat_planid <- pat_planid
  }
  if (!missing(charge_alloc)) {
    defaults$charge_alloc <- charge_alloc
  }
  if (!missing(clmid)) {
    defaults$clmid <- clmid
  }
  if (!missing(clmseq)) {
    defaults$clmseq <- clmseq
  }
  if (!missing(detail_line_nbr)) {
    defaults$detail_line_nbr <- detail_line_nbr
  }
  if (!missing(fst_dt)) {
    defaults$fst_dt <- fst_dt
  }
  if (!missing(proc_cd)) {
    defaults$proc_cd <- proc_cd
  }
  if (!missing(procmod)) {
    defaults$procmod <- procmod
  }
  if (!missing(rvnu_cd)) {
    defaults$rvnu_cd <- rvnu_cd
  }
  if (!missing(std_cost)) {
    defaults$std_cost <- std_cost
  }
  if (!missing(std_cost_yr)) {
    defaults$std_cost_yr <- std_cost_yr
  }
  if (!missing(units)) {
    defaults$units <- units
  }
  if (!missing(extract_ym)) {
    defaults$extract_ym <- extract_ym
  }
  if (!missing(version)) {
    defaults$version <- version
  }
  assign('facility_detail', defaults, envir = defaultValues)
  invisible(defaults)
}

set_defaults_rx_claims <- function(patid, pat_planid, ahfsclss, avgwhlsl, brnd_nm, charge, chk_dt, clmid, copay, daw, days_sup, dea, deduct, dispfee, fill_dt, form_ind, form_typ, fst_fill, gnrc_ind, gnrc_nm, ndc, mail_ind, npi, pharm, prc_typ, quantity, rfl_nbr, spclt_ind, specclss, std_cost, std_cost_yr, strength, extract_ym, version, gpi) {
  defaults <- get('rx_claims', envir = defaultValues)
  if (!missing(patid)) {
    defaults$patid <- patid
  }
  if (!missing(pat_planid)) {
    defaults$pat_planid <- pat_planid
  }
  if (!missing(ahfsclss)) {
    defaults$ahfsclss <- ahfsclss
  }
  if (!missing(avgwhlsl)) {
    defaults$avgwhlsl <- avgwhlsl
  }
  if (!missing(brnd_nm)) {
    defaults$brnd_nm <- brnd_nm
  }
  if (!missing(charge)) {
    defaults$charge <- charge
  }
  if (!missing(chk_dt)) {
    defaults$chk_dt <- chk_dt
  }
  if (!missing(clmid)) {
    defaults$clmid <- clmid
  }
  if (!missing(copay)) {
    defaults$copay <- copay
  }
  if (!missing(daw)) {
    defaults$daw <- daw
  }
  if (!missing(days_sup)) {
    defaults$days_sup <- days_sup
  }
  if (!missing(dea)) {
    defaults$dea <- dea
  }
  if (!missing(deduct)) {
    defaults$deduct <- deduct
  }
  if (!missing(dispfee)) {
    defaults$dispfee <- dispfee
  }
  if (!missing(fill_dt)) {
    defaults$fill_dt <- fill_dt
  }
  if (!missing(form_ind)) {
    defaults$form_ind <- form_ind
  }
  if (!missing(form_typ)) {
    defaults$form_typ <- form_typ
  }
  if (!missing(fst_fill)) {
    defaults$fst_fill <- fst_fill
  }
  if (!missing(gnrc_ind)) {
    defaults$gnrc_ind <- gnrc_ind
  }
  if (!missing(gnrc_nm)) {
    defaults$gnrc_nm <- gnrc_nm
  }
  if (!missing(ndc)) {
    defaults$ndc <- ndc
  }
  if (!missing(mail_ind)) {
    defaults$mail_ind <- mail_ind
  }
  if (!missing(npi)) {
    defaults$npi <- npi
  }
  if (!missing(pharm)) {
    defaults$pharm <- pharm
  }
  if (!missing(prc_typ)) {
    defaults$prc_typ <- prc_typ
  }
  if (!missing(quantity)) {
    defaults$quantity <- quantity
  }
  if (!missing(rfl_nbr)) {
    defaults$rfl_nbr <- rfl_nbr
  }
  if (!missing(spclt_ind)) {
    defaults$spclt_ind <- spclt_ind
  }
  if (!missing(specclss)) {
    defaults$specclss <- specclss
  }
  if (!missing(std_cost)) {
    defaults$std_cost <- std_cost
  }
  if (!missing(std_cost_yr)) {
    defaults$std_cost_yr <- std_cost_yr
  }
  if (!missing(strength)) {
    defaults$strength <- strength
  }
  if (!missing(extract_ym)) {
    defaults$extract_ym <- extract_ym
  }
  if (!missing(version)) {
    defaults$version <- version
  }
  if (!missing(gpi)) {
    defaults$gpi <- gpi
  }
  assign('rx_claims', defaults, envir = defaultValues)
  invisible(defaults)
}

set_defaults_med_procedure <- function(patid, pat_planid, proc, clmid, icd_flag, proc_position, extract_ym, version) {
  defaults <- get('med_procedure', envir = defaultValues)
  if (!missing(patid)) {
    defaults$patid <- patid
  }
  if (!missing(pat_planid)) {
    defaults$pat_planid <- pat_planid
  }
  if (!missing(proc)) {
    defaults$proc <- proc
  }
  if (!missing(clmid)) {
    defaults$clmid <- clmid
  }
  if (!missing(icd_flag)) {
    defaults$icd_flag <- icd_flag
  }
  if (!missing(proc_position)) {
    defaults$proc_position <- proc_position
  }
  if (!missing(extract_ym)) {
    defaults$extract_ym <- extract_ym
  }
  if (!missing(version)) {
    defaults$version <- version
  }
  assign('med_procedure', defaults, envir = defaultValues)
  invisible(defaults)
}

set_defaults_inpatient_confinement <- function(patid, pat_planid, admit_date, charge, coins, conf_id, copay, deduct, diag1, diag2, diag3, diag4, diag5, disch_date, drg, dstatus, icd_flag, ipstatus, los, pos, proc1, proc2, proc3, proc4, proc5, prov, std_cost, std_cost_yr, tos_cd, extract_ym, version) {
  defaults <- get('inpatient_confinement', envir = defaultValues)
  if (!missing(patid)) {
    defaults$patid <- patid
  }
  if (!missing(pat_planid)) {
    defaults$pat_planid <- pat_planid
  }
  if (!missing(admit_date)) {
    defaults$admit_date <- admit_date
  }
  if (!missing(charge)) {
    defaults$charge <- charge
  }
  if (!missing(coins)) {
    defaults$coins <- coins
  }
  if (!missing(conf_id)) {
    defaults$conf_id <- conf_id
  }
  if (!missing(copay)) {
    defaults$copay <- copay
  }
  if (!missing(deduct)) {
    defaults$deduct <- deduct
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
  if (!missing(disch_date)) {
    defaults$disch_date <- disch_date
  }
  if (!missing(drg)) {
    defaults$drg <- drg
  }
  if (!missing(dstatus)) {
    defaults$dstatus <- dstatus
  }
  if (!missing(icd_flag)) {
    defaults$icd_flag <- icd_flag
  }
  if (!missing(ipstatus)) {
    defaults$ipstatus <- ipstatus
  }
  if (!missing(los)) {
    defaults$los <- los
  }
  if (!missing(pos)) {
    defaults$pos <- pos
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
  if (!missing(prov)) {
    defaults$prov <- prov
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
  if (!missing(extract_ym)) {
    defaults$extract_ym <- extract_ym
  }
  if (!missing(version)) {
    defaults$version <- version
  }
  assign('inpatient_confinement', defaults, envir = defaultValues)
  invisible(defaults)
}

set_defaults_member <- function(patid, aso, bus, cdhp, eligeff, eligend, family_id, gdr_cd, group_nbr, health_exch, product, state, yrdob, extract_ym, version) {
  defaults <- get('member', envir = defaultValues)
  if (!missing(patid)) {
    defaults$patid <- patid
  }
  if (!missing(aso)) {
    defaults$aso <- aso
  }
  if (!missing(bus)) {
    defaults$bus <- bus
  }
  if (!missing(cdhp)) {
    defaults$cdhp <- cdhp
  }
  if (!missing(eligeff)) {
    defaults$eligeff <- eligeff
  }
  if (!missing(eligend)) {
    defaults$eligend <- eligend
  }
  if (!missing(family_id)) {
    defaults$family_id <- family_id
  }
  if (!missing(gdr_cd)) {
    defaults$gdr_cd <- gdr_cd
  }
  if (!missing(group_nbr)) {
    defaults$group_nbr <- group_nbr
  }
  if (!missing(health_exch)) {
    defaults$health_exch <- health_exch
  }
  if (!missing(product)) {
    defaults$product <- product
  }
  if (!missing(state)) {
    defaults$state <- state
  }
  if (!missing(yrdob)) {
    defaults$yrdob <- yrdob
  }
  if (!missing(extract_ym)) {
    defaults$extract_ym <- extract_ym
  }
  if (!missing(version)) {
    defaults$version <- version
  }
  assign('member', defaults, envir = defaultValues)
  invisible(defaults)
}

set_defaults_lu_diagnosis <- function(diag_cd, diag_desc, diag_fst3_cd, diag_fst3_desc, diag_fst4_cd, diag_fst4_desc, gdr_spec_cd, mdc_cd_desc, mdc_code, icd_ver_cd) {
  defaults <- get('lu_diagnosis', envir = defaultValues)
  if (!missing(diag_cd)) {
    defaults$diag_cd <- diag_cd
  }
  if (!missing(diag_desc)) {
    defaults$diag_desc <- diag_desc
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
  if (!missing(gdr_spec_cd)) {
    defaults$gdr_spec_cd <- gdr_spec_cd
  }
  if (!missing(mdc_cd_desc)) {
    defaults$mdc_cd_desc <- mdc_cd_desc
  }
  if (!missing(mdc_code)) {
    defaults$mdc_code <- mdc_code
  }
  if (!missing(icd_ver_cd)) {
    defaults$icd_ver_cd <- icd_ver_cd
  }
  assign('lu_diagnosis', defaults, envir = defaultValues)
  invisible(defaults)
}

set_defaults_lu_ndc <- function(ahfsclss, ahfsclss_desc, brnd_nm, dosage_fm_desc, drg_strgth_desc, drg_strgth_nbr, drg_strgth_unit_desc, drg_strgth_vol_nbr, drg_strgth_vol_unit_desc, gnrc_ind, gnrc_nbr, gnrc_nm, gnrc_sqnc_nbr, ndc, ndc_drg_row_eff_dt, ndc_drg_row_end_dt, usc_id, usc_med_desc) {
  defaults <- get('lu_ndc', envir = defaultValues)
  if (!missing(ahfsclss)) {
    defaults$ahfsclss <- ahfsclss
  }
  if (!missing(ahfsclss_desc)) {
    defaults$ahfsclss_desc <- ahfsclss_desc
  }
  if (!missing(brnd_nm)) {
    defaults$brnd_nm <- brnd_nm
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
  if (!missing(gnrc_nbr)) {
    defaults$gnrc_nbr <- gnrc_nbr
  }
  if (!missing(gnrc_nm)) {
    defaults$gnrc_nm <- gnrc_nm
  }
  if (!missing(gnrc_sqnc_nbr)) {
    defaults$gnrc_sqnc_nbr <- gnrc_sqnc_nbr
  }
  if (!missing(ndc)) {
    defaults$ndc <- ndc
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
  assign('lu_ndc', defaults, envir = defaultValues)
  invisible(defaults)
}

set_defaults_lu_procedure <- function(category_dtl_cd, category_dtl_code_desc, category_genl_cd, category_genl_cd_desc, proc_cd, proc_desc, proc_end_date, proc_typ_cd) {
  defaults <- get('lu_procedure', envir = defaultValues)
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
  assign('lu_procedure', defaults, envir = defaultValues)
  invisible(defaults)
}

set_defaults_hra <- function(patid, h_bmi, h_bsa, h_chronic_pain, h_height, h_smoking_status, h_weight, hra_compltd_dt, isa10008, isa1006, isa13021, isa13022, isa13023, isa13040, isa16010, isa16016, isa16040, isa17001, isa17015, isa17021, isa17023, isa18015, isa19004, isa19005, isa20061, isa20064, isa20069, isa20072, isa21001, isa21003, isa21009, isa21015, isa21020, isa21021, isa21025, isa3010, isa5001, isa5004, isa5010, isa5018, isa7018, isa8016, isa9009, isa9063, extract_ym, version) {
  defaults <- get('hra', envir = defaultValues)
  if (!missing(patid)) {
    defaults$patid <- patid
  }
  if (!missing(h_bmi)) {
    defaults$h_bmi <- h_bmi
  }
  if (!missing(h_bsa)) {
    defaults$h_bsa <- h_bsa
  }
  if (!missing(h_chronic_pain)) {
    defaults$h_chronic_pain <- h_chronic_pain
  }
  if (!missing(h_height)) {
    defaults$h_height <- h_height
  }
  if (!missing(h_smoking_status)) {
    defaults$h_smoking_status <- h_smoking_status
  }
  if (!missing(h_weight)) {
    defaults$h_weight <- h_weight
  }
  if (!missing(hra_compltd_dt)) {
    defaults$hra_compltd_dt <- hra_compltd_dt
  }
  if (!missing(isa10008)) {
    defaults$isa10008 <- isa10008
  }
  if (!missing(isa1006)) {
    defaults$isa1006 <- isa1006
  }
  if (!missing(isa13021)) {
    defaults$isa13021 <- isa13021
  }
  if (!missing(isa13022)) {
    defaults$isa13022 <- isa13022
  }
  if (!missing(isa13023)) {
    defaults$isa13023 <- isa13023
  }
  if (!missing(isa13040)) {
    defaults$isa13040 <- isa13040
  }
  if (!missing(isa16010)) {
    defaults$isa16010 <- isa16010
  }
  if (!missing(isa16016)) {
    defaults$isa16016 <- isa16016
  }
  if (!missing(isa16040)) {
    defaults$isa16040 <- isa16040
  }
  if (!missing(isa17001)) {
    defaults$isa17001 <- isa17001
  }
  if (!missing(isa17015)) {
    defaults$isa17015 <- isa17015
  }
  if (!missing(isa17021)) {
    defaults$isa17021 <- isa17021
  }
  if (!missing(isa17023)) {
    defaults$isa17023 <- isa17023
  }
  if (!missing(isa18015)) {
    defaults$isa18015 <- isa18015
  }
  if (!missing(isa19004)) {
    defaults$isa19004 <- isa19004
  }
  if (!missing(isa19005)) {
    defaults$isa19005 <- isa19005
  }
  if (!missing(isa20061)) {
    defaults$isa20061 <- isa20061
  }
  if (!missing(isa20064)) {
    defaults$isa20064 <- isa20064
  }
  if (!missing(isa20069)) {
    defaults$isa20069 <- isa20069
  }
  if (!missing(isa20072)) {
    defaults$isa20072 <- isa20072
  }
  if (!missing(isa21001)) {
    defaults$isa21001 <- isa21001
  }
  if (!missing(isa21003)) {
    defaults$isa21003 <- isa21003
  }
  if (!missing(isa21009)) {
    defaults$isa21009 <- isa21009
  }
  if (!missing(isa21015)) {
    defaults$isa21015 <- isa21015
  }
  if (!missing(isa21020)) {
    defaults$isa21020 <- isa21020
  }
  if (!missing(isa21021)) {
    defaults$isa21021 <- isa21021
  }
  if (!missing(isa21025)) {
    defaults$isa21025 <- isa21025
  }
  if (!missing(isa3010)) {
    defaults$isa3010 <- isa3010
  }
  if (!missing(isa5001)) {
    defaults$isa5001 <- isa5001
  }
  if (!missing(isa5004)) {
    defaults$isa5004 <- isa5004
  }
  if (!missing(isa5010)) {
    defaults$isa5010 <- isa5010
  }
  if (!missing(isa5018)) {
    defaults$isa5018 <- isa5018
  }
  if (!missing(isa7018)) {
    defaults$isa7018 <- isa7018
  }
  if (!missing(isa8016)) {
    defaults$isa8016 <- isa8016
  }
  if (!missing(isa9009)) {
    defaults$isa9009 <- isa9009
  }
  if (!missing(isa9063)) {
    defaults$isa9063 <- isa9063
  }
  if (!missing(extract_ym)) {
    defaults$extract_ym <- extract_ym
  }
  if (!missing(version)) {
    defaults$version <- version
  }
  assign('hra', defaults, envir = defaultValues)
  invisible(defaults)
}

set_defaults__version <- function(version_id, version_date) {
  defaults <- get('_version', envir = defaultValues)
  if (!missing(version_id)) {
    defaults$version_id <- version_id
  }
  if (!missing(version_date)) {
    defaults$version_date <- version_date
  }
  assign('_version', defaults, envir = defaultValues)
  invisible(defaults)
}

set_defaults__pos_episode_visit <- function(episode_id, patid, dt_start, dt_end, visit_type) {
  defaults <- get('_pos_episode_visit', envir = defaultValues)
  if (!missing(episode_id)) {
    defaults$episode_id <- episode_id
  }
  if (!missing(patid)) {
    defaults$patid <- patid
  }
  if (!missing(dt_start)) {
    defaults$dt_start <- dt_start
  }
  if (!missing(dt_end)) {
    defaults$dt_end <- dt_end
  }
  if (!missing(visit_type)) {
    defaults$visit_type <- visit_type
  }
  assign('_pos_episode_visit', defaults, envir = defaultValues)
  invisible(defaults)
}

get_defaults_ses <- function() {
  defaults <- get('ses', envir = defaultValues)
  return(defaults)
}

get_defaults_lab_results <- function() {
  defaults <- get('lab_results', envir = defaultValues)
  return(defaults)
}

get_defaults_member_detail <- function() {
  defaults <- get('member_detail', envir = defaultValues)
  return(defaults)
}

get_defaults_cost_factor <- function() {
  defaults <- get('cost_factor', envir = defaultValues)
  return(defaults)
}

get_defaults_medical_claims <- function() {
  defaults <- get('medical_claims', envir = defaultValues)
  return(defaults)
}

get_defaults_provider_bridge <- function() {
  defaults <- get('provider_bridge', envir = defaultValues)
  return(defaults)
}

get_defaults_provider <- function() {
  defaults <- get('provider', envir = defaultValues)
  return(defaults)
}

get_defaults_med_diagnosis <- function() {
  defaults <- get('med_diagnosis', envir = defaultValues)
  return(defaults)
}

get_defaults_death <- function() {
  defaults <- get('death', envir = defaultValues)
  return(defaults)
}

get_defaults_facility_detail <- function() {
  defaults <- get('facility_detail', envir = defaultValues)
  return(defaults)
}

get_defaults_rx_claims <- function() {
  defaults <- get('rx_claims', envir = defaultValues)
  return(defaults)
}

get_defaults_med_procedure <- function() {
  defaults <- get('med_procedure', envir = defaultValues)
  return(defaults)
}

get_defaults_inpatient_confinement <- function() {
  defaults <- get('inpatient_confinement', envir = defaultValues)
  return(defaults)
}

get_defaults_member <- function() {
  defaults <- get('member', envir = defaultValues)
  return(defaults)
}

get_defaults_lu_diagnosis <- function() {
  defaults <- get('lu_diagnosis', envir = defaultValues)
  return(defaults)
}

get_defaults_lu_ndc <- function() {
  defaults <- get('lu_ndc', envir = defaultValues)
  return(defaults)
}

get_defaults_lu_procedure <- function() {
  defaults <- get('lu_procedure', envir = defaultValues)
  return(defaults)
}

get_defaults_hra <- function() {
  defaults <- get('hra', envir = defaultValues)
  return(defaults)
}

get_defaults__version <- function() {
  defaults <- get('_version', envir = defaultValues)
  return(defaults)
}

get_defaults__pos_episode_visit <- function() {
  defaults <- get('_pos_episode_visit', envir = defaultValues)
  return(defaults)
}

get_defaults_stem_table <- function() {
  defaults <- get('stem_table', envir = defaultValues)
  return(defaults)
}

add_ses <- function(patid, d_education_level_code, d_fed_poverty_status_code, d_home_ownership_code, 
                    d_household_income_range_code, d_networth_range_code, d_occupation_type_code, 
                    d_race_code, num_adults, num_child, extract_ym, version) {
  defaults <- get('ses', envir = defaultValues)
  insertFields <- c()
  insertValues <- c()
  if (missing(patid)) {
    patid <- defaults$patid
  }
  if (!is.null(patid)) {
    insertFields <- c(insertFields, "patid")
    insertValues <- c(insertValues, patid)
  }
  
  if (missing(d_education_level_code)) {
    d_education_level_code <- defaults$d_education_level_code
  }
  if (!is.null(d_education_level_code)) {
    insertFields <- c(insertFields, "d_education_level_code")
    insertValues <- c(insertValues, d_education_level_code)
  }
  
  if (missing(d_fed_poverty_status_code)) {
    d_fed_poverty_status_code <- defaults$d_fed_poverty_status_code
  }
  if (!is.null(d_fed_poverty_status_code)) {
    insertFields <- c(insertFields, "d_fed_poverty_status_code")
    insertValues <- c(insertValues, d_fed_poverty_status_code)
  }
  
  if (missing(d_home_ownership_code)) {
    d_home_ownership_code <- defaults$d_home_ownership_code
  }
  if (!is.null(d_home_ownership_code)) {
    insertFields <- c(insertFields, "d_home_ownership_code")
    insertValues <- c(insertValues, d_home_ownership_code)
  }
  
  if (missing(d_household_income_range_code)) {
    d_household_income_range_code <- defaults$d_household_income_range_code
  }
  if (!is.null(d_household_income_range_code)) {
    insertFields <- c(insertFields, "d_household_income_range_code")
    insertValues <- c(insertValues, d_household_income_range_code)
  }
  
  if (missing(d_networth_range_code)) {
    d_networth_range_code <- defaults$d_networth_range_code
  }
  if (!is.null(d_networth_range_code)) {
    insertFields <- c(insertFields, "d_networth_range_code")
    insertValues <- c(insertValues, d_networth_range_code)
  }
  
  if (missing(d_occupation_type_code)) {
    d_occupation_type_code <- defaults$d_occupation_type_code
  }
  if (!is.null(d_occupation_type_code)) {
    insertFields <- c(insertFields, "d_occupation_type_code")
    insertValues <- c(insertValues, d_occupation_type_code)
  }
  
  if (missing(d_race_code)) {
    d_race_code <- defaults$d_race_code
  }
  if (!is.null(d_race_code)) {
    insertFields <- c(insertFields, "d_race_code")
    insertValues <- c(insertValues, d_race_code)
  }
  
  if (missing(num_adults)) {
    num_adults <- defaults$num_adults
  }
  if (!is.null(num_adults)) {
    insertFields <- c(insertFields, "num_adults")
    insertValues <- c(insertValues, num_adults)
  }
  
  if (missing(num_child)) {
    num_child <- defaults$num_child
  }
  if (!is.null(num_child)) {
    insertFields <- c(insertFields, "num_child")
    insertValues <- c(insertValues, num_child)
  }
  
  if (missing(extract_ym)) {
    extract_ym <- defaults$extract_ym
  }
  if (!is.null(extract_ym)) {
    insertFields <- c(insertFields, "extract_ym")
    insertValues <- c(insertValues, extract_ym)
  }
  
  if (missing(version)) {
    version <- defaults$version
  }
  if (!is.null(version)) {
    insertFields <- c(insertFields, "version")
    insertValues <- c(insertValues, version)
  }
  
  if (exists('testNewAdded', where = globalenv()) && get('testNewAdded'))
  {
    assign('testNewAdded', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    insertDf[nrow(insertDf) + 1,] <<- c('ses', comment)
  }
  
  statement <- paste0("INSERT INTO @nativeDatabaseSchema.ses (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  insertDf[nrow(insertDf) + 1,] <<- c('ses', statement)
  invisible(statement)
}

add_lab_results <- function(patid, pat_planid, proc_cd, abnl_cd, anlytseq, fst_dt, hi_nrml, labclmid, loinc_cd, low_nrml, rslt_txt, rslt_nbr, rslt_unit_nm, source, tst_desc, tst_nbr, extract_ym, version) {
  defaults <- get('lab_results', envir = defaultValues)
  insertFields <- c()
  insertValues <- c()
  if (missing(patid)) {
    patid <- defaults$patid
  }
  if (!is.null(patid)) {
    insertFields <- c(insertFields, "patid")
    insertValues <- c(insertValues, patid)
  }
  
  if (missing(pat_planid)) {
    pat_planid <- defaults$pat_planid
  }
  if (!is.null(pat_planid)) {
    insertFields <- c(insertFields, "pat_planid")
    insertValues <- c(insertValues, pat_planid)
  }
  
  if (missing(proc_cd)) {
    proc_cd <- defaults$proc_cd
  }
  if (!is.null(proc_cd)) {
    insertFields <- c(insertFields, "proc_cd")
    insertValues <- c(insertValues, proc_cd)
  }
  
  if (missing(abnl_cd)) {
    abnl_cd <- defaults$abnl_cd
  }
  if (!is.null(abnl_cd)) {
    insertFields <- c(insertFields, "abnl_cd")
    insertValues <- c(insertValues, abnl_cd)
  }
  
  if (missing(anlytseq)) {
    anlytseq <- defaults$anlytseq
  }
  if (!is.null(anlytseq)) {
    insertFields <- c(insertFields, "anlytseq")
    insertValues <- c(insertValues, anlytseq)
  }
  
  if (missing(fst_dt)) {
    fst_dt <- defaults$fst_dt
  }
  if (!is.null(fst_dt)) {
    insertFields <- c(insertFields, "fst_dt")
    insertValues <- c(insertValues, fst_dt)
  }
  
  if (missing(hi_nrml)) {
    hi_nrml <- defaults$hi_nrml
  }
  if (!is.null(hi_nrml)) {
    insertFields <- c(insertFields, "hi_nrml")
    insertValues <- c(insertValues, hi_nrml)
  }
  
  if (missing(labclmid)) {
    labclmid <- defaults$labclmid
  }
  if (!is.null(labclmid)) {
    insertFields <- c(insertFields, "labclmid")
    insertValues <- c(insertValues, labclmid)
  }
  
  if (missing(loinc_cd)) {
    loinc_cd <- defaults$loinc_cd
  }
  if (!is.null(loinc_cd)) {
    insertFields <- c(insertFields, "loinc_cd")
    insertValues <- c(insertValues, loinc_cd)
  }
  
  if (missing(low_nrml)) {
    low_nrml <- defaults$low_nrml
  }
  if (!is.null(low_nrml)) {
    insertFields <- c(insertFields, "low_nrml")
    insertValues <- c(insertValues, low_nrml)
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
  
  if (missing(source)) {
    source <- defaults$source
  }
  if (!is.null(source)) {
    insertFields <- c(insertFields, "source")
    insertValues <- c(insertValues, source)
  }
  
  if (missing(tst_desc)) {
    tst_desc <- defaults$tst_desc
  }
  if (!is.null(tst_desc)) {
    insertFields <- c(insertFields, "tst_desc")
    insertValues <- c(insertValues, tst_desc)
  }
  
  if (missing(tst_nbr)) {
    tst_nbr <- defaults$tst_nbr
  }
  if (!is.null(tst_nbr)) {
    insertFields <- c(insertFields, "tst_nbr")
    insertValues <- c(insertValues, tst_nbr)
  }
  
  if (missing(extract_ym)) {
    extract_ym <- defaults$extract_ym
  }
  if (!is.null(extract_ym)) {
    insertFields <- c(insertFields, "extract_ym")
    insertValues <- c(insertValues, extract_ym)
  }
  
  if (missing(version)) {
    version <- defaults$version
  }
  if (!is.null(version)) {
    insertFields <- c(insertFields, "version")
    insertValues <- c(insertValues, version)
  }
  
  if (exists('testNewAdded', where = globalenv()) && get('testNewAdded'))
  {
    assign('testNewAdded', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    insertDf[nrow(insertDf) + 1,] <<- c('lab_results', comment)
  }
  statement <- paste0("INSERT INTO @nativeDatabaseSchema.lab_results (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  insertDf[nrow(insertDf) + 1,] <<- c('lab_results', statement)
  invisible(statement)
}

add_member_detail <- function(patid, gdr_cd, eligeff, eligend, yrdob, pat_planid, aso, bus, product, cdhp, family_id, group_nbr, health_exch, lis, state, division, extract_ym, version) {
  defaults <- get('member_detail', envir = defaultValues)
  insertFields <- c()
  insertValues <- c()
  if (missing(patid)) {
    patid <- defaults$patid
  }
  if (!is.null(patid)) {
    insertFields <- c(insertFields, "patid")
    insertValues <- c(insertValues, patid)
  }
  
  if (missing(gdr_cd)) {
    gdr_cd <- defaults$gdr_cd
  }
  if (!is.null(gdr_cd)) {
    insertFields <- c(insertFields, "gdr_cd")
    insertValues <- c(insertValues, gdr_cd)
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
  
  if (missing(yrdob)) {
    yrdob <- defaults$yrdob
  }
  if (!is.null(yrdob)) {
    insertFields <- c(insertFields, "yrdob")
    insertValues <- c(insertValues, yrdob)
  }
  
  if (missing(pat_planid)) {
    pat_planid <- defaults$pat_planid
  }
  if (!is.null(pat_planid)) {
    insertFields <- c(insertFields, "pat_planid")
    insertValues <- c(insertValues, pat_planid)
  }
  
  if (missing(aso)) {
    aso <- defaults$aso
  }
  if (!is.null(aso)) {
    insertFields <- c(insertFields, "aso")
    insertValues <- c(insertValues, aso)
  }
  
  if (missing(bus)) {
    bus <- defaults$bus
  }
  if (!is.null(bus)) {
    insertFields <- c(insertFields, "bus")
    insertValues <- c(insertValues, bus)
  }
  
  if (missing(product)) {
    product <- defaults$product
  }
  if (!is.null(product)) {
    insertFields <- c(insertFields, "product")
    insertValues <- c(insertValues, product)
  }
  
  if (missing(cdhp)) {
    cdhp <- defaults$cdhp
  }
  if (!is.null(cdhp)) {
    insertFields <- c(insertFields, "cdhp")
    insertValues <- c(insertValues, cdhp)
  }
  
  if (missing(family_id)) {
    family_id <- defaults$family_id
  }
  if (!is.null(family_id)) {
    insertFields <- c(insertFields, "family_id")
    insertValues <- c(insertValues, family_id)
  }
  
  if (missing(group_nbr)) {
    group_nbr <- defaults$group_nbr
  }
  if (!is.null(group_nbr)) {
    insertFields <- c(insertFields, "group_nbr")
    insertValues <- c(insertValues, group_nbr)
  }
  
  if (missing(health_exch)) {
    health_exch <- defaults$health_exch
  }
  if (!is.null(health_exch)) {
    insertFields <- c(insertFields, "health_exch")
    insertValues <- c(insertValues, health_exch)
  }
  
  if (missing(lis)) {
    lis <- defaults$lis
  }
  if (!is.null(lis)) {
    insertFields <- c(insertFields, "lis")
    insertValues <- c(insertValues, lis)
  }
  
  if (missing(state)) {
    state <- defaults$state
  }
  if (!is.null(state)) {
    insertFields <- c(insertFields, "state")
    insertValues <- c(insertValues, state)
  }
  
  if (missing(division)) {
    division <- defaults$division
  }
  if (!is.null(division)) {
    insertFields <- c(insertFields, "division")
    insertValues <- c(insertValues, division)
  }
  
  if (missing(extract_ym)) {
    extract_ym <- defaults$extract_ym
  }
  if (!is.null(extract_ym)) {
    insertFields <- c(insertFields, "extract_ym")
    insertValues <- c(insertValues, extract_ym)
  }
  
  if (missing(version)) {
    version <- defaults$version
  }
  if (!is.null(version)) {
    insertFields <- c(insertFields, "version")
    insertValues <- c(insertValues, version)
  }
  
  if (exists('testNewAdded', where = globalenv()) && get('testNewAdded'))
  {
    assign('testNewAdded', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    insertDf[nrow(insertDf) + 1,] <<- c('member_detail', comment)
  }
  statement <- paste0("INSERT INTO @nativeDatabaseSchema.member_detail (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  insertDf[nrow(insertDf) + 1,] <<- c('member_detail', statement)
  invisible(statement)
}

add_cost_factor <- function(tos, tos_desc, cdm_std_price_year, cumulative_factor) {
  defaults <- get('cost_factor', envir = defaultValues)
  insertFields <- c()
  insertValues <- c()
  if (missing(tos)) {
    tos <- defaults$tos
  }
  if (!is.null(tos)) {
    insertFields <- c(insertFields, "tos")
    insertValues <- c(insertValues, tos)
  }
  
  if (missing(tos_desc)) {
    tos_desc <- defaults$tos_desc
  }
  if (!is.null(tos_desc)) {
    insertFields <- c(insertFields, "tos_desc")
    insertValues <- c(insertValues, tos_desc)
  }
  
  if (missing(cdm_std_price_year)) {
    cdm_std_price_year <- defaults$cdm_std_price_year
  }
  if (!is.null(cdm_std_price_year)) {
    insertFields <- c(insertFields, "cdm_std_price_year")
    insertValues <- c(insertValues, cdm_std_price_year)
  }
  
  if (missing(cumulative_factor)) {
    cumulative_factor <- defaults$cumulative_factor
  }
  if (!is.null(cumulative_factor)) {
    insertFields <- c(insertFields, "cumulative_factor")
    insertValues <- c(insertValues, cumulative_factor)
  }
  
  if (exists('testNewAdded', where = globalenv()) && get('testNewAdded'))
  {
    assign('testNewAdded', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    insertDf[nrow(insertDf) + 1,] <<- c('cost_factor', comment)
  }
  statement <- paste0("INSERT INTO @nativeDatabaseSchema.cost_factor (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  insertDf[nrow(insertDf) + 1,] <<- c('cost_factor', statement)
  invisible(statement)
}

add_medical_claims <- function(pat_planid, patid, proc_cd, pos, ndc, rvnu_cd, icd_flag, prov, provcat, fst_dt, admit_chan, lst_dt, 
                               admit_type, bill_prov, charge, clmid, clmseq, cob, coins, conf_id, copay, deduct, units, drg, dstatus, 
                               enctr, hccc, loc_cd, paid_dt, paid_status, procmod, prov_par, refer_prov, service_prov, std_cost, std_cost_yr, 
                               tos_cd, extract_ym, version) {
  defaults <- get('medical_claims', envir = defaultValues)
  insertFields <- c()
  insertValues <- c()
  if (missing(pat_planid)) {
    pat_planid <- defaults$pat_planid
  }
  if (!is.null(pat_planid)) {
    insertFields <- c(insertFields, "pat_planid")
    insertValues <- c(insertValues, pat_planid)
  }
  
  if (missing(patid)) {
    patid <- defaults$patid
  }
  if (!is.null(patid)) {
    insertFields <- c(insertFields, "patid")
    insertValues <- c(insertValues, patid)
  }
  
  if (missing(proc_cd)) {
    proc_cd <- defaults$proc_cd
  }
  if (!is.null(proc_cd)) {
    insertFields <- c(insertFields, "proc_cd")
    insertValues <- c(insertValues, proc_cd)
  }
  
  if (missing(pos)) {
    pos <- defaults$pos
  }
  if (!is.null(pos)) {
    insertFields <- c(insertFields, "pos")
    insertValues <- c(insertValues, pos)
  }
  
  if (missing(ndc)) {
    ndc <- defaults$ndc
  }
  if (!is.null(ndc)) {
    insertFields <- c(insertFields, "ndc")
    insertValues <- c(insertValues, ndc)
  }
  
  if (missing(rvnu_cd)) {
    rvnu_cd <- defaults$rvnu_cd
  }
  if (!is.null(rvnu_cd)) {
    insertFields <- c(insertFields, "rvnu_cd")
    insertValues <- c(insertValues, rvnu_cd)
  }
  
  if (missing(icd_flag)) {
    icd_flag <- defaults$icd_flag
  }
  if (!is.null(icd_flag)) {
    insertFields <- c(insertFields, "icd_flag")
    insertValues <- c(insertValues, icd_flag)
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
  
  if (missing(fst_dt)) {
    fst_dt <- defaults$fst_dt
  }
  if (!is.null(fst_dt)) {
    insertFields <- c(insertFields, "fst_dt")
    insertValues <- c(insertValues, fst_dt)
  }
  
  if (missing(admit_chan)) {
    admit_chan <- defaults$admit_chan
  }
  if (!is.null(admit_chan)) {
    insertFields <- c(insertFields, "admit_chan")
    insertValues <- c(insertValues, admit_chan)
  }
  
  if (missing(lst_dt)) {
    lst_dt <- defaults$lst_dt
  }
  if (!is.null(lst_dt)) {
    insertFields <- c(insertFields, "lst_dt")
    insertValues <- c(insertValues, lst_dt)
  }
  
  if (missing(admit_type)) {
    admit_type <- defaults$admit_type
  }
  if (!is.null(admit_type)) {
    insertFields <- c(insertFields, "admit_type")
    insertValues <- c(insertValues, admit_type)
  }
  
  if (missing(bill_prov)) {
    bill_prov <- defaults$bill_prov
  }
  if (!is.null(bill_prov)) {
    insertFields <- c(insertFields, "bill_prov")
    insertValues <- c(insertValues, bill_prov)
  }
  
  if (missing(charge)) {
    charge <- defaults$charge
  }
  if (!is.null(charge)) {
    insertFields <- c(insertFields, "charge")
    insertValues <- c(insertValues, charge)
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
  
  if (missing(cob)) {
    cob <- defaults$cob
  }
  if (!is.null(cob)) {
    insertFields <- c(insertFields, "cob")
    insertValues <- c(insertValues, cob)
  }
  
  if (missing(coins)) {
    coins <- defaults$coins
  }
  if (!is.null(coins)) {
    insertFields <- c(insertFields, "coins")
    insertValues <- c(insertValues, coins)
  }
  
  if (missing(conf_id)) {
    conf_id <- defaults$conf_id
  }
  if (!is.null(conf_id)) {
    insertFields <- c(insertFields, "conf_id")
    insertValues <- c(insertValues, conf_id)
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
  
  if (missing(units)) {
    units <- defaults$units
  }
  if (!is.null(units)) {
    insertFields <- c(insertFields, "units")
    insertValues <- c(insertValues, units)
  }
  
  if (missing(drg)) {
    drg <- defaults$drg
  }
  if (!is.null(drg)) {
    insertFields <- c(insertFields, "drg")
    insertValues <- c(insertValues, drg)
  }
  
  if (missing(dstatus)) {
    dstatus <- defaults$dstatus
  }
  if (!is.null(dstatus)) {
    insertFields <- c(insertFields, "dstatus")
    insertValues <- c(insertValues, dstatus)
  }
  
  if (missing(enctr)) {
    enctr <- defaults$enctr
  }
  if (!is.null(enctr)) {
    insertFields <- c(insertFields, "enctr")
    insertValues <- c(insertValues, enctr)
  }
  
  if (missing(hccc)) {
    hccc <- defaults$hccc
  }
  if (!is.null(hccc)) {
    insertFields <- c(insertFields, "hccc")
    insertValues <- c(insertValues, hccc)
  }
  
  if (missing(loc_cd)) {
    loc_cd <- defaults$loc_cd
  }
  if (!is.null(loc_cd)) {
    insertFields <- c(insertFields, "loc_cd")
    insertValues <- c(insertValues, loc_cd)
  }
  
  if (missing(paid_dt)) {
    paid_dt <- defaults$paid_dt
  }
  if (!is.null(paid_dt)) {
    insertFields <- c(insertFields, "paid_dt")
    insertValues <- c(insertValues, paid_dt)
  }
  
  if (missing(paid_status)) {
    paid_status <- defaults$paid_status
  }
  if (!is.null(paid_status)) {
    insertFields <- c(insertFields, "paid_status")
    insertValues <- c(insertValues, paid_status)
  }
  
  if (missing(procmod)) {
    procmod <- defaults$procmod
  }
  if (!is.null(procmod)) {
    insertFields <- c(insertFields, "procmod")
    insertValues <- c(insertValues, procmod)
  }
  
  if (missing(prov_par)) {
    prov_par <- defaults$prov_par
  }
  if (!is.null(prov_par)) {
    insertFields <- c(insertFields, "prov_par")
    insertValues <- c(insertValues, prov_par)
  }
  
  if (missing(refer_prov)) {
    refer_prov <- defaults$refer_prov
  }
  if (!is.null(refer_prov)) {
    insertFields <- c(insertFields, "refer_prov")
    insertValues <- c(insertValues, refer_prov)
  }
  
  if (missing(service_prov)) {
    service_prov <- defaults$service_prov
  }
  if (!is.null(service_prov)) {
    insertFields <- c(insertFields, "service_prov")
    insertValues <- c(insertValues, service_prov)
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
  
  if (missing(extract_ym)) {
    extract_ym <- defaults$extract_ym
  }
  if (!is.null(extract_ym)) {
    insertFields <- c(insertFields, "extract_ym")
    insertValues <- c(insertValues, extract_ym)
  }
  
  if (missing(version)) {
    version <- defaults$version
  }
  if (!is.null(version)) {
    insertFields <- c(insertFields, "version")
    insertValues <- c(insertValues, version)
  }
  
  
  
  if (exists('testNewAdded', where = globalenv()) && get('testNewAdded'))
  {
    assign('testNewAdded', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    insertDf[nrow(insertDf) + 1,] <<- c('medical_claims', comment)
  }
  statement <- paste0("INSERT INTO @nativeDatabaseSchema.medical_claims (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  insertDf[nrow(insertDf) + 1,] <<- c('medical_claims', statement)
  invisible(statement)
}

add_provider_bridge <- function(prov_unique, npi, dea, prov, extract_ym, version) {
  defaults <- get('provider_bridge', envir = defaultValues)
  insertFields <- c()
  insertValues <- c()
  if (missing(prov_unique)) {
    prov_unique <- defaults$prov_unique
  }
  if (!is.null(prov_unique)) {
    insertFields <- c(insertFields, "prov_unique")
    insertValues <- c(insertValues, prov_unique)
  }
  
  if (missing(npi)) {
    npi <- defaults$npi
  }
  if (!is.null(npi)) {
    insertFields <- c(insertFields, "npi")
    insertValues <- c(insertValues, npi)
  }
  
  if (missing(dea)) {
    dea <- defaults$dea
  }
  if (!is.null(dea)) {
    insertFields <- c(insertFields, "dea")
    insertValues <- c(insertValues, dea)
  }
  
  if (missing(prov)) {
    prov <- defaults$prov
  }
  if (!is.null(prov)) {
    insertFields <- c(insertFields, "prov")
    insertValues <- c(insertValues, prov)
  }
  
  if (missing(extract_ym)) {
    extract_ym <- defaults$extract_ym
  }
  if (!is.null(extract_ym)) {
    insertFields <- c(insertFields, "extract_ym")
    insertValues <- c(insertValues, extract_ym)
  }
  
  if (missing(version)) {
    version <- defaults$version
  }
  if (!is.null(version)) {
    insertFields <- c(insertFields, "version")
    insertValues <- c(insertValues, version)
  }
  
  if (exists('testNewAdded', where = globalenv()) && get('testNewAdded'))
  {
    assign('testNewAdded', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    insertDf[nrow(insertDf) + 1,] <<- c('provider_bridge', comment)
  }
  statement <- paste0("INSERT INTO @nativeDatabaseSchema.provider_bridge (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  insertDf[nrow(insertDf) + 1,] <<- c('provider_bridge', statement)
  invisible(statement)
}

add_provider <- function(prov_unique, bed_sz_range, cred_type, grp_practice, hosp_affil, prov_state, prov_type, provcat, taxonomy1, taxonomy2, extract_ym, version) {
  defaults <- get('provider', envir = defaultValues)
  insertFields <- c()
  insertValues <- c()
  if (missing(prov_unique)) {
    prov_unique <- defaults$prov_unique
  }
  if (!is.null(prov_unique)) {
    insertFields <- c(insertFields, "prov_unique")
    insertValues <- c(insertValues, prov_unique)
  }
  
  if (missing(bed_sz_range)) {
    bed_sz_range <- defaults$bed_sz_range
  }
  if (!is.null(bed_sz_range)) {
    insertFields <- c(insertFields, "bed_sz_range")
    insertValues <- c(insertValues, bed_sz_range)
  }
  
  if (missing(cred_type)) {
    cred_type <- defaults$cred_type
  }
  if (!is.null(cred_type)) {
    insertFields <- c(insertFields, "cred_type")
    insertValues <- c(insertValues, cred_type)
  }
  
  if (missing(grp_practice)) {
    grp_practice <- defaults$grp_practice
  }
  if (!is.null(grp_practice)) {
    insertFields <- c(insertFields, "grp_practice")
    insertValues <- c(insertValues, grp_practice)
  }
  
  if (missing(hosp_affil)) {
    hosp_affil <- defaults$hosp_affil
  }
  if (!is.null(hosp_affil)) {
    insertFields <- c(insertFields, "hosp_affil")
    insertValues <- c(insertValues, hosp_affil)
  }
  
  if (missing(prov_state)) {
    prov_state <- defaults$prov_state
  }
  if (!is.null(prov_state)) {
    insertFields <- c(insertFields, "prov_state")
    insertValues <- c(insertValues, prov_state)
  }
  
  if (missing(prov_type)) {
    prov_type <- defaults$prov_type
  }
  if (!is.null(prov_type)) {
    insertFields <- c(insertFields, "prov_type")
    insertValues <- c(insertValues, prov_type)
  }
  
  if (missing(provcat)) {
    provcat <- defaults$provcat
  }
  if (!is.null(provcat)) {
    insertFields <- c(insertFields, "provcat")
    insertValues <- c(insertValues, provcat)
  }
  
  if (missing(taxonomy1)) {
    taxonomy1 <- defaults$taxonomy1
  }
  if (!is.null(taxonomy1)) {
    insertFields <- c(insertFields, "taxonomy1")
    insertValues <- c(insertValues, taxonomy1)
  }
  
  if (missing(taxonomy2)) {
    taxonomy2 <- defaults$taxonomy2
  }
  if (!is.null(taxonomy2)) {
    insertFields <- c(insertFields, "taxonomy2")
    insertValues <- c(insertValues, taxonomy2)
  }
  
  if (missing(extract_ym)) {
    extract_ym <- defaults$extract_ym
  }
  if (!is.null(extract_ym)) {
    insertFields <- c(insertFields, "extract_ym")
    insertValues <- c(insertValues, extract_ym)
  }
  
  if (missing(version)) {
    version <- defaults$version
  }
  if (!is.null(version)) {
    insertFields <- c(insertFields, "version")
    insertValues <- c(insertValues, version)
  }
  
  if (exists('testNewAdded', where = globalenv()) && get('testNewAdded'))
  {
    assign('testNewAdded', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    insertDf[nrow(insertDf) + 1,] <<- c('provider', comment)
  }
  statement <- paste0("INSERT INTO @nativeDatabaseSchema.provider (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  insertDf[nrow(insertDf) + 1,] <<- c('provider', statement)
  invisible(statement)
}

add_med_diagnosis <- function(patid, pat_planid, icd_flag, diag, clmid, diag_position, loc_cd, poa, extract_ym, version) {
  defaults <- get('med_diagnosis', envir = defaultValues)
  insertFields <- c()
  insertValues <- c()
  if (missing(patid)) {
    patid <- defaults$patid
  }
  if (!is.null(patid)) {
    insertFields <- c(insertFields, "patid")
    insertValues <- c(insertValues, patid)
  }
  
  if (missing(pat_planid)) {
    pat_planid <- defaults$pat_planid
  }
  if (!is.null(pat_planid)) {
    insertFields <- c(insertFields, "pat_planid")
    insertValues <- c(insertValues, pat_planid)
  }
  
  if (missing(icd_flag)) {
    icd_flag <- defaults$icd_flag
  }
  if (!is.null(icd_flag)) {
    insertFields <- c(insertFields, "icd_flag")
    insertValues <- c(insertValues, icd_flag)
  }
  
  if (missing(diag)) {
    diag <- defaults$diag
  }
  if (!is.null(diag)) {
    insertFields <- c(insertFields, "diag")
    insertValues <- c(insertValues, diag)
  }
  
  if (missing(clmid)) {
    clmid <- defaults$clmid
  }
  if (!is.null(clmid)) {
    insertFields <- c(insertFields, "clmid")
    insertValues <- c(insertValues, clmid)
  }
  
  if (missing(diag_position)) {
    diag_position <- defaults$diag_position
  }
  if (!is.null(diag_position)) {
    insertFields <- c(insertFields, "diag_position")
    insertValues <- c(insertValues, diag_position)
  }
  
  if (missing(loc_cd)) {
    loc_cd <- defaults$loc_cd
  }
  if (!is.null(loc_cd)) {
    insertFields <- c(insertFields, "loc_cd")
    insertValues <- c(insertValues, loc_cd)
  }
  
  if (missing(poa)) {
    poa <- defaults$poa
  }
  if (!is.null(poa)) {
    insertFields <- c(insertFields, "poa")
    insertValues <- c(insertValues, poa)
  }
  
  if (missing(extract_ym)) {
    extract_ym <- defaults$extract_ym
  }
  if (!is.null(extract_ym)) {
    insertFields <- c(insertFields, "extract_ym")
    insertValues <- c(insertValues, extract_ym)
  }
  
  if (missing(version)) {
    version <- defaults$version
  }
  if (!is.null(version)) {
    insertFields <- c(insertFields, "version")
    insertValues <- c(insertValues, version)
  }
  
  
  if (exists('testNewAdded', where = globalenv()) && get('testNewAdded'))
  {
    assign('testNewAdded', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    insertDf[nrow(insertDf) + 1,] <<- c('med_diagnosis', comment)
  }
  statement <- paste0("INSERT INTO @nativeDatabaseSchema.med_diagnosis (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  insertDf[nrow(insertDf) + 1,] <<- c('med_diagnosis', statement)
  invisible(statement)
}

add_death <- function(patid, ymdod, version, extract_ym) {
  defaults <- get('death', envir = defaultValues)
  insertFields <- c()
  insertValues <- c()
  if (missing(patid)) {
    patid <- defaults$patid
  }
  if (!is.null(patid)) {
    insertFields <- c(insertFields, "patid")
    insertValues <- c(insertValues, patid)
  }
  
  if (missing(ymdod)) {
    ymdod <- defaults$ymdod
  }
  if (!is.null(ymdod)) {
    insertFields <- c(insertFields, "ymdod")
    insertValues <- c(insertValues, ymdod)
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
  
  if (exists('testNewAdded', where = globalenv()) && get('testNewAdded'))
  {
    assign('testNewAdded', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    insertDf[nrow(insertDf) + 1,] <<- c('death', comment)
  }
  statement <- paste0("INSERT INTO @nativeDatabaseSchema.death (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  insertDf[nrow(insertDf) + 1,] <<- c('death', statement)
  invisible(statement)
}

add_facility_detail <- function(patid, pat_planid, charge_alloc, clmid, clmseq, detail_line_nbr, fst_dt, proc_cd, procmod, rvnu_cd, std_cost, std_cost_yr, units, extract_ym, version) {
  defaults <- get('facility_detail', envir = defaultValues)
  insertFields <- c()
  insertValues <- c()
  if (missing(patid)) {
    patid <- defaults$patid
  }
  if (!is.null(patid)) {
    insertFields <- c(insertFields, "patid")
    insertValues <- c(insertValues, patid)
  }
  
  if (missing(pat_planid)) {
    pat_planid <- defaults$pat_planid
  }
  if (!is.null(pat_planid)) {
    insertFields <- c(insertFields, "pat_planid")
    insertValues <- c(insertValues, pat_planid)
  }
  
  if (missing(charge_alloc)) {
    charge_alloc <- defaults$charge_alloc
  }
  if (!is.null(charge_alloc)) {
    insertFields <- c(insertFields, "charge_alloc")
    insertValues <- c(insertValues, charge_alloc)
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
  
  if (missing(detail_line_nbr)) {
    detail_line_nbr <- defaults$detail_line_nbr
  }
  if (!is.null(detail_line_nbr)) {
    insertFields <- c(insertFields, "detail_line_nbr")
    insertValues <- c(insertValues, detail_line_nbr)
  }
  
  if (missing(fst_dt)) {
    fst_dt <- defaults$fst_dt
  }
  if (!is.null(fst_dt)) {
    insertFields <- c(insertFields, "fst_dt")
    insertValues <- c(insertValues, fst_dt)
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
  
  if (missing(rvnu_cd)) {
    rvnu_cd <- defaults$rvnu_cd
  }
  if (!is.null(rvnu_cd)) {
    insertFields <- c(insertFields, "rvnu_cd")
    insertValues <- c(insertValues, rvnu_cd)
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
  
  if (missing(units)) {
    units <- defaults$units
  }
  if (!is.null(units)) {
    insertFields <- c(insertFields, "units")
    insertValues <- c(insertValues, units)
  }
  
  if (missing(extract_ym)) {
    extract_ym <- defaults$extract_ym
  }
  if (!is.null(extract_ym)) {
    insertFields <- c(insertFields, "extract_ym")
    insertValues <- c(insertValues, extract_ym)
  }
  
  if (missing(version)) {
    version <- defaults$version
  }
  if (!is.null(version)) {
    insertFields <- c(insertFields, "version")
    insertValues <- c(insertValues, version)
  }
  
  if (exists('testNewAdded', where = globalenv()) && get('testNewAdded'))
  {
    assign('testNewAdded', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    insertDf[nrow(insertDf) + 1,] <<- c('facility_detail', comment)
  }
  statement <- paste0("INSERT INTO @nativeDatabaseSchema.facility_detail (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  insertDf[nrow(insertDf) + 1,] <<- c('facility_detail', statement)
  invisible(statement)
}

add_rx_claims <- function(patid, pat_planid, ahfsclss, avgwhlsl, brnd_nm, charge, chk_dt, clmid, copay, daw, days_sup, dea, deduct, dispfee, fill_dt, form_ind, form_typ, fst_fill, gnrc_ind, gnrc_nm, ndc, mail_ind, npi, pharm, prc_typ, quantity, rfl_nbr, spclt_ind, specclss, std_cost, std_cost_yr, strength, extract_ym, version, gpi) {
  defaults <- get('rx_claims', envir = defaultValues)
  insertFields <- c()
  insertValues <- c()
  if (missing(patid)) {
    patid <- defaults$patid
  }
  if (!is.null(patid)) {
    insertFields <- c(insertFields, "patid")
    insertValues <- c(insertValues, patid)
  }
  
  if (missing(pat_planid)) {
    pat_planid <- defaults$pat_planid
  }
  if (!is.null(pat_planid)) {
    insertFields <- c(insertFields, "pat_planid")
    insertValues <- c(insertValues, pat_planid)
  }
  
  if (missing(ahfsclss)) {
    ahfsclss <- defaults$ahfsclss
  }
  if (!is.null(ahfsclss)) {
    insertFields <- c(insertFields, "ahfsclss")
    insertValues <- c(insertValues, ahfsclss)
  }
  
  if (missing(avgwhlsl)) {
    avgwhlsl <- defaults$avgwhlsl
  }
  if (!is.null(avgwhlsl)) {
    insertFields <- c(insertFields, "avgwhlsl")
    insertValues <- c(insertValues, avgwhlsl)
  }
  
  if (missing(brnd_nm)) {
    brnd_nm <- defaults$brnd_nm
  }
  if (!is.null(brnd_nm)) {
    insertFields <- c(insertFields, "brnd_nm")
    insertValues <- c(insertValues, brnd_nm)
  }
  
  if (missing(charge)) {
    charge <- defaults$charge
  }
  if (!is.null(charge)) {
    insertFields <- c(insertFields, "charge")
    insertValues <- c(insertValues, charge)
  }
  
  if (missing(chk_dt)) {
    chk_dt <- defaults$chk_dt
  }
  if (!is.null(chk_dt)) {
    insertFields <- c(insertFields, "chk_dt")
    insertValues <- c(insertValues, chk_dt)
  }
  
  if (missing(clmid)) {
    clmid <- defaults$clmid
  }
  if (!is.null(clmid)) {
    insertFields <- c(insertFields, "clmid")
    insertValues <- c(insertValues, clmid)
  }
  
  if (missing(copay)) {
    copay <- defaults$copay
  }
  if (!is.null(copay)) {
    insertFields <- c(insertFields, "copay")
    insertValues <- c(insertValues, copay)
  }
  
  if (missing(daw)) {
    daw <- defaults$daw
  }
  if (!is.null(daw)) {
    insertFields <- c(insertFields, "daw")
    insertValues <- c(insertValues, daw)
  }
  
  if (missing(days_sup)) {
    days_sup <- defaults$days_sup
  }
  if (!is.null(days_sup)) {
    insertFields <- c(insertFields, "days_sup")
    insertValues <- c(insertValues, days_sup)
  }
  
  if (missing(dea)) {
    dea <- defaults$dea
  }
  if (!is.null(dea)) {
    insertFields <- c(insertFields, "dea")
    insertValues <- c(insertValues, dea)
  }
  
  if (missing(deduct)) {
    deduct <- defaults$deduct
  }
  if (!is.null(deduct)) {
    insertFields <- c(insertFields, "deduct")
    insertValues <- c(insertValues, deduct)
  }
  
  if (missing(dispfee)) {
    dispfee <- defaults$dispfee
  }
  if (!is.null(dispfee)) {
    insertFields <- c(insertFields, "dispfee")
    insertValues <- c(insertValues, dispfee)
  }
  
  if (missing(fill_dt)) {
    fill_dt <- defaults$fill_dt
  }
  if (!is.null(fill_dt)) {
    insertFields <- c(insertFields, "fill_dt")
    insertValues <- c(insertValues, fill_dt)
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
  
  if (missing(fst_fill)) {
    fst_fill <- defaults$fst_fill
  }
  if (!is.null(fst_fill)) {
    insertFields <- c(insertFields, "fst_fill")
    insertValues <- c(insertValues, fst_fill)
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
  
  if (missing(ndc)) {
    ndc <- defaults$ndc
  }
  if (!is.null(ndc)) {
    insertFields <- c(insertFields, "ndc")
    insertValues <- c(insertValues, ndc)
  }
  
  if (missing(mail_ind)) {
    mail_ind <- defaults$mail_ind
  }
  if (!is.null(mail_ind)) {
    insertFields <- c(insertFields, "mail_ind")
    insertValues <- c(insertValues, mail_ind)
  }
  
  if (missing(npi)) {
    npi <- defaults$npi
  }
  if (!is.null(npi)) {
    insertFields <- c(insertFields, "npi")
    insertValues <- c(insertValues, npi)
  }
  
  if (missing(pharm)) {
    pharm <- defaults$pharm
  }
  if (!is.null(pharm)) {
    insertFields <- c(insertFields, "pharm")
    insertValues <- c(insertValues, pharm)
  }
  
  if (missing(prc_typ)) {
    prc_typ <- defaults$prc_typ
  }
  if (!is.null(prc_typ)) {
    insertFields <- c(insertFields, "prc_typ")
    insertValues <- c(insertValues, prc_typ)
  }
  
  if (missing(quantity)) {
    quantity <- defaults$quantity
  }
  if (!is.null(quantity)) {
    insertFields <- c(insertFields, "quantity")
    insertValues <- c(insertValues, quantity)
  }
  
  if (missing(rfl_nbr)) {
    rfl_nbr <- defaults$rfl_nbr
  }
  if (!is.null(rfl_nbr)) {
    insertFields <- c(insertFields, "rfl_nbr")
    insertValues <- c(insertValues, rfl_nbr)
  }
  
  if (missing(spclt_ind)) {
    spclt_ind <- defaults$spclt_ind
  }
  if (!is.null(spclt_ind)) {
    insertFields <- c(insertFields, "spclt_ind")
    insertValues <- c(insertValues, spclt_ind)
  }
  
  if (missing(specclss)) {
    specclss <- defaults$specclss
  }
  if (!is.null(specclss)) {
    insertFields <- c(insertFields, "specclss")
    insertValues <- c(insertValues, specclss)
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
  
  if (missing(strength)) {
    strength <- defaults$strength
  }
  if (!is.null(strength)) {
    insertFields <- c(insertFields, "strength")
    insertValues <- c(insertValues, strength)
  }
  
  if (missing(extract_ym)) {
    extract_ym <- defaults$extract_ym
  }
  if (!is.null(extract_ym)) {
    insertFields <- c(insertFields, "extract_ym")
    insertValues <- c(insertValues, extract_ym)
  }
  
  if (missing(version)) {
    version <- defaults$version
  }
  if (!is.null(version)) {
    insertFields <- c(insertFields, "version")
    insertValues <- c(insertValues, version)
  }
  
  if (missing(gpi)) {
    gpi <- defaults$gpi
  }
  if (!is.null(gpi)) {
    insertFields <- c(insertFields, "gpi")
    insertValues <- c(insertValues, gpi)
  }
  
  if (exists('testNewAdded', where = globalenv()) && get('testNewAdded'))
  {
    assign('testNewAdded', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    insertDf[nrow(insertDf) + 1,] <<- c('rx_claims', comment)
  }
  statement <- paste0("INSERT INTO @nativeDatabaseSchema.rx_claims (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  insertDf[nrow(insertDf) + 1,] <<- c('rx_claims', statement)
  invisible(statement)
}

add_med_procedure <- function(patid, pat_planid, proc, clmid, icd_flag, proc_position, extract_ym, version) {
  defaults <- get('med_procedure', envir = defaultValues)
  insertFields <- c()
  insertValues <- c()
  if (missing(patid)) {
    patid <- defaults$patid
  }
  if (!is.null(patid)) {
    insertFields <- c(insertFields, "patid")
    insertValues <- c(insertValues, patid)
  }
  
  if (missing(pat_planid)) {
    pat_planid <- defaults$pat_planid
  }
  if (!is.null(pat_planid)) {
    insertFields <- c(insertFields, "pat_planid")
    insertValues <- c(insertValues, pat_planid)
  }
  
  if (missing(proc)) {
    proc <- defaults$proc
  }
  if (!is.null(proc)) {
    insertFields <- c(insertFields, "[proc]")
    insertValues <- c(insertValues, proc)
  }
  
  if (missing(clmid)) {
    clmid <- defaults$clmid
  }
  if (!is.null(clmid)) {
    insertFields <- c(insertFields, "clmid")
    insertValues <- c(insertValues, clmid)
  }
  
  if (missing(icd_flag)) {
    icd_flag <- defaults$icd_flag
  }
  if (!is.null(icd_flag)) {
    insertFields <- c(insertFields, "icd_flag")
    insertValues <- c(insertValues, icd_flag)
  }
  
  if (missing(proc_position)) {
    proc_position <- defaults$proc_position
  }
  if (!is.null(proc_position)) {
    insertFields <- c(insertFields, "proc_position")
    insertValues <- c(insertValues, proc_position)
  }
  
  if (missing(extract_ym)) {
    extract_ym <- defaults$extract_ym
  }
  if (!is.null(extract_ym)) {
    insertFields <- c(insertFields, "extract_ym")
    insertValues <- c(insertValues, extract_ym)
  }
  
  if (missing(version)) {
    version <- defaults$version
  }
  if (!is.null(version)) {
    insertFields <- c(insertFields, "version")
    insertValues <- c(insertValues, version)
  }
  
  
  if (exists('testNewAdded', where = globalenv()) && get('testNewAdded'))
  {
    assign('testNewAdded', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    insertDf[nrow(insertDf) + 1,] <<- c('med_procedure', comment)
  }
  statement <- paste0("INSERT INTO @nativeDatabaseSchema.med_procedure (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  insertDf[nrow(insertDf) + 1,] <<- c('med_procedure', statement)
  invisible(statement)
}

add_inpatient_confinement <- function(patid, pat_planid, admit_date, charge, coins, conf_id, copay, deduct, diag1, diag2, diag3, diag4, diag5, disch_date, drg, dstatus, icd_flag, ipstatus, los, pos, proc1, proc2, proc3, proc4, proc5, prov, std_cost, std_cost_yr, tos_cd, extract_ym, version) {
  defaults <- get('inpatient_confinement', envir = defaultValues)
  insertFields <- c()
  insertValues <- c()
  if (missing(patid)) {
    patid <- defaults$patid
  }
  if (!is.null(patid)) {
    insertFields <- c(insertFields, "patid")
    insertValues <- c(insertValues, patid)
  }
  
  if (missing(pat_planid)) {
    pat_planid <- defaults$pat_planid
  }
  if (!is.null(pat_planid)) {
    insertFields <- c(insertFields, "pat_planid")
    insertValues <- c(insertValues, pat_planid)
  }
  
  if (missing(admit_date)) {
    admit_date <- defaults$admit_date
  }
  if (!is.null(admit_date)) {
    insertFields <- c(insertFields, "admit_date")
    insertValues <- c(insertValues, admit_date)
  }
  
  if (missing(charge)) {
    charge <- defaults$charge
  }
  if (!is.null(charge)) {
    insertFields <- c(insertFields, "charge")
    insertValues <- c(insertValues, charge)
  }
  
  if (missing(coins)) {
    coins <- defaults$coins
  }
  if (!is.null(coins)) {
    insertFields <- c(insertFields, "coins")
    insertValues <- c(insertValues, coins)
  }
  
  if (missing(conf_id)) {
    conf_id <- defaults$conf_id
  }
  if (!is.null(conf_id)) {
    insertFields <- c(insertFields, "conf_id")
    insertValues <- c(insertValues, conf_id)
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
  
  if (missing(disch_date)) {
    disch_date <- defaults$disch_date
  }
  if (!is.null(disch_date)) {
    insertFields <- c(insertFields, "disch_date")
    insertValues <- c(insertValues, disch_date)
  }
  
  if (missing(drg)) {
    drg <- defaults$drg
  }
  if (!is.null(drg)) {
    insertFields <- c(insertFields, "drg")
    insertValues <- c(insertValues, drg)
  }
  
  if (missing(dstatus)) {
    dstatus <- defaults$dstatus
  }
  if (!is.null(dstatus)) {
    insertFields <- c(insertFields, "dstatus")
    insertValues <- c(insertValues, dstatus)
  }
  
  if (missing(icd_flag)) {
    icd_flag <- defaults$icd_flag
  }
  if (!is.null(icd_flag)) {
    insertFields <- c(insertFields, "icd_flag")
    insertValues <- c(insertValues, icd_flag)
  }
  
  if (missing(ipstatus)) {
    ipstatus <- defaults$ipstatus
  }
  if (!is.null(ipstatus)) {
    insertFields <- c(insertFields, "ipstatus")
    insertValues <- c(insertValues, ipstatus)
  }
  
  if (missing(los)) {
    los <- defaults$los
  }
  if (!is.null(los)) {
    insertFields <- c(insertFields, "los")
    insertValues <- c(insertValues, los)
  }
  
  if (missing(pos)) {
    pos <- defaults$pos
  }
  if (!is.null(pos)) {
    insertFields <- c(insertFields, "pos")
    insertValues <- c(insertValues, pos)
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
  
  if (missing(prov)) {
    prov <- defaults$prov
  }
  if (!is.null(prov)) {
    insertFields <- c(insertFields, "prov")
    insertValues <- c(insertValues, prov)
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
  
  if (missing(extract_ym)) {
    extract_ym <- defaults$extract_ym
  }
  if (!is.null(extract_ym)) {
    insertFields <- c(insertFields, "extract_ym")
    insertValues <- c(insertValues, extract_ym)
  }
  
  if (missing(version)) {
    version <- defaults$version
  }
  if (!is.null(version)) {
    insertFields <- c(insertFields, "version")
    insertValues <- c(insertValues, version)
  }
  
  if (exists('testNewAdded', where = globalenv()) && get('testNewAdded'))
  {
    assign('testNewAdded', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    insertDf[nrow(insertDf) + 1,] <<- c('inpatient_confinement', comment)
  }
  statement <- paste0("INSERT INTO @nativeDatabaseSchema.inpatient_confinement (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  insertDf[nrow(insertDf) + 1,] <<- c('inpatient_confinement', statement)
  invisible(statement)
}

add_member <- function(patid, aso, bus, cdhp, eligeff, eligend, family_id, gdr_cd, group_nbr, health_exch, product, state, yrdob, extract_ym, version) {
  defaults <- get('member', envir = defaultValues)
  insertFields <- c()
  insertValues <- c()
  if (missing(patid)) {
    patid <- defaults$patid
  }
  if (!is.null(patid)) {
    insertFields <- c(insertFields, "patid")
    insertValues <- c(insertValues, patid)
  }
  
  if (missing(aso)) {
    aso <- defaults$aso
  }
  if (!is.null(aso)) {
    insertFields <- c(insertFields, "aso")
    insertValues <- c(insertValues, aso)
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
  
  if (missing(family_id)) {
    family_id <- defaults$family_id
  }
  if (!is.null(family_id)) {
    insertFields <- c(insertFields, "family_id")
    insertValues <- c(insertValues, family_id)
  }
  
  if (missing(gdr_cd)) {
    gdr_cd <- defaults$gdr_cd
  }
  if (!is.null(gdr_cd)) {
    insertFields <- c(insertFields, "gdr_cd")
    insertValues <- c(insertValues, gdr_cd)
  }
  
  if (missing(group_nbr)) {
    group_nbr <- defaults$group_nbr
  }
  if (!is.null(group_nbr)) {
    insertFields <- c(insertFields, "group_nbr")
    insertValues <- c(insertValues, group_nbr)
  }
  
  if (missing(health_exch)) {
    health_exch <- defaults$health_exch
  }
  if (!is.null(health_exch)) {
    insertFields <- c(insertFields, "health_exch")
    insertValues <- c(insertValues, health_exch)
  }
  
  if (missing(product)) {
    product <- defaults$product
  }
  if (!is.null(product)) {
    insertFields <- c(insertFields, "product")
    insertValues <- c(insertValues, product)
  }
  
  if (missing(state)) {
    state <- defaults$state
  }
  if (!is.null(state)) {
    insertFields <- c(insertFields, "state")
    insertValues <- c(insertValues, state)
  }
  
  if (missing(yrdob)) {
    yrdob <- defaults$yrdob
  }
  if (!is.null(yrdob)) {
    insertFields <- c(insertFields, "yrdob")
    insertValues <- c(insertValues, yrdob)
  }
  
  if (missing(extract_ym)) {
    extract_ym <- defaults$extract_ym
  }
  if (!is.null(extract_ym)) {
    insertFields <- c(insertFields, "extract_ym")
    insertValues <- c(insertValues, extract_ym)
  }
  
  if (missing(version)) {
    version <- defaults$version
  }
  if (!is.null(version)) {
    insertFields <- c(insertFields, "version")
    insertValues <- c(insertValues, version)
  }
  
  if (exists('testNewAdded', where = globalenv()) && get('testNewAdded'))
  {
    assign('testNewAdded', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    insertDf[nrow(insertDf) + 1,] <<- c('member', comment)
  }
  statement <- paste0("INSERT INTO @nativeDatabaseSchema.member (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  insertDf[nrow(insertDf) + 1,] <<- c('member', statement)
  invisible(statement)
}

add_lu_diagnosis <- function(diag_cd, diag_desc, diag_fst3_cd, diag_fst3_desc, diag_fst4_cd, diag_fst4_desc, gdr_spec_cd, mdc_cd_desc, mdc_code, icd_ver_cd) {
  defaults <- get('lu_diagnosis', envir = defaultValues)
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
  
  if (missing(gdr_spec_cd)) {
    gdr_spec_cd <- defaults$gdr_spec_cd
  }
  if (!is.null(gdr_spec_cd)) {
    insertFields <- c(insertFields, "gdr_spec_cd")
    insertValues <- c(insertValues, gdr_spec_cd)
  }
  
  if (missing(mdc_cd_desc)) {
    mdc_cd_desc <- defaults$mdc_cd_desc
  }
  if (!is.null(mdc_cd_desc)) {
    insertFields <- c(insertFields, "mdc_cd_desc")
    insertValues <- c(insertValues, mdc_cd_desc)
  }
  
  if (missing(mdc_code)) {
    mdc_code <- defaults$mdc_code
  }
  if (!is.null(mdc_code)) {
    insertFields <- c(insertFields, "mdc_code")
    insertValues <- c(insertValues, mdc_code)
  }
  
  if (missing(icd_ver_cd)) {
    icd_ver_cd <- defaults$icd_ver_cd
  }
  if (!is.null(icd_ver_cd)) {
    insertFields <- c(insertFields, "icd_ver_cd")
    insertValues <- c(insertValues, icd_ver_cd)
  }
  
  if (exists('testNewAdded', where = globalenv()) && get('testNewAdded'))
  {
    assign('testNewAdded', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    insertDf[nrow(insertDf) + 1,] <<- c('lu_diagnosis', comment)
  }
  statement <- paste0("INSERT INTO @nativeDatabaseSchema.lu_diagnosis (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  insertDf[nrow(insertDf) + 1,] <<- c('lu_diagnosis', statement)
  invisible(statement)
}

add_lu_ndc <- function(ahfsclss, ahfsclss_desc, brnd_nm, dosage_fm_desc, drg_strgth_desc, drg_strgth_nbr, drg_strgth_unit_desc, drg_strgth_vol_nbr, drg_strgth_vol_unit_desc, gnrc_ind, gnrc_nbr, gnrc_nm, gnrc_sqnc_nbr, ndc, ndc_drg_row_eff_dt, ndc_drg_row_end_dt, usc_id, usc_med_desc) {
  defaults <- get('lu_ndc', envir = defaultValues)
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
  
  if (missing(gnrc_nbr)) {
    gnrc_nbr <- defaults$gnrc_nbr
  }
  if (!is.null(gnrc_nbr)) {
    insertFields <- c(insertFields, "gnrc_nbr")
    insertValues <- c(insertValues, gnrc_nbr)
  }
  
  if (missing(gnrc_nm)) {
    gnrc_nm <- defaults$gnrc_nm
  }
  if (!is.null(gnrc_nm)) {
    insertFields <- c(insertFields, "gnrc_nm")
    insertValues <- c(insertValues, gnrc_nm)
  }
  
  if (missing(gnrc_sqnc_nbr)) {
    gnrc_sqnc_nbr <- defaults$gnrc_sqnc_nbr
  }
  if (!is.null(gnrc_sqnc_nbr)) {
    insertFields <- c(insertFields, "gnrc_sqnc_nbr")
    insertValues <- c(insertValues, gnrc_sqnc_nbr)
  }
  
  if (missing(ndc)) {
    ndc <- defaults$ndc
  }
  if (!is.null(ndc)) {
    insertFields <- c(insertFields, "ndc")
    insertValues <- c(insertValues, ndc)
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
  
  if (exists('testNewAdded', where = globalenv()) && get('testNewAdded'))
  {
    assign('testNewAdded', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    insertDf[nrow(insertDf) + 1,] <<- c('lu_ndc', comment)
  }
  statement <- paste0("INSERT INTO @nativeDatabaseSchema.lu_ndc (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  insertDf[nrow(insertDf) + 1,] <<- c('lu_ndc', statement)
  invisible(statement)
}

add_lu_procedure <- function(category_dtl_cd, category_dtl_code_desc, category_genl_cd, category_genl_cd_desc, proc_cd, proc_desc, proc_end_date, proc_typ_cd) {
  defaults <- get('lu_procedure', envir = defaultValues)
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
  
  if (exists('testNewAdded', where = globalenv()) && get('testNewAdded'))
  {
    assign('testNewAdded', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    insertDf[nrow(insertDf) + 1,] <<- c('lu_procedure', comment)
  }
  statement <- paste0("INSERT INTO @nativeDatabaseSchema.lu_procedure (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  insertDf[nrow(insertDf) + 1,] <<- c('lu_procedure', statement)
  invisible(statement)
}

add_hra <- function(patid, h_bmi, h_bsa, h_chronic_pain, h_height, h_smoking_status, h_weight, hra_compltd_dt, isa10008, isa1006, isa13021, isa13022, isa13023, isa13040, isa16010, isa16016, isa16040, isa17001, isa17015, isa17021, isa17023, isa18015, isa19004, isa19005, isa20061, isa20064, isa20069, isa20072, isa21001, isa21003, isa21009, isa21015, isa21020, isa21021, isa21025, isa3010, isa5001, isa5004, isa5010, isa5018, isa7018, isa8016, isa9009, isa9063, extract_ym, version) {
  defaults <- get('hra', envir = defaultValues)
  insertFields <- c()
  insertValues <- c()
  if (missing(patid)) {
    patid <- defaults$patid
  }
  if (!is.null(patid)) {
    insertFields <- c(insertFields, "patid")
    insertValues <- c(insertValues, patid)
  }
  
  if (missing(h_bmi)) {
    h_bmi <- defaults$h_bmi
  }
  if (!is.null(h_bmi)) {
    insertFields <- c(insertFields, "h_bmi")
    insertValues <- c(insertValues, h_bmi)
  }
  
  if (missing(h_bsa)) {
    h_bsa <- defaults$h_bsa
  }
  if (!is.null(h_bsa)) {
    insertFields <- c(insertFields, "h_bsa")
    insertValues <- c(insertValues, h_bsa)
  }
  
  if (missing(h_chronic_pain)) {
    h_chronic_pain <- defaults$h_chronic_pain
  }
  if (!is.null(h_chronic_pain)) {
    insertFields <- c(insertFields, "h_chronic_pain")
    insertValues <- c(insertValues, h_chronic_pain)
  }
  
  if (missing(h_height)) {
    h_height <- defaults$h_height
  }
  if (!is.null(h_height)) {
    insertFields <- c(insertFields, "h_height")
    insertValues <- c(insertValues, h_height)
  }
  
  if (missing(h_smoking_status)) {
    h_smoking_status <- defaults$h_smoking_status
  }
  if (!is.null(h_smoking_status)) {
    insertFields <- c(insertFields, "h_smoking_status")
    insertValues <- c(insertValues, h_smoking_status)
  }
  
  if (missing(h_weight)) {
    h_weight <- defaults$h_weight
  }
  if (!is.null(h_weight)) {
    insertFields <- c(insertFields, "h_weight")
    insertValues <- c(insertValues, h_weight)
  }
  
  if (missing(hra_compltd_dt)) {
    hra_compltd_dt <- defaults$hra_compltd_dt
  }
  if (!is.null(hra_compltd_dt)) {
    insertFields <- c(insertFields, "hra_compltd_dt")
    insertValues <- c(insertValues, hra_compltd_dt)
  }
  
  if (missing(isa10008)) {
    isa10008 <- defaults$isa10008
  }
  if (!is.null(isa10008)) {
    insertFields <- c(insertFields, "isa10008")
    insertValues <- c(insertValues, isa10008)
  }
  
  if (missing(isa1006)) {
    isa1006 <- defaults$isa1006
  }
  if (!is.null(isa1006)) {
    insertFields <- c(insertFields, "isa1006")
    insertValues <- c(insertValues, isa1006)
  }
  
  if (missing(isa13021)) {
    isa13021 <- defaults$isa13021
  }
  if (!is.null(isa13021)) {
    insertFields <- c(insertFields, "isa13021")
    insertValues <- c(insertValues, isa13021)
  }
  
  if (missing(isa13022)) {
    isa13022 <- defaults$isa13022
  }
  if (!is.null(isa13022)) {
    insertFields <- c(insertFields, "isa13022")
    insertValues <- c(insertValues, isa13022)
  }
  
  if (missing(isa13023)) {
    isa13023 <- defaults$isa13023
  }
  if (!is.null(isa13023)) {
    insertFields <- c(insertFields, "isa13023")
    insertValues <- c(insertValues, isa13023)
  }
  
  if (missing(isa13040)) {
    isa13040 <- defaults$isa13040
  }
  if (!is.null(isa13040)) {
    insertFields <- c(insertFields, "isa13040")
    insertValues <- c(insertValues, isa13040)
  }
  
  if (missing(isa16010)) {
    isa16010 <- defaults$isa16010
  }
  if (!is.null(isa16010)) {
    insertFields <- c(insertFields, "isa16010")
    insertValues <- c(insertValues, isa16010)
  }
  
  if (missing(isa16016)) {
    isa16016 <- defaults$isa16016
  }
  if (!is.null(isa16016)) {
    insertFields <- c(insertFields, "isa16016")
    insertValues <- c(insertValues, isa16016)
  }
  
  if (missing(isa16040)) {
    isa16040 <- defaults$isa16040
  }
  if (!is.null(isa16040)) {
    insertFields <- c(insertFields, "isa16040")
    insertValues <- c(insertValues, isa16040)
  }
  
  if (missing(isa17001)) {
    isa17001 <- defaults$isa17001
  }
  if (!is.null(isa17001)) {
    insertFields <- c(insertFields, "isa17001")
    insertValues <- c(insertValues, isa17001)
  }
  
  if (missing(isa17015)) {
    isa17015 <- defaults$isa17015
  }
  if (!is.null(isa17015)) {
    insertFields <- c(insertFields, "isa17015")
    insertValues <- c(insertValues, isa17015)
  }
  
  if (missing(isa17021)) {
    isa17021 <- defaults$isa17021
  }
  if (!is.null(isa17021)) {
    insertFields <- c(insertFields, "isa17021")
    insertValues <- c(insertValues, isa17021)
  }
  
  if (missing(isa17023)) {
    isa17023 <- defaults$isa17023
  }
  if (!is.null(isa17023)) {
    insertFields <- c(insertFields, "isa17023")
    insertValues <- c(insertValues, isa17023)
  }
  
  if (missing(isa18015)) {
    isa18015 <- defaults$isa18015
  }
  if (!is.null(isa18015)) {
    insertFields <- c(insertFields, "isa18015")
    insertValues <- c(insertValues, isa18015)
  }
  
  if (missing(isa19004)) {
    isa19004 <- defaults$isa19004
  }
  if (!is.null(isa19004)) {
    insertFields <- c(insertFields, "isa19004")
    insertValues <- c(insertValues, isa19004)
  }
  
  if (missing(isa19005)) {
    isa19005 <- defaults$isa19005
  }
  if (!is.null(isa19005)) {
    insertFields <- c(insertFields, "isa19005")
    insertValues <- c(insertValues, isa19005)
  }
  
  if (missing(isa20061)) {
    isa20061 <- defaults$isa20061
  }
  if (!is.null(isa20061)) {
    insertFields <- c(insertFields, "isa20061")
    insertValues <- c(insertValues, isa20061)
  }
  
  if (missing(isa20064)) {
    isa20064 <- defaults$isa20064
  }
  if (!is.null(isa20064)) {
    insertFields <- c(insertFields, "isa20064")
    insertValues <- c(insertValues, isa20064)
  }
  
  if (missing(isa20069)) {
    isa20069 <- defaults$isa20069
  }
  if (!is.null(isa20069)) {
    insertFields <- c(insertFields, "isa20069")
    insertValues <- c(insertValues, isa20069)
  }
  
  if (missing(isa20072)) {
    isa20072 <- defaults$isa20072
  }
  if (!is.null(isa20072)) {
    insertFields <- c(insertFields, "isa20072")
    insertValues <- c(insertValues, isa20072)
  }
  
  if (missing(isa21001)) {
    isa21001 <- defaults$isa21001
  }
  if (!is.null(isa21001)) {
    insertFields <- c(insertFields, "isa21001")
    insertValues <- c(insertValues, isa21001)
  }
  
  if (missing(isa21003)) {
    isa21003 <- defaults$isa21003
  }
  if (!is.null(isa21003)) {
    insertFields <- c(insertFields, "isa21003")
    insertValues <- c(insertValues, isa21003)
  }
  
  if (missing(isa21009)) {
    isa21009 <- defaults$isa21009
  }
  if (!is.null(isa21009)) {
    insertFields <- c(insertFields, "isa21009")
    insertValues <- c(insertValues, isa21009)
  }
  
  if (missing(isa21015)) {
    isa21015 <- defaults$isa21015
  }
  if (!is.null(isa21015)) {
    insertFields <- c(insertFields, "isa21015")
    insertValues <- c(insertValues, isa21015)
  }
  
  if (missing(isa21020)) {
    isa21020 <- defaults$isa21020
  }
  if (!is.null(isa21020)) {
    insertFields <- c(insertFields, "isa21020")
    insertValues <- c(insertValues, isa21020)
  }
  
  if (missing(isa21021)) {
    isa21021 <- defaults$isa21021
  }
  if (!is.null(isa21021)) {
    insertFields <- c(insertFields, "isa21021")
    insertValues <- c(insertValues, isa21021)
  }
  
  if (missing(isa21025)) {
    isa21025 <- defaults$isa21025
  }
  if (!is.null(isa21025)) {
    insertFields <- c(insertFields, "isa21025")
    insertValues <- c(insertValues, isa21025)
  }
  
  if (missing(isa3010)) {
    isa3010 <- defaults$isa3010
  }
  if (!is.null(isa3010)) {
    insertFields <- c(insertFields, "isa3010")
    insertValues <- c(insertValues, isa3010)
  }
  
  if (missing(isa5001)) {
    isa5001 <- defaults$isa5001
  }
  if (!is.null(isa5001)) {
    insertFields <- c(insertFields, "isa5001")
    insertValues <- c(insertValues, isa5001)
  }
  
  if (missing(isa5004)) {
    isa5004 <- defaults$isa5004
  }
  if (!is.null(isa5004)) {
    insertFields <- c(insertFields, "isa5004")
    insertValues <- c(insertValues, isa5004)
  }
  
  if (missing(isa5010)) {
    isa5010 <- defaults$isa5010
  }
  if (!is.null(isa5010)) {
    insertFields <- c(insertFields, "isa5010")
    insertValues <- c(insertValues, isa5010)
  }
  
  if (missing(isa5018)) {
    isa5018 <- defaults$isa5018
  }
  if (!is.null(isa5018)) {
    insertFields <- c(insertFields, "isa5018")
    insertValues <- c(insertValues, isa5018)
  }
  
  if (missing(isa7018)) {
    isa7018 <- defaults$isa7018
  }
  if (!is.null(isa7018)) {
    insertFields <- c(insertFields, "isa7018")
    insertValues <- c(insertValues, isa7018)
  }
  
  if (missing(isa8016)) {
    isa8016 <- defaults$isa8016
  }
  if (!is.null(isa8016)) {
    insertFields <- c(insertFields, "isa8016")
    insertValues <- c(insertValues, isa8016)
  }
  
  if (missing(isa9009)) {
    isa9009 <- defaults$isa9009
  }
  if (!is.null(isa9009)) {
    insertFields <- c(insertFields, "isa9009")
    insertValues <- c(insertValues, isa9009)
  }
  
  if (missing(isa9063)) {
    isa9063 <- defaults$isa9063
  }
  if (!is.null(isa9063)) {
    insertFields <- c(insertFields, "isa9063")
    insertValues <- c(insertValues, isa9063)
  }
  
  if (missing(extract_ym)) {
    extract_ym <- defaults$extract_ym
  }
  if (!is.null(extract_ym)) {
    insertFields <- c(insertFields, "extract_ym")
    insertValues <- c(insertValues, extract_ym)
  }
  
  if (missing(version)) {
    version <- defaults$version
  }
  if (!is.null(version)) {
    insertFields <- c(insertFields, "version")
    insertValues <- c(insertValues, version)
  }
  
  if (exists('testNewAdded', where = globalenv()) && get('testNewAdded'))
  {
    assign('testNewAdded', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    insertDf[nrow(insertDf) + 1,] <<- c('hra', comment)
  }
  statement <- paste0("INSERT INTO @nativeDatabaseSchema.hra (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  insertDf[nrow(insertDf) + 1,] <<- c('hra', statement)
  invisible(statement)
}

add__version <- function(version_id, version_date) {
  defaults <- get('_version', envir = defaultValues)
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
  
  if (exists('testNewAdded', where = globalenv()) && get('testNewAdded'))
  {
    assign('testNewAdded', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    insertDf[nrow(insertDf) + 1,] <<- c('_version', comment)
  }
  statement <- paste0("INSERT INTO @nativeDatabaseSchema._version (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  insertDf[nrow(insertDf) + 1,] <<- c('_version', statement)
  invisible(statement)
}

add__pos_episode_visit <- function(episode_id, patid, dt_start, dt_end, visit_type) {
  defaults <- get('_pos_episode_visit', envir = defaultValues)
  insertFields <- c()
  insertValues <- c()
  if (missing(episode_id)) {
    episode_id <- defaults$episode_id
  }
  if (!is.null(episode_id)) {
    insertFields <- c(insertFields, "episode_id")
    insertValues <- c(insertValues, episode_id)
  }
  
  if (missing(patid)) {
    patid <- defaults$patid
  }
  if (!is.null(patid)) {
    insertFields <- c(insertFields, "patid")
    insertValues <- c(insertValues, patid)
  }
  
  if (missing(dt_start)) {
    dt_start <- defaults$dt_start
  }
  if (!is.null(dt_start)) {
    insertFields <- c(insertFields, "dt_start")
    insertValues <- c(insertValues, dt_start)
  }
  
  if (missing(dt_end)) {
    dt_end <- defaults$dt_end
  }
  if (!is.null(dt_end)) {
    insertFields <- c(insertFields, "dt_end")
    insertValues <- c(insertValues, dt_end)
  }
  
  if (missing(visit_type)) {
    visit_type <- defaults$visit_type
  }
  if (!is.null(visit_type)) {
    insertFields <- c(insertFields, "visit_type")
    insertValues <- c(insertValues, visit_type)
  }
  
  if (exists('testNewAdded', where = globalenv()) && get('testNewAdded'))
  {
    assign('testNewAdded', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    insertDf[nrow(insertDf) + 1,] <<- c('_pos_episode_visit', comment)
  }
  statement <- paste0("INSERT INTO @nativeDatabaseSchema._pos_episode_visit (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  insertDf[nrow(insertDf) + 1,] <<- c('_pos_episode_visit', statement)
  invisible(statement)
}

getExpectStatement <- function(domain, table)
{
  statement <- paste0("INSERT INTO @cdmDatabaseSchema.test_results SELECT ", 
                      get("testId", envir = globalenv()), " AS id, '", 
                      get("testDescription", envir = globalenv()), 
                      "' AS description, 'Expect @domain' AS test,", 
                      get("source_pid", envir = globalenv()), " AS source_id, ",
                      get("cdm_pid", envir = globalenv()), " AS cdm_pid, ",
                      "CASE WHEN(SELECT COUNT(*) from @cdmDatabaseSchema.@table WHERE")
  statement <- gsub(pattern = "@domain", replacement = domain, x = statement)
  statement <- gsub(pattern = "@table", replacement = table, x = statement)
  return(statement)
}

expect_measurement <- function(measurement_id, person_id, measurement_concept_id, measurement_date, measurement_datetime, measurement_type_concept_id, operator_concept_id, value_as_number, value_as_concept_id, unit_concept_id, range_low, range_high, provider_id, visit_occurrence_id, measurement_source_value, measurement_source_concept_id, unit_source_value, value_source_value) {
  statement <- getExpectStatement(domain = "measurement", table = "measurement")
  first <- TRUE
  if (!missing(measurement_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(measurement_id)) {
      statement <- paste0(statement, ' measurement_id IS NULL')
    } else if (is(measurement_id, 'subQuery')){
      statement <- paste0(statement, ' measurement_id = (', as.character(measurement_id), ')')
    } else {
      statement <- paste0(statement, " measurement_id = '", measurement_id,"'")
    }
  }
  
  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, ' person_id IS NULL')
    } else if (is(person_id, 'subQuery')){
      statement <- paste0(statement, ' person_id = (', as.character(person_id), ')')
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }
  
  if (!missing(measurement_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(measurement_concept_id)) {
      statement <- paste0(statement, ' measurement_concept_id IS NULL')
    } else if (is(measurement_concept_id, 'subQuery')){
      statement <- paste0(statement, ' measurement_concept_id = (', as.character(measurement_concept_id), ')')
    } else {
      statement <- paste0(statement, " measurement_concept_id = '", measurement_concept_id,"'")
    }
  }
  
  if (!missing(measurement_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(measurement_date)) {
      statement <- paste0(statement, ' measurement_date IS NULL')
    } else if (is(measurement_date, 'subQuery')){
      statement <- paste0(statement, ' measurement_date = (', as.character(measurement_date), ')')
    } else {
      statement <- paste0(statement, " measurement_date = '", measurement_date,"'")
    }
  }
  
  if (!missing(measurement_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(measurement_datetime)) {
      statement <- paste0(statement, ' measurement_datetime IS NULL')
    } else if (is(measurement_datetime, 'subQuery')){
      statement <- paste0(statement, ' measurement_datetime = (', as.character(measurement_datetime), ')')
    } else {
      statement <- paste0(statement, " measurement_datetime = '", measurement_datetime,"'")
    }
  }
  
  if (!missing(measurement_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(measurement_type_concept_id)) {
      statement <- paste0(statement, ' measurement_type_concept_id IS NULL')
    } else if (is(measurement_type_concept_id, 'subQuery')){
      statement <- paste0(statement, ' measurement_type_concept_id = (', as.character(measurement_type_concept_id), ')')
    } else {
      statement <- paste0(statement, " measurement_type_concept_id = '", measurement_type_concept_id,"'")
    }
  }
  
  if (!missing(operator_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(operator_concept_id)) {
      statement <- paste0(statement, ' operator_concept_id IS NULL')
    } else if (is(operator_concept_id, 'subQuery')){
      statement <- paste0(statement, ' operator_concept_id = (', as.character(operator_concept_id), ')')
    } else {
      statement <- paste0(statement, " operator_concept_id = '", operator_concept_id,"'")
    }
  }
  
  if (!missing(value_as_number)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(value_as_number)) {
      statement <- paste0(statement, ' value_as_number IS NULL')
    } else if (is(value_as_number, 'subQuery')){
      statement <- paste0(statement, ' value_as_number = (', as.character(value_as_number), ')')
    } else {
      statement <- paste0(statement, " value_as_number = '", value_as_number,"'")
    }
  }
  
  if (!missing(value_as_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(value_as_concept_id)) {
      statement <- paste0(statement, ' value_as_concept_id IS NULL')
    } else if (is(value_as_concept_id, 'subQuery')){
      statement <- paste0(statement, ' value_as_concept_id = (', as.character(value_as_concept_id), ')')
    } else {
      statement <- paste0(statement, " value_as_concept_id = '", value_as_concept_id,"'")
    }
  }
  
  if (!missing(unit_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(unit_concept_id)) {
      statement <- paste0(statement, ' unit_concept_id IS NULL')
    } else if (is(unit_concept_id, 'subQuery')){
      statement <- paste0(statement, ' unit_concept_id = (', as.character(unit_concept_id), ')')
    } else {
      statement <- paste0(statement, " unit_concept_id = '", unit_concept_id,"'")
    }
  }
  
  if (!missing(range_low)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(range_low)) {
      statement <- paste0(statement, ' range_low IS NULL')
    } else if (is(range_low, 'subQuery')){
      statement <- paste0(statement, ' range_low = (', as.character(range_low), ')')
    } else {
      statement <- paste0(statement, " range_low = '", range_low,"'")
    }
  }
  
  if (!missing(range_high)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(range_high)) {
      statement <- paste0(statement, ' range_high IS NULL')
    } else if (is(range_high, 'subQuery')){
      statement <- paste0(statement, ' range_high = (', as.character(range_high), ')')
    } else {
      statement <- paste0(statement, " range_high = '", range_high,"'")
    }
  }
  
  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, ' provider_id IS NULL')
    } else if (is(provider_id, 'subQuery')){
      statement <- paste0(statement, ' provider_id = (', as.character(provider_id), ')')
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }
  
  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, ' visit_occurrence_id IS NULL')
    } else if (is(visit_occurrence_id, 'subQuery')){
      statement <- paste0(statement, ' visit_occurrence_id = (', as.character(visit_occurrence_id), ')')
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }
  
  if (!missing(measurement_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(measurement_source_value)) {
      statement <- paste0(statement, ' measurement_source_value IS NULL')
    } else if (is(measurement_source_value, 'subQuery')){
      statement <- paste0(statement, ' measurement_source_value = (', as.character(measurement_source_value), ')')
    } else {
      statement <- paste0(statement, " measurement_source_value = '", measurement_source_value,"'")
    }
  }
  
  if (!missing(measurement_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(measurement_source_concept_id)) {
      statement <- paste0(statement, ' measurement_source_concept_id IS NULL')
    } else if (is(measurement_source_concept_id, 'subQuery')){
      statement <- paste0(statement, ' measurement_source_concept_id = (', as.character(measurement_source_concept_id), ')')
    } else {
      statement <- paste0(statement, " measurement_source_concept_id = '", measurement_source_concept_id,"'")
    }
  }
  
  if (!missing(unit_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(unit_source_value)) {
      statement <- paste0(statement, ' unit_source_value IS NULL')
    } else if (is(unit_source_value, 'subQuery')){
      statement <- paste0(statement, ' unit_source_value = (', as.character(unit_source_value), ')')
    } else {
      statement <- paste0(statement, " unit_source_value = '", unit_source_value,"'")
    }
  }
  
  if (!missing(value_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(value_source_value)) {
      statement <- paste0(statement, ' value_source_value IS NULL')
    } else if (is(value_source_value, 'subQuery')){
      statement <- paste0(statement, ' value_source_value = (', as.character(value_source_value), ')')
    } else {
      statement <- paste0(statement, " value_source_value = '", value_source_value,"'")
    }
  }
  
  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status")
  if (exists('testNewExpected', where = globalenv()) && get('testNewExpected'))
  {
    assign('testNewExpected', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    testSql <<- c(testSql, comment)
  }
  testSql <<- c(testSql, statement)
  invisible(statement)
}

expect_condition_occurrence <- function(condition_occurrence_id, person_id, condition_concept_id, condition_start_date, condition_start_datetime, condition_end_date, condition_end_datetime, condition_type_concept_id, stop_reason, provider_id, visit_occurrence_id, condition_source_value, condition_source_concept_id) {
  #statement <- paste0("INSERT INTO @cdmDatabaseSchema.test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect condition_occurrence' AS test, CASE WHEN(SELECT COUNT(*) from @cdmDatabaseSchema.condition_occurrence WHERE")
  statement <- getExpectStatement(domain = "condition", table = "condition_occurrence")
  first <- TRUE
  if (!missing(condition_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(condition_occurrence_id)) {
      statement <- paste0(statement, ' condition_occurrence_id IS NULL')
    } else if (is(condition_occurrence_id, 'subQuery')){
      statement <- paste0(statement, ' condition_occurrence_id = (', as.character(condition_occurrence_id), ')')
    } else {
      statement <- paste0(statement, " condition_occurrence_id = '", condition_occurrence_id,"'")
    }
  }
  
  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, ' person_id IS NULL')
    } else if (is(person_id, 'subQuery')){
      statement <- paste0(statement, ' person_id = (', as.character(person_id), ')')
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }
  
  if (!missing(condition_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(condition_concept_id)) {
      statement <- paste0(statement, ' condition_concept_id IS NULL')
    } else if (is(condition_concept_id, 'subQuery')){
      statement <- paste0(statement, ' condition_concept_id = (', as.character(condition_concept_id), ')')
    } else {
      statement <- paste0(statement, " condition_concept_id = '", condition_concept_id,"'")
    }
  }
  
  if (!missing(condition_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(condition_start_date)) {
      statement <- paste0(statement, ' condition_start_date IS NULL')
    } else if (is(condition_start_date, 'subQuery')){
      statement <- paste0(statement, ' condition_start_date = (', as.character(condition_start_date), ')')
    } else {
      statement <- paste0(statement, " condition_start_date = '", condition_start_date,"'")
    }
  }
  
  if (!missing(condition_start_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(condition_start_datetime)) {
      statement <- paste0(statement, ' condition_start_datetime IS NULL')
    } else if (is(condition_start_datetime, 'subQuery')){
      statement <- paste0(statement, ' condition_start_datetime = (', as.character(condition_start_datetime), ')')
    } else {
      statement <- paste0(statement, " condition_start_datetime = '", condition_start_datetime,"'")
    }
  }
  
  if (!missing(condition_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(condition_end_date)) {
      statement <- paste0(statement, ' condition_end_date IS NULL')
    } else if (is(condition_end_date, 'subQuery')){
      statement <- paste0(statement, ' condition_end_date = (', as.character(condition_end_date), ')')
    } else {
      statement <- paste0(statement, " condition_end_date = '", condition_end_date,"'")
    }
  }
  
  if (!missing(condition_end_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(condition_end_datetime)) {
      statement <- paste0(statement, ' condition_end_datetime IS NULL')
    } else if (is(condition_end_datetime, 'subQuery')){
      statement <- paste0(statement, ' condition_end_datetime = (', as.character(condition_end_datetime), ')')
    } else {
      statement <- paste0(statement, " condition_end_datetime = '", condition_end_datetime,"'")
    }
  }
  
  if (!missing(condition_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(condition_type_concept_id)) {
      statement <- paste0(statement, ' condition_type_concept_id IS NULL')
    } else if (is(condition_type_concept_id, 'subQuery')){
      statement <- paste0(statement, ' condition_type_concept_id = (', as.character(condition_type_concept_id), ')')
    } else {
      statement <- paste0(statement, " condition_type_concept_id = '", condition_type_concept_id,"'")
    }
  }
  
  if (!missing(stop_reason)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(stop_reason)) {
      statement <- paste0(statement, ' stop_reason IS NULL')
    } else if (is(stop_reason, 'subQuery')){
      statement <- paste0(statement, ' stop_reason = (', as.character(stop_reason), ')')
    } else {
      statement <- paste0(statement, " stop_reason = '", stop_reason,"'")
    }
  }
  
  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, ' provider_id IS NULL')
    } else if (is(provider_id, 'subQuery')){
      statement <- paste0(statement, ' provider_id = (', as.character(provider_id), ')')
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }
  
  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, ' visit_occurrence_id IS NULL')
    } else if (is(visit_occurrence_id, 'subQuery')){
      statement <- paste0(statement, ' visit_occurrence_id = (', as.character(visit_occurrence_id), ')')
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }
  
  if (!missing(condition_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(condition_source_value)) {
      statement <- paste0(statement, ' condition_source_value IS NULL')
    } else if (is(condition_source_value, 'subQuery')){
      statement <- paste0(statement, ' condition_source_value = (', as.character(condition_source_value), ')')
    } else {
      statement <- paste0(statement, " condition_source_value = '", condition_source_value,"'")
    }
  }
  
  if (!missing(condition_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(condition_source_concept_id)) {
      statement <- paste0(statement, ' condition_source_concept_id IS NULL')
    } else if (is(condition_source_concept_id, 'subQuery')){
      statement <- paste0(statement, ' condition_source_concept_id = (', as.character(condition_source_concept_id), ')')
    } else {
      statement <- paste0(statement, " condition_source_concept_id = '", condition_source_concept_id,"'")
    }
  }
  
  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status")
  if (exists('testNewExpected', where = globalenv()) && get('testNewExpected'))
  {
    assign('testNewExpected', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    testSql <<- c(testSql, comment)
  }
  testSql <<- c(testSql, statement)
  invisible(statement)
}

expect_location <- function(location_id, address_1, address_2, city, state, zip, county, location_source_value) {
  #statement <- paste0("INSERT INTO @cdmDatabaseSchema.test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect location' AS test, CASE WHEN(SELECT COUNT(*) from @cdmDatabaseSchema.location WHERE")
  statement <- getExpectStatement(domain = "location", table = "location")
  first <- TRUE
  if (!missing(location_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(location_id)) {
      statement <- paste0(statement, ' location_id IS NULL')
    } else if (is(location_id, 'subQuery')){
      statement <- paste0(statement, ' location_id = (', as.character(location_id), ')')
    } else {
      statement <- paste0(statement, " location_id = '", location_id,"'")
    }
  }
  
  if (!missing(address_1)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(address_1)) {
      statement <- paste0(statement, ' address_1 IS NULL')
    } else if (is(address_1, 'subQuery')){
      statement <- paste0(statement, ' address_1 = (', as.character(address_1), ')')
    } else {
      statement <- paste0(statement, " address_1 = '", address_1,"'")
    }
  }
  
  if (!missing(address_2)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(address_2)) {
      statement <- paste0(statement, ' address_2 IS NULL')
    } else if (is(address_2, 'subQuery')){
      statement <- paste0(statement, ' address_2 = (', as.character(address_2), ')')
    } else {
      statement <- paste0(statement, " address_2 = '", address_2,"'")
    }
  }
  
  if (!missing(city)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(city)) {
      statement <- paste0(statement, ' city IS NULL')
    } else if (is(city, 'subQuery')){
      statement <- paste0(statement, ' city = (', as.character(city), ')')
    } else {
      statement <- paste0(statement, " city = '", city,"'")
    }
  }
  
  if (!missing(state)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(state)) {
      statement <- paste0(statement, ' state IS NULL')
    } else if (is(state, 'subQuery')){
      statement <- paste0(statement, ' state = (', as.character(state), ')')
    } else {
      statement <- paste0(statement, " state = '", state,"'")
    }
  }
  
  if (!missing(zip)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(zip)) {
      statement <- paste0(statement, ' zip IS NULL')
    } else if (is(zip, 'subQuery')){
      statement <- paste0(statement, ' zip = (', as.character(zip), ')')
    } else {
      statement <- paste0(statement, " zip = '", zip,"'")
    }
  }
  
  if (!missing(county)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(county)) {
      statement <- paste0(statement, ' county IS NULL')
    } else if (is(county, 'subQuery')){
      statement <- paste0(statement, ' county = (', as.character(county), ')')
    } else {
      statement <- paste0(statement, " county = '", county,"'")
    }
  }
  
  if (!missing(location_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(location_source_value)) {
      statement <- paste0(statement, ' location_source_value IS NULL')
    } else if (is(location_source_value, 'subQuery')){
      statement <- paste0(statement, ' location_source_value = (', as.character(location_source_value), ')')
    } else {
      statement <- paste0(statement, " location_source_value = '", location_source_value,"'")
    }
  }
  
  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status")
  if (exists('testNewExpected', where = globalenv()) && get('testNewExpected'))
  {
    assign('testNewExpected', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    testSql <<- c(testSql, comment)
  }
  testSql <<- c(testSql, statement)
  invisible(statement)
}

expect_person <- function(person_id, person_source_value, gender_concept_id, gender_source_value, year_of_birth, month_of_birth, day_of_birth, race_concept_id, ethnicity_concept_id, birth_datetime, location_id, provider_id, care_site_id, gender_source_concept_id, race_source_value, race_source_concept_id, ethnicity_source_value, ethnicity_source_concept_id) {
  #statement <- paste0("INSERT INTO @cdmDatabaseSchema.test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect person' AS test, CASE WHEN(SELECT COUNT(*) from @cdmDatabaseSchema.person WHERE")
  statement <- getExpectStatement(domain = "person", table = "person")
  first <- TRUE
  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, ' person_id IS NULL')
    } else if (is(person_id, 'subQuery')){
      statement <- paste0(statement, ' person_id = (', as.character(person_id), ')')
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }
  
  if (!missing(person_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(person_source_value)) {
      statement <- paste0(statement, ' person_source_value IS NULL')
    } else if (is(person_source_value, 'subQuery')){
      statement <- paste0(statement, ' person_source_value = (', as.character(person_source_value), ')')
    } else {
      statement <- paste0(statement, " person_source_value = '", person_source_value,"'")
    }
  }
  
  if (!missing(gender_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(gender_concept_id)) {
      statement <- paste0(statement, ' gender_concept_id IS NULL')
    } else if (is(gender_concept_id, 'subQuery')){
      statement <- paste0(statement, ' gender_concept_id = (', as.character(gender_concept_id), ')')
    } else {
      statement <- paste0(statement, " gender_concept_id = '", gender_concept_id,"'")
    }
  }
  
  if (!missing(gender_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(gender_source_value)) {
      statement <- paste0(statement, ' gender_source_value IS NULL')
    } else if (is(gender_source_value, 'subQuery')){
      statement <- paste0(statement, ' gender_source_value = (', as.character(gender_source_value), ')')
    } else {
      statement <- paste0(statement, " gender_source_value = '", gender_source_value,"'")
    }
  }
  
  if (!missing(year_of_birth)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(year_of_birth)) {
      statement <- paste0(statement, ' year_of_birth IS NULL')
    } else if (is(year_of_birth, 'subQuery')){
      statement <- paste0(statement, ' year_of_birth = (', as.character(year_of_birth), ')')
    } else {
      statement <- paste0(statement, " year_of_birth = '", year_of_birth,"'")
    }
  }
  
  if (!missing(month_of_birth)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(month_of_birth)) {
      statement <- paste0(statement, ' month_of_birth IS NULL')
    } else if (is(month_of_birth, 'subQuery')){
      statement <- paste0(statement, ' month_of_birth = (', as.character(month_of_birth), ')')
    } else {
      statement <- paste0(statement, " month_of_birth = '", month_of_birth,"'")
    }
  }
  
  if (!missing(day_of_birth)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(day_of_birth)) {
      statement <- paste0(statement, ' day_of_birth IS NULL')
    } else if (is(day_of_birth, 'subQuery')){
      statement <- paste0(statement, ' day_of_birth = (', as.character(day_of_birth), ')')
    } else {
      statement <- paste0(statement, " day_of_birth = '", day_of_birth,"'")
    }
  }
  
  if (!missing(race_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(race_concept_id)) {
      statement <- paste0(statement, ' race_concept_id IS NULL')
    } else if (is(race_concept_id, 'subQuery')){
      statement <- paste0(statement, ' race_concept_id = (', as.character(race_concept_id), ')')
    } else {
      statement <- paste0(statement, " race_concept_id = '", race_concept_id,"'")
    }
  }
  
  if (!missing(ethnicity_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(ethnicity_concept_id)) {
      statement <- paste0(statement, ' ethnicity_concept_id IS NULL')
    } else if (is(ethnicity_concept_id, 'subQuery')){
      statement <- paste0(statement, ' ethnicity_concept_id = (', as.character(ethnicity_concept_id), ')')
    } else {
      statement <- paste0(statement, " ethnicity_concept_id = '", ethnicity_concept_id,"'")
    }
  }
  
  if (!missing(birth_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(birth_datetime)) {
      statement <- paste0(statement, ' birth_datetime IS NULL')
    } else if (is(birth_datetime, 'subQuery')){
      statement <- paste0(statement, ' birth_datetime = (', as.character(birth_datetime), ')')
    } else {
      statement <- paste0(statement, " birth_datetime = '", birth_datetime,"'")
    }
  }
  
  if (!missing(location_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(location_id)) {
      statement <- paste0(statement, ' location_id IS NULL')
    } else if (is(location_id, 'subQuery')){
      statement <- paste0(statement, ' location_id = (', as.character(location_id), ')')
    } else {
      statement <- paste0(statement, " location_id = '", location_id,"'")
    }
  }
  
  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, ' provider_id IS NULL')
    } else if (is(provider_id, 'subQuery')){
      statement <- paste0(statement, ' provider_id = (', as.character(provider_id), ')')
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }
  
  if (!missing(care_site_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(care_site_id)) {
      statement <- paste0(statement, ' care_site_id IS NULL')
    } else if (is(care_site_id, 'subQuery')){
      statement <- paste0(statement, ' care_site_id = (', as.character(care_site_id), ')')
    } else {
      statement <- paste0(statement, " care_site_id = '", care_site_id,"'")
    }
  }
  
  if (!missing(gender_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(gender_source_concept_id)) {
      statement <- paste0(statement, ' gender_source_concept_id IS NULL')
    } else if (is(gender_source_concept_id, 'subQuery')){
      statement <- paste0(statement, ' gender_source_concept_id = (', as.character(gender_source_concept_id), ')')
    } else {
      statement <- paste0(statement, " gender_source_concept_id = '", gender_source_concept_id,"'")
    }
  }
  
  if (!missing(race_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(race_source_value)) {
      statement <- paste0(statement, ' race_source_value IS NULL')
    } else if (is(race_source_value, 'subQuery')){
      statement <- paste0(statement, ' race_source_value = (', as.character(race_source_value), ')')
    } else {
      statement <- paste0(statement, " race_source_value = '", race_source_value,"'")
    }
  }
  
  if (!missing(race_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(race_source_concept_id)) {
      statement <- paste0(statement, ' race_source_concept_id IS NULL')
    } else if (is(race_source_concept_id, 'subQuery')){
      statement <- paste0(statement, ' race_source_concept_id = (', as.character(race_source_concept_id), ')')
    } else {
      statement <- paste0(statement, " race_source_concept_id = '", race_source_concept_id,"'")
    }
  }
  
  if (!missing(ethnicity_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(ethnicity_source_value)) {
      statement <- paste0(statement, ' ethnicity_source_value IS NULL')
    } else if (is(ethnicity_source_value, 'subQuery')){
      statement <- paste0(statement, ' ethnicity_source_value = (', as.character(ethnicity_source_value), ')')
    } else {
      statement <- paste0(statement, " ethnicity_source_value = '", ethnicity_source_value,"'")
    }
  }
  
  if (!missing(ethnicity_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(ethnicity_source_concept_id)) {
      statement <- paste0(statement, ' ethnicity_source_concept_id IS NULL')
    } else if (is(ethnicity_source_concept_id, 'subQuery')){
      statement <- paste0(statement, ' ethnicity_source_concept_id = (', as.character(ethnicity_source_concept_id), ')')
    } else {
      statement <- paste0(statement, " ethnicity_source_concept_id = '", ethnicity_source_concept_id,"'")
    }
  }
  
  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status")
  if (exists('testNewExpected', where = globalenv()) && get('testNewExpected'))
  {
    assign('testNewExpected', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    testSql <<- c(testSql, comment)
  }
  testSql <<- c(testSql, statement)
  invisible(statement)
}

expect_payer_plan_period <- function(payer_plan_period_id, person_id, payer_plan_period_start_date, payer_plan_period_end_date, payer_source_value, plan_source_value, family_source_value) {
  #statement <- paste0("INSERT INTO @cdmDatabaseSchema.test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect payer_plan_period' AS test, CASE WHEN(SELECT COUNT(*) from @cdmDatabaseSchema.payer_plan_period WHERE")
  statement <- getExpectStatement(domain = "payer_plan_period", table = "payer_plan_period")
  first <- TRUE
  if (!missing(payer_plan_period_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(payer_plan_period_id)) {
      statement <- paste0(statement, ' payer_plan_period_id IS NULL')
    } else if (is(payer_plan_period_id, 'subQuery')){
      statement <- paste0(statement, ' payer_plan_period_id = (', as.character(payer_plan_period_id), ')')
    } else {
      statement <- paste0(statement, " payer_plan_period_id = '", payer_plan_period_id,"'")
    }
  }
  
  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, ' person_id IS NULL')
    } else if (is(person_id, 'subQuery')){
      statement <- paste0(statement, ' person_id = (', as.character(person_id), ')')
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }
  
  if (!missing(payer_plan_period_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(payer_plan_period_start_date)) {
      statement <- paste0(statement, ' payer_plan_period_start_date IS NULL')
    } else if (is(payer_plan_period_start_date, 'subQuery')){
      statement <- paste0(statement, ' payer_plan_period_start_date = (', as.character(payer_plan_period_start_date), ')')
    } else {
      statement <- paste0(statement, " payer_plan_period_start_date = '", payer_plan_period_start_date,"'")
    }
  }
  
  if (!missing(payer_plan_period_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(payer_plan_period_end_date)) {
      statement <- paste0(statement, ' payer_plan_period_end_date IS NULL')
    } else if (is(payer_plan_period_end_date, 'subQuery')){
      statement <- paste0(statement, ' payer_plan_period_end_date = (', as.character(payer_plan_period_end_date), ')')
    } else {
      statement <- paste0(statement, " payer_plan_period_end_date = '", payer_plan_period_end_date,"'")
    }
  }
  
  if (!missing(payer_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(payer_source_value)) {
      statement <- paste0(statement, ' payer_source_value IS NULL')
    } else if (is(payer_source_value, 'subQuery')){
      statement <- paste0(statement, ' payer_source_value = (', as.character(payer_source_value), ')')
    } else {
      statement <- paste0(statement, " payer_source_value = '", payer_source_value,"'")
    }
  }
  
  if (!missing(plan_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(plan_source_value)) {
      statement <- paste0(statement, ' plan_source_value IS NULL')
    } else if (is(plan_source_value, 'subQuery')){
      statement <- paste0(statement, ' plan_source_value = (', as.character(plan_source_value), ')')
    } else {
      statement <- paste0(statement, " plan_source_value = '", plan_source_value,"'")
    }
  }
  
  if (!missing(family_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(family_source_value)) {
      statement <- paste0(statement, ' family_source_value IS NULL')
    } else if (is(family_source_value, 'subQuery')){
      statement <- paste0(statement, ' family_source_value = (', as.character(family_source_value), ')')
    } else {
      statement <- paste0(statement, " family_source_value = '", family_source_value,"'")
    }
  }
  
  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status")
  if (exists('testNewExpected', where = globalenv()) && get('testNewExpected'))
  {
    assign('testNewExpected', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    testSql <<- c(testSql, comment)
  }
  testSql <<- c(testSql, statement)
  invisible(statement)
}

expect_cost <- function(cost_id, cost_event_id, cost_domain_id, cost_type_concept_id, currency_concept_id, total_charge, total_cost, total_paid, paid_by_payer, paid_by_patient, paid_patient_copay, paid_patient_coinsurance, paid_patient_deductible, paid_by_primary, paid_ingredient_cost, paid_dispensing_fee, payer_plan_period_id, amount_allowed, revenue_code_concept_id, revenue_code_source_value) {
  #statement <- paste0("INSERT INTO @cdmDatabaseSchema.test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect cost' AS test, CASE WHEN(SELECT COUNT(*) from @cdmDatabaseSchema.cost WHERE")
  statement <- getExpectStatement(domain = "cost", table = "cost")
  first <- TRUE
  if (!missing(cost_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cost_id)) {
      statement <- paste0(statement, ' cost_id IS NULL')
    } else if (is(cost_id, 'subQuery')){
      statement <- paste0(statement, ' cost_id = (', as.character(cost_id), ')')
    } else {
      statement <- paste0(statement, " cost_id = '", cost_id,"'")
    }
  }
  
  if (!missing(cost_event_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cost_event_id)) {
      statement <- paste0(statement, ' cost_event_id IS NULL')
    } else if (is(cost_event_id, 'subQuery')){
      statement <- paste0(statement, ' cost_event_id = (', as.character(cost_event_id), ')')
    } else {
      statement <- paste0(statement, " cost_event_id = '", cost_event_id,"'")
    }
  }
  
  if (!missing(cost_domain_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cost_domain_id)) {
      statement <- paste0(statement, ' cost_domain_id IS NULL')
    } else if (is(cost_domain_id, 'subQuery')){
      statement <- paste0(statement, ' cost_domain_id = (', as.character(cost_domain_id), ')')
    } else {
      statement <- paste0(statement, " cost_domain_id = '", cost_domain_id,"'")
    }
  }
  
  if (!missing(cost_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cost_type_concept_id)) {
      statement <- paste0(statement, ' cost_type_concept_id IS NULL')
    } else if (is(cost_type_concept_id, 'subQuery')){
      statement <- paste0(statement, ' cost_type_concept_id = (', as.character(cost_type_concept_id), ')')
    } else {
      statement <- paste0(statement, " cost_type_concept_id = '", cost_type_concept_id,"'")
    }
  }
  
  if (!missing(currency_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(currency_concept_id)) {
      statement <- paste0(statement, ' currency_concept_id IS NULL')
    } else if (is(currency_concept_id, 'subQuery')){
      statement <- paste0(statement, ' currency_concept_id = (', as.character(currency_concept_id), ')')
    } else {
      statement <- paste0(statement, " currency_concept_id = '", currency_concept_id,"'")
    }
  }
  
  if (!missing(total_charge)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(total_charge)) {
      statement <- paste0(statement, ' total_charge IS NULL')
    } else if (is(total_charge, 'subQuery')){
      statement <- paste0(statement, ' total_charge = (', as.character(total_charge), ')')
    } else {
      statement <- paste0(statement, " total_charge = '", total_charge,"'")
    }
  }
  
  if (!missing(total_cost)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(total_cost)) {
      statement <- paste0(statement, ' total_cost IS NULL')
    } else if (is(total_cost, 'subQuery')){
      statement <- paste0(statement, ' total_cost = (', as.character(total_cost), ')')
    } else {
      statement <- paste0(statement, " total_cost = '", total_cost,"'")
    }
  }
  
  if (!missing(total_paid)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(total_paid)) {
      statement <- paste0(statement, ' total_paid IS NULL')
    } else if (is(total_paid, 'subQuery')){
      statement <- paste0(statement, ' total_paid = (', as.character(total_paid), ')')
    } else {
      statement <- paste0(statement, " total_paid = '", total_paid,"'")
    }
  }
  
  if (!missing(paid_by_payer)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(paid_by_payer)) {
      statement <- paste0(statement, ' paid_by_payer IS NULL')
    } else if (is(paid_by_payer, 'subQuery')){
      statement <- paste0(statement, ' paid_by_payer = (', as.character(paid_by_payer), ')')
    } else {
      statement <- paste0(statement, " paid_by_payer = '", paid_by_payer,"'")
    }
  }
  
  if (!missing(paid_by_patient)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(paid_by_patient)) {
      statement <- paste0(statement, ' paid_by_patient IS NULL')
    } else if (is(paid_by_patient, 'subQuery')){
      statement <- paste0(statement, ' paid_by_patient = (', as.character(paid_by_patient), ')')
    } else {
      statement <- paste0(statement, " paid_by_patient = '", paid_by_patient,"'")
    }
  }
  
  if (!missing(paid_patient_copay)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(paid_patient_copay)) {
      statement <- paste0(statement, ' paid_patient_copay IS NULL')
    } else if (is(paid_patient_copay, 'subQuery')){
      statement <- paste0(statement, ' paid_patient_copay = (', as.character(paid_patient_copay), ')')
    } else {
      statement <- paste0(statement, " paid_patient_copay = '", paid_patient_copay,"'")
    }
  }
  
  if (!missing(paid_patient_coinsurance)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(paid_patient_coinsurance)) {
      statement <- paste0(statement, ' paid_patient_coinsurance IS NULL')
    } else if (is(paid_patient_coinsurance, 'subQuery')){
      statement <- paste0(statement, ' paid_patient_coinsurance = (', as.character(paid_patient_coinsurance), ')')
    } else {
      statement <- paste0(statement, " paid_patient_coinsurance = '", paid_patient_coinsurance,"'")
    }
  }
  
  if (!missing(paid_patient_deductible)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(paid_patient_deductible)) {
      statement <- paste0(statement, ' paid_patient_deductible IS NULL')
    } else if (is(paid_patient_deductible, 'subQuery')){
      statement <- paste0(statement, ' paid_patient_deductible = (', as.character(paid_patient_deductible), ')')
    } else {
      statement <- paste0(statement, " paid_patient_deductible = '", paid_patient_deductible,"'")
    }
  }
  
  if (!missing(paid_by_primary)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(paid_by_primary)) {
      statement <- paste0(statement, ' paid_by_primary IS NULL')
    } else if (is(paid_by_primary, 'subQuery')){
      statement <- paste0(statement, ' paid_by_primary = (', as.character(paid_by_primary), ')')
    } else {
      statement <- paste0(statement, " paid_by_primary = '", paid_by_primary,"'")
    }
  }
  
  if (!missing(paid_ingredient_cost)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(paid_ingredient_cost)) {
      statement <- paste0(statement, ' paid_ingredient_cost IS NULL')
    } else if (is(paid_ingredient_cost, 'subQuery')){
      statement <- paste0(statement, ' paid_ingredient_cost = (', as.character(paid_ingredient_cost), ')')
    } else {
      statement <- paste0(statement, " paid_ingredient_cost = '", paid_ingredient_cost,"'")
    }
  }
  
  if (!missing(paid_dispensing_fee)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(paid_dispensing_fee)) {
      statement <- paste0(statement, ' paid_dispensing_fee IS NULL')
    } else if (is(paid_dispensing_fee, 'subQuery')){
      statement <- paste0(statement, ' paid_dispensing_fee = (', as.character(paid_dispensing_fee), ')')
    } else {
      statement <- paste0(statement, " paid_dispensing_fee = '", paid_dispensing_fee,"'")
    }
  }
  
  if (!missing(payer_plan_period_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(payer_plan_period_id)) {
      statement <- paste0(statement, ' payer_plan_period_id IS NULL')
    } else if (is(payer_plan_period_id, 'subQuery')){
      statement <- paste0(statement, ' payer_plan_period_id = (', as.character(payer_plan_period_id), ')')
    } else {
      statement <- paste0(statement, " payer_plan_period_id = '", payer_plan_period_id,"'")
    }
  }
  
  if (!missing(amount_allowed)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(amount_allowed)) {
      statement <- paste0(statement, ' amount_allowed IS NULL')
    } else if (is(amount_allowed, 'subQuery')){
      statement <- paste0(statement, ' amount_allowed = (', as.character(amount_allowed), ')')
    } else {
      statement <- paste0(statement, " amount_allowed = '", amount_allowed,"'")
    }
  }
  
  if (!missing(revenue_code_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(revenue_code_concept_id)) {
      statement <- paste0(statement, ' revenue_code_concept_id IS NULL')
    } else if (is(revenue_code_concept_id, 'subQuery')){
      statement <- paste0(statement, ' revenue_code_concept_id = (', as.character(revenue_code_concept_id), ')')
    } else {
      statement <- paste0(statement, " revenue_code_concept_id = '", revenue_code_concept_id,"'")
    }
  }
  
  if (!missing(revenue_code_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(revenue_code_source_value)) {
      statement <- paste0(statement, ' revenue_code_source_value IS NULL')
    } else if (is(revenue_code_source_value, 'subQuery')){
      statement <- paste0(statement, ' revenue_code_source_value = (', as.character(revenue_code_source_value), ')')
    } else {
      statement <- paste0(statement, " revenue_code_source_value = '", revenue_code_source_value,"'")
    }
  }
  
  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status")
  if (exists('testNewExpected', where = globalenv()) && get('testNewExpected'))
  {
    assign('testNewExpected', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    testSql <<- c(testSql, comment)
  }
  testSql <<- c(testSql, statement)
  invisible(statement)
}

expect_observation_period <- function(observation_period_id, person_id, observation_period_start_date, observation_period_start_datetime, observation_period_end_date, observation_period_end_datetime, period_type_concept_id) {
  #statement <- paste0("INSERT INTO @cdmDatabaseSchema.test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect observation_period' AS test, CASE WHEN(SELECT COUNT(*) from @cdmDatabaseSchema.observation_period WHERE")
  statement <- getExpectStatement(domain = "observation_period", table = "observation_period")
  first <- TRUE
  if (!missing(observation_period_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(observation_period_id)) {
      statement <- paste0(statement, ' observation_period_id IS NULL')
    } else if (is(observation_period_id, 'subQuery')){
      statement <- paste0(statement, ' observation_period_id = (', as.character(observation_period_id), ')')
    } else {
      statement <- paste0(statement, " observation_period_id = '", observation_period_id,"'")
    }
  }
  
  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, ' person_id IS NULL')
    } else if (is(person_id, 'subQuery')){
      statement <- paste0(statement, ' person_id = (', as.character(person_id), ')')
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }
  
  if (!missing(observation_period_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(observation_period_start_date)) {
      statement <- paste0(statement, ' observation_period_start_date IS NULL')
    } else if (is(observation_period_start_date, 'subQuery')){
      statement <- paste0(statement, ' observation_period_start_date = (', as.character(observation_period_start_date), ')')
    } else {
      statement <- paste0(statement, " observation_period_start_date = '", observation_period_start_date,"'")
    }
  }
  
  if (!missing(observation_period_start_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(observation_period_start_datetime)) {
      statement <- paste0(statement, ' observation_period_start_datetime IS NULL')
    } else if (is(observation_period_start_datetime, 'subQuery')){
      statement <- paste0(statement, ' observation_period_start_datetime = (', as.character(observation_period_start_datetime), ')')
    } else {
      statement <- paste0(statement, " observation_period_start_datetime = '", observation_period_start_datetime,"'")
    }
  }
  
  if (!missing(observation_period_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(observation_period_end_date)) {
      statement <- paste0(statement, ' observation_period_end_date IS NULL')
    } else if (is(observation_period_end_date, 'subQuery')){
      statement <- paste0(statement, ' observation_period_end_date = (', as.character(observation_period_end_date), ')')
    } else {
      statement <- paste0(statement, " observation_period_end_date = '", observation_period_end_date,"'")
    }
  }
  
  if (!missing(observation_period_end_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(observation_period_end_datetime)) {
      statement <- paste0(statement, ' observation_period_end_datetime IS NULL')
    } else if (is(observation_period_end_datetime, 'subQuery')){
      statement <- paste0(statement, ' observation_period_end_datetime = (', as.character(observation_period_end_datetime), ')')
    } else {
      statement <- paste0(statement, " observation_period_end_datetime = '", observation_period_end_datetime,"'")
    }
  }
  
  if (!missing(period_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(period_type_concept_id)) {
      statement <- paste0(statement, ' period_type_concept_id IS NULL')
    } else if (is(period_type_concept_id, 'subQuery')){
      statement <- paste0(statement, ' period_type_concept_id = (', as.character(period_type_concept_id), ')')
    } else {
      statement <- paste0(statement, " period_type_concept_id = '", period_type_concept_id,"'")
    }
  }
  
  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status")
  if (exists('testNewExpected', where = globalenv()) && get('testNewExpected'))
  {
    assign('testNewExpected', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    testSql <<- c(testSql, comment)
  }
  testSql <<- c(testSql, statement)
  invisible(statement)
}

expect_care_site <- function(care_site_id, care_site_name, place_of_service_concept_id, location_id, care_site_source_value, place_of_service_source_value) {
  #statement <- paste0("INSERT INTO @cdmDatabaseSchema.test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect care_site' AS test, CASE WHEN(SELECT COUNT(*) from @cdmDatabaseSchema.care_site WHERE")
  statement <- getExpectStatement(domain = "care_site", table = "care_site")
  first <- TRUE
  if (!missing(care_site_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(care_site_id)) {
      statement <- paste0(statement, ' care_site_id IS NULL')
    } else if (is(care_site_id, 'subQuery')){
      statement <- paste0(statement, ' care_site_id = (', as.character(care_site_id), ')')
    } else {
      statement <- paste0(statement, " care_site_id = '", care_site_id,"'")
    }
  }
  
  if (!missing(care_site_name)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(care_site_name)) {
      statement <- paste0(statement, ' care_site_name IS NULL')
    } else if (is(care_site_name, 'subQuery')){
      statement <- paste0(statement, ' care_site_name = (', as.character(care_site_name), ')')
    } else {
      statement <- paste0(statement, " care_site_name = '", care_site_name,"'")
    }
  }
  
  if (!missing(place_of_service_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(place_of_service_concept_id)) {
      statement <- paste0(statement, ' place_of_service_concept_id IS NULL')
    } else if (is(place_of_service_concept_id, 'subQuery')){
      statement <- paste0(statement, ' place_of_service_concept_id = (', as.character(place_of_service_concept_id), ')')
    } else {
      statement <- paste0(statement, " place_of_service_concept_id = '", place_of_service_concept_id,"'")
    }
  }
  
  if (!missing(location_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(location_id)) {
      statement <- paste0(statement, ' location_id IS NULL')
    } else if (is(location_id, 'subQuery')){
      statement <- paste0(statement, ' location_id = (', as.character(location_id), ')')
    } else {
      statement <- paste0(statement, " location_id = '", location_id,"'")
    }
  }
  
  if (!missing(care_site_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(care_site_source_value)) {
      statement <- paste0(statement, ' care_site_source_value IS NULL')
    } else if (is(care_site_source_value, 'subQuery')){
      statement <- paste0(statement, ' care_site_source_value = (', as.character(care_site_source_value), ')')
    } else {
      statement <- paste0(statement, " care_site_source_value = '", care_site_source_value,"'")
    }
  }
  
  if (!missing(place_of_service_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(place_of_service_source_value)) {
      statement <- paste0(statement, ' place_of_service_source_value IS NULL')
    } else if (is(place_of_service_source_value, 'subQuery')){
      statement <- paste0(statement, ' place_of_service_source_value = (', as.character(place_of_service_source_value), ')')
    } else {
      statement <- paste0(statement, " place_of_service_source_value = '", place_of_service_source_value,"'")
    }
  }
  
  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status")
  if (exists('testNewExpected', where = globalenv()) && get('testNewExpected'))
  {
    assign('testNewExpected', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    testSql <<- c(testSql, comment)
  }
  testSql <<- c(testSql, statement)
  invisible(statement)
}

expect_visit_occurrence <- function(visit_occurrence_id, person_id, visit_concept_id, visit_start_date, visit_start_datetime, visit_end_date, visit_end_datetime, visit_type_concept_id, provider_id, care_site_id, visit_source_value, visit_source_concept_id) {
  #statement <- paste0("INSERT INTO @cdmDatabaseSchema.test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect visit_occurrence' AS test, CASE WHEN(SELECT COUNT(*) from @cdmDatabaseSchema.visit_occurrence WHERE")
  statement <- getExpectStatement(domain = "visit_occurrence", table = "visit_occurrence")
  first <- TRUE
  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, ' visit_occurrence_id IS NULL')
    } else if (is(visit_occurrence_id, 'subQuery')){
      statement <- paste0(statement, ' visit_occurrence_id = (', as.character(visit_occurrence_id), ')')
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }
  
  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, ' person_id IS NULL')
    } else if (is(person_id, 'subQuery')){
      statement <- paste0(statement, ' person_id = (', as.character(person_id), ')')
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }
  
  if (!missing(visit_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(visit_concept_id)) {
      statement <- paste0(statement, ' visit_concept_id IS NULL')
    } else if (is(visit_concept_id, 'subQuery')){
      statement <- paste0(statement, ' visit_concept_id = (', as.character(visit_concept_id), ')')
    } else {
      statement <- paste0(statement, " visit_concept_id = '", visit_concept_id,"'")
    }
  }
  
  if (!missing(visit_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(visit_start_date)) {
      statement <- paste0(statement, ' visit_start_date IS NULL')
    } else if (is(visit_start_date, 'subQuery')){
      statement <- paste0(statement, ' visit_start_date = (', as.character(visit_start_date), ')')
    } else {
      statement <- paste0(statement, " visit_start_date = '", visit_start_date,"'")
    }
  }
  
  if (!missing(visit_start_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(visit_start_datetime)) {
      statement <- paste0(statement, ' visit_start_datetime IS NULL')
    } else if (is(visit_start_datetime, 'subQuery')){
      statement <- paste0(statement, ' visit_start_datetime = (', as.character(visit_start_datetime), ')')
    } else {
      statement <- paste0(statement, " visit_start_datetime = '", visit_start_datetime,"'")
    }
  }
  
  if (!missing(visit_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(visit_end_date)) {
      statement <- paste0(statement, ' visit_end_date IS NULL')
    } else if (is(visit_end_date, 'subQuery')){
      statement <- paste0(statement, ' visit_end_date = (', as.character(visit_end_date), ')')
    } else {
      statement <- paste0(statement, " visit_end_date = '", visit_end_date,"'")
    }
  }
  
  if (!missing(visit_end_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(visit_end_datetime)) {
      statement <- paste0(statement, ' visit_end_datetime IS NULL')
    } else if (is(visit_end_datetime, 'subQuery')){
      statement <- paste0(statement, ' visit_end_datetime = (', as.character(visit_end_datetime), ')')
    } else {
      statement <- paste0(statement, " visit_end_datetime = '", visit_end_datetime,"'")
    }
  }
  
  if (!missing(visit_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(visit_type_concept_id)) {
      statement <- paste0(statement, ' visit_type_concept_id IS NULL')
    } else if (is(visit_type_concept_id, 'subQuery')){
      statement <- paste0(statement, ' visit_type_concept_id = (', as.character(visit_type_concept_id), ')')
    } else {
      statement <- paste0(statement, " visit_type_concept_id = '", visit_type_concept_id,"'")
    }
  }
  
  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, ' provider_id IS NULL')
    } else if (is(provider_id, 'subQuery')){
      statement <- paste0(statement, ' provider_id = (', as.character(provider_id), ')')
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }
  
  if (!missing(care_site_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(care_site_id)) {
      statement <- paste0(statement, ' care_site_id IS NULL')
    } else if (is(care_site_id, 'subQuery')){
      statement <- paste0(statement, ' care_site_id = (', as.character(care_site_id), ')')
    } else {
      statement <- paste0(statement, " care_site_id = '", care_site_id,"'")
    }
  }
  
  if (!missing(visit_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(visit_source_value)) {
      statement <- paste0(statement, ' visit_source_value IS NULL')
    } else if (is(visit_source_value, 'subQuery')){
      statement <- paste0(statement, ' visit_source_value = (', as.character(visit_source_value), ')')
    } else {
      statement <- paste0(statement, " visit_source_value = '", visit_source_value,"'")
    }
  }
  
  if (!missing(visit_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(visit_source_concept_id)) {
      statement <- paste0(statement, ' visit_source_concept_id IS NULL')
    } else if (is(visit_source_concept_id, 'subQuery')){
      statement <- paste0(statement, ' visit_source_concept_id = (', as.character(visit_source_concept_id), ')')
    } else {
      statement <- paste0(statement, " visit_source_concept_id = '", visit_source_concept_id,"'")
    }
  }
  
  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status")
  if (exists('testNewExpected', where = globalenv()) && get('testNewExpected'))
  {
    assign('testNewExpected', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    testSql <<- c(testSql, comment)
  }
  testSql <<- c(testSql, statement)
  invisible(statement)
}

expect_provider <- function(provider_id, npi, dea, specialty_concept_id, provider_name, care_site_id, year_of_birth, gender_concept_id, provider_source_value, specialty_source_value, specialty_source_concept_id, gender_source_value, gender_source_concept_id) {
  #statement <- paste0("INSERT INTO @cdmDatabaseSchema.test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect provider' AS test, CASE WHEN(SELECT COUNT(*) from @cdmDatabaseSchema.provider WHERE")
  statement <- getExpectStatement(domain = "provider", table = "provider")
  first <- TRUE
  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, ' provider_id IS NULL')
    } else if (is(provider_id, 'subQuery')){
      statement <- paste0(statement, ' provider_id = (', as.character(provider_id), ')')
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }
  
  if (!missing(npi)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(npi)) {
      statement <- paste0(statement, ' npi IS NULL')
    } else if (is(npi, 'subQuery')){
      statement <- paste0(statement, ' npi = (', as.character(npi), ')')
    } else {
      statement <- paste0(statement, " npi = '", npi,"'")
    }
  }
  
  if (!missing(dea)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(dea)) {
      statement <- paste0(statement, ' dea IS NULL')
    } else if (is(dea, 'subQuery')){
      statement <- paste0(statement, ' dea = (', as.character(dea), ')')
    } else {
      statement <- paste0(statement, " dea = '", dea,"'")
    }
  }
  
  if (!missing(specialty_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(specialty_concept_id)) {
      statement <- paste0(statement, ' specialty_concept_id IS NULL')
    } else if (is(specialty_concept_id, 'subQuery')){
      statement <- paste0(statement, ' specialty_concept_id = (', as.character(specialty_concept_id), ')')
    } else {
      statement <- paste0(statement, " specialty_concept_id = '", specialty_concept_id,"'")
    }
  }
  
  if (!missing(provider_name)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(provider_name)) {
      statement <- paste0(statement, ' provider_name IS NULL')
    } else if (is(provider_name, 'subQuery')){
      statement <- paste0(statement, ' provider_name = (', as.character(provider_name), ')')
    } else {
      statement <- paste0(statement, " provider_name = '", provider_name,"'")
    }
  }
  
  if (!missing(care_site_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(care_site_id)) {
      statement <- paste0(statement, ' care_site_id IS NULL')
    } else if (is(care_site_id, 'subQuery')){
      statement <- paste0(statement, ' care_site_id = (', as.character(care_site_id), ')')
    } else {
      statement <- paste0(statement, " care_site_id = '", care_site_id,"'")
    }
  }
  
  if (!missing(year_of_birth)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(year_of_birth)) {
      statement <- paste0(statement, ' year_of_birth IS NULL')
    } else if (is(year_of_birth, 'subQuery')){
      statement <- paste0(statement, ' year_of_birth = (', as.character(year_of_birth), ')')
    } else {
      statement <- paste0(statement, " year_of_birth = '", year_of_birth,"'")
    }
  }
  
  if (!missing(gender_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(gender_concept_id)) {
      statement <- paste0(statement, ' gender_concept_id IS NULL')
    } else if (is(gender_concept_id, 'subQuery')){
      statement <- paste0(statement, ' gender_concept_id = (', as.character(gender_concept_id), ')')
    } else {
      statement <- paste0(statement, " gender_concept_id = '", gender_concept_id,"'")
    }
  }
  
  if (!missing(provider_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(provider_source_value)) {
      statement <- paste0(statement, ' provider_source_value IS NULL')
    } else if (is(provider_source_value, 'subQuery')){
      statement <- paste0(statement, ' provider_source_value = (', as.character(provider_source_value), ')')
    } else {
      statement <- paste0(statement, " provider_source_value = '", provider_source_value,"'")
    }
  }
  
  if (!missing(specialty_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(specialty_source_value)) {
      statement <- paste0(statement, ' specialty_source_value IS NULL')
    } else if (is(specialty_source_value, 'subQuery')){
      statement <- paste0(statement, ' specialty_source_value = (', as.character(specialty_source_value), ')')
    } else {
      statement <- paste0(statement, " specialty_source_value = '", specialty_source_value,"'")
    }
  }
  
  if (!missing(specialty_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(specialty_source_concept_id)) {
      statement <- paste0(statement, ' specialty_source_concept_id IS NULL')
    } else if (is(specialty_source_concept_id, 'subQuery')){
      statement <- paste0(statement, ' specialty_source_concept_id = (', as.character(specialty_source_concept_id), ')')
    } else {
      statement <- paste0(statement, " specialty_source_concept_id = '", specialty_source_concept_id,"'")
    }
  }
  
  if (!missing(gender_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(gender_source_value)) {
      statement <- paste0(statement, ' gender_source_value IS NULL')
    } else if (is(gender_source_value, 'subQuery')){
      statement <- paste0(statement, ' gender_source_value = (', as.character(gender_source_value), ')')
    } else {
      statement <- paste0(statement, " gender_source_value = '", gender_source_value,"'")
    }
  }
  
  if (!missing(gender_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(gender_source_concept_id)) {
      statement <- paste0(statement, ' gender_source_concept_id IS NULL')
    } else if (is(gender_source_concept_id, 'subQuery')){
      statement <- paste0(statement, ' gender_source_concept_id = (', as.character(gender_source_concept_id), ')')
    } else {
      statement <- paste0(statement, " gender_source_concept_id = '", gender_source_concept_id,"'")
    }
  }
  
  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status")
  if (exists('testNewExpected', where = globalenv()) && get('testNewExpected'))
  {
    assign('testNewExpected', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    testSql <<- c(testSql, comment)
  }
  testSql <<- c(testSql, statement)
  invisible(statement)
}

expect_death <- function(person_id, death_date, death_datetime, death_type_concept_id, cause_concept_id, cause_source_value, cause_source_concept_id) {
  #statement <- paste0("INSERT INTO @cdmDatabaseSchema.test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect death' AS test, CASE WHEN(SELECT COUNT(*) from @cdmDatabaseSchema.death WHERE")
  statement <- getExpectStatement(domain = "death", table = "death")  
  first <- TRUE
  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, ' person_id IS NULL')
    } else if (is(person_id, 'subQuery')){
      statement <- paste0(statement, ' person_id = (', as.character(person_id), ')')
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }
  
  if (!missing(death_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(death_date)) {
      statement <- paste0(statement, ' death_date IS NULL')
    } else if (is(death_date, 'subQuery')){
      statement <- paste0(statement, ' death_date = (', as.character(death_date), ')')
    } else {
      statement <- paste0(statement, " death_date = '", death_date,"'")
    }
  }
  
  if (!missing(death_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(death_datetime)) {
      statement <- paste0(statement, ' death_datetime IS NULL')
    } else if (is(death_datetime, 'subQuery')){
      statement <- paste0(statement, ' death_datetime = (', as.character(death_datetime), ')')
    } else {
      statement <- paste0(statement, " death_datetime = '", death_datetime,"'")
    }
  }
  
  if (!missing(death_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(death_type_concept_id)) {
      statement <- paste0(statement, ' death_type_concept_id IS NULL')
    } else if (is(death_type_concept_id, 'subQuery')){
      statement <- paste0(statement, ' death_type_concept_id = (', as.character(death_type_concept_id), ')')
    } else {
      statement <- paste0(statement, " death_type_concept_id = '", death_type_concept_id,"'")
    }
  }
  
  if (!missing(cause_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cause_concept_id)) {
      statement <- paste0(statement, ' cause_concept_id IS NULL')
    } else if (is(cause_concept_id, 'subQuery')){
      statement <- paste0(statement, ' cause_concept_id = (', as.character(cause_concept_id), ')')
    } else {
      statement <- paste0(statement, " cause_concept_id = '", cause_concept_id,"'")
    }
  }
  
  if (!missing(cause_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cause_source_value)) {
      statement <- paste0(statement, ' cause_source_value IS NULL')
    } else if (is(cause_source_value, 'subQuery')){
      statement <- paste0(statement, ' cause_source_value = (', as.character(cause_source_value), ')')
    } else {
      statement <- paste0(statement, " cause_source_value = '", cause_source_value,"'")
    }
  }
  
  if (!missing(cause_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cause_source_concept_id)) {
      statement <- paste0(statement, ' cause_source_concept_id IS NULL')
    } else if (is(cause_source_concept_id, 'subQuery')){
      statement <- paste0(statement, ' cause_source_concept_id = (', as.character(cause_source_concept_id), ')')
    } else {
      statement <- paste0(statement, " cause_source_concept_id = '", cause_source_concept_id,"'")
    }
  }
  
  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status")
  if (exists('testNewExpected', where = globalenv()) && get('testNewExpected'))
  {
    assign('testNewExpected', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    testSql <<- c(testSql, comment)
  }
  testSql <<- c(testSql, statement)
  invisible(statement)
}

expect_drug_exposure <- function(drug_exposure_id, person_id, drug_concept_id, drug_exposure_start_date, drug_exposure_start_datetime, drug_exposure_end_date, drug_exposure_end_datetime, drug_type_concept_id, stop_reason, refills, quantity, days_supply, sig, route_concept_id, effective_drug_dose, dose_unit_concept_id, lot_number, provider_id, visit_occurrence_id, drug_source_value, drug_source_concept_id, route_source_value, dose_unit_source_value) {
  #statement <- paste0("INSERT INTO @cdmDatabaseSchema.test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect drug_exposure' AS test, CASE WHEN(SELECT COUNT(*) from @cdmDatabaseSchema.drug_exposure WHERE")
  statement <- getExpectStatement(domain = "drug_exposure", table = "drug_exposure")
  first <- TRUE
  if (!missing(drug_exposure_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(drug_exposure_id)) {
      statement <- paste0(statement, ' drug_exposure_id IS NULL')
    } else if (is(drug_exposure_id, 'subQuery')){
      statement <- paste0(statement, ' drug_exposure_id = (', as.character(drug_exposure_id), ')')
    } else {
      statement <- paste0(statement, " drug_exposure_id = '", drug_exposure_id,"'")
    }
  }
  
  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, ' person_id IS NULL')
    } else if (is(person_id, 'subQuery')){
      statement <- paste0(statement, ' person_id = (', as.character(person_id), ')')
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }
  
  if (!missing(drug_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(drug_concept_id)) {
      statement <- paste0(statement, ' drug_concept_id IS NULL')
    } else if (is(drug_concept_id, 'subQuery')){
      statement <- paste0(statement, ' drug_concept_id = (', as.character(drug_concept_id), ')')
    } else {
      statement <- paste0(statement, " drug_concept_id = '", drug_concept_id,"'")
    }
  }
  
  if (!missing(drug_exposure_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(drug_exposure_start_date)) {
      statement <- paste0(statement, ' drug_exposure_start_date IS NULL')
    } else if (is(drug_exposure_start_date, 'subQuery')){
      statement <- paste0(statement, ' drug_exposure_start_date = (', as.character(drug_exposure_start_date), ')')
    } else {
      statement <- paste0(statement, " drug_exposure_start_date = '", drug_exposure_start_date,"'")
    }
  }
  
  if (!missing(drug_exposure_start_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(drug_exposure_start_datetime)) {
      statement <- paste0(statement, ' drug_exposure_start_datetime IS NULL')
    } else if (is(drug_exposure_start_datetime, 'subQuery')){
      statement <- paste0(statement, ' drug_exposure_start_datetime = (', as.character(drug_exposure_start_datetime), ')')
    } else {
      statement <- paste0(statement, " drug_exposure_start_datetime = '", drug_exposure_start_datetime,"'")
    }
  }
  
  if (!missing(drug_exposure_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(drug_exposure_end_date)) {
      statement <- paste0(statement, ' drug_exposure_end_date IS NULL')
    } else if (is(drug_exposure_end_date, 'subQuery')){
      statement <- paste0(statement, ' drug_exposure_end_date = (', as.character(drug_exposure_end_date), ')')
    } else {
      statement <- paste0(statement, " drug_exposure_end_date = '", drug_exposure_end_date,"'")
    }
  }
  
  if (!missing(drug_exposure_end_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(drug_exposure_end_datetime)) {
      statement <- paste0(statement, ' drug_exposure_end_datetime IS NULL')
    } else if (is(drug_exposure_end_datetime, 'subQuery')){
      statement <- paste0(statement, ' drug_exposure_end_datetime = (', as.character(drug_exposure_end_datetime), ')')
    } else {
      statement <- paste0(statement, " drug_exposure_end_datetime = '", drug_exposure_end_datetime,"'")
    }
  }
  
  if (!missing(drug_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(drug_type_concept_id)) {
      statement <- paste0(statement, ' drug_type_concept_id IS NULL')
    } else if (is(drug_type_concept_id, 'subQuery')){
      statement <- paste0(statement, ' drug_type_concept_id = (', as.character(drug_type_concept_id), ')')
    } else {
      statement <- paste0(statement, " drug_type_concept_id = '", drug_type_concept_id,"'")
    }
  }
  
  if (!missing(stop_reason)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(stop_reason)) {
      statement <- paste0(statement, ' stop_reason IS NULL')
    } else if (is(stop_reason, 'subQuery')){
      statement <- paste0(statement, ' stop_reason = (', as.character(stop_reason), ')')
    } else {
      statement <- paste0(statement, " stop_reason = '", stop_reason,"'")
    }
  }
  
  if (!missing(refills)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(refills)) {
      statement <- paste0(statement, ' refills IS NULL')
    } else if (is(refills, 'subQuery')){
      statement <- paste0(statement, ' refills = (', as.character(refills), ')')
    } else {
      statement <- paste0(statement, " refills = '", refills,"'")
    }
  }
  
  if (!missing(quantity)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(quantity)) {
      statement <- paste0(statement, ' quantity IS NULL')
    } else if (is(quantity, 'subQuery')){
      statement <- paste0(statement, ' quantity = (', as.character(quantity), ')')
    } else {
      statement <- paste0(statement, " quantity = '", quantity,"'")
    }
  }
  
  if (!missing(days_supply)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(days_supply)) {
      statement <- paste0(statement, ' days_supply IS NULL')
    } else if (is(days_supply, 'subQuery')){
      statement <- paste0(statement, ' days_supply = (', as.character(days_supply), ')')
    } else {
      statement <- paste0(statement, " days_supply = '", days_supply,"'")
    }
  }
  
  if (!missing(sig)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(sig)) {
      statement <- paste0(statement, ' sig IS NULL')
    } else if (is(sig, 'subQuery')){
      statement <- paste0(statement, ' sig = (', as.character(sig), ')')
    } else {
      statement <- paste0(statement, " sig = '", sig,"'")
    }
  }
  
  if (!missing(route_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(route_concept_id)) {
      statement <- paste0(statement, ' route_concept_id IS NULL')
    } else if (is(route_concept_id, 'subQuery')){
      statement <- paste0(statement, ' route_concept_id = (', as.character(route_concept_id), ')')
    } else {
      statement <- paste0(statement, " route_concept_id = '", route_concept_id,"'")
    }
  }
  
  if (!missing(effective_drug_dose)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(effective_drug_dose)) {
      statement <- paste0(statement, ' effective_drug_dose IS NULL')
    } else if (is(effective_drug_dose, 'subQuery')){
      statement <- paste0(statement, ' effective_drug_dose = (', as.character(effective_drug_dose), ')')
    } else {
      statement <- paste0(statement, " effective_drug_dose = '", effective_drug_dose,"'")
    }
  }
  
  if (!missing(dose_unit_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(dose_unit_concept_id)) {
      statement <- paste0(statement, ' dose_unit_concept_id IS NULL')
    } else if (is(dose_unit_concept_id, 'subQuery')){
      statement <- paste0(statement, ' dose_unit_concept_id = (', as.character(dose_unit_concept_id), ')')
    } else {
      statement <- paste0(statement, " dose_unit_concept_id = '", dose_unit_concept_id,"'")
    }
  }
  
  if (!missing(lot_number)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(lot_number)) {
      statement <- paste0(statement, ' lot_number IS NULL')
    } else if (is(lot_number, 'subQuery')){
      statement <- paste0(statement, ' lot_number = (', as.character(lot_number), ')')
    } else {
      statement <- paste0(statement, " lot_number = '", lot_number,"'")
    }
  }
  
  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, ' provider_id IS NULL')
    } else if (is(provider_id, 'subQuery')){
      statement <- paste0(statement, ' provider_id = (', as.character(provider_id), ')')
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }
  
  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, ' visit_occurrence_id IS NULL')
    } else if (is(visit_occurrence_id, 'subQuery')){
      statement <- paste0(statement, ' visit_occurrence_id = (', as.character(visit_occurrence_id), ')')
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }
  
  if (!missing(drug_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(drug_source_value)) {
      statement <- paste0(statement, ' drug_source_value IS NULL')
    } else if (is(drug_source_value, 'subQuery')){
      statement <- paste0(statement, ' drug_source_value = (', as.character(drug_source_value), ')')
    } else {
      statement <- paste0(statement, " drug_source_value = '", drug_source_value,"'")
    }
  }
  
  if (!missing(drug_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(drug_source_concept_id)) {
      statement <- paste0(statement, ' drug_source_concept_id IS NULL')
    } else if (is(drug_source_concept_id, 'subQuery')){
      statement <- paste0(statement, ' drug_source_concept_id = (', as.character(drug_source_concept_id), ')')
    } else {
      statement <- paste0(statement, " drug_source_concept_id = '", drug_source_concept_id,"'")
    }
  }
  
  if (!missing(route_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(route_source_value)) {
      statement <- paste0(statement, ' route_source_value IS NULL')
    } else if (is(route_source_value, 'subQuery')){
      statement <- paste0(statement, ' route_source_value = (', as.character(route_source_value), ')')
    } else {
      statement <- paste0(statement, " route_source_value = '", route_source_value,"'")
    }
  }
  
  if (!missing(dose_unit_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(dose_unit_source_value)) {
      statement <- paste0(statement, ' dose_unit_source_value IS NULL')
    } else if (is(dose_unit_source_value, 'subQuery')){
      statement <- paste0(statement, ' dose_unit_source_value = (', as.character(dose_unit_source_value), ')')
    } else {
      statement <- paste0(statement, " dose_unit_source_value = '", dose_unit_source_value,"'")
    }
  }
  
  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status")
  if (exists('testNewExpected', where = globalenv()) && get('testNewExpected'))
  {
    assign('testNewExpected', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    testSql <<- c(testSql, comment)
  }
  testSql <<- c(testSql, statement)
  invisible(statement)
}

expect_device_exposure <- function(device_exposure_id, person_id, device_concept_id, device_exposure_start_date, device_exposure_start_datetime, device_exposure_end_date, device_exposure_end_datetime, device_type_concept_id, unique_device_id, quantity, provider_id, visit_occurrence_id, device_source_value, device_source_concept_id) {
  #statement <- paste0("INSERT INTO @cdmDatabaseSchema.test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect device_exposure' AS test, CASE WHEN(SELECT COUNT(*) from @cdmDatabaseSchema.device_exposure WHERE")
  statement <- getExpectStatement(domain = "device_exposure", table = "device_exposure")
  first <- TRUE
  if (!missing(device_exposure_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(device_exposure_id)) {
      statement <- paste0(statement, ' device_exposure_id IS NULL')
    } else if (is(device_exposure_id, 'subQuery')){
      statement <- paste0(statement, ' device_exposure_id = (', as.character(device_exposure_id), ')')
    } else {
      statement <- paste0(statement, " device_exposure_id = '", device_exposure_id,"'")
    }
  }
  
  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, ' person_id IS NULL')
    } else if (is(person_id, 'subQuery')){
      statement <- paste0(statement, ' person_id = (', as.character(person_id), ')')
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }
  
  if (!missing(device_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(device_concept_id)) {
      statement <- paste0(statement, ' device_concept_id IS NULL')
    } else if (is(device_concept_id, 'subQuery')){
      statement <- paste0(statement, ' device_concept_id = (', as.character(device_concept_id), ')')
    } else {
      statement <- paste0(statement, " device_concept_id = '", device_concept_id,"'")
    }
  }
  
  if (!missing(device_exposure_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(device_exposure_start_date)) {
      statement <- paste0(statement, ' device_exposure_start_date IS NULL')
    } else if (is(device_exposure_start_date, 'subQuery')){
      statement <- paste0(statement, ' device_exposure_start_date = (', as.character(device_exposure_start_date), ')')
    } else {
      statement <- paste0(statement, " device_exposure_start_date = '", device_exposure_start_date,"'")
    }
  }
  
  if (!missing(device_exposure_start_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(device_exposure_start_datetime)) {
      statement <- paste0(statement, ' device_exposure_start_datetime IS NULL')
    } else if (is(device_exposure_start_datetime, 'subQuery')){
      statement <- paste0(statement, ' device_exposure_start_datetime = (', as.character(device_exposure_start_datetime), ')')
    } else {
      statement <- paste0(statement, " device_exposure_start_datetime = '", device_exposure_start_datetime,"'")
    }
  }
  
  if (!missing(device_exposure_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(device_exposure_end_date)) {
      statement <- paste0(statement, ' device_exposure_end_date IS NULL')
    } else if (is(device_exposure_end_date, 'subQuery')){
      statement <- paste0(statement, ' device_exposure_end_date = (', as.character(device_exposure_end_date), ')')
    } else {
      statement <- paste0(statement, " device_exposure_end_date = '", device_exposure_end_date,"'")
    }
  }
  
  if (!missing(device_exposure_end_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(device_exposure_end_datetime)) {
      statement <- paste0(statement, ' device_exposure_end_datetime IS NULL')
    } else if (is(device_exposure_end_datetime, 'subQuery')){
      statement <- paste0(statement, ' device_exposure_end_datetime = (', as.character(device_exposure_end_datetime), ')')
    } else {
      statement <- paste0(statement, " device_exposure_end_datetime = '", device_exposure_end_datetime,"'")
    }
  }
  
  if (!missing(device_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(device_type_concept_id)) {
      statement <- paste0(statement, ' device_type_concept_id IS NULL')
    } else if (is(device_type_concept_id, 'subQuery')){
      statement <- paste0(statement, ' device_type_concept_id = (', as.character(device_type_concept_id), ')')
    } else {
      statement <- paste0(statement, " device_type_concept_id = '", device_type_concept_id,"'")
    }
  }
  
  if (!missing(unique_device_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(unique_device_id)) {
      statement <- paste0(statement, ' unique_device_id IS NULL')
    } else if (is(unique_device_id, 'subQuery')){
      statement <- paste0(statement, ' unique_device_id = (', as.character(unique_device_id), ')')
    } else {
      statement <- paste0(statement, " unique_device_id = '", unique_device_id,"'")
    }
  }
  
  if (!missing(quantity)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(quantity)) {
      statement <- paste0(statement, ' quantity IS NULL')
    } else if (is(quantity, 'subQuery')){
      statement <- paste0(statement, ' quantity = (', as.character(quantity), ')')
    } else {
      statement <- paste0(statement, " quantity = '", quantity,"'")
    }
  }
  
  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, ' provider_id IS NULL')
    } else if (is(provider_id, 'subQuery')){
      statement <- paste0(statement, ' provider_id = (', as.character(provider_id), ')')
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }
  
  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, ' visit_occurrence_id IS NULL')
    } else if (is(visit_occurrence_id, 'subQuery')){
      statement <- paste0(statement, ' visit_occurrence_id = (', as.character(visit_occurrence_id), ')')
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }
  
  if (!missing(device_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(device_source_value)) {
      statement <- paste0(statement, ' device_source_value IS NULL')
    } else if (is(device_source_value, 'subQuery')){
      statement <- paste0(statement, ' device_source_value = (', as.character(device_source_value), ')')
    } else {
      statement <- paste0(statement, " device_source_value = '", device_source_value,"'")
    }
  }
  
  if (!missing(device_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(device_source_concept_id)) {
      statement <- paste0(statement, ' device_source_concept_id IS NULL')
    } else if (is(device_source_concept_id, 'subQuery')){
      statement <- paste0(statement, ' device_source_concept_id = (', as.character(device_source_concept_id), ')')
    } else {
      statement <- paste0(statement, " device_source_concept_id = '", device_source_concept_id,"'")
    }
  }
  
  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status")
  if (exists('testNewExpected', where = globalenv()) && get('testNewExpected'))
  {
    assign('testNewExpected', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    testSql <<- c(testSql, comment)
  }
  testSql <<- c(testSql, statement)
  invisible(statement)
}

expect_procedure_occurrence <- function(procedure_occurrence_id, person_id, procedure_concept_id, procedure_date, procedure_type_concept_id, modifier_concept_id, quantity, provider_id, visit_occurrence_id, procedure_source_value, procedure_source_concept_id, qualifier_source_value) {
  #statement <- paste0("INSERT INTO @cdmDatabaseSchema.test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect procedure_occurrence' AS test, CASE WHEN(SELECT COUNT(*) from @cdmDatabaseSchema.procedure_occurrence WHERE")
  statement <- getExpectStatement(domain = "procedure_occurrence", table = "procedure_occurrence")
  first <- TRUE
  if (!missing(procedure_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(procedure_occurrence_id)) {
      statement <- paste0(statement, ' procedure_occurrence_id IS NULL')
    } else if (is(procedure_occurrence_id, 'subQuery')){
      statement <- paste0(statement, ' procedure_occurrence_id = (', as.character(procedure_occurrence_id), ')')
    } else {
      statement <- paste0(statement, " procedure_occurrence_id = '", procedure_occurrence_id,"'")
    }
  }
  
  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, ' person_id IS NULL')
    } else if (is(person_id, 'subQuery')){
      statement <- paste0(statement, ' person_id = (', as.character(person_id), ')')
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }
  
  if (!missing(procedure_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(procedure_concept_id)) {
      statement <- paste0(statement, ' procedure_concept_id IS NULL')
    } else if (is(procedure_concept_id, 'subQuery')){
      statement <- paste0(statement, ' procedure_concept_id = (', as.character(procedure_concept_id), ')')
    } else {
      statement <- paste0(statement, " procedure_concept_id = '", procedure_concept_id,"'")
    }
  }
  
  if (!missing(procedure_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(procedure_date)) {
      statement <- paste0(statement, ' procedure_date IS NULL')
    } else if (is(procedure_date, 'subQuery')){
      statement <- paste0(statement, ' procedure_date = (', as.character(procedure_date), ')')
    } else {
      statement <- paste0(statement, " procedure_date = '", procedure_date,"'")
    }
  }
  
  if (!missing(procedure_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(procedure_type_concept_id)) {
      statement <- paste0(statement, ' procedure_type_concept_id IS NULL')
    } else if (is(procedure_type_concept_id, 'subQuery')){
      statement <- paste0(statement, ' procedure_type_concept_id = (', as.character(procedure_type_concept_id), ')')
    } else {
      statement <- paste0(statement, " procedure_type_concept_id = '", procedure_type_concept_id,"'")
    }
  }
  
  if (!missing(modifier_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(modifier_concept_id)) {
      statement <- paste0(statement, ' modifier_concept_id IS NULL')
    } else if (is(modifier_concept_id, 'subQuery')){
      statement <- paste0(statement, ' modifier_concept_id = (', as.character(modifier_concept_id), ')')
    } else {
      statement <- paste0(statement, " modifier_concept_id = '", modifier_concept_id,"'")
    }
  }
  
  if (!missing(quantity)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(quantity)) {
      statement <- paste0(statement, ' quantity IS NULL')
    } else if (is(quantity, 'subQuery')){
      statement <- paste0(statement, ' quantity = (', as.character(quantity), ')')
    } else {
      statement <- paste0(statement, " quantity = '", quantity,"'")
    }
  }
  
  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, ' provider_id IS NULL')
    } else if (is(provider_id, 'subQuery')){
      statement <- paste0(statement, ' provider_id = (', as.character(provider_id), ')')
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }
  
  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, ' visit_occurrence_id IS NULL')
    } else if (is(visit_occurrence_id, 'subQuery')){
      statement <- paste0(statement, ' visit_occurrence_id = (', as.character(visit_occurrence_id), ')')
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }
  
  if (!missing(procedure_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(procedure_source_value)) {
      statement <- paste0(statement, ' procedure_source_value IS NULL')
    } else if (is(procedure_source_value, 'subQuery')){
      statement <- paste0(statement, ' procedure_source_value = (', as.character(procedure_source_value), ')')
    } else {
      statement <- paste0(statement, " procedure_source_value = '", procedure_source_value,"'")
    }
  }
  
  if (!missing(procedure_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(procedure_source_concept_id)) {
      statement <- paste0(statement, ' procedure_source_concept_id IS NULL')
    } else if (is(procedure_source_concept_id, 'subQuery')){
      statement <- paste0(statement, ' procedure_source_concept_id = (', as.character(procedure_source_concept_id), ')')
    } else {
      statement <- paste0(statement, " procedure_source_concept_id = '", procedure_source_concept_id,"'")
    }
  }
  
  if (!missing(qualifier_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(qualifier_source_value)) {
      statement <- paste0(statement, ' qualifier_source_value IS NULL')
    } else if (is(qualifier_source_value, 'subQuery')){
      statement <- paste0(statement, ' qualifier_source_value = (', as.character(qualifier_source_value), ')')
    } else {
      statement <- paste0(statement, " qualifier_source_value = '", qualifier_source_value,"'")
    }
  }
  
  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status")
  if (exists('testNewExpected', where = globalenv()) && get('testNewExpected'))
  {
    assign('testNewExpected', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    testSql <<- c(testSql, comment)
  }
  testSql <<- c(testSql, statement)
  invisible(statement)
}

expect_observation <- function(observation_id, person_id, observation_concept_id, observation_date, observation_datetime, observation_type_concept_id, value_as_number, value_as_string, value_as_concept_id, qualifier_concept_id, unit_concept_id, provider_id, visit_occurrence_id, observation_source_value, observation_source_concept_id, unit_source_value, qualifier_source_value) {
  #statement <- paste0("INSERT INTO @cdmDatabaseSchema.test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect observation' AS test, CASE WHEN(SELECT COUNT(*) from @cdmDatabaseSchema.observation WHERE")
  statement <- getExpectStatement(domain = "observation", table = "observation")
  first <- TRUE
  if (!missing(observation_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(observation_id)) {
      statement <- paste0(statement, ' observation_id IS NULL')
    } else if (is(observation_id, 'subQuery')){
      statement <- paste0(statement, ' observation_id = (', as.character(observation_id), ')')
    } else {
      statement <- paste0(statement, " observation_id = '", observation_id,"'")
    }
  }
  
  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, ' person_id IS NULL')
    } else if (is(person_id, 'subQuery')){
      statement <- paste0(statement, ' person_id = (', as.character(person_id), ')')
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }
  
  if (!missing(observation_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(observation_concept_id)) {
      statement <- paste0(statement, ' observation_concept_id IS NULL')
    } else if (is(observation_concept_id, 'subQuery')){
      statement <- paste0(statement, ' observation_concept_id = (', as.character(observation_concept_id), ')')
    } else {
      statement <- paste0(statement, " observation_concept_id = '", observation_concept_id,"'")
    }
  }
  
  if (!missing(observation_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(observation_date)) {
      statement <- paste0(statement, ' observation_date IS NULL')
    } else if (is(observation_date, 'subQuery')){
      statement <- paste0(statement, ' observation_date = (', as.character(observation_date), ')')
    } else {
      statement <- paste0(statement, " observation_date = '", observation_date,"'")
    }
  }
  
  if (!missing(observation_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(observation_datetime)) {
      statement <- paste0(statement, ' observation_datetime IS NULL')
    } else if (is(observation_datetime, 'subQuery')){
      statement <- paste0(statement, ' observation_datetime = (', as.character(observation_datetime), ')')
    } else {
      statement <- paste0(statement, " observation_datetime = '", observation_datetime,"'")
    }
  }
  
  if (!missing(observation_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(observation_type_concept_id)) {
      statement <- paste0(statement, ' observation_type_concept_id IS NULL')
    } else if (is(observation_type_concept_id, 'subQuery')){
      statement <- paste0(statement, ' observation_type_concept_id = (', as.character(observation_type_concept_id), ')')
    } else {
      statement <- paste0(statement, " observation_type_concept_id = '", observation_type_concept_id,"'")
    }
  }
  
  if (!missing(value_as_number)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(value_as_number)) {
      statement <- paste0(statement, ' value_as_number IS NULL')
    } else if (is(value_as_number, 'subQuery')){
      statement <- paste0(statement, ' value_as_number = (', as.character(value_as_number), ')')
    } else {
      statement <- paste0(statement, " value_as_number = '", value_as_number,"'")
    }
  }
  
  if (!missing(value_as_string)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(value_as_string)) {
      statement <- paste0(statement, ' value_as_string IS NULL')
    } else if (is(value_as_string, 'subQuery')){
      statement <- paste0(statement, ' value_as_string = (', as.character(value_as_string), ')')
    } else {
      statement <- paste0(statement, " value_as_string = '", value_as_string,"'")
    }
  }
  
  if (!missing(value_as_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(value_as_concept_id)) {
      statement <- paste0(statement, ' value_as_concept_id IS NULL')
    } else if (is(value_as_concept_id, 'subQuery')){
      statement <- paste0(statement, ' value_as_concept_id = (', as.character(value_as_concept_id), ')')
    } else {
      statement <- paste0(statement, " value_as_concept_id = '", value_as_concept_id,"'")
    }
  }
  
  if (!missing(qualifier_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(qualifier_concept_id)) {
      statement <- paste0(statement, ' qualifier_concept_id IS NULL')
    } else if (is(qualifier_concept_id, 'subQuery')){
      statement <- paste0(statement, ' qualifier_concept_id = (', as.character(qualifier_concept_id), ')')
    } else {
      statement <- paste0(statement, " qualifier_concept_id = '", qualifier_concept_id,"'")
    }
  }
  
  if (!missing(unit_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(unit_concept_id)) {
      statement <- paste0(statement, ' unit_concept_id IS NULL')
    } else if (is(unit_concept_id, 'subQuery')){
      statement <- paste0(statement, ' unit_concept_id = (', as.character(unit_concept_id), ')')
    } else {
      statement <- paste0(statement, " unit_concept_id = '", unit_concept_id,"'")
    }
  }
  
  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, ' provider_id IS NULL')
    } else if (is(provider_id, 'subQuery')){
      statement <- paste0(statement, ' provider_id = (', as.character(provider_id), ')')
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }
  
  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, ' visit_occurrence_id IS NULL')
    } else if (is(visit_occurrence_id, 'subQuery')){
      statement <- paste0(statement, ' visit_occurrence_id = (', as.character(visit_occurrence_id), ')')
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }
  
  if (!missing(observation_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(observation_source_value)) {
      statement <- paste0(statement, ' observation_source_value IS NULL')
    } else if (is(observation_source_value, 'subQuery')){
      statement <- paste0(statement, ' observation_source_value = (', as.character(observation_source_value), ')')
    } else {
      statement <- paste0(statement, " observation_source_value = '", observation_source_value,"'")
    }
  }
  
  if (!missing(observation_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(observation_source_concept_id)) {
      statement <- paste0(statement, ' observation_source_concept_id IS NULL')
    } else if (is(observation_source_concept_id, 'subQuery')){
      statement <- paste0(statement, ' observation_source_concept_id = (', as.character(observation_source_concept_id), ')')
    } else {
      statement <- paste0(statement, " observation_source_concept_id = '", observation_source_concept_id,"'")
    }
  }
  
  if (!missing(unit_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(unit_source_value)) {
      statement <- paste0(statement, ' unit_source_value IS NULL')
    } else if (is(unit_source_value, 'subQuery')){
      statement <- paste0(statement, ' unit_source_value = (', as.character(unit_source_value), ')')
    } else {
      statement <- paste0(statement, " unit_source_value = '", unit_source_value,"'")
    }
  }
  
  if (!missing(qualifier_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(qualifier_source_value)) {
      statement <- paste0(statement, ' qualifier_source_value IS NULL')
    } else if (is(qualifier_source_value, 'subQuery')){
      statement <- paste0(statement, ' qualifier_source_value = (', as.character(qualifier_source_value), ')')
    } else {
      statement <- paste0(statement, " qualifier_source_value = '", qualifier_source_value,"'")
    }
  }
  
  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status")
  if (exists('testNewExpected', where = globalenv()) && get('testNewExpected'))
  {
    assign('testNewExpected', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    testSql <<- c(testSql, comment)
  }
  testSql <<- c(testSql, statement)
  invisible(statement)
}

expect_note <- function(note_id, person_id, note_date, note_datetime, note_type_concept_id, note_text, provider_id, visit_occurrence_id, note_source_value) {
  #statement <- paste0("INSERT INTO @cdmDatabaseSchema.test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect note' AS test, CASE WHEN(SELECT COUNT(*) from @cdmDatabaseSchema.note WHERE")
  statement <- getExpectStatement(domain = "note", table = "note")
  first <- TRUE
  if (!missing(note_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(note_id)) {
      statement <- paste0(statement, ' note_id IS NULL')
    } else if (is(note_id, 'subQuery')){
      statement <- paste0(statement, ' note_id = (', as.character(note_id), ')')
    } else {
      statement <- paste0(statement, " note_id = '", note_id,"'")
    }
  }
  
  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, ' person_id IS NULL')
    } else if (is(person_id, 'subQuery')){
      statement <- paste0(statement, ' person_id = (', as.character(person_id), ')')
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }
  
  if (!missing(note_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(note_date)) {
      statement <- paste0(statement, ' note_date IS NULL')
    } else if (is(note_date, 'subQuery')){
      statement <- paste0(statement, ' note_date = (', as.character(note_date), ')')
    } else {
      statement <- paste0(statement, " note_date = '", note_date,"'")
    }
  }
  
  if (!missing(note_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(note_datetime)) {
      statement <- paste0(statement, ' note_datetime IS NULL')
    } else if (is(note_datetime, 'subQuery')){
      statement <- paste0(statement, ' note_datetime = (', as.character(note_datetime), ')')
    } else {
      statement <- paste0(statement, " note_datetime = '", note_datetime,"'")
    }
  }
  
  if (!missing(note_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(note_type_concept_id)) {
      statement <- paste0(statement, ' note_type_concept_id IS NULL')
    } else if (is(note_type_concept_id, 'subQuery')){
      statement <- paste0(statement, ' note_type_concept_id = (', as.character(note_type_concept_id), ')')
    } else {
      statement <- paste0(statement, " note_type_concept_id = '", note_type_concept_id,"'")
    }
  }
  
  if (!missing(note_text)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(note_text)) {
      statement <- paste0(statement, ' note_text IS NULL')
    } else if (is(note_text, 'subQuery')){
      statement <- paste0(statement, ' note_text = (', as.character(note_text), ')')
    } else {
      statement <- paste0(statement, " note_text = '", note_text,"'")
    }
  }
  
  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, ' provider_id IS NULL')
    } else if (is(provider_id, 'subQuery')){
      statement <- paste0(statement, ' provider_id = (', as.character(provider_id), ')')
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }
  
  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, ' visit_occurrence_id IS NULL')
    } else if (is(visit_occurrence_id, 'subQuery')){
      statement <- paste0(statement, ' visit_occurrence_id = (', as.character(visit_occurrence_id), ')')
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }
  
  if (!missing(note_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(note_source_value)) {
      statement <- paste0(statement, ' note_source_value IS NULL')
    } else if (is(note_source_value, 'subQuery')){
      statement <- paste0(statement, ' note_source_value = (', as.character(note_source_value), ')')
    } else {
      statement <- paste0(statement, " note_source_value = '", note_source_value,"'")
    }
  }
  
  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status")
  if (exists('testNewExpected', where = globalenv()) && get('testNewExpected'))
  {
    assign('testNewExpected', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    testSql <<- c(testSql, comment)
  }
  testSql <<- c(testSql, statement)
  invisible(statement)
}

expect_specimen <- function(specimen_id, person_id, specimen_concept_id, specimen_type_concept_id, specimen_date, specimen_datetime, quantity, unit_concept_id, anatomic_site_concept_id, disease_status_concept_id, specimen_source_id, specimen_source_value, unit_source_value, anatomic_site_source_value, disease_status_source_value) {
  #statement <- paste0("INSERT INTO @cdmDatabaseSchema.test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect specimen' AS test, CASE WHEN(SELECT COUNT(*) from @cdmDatabaseSchema.specimen WHERE")
  statement <- getExpectStatement(domain = "specimen", table = "specimen")
  first <- TRUE
  if (!missing(specimen_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(specimen_id)) {
      statement <- paste0(statement, ' specimen_id IS NULL')
    } else if (is(specimen_id, 'subQuery')){
      statement <- paste0(statement, ' specimen_id = (', as.character(specimen_id), ')')
    } else {
      statement <- paste0(statement, " specimen_id = '", specimen_id,"'")
    }
  }
  
  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, ' person_id IS NULL')
    } else if (is(person_id, 'subQuery')){
      statement <- paste0(statement, ' person_id = (', as.character(person_id), ')')
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }
  
  if (!missing(specimen_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(specimen_concept_id)) {
      statement <- paste0(statement, ' specimen_concept_id IS NULL')
    } else if (is(specimen_concept_id, 'subQuery')){
      statement <- paste0(statement, ' specimen_concept_id = (', as.character(specimen_concept_id), ')')
    } else {
      statement <- paste0(statement, " specimen_concept_id = '", specimen_concept_id,"'")
    }
  }
  
  if (!missing(specimen_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(specimen_type_concept_id)) {
      statement <- paste0(statement, ' specimen_type_concept_id IS NULL')
    } else if (is(specimen_type_concept_id, 'subQuery')){
      statement <- paste0(statement, ' specimen_type_concept_id = (', as.character(specimen_type_concept_id), ')')
    } else {
      statement <- paste0(statement, " specimen_type_concept_id = '", specimen_type_concept_id,"'")
    }
  }
  
  if (!missing(specimen_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(specimen_date)) {
      statement <- paste0(statement, ' specimen_date IS NULL')
    } else if (is(specimen_date, 'subQuery')){
      statement <- paste0(statement, ' specimen_date = (', as.character(specimen_date), ')')
    } else {
      statement <- paste0(statement, " specimen_date = '", specimen_date,"'")
    }
  }
  
  if (!missing(specimen_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(specimen_datetime)) {
      statement <- paste0(statement, ' specimen_datetime IS NULL')
    } else if (is(specimen_datetime, 'subQuery')){
      statement <- paste0(statement, ' specimen_datetime = (', as.character(specimen_datetime), ')')
    } else {
      statement <- paste0(statement, " specimen_datetime = '", specimen_datetime,"'")
    }
  }
  
  if (!missing(quantity)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(quantity)) {
      statement <- paste0(statement, ' quantity IS NULL')
    } else if (is(quantity, 'subQuery')){
      statement <- paste0(statement, ' quantity = (', as.character(quantity), ')')
    } else {
      statement <- paste0(statement, " quantity = '", quantity,"'")
    }
  }
  
  if (!missing(unit_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(unit_concept_id)) {
      statement <- paste0(statement, ' unit_concept_id IS NULL')
    } else if (is(unit_concept_id, 'subQuery')){
      statement <- paste0(statement, ' unit_concept_id = (', as.character(unit_concept_id), ')')
    } else {
      statement <- paste0(statement, " unit_concept_id = '", unit_concept_id,"'")
    }
  }
  
  if (!missing(anatomic_site_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(anatomic_site_concept_id)) {
      statement <- paste0(statement, ' anatomic_site_concept_id IS NULL')
    } else if (is(anatomic_site_concept_id, 'subQuery')){
      statement <- paste0(statement, ' anatomic_site_concept_id = (', as.character(anatomic_site_concept_id), ')')
    } else {
      statement <- paste0(statement, " anatomic_site_concept_id = '", anatomic_site_concept_id,"'")
    }
  }
  
  if (!missing(disease_status_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(disease_status_concept_id)) {
      statement <- paste0(statement, ' disease_status_concept_id IS NULL')
    } else if (is(disease_status_concept_id, 'subQuery')){
      statement <- paste0(statement, ' disease_status_concept_id = (', as.character(disease_status_concept_id), ')')
    } else {
      statement <- paste0(statement, " disease_status_concept_id = '", disease_status_concept_id,"'")
    }
  }
  
  if (!missing(specimen_source_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(specimen_source_id)) {
      statement <- paste0(statement, ' specimen_source_id IS NULL')
    } else if (is(specimen_source_id, 'subQuery')){
      statement <- paste0(statement, ' specimen_source_id = (', as.character(specimen_source_id), ')')
    } else {
      statement <- paste0(statement, " specimen_source_id = '", specimen_source_id,"'")
    }
  }
  
  if (!missing(specimen_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(specimen_source_value)) {
      statement <- paste0(statement, ' specimen_source_value IS NULL')
    } else if (is(specimen_source_value, 'subQuery')){
      statement <- paste0(statement, ' specimen_source_value = (', as.character(specimen_source_value), ')')
    } else {
      statement <- paste0(statement, " specimen_source_value = '", specimen_source_value,"'")
    }
  }
  
  if (!missing(unit_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(unit_source_value)) {
      statement <- paste0(statement, ' unit_source_value IS NULL')
    } else if (is(unit_source_value, 'subQuery')){
      statement <- paste0(statement, ' unit_source_value = (', as.character(unit_source_value), ')')
    } else {
      statement <- paste0(statement, " unit_source_value = '", unit_source_value,"'")
    }
  }
  
  if (!missing(anatomic_site_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(anatomic_site_source_value)) {
      statement <- paste0(statement, ' anatomic_site_source_value IS NULL')
    } else if (is(anatomic_site_source_value, 'subQuery')){
      statement <- paste0(statement, ' anatomic_site_source_value = (', as.character(anatomic_site_source_value), ')')
    } else {
      statement <- paste0(statement, " anatomic_site_source_value = '", anatomic_site_source_value,"'")
    }
  }
  
  if (!missing(disease_status_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(disease_status_source_value)) {
      statement <- paste0(statement, ' disease_status_source_value IS NULL')
    } else if (is(disease_status_source_value, 'subQuery')){
      statement <- paste0(statement, ' disease_status_source_value = (', as.character(disease_status_source_value), ')')
    } else {
      statement <- paste0(statement, " disease_status_source_value = '", disease_status_source_value,"'")
    }
  }
  
  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status")
  if (exists('testNewExpected', where = globalenv()) && get('testNewExpected'))
  {
    assign('testNewExpected', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    testSql <<- c(testSql, comment)
  }
  testSql <<- c(testSql, statement)
  invisible(statement)
}

expect_fact_relationship <- function(domain_concept_id_1, fact_id_1, domain_concept_id_2, fact_id_2, relationship_concept_id) {
  #statement <- paste0("INSERT INTO @cdmDatabaseSchema.test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect fact_relationship' AS test, CASE WHEN(SELECT COUNT(*) from @cdmDatabaseSchema.fact_relationship WHERE")
  statement <- getExpectStatement(domain = "fact_relationship", table = "fact_relationship")
  first <- TRUE
  if (!missing(domain_concept_id_1)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(domain_concept_id_1)) {
      statement <- paste0(statement, ' domain_concept_id_1 IS NULL')
    } else if (is(domain_concept_id_1, 'subQuery')){
      statement <- paste0(statement, ' domain_concept_id_1 = (', as.character(domain_concept_id_1), ')')
    } else {
      statement <- paste0(statement, " domain_concept_id_1 = '", domain_concept_id_1,"'")
    }
  }
  
  if (!missing(fact_id_1)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(fact_id_1)) {
      statement <- paste0(statement, ' fact_id_1 IS NULL')
    } else if (is(fact_id_1, 'subQuery')){
      statement <- paste0(statement, ' fact_id_1 = (', as.character(fact_id_1), ')')
    } else {
      statement <- paste0(statement, " fact_id_1 = '", fact_id_1,"'")
    }
  }
  
  if (!missing(domain_concept_id_2)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(domain_concept_id_2)) {
      statement <- paste0(statement, ' domain_concept_id_2 IS NULL')
    } else if (is(domain_concept_id_2, 'subQuery')){
      statement <- paste0(statement, ' domain_concept_id_2 = (', as.character(domain_concept_id_2), ')')
    } else {
      statement <- paste0(statement, " domain_concept_id_2 = '", domain_concept_id_2,"'")
    }
  }
  
  if (!missing(fact_id_2)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(fact_id_2)) {
      statement <- paste0(statement, ' fact_id_2 IS NULL')
    } else if (is(fact_id_2, 'subQuery')){
      statement <- paste0(statement, ' fact_id_2 = (', as.character(fact_id_2), ')')
    } else {
      statement <- paste0(statement, " fact_id_2 = '", fact_id_2,"'")
    }
  }
  
  if (!missing(relationship_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(relationship_concept_id)) {
      statement <- paste0(statement, ' relationship_concept_id IS NULL')
    } else if (is(relationship_concept_id, 'subQuery')){
      statement <- paste0(statement, ' relationship_concept_id = (', as.character(relationship_concept_id), ')')
    } else {
      statement <- paste0(statement, " relationship_concept_id = '", relationship_concept_id,"'")
    }
  }
  
  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status")
  if (exists('testNewExpected', where = globalenv()) && get('testNewExpected'))
  {
    assign('testNewExpected', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    testSql <<- c(testSql, comment)
  }
  testSql <<- c(testSql, statement)
  invisible(statement)
}

expect_drug_era <- function(drug_era_id, person_id, drug_concept_id, drug_era_start_date, drug_era_end_date, drug_exposure_count, gap_days) {
  #statement <- paste0("INSERT INTO @cdmDatabaseSchema.test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect drug_era' AS test, CASE WHEN(SELECT COUNT(*) from @cdmDatabaseSchema.drug_era WHERE")
  statement <- getExpectStatement(domain = "drug_era", table = "drug_era")
  first <- TRUE
  if (!missing(drug_era_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(drug_era_id)) {
      statement <- paste0(statement, ' drug_era_id IS NULL')
    } else if (is(drug_era_id, 'subQuery')){
      statement <- paste0(statement, ' drug_era_id = (', as.character(drug_era_id), ')')
    } else {
      statement <- paste0(statement, " drug_era_id = '", drug_era_id,"'")
    }
  }
  
  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, ' person_id IS NULL')
    } else if (is(person_id, 'subQuery')){
      statement <- paste0(statement, ' person_id = (', as.character(person_id), ')')
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }
  
  if (!missing(drug_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(drug_concept_id)) {
      statement <- paste0(statement, ' drug_concept_id IS NULL')
    } else if (is(drug_concept_id, 'subQuery')){
      statement <- paste0(statement, ' drug_concept_id = (', as.character(drug_concept_id), ')')
    } else {
      statement <- paste0(statement, " drug_concept_id = '", drug_concept_id,"'")
    }
  }
  
  if (!missing(drug_era_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(drug_era_start_date)) {
      statement <- paste0(statement, ' drug_era_start_date IS NULL')
    } else if (is(drug_era_start_date, 'subQuery')){
      statement <- paste0(statement, ' drug_era_start_date = (', as.character(drug_era_start_date), ')')
    } else {
      statement <- paste0(statement, " drug_era_start_date = '", drug_era_start_date,"'")
    }
  }
  
  if (!missing(drug_era_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(drug_era_end_date)) {
      statement <- paste0(statement, ' drug_era_end_date IS NULL')
    } else if (is(drug_era_end_date, 'subQuery')){
      statement <- paste0(statement, ' drug_era_end_date = (', as.character(drug_era_end_date), ')')
    } else {
      statement <- paste0(statement, " drug_era_end_date = '", drug_era_end_date,"'")
    }
  }
  
  if (!missing(drug_exposure_count)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(drug_exposure_count)) {
      statement <- paste0(statement, ' drug_exposure_count IS NULL')
    } else if (is(drug_exposure_count, 'subQuery')){
      statement <- paste0(statement, ' drug_exposure_count = (', as.character(drug_exposure_count), ')')
    } else {
      statement <- paste0(statement, " drug_exposure_count = '", drug_exposure_count,"'")
    }
  }
  
  if (!missing(gap_days)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(gap_days)) {
      statement <- paste0(statement, ' gap_days IS NULL')
    } else if (is(gap_days, 'subQuery')){
      statement <- paste0(statement, ' gap_days = (', as.character(gap_days), ')')
    } else {
      statement <- paste0(statement, " gap_days = '", gap_days,"'")
    }
  }
  
  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status")
  if (exists('testNewExpected', where = globalenv()) && get('testNewExpected'))
  {
    assign('testNewExpected', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    testSql <<- c(testSql, comment)
  }
  testSql <<- c(testSql, statement)
  invisible(statement)
}

expect_dose_era <- function(dose_era_id, person_id, drug_concept_id, unit_concept_id, dose_value, dose_era_start_date, dose_era_end_date) {
  #statement <- paste0("INSERT INTO @cdmDatabaseSchema.test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect dose_era' AS test, CASE WHEN(SELECT COUNT(*) from @cdmDatabaseSchema.dose_era WHERE")
  statement <- getExpectStatement(domain = "dose_era", table = "dose_era")
  first <- TRUE
  if (!missing(dose_era_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(dose_era_id)) {
      statement <- paste0(statement, ' dose_era_id IS NULL')
    } else if (is(dose_era_id, 'subQuery')){
      statement <- paste0(statement, ' dose_era_id = (', as.character(dose_era_id), ')')
    } else {
      statement <- paste0(statement, " dose_era_id = '", dose_era_id,"'")
    }
  }
  
  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, ' person_id IS NULL')
    } else if (is(person_id, 'subQuery')){
      statement <- paste0(statement, ' person_id = (', as.character(person_id), ')')
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }
  
  if (!missing(drug_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(drug_concept_id)) {
      statement <- paste0(statement, ' drug_concept_id IS NULL')
    } else if (is(drug_concept_id, 'subQuery')){
      statement <- paste0(statement, ' drug_concept_id = (', as.character(drug_concept_id), ')')
    } else {
      statement <- paste0(statement, " drug_concept_id = '", drug_concept_id,"'")
    }
  }
  
  if (!missing(unit_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(unit_concept_id)) {
      statement <- paste0(statement, ' unit_concept_id IS NULL')
    } else if (is(unit_concept_id, 'subQuery')){
      statement <- paste0(statement, ' unit_concept_id = (', as.character(unit_concept_id), ')')
    } else {
      statement <- paste0(statement, " unit_concept_id = '", unit_concept_id,"'")
    }
  }
  
  if (!missing(dose_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(dose_value)) {
      statement <- paste0(statement, ' dose_value IS NULL')
    } else if (is(dose_value, 'subQuery')){
      statement <- paste0(statement, ' dose_value = (', as.character(dose_value), ')')
    } else {
      statement <- paste0(statement, " dose_value = '", dose_value,"'")
    }
  }
  
  if (!missing(dose_era_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(dose_era_start_date)) {
      statement <- paste0(statement, ' dose_era_start_date IS NULL')
    } else if (is(dose_era_start_date, 'subQuery')){
      statement <- paste0(statement, ' dose_era_start_date = (', as.character(dose_era_start_date), ')')
    } else {
      statement <- paste0(statement, " dose_era_start_date = '", dose_era_start_date,"'")
    }
  }
  
  if (!missing(dose_era_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(dose_era_end_date)) {
      statement <- paste0(statement, ' dose_era_end_date IS NULL')
    } else if (is(dose_era_end_date, 'subQuery')){
      statement <- paste0(statement, ' dose_era_end_date = (', as.character(dose_era_end_date), ')')
    } else {
      statement <- paste0(statement, " dose_era_end_date = '", dose_era_end_date,"'")
    }
  }
  
  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status")
  if (exists('testNewExpected', where = globalenv()) && get('testNewExpected'))
  {
    assign('testNewExpected', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    testSql <<- c(testSql, comment)
  }
  testSql <<- c(testSql, statement)
  invisible(statement)
}

expect_condition_era <- function(condition_era_id, person_id, condition_concept_id, condition_era_start_date, condition_era_end_date, condition_occurrence_count) {
  #statement <- paste0("INSERT INTO @cdmDatabaseSchema.test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect condition_era' AS test, CASE WHEN(SELECT COUNT(*) from @cdmDatabaseSchema.condition_era WHERE")
  statement <- getExpectStatement(domain = "condition_era", table = "condition_era")
  first <- TRUE
  if (!missing(condition_era_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(condition_era_id)) {
      statement <- paste0(statement, ' condition_era_id IS NULL')
    } else if (is(condition_era_id, 'subQuery')){
      statement <- paste0(statement, ' condition_era_id = (', as.character(condition_era_id), ')')
    } else {
      statement <- paste0(statement, " condition_era_id = '", condition_era_id,"'")
    }
  }
  
  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, ' person_id IS NULL')
    } else if (is(person_id, 'subQuery')){
      statement <- paste0(statement, ' person_id = (', as.character(person_id), ')')
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }
  
  if (!missing(condition_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(condition_concept_id)) {
      statement <- paste0(statement, ' condition_concept_id IS NULL')
    } else if (is(condition_concept_id, 'subQuery')){
      statement <- paste0(statement, ' condition_concept_id = (', as.character(condition_concept_id), ')')
    } else {
      statement <- paste0(statement, " condition_concept_id = '", condition_concept_id,"'")
    }
  }
  
  if (!missing(condition_era_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(condition_era_start_date)) {
      statement <- paste0(statement, ' condition_era_start_date IS NULL')
    } else if (is(condition_era_start_date, 'subQuery')){
      statement <- paste0(statement, ' condition_era_start_date = (', as.character(condition_era_start_date), ')')
    } else {
      statement <- paste0(statement, " condition_era_start_date = '", condition_era_start_date,"'")
    }
  }
  
  if (!missing(condition_era_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(condition_era_end_date)) {
      statement <- paste0(statement, ' condition_era_end_date IS NULL')
    } else if (is(condition_era_end_date, 'subQuery')){
      statement <- paste0(statement, ' condition_era_end_date = (', as.character(condition_era_end_date), ')')
    } else {
      statement <- paste0(statement, " condition_era_end_date = '", condition_era_end_date,"'")
    }
  }
  
  if (!missing(condition_occurrence_count)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(condition_occurrence_count)) {
      statement <- paste0(statement, ' condition_occurrence_count IS NULL')
    } else if (is(condition_occurrence_count, 'subQuery')){
      statement <- paste0(statement, ' condition_occurrence_count = (', as.character(condition_occurrence_count), ')')
    } else {
      statement <- paste0(statement, " condition_occurrence_count = '", condition_occurrence_count,"'")
    }
  }
  
  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status")
  if (exists('testNewExpected', where = globalenv()) && get('testNewExpected'))
  {
    assign('testNewExpected', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    testSql <<- c(testSql, comment)
  }
  testSql <<- c(testSql, statement)
  invisible(statement)
}

expect_cdm_source <- function(cdm_source_name, cdm_source_abbreviation, cdm_holder, source_description, source_documentation_reference, cdm_etl_reference, source_release_date, cdm_release_date, cdm_version, vocabulary_version) {
  #statement <- paste0("INSERT INTO @cdmDatabaseSchema.test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect cdm_source' AS test, CASE WHEN(SELECT COUNT(*) FROM cdm_source WHERE")
  statement <- getExpectStatement(domain = "cdm_source", table = "cdm_source")
  first <- TRUE
  if (!missing(cdm_source_name)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cdm_source_name)) {
      statement <- paste0(statement, ' cdm_source_name IS NULL')
    } else if (is(cdm_source_name, 'subQuery')){
      statement <- paste0(statement, ' cdm_source_name = (', as.character(cdm_source_name), ')')
    } else {
      statement <- paste0(statement, " cdm_source_name = '", cdm_source_name,"'")
    }
  }
  
  if (!missing(cdm_source_abbreviation)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cdm_source_abbreviation)) {
      statement <- paste0(statement, ' cdm_source_abbreviation IS NULL')
    } else if (is(cdm_source_abbreviation, 'subQuery')){
      statement <- paste0(statement, ' cdm_source_abbreviation = (', as.character(cdm_source_abbreviation), ')')
    } else {
      statement <- paste0(statement, " cdm_source_abbreviation = '", cdm_source_abbreviation,"'")
    }
  }
  
  if (!missing(cdm_holder)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cdm_holder)) {
      statement <- paste0(statement, ' cdm_holder IS NULL')
    } else if (is(cdm_holder, 'subQuery')){
      statement <- paste0(statement, ' cdm_holder = (', as.character(cdm_holder), ')')
    } else {
      statement <- paste0(statement, " cdm_holder = '", cdm_holder,"'")
    }
  }
  
  if (!missing(source_description)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(source_description)) {
      statement <- paste0(statement, ' source_description IS NULL')
    } else if (is(source_description, 'subQuery')){
      statement <- paste0(statement, ' source_description = (', as.character(source_description), ')')
    } else {
      statement <- paste0(statement, " source_description = '", source_description,"'")
    }
  }
  
  if (!missing(source_documentation_reference)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(source_documentation_reference)) {
      statement <- paste0(statement, ' source_documentation_reference IS NULL')
    } else if (is(source_documentation_reference, 'subQuery')){
      statement <- paste0(statement, ' source_documentation_reference = (', as.character(source_documentation_reference), ')')
    } else {
      statement <- paste0(statement, " source_documentation_reference = '", source_documentation_reference,"'")
    }
  }
  
  if (!missing(cdm_etl_reference)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cdm_etl_reference)) {
      statement <- paste0(statement, ' cdm_etl_reference IS NULL')
    } else if (is(cdm_etl_reference, 'subQuery')){
      statement <- paste0(statement, ' cdm_etl_reference = (', as.character(cdm_etl_reference), ')')
    } else {
      statement <- paste0(statement, " cdm_etl_reference = '", cdm_etl_reference,"'")
    }
  }
  
  if (!missing(source_release_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(source_release_date)) {
      statement <- paste0(statement, ' source_release_date IS NULL')
    } else if (is(source_release_date, 'subQuery')){
      statement <- paste0(statement, ' source_release_date = (', as.character(source_release_date), ')')
    } else {
      statement <- paste0(statement, " source_release_date = '", source_release_date,"'")
    }
  }
  
  if (!missing(cdm_release_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cdm_release_date)) {
      statement <- paste0(statement, ' cdm_release_date IS NULL')
    } else if (is(cdm_release_date, 'subQuery')){
      statement <- paste0(statement, ' cdm_release_date = (', as.character(cdm_release_date), ')')
    } else {
      statement <- paste0(statement, " cdm_release_date = '", cdm_release_date,"'")
    }
  }
  
  if (!missing(cdm_version)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cdm_version)) {
      statement <- paste0(statement, ' cdm_version IS NULL')
    } else if (is(cdm_version, 'subQuery')){
      statement <- paste0(statement, ' cdm_version = (', as.character(cdm_version), ')')
    } else {
      statement <- paste0(statement, " cdm_version = '", cdm_version,"'")
    }
  }
  
  if (!missing(vocabulary_version)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(vocabulary_version)) {
      statement <- paste0(statement, ' vocabulary_version IS NULL')
    } else if (is(vocabulary_version, 'subQuery')){
      statement <- paste0(statement, ' vocabulary_version = (', as.character(vocabulary_version), ')')
    } else {
      statement <- paste0(statement, " vocabulary_version = '", vocabulary_version,"'")
    }
  }
  
  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status")
  if (exists('testNewExpected', where = globalenv()) && get('testNewExpected'))
  {
    assign('testNewExpected', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    testSql <<- c(testSql, comment)
  }
  testSql <<- c(testSql, statement)
  invisible(statement)
}

expect_cohort <- function(cohort_definition_id, subject_id, cohort_start_date, cohort_end_date) {
  #statement <- paste0("INSERT INTO @cdmDatabaseSchema.test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect cohort' AS test, CASE WHEN(SELECT COUNT(*) FROM cohort WHERE")
  first <- TRUEstatement <- getExpectStatement(domain = "cohort", table = "cohort")
  if (!missing(cohort_definition_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cohort_definition_id)) {
      statement <- paste0(statement, ' cohort_definition_id IS NULL')
    } else if (is(cohort_definition_id, 'subQuery')){
      statement <- paste0(statement, ' cohort_definition_id = (', as.character(cohort_definition_id), ')')
    } else {
      statement <- paste0(statement, " cohort_definition_id = '", cohort_definition_id,"'")
    }
  }
  
  if (!missing(subject_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(subject_id)) {
      statement <- paste0(statement, ' subject_id IS NULL')
    } else if (is(subject_id, 'subQuery')){
      statement <- paste0(statement, ' subject_id = (', as.character(subject_id), ')')
    } else {
      statement <- paste0(statement, " subject_id = '", subject_id,"'")
    }
  }
  
  if (!missing(cohort_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cohort_start_date)) {
      statement <- paste0(statement, ' cohort_start_date IS NULL')
    } else if (is(cohort_start_date, 'subQuery')){
      statement <- paste0(statement, ' cohort_start_date = (', as.character(cohort_start_date), ')')
    } else {
      statement <- paste0(statement, " cohort_start_date = '", cohort_start_date,"'")
    }
  }
  
  if (!missing(cohort_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cohort_end_date)) {
      statement <- paste0(statement, ' cohort_end_date IS NULL')
    } else if (is(cohort_end_date, 'subQuery')){
      statement <- paste0(statement, ' cohort_end_date = (', as.character(cohort_end_date), ')')
    } else {
      statement <- paste0(statement, " cohort_end_date = '", cohort_end_date,"'")
    }
  }
  
  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status")
  if (exists('testNewExpected', where = globalenv()) && get('testNewExpected'))
  {
    assign('testNewExpected', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    testSql <<- c(testSql, comment)
  }
  testSql <<- c(testSql, statement)
  invisible(statement)
}

expect_cohort_definition <- function(cohort_definition_id, cohort_definition_name, cohort_definition_description, definition_type_concept_id, cohort_definition_syntax, subject_concept_id, cohort_instantiation_date) {
  #statement <- paste0("INSERT INTO @cdmDatabaseSchema.test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect cohort_definition' AS test, CASE WHEN(SELECT COUNT(*) FROM cohort_definition WHERE")
  statement <- getExpectStatement(domain = "cohort_definition", table = "cohort_definition")
  first <- TRUE
  if (!missing(cohort_definition_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cohort_definition_id)) {
      statement <- paste0(statement, ' cohort_definition_id IS NULL')
    } else if (is(cohort_definition_id, 'subQuery')){
      statement <- paste0(statement, ' cohort_definition_id = (', as.character(cohort_definition_id), ')')
    } else {
      statement <- paste0(statement, " cohort_definition_id = '", cohort_definition_id,"'")
    }
  }
  
  if (!missing(cohort_definition_name)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cohort_definition_name)) {
      statement <- paste0(statement, ' cohort_definition_name IS NULL')
    } else if (is(cohort_definition_name, 'subQuery')){
      statement <- paste0(statement, ' cohort_definition_name = (', as.character(cohort_definition_name), ')')
    } else {
      statement <- paste0(statement, " cohort_definition_name = '", cohort_definition_name,"'")
    }
  }
  
  if (!missing(cohort_definition_description)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cohort_definition_description)) {
      statement <- paste0(statement, ' cohort_definition_description IS NULL')
    } else if (is(cohort_definition_description, 'subQuery')){
      statement <- paste0(statement, ' cohort_definition_description = (', as.character(cohort_definition_description), ')')
    } else {
      statement <- paste0(statement, " cohort_definition_description = '", cohort_definition_description,"'")
    }
  }
  
  if (!missing(definition_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(definition_type_concept_id)) {
      statement <- paste0(statement, ' definition_type_concept_id IS NULL')
    } else if (is(definition_type_concept_id, 'subQuery')){
      statement <- paste0(statement, ' definition_type_concept_id = (', as.character(definition_type_concept_id), ')')
    } else {
      statement <- paste0(statement, " definition_type_concept_id = '", definition_type_concept_id,"'")
    }
  }
  
  if (!missing(cohort_definition_syntax)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cohort_definition_syntax)) {
      statement <- paste0(statement, ' cohort_definition_syntax IS NULL')
    } else if (is(cohort_definition_syntax, 'subQuery')){
      statement <- paste0(statement, ' cohort_definition_syntax = (', as.character(cohort_definition_syntax), ')')
    } else {
      statement <- paste0(statement, " cohort_definition_syntax = '", cohort_definition_syntax,"'")
    }
  }
  
  if (!missing(subject_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(subject_concept_id)) {
      statement <- paste0(statement, ' subject_concept_id IS NULL')
    } else if (is(subject_concept_id, 'subQuery')){
      statement <- paste0(statement, ' subject_concept_id = (', as.character(subject_concept_id), ')')
    } else {
      statement <- paste0(statement, " subject_concept_id = '", subject_concept_id,"'")
    }
  }
  
  if (!missing(cohort_instantiation_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cohort_instantiation_date)) {
      statement <- paste0(statement, ' cohort_instantiation_date IS NULL')
    } else if (is(cohort_instantiation_date, 'subQuery')){
      statement <- paste0(statement, ' cohort_instantiation_date = (', as.character(cohort_instantiation_date), ')')
    } else {
      statement <- paste0(statement, " cohort_instantiation_date = '", cohort_instantiation_date,"'")
    }
  }
  
  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status")
  if (exists('testNewExpected', where = globalenv()) && get('testNewExpected'))
  {
    assign('testNewExpected', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    testSql <<- c(testSql, comment)
  }
  testSql <<- c(testSql, statement)
  invisible(statement)
}

expect_cohort_attribute <- function(cohort_definition_id, cohort_start_date, cohort_end_date, subject_id, attribute_definition_id, value_as_number, value_as_concept_id) {
  #statement <- paste0("INSERT INTO @cdmDatabaseSchema.test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect cohort_attribute' AS test, CASE WHEN(SELECT COUNT(*) FROM cohort_attribute WHERE")
  statement <- getExpectStatement(domain = "cohort_attribute", table = "cohort_attribute")
  first <- TRUE
  if (!missing(cohort_definition_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cohort_definition_id)) {
      statement <- paste0(statement, ' cohort_definition_id IS NULL')
    } else if (is(cohort_definition_id, 'subQuery')){
      statement <- paste0(statement, ' cohort_definition_id = (', as.character(cohort_definition_id), ')')
    } else {
      statement <- paste0(statement, " cohort_definition_id = '", cohort_definition_id,"'")
    }
  }
  
  if (!missing(cohort_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cohort_start_date)) {
      statement <- paste0(statement, ' cohort_start_date IS NULL')
    } else if (is(cohort_start_date, 'subQuery')){
      statement <- paste0(statement, ' cohort_start_date = (', as.character(cohort_start_date), ')')
    } else {
      statement <- paste0(statement, " cohort_start_date = '", cohort_start_date,"'")
    }
  }
  
  if (!missing(cohort_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cohort_end_date)) {
      statement <- paste0(statement, ' cohort_end_date IS NULL')
    } else if (is(cohort_end_date, 'subQuery')){
      statement <- paste0(statement, ' cohort_end_date = (', as.character(cohort_end_date), ')')
    } else {
      statement <- paste0(statement, " cohort_end_date = '", cohort_end_date,"'")
    }
  }
  
  if (!missing(subject_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(subject_id)) {
      statement <- paste0(statement, ' subject_id IS NULL')
    } else if (is(subject_id, 'subQuery')){
      statement <- paste0(statement, ' subject_id = (', as.character(subject_id), ')')
    } else {
      statement <- paste0(statement, " subject_id = '", subject_id,"'")
    }
  }
  
  if (!missing(attribute_definition_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(attribute_definition_id)) {
      statement <- paste0(statement, ' attribute_definition_id IS NULL')
    } else if (is(attribute_definition_id, 'subQuery')){
      statement <- paste0(statement, ' attribute_definition_id = (', as.character(attribute_definition_id), ')')
    } else {
      statement <- paste0(statement, " attribute_definition_id = '", attribute_definition_id,"'")
    }
  }
  
  if (!missing(value_as_number)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(value_as_number)) {
      statement <- paste0(statement, ' value_as_number IS NULL')
    } else if (is(value_as_number, 'subQuery')){
      statement <- paste0(statement, ' value_as_number = (', as.character(value_as_number), ')')
    } else {
      statement <- paste0(statement, " value_as_number = '", value_as_number,"'")
    }
  }
  
  if (!missing(value_as_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(value_as_concept_id)) {
      statement <- paste0(statement, ' value_as_concept_id IS NULL')
    } else if (is(value_as_concept_id, 'subQuery')){
      statement <- paste0(statement, ' value_as_concept_id = (', as.character(value_as_concept_id), ')')
    } else {
      statement <- paste0(statement, " value_as_concept_id = '", value_as_concept_id,"'")
    }
  }
  
  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status")
  if (exists('testNewExpected', where = globalenv()) && get('testNewExpected'))
  {
    assign('testNewExpected', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    testSql <<- c(testSql, comment)
  }
  testSql <<- c(testSql, statement)
  invisible(statement)
}

expect_attribute_definition <- function(attribute_definition_id, attribute_name, attribute_description, attribute_type_concept_id, attribute_syntax) {
  #statement <- paste0("INSERT INTO @cdmDatabaseSchema.test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect attribute_definition' AS test, CASE WHEN(SELECT COUNT(*) FROM attribute_definition WHERE")
  statement <- getExpectStatement(domain = "attribute_definition", table = "attribute_definition")
  first <- TRUE
  if (!missing(attribute_definition_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(attribute_definition_id)) {
      statement <- paste0(statement, ' attribute_definition_id IS NULL')
    } else if (is(attribute_definition_id, 'subQuery')){
      statement <- paste0(statement, ' attribute_definition_id = (', as.character(attribute_definition_id), ')')
    } else {
      statement <- paste0(statement, " attribute_definition_id = '", attribute_definition_id,"'")
    }
  }
  
  if (!missing(attribute_name)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(attribute_name)) {
      statement <- paste0(statement, ' attribute_name IS NULL')
    } else if (is(attribute_name, 'subQuery')){
      statement <- paste0(statement, ' attribute_name = (', as.character(attribute_name), ')')
    } else {
      statement <- paste0(statement, " attribute_name = '", attribute_name,"'")
    }
  }
  
  if (!missing(attribute_description)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(attribute_description)) {
      statement <- paste0(statement, ' attribute_description IS NULL')
    } else if (is(attribute_description, 'subQuery')){
      statement <- paste0(statement, ' attribute_description = (', as.character(attribute_description), ')')
    } else {
      statement <- paste0(statement, " attribute_description = '", attribute_description,"'")
    }
  }
  
  if (!missing(attribute_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(attribute_type_concept_id)) {
      statement <- paste0(statement, ' attribute_type_concept_id IS NULL')
    } else if (is(attribute_type_concept_id, 'subQuery')){
      statement <- paste0(statement, ' attribute_type_concept_id = (', as.character(attribute_type_concept_id), ')')
    } else {
      statement <- paste0(statement, " attribute_type_concept_id = '", attribute_type_concept_id,"'")
    }
  }
  
  if (!missing(attribute_syntax)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(attribute_syntax)) {
      statement <- paste0(statement, ' attribute_syntax IS NULL')
    } else if (is(attribute_syntax, 'subQuery')){
      statement <- paste0(statement, ' attribute_syntax = (', as.character(attribute_syntax), ')')
    } else {
      statement <- paste0(statement, " attribute_syntax = '", attribute_syntax,"'")
    }
  }
  
  statement <- paste0(statement, ") = 0 THEN 'FAIL' ELSE 'PASS' END AS status")
  if (exists('testNewExpected', where = globalenv()) && get('testNewExpected'))
  {
    assign('testNewExpected', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    testSql <<- c(testSql, comment)
  }
  testSql <<- c(testSql, statement)
  invisible(statement)
}

expect_no_measurement <- function(measurement_id, person_id, measurement_concept_id, measurement_date, measurement_datetime, measurement_type_concept_id, operator_concept_id, value_as_number, value_as_concept_id, unit_concept_id, range_low, range_high, provider_id, visit_occurrence_id, measurement_source_value, measurement_source_concept_id, unit_source_value, value_source_value) {
  #statement <- paste0("INSERT INTO @cdmDatabaseSchema.test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect measurement' AS test, CASE WHEN(SELECT COUNT(*) from @cdmDatabaseSchema.measurement WHERE")
  statement <- getExpectStatement(domain = "measurement", table = "measurement")
  first <- TRUE
  if (!missing(measurement_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(measurement_id)) {
      statement <- paste0(statement, ' measurement_id IS NULL')
    } else if (is(measurement_id, 'subQuery')){
      statement <- paste0(statement, ' measurement_id = (', as.character(measurement_id), ')')
    } else {
      statement <- paste0(statement, " measurement_id = '", measurement_id,"'")
    }
  }
  
  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, ' person_id IS NULL')
    } else if (is(person_id, 'subQuery')){
      statement <- paste0(statement, ' person_id = (', as.character(person_id), ')')
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }
  
  if (!missing(measurement_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(measurement_concept_id)) {
      statement <- paste0(statement, ' measurement_concept_id IS NULL')
    } else if (is(measurement_concept_id, 'subQuery')){
      statement <- paste0(statement, ' measurement_concept_id = (', as.character(measurement_concept_id), ')')
    } else {
      statement <- paste0(statement, " measurement_concept_id = '", measurement_concept_id,"'")
    }
  }
  
  if (!missing(measurement_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(measurement_date)) {
      statement <- paste0(statement, ' measurement_date IS NULL')
    } else if (is(measurement_date, 'subQuery')){
      statement <- paste0(statement, ' measurement_date = (', as.character(measurement_date), ')')
    } else {
      statement <- paste0(statement, " measurement_date = '", measurement_date,"'")
    }
  }
  
  if (!missing(measurement_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(measurement_datetime)) {
      statement <- paste0(statement, ' measurement_datetime IS NULL')
    } else if (is(measurement_datetime, 'subQuery')){
      statement <- paste0(statement, ' measurement_datetime = (', as.character(measurement_datetime), ')')
    } else {
      statement <- paste0(statement, " measurement_datetime = '", measurement_datetime,"'")
    }
  }
  
  if (!missing(measurement_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(measurement_type_concept_id)) {
      statement <- paste0(statement, ' measurement_type_concept_id IS NULL')
    } else if (is(measurement_type_concept_id, 'subQuery')){
      statement <- paste0(statement, ' measurement_type_concept_id = (', as.character(measurement_type_concept_id), ')')
    } else {
      statement <- paste0(statement, " measurement_type_concept_id = '", measurement_type_concept_id,"'")
    }
  }
  
  if (!missing(operator_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(operator_concept_id)) {
      statement <- paste0(statement, ' operator_concept_id IS NULL')
    } else if (is(operator_concept_id, 'subQuery')){
      statement <- paste0(statement, ' operator_concept_id = (', as.character(operator_concept_id), ')')
    } else {
      statement <- paste0(statement, " operator_concept_id = '", operator_concept_id,"'")
    }
  }
  
  if (!missing(value_as_number)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(value_as_number)) {
      statement <- paste0(statement, ' value_as_number IS NULL')
    } else if (is(value_as_number, 'subQuery')){
      statement <- paste0(statement, ' value_as_number = (', as.character(value_as_number), ')')
    } else {
      statement <- paste0(statement, " value_as_number = '", value_as_number,"'")
    }
  }
  
  if (!missing(value_as_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(value_as_concept_id)) {
      statement <- paste0(statement, ' value_as_concept_id IS NULL')
    } else if (is(value_as_concept_id, 'subQuery')){
      statement <- paste0(statement, ' value_as_concept_id = (', as.character(value_as_concept_id), ')')
    } else {
      statement <- paste0(statement, " value_as_concept_id = '", value_as_concept_id,"'")
    }
  }
  
  if (!missing(unit_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(unit_concept_id)) {
      statement <- paste0(statement, ' unit_concept_id IS NULL')
    } else if (is(unit_concept_id, 'subQuery')){
      statement <- paste0(statement, ' unit_concept_id = (', as.character(unit_concept_id), ')')
    } else {
      statement <- paste0(statement, " unit_concept_id = '", unit_concept_id,"'")
    }
  }
  
  if (!missing(range_low)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(range_low)) {
      statement <- paste0(statement, ' range_low IS NULL')
    } else if (is(range_low, 'subQuery')){
      statement <- paste0(statement, ' range_low = (', as.character(range_low), ')')
    } else {
      statement <- paste0(statement, " range_low = '", range_low,"'")
    }
  }
  
  if (!missing(range_high)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(range_high)) {
      statement <- paste0(statement, ' range_high IS NULL')
    } else if (is(range_high, 'subQuery')){
      statement <- paste0(statement, ' range_high = (', as.character(range_high), ')')
    } else {
      statement <- paste0(statement, " range_high = '", range_high,"'")
    }
  }
  
  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, ' provider_id IS NULL')
    } else if (is(provider_id, 'subQuery')){
      statement <- paste0(statement, ' provider_id = (', as.character(provider_id), ')')
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }
  
  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, ' visit_occurrence_id IS NULL')
    } else if (is(visit_occurrence_id, 'subQuery')){
      statement <- paste0(statement, ' visit_occurrence_id = (', as.character(visit_occurrence_id), ')')
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }
  
  if (!missing(measurement_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(measurement_source_value)) {
      statement <- paste0(statement, ' measurement_source_value IS NULL')
    } else if (is(measurement_source_value, 'subQuery')){
      statement <- paste0(statement, ' measurement_source_value = (', as.character(measurement_source_value), ')')
    } else {
      statement <- paste0(statement, " measurement_source_value = '", measurement_source_value,"'")
    }
  }
  
  if (!missing(measurement_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(measurement_source_concept_id)) {
      statement <- paste0(statement, ' measurement_source_concept_id IS NULL')
    } else if (is(measurement_source_concept_id, 'subQuery')){
      statement <- paste0(statement, ' measurement_source_concept_id = (', as.character(measurement_source_concept_id), ')')
    } else {
      statement <- paste0(statement, " measurement_source_concept_id = '", measurement_source_concept_id,"'")
    }
  }
  
  if (!missing(unit_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(unit_source_value)) {
      statement <- paste0(statement, ' unit_source_value IS NULL')
    } else if (is(unit_source_value, 'subQuery')){
      statement <- paste0(statement, ' unit_source_value = (', as.character(unit_source_value), ')')
    } else {
      statement <- paste0(statement, " unit_source_value = '", unit_source_value,"'")
    }
  }
  
  if (!missing(value_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(value_source_value)) {
      statement <- paste0(statement, ' value_source_value IS NULL')
    } else if (is(value_source_value, 'subQuery')){
      statement <- paste0(statement, ' value_source_value = (', as.character(value_source_value), ')')
    } else {
      statement <- paste0(statement, " value_source_value = '", value_source_value,"'")
    }
  }
  
  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status")
  if (exists('testNewExpected', where = globalenv()) && get('testNewExpected'))
  {
    assign('testNewExpected', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    testSql <<- c(testSql, comment)
  }
  testSql <<- c(testSql, statement)
  invisible(statement)
}

expect_no_condition_occurrence <- function(condition_occurrence_id, person_id, condition_concept_id, condition_start_date, condition_start_datetime, condition_end_date, condition_end_datetime, condition_type_concept_id, stop_reason, provider_id, visit_occurrence_id, condition_source_value, condition_source_concept_id) {
  #statement <- paste0("INSERT INTO @cdmDatabaseSchema.test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect condition_occurrence' AS test, CASE WHEN(SELECT COUNT(*) from @cdmDatabaseSchema.condition_occurrence WHERE")
  statement <- getExpectStatement(domain = "condition_occurrence", table = "condition_occurrence")
  first <- TRUE
  if (!missing(condition_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(condition_occurrence_id)) {
      statement <- paste0(statement, ' condition_occurrence_id IS NULL')
    } else if (is(condition_occurrence_id, 'subQuery')){
      statement <- paste0(statement, ' condition_occurrence_id = (', as.character(condition_occurrence_id), ')')
    } else {
      statement <- paste0(statement, " condition_occurrence_id = '", condition_occurrence_id,"'")
    }
  }
  
  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, ' person_id IS NULL')
    } else if (is(person_id, 'subQuery')){
      statement <- paste0(statement, ' person_id = (', as.character(person_id), ')')
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }
  
  if (!missing(condition_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(condition_concept_id)) {
      statement <- paste0(statement, ' condition_concept_id IS NULL')
    } else if (is(condition_concept_id, 'subQuery')){
      statement <- paste0(statement, ' condition_concept_id = (', as.character(condition_concept_id), ')')
    } else {
      statement <- paste0(statement, " condition_concept_id = '", condition_concept_id,"'")
    }
  }
  
  if (!missing(condition_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(condition_start_date)) {
      statement <- paste0(statement, ' condition_start_date IS NULL')
    } else if (is(condition_start_date, 'subQuery')){
      statement <- paste0(statement, ' condition_start_date = (', as.character(condition_start_date), ')')
    } else {
      statement <- paste0(statement, " condition_start_date = '", condition_start_date,"'")
    }
  }
  
  if (!missing(condition_start_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(condition_start_datetime)) {
      statement <- paste0(statement, ' condition_start_datetime IS NULL')
    } else if (is(condition_start_datetime, 'subQuery')){
      statement <- paste0(statement, ' condition_start_datetime = (', as.character(condition_start_datetime), ')')
    } else {
      statement <- paste0(statement, " condition_start_datetime = '", condition_start_datetime,"'")
    }
  }
  
  if (!missing(condition_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(condition_end_date)) {
      statement <- paste0(statement, ' condition_end_date IS NULL')
    } else if (is(condition_end_date, 'subQuery')){
      statement <- paste0(statement, ' condition_end_date = (', as.character(condition_end_date), ')')
    } else {
      statement <- paste0(statement, " condition_end_date = '", condition_end_date,"'")
    }
  }
  
  if (!missing(condition_end_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(condition_end_datetime)) {
      statement <- paste0(statement, ' condition_end_datetime IS NULL')
    } else if (is(condition_end_datetime, 'subQuery')){
      statement <- paste0(statement, ' condition_end_datetime = (', as.character(condition_end_datetime), ')')
    } else {
      statement <- paste0(statement, " condition_end_datetime = '", condition_end_datetime,"'")
    }
  }
  
  if (!missing(condition_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(condition_type_concept_id)) {
      statement <- paste0(statement, ' condition_type_concept_id IS NULL')
    } else if (is(condition_type_concept_id, 'subQuery')){
      statement <- paste0(statement, ' condition_type_concept_id = (', as.character(condition_type_concept_id), ')')
    } else {
      statement <- paste0(statement, " condition_type_concept_id = '", condition_type_concept_id,"'")
    }
  }
  
  if (!missing(stop_reason)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(stop_reason)) {
      statement <- paste0(statement, ' stop_reason IS NULL')
    } else if (is(stop_reason, 'subQuery')){
      statement <- paste0(statement, ' stop_reason = (', as.character(stop_reason), ')')
    } else {
      statement <- paste0(statement, " stop_reason = '", stop_reason,"'")
    }
  }
  
  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, ' provider_id IS NULL')
    } else if (is(provider_id, 'subQuery')){
      statement <- paste0(statement, ' provider_id = (', as.character(provider_id), ')')
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }
  
  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, ' visit_occurrence_id IS NULL')
    } else if (is(visit_occurrence_id, 'subQuery')){
      statement <- paste0(statement, ' visit_occurrence_id = (', as.character(visit_occurrence_id), ')')
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }
  
  if (!missing(condition_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(condition_source_value)) {
      statement <- paste0(statement, ' condition_source_value IS NULL')
    } else if (is(condition_source_value, 'subQuery')){
      statement <- paste0(statement, ' condition_source_value = (', as.character(condition_source_value), ')')
    } else {
      statement <- paste0(statement, " condition_source_value = '", condition_source_value,"'")
    }
  }
  
  if (!missing(condition_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(condition_source_concept_id)) {
      statement <- paste0(statement, ' condition_source_concept_id IS NULL')
    } else if (is(condition_source_concept_id, 'subQuery')){
      statement <- paste0(statement, ' condition_source_concept_id = (', as.character(condition_source_concept_id), ')')
    } else {
      statement <- paste0(statement, " condition_source_concept_id = '", condition_source_concept_id,"'")
    }
  }
  
  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status")
  if (exists('testNewExpected', where = globalenv()) && get('testNewExpected'))
  {
    assign('testNewExpected', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    testSql <<- c(testSql, comment)
  }
  testSql <<- c(testSql, statement)
  invisible(statement)
}

expect_no_location <- function(location_id, address_1, address_2, city, state, zip, county, location_source_value) {
  #statement <- paste0("INSERT INTO @cdmDatabaseSchema.test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect location' AS test, CASE WHEN(SELECT COUNT(*) from @cdmDatabaseSchema.location WHERE")
  statement <- getExpectStatement(domain = "location", table = "location")
  first <- TRUE
  if (!missing(location_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(location_id)) {
      statement <- paste0(statement, ' location_id IS NULL')
    } else if (is(location_id, 'subQuery')){
      statement <- paste0(statement, ' location_id = (', as.character(location_id), ')')
    } else {
      statement <- paste0(statement, " location_id = '", location_id,"'")
    }
  }
  
  if (!missing(address_1)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(address_1)) {
      statement <- paste0(statement, ' address_1 IS NULL')
    } else if (is(address_1, 'subQuery')){
      statement <- paste0(statement, ' address_1 = (', as.character(address_1), ')')
    } else {
      statement <- paste0(statement, " address_1 = '", address_1,"'")
    }
  }
  
  if (!missing(address_2)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(address_2)) {
      statement <- paste0(statement, ' address_2 IS NULL')
    } else if (is(address_2, 'subQuery')){
      statement <- paste0(statement, ' address_2 = (', as.character(address_2), ')')
    } else {
      statement <- paste0(statement, " address_2 = '", address_2,"'")
    }
  }
  
  if (!missing(city)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(city)) {
      statement <- paste0(statement, ' city IS NULL')
    } else if (is(city, 'subQuery')){
      statement <- paste0(statement, ' city = (', as.character(city), ')')
    } else {
      statement <- paste0(statement, " city = '", city,"'")
    }
  }
  
  if (!missing(state)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(state)) {
      statement <- paste0(statement, ' state IS NULL')
    } else if (is(state, 'subQuery')){
      statement <- paste0(statement, ' state = (', as.character(state), ')')
    } else {
      statement <- paste0(statement, " state = '", state,"'")
    }
  }
  
  if (!missing(zip)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(zip)) {
      statement <- paste0(statement, ' zip IS NULL')
    } else if (is(zip, 'subQuery')){
      statement <- paste0(statement, ' zip = (', as.character(zip), ')')
    } else {
      statement <- paste0(statement, " zip = '", zip,"'")
    }
  }
  
  if (!missing(county)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(county)) {
      statement <- paste0(statement, ' county IS NULL')
    } else if (is(county, 'subQuery')){
      statement <- paste0(statement, ' county = (', as.character(county), ')')
    } else {
      statement <- paste0(statement, " county = '", county,"'")
    }
  }
  
  if (!missing(location_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(location_source_value)) {
      statement <- paste0(statement, ' location_source_value IS NULL')
    } else if (is(location_source_value, 'subQuery')){
      statement <- paste0(statement, ' location_source_value = (', as.character(location_source_value), ')')
    } else {
      statement <- paste0(statement, " location_source_value = '", location_source_value,"'")
    }
  }
  
  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status")
  if (exists('testNewExpected', where = globalenv()) && get('testNewExpected'))
  {
    assign('testNewExpected', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    testSql <<- c(testSql, comment)
  }
  testSql <<- c(testSql, statement)
  invisible(statement)
}

expect_no_person <- function(person_id, person_source_value, gender_concept_id, gender_source_value, year_of_birth, month_of_birth, day_of_birth, race_concept_id, ethnicity_concept_id, birth_datetime, location_id, provider_id, care_site_id, gender_source_concept_id, race_source_value, race_source_concept_id, ethnicity_source_value, ethnicity_source_concept_id) {
  #statement <- paste0("INSERT INTO @cdmDatabaseSchema.test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect person' AS test, CASE WHEN(SELECT COUNT(*) from @cdmDatabaseSchema.person WHERE")
  statement <- getExpectStatement(domain = "person", table = "person")
  first <- TRUE
  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, ' person_id IS NULL')
    } else if (is(person_id, 'subQuery')){
      statement <- paste0(statement, ' person_id = (', as.character(person_id), ')')
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }
  
  if (!missing(person_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(person_source_value)) {
      statement <- paste0(statement, ' person_source_value IS NULL')
    } else if (is(person_source_value, 'subQuery')){
      statement <- paste0(statement, ' person_source_value = (', as.character(person_source_value), ')')
    } else {
      statement <- paste0(statement, " person_source_value = '", person_source_value,"'")
    }
  }
  
  if (!missing(gender_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(gender_concept_id)) {
      statement <- paste0(statement, ' gender_concept_id IS NULL')
    } else if (is(gender_concept_id, 'subQuery')){
      statement <- paste0(statement, ' gender_concept_id = (', as.character(gender_concept_id), ')')
    } else {
      statement <- paste0(statement, " gender_concept_id = '", gender_concept_id,"'")
    }
  }
  
  if (!missing(gender_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(gender_source_value)) {
      statement <- paste0(statement, ' gender_source_value IS NULL')
    } else if (is(gender_source_value, 'subQuery')){
      statement <- paste0(statement, ' gender_source_value = (', as.character(gender_source_value), ')')
    } else {
      statement <- paste0(statement, " gender_source_value = '", gender_source_value,"'")
    }
  }
  
  if (!missing(year_of_birth)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(year_of_birth)) {
      statement <- paste0(statement, ' year_of_birth IS NULL')
    } else if (is(year_of_birth, 'subQuery')){
      statement <- paste0(statement, ' year_of_birth = (', as.character(year_of_birth), ')')
    } else {
      statement <- paste0(statement, " year_of_birth = '", year_of_birth,"'")
    }
  }
  
  if (!missing(month_of_birth)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(month_of_birth)) {
      statement <- paste0(statement, ' month_of_birth IS NULL')
    } else if (is(month_of_birth, 'subQuery')){
      statement <- paste0(statement, ' month_of_birth = (', as.character(month_of_birth), ')')
    } else {
      statement <- paste0(statement, " month_of_birth = '", month_of_birth,"'")
    }
  }
  
  if (!missing(day_of_birth)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(day_of_birth)) {
      statement <- paste0(statement, ' day_of_birth IS NULL')
    } else if (is(day_of_birth, 'subQuery')){
      statement <- paste0(statement, ' day_of_birth = (', as.character(day_of_birth), ')')
    } else {
      statement <- paste0(statement, " day_of_birth = '", day_of_birth,"'")
    }
  }
  
  if (!missing(race_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(race_concept_id)) {
      statement <- paste0(statement, ' race_concept_id IS NULL')
    } else if (is(race_concept_id, 'subQuery')){
      statement <- paste0(statement, ' race_concept_id = (', as.character(race_concept_id), ')')
    } else {
      statement <- paste0(statement, " race_concept_id = '", race_concept_id,"'")
    }
  }
  
  if (!missing(ethnicity_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(ethnicity_concept_id)) {
      statement <- paste0(statement, ' ethnicity_concept_id IS NULL')
    } else if (is(ethnicity_concept_id, 'subQuery')){
      statement <- paste0(statement, ' ethnicity_concept_id = (', as.character(ethnicity_concept_id), ')')
    } else {
      statement <- paste0(statement, " ethnicity_concept_id = '", ethnicity_concept_id,"'")
    }
  }
  
  if (!missing(birth_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(birth_datetime)) {
      statement <- paste0(statement, ' birth_datetime IS NULL')
    } else if (is(birth_datetime, 'subQuery')){
      statement <- paste0(statement, ' birth_datetime = (', as.character(birth_datetime), ')')
    } else {
      statement <- paste0(statement, " birth_datetime = '", birth_datetime,"'")
    }
  }
  
  if (!missing(location_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(location_id)) {
      statement <- paste0(statement, ' location_id IS NULL')
    } else if (is(location_id, 'subQuery')){
      statement <- paste0(statement, ' location_id = (', as.character(location_id), ')')
    } else {
      statement <- paste0(statement, " location_id = '", location_id,"'")
    }
  }
  
  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, ' provider_id IS NULL')
    } else if (is(provider_id, 'subQuery')){
      statement <- paste0(statement, ' provider_id = (', as.character(provider_id), ')')
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }
  
  if (!missing(care_site_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(care_site_id)) {
      statement <- paste0(statement, ' care_site_id IS NULL')
    } else if (is(care_site_id, 'subQuery')){
      statement <- paste0(statement, ' care_site_id = (', as.character(care_site_id), ')')
    } else {
      statement <- paste0(statement, " care_site_id = '", care_site_id,"'")
    }
  }
  
  if (!missing(gender_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(gender_source_concept_id)) {
      statement <- paste0(statement, ' gender_source_concept_id IS NULL')
    } else if (is(gender_source_concept_id, 'subQuery')){
      statement <- paste0(statement, ' gender_source_concept_id = (', as.character(gender_source_concept_id), ')')
    } else {
      statement <- paste0(statement, " gender_source_concept_id = '", gender_source_concept_id,"'")
    }
  }
  
  if (!missing(race_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(race_source_value)) {
      statement <- paste0(statement, ' race_source_value IS NULL')
    } else if (is(race_source_value, 'subQuery')){
      statement <- paste0(statement, ' race_source_value = (', as.character(race_source_value), ')')
    } else {
      statement <- paste0(statement, " race_source_value = '", race_source_value,"'")
    }
  }
  
  if (!missing(race_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(race_source_concept_id)) {
      statement <- paste0(statement, ' race_source_concept_id IS NULL')
    } else if (is(race_source_concept_id, 'subQuery')){
      statement <- paste0(statement, ' race_source_concept_id = (', as.character(race_source_concept_id), ')')
    } else {
      statement <- paste0(statement, " race_source_concept_id = '", race_source_concept_id,"'")
    }
  }
  
  if (!missing(ethnicity_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(ethnicity_source_value)) {
      statement <- paste0(statement, ' ethnicity_source_value IS NULL')
    } else if (is(ethnicity_source_value, 'subQuery')){
      statement <- paste0(statement, ' ethnicity_source_value = (', as.character(ethnicity_source_value), ')')
    } else {
      statement <- paste0(statement, " ethnicity_source_value = '", ethnicity_source_value,"'")
    }
  }
  
  if (!missing(ethnicity_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(ethnicity_source_concept_id)) {
      statement <- paste0(statement, ' ethnicity_source_concept_id IS NULL')
    } else if (is(ethnicity_source_concept_id, 'subQuery')){
      statement <- paste0(statement, ' ethnicity_source_concept_id = (', as.character(ethnicity_source_concept_id), ')')
    } else {
      statement <- paste0(statement, " ethnicity_source_concept_id = '", ethnicity_source_concept_id,"'")
    }
  }
  
  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status")
  if (exists('testNewExpected', where = globalenv()) && get('testNewExpected'))
  {
    assign('testNewExpected', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    testSql <<- c(testSql, comment)
  }
  testSql <<- c(testSql, statement)
  invisible(statement)
}

expect_no_payer_plan_period <- function(payer_plan_period_id, person_id, payer_plan_period_start_date, payer_plan_period_end_date, payer_source_value, plan_source_value, family_source_value) {
  #statement <- paste0("INSERT INTO @cdmDatabaseSchema.test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect payer_plan_period' AS test, CASE WHEN(SELECT COUNT(*) from @cdmDatabaseSchema.payer_plan_period WHERE")
  statement <- getExpectStatement(domain = "payer_plan_period", table = "payer_plan_period")
  first <- TRUE
  if (!missing(payer_plan_period_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(payer_plan_period_id)) {
      statement <- paste0(statement, ' payer_plan_period_id IS NULL')
    } else if (is(payer_plan_period_id, 'subQuery')){
      statement <- paste0(statement, ' payer_plan_period_id = (', as.character(payer_plan_period_id), ')')
    } else {
      statement <- paste0(statement, " payer_plan_period_id = '", payer_plan_period_id,"'")
    }
  }
  
  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, ' person_id IS NULL')
    } else if (is(person_id, 'subQuery')){
      statement <- paste0(statement, ' person_id = (', as.character(person_id), ')')
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }
  
  if (!missing(payer_plan_period_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(payer_plan_period_start_date)) {
      statement <- paste0(statement, ' payer_plan_period_start_date IS NULL')
    } else if (is(payer_plan_period_start_date, 'subQuery')){
      statement <- paste0(statement, ' payer_plan_period_start_date = (', as.character(payer_plan_period_start_date), ')')
    } else {
      statement <- paste0(statement, " payer_plan_period_start_date = '", payer_plan_period_start_date,"'")
    }
  }
  
  if (!missing(payer_plan_period_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(payer_plan_period_end_date)) {
      statement <- paste0(statement, ' payer_plan_period_end_date IS NULL')
    } else if (is(payer_plan_period_end_date, 'subQuery')){
      statement <- paste0(statement, ' payer_plan_period_end_date = (', as.character(payer_plan_period_end_date), ')')
    } else {
      statement <- paste0(statement, " payer_plan_period_end_date = '", payer_plan_period_end_date,"'")
    }
  }
  
  if (!missing(payer_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(payer_source_value)) {
      statement <- paste0(statement, ' payer_source_value IS NULL')
    } else if (is(payer_source_value, 'subQuery')){
      statement <- paste0(statement, ' payer_source_value = (', as.character(payer_source_value), ')')
    } else {
      statement <- paste0(statement, " payer_source_value = '", payer_source_value,"'")
    }
  }
  
  if (!missing(plan_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(plan_source_value)) {
      statement <- paste0(statement, ' plan_source_value IS NULL')
    } else if (is(plan_source_value, 'subQuery')){
      statement <- paste0(statement, ' plan_source_value = (', as.character(plan_source_value), ')')
    } else {
      statement <- paste0(statement, " plan_source_value = '", plan_source_value,"'")
    }
  }
  
  if (!missing(family_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(family_source_value)) {
      statement <- paste0(statement, ' family_source_value IS NULL')
    } else if (is(family_source_value, 'subQuery')){
      statement <- paste0(statement, ' family_source_value = (', as.character(family_source_value), ')')
    } else {
      statement <- paste0(statement, " family_source_value = '", family_source_value,"'")
    }
  }
  
  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status")
  if (exists('testNewExpected', where = globalenv()) && get('testNewExpected'))
  {
    assign('testNewExpected', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    testSql <<- c(testSql, comment)
  }
  testSql <<- c(testSql, statement)
  invisible(statement)
}

expect_no_cost <- function(cost_id, cost_event_id, cost_domain_id, cost_type_concept_id, currency_concept_id, total_charge, total_cost, total_paid, paid_by_payer, paid_by_patient, paid_patient_copay, paid_patient_coinsurance, paid_patient_deductible, paid_by_primary, paid_ingredient_cost, paid_dispensing_fee, payer_plan_period_id, amount_allowed, revenue_code_concept_id, revenue_code_source_value) {
  #statement <- paste0("INSERT INTO @cdmDatabaseSchema.test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect cost' AS test, CASE WHEN(SELECT COUNT(*) from @cdmDatabaseSchema.cost WHERE")
  statement <- getExpectStatement(domain = "cost", table = "cost")
  first <- TRUE
  if (!missing(cost_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cost_id)) {
      statement <- paste0(statement, ' cost_id IS NULL')
    } else if (is(cost_id, 'subQuery')){
      statement <- paste0(statement, ' cost_id = (', as.character(cost_id), ')')
    } else {
      statement <- paste0(statement, " cost_id = '", cost_id,"'")
    }
  }
  
  if (!missing(cost_event_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cost_event_id)) {
      statement <- paste0(statement, ' cost_event_id IS NULL')
    } else if (is(cost_event_id, 'subQuery')){
      statement <- paste0(statement, ' cost_event_id = (', as.character(cost_event_id), ')')
    } else {
      statement <- paste0(statement, " cost_event_id = '", cost_event_id,"'")
    }
  }
  
  if (!missing(cost_domain_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cost_domain_id)) {
      statement <- paste0(statement, ' cost_domain_id IS NULL')
    } else if (is(cost_domain_id, 'subQuery')){
      statement <- paste0(statement, ' cost_domain_id = (', as.character(cost_domain_id), ')')
    } else {
      statement <- paste0(statement, " cost_domain_id = '", cost_domain_id,"'")
    }
  }
  
  if (!missing(cost_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cost_type_concept_id)) {
      statement <- paste0(statement, ' cost_type_concept_id IS NULL')
    } else if (is(cost_type_concept_id, 'subQuery')){
      statement <- paste0(statement, ' cost_type_concept_id = (', as.character(cost_type_concept_id), ')')
    } else {
      statement <- paste0(statement, " cost_type_concept_id = '", cost_type_concept_id,"'")
    }
  }
  
  if (!missing(currency_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(currency_concept_id)) {
      statement <- paste0(statement, ' currency_concept_id IS NULL')
    } else if (is(currency_concept_id, 'subQuery')){
      statement <- paste0(statement, ' currency_concept_id = (', as.character(currency_concept_id), ')')
    } else {
      statement <- paste0(statement, " currency_concept_id = '", currency_concept_id,"'")
    }
  }
  
  if (!missing(total_charge)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(total_charge)) {
      statement <- paste0(statement, ' total_charge IS NULL')
    } else if (is(total_charge, 'subQuery')){
      statement <- paste0(statement, ' total_charge = (', as.character(total_charge), ')')
    } else {
      statement <- paste0(statement, " total_charge = '", total_charge,"'")
    }
  }
  
  if (!missing(total_cost)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(total_cost)) {
      statement <- paste0(statement, ' total_cost IS NULL')
    } else if (is(total_cost, 'subQuery')){
      statement <- paste0(statement, ' total_cost = (', as.character(total_cost), ')')
    } else {
      statement <- paste0(statement, " total_cost = '", total_cost,"'")
    }
  }
  
  if (!missing(total_paid)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(total_paid)) {
      statement <- paste0(statement, ' total_paid IS NULL')
    } else if (is(total_paid, 'subQuery')){
      statement <- paste0(statement, ' total_paid = (', as.character(total_paid), ')')
    } else {
      statement <- paste0(statement, " total_paid = '", total_paid,"'")
    }
  }
  
  if (!missing(paid_by_payer)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(paid_by_payer)) {
      statement <- paste0(statement, ' paid_by_payer IS NULL')
    } else if (is(paid_by_payer, 'subQuery')){
      statement <- paste0(statement, ' paid_by_payer = (', as.character(paid_by_payer), ')')
    } else {
      statement <- paste0(statement, " paid_by_payer = '", paid_by_payer,"'")
    }
  }
  
  if (!missing(paid_by_patient)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(paid_by_patient)) {
      statement <- paste0(statement, ' paid_by_patient IS NULL')
    } else if (is(paid_by_patient, 'subQuery')){
      statement <- paste0(statement, ' paid_by_patient = (', as.character(paid_by_patient), ')')
    } else {
      statement <- paste0(statement, " paid_by_patient = '", paid_by_patient,"'")
    }
  }
  
  if (!missing(paid_patient_copay)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(paid_patient_copay)) {
      statement <- paste0(statement, ' paid_patient_copay IS NULL')
    } else if (is(paid_patient_copay, 'subQuery')){
      statement <- paste0(statement, ' paid_patient_copay = (', as.character(paid_patient_copay), ')')
    } else {
      statement <- paste0(statement, " paid_patient_copay = '", paid_patient_copay,"'")
    }
  }
  
  if (!missing(paid_patient_coinsurance)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(paid_patient_coinsurance)) {
      statement <- paste0(statement, ' paid_patient_coinsurance IS NULL')
    } else if (is(paid_patient_coinsurance, 'subQuery')){
      statement <- paste0(statement, ' paid_patient_coinsurance = (', as.character(paid_patient_coinsurance), ')')
    } else {
      statement <- paste0(statement, " paid_patient_coinsurance = '", paid_patient_coinsurance,"'")
    }
  }
  
  if (!missing(paid_patient_deductible)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(paid_patient_deductible)) {
      statement <- paste0(statement, ' paid_patient_deductible IS NULL')
    } else if (is(paid_patient_deductible, 'subQuery')){
      statement <- paste0(statement, ' paid_patient_deductible = (', as.character(paid_patient_deductible), ')')
    } else {
      statement <- paste0(statement, " paid_patient_deductible = '", paid_patient_deductible,"'")
    }
  }
  
  if (!missing(paid_by_primary)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(paid_by_primary)) {
      statement <- paste0(statement, ' paid_by_primary IS NULL')
    } else if (is(paid_by_primary, 'subQuery')){
      statement <- paste0(statement, ' paid_by_primary = (', as.character(paid_by_primary), ')')
    } else {
      statement <- paste0(statement, " paid_by_primary = '", paid_by_primary,"'")
    }
  }
  
  if (!missing(paid_ingredient_cost)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(paid_ingredient_cost)) {
      statement <- paste0(statement, ' paid_ingredient_cost IS NULL')
    } else if (is(paid_ingredient_cost, 'subQuery')){
      statement <- paste0(statement, ' paid_ingredient_cost = (', as.character(paid_ingredient_cost), ')')
    } else {
      statement <- paste0(statement, " paid_ingredient_cost = '", paid_ingredient_cost,"'")
    }
  }
  
  if (!missing(paid_dispensing_fee)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(paid_dispensing_fee)) {
      statement <- paste0(statement, ' paid_dispensing_fee IS NULL')
    } else if (is(paid_dispensing_fee, 'subQuery')){
      statement <- paste0(statement, ' paid_dispensing_fee = (', as.character(paid_dispensing_fee), ')')
    } else {
      statement <- paste0(statement, " paid_dispensing_fee = '", paid_dispensing_fee,"'")
    }
  }
  
  if (!missing(payer_plan_period_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(payer_plan_period_id)) {
      statement <- paste0(statement, ' payer_plan_period_id IS NULL')
    } else if (is(payer_plan_period_id, 'subQuery')){
      statement <- paste0(statement, ' payer_plan_period_id = (', as.character(payer_plan_period_id), ')')
    } else {
      statement <- paste0(statement, " payer_plan_period_id = '", payer_plan_period_id,"'")
    }
  }
  
  if (!missing(amount_allowed)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(amount_allowed)) {
      statement <- paste0(statement, ' amount_allowed IS NULL')
    } else if (is(amount_allowed, 'subQuery')){
      statement <- paste0(statement, ' amount_allowed = (', as.character(amount_allowed), ')')
    } else {
      statement <- paste0(statement, " amount_allowed = '", amount_allowed,"'")
    }
  }
  
  if (!missing(revenue_code_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(revenue_code_concept_id)) {
      statement <- paste0(statement, ' revenue_code_concept_id IS NULL')
    } else if (is(revenue_code_concept_id, 'subQuery')){
      statement <- paste0(statement, ' revenue_code_concept_id = (', as.character(revenue_code_concept_id), ')')
    } else {
      statement <- paste0(statement, " revenue_code_concept_id = '", revenue_code_concept_id,"'")
    }
  }
  
  if (!missing(revenue_code_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(revenue_code_source_value)) {
      statement <- paste0(statement, ' revenue_code_source_value IS NULL')
    } else if (is(revenue_code_source_value, 'subQuery')){
      statement <- paste0(statement, ' revenue_code_source_value = (', as.character(revenue_code_source_value), ')')
    } else {
      statement <- paste0(statement, " revenue_code_source_value = '", revenue_code_source_value,"'")
    }
  }
  
  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status")
  if (exists('testNewExpected', where = globalenv()) && get('testNewExpected'))
  {
    assign('testNewExpected', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    testSql <<- c(testSql, comment)
  }
  testSql <<- c(testSql, statement)
  invisible(statement)
}

expect_no_observation_period <- function(observation_period_id, person_id, observation_period_start_date, observation_period_start_datetime, observation_period_end_date, observation_period_end_datetime, period_type_concept_id) {
  #statement <- paste0("INSERT INTO @cdmDatabaseSchema.test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect observation_period' AS test, CASE WHEN(SELECT COUNT(*) from @cdmDatabaseSchema.observation_period WHERE")
  statement <- getExpectStatement(domain = "observation_period", table = "observation_period")
  first <- TRUE
  if (!missing(observation_period_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(observation_period_id)) {
      statement <- paste0(statement, ' observation_period_id IS NULL')
    } else if (is(observation_period_id, 'subQuery')){
      statement <- paste0(statement, ' observation_period_id = (', as.character(observation_period_id), ')')
    } else {
      statement <- paste0(statement, " observation_period_id = '", observation_period_id,"'")
    }
  }
  
  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, ' person_id IS NULL')
    } else if (is(person_id, 'subQuery')){
      statement <- paste0(statement, ' person_id = (', as.character(person_id), ')')
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }
  
  if (!missing(observation_period_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(observation_period_start_date)) {
      statement <- paste0(statement, ' observation_period_start_date IS NULL')
    } else if (is(observation_period_start_date, 'subQuery')){
      statement <- paste0(statement, ' observation_period_start_date = (', as.character(observation_period_start_date), ')')
    } else {
      statement <- paste0(statement, " observation_period_start_date = '", observation_period_start_date,"'")
    }
  }
  
  if (!missing(observation_period_start_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(observation_period_start_datetime)) {
      statement <- paste0(statement, ' observation_period_start_datetime IS NULL')
    } else if (is(observation_period_start_datetime, 'subQuery')){
      statement <- paste0(statement, ' observation_period_start_datetime = (', as.character(observation_period_start_datetime), ')')
    } else {
      statement <- paste0(statement, " observation_period_start_datetime = '", observation_period_start_datetime,"'")
    }
  }
  
  if (!missing(observation_period_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(observation_period_end_date)) {
      statement <- paste0(statement, ' observation_period_end_date IS NULL')
    } else if (is(observation_period_end_date, 'subQuery')){
      statement <- paste0(statement, ' observation_period_end_date = (', as.character(observation_period_end_date), ')')
    } else {
      statement <- paste0(statement, " observation_period_end_date = '", observation_period_end_date,"'")
    }
  }
  
  if (!missing(observation_period_end_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(observation_period_end_datetime)) {
      statement <- paste0(statement, ' observation_period_end_datetime IS NULL')
    } else if (is(observation_period_end_datetime, 'subQuery')){
      statement <- paste0(statement, ' observation_period_end_datetime = (', as.character(observation_period_end_datetime), ')')
    } else {
      statement <- paste0(statement, " observation_period_end_datetime = '", observation_period_end_datetime,"'")
    }
  }
  
  if (!missing(period_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(period_type_concept_id)) {
      statement <- paste0(statement, ' period_type_concept_id IS NULL')
    } else if (is(period_type_concept_id, 'subQuery')){
      statement <- paste0(statement, ' period_type_concept_id = (', as.character(period_type_concept_id), ')')
    } else {
      statement <- paste0(statement, " period_type_concept_id = '", period_type_concept_id,"'")
    }
  }
  
  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status")
  if (exists('testNewExpected', where = globalenv()) && get('testNewExpected'))
  {
    assign('testNewExpected', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    testSql <<- c(testSql, comment)
  }
  testSql <<- c(testSql, statement)
  invisible(statement)
}

expect_no_care_site <- function(care_site_id, care_site_name, place_of_service_concept_id, location_id, care_site_source_value, place_of_service_source_value) {
  #statement <- paste0("INSERT INTO @cdmDatabaseSchema.test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect care_site' AS test, CASE WHEN(SELECT COUNT(*) from @cdmDatabaseSchema.care_site WHERE")
  statement <- getExpectStatement(domain = "care_site", table = "care_site")
  first <- TRUE
  if (!missing(care_site_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(care_site_id)) {
      statement <- paste0(statement, ' care_site_id IS NULL')
    } else if (is(care_site_id, 'subQuery')){
      statement <- paste0(statement, ' care_site_id = (', as.character(care_site_id), ')')
    } else {
      statement <- paste0(statement, " care_site_id = '", care_site_id,"'")
    }
  }
  
  if (!missing(care_site_name)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(care_site_name)) {
      statement <- paste0(statement, ' care_site_name IS NULL')
    } else if (is(care_site_name, 'subQuery')){
      statement <- paste0(statement, ' care_site_name = (', as.character(care_site_name), ')')
    } else {
      statement <- paste0(statement, " care_site_name = '", care_site_name,"'")
    }
  }
  
  if (!missing(place_of_service_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(place_of_service_concept_id)) {
      statement <- paste0(statement, ' place_of_service_concept_id IS NULL')
    } else if (is(place_of_service_concept_id, 'subQuery')){
      statement <- paste0(statement, ' place_of_service_concept_id = (', as.character(place_of_service_concept_id), ')')
    } else {
      statement <- paste0(statement, " place_of_service_concept_id = '", place_of_service_concept_id,"'")
    }
  }
  
  if (!missing(location_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(location_id)) {
      statement <- paste0(statement, ' location_id IS NULL')
    } else if (is(location_id, 'subQuery')){
      statement <- paste0(statement, ' location_id = (', as.character(location_id), ')')
    } else {
      statement <- paste0(statement, " location_id = '", location_id,"'")
    }
  }
  
  if (!missing(care_site_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(care_site_source_value)) {
      statement <- paste0(statement, ' care_site_source_value IS NULL')
    } else if (is(care_site_source_value, 'subQuery')){
      statement <- paste0(statement, ' care_site_source_value = (', as.character(care_site_source_value), ')')
    } else {
      statement <- paste0(statement, " care_site_source_value = '", care_site_source_value,"'")
    }
  }
  
  if (!missing(place_of_service_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(place_of_service_source_value)) {
      statement <- paste0(statement, ' place_of_service_source_value IS NULL')
    } else if (is(place_of_service_source_value, 'subQuery')){
      statement <- paste0(statement, ' place_of_service_source_value = (', as.character(place_of_service_source_value), ')')
    } else {
      statement <- paste0(statement, " place_of_service_source_value = '", place_of_service_source_value,"'")
    }
  }
  
  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status")
  if (exists('testNewExpected', where = globalenv()) && get('testNewExpected'))
  {
    assign('testNewExpected', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    testSql <<- c(testSql, comment)
  }
  testSql <<- c(testSql, statement)
  invisible(statement)
}

expect_no_visit_occurrence <- function(visit_occurrence_id, person_id, visit_concept_id, visit_start_date, visit_start_datetime, visit_end_date, visit_end_datetime, visit_type_concept_id, provider_id, care_site_id, visit_source_value, visit_source_concept_id) {
  #statement <- paste0("INSERT INTO @cdmDatabaseSchema.test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect visit_occurrence' AS test, CASE WHEN(SELECT COUNT(*) from @cdmDatabaseSchema.visit_occurrence WHERE")
  statement <- getExpectStatement(domain = "visit_occurrence", table = "visit_occurrence")
  first <- TRUE
  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, ' visit_occurrence_id IS NULL')
    } else if (is(visit_occurrence_id, 'subQuery')){
      statement <- paste0(statement, ' visit_occurrence_id = (', as.character(visit_occurrence_id), ')')
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }
  
  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, ' person_id IS NULL')
    } else if (is(person_id, 'subQuery')){
      statement <- paste0(statement, ' person_id = (', as.character(person_id), ')')
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }
  
  if (!missing(visit_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(visit_concept_id)) {
      statement <- paste0(statement, ' visit_concept_id IS NULL')
    } else if (is(visit_concept_id, 'subQuery')){
      statement <- paste0(statement, ' visit_concept_id = (', as.character(visit_concept_id), ')')
    } else {
      statement <- paste0(statement, " visit_concept_id = '", visit_concept_id,"'")
    }
  }
  
  if (!missing(visit_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(visit_start_date)) {
      statement <- paste0(statement, ' visit_start_date IS NULL')
    } else if (is(visit_start_date, 'subQuery')){
      statement <- paste0(statement, ' visit_start_date = (', as.character(visit_start_date), ')')
    } else {
      statement <- paste0(statement, " visit_start_date = '", visit_start_date,"'")
    }
  }
  
  if (!missing(visit_start_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(visit_start_datetime)) {
      statement <- paste0(statement, ' visit_start_datetime IS NULL')
    } else if (is(visit_start_datetime, 'subQuery')){
      statement <- paste0(statement, ' visit_start_datetime = (', as.character(visit_start_datetime), ')')
    } else {
      statement <- paste0(statement, " visit_start_datetime = '", visit_start_datetime,"'")
    }
  }
  
  if (!missing(visit_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(visit_end_date)) {
      statement <- paste0(statement, ' visit_end_date IS NULL')
    } else if (is(visit_end_date, 'subQuery')){
      statement <- paste0(statement, ' visit_end_date = (', as.character(visit_end_date), ')')
    } else {
      statement <- paste0(statement, " visit_end_date = '", visit_end_date,"'")
    }
  }
  
  if (!missing(visit_end_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(visit_end_datetime)) {
      statement <- paste0(statement, ' visit_end_datetime IS NULL')
    } else if (is(visit_end_datetime, 'subQuery')){
      statement <- paste0(statement, ' visit_end_datetime = (', as.character(visit_end_datetime), ')')
    } else {
      statement <- paste0(statement, " visit_end_datetime = '", visit_end_datetime,"'")
    }
  }
  
  if (!missing(visit_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(visit_type_concept_id)) {
      statement <- paste0(statement, ' visit_type_concept_id IS NULL')
    } else if (is(visit_type_concept_id, 'subQuery')){
      statement <- paste0(statement, ' visit_type_concept_id = (', as.character(visit_type_concept_id), ')')
    } else {
      statement <- paste0(statement, " visit_type_concept_id = '", visit_type_concept_id,"'")
    }
  }
  
  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, ' provider_id IS NULL')
    } else if (is(provider_id, 'subQuery')){
      statement <- paste0(statement, ' provider_id = (', as.character(provider_id), ')')
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }
  
  if (!missing(care_site_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(care_site_id)) {
      statement <- paste0(statement, ' care_site_id IS NULL')
    } else if (is(care_site_id, 'subQuery')){
      statement <- paste0(statement, ' care_site_id = (', as.character(care_site_id), ')')
    } else {
      statement <- paste0(statement, " care_site_id = '", care_site_id,"'")
    }
  }
  
  if (!missing(visit_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(visit_source_value)) {
      statement <- paste0(statement, ' visit_source_value IS NULL')
    } else if (is(visit_source_value, 'subQuery')){
      statement <- paste0(statement, ' visit_source_value = (', as.character(visit_source_value), ')')
    } else {
      statement <- paste0(statement, " visit_source_value = '", visit_source_value,"'")
    }
  }
  
  if (!missing(visit_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(visit_source_concept_id)) {
      statement <- paste0(statement, ' visit_source_concept_id IS NULL')
    } else if (is(visit_source_concept_id, 'subQuery')){
      statement <- paste0(statement, ' visit_source_concept_id = (', as.character(visit_source_concept_id), ')')
    } else {
      statement <- paste0(statement, " visit_source_concept_id = '", visit_source_concept_id,"'")
    }
  }
  
  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status")
  if (exists('testNewExpected', where = globalenv()) && get('testNewExpected'))
  {
    assign('testNewExpected', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    testSql <<- c(testSql, comment)
  }
  testSql <<- c(testSql, statement)
  invisible(statement)
}

expect_no_provider <- function(provider_id, npi, dea, specialty_concept_id, provider_name, care_site_id, year_of_birth, gender_concept_id, provider_source_value, specialty_source_value, specialty_source_concept_id, gender_source_value, gender_source_concept_id) {
  #statement <- paste0("INSERT INTO @cdmDatabaseSchema.test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect provider' AS test, CASE WHEN(SELECT COUNT(*) from @cdmDatabaseSchema.provider WHERE")
  statement <- getExpectStatement(domain = "provider", table = "provider")
  first <- TRUE
  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, ' provider_id IS NULL')
    } else if (is(provider_id, 'subQuery')){
      statement <- paste0(statement, ' provider_id = (', as.character(provider_id), ')')
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }
  
  if (!missing(npi)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(npi)) {
      statement <- paste0(statement, ' npi IS NULL')
    } else if (is(npi, 'subQuery')){
      statement <- paste0(statement, ' npi = (', as.character(npi), ')')
    } else {
      statement <- paste0(statement, " npi = '", npi,"'")
    }
  }
  
  if (!missing(dea)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(dea)) {
      statement <- paste0(statement, ' dea IS NULL')
    } else if (is(dea, 'subQuery')){
      statement <- paste0(statement, ' dea = (', as.character(dea), ')')
    } else {
      statement <- paste0(statement, " dea = '", dea,"'")
    }
  }
  
  if (!missing(specialty_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(specialty_concept_id)) {
      statement <- paste0(statement, ' specialty_concept_id IS NULL')
    } else if (is(specialty_concept_id, 'subQuery')){
      statement <- paste0(statement, ' specialty_concept_id = (', as.character(specialty_concept_id), ')')
    } else {
      statement <- paste0(statement, " specialty_concept_id = '", specialty_concept_id,"'")
    }
  }
  
  if (!missing(provider_name)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(provider_name)) {
      statement <- paste0(statement, ' provider_name IS NULL')
    } else if (is(provider_name, 'subQuery')){
      statement <- paste0(statement, ' provider_name = (', as.character(provider_name), ')')
    } else {
      statement <- paste0(statement, " provider_name = '", provider_name,"'")
    }
  }
  
  if (!missing(care_site_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(care_site_id)) {
      statement <- paste0(statement, ' care_site_id IS NULL')
    } else if (is(care_site_id, 'subQuery')){
      statement <- paste0(statement, ' care_site_id = (', as.character(care_site_id), ')')
    } else {
      statement <- paste0(statement, " care_site_id = '", care_site_id,"'")
    }
  }
  
  if (!missing(year_of_birth)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(year_of_birth)) {
      statement <- paste0(statement, ' year_of_birth IS NULL')
    } else if (is(year_of_birth, 'subQuery')){
      statement <- paste0(statement, ' year_of_birth = (', as.character(year_of_birth), ')')
    } else {
      statement <- paste0(statement, " year_of_birth = '", year_of_birth,"'")
    }
  }
  
  if (!missing(gender_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(gender_concept_id)) {
      statement <- paste0(statement, ' gender_concept_id IS NULL')
    } else if (is(gender_concept_id, 'subQuery')){
      statement <- paste0(statement, ' gender_concept_id = (', as.character(gender_concept_id), ')')
    } else {
      statement <- paste0(statement, " gender_concept_id = '", gender_concept_id,"'")
    }
  }
  
  if (!missing(provider_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(provider_source_value)) {
      statement <- paste0(statement, ' provider_source_value IS NULL')
    } else if (is(provider_source_value, 'subQuery')){
      statement <- paste0(statement, ' provider_source_value = (', as.character(provider_source_value), ')')
    } else {
      statement <- paste0(statement, " provider_source_value = '", provider_source_value,"'")
    }
  }
  
  if (!missing(specialty_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(specialty_source_value)) {
      statement <- paste0(statement, ' specialty_source_value IS NULL')
    } else if (is(specialty_source_value, 'subQuery')){
      statement <- paste0(statement, ' specialty_source_value = (', as.character(specialty_source_value), ')')
    } else {
      statement <- paste0(statement, " specialty_source_value = '", specialty_source_value,"'")
    }
  }
  
  if (!missing(specialty_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(specialty_source_concept_id)) {
      statement <- paste0(statement, ' specialty_source_concept_id IS NULL')
    } else if (is(specialty_source_concept_id, 'subQuery')){
      statement <- paste0(statement, ' specialty_source_concept_id = (', as.character(specialty_source_concept_id), ')')
    } else {
      statement <- paste0(statement, " specialty_source_concept_id = '", specialty_source_concept_id,"'")
    }
  }
  
  if (!missing(gender_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(gender_source_value)) {
      statement <- paste0(statement, ' gender_source_value IS NULL')
    } else if (is(gender_source_value, 'subQuery')){
      statement <- paste0(statement, ' gender_source_value = (', as.character(gender_source_value), ')')
    } else {
      statement <- paste0(statement, " gender_source_value = '", gender_source_value,"'")
    }
  }
  
  if (!missing(gender_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(gender_source_concept_id)) {
      statement <- paste0(statement, ' gender_source_concept_id IS NULL')
    } else if (is(gender_source_concept_id, 'subQuery')){
      statement <- paste0(statement, ' gender_source_concept_id = (', as.character(gender_source_concept_id), ')')
    } else {
      statement <- paste0(statement, " gender_source_concept_id = '", gender_source_concept_id,"'")
    }
  }
  
  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status")
  if (exists('testNewExpected', where = globalenv()) && get('testNewExpected'))
  {
    assign('testNewExpected', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    testSql <<- c(testSql, comment)
  }
  testSql <<- c(testSql, statement)
  invisible(statement)
}

expect_no_death <- function(person_id, death_date, death_datetime, death_type_concept_id, cause_concept_id, cause_source_value, cause_source_concept_id) {
  #statement <- paste0("INSERT INTO @cdmDatabaseSchema.test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect death' AS test, CASE WHEN(SELECT COUNT(*) from @cdmDatabaseSchema.death WHERE")
  statement <- getExpectStatement(domain = "death", table = "death")
  first <- TRUE
  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, ' person_id IS NULL')
    } else if (is(person_id, 'subQuery')){
      statement <- paste0(statement, ' person_id = (', as.character(person_id), ')')
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }
  
  if (!missing(death_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(death_date)) {
      statement <- paste0(statement, ' death_date IS NULL')
    } else if (is(death_date, 'subQuery')){
      statement <- paste0(statement, ' death_date = (', as.character(death_date), ')')
    } else {
      statement <- paste0(statement, " death_date = '", death_date,"'")
    }
  }
  
  if (!missing(death_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(death_datetime)) {
      statement <- paste0(statement, ' death_datetime IS NULL')
    } else if (is(death_datetime, 'subQuery')){
      statement <- paste0(statement, ' death_datetime = (', as.character(death_datetime), ')')
    } else {
      statement <- paste0(statement, " death_datetime = '", death_datetime,"'")
    }
  }
  
  if (!missing(death_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(death_type_concept_id)) {
      statement <- paste0(statement, ' death_type_concept_id IS NULL')
    } else if (is(death_type_concept_id, 'subQuery')){
      statement <- paste0(statement, ' death_type_concept_id = (', as.character(death_type_concept_id), ')')
    } else {
      statement <- paste0(statement, " death_type_concept_id = '", death_type_concept_id,"'")
    }
  }
  
  if (!missing(cause_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cause_concept_id)) {
      statement <- paste0(statement, ' cause_concept_id IS NULL')
    } else if (is(cause_concept_id, 'subQuery')){
      statement <- paste0(statement, ' cause_concept_id = (', as.character(cause_concept_id), ')')
    } else {
      statement <- paste0(statement, " cause_concept_id = '", cause_concept_id,"'")
    }
  }
  
  if (!missing(cause_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cause_source_value)) {
      statement <- paste0(statement, ' cause_source_value IS NULL')
    } else if (is(cause_source_value, 'subQuery')){
      statement <- paste0(statement, ' cause_source_value = (', as.character(cause_source_value), ')')
    } else {
      statement <- paste0(statement, " cause_source_value = '", cause_source_value,"'")
    }
  }
  
  if (!missing(cause_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cause_source_concept_id)) {
      statement <- paste0(statement, ' cause_source_concept_id IS NULL')
    } else if (is(cause_source_concept_id, 'subQuery')){
      statement <- paste0(statement, ' cause_source_concept_id = (', as.character(cause_source_concept_id), ')')
    } else {
      statement <- paste0(statement, " cause_source_concept_id = '", cause_source_concept_id,"'")
    }
  }
  
  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status")
  if (exists('testNewExpected', where = globalenv()) && get('testNewExpected'))
  {
    assign('testNewExpected', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    testSql <<- c(testSql, comment)
  }
  testSql <<- c(testSql, statement)
  invisible(statement)
}

expect_no_drug_exposure <- function(drug_exposure_id, person_id, drug_concept_id, drug_exposure_start_date, drug_exposure_start_datetime, drug_exposure_end_date, drug_exposure_end_datetime, drug_type_concept_id, stop_reason, refills, quantity, days_supply, sig, route_concept_id, effective_drug_dose, dose_unit_concept_id, lot_number, provider_id, visit_occurrence_id, drug_source_value, drug_source_concept_id, route_source_value, dose_unit_source_value) {
  #statement <- paste0("INSERT INTO @cdmDatabaseSchema.test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect drug_exposure' AS test, CASE WHEN(SELECT COUNT(*) from @cdmDatabaseSchema.drug_exposure WHERE")
  statement <- getExpectStatement(domain = "drug_exposure", table = "drug_exposure")
  first <- TRUE
  if (!missing(drug_exposure_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(drug_exposure_id)) {
      statement <- paste0(statement, ' drug_exposure_id IS NULL')
    } else if (is(drug_exposure_id, 'subQuery')){
      statement <- paste0(statement, ' drug_exposure_id = (', as.character(drug_exposure_id), ')')
    } else {
      statement <- paste0(statement, " drug_exposure_id = '", drug_exposure_id,"'")
    }
  }
  
  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, ' person_id IS NULL')
    } else if (is(person_id, 'subQuery')){
      statement <- paste0(statement, ' person_id = (', as.character(person_id), ')')
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }
  
  if (!missing(drug_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(drug_concept_id)) {
      statement <- paste0(statement, ' drug_concept_id IS NULL')
    } else if (is(drug_concept_id, 'subQuery')){
      statement <- paste0(statement, ' drug_concept_id = (', as.character(drug_concept_id), ')')
    } else {
      statement <- paste0(statement, " drug_concept_id = '", drug_concept_id,"'")
    }
  }
  
  if (!missing(drug_exposure_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(drug_exposure_start_date)) {
      statement <- paste0(statement, ' drug_exposure_start_date IS NULL')
    } else if (is(drug_exposure_start_date, 'subQuery')){
      statement <- paste0(statement, ' drug_exposure_start_date = (', as.character(drug_exposure_start_date), ')')
    } else {
      statement <- paste0(statement, " drug_exposure_start_date = '", drug_exposure_start_date,"'")
    }
  }
  
  if (!missing(drug_exposure_start_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(drug_exposure_start_datetime)) {
      statement <- paste0(statement, ' drug_exposure_start_datetime IS NULL')
    } else if (is(drug_exposure_start_datetime, 'subQuery')){
      statement <- paste0(statement, ' drug_exposure_start_datetime = (', as.character(drug_exposure_start_datetime), ')')
    } else {
      statement <- paste0(statement, " drug_exposure_start_datetime = '", drug_exposure_start_datetime,"'")
    }
  }
  
  if (!missing(drug_exposure_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(drug_exposure_end_date)) {
      statement <- paste0(statement, ' drug_exposure_end_date IS NULL')
    } else if (is(drug_exposure_end_date, 'subQuery')){
      statement <- paste0(statement, ' drug_exposure_end_date = (', as.character(drug_exposure_end_date), ')')
    } else {
      statement <- paste0(statement, " drug_exposure_end_date = '", drug_exposure_end_date,"'")
    }
  }
  
  if (!missing(drug_exposure_end_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(drug_exposure_end_datetime)) {
      statement <- paste0(statement, ' drug_exposure_end_datetime IS NULL')
    } else if (is(drug_exposure_end_datetime, 'subQuery')){
      statement <- paste0(statement, ' drug_exposure_end_datetime = (', as.character(drug_exposure_end_datetime), ')')
    } else {
      statement <- paste0(statement, " drug_exposure_end_datetime = '", drug_exposure_end_datetime,"'")
    }
  }
  
  if (!missing(drug_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(drug_type_concept_id)) {
      statement <- paste0(statement, ' drug_type_concept_id IS NULL')
    } else if (is(drug_type_concept_id, 'subQuery')){
      statement <- paste0(statement, ' drug_type_concept_id = (', as.character(drug_type_concept_id), ')')
    } else {
      statement <- paste0(statement, " drug_type_concept_id = '", drug_type_concept_id,"'")
    }
  }
  
  if (!missing(stop_reason)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(stop_reason)) {
      statement <- paste0(statement, ' stop_reason IS NULL')
    } else if (is(stop_reason, 'subQuery')){
      statement <- paste0(statement, ' stop_reason = (', as.character(stop_reason), ')')
    } else {
      statement <- paste0(statement, " stop_reason = '", stop_reason,"'")
    }
  }
  
  if (!missing(refills)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(refills)) {
      statement <- paste0(statement, ' refills IS NULL')
    } else if (is(refills, 'subQuery')){
      statement <- paste0(statement, ' refills = (', as.character(refills), ')')
    } else {
      statement <- paste0(statement, " refills = '", refills,"'")
    }
  }
  
  if (!missing(quantity)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(quantity)) {
      statement <- paste0(statement, ' quantity IS NULL')
    } else if (is(quantity, 'subQuery')){
      statement <- paste0(statement, ' quantity = (', as.character(quantity), ')')
    } else {
      statement <- paste0(statement, " quantity = '", quantity,"'")
    }
  }
  
  if (!missing(days_supply)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(days_supply)) {
      statement <- paste0(statement, ' days_supply IS NULL')
    } else if (is(days_supply, 'subQuery')){
      statement <- paste0(statement, ' days_supply = (', as.character(days_supply), ')')
    } else {
      statement <- paste0(statement, " days_supply = '", days_supply,"'")
    }
  }
  
  if (!missing(sig)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(sig)) {
      statement <- paste0(statement, ' sig IS NULL')
    } else if (is(sig, 'subQuery')){
      statement <- paste0(statement, ' sig = (', as.character(sig), ')')
    } else {
      statement <- paste0(statement, " sig = '", sig,"'")
    }
  }
  
  if (!missing(route_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(route_concept_id)) {
      statement <- paste0(statement, ' route_concept_id IS NULL')
    } else if (is(route_concept_id, 'subQuery')){
      statement <- paste0(statement, ' route_concept_id = (', as.character(route_concept_id), ')')
    } else {
      statement <- paste0(statement, " route_concept_id = '", route_concept_id,"'")
    }
  }
  
  if (!missing(effective_drug_dose)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(effective_drug_dose)) {
      statement <- paste0(statement, ' effective_drug_dose IS NULL')
    } else if (is(effective_drug_dose, 'subQuery')){
      statement <- paste0(statement, ' effective_drug_dose = (', as.character(effective_drug_dose), ')')
    } else {
      statement <- paste0(statement, " effective_drug_dose = '", effective_drug_dose,"'")
    }
  }
  
  if (!missing(dose_unit_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(dose_unit_concept_id)) {
      statement <- paste0(statement, ' dose_unit_concept_id IS NULL')
    } else if (is(dose_unit_concept_id, 'subQuery')){
      statement <- paste0(statement, ' dose_unit_concept_id = (', as.character(dose_unit_concept_id), ')')
    } else {
      statement <- paste0(statement, " dose_unit_concept_id = '", dose_unit_concept_id,"'")
    }
  }
  
  if (!missing(lot_number)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(lot_number)) {
      statement <- paste0(statement, ' lot_number IS NULL')
    } else if (is(lot_number, 'subQuery')){
      statement <- paste0(statement, ' lot_number = (', as.character(lot_number), ')')
    } else {
      statement <- paste0(statement, " lot_number = '", lot_number,"'")
    }
  }
  
  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, ' provider_id IS NULL')
    } else if (is(provider_id, 'subQuery')){
      statement <- paste0(statement, ' provider_id = (', as.character(provider_id), ')')
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }
  
  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, ' visit_occurrence_id IS NULL')
    } else if (is(visit_occurrence_id, 'subQuery')){
      statement <- paste0(statement, ' visit_occurrence_id = (', as.character(visit_occurrence_id), ')')
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }
  
  if (!missing(drug_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(drug_source_value)) {
      statement <- paste0(statement, ' drug_source_value IS NULL')
    } else if (is(drug_source_value, 'subQuery')){
      statement <- paste0(statement, ' drug_source_value = (', as.character(drug_source_value), ')')
    } else {
      statement <- paste0(statement, " drug_source_value = '", drug_source_value,"'")
    }
  }
  
  if (!missing(drug_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(drug_source_concept_id)) {
      statement <- paste0(statement, ' drug_source_concept_id IS NULL')
    } else if (is(drug_source_concept_id, 'subQuery')){
      statement <- paste0(statement, ' drug_source_concept_id = (', as.character(drug_source_concept_id), ')')
    } else {
      statement <- paste0(statement, " drug_source_concept_id = '", drug_source_concept_id,"'")
    }
  }
  
  if (!missing(route_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(route_source_value)) {
      statement <- paste0(statement, ' route_source_value IS NULL')
    } else if (is(route_source_value, 'subQuery')){
      statement <- paste0(statement, ' route_source_value = (', as.character(route_source_value), ')')
    } else {
      statement <- paste0(statement, " route_source_value = '", route_source_value,"'")
    }
  }
  
  if (!missing(dose_unit_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(dose_unit_source_value)) {
      statement <- paste0(statement, ' dose_unit_source_value IS NULL')
    } else if (is(dose_unit_source_value, 'subQuery')){
      statement <- paste0(statement, ' dose_unit_source_value = (', as.character(dose_unit_source_value), ')')
    } else {
      statement <- paste0(statement, " dose_unit_source_value = '", dose_unit_source_value,"'")
    }
  }
  
  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status")
  if (exists('testNewExpected', where = globalenv()) && get('testNewExpected'))
  {
    assign('testNewExpected', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    testSql <<- c(testSql, comment)
  }
  testSql <<- c(testSql, statement)
  invisible(statement)
}

expect_no_device_exposure <- function(device_exposure_id, person_id, device_concept_id, device_exposure_start_date, device_exposure_start_datetime, device_exposure_end_date, device_exposure_end_datetime, device_type_concept_id, unique_device_id, quantity, provider_id, visit_occurrence_id, device_source_value, device_source_concept_id) {
  #statement <- paste0("INSERT INTO @cdmDatabaseSchema.test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect device_exposure' AS test, CASE WHEN(SELECT COUNT(*) from @cdmDatabaseSchema.device_exposure WHERE")
  statement <- getExpectStatement(domain = "device_exposure", table = "device_exposure")
  first <- TRUE
  if (!missing(device_exposure_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(device_exposure_id)) {
      statement <- paste0(statement, ' device_exposure_id IS NULL')
    } else if (is(device_exposure_id, 'subQuery')){
      statement <- paste0(statement, ' device_exposure_id = (', as.character(device_exposure_id), ')')
    } else {
      statement <- paste0(statement, " device_exposure_id = '", device_exposure_id,"'")
    }
  }
  
  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, ' person_id IS NULL')
    } else if (is(person_id, 'subQuery')){
      statement <- paste0(statement, ' person_id = (', as.character(person_id), ')')
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }
  
  if (!missing(device_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(device_concept_id)) {
      statement <- paste0(statement, ' device_concept_id IS NULL')
    } else if (is(device_concept_id, 'subQuery')){
      statement <- paste0(statement, ' device_concept_id = (', as.character(device_concept_id), ')')
    } else {
      statement <- paste0(statement, " device_concept_id = '", device_concept_id,"'")
    }
  }
  
  if (!missing(device_exposure_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(device_exposure_start_date)) {
      statement <- paste0(statement, ' device_exposure_start_date IS NULL')
    } else if (is(device_exposure_start_date, 'subQuery')){
      statement <- paste0(statement, ' device_exposure_start_date = (', as.character(device_exposure_start_date), ')')
    } else {
      statement <- paste0(statement, " device_exposure_start_date = '", device_exposure_start_date,"'")
    }
  }
  
  if (!missing(device_exposure_start_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(device_exposure_start_datetime)) {
      statement <- paste0(statement, ' device_exposure_start_datetime IS NULL')
    } else if (is(device_exposure_start_datetime, 'subQuery')){
      statement <- paste0(statement, ' device_exposure_start_datetime = (', as.character(device_exposure_start_datetime), ')')
    } else {
      statement <- paste0(statement, " device_exposure_start_datetime = '", device_exposure_start_datetime,"'")
    }
  }
  
  if (!missing(device_exposure_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(device_exposure_end_date)) {
      statement <- paste0(statement, ' device_exposure_end_date IS NULL')
    } else if (is(device_exposure_end_date, 'subQuery')){
      statement <- paste0(statement, ' device_exposure_end_date = (', as.character(device_exposure_end_date), ')')
    } else {
      statement <- paste0(statement, " device_exposure_end_date = '", device_exposure_end_date,"'")
    }
  }
  
  if (!missing(device_exposure_end_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(device_exposure_end_datetime)) {
      statement <- paste0(statement, ' device_exposure_end_datetime IS NULL')
    } else if (is(device_exposure_end_datetime, 'subQuery')){
      statement <- paste0(statement, ' device_exposure_end_datetime = (', as.character(device_exposure_end_datetime), ')')
    } else {
      statement <- paste0(statement, " device_exposure_end_datetime = '", device_exposure_end_datetime,"'")
    }
  }
  
  if (!missing(device_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(device_type_concept_id)) {
      statement <- paste0(statement, ' device_type_concept_id IS NULL')
    } else if (is(device_type_concept_id, 'subQuery')){
      statement <- paste0(statement, ' device_type_concept_id = (', as.character(device_type_concept_id), ')')
    } else {
      statement <- paste0(statement, " device_type_concept_id = '", device_type_concept_id,"'")
    }
  }
  
  if (!missing(unique_device_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(unique_device_id)) {
      statement <- paste0(statement, ' unique_device_id IS NULL')
    } else if (is(unique_device_id, 'subQuery')){
      statement <- paste0(statement, ' unique_device_id = (', as.character(unique_device_id), ')')
    } else {
      statement <- paste0(statement, " unique_device_id = '", unique_device_id,"'")
    }
  }
  
  if (!missing(quantity)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(quantity)) {
      statement <- paste0(statement, ' quantity IS NULL')
    } else if (is(quantity, 'subQuery')){
      statement <- paste0(statement, ' quantity = (', as.character(quantity), ')')
    } else {
      statement <- paste0(statement, " quantity = '", quantity,"'")
    }
  }
  
  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, ' provider_id IS NULL')
    } else if (is(provider_id, 'subQuery')){
      statement <- paste0(statement, ' provider_id = (', as.character(provider_id), ')')
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }
  
  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, ' visit_occurrence_id IS NULL')
    } else if (is(visit_occurrence_id, 'subQuery')){
      statement <- paste0(statement, ' visit_occurrence_id = (', as.character(visit_occurrence_id), ')')
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }
  
  if (!missing(device_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(device_source_value)) {
      statement <- paste0(statement, ' device_source_value IS NULL')
    } else if (is(device_source_value, 'subQuery')){
      statement <- paste0(statement, ' device_source_value = (', as.character(device_source_value), ')')
    } else {
      statement <- paste0(statement, " device_source_value = '", device_source_value,"'")
    }
  }
  
  if (!missing(device_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(device_source_concept_id)) {
      statement <- paste0(statement, ' device_source_concept_id IS NULL')
    } else if (is(device_source_concept_id, 'subQuery')){
      statement <- paste0(statement, ' device_source_concept_id = (', as.character(device_source_concept_id), ')')
    } else {
      statement <- paste0(statement, " device_source_concept_id = '", device_source_concept_id,"'")
    }
  }
  
  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status")
  if (exists('testNewExpected', where = globalenv()) && get('testNewExpected'))
  {
    assign('testNewExpected', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    testSql <<- c(testSql, comment)
  }
  testSql <<- c(testSql, statement)
  invisible(statement)
}

expect_no_procedure_occurrence <- function(procedure_occurrence_id, person_id, procedure_concept_id, procedure_date, procedure_type_concept_id, modifier_concept_id, quantity, provider_id, visit_occurrence_id, procedure_source_value, procedure_source_concept_id, qualifier_source_value) {
  #statement <- paste0("INSERT INTO @cdmDatabaseSchema.test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect procedure_occurrence' AS test, CASE WHEN(SELECT COUNT(*) from @cdmDatabaseSchema.procedure_occurrence WHERE")
  statement <- getExpectStatement(domain = "procedure_occurrence", table = "procedure_occurrence")
  first <- TRUE
  if (!missing(procedure_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(procedure_occurrence_id)) {
      statement <- paste0(statement, ' procedure_occurrence_id IS NULL')
    } else if (is(procedure_occurrence_id, 'subQuery')){
      statement <- paste0(statement, ' procedure_occurrence_id = (', as.character(procedure_occurrence_id), ')')
    } else {
      statement <- paste0(statement, " procedure_occurrence_id = '", procedure_occurrence_id,"'")
    }
  }
  
  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, ' person_id IS NULL')
    } else if (is(person_id, 'subQuery')){
      statement <- paste0(statement, ' person_id = (', as.character(person_id), ')')
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }
  
  if (!missing(procedure_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(procedure_concept_id)) {
      statement <- paste0(statement, ' procedure_concept_id IS NULL')
    } else if (is(procedure_concept_id, 'subQuery')){
      statement <- paste0(statement, ' procedure_concept_id = (', as.character(procedure_concept_id), ')')
    } else {
      statement <- paste0(statement, " procedure_concept_id = '", procedure_concept_id,"'")
    }
  }
  
  if (!missing(procedure_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(procedure_date)) {
      statement <- paste0(statement, ' procedure_date IS NULL')
    } else if (is(procedure_date, 'subQuery')){
      statement <- paste0(statement, ' procedure_date = (', as.character(procedure_date), ')')
    } else {
      statement <- paste0(statement, " procedure_date = '", procedure_date,"'")
    }
  }
  
  if (!missing(procedure_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(procedure_type_concept_id)) {
      statement <- paste0(statement, ' procedure_type_concept_id IS NULL')
    } else if (is(procedure_type_concept_id, 'subQuery')){
      statement <- paste0(statement, ' procedure_type_concept_id = (', as.character(procedure_type_concept_id), ')')
    } else {
      statement <- paste0(statement, " procedure_type_concept_id = '", procedure_type_concept_id,"'")
    }
  }
  
  if (!missing(modifier_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(modifier_concept_id)) {
      statement <- paste0(statement, ' modifier_concept_id IS NULL')
    } else if (is(modifier_concept_id, 'subQuery')){
      statement <- paste0(statement, ' modifier_concept_id = (', as.character(modifier_concept_id), ')')
    } else {
      statement <- paste0(statement, " modifier_concept_id = '", modifier_concept_id,"'")
    }
  }
  
  if (!missing(quantity)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(quantity)) {
      statement <- paste0(statement, ' quantity IS NULL')
    } else if (is(quantity, 'subQuery')){
      statement <- paste0(statement, ' quantity = (', as.character(quantity), ')')
    } else {
      statement <- paste0(statement, " quantity = '", quantity,"'")
    }
  }
  
  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, ' provider_id IS NULL')
    } else if (is(provider_id, 'subQuery')){
      statement <- paste0(statement, ' provider_id = (', as.character(provider_id), ')')
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }
  
  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, ' visit_occurrence_id IS NULL')
    } else if (is(visit_occurrence_id, 'subQuery')){
      statement <- paste0(statement, ' visit_occurrence_id = (', as.character(visit_occurrence_id), ')')
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }
  
  if (!missing(procedure_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(procedure_source_value)) {
      statement <- paste0(statement, ' procedure_source_value IS NULL')
    } else if (is(procedure_source_value, 'subQuery')){
      statement <- paste0(statement, ' procedure_source_value = (', as.character(procedure_source_value), ')')
    } else {
      statement <- paste0(statement, " procedure_source_value = '", procedure_source_value,"'")
    }
  }
  
  if (!missing(procedure_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(procedure_source_concept_id)) {
      statement <- paste0(statement, ' procedure_source_concept_id IS NULL')
    } else if (is(procedure_source_concept_id, 'subQuery')){
      statement <- paste0(statement, ' procedure_source_concept_id = (', as.character(procedure_source_concept_id), ')')
    } else {
      statement <- paste0(statement, " procedure_source_concept_id = '", procedure_source_concept_id,"'")
    }
  }
  
  if (!missing(qualifier_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(qualifier_source_value)) {
      statement <- paste0(statement, ' qualifier_source_value IS NULL')
    } else if (is(qualifier_source_value, 'subQuery')){
      statement <- paste0(statement, ' qualifier_source_value = (', as.character(qualifier_source_value), ')')
    } else {
      statement <- paste0(statement, " qualifier_source_value = '", qualifier_source_value,"'")
    }
  }
  
  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status")
  if (exists('testNewExpected', where = globalenv()) && get('testNewExpected'))
  {
    assign('testNewExpected', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    testSql <<- c(testSql, comment)
  }
  testSql <<- c(testSql, statement)
  invisible(statement)
}

expect_no_observation <- function(observation_id, person_id, observation_concept_id, observation_date, observation_datetime, observation_type_concept_id, value_as_number, value_as_string, value_as_concept_id, qualifier_concept_id, unit_concept_id, provider_id, visit_occurrence_id, observation_source_value, observation_source_concept_id, unit_source_value, qualifier_source_value) {
  #statement <- paste0("INSERT INTO @cdmDatabaseSchema.test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect observation' AS test, CASE WHEN(SELECT COUNT(*) from @cdmDatabaseSchema.observation WHERE")
  statement <- getExpectStatement(domain = "observation", table = "observation")
  first <- TRUE
  if (!missing(observation_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(observation_id)) {
      statement <- paste0(statement, ' observation_id IS NULL')
    } else if (is(observation_id, 'subQuery')){
      statement <- paste0(statement, ' observation_id = (', as.character(observation_id), ')')
    } else {
      statement <- paste0(statement, " observation_id = '", observation_id,"'")
    }
  }
  
  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, ' person_id IS NULL')
    } else if (is(person_id, 'subQuery')){
      statement <- paste0(statement, ' person_id = (', as.character(person_id), ')')
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }
  
  if (!missing(observation_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(observation_concept_id)) {
      statement <- paste0(statement, ' observation_concept_id IS NULL')
    } else if (is(observation_concept_id, 'subQuery')){
      statement <- paste0(statement, ' observation_concept_id = (', as.character(observation_concept_id), ')')
    } else {
      statement <- paste0(statement, " observation_concept_id = '", observation_concept_id,"'")
    }
  }
  
  if (!missing(observation_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(observation_date)) {
      statement <- paste0(statement, ' observation_date IS NULL')
    } else if (is(observation_date, 'subQuery')){
      statement <- paste0(statement, ' observation_date = (', as.character(observation_date), ')')
    } else {
      statement <- paste0(statement, " observation_date = '", observation_date,"'")
    }
  }
  
  if (!missing(observation_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(observation_datetime)) {
      statement <- paste0(statement, ' observation_datetime IS NULL')
    } else if (is(observation_datetime, 'subQuery')){
      statement <- paste0(statement, ' observation_datetime = (', as.character(observation_datetime), ')')
    } else {
      statement <- paste0(statement, " observation_datetime = '", observation_datetime,"'")
    }
  }
  
  if (!missing(observation_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(observation_type_concept_id)) {
      statement <- paste0(statement, ' observation_type_concept_id IS NULL')
    } else if (is(observation_type_concept_id, 'subQuery')){
      statement <- paste0(statement, ' observation_type_concept_id = (', as.character(observation_type_concept_id), ')')
    } else {
      statement <- paste0(statement, " observation_type_concept_id = '", observation_type_concept_id,"'")
    }
  }
  
  if (!missing(value_as_number)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(value_as_number)) {
      statement <- paste0(statement, ' value_as_number IS NULL')
    } else if (is(value_as_number, 'subQuery')){
      statement <- paste0(statement, ' value_as_number = (', as.character(value_as_number), ')')
    } else {
      statement <- paste0(statement, " value_as_number = '", value_as_number,"'")
    }
  }
  
  if (!missing(value_as_string)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(value_as_string)) {
      statement <- paste0(statement, ' value_as_string IS NULL')
    } else if (is(value_as_string, 'subQuery')){
      statement <- paste0(statement, ' value_as_string = (', as.character(value_as_string), ')')
    } else {
      statement <- paste0(statement, " value_as_string = '", value_as_string,"'")
    }
  }
  
  if (!missing(value_as_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(value_as_concept_id)) {
      statement <- paste0(statement, ' value_as_concept_id IS NULL')
    } else if (is(value_as_concept_id, 'subQuery')){
      statement <- paste0(statement, ' value_as_concept_id = (', as.character(value_as_concept_id), ')')
    } else {
      statement <- paste0(statement, " value_as_concept_id = '", value_as_concept_id,"'")
    }
  }
  
  if (!missing(qualifier_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(qualifier_concept_id)) {
      statement <- paste0(statement, ' qualifier_concept_id IS NULL')
    } else if (is(qualifier_concept_id, 'subQuery')){
      statement <- paste0(statement, ' qualifier_concept_id = (', as.character(qualifier_concept_id), ')')
    } else {
      statement <- paste0(statement, " qualifier_concept_id = '", qualifier_concept_id,"'")
    }
  }
  
  if (!missing(unit_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(unit_concept_id)) {
      statement <- paste0(statement, ' unit_concept_id IS NULL')
    } else if (is(unit_concept_id, 'subQuery')){
      statement <- paste0(statement, ' unit_concept_id = (', as.character(unit_concept_id), ')')
    } else {
      statement <- paste0(statement, " unit_concept_id = '", unit_concept_id,"'")
    }
  }
  
  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, ' provider_id IS NULL')
    } else if (is(provider_id, 'subQuery')){
      statement <- paste0(statement, ' provider_id = (', as.character(provider_id), ')')
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }
  
  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, ' visit_occurrence_id IS NULL')
    } else if (is(visit_occurrence_id, 'subQuery')){
      statement <- paste0(statement, ' visit_occurrence_id = (', as.character(visit_occurrence_id), ')')
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }
  
  if (!missing(observation_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(observation_source_value)) {
      statement <- paste0(statement, ' observation_source_value IS NULL')
    } else if (is(observation_source_value, 'subQuery')){
      statement <- paste0(statement, ' observation_source_value = (', as.character(observation_source_value), ')')
    } else {
      statement <- paste0(statement, " observation_source_value = '", observation_source_value,"'")
    }
  }
  
  if (!missing(observation_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(observation_source_concept_id)) {
      statement <- paste0(statement, ' observation_source_concept_id IS NULL')
    } else if (is(observation_source_concept_id, 'subQuery')){
      statement <- paste0(statement, ' observation_source_concept_id = (', as.character(observation_source_concept_id), ')')
    } else {
      statement <- paste0(statement, " observation_source_concept_id = '", observation_source_concept_id,"'")
    }
  }
  
  if (!missing(unit_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(unit_source_value)) {
      statement <- paste0(statement, ' unit_source_value IS NULL')
    } else if (is(unit_source_value, 'subQuery')){
      statement <- paste0(statement, ' unit_source_value = (', as.character(unit_source_value), ')')
    } else {
      statement <- paste0(statement, " unit_source_value = '", unit_source_value,"'")
    }
  }
  
  if (!missing(qualifier_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(qualifier_source_value)) {
      statement <- paste0(statement, ' qualifier_source_value IS NULL')
    } else if (is(qualifier_source_value, 'subQuery')){
      statement <- paste0(statement, ' qualifier_source_value = (', as.character(qualifier_source_value), ')')
    } else {
      statement <- paste0(statement, " qualifier_source_value = '", qualifier_source_value,"'")
    }
  }
  
  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status")
  if (exists('testNewExpected', where = globalenv()) && get('testNewExpected'))
  {
    assign('testNewExpected', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    testSql <<- c(testSql, comment)
  }
  testSql <<- c(testSql, statement)
  invisible(statement)
}

expect_no_note <- function(note_id, person_id, note_date, note_datetime, note_type_concept_id, note_text, provider_id, visit_occurrence_id, note_source_value) {
  #statement <- paste0("INSERT INTO @cdmDatabaseSchema.test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect note' AS test, CASE WHEN(SELECT COUNT(*) from @cdmDatabaseSchema.note WHERE")
  statement <- getExpectStatement(domain = "note", table = "note")
  first <- TRUE
  if (!missing(note_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(note_id)) {
      statement <- paste0(statement, ' note_id IS NULL')
    } else if (is(note_id, 'subQuery')){
      statement <- paste0(statement, ' note_id = (', as.character(note_id), ')')
    } else {
      statement <- paste0(statement, " note_id = '", note_id,"'")
    }
  }
  
  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, ' person_id IS NULL')
    } else if (is(person_id, 'subQuery')){
      statement <- paste0(statement, ' person_id = (', as.character(person_id), ')')
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }
  
  if (!missing(note_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(note_date)) {
      statement <- paste0(statement, ' note_date IS NULL')
    } else if (is(note_date, 'subQuery')){
      statement <- paste0(statement, ' note_date = (', as.character(note_date), ')')
    } else {
      statement <- paste0(statement, " note_date = '", note_date,"'")
    }
  }
  
  if (!missing(note_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(note_datetime)) {
      statement <- paste0(statement, ' note_datetime IS NULL')
    } else if (is(note_datetime, 'subQuery')){
      statement <- paste0(statement, ' note_datetime = (', as.character(note_datetime), ')')
    } else {
      statement <- paste0(statement, " note_datetime = '", note_datetime,"'")
    }
  }
  
  if (!missing(note_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(note_type_concept_id)) {
      statement <- paste0(statement, ' note_type_concept_id IS NULL')
    } else if (is(note_type_concept_id, 'subQuery')){
      statement <- paste0(statement, ' note_type_concept_id = (', as.character(note_type_concept_id), ')')
    } else {
      statement <- paste0(statement, " note_type_concept_id = '", note_type_concept_id,"'")
    }
  }
  
  if (!missing(note_text)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(note_text)) {
      statement <- paste0(statement, ' note_text IS NULL')
    } else if (is(note_text, 'subQuery')){
      statement <- paste0(statement, ' note_text = (', as.character(note_text), ')')
    } else {
      statement <- paste0(statement, " note_text = '", note_text,"'")
    }
  }
  
  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, ' provider_id IS NULL')
    } else if (is(provider_id, 'subQuery')){
      statement <- paste0(statement, ' provider_id = (', as.character(provider_id), ')')
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }
  
  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, ' visit_occurrence_id IS NULL')
    } else if (is(visit_occurrence_id, 'subQuery')){
      statement <- paste0(statement, ' visit_occurrence_id = (', as.character(visit_occurrence_id), ')')
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }
  
  if (!missing(note_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(note_source_value)) {
      statement <- paste0(statement, ' note_source_value IS NULL')
    } else if (is(note_source_value, 'subQuery')){
      statement <- paste0(statement, ' note_source_value = (', as.character(note_source_value), ')')
    } else {
      statement <- paste0(statement, " note_source_value = '", note_source_value,"'")
    }
  }
  
  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status")
  if (exists('testNewExpected', where = globalenv()) && get('testNewExpected'))
  {
    assign('testNewExpected', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    testSql <<- c(testSql, comment)
  }
  testSql <<- c(testSql, statement)
  invisible(statement)
}

expect_no_specimen <- function(specimen_id, person_id, specimen_concept_id, specimen_type_concept_id, specimen_date, specimen_datetime, quantity, unit_concept_id, anatomic_site_concept_id, disease_status_concept_id, specimen_source_id, specimen_source_value, unit_source_value, anatomic_site_source_value, disease_status_source_value) {
  #statement <- paste0("INSERT INTO @cdmDatabaseSchema.test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect specimen' AS test, CASE WHEN(SELECT COUNT(*) from @cdmDatabaseSchema.specimen WHERE")
  statement <- getExpectStatement(domain = "specimen", table = "specimen")
  first <- TRUE
  if (!missing(specimen_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(specimen_id)) {
      statement <- paste0(statement, ' specimen_id IS NULL')
    } else if (is(specimen_id, 'subQuery')){
      statement <- paste0(statement, ' specimen_id = (', as.character(specimen_id), ')')
    } else {
      statement <- paste0(statement, " specimen_id = '", specimen_id,"'")
    }
  }
  
  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, ' person_id IS NULL')
    } else if (is(person_id, 'subQuery')){
      statement <- paste0(statement, ' person_id = (', as.character(person_id), ')')
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }
  
  if (!missing(specimen_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(specimen_concept_id)) {
      statement <- paste0(statement, ' specimen_concept_id IS NULL')
    } else if (is(specimen_concept_id, 'subQuery')){
      statement <- paste0(statement, ' specimen_concept_id = (', as.character(specimen_concept_id), ')')
    } else {
      statement <- paste0(statement, " specimen_concept_id = '", specimen_concept_id,"'")
    }
  }
  
  if (!missing(specimen_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(specimen_type_concept_id)) {
      statement <- paste0(statement, ' specimen_type_concept_id IS NULL')
    } else if (is(specimen_type_concept_id, 'subQuery')){
      statement <- paste0(statement, ' specimen_type_concept_id = (', as.character(specimen_type_concept_id), ')')
    } else {
      statement <- paste0(statement, " specimen_type_concept_id = '", specimen_type_concept_id,"'")
    }
  }
  
  if (!missing(specimen_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(specimen_date)) {
      statement <- paste0(statement, ' specimen_date IS NULL')
    } else if (is(specimen_date, 'subQuery')){
      statement <- paste0(statement, ' specimen_date = (', as.character(specimen_date), ')')
    } else {
      statement <- paste0(statement, " specimen_date = '", specimen_date,"'")
    }
  }
  
  if (!missing(specimen_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(specimen_datetime)) {
      statement <- paste0(statement, ' specimen_datetime IS NULL')
    } else if (is(specimen_datetime, 'subQuery')){
      statement <- paste0(statement, ' specimen_datetime = (', as.character(specimen_datetime), ')')
    } else {
      statement <- paste0(statement, " specimen_datetime = '", specimen_datetime,"'")
    }
  }
  
  if (!missing(quantity)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(quantity)) {
      statement <- paste0(statement, ' quantity IS NULL')
    } else if (is(quantity, 'subQuery')){
      statement <- paste0(statement, ' quantity = (', as.character(quantity), ')')
    } else {
      statement <- paste0(statement, " quantity = '", quantity,"'")
    }
  }
  
  if (!missing(unit_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(unit_concept_id)) {
      statement <- paste0(statement, ' unit_concept_id IS NULL')
    } else if (is(unit_concept_id, 'subQuery')){
      statement <- paste0(statement, ' unit_concept_id = (', as.character(unit_concept_id), ')')
    } else {
      statement <- paste0(statement, " unit_concept_id = '", unit_concept_id,"'")
    }
  }
  
  if (!missing(anatomic_site_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(anatomic_site_concept_id)) {
      statement <- paste0(statement, ' anatomic_site_concept_id IS NULL')
    } else if (is(anatomic_site_concept_id, 'subQuery')){
      statement <- paste0(statement, ' anatomic_site_concept_id = (', as.character(anatomic_site_concept_id), ')')
    } else {
      statement <- paste0(statement, " anatomic_site_concept_id = '", anatomic_site_concept_id,"'")
    }
  }
  
  if (!missing(disease_status_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(disease_status_concept_id)) {
      statement <- paste0(statement, ' disease_status_concept_id IS NULL')
    } else if (is(disease_status_concept_id, 'subQuery')){
      statement <- paste0(statement, ' disease_status_concept_id = (', as.character(disease_status_concept_id), ')')
    } else {
      statement <- paste0(statement, " disease_status_concept_id = '", disease_status_concept_id,"'")
    }
  }
  
  if (!missing(specimen_source_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(specimen_source_id)) {
      statement <- paste0(statement, ' specimen_source_id IS NULL')
    } else if (is(specimen_source_id, 'subQuery')){
      statement <- paste0(statement, ' specimen_source_id = (', as.character(specimen_source_id), ')')
    } else {
      statement <- paste0(statement, " specimen_source_id = '", specimen_source_id,"'")
    }
  }
  
  if (!missing(specimen_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(specimen_source_value)) {
      statement <- paste0(statement, ' specimen_source_value IS NULL')
    } else if (is(specimen_source_value, 'subQuery')){
      statement <- paste0(statement, ' specimen_source_value = (', as.character(specimen_source_value), ')')
    } else {
      statement <- paste0(statement, " specimen_source_value = '", specimen_source_value,"'")
    }
  }
  
  if (!missing(unit_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(unit_source_value)) {
      statement <- paste0(statement, ' unit_source_value IS NULL')
    } else if (is(unit_source_value, 'subQuery')){
      statement <- paste0(statement, ' unit_source_value = (', as.character(unit_source_value), ')')
    } else {
      statement <- paste0(statement, " unit_source_value = '", unit_source_value,"'")
    }
  }
  
  if (!missing(anatomic_site_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(anatomic_site_source_value)) {
      statement <- paste0(statement, ' anatomic_site_source_value IS NULL')
    } else if (is(anatomic_site_source_value, 'subQuery')){
      statement <- paste0(statement, ' anatomic_site_source_value = (', as.character(anatomic_site_source_value), ')')
    } else {
      statement <- paste0(statement, " anatomic_site_source_value = '", anatomic_site_source_value,"'")
    }
  }
  
  if (!missing(disease_status_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(disease_status_source_value)) {
      statement <- paste0(statement, ' disease_status_source_value IS NULL')
    } else if (is(disease_status_source_value, 'subQuery')){
      statement <- paste0(statement, ' disease_status_source_value = (', as.character(disease_status_source_value), ')')
    } else {
      statement <- paste0(statement, " disease_status_source_value = '", disease_status_source_value,"'")
    }
  }
  
  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status")
  if (exists('testNewExpected', where = globalenv()) && get('testNewExpected'))
  {
    assign('testNewExpected', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    testSql <<- c(testSql, comment)
  }
  testSql <<- c(testSql, statement)
  invisible(statement)
}

expect_no_fact_relationship <- function(domain_concept_id_1, fact_id_1, domain_concept_id_2, fact_id_2, relationship_concept_id) {
  #statement <- paste0("INSERT INTO @cdmDatabaseSchema.test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect fact_relationship' AS test, CASE WHEN(SELECT COUNT(*) from @cdmDatabaseSchema.fact_relationship WHERE")
  statement <- getExpectStatement(domain = "fact_relationship", table = "fact_relationship")
  first <- TRUE
  if (!missing(domain_concept_id_1)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(domain_concept_id_1)) {
      statement <- paste0(statement, ' domain_concept_id_1 IS NULL')
    } else if (is(domain_concept_id_1, 'subQuery')){
      statement <- paste0(statement, ' domain_concept_id_1 = (', as.character(domain_concept_id_1), ')')
    } else {
      statement <- paste0(statement, " domain_concept_id_1 = '", domain_concept_id_1,"'")
    }
  }
  
  if (!missing(fact_id_1)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(fact_id_1)) {
      statement <- paste0(statement, ' fact_id_1 IS NULL')
    } else if (is(fact_id_1, 'subQuery')){
      statement <- paste0(statement, ' fact_id_1 = (', as.character(fact_id_1), ')')
    } else {
      statement <- paste0(statement, " fact_id_1 = '", fact_id_1,"'")
    }
  }
  
  if (!missing(domain_concept_id_2)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(domain_concept_id_2)) {
      statement <- paste0(statement, ' domain_concept_id_2 IS NULL')
    } else if (is(domain_concept_id_2, 'subQuery')){
      statement <- paste0(statement, ' domain_concept_id_2 = (', as.character(domain_concept_id_2), ')')
    } else {
      statement <- paste0(statement, " domain_concept_id_2 = '", domain_concept_id_2,"'")
    }
  }
  
  if (!missing(fact_id_2)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(fact_id_2)) {
      statement <- paste0(statement, ' fact_id_2 IS NULL')
    } else if (is(fact_id_2, 'subQuery')){
      statement <- paste0(statement, ' fact_id_2 = (', as.character(fact_id_2), ')')
    } else {
      statement <- paste0(statement, " fact_id_2 = '", fact_id_2,"'")
    }
  }
  
  if (!missing(relationship_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(relationship_concept_id)) {
      statement <- paste0(statement, ' relationship_concept_id IS NULL')
    } else if (is(relationship_concept_id, 'subQuery')){
      statement <- paste0(statement, ' relationship_concept_id = (', as.character(relationship_concept_id), ')')
    } else {
      statement <- paste0(statement, " relationship_concept_id = '", relationship_concept_id,"'")
    }
  }
  
  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status")
  if (exists('testNewExpected', where = globalenv()) && get('testNewExpected'))
  {
    assign('testNewExpected', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    testSql <<- c(testSql, comment)
  }
  testSql <<- c(testSql, statement)
  invisible(statement)
}

expect_no_drug_era <- function(drug_era_id, person_id, drug_concept_id, drug_era_start_date, drug_era_end_date, drug_exposure_count, gap_days) {
  #statement <- paste0("INSERT INTO @cdmDatabaseSchema.test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect drug_era' AS test, CASE WHEN(SELECT COUNT(*) from @cdmDatabaseSchema.drug_era WHERE")
  statement <- getExpectStatement(domain = "drug_era", table = "drug_era")
  first <- TRUE
  if (!missing(drug_era_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(drug_era_id)) {
      statement <- paste0(statement, ' drug_era_id IS NULL')
    } else if (is(drug_era_id, 'subQuery')){
      statement <- paste0(statement, ' drug_era_id = (', as.character(drug_era_id), ')')
    } else {
      statement <- paste0(statement, " drug_era_id = '", drug_era_id,"'")
    }
  }
  
  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, ' person_id IS NULL')
    } else if (is(person_id, 'subQuery')){
      statement <- paste0(statement, ' person_id = (', as.character(person_id), ')')
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }
  
  if (!missing(drug_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(drug_concept_id)) {
      statement <- paste0(statement, ' drug_concept_id IS NULL')
    } else if (is(drug_concept_id, 'subQuery')){
      statement <- paste0(statement, ' drug_concept_id = (', as.character(drug_concept_id), ')')
    } else {
      statement <- paste0(statement, " drug_concept_id = '", drug_concept_id,"'")
    }
  }
  
  if (!missing(drug_era_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(drug_era_start_date)) {
      statement <- paste0(statement, ' drug_era_start_date IS NULL')
    } else if (is(drug_era_start_date, 'subQuery')){
      statement <- paste0(statement, ' drug_era_start_date = (', as.character(drug_era_start_date), ')')
    } else {
      statement <- paste0(statement, " drug_era_start_date = '", drug_era_start_date,"'")
    }
  }
  
  if (!missing(drug_era_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(drug_era_end_date)) {
      statement <- paste0(statement, ' drug_era_end_date IS NULL')
    } else if (is(drug_era_end_date, 'subQuery')){
      statement <- paste0(statement, ' drug_era_end_date = (', as.character(drug_era_end_date), ')')
    } else {
      statement <- paste0(statement, " drug_era_end_date = '", drug_era_end_date,"'")
    }
  }
  
  if (!missing(drug_exposure_count)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(drug_exposure_count)) {
      statement <- paste0(statement, ' drug_exposure_count IS NULL')
    } else if (is(drug_exposure_count, 'subQuery')){
      statement <- paste0(statement, ' drug_exposure_count = (', as.character(drug_exposure_count), ')')
    } else {
      statement <- paste0(statement, " drug_exposure_count = '", drug_exposure_count,"'")
    }
  }
  
  if (!missing(gap_days)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(gap_days)) {
      statement <- paste0(statement, ' gap_days IS NULL')
    } else if (is(gap_days, 'subQuery')){
      statement <- paste0(statement, ' gap_days = (', as.character(gap_days), ')')
    } else {
      statement <- paste0(statement, " gap_days = '", gap_days,"'")
    }
  }
  
  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status")
  if (exists('testNewExpected', where = globalenv()) && get('testNewExpected'))
  {
    assign('testNewExpected', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    testSql <<- c(testSql, comment)
  }
  testSql <<- c(testSql, statement)
  invisible(statement)
}

expect_no_dose_era <- function(dose_era_id, person_id, drug_concept_id, unit_concept_id, dose_value, dose_era_start_date, dose_era_end_date) {
  #statement <- paste0("INSERT INTO @cdmDatabaseSchema.test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect dose_era' AS test, CASE WHEN(SELECT COUNT(*) from @cdmDatabaseSchema.dose_era WHERE")
  statement <- getExpectStatement(domain = "dose_era", table = "dose_era")
  first <- TRUE
  if (!missing(dose_era_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(dose_era_id)) {
      statement <- paste0(statement, ' dose_era_id IS NULL')
    } else if (is(dose_era_id, 'subQuery')){
      statement <- paste0(statement, ' dose_era_id = (', as.character(dose_era_id), ')')
    } else {
      statement <- paste0(statement, " dose_era_id = '", dose_era_id,"'")
    }
  }
  
  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, ' person_id IS NULL')
    } else if (is(person_id, 'subQuery')){
      statement <- paste0(statement, ' person_id = (', as.character(person_id), ')')
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }
  
  if (!missing(drug_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(drug_concept_id)) {
      statement <- paste0(statement, ' drug_concept_id IS NULL')
    } else if (is(drug_concept_id, 'subQuery')){
      statement <- paste0(statement, ' drug_concept_id = (', as.character(drug_concept_id), ')')
    } else {
      statement <- paste0(statement, " drug_concept_id = '", drug_concept_id,"'")
    }
  }
  
  if (!missing(unit_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(unit_concept_id)) {
      statement <- paste0(statement, ' unit_concept_id IS NULL')
    } else if (is(unit_concept_id, 'subQuery')){
      statement <- paste0(statement, ' unit_concept_id = (', as.character(unit_concept_id), ')')
    } else {
      statement <- paste0(statement, " unit_concept_id = '", unit_concept_id,"'")
    }
  }
  
  if (!missing(dose_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(dose_value)) {
      statement <- paste0(statement, ' dose_value IS NULL')
    } else if (is(dose_value, 'subQuery')){
      statement <- paste0(statement, ' dose_value = (', as.character(dose_value), ')')
    } else {
      statement <- paste0(statement, " dose_value = '", dose_value,"'")
    }
  }
  
  if (!missing(dose_era_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(dose_era_start_date)) {
      statement <- paste0(statement, ' dose_era_start_date IS NULL')
    } else if (is(dose_era_start_date, 'subQuery')){
      statement <- paste0(statement, ' dose_era_start_date = (', as.character(dose_era_start_date), ')')
    } else {
      statement <- paste0(statement, " dose_era_start_date = '", dose_era_start_date,"'")
    }
  }
  
  if (!missing(dose_era_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(dose_era_end_date)) {
      statement <- paste0(statement, ' dose_era_end_date IS NULL')
    } else if (is(dose_era_end_date, 'subQuery')){
      statement <- paste0(statement, ' dose_era_end_date = (', as.character(dose_era_end_date), ')')
    } else {
      statement <- paste0(statement, " dose_era_end_date = '", dose_era_end_date,"'")
    }
  }
  
  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status")
  if (exists('testNewExpected', where = globalenv()) && get('testNewExpected'))
  {
    assign('testNewExpected', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    testSql <<- c(testSql, comment)
  }
  testSql <<- c(testSql, statement)
  invisible(statement)
}

expect_no_condition_era <- function(condition_era_id, person_id, condition_concept_id, condition_era_start_date, condition_era_end_date, condition_occurrence_count) {
  #statement <- paste0("INSERT INTO @cdmDatabaseSchema.test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect condition_era' AS test, CASE WHEN(SELECT COUNT(*) from @cdmDatabaseSchema.condition_era WHERE")
  statement <- getExpectStatement(domain = "condition_era", table = "condition_era")
  first <- TRUE
  if (!missing(condition_era_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(condition_era_id)) {
      statement <- paste0(statement, ' condition_era_id IS NULL')
    } else if (is(condition_era_id, 'subQuery')){
      statement <- paste0(statement, ' condition_era_id = (', as.character(condition_era_id), ')')
    } else {
      statement <- paste0(statement, " condition_era_id = '", condition_era_id,"'")
    }
  }
  
  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, ' person_id IS NULL')
    } else if (is(person_id, 'subQuery')){
      statement <- paste0(statement, ' person_id = (', as.character(person_id), ')')
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }
  
  if (!missing(condition_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(condition_concept_id)) {
      statement <- paste0(statement, ' condition_concept_id IS NULL')
    } else if (is(condition_concept_id, 'subQuery')){
      statement <- paste0(statement, ' condition_concept_id = (', as.character(condition_concept_id), ')')
    } else {
      statement <- paste0(statement, " condition_concept_id = '", condition_concept_id,"'")
    }
  }
  
  if (!missing(condition_era_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(condition_era_start_date)) {
      statement <- paste0(statement, ' condition_era_start_date IS NULL')
    } else if (is(condition_era_start_date, 'subQuery')){
      statement <- paste0(statement, ' condition_era_start_date = (', as.character(condition_era_start_date), ')')
    } else {
      statement <- paste0(statement, " condition_era_start_date = '", condition_era_start_date,"'")
    }
  }
  
  if (!missing(condition_era_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(condition_era_end_date)) {
      statement <- paste0(statement, ' condition_era_end_date IS NULL')
    } else if (is(condition_era_end_date, 'subQuery')){
      statement <- paste0(statement, ' condition_era_end_date = (', as.character(condition_era_end_date), ')')
    } else {
      statement <- paste0(statement, " condition_era_end_date = '", condition_era_end_date,"'")
    }
  }
  
  if (!missing(condition_occurrence_count)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(condition_occurrence_count)) {
      statement <- paste0(statement, ' condition_occurrence_count IS NULL')
    } else if (is(condition_occurrence_count, 'subQuery')){
      statement <- paste0(statement, ' condition_occurrence_count = (', as.character(condition_occurrence_count), ')')
    } else {
      statement <- paste0(statement, " condition_occurrence_count = '", condition_occurrence_count,"'")
    }
  }
  
  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status")
  if (exists('testNewExpected', where = globalenv()) && get('testNewExpected'))
  {
    assign('testNewExpected', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    testSql <<- c(testSql, comment)
  }
  testSql <<- c(testSql, statement)
  invisible(statement)
}

expect_no_cdm_source <- function(cdm_source_name, cdm_source_abbreviation, cdm_holder, source_description, source_documentation_reference, cdm_etl_reference, source_release_date, cdm_release_date, cdm_version, vocabulary_version) {
  #statement <- paste0("INSERT INTO @cdmDatabaseSchema.test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect cdm_source' AS test, CASE WHEN(SELECT COUNT(*) FROM cdm_source WHERE")
  statement <- getExpectStatement(domain = "cdm_source", table = "cdm_source")
  first <- TRUE
  if (!missing(cdm_source_name)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cdm_source_name)) {
      statement <- paste0(statement, ' cdm_source_name IS NULL')
    } else if (is(cdm_source_name, 'subQuery')){
      statement <- paste0(statement, ' cdm_source_name = (', as.character(cdm_source_name), ')')
    } else {
      statement <- paste0(statement, " cdm_source_name = '", cdm_source_name,"'")
    }
  }
  
  if (!missing(cdm_source_abbreviation)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cdm_source_abbreviation)) {
      statement <- paste0(statement, ' cdm_source_abbreviation IS NULL')
    } else if (is(cdm_source_abbreviation, 'subQuery')){
      statement <- paste0(statement, ' cdm_source_abbreviation = (', as.character(cdm_source_abbreviation), ')')
    } else {
      statement <- paste0(statement, " cdm_source_abbreviation = '", cdm_source_abbreviation,"'")
    }
  }
  
  if (!missing(cdm_holder)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cdm_holder)) {
      statement <- paste0(statement, ' cdm_holder IS NULL')
    } else if (is(cdm_holder, 'subQuery')){
      statement <- paste0(statement, ' cdm_holder = (', as.character(cdm_holder), ')')
    } else {
      statement <- paste0(statement, " cdm_holder = '", cdm_holder,"'")
    }
  }
  
  if (!missing(source_description)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(source_description)) {
      statement <- paste0(statement, ' source_description IS NULL')
    } else if (is(source_description, 'subQuery')){
      statement <- paste0(statement, ' source_description = (', as.character(source_description), ')')
    } else {
      statement <- paste0(statement, " source_description = '", source_description,"'")
    }
  }
  
  if (!missing(source_documentation_reference)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(source_documentation_reference)) {
      statement <- paste0(statement, ' source_documentation_reference IS NULL')
    } else if (is(source_documentation_reference, 'subQuery')){
      statement <- paste0(statement, ' source_documentation_reference = (', as.character(source_documentation_reference), ')')
    } else {
      statement <- paste0(statement, " source_documentation_reference = '", source_documentation_reference,"'")
    }
  }
  
  if (!missing(cdm_etl_reference)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cdm_etl_reference)) {
      statement <- paste0(statement, ' cdm_etl_reference IS NULL')
    } else if (is(cdm_etl_reference, 'subQuery')){
      statement <- paste0(statement, ' cdm_etl_reference = (', as.character(cdm_etl_reference), ')')
    } else {
      statement <- paste0(statement, " cdm_etl_reference = '", cdm_etl_reference,"'")
    }
  }
  
  if (!missing(source_release_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(source_release_date)) {
      statement <- paste0(statement, ' source_release_date IS NULL')
    } else if (is(source_release_date, 'subQuery')){
      statement <- paste0(statement, ' source_release_date = (', as.character(source_release_date), ')')
    } else {
      statement <- paste0(statement, " source_release_date = '", source_release_date,"'")
    }
  }
  
  if (!missing(cdm_release_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cdm_release_date)) {
      statement <- paste0(statement, ' cdm_release_date IS NULL')
    } else if (is(cdm_release_date, 'subQuery')){
      statement <- paste0(statement, ' cdm_release_date = (', as.character(cdm_release_date), ')')
    } else {
      statement <- paste0(statement, " cdm_release_date = '", cdm_release_date,"'")
    }
  }
  
  if (!missing(cdm_version)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cdm_version)) {
      statement <- paste0(statement, ' cdm_version IS NULL')
    } else if (is(cdm_version, 'subQuery')){
      statement <- paste0(statement, ' cdm_version = (', as.character(cdm_version), ')')
    } else {
      statement <- paste0(statement, " cdm_version = '", cdm_version,"'")
    }
  }
  
  if (!missing(vocabulary_version)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(vocabulary_version)) {
      statement <- paste0(statement, ' vocabulary_version IS NULL')
    } else if (is(vocabulary_version, 'subQuery')){
      statement <- paste0(statement, ' vocabulary_version = (', as.character(vocabulary_version), ')')
    } else {
      statement <- paste0(statement, " vocabulary_version = '", vocabulary_version,"'")
    }
  }
  
  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status")
  if (exists('testNewExpected', where = globalenv()) && get('testNewExpected'))
  {
    assign('testNewExpected', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    testSql <<- c(testSql, comment)
  }
  testSql <<- c(testSql, statement)
  invisible(statement)
}

expect_no_cohort <- function(cohort_definition_id, subject_id, cohort_start_date, cohort_end_date) {
  #statement <- paste0("INSERT INTO @cdmDatabaseSchema.test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect cohort' AS test, CASE WHEN(SELECT COUNT(*) FROM cohort WHERE")
  statement <- getExpectStatement(domain = "cohort", table = "cohort")
  first <- TRUE
  if (!missing(cohort_definition_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cohort_definition_id)) {
      statement <- paste0(statement, ' cohort_definition_id IS NULL')
    } else if (is(cohort_definition_id, 'subQuery')){
      statement <- paste0(statement, ' cohort_definition_id = (', as.character(cohort_definition_id), ')')
    } else {
      statement <- paste0(statement, " cohort_definition_id = '", cohort_definition_id,"'")
    }
  }
  
  if (!missing(subject_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(subject_id)) {
      statement <- paste0(statement, ' subject_id IS NULL')
    } else if (is(subject_id, 'subQuery')){
      statement <- paste0(statement, ' subject_id = (', as.character(subject_id), ')')
    } else {
      statement <- paste0(statement, " subject_id = '", subject_id,"'")
    }
  }
  
  if (!missing(cohort_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cohort_start_date)) {
      statement <- paste0(statement, ' cohort_start_date IS NULL')
    } else if (is(cohort_start_date, 'subQuery')){
      statement <- paste0(statement, ' cohort_start_date = (', as.character(cohort_start_date), ')')
    } else {
      statement <- paste0(statement, " cohort_start_date = '", cohort_start_date,"'")
    }
  }
  
  if (!missing(cohort_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cohort_end_date)) {
      statement <- paste0(statement, ' cohort_end_date IS NULL')
    } else if (is(cohort_end_date, 'subQuery')){
      statement <- paste0(statement, ' cohort_end_date = (', as.character(cohort_end_date), ')')
    } else {
      statement <- paste0(statement, " cohort_end_date = '", cohort_end_date,"'")
    }
  }
  
  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status")
  if (exists('testNewExpected', where = globalenv()) && get('testNewExpected'))
  {
    assign('testNewExpected', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    testSql <<- c(testSql, comment)
  }
  testSql <<- c(testSql, statement)
  invisible(statement)
}

expect_no_cohort_definition <- function(cohort_definition_id, cohort_definition_name, cohort_definition_description, definition_type_concept_id, cohort_definition_syntax, subject_concept_id, cohort_instantiation_date) {
  #statement <- paste0("INSERT INTO @cdmDatabaseSchema.test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect cohort_definition' AS test, CASE WHEN(SELECT COUNT(*) FROM cohort_definition WHERE")
  statement <- getExpectStatement(domain = "cohort_definition", table = "cohort_definition")
  first <- TRUE
  if (!missing(cohort_definition_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cohort_definition_id)) {
      statement <- paste0(statement, ' cohort_definition_id IS NULL')
    } else if (is(cohort_definition_id, 'subQuery')){
      statement <- paste0(statement, ' cohort_definition_id = (', as.character(cohort_definition_id), ')')
    } else {
      statement <- paste0(statement, " cohort_definition_id = '", cohort_definition_id,"'")
    }
  }
  
  if (!missing(cohort_definition_name)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cohort_definition_name)) {
      statement <- paste0(statement, ' cohort_definition_name IS NULL')
    } else if (is(cohort_definition_name, 'subQuery')){
      statement <- paste0(statement, ' cohort_definition_name = (', as.character(cohort_definition_name), ')')
    } else {
      statement <- paste0(statement, " cohort_definition_name = '", cohort_definition_name,"'")
    }
  }
  
  if (!missing(cohort_definition_description)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cohort_definition_description)) {
      statement <- paste0(statement, ' cohort_definition_description IS NULL')
    } else if (is(cohort_definition_description, 'subQuery')){
      statement <- paste0(statement, ' cohort_definition_description = (', as.character(cohort_definition_description), ')')
    } else {
      statement <- paste0(statement, " cohort_definition_description = '", cohort_definition_description,"'")
    }
  }
  
  if (!missing(definition_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(definition_type_concept_id)) {
      statement <- paste0(statement, ' definition_type_concept_id IS NULL')
    } else if (is(definition_type_concept_id, 'subQuery')){
      statement <- paste0(statement, ' definition_type_concept_id = (', as.character(definition_type_concept_id), ')')
    } else {
      statement <- paste0(statement, " definition_type_concept_id = '", definition_type_concept_id,"'")
    }
  }
  
  if (!missing(cohort_definition_syntax)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cohort_definition_syntax)) {
      statement <- paste0(statement, ' cohort_definition_syntax IS NULL')
    } else if (is(cohort_definition_syntax, 'subQuery')){
      statement <- paste0(statement, ' cohort_definition_syntax = (', as.character(cohort_definition_syntax), ')')
    } else {
      statement <- paste0(statement, " cohort_definition_syntax = '", cohort_definition_syntax,"'")
    }
  }
  
  if (!missing(subject_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(subject_concept_id)) {
      statement <- paste0(statement, ' subject_concept_id IS NULL')
    } else if (is(subject_concept_id, 'subQuery')){
      statement <- paste0(statement, ' subject_concept_id = (', as.character(subject_concept_id), ')')
    } else {
      statement <- paste0(statement, " subject_concept_id = '", subject_concept_id,"'")
    }
  }
  
  if (!missing(cohort_instantiation_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cohort_instantiation_date)) {
      statement <- paste0(statement, ' cohort_instantiation_date IS NULL')
    } else if (is(cohort_instantiation_date, 'subQuery')){
      statement <- paste0(statement, ' cohort_instantiation_date = (', as.character(cohort_instantiation_date), ')')
    } else {
      statement <- paste0(statement, " cohort_instantiation_date = '", cohort_instantiation_date,"'")
    }
  }
  
  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status")
  if (exists('testNewExpected', where = globalenv()) && get('testNewExpected'))
  {
    assign('testNewExpected', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    testSql <<- c(testSql, comment)
  }
  testSql <<- c(testSql, statement)
  invisible(statement)
}

expect_no_cohort_attribute <- function(cohort_definition_id, cohort_start_date, cohort_end_date, subject_id, attribute_definition_id, value_as_number, value_as_concept_id) {
  #statement <- paste0("INSERT INTO @cdmDatabaseSchema.test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect cohort_attribute' AS test, CASE WHEN(SELECT COUNT(*) FROM cohort_attribute WHERE")
  statement <- getExpectStatement(domain = "cohort_attribute", table = "cohort_attribute")
  first <- TRUE
  if (!missing(cohort_definition_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cohort_definition_id)) {
      statement <- paste0(statement, ' cohort_definition_id IS NULL')
    } else if (is(cohort_definition_id, 'subQuery')){
      statement <- paste0(statement, ' cohort_definition_id = (', as.character(cohort_definition_id), ')')
    } else {
      statement <- paste0(statement, " cohort_definition_id = '", cohort_definition_id,"'")
    }
  }
  
  if (!missing(cohort_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cohort_start_date)) {
      statement <- paste0(statement, ' cohort_start_date IS NULL')
    } else if (is(cohort_start_date, 'subQuery')){
      statement <- paste0(statement, ' cohort_start_date = (', as.character(cohort_start_date), ')')
    } else {
      statement <- paste0(statement, " cohort_start_date = '", cohort_start_date,"'")
    }
  }
  
  if (!missing(cohort_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cohort_end_date)) {
      statement <- paste0(statement, ' cohort_end_date IS NULL')
    } else if (is(cohort_end_date, 'subQuery')){
      statement <- paste0(statement, ' cohort_end_date = (', as.character(cohort_end_date), ')')
    } else {
      statement <- paste0(statement, " cohort_end_date = '", cohort_end_date,"'")
    }
  }
  
  if (!missing(subject_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(subject_id)) {
      statement <- paste0(statement, ' subject_id IS NULL')
    } else if (is(subject_id, 'subQuery')){
      statement <- paste0(statement, ' subject_id = (', as.character(subject_id), ')')
    } else {
      statement <- paste0(statement, " subject_id = '", subject_id,"'")
    }
  }
  
  if (!missing(attribute_definition_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(attribute_definition_id)) {
      statement <- paste0(statement, ' attribute_definition_id IS NULL')
    } else if (is(attribute_definition_id, 'subQuery')){
      statement <- paste0(statement, ' attribute_definition_id = (', as.character(attribute_definition_id), ')')
    } else {
      statement <- paste0(statement, " attribute_definition_id = '", attribute_definition_id,"'")
    }
  }
  
  if (!missing(value_as_number)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(value_as_number)) {
      statement <- paste0(statement, ' value_as_number IS NULL')
    } else if (is(value_as_number, 'subQuery')){
      statement <- paste0(statement, ' value_as_number = (', as.character(value_as_number), ')')
    } else {
      statement <- paste0(statement, " value_as_number = '", value_as_number,"'")
    }
  }
  
  if (!missing(value_as_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(value_as_concept_id)) {
      statement <- paste0(statement, ' value_as_concept_id IS NULL')
    } else if (is(value_as_concept_id, 'subQuery')){
      statement <- paste0(statement, ' value_as_concept_id = (', as.character(value_as_concept_id), ')')
    } else {
      statement <- paste0(statement, " value_as_concept_id = '", value_as_concept_id,"'")
    }
  }
  
  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status")
  if (exists('testNewExpected', where = globalenv()) && get('testNewExpected'))
  {
    assign('testNewExpected', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    testSql <<- c(testSql, comment)
  }
  testSql <<- c(testSql, statement)
  invisible(statement)
}

expect_no_attribute_definition <- function(attribute_definition_id, attribute_name, attribute_description, attribute_type_concept_id, attribute_syntax) {
  #statement <- paste0("INSERT INTO @cdmDatabaseSchema.test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect attribute_definition' AS test, CASE WHEN(SELECT COUNT(*) FROM attribute_definition WHERE")
  statement <- getExpectStatement(domain = "attribute_definition", table = "attribute_definition")
  first <- TRUE
  if (!missing(attribute_definition_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(attribute_definition_id)) {
      statement <- paste0(statement, ' attribute_definition_id IS NULL')
    } else if (is(attribute_definition_id, 'subQuery')){
      statement <- paste0(statement, ' attribute_definition_id = (', as.character(attribute_definition_id), ')')
    } else {
      statement <- paste0(statement, " attribute_definition_id = '", attribute_definition_id,"'")
    }
  }
  
  if (!missing(attribute_name)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(attribute_name)) {
      statement <- paste0(statement, ' attribute_name IS NULL')
    } else if (is(attribute_name, 'subQuery')){
      statement <- paste0(statement, ' attribute_name = (', as.character(attribute_name), ')')
    } else {
      statement <- paste0(statement, " attribute_name = '", attribute_name,"'")
    }
  }
  
  if (!missing(attribute_description)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(attribute_description)) {
      statement <- paste0(statement, ' attribute_description IS NULL')
    } else if (is(attribute_description, 'subQuery')){
      statement <- paste0(statement, ' attribute_description = (', as.character(attribute_description), ')')
    } else {
      statement <- paste0(statement, " attribute_description = '", attribute_description,"'")
    }
  }
  
  if (!missing(attribute_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(attribute_type_concept_id)) {
      statement <- paste0(statement, ' attribute_type_concept_id IS NULL')
    } else if (is(attribute_type_concept_id, 'subQuery')){
      statement <- paste0(statement, ' attribute_type_concept_id = (', as.character(attribute_type_concept_id), ')')
    } else {
      statement <- paste0(statement, " attribute_type_concept_id = '", attribute_type_concept_id,"'")
    }
  }
  
  if (!missing(attribute_syntax)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(attribute_syntax)) {
      statement <- paste0(statement, ' attribute_syntax IS NULL')
    } else if (is(attribute_syntax, 'subQuery')){
      statement <- paste0(statement, ' attribute_syntax = (', as.character(attribute_syntax), ')')
    } else {
      statement <- paste0(statement, " attribute_syntax = '", attribute_syntax,"'")
    }
  }
  
  statement <- paste0(statement, ") != 0 THEN 'FAIL' ELSE 'PASS' END AS status")
  if (exists('testNewExpected', where = globalenv()) && get('testNewExpected'))
  {
    assign('testNewExpected', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    testSql <<- c(testSql, comment)
  }
  testSql <<- c(testSql, statement)
  invisible(statement)
}

expect_count_measurement <- function(rowCount, measurement_id, person_id, measurement_concept_id, measurement_date, measurement_datetime, measurement_type_concept_id, operator_concept_id, value_as_number, value_as_concept_id, unit_concept_id, range_low, range_high, provider_id, visit_occurrence_id, measurement_source_value, measurement_source_concept_id, unit_source_value, value_source_value) {
  #statement <- paste0("INSERT INTO @cdmDatabaseSchema.test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect measurement' AS test, CASE WHEN(SELECT COUNT(*) from @cdmDatabaseSchema.measurement WHERE")
  statement <- getExpectStatement(domain = "measurement", table = "measurement")
  first <- TRUE
  if (!missing(measurement_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(measurement_id)) {
      statement <- paste0(statement, ' measurement_id IS NULL')
    } else if (is(measurement_id, 'subQuery')){
      statement <- paste0(statement, ' measurement_id = (', as.character(measurement_id), ')')
    } else {
      statement <- paste0(statement, " measurement_id = '", measurement_id,"'")
    }
  }
  
  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, ' person_id IS NULL')
    } else if (is(person_id, 'subQuery')){
      statement <- paste0(statement, ' person_id = (', as.character(person_id), ')')
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }
  
  if (!missing(measurement_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(measurement_concept_id)) {
      statement <- paste0(statement, ' measurement_concept_id IS NULL')
    } else if (is(measurement_concept_id, 'subQuery')){
      statement <- paste0(statement, ' measurement_concept_id = (', as.character(measurement_concept_id), ')')
    } else {
      statement <- paste0(statement, " measurement_concept_id = '", measurement_concept_id,"'")
    }
  }
  
  if (!missing(measurement_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(measurement_date)) {
      statement <- paste0(statement, ' measurement_date IS NULL')
    } else if (is(measurement_date, 'subQuery')){
      statement <- paste0(statement, ' measurement_date = (', as.character(measurement_date), ')')
    } else {
      statement <- paste0(statement, " measurement_date = '", measurement_date,"'")
    }
  }
  
  if (!missing(measurement_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(measurement_datetime)) {
      statement <- paste0(statement, ' measurement_datetime IS NULL')
    } else if (is(measurement_datetime, 'subQuery')){
      statement <- paste0(statement, ' measurement_datetime = (', as.character(measurement_datetime), ')')
    } else {
      statement <- paste0(statement, " measurement_datetime = '", measurement_datetime,"'")
    }
  }
  
  if (!missing(measurement_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(measurement_type_concept_id)) {
      statement <- paste0(statement, ' measurement_type_concept_id IS NULL')
    } else if (is(measurement_type_concept_id, 'subQuery')){
      statement <- paste0(statement, ' measurement_type_concept_id = (', as.character(measurement_type_concept_id), ')')
    } else {
      statement <- paste0(statement, " measurement_type_concept_id = '", measurement_type_concept_id,"'")
    }
  }
  
  if (!missing(operator_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(operator_concept_id)) {
      statement <- paste0(statement, ' operator_concept_id IS NULL')
    } else if (is(operator_concept_id, 'subQuery')){
      statement <- paste0(statement, ' operator_concept_id = (', as.character(operator_concept_id), ')')
    } else {
      statement <- paste0(statement, " operator_concept_id = '", operator_concept_id,"'")
    }
  }
  
  if (!missing(value_as_number)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(value_as_number)) {
      statement <- paste0(statement, ' value_as_number IS NULL')
    } else if (is(value_as_number, 'subQuery')){
      statement <- paste0(statement, ' value_as_number = (', as.character(value_as_number), ')')
    } else {
      statement <- paste0(statement, " value_as_number = '", value_as_number,"'")
    }
  }
  
  if (!missing(value_as_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(value_as_concept_id)) {
      statement <- paste0(statement, ' value_as_concept_id IS NULL')
    } else if (is(value_as_concept_id, 'subQuery')){
      statement <- paste0(statement, ' value_as_concept_id = (', as.character(value_as_concept_id), ')')
    } else {
      statement <- paste0(statement, " value_as_concept_id = '", value_as_concept_id,"'")
    }
  }
  
  if (!missing(unit_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(unit_concept_id)) {
      statement <- paste0(statement, ' unit_concept_id IS NULL')
    } else if (is(unit_concept_id, 'subQuery')){
      statement <- paste0(statement, ' unit_concept_id = (', as.character(unit_concept_id), ')')
    } else {
      statement <- paste0(statement, " unit_concept_id = '", unit_concept_id,"'")
    }
  }
  
  if (!missing(range_low)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(range_low)) {
      statement <- paste0(statement, ' range_low IS NULL')
    } else if (is(range_low, 'subQuery')){
      statement <- paste0(statement, ' range_low = (', as.character(range_low), ')')
    } else {
      statement <- paste0(statement, " range_low = '", range_low,"'")
    }
  }
  
  if (!missing(range_high)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(range_high)) {
      statement <- paste0(statement, ' range_high IS NULL')
    } else if (is(range_high, 'subQuery')){
      statement <- paste0(statement, ' range_high = (', as.character(range_high), ')')
    } else {
      statement <- paste0(statement, " range_high = '", range_high,"'")
    }
  }
  
  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, ' provider_id IS NULL')
    } else if (is(provider_id, 'subQuery')){
      statement <- paste0(statement, ' provider_id = (', as.character(provider_id), ')')
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }
  
  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, ' visit_occurrence_id IS NULL')
    } else if (is(visit_occurrence_id, 'subQuery')){
      statement <- paste0(statement, ' visit_occurrence_id = (', as.character(visit_occurrence_id), ')')
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }
  
  if (!missing(measurement_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(measurement_source_value)) {
      statement <- paste0(statement, ' measurement_source_value IS NULL')
    } else if (is(measurement_source_value, 'subQuery')){
      statement <- paste0(statement, ' measurement_source_value = (', as.character(measurement_source_value), ')')
    } else {
      statement <- paste0(statement, " measurement_source_value = '", measurement_source_value,"'")
    }
  }
  
  if (!missing(measurement_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(measurement_source_concept_id)) {
      statement <- paste0(statement, ' measurement_source_concept_id IS NULL')
    } else if (is(measurement_source_concept_id, 'subQuery')){
      statement <- paste0(statement, ' measurement_source_concept_id = (', as.character(measurement_source_concept_id), ')')
    } else {
      statement <- paste0(statement, " measurement_source_concept_id = '", measurement_source_concept_id,"'")
    }
  }
  
  if (!missing(unit_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(unit_source_value)) {
      statement <- paste0(statement, ' unit_source_value IS NULL')
    } else if (is(unit_source_value, 'subQuery')){
      statement <- paste0(statement, ' unit_source_value = (', as.character(unit_source_value), ')')
    } else {
      statement <- paste0(statement, " unit_source_value = '", unit_source_value,"'")
    }
  }
  
  if (!missing(value_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(value_source_value)) {
      statement <- paste0(statement, ' value_source_value IS NULL')
    } else if (is(value_source_value, 'subQuery')){
      statement <- paste0(statement, ' value_source_value = (', as.character(value_source_value), ')')
    } else {
      statement <- paste0(statement, " value_source_value = '", value_source_value,"'")
    }
  }
  
  statement <- paste0(statement, ') != ', rowCount , " THEN 'FAIL' ELSE 'PASS' END AS status")
  if (exists('testNewExpected', where = globalenv()) && get('testNewExpected'))
  {
    assign('testNewExpected', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    testSql <<- c(testSql, comment)
  }
  testSql <<- c(testSql, statement)
  invisible(statement)
}

expect_count_condition_occurrence <- function(rowCount, condition_occurrence_id, person_id, condition_concept_id, condition_start_date, condition_start_datetime, condition_end_date, condition_end_datetime, condition_type_concept_id, stop_reason, provider_id, visit_occurrence_id, condition_source_value, condition_source_concept_id) {
  #statement <- paste0("INSERT INTO @cdmDatabaseSchema.test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect condition_occurrence' AS test, CASE WHEN(SELECT COUNT(*) from @cdmDatabaseSchema.condition_occurrence WHERE")
  statement <- getExpectStatement(domain = "condition_occurrence", table = "condition_occurrence")
  first <- TRUE
  if (!missing(condition_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(condition_occurrence_id)) {
      statement <- paste0(statement, ' condition_occurrence_id IS NULL')
    } else if (is(condition_occurrence_id, 'subQuery')){
      statement <- paste0(statement, ' condition_occurrence_id = (', as.character(condition_occurrence_id), ')')
    } else {
      statement <- paste0(statement, " condition_occurrence_id = '", condition_occurrence_id,"'")
    }
  }
  
  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, ' person_id IS NULL')
    } else if (is(person_id, 'subQuery')){
      statement <- paste0(statement, ' person_id = (', as.character(person_id), ')')
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }
  
  if (!missing(condition_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(condition_concept_id)) {
      statement <- paste0(statement, ' condition_concept_id IS NULL')
    } else if (is(condition_concept_id, 'subQuery')){
      statement <- paste0(statement, ' condition_concept_id = (', as.character(condition_concept_id), ')')
    } else {
      statement <- paste0(statement, " condition_concept_id = '", condition_concept_id,"'")
    }
  }
  
  if (!missing(condition_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(condition_start_date)) {
      statement <- paste0(statement, ' condition_start_date IS NULL')
    } else if (is(condition_start_date, 'subQuery')){
      statement <- paste0(statement, ' condition_start_date = (', as.character(condition_start_date), ')')
    } else {
      statement <- paste0(statement, " condition_start_date = '", condition_start_date,"'")
    }
  }
  
  if (!missing(condition_start_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(condition_start_datetime)) {
      statement <- paste0(statement, ' condition_start_datetime IS NULL')
    } else if (is(condition_start_datetime, 'subQuery')){
      statement <- paste0(statement, ' condition_start_datetime = (', as.character(condition_start_datetime), ')')
    } else {
      statement <- paste0(statement, " condition_start_datetime = '", condition_start_datetime,"'")
    }
  }
  
  if (!missing(condition_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(condition_end_date)) {
      statement <- paste0(statement, ' condition_end_date IS NULL')
    } else if (is(condition_end_date, 'subQuery')){
      statement <- paste0(statement, ' condition_end_date = (', as.character(condition_end_date), ')')
    } else {
      statement <- paste0(statement, " condition_end_date = '", condition_end_date,"'")
    }
  }
  
  if (!missing(condition_end_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(condition_end_datetime)) {
      statement <- paste0(statement, ' condition_end_datetime IS NULL')
    } else if (is(condition_end_datetime, 'subQuery')){
      statement <- paste0(statement, ' condition_end_datetime = (', as.character(condition_end_datetime), ')')
    } else {
      statement <- paste0(statement, " condition_end_datetime = '", condition_end_datetime,"'")
    }
  }
  
  if (!missing(condition_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(condition_type_concept_id)) {
      statement <- paste0(statement, ' condition_type_concept_id IS NULL')
    } else if (is(condition_type_concept_id, 'subQuery')){
      statement <- paste0(statement, ' condition_type_concept_id = (', as.character(condition_type_concept_id), ')')
    } else {
      statement <- paste0(statement, " condition_type_concept_id = '", condition_type_concept_id,"'")
    }
  }
  
  if (!missing(stop_reason)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(stop_reason)) {
      statement <- paste0(statement, ' stop_reason IS NULL')
    } else if (is(stop_reason, 'subQuery')){
      statement <- paste0(statement, ' stop_reason = (', as.character(stop_reason), ')')
    } else {
      statement <- paste0(statement, " stop_reason = '", stop_reason,"'")
    }
  }
  
  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, ' provider_id IS NULL')
    } else if (is(provider_id, 'subQuery')){
      statement <- paste0(statement, ' provider_id = (', as.character(provider_id), ')')
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }
  
  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, ' visit_occurrence_id IS NULL')
    } else if (is(visit_occurrence_id, 'subQuery')){
      statement <- paste0(statement, ' visit_occurrence_id = (', as.character(visit_occurrence_id), ')')
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }
  
  if (!missing(condition_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(condition_source_value)) {
      statement <- paste0(statement, ' condition_source_value IS NULL')
    } else if (is(condition_source_value, 'subQuery')){
      statement <- paste0(statement, ' condition_source_value = (', as.character(condition_source_value), ')')
    } else {
      statement <- paste0(statement, " condition_source_value = '", condition_source_value,"'")
    }
  }
  
  if (!missing(condition_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(condition_source_concept_id)) {
      statement <- paste0(statement, ' condition_source_concept_id IS NULL')
    } else if (is(condition_source_concept_id, 'subQuery')){
      statement <- paste0(statement, ' condition_source_concept_id = (', as.character(condition_source_concept_id), ')')
    } else {
      statement <- paste0(statement, " condition_source_concept_id = '", condition_source_concept_id,"'")
    }
  }
  
  statement <- paste0(statement, ') != ', rowCount , " THEN 'FAIL' ELSE 'PASS' END AS status")
  if (exists('testNewExpected', where = globalenv()) && get('testNewExpected'))
  {
    assign('testNewExpected', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    testSql <<- c(testSql, comment)
  }
  testSql <<- c(testSql, statement)
  invisible(statement)
}

expect_count_location <- function(rowCount, location_id, address_1, address_2, city, state, zip, county, location_source_value) {
  #statement <- paste0("INSERT INTO @cdmDatabaseSchema.test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect location' AS test, CASE WHEN(SELECT COUNT(*) from @cdmDatabaseSchema.location WHERE")
  statement <- getExpectStatement(domain = "location", table = "location")
  first <- TRUE
  if (!missing(location_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(location_id)) {
      statement <- paste0(statement, ' location_id IS NULL')
    } else if (is(location_id, 'subQuery')){
      statement <- paste0(statement, ' location_id = (', as.character(location_id), ')')
    } else {
      statement <- paste0(statement, " location_id = '", location_id,"'")
    }
  }
  
  if (!missing(address_1)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(address_1)) {
      statement <- paste0(statement, ' address_1 IS NULL')
    } else if (is(address_1, 'subQuery')){
      statement <- paste0(statement, ' address_1 = (', as.character(address_1), ')')
    } else {
      statement <- paste0(statement, " address_1 = '", address_1,"'")
    }
  }
  
  if (!missing(address_2)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(address_2)) {
      statement <- paste0(statement, ' address_2 IS NULL')
    } else if (is(address_2, 'subQuery')){
      statement <- paste0(statement, ' address_2 = (', as.character(address_2), ')')
    } else {
      statement <- paste0(statement, " address_2 = '", address_2,"'")
    }
  }
  
  if (!missing(city)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(city)) {
      statement <- paste0(statement, ' city IS NULL')
    } else if (is(city, 'subQuery')){
      statement <- paste0(statement, ' city = (', as.character(city), ')')
    } else {
      statement <- paste0(statement, " city = '", city,"'")
    }
  }
  
  if (!missing(state)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(state)) {
      statement <- paste0(statement, ' state IS NULL')
    } else if (is(state, 'subQuery')){
      statement <- paste0(statement, ' state = (', as.character(state), ')')
    } else {
      statement <- paste0(statement, " state = '", state,"'")
    }
  }
  
  if (!missing(zip)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(zip)) {
      statement <- paste0(statement, ' zip IS NULL')
    } else if (is(zip, 'subQuery')){
      statement <- paste0(statement, ' zip = (', as.character(zip), ')')
    } else {
      statement <- paste0(statement, " zip = '", zip,"'")
    }
  }
  
  if (!missing(county)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(county)) {
      statement <- paste0(statement, ' county IS NULL')
    } else if (is(county, 'subQuery')){
      statement <- paste0(statement, ' county = (', as.character(county), ')')
    } else {
      statement <- paste0(statement, " county = '", county,"'")
    }
  }
  
  if (!missing(location_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(location_source_value)) {
      statement <- paste0(statement, ' location_source_value IS NULL')
    } else if (is(location_source_value, 'subQuery')){
      statement <- paste0(statement, ' location_source_value = (', as.character(location_source_value), ')')
    } else {
      statement <- paste0(statement, " location_source_value = '", location_source_value,"'")
    }
  }
  
  statement <- paste0(statement, ') != ', rowCount , " THEN 'FAIL' ELSE 'PASS' END AS status")
  if (exists('testNewExpected', where = globalenv()) && get('testNewExpected'))
  {
    assign('testNewExpected', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    testSql <<- c(testSql, comment)
  }
  testSql <<- c(testSql, statement)
  invisible(statement)
}

expect_count_person <- function(rowCount, person_id, person_source_value, gender_concept_id, gender_source_value, year_of_birth, month_of_birth, day_of_birth, race_concept_id, ethnicity_concept_id, birth_datetime, location_id, provider_id, care_site_id, gender_source_concept_id, race_source_value, race_source_concept_id, ethnicity_source_value, ethnicity_source_concept_id) {
  #statement <- paste0("INSERT INTO @cdmDatabaseSchema.test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect person' AS test, CASE WHEN(SELECT COUNT(*) from @cdmDatabaseSchema.person WHERE")
  statement <- getExpectStatement(domain = "person", table = "person")
  first <- TRUE
  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, ' person_id IS NULL')
    } else if (is(person_id, 'subQuery')){
      statement <- paste0(statement, ' person_id = (', as.character(person_id), ')')
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }
  
  if (!missing(person_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(person_source_value)) {
      statement <- paste0(statement, ' person_source_value IS NULL')
    } else if (is(person_source_value, 'subQuery')){
      statement <- paste0(statement, ' person_source_value = (', as.character(person_source_value), ')')
    } else {
      statement <- paste0(statement, " person_source_value = '", person_source_value,"'")
    }
  }
  
  if (!missing(gender_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(gender_concept_id)) {
      statement <- paste0(statement, ' gender_concept_id IS NULL')
    } else if (is(gender_concept_id, 'subQuery')){
      statement <- paste0(statement, ' gender_concept_id = (', as.character(gender_concept_id), ')')
    } else {
      statement <- paste0(statement, " gender_concept_id = '", gender_concept_id,"'")
    }
  }
  
  if (!missing(gender_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(gender_source_value)) {
      statement <- paste0(statement, ' gender_source_value IS NULL')
    } else if (is(gender_source_value, 'subQuery')){
      statement <- paste0(statement, ' gender_source_value = (', as.character(gender_source_value), ')')
    } else {
      statement <- paste0(statement, " gender_source_value = '", gender_source_value,"'")
    }
  }
  
  if (!missing(year_of_birth)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(year_of_birth)) {
      statement <- paste0(statement, ' year_of_birth IS NULL')
    } else if (is(year_of_birth, 'subQuery')){
      statement <- paste0(statement, ' year_of_birth = (', as.character(year_of_birth), ')')
    } else {
      statement <- paste0(statement, " year_of_birth = '", year_of_birth,"'")
    }
  }
  
  if (!missing(month_of_birth)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(month_of_birth)) {
      statement <- paste0(statement, ' month_of_birth IS NULL')
    } else if (is(month_of_birth, 'subQuery')){
      statement <- paste0(statement, ' month_of_birth = (', as.character(month_of_birth), ')')
    } else {
      statement <- paste0(statement, " month_of_birth = '", month_of_birth,"'")
    }
  }
  
  if (!missing(day_of_birth)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(day_of_birth)) {
      statement <- paste0(statement, ' day_of_birth IS NULL')
    } else if (is(day_of_birth, 'subQuery')){
      statement <- paste0(statement, ' day_of_birth = (', as.character(day_of_birth), ')')
    } else {
      statement <- paste0(statement, " day_of_birth = '", day_of_birth,"'")
    }
  }
  
  if (!missing(race_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(race_concept_id)) {
      statement <- paste0(statement, ' race_concept_id IS NULL')
    } else if (is(race_concept_id, 'subQuery')){
      statement <- paste0(statement, ' race_concept_id = (', as.character(race_concept_id), ')')
    } else {
      statement <- paste0(statement, " race_concept_id = '", race_concept_id,"'")
    }
  }
  
  if (!missing(ethnicity_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(ethnicity_concept_id)) {
      statement <- paste0(statement, ' ethnicity_concept_id IS NULL')
    } else if (is(ethnicity_concept_id, 'subQuery')){
      statement <- paste0(statement, ' ethnicity_concept_id = (', as.character(ethnicity_concept_id), ')')
    } else {
      statement <- paste0(statement, " ethnicity_concept_id = '", ethnicity_concept_id,"'")
    }
  }
  
  if (!missing(birth_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(birth_datetime)) {
      statement <- paste0(statement, ' birth_datetime IS NULL')
    } else if (is(birth_datetime, 'subQuery')){
      statement <- paste0(statement, ' birth_datetime = (', as.character(birth_datetime), ')')
    } else {
      statement <- paste0(statement, " birth_datetime = '", birth_datetime,"'")
    }
  }
  
  if (!missing(location_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(location_id)) {
      statement <- paste0(statement, ' location_id IS NULL')
    } else if (is(location_id, 'subQuery')){
      statement <- paste0(statement, ' location_id = (', as.character(location_id), ')')
    } else {
      statement <- paste0(statement, " location_id = '", location_id,"'")
    }
  }
  
  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, ' provider_id IS NULL')
    } else if (is(provider_id, 'subQuery')){
      statement <- paste0(statement, ' provider_id = (', as.character(provider_id), ')')
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }
  
  if (!missing(care_site_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(care_site_id)) {
      statement <- paste0(statement, ' care_site_id IS NULL')
    } else if (is(care_site_id, 'subQuery')){
      statement <- paste0(statement, ' care_site_id = (', as.character(care_site_id), ')')
    } else {
      statement <- paste0(statement, " care_site_id = '", care_site_id,"'")
    }
  }
  
  if (!missing(gender_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(gender_source_concept_id)) {
      statement <- paste0(statement, ' gender_source_concept_id IS NULL')
    } else if (is(gender_source_concept_id, 'subQuery')){
      statement <- paste0(statement, ' gender_source_concept_id = (', as.character(gender_source_concept_id), ')')
    } else {
      statement <- paste0(statement, " gender_source_concept_id = '", gender_source_concept_id,"'")
    }
  }
  
  if (!missing(race_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(race_source_value)) {
      statement <- paste0(statement, ' race_source_value IS NULL')
    } else if (is(race_source_value, 'subQuery')){
      statement <- paste0(statement, ' race_source_value = (', as.character(race_source_value), ')')
    } else {
      statement <- paste0(statement, " race_source_value = '", race_source_value,"'")
    }
  }
  
  if (!missing(race_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(race_source_concept_id)) {
      statement <- paste0(statement, ' race_source_concept_id IS NULL')
    } else if (is(race_source_concept_id, 'subQuery')){
      statement <- paste0(statement, ' race_source_concept_id = (', as.character(race_source_concept_id), ')')
    } else {
      statement <- paste0(statement, " race_source_concept_id = '", race_source_concept_id,"'")
    }
  }
  
  if (!missing(ethnicity_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(ethnicity_source_value)) {
      statement <- paste0(statement, ' ethnicity_source_value IS NULL')
    } else if (is(ethnicity_source_value, 'subQuery')){
      statement <- paste0(statement, ' ethnicity_source_value = (', as.character(ethnicity_source_value), ')')
    } else {
      statement <- paste0(statement, " ethnicity_source_value = '", ethnicity_source_value,"'")
    }
  }
  
  if (!missing(ethnicity_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(ethnicity_source_concept_id)) {
      statement <- paste0(statement, ' ethnicity_source_concept_id IS NULL')
    } else if (is(ethnicity_source_concept_id, 'subQuery')){
      statement <- paste0(statement, ' ethnicity_source_concept_id = (', as.character(ethnicity_source_concept_id), ')')
    } else {
      statement <- paste0(statement, " ethnicity_source_concept_id = '", ethnicity_source_concept_id,"'")
    }
  }
  
  statement <- paste0(statement, ') != ', rowCount , " THEN 'FAIL' ELSE 'PASS' END AS status")
  if (exists('testNewExpected', where = globalenv()) && get('testNewExpected'))
  {
    assign('testNewExpected', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    testSql <<- c(testSql, comment)
  }
  testSql <<- c(testSql, statement)
  invisible(statement)
}

expect_count_payer_plan_period <- function(rowCount, payer_plan_period_id, person_id, payer_plan_period_start_date, payer_plan_period_end_date, payer_source_value, plan_source_value, family_source_value) {
  #statement <- paste0("INSERT INTO @cdmDatabaseSchema.test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect payer_plan_period' AS test, CASE WHEN(SELECT COUNT(*) from @cdmDatabaseSchema.payer_plan_period WHERE")
  statement <- getExpectStatement(domain = "payer_plan_period", table = "payer_plan_period")
  first <- TRUE
  if (!missing(payer_plan_period_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(payer_plan_period_id)) {
      statement <- paste0(statement, ' payer_plan_period_id IS NULL')
    } else if (is(payer_plan_period_id, 'subQuery')){
      statement <- paste0(statement, ' payer_plan_period_id = (', as.character(payer_plan_period_id), ')')
    } else {
      statement <- paste0(statement, " payer_plan_period_id = '", payer_plan_period_id,"'")
    }
  }
  
  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, ' person_id IS NULL')
    } else if (is(person_id, 'subQuery')){
      statement <- paste0(statement, ' person_id = (', as.character(person_id), ')')
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }
  
  if (!missing(payer_plan_period_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(payer_plan_period_start_date)) {
      statement <- paste0(statement, ' payer_plan_period_start_date IS NULL')
    } else if (is(payer_plan_period_start_date, 'subQuery')){
      statement <- paste0(statement, ' payer_plan_period_start_date = (', as.character(payer_plan_period_start_date), ')')
    } else {
      statement <- paste0(statement, " payer_plan_period_start_date = '", payer_plan_period_start_date,"'")
    }
  }
  
  if (!missing(payer_plan_period_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(payer_plan_period_end_date)) {
      statement <- paste0(statement, ' payer_plan_period_end_date IS NULL')
    } else if (is(payer_plan_period_end_date, 'subQuery')){
      statement <- paste0(statement, ' payer_plan_period_end_date = (', as.character(payer_plan_period_end_date), ')')
    } else {
      statement <- paste0(statement, " payer_plan_period_end_date = '", payer_plan_period_end_date,"'")
    }
  }
  
  if (!missing(payer_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(payer_source_value)) {
      statement <- paste0(statement, ' payer_source_value IS NULL')
    } else if (is(payer_source_value, 'subQuery')){
      statement <- paste0(statement, ' payer_source_value = (', as.character(payer_source_value), ')')
    } else {
      statement <- paste0(statement, " payer_source_value = '", payer_source_value,"'")
    }
  }
  
  if (!missing(plan_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(plan_source_value)) {
      statement <- paste0(statement, ' plan_source_value IS NULL')
    } else if (is(plan_source_value, 'subQuery')){
      statement <- paste0(statement, ' plan_source_value = (', as.character(plan_source_value), ')')
    } else {
      statement <- paste0(statement, " plan_source_value = '", plan_source_value,"'")
    }
  }
  
  if (!missing(family_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(family_source_value)) {
      statement <- paste0(statement, ' family_source_value IS NULL')
    } else if (is(family_source_value, 'subQuery')){
      statement <- paste0(statement, ' family_source_value = (', as.character(family_source_value), ')')
    } else {
      statement <- paste0(statement, " family_source_value = '", family_source_value,"'")
    }
  }
  
  statement <- paste0(statement, ') != ', rowCount , " THEN 'FAIL' ELSE 'PASS' END AS status")
  if (exists('testNewExpected', where = globalenv()) && get('testNewExpected'))
  {
    assign('testNewExpected', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    testSql <<- c(testSql, comment)
  }
  testSql <<- c(testSql, statement)
  invisible(statement)
}

expect_count_cost <- function(rowCount, cost_id, cost_event_id, cost_domain_id, cost_type_concept_id, currency_concept_id, total_charge, total_cost, total_paid, paid_by_payer, paid_by_patient, paid_patient_copay, paid_patient_coinsurance, paid_patient_deductible, paid_by_primary, paid_ingredient_cost, paid_dispensing_fee, payer_plan_period_id, amount_allowed, revenue_code_concept_id, revenue_code_source_value) {
  #statement <- paste0("INSERT INTO @cdmDatabaseSchema.test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect cost' AS test, CASE WHEN(SELECT COUNT(*) from @cdmDatabaseSchema.cost WHERE")
  statement <- getExpectStatement(domain = "cost", table = "cost")
  first <- TRUE
  if (!missing(cost_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cost_id)) {
      statement <- paste0(statement, ' cost_id IS NULL')
    } else if (is(cost_id, 'subQuery')){
      statement <- paste0(statement, ' cost_id = (', as.character(cost_id), ')')
    } else {
      statement <- paste0(statement, " cost_id = '", cost_id,"'")
    }
  }
  
  if (!missing(cost_event_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cost_event_id)) {
      statement <- paste0(statement, ' cost_event_id IS NULL')
    } else if (is(cost_event_id, 'subQuery')){
      statement <- paste0(statement, ' cost_event_id = (', as.character(cost_event_id), ')')
    } else {
      statement <- paste0(statement, " cost_event_id = '", cost_event_id,"'")
    }
  }
  
  if (!missing(cost_domain_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cost_domain_id)) {
      statement <- paste0(statement, ' cost_domain_id IS NULL')
    } else if (is(cost_domain_id, 'subQuery')){
      statement <- paste0(statement, ' cost_domain_id = (', as.character(cost_domain_id), ')')
    } else {
      statement <- paste0(statement, " cost_domain_id = '", cost_domain_id,"'")
    }
  }
  
  if (!missing(cost_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cost_type_concept_id)) {
      statement <- paste0(statement, ' cost_type_concept_id IS NULL')
    } else if (is(cost_type_concept_id, 'subQuery')){
      statement <- paste0(statement, ' cost_type_concept_id = (', as.character(cost_type_concept_id), ')')
    } else {
      statement <- paste0(statement, " cost_type_concept_id = '", cost_type_concept_id,"'")
    }
  }
  
  if (!missing(currency_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(currency_concept_id)) {
      statement <- paste0(statement, ' currency_concept_id IS NULL')
    } else if (is(currency_concept_id, 'subQuery')){
      statement <- paste0(statement, ' currency_concept_id = (', as.character(currency_concept_id), ')')
    } else {
      statement <- paste0(statement, " currency_concept_id = '", currency_concept_id,"'")
    }
  }
  
  if (!missing(total_charge)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(total_charge)) {
      statement <- paste0(statement, ' total_charge IS NULL')
    } else if (is(total_charge, 'subQuery')){
      statement <- paste0(statement, ' total_charge = (', as.character(total_charge), ')')
    } else {
      statement <- paste0(statement, " total_charge = '", total_charge,"'")
    }
  }
  
  if (!missing(total_cost)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(total_cost)) {
      statement <- paste0(statement, ' total_cost IS NULL')
    } else if (is(total_cost, 'subQuery')){
      statement <- paste0(statement, ' total_cost = (', as.character(total_cost), ')')
    } else {
      statement <- paste0(statement, " total_cost = '", total_cost,"'")
    }
  }
  
  if (!missing(total_paid)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(total_paid)) {
      statement <- paste0(statement, ' total_paid IS NULL')
    } else if (is(total_paid, 'subQuery')){
      statement <- paste0(statement, ' total_paid = (', as.character(total_paid), ')')
    } else {
      statement <- paste0(statement, " total_paid = '", total_paid,"'")
    }
  }
  
  if (!missing(paid_by_payer)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(paid_by_payer)) {
      statement <- paste0(statement, ' paid_by_payer IS NULL')
    } else if (is(paid_by_payer, 'subQuery')){
      statement <- paste0(statement, ' paid_by_payer = (', as.character(paid_by_payer), ')')
    } else {
      statement <- paste0(statement, " paid_by_payer = '", paid_by_payer,"'")
    }
  }
  
  if (!missing(paid_by_patient)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(paid_by_patient)) {
      statement <- paste0(statement, ' paid_by_patient IS NULL')
    } else if (is(paid_by_patient, 'subQuery')){
      statement <- paste0(statement, ' paid_by_patient = (', as.character(paid_by_patient), ')')
    } else {
      statement <- paste0(statement, " paid_by_patient = '", paid_by_patient,"'")
    }
  }
  
  if (!missing(paid_patient_copay)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(paid_patient_copay)) {
      statement <- paste0(statement, ' paid_patient_copay IS NULL')
    } else if (is(paid_patient_copay, 'subQuery')){
      statement <- paste0(statement, ' paid_patient_copay = (', as.character(paid_patient_copay), ')')
    } else {
      statement <- paste0(statement, " paid_patient_copay = '", paid_patient_copay,"'")
    }
  }
  
  if (!missing(paid_patient_coinsurance)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(paid_patient_coinsurance)) {
      statement <- paste0(statement, ' paid_patient_coinsurance IS NULL')
    } else if (is(paid_patient_coinsurance, 'subQuery')){
      statement <- paste0(statement, ' paid_patient_coinsurance = (', as.character(paid_patient_coinsurance), ')')
    } else {
      statement <- paste0(statement, " paid_patient_coinsurance = '", paid_patient_coinsurance,"'")
    }
  }
  
  if (!missing(paid_patient_deductible)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(paid_patient_deductible)) {
      statement <- paste0(statement, ' paid_patient_deductible IS NULL')
    } else if (is(paid_patient_deductible, 'subQuery')){
      statement <- paste0(statement, ' paid_patient_deductible = (', as.character(paid_patient_deductible), ')')
    } else {
      statement <- paste0(statement, " paid_patient_deductible = '", paid_patient_deductible,"'")
    }
  }
  
  if (!missing(paid_by_primary)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(paid_by_primary)) {
      statement <- paste0(statement, ' paid_by_primary IS NULL')
    } else if (is(paid_by_primary, 'subQuery')){
      statement <- paste0(statement, ' paid_by_primary = (', as.character(paid_by_primary), ')')
    } else {
      statement <- paste0(statement, " paid_by_primary = '", paid_by_primary,"'")
    }
  }
  
  if (!missing(paid_ingredient_cost)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(paid_ingredient_cost)) {
      statement <- paste0(statement, ' paid_ingredient_cost IS NULL')
    } else if (is(paid_ingredient_cost, 'subQuery')){
      statement <- paste0(statement, ' paid_ingredient_cost = (', as.character(paid_ingredient_cost), ')')
    } else {
      statement <- paste0(statement, " paid_ingredient_cost = '", paid_ingredient_cost,"'")
    }
  }
  
  if (!missing(paid_dispensing_fee)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(paid_dispensing_fee)) {
      statement <- paste0(statement, ' paid_dispensing_fee IS NULL')
    } else if (is(paid_dispensing_fee, 'subQuery')){
      statement <- paste0(statement, ' paid_dispensing_fee = (', as.character(paid_dispensing_fee), ')')
    } else {
      statement <- paste0(statement, " paid_dispensing_fee = '", paid_dispensing_fee,"'")
    }
  }
  
  if (!missing(payer_plan_period_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(payer_plan_period_id)) {
      statement <- paste0(statement, ' payer_plan_period_id IS NULL')
    } else if (is(payer_plan_period_id, 'subQuery')){
      statement <- paste0(statement, ' payer_plan_period_id = (', as.character(payer_plan_period_id), ')')
    } else {
      statement <- paste0(statement, " payer_plan_period_id = '", payer_plan_period_id,"'")
    }
  }
  
  if (!missing(amount_allowed)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(amount_allowed)) {
      statement <- paste0(statement, ' amount_allowed IS NULL')
    } else if (is(amount_allowed, 'subQuery')){
      statement <- paste0(statement, ' amount_allowed = (', as.character(amount_allowed), ')')
    } else {
      statement <- paste0(statement, " amount_allowed = '", amount_allowed,"'")
    }
  }
  
  if (!missing(revenue_code_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(revenue_code_concept_id)) {
      statement <- paste0(statement, ' revenue_code_concept_id IS NULL')
    } else if (is(revenue_code_concept_id, 'subQuery')){
      statement <- paste0(statement, ' revenue_code_concept_id = (', as.character(revenue_code_concept_id), ')')
    } else {
      statement <- paste0(statement, " revenue_code_concept_id = '", revenue_code_concept_id,"'")
    }
  }
  
  if (!missing(revenue_code_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(revenue_code_source_value)) {
      statement <- paste0(statement, ' revenue_code_source_value IS NULL')
    } else if (is(revenue_code_source_value, 'subQuery')){
      statement <- paste0(statement, ' revenue_code_source_value = (', as.character(revenue_code_source_value), ')')
    } else {
      statement <- paste0(statement, " revenue_code_source_value = '", revenue_code_source_value,"'")
    }
  }
  
  statement <- paste0(statement, ') != ', rowCount , " THEN 'FAIL' ELSE 'PASS' END AS status")
  if (exists('testNewExpected', where = globalenv()) && get('testNewExpected'))
  {
    assign('testNewExpected', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    testSql <<- c(testSql, comment)
  }
  testSql <<- c(testSql, statement)
  invisible(statement)
}

expect_count_observation_period <- function(rowCount, observation_period_id, person_id, observation_period_start_date, observation_period_start_datetime, observation_period_end_date, observation_period_end_datetime, period_type_concept_id) {
  #statement <- paste0("INSERT INTO @cdmDatabaseSchema.test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect observation_period' AS test, CASE WHEN(SELECT COUNT(*) from @cdmDatabaseSchema.observation_period WHERE")
  statement <- getExpectStatement(domain = "observation_period", table = "observation_period")
  first <- TRUE
  if (!missing(observation_period_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(observation_period_id)) {
      statement <- paste0(statement, ' observation_period_id IS NULL')
    } else if (is(observation_period_id, 'subQuery')){
      statement <- paste0(statement, ' observation_period_id = (', as.character(observation_period_id), ')')
    } else {
      statement <- paste0(statement, " observation_period_id = '", observation_period_id,"'")
    }
  }
  
  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, ' person_id IS NULL')
    } else if (is(person_id, 'subQuery')){
      statement <- paste0(statement, ' person_id = (', as.character(person_id), ')')
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }
  
  if (!missing(observation_period_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(observation_period_start_date)) {
      statement <- paste0(statement, ' observation_period_start_date IS NULL')
    } else if (is(observation_period_start_date, 'subQuery')){
      statement <- paste0(statement, ' observation_period_start_date = (', as.character(observation_period_start_date), ')')
    } else {
      statement <- paste0(statement, " observation_period_start_date = '", observation_period_start_date,"'")
    }
  }
  
  if (!missing(observation_period_start_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(observation_period_start_datetime)) {
      statement <- paste0(statement, ' observation_period_start_datetime IS NULL')
    } else if (is(observation_period_start_datetime, 'subQuery')){
      statement <- paste0(statement, ' observation_period_start_datetime = (', as.character(observation_period_start_datetime), ')')
    } else {
      statement <- paste0(statement, " observation_period_start_datetime = '", observation_period_start_datetime,"'")
    }
  }
  
  if (!missing(observation_period_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(observation_period_end_date)) {
      statement <- paste0(statement, ' observation_period_end_date IS NULL')
    } else if (is(observation_period_end_date, 'subQuery')){
      statement <- paste0(statement, ' observation_period_end_date = (', as.character(observation_period_end_date), ')')
    } else {
      statement <- paste0(statement, " observation_period_end_date = '", observation_period_end_date,"'")
    }
  }
  
  if (!missing(observation_period_end_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(observation_period_end_datetime)) {
      statement <- paste0(statement, ' observation_period_end_datetime IS NULL')
    } else if (is(observation_period_end_datetime, 'subQuery')){
      statement <- paste0(statement, ' observation_period_end_datetime = (', as.character(observation_period_end_datetime), ')')
    } else {
      statement <- paste0(statement, " observation_period_end_datetime = '", observation_period_end_datetime,"'")
    }
  }
  
  if (!missing(period_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(period_type_concept_id)) {
      statement <- paste0(statement, ' period_type_concept_id IS NULL')
    } else if (is(period_type_concept_id, 'subQuery')){
      statement <- paste0(statement, ' period_type_concept_id = (', as.character(period_type_concept_id), ')')
    } else {
      statement <- paste0(statement, " period_type_concept_id = '", period_type_concept_id,"'")
    }
  }
  
  statement <- paste0(statement, ') != ', rowCount , " THEN 'FAIL' ELSE 'PASS' END AS status")
  if (exists('testNewExpected', where = globalenv()) && get('testNewExpected'))
  {
    assign('testNewExpected', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    testSql <<- c(testSql, comment)
  }
  testSql <<- c(testSql, statement)
  invisible(statement)
}

expect_count_care_site <- function(rowCount, care_site_id, care_site_name, place_of_service_concept_id, location_id, care_site_source_value, place_of_service_source_value) {
  #statement <- paste0("INSERT INTO @cdmDatabaseSchema.test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect care_site' AS test, CASE WHEN(SELECT COUNT(*) from @cdmDatabaseSchema.care_site WHERE")
  statement <- getExpectStatement(domain = "care_site", table = "care_site")
  first <- TRUE
  if (!missing(care_site_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(care_site_id)) {
      statement <- paste0(statement, ' care_site_id IS NULL')
    } else if (is(care_site_id, 'subQuery')){
      statement <- paste0(statement, ' care_site_id = (', as.character(care_site_id), ')')
    } else {
      statement <- paste0(statement, " care_site_id = '", care_site_id,"'")
    }
  }
  
  if (!missing(care_site_name)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(care_site_name)) {
      statement <- paste0(statement, ' care_site_name IS NULL')
    } else if (is(care_site_name, 'subQuery')){
      statement <- paste0(statement, ' care_site_name = (', as.character(care_site_name), ')')
    } else {
      statement <- paste0(statement, " care_site_name = '", care_site_name,"'")
    }
  }
  
  if (!missing(place_of_service_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(place_of_service_concept_id)) {
      statement <- paste0(statement, ' place_of_service_concept_id IS NULL')
    } else if (is(place_of_service_concept_id, 'subQuery')){
      statement <- paste0(statement, ' place_of_service_concept_id = (', as.character(place_of_service_concept_id), ')')
    } else {
      statement <- paste0(statement, " place_of_service_concept_id = '", place_of_service_concept_id,"'")
    }
  }
  
  if (!missing(location_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(location_id)) {
      statement <- paste0(statement, ' location_id IS NULL')
    } else if (is(location_id, 'subQuery')){
      statement <- paste0(statement, ' location_id = (', as.character(location_id), ')')
    } else {
      statement <- paste0(statement, " location_id = '", location_id,"'")
    }
  }
  
  if (!missing(care_site_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(care_site_source_value)) {
      statement <- paste0(statement, ' care_site_source_value IS NULL')
    } else if (is(care_site_source_value, 'subQuery')){
      statement <- paste0(statement, ' care_site_source_value = (', as.character(care_site_source_value), ')')
    } else {
      statement <- paste0(statement, " care_site_source_value = '", care_site_source_value,"'")
    }
  }
  
  if (!missing(place_of_service_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(place_of_service_source_value)) {
      statement <- paste0(statement, ' place_of_service_source_value IS NULL')
    } else if (is(place_of_service_source_value, 'subQuery')){
      statement <- paste0(statement, ' place_of_service_source_value = (', as.character(place_of_service_source_value), ')')
    } else {
      statement <- paste0(statement, " place_of_service_source_value = '", place_of_service_source_value,"'")
    }
  }
  
  statement <- paste0(statement, ') != ', rowCount , " THEN 'FAIL' ELSE 'PASS' END AS status")
  if (exists('testNewExpected', where = globalenv()) && get('testNewExpected'))
  {
    assign('testNewExpected', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    testSql <<- c(testSql, comment)
  }
  testSql <<- c(testSql, statement)
  invisible(statement)
}

expect_count_visit_occurrence <- function(rowCount, visit_occurrence_id, person_id, visit_concept_id, visit_start_date, visit_start_datetime, visit_end_date, visit_end_datetime, visit_type_concept_id, provider_id, care_site_id, visit_source_value, visit_source_concept_id) {
  #statement <- paste0("INSERT INTO @cdmDatabaseSchema.test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect visit_occurrence' AS test, CASE WHEN(SELECT COUNT(*) from @cdmDatabaseSchema.visit_occurrence WHERE")
  statement <- getExpectStatement(domain = "visit_occurrence", table = "visit_occurrence")
  first <- TRUE
  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, ' visit_occurrence_id IS NULL')
    } else if (is(visit_occurrence_id, 'subQuery')){
      statement <- paste0(statement, ' visit_occurrence_id = (', as.character(visit_occurrence_id), ')')
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }
  
  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, ' person_id IS NULL')
    } else if (is(person_id, 'subQuery')){
      statement <- paste0(statement, ' person_id = (', as.character(person_id), ')')
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }
  
  if (!missing(visit_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(visit_concept_id)) {
      statement <- paste0(statement, ' visit_concept_id IS NULL')
    } else if (is(visit_concept_id, 'subQuery')){
      statement <- paste0(statement, ' visit_concept_id = (', as.character(visit_concept_id), ')')
    } else {
      statement <- paste0(statement, " visit_concept_id = '", visit_concept_id,"'")
    }
  }
  
  if (!missing(visit_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(visit_start_date)) {
      statement <- paste0(statement, ' visit_start_date IS NULL')
    } else if (is(visit_start_date, 'subQuery')){
      statement <- paste0(statement, ' visit_start_date = (', as.character(visit_start_date), ')')
    } else {
      statement <- paste0(statement, " visit_start_date = '", visit_start_date,"'")
    }
  }
  
  if (!missing(visit_start_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(visit_start_datetime)) {
      statement <- paste0(statement, ' visit_start_datetime IS NULL')
    } else if (is(visit_start_datetime, 'subQuery')){
      statement <- paste0(statement, ' visit_start_datetime = (', as.character(visit_start_datetime), ')')
    } else {
      statement <- paste0(statement, " visit_start_datetime = '", visit_start_datetime,"'")
    }
  }
  
  if (!missing(visit_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(visit_end_date)) {
      statement <- paste0(statement, ' visit_end_date IS NULL')
    } else if (is(visit_end_date, 'subQuery')){
      statement <- paste0(statement, ' visit_end_date = (', as.character(visit_end_date), ')')
    } else {
      statement <- paste0(statement, " visit_end_date = '", visit_end_date,"'")
    }
  }
  
  if (!missing(visit_end_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(visit_end_datetime)) {
      statement <- paste0(statement, ' visit_end_datetime IS NULL')
    } else if (is(visit_end_datetime, 'subQuery')){
      statement <- paste0(statement, ' visit_end_datetime = (', as.character(visit_end_datetime), ')')
    } else {
      statement <- paste0(statement, " visit_end_datetime = '", visit_end_datetime,"'")
    }
  }
  
  if (!missing(visit_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(visit_type_concept_id)) {
      statement <- paste0(statement, ' visit_type_concept_id IS NULL')
    } else if (is(visit_type_concept_id, 'subQuery')){
      statement <- paste0(statement, ' visit_type_concept_id = (', as.character(visit_type_concept_id), ')')
    } else {
      statement <- paste0(statement, " visit_type_concept_id = '", visit_type_concept_id,"'")
    }
  }
  
  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, ' provider_id IS NULL')
    } else if (is(provider_id, 'subQuery')){
      statement <- paste0(statement, ' provider_id = (', as.character(provider_id), ')')
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }
  
  if (!missing(care_site_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(care_site_id)) {
      statement <- paste0(statement, ' care_site_id IS NULL')
    } else if (is(care_site_id, 'subQuery')){
      statement <- paste0(statement, ' care_site_id = (', as.character(care_site_id), ')')
    } else {
      statement <- paste0(statement, " care_site_id = '", care_site_id,"'")
    }
  }
  
  if (!missing(visit_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(visit_source_value)) {
      statement <- paste0(statement, ' visit_source_value IS NULL')
    } else if (is(visit_source_value, 'subQuery')){
      statement <- paste0(statement, ' visit_source_value = (', as.character(visit_source_value), ')')
    } else {
      statement <- paste0(statement, " visit_source_value = '", visit_source_value,"'")
    }
  }
  
  if (!missing(visit_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(visit_source_concept_id)) {
      statement <- paste0(statement, ' visit_source_concept_id IS NULL')
    } else if (is(visit_source_concept_id, 'subQuery')){
      statement <- paste0(statement, ' visit_source_concept_id = (', as.character(visit_source_concept_id), ')')
    } else {
      statement <- paste0(statement, " visit_source_concept_id = '", visit_source_concept_id,"'")
    }
  }
  
  statement <- paste0(statement, ') != ', rowCount , " THEN 'FAIL' ELSE 'PASS' END AS status")
  if (exists('testNewExpected', where = globalenv()) && get('testNewExpected'))
  {
    assign('testNewExpected', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    testSql <<- c(testSql, comment)
  }
  testSql <<- c(testSql, statement)
  invisible(statement)
}

expect_count_provider <- function(rowCount, provider_id, npi, dea, specialty_concept_id, provider_name, care_site_id, year_of_birth, gender_concept_id, provider_source_value, specialty_source_value, specialty_source_concept_id, gender_source_value, gender_source_concept_id) {
  #statement <- paste0("INSERT INTO @cdmDatabaseSchema.test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect provider' AS test, CASE WHEN(SELECT COUNT(*) from @cdmDatabaseSchema.provider WHERE")
  statement <- getExpectStatement(domain = "provider", table = "provider")
  first <- TRUE
  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, ' provider_id IS NULL')
    } else if (is(provider_id, 'subQuery')){
      statement <- paste0(statement, ' provider_id = (', as.character(provider_id), ')')
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }
  
  if (!missing(npi)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(npi)) {
      statement <- paste0(statement, ' npi IS NULL')
    } else if (is(npi, 'subQuery')){
      statement <- paste0(statement, ' npi = (', as.character(npi), ')')
    } else {
      statement <- paste0(statement, " npi = '", npi,"'")
    }
  }
  
  if (!missing(dea)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(dea)) {
      statement <- paste0(statement, ' dea IS NULL')
    } else if (is(dea, 'subQuery')){
      statement <- paste0(statement, ' dea = (', as.character(dea), ')')
    } else {
      statement <- paste0(statement, " dea = '", dea,"'")
    }
  }
  
  if (!missing(specialty_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(specialty_concept_id)) {
      statement <- paste0(statement, ' specialty_concept_id IS NULL')
    } else if (is(specialty_concept_id, 'subQuery')){
      statement <- paste0(statement, ' specialty_concept_id = (', as.character(specialty_concept_id), ')')
    } else {
      statement <- paste0(statement, " specialty_concept_id = '", specialty_concept_id,"'")
    }
  }
  
  if (!missing(provider_name)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(provider_name)) {
      statement <- paste0(statement, ' provider_name IS NULL')
    } else if (is(provider_name, 'subQuery')){
      statement <- paste0(statement, ' provider_name = (', as.character(provider_name), ')')
    } else {
      statement <- paste0(statement, " provider_name = '", provider_name,"'")
    }
  }
  
  if (!missing(care_site_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(care_site_id)) {
      statement <- paste0(statement, ' care_site_id IS NULL')
    } else if (is(care_site_id, 'subQuery')){
      statement <- paste0(statement, ' care_site_id = (', as.character(care_site_id), ')')
    } else {
      statement <- paste0(statement, " care_site_id = '", care_site_id,"'")
    }
  }
  
  if (!missing(year_of_birth)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(year_of_birth)) {
      statement <- paste0(statement, ' year_of_birth IS NULL')
    } else if (is(year_of_birth, 'subQuery')){
      statement <- paste0(statement, ' year_of_birth = (', as.character(year_of_birth), ')')
    } else {
      statement <- paste0(statement, " year_of_birth = '", year_of_birth,"'")
    }
  }
  
  if (!missing(gender_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(gender_concept_id)) {
      statement <- paste0(statement, ' gender_concept_id IS NULL')
    } else if (is(gender_concept_id, 'subQuery')){
      statement <- paste0(statement, ' gender_concept_id = (', as.character(gender_concept_id), ')')
    } else {
      statement <- paste0(statement, " gender_concept_id = '", gender_concept_id,"'")
    }
  }
  
  if (!missing(provider_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(provider_source_value)) {
      statement <- paste0(statement, ' provider_source_value IS NULL')
    } else if (is(provider_source_value, 'subQuery')){
      statement <- paste0(statement, ' provider_source_value = (', as.character(provider_source_value), ')')
    } else {
      statement <- paste0(statement, " provider_source_value = '", provider_source_value,"'")
    }
  }
  
  if (!missing(specialty_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(specialty_source_value)) {
      statement <- paste0(statement, ' specialty_source_value IS NULL')
    } else if (is(specialty_source_value, 'subQuery')){
      statement <- paste0(statement, ' specialty_source_value = (', as.character(specialty_source_value), ')')
    } else {
      statement <- paste0(statement, " specialty_source_value = '", specialty_source_value,"'")
    }
  }
  
  if (!missing(specialty_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(specialty_source_concept_id)) {
      statement <- paste0(statement, ' specialty_source_concept_id IS NULL')
    } else if (is(specialty_source_concept_id, 'subQuery')){
      statement <- paste0(statement, ' specialty_source_concept_id = (', as.character(specialty_source_concept_id), ')')
    } else {
      statement <- paste0(statement, " specialty_source_concept_id = '", specialty_source_concept_id,"'")
    }
  }
  
  if (!missing(gender_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(gender_source_value)) {
      statement <- paste0(statement, ' gender_source_value IS NULL')
    } else if (is(gender_source_value, 'subQuery')){
      statement <- paste0(statement, ' gender_source_value = (', as.character(gender_source_value), ')')
    } else {
      statement <- paste0(statement, " gender_source_value = '", gender_source_value,"'")
    }
  }
  
  if (!missing(gender_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(gender_source_concept_id)) {
      statement <- paste0(statement, ' gender_source_concept_id IS NULL')
    } else if (is(gender_source_concept_id, 'subQuery')){
      statement <- paste0(statement, ' gender_source_concept_id = (', as.character(gender_source_concept_id), ')')
    } else {
      statement <- paste0(statement, " gender_source_concept_id = '", gender_source_concept_id,"'")
    }
  }
  
  statement <- paste0(statement, ') != ', rowCount , " THEN 'FAIL' ELSE 'PASS' END AS status")
  if (exists('testNewExpected', where = globalenv()) && get('testNewExpected'))
  {
    assign('testNewExpected', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    testSql <<- c(testSql, comment)
  }
  testSql <<- c(testSql, statement)
  invisible(statement)
}

expect_count_death <- function(rowCount, person_id, death_date, death_datetime, death_type_concept_id, cause_concept_id, cause_source_value, cause_source_concept_id) {
  #statement <- paste0("INSERT INTO @cdmDatabaseSchema.test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect death' AS test, CASE WHEN(SELECT COUNT(*) from @cdmDatabaseSchema.death WHERE")
  statement <- getExpectStatement(domain = "death", table = "death")
  first <- TRUE
  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, ' person_id IS NULL')
    } else if (is(person_id, 'subQuery')){
      statement <- paste0(statement, ' person_id = (', as.character(person_id), ')')
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }
  
  if (!missing(death_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(death_date)) {
      statement <- paste0(statement, ' death_date IS NULL')
    } else if (is(death_date, 'subQuery')){
      statement <- paste0(statement, ' death_date = (', as.character(death_date), ')')
    } else {
      statement <- paste0(statement, " death_date = '", death_date,"'")
    }
  }
  
  if (!missing(death_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(death_datetime)) {
      statement <- paste0(statement, ' death_datetime IS NULL')
    } else if (is(death_datetime, 'subQuery')){
      statement <- paste0(statement, ' death_datetime = (', as.character(death_datetime), ')')
    } else {
      statement <- paste0(statement, " death_datetime = '", death_datetime,"'")
    }
  }
  
  if (!missing(death_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(death_type_concept_id)) {
      statement <- paste0(statement, ' death_type_concept_id IS NULL')
    } else if (is(death_type_concept_id, 'subQuery')){
      statement <- paste0(statement, ' death_type_concept_id = (', as.character(death_type_concept_id), ')')
    } else {
      statement <- paste0(statement, " death_type_concept_id = '", death_type_concept_id,"'")
    }
  }
  
  if (!missing(cause_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cause_concept_id)) {
      statement <- paste0(statement, ' cause_concept_id IS NULL')
    } else if (is(cause_concept_id, 'subQuery')){
      statement <- paste0(statement, ' cause_concept_id = (', as.character(cause_concept_id), ')')
    } else {
      statement <- paste0(statement, " cause_concept_id = '", cause_concept_id,"'")
    }
  }
  
  if (!missing(cause_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cause_source_value)) {
      statement <- paste0(statement, ' cause_source_value IS NULL')
    } else if (is(cause_source_value, 'subQuery')){
      statement <- paste0(statement, ' cause_source_value = (', as.character(cause_source_value), ')')
    } else {
      statement <- paste0(statement, " cause_source_value = '", cause_source_value,"'")
    }
  }
  
  if (!missing(cause_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cause_source_concept_id)) {
      statement <- paste0(statement, ' cause_source_concept_id IS NULL')
    } else if (is(cause_source_concept_id, 'subQuery')){
      statement <- paste0(statement, ' cause_source_concept_id = (', as.character(cause_source_concept_id), ')')
    } else {
      statement <- paste0(statement, " cause_source_concept_id = '", cause_source_concept_id,"'")
    }
  }
  
  statement <- paste0(statement, ') != ', rowCount , " THEN 'FAIL' ELSE 'PASS' END AS status")
  if (exists('testNewExpected', where = globalenv()) && get('testNewExpected'))
  {
    assign('testNewExpected', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    testSql <<- c(testSql, comment)
  }
  testSql <<- c(testSql, statement)
  invisible(statement)
}

expect_count_drug_exposure <- function(rowCount, drug_exposure_id, person_id, drug_concept_id, drug_exposure_start_date, drug_exposure_start_datetime, drug_exposure_end_date, drug_exposure_end_datetime, drug_type_concept_id, stop_reason, refills, quantity, days_supply, sig, route_concept_id, effective_drug_dose, dose_unit_concept_id, lot_number, provider_id, visit_occurrence_id, drug_source_value, drug_source_concept_id, route_source_value, dose_unit_source_value) {
  #statement <- paste0("INSERT INTO @cdmDatabaseSchema.test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect drug_exposure' AS test, CASE WHEN(SELECT COUNT(*) from @cdmDatabaseSchema.drug_exposure WHERE")
  statement <- getExpectStatement(domain = "drug_exposure", table = "drug_exposure")
  first <- TRUE
  if (!missing(drug_exposure_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(drug_exposure_id)) {
      statement <- paste0(statement, ' drug_exposure_id IS NULL')
    } else if (is(drug_exposure_id, 'subQuery')){
      statement <- paste0(statement, ' drug_exposure_id = (', as.character(drug_exposure_id), ')')
    } else {
      statement <- paste0(statement, " drug_exposure_id = '", drug_exposure_id,"'")
    }
  }
  
  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, ' person_id IS NULL')
    } else if (is(person_id, 'subQuery')){
      statement <- paste0(statement, ' person_id = (', as.character(person_id), ')')
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }
  
  if (!missing(drug_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(drug_concept_id)) {
      statement <- paste0(statement, ' drug_concept_id IS NULL')
    } else if (is(drug_concept_id, 'subQuery')){
      statement <- paste0(statement, ' drug_concept_id = (', as.character(drug_concept_id), ')')
    } else {
      statement <- paste0(statement, " drug_concept_id = '", drug_concept_id,"'")
    }
  }
  
  if (!missing(drug_exposure_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(drug_exposure_start_date)) {
      statement <- paste0(statement, ' drug_exposure_start_date IS NULL')
    } else if (is(drug_exposure_start_date, 'subQuery')){
      statement <- paste0(statement, ' drug_exposure_start_date = (', as.character(drug_exposure_start_date), ')')
    } else {
      statement <- paste0(statement, " drug_exposure_start_date = '", drug_exposure_start_date,"'")
    }
  }
  
  if (!missing(drug_exposure_start_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(drug_exposure_start_datetime)) {
      statement <- paste0(statement, ' drug_exposure_start_datetime IS NULL')
    } else if (is(drug_exposure_start_datetime, 'subQuery')){
      statement <- paste0(statement, ' drug_exposure_start_datetime = (', as.character(drug_exposure_start_datetime), ')')
    } else {
      statement <- paste0(statement, " drug_exposure_start_datetime = '", drug_exposure_start_datetime,"'")
    }
  }
  
  if (!missing(drug_exposure_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(drug_exposure_end_date)) {
      statement <- paste0(statement, ' drug_exposure_end_date IS NULL')
    } else if (is(drug_exposure_end_date, 'subQuery')){
      statement <- paste0(statement, ' drug_exposure_end_date = (', as.character(drug_exposure_end_date), ')')
    } else {
      statement <- paste0(statement, " drug_exposure_end_date = '", drug_exposure_end_date,"'")
    }
  }
  
  if (!missing(drug_exposure_end_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(drug_exposure_end_datetime)) {
      statement <- paste0(statement, ' drug_exposure_end_datetime IS NULL')
    } else if (is(drug_exposure_end_datetime, 'subQuery')){
      statement <- paste0(statement, ' drug_exposure_end_datetime = (', as.character(drug_exposure_end_datetime), ')')
    } else {
      statement <- paste0(statement, " drug_exposure_end_datetime = '", drug_exposure_end_datetime,"'")
    }
  }
  
  if (!missing(drug_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(drug_type_concept_id)) {
      statement <- paste0(statement, ' drug_type_concept_id IS NULL')
    } else if (is(drug_type_concept_id, 'subQuery')){
      statement <- paste0(statement, ' drug_type_concept_id = (', as.character(drug_type_concept_id), ')')
    } else {
      statement <- paste0(statement, " drug_type_concept_id = '", drug_type_concept_id,"'")
    }
  }
  
  if (!missing(stop_reason)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(stop_reason)) {
      statement <- paste0(statement, ' stop_reason IS NULL')
    } else if (is(stop_reason, 'subQuery')){
      statement <- paste0(statement, ' stop_reason = (', as.character(stop_reason), ')')
    } else {
      statement <- paste0(statement, " stop_reason = '", stop_reason,"'")
    }
  }
  
  if (!missing(refills)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(refills)) {
      statement <- paste0(statement, ' refills IS NULL')
    } else if (is(refills, 'subQuery')){
      statement <- paste0(statement, ' refills = (', as.character(refills), ')')
    } else {
      statement <- paste0(statement, " refills = '", refills,"'")
    }
  }
  
  if (!missing(quantity)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(quantity)) {
      statement <- paste0(statement, ' quantity IS NULL')
    } else if (is(quantity, 'subQuery')){
      statement <- paste0(statement, ' quantity = (', as.character(quantity), ')')
    } else {
      statement <- paste0(statement, " quantity = '", quantity,"'")
    }
  }
  
  if (!missing(days_supply)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(days_supply)) {
      statement <- paste0(statement, ' days_supply IS NULL')
    } else if (is(days_supply, 'subQuery')){
      statement <- paste0(statement, ' days_supply = (', as.character(days_supply), ')')
    } else {
      statement <- paste0(statement, " days_supply = '", days_supply,"'")
    }
  }
  
  if (!missing(sig)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(sig)) {
      statement <- paste0(statement, ' sig IS NULL')
    } else if (is(sig, 'subQuery')){
      statement <- paste0(statement, ' sig = (', as.character(sig), ')')
    } else {
      statement <- paste0(statement, " sig = '", sig,"'")
    }
  }
  
  if (!missing(route_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(route_concept_id)) {
      statement <- paste0(statement, ' route_concept_id IS NULL')
    } else if (is(route_concept_id, 'subQuery')){
      statement <- paste0(statement, ' route_concept_id = (', as.character(route_concept_id), ')')
    } else {
      statement <- paste0(statement, " route_concept_id = '", route_concept_id,"'")
    }
  }
  
  if (!missing(effective_drug_dose)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(effective_drug_dose)) {
      statement <- paste0(statement, ' effective_drug_dose IS NULL')
    } else if (is(effective_drug_dose, 'subQuery')){
      statement <- paste0(statement, ' effective_drug_dose = (', as.character(effective_drug_dose), ')')
    } else {
      statement <- paste0(statement, " effective_drug_dose = '", effective_drug_dose,"'")
    }
  }
  
  if (!missing(dose_unit_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(dose_unit_concept_id)) {
      statement <- paste0(statement, ' dose_unit_concept_id IS NULL')
    } else if (is(dose_unit_concept_id, 'subQuery')){
      statement <- paste0(statement, ' dose_unit_concept_id = (', as.character(dose_unit_concept_id), ')')
    } else {
      statement <- paste0(statement, " dose_unit_concept_id = '", dose_unit_concept_id,"'")
    }
  }
  
  if (!missing(lot_number)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(lot_number)) {
      statement <- paste0(statement, ' lot_number IS NULL')
    } else if (is(lot_number, 'subQuery')){
      statement <- paste0(statement, ' lot_number = (', as.character(lot_number), ')')
    } else {
      statement <- paste0(statement, " lot_number = '", lot_number,"'")
    }
  }
  
  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, ' provider_id IS NULL')
    } else if (is(provider_id, 'subQuery')){
      statement <- paste0(statement, ' provider_id = (', as.character(provider_id), ')')
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }
  
  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, ' visit_occurrence_id IS NULL')
    } else if (is(visit_occurrence_id, 'subQuery')){
      statement <- paste0(statement, ' visit_occurrence_id = (', as.character(visit_occurrence_id), ')')
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }
  
  if (!missing(drug_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(drug_source_value)) {
      statement <- paste0(statement, ' drug_source_value IS NULL')
    } else if (is(drug_source_value, 'subQuery')){
      statement <- paste0(statement, ' drug_source_value = (', as.character(drug_source_value), ')')
    } else {
      statement <- paste0(statement, " drug_source_value = '", drug_source_value,"'")
    }
  }
  
  if (!missing(drug_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(drug_source_concept_id)) {
      statement <- paste0(statement, ' drug_source_concept_id IS NULL')
    } else if (is(drug_source_concept_id, 'subQuery')){
      statement <- paste0(statement, ' drug_source_concept_id = (', as.character(drug_source_concept_id), ')')
    } else {
      statement <- paste0(statement, " drug_source_concept_id = '", drug_source_concept_id,"'")
    }
  }
  
  if (!missing(route_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(route_source_value)) {
      statement <- paste0(statement, ' route_source_value IS NULL')
    } else if (is(route_source_value, 'subQuery')){
      statement <- paste0(statement, ' route_source_value = (', as.character(route_source_value), ')')
    } else {
      statement <- paste0(statement, " route_source_value = '", route_source_value,"'")
    }
  }
  
  if (!missing(dose_unit_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(dose_unit_source_value)) {
      statement <- paste0(statement, ' dose_unit_source_value IS NULL')
    } else if (is(dose_unit_source_value, 'subQuery')){
      statement <- paste0(statement, ' dose_unit_source_value = (', as.character(dose_unit_source_value), ')')
    } else {
      statement <- paste0(statement, " dose_unit_source_value = '", dose_unit_source_value,"'")
    }
  }
  
  statement <- paste0(statement, ') != ', rowCount , " THEN 'FAIL' ELSE 'PASS' END AS status")
  if (exists('testNewExpected', where = globalenv()) && get('testNewExpected'))
  {
    assign('testNewExpected', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    testSql <<- c(testSql, comment)
  }
  testSql <<- c(testSql, statement)
  invisible(statement)
}

expect_count_device_exposure <- function(rowCount, device_exposure_id, person_id, device_concept_id, device_exposure_start_date, device_exposure_start_datetime, device_exposure_end_date, device_exposure_end_datetime, device_type_concept_id, unique_device_id, quantity, provider_id, visit_occurrence_id, device_source_value, device_source_concept_id) {
  #statement <- paste0("INSERT INTO @cdmDatabaseSchema.test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect device_exposure' AS test, CASE WHEN(SELECT COUNT(*) from @cdmDatabaseSchema.device_exposure WHERE")
  statement <- getExpectStatement(domain = "device_exposure", table = "device_exposure")
  first <- TRUE
  if (!missing(device_exposure_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(device_exposure_id)) {
      statement <- paste0(statement, ' device_exposure_id IS NULL')
    } else if (is(device_exposure_id, 'subQuery')){
      statement <- paste0(statement, ' device_exposure_id = (', as.character(device_exposure_id), ')')
    } else {
      statement <- paste0(statement, " device_exposure_id = '", device_exposure_id,"'")
    }
  }
  
  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, ' person_id IS NULL')
    } else if (is(person_id, 'subQuery')){
      statement <- paste0(statement, ' person_id = (', as.character(person_id), ')')
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }
  
  if (!missing(device_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(device_concept_id)) {
      statement <- paste0(statement, ' device_concept_id IS NULL')
    } else if (is(device_concept_id, 'subQuery')){
      statement <- paste0(statement, ' device_concept_id = (', as.character(device_concept_id), ')')
    } else {
      statement <- paste0(statement, " device_concept_id = '", device_concept_id,"'")
    }
  }
  
  if (!missing(device_exposure_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(device_exposure_start_date)) {
      statement <- paste0(statement, ' device_exposure_start_date IS NULL')
    } else if (is(device_exposure_start_date, 'subQuery')){
      statement <- paste0(statement, ' device_exposure_start_date = (', as.character(device_exposure_start_date), ')')
    } else {
      statement <- paste0(statement, " device_exposure_start_date = '", device_exposure_start_date,"'")
    }
  }
  
  if (!missing(device_exposure_start_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(device_exposure_start_datetime)) {
      statement <- paste0(statement, ' device_exposure_start_datetime IS NULL')
    } else if (is(device_exposure_start_datetime, 'subQuery')){
      statement <- paste0(statement, ' device_exposure_start_datetime = (', as.character(device_exposure_start_datetime), ')')
    } else {
      statement <- paste0(statement, " device_exposure_start_datetime = '", device_exposure_start_datetime,"'")
    }
  }
  
  if (!missing(device_exposure_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(device_exposure_end_date)) {
      statement <- paste0(statement, ' device_exposure_end_date IS NULL')
    } else if (is(device_exposure_end_date, 'subQuery')){
      statement <- paste0(statement, ' device_exposure_end_date = (', as.character(device_exposure_end_date), ')')
    } else {
      statement <- paste0(statement, " device_exposure_end_date = '", device_exposure_end_date,"'")
    }
  }
  
  if (!missing(device_exposure_end_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(device_exposure_end_datetime)) {
      statement <- paste0(statement, ' device_exposure_end_datetime IS NULL')
    } else if (is(device_exposure_end_datetime, 'subQuery')){
      statement <- paste0(statement, ' device_exposure_end_datetime = (', as.character(device_exposure_end_datetime), ')')
    } else {
      statement <- paste0(statement, " device_exposure_end_datetime = '", device_exposure_end_datetime,"'")
    }
  }
  
  if (!missing(device_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(device_type_concept_id)) {
      statement <- paste0(statement, ' device_type_concept_id IS NULL')
    } else if (is(device_type_concept_id, 'subQuery')){
      statement <- paste0(statement, ' device_type_concept_id = (', as.character(device_type_concept_id), ')')
    } else {
      statement <- paste0(statement, " device_type_concept_id = '", device_type_concept_id,"'")
    }
  }
  
  if (!missing(unique_device_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(unique_device_id)) {
      statement <- paste0(statement, ' unique_device_id IS NULL')
    } else if (is(unique_device_id, 'subQuery')){
      statement <- paste0(statement, ' unique_device_id = (', as.character(unique_device_id), ')')
    } else {
      statement <- paste0(statement, " unique_device_id = '", unique_device_id,"'")
    }
  }
  
  if (!missing(quantity)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(quantity)) {
      statement <- paste0(statement, ' quantity IS NULL')
    } else if (is(quantity, 'subQuery')){
      statement <- paste0(statement, ' quantity = (', as.character(quantity), ')')
    } else {
      statement <- paste0(statement, " quantity = '", quantity,"'")
    }
  }
  
  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, ' provider_id IS NULL')
    } else if (is(provider_id, 'subQuery')){
      statement <- paste0(statement, ' provider_id = (', as.character(provider_id), ')')
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }
  
  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, ' visit_occurrence_id IS NULL')
    } else if (is(visit_occurrence_id, 'subQuery')){
      statement <- paste0(statement, ' visit_occurrence_id = (', as.character(visit_occurrence_id), ')')
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }
  
  if (!missing(device_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(device_source_value)) {
      statement <- paste0(statement, ' device_source_value IS NULL')
    } else if (is(device_source_value, 'subQuery')){
      statement <- paste0(statement, ' device_source_value = (', as.character(device_source_value), ')')
    } else {
      statement <- paste0(statement, " device_source_value = '", device_source_value,"'")
    }
  }
  
  if (!missing(device_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(device_source_concept_id)) {
      statement <- paste0(statement, ' device_source_concept_id IS NULL')
    } else if (is(device_source_concept_id, 'subQuery')){
      statement <- paste0(statement, ' device_source_concept_id = (', as.character(device_source_concept_id), ')')
    } else {
      statement <- paste0(statement, " device_source_concept_id = '", device_source_concept_id,"'")
    }
  }
  
  statement <- paste0(statement, ') != ', rowCount , " THEN 'FAIL' ELSE 'PASS' END AS status")
  if (exists('testNewExpected', where = globalenv()) && get('testNewExpected'))
  {
    assign('testNewExpected', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    testSql <<- c(testSql, comment)
  }
  testSql <<- c(testSql, statement)
  invisible(statement)
}

expect_count_procedure_occurrence <- function(rowCount, procedure_occurrence_id, person_id, procedure_concept_id, procedure_date, procedure_type_concept_id, modifier_concept_id, quantity, provider_id, visit_occurrence_id, procedure_source_value, procedure_source_concept_id, qualifier_source_value) {
  #statement <- paste0("INSERT INTO @cdmDatabaseSchema.test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect procedure_occurrence' AS test, CASE WHEN(SELECT COUNT(*) from @cdmDatabaseSchema.procedure_occurrence WHERE")
  statement <- getExpectStatement(domain = "procedure_occurrence", table = "procedure_occurrence")
  first <- TRUE
  if (!missing(procedure_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(procedure_occurrence_id)) {
      statement <- paste0(statement, ' procedure_occurrence_id IS NULL')
    } else if (is(procedure_occurrence_id, 'subQuery')){
      statement <- paste0(statement, ' procedure_occurrence_id = (', as.character(procedure_occurrence_id), ')')
    } else {
      statement <- paste0(statement, " procedure_occurrence_id = '", procedure_occurrence_id,"'")
    }
  }
  
  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, ' person_id IS NULL')
    } else if (is(person_id, 'subQuery')){
      statement <- paste0(statement, ' person_id = (', as.character(person_id), ')')
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }
  
  if (!missing(procedure_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(procedure_concept_id)) {
      statement <- paste0(statement, ' procedure_concept_id IS NULL')
    } else if (is(procedure_concept_id, 'subQuery')){
      statement <- paste0(statement, ' procedure_concept_id = (', as.character(procedure_concept_id), ')')
    } else {
      statement <- paste0(statement, " procedure_concept_id = '", procedure_concept_id,"'")
    }
  }
  
  if (!missing(procedure_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(procedure_date)) {
      statement <- paste0(statement, ' procedure_date IS NULL')
    } else if (is(procedure_date, 'subQuery')){
      statement <- paste0(statement, ' procedure_date = (', as.character(procedure_date), ')')
    } else {
      statement <- paste0(statement, " procedure_date = '", procedure_date,"'")
    }
  }
  
  if (!missing(procedure_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(procedure_type_concept_id)) {
      statement <- paste0(statement, ' procedure_type_concept_id IS NULL')
    } else if (is(procedure_type_concept_id, 'subQuery')){
      statement <- paste0(statement, ' procedure_type_concept_id = (', as.character(procedure_type_concept_id), ')')
    } else {
      statement <- paste0(statement, " procedure_type_concept_id = '", procedure_type_concept_id,"'")
    }
  }
  
  if (!missing(modifier_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(modifier_concept_id)) {
      statement <- paste0(statement, ' modifier_concept_id IS NULL')
    } else if (is(modifier_concept_id, 'subQuery')){
      statement <- paste0(statement, ' modifier_concept_id = (', as.character(modifier_concept_id), ')')
    } else {
      statement <- paste0(statement, " modifier_concept_id = '", modifier_concept_id,"'")
    }
  }
  
  if (!missing(quantity)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(quantity)) {
      statement <- paste0(statement, ' quantity IS NULL')
    } else if (is(quantity, 'subQuery')){
      statement <- paste0(statement, ' quantity = (', as.character(quantity), ')')
    } else {
      statement <- paste0(statement, " quantity = '", quantity,"'")
    }
  }
  
  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, ' provider_id IS NULL')
    } else if (is(provider_id, 'subQuery')){
      statement <- paste0(statement, ' provider_id = (', as.character(provider_id), ')')
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }
  
  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, ' visit_occurrence_id IS NULL')
    } else if (is(visit_occurrence_id, 'subQuery')){
      statement <- paste0(statement, ' visit_occurrence_id = (', as.character(visit_occurrence_id), ')')
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }
  
  if (!missing(procedure_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(procedure_source_value)) {
      statement <- paste0(statement, ' procedure_source_value IS NULL')
    } else if (is(procedure_source_value, 'subQuery')){
      statement <- paste0(statement, ' procedure_source_value = (', as.character(procedure_source_value), ')')
    } else {
      statement <- paste0(statement, " procedure_source_value = '", procedure_source_value,"'")
    }
  }
  
  if (!missing(procedure_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(procedure_source_concept_id)) {
      statement <- paste0(statement, ' procedure_source_concept_id IS NULL')
    } else if (is(procedure_source_concept_id, 'subQuery')){
      statement <- paste0(statement, ' procedure_source_concept_id = (', as.character(procedure_source_concept_id), ')')
    } else {
      statement <- paste0(statement, " procedure_source_concept_id = '", procedure_source_concept_id,"'")
    }
  }
  
  if (!missing(qualifier_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(qualifier_source_value)) {
      statement <- paste0(statement, ' qualifier_source_value IS NULL')
    } else if (is(qualifier_source_value, 'subQuery')){
      statement <- paste0(statement, ' qualifier_source_value = (', as.character(qualifier_source_value), ')')
    } else {
      statement <- paste0(statement, " qualifier_source_value = '", qualifier_source_value,"'")
    }
  }
  
  statement <- paste0(statement, ') != ', rowCount , " THEN 'FAIL' ELSE 'PASS' END AS status")
  if (exists('testNewExpected', where = globalenv()) && get('testNewExpected'))
  {
    assign('testNewExpected', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    testSql <<- c(testSql, comment)
  }
  testSql <<- c(testSql, statement)
  invisible(statement)
}

expect_count_observation <- function(rowCount, observation_id, person_id, observation_concept_id, observation_date, observation_datetime, observation_type_concept_id, value_as_number, value_as_string, value_as_concept_id, qualifier_concept_id, unit_concept_id, provider_id, visit_occurrence_id, observation_source_value, observation_source_concept_id, unit_source_value, qualifier_source_value) {
  #statement <- paste0("INSERT INTO @cdmDatabaseSchema.test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect observation' AS test, CASE WHEN(SELECT COUNT(*) from @cdmDatabaseSchema.observation WHERE")
  statement <- getExpectStatement(domain = "observation", table = "observation")
  first <- TRUE
  if (!missing(observation_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(observation_id)) {
      statement <- paste0(statement, ' observation_id IS NULL')
    } else if (is(observation_id, 'subQuery')){
      statement <- paste0(statement, ' observation_id = (', as.character(observation_id), ')')
    } else {
      statement <- paste0(statement, " observation_id = '", observation_id,"'")
    }
  }
  
  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, ' person_id IS NULL')
    } else if (is(person_id, 'subQuery')){
      statement <- paste0(statement, ' person_id = (', as.character(person_id), ')')
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }
  
  if (!missing(observation_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(observation_concept_id)) {
      statement <- paste0(statement, ' observation_concept_id IS NULL')
    } else if (is(observation_concept_id, 'subQuery')){
      statement <- paste0(statement, ' observation_concept_id = (', as.character(observation_concept_id), ')')
    } else {
      statement <- paste0(statement, " observation_concept_id = '", observation_concept_id,"'")
    }
  }
  
  if (!missing(observation_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(observation_date)) {
      statement <- paste0(statement, ' observation_date IS NULL')
    } else if (is(observation_date, 'subQuery')){
      statement <- paste0(statement, ' observation_date = (', as.character(observation_date), ')')
    } else {
      statement <- paste0(statement, " observation_date = '", observation_date,"'")
    }
  }
  
  if (!missing(observation_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(observation_datetime)) {
      statement <- paste0(statement, ' observation_datetime IS NULL')
    } else if (is(observation_datetime, 'subQuery')){
      statement <- paste0(statement, ' observation_datetime = (', as.character(observation_datetime), ')')
    } else {
      statement <- paste0(statement, " observation_datetime = '", observation_datetime,"'")
    }
  }
  
  if (!missing(observation_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(observation_type_concept_id)) {
      statement <- paste0(statement, ' observation_type_concept_id IS NULL')
    } else if (is(observation_type_concept_id, 'subQuery')){
      statement <- paste0(statement, ' observation_type_concept_id = (', as.character(observation_type_concept_id), ')')
    } else {
      statement <- paste0(statement, " observation_type_concept_id = '", observation_type_concept_id,"'")
    }
  }
  
  if (!missing(value_as_number)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(value_as_number)) {
      statement <- paste0(statement, ' value_as_number IS NULL')
    } else if (is(value_as_number, 'subQuery')){
      statement <- paste0(statement, ' value_as_number = (', as.character(value_as_number), ')')
    } else {
      statement <- paste0(statement, " value_as_number = '", value_as_number,"'")
    }
  }
  
  if (!missing(value_as_string)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(value_as_string)) {
      statement <- paste0(statement, ' value_as_string IS NULL')
    } else if (is(value_as_string, 'subQuery')){
      statement <- paste0(statement, ' value_as_string = (', as.character(value_as_string), ')')
    } else {
      statement <- paste0(statement, " value_as_string = '", value_as_string,"'")
    }
  }
  
  if (!missing(value_as_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(value_as_concept_id)) {
      statement <- paste0(statement, ' value_as_concept_id IS NULL')
    } else if (is(value_as_concept_id, 'subQuery')){
      statement <- paste0(statement, ' value_as_concept_id = (', as.character(value_as_concept_id), ')')
    } else {
      statement <- paste0(statement, " value_as_concept_id = '", value_as_concept_id,"'")
    }
  }
  
  if (!missing(qualifier_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(qualifier_concept_id)) {
      statement <- paste0(statement, ' qualifier_concept_id IS NULL')
    } else if (is(qualifier_concept_id, 'subQuery')){
      statement <- paste0(statement, ' qualifier_concept_id = (', as.character(qualifier_concept_id), ')')
    } else {
      statement <- paste0(statement, " qualifier_concept_id = '", qualifier_concept_id,"'")
    }
  }
  
  if (!missing(unit_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(unit_concept_id)) {
      statement <- paste0(statement, ' unit_concept_id IS NULL')
    } else if (is(unit_concept_id, 'subQuery')){
      statement <- paste0(statement, ' unit_concept_id = (', as.character(unit_concept_id), ')')
    } else {
      statement <- paste0(statement, " unit_concept_id = '", unit_concept_id,"'")
    }
  }
  
  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, ' provider_id IS NULL')
    } else if (is(provider_id, 'subQuery')){
      statement <- paste0(statement, ' provider_id = (', as.character(provider_id), ')')
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }
  
  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, ' visit_occurrence_id IS NULL')
    } else if (is(visit_occurrence_id, 'subQuery')){
      statement <- paste0(statement, ' visit_occurrence_id = (', as.character(visit_occurrence_id), ')')
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }
  
  if (!missing(observation_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(observation_source_value)) {
      statement <- paste0(statement, ' observation_source_value IS NULL')
    } else if (is(observation_source_value, 'subQuery')){
      statement <- paste0(statement, ' observation_source_value = (', as.character(observation_source_value), ')')
    } else {
      statement <- paste0(statement, " observation_source_value = '", observation_source_value,"'")
    }
  }
  
  if (!missing(observation_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(observation_source_concept_id)) {
      statement <- paste0(statement, ' observation_source_concept_id IS NULL')
    } else if (is(observation_source_concept_id, 'subQuery')){
      statement <- paste0(statement, ' observation_source_concept_id = (', as.character(observation_source_concept_id), ')')
    } else {
      statement <- paste0(statement, " observation_source_concept_id = '", observation_source_concept_id,"'")
    }
  }
  
  if (!missing(unit_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(unit_source_value)) {
      statement <- paste0(statement, ' unit_source_value IS NULL')
    } else if (is(unit_source_value, 'subQuery')){
      statement <- paste0(statement, ' unit_source_value = (', as.character(unit_source_value), ')')
    } else {
      statement <- paste0(statement, " unit_source_value = '", unit_source_value,"'")
    }
  }
  
  if (!missing(qualifier_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(qualifier_source_value)) {
      statement <- paste0(statement, ' qualifier_source_value IS NULL')
    } else if (is(qualifier_source_value, 'subQuery')){
      statement <- paste0(statement, ' qualifier_source_value = (', as.character(qualifier_source_value), ')')
    } else {
      statement <- paste0(statement, " qualifier_source_value = '", qualifier_source_value,"'")
    }
  }
  
  statement <- paste0(statement, ') != ', rowCount , " THEN 'FAIL' ELSE 'PASS' END AS status")
  if (exists('testNewExpected', where = globalenv()) && get('testNewExpected'))
  {
    assign('testNewExpected', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    testSql <<- c(testSql, comment)
  }
  testSql <<- c(testSql, statement)
  invisible(statement)
}

expect_count_note <- function(rowCount, note_id, person_id, note_date, note_datetime, note_type_concept_id, note_text, provider_id, visit_occurrence_id, note_source_value) {
  #statement <- paste0("INSERT INTO @cdmDatabaseSchema.test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect note' AS test, CASE WHEN(SELECT COUNT(*) from @cdmDatabaseSchema.note WHERE")
  statement <- getExpectStatement(domain = "note", table = "note")
  first <- TRUE
  if (!missing(note_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(note_id)) {
      statement <- paste0(statement, ' note_id IS NULL')
    } else if (is(note_id, 'subQuery')){
      statement <- paste0(statement, ' note_id = (', as.character(note_id), ')')
    } else {
      statement <- paste0(statement, " note_id = '", note_id,"'")
    }
  }
  
  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, ' person_id IS NULL')
    } else if (is(person_id, 'subQuery')){
      statement <- paste0(statement, ' person_id = (', as.character(person_id), ')')
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }
  
  if (!missing(note_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(note_date)) {
      statement <- paste0(statement, ' note_date IS NULL')
    } else if (is(note_date, 'subQuery')){
      statement <- paste0(statement, ' note_date = (', as.character(note_date), ')')
    } else {
      statement <- paste0(statement, " note_date = '", note_date,"'")
    }
  }
  
  if (!missing(note_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(note_datetime)) {
      statement <- paste0(statement, ' note_datetime IS NULL')
    } else if (is(note_datetime, 'subQuery')){
      statement <- paste0(statement, ' note_datetime = (', as.character(note_datetime), ')')
    } else {
      statement <- paste0(statement, " note_datetime = '", note_datetime,"'")
    }
  }
  
  if (!missing(note_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(note_type_concept_id)) {
      statement <- paste0(statement, ' note_type_concept_id IS NULL')
    } else if (is(note_type_concept_id, 'subQuery')){
      statement <- paste0(statement, ' note_type_concept_id = (', as.character(note_type_concept_id), ')')
    } else {
      statement <- paste0(statement, " note_type_concept_id = '", note_type_concept_id,"'")
    }
  }
  
  if (!missing(note_text)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(note_text)) {
      statement <- paste0(statement, ' note_text IS NULL')
    } else if (is(note_text, 'subQuery')){
      statement <- paste0(statement, ' note_text = (', as.character(note_text), ')')
    } else {
      statement <- paste0(statement, " note_text = '", note_text,"'")
    }
  }
  
  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, ' provider_id IS NULL')
    } else if (is(provider_id, 'subQuery')){
      statement <- paste0(statement, ' provider_id = (', as.character(provider_id), ')')
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }
  
  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, ' visit_occurrence_id IS NULL')
    } else if (is(visit_occurrence_id, 'subQuery')){
      statement <- paste0(statement, ' visit_occurrence_id = (', as.character(visit_occurrence_id), ')')
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }
  
  if (!missing(note_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(note_source_value)) {
      statement <- paste0(statement, ' note_source_value IS NULL')
    } else if (is(note_source_value, 'subQuery')){
      statement <- paste0(statement, ' note_source_value = (', as.character(note_source_value), ')')
    } else {
      statement <- paste0(statement, " note_source_value = '", note_source_value,"'")
    }
  }
  
  statement <- paste0(statement, ') != ', rowCount , " THEN 'FAIL' ELSE 'PASS' END AS status")
  if (exists('testNewExpected', where = globalenv()) && get('testNewExpected'))
  {
    assign('testNewExpected', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    testSql <<- c(testSql, comment)
  }
  testSql <<- c(testSql, statement)
  invisible(statement)
}

expect_count_specimen <- function(rowCount, specimen_id, person_id, specimen_concept_id, specimen_type_concept_id, specimen_date, specimen_datetime, quantity, unit_concept_id, anatomic_site_concept_id, disease_status_concept_id, specimen_source_id, specimen_source_value, unit_source_value, anatomic_site_source_value, disease_status_source_value) {
  #statement <- paste0("INSERT INTO @cdmDatabaseSchema.test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect specimen' AS test, CASE WHEN(SELECT COUNT(*) from @cdmDatabaseSchema.specimen WHERE")
  statement <- getExpectStatement(domain = "specimen", table = "specimen")
  first <- TRUE
  if (!missing(specimen_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(specimen_id)) {
      statement <- paste0(statement, ' specimen_id IS NULL')
    } else if (is(specimen_id, 'subQuery')){
      statement <- paste0(statement, ' specimen_id = (', as.character(specimen_id), ')')
    } else {
      statement <- paste0(statement, " specimen_id = '", specimen_id,"'")
    }
  }
  
  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, ' person_id IS NULL')
    } else if (is(person_id, 'subQuery')){
      statement <- paste0(statement, ' person_id = (', as.character(person_id), ')')
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }
  
  if (!missing(specimen_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(specimen_concept_id)) {
      statement <- paste0(statement, ' specimen_concept_id IS NULL')
    } else if (is(specimen_concept_id, 'subQuery')){
      statement <- paste0(statement, ' specimen_concept_id = (', as.character(specimen_concept_id), ')')
    } else {
      statement <- paste0(statement, " specimen_concept_id = '", specimen_concept_id,"'")
    }
  }
  
  if (!missing(specimen_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(specimen_type_concept_id)) {
      statement <- paste0(statement, ' specimen_type_concept_id IS NULL')
    } else if (is(specimen_type_concept_id, 'subQuery')){
      statement <- paste0(statement, ' specimen_type_concept_id = (', as.character(specimen_type_concept_id), ')')
    } else {
      statement <- paste0(statement, " specimen_type_concept_id = '", specimen_type_concept_id,"'")
    }
  }
  
  if (!missing(specimen_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(specimen_date)) {
      statement <- paste0(statement, ' specimen_date IS NULL')
    } else if (is(specimen_date, 'subQuery')){
      statement <- paste0(statement, ' specimen_date = (', as.character(specimen_date), ')')
    } else {
      statement <- paste0(statement, " specimen_date = '", specimen_date,"'")
    }
  }
  
  if (!missing(specimen_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(specimen_datetime)) {
      statement <- paste0(statement, ' specimen_datetime IS NULL')
    } else if (is(specimen_datetime, 'subQuery')){
      statement <- paste0(statement, ' specimen_datetime = (', as.character(specimen_datetime), ')')
    } else {
      statement <- paste0(statement, " specimen_datetime = '", specimen_datetime,"'")
    }
  }
  
  if (!missing(quantity)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(quantity)) {
      statement <- paste0(statement, ' quantity IS NULL')
    } else if (is(quantity, 'subQuery')){
      statement <- paste0(statement, ' quantity = (', as.character(quantity), ')')
    } else {
      statement <- paste0(statement, " quantity = '", quantity,"'")
    }
  }
  
  if (!missing(unit_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(unit_concept_id)) {
      statement <- paste0(statement, ' unit_concept_id IS NULL')
    } else if (is(unit_concept_id, 'subQuery')){
      statement <- paste0(statement, ' unit_concept_id = (', as.character(unit_concept_id), ')')
    } else {
      statement <- paste0(statement, " unit_concept_id = '", unit_concept_id,"'")
    }
  }
  
  if (!missing(anatomic_site_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(anatomic_site_concept_id)) {
      statement <- paste0(statement, ' anatomic_site_concept_id IS NULL')
    } else if (is(anatomic_site_concept_id, 'subQuery')){
      statement <- paste0(statement, ' anatomic_site_concept_id = (', as.character(anatomic_site_concept_id), ')')
    } else {
      statement <- paste0(statement, " anatomic_site_concept_id = '", anatomic_site_concept_id,"'")
    }
  }
  
  if (!missing(disease_status_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(disease_status_concept_id)) {
      statement <- paste0(statement, ' disease_status_concept_id IS NULL')
    } else if (is(disease_status_concept_id, 'subQuery')){
      statement <- paste0(statement, ' disease_status_concept_id = (', as.character(disease_status_concept_id), ')')
    } else {
      statement <- paste0(statement, " disease_status_concept_id = '", disease_status_concept_id,"'")
    }
  }
  
  if (!missing(specimen_source_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(specimen_source_id)) {
      statement <- paste0(statement, ' specimen_source_id IS NULL')
    } else if (is(specimen_source_id, 'subQuery')){
      statement <- paste0(statement, ' specimen_source_id = (', as.character(specimen_source_id), ')')
    } else {
      statement <- paste0(statement, " specimen_source_id = '", specimen_source_id,"'")
    }
  }
  
  if (!missing(specimen_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(specimen_source_value)) {
      statement <- paste0(statement, ' specimen_source_value IS NULL')
    } else if (is(specimen_source_value, 'subQuery')){
      statement <- paste0(statement, ' specimen_source_value = (', as.character(specimen_source_value), ')')
    } else {
      statement <- paste0(statement, " specimen_source_value = '", specimen_source_value,"'")
    }
  }
  
  if (!missing(unit_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(unit_source_value)) {
      statement <- paste0(statement, ' unit_source_value IS NULL')
    } else if (is(unit_source_value, 'subQuery')){
      statement <- paste0(statement, ' unit_source_value = (', as.character(unit_source_value), ')')
    } else {
      statement <- paste0(statement, " unit_source_value = '", unit_source_value,"'")
    }
  }
  
  if (!missing(anatomic_site_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(anatomic_site_source_value)) {
      statement <- paste0(statement, ' anatomic_site_source_value IS NULL')
    } else if (is(anatomic_site_source_value, 'subQuery')){
      statement <- paste0(statement, ' anatomic_site_source_value = (', as.character(anatomic_site_source_value), ')')
    } else {
      statement <- paste0(statement, " anatomic_site_source_value = '", anatomic_site_source_value,"'")
    }
  }
  
  if (!missing(disease_status_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(disease_status_source_value)) {
      statement <- paste0(statement, ' disease_status_source_value IS NULL')
    } else if (is(disease_status_source_value, 'subQuery')){
      statement <- paste0(statement, ' disease_status_source_value = (', as.character(disease_status_source_value), ')')
    } else {
      statement <- paste0(statement, " disease_status_source_value = '", disease_status_source_value,"'")
    }
  }
  
  statement <- paste0(statement, ') != ', rowCount , " THEN 'FAIL' ELSE 'PASS' END AS status")
  if (exists('testNewExpected', where = globalenv()) && get('testNewExpected'))
  {
    assign('testNewExpected', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    testSql <<- c(testSql, comment)
  }
  testSql <<- c(testSql, statement)
  invisible(statement)
}

expect_count_fact_relationship <- function(rowCount, domain_concept_id_1, fact_id_1, domain_concept_id_2, fact_id_2, relationship_concept_id) {
  #statement <- paste0("INSERT INTO @cdmDatabaseSchema.test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect fact_relationship' AS test, CASE WHEN(SELECT COUNT(*) from @cdmDatabaseSchema.fact_relationship WHERE")
  statement <- getExpectStatement(domain = "fact_relationship", table = "fact_relationship")
  first <- TRUE
  if (!missing(domain_concept_id_1)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(domain_concept_id_1)) {
      statement <- paste0(statement, ' domain_concept_id_1 IS NULL')
    } else if (is(domain_concept_id_1, 'subQuery')){
      statement <- paste0(statement, ' domain_concept_id_1 = (', as.character(domain_concept_id_1), ')')
    } else {
      statement <- paste0(statement, " domain_concept_id_1 = '", domain_concept_id_1,"'")
    }
  }
  
  if (!missing(fact_id_1)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(fact_id_1)) {
      statement <- paste0(statement, ' fact_id_1 IS NULL')
    } else if (is(fact_id_1, 'subQuery')){
      statement <- paste0(statement, ' fact_id_1 = (', as.character(fact_id_1), ')')
    } else {
      statement <- paste0(statement, " fact_id_1 = '", fact_id_1,"'")
    }
  }
  
  if (!missing(domain_concept_id_2)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(domain_concept_id_2)) {
      statement <- paste0(statement, ' domain_concept_id_2 IS NULL')
    } else if (is(domain_concept_id_2, 'subQuery')){
      statement <- paste0(statement, ' domain_concept_id_2 = (', as.character(domain_concept_id_2), ')')
    } else {
      statement <- paste0(statement, " domain_concept_id_2 = '", domain_concept_id_2,"'")
    }
  }
  
  if (!missing(fact_id_2)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(fact_id_2)) {
      statement <- paste0(statement, ' fact_id_2 IS NULL')
    } else if (is(fact_id_2, 'subQuery')){
      statement <- paste0(statement, ' fact_id_2 = (', as.character(fact_id_2), ')')
    } else {
      statement <- paste0(statement, " fact_id_2 = '", fact_id_2,"'")
    }
  }
  
  if (!missing(relationship_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(relationship_concept_id)) {
      statement <- paste0(statement, ' relationship_concept_id IS NULL')
    } else if (is(relationship_concept_id, 'subQuery')){
      statement <- paste0(statement, ' relationship_concept_id = (', as.character(relationship_concept_id), ')')
    } else {
      statement <- paste0(statement, " relationship_concept_id = '", relationship_concept_id,"'")
    }
  }
  
  statement <- paste0(statement, ') != ', rowCount , " THEN 'FAIL' ELSE 'PASS' END AS status")
  if (exists('testNewExpected', where = globalenv()) && get('testNewExpected'))
  {
    assign('testNewExpected', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    testSql <<- c(testSql, comment)
  }
  testSql <<- c(testSql, statement)
  invisible(statement)
}

expect_count_drug_era <- function(rowCount, drug_era_id, person_id, drug_concept_id, drug_era_start_date, drug_era_end_date, drug_exposure_count, gap_days) {
  #statement <- paste0("INSERT INTO @cdmDatabaseSchema.test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect drug_era' AS test, CASE WHEN(SELECT COUNT(*) from @cdmDatabaseSchema.drug_era WHERE")
  statement <- getExpectStatement(domain = "drug_era", table = "drug_era")
  first <- TRUE
  if (!missing(drug_era_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(drug_era_id)) {
      statement <- paste0(statement, ' drug_era_id IS NULL')
    } else if (is(drug_era_id, 'subQuery')){
      statement <- paste0(statement, ' drug_era_id = (', as.character(drug_era_id), ')')
    } else {
      statement <- paste0(statement, " drug_era_id = '", drug_era_id,"'")
    }
  }
  
  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, ' person_id IS NULL')
    } else if (is(person_id, 'subQuery')){
      statement <- paste0(statement, ' person_id = (', as.character(person_id), ')')
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }
  
  if (!missing(drug_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(drug_concept_id)) {
      statement <- paste0(statement, ' drug_concept_id IS NULL')
    } else if (is(drug_concept_id, 'subQuery')){
      statement <- paste0(statement, ' drug_concept_id = (', as.character(drug_concept_id), ')')
    } else {
      statement <- paste0(statement, " drug_concept_id = '", drug_concept_id,"'")
    }
  }
  
  if (!missing(drug_era_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(drug_era_start_date)) {
      statement <- paste0(statement, ' drug_era_start_date IS NULL')
    } else if (is(drug_era_start_date, 'subQuery')){
      statement <- paste0(statement, ' drug_era_start_date = (', as.character(drug_era_start_date), ')')
    } else {
      statement <- paste0(statement, " drug_era_start_date = '", drug_era_start_date,"'")
    }
  }
  
  if (!missing(drug_era_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(drug_era_end_date)) {
      statement <- paste0(statement, ' drug_era_end_date IS NULL')
    } else if (is(drug_era_end_date, 'subQuery')){
      statement <- paste0(statement, ' drug_era_end_date = (', as.character(drug_era_end_date), ')')
    } else {
      statement <- paste0(statement, " drug_era_end_date = '", drug_era_end_date,"'")
    }
  }
  
  if (!missing(drug_exposure_count)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(drug_exposure_count)) {
      statement <- paste0(statement, ' drug_exposure_count IS NULL')
    } else if (is(drug_exposure_count, 'subQuery')){
      statement <- paste0(statement, ' drug_exposure_count = (', as.character(drug_exposure_count), ')')
    } else {
      statement <- paste0(statement, " drug_exposure_count = '", drug_exposure_count,"'")
    }
  }
  
  if (!missing(gap_days)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(gap_days)) {
      statement <- paste0(statement, ' gap_days IS NULL')
    } else if (is(gap_days, 'subQuery')){
      statement <- paste0(statement, ' gap_days = (', as.character(gap_days), ')')
    } else {
      statement <- paste0(statement, " gap_days = '", gap_days,"'")
    }
  }
  
  statement <- paste0(statement, ') != ', rowCount , " THEN 'FAIL' ELSE 'PASS' END AS status")
  if (exists('testNewExpected', where = globalenv()) && get('testNewExpected'))
  {
    assign('testNewExpected', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    testSql <<- c(testSql, comment)
  }
  testSql <<- c(testSql, statement)
  invisible(statement)
}

expect_count_dose_era <- function(rowCount, dose_era_id, person_id, drug_concept_id, unit_concept_id, dose_value, dose_era_start_date, dose_era_end_date) {
  #statement <- paste0("INSERT INTO @cdmDatabaseSchema.test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect dose_era' AS test, CASE WHEN(SELECT COUNT(*) from @cdmDatabaseSchema.dose_era WHERE")
  statement <- getExpectStatement(domain = "dose_era", table = "dose_era")
  first <- TRUE
  if (!missing(dose_era_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(dose_era_id)) {
      statement <- paste0(statement, ' dose_era_id IS NULL')
    } else if (is(dose_era_id, 'subQuery')){
      statement <- paste0(statement, ' dose_era_id = (', as.character(dose_era_id), ')')
    } else {
      statement <- paste0(statement, " dose_era_id = '", dose_era_id,"'")
    }
  }
  
  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, ' person_id IS NULL')
    } else if (is(person_id, 'subQuery')){
      statement <- paste0(statement, ' person_id = (', as.character(person_id), ')')
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }
  
  if (!missing(drug_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(drug_concept_id)) {
      statement <- paste0(statement, ' drug_concept_id IS NULL')
    } else if (is(drug_concept_id, 'subQuery')){
      statement <- paste0(statement, ' drug_concept_id = (', as.character(drug_concept_id), ')')
    } else {
      statement <- paste0(statement, " drug_concept_id = '", drug_concept_id,"'")
    }
  }
  
  if (!missing(unit_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(unit_concept_id)) {
      statement <- paste0(statement, ' unit_concept_id IS NULL')
    } else if (is(unit_concept_id, 'subQuery')){
      statement <- paste0(statement, ' unit_concept_id = (', as.character(unit_concept_id), ')')
    } else {
      statement <- paste0(statement, " unit_concept_id = '", unit_concept_id,"'")
    }
  }
  
  if (!missing(dose_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(dose_value)) {
      statement <- paste0(statement, ' dose_value IS NULL')
    } else if (is(dose_value, 'subQuery')){
      statement <- paste0(statement, ' dose_value = (', as.character(dose_value), ')')
    } else {
      statement <- paste0(statement, " dose_value = '", dose_value,"'")
    }
  }
  
  if (!missing(dose_era_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(dose_era_start_date)) {
      statement <- paste0(statement, ' dose_era_start_date IS NULL')
    } else if (is(dose_era_start_date, 'subQuery')){
      statement <- paste0(statement, ' dose_era_start_date = (', as.character(dose_era_start_date), ')')
    } else {
      statement <- paste0(statement, " dose_era_start_date = '", dose_era_start_date,"'")
    }
  }
  
  if (!missing(dose_era_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(dose_era_end_date)) {
      statement <- paste0(statement, ' dose_era_end_date IS NULL')
    } else if (is(dose_era_end_date, 'subQuery')){
      statement <- paste0(statement, ' dose_era_end_date = (', as.character(dose_era_end_date), ')')
    } else {
      statement <- paste0(statement, " dose_era_end_date = '", dose_era_end_date,"'")
    }
  }
  
  statement <- paste0(statement, ') != ', rowCount , " THEN 'FAIL' ELSE 'PASS' END AS status")
  if (exists('testNewExpected', where = globalenv()) && get('testNewExpected'))
  {
    assign('testNewExpected', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    testSql <<- c(testSql, comment)
  }
  testSql <<- c(testSql, statement)
  invisible(statement)
}

expect_count_condition_era <- function(rowCount, condition_era_id, person_id, condition_concept_id, condition_era_start_date, condition_era_end_date, condition_occurrence_count) {
  #statement <- paste0("INSERT INTO @cdmDatabaseSchema.test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect condition_era' AS test, CASE WHEN(SELECT COUNT(*) from @cdmDatabaseSchema.condition_era WHERE")
  statement <- getExpectStatement(domain = "condition_era", table = "condition_era")
  first <- TRUE
  if (!missing(condition_era_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(condition_era_id)) {
      statement <- paste0(statement, ' condition_era_id IS NULL')
    } else if (is(condition_era_id, 'subQuery')){
      statement <- paste0(statement, ' condition_era_id = (', as.character(condition_era_id), ')')
    } else {
      statement <- paste0(statement, " condition_era_id = '", condition_era_id,"'")
    }
  }
  
  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, ' person_id IS NULL')
    } else if (is(person_id, 'subQuery')){
      statement <- paste0(statement, ' person_id = (', as.character(person_id), ')')
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }
  
  if (!missing(condition_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(condition_concept_id)) {
      statement <- paste0(statement, ' condition_concept_id IS NULL')
    } else if (is(condition_concept_id, 'subQuery')){
      statement <- paste0(statement, ' condition_concept_id = (', as.character(condition_concept_id), ')')
    } else {
      statement <- paste0(statement, " condition_concept_id = '", condition_concept_id,"'")
    }
  }
  
  if (!missing(condition_era_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(condition_era_start_date)) {
      statement <- paste0(statement, ' condition_era_start_date IS NULL')
    } else if (is(condition_era_start_date, 'subQuery')){
      statement <- paste0(statement, ' condition_era_start_date = (', as.character(condition_era_start_date), ')')
    } else {
      statement <- paste0(statement, " condition_era_start_date = '", condition_era_start_date,"'")
    }
  }
  
  if (!missing(condition_era_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(condition_era_end_date)) {
      statement <- paste0(statement, ' condition_era_end_date IS NULL')
    } else if (is(condition_era_end_date, 'subQuery')){
      statement <- paste0(statement, ' condition_era_end_date = (', as.character(condition_era_end_date), ')')
    } else {
      statement <- paste0(statement, " condition_era_end_date = '", condition_era_end_date,"'")
    }
  }
  
  if (!missing(condition_occurrence_count)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(condition_occurrence_count)) {
      statement <- paste0(statement, ' condition_occurrence_count IS NULL')
    } else if (is(condition_occurrence_count, 'subQuery')){
      statement <- paste0(statement, ' condition_occurrence_count = (', as.character(condition_occurrence_count), ')')
    } else {
      statement <- paste0(statement, " condition_occurrence_count = '", condition_occurrence_count,"'")
    }
  }
  
  statement <- paste0(statement, ') != ', rowCount , " THEN 'FAIL' ELSE 'PASS' END AS status")
  if (exists('testNewExpected', where = globalenv()) && get('testNewExpected'))
  {
    assign('testNewExpected', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    testSql <<- c(testSql, comment)
  }
  testSql <<- c(testSql, statement)
  invisible(statement)
}

expect_count_cdm_source <- function(rowCount, cdm_source_name, cdm_source_abbreviation, cdm_holder, source_description, source_documentation_reference, cdm_etl_reference, source_release_date, cdm_release_date, cdm_version, vocabulary_version) {
  #statement <- paste0("INSERT INTO @cdmDatabaseSchema.test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect cdm_source' AS test, CASE WHEN(SELECT COUNT(*) FROM cdm_source WHERE")
  statement <- getExpectStatement(domain = "cdm_source", table = "cdm_source")
  first <- TRUE
  if (!missing(cdm_source_name)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cdm_source_name)) {
      statement <- paste0(statement, ' cdm_source_name IS NULL')
    } else if (is(cdm_source_name, 'subQuery')){
      statement <- paste0(statement, ' cdm_source_name = (', as.character(cdm_source_name), ')')
    } else {
      statement <- paste0(statement, " cdm_source_name = '", cdm_source_name,"'")
    }
  }
  
  if (!missing(cdm_source_abbreviation)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cdm_source_abbreviation)) {
      statement <- paste0(statement, ' cdm_source_abbreviation IS NULL')
    } else if (is(cdm_source_abbreviation, 'subQuery')){
      statement <- paste0(statement, ' cdm_source_abbreviation = (', as.character(cdm_source_abbreviation), ')')
    } else {
      statement <- paste0(statement, " cdm_source_abbreviation = '", cdm_source_abbreviation,"'")
    }
  }
  
  if (!missing(cdm_holder)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cdm_holder)) {
      statement <- paste0(statement, ' cdm_holder IS NULL')
    } else if (is(cdm_holder, 'subQuery')){
      statement <- paste0(statement, ' cdm_holder = (', as.character(cdm_holder), ')')
    } else {
      statement <- paste0(statement, " cdm_holder = '", cdm_holder,"'")
    }
  }
  
  if (!missing(source_description)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(source_description)) {
      statement <- paste0(statement, ' source_description IS NULL')
    } else if (is(source_description, 'subQuery')){
      statement <- paste0(statement, ' source_description = (', as.character(source_description), ')')
    } else {
      statement <- paste0(statement, " source_description = '", source_description,"'")
    }
  }
  
  if (!missing(source_documentation_reference)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(source_documentation_reference)) {
      statement <- paste0(statement, ' source_documentation_reference IS NULL')
    } else if (is(source_documentation_reference, 'subQuery')){
      statement <- paste0(statement, ' source_documentation_reference = (', as.character(source_documentation_reference), ')')
    } else {
      statement <- paste0(statement, " source_documentation_reference = '", source_documentation_reference,"'")
    }
  }
  
  if (!missing(cdm_etl_reference)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cdm_etl_reference)) {
      statement <- paste0(statement, ' cdm_etl_reference IS NULL')
    } else if (is(cdm_etl_reference, 'subQuery')){
      statement <- paste0(statement, ' cdm_etl_reference = (', as.character(cdm_etl_reference), ')')
    } else {
      statement <- paste0(statement, " cdm_etl_reference = '", cdm_etl_reference,"'")
    }
  }
  
  if (!missing(source_release_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(source_release_date)) {
      statement <- paste0(statement, ' source_release_date IS NULL')
    } else if (is(source_release_date, 'subQuery')){
      statement <- paste0(statement, ' source_release_date = (', as.character(source_release_date), ')')
    } else {
      statement <- paste0(statement, " source_release_date = '", source_release_date,"'")
    }
  }
  
  if (!missing(cdm_release_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cdm_release_date)) {
      statement <- paste0(statement, ' cdm_release_date IS NULL')
    } else if (is(cdm_release_date, 'subQuery')){
      statement <- paste0(statement, ' cdm_release_date = (', as.character(cdm_release_date), ')')
    } else {
      statement <- paste0(statement, " cdm_release_date = '", cdm_release_date,"'")
    }
  }
  
  if (!missing(cdm_version)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cdm_version)) {
      statement <- paste0(statement, ' cdm_version IS NULL')
    } else if (is(cdm_version, 'subQuery')){
      statement <- paste0(statement, ' cdm_version = (', as.character(cdm_version), ')')
    } else {
      statement <- paste0(statement, " cdm_version = '", cdm_version,"'")
    }
  }
  
  if (!missing(vocabulary_version)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(vocabulary_version)) {
      statement <- paste0(statement, ' vocabulary_version IS NULL')
    } else if (is(vocabulary_version, 'subQuery')){
      statement <- paste0(statement, ' vocabulary_version = (', as.character(vocabulary_version), ')')
    } else {
      statement <- paste0(statement, " vocabulary_version = '", vocabulary_version,"'")
    }
  }
  
  statement <- paste0(statement, ') != ', rowCount , " THEN 'FAIL' ELSE 'PASS' END AS status")
  if (exists('testNewExpected', where = globalenv()) && get('testNewExpected'))
  {
    assign('testNewExpected', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    testSql <<- c(testSql, comment)
  }
  testSql <<- c(testSql, statement)
  invisible(statement)
}

expect_count_cohort <- function(rowCount, cohort_definition_id, subject_id, cohort_start_date, cohort_end_date) {
  #statement <- paste0("INSERT INTO @cdmDatabaseSchema.test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect cohort' AS test, CASE WHEN(SELECT COUNT(*) FROM cohort WHERE")
  statement <- getExpectStatement(domain = "cohort", table = "cohort")
  first <- TRUE
  if (!missing(cohort_definition_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cohort_definition_id)) {
      statement <- paste0(statement, ' cohort_definition_id IS NULL')
    } else if (is(cohort_definition_id, 'subQuery')){
      statement <- paste0(statement, ' cohort_definition_id = (', as.character(cohort_definition_id), ')')
    } else {
      statement <- paste0(statement, " cohort_definition_id = '", cohort_definition_id,"'")
    }
  }
  
  if (!missing(subject_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(subject_id)) {
      statement <- paste0(statement, ' subject_id IS NULL')
    } else if (is(subject_id, 'subQuery')){
      statement <- paste0(statement, ' subject_id = (', as.character(subject_id), ')')
    } else {
      statement <- paste0(statement, " subject_id = '", subject_id,"'")
    }
  }
  
  if (!missing(cohort_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cohort_start_date)) {
      statement <- paste0(statement, ' cohort_start_date IS NULL')
    } else if (is(cohort_start_date, 'subQuery')){
      statement <- paste0(statement, ' cohort_start_date = (', as.character(cohort_start_date), ')')
    } else {
      statement <- paste0(statement, " cohort_start_date = '", cohort_start_date,"'")
    }
  }
  
  if (!missing(cohort_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cohort_end_date)) {
      statement <- paste0(statement, ' cohort_end_date IS NULL')
    } else if (is(cohort_end_date, 'subQuery')){
      statement <- paste0(statement, ' cohort_end_date = (', as.character(cohort_end_date), ')')
    } else {
      statement <- paste0(statement, " cohort_end_date = '", cohort_end_date,"'")
    }
  }
  
  statement <- paste0(statement, ') != ', rowCount , " THEN 'FAIL' ELSE 'PASS' END AS status")
  if (exists('testNewExpected', where = globalenv()) && get('testNewExpected'))
  {
    assign('testNewExpected', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    testSql <<- c(testSql, comment)
  }
  testSql <<- c(testSql, statement)
  invisible(statement)
}

expect_count_cohort_definition <- function(rowCount, cohort_definition_id, cohort_definition_name, cohort_definition_description, definition_type_concept_id, cohort_definition_syntax, subject_concept_id, cohort_instantiation_date) {
  #statement <- paste0("INSERT INTO @cdmDatabaseSchema.test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect cohort_definition' AS test, CASE WHEN(SELECT COUNT(*) FROM cohort_definition WHERE")
  statement <- getExpectStatement(domain = "cohort_definition", table = "cohort_definition")
  first <- TRUE
  if (!missing(cohort_definition_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cohort_definition_id)) {
      statement <- paste0(statement, ' cohort_definition_id IS NULL')
    } else if (is(cohort_definition_id, 'subQuery')){
      statement <- paste0(statement, ' cohort_definition_id = (', as.character(cohort_definition_id), ')')
    } else {
      statement <- paste0(statement, " cohort_definition_id = '", cohort_definition_id,"'")
    }
  }
  
  if (!missing(cohort_definition_name)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cohort_definition_name)) {
      statement <- paste0(statement, ' cohort_definition_name IS NULL')
    } else if (is(cohort_definition_name, 'subQuery')){
      statement <- paste0(statement, ' cohort_definition_name = (', as.character(cohort_definition_name), ')')
    } else {
      statement <- paste0(statement, " cohort_definition_name = '", cohort_definition_name,"'")
    }
  }
  
  if (!missing(cohort_definition_description)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cohort_definition_description)) {
      statement <- paste0(statement, ' cohort_definition_description IS NULL')
    } else if (is(cohort_definition_description, 'subQuery')){
      statement <- paste0(statement, ' cohort_definition_description = (', as.character(cohort_definition_description), ')')
    } else {
      statement <- paste0(statement, " cohort_definition_description = '", cohort_definition_description,"'")
    }
  }
  
  if (!missing(definition_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(definition_type_concept_id)) {
      statement <- paste0(statement, ' definition_type_concept_id IS NULL')
    } else if (is(definition_type_concept_id, 'subQuery')){
      statement <- paste0(statement, ' definition_type_concept_id = (', as.character(definition_type_concept_id), ')')
    } else {
      statement <- paste0(statement, " definition_type_concept_id = '", definition_type_concept_id,"'")
    }
  }
  
  if (!missing(cohort_definition_syntax)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cohort_definition_syntax)) {
      statement <- paste0(statement, ' cohort_definition_syntax IS NULL')
    } else if (is(cohort_definition_syntax, 'subQuery')){
      statement <- paste0(statement, ' cohort_definition_syntax = (', as.character(cohort_definition_syntax), ')')
    } else {
      statement <- paste0(statement, " cohort_definition_syntax = '", cohort_definition_syntax,"'")
    }
  }
  
  if (!missing(subject_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(subject_concept_id)) {
      statement <- paste0(statement, ' subject_concept_id IS NULL')
    } else if (is(subject_concept_id, 'subQuery')){
      statement <- paste0(statement, ' subject_concept_id = (', as.character(subject_concept_id), ')')
    } else {
      statement <- paste0(statement, " subject_concept_id = '", subject_concept_id,"'")
    }
  }
  
  if (!missing(cohort_instantiation_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cohort_instantiation_date)) {
      statement <- paste0(statement, ' cohort_instantiation_date IS NULL')
    } else if (is(cohort_instantiation_date, 'subQuery')){
      statement <- paste0(statement, ' cohort_instantiation_date = (', as.character(cohort_instantiation_date), ')')
    } else {
      statement <- paste0(statement, " cohort_instantiation_date = '", cohort_instantiation_date,"'")
    }
  }
  
  statement <- paste0(statement, ') != ', rowCount , " THEN 'FAIL' ELSE 'PASS' END AS status")
  if (exists('testNewExpected', where = globalenv()) && get('testNewExpected'))
  {
    assign('testNewExpected', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    testSql <<- c(testSql, comment)
  }
  testSql <<- c(testSql, statement)
  invisible(statement)
}

expect_count_cohort_attribute <- function(rowCount, cohort_definition_id, cohort_start_date, cohort_end_date, subject_id, attribute_definition_id, value_as_number, value_as_concept_id) {
  #statement <- paste0("INSERT INTO @cdmDatabaseSchema.test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect cohort_attribute' AS test, CASE WHEN(SELECT COUNT(*) FROM cohort_attribute WHERE")
  statement <- getExpectStatement(domain = "cohort_attribute", table = "cohort_attribute")
  first <- TRUE
  if (!missing(cohort_definition_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cohort_definition_id)) {
      statement <- paste0(statement, ' cohort_definition_id IS NULL')
    } else if (is(cohort_definition_id, 'subQuery')){
      statement <- paste0(statement, ' cohort_definition_id = (', as.character(cohort_definition_id), ')')
    } else {
      statement <- paste0(statement, " cohort_definition_id = '", cohort_definition_id,"'")
    }
  }
  
  if (!missing(cohort_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cohort_start_date)) {
      statement <- paste0(statement, ' cohort_start_date IS NULL')
    } else if (is(cohort_start_date, 'subQuery')){
      statement <- paste0(statement, ' cohort_start_date = (', as.character(cohort_start_date), ')')
    } else {
      statement <- paste0(statement, " cohort_start_date = '", cohort_start_date,"'")
    }
  }
  
  if (!missing(cohort_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cohort_end_date)) {
      statement <- paste0(statement, ' cohort_end_date IS NULL')
    } else if (is(cohort_end_date, 'subQuery')){
      statement <- paste0(statement, ' cohort_end_date = (', as.character(cohort_end_date), ')')
    } else {
      statement <- paste0(statement, " cohort_end_date = '", cohort_end_date,"'")
    }
  }
  
  if (!missing(subject_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(subject_id)) {
      statement <- paste0(statement, ' subject_id IS NULL')
    } else if (is(subject_id, 'subQuery')){
      statement <- paste0(statement, ' subject_id = (', as.character(subject_id), ')')
    } else {
      statement <- paste0(statement, " subject_id = '", subject_id,"'")
    }
  }
  
  if (!missing(attribute_definition_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(attribute_definition_id)) {
      statement <- paste0(statement, ' attribute_definition_id IS NULL')
    } else if (is(attribute_definition_id, 'subQuery')){
      statement <- paste0(statement, ' attribute_definition_id = (', as.character(attribute_definition_id), ')')
    } else {
      statement <- paste0(statement, " attribute_definition_id = '", attribute_definition_id,"'")
    }
  }
  
  if (!missing(value_as_number)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(value_as_number)) {
      statement <- paste0(statement, ' value_as_number IS NULL')
    } else if (is(value_as_number, 'subQuery')){
      statement <- paste0(statement, ' value_as_number = (', as.character(value_as_number), ')')
    } else {
      statement <- paste0(statement, " value_as_number = '", value_as_number,"'")
    }
  }
  
  if (!missing(value_as_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(value_as_concept_id)) {
      statement <- paste0(statement, ' value_as_concept_id IS NULL')
    } else if (is(value_as_concept_id, 'subQuery')){
      statement <- paste0(statement, ' value_as_concept_id = (', as.character(value_as_concept_id), ')')
    } else {
      statement <- paste0(statement, " value_as_concept_id = '", value_as_concept_id,"'")
    }
  }
  
  statement <- paste0(statement, ') != ', rowCount , " THEN 'FAIL' ELSE 'PASS' END AS status")
  if (exists('testNewExpected', where = globalenv()) && get('testNewExpected'))
  {
    assign('testNewExpected', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    testSql <<- c(testSql, comment)
  }
  testSql <<- c(testSql, statement)
  invisible(statement)
}

expect_count_attribute_definition <- function(rowCount, attribute_definition_id, attribute_name, attribute_description, attribute_type_concept_id, attribute_syntax) {
  #statement <- paste0("INSERT INTO @cdmDatabaseSchema.test_results SELECT ", get("testId", envir = globalenv()), " AS id, '", get("testDescription", envir = globalenv()), "' AS description, 'Expect attribute_definition' AS test, CASE WHEN(SELECT COUNT(*) FROM attribute_definition WHERE")
  statement <- getExpectStatement(domain = "attribute_definition", table = "attribute_definition")
  first <- TRUE
  if (!missing(attribute_definition_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(attribute_definition_id)) {
      statement <- paste0(statement, ' attribute_definition_id IS NULL')
    } else if (is(attribute_definition_id, 'subQuery')){
      statement <- paste0(statement, ' attribute_definition_id = (', as.character(attribute_definition_id), ')')
    } else {
      statement <- paste0(statement, " attribute_definition_id = '", attribute_definition_id,"'")
    }
  }
  
  if (!missing(attribute_name)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(attribute_name)) {
      statement <- paste0(statement, ' attribute_name IS NULL')
    } else if (is(attribute_name, 'subQuery')){
      statement <- paste0(statement, ' attribute_name = (', as.character(attribute_name), ')')
    } else {
      statement <- paste0(statement, " attribute_name = '", attribute_name,"'")
    }
  }
  
  if (!missing(attribute_description)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(attribute_description)) {
      statement <- paste0(statement, ' attribute_description IS NULL')
    } else if (is(attribute_description, 'subQuery')){
      statement <- paste0(statement, ' attribute_description = (', as.character(attribute_description), ')')
    } else {
      statement <- paste0(statement, " attribute_description = '", attribute_description,"'")
    }
  }
  
  if (!missing(attribute_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(attribute_type_concept_id)) {
      statement <- paste0(statement, ' attribute_type_concept_id IS NULL')
    } else if (is(attribute_type_concept_id, 'subQuery')){
      statement <- paste0(statement, ' attribute_type_concept_id = (', as.character(attribute_type_concept_id), ')')
    } else {
      statement <- paste0(statement, " attribute_type_concept_id = '", attribute_type_concept_id,"'")
    }
  }
  
  if (!missing(attribute_syntax)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(attribute_syntax)) {
      statement <- paste0(statement, ' attribute_syntax IS NULL')
    } else if (is(attribute_syntax, 'subQuery')){
      statement <- paste0(statement, ' attribute_syntax = (', as.character(attribute_syntax), ')')
    } else {
      statement <- paste0(statement, " attribute_syntax = '", attribute_syntax,"'")
    }
  }
  
  statement <- paste0(statement, ') != ', rowCount , " THEN 'FAIL' ELSE 'PASS' END AS status")
  if (exists('testNewExpected', where = globalenv()) && get('testNewExpected'))
  {
    assign('testNewExpected', FALSE, envir = globalenv())
    id <- get('testId', envir = globalenv())
    description <- get('testDescription', envir = globalenv())
    comment <- paste0('-- ', id, ': ', description)
    testSql <<- c(testSql, comment)
  }
  testSql <<- c(testSql, statement)
  invisible(statement)
}

lookup_measurement <- function(fetchField, measurement_id, person_id, measurement_concept_id, measurement_date, measurement_datetime, measurement_type_concept_id, operator_concept_id, value_as_number, value_as_concept_id, unit_concept_id, range_low, range_high, provider_id, visit_occurrence_id, measurement_source_value, measurement_source_concept_id, unit_source_value, value_source_value) {
  statement <- paste0('SELECT ', fetchField , ' from @cdmDatabaseSchema.measurement WHERE')
  first <- TRUE
  if (!missing(measurement_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(measurement_id)) {
      statement <- paste0(statement, ' measurement_id IS NULL')
    } else if (is(measurement_id, 'subQuery')){
      statement <- paste0(statement, ' measurement_id = (', as.character(measurement_id), ')')
    } else {
      statement <- paste0(statement, " measurement_id = '", measurement_id,"'")
    }
  }
  
  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, ' person_id IS NULL')
    } else if (is(person_id, 'subQuery')){
      statement <- paste0(statement, ' person_id = (', as.character(person_id), ')')
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }
  
  if (!missing(measurement_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(measurement_concept_id)) {
      statement <- paste0(statement, ' measurement_concept_id IS NULL')
    } else if (is(measurement_concept_id, 'subQuery')){
      statement <- paste0(statement, ' measurement_concept_id = (', as.character(measurement_concept_id), ')')
    } else {
      statement <- paste0(statement, " measurement_concept_id = '", measurement_concept_id,"'")
    }
  }
  
  if (!missing(measurement_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(measurement_date)) {
      statement <- paste0(statement, ' measurement_date IS NULL')
    } else if (is(measurement_date, 'subQuery')){
      statement <- paste0(statement, ' measurement_date = (', as.character(measurement_date), ')')
    } else {
      statement <- paste0(statement, " measurement_date = '", measurement_date,"'")
    }
  }
  
  if (!missing(measurement_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(measurement_datetime)) {
      statement <- paste0(statement, ' measurement_datetime IS NULL')
    } else if (is(measurement_datetime, 'subQuery')){
      statement <- paste0(statement, ' measurement_datetime = (', as.character(measurement_datetime), ')')
    } else {
      statement <- paste0(statement, " measurement_datetime = '", measurement_datetime,"'")
    }
  }
  
  if (!missing(measurement_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(measurement_type_concept_id)) {
      statement <- paste0(statement, ' measurement_type_concept_id IS NULL')
    } else if (is(measurement_type_concept_id, 'subQuery')){
      statement <- paste0(statement, ' measurement_type_concept_id = (', as.character(measurement_type_concept_id), ')')
    } else {
      statement <- paste0(statement, " measurement_type_concept_id = '", measurement_type_concept_id,"'")
    }
  }
  
  if (!missing(operator_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(operator_concept_id)) {
      statement <- paste0(statement, ' operator_concept_id IS NULL')
    } else if (is(operator_concept_id, 'subQuery')){
      statement <- paste0(statement, ' operator_concept_id = (', as.character(operator_concept_id), ')')
    } else {
      statement <- paste0(statement, " operator_concept_id = '", operator_concept_id,"'")
    }
  }
  
  if (!missing(value_as_number)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(value_as_number)) {
      statement <- paste0(statement, ' value_as_number IS NULL')
    } else if (is(value_as_number, 'subQuery')){
      statement <- paste0(statement, ' value_as_number = (', as.character(value_as_number), ')')
    } else {
      statement <- paste0(statement, " value_as_number = '", value_as_number,"'")
    }
  }
  
  if (!missing(value_as_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(value_as_concept_id)) {
      statement <- paste0(statement, ' value_as_concept_id IS NULL')
    } else if (is(value_as_concept_id, 'subQuery')){
      statement <- paste0(statement, ' value_as_concept_id = (', as.character(value_as_concept_id), ')')
    } else {
      statement <- paste0(statement, " value_as_concept_id = '", value_as_concept_id,"'")
    }
  }
  
  if (!missing(unit_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(unit_concept_id)) {
      statement <- paste0(statement, ' unit_concept_id IS NULL')
    } else if (is(unit_concept_id, 'subQuery')){
      statement <- paste0(statement, ' unit_concept_id = (', as.character(unit_concept_id), ')')
    } else {
      statement <- paste0(statement, " unit_concept_id = '", unit_concept_id,"'")
    }
  }
  
  if (!missing(range_low)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(range_low)) {
      statement <- paste0(statement, ' range_low IS NULL')
    } else if (is(range_low, 'subQuery')){
      statement <- paste0(statement, ' range_low = (', as.character(range_low), ')')
    } else {
      statement <- paste0(statement, " range_low = '", range_low,"'")
    }
  }
  
  if (!missing(range_high)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(range_high)) {
      statement <- paste0(statement, ' range_high IS NULL')
    } else if (is(range_high, 'subQuery')){
      statement <- paste0(statement, ' range_high = (', as.character(range_high), ')')
    } else {
      statement <- paste0(statement, " range_high = '", range_high,"'")
    }
  }
  
  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, ' provider_id IS NULL')
    } else if (is(provider_id, 'subQuery')){
      statement <- paste0(statement, ' provider_id = (', as.character(provider_id), ')')
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }
  
  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, ' visit_occurrence_id IS NULL')
    } else if (is(visit_occurrence_id, 'subQuery')){
      statement <- paste0(statement, ' visit_occurrence_id = (', as.character(visit_occurrence_id), ')')
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }
  
  if (!missing(measurement_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(measurement_source_value)) {
      statement <- paste0(statement, ' measurement_source_value IS NULL')
    } else if (is(measurement_source_value, 'subQuery')){
      statement <- paste0(statement, ' measurement_source_value = (', as.character(measurement_source_value), ')')
    } else {
      statement <- paste0(statement, " measurement_source_value = '", measurement_source_value,"'")
    }
  }
  
  if (!missing(measurement_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(measurement_source_concept_id)) {
      statement <- paste0(statement, ' measurement_source_concept_id IS NULL')
    } else if (is(measurement_source_concept_id, 'subQuery')){
      statement <- paste0(statement, ' measurement_source_concept_id = (', as.character(measurement_source_concept_id), ')')
    } else {
      statement <- paste0(statement, " measurement_source_concept_id = '", measurement_source_concept_id,"'")
    }
  }
  
  if (!missing(unit_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(unit_source_value)) {
      statement <- paste0(statement, ' unit_source_value IS NULL')
    } else if (is(unit_source_value, 'subQuery')){
      statement <- paste0(statement, ' unit_source_value = (', as.character(unit_source_value), ')')
    } else {
      statement <- paste0(statement, " unit_source_value = '", unit_source_value,"'")
    }
  }
  
  if (!missing(value_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(value_source_value)) {
      statement <- paste0(statement, ' value_source_value IS NULL')
    } else if (is(value_source_value, 'subQuery')){
      statement <- paste0(statement, ' value_source_value = (', as.character(value_source_value), ')')
    } else {
      statement <- paste0(statement, " value_source_value = '", value_source_value,"'")
    }
  }
  
  class(statement) <- 'subQuery'
  return(statement)
}

lookup_condition_occurrence <- function(fetchField, condition_occurrence_id, person_id, condition_concept_id, condition_start_date, condition_start_datetime, condition_end_date, condition_end_datetime, condition_type_concept_id, stop_reason, provider_id, visit_occurrence_id, condition_source_value, condition_source_concept_id) {
  statement <- paste0('SELECT ', fetchField , ' from @cdmDatabaseSchema.condition_occurrence WHERE')
  first <- TRUE
  if (!missing(condition_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(condition_occurrence_id)) {
      statement <- paste0(statement, ' condition_occurrence_id IS NULL')
    } else if (is(condition_occurrence_id, 'subQuery')){
      statement <- paste0(statement, ' condition_occurrence_id = (', as.character(condition_occurrence_id), ')')
    } else {
      statement <- paste0(statement, " condition_occurrence_id = '", condition_occurrence_id,"'")
    }
  }
  
  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, ' person_id IS NULL')
    } else if (is(person_id, 'subQuery')){
      statement <- paste0(statement, ' person_id = (', as.character(person_id), ')')
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }
  
  if (!missing(condition_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(condition_concept_id)) {
      statement <- paste0(statement, ' condition_concept_id IS NULL')
    } else if (is(condition_concept_id, 'subQuery')){
      statement <- paste0(statement, ' condition_concept_id = (', as.character(condition_concept_id), ')')
    } else {
      statement <- paste0(statement, " condition_concept_id = '", condition_concept_id,"'")
    }
  }
  
  if (!missing(condition_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(condition_start_date)) {
      statement <- paste0(statement, ' condition_start_date IS NULL')
    } else if (is(condition_start_date, 'subQuery')){
      statement <- paste0(statement, ' condition_start_date = (', as.character(condition_start_date), ')')
    } else {
      statement <- paste0(statement, " condition_start_date = '", condition_start_date,"'")
    }
  }
  
  if (!missing(condition_start_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(condition_start_datetime)) {
      statement <- paste0(statement, ' condition_start_datetime IS NULL')
    } else if (is(condition_start_datetime, 'subQuery')){
      statement <- paste0(statement, ' condition_start_datetime = (', as.character(condition_start_datetime), ')')
    } else {
      statement <- paste0(statement, " condition_start_datetime = '", condition_start_datetime,"'")
    }
  }
  
  if (!missing(condition_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(condition_end_date)) {
      statement <- paste0(statement, ' condition_end_date IS NULL')
    } else if (is(condition_end_date, 'subQuery')){
      statement <- paste0(statement, ' condition_end_date = (', as.character(condition_end_date), ')')
    } else {
      statement <- paste0(statement, " condition_end_date = '", condition_end_date,"'")
    }
  }
  
  if (!missing(condition_end_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(condition_end_datetime)) {
      statement <- paste0(statement, ' condition_end_datetime IS NULL')
    } else if (is(condition_end_datetime, 'subQuery')){
      statement <- paste0(statement, ' condition_end_datetime = (', as.character(condition_end_datetime), ')')
    } else {
      statement <- paste0(statement, " condition_end_datetime = '", condition_end_datetime,"'")
    }
  }
  
  if (!missing(condition_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(condition_type_concept_id)) {
      statement <- paste0(statement, ' condition_type_concept_id IS NULL')
    } else if (is(condition_type_concept_id, 'subQuery')){
      statement <- paste0(statement, ' condition_type_concept_id = (', as.character(condition_type_concept_id), ')')
    } else {
      statement <- paste0(statement, " condition_type_concept_id = '", condition_type_concept_id,"'")
    }
  }
  
  if (!missing(stop_reason)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(stop_reason)) {
      statement <- paste0(statement, ' stop_reason IS NULL')
    } else if (is(stop_reason, 'subQuery')){
      statement <- paste0(statement, ' stop_reason = (', as.character(stop_reason), ')')
    } else {
      statement <- paste0(statement, " stop_reason = '", stop_reason,"'")
    }
  }
  
  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, ' provider_id IS NULL')
    } else if (is(provider_id, 'subQuery')){
      statement <- paste0(statement, ' provider_id = (', as.character(provider_id), ')')
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }
  
  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, ' visit_occurrence_id IS NULL')
    } else if (is(visit_occurrence_id, 'subQuery')){
      statement <- paste0(statement, ' visit_occurrence_id = (', as.character(visit_occurrence_id), ')')
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }
  
  if (!missing(condition_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(condition_source_value)) {
      statement <- paste0(statement, ' condition_source_value IS NULL')
    } else if (is(condition_source_value, 'subQuery')){
      statement <- paste0(statement, ' condition_source_value = (', as.character(condition_source_value), ')')
    } else {
      statement <- paste0(statement, " condition_source_value = '", condition_source_value,"'")
    }
  }
  
  if (!missing(condition_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(condition_source_concept_id)) {
      statement <- paste0(statement, ' condition_source_concept_id IS NULL')
    } else if (is(condition_source_concept_id, 'subQuery')){
      statement <- paste0(statement, ' condition_source_concept_id = (', as.character(condition_source_concept_id), ')')
    } else {
      statement <- paste0(statement, " condition_source_concept_id = '", condition_source_concept_id,"'")
    }
  }
  
  class(statement) <- 'subQuery'
  return(statement)
}

lookup_location <- function(fetchField, location_id, address_1, address_2, city, state, zip, county, location_source_value) {
  statement <- paste0('SELECT ', fetchField , ' from @cdmDatabaseSchema.location WHERE')
  first <- TRUE
  if (!missing(location_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(location_id)) {
      statement <- paste0(statement, ' location_id IS NULL')
    } else if (is(location_id, 'subQuery')){
      statement <- paste0(statement, ' location_id = (', as.character(location_id), ')')
    } else {
      statement <- paste0(statement, " location_id = '", location_id,"'")
    }
  }
  
  if (!missing(address_1)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(address_1)) {
      statement <- paste0(statement, ' address_1 IS NULL')
    } else if (is(address_1, 'subQuery')){
      statement <- paste0(statement, ' address_1 = (', as.character(address_1), ')')
    } else {
      statement <- paste0(statement, " address_1 = '", address_1,"'")
    }
  }
  
  if (!missing(address_2)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(address_2)) {
      statement <- paste0(statement, ' address_2 IS NULL')
    } else if (is(address_2, 'subQuery')){
      statement <- paste0(statement, ' address_2 = (', as.character(address_2), ')')
    } else {
      statement <- paste0(statement, " address_2 = '", address_2,"'")
    }
  }
  
  if (!missing(city)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(city)) {
      statement <- paste0(statement, ' city IS NULL')
    } else if (is(city, 'subQuery')){
      statement <- paste0(statement, ' city = (', as.character(city), ')')
    } else {
      statement <- paste0(statement, " city = '", city,"'")
    }
  }
  
  if (!missing(state)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(state)) {
      statement <- paste0(statement, ' state IS NULL')
    } else if (is(state, 'subQuery')){
      statement <- paste0(statement, ' state = (', as.character(state), ')')
    } else {
      statement <- paste0(statement, " state = '", state,"'")
    }
  }
  
  if (!missing(zip)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(zip)) {
      statement <- paste0(statement, ' zip IS NULL')
    } else if (is(zip, 'subQuery')){
      statement <- paste0(statement, ' zip = (', as.character(zip), ')')
    } else {
      statement <- paste0(statement, " zip = '", zip,"'")
    }
  }
  
  if (!missing(county)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(county)) {
      statement <- paste0(statement, ' county IS NULL')
    } else if (is(county, 'subQuery')){
      statement <- paste0(statement, ' county = (', as.character(county), ')')
    } else {
      statement <- paste0(statement, " county = '", county,"'")
    }
  }
  
  if (!missing(location_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(location_source_value)) {
      statement <- paste0(statement, ' location_source_value IS NULL')
    } else if (is(location_source_value, 'subQuery')){
      statement <- paste0(statement, ' location_source_value = (', as.character(location_source_value), ')')
    } else {
      statement <- paste0(statement, " location_source_value = '", location_source_value,"'")
    }
  }
  
  class(statement) <- 'subQuery'
  return(statement)
}

lookup_person <- function(fetchField, person_id, person_source_value, gender_concept_id, gender_source_value, year_of_birth, month_of_birth, day_of_birth, race_concept_id, ethnicity_concept_id, birth_datetime, location_id, provider_id, care_site_id, gender_source_concept_id, race_source_value, race_source_concept_id, ethnicity_source_value, ethnicity_source_concept_id) {
  statement <- paste0('SELECT ', fetchField , ' from @cdmDatabaseSchema.person WHERE')
  first <- TRUE
  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, ' person_id IS NULL')
    } else if (is(person_id, 'subQuery')){
      statement <- paste0(statement, ' person_id = (', as.character(person_id), ')')
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }
  
  if (!missing(person_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(person_source_value)) {
      statement <- paste0(statement, ' person_source_value IS NULL')
    } else if (is(person_source_value, 'subQuery')){
      statement <- paste0(statement, ' person_source_value = (', as.character(person_source_value), ')')
    } else {
      statement <- paste0(statement, " person_source_value = '", person_source_value,"'")
    }
  }
  
  if (!missing(gender_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(gender_concept_id)) {
      statement <- paste0(statement, ' gender_concept_id IS NULL')
    } else if (is(gender_concept_id, 'subQuery')){
      statement <- paste0(statement, ' gender_concept_id = (', as.character(gender_concept_id), ')')
    } else {
      statement <- paste0(statement, " gender_concept_id = '", gender_concept_id,"'")
    }
  }
  
  if (!missing(gender_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(gender_source_value)) {
      statement <- paste0(statement, ' gender_source_value IS NULL')
    } else if (is(gender_source_value, 'subQuery')){
      statement <- paste0(statement, ' gender_source_value = (', as.character(gender_source_value), ')')
    } else {
      statement <- paste0(statement, " gender_source_value = '", gender_source_value,"'")
    }
  }
  
  if (!missing(year_of_birth)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(year_of_birth)) {
      statement <- paste0(statement, ' year_of_birth IS NULL')
    } else if (is(year_of_birth, 'subQuery')){
      statement <- paste0(statement, ' year_of_birth = (', as.character(year_of_birth), ')')
    } else {
      statement <- paste0(statement, " year_of_birth = '", year_of_birth,"'")
    }
  }
  
  if (!missing(month_of_birth)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(month_of_birth)) {
      statement <- paste0(statement, ' month_of_birth IS NULL')
    } else if (is(month_of_birth, 'subQuery')){
      statement <- paste0(statement, ' month_of_birth = (', as.character(month_of_birth), ')')
    } else {
      statement <- paste0(statement, " month_of_birth = '", month_of_birth,"'")
    }
  }
  
  if (!missing(day_of_birth)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(day_of_birth)) {
      statement <- paste0(statement, ' day_of_birth IS NULL')
    } else if (is(day_of_birth, 'subQuery')){
      statement <- paste0(statement, ' day_of_birth = (', as.character(day_of_birth), ')')
    } else {
      statement <- paste0(statement, " day_of_birth = '", day_of_birth,"'")
    }
  }
  
  if (!missing(race_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(race_concept_id)) {
      statement <- paste0(statement, ' race_concept_id IS NULL')
    } else if (is(race_concept_id, 'subQuery')){
      statement <- paste0(statement, ' race_concept_id = (', as.character(race_concept_id), ')')
    } else {
      statement <- paste0(statement, " race_concept_id = '", race_concept_id,"'")
    }
  }
  
  if (!missing(ethnicity_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(ethnicity_concept_id)) {
      statement <- paste0(statement, ' ethnicity_concept_id IS NULL')
    } else if (is(ethnicity_concept_id, 'subQuery')){
      statement <- paste0(statement, ' ethnicity_concept_id = (', as.character(ethnicity_concept_id), ')')
    } else {
      statement <- paste0(statement, " ethnicity_concept_id = '", ethnicity_concept_id,"'")
    }
  }
  
  if (!missing(birth_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(birth_datetime)) {
      statement <- paste0(statement, ' birth_datetime IS NULL')
    } else if (is(birth_datetime, 'subQuery')){
      statement <- paste0(statement, ' birth_datetime = (', as.character(birth_datetime), ')')
    } else {
      statement <- paste0(statement, " birth_datetime = '", birth_datetime,"'")
    }
  }
  
  if (!missing(location_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(location_id)) {
      statement <- paste0(statement, ' location_id IS NULL')
    } else if (is(location_id, 'subQuery')){
      statement <- paste0(statement, ' location_id = (', as.character(location_id), ')')
    } else {
      statement <- paste0(statement, " location_id = '", location_id,"'")
    }
  }
  
  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, ' provider_id IS NULL')
    } else if (is(provider_id, 'subQuery')){
      statement <- paste0(statement, ' provider_id = (', as.character(provider_id), ')')
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }
  
  if (!missing(care_site_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(care_site_id)) {
      statement <- paste0(statement, ' care_site_id IS NULL')
    } else if (is(care_site_id, 'subQuery')){
      statement <- paste0(statement, ' care_site_id = (', as.character(care_site_id), ')')
    } else {
      statement <- paste0(statement, " care_site_id = '", care_site_id,"'")
    }
  }
  
  if (!missing(gender_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(gender_source_concept_id)) {
      statement <- paste0(statement, ' gender_source_concept_id IS NULL')
    } else if (is(gender_source_concept_id, 'subQuery')){
      statement <- paste0(statement, ' gender_source_concept_id = (', as.character(gender_source_concept_id), ')')
    } else {
      statement <- paste0(statement, " gender_source_concept_id = '", gender_source_concept_id,"'")
    }
  }
  
  if (!missing(race_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(race_source_value)) {
      statement <- paste0(statement, ' race_source_value IS NULL')
    } else if (is(race_source_value, 'subQuery')){
      statement <- paste0(statement, ' race_source_value = (', as.character(race_source_value), ')')
    } else {
      statement <- paste0(statement, " race_source_value = '", race_source_value,"'")
    }
  }
  
  if (!missing(race_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(race_source_concept_id)) {
      statement <- paste0(statement, ' race_source_concept_id IS NULL')
    } else if (is(race_source_concept_id, 'subQuery')){
      statement <- paste0(statement, ' race_source_concept_id = (', as.character(race_source_concept_id), ')')
    } else {
      statement <- paste0(statement, " race_source_concept_id = '", race_source_concept_id,"'")
    }
  }
  
  if (!missing(ethnicity_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(ethnicity_source_value)) {
      statement <- paste0(statement, ' ethnicity_source_value IS NULL')
    } else if (is(ethnicity_source_value, 'subQuery')){
      statement <- paste0(statement, ' ethnicity_source_value = (', as.character(ethnicity_source_value), ')')
    } else {
      statement <- paste0(statement, " ethnicity_source_value = '", ethnicity_source_value,"'")
    }
  }
  
  if (!missing(ethnicity_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(ethnicity_source_concept_id)) {
      statement <- paste0(statement, ' ethnicity_source_concept_id IS NULL')
    } else if (is(ethnicity_source_concept_id, 'subQuery')){
      statement <- paste0(statement, ' ethnicity_source_concept_id = (', as.character(ethnicity_source_concept_id), ')')
    } else {
      statement <- paste0(statement, " ethnicity_source_concept_id = '", ethnicity_source_concept_id,"'")
    }
  }
  
  class(statement) <- 'subQuery'
  return(statement)
}

lookup_payer_plan_period <- function(fetchField, payer_plan_period_id, person_id, payer_plan_period_start_date, payer_plan_period_end_date, payer_source_value, plan_source_value, family_source_value) {
  statement <- paste0('SELECT ', fetchField , ' from @cdmDatabaseSchema.payer_plan_period WHERE')
  first <- TRUE
  if (!missing(payer_plan_period_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(payer_plan_period_id)) {
      statement <- paste0(statement, ' payer_plan_period_id IS NULL')
    } else if (is(payer_plan_period_id, 'subQuery')){
      statement <- paste0(statement, ' payer_plan_period_id = (', as.character(payer_plan_period_id), ')')
    } else {
      statement <- paste0(statement, " payer_plan_period_id = '", payer_plan_period_id,"'")
    }
  }
  
  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, ' person_id IS NULL')
    } else if (is(person_id, 'subQuery')){
      statement <- paste0(statement, ' person_id = (', as.character(person_id), ')')
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }
  
  if (!missing(payer_plan_period_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(payer_plan_period_start_date)) {
      statement <- paste0(statement, ' payer_plan_period_start_date IS NULL')
    } else if (is(payer_plan_period_start_date, 'subQuery')){
      statement <- paste0(statement, ' payer_plan_period_start_date = (', as.character(payer_plan_period_start_date), ')')
    } else {
      statement <- paste0(statement, " payer_plan_period_start_date = '", payer_plan_period_start_date,"'")
    }
  }
  
  if (!missing(payer_plan_period_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(payer_plan_period_end_date)) {
      statement <- paste0(statement, ' payer_plan_period_end_date IS NULL')
    } else if (is(payer_plan_period_end_date, 'subQuery')){
      statement <- paste0(statement, ' payer_plan_period_end_date = (', as.character(payer_plan_period_end_date), ')')
    } else {
      statement <- paste0(statement, " payer_plan_period_end_date = '", payer_plan_period_end_date,"'")
    }
  }
  
  if (!missing(payer_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(payer_source_value)) {
      statement <- paste0(statement, ' payer_source_value IS NULL')
    } else if (is(payer_source_value, 'subQuery')){
      statement <- paste0(statement, ' payer_source_value = (', as.character(payer_source_value), ')')
    } else {
      statement <- paste0(statement, " payer_source_value = '", payer_source_value,"'")
    }
  }
  
  if (!missing(plan_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(plan_source_value)) {
      statement <- paste0(statement, ' plan_source_value IS NULL')
    } else if (is(plan_source_value, 'subQuery')){
      statement <- paste0(statement, ' plan_source_value = (', as.character(plan_source_value), ')')
    } else {
      statement <- paste0(statement, " plan_source_value = '", plan_source_value,"'")
    }
  }
  
  if (!missing(family_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(family_source_value)) {
      statement <- paste0(statement, ' family_source_value IS NULL')
    } else if (is(family_source_value, 'subQuery')){
      statement <- paste0(statement, ' family_source_value = (', as.character(family_source_value), ')')
    } else {
      statement <- paste0(statement, " family_source_value = '", family_source_value,"'")
    }
  }
  
  class(statement) <- 'subQuery'
  return(statement)
}

lookup_cost <- function(fetchField, cost_id, cost_event_id, cost_domain_id, cost_type_concept_id, currency_concept_id, total_charge, total_cost, total_paid, paid_by_payer, paid_by_patient, paid_patient_copay, paid_patient_coinsurance, paid_patient_deductible, paid_by_primary, paid_ingredient_cost, paid_dispensing_fee, payer_plan_period_id, amount_allowed, revenue_code_concept_id, revenue_code_source_value) {
  statement <- paste0('SELECT ', fetchField , ' from @cdmDatabaseSchema.cost WHERE')
  first <- TRUE
  if (!missing(cost_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cost_id)) {
      statement <- paste0(statement, ' cost_id IS NULL')
    } else if (is(cost_id, 'subQuery')){
      statement <- paste0(statement, ' cost_id = (', as.character(cost_id), ')')
    } else {
      statement <- paste0(statement, " cost_id = '", cost_id,"'")
    }
  }
  
  if (!missing(cost_event_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cost_event_id)) {
      statement <- paste0(statement, ' cost_event_id IS NULL')
    } else if (is(cost_event_id, 'subQuery')){
      statement <- paste0(statement, ' cost_event_id = (', as.character(cost_event_id), ')')
    } else {
      statement <- paste0(statement, " cost_event_id = '", cost_event_id,"'")
    }
  }
  
  if (!missing(cost_domain_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cost_domain_id)) {
      statement <- paste0(statement, ' cost_domain_id IS NULL')
    } else if (is(cost_domain_id, 'subQuery')){
      statement <- paste0(statement, ' cost_domain_id = (', as.character(cost_domain_id), ')')
    } else {
      statement <- paste0(statement, " cost_domain_id = '", cost_domain_id,"'")
    }
  }
  
  if (!missing(cost_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cost_type_concept_id)) {
      statement <- paste0(statement, ' cost_type_concept_id IS NULL')
    } else if (is(cost_type_concept_id, 'subQuery')){
      statement <- paste0(statement, ' cost_type_concept_id = (', as.character(cost_type_concept_id), ')')
    } else {
      statement <- paste0(statement, " cost_type_concept_id = '", cost_type_concept_id,"'")
    }
  }
  
  if (!missing(currency_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(currency_concept_id)) {
      statement <- paste0(statement, ' currency_concept_id IS NULL')
    } else if (is(currency_concept_id, 'subQuery')){
      statement <- paste0(statement, ' currency_concept_id = (', as.character(currency_concept_id), ')')
    } else {
      statement <- paste0(statement, " currency_concept_id = '", currency_concept_id,"'")
    }
  }
  
  if (!missing(total_charge)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(total_charge)) {
      statement <- paste0(statement, ' total_charge IS NULL')
    } else if (is(total_charge, 'subQuery')){
      statement <- paste0(statement, ' total_charge = (', as.character(total_charge), ')')
    } else {
      statement <- paste0(statement, " total_charge = '", total_charge,"'")
    }
  }
  
  if (!missing(total_cost)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(total_cost)) {
      statement <- paste0(statement, ' total_cost IS NULL')
    } else if (is(total_cost, 'subQuery')){
      statement <- paste0(statement, ' total_cost = (', as.character(total_cost), ')')
    } else {
      statement <- paste0(statement, " total_cost = '", total_cost,"'")
    }
  }
  
  if (!missing(total_paid)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(total_paid)) {
      statement <- paste0(statement, ' total_paid IS NULL')
    } else if (is(total_paid, 'subQuery')){
      statement <- paste0(statement, ' total_paid = (', as.character(total_paid), ')')
    } else {
      statement <- paste0(statement, " total_paid = '", total_paid,"'")
    }
  }
  
  if (!missing(paid_by_payer)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(paid_by_payer)) {
      statement <- paste0(statement, ' paid_by_payer IS NULL')
    } else if (is(paid_by_payer, 'subQuery')){
      statement <- paste0(statement, ' paid_by_payer = (', as.character(paid_by_payer), ')')
    } else {
      statement <- paste0(statement, " paid_by_payer = '", paid_by_payer,"'")
    }
  }
  
  if (!missing(paid_by_patient)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(paid_by_patient)) {
      statement <- paste0(statement, ' paid_by_patient IS NULL')
    } else if (is(paid_by_patient, 'subQuery')){
      statement <- paste0(statement, ' paid_by_patient = (', as.character(paid_by_patient), ')')
    } else {
      statement <- paste0(statement, " paid_by_patient = '", paid_by_patient,"'")
    }
  }
  
  if (!missing(paid_patient_copay)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(paid_patient_copay)) {
      statement <- paste0(statement, ' paid_patient_copay IS NULL')
    } else if (is(paid_patient_copay, 'subQuery')){
      statement <- paste0(statement, ' paid_patient_copay = (', as.character(paid_patient_copay), ')')
    } else {
      statement <- paste0(statement, " paid_patient_copay = '", paid_patient_copay,"'")
    }
  }
  
  if (!missing(paid_patient_coinsurance)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(paid_patient_coinsurance)) {
      statement <- paste0(statement, ' paid_patient_coinsurance IS NULL')
    } else if (is(paid_patient_coinsurance, 'subQuery')){
      statement <- paste0(statement, ' paid_patient_coinsurance = (', as.character(paid_patient_coinsurance), ')')
    } else {
      statement <- paste0(statement, " paid_patient_coinsurance = '", paid_patient_coinsurance,"'")
    }
  }
  
  if (!missing(paid_patient_deductible)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(paid_patient_deductible)) {
      statement <- paste0(statement, ' paid_patient_deductible IS NULL')
    } else if (is(paid_patient_deductible, 'subQuery')){
      statement <- paste0(statement, ' paid_patient_deductible = (', as.character(paid_patient_deductible), ')')
    } else {
      statement <- paste0(statement, " paid_patient_deductible = '", paid_patient_deductible,"'")
    }
  }
  
  if (!missing(paid_by_primary)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(paid_by_primary)) {
      statement <- paste0(statement, ' paid_by_primary IS NULL')
    } else if (is(paid_by_primary, 'subQuery')){
      statement <- paste0(statement, ' paid_by_primary = (', as.character(paid_by_primary), ')')
    } else {
      statement <- paste0(statement, " paid_by_primary = '", paid_by_primary,"'")
    }
  }
  
  if (!missing(paid_ingredient_cost)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(paid_ingredient_cost)) {
      statement <- paste0(statement, ' paid_ingredient_cost IS NULL')
    } else if (is(paid_ingredient_cost, 'subQuery')){
      statement <- paste0(statement, ' paid_ingredient_cost = (', as.character(paid_ingredient_cost), ')')
    } else {
      statement <- paste0(statement, " paid_ingredient_cost = '", paid_ingredient_cost,"'")
    }
  }
  
  if (!missing(paid_dispensing_fee)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(paid_dispensing_fee)) {
      statement <- paste0(statement, ' paid_dispensing_fee IS NULL')
    } else if (is(paid_dispensing_fee, 'subQuery')){
      statement <- paste0(statement, ' paid_dispensing_fee = (', as.character(paid_dispensing_fee), ')')
    } else {
      statement <- paste0(statement, " paid_dispensing_fee = '", paid_dispensing_fee,"'")
    }
  }
  
  if (!missing(payer_plan_period_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(payer_plan_period_id)) {
      statement <- paste0(statement, ' payer_plan_period_id IS NULL')
    } else if (is(payer_plan_period_id, 'subQuery')){
      statement <- paste0(statement, ' payer_plan_period_id = (', as.character(payer_plan_period_id), ')')
    } else {
      statement <- paste0(statement, " payer_plan_period_id = '", payer_plan_period_id,"'")
    }
  }
  
  if (!missing(amount_allowed)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(amount_allowed)) {
      statement <- paste0(statement, ' amount_allowed IS NULL')
    } else if (is(amount_allowed, 'subQuery')){
      statement <- paste0(statement, ' amount_allowed = (', as.character(amount_allowed), ')')
    } else {
      statement <- paste0(statement, " amount_allowed = '", amount_allowed,"'")
    }
  }
  
  if (!missing(revenue_code_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(revenue_code_concept_id)) {
      statement <- paste0(statement, ' revenue_code_concept_id IS NULL')
    } else if (is(revenue_code_concept_id, 'subQuery')){
      statement <- paste0(statement, ' revenue_code_concept_id = (', as.character(revenue_code_concept_id), ')')
    } else {
      statement <- paste0(statement, " revenue_code_concept_id = '", revenue_code_concept_id,"'")
    }
  }
  
  if (!missing(revenue_code_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(revenue_code_source_value)) {
      statement <- paste0(statement, ' revenue_code_source_value IS NULL')
    } else if (is(revenue_code_source_value, 'subQuery')){
      statement <- paste0(statement, ' revenue_code_source_value = (', as.character(revenue_code_source_value), ')')
    } else {
      statement <- paste0(statement, " revenue_code_source_value = '", revenue_code_source_value,"'")
    }
  }
  
  class(statement) <- 'subQuery'
  return(statement)
}

lookup_observation_period <- function(fetchField, observation_period_id, person_id, observation_period_start_date, observation_period_start_datetime, observation_period_end_date, observation_period_end_datetime, period_type_concept_id) {
  statement <- paste0('SELECT ', fetchField , ' from @cdmDatabaseSchema.observation_period WHERE')
  first <- TRUE
  if (!missing(observation_period_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(observation_period_id)) {
      statement <- paste0(statement, ' observation_period_id IS NULL')
    } else if (is(observation_period_id, 'subQuery')){
      statement <- paste0(statement, ' observation_period_id = (', as.character(observation_period_id), ')')
    } else {
      statement <- paste0(statement, " observation_period_id = '", observation_period_id,"'")
    }
  }
  
  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, ' person_id IS NULL')
    } else if (is(person_id, 'subQuery')){
      statement <- paste0(statement, ' person_id = (', as.character(person_id), ')')
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }
  
  if (!missing(observation_period_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(observation_period_start_date)) {
      statement <- paste0(statement, ' observation_period_start_date IS NULL')
    } else if (is(observation_period_start_date, 'subQuery')){
      statement <- paste0(statement, ' observation_period_start_date = (', as.character(observation_period_start_date), ')')
    } else {
      statement <- paste0(statement, " observation_period_start_date = '", observation_period_start_date,"'")
    }
  }
  
  if (!missing(observation_period_start_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(observation_period_start_datetime)) {
      statement <- paste0(statement, ' observation_period_start_datetime IS NULL')
    } else if (is(observation_period_start_datetime, 'subQuery')){
      statement <- paste0(statement, ' observation_period_start_datetime = (', as.character(observation_period_start_datetime), ')')
    } else {
      statement <- paste0(statement, " observation_period_start_datetime = '", observation_period_start_datetime,"'")
    }
  }
  
  if (!missing(observation_period_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(observation_period_end_date)) {
      statement <- paste0(statement, ' observation_period_end_date IS NULL')
    } else if (is(observation_period_end_date, 'subQuery')){
      statement <- paste0(statement, ' observation_period_end_date = (', as.character(observation_period_end_date), ')')
    } else {
      statement <- paste0(statement, " observation_period_end_date = '", observation_period_end_date,"'")
    }
  }
  
  if (!missing(observation_period_end_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(observation_period_end_datetime)) {
      statement <- paste0(statement, ' observation_period_end_datetime IS NULL')
    } else if (is(observation_period_end_datetime, 'subQuery')){
      statement <- paste0(statement, ' observation_period_end_datetime = (', as.character(observation_period_end_datetime), ')')
    } else {
      statement <- paste0(statement, " observation_period_end_datetime = '", observation_period_end_datetime,"'")
    }
  }
  
  if (!missing(period_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(period_type_concept_id)) {
      statement <- paste0(statement, ' period_type_concept_id IS NULL')
    } else if (is(period_type_concept_id, 'subQuery')){
      statement <- paste0(statement, ' period_type_concept_id = (', as.character(period_type_concept_id), ')')
    } else {
      statement <- paste0(statement, " period_type_concept_id = '", period_type_concept_id,"'")
    }
  }
  
  class(statement) <- 'subQuery'
  return(statement)
}

lookup_care_site <- function(fetchField, care_site_id, care_site_name, place_of_service_concept_id, location_id, care_site_source_value, place_of_service_source_value) {
  statement <- paste0('SELECT ', fetchField , ' from @cdmDatabaseSchema.care_site WHERE')
  first <- TRUE
  if (!missing(care_site_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(care_site_id)) {
      statement <- paste0(statement, ' care_site_id IS NULL')
    } else if (is(care_site_id, 'subQuery')){
      statement <- paste0(statement, ' care_site_id = (', as.character(care_site_id), ')')
    } else {
      statement <- paste0(statement, " care_site_id = '", care_site_id,"'")
    }
  }
  
  if (!missing(care_site_name)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(care_site_name)) {
      statement <- paste0(statement, ' care_site_name IS NULL')
    } else if (is(care_site_name, 'subQuery')){
      statement <- paste0(statement, ' care_site_name = (', as.character(care_site_name), ')')
    } else {
      statement <- paste0(statement, " care_site_name = '", care_site_name,"'")
    }
  }
  
  if (!missing(place_of_service_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(place_of_service_concept_id)) {
      statement <- paste0(statement, ' place_of_service_concept_id IS NULL')
    } else if (is(place_of_service_concept_id, 'subQuery')){
      statement <- paste0(statement, ' place_of_service_concept_id = (', as.character(place_of_service_concept_id), ')')
    } else {
      statement <- paste0(statement, " place_of_service_concept_id = '", place_of_service_concept_id,"'")
    }
  }
  
  if (!missing(location_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(location_id)) {
      statement <- paste0(statement, ' location_id IS NULL')
    } else if (is(location_id, 'subQuery')){
      statement <- paste0(statement, ' location_id = (', as.character(location_id), ')')
    } else {
      statement <- paste0(statement, " location_id = '", location_id,"'")
    }
  }
  
  if (!missing(care_site_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(care_site_source_value)) {
      statement <- paste0(statement, ' care_site_source_value IS NULL')
    } else if (is(care_site_source_value, 'subQuery')){
      statement <- paste0(statement, ' care_site_source_value = (', as.character(care_site_source_value), ')')
    } else {
      statement <- paste0(statement, " care_site_source_value = '", care_site_source_value,"'")
    }
  }
  
  if (!missing(place_of_service_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(place_of_service_source_value)) {
      statement <- paste0(statement, ' place_of_service_source_value IS NULL')
    } else if (is(place_of_service_source_value, 'subQuery')){
      statement <- paste0(statement, ' place_of_service_source_value = (', as.character(place_of_service_source_value), ')')
    } else {
      statement <- paste0(statement, " place_of_service_source_value = '", place_of_service_source_value,"'")
    }
  }
  
  class(statement) <- 'subQuery'
  return(statement)
}

lookup_visit_occurrence <- function(fetchField, visit_occurrence_id, person_id, visit_concept_id, visit_start_date, visit_start_datetime, visit_end_date, visit_end_datetime, visit_type_concept_id, provider_id, care_site_id, visit_source_value, visit_source_concept_id) {
  statement <- paste0('SELECT ', fetchField , ' from @cdmDatabaseSchema.visit_occurrence WHERE')
  first <- TRUE
  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, ' visit_occurrence_id IS NULL')
    } else if (is(visit_occurrence_id, 'subQuery')){
      statement <- paste0(statement, ' visit_occurrence_id = (', as.character(visit_occurrence_id), ')')
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }
  
  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, ' person_id IS NULL')
    } else if (is(person_id, 'subQuery')){
      statement <- paste0(statement, ' person_id = (', as.character(person_id), ')')
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }
  
  if (!missing(visit_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(visit_concept_id)) {
      statement <- paste0(statement, ' visit_concept_id IS NULL')
    } else if (is(visit_concept_id, 'subQuery')){
      statement <- paste0(statement, ' visit_concept_id = (', as.character(visit_concept_id), ')')
    } else {
      statement <- paste0(statement, " visit_concept_id = '", visit_concept_id,"'")
    }
  }
  
  if (!missing(visit_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(visit_start_date)) {
      statement <- paste0(statement, ' visit_start_date IS NULL')
    } else if (is(visit_start_date, 'subQuery')){
      statement <- paste0(statement, ' visit_start_date = (', as.character(visit_start_date), ')')
    } else {
      statement <- paste0(statement, " visit_start_date = '", visit_start_date,"'")
    }
  }
  
  if (!missing(visit_start_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(visit_start_datetime)) {
      statement <- paste0(statement, ' visit_start_datetime IS NULL')
    } else if (is(visit_start_datetime, 'subQuery')){
      statement <- paste0(statement, ' visit_start_datetime = (', as.character(visit_start_datetime), ')')
    } else {
      statement <- paste0(statement, " visit_start_datetime = '", visit_start_datetime,"'")
    }
  }
  
  if (!missing(visit_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(visit_end_date)) {
      statement <- paste0(statement, ' visit_end_date IS NULL')
    } else if (is(visit_end_date, 'subQuery')){
      statement <- paste0(statement, ' visit_end_date = (', as.character(visit_end_date), ')')
    } else {
      statement <- paste0(statement, " visit_end_date = '", visit_end_date,"'")
    }
  }
  
  if (!missing(visit_end_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(visit_end_datetime)) {
      statement <- paste0(statement, ' visit_end_datetime IS NULL')
    } else if (is(visit_end_datetime, 'subQuery')){
      statement <- paste0(statement, ' visit_end_datetime = (', as.character(visit_end_datetime), ')')
    } else {
      statement <- paste0(statement, " visit_end_datetime = '", visit_end_datetime,"'")
    }
  }
  
  if (!missing(visit_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(visit_type_concept_id)) {
      statement <- paste0(statement, ' visit_type_concept_id IS NULL')
    } else if (is(visit_type_concept_id, 'subQuery')){
      statement <- paste0(statement, ' visit_type_concept_id = (', as.character(visit_type_concept_id), ')')
    } else {
      statement <- paste0(statement, " visit_type_concept_id = '", visit_type_concept_id,"'")
    }
  }
  
  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, ' provider_id IS NULL')
    } else if (is(provider_id, 'subQuery')){
      statement <- paste0(statement, ' provider_id = (', as.character(provider_id), ')')
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }
  
  if (!missing(care_site_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(care_site_id)) {
      statement <- paste0(statement, ' care_site_id IS NULL')
    } else if (is(care_site_id, 'subQuery')){
      statement <- paste0(statement, ' care_site_id = (', as.character(care_site_id), ')')
    } else {
      statement <- paste0(statement, " care_site_id = '", care_site_id,"'")
    }
  }
  
  if (!missing(visit_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(visit_source_value)) {
      statement <- paste0(statement, ' visit_source_value IS NULL')
    } else if (is(visit_source_value, 'subQuery')){
      statement <- paste0(statement, ' visit_source_value = (', as.character(visit_source_value), ')')
    } else {
      statement <- paste0(statement, " visit_source_value = '", visit_source_value,"'")
    }
  }
  
  if (!missing(visit_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(visit_source_concept_id)) {
      statement <- paste0(statement, ' visit_source_concept_id IS NULL')
    } else if (is(visit_source_concept_id, 'subQuery')){
      statement <- paste0(statement, ' visit_source_concept_id = (', as.character(visit_source_concept_id), ')')
    } else {
      statement <- paste0(statement, " visit_source_concept_id = '", visit_source_concept_id,"'")
    }
  }
  
  class(statement) <- 'subQuery'
  return(statement)
}

lookup_provider <- function(fetchField, provider_id, npi, dea, specialty_concept_id, provider_name, care_site_id, year_of_birth, gender_concept_id, provider_source_value, specialty_source_value, specialty_source_concept_id, gender_source_value, gender_source_concept_id) {
  statement <- paste0('SELECT ', fetchField , ' from @cdmDatabaseSchema.provider WHERE')
  first <- TRUE
  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, ' provider_id IS NULL')
    } else if (is(provider_id, 'subQuery')){
      statement <- paste0(statement, ' provider_id = (', as.character(provider_id), ')')
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }
  
  if (!missing(npi)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(npi)) {
      statement <- paste0(statement, ' npi IS NULL')
    } else if (is(npi, 'subQuery')){
      statement <- paste0(statement, ' npi = (', as.character(npi), ')')
    } else {
      statement <- paste0(statement, " npi = '", npi,"'")
    }
  }
  
  if (!missing(dea)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(dea)) {
      statement <- paste0(statement, ' dea IS NULL')
    } else if (is(dea, 'subQuery')){
      statement <- paste0(statement, ' dea = (', as.character(dea), ')')
    } else {
      statement <- paste0(statement, " dea = '", dea,"'")
    }
  }
  
  if (!missing(specialty_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(specialty_concept_id)) {
      statement <- paste0(statement, ' specialty_concept_id IS NULL')
    } else if (is(specialty_concept_id, 'subQuery')){
      statement <- paste0(statement, ' specialty_concept_id = (', as.character(specialty_concept_id), ')')
    } else {
      statement <- paste0(statement, " specialty_concept_id = '", specialty_concept_id,"'")
    }
  }
  
  if (!missing(provider_name)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(provider_name)) {
      statement <- paste0(statement, ' provider_name IS NULL')
    } else if (is(provider_name, 'subQuery')){
      statement <- paste0(statement, ' provider_name = (', as.character(provider_name), ')')
    } else {
      statement <- paste0(statement, " provider_name = '", provider_name,"'")
    }
  }
  
  if (!missing(care_site_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(care_site_id)) {
      statement <- paste0(statement, ' care_site_id IS NULL')
    } else if (is(care_site_id, 'subQuery')){
      statement <- paste0(statement, ' care_site_id = (', as.character(care_site_id), ')')
    } else {
      statement <- paste0(statement, " care_site_id = '", care_site_id,"'")
    }
  }
  
  if (!missing(year_of_birth)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(year_of_birth)) {
      statement <- paste0(statement, ' year_of_birth IS NULL')
    } else if (is(year_of_birth, 'subQuery')){
      statement <- paste0(statement, ' year_of_birth = (', as.character(year_of_birth), ')')
    } else {
      statement <- paste0(statement, " year_of_birth = '", year_of_birth,"'")
    }
  }
  
  if (!missing(gender_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(gender_concept_id)) {
      statement <- paste0(statement, ' gender_concept_id IS NULL')
    } else if (is(gender_concept_id, 'subQuery')){
      statement <- paste0(statement, ' gender_concept_id = (', as.character(gender_concept_id), ')')
    } else {
      statement <- paste0(statement, " gender_concept_id = '", gender_concept_id,"'")
    }
  }
  
  if (!missing(provider_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(provider_source_value)) {
      statement <- paste0(statement, ' provider_source_value IS NULL')
    } else if (is(provider_source_value, 'subQuery')){
      statement <- paste0(statement, ' provider_source_value = (', as.character(provider_source_value), ')')
    } else {
      statement <- paste0(statement, " provider_source_value = '", provider_source_value,"'")
    }
  }
  
  if (!missing(specialty_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(specialty_source_value)) {
      statement <- paste0(statement, ' specialty_source_value IS NULL')
    } else if (is(specialty_source_value, 'subQuery')){
      statement <- paste0(statement, ' specialty_source_value = (', as.character(specialty_source_value), ')')
    } else {
      statement <- paste0(statement, " specialty_source_value = '", specialty_source_value,"'")
    }
  }
  
  if (!missing(specialty_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(specialty_source_concept_id)) {
      statement <- paste0(statement, ' specialty_source_concept_id IS NULL')
    } else if (is(specialty_source_concept_id, 'subQuery')){
      statement <- paste0(statement, ' specialty_source_concept_id = (', as.character(specialty_source_concept_id), ')')
    } else {
      statement <- paste0(statement, " specialty_source_concept_id = '", specialty_source_concept_id,"'")
    }
  }
  
  if (!missing(gender_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(gender_source_value)) {
      statement <- paste0(statement, ' gender_source_value IS NULL')
    } else if (is(gender_source_value, 'subQuery')){
      statement <- paste0(statement, ' gender_source_value = (', as.character(gender_source_value), ')')
    } else {
      statement <- paste0(statement, " gender_source_value = '", gender_source_value,"'")
    }
  }
  
  if (!missing(gender_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(gender_source_concept_id)) {
      statement <- paste0(statement, ' gender_source_concept_id IS NULL')
    } else if (is(gender_source_concept_id, 'subQuery')){
      statement <- paste0(statement, ' gender_source_concept_id = (', as.character(gender_source_concept_id), ')')
    } else {
      statement <- paste0(statement, " gender_source_concept_id = '", gender_source_concept_id,"'")
    }
  }
  
  class(statement) <- 'subQuery'
  return(statement)
}

lookup_death <- function(fetchField, person_id, death_date, death_datetime, death_type_concept_id, cause_concept_id, cause_source_value, cause_source_concept_id) {
  statement <- paste0('SELECT ', fetchField , ' from @cdmDatabaseSchema.death WHERE')
  first <- TRUE
  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, ' person_id IS NULL')
    } else if (is(person_id, 'subQuery')){
      statement <- paste0(statement, ' person_id = (', as.character(person_id), ')')
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }
  
  if (!missing(death_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(death_date)) {
      statement <- paste0(statement, ' death_date IS NULL')
    } else if (is(death_date, 'subQuery')){
      statement <- paste0(statement, ' death_date = (', as.character(death_date), ')')
    } else {
      statement <- paste0(statement, " death_date = '", death_date,"'")
    }
  }
  
  if (!missing(death_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(death_datetime)) {
      statement <- paste0(statement, ' death_datetime IS NULL')
    } else if (is(death_datetime, 'subQuery')){
      statement <- paste0(statement, ' death_datetime = (', as.character(death_datetime), ')')
    } else {
      statement <- paste0(statement, " death_datetime = '", death_datetime,"'")
    }
  }
  
  if (!missing(death_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(death_type_concept_id)) {
      statement <- paste0(statement, ' death_type_concept_id IS NULL')
    } else if (is(death_type_concept_id, 'subQuery')){
      statement <- paste0(statement, ' death_type_concept_id = (', as.character(death_type_concept_id), ')')
    } else {
      statement <- paste0(statement, " death_type_concept_id = '", death_type_concept_id,"'")
    }
  }
  
  if (!missing(cause_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cause_concept_id)) {
      statement <- paste0(statement, ' cause_concept_id IS NULL')
    } else if (is(cause_concept_id, 'subQuery')){
      statement <- paste0(statement, ' cause_concept_id = (', as.character(cause_concept_id), ')')
    } else {
      statement <- paste0(statement, " cause_concept_id = '", cause_concept_id,"'")
    }
  }
  
  if (!missing(cause_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cause_source_value)) {
      statement <- paste0(statement, ' cause_source_value IS NULL')
    } else if (is(cause_source_value, 'subQuery')){
      statement <- paste0(statement, ' cause_source_value = (', as.character(cause_source_value), ')')
    } else {
      statement <- paste0(statement, " cause_source_value = '", cause_source_value,"'")
    }
  }
  
  if (!missing(cause_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cause_source_concept_id)) {
      statement <- paste0(statement, ' cause_source_concept_id IS NULL')
    } else if (is(cause_source_concept_id, 'subQuery')){
      statement <- paste0(statement, ' cause_source_concept_id = (', as.character(cause_source_concept_id), ')')
    } else {
      statement <- paste0(statement, " cause_source_concept_id = '", cause_source_concept_id,"'")
    }
  }
  
  class(statement) <- 'subQuery'
  return(statement)
}

lookup_drug_exposure <- function(fetchField, drug_exposure_id, person_id, drug_concept_id, drug_exposure_start_date, drug_exposure_start_datetime, drug_exposure_end_date, drug_exposure_end_datetime, drug_type_concept_id, stop_reason, refills, quantity, days_supply, sig, route_concept_id, effective_drug_dose, dose_unit_concept_id, lot_number, provider_id, visit_occurrence_id, drug_source_value, drug_source_concept_id, route_source_value, dose_unit_source_value) {
  statement <- paste0('SELECT ', fetchField , ' from @cdmDatabaseSchema.drug_exposure WHERE')
  first <- TRUE
  if (!missing(drug_exposure_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(drug_exposure_id)) {
      statement <- paste0(statement, ' drug_exposure_id IS NULL')
    } else if (is(drug_exposure_id, 'subQuery')){
      statement <- paste0(statement, ' drug_exposure_id = (', as.character(drug_exposure_id), ')')
    } else {
      statement <- paste0(statement, " drug_exposure_id = '", drug_exposure_id,"'")
    }
  }
  
  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, ' person_id IS NULL')
    } else if (is(person_id, 'subQuery')){
      statement <- paste0(statement, ' person_id = (', as.character(person_id), ')')
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }
  
  if (!missing(drug_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(drug_concept_id)) {
      statement <- paste0(statement, ' drug_concept_id IS NULL')
    } else if (is(drug_concept_id, 'subQuery')){
      statement <- paste0(statement, ' drug_concept_id = (', as.character(drug_concept_id), ')')
    } else {
      statement <- paste0(statement, " drug_concept_id = '", drug_concept_id,"'")
    }
  }
  
  if (!missing(drug_exposure_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(drug_exposure_start_date)) {
      statement <- paste0(statement, ' drug_exposure_start_date IS NULL')
    } else if (is(drug_exposure_start_date, 'subQuery')){
      statement <- paste0(statement, ' drug_exposure_start_date = (', as.character(drug_exposure_start_date), ')')
    } else {
      statement <- paste0(statement, " drug_exposure_start_date = '", drug_exposure_start_date,"'")
    }
  }
  
  if (!missing(drug_exposure_start_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(drug_exposure_start_datetime)) {
      statement <- paste0(statement, ' drug_exposure_start_datetime IS NULL')
    } else if (is(drug_exposure_start_datetime, 'subQuery')){
      statement <- paste0(statement, ' drug_exposure_start_datetime = (', as.character(drug_exposure_start_datetime), ')')
    } else {
      statement <- paste0(statement, " drug_exposure_start_datetime = '", drug_exposure_start_datetime,"'")
    }
  }
  
  if (!missing(drug_exposure_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(drug_exposure_end_date)) {
      statement <- paste0(statement, ' drug_exposure_end_date IS NULL')
    } else if (is(drug_exposure_end_date, 'subQuery')){
      statement <- paste0(statement, ' drug_exposure_end_date = (', as.character(drug_exposure_end_date), ')')
    } else {
      statement <- paste0(statement, " drug_exposure_end_date = '", drug_exposure_end_date,"'")
    }
  }
  
  if (!missing(drug_exposure_end_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(drug_exposure_end_datetime)) {
      statement <- paste0(statement, ' drug_exposure_end_datetime IS NULL')
    } else if (is(drug_exposure_end_datetime, 'subQuery')){
      statement <- paste0(statement, ' drug_exposure_end_datetime = (', as.character(drug_exposure_end_datetime), ')')
    } else {
      statement <- paste0(statement, " drug_exposure_end_datetime = '", drug_exposure_end_datetime,"'")
    }
  }
  
  if (!missing(drug_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(drug_type_concept_id)) {
      statement <- paste0(statement, ' drug_type_concept_id IS NULL')
    } else if (is(drug_type_concept_id, 'subQuery')){
      statement <- paste0(statement, ' drug_type_concept_id = (', as.character(drug_type_concept_id), ')')
    } else {
      statement <- paste0(statement, " drug_type_concept_id = '", drug_type_concept_id,"'")
    }
  }
  
  if (!missing(stop_reason)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(stop_reason)) {
      statement <- paste0(statement, ' stop_reason IS NULL')
    } else if (is(stop_reason, 'subQuery')){
      statement <- paste0(statement, ' stop_reason = (', as.character(stop_reason), ')')
    } else {
      statement <- paste0(statement, " stop_reason = '", stop_reason,"'")
    }
  }
  
  if (!missing(refills)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(refills)) {
      statement <- paste0(statement, ' refills IS NULL')
    } else if (is(refills, 'subQuery')){
      statement <- paste0(statement, ' refills = (', as.character(refills), ')')
    } else {
      statement <- paste0(statement, " refills = '", refills,"'")
    }
  }
  
  if (!missing(quantity)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(quantity)) {
      statement <- paste0(statement, ' quantity IS NULL')
    } else if (is(quantity, 'subQuery')){
      statement <- paste0(statement, ' quantity = (', as.character(quantity), ')')
    } else {
      statement <- paste0(statement, " quantity = '", quantity,"'")
    }
  }
  
  if (!missing(days_supply)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(days_supply)) {
      statement <- paste0(statement, ' days_supply IS NULL')
    } else if (is(days_supply, 'subQuery')){
      statement <- paste0(statement, ' days_supply = (', as.character(days_supply), ')')
    } else {
      statement <- paste0(statement, " days_supply = '", days_supply,"'")
    }
  }
  
  if (!missing(sig)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(sig)) {
      statement <- paste0(statement, ' sig IS NULL')
    } else if (is(sig, 'subQuery')){
      statement <- paste0(statement, ' sig = (', as.character(sig), ')')
    } else {
      statement <- paste0(statement, " sig = '", sig,"'")
    }
  }
  
  if (!missing(route_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(route_concept_id)) {
      statement <- paste0(statement, ' route_concept_id IS NULL')
    } else if (is(route_concept_id, 'subQuery')){
      statement <- paste0(statement, ' route_concept_id = (', as.character(route_concept_id), ')')
    } else {
      statement <- paste0(statement, " route_concept_id = '", route_concept_id,"'")
    }
  }
  
  if (!missing(effective_drug_dose)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(effective_drug_dose)) {
      statement <- paste0(statement, ' effective_drug_dose IS NULL')
    } else if (is(effective_drug_dose, 'subQuery')){
      statement <- paste0(statement, ' effective_drug_dose = (', as.character(effective_drug_dose), ')')
    } else {
      statement <- paste0(statement, " effective_drug_dose = '", effective_drug_dose,"'")
    }
  }
  
  if (!missing(dose_unit_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(dose_unit_concept_id)) {
      statement <- paste0(statement, ' dose_unit_concept_id IS NULL')
    } else if (is(dose_unit_concept_id, 'subQuery')){
      statement <- paste0(statement, ' dose_unit_concept_id = (', as.character(dose_unit_concept_id), ')')
    } else {
      statement <- paste0(statement, " dose_unit_concept_id = '", dose_unit_concept_id,"'")
    }
  }
  
  if (!missing(lot_number)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(lot_number)) {
      statement <- paste0(statement, ' lot_number IS NULL')
    } else if (is(lot_number, 'subQuery')){
      statement <- paste0(statement, ' lot_number = (', as.character(lot_number), ')')
    } else {
      statement <- paste0(statement, " lot_number = '", lot_number,"'")
    }
  }
  
  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, ' provider_id IS NULL')
    } else if (is(provider_id, 'subQuery')){
      statement <- paste0(statement, ' provider_id = (', as.character(provider_id), ')')
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }
  
  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, ' visit_occurrence_id IS NULL')
    } else if (is(visit_occurrence_id, 'subQuery')){
      statement <- paste0(statement, ' visit_occurrence_id = (', as.character(visit_occurrence_id), ')')
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }
  
  if (!missing(drug_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(drug_source_value)) {
      statement <- paste0(statement, ' drug_source_value IS NULL')
    } else if (is(drug_source_value, 'subQuery')){
      statement <- paste0(statement, ' drug_source_value = (', as.character(drug_source_value), ')')
    } else {
      statement <- paste0(statement, " drug_source_value = '", drug_source_value,"'")
    }
  }
  
  if (!missing(drug_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(drug_source_concept_id)) {
      statement <- paste0(statement, ' drug_source_concept_id IS NULL')
    } else if (is(drug_source_concept_id, 'subQuery')){
      statement <- paste0(statement, ' drug_source_concept_id = (', as.character(drug_source_concept_id), ')')
    } else {
      statement <- paste0(statement, " drug_source_concept_id = '", drug_source_concept_id,"'")
    }
  }
  
  if (!missing(route_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(route_source_value)) {
      statement <- paste0(statement, ' route_source_value IS NULL')
    } else if (is(route_source_value, 'subQuery')){
      statement <- paste0(statement, ' route_source_value = (', as.character(route_source_value), ')')
    } else {
      statement <- paste0(statement, " route_source_value = '", route_source_value,"'")
    }
  }
  
  if (!missing(dose_unit_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(dose_unit_source_value)) {
      statement <- paste0(statement, ' dose_unit_source_value IS NULL')
    } else if (is(dose_unit_source_value, 'subQuery')){
      statement <- paste0(statement, ' dose_unit_source_value = (', as.character(dose_unit_source_value), ')')
    } else {
      statement <- paste0(statement, " dose_unit_source_value = '", dose_unit_source_value,"'")
    }
  }
  
  class(statement) <- 'subQuery'
  return(statement)
}

lookup_device_exposure <- function(fetchField, device_exposure_id, person_id, device_concept_id, device_exposure_start_date, device_exposure_start_datetime, device_exposure_end_date, device_exposure_end_datetime, device_type_concept_id, unique_device_id, quantity, provider_id, visit_occurrence_id, device_source_value, device_source_concept_id) {
  statement <- paste0('SELECT ', fetchField , ' from @cdmDatabaseSchema.device_exposure WHERE')
  first <- TRUE
  if (!missing(device_exposure_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(device_exposure_id)) {
      statement <- paste0(statement, ' device_exposure_id IS NULL')
    } else if (is(device_exposure_id, 'subQuery')){
      statement <- paste0(statement, ' device_exposure_id = (', as.character(device_exposure_id), ')')
    } else {
      statement <- paste0(statement, " device_exposure_id = '", device_exposure_id,"'")
    }
  }
  
  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, ' person_id IS NULL')
    } else if (is(person_id, 'subQuery')){
      statement <- paste0(statement, ' person_id = (', as.character(person_id), ')')
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }
  
  if (!missing(device_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(device_concept_id)) {
      statement <- paste0(statement, ' device_concept_id IS NULL')
    } else if (is(device_concept_id, 'subQuery')){
      statement <- paste0(statement, ' device_concept_id = (', as.character(device_concept_id), ')')
    } else {
      statement <- paste0(statement, " device_concept_id = '", device_concept_id,"'")
    }
  }
  
  if (!missing(device_exposure_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(device_exposure_start_date)) {
      statement <- paste0(statement, ' device_exposure_start_date IS NULL')
    } else if (is(device_exposure_start_date, 'subQuery')){
      statement <- paste0(statement, ' device_exposure_start_date = (', as.character(device_exposure_start_date), ')')
    } else {
      statement <- paste0(statement, " device_exposure_start_date = '", device_exposure_start_date,"'")
    }
  }
  
  if (!missing(device_exposure_start_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(device_exposure_start_datetime)) {
      statement <- paste0(statement, ' device_exposure_start_datetime IS NULL')
    } else if (is(device_exposure_start_datetime, 'subQuery')){
      statement <- paste0(statement, ' device_exposure_start_datetime = (', as.character(device_exposure_start_datetime), ')')
    } else {
      statement <- paste0(statement, " device_exposure_start_datetime = '", device_exposure_start_datetime,"'")
    }
  }
  
  if (!missing(device_exposure_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(device_exposure_end_date)) {
      statement <- paste0(statement, ' device_exposure_end_date IS NULL')
    } else if (is(device_exposure_end_date, 'subQuery')){
      statement <- paste0(statement, ' device_exposure_end_date = (', as.character(device_exposure_end_date), ')')
    } else {
      statement <- paste0(statement, " device_exposure_end_date = '", device_exposure_end_date,"'")
    }
  }
  
  if (!missing(device_exposure_end_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(device_exposure_end_datetime)) {
      statement <- paste0(statement, ' device_exposure_end_datetime IS NULL')
    } else if (is(device_exposure_end_datetime, 'subQuery')){
      statement <- paste0(statement, ' device_exposure_end_datetime = (', as.character(device_exposure_end_datetime), ')')
    } else {
      statement <- paste0(statement, " device_exposure_end_datetime = '", device_exposure_end_datetime,"'")
    }
  }
  
  if (!missing(device_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(device_type_concept_id)) {
      statement <- paste0(statement, ' device_type_concept_id IS NULL')
    } else if (is(device_type_concept_id, 'subQuery')){
      statement <- paste0(statement, ' device_type_concept_id = (', as.character(device_type_concept_id), ')')
    } else {
      statement <- paste0(statement, " device_type_concept_id = '", device_type_concept_id,"'")
    }
  }
  
  if (!missing(unique_device_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(unique_device_id)) {
      statement <- paste0(statement, ' unique_device_id IS NULL')
    } else if (is(unique_device_id, 'subQuery')){
      statement <- paste0(statement, ' unique_device_id = (', as.character(unique_device_id), ')')
    } else {
      statement <- paste0(statement, " unique_device_id = '", unique_device_id,"'")
    }
  }
  
  if (!missing(quantity)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(quantity)) {
      statement <- paste0(statement, ' quantity IS NULL')
    } else if (is(quantity, 'subQuery')){
      statement <- paste0(statement, ' quantity = (', as.character(quantity), ')')
    } else {
      statement <- paste0(statement, " quantity = '", quantity,"'")
    }
  }
  
  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, ' provider_id IS NULL')
    } else if (is(provider_id, 'subQuery')){
      statement <- paste0(statement, ' provider_id = (', as.character(provider_id), ')')
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }
  
  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, ' visit_occurrence_id IS NULL')
    } else if (is(visit_occurrence_id, 'subQuery')){
      statement <- paste0(statement, ' visit_occurrence_id = (', as.character(visit_occurrence_id), ')')
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }
  
  if (!missing(device_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(device_source_value)) {
      statement <- paste0(statement, ' device_source_value IS NULL')
    } else if (is(device_source_value, 'subQuery')){
      statement <- paste0(statement, ' device_source_value = (', as.character(device_source_value), ')')
    } else {
      statement <- paste0(statement, " device_source_value = '", device_source_value,"'")
    }
  }
  
  if (!missing(device_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(device_source_concept_id)) {
      statement <- paste0(statement, ' device_source_concept_id IS NULL')
    } else if (is(device_source_concept_id, 'subQuery')){
      statement <- paste0(statement, ' device_source_concept_id = (', as.character(device_source_concept_id), ')')
    } else {
      statement <- paste0(statement, " device_source_concept_id = '", device_source_concept_id,"'")
    }
  }
  
  class(statement) <- 'subQuery'
  return(statement)
}

lookup_procedure_occurrence <- function(fetchField, procedure_occurrence_id, person_id, procedure_concept_id, procedure_date, procedure_type_concept_id, modifier_concept_id, quantity, provider_id, visit_occurrence_id, procedure_source_value, procedure_source_concept_id, qualifier_source_value) {
  statement <- paste0('SELECT ', fetchField , ' from @cdmDatabaseSchema.procedure_occurrence WHERE')
  first <- TRUE
  if (!missing(procedure_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(procedure_occurrence_id)) {
      statement <- paste0(statement, ' procedure_occurrence_id IS NULL')
    } else if (is(procedure_occurrence_id, 'subQuery')){
      statement <- paste0(statement, ' procedure_occurrence_id = (', as.character(procedure_occurrence_id), ')')
    } else {
      statement <- paste0(statement, " procedure_occurrence_id = '", procedure_occurrence_id,"'")
    }
  }
  
  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, ' person_id IS NULL')
    } else if (is(person_id, 'subQuery')){
      statement <- paste0(statement, ' person_id = (', as.character(person_id), ')')
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }
  
  if (!missing(procedure_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(procedure_concept_id)) {
      statement <- paste0(statement, ' procedure_concept_id IS NULL')
    } else if (is(procedure_concept_id, 'subQuery')){
      statement <- paste0(statement, ' procedure_concept_id = (', as.character(procedure_concept_id), ')')
    } else {
      statement <- paste0(statement, " procedure_concept_id = '", procedure_concept_id,"'")
    }
  }
  
  if (!missing(procedure_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(procedure_date)) {
      statement <- paste0(statement, ' procedure_date IS NULL')
    } else if (is(procedure_date, 'subQuery')){
      statement <- paste0(statement, ' procedure_date = (', as.character(procedure_date), ')')
    } else {
      statement <- paste0(statement, " procedure_date = '", procedure_date,"'")
    }
  }
  
  if (!missing(procedure_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(procedure_type_concept_id)) {
      statement <- paste0(statement, ' procedure_type_concept_id IS NULL')
    } else if (is(procedure_type_concept_id, 'subQuery')){
      statement <- paste0(statement, ' procedure_type_concept_id = (', as.character(procedure_type_concept_id), ')')
    } else {
      statement <- paste0(statement, " procedure_type_concept_id = '", procedure_type_concept_id,"'")
    }
  }
  
  if (!missing(modifier_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(modifier_concept_id)) {
      statement <- paste0(statement, ' modifier_concept_id IS NULL')
    } else if (is(modifier_concept_id, 'subQuery')){
      statement <- paste0(statement, ' modifier_concept_id = (', as.character(modifier_concept_id), ')')
    } else {
      statement <- paste0(statement, " modifier_concept_id = '", modifier_concept_id,"'")
    }
  }
  
  if (!missing(quantity)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(quantity)) {
      statement <- paste0(statement, ' quantity IS NULL')
    } else if (is(quantity, 'subQuery')){
      statement <- paste0(statement, ' quantity = (', as.character(quantity), ')')
    } else {
      statement <- paste0(statement, " quantity = '", quantity,"'")
    }
  }
  
  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, ' provider_id IS NULL')
    } else if (is(provider_id, 'subQuery')){
      statement <- paste0(statement, ' provider_id = (', as.character(provider_id), ')')
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }
  
  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, ' visit_occurrence_id IS NULL')
    } else if (is(visit_occurrence_id, 'subQuery')){
      statement <- paste0(statement, ' visit_occurrence_id = (', as.character(visit_occurrence_id), ')')
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }
  
  if (!missing(procedure_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(procedure_source_value)) {
      statement <- paste0(statement, ' procedure_source_value IS NULL')
    } else if (is(procedure_source_value, 'subQuery')){
      statement <- paste0(statement, ' procedure_source_value = (', as.character(procedure_source_value), ')')
    } else {
      statement <- paste0(statement, " procedure_source_value = '", procedure_source_value,"'")
    }
  }
  
  if (!missing(procedure_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(procedure_source_concept_id)) {
      statement <- paste0(statement, ' procedure_source_concept_id IS NULL')
    } else if (is(procedure_source_concept_id, 'subQuery')){
      statement <- paste0(statement, ' procedure_source_concept_id = (', as.character(procedure_source_concept_id), ')')
    } else {
      statement <- paste0(statement, " procedure_source_concept_id = '", procedure_source_concept_id,"'")
    }
  }
  
  if (!missing(qualifier_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(qualifier_source_value)) {
      statement <- paste0(statement, ' qualifier_source_value IS NULL')
    } else if (is(qualifier_source_value, 'subQuery')){
      statement <- paste0(statement, ' qualifier_source_value = (', as.character(qualifier_source_value), ')')
    } else {
      statement <- paste0(statement, " qualifier_source_value = '", qualifier_source_value,"'")
    }
  }
  
  class(statement) <- 'subQuery'
  return(statement)
}

lookup_observation <- function(fetchField, observation_id, person_id, observation_concept_id, observation_date, observation_datetime, observation_type_concept_id, value_as_number, value_as_string, value_as_concept_id, qualifier_concept_id, unit_concept_id, provider_id, visit_occurrence_id, observation_source_value, observation_source_concept_id, unit_source_value, qualifier_source_value) {
  statement <- paste0('SELECT ', fetchField , ' from @cdmDatabaseSchema.observation WHERE')
  first <- TRUE
  if (!missing(observation_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(observation_id)) {
      statement <- paste0(statement, ' observation_id IS NULL')
    } else if (is(observation_id, 'subQuery')){
      statement <- paste0(statement, ' observation_id = (', as.character(observation_id), ')')
    } else {
      statement <- paste0(statement, " observation_id = '", observation_id,"'")
    }
  }
  
  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, ' person_id IS NULL')
    } else if (is(person_id, 'subQuery')){
      statement <- paste0(statement, ' person_id = (', as.character(person_id), ')')
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }
  
  if (!missing(observation_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(observation_concept_id)) {
      statement <- paste0(statement, ' observation_concept_id IS NULL')
    } else if (is(observation_concept_id, 'subQuery')){
      statement <- paste0(statement, ' observation_concept_id = (', as.character(observation_concept_id), ')')
    } else {
      statement <- paste0(statement, " observation_concept_id = '", observation_concept_id,"'")
    }
  }
  
  if (!missing(observation_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(observation_date)) {
      statement <- paste0(statement, ' observation_date IS NULL')
    } else if (is(observation_date, 'subQuery')){
      statement <- paste0(statement, ' observation_date = (', as.character(observation_date), ')')
    } else {
      statement <- paste0(statement, " observation_date = '", observation_date,"'")
    }
  }
  
  if (!missing(observation_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(observation_datetime)) {
      statement <- paste0(statement, ' observation_datetime IS NULL')
    } else if (is(observation_datetime, 'subQuery')){
      statement <- paste0(statement, ' observation_datetime = (', as.character(observation_datetime), ')')
    } else {
      statement <- paste0(statement, " observation_datetime = '", observation_datetime,"'")
    }
  }
  
  if (!missing(observation_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(observation_type_concept_id)) {
      statement <- paste0(statement, ' observation_type_concept_id IS NULL')
    } else if (is(observation_type_concept_id, 'subQuery')){
      statement <- paste0(statement, ' observation_type_concept_id = (', as.character(observation_type_concept_id), ')')
    } else {
      statement <- paste0(statement, " observation_type_concept_id = '", observation_type_concept_id,"'")
    }
  }
  
  if (!missing(value_as_number)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(value_as_number)) {
      statement <- paste0(statement, ' value_as_number IS NULL')
    } else if (is(value_as_number, 'subQuery')){
      statement <- paste0(statement, ' value_as_number = (', as.character(value_as_number), ')')
    } else {
      statement <- paste0(statement, " value_as_number = '", value_as_number,"'")
    }
  }
  
  if (!missing(value_as_string)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(value_as_string)) {
      statement <- paste0(statement, ' value_as_string IS NULL')
    } else if (is(value_as_string, 'subQuery')){
      statement <- paste0(statement, ' value_as_string = (', as.character(value_as_string), ')')
    } else {
      statement <- paste0(statement, " value_as_string = '", value_as_string,"'")
    }
  }
  
  if (!missing(value_as_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(value_as_concept_id)) {
      statement <- paste0(statement, ' value_as_concept_id IS NULL')
    } else if (is(value_as_concept_id, 'subQuery')){
      statement <- paste0(statement, ' value_as_concept_id = (', as.character(value_as_concept_id), ')')
    } else {
      statement <- paste0(statement, " value_as_concept_id = '", value_as_concept_id,"'")
    }
  }
  
  if (!missing(qualifier_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(qualifier_concept_id)) {
      statement <- paste0(statement, ' qualifier_concept_id IS NULL')
    } else if (is(qualifier_concept_id, 'subQuery')){
      statement <- paste0(statement, ' qualifier_concept_id = (', as.character(qualifier_concept_id), ')')
    } else {
      statement <- paste0(statement, " qualifier_concept_id = '", qualifier_concept_id,"'")
    }
  }
  
  if (!missing(unit_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(unit_concept_id)) {
      statement <- paste0(statement, ' unit_concept_id IS NULL')
    } else if (is(unit_concept_id, 'subQuery')){
      statement <- paste0(statement, ' unit_concept_id = (', as.character(unit_concept_id), ')')
    } else {
      statement <- paste0(statement, " unit_concept_id = '", unit_concept_id,"'")
    }
  }
  
  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, ' provider_id IS NULL')
    } else if (is(provider_id, 'subQuery')){
      statement <- paste0(statement, ' provider_id = (', as.character(provider_id), ')')
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }
  
  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, ' visit_occurrence_id IS NULL')
    } else if (is(visit_occurrence_id, 'subQuery')){
      statement <- paste0(statement, ' visit_occurrence_id = (', as.character(visit_occurrence_id), ')')
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }
  
  if (!missing(observation_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(observation_source_value)) {
      statement <- paste0(statement, ' observation_source_value IS NULL')
    } else if (is(observation_source_value, 'subQuery')){
      statement <- paste0(statement, ' observation_source_value = (', as.character(observation_source_value), ')')
    } else {
      statement <- paste0(statement, " observation_source_value = '", observation_source_value,"'")
    }
  }
  
  if (!missing(observation_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(observation_source_concept_id)) {
      statement <- paste0(statement, ' observation_source_concept_id IS NULL')
    } else if (is(observation_source_concept_id, 'subQuery')){
      statement <- paste0(statement, ' observation_source_concept_id = (', as.character(observation_source_concept_id), ')')
    } else {
      statement <- paste0(statement, " observation_source_concept_id = '", observation_source_concept_id,"'")
    }
  }
  
  if (!missing(unit_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(unit_source_value)) {
      statement <- paste0(statement, ' unit_source_value IS NULL')
    } else if (is(unit_source_value, 'subQuery')){
      statement <- paste0(statement, ' unit_source_value = (', as.character(unit_source_value), ')')
    } else {
      statement <- paste0(statement, " unit_source_value = '", unit_source_value,"'")
    }
  }
  
  if (!missing(qualifier_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(qualifier_source_value)) {
      statement <- paste0(statement, ' qualifier_source_value IS NULL')
    } else if (is(qualifier_source_value, 'subQuery')){
      statement <- paste0(statement, ' qualifier_source_value = (', as.character(qualifier_source_value), ')')
    } else {
      statement <- paste0(statement, " qualifier_source_value = '", qualifier_source_value,"'")
    }
  }
  
  class(statement) <- 'subQuery'
  return(statement)
}

lookup_note <- function(fetchField, note_id, person_id, note_date, note_datetime, note_type_concept_id, note_text, provider_id, visit_occurrence_id, note_source_value) {
  statement <- paste0('SELECT ', fetchField , ' from @cdmDatabaseSchema.note WHERE')
  first <- TRUE
  if (!missing(note_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(note_id)) {
      statement <- paste0(statement, ' note_id IS NULL')
    } else if (is(note_id, 'subQuery')){
      statement <- paste0(statement, ' note_id = (', as.character(note_id), ')')
    } else {
      statement <- paste0(statement, " note_id = '", note_id,"'")
    }
  }
  
  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, ' person_id IS NULL')
    } else if (is(person_id, 'subQuery')){
      statement <- paste0(statement, ' person_id = (', as.character(person_id), ')')
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }
  
  if (!missing(note_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(note_date)) {
      statement <- paste0(statement, ' note_date IS NULL')
    } else if (is(note_date, 'subQuery')){
      statement <- paste0(statement, ' note_date = (', as.character(note_date), ')')
    } else {
      statement <- paste0(statement, " note_date = '", note_date,"'")
    }
  }
  
  if (!missing(note_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(note_datetime)) {
      statement <- paste0(statement, ' note_datetime IS NULL')
    } else if (is(note_datetime, 'subQuery')){
      statement <- paste0(statement, ' note_datetime = (', as.character(note_datetime), ')')
    } else {
      statement <- paste0(statement, " note_datetime = '", note_datetime,"'")
    }
  }
  
  if (!missing(note_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(note_type_concept_id)) {
      statement <- paste0(statement, ' note_type_concept_id IS NULL')
    } else if (is(note_type_concept_id, 'subQuery')){
      statement <- paste0(statement, ' note_type_concept_id = (', as.character(note_type_concept_id), ')')
    } else {
      statement <- paste0(statement, " note_type_concept_id = '", note_type_concept_id,"'")
    }
  }
  
  if (!missing(note_text)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(note_text)) {
      statement <- paste0(statement, ' note_text IS NULL')
    } else if (is(note_text, 'subQuery')){
      statement <- paste0(statement, ' note_text = (', as.character(note_text), ')')
    } else {
      statement <- paste0(statement, " note_text = '", note_text,"'")
    }
  }
  
  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(provider_id)) {
      statement <- paste0(statement, ' provider_id IS NULL')
    } else if (is(provider_id, 'subQuery')){
      statement <- paste0(statement, ' provider_id = (', as.character(provider_id), ')')
    } else {
      statement <- paste0(statement, " provider_id = '", provider_id,"'")
    }
  }
  
  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(visit_occurrence_id)) {
      statement <- paste0(statement, ' visit_occurrence_id IS NULL')
    } else if (is(visit_occurrence_id, 'subQuery')){
      statement <- paste0(statement, ' visit_occurrence_id = (', as.character(visit_occurrence_id), ')')
    } else {
      statement <- paste0(statement, " visit_occurrence_id = '", visit_occurrence_id,"'")
    }
  }
  
  if (!missing(note_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(note_source_value)) {
      statement <- paste0(statement, ' note_source_value IS NULL')
    } else if (is(note_source_value, 'subQuery')){
      statement <- paste0(statement, ' note_source_value = (', as.character(note_source_value), ')')
    } else {
      statement <- paste0(statement, " note_source_value = '", note_source_value,"'")
    }
  }
  
  class(statement) <- 'subQuery'
  return(statement)
}

lookup_specimen <- function(fetchField, specimen_id, person_id, specimen_concept_id, specimen_type_concept_id, specimen_date, specimen_datetime, quantity, unit_concept_id, anatomic_site_concept_id, disease_status_concept_id, specimen_source_id, specimen_source_value, unit_source_value, anatomic_site_source_value, disease_status_source_value) {
  statement <- paste0('SELECT ', fetchField , ' from @cdmDatabaseSchema.specimen WHERE')
  first <- TRUE
  if (!missing(specimen_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(specimen_id)) {
      statement <- paste0(statement, ' specimen_id IS NULL')
    } else if (is(specimen_id, 'subQuery')){
      statement <- paste0(statement, ' specimen_id = (', as.character(specimen_id), ')')
    } else {
      statement <- paste0(statement, " specimen_id = '", specimen_id,"'")
    }
  }
  
  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, ' person_id IS NULL')
    } else if (is(person_id, 'subQuery')){
      statement <- paste0(statement, ' person_id = (', as.character(person_id), ')')
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }
  
  if (!missing(specimen_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(specimen_concept_id)) {
      statement <- paste0(statement, ' specimen_concept_id IS NULL')
    } else if (is(specimen_concept_id, 'subQuery')){
      statement <- paste0(statement, ' specimen_concept_id = (', as.character(specimen_concept_id), ')')
    } else {
      statement <- paste0(statement, " specimen_concept_id = '", specimen_concept_id,"'")
    }
  }
  
  if (!missing(specimen_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(specimen_type_concept_id)) {
      statement <- paste0(statement, ' specimen_type_concept_id IS NULL')
    } else if (is(specimen_type_concept_id, 'subQuery')){
      statement <- paste0(statement, ' specimen_type_concept_id = (', as.character(specimen_type_concept_id), ')')
    } else {
      statement <- paste0(statement, " specimen_type_concept_id = '", specimen_type_concept_id,"'")
    }
  }
  
  if (!missing(specimen_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(specimen_date)) {
      statement <- paste0(statement, ' specimen_date IS NULL')
    } else if (is(specimen_date, 'subQuery')){
      statement <- paste0(statement, ' specimen_date = (', as.character(specimen_date), ')')
    } else {
      statement <- paste0(statement, " specimen_date = '", specimen_date,"'")
    }
  }
  
  if (!missing(specimen_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(specimen_datetime)) {
      statement <- paste0(statement, ' specimen_datetime IS NULL')
    } else if (is(specimen_datetime, 'subQuery')){
      statement <- paste0(statement, ' specimen_datetime = (', as.character(specimen_datetime), ')')
    } else {
      statement <- paste0(statement, " specimen_datetime = '", specimen_datetime,"'")
    }
  }
  
  if (!missing(quantity)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(quantity)) {
      statement <- paste0(statement, ' quantity IS NULL')
    } else if (is(quantity, 'subQuery')){
      statement <- paste0(statement, ' quantity = (', as.character(quantity), ')')
    } else {
      statement <- paste0(statement, " quantity = '", quantity,"'")
    }
  }
  
  if (!missing(unit_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(unit_concept_id)) {
      statement <- paste0(statement, ' unit_concept_id IS NULL')
    } else if (is(unit_concept_id, 'subQuery')){
      statement <- paste0(statement, ' unit_concept_id = (', as.character(unit_concept_id), ')')
    } else {
      statement <- paste0(statement, " unit_concept_id = '", unit_concept_id,"'")
    }
  }
  
  if (!missing(anatomic_site_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(anatomic_site_concept_id)) {
      statement <- paste0(statement, ' anatomic_site_concept_id IS NULL')
    } else if (is(anatomic_site_concept_id, 'subQuery')){
      statement <- paste0(statement, ' anatomic_site_concept_id = (', as.character(anatomic_site_concept_id), ')')
    } else {
      statement <- paste0(statement, " anatomic_site_concept_id = '", anatomic_site_concept_id,"'")
    }
  }
  
  if (!missing(disease_status_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(disease_status_concept_id)) {
      statement <- paste0(statement, ' disease_status_concept_id IS NULL')
    } else if (is(disease_status_concept_id, 'subQuery')){
      statement <- paste0(statement, ' disease_status_concept_id = (', as.character(disease_status_concept_id), ')')
    } else {
      statement <- paste0(statement, " disease_status_concept_id = '", disease_status_concept_id,"'")
    }
  }
  
  if (!missing(specimen_source_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(specimen_source_id)) {
      statement <- paste0(statement, ' specimen_source_id IS NULL')
    } else if (is(specimen_source_id, 'subQuery')){
      statement <- paste0(statement, ' specimen_source_id = (', as.character(specimen_source_id), ')')
    } else {
      statement <- paste0(statement, " specimen_source_id = '", specimen_source_id,"'")
    }
  }
  
  if (!missing(specimen_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(specimen_source_value)) {
      statement <- paste0(statement, ' specimen_source_value IS NULL')
    } else if (is(specimen_source_value, 'subQuery')){
      statement <- paste0(statement, ' specimen_source_value = (', as.character(specimen_source_value), ')')
    } else {
      statement <- paste0(statement, " specimen_source_value = '", specimen_source_value,"'")
    }
  }
  
  if (!missing(unit_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(unit_source_value)) {
      statement <- paste0(statement, ' unit_source_value IS NULL')
    } else if (is(unit_source_value, 'subQuery')){
      statement <- paste0(statement, ' unit_source_value = (', as.character(unit_source_value), ')')
    } else {
      statement <- paste0(statement, " unit_source_value = '", unit_source_value,"'")
    }
  }
  
  if (!missing(anatomic_site_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(anatomic_site_source_value)) {
      statement <- paste0(statement, ' anatomic_site_source_value IS NULL')
    } else if (is(anatomic_site_source_value, 'subQuery')){
      statement <- paste0(statement, ' anatomic_site_source_value = (', as.character(anatomic_site_source_value), ')')
    } else {
      statement <- paste0(statement, " anatomic_site_source_value = '", anatomic_site_source_value,"'")
    }
  }
  
  if (!missing(disease_status_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(disease_status_source_value)) {
      statement <- paste0(statement, ' disease_status_source_value IS NULL')
    } else if (is(disease_status_source_value, 'subQuery')){
      statement <- paste0(statement, ' disease_status_source_value = (', as.character(disease_status_source_value), ')')
    } else {
      statement <- paste0(statement, " disease_status_source_value = '", disease_status_source_value,"'")
    }
  }
  
  class(statement) <- 'subQuery'
  return(statement)
}

lookup_fact_relationship <- function(fetchField, domain_concept_id_1, fact_id_1, domain_concept_id_2, fact_id_2, relationship_concept_id) {
  statement <- paste0('SELECT ', fetchField , ' from @cdmDatabaseSchema.fact_relationship WHERE')
  first <- TRUE
  if (!missing(domain_concept_id_1)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(domain_concept_id_1)) {
      statement <- paste0(statement, ' domain_concept_id_1 IS NULL')
    } else if (is(domain_concept_id_1, 'subQuery')){
      statement <- paste0(statement, ' domain_concept_id_1 = (', as.character(domain_concept_id_1), ')')
    } else {
      statement <- paste0(statement, " domain_concept_id_1 = '", domain_concept_id_1,"'")
    }
  }
  
  if (!missing(fact_id_1)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(fact_id_1)) {
      statement <- paste0(statement, ' fact_id_1 IS NULL')
    } else if (is(fact_id_1, 'subQuery')){
      statement <- paste0(statement, ' fact_id_1 = (', as.character(fact_id_1), ')')
    } else {
      statement <- paste0(statement, " fact_id_1 = '", fact_id_1,"'")
    }
  }
  
  if (!missing(domain_concept_id_2)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(domain_concept_id_2)) {
      statement <- paste0(statement, ' domain_concept_id_2 IS NULL')
    } else if (is(domain_concept_id_2, 'subQuery')){
      statement <- paste0(statement, ' domain_concept_id_2 = (', as.character(domain_concept_id_2), ')')
    } else {
      statement <- paste0(statement, " domain_concept_id_2 = '", domain_concept_id_2,"'")
    }
  }
  
  if (!missing(fact_id_2)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(fact_id_2)) {
      statement <- paste0(statement, ' fact_id_2 IS NULL')
    } else if (is(fact_id_2, 'subQuery')){
      statement <- paste0(statement, ' fact_id_2 = (', as.character(fact_id_2), ')')
    } else {
      statement <- paste0(statement, " fact_id_2 = '", fact_id_2,"'")
    }
  }
  
  if (!missing(relationship_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(relationship_concept_id)) {
      statement <- paste0(statement, ' relationship_concept_id IS NULL')
    } else if (is(relationship_concept_id, 'subQuery')){
      statement <- paste0(statement, ' relationship_concept_id = (', as.character(relationship_concept_id), ')')
    } else {
      statement <- paste0(statement, " relationship_concept_id = '", relationship_concept_id,"'")
    }
  }
  
  class(statement) <- 'subQuery'
  return(statement)
}

lookup_drug_era <- function(fetchField, drug_era_id, person_id, drug_concept_id, drug_era_start_date, drug_era_end_date, drug_exposure_count, gap_days) {
  statement <- paste0('SELECT ', fetchField , ' from @cdmDatabaseSchema.drug_era WHERE')
  first <- TRUE
  if (!missing(drug_era_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(drug_era_id)) {
      statement <- paste0(statement, ' drug_era_id IS NULL')
    } else if (is(drug_era_id, 'subQuery')){
      statement <- paste0(statement, ' drug_era_id = (', as.character(drug_era_id), ')')
    } else {
      statement <- paste0(statement, " drug_era_id = '", drug_era_id,"'")
    }
  }
  
  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, ' person_id IS NULL')
    } else if (is(person_id, 'subQuery')){
      statement <- paste0(statement, ' person_id = (', as.character(person_id), ')')
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }
  
  if (!missing(drug_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(drug_concept_id)) {
      statement <- paste0(statement, ' drug_concept_id IS NULL')
    } else if (is(drug_concept_id, 'subQuery')){
      statement <- paste0(statement, ' drug_concept_id = (', as.character(drug_concept_id), ')')
    } else {
      statement <- paste0(statement, " drug_concept_id = '", drug_concept_id,"'")
    }
  }
  
  if (!missing(drug_era_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(drug_era_start_date)) {
      statement <- paste0(statement, ' drug_era_start_date IS NULL')
    } else if (is(drug_era_start_date, 'subQuery')){
      statement <- paste0(statement, ' drug_era_start_date = (', as.character(drug_era_start_date), ')')
    } else {
      statement <- paste0(statement, " drug_era_start_date = '", drug_era_start_date,"'")
    }
  }
  
  if (!missing(drug_era_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(drug_era_end_date)) {
      statement <- paste0(statement, ' drug_era_end_date IS NULL')
    } else if (is(drug_era_end_date, 'subQuery')){
      statement <- paste0(statement, ' drug_era_end_date = (', as.character(drug_era_end_date), ')')
    } else {
      statement <- paste0(statement, " drug_era_end_date = '", drug_era_end_date,"'")
    }
  }
  
  if (!missing(drug_exposure_count)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(drug_exposure_count)) {
      statement <- paste0(statement, ' drug_exposure_count IS NULL')
    } else if (is(drug_exposure_count, 'subQuery')){
      statement <- paste0(statement, ' drug_exposure_count = (', as.character(drug_exposure_count), ')')
    } else {
      statement <- paste0(statement, " drug_exposure_count = '", drug_exposure_count,"'")
    }
  }
  
  if (!missing(gap_days)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(gap_days)) {
      statement <- paste0(statement, ' gap_days IS NULL')
    } else if (is(gap_days, 'subQuery')){
      statement <- paste0(statement, ' gap_days = (', as.character(gap_days), ')')
    } else {
      statement <- paste0(statement, " gap_days = '", gap_days,"'")
    }
  }
  
  class(statement) <- 'subQuery'
  return(statement)
}

lookup_dose_era <- function(fetchField, dose_era_id, person_id, drug_concept_id, unit_concept_id, dose_value, dose_era_start_date, dose_era_end_date) {
  statement <- paste0('SELECT ', fetchField , ' from @cdmDatabaseSchema.dose_era WHERE')
  first <- TRUE
  if (!missing(dose_era_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(dose_era_id)) {
      statement <- paste0(statement, ' dose_era_id IS NULL')
    } else if (is(dose_era_id, 'subQuery')){
      statement <- paste0(statement, ' dose_era_id = (', as.character(dose_era_id), ')')
    } else {
      statement <- paste0(statement, " dose_era_id = '", dose_era_id,"'")
    }
  }
  
  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, ' person_id IS NULL')
    } else if (is(person_id, 'subQuery')){
      statement <- paste0(statement, ' person_id = (', as.character(person_id), ')')
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }
  
  if (!missing(drug_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(drug_concept_id)) {
      statement <- paste0(statement, ' drug_concept_id IS NULL')
    } else if (is(drug_concept_id, 'subQuery')){
      statement <- paste0(statement, ' drug_concept_id = (', as.character(drug_concept_id), ')')
    } else {
      statement <- paste0(statement, " drug_concept_id = '", drug_concept_id,"'")
    }
  }
  
  if (!missing(unit_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(unit_concept_id)) {
      statement <- paste0(statement, ' unit_concept_id IS NULL')
    } else if (is(unit_concept_id, 'subQuery')){
      statement <- paste0(statement, ' unit_concept_id = (', as.character(unit_concept_id), ')')
    } else {
      statement <- paste0(statement, " unit_concept_id = '", unit_concept_id,"'")
    }
  }
  
  if (!missing(dose_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(dose_value)) {
      statement <- paste0(statement, ' dose_value IS NULL')
    } else if (is(dose_value, 'subQuery')){
      statement <- paste0(statement, ' dose_value = (', as.character(dose_value), ')')
    } else {
      statement <- paste0(statement, " dose_value = '", dose_value,"'")
    }
  }
  
  if (!missing(dose_era_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(dose_era_start_date)) {
      statement <- paste0(statement, ' dose_era_start_date IS NULL')
    } else if (is(dose_era_start_date, 'subQuery')){
      statement <- paste0(statement, ' dose_era_start_date = (', as.character(dose_era_start_date), ')')
    } else {
      statement <- paste0(statement, " dose_era_start_date = '", dose_era_start_date,"'")
    }
  }
  
  if (!missing(dose_era_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(dose_era_end_date)) {
      statement <- paste0(statement, ' dose_era_end_date IS NULL')
    } else if (is(dose_era_end_date, 'subQuery')){
      statement <- paste0(statement, ' dose_era_end_date = (', as.character(dose_era_end_date), ')')
    } else {
      statement <- paste0(statement, " dose_era_end_date = '", dose_era_end_date,"'")
    }
  }
  
  class(statement) <- 'subQuery'
  return(statement)
}

lookup_condition_era <- function(fetchField, condition_era_id, person_id, condition_concept_id, condition_era_start_date, condition_era_end_date, condition_occurrence_count) {
  statement <- paste0('SELECT ', fetchField , ' from @cdmDatabaseSchema.condition_era WHERE')
  first <- TRUE
  if (!missing(condition_era_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(condition_era_id)) {
      statement <- paste0(statement, ' condition_era_id IS NULL')
    } else if (is(condition_era_id, 'subQuery')){
      statement <- paste0(statement, ' condition_era_id = (', as.character(condition_era_id), ')')
    } else {
      statement <- paste0(statement, " condition_era_id = '", condition_era_id,"'")
    }
  }
  
  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(person_id)) {
      statement <- paste0(statement, ' person_id IS NULL')
    } else if (is(person_id, 'subQuery')){
      statement <- paste0(statement, ' person_id = (', as.character(person_id), ')')
    } else {
      statement <- paste0(statement, " person_id = '", person_id,"'")
    }
  }
  
  if (!missing(condition_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(condition_concept_id)) {
      statement <- paste0(statement, ' condition_concept_id IS NULL')
    } else if (is(condition_concept_id, 'subQuery')){
      statement <- paste0(statement, ' condition_concept_id = (', as.character(condition_concept_id), ')')
    } else {
      statement <- paste0(statement, " condition_concept_id = '", condition_concept_id,"'")
    }
  }
  
  if (!missing(condition_era_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(condition_era_start_date)) {
      statement <- paste0(statement, ' condition_era_start_date IS NULL')
    } else if (is(condition_era_start_date, 'subQuery')){
      statement <- paste0(statement, ' condition_era_start_date = (', as.character(condition_era_start_date), ')')
    } else {
      statement <- paste0(statement, " condition_era_start_date = '", condition_era_start_date,"'")
    }
  }
  
  if (!missing(condition_era_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(condition_era_end_date)) {
      statement <- paste0(statement, ' condition_era_end_date IS NULL')
    } else if (is(condition_era_end_date, 'subQuery')){
      statement <- paste0(statement, ' condition_era_end_date = (', as.character(condition_era_end_date), ')')
    } else {
      statement <- paste0(statement, " condition_era_end_date = '", condition_era_end_date,"'")
    }
  }
  
  if (!missing(condition_occurrence_count)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(condition_occurrence_count)) {
      statement <- paste0(statement, ' condition_occurrence_count IS NULL')
    } else if (is(condition_occurrence_count, 'subQuery')){
      statement <- paste0(statement, ' condition_occurrence_count = (', as.character(condition_occurrence_count), ')')
    } else {
      statement <- paste0(statement, " condition_occurrence_count = '", condition_occurrence_count,"'")
    }
  }
  
  class(statement) <- 'subQuery'
  return(statement)
}

lookup_cdm_source <- function(fetchField, cdm_source_name, cdm_source_abbreviation, cdm_holder, source_description, source_documentation_reference, cdm_etl_reference, source_release_date, cdm_release_date, cdm_version, vocabulary_version) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdmDatabaseSchema.cdm_source WHERE')
  first <- TRUE
  if (!missing(cdm_source_name)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cdm_source_name)) {
      statement <- paste0(statement, ' cdm_source_name IS NULL')
    } else if (is(cdm_source_name, 'subQuery')){
      statement <- paste0(statement, ' cdm_source_name = (', as.character(cdm_source_name), ')')
    } else {
      statement <- paste0(statement, " cdm_source_name = '", cdm_source_name,"'")
    }
  }
  
  if (!missing(cdm_source_abbreviation)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cdm_source_abbreviation)) {
      statement <- paste0(statement, ' cdm_source_abbreviation IS NULL')
    } else if (is(cdm_source_abbreviation, 'subQuery')){
      statement <- paste0(statement, ' cdm_source_abbreviation = (', as.character(cdm_source_abbreviation), ')')
    } else {
      statement <- paste0(statement, " cdm_source_abbreviation = '", cdm_source_abbreviation,"'")
    }
  }
  
  if (!missing(cdm_holder)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cdm_holder)) {
      statement <- paste0(statement, ' cdm_holder IS NULL')
    } else if (is(cdm_holder, 'subQuery')){
      statement <- paste0(statement, ' cdm_holder = (', as.character(cdm_holder), ')')
    } else {
      statement <- paste0(statement, " cdm_holder = '", cdm_holder,"'")
    }
  }
  
  if (!missing(source_description)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(source_description)) {
      statement <- paste0(statement, ' source_description IS NULL')
    } else if (is(source_description, 'subQuery')){
      statement <- paste0(statement, ' source_description = (', as.character(source_description), ')')
    } else {
      statement <- paste0(statement, " source_description = '", source_description,"'")
    }
  }
  
  if (!missing(source_documentation_reference)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(source_documentation_reference)) {
      statement <- paste0(statement, ' source_documentation_reference IS NULL')
    } else if (is(source_documentation_reference, 'subQuery')){
      statement <- paste0(statement, ' source_documentation_reference = (', as.character(source_documentation_reference), ')')
    } else {
      statement <- paste0(statement, " source_documentation_reference = '", source_documentation_reference,"'")
    }
  }
  
  if (!missing(cdm_etl_reference)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cdm_etl_reference)) {
      statement <- paste0(statement, ' cdm_etl_reference IS NULL')
    } else if (is(cdm_etl_reference, 'subQuery')){
      statement <- paste0(statement, ' cdm_etl_reference = (', as.character(cdm_etl_reference), ')')
    } else {
      statement <- paste0(statement, " cdm_etl_reference = '", cdm_etl_reference,"'")
    }
  }
  
  if (!missing(source_release_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(source_release_date)) {
      statement <- paste0(statement, ' source_release_date IS NULL')
    } else if (is(source_release_date, 'subQuery')){
      statement <- paste0(statement, ' source_release_date = (', as.character(source_release_date), ')')
    } else {
      statement <- paste0(statement, " source_release_date = '", source_release_date,"'")
    }
  }
  
  if (!missing(cdm_release_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cdm_release_date)) {
      statement <- paste0(statement, ' cdm_release_date IS NULL')
    } else if (is(cdm_release_date, 'subQuery')){
      statement <- paste0(statement, ' cdm_release_date = (', as.character(cdm_release_date), ')')
    } else {
      statement <- paste0(statement, " cdm_release_date = '", cdm_release_date,"'")
    }
  }
  
  if (!missing(cdm_version)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cdm_version)) {
      statement <- paste0(statement, ' cdm_version IS NULL')
    } else if (is(cdm_version, 'subQuery')){
      statement <- paste0(statement, ' cdm_version = (', as.character(cdm_version), ')')
    } else {
      statement <- paste0(statement, " cdm_version = '", cdm_version,"'")
    }
  }
  
  if (!missing(vocabulary_version)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(vocabulary_version)) {
      statement <- paste0(statement, ' vocabulary_version IS NULL')
    } else if (is(vocabulary_version, 'subQuery')){
      statement <- paste0(statement, ' vocabulary_version = (', as.character(vocabulary_version), ')')
    } else {
      statement <- paste0(statement, " vocabulary_version = '", vocabulary_version,"'")
    }
  }
  
  class(statement) <- 'subQuery'
  return(statement)
}

lookup_cohort <- function(fetchField, cohort_definition_id, subject_id, cohort_start_date, cohort_end_date) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdmDatabaseSchema.cohort WHERE')
  first <- TRUE
  if (!missing(cohort_definition_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cohort_definition_id)) {
      statement <- paste0(statement, ' cohort_definition_id IS NULL')
    } else if (is(cohort_definition_id, 'subQuery')){
      statement <- paste0(statement, ' cohort_definition_id = (', as.character(cohort_definition_id), ')')
    } else {
      statement <- paste0(statement, " cohort_definition_id = '", cohort_definition_id,"'")
    }
  }
  
  if (!missing(subject_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(subject_id)) {
      statement <- paste0(statement, ' subject_id IS NULL')
    } else if (is(subject_id, 'subQuery')){
      statement <- paste0(statement, ' subject_id = (', as.character(subject_id), ')')
    } else {
      statement <- paste0(statement, " subject_id = '", subject_id,"'")
    }
  }
  
  if (!missing(cohort_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cohort_start_date)) {
      statement <- paste0(statement, ' cohort_start_date IS NULL')
    } else if (is(cohort_start_date, 'subQuery')){
      statement <- paste0(statement, ' cohort_start_date = (', as.character(cohort_start_date), ')')
    } else {
      statement <- paste0(statement, " cohort_start_date = '", cohort_start_date,"'")
    }
  }
  
  if (!missing(cohort_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cohort_end_date)) {
      statement <- paste0(statement, ' cohort_end_date IS NULL')
    } else if (is(cohort_end_date, 'subQuery')){
      statement <- paste0(statement, ' cohort_end_date = (', as.character(cohort_end_date), ')')
    } else {
      statement <- paste0(statement, " cohort_end_date = '", cohort_end_date,"'")
    }
  }
  
  class(statement) <- 'subQuery'
  return(statement)
}

lookup_cohort_definition <- function(fetchField, cohort_definition_id, cohort_definition_name, cohort_definition_description, definition_type_concept_id, cohort_definition_syntax, subject_concept_id, cohort_instantiation_date) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdmDatabaseSchema.cohort_definition WHERE')
  first <- TRUE
  if (!missing(cohort_definition_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cohort_definition_id)) {
      statement <- paste0(statement, ' cohort_definition_id IS NULL')
    } else if (is(cohort_definition_id, 'subQuery')){
      statement <- paste0(statement, ' cohort_definition_id = (', as.character(cohort_definition_id), ')')
    } else {
      statement <- paste0(statement, " cohort_definition_id = '", cohort_definition_id,"'")
    }
  }
  
  if (!missing(cohort_definition_name)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cohort_definition_name)) {
      statement <- paste0(statement, ' cohort_definition_name IS NULL')
    } else if (is(cohort_definition_name, 'subQuery')){
      statement <- paste0(statement, ' cohort_definition_name = (', as.character(cohort_definition_name), ')')
    } else {
      statement <- paste0(statement, " cohort_definition_name = '", cohort_definition_name,"'")
    }
  }
  
  if (!missing(cohort_definition_description)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cohort_definition_description)) {
      statement <- paste0(statement, ' cohort_definition_description IS NULL')
    } else if (is(cohort_definition_description, 'subQuery')){
      statement <- paste0(statement, ' cohort_definition_description = (', as.character(cohort_definition_description), ')')
    } else {
      statement <- paste0(statement, " cohort_definition_description = '", cohort_definition_description,"'")
    }
  }
  
  if (!missing(definition_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(definition_type_concept_id)) {
      statement <- paste0(statement, ' definition_type_concept_id IS NULL')
    } else if (is(definition_type_concept_id, 'subQuery')){
      statement <- paste0(statement, ' definition_type_concept_id = (', as.character(definition_type_concept_id), ')')
    } else {
      statement <- paste0(statement, " definition_type_concept_id = '", definition_type_concept_id,"'")
    }
  }
  
  if (!missing(cohort_definition_syntax)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cohort_definition_syntax)) {
      statement <- paste0(statement, ' cohort_definition_syntax IS NULL')
    } else if (is(cohort_definition_syntax, 'subQuery')){
      statement <- paste0(statement, ' cohort_definition_syntax = (', as.character(cohort_definition_syntax), ')')
    } else {
      statement <- paste0(statement, " cohort_definition_syntax = '", cohort_definition_syntax,"'")
    }
  }
  
  if (!missing(subject_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(subject_concept_id)) {
      statement <- paste0(statement, ' subject_concept_id IS NULL')
    } else if (is(subject_concept_id, 'subQuery')){
      statement <- paste0(statement, ' subject_concept_id = (', as.character(subject_concept_id), ')')
    } else {
      statement <- paste0(statement, " subject_concept_id = '", subject_concept_id,"'")
    }
  }
  
  if (!missing(cohort_instantiation_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cohort_instantiation_date)) {
      statement <- paste0(statement, ' cohort_instantiation_date IS NULL')
    } else if (is(cohort_instantiation_date, 'subQuery')){
      statement <- paste0(statement, ' cohort_instantiation_date = (', as.character(cohort_instantiation_date), ')')
    } else {
      statement <- paste0(statement, " cohort_instantiation_date = '", cohort_instantiation_date,"'")
    }
  }
  
  class(statement) <- 'subQuery'
  return(statement)
}

lookup_cohort_attribute <- function(fetchField, cohort_definition_id, cohort_start_date, cohort_end_date, subject_id, attribute_definition_id, value_as_number, value_as_concept_id) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdmDatabaseSchema.cohort_attribute WHERE')
  first <- TRUE
  if (!missing(cohort_definition_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cohort_definition_id)) {
      statement <- paste0(statement, ' cohort_definition_id IS NULL')
    } else if (is(cohort_definition_id, 'subQuery')){
      statement <- paste0(statement, ' cohort_definition_id = (', as.character(cohort_definition_id), ')')
    } else {
      statement <- paste0(statement, " cohort_definition_id = '", cohort_definition_id,"'")
    }
  }
  
  if (!missing(cohort_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cohort_start_date)) {
      statement <- paste0(statement, ' cohort_start_date IS NULL')
    } else if (is(cohort_start_date, 'subQuery')){
      statement <- paste0(statement, ' cohort_start_date = (', as.character(cohort_start_date), ')')
    } else {
      statement <- paste0(statement, " cohort_start_date = '", cohort_start_date,"'")
    }
  }
  
  if (!missing(cohort_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(cohort_end_date)) {
      statement <- paste0(statement, ' cohort_end_date IS NULL')
    } else if (is(cohort_end_date, 'subQuery')){
      statement <- paste0(statement, ' cohort_end_date = (', as.character(cohort_end_date), ')')
    } else {
      statement <- paste0(statement, " cohort_end_date = '", cohort_end_date,"'")
    }
  }
  
  if (!missing(subject_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(subject_id)) {
      statement <- paste0(statement, ' subject_id IS NULL')
    } else if (is(subject_id, 'subQuery')){
      statement <- paste0(statement, ' subject_id = (', as.character(subject_id), ')')
    } else {
      statement <- paste0(statement, " subject_id = '", subject_id,"'")
    }
  }
  
  if (!missing(attribute_definition_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(attribute_definition_id)) {
      statement <- paste0(statement, ' attribute_definition_id IS NULL')
    } else if (is(attribute_definition_id, 'subQuery')){
      statement <- paste0(statement, ' attribute_definition_id = (', as.character(attribute_definition_id), ')')
    } else {
      statement <- paste0(statement, " attribute_definition_id = '", attribute_definition_id,"'")
    }
  }
  
  if (!missing(value_as_number)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(value_as_number)) {
      statement <- paste0(statement, ' value_as_number IS NULL')
    } else if (is(value_as_number, 'subQuery')){
      statement <- paste0(statement, ' value_as_number = (', as.character(value_as_number), ')')
    } else {
      statement <- paste0(statement, " value_as_number = '", value_as_number,"'")
    }
  }
  
  if (!missing(value_as_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(value_as_concept_id)) {
      statement <- paste0(statement, ' value_as_concept_id IS NULL')
    } else if (is(value_as_concept_id, 'subQuery')){
      statement <- paste0(statement, ' value_as_concept_id = (', as.character(value_as_concept_id), ')')
    } else {
      statement <- paste0(statement, " value_as_concept_id = '", value_as_concept_id,"'")
    }
  }
  
  class(statement) <- 'subQuery'
  return(statement)
}

lookup_attribute_definition <- function(fetchField, attribute_definition_id, attribute_name, attribute_description, attribute_type_concept_id, attribute_syntax) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdmDatabaseSchema.attribute_definition WHERE')
  first <- TRUE
  if (!missing(attribute_definition_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(attribute_definition_id)) {
      statement <- paste0(statement, ' attribute_definition_id IS NULL')
    } else if (is(attribute_definition_id, 'subQuery')){
      statement <- paste0(statement, ' attribute_definition_id = (', as.character(attribute_definition_id), ')')
    } else {
      statement <- paste0(statement, " attribute_definition_id = '", attribute_definition_id,"'")
    }
  }
  
  if (!missing(attribute_name)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(attribute_name)) {
      statement <- paste0(statement, ' attribute_name IS NULL')
    } else if (is(attribute_name, 'subQuery')){
      statement <- paste0(statement, ' attribute_name = (', as.character(attribute_name), ')')
    } else {
      statement <- paste0(statement, " attribute_name = '", attribute_name,"'")
    }
  }
  
  if (!missing(attribute_description)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(attribute_description)) {
      statement <- paste0(statement, ' attribute_description IS NULL')
    } else if (is(attribute_description, 'subQuery')){
      statement <- paste0(statement, ' attribute_description = (', as.character(attribute_description), ')')
    } else {
      statement <- paste0(statement, " attribute_description = '", attribute_description,"'")
    }
  }
  
  if (!missing(attribute_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(attribute_type_concept_id)) {
      statement <- paste0(statement, ' attribute_type_concept_id IS NULL')
    } else if (is(attribute_type_concept_id, 'subQuery')){
      statement <- paste0(statement, ' attribute_type_concept_id = (', as.character(attribute_type_concept_id), ')')
    } else {
      statement <- paste0(statement, " attribute_type_concept_id = '", attribute_type_concept_id,"'")
    }
  }
  
  if (!missing(attribute_syntax)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, ' AND')
    }
    if (is.null(attribute_syntax)) {
      statement <- paste0(statement, ' attribute_syntax IS NULL')
    } else if (is(attribute_syntax, 'subQuery')){
      statement <- paste0(statement, ' attribute_syntax = (', as.character(attribute_syntax), ')')
    } else {
      statement <- paste0(statement, " attribute_syntax = '", attribute_syntax,"'")
    }
  }
  
  class(statement) <- 'subQuery'
  return(statement)
}

