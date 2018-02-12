frameworkContext <- new.env(parent = emptyenv());
initFramework <- function() {
  frameworkContext$groupIndex <- 0;
  insertSql <- c()
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.drug_claims;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.enrollment_detail;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.enrollment_summary;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.facility_header;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.health_risk_assessment;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.hra_question_ref;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.hra_variable_ref;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.inpatient_admissions;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.inpatient_services;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.lab;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.outpatient_services;")
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
  #defaults$_flag <- "0"
  defaults$age <- "57"
  defaults$agegrp <- "5"
  defaults$awp <- "0.0"
  defaults$cap_svc <- "N"
  defaults$cob <- "0.0"
  defaults$coins <- "0.0"
  defaults$copay <- "0.0"
  defaults$datatyp <- "1"
  defaults$dawind <- "01"
  defaults$daysupp <- "30"
  defaults$deaclas <- "6"
  defaults$deduct <- "0.0"
  defaults$dispfee <- "0.0"
  defaults$dobyr <- "1952"
  defaults$eeclass <- "9"
  defaults$eestatu <- "1"
  defaults$egeoloc <- "49"
  defaults$eidflag <- "1"
  defaults$emprel <- "1"
  defaults$enrflag <- "1"
  defaults$genind <- "4"
  defaults$hlthplan <- "0"
  defaults$ingcost <- "0.0"
  defaults$maintin <- "1"
  defaults$metqty <- "30.0"
  defaults$mhsacovg <- "1"
  defaults$msa <- "0"
  defaults$ndcnum <- "00406035705"
  defaults$netpay <- "0.0"
  defaults$ntwkprov <- "Y"
  defaults$paidntwk <- "Y"
  defaults$pay <- "0.0"
  defaults$phyflag <- "1"
  defaults$plantyp <- "6"
  defaults$qty <- "1"
  defaults$refill <- "0"
  defaults$region <- "3"
  defaults$rxmr <- "1"
  defaults$saletax <- "0.0"
  defaults$sex <- "2"
  defaults$svcdate <- "2012-12-17"
  defaults$thercls <- "69"
  defaults$thergrp <- "08"
  defaults$version <- "10"
  defaults$year <- "2012"
  frameworkContext$defaultValues$drug_claims = defaults;

  defaults <- new.env(parent = emptyenv())
  #defaults$_flag <- "0"
  defaults$age <- "50"
  defaults$agegrp <- "1"
  defaults$datatyp <- "1"
  defaults$dobyr <- "1958"
  defaults$dtend <- "2011-10-31"
  defaults$dtstart <- "2011-10-01"
  defaults$eeclass <- "9"
  defaults$eestatu <- "9"
  defaults$egeoloc <- "62"
  defaults$emprel <- "1"
  defaults$hlthplan <- "1"
  defaults$memdays <- "31"
  defaults$mhsacovg <- "1"
  defaults$msa <- "0"
  defaults$phyflag <- "1"
  defaults$plantyp <- "6"
  defaults$region <- "3"
  defaults$rx <- "1"
  defaults$sex <- "2"
  defaults$version <- "10"
  defaults$year <- "2011"
  frameworkContext$defaultValues$enrollment_detail = defaults;

  defaults <- new.env(parent = emptyenv())
  #defaults$_flag <- "0"
  defaults$age <- "0"
  defaults$agegrp <- "1"
  defaults$dattyp1 <- "1"
  defaults$dattyp10 <- "1"
  defaults$dattyp11 <- "1"
  defaults$dattyp12 <- "1"
  defaults$dattyp2 <- "1"
  defaults$dattyp3 <- "1"
  defaults$dattyp4 <- "1"
  defaults$dattyp5 <- "1"
  defaults$dattyp6 <- "1"
  defaults$dattyp7 <- "1"
  defaults$dattyp8 <- "1"
  defaults$dattyp9 <- "1"
  defaults$dobyr <- "1957"
  defaults$eeclass <- "9"
  defaults$eestatu <- "9"
  defaults$egeoloc <- "62"
  defaults$emprel <- "1"
  defaults$enrind1 <- "1"
  defaults$enrind10 <- "1"
  defaults$enrind11 <- "1"
  defaults$enrind12 <- "1"
  defaults$enrind2 <- "1"
  defaults$enrind3 <- "1"
  defaults$enrind4 <- "1"
  defaults$enrind5 <- "1"
  defaults$enrind6 <- "1"
  defaults$enrind7 <- "1"
  defaults$enrind8 <- "1"
  defaults$enrind9 <- "1"
  defaults$enrmon <- "12"
  defaults$hlthplan <- "1"
  defaults$memday1 <- "31"
  defaults$memday10 <- "31"
  defaults$memday11 <- "30"
  defaults$memday12 <- "31"
  defaults$memday2 <- "28"
  defaults$memday3 <- "31"
  defaults$memday4 <- "30"
  defaults$memday5 <- "31"
  defaults$memday6 <- "30"
  defaults$memday7 <- "31"
  defaults$memday8 <- "31"
  defaults$memday9 <- "30"
  defaults$memdays <- "365"
  defaults$mhsacovg <- "1"
  defaults$msa <- "0"
  defaults$phyflag <- "1"
  defaults$plntyp1 <- "6"
  defaults$plntyp10 <- "6"
  defaults$plntyp11 <- "6"
  defaults$plntyp12 <- "6"
  defaults$plntyp2 <- "6"
  defaults$plntyp3 <- "6"
  defaults$plntyp4 <- "6"
  defaults$plntyp5 <- "6"
  defaults$plntyp6 <- "6"
  defaults$plntyp7 <- "6"
  defaults$plntyp8 <- "6"
  defaults$plntyp9 <- "6"
  defaults$region <- "3"
  defaults$rx <- "1"
  defaults$sex <- "2"
  defaults$version <- "10"
  defaults$year <- "2012"
  frameworkContext$defaultValues$enrollment_summary = defaults;

  defaults <- new.env(parent = emptyenv())
  #defaults$_flag <- "0"
  defaults$age <- "60"
  defaults$agegrp <- "5"
  defaults$billtyp <- "131"
  defaults$cap_svc <- "N"
  defaults$cob <- "0.0"
  defaults$coins <- "0.0"
  defaults$copay <- "0.0"
  defaults$datatyp <- "1"
  defaults$deduct <- "0.0"
  defaults$dobyr <- "1953"
  defaults$dstatus <- "01"
  defaults$dx1 <- "5856   "
  defaults$eeclass <- "9"
  defaults$eestatu <- "9"
  defaults$egeoloc <- "49"
  defaults$eidflag <- "1"
  defaults$emprel <- "1"
  defaults$enrflag <- "1"
  defaults$hlthplan <- "1"
  defaults$mdc <- "23"
  defaults$mhsacovg <- "1"
  defaults$msa <- "0"
  defaults$netpay <- "0.0"
  defaults$ntwkprov <- "Y"
  defaults$paidntwk <- "Y"
  defaults$phyflag <- "1"
  defaults$plantyp <- "6"
  defaults$region <- "3"
  defaults$rx <- "1"
  defaults$sex <- "2"
  defaults$stdplac <- "22"
  defaults$stdprov <- "1"
  defaults$svcdate <- "2012-08-01"
  defaults$tsvcdat <- "2012-01-31"
  defaults$version <- "10"
  defaults$year <- "2012"
  frameworkContext$defaultValues$facility_header = defaults;

  defaults <- new.env(parent = emptyenv())
  #defaults$_flag <- "0"
  defaults$alc_amt <- "-"
  defaults$alcweek <- "9"
  defaults$cc_allergy <- "-"
  defaults$cc_arthritis <- "-"
  defaults$cc_asthma <- "-"
  defaults$cc_backpain <- "-"
  defaults$cc_chf <- "-"
  defaults$cc_depress <- "9"
  defaults$cc_diab <- "-"
  defaults$cc_heartdis <- "-"
  defaults$cc_highbp <- "-"
  defaults$cc_highcol <- "-"
  defaults$cc_hrtburn <- "-"
  defaults$cc_lungdis <- "-"
  defaults$cc_migraine <- "-"
  defaults$cc_nonskincan <- "-"
  defaults$cc_osteopo <- "-"
  defaults$cc_skincan <- "-"
  defaults$cgrcurr <- "-"
  defaults$cgrprev <- "-"
  defaults$cgtamt <- "9"
  defaults$cgtcurr <- "0"
  defaults$cgtdur <- "9"
  defaults$cgtpkamt <- "9"
  defaults$cgtprev <- "0"
  defaults$cgtqtcat <- "-"
  defaults$cgtquit <- "9"
  defaults$chewcurr <- "-"
  defaults$chewprev <- "-"
  defaults$copestrs <- "-"
  defaults$dietfrt <- "-"
  defaults$dietfrvg <- "-"
  defaults$dietveg <- "-"
  defaults$dobyr <- "1962"
  defaults$drnkdrv <- "-"
  defaults$educ_lvl <- "-"
  defaults$exermo <- "-"
  defaults$famabscat12 <- "9"
  defaults$fireext <- "-"
  defaults$flu_shot <- "-"
  defaults$hltimpct <- "-"
  defaults$job_sat <- "-"
  defaults$life_sat <- "-"
  defaults$liftwgt <- "-"
  defaults$mh_freq <- "9"
  defaults$mh_prob <- "9"
  defaults$pipecurr <- "-"
  defaults$pipeprev <- "-"
  defaults$planalc <- "9"
  defaults$plandiet <- "9"
  defaults$plandrad <- "-"
  defaults$planexer <- "9"
  defaults$planstrs <- "9"
  defaults$plantob <- "9"
  defaults$planwgt <- "9"
  defaults$prev_mammo <- "-"
  defaults$prev_paptest <- "-"
  defaults$prev_prostex <- "-"
  defaults$prev_sigmoid <- "-"
  defaults$prodabscat <- "9"
  defaults$risk_alc <- "0"
  defaults$risk_bp <- "-"
  defaults$risk_chol <- "-"
  defaults$risk_exer <- "-"
  defaults$risk_gluc <- "-"
  defaults$risk_mh <- "-"
  defaults$risk_nutr <- "-"
  defaults$risk_safe <- "-"
  defaults$risk_sleep <- "-"
  defaults$risk_smok <- "0"
  defaults$risk_wgt <- "-"
  defaults$seatbelt <- "1"
  defaults$selfhlth <- "-"
  defaults$sex <- "1"
  defaults$slpapnea <- "-"
  defaults$slpprob <- "-"
  defaults$stretch <- "-"
  defaults$survdate <- "2013-09-01"
  defaults$tobcurr <- "0"
  defaults$tobprev <- "0"
  defaults$version <- "1.0"
  defaults$wrkabscat <- "-"
  defaults$wrkabscat12 <- "9"
  defaults$year <- "2014"
  frameworkContext$defaultValues$health_risk_assessment = defaults;

  defaults <- new.env(parent = emptyenv())
  defaults$question_type_id <- "25"
  defaults$category_value <- "1"
  defaults$category_name <- "Question not asked"
  frameworkContext$defaultValues$hra_question_ref = defaults;

  defaults <- new.env(parent = emptyenv())
  defaults$question_type_id <- "4.0"
  frameworkContext$defaultValues$hra_variable_ref = defaults;

  defaults <- new.env(parent = emptyenv())
  #defaults$_flag <- "0"
  defaults$admdate <- "2011-05-16"
  defaults$admtyp <- "2"
  defaults$age <- "0"
  defaults$agegrp <- "2"
  defaults$datatyp <- "1"
  defaults$days <- "2"
  defaults$disdate <- "2011-05-19"
  defaults$dobyr <- "1952"
  defaults$drg <- "775"
  defaults$dstatus <- "01"
  defaults$dx1 <- "V3000  "
  defaults$eeclass <- "9"
  defaults$eestatu <- "9"
  defaults$egeoloc <- "49"
  defaults$eidflag <- "1"
  defaults$emprel <- "1"
  defaults$enrflag <- "1"
  defaults$hlthplan <- "0"
  defaults$hospnet <- "0.0"
  defaults$hosppay <- "0.0"
  defaults$mdc <- "14"
  defaults$mhsacovg <- "1"
  defaults$msa <- "0"
  defaults$pdx <- "V3000  "
  defaults$phyflag <- "1"
  defaults$physnet <- "0.0"
  defaults$physpay <- "0.0"
  defaults$plantyp <- "6"
  defaults$proc2 <- "7359   "
  defaults$region <- "3"
  defaults$rx <- "1"
  defaults$sex <- "2"
  defaults$state <- "49"
  defaults$totcob <- "0.0"
  defaults$totcoins <- "0.0"
  defaults$totcopay <- "0.0"
  defaults$totded <- "0.0"
  defaults$totnet <- "0.0"
  defaults$totpay <- "0.0"
  defaults$version <- "10"
  defaults$year <- "2011"
  frameworkContext$defaultValues$inpatient_admissions = defaults;

  defaults <- new.env(parent = emptyenv())
  #defaults$_flag <- "0"
  defaults$admdate <- "2012-04-02"
  defaults$admtyp <- "1"
  defaults$age <- "0"
  defaults$agegrp <- "5"
  defaults$cap_svc <- "N"
  defaults$cob <- "0.0"
  defaults$coins <- "0.0"
  defaults$copay <- "0.0"
  defaults$datatyp <- "1"
  defaults$deduct <- "0.0"
  defaults$disdate <- "2011-04-15"
  defaults$dobyr <- "1952"
  defaults$drg <- "775"
  defaults$dstatus <- "01"
  defaults$dx1 <- "V3000  "
  defaults$dx2 <- "       "
  defaults$dx3 <- "       "
  defaults$dx4 <- "       "
  defaults$dx5 <- "       "
  defaults$dxver <- " "
  defaults$eeclass <- "9"
  defaults$eestatu <- "9"
  defaults$egeoloc <- "49"
  defaults$eidflag <- "1"
  defaults$emprel <- "1"
  defaults$enrflag <- "1"
  defaults$facprof <- "F"
  defaults$hlthplan <- "1"
  defaults$indstry <- " "
  defaults$mdc <- "05"
  defaults$mhsacovg <- "1"
  defaults$msa <- "0"
  defaults$netpay <- "0.0"
  defaults$ntwkprov <- "Y"
  defaults$paidntwk <- "Y"
  defaults$pay <- "0.0"
  defaults$pddate <- "2010-04-30"
  defaults$pdx <- "V3000  "
  defaults$phyflag <- "1"
  defaults$plantyp <- "6"
  defaults$pproc <- "       "
  defaults$proc1 <- "       "
  defaults$procmod <- "  "
  defaults$proctyp <- " "
  defaults$qty <- "1"
  defaults$region <- "3"
  defaults$revcode <- "    "
  defaults$rx <- "1"
  defaults$sex <- "2"
  defaults$stdplac <- "21"
  defaults$stdprov <- "1"
  defaults$svcdate <- "2012-08-14"
  defaults$svcscat <- "     "
  defaults$tsvcdat <- "2013-12-31"
  defaults$version <- "10"
  defaults$year <- "2012"
  frameworkContext$defaultValues$inpatient_services = defaults;

  defaults <- new.env(parent = emptyenv())
  defaults$enrolid <- "30853151102"
  defaults$abnormal <- "N"
  defaults$agegrp <- "5"
  defaults$eeclass <- "9"
  defaults$eestatu <- "9"
  defaults$eidflag <- "1"
  defaults$emprel <- "1"
  defaults$enrflag <- "1"
  defaults$hlthplan <- "1"
  defaults$mhsacovg <- "1"
  defaults$phyflag <- "1"
  defaults$proctyp <- "1"
  defaults$region <- "3"
  defaults$rx <- "1"
  defaults$sex <- "2"
  defaults$egeoloc <- "49"
  defaults$mdc <- "23"
  defaults$version <- "10"
  defaults$svcdate <- "2009-11-10"
  defaults$msa <- "35644"
  defaults$orderid <- "4962"
  defaults$refhigh <- "0.0"
  defaults$reflow <- "0.0"
  defaults$result <- "0.0"
  defaults$testcnt <- "1"
  defaults$dobyr <- "1957"
  defaults$stdprov <- "930"
  defaults$year <- "2012"
  defaults$age <- "57"
  defaults$datatyp <- "1"
  defaults$plantyp <- "6"
  defaults$stdplac <- "81"
  frameworkContext$defaultValues$lab = defaults;

  defaults <- new.env(parent = emptyenv())
  #defaults$_flag <- "0"
  defaults$age <- "58"
  defaults$agegrp <- "5"
  defaults$cap_svc <- "N"
  defaults$cob <- "0.0"
  defaults$coins <- "0.0"
  defaults$copay <- "0.0"
  defaults$datatyp <- "1"
  defaults$deduct <- "0.0"
  defaults$dobyr <- "1952"
  defaults$dx1 <- "V202   "
  defaults$eeclass <- "9"
  defaults$eestatu <- "9"
  defaults$egeoloc <- "49"
  defaults$eidflag <- "1"
  defaults$emprel <- "1"
  defaults$enrflag <- "1"
  defaults$facprof <- "P"
  defaults$hlthplan <- "0"
  defaults$mdc <- "23"
  defaults$mhsacovg <- "1"
  defaults$msa <- "0"
  defaults$netpay <- "0.0"
  defaults$ntwkprov <- "Y"
  defaults$paidntwk <- "Y"
  defaults$pay <- "0.0"
  defaults$pddate <- "2012-08-31"
  defaults$phyflag <- "1"
  defaults$plantyp <- "6"
  defaults$procgrp <- "104"
  defaults$proctyp <- "1"
  defaults$qty <- "1"
  defaults$region <- "3"
  defaults$rx <- "1"
  defaults$sex <- "2"
  defaults$stdplac <- "11"
  defaults$stdprov <- "1"
  defaults$svcdate <- "2012-12-10"
  defaults$svcscat <- "40151"
  defaults$version <- "10"
  defaults$year <- "2012"
  frameworkContext$defaultValues$outpatient_services = defaults;
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

set_defaults_drug_claims <- function(age, agegrp, awp, cap_svc, cob, coins, copay, datatyp, dawind, daysupp, deaclas, deduct, dispfee, dobyr, eeclass, eestatu, efamid, egeoloc, eidflag, emprel, enrflag, enrolid, generid, genind, hlthplan, indstry, ingcost, maintin, metqty, mhsacovg, msa, ndcnum, netpay, ntwkprov, paidntwk, pay, pddate, pharmid, phyflag, plankey, plantyp, qty, refill, region, rxmr, saletax, seqnum, sex, svcdate, thercls, thergrp, version, wgtkey, year) {
  defaults <- frameworkContext$defaultValues$drug_claims;
  
  if (!missing(age)) {
    defaults$age <- age
  }
  if (!missing(agegrp)) {
    defaults$agegrp <- agegrp
  }
  if (!missing(awp)) {
    defaults$awp <- awp
  }
  if (!missing(cap_svc)) {
    defaults$cap_svc <- cap_svc
  }
  if (!missing(cob)) {
    defaults$cob <- cob
  }
  if (!missing(coins)) {
    defaults$coins <- coins
  }
  if (!missing(copay)) {
    defaults$copay <- copay
  }
  if (!missing(datatyp)) {
    defaults$datatyp <- datatyp
  }
  if (!missing(dawind)) {
    defaults$dawind <- dawind
  }
  if (!missing(daysupp)) {
    defaults$daysupp <- daysupp
  }
  if (!missing(deaclas)) {
    defaults$deaclas <- deaclas
  }
  if (!missing(deduct)) {
    defaults$deduct <- deduct
  }
  if (!missing(dispfee)) {
    defaults$dispfee <- dispfee
  }
  if (!missing(dobyr)) {
    defaults$dobyr <- dobyr
  }
  if (!missing(eeclass)) {
    defaults$eeclass <- eeclass
  }
  if (!missing(eestatu)) {
    defaults$eestatu <- eestatu
  }
  if (!missing(efamid)) {
    defaults$efamid <- efamid
  }
  if (!missing(egeoloc)) {
    defaults$egeoloc <- egeoloc
  }
  if (!missing(eidflag)) {
    defaults$eidflag <- eidflag
  }
  if (!missing(emprel)) {
    defaults$emprel <- emprel
  }
  if (!missing(enrflag)) {
    defaults$enrflag <- enrflag
  }
  if (!missing(enrolid)) {
    defaults$enrolid <- enrolid
  }
  if (!missing(generid)) {
    defaults$generid <- generid
  }
  if (!missing(genind)) {
    defaults$genind <- genind
  }
  if (!missing(hlthplan)) {
    defaults$hlthplan <- hlthplan
  }
  if (!missing(indstry)) {
    defaults$indstry <- indstry
  }
  if (!missing(ingcost)) {
    defaults$ingcost <- ingcost
  }
  if (!missing(maintin)) {
    defaults$maintin <- maintin
  }
  if (!missing(metqty)) {
    defaults$metqty <- metqty
  }
  if (!missing(mhsacovg)) {
    defaults$mhsacovg <- mhsacovg
  }
  if (!missing(msa)) {
    defaults$msa <- msa
  }
  if (!missing(ndcnum)) {
    defaults$ndcnum <- ndcnum
  }
  if (!missing(netpay)) {
    defaults$netpay <- netpay
  }
  if (!missing(ntwkprov)) {
    defaults$ntwkprov <- ntwkprov
  }
  if (!missing(paidntwk)) {
    defaults$paidntwk <- paidntwk
  }
  if (!missing(pay)) {
    defaults$pay <- pay
  }
  if (!missing(pddate)) {
    defaults$pddate <- pddate
  }
  if (!missing(pharmid)) {
    defaults$pharmid <- pharmid
  }
  if (!missing(phyflag)) {
    defaults$phyflag <- phyflag
  }
  if (!missing(plankey)) {
    defaults$plankey <- plankey
  }
  if (!missing(plantyp)) {
    defaults$plantyp <- plantyp
  }
  if (!missing(qty)) {
    defaults$qty <- qty
  }
  if (!missing(refill)) {
    defaults$refill <- refill
  }
  if (!missing(region)) {
    defaults$region <- region
  }
  if (!missing(rxmr)) {
    defaults$rxmr <- rxmr
  }
  if (!missing(saletax)) {
    defaults$saletax <- saletax
  }
  if (!missing(seqnum)) {
    defaults$seqnum <- seqnum
  }
  if (!missing(sex)) {
    defaults$sex <- sex
  }
  if (!missing(svcdate)) {
    defaults$svcdate <- svcdate
  }
  if (!missing(thercls)) {
    defaults$thercls <- thercls
  }
  if (!missing(thergrp)) {
    defaults$thergrp <- thergrp
  }
  if (!missing(version)) {
    defaults$version <- version
  }
  if (!missing(wgtkey)) {
    defaults$wgtkey <- wgtkey
  }
  if (!missing(year)) {
    defaults$year <- year
  }
  invisible(defaults)
}

set_defaults_enrollment_detail <- function(age, agegrp, datatyp, dobyr, dtend, dtstart, eeclass, eestatu, efamid, egeoloc, emprel, enrolid, hlthplan, indstry, memdays, mhsacovg, msa, phyflag, plankey, plantyp, region, rx, seqnum, sex, version, wgtkey, year) {
  defaults <- frameworkContext$defaultValues$enrollment_detail;
  
  if (!missing(age)) {
    defaults$age <- age
  }
  if (!missing(agegrp)) {
    defaults$agegrp <- agegrp
  }
  if (!missing(datatyp)) {
    defaults$datatyp <- datatyp
  }
  if (!missing(dobyr)) {
    defaults$dobyr <- dobyr
  }
  if (!missing(dtend)) {
    defaults$dtend <- dtend
  }
  if (!missing(dtstart)) {
    defaults$dtstart <- dtstart
  }
  if (!missing(eeclass)) {
    defaults$eeclass <- eeclass
  }
  if (!missing(eestatu)) {
    defaults$eestatu <- eestatu
  }
  if (!missing(efamid)) {
    defaults$efamid <- efamid
  }
  if (!missing(egeoloc)) {
    defaults$egeoloc <- egeoloc
  }
  if (!missing(emprel)) {
    defaults$emprel <- emprel
  }
  if (!missing(enrolid)) {
    defaults$enrolid <- enrolid
  }
  if (!missing(hlthplan)) {
    defaults$hlthplan <- hlthplan
  }
  if (!missing(indstry)) {
    defaults$indstry <- indstry
  }
  if (!missing(memdays)) {
    defaults$memdays <- memdays
  }
  if (!missing(mhsacovg)) {
    defaults$mhsacovg <- mhsacovg
  }
  if (!missing(msa)) {
    defaults$msa <- msa
  }
  if (!missing(phyflag)) {
    defaults$phyflag <- phyflag
  }
  if (!missing(plankey)) {
    defaults$plankey <- plankey
  }
  if (!missing(plantyp)) {
    defaults$plantyp <- plantyp
  }
  if (!missing(region)) {
    defaults$region <- region
  }
  if (!missing(rx)) {
    defaults$rx <- rx
  }
  if (!missing(seqnum)) {
    defaults$seqnum <- seqnum
  }
  if (!missing(sex)) {
    defaults$sex <- sex
  }
  if (!missing(version)) {
    defaults$version <- version
  }
  if (!missing(wgtkey)) {
    defaults$wgtkey <- wgtkey
  }
  if (!missing(year)) {
    defaults$year <- year
  }
  invisible(defaults)
}

set_defaults_enrollment_summary <- function(age, agegrp, dattyp1, dattyp10, dattyp11, dattyp12, dattyp2, dattyp3, dattyp4, dattyp5, dattyp6, dattyp7, dattyp8, dattyp9, dobyr, eeclass, eestatu, efamid, egeoloc, emprel, enrind1, enrind10, enrind11, enrind12, enrind2, enrind3, enrind4, enrind5, enrind6, enrind7, enrind8, enrind9, enrmon, enrolid, hlthplan, indstry, memday1, memday10, memday11, memday12, memday2, memday3, memday4, memday5, memday6, memday7, memday8, memday9, memdays, mhsacovg, msa, phyflag, plnkey1, plnkey10, plnkey11, plnkey12, plnkey2, plnkey3, plnkey4, plnkey5, plnkey6, plnkey7, plnkey8, plnkey9, plntyp1, plntyp10, plntyp11, plntyp12, plntyp2, plntyp3, plntyp4, plntyp5, plntyp6, plntyp7, plntyp8, plntyp9, region, rx, seqnum, sex, version, wgtkey, year, mswgtkey) {
  defaults <- frameworkContext$defaultValues$enrollment_summary;
  
  if (!missing(age)) {
    defaults$age <- age
  }
  if (!missing(agegrp)) {
    defaults$agegrp <- agegrp
  }
  if (!missing(dattyp1)) {
    defaults$dattyp1 <- dattyp1
  }
  if (!missing(dattyp10)) {
    defaults$dattyp10 <- dattyp10
  }
  if (!missing(dattyp11)) {
    defaults$dattyp11 <- dattyp11
  }
  if (!missing(dattyp12)) {
    defaults$dattyp12 <- dattyp12
  }
  if (!missing(dattyp2)) {
    defaults$dattyp2 <- dattyp2
  }
  if (!missing(dattyp3)) {
    defaults$dattyp3 <- dattyp3
  }
  if (!missing(dattyp4)) {
    defaults$dattyp4 <- dattyp4
  }
  if (!missing(dattyp5)) {
    defaults$dattyp5 <- dattyp5
  }
  if (!missing(dattyp6)) {
    defaults$dattyp6 <- dattyp6
  }
  if (!missing(dattyp7)) {
    defaults$dattyp7 <- dattyp7
  }
  if (!missing(dattyp8)) {
    defaults$dattyp8 <- dattyp8
  }
  if (!missing(dattyp9)) {
    defaults$dattyp9 <- dattyp9
  }
  if (!missing(dobyr)) {
    defaults$dobyr <- dobyr
  }
  if (!missing(eeclass)) {
    defaults$eeclass <- eeclass
  }
  if (!missing(eestatu)) {
    defaults$eestatu <- eestatu
  }
  if (!missing(efamid)) {
    defaults$efamid <- efamid
  }
  if (!missing(egeoloc)) {
    defaults$egeoloc <- egeoloc
  }
  if (!missing(emprel)) {
    defaults$emprel <- emprel
  }
  if (!missing(enrind1)) {
    defaults$enrind1 <- enrind1
  }
  if (!missing(enrind10)) {
    defaults$enrind10 <- enrind10
  }
  if (!missing(enrind11)) {
    defaults$enrind11 <- enrind11
  }
  if (!missing(enrind12)) {
    defaults$enrind12 <- enrind12
  }
  if (!missing(enrind2)) {
    defaults$enrind2 <- enrind2
  }
  if (!missing(enrind3)) {
    defaults$enrind3 <- enrind3
  }
  if (!missing(enrind4)) {
    defaults$enrind4 <- enrind4
  }
  if (!missing(enrind5)) {
    defaults$enrind5 <- enrind5
  }
  if (!missing(enrind6)) {
    defaults$enrind6 <- enrind6
  }
  if (!missing(enrind7)) {
    defaults$enrind7 <- enrind7
  }
  if (!missing(enrind8)) {
    defaults$enrind8 <- enrind8
  }
  if (!missing(enrind9)) {
    defaults$enrind9 <- enrind9
  }
  if (!missing(enrmon)) {
    defaults$enrmon <- enrmon
  }
  if (!missing(enrolid)) {
    defaults$enrolid <- enrolid
  }
  if (!missing(hlthplan)) {
    defaults$hlthplan <- hlthplan
  }
  if (!missing(indstry)) {
    defaults$indstry <- indstry
  }
  if (!missing(memday1)) {
    defaults$memday1 <- memday1
  }
  if (!missing(memday10)) {
    defaults$memday10 <- memday10
  }
  if (!missing(memday11)) {
    defaults$memday11 <- memday11
  }
  if (!missing(memday12)) {
    defaults$memday12 <- memday12
  }
  if (!missing(memday2)) {
    defaults$memday2 <- memday2
  }
  if (!missing(memday3)) {
    defaults$memday3 <- memday3
  }
  if (!missing(memday4)) {
    defaults$memday4 <- memday4
  }
  if (!missing(memday5)) {
    defaults$memday5 <- memday5
  }
  if (!missing(memday6)) {
    defaults$memday6 <- memday6
  }
  if (!missing(memday7)) {
    defaults$memday7 <- memday7
  }
  if (!missing(memday8)) {
    defaults$memday8 <- memday8
  }
  if (!missing(memday9)) {
    defaults$memday9 <- memday9
  }
  if (!missing(memdays)) {
    defaults$memdays <- memdays
  }
  if (!missing(mhsacovg)) {
    defaults$mhsacovg <- mhsacovg
  }
  if (!missing(msa)) {
    defaults$msa <- msa
  }
  if (!missing(phyflag)) {
    defaults$phyflag <- phyflag
  }
  if (!missing(plnkey1)) {
    defaults$plnkey1 <- plnkey1
  }
  if (!missing(plnkey10)) {
    defaults$plnkey10 <- plnkey10
  }
  if (!missing(plnkey11)) {
    defaults$plnkey11 <- plnkey11
  }
  if (!missing(plnkey12)) {
    defaults$plnkey12 <- plnkey12
  }
  if (!missing(plnkey2)) {
    defaults$plnkey2 <- plnkey2
  }
  if (!missing(plnkey3)) {
    defaults$plnkey3 <- plnkey3
  }
  if (!missing(plnkey4)) {
    defaults$plnkey4 <- plnkey4
  }
  if (!missing(plnkey5)) {
    defaults$plnkey5 <- plnkey5
  }
  if (!missing(plnkey6)) {
    defaults$plnkey6 <- plnkey6
  }
  if (!missing(plnkey7)) {
    defaults$plnkey7 <- plnkey7
  }
  if (!missing(plnkey8)) {
    defaults$plnkey8 <- plnkey8
  }
  if (!missing(plnkey9)) {
    defaults$plnkey9 <- plnkey9
  }
  if (!missing(plntyp1)) {
    defaults$plntyp1 <- plntyp1
  }
  if (!missing(plntyp10)) {
    defaults$plntyp10 <- plntyp10
  }
  if (!missing(plntyp11)) {
    defaults$plntyp11 <- plntyp11
  }
  if (!missing(plntyp12)) {
    defaults$plntyp12 <- plntyp12
  }
  if (!missing(plntyp2)) {
    defaults$plntyp2 <- plntyp2
  }
  if (!missing(plntyp3)) {
    defaults$plntyp3 <- plntyp3
  }
  if (!missing(plntyp4)) {
    defaults$plntyp4 <- plntyp4
  }
  if (!missing(plntyp5)) {
    defaults$plntyp5 <- plntyp5
  }
  if (!missing(plntyp6)) {
    defaults$plntyp6 <- plntyp6
  }
  if (!missing(plntyp7)) {
    defaults$plntyp7 <- plntyp7
  }
  if (!missing(plntyp8)) {
    defaults$plntyp8 <- plntyp8
  }
  if (!missing(plntyp9)) {
    defaults$plntyp9 <- plntyp9
  }
  if (!missing(region)) {
    defaults$region <- region
  }
  if (!missing(rx)) {
    defaults$rx <- rx
  }
  if (!missing(seqnum)) {
    defaults$seqnum <- seqnum
  }
  if (!missing(sex)) {
    defaults$sex <- sex
  }
  if (!missing(version)) {
    defaults$version <- version
  }
  if (!missing(wgtkey)) {
    defaults$wgtkey <- wgtkey
  }
  if (!missing(year)) {
    defaults$year <- year
  }
  if (!missing(mswgtkey)) {
    defaults$mswgtkey <- mswgtkey
  }
  invisible(defaults)
}

set_defaults_facility_header <- function(age, agegrp, billtyp, cap_svc, caseid, cob, coins, copay, datatyp, deduct, dobyr, dstatus, dx1, dx2, dx3, dx4, dx5, dx6, dx7, dx8, dx9, dxver, eeclass, eestatu, efamid, egeoloc, eidflag, emprel, enrflag, enrolid, fachdid, hlthplan, indstry, mdc, mhsacovg, msa, netpay, ntwkprov, paidntwk, pddate, phyflag, plankey, plantyp, proc1, proc2, proc3, proc4, proc5, proc6, provid, region, rx, seqnum, sex, stdplac, stdprov, svcdate, tsvcdat, version, wgtkey, year, msclmid, npi) {
  defaults <- frameworkContext$defaultValues$facility_header;
  
  if (!missing(age)) {
    defaults$age <- age
  }
  if (!missing(agegrp)) {
    defaults$agegrp <- agegrp
  }
  if (!missing(billtyp)) {
    defaults$billtyp <- billtyp
  }
  if (!missing(cap_svc)) {
    defaults$cap_svc <- cap_svc
  }
  if (!missing(caseid)) {
    defaults$caseid <- caseid
  }
  if (!missing(cob)) {
    defaults$cob <- cob
  }
  if (!missing(coins)) {
    defaults$coins <- coins
  }
  if (!missing(copay)) {
    defaults$copay <- copay
  }
  if (!missing(datatyp)) {
    defaults$datatyp <- datatyp
  }
  if (!missing(deduct)) {
    defaults$deduct <- deduct
  }
  if (!missing(dobyr)) {
    defaults$dobyr <- dobyr
  }
  if (!missing(dstatus)) {
    defaults$dstatus <- dstatus
  }
  if (!missing(dx1)) {
    defaults$dx1 <- dx1
  }
  if (!missing(dx2)) {
    defaults$dx2 <- dx2
  }
  if (!missing(dx3)) {
    defaults$dx3 <- dx3
  }
  if (!missing(dx4)) {
    defaults$dx4 <- dx4
  }
  if (!missing(dx5)) {
    defaults$dx5 <- dx5
  }
  if (!missing(dx6)) {
    defaults$dx6 <- dx6
  }
  if (!missing(dx7)) {
    defaults$dx7 <- dx7
  }
  if (!missing(dx8)) {
    defaults$dx8 <- dx8
  }
  if (!missing(dx9)) {
    defaults$dx9 <- dx9
  }
  if (!missing(dxver)) {
    defaults$dxver <- dxver
  }
  if (!missing(eeclass)) {
    defaults$eeclass <- eeclass
  }
  if (!missing(eestatu)) {
    defaults$eestatu <- eestatu
  }
  if (!missing(efamid)) {
    defaults$efamid <- efamid
  }
  if (!missing(egeoloc)) {
    defaults$egeoloc <- egeoloc
  }
  if (!missing(eidflag)) {
    defaults$eidflag <- eidflag
  }
  if (!missing(emprel)) {
    defaults$emprel <- emprel
  }
  if (!missing(enrflag)) {
    defaults$enrflag <- enrflag
  }
  if (!missing(enrolid)) {
    defaults$enrolid <- enrolid
  }
  if (!missing(fachdid)) {
    defaults$fachdid <- fachdid
  }
  if (!missing(hlthplan)) {
    defaults$hlthplan <- hlthplan
  }
  if (!missing(indstry)) {
    defaults$indstry <- indstry
  }
  if (!missing(mdc)) {
    defaults$mdc <- mdc
  }
  if (!missing(mhsacovg)) {
    defaults$mhsacovg <- mhsacovg
  }
  if (!missing(msa)) {
    defaults$msa <- msa
  }
  if (!missing(netpay)) {
    defaults$netpay <- netpay
  }
  if (!missing(ntwkprov)) {
    defaults$ntwkprov <- ntwkprov
  }
  if (!missing(paidntwk)) {
    defaults$paidntwk <- paidntwk
  }
  if (!missing(pddate)) {
    defaults$pddate <- pddate
  }
  if (!missing(phyflag)) {
    defaults$phyflag <- phyflag
  }
  if (!missing(plankey)) {
    defaults$plankey <- plankey
  }
  if (!missing(plantyp)) {
    defaults$plantyp <- plantyp
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
  if (!missing(proc6)) {
    defaults$proc6 <- proc6
  }
  if (!missing(provid)) {
    defaults$provid <- provid
  }
  if (!missing(region)) {
    defaults$region <- region
  }
  if (!missing(rx)) {
    defaults$rx <- rx
  }
  if (!missing(seqnum)) {
    defaults$seqnum <- seqnum
  }
  if (!missing(sex)) {
    defaults$sex <- sex
  }
  if (!missing(stdplac)) {
    defaults$stdplac <- stdplac
  }
  if (!missing(stdprov)) {
    defaults$stdprov <- stdprov
  }
  if (!missing(svcdate)) {
    defaults$svcdate <- svcdate
  }
  if (!missing(tsvcdat)) {
    defaults$tsvcdat <- tsvcdat
  }
  if (!missing(version)) {
    defaults$version <- version
  }
  if (!missing(wgtkey)) {
    defaults$wgtkey <- wgtkey
  }
  if (!missing(year)) {
    defaults$year <- year
  }
  if (!missing(msclmid)) {
    defaults$msclmid <- msclmid
  }
  if (!missing(npi)) {
    defaults$npi <- npi
  }
  invisible(defaults)
}

set_defaults_health_risk_assessment <- function(alc_amt, alcdyamt, alcweek, bmi, cc_allergy, cc_arthritis, cc_asthma, cc_backpain, cc_chf, cc_depress, cc_diab, cc_heartdis, cc_highbp, cc_highcol, cc_hrtburn, cc_lungdis, cc_migraine, cc_nonskincan, cc_osteopo, cc_skincan, cgramt, cgrcurr, cgrdur, cgrprev, cgrqtyr, cgrquit, cgtamt, cgtcurr, cgtdur, cgtpkamt, cgtprev, cgtqtcat, cgtqtyr, cgtquit, chewamt, chewcurr, chewdur, chewprev, chewqtyr, chewquit, cholestr, copestrs, diast_bp, dietfrt, dietfrvg, dietveg, dobyr, drnkdrv, educ_lvl, efamid, enrolid, exermo, exerweek, famabscat12, fireext, flu_shot, glucose, hdl, height, hlthplan, hltimpct, job_sat, ldl, life_sat, liftwgt, mh_freq, mh_prob, pipeamt, pipecurr, pipedur, pipeprev, pipeqtyr, pipequit, planalc, plandiet, plandrad, planexer, planslp, planstrs, plantob, planwgt, prev_mammo, prev_paptest, prev_prostex, prev_sigmoid, prodabscat, risk_alc, risk_bp, risk_chol, risk_exer, risk_gluc, risk_mh, risk_nutr, risk_safe, risk_sleep, risk_smok, risk_wgt, seatbelt, selfhlth, seqnum, sex, sleep_hr, slpapnea, slpprob, smkdetect, stretch, survdate, systo_bp, tobcurr, tobprev, triglycd, version, weight, workabs, wrkabscat, wrkabscat12, year) {
  defaults <- frameworkContext$defaultValues$health_risk_assessment;
  
  if (!missing(alc_amt)) {
    defaults$alc_amt <- alc_amt
  }
  if (!missing(alcdyamt)) {
    defaults$alcdyamt <- alcdyamt
  }
  if (!missing(alcweek)) {
    defaults$alcweek <- alcweek
  }
  if (!missing(bmi)) {
    defaults$bmi <- bmi
  }
  if (!missing(cc_allergy)) {
    defaults$cc_allergy <- cc_allergy
  }
  if (!missing(cc_arthritis)) {
    defaults$cc_arthritis <- cc_arthritis
  }
  if (!missing(cc_asthma)) {
    defaults$cc_asthma <- cc_asthma
  }
  if (!missing(cc_backpain)) {
    defaults$cc_backpain <- cc_backpain
  }
  if (!missing(cc_chf)) {
    defaults$cc_chf <- cc_chf
  }
  if (!missing(cc_depress)) {
    defaults$cc_depress <- cc_depress
  }
  if (!missing(cc_diab)) {
    defaults$cc_diab <- cc_diab
  }
  if (!missing(cc_heartdis)) {
    defaults$cc_heartdis <- cc_heartdis
  }
  if (!missing(cc_highbp)) {
    defaults$cc_highbp <- cc_highbp
  }
  if (!missing(cc_highcol)) {
    defaults$cc_highcol <- cc_highcol
  }
  if (!missing(cc_hrtburn)) {
    defaults$cc_hrtburn <- cc_hrtburn
  }
  if (!missing(cc_lungdis)) {
    defaults$cc_lungdis <- cc_lungdis
  }
  if (!missing(cc_migraine)) {
    defaults$cc_migraine <- cc_migraine
  }
  if (!missing(cc_nonskincan)) {
    defaults$cc_nonskincan <- cc_nonskincan
  }
  if (!missing(cc_osteopo)) {
    defaults$cc_osteopo <- cc_osteopo
  }
  if (!missing(cc_skincan)) {
    defaults$cc_skincan <- cc_skincan
  }
  if (!missing(cgramt)) {
    defaults$cgramt <- cgramt
  }
  if (!missing(cgrcurr)) {
    defaults$cgrcurr <- cgrcurr
  }
  if (!missing(cgrdur)) {
    defaults$cgrdur <- cgrdur
  }
  if (!missing(cgrprev)) {
    defaults$cgrprev <- cgrprev
  }
  if (!missing(cgrqtyr)) {
    defaults$cgrqtyr <- cgrqtyr
  }
  if (!missing(cgrquit)) {
    defaults$cgrquit <- cgrquit
  }
  if (!missing(cgtamt)) {
    defaults$cgtamt <- cgtamt
  }
  if (!missing(cgtcurr)) {
    defaults$cgtcurr <- cgtcurr
  }
  if (!missing(cgtdur)) {
    defaults$cgtdur <- cgtdur
  }
  if (!missing(cgtpkamt)) {
    defaults$cgtpkamt <- cgtpkamt
  }
  if (!missing(cgtprev)) {
    defaults$cgtprev <- cgtprev
  }
  if (!missing(cgtqtcat)) {
    defaults$cgtqtcat <- cgtqtcat
  }
  if (!missing(cgtqtyr)) {
    defaults$cgtqtyr <- cgtqtyr
  }
  if (!missing(cgtquit)) {
    defaults$cgtquit <- cgtquit
  }
  if (!missing(chewamt)) {
    defaults$chewamt <- chewamt
  }
  if (!missing(chewcurr)) {
    defaults$chewcurr <- chewcurr
  }
  if (!missing(chewdur)) {
    defaults$chewdur <- chewdur
  }
  if (!missing(chewprev)) {
    defaults$chewprev <- chewprev
  }
  if (!missing(chewqtyr)) {
    defaults$chewqtyr <- chewqtyr
  }
  if (!missing(chewquit)) {
    defaults$chewquit <- chewquit
  }
  if (!missing(cholestr)) {
    defaults$cholestr <- cholestr
  }
  if (!missing(copestrs)) {
    defaults$copestrs <- copestrs
  }
  if (!missing(diast_bp)) {
    defaults$diast_bp <- diast_bp
  }
  if (!missing(dietfrt)) {
    defaults$dietfrt <- dietfrt
  }
  if (!missing(dietfrvg)) {
    defaults$dietfrvg <- dietfrvg
  }
  if (!missing(dietveg)) {
    defaults$dietveg <- dietveg
  }
  if (!missing(dobyr)) {
    defaults$dobyr <- dobyr
  }
  if (!missing(drnkdrv)) {
    defaults$drnkdrv <- drnkdrv
  }
  if (!missing(educ_lvl)) {
    defaults$educ_lvl <- educ_lvl
  }
  if (!missing(efamid)) {
    defaults$efamid <- efamid
  }
  if (!missing(enrolid)) {
    defaults$enrolid <- enrolid
  }
  if (!missing(exermo)) {
    defaults$exermo <- exermo
  }
  if (!missing(exerweek)) {
    defaults$exerweek <- exerweek
  }
  if (!missing(famabscat12)) {
    defaults$famabscat12 <- famabscat12
  }
  if (!missing(fireext)) {
    defaults$fireext <- fireext
  }
  if (!missing(flu_shot)) {
    defaults$flu_shot <- flu_shot
  }
  if (!missing(glucose)) {
    defaults$glucose <- glucose
  }
  if (!missing(hdl)) {
    defaults$hdl <- hdl
  }
  if (!missing(height)) {
    defaults$height <- height
  }
  if (!missing(hlthplan)) {
    defaults$hlthplan <- hlthplan
  }
  if (!missing(hltimpct)) {
    defaults$hltimpct <- hltimpct
  }
  if (!missing(job_sat)) {
    defaults$job_sat <- job_sat
  }
  if (!missing(ldl)) {
    defaults$ldl <- ldl
  }
  if (!missing(life_sat)) {
    defaults$life_sat <- life_sat
  }
  if (!missing(liftwgt)) {
    defaults$liftwgt <- liftwgt
  }
  if (!missing(mh_freq)) {
    defaults$mh_freq <- mh_freq
  }
  if (!missing(mh_prob)) {
    defaults$mh_prob <- mh_prob
  }
  if (!missing(pipeamt)) {
    defaults$pipeamt <- pipeamt
  }
  if (!missing(pipecurr)) {
    defaults$pipecurr <- pipecurr
  }
  if (!missing(pipedur)) {
    defaults$pipedur <- pipedur
  }
  if (!missing(pipeprev)) {
    defaults$pipeprev <- pipeprev
  }
  if (!missing(pipeqtyr)) {
    defaults$pipeqtyr <- pipeqtyr
  }
  if (!missing(pipequit)) {
    defaults$pipequit <- pipequit
  }
  if (!missing(planalc)) {
    defaults$planalc <- planalc
  }
  if (!missing(plandiet)) {
    defaults$plandiet <- plandiet
  }
  if (!missing(plandrad)) {
    defaults$plandrad <- plandrad
  }
  if (!missing(planexer)) {
    defaults$planexer <- planexer
  }
  if (!missing(planslp)) {
    defaults$planslp <- planslp
  }
  if (!missing(planstrs)) {
    defaults$planstrs <- planstrs
  }
  if (!missing(plantob)) {
    defaults$plantob <- plantob
  }
  if (!missing(planwgt)) {
    defaults$planwgt <- planwgt
  }
  if (!missing(prev_mammo)) {
    defaults$prev_mammo <- prev_mammo
  }
  if (!missing(prev_paptest)) {
    defaults$prev_paptest <- prev_paptest
  }
  if (!missing(prev_prostex)) {
    defaults$prev_prostex <- prev_prostex
  }
  if (!missing(prev_sigmoid)) {
    defaults$prev_sigmoid <- prev_sigmoid
  }
  if (!missing(prodabscat)) {
    defaults$prodabscat <- prodabscat
  }
  if (!missing(risk_alc)) {
    defaults$risk_alc <- risk_alc
  }
  if (!missing(risk_bp)) {
    defaults$risk_bp <- risk_bp
  }
  if (!missing(risk_chol)) {
    defaults$risk_chol <- risk_chol
  }
  if (!missing(risk_exer)) {
    defaults$risk_exer <- risk_exer
  }
  if (!missing(risk_gluc)) {
    defaults$risk_gluc <- risk_gluc
  }
  if (!missing(risk_mh)) {
    defaults$risk_mh <- risk_mh
  }
  if (!missing(risk_nutr)) {
    defaults$risk_nutr <- risk_nutr
  }
  if (!missing(risk_safe)) {
    defaults$risk_safe <- risk_safe
  }
  if (!missing(risk_sleep)) {
    defaults$risk_sleep <- risk_sleep
  }
  if (!missing(risk_smok)) {
    defaults$risk_smok <- risk_smok
  }
  if (!missing(risk_wgt)) {
    defaults$risk_wgt <- risk_wgt
  }
  if (!missing(seatbelt)) {
    defaults$seatbelt <- seatbelt
  }
  if (!missing(selfhlth)) {
    defaults$selfhlth <- selfhlth
  }
  if (!missing(seqnum)) {
    defaults$seqnum <- seqnum
  }
  if (!missing(sex)) {
    defaults$sex <- sex
  }
  if (!missing(sleep_hr)) {
    defaults$sleep_hr <- sleep_hr
  }
  if (!missing(slpapnea)) {
    defaults$slpapnea <- slpapnea
  }
  if (!missing(slpprob)) {
    defaults$slpprob <- slpprob
  }
  if (!missing(smkdetect)) {
    defaults$smkdetect <- smkdetect
  }
  if (!missing(stretch)) {
    defaults$stretch <- stretch
  }
  if (!missing(survdate)) {
    defaults$survdate <- survdate
  }
  if (!missing(systo_bp)) {
    defaults$systo_bp <- systo_bp
  }
  if (!missing(tobcurr)) {
    defaults$tobcurr <- tobcurr
  }
  if (!missing(tobprev)) {
    defaults$tobprev <- tobprev
  }
  if (!missing(triglycd)) {
    defaults$triglycd <- triglycd
  }
  if (!missing(version)) {
    defaults$version <- version
  }
  if (!missing(weight)) {
    defaults$weight <- weight
  }
  if (!missing(workabs)) {
    defaults$workabs <- workabs
  }
  if (!missing(wrkabscat)) {
    defaults$wrkabscat <- wrkabscat
  }
  if (!missing(wrkabscat12)) {
    defaults$wrkabscat12 <- wrkabscat12
  }
  if (!missing(year)) {
    defaults$year <- year
  }
  invisible(defaults)
}

set_defaults_hra_question_ref <- function(question_type_id, category_value, category_name) {
  defaults <- frameworkContext$defaultValues$hra_question_ref;
  if (!missing(question_type_id)) {
    defaults$question_type_id <- question_type_id
  }
  if (!missing(category_value)) {
    defaults$category_value <- category_value
  }
  if (!missing(category_name)) {
    defaults$category_name <- category_name
  }
  invisible(defaults)
}

set_defaults_hra_variable_ref <- function(variable_name, variable_longname, variable_description, notes, question_type_id) {
  defaults <- frameworkContext$defaultValues$hra_variable_ref;
  if (!missing(variable_name)) {
    defaults$variable_name <- variable_name
  }
  if (!missing(variable_longname)) {
    defaults$variable_longname <- variable_longname
  }
  if (!missing(variable_description)) {
    defaults$variable_description <- variable_description
  }
  if (!missing(notes)) {
    defaults$notes <- notes
  }
  if (!missing(question_type_id)) {
    defaults$question_type_id <- question_type_id
  }
  invisible(defaults)
}

set_defaults_inpatient_admissions <- function(admdate, admtyp, age, agegrp, caseid, datatyp, days, disdate, dobyr, drg, dstatus, dx1, dx10, dx11, dx12, dx13, dx14, dx15, dx2, dx3, dx4, dx5, dx6, dx7, dx8, dx9, dxver, eeclass, eestatu, efamid, egeoloc, eidflag, emprel, enrflag, enrolid, hlthplan, hospnet, hosppay, indstry, mdc, mhsacovg, msa, pdx, phyflag, physid, physnet, physpay, plankey, plantyp, pproc, proc1, proc10, proc11, proc12, proc13, proc14, proc15, proc2, proc3, proc4, proc5, proc6, proc7, proc8, proc9, region, rx, seqnum, sex, state, totcob, totcoins, totcopay, totded, totnet, totpay, version, wgtkey, year) {
  defaults <- frameworkContext$defaultValues$inpatient_admissions;
  
  if (!missing(admdate)) {
    defaults$admdate <- admdate
  }
  if (!missing(admtyp)) {
    defaults$admtyp <- admtyp
  }
  if (!missing(age)) {
    defaults$age <- age
  }
  if (!missing(agegrp)) {
    defaults$agegrp <- agegrp
  }
  if (!missing(caseid)) {
    defaults$caseid <- caseid
  }
  if (!missing(datatyp)) {
    defaults$datatyp <- datatyp
  }
  if (!missing(days)) {
    defaults$days <- days
  }
  if (!missing(disdate)) {
    defaults$disdate <- disdate
  }
  if (!missing(dobyr)) {
    defaults$dobyr <- dobyr
  }
  if (!missing(drg)) {
    defaults$drg <- drg
  }
  if (!missing(dstatus)) {
    defaults$dstatus <- dstatus
  }
  if (!missing(dx1)) {
    defaults$dx1 <- dx1
  }
  if (!missing(dx10)) {
    defaults$dx10 <- dx10
  }
  if (!missing(dx11)) {
    defaults$dx11 <- dx11
  }
  if (!missing(dx12)) {
    defaults$dx12 <- dx12
  }
  if (!missing(dx13)) {
    defaults$dx13 <- dx13
  }
  if (!missing(dx14)) {
    defaults$dx14 <- dx14
  }
  if (!missing(dx15)) {
    defaults$dx15 <- dx15
  }
  if (!missing(dx2)) {
    defaults$dx2 <- dx2
  }
  if (!missing(dx3)) {
    defaults$dx3 <- dx3
  }
  if (!missing(dx4)) {
    defaults$dx4 <- dx4
  }
  if (!missing(dx5)) {
    defaults$dx5 <- dx5
  }
  if (!missing(dx6)) {
    defaults$dx6 <- dx6
  }
  if (!missing(dx7)) {
    defaults$dx7 <- dx7
  }
  if (!missing(dx8)) {
    defaults$dx8 <- dx8
  }
  if (!missing(dx9)) {
    defaults$dx9 <- dx9
  }
  if (!missing(dxver)) {
    defaults$dxver <- dxver
  }
  if (!missing(eeclass)) {
    defaults$eeclass <- eeclass
  }
  if (!missing(eestatu)) {
    defaults$eestatu <- eestatu
  }
  if (!missing(efamid)) {
    defaults$efamid <- efamid
  }
  if (!missing(egeoloc)) {
    defaults$egeoloc <- egeoloc
  }
  if (!missing(eidflag)) {
    defaults$eidflag <- eidflag
  }
  if (!missing(emprel)) {
    defaults$emprel <- emprel
  }
  if (!missing(enrflag)) {
    defaults$enrflag <- enrflag
  }
  if (!missing(enrolid)) {
    defaults$enrolid <- enrolid
  }
  if (!missing(hlthplan)) {
    defaults$hlthplan <- hlthplan
  }
  if (!missing(hospnet)) {
    defaults$hospnet <- hospnet
  }
  if (!missing(hosppay)) {
    defaults$hosppay <- hosppay
  }
  if (!missing(indstry)) {
    defaults$indstry <- indstry
  }
  if (!missing(mdc)) {
    defaults$mdc <- mdc
  }
  if (!missing(mhsacovg)) {
    defaults$mhsacovg <- mhsacovg
  }
  if (!missing(msa)) {
    defaults$msa <- msa
  }
  if (!missing(pdx)) {
    defaults$pdx <- pdx
  }
  if (!missing(phyflag)) {
    defaults$phyflag <- phyflag
  }
  if (!missing(physid)) {
    defaults$physid <- physid
  }
  if (!missing(physnet)) {
    defaults$physnet <- physnet
  }
  if (!missing(physpay)) {
    defaults$physpay <- physpay
  }
  if (!missing(plankey)) {
    defaults$plankey <- plankey
  }
  if (!missing(plantyp)) {
    defaults$plantyp <- plantyp
  }
  if (!missing(pproc)) {
    defaults$pproc <- pproc
  }
  if (!missing(proc1)) {
    defaults$proc1 <- proc1
  }
  if (!missing(proc10)) {
    defaults$proc10 <- proc10
  }
  if (!missing(proc11)) {
    defaults$proc11 <- proc11
  }
  if (!missing(proc12)) {
    defaults$proc12 <- proc12
  }
  if (!missing(proc13)) {
    defaults$proc13 <- proc13
  }
  if (!missing(proc14)) {
    defaults$proc14 <- proc14
  }
  if (!missing(proc15)) {
    defaults$proc15 <- proc15
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
  if (!missing(proc6)) {
    defaults$proc6 <- proc6
  }
  if (!missing(proc7)) {
    defaults$proc7 <- proc7
  }
  if (!missing(proc8)) {
    defaults$proc8 <- proc8
  }
  if (!missing(proc9)) {
    defaults$proc9 <- proc9
  }
  if (!missing(region)) {
    defaults$region <- region
  }
  if (!missing(rx)) {
    defaults$rx <- rx
  }
  if (!missing(seqnum)) {
    defaults$seqnum <- seqnum
  }
  if (!missing(sex)) {
    defaults$sex <- sex
  }
  if (!missing(state)) {
    defaults$state <- state
  }
  if (!missing(totcob)) {
    defaults$totcob <- totcob
  }
  if (!missing(totcoins)) {
    defaults$totcoins <- totcoins
  }
  if (!missing(totcopay)) {
    defaults$totcopay <- totcopay
  }
  if (!missing(totded)) {
    defaults$totded <- totded
  }
  if (!missing(totnet)) {
    defaults$totnet <- totnet
  }
  if (!missing(totpay)) {
    defaults$totpay <- totpay
  }
  if (!missing(version)) {
    defaults$version <- version
  }
  if (!missing(wgtkey)) {
    defaults$wgtkey <- wgtkey
  }
  if (!missing(year)) {
    defaults$year <- year
  }
  invisible(defaults)
}

set_defaults_inpatient_services <- function(admdate, admtyp, age, agegrp, cap_svc, caseid, cob, coins, copay, datatyp, deduct, disdate, dobyr, drg, dstatus, dx1, dx2, dx3, dx4, dx5, dxver, eeclass, eestatu, efamid, egeoloc, eidflag, emprel, enrflag, enrolid, fachdid, facprof, hlthplan, indstry, mdc, mhsacovg, msa, netpay, ntwkprov, paidntwk, pay, pddate, pdx, phyflag, plankey, plantyp, pproc, proc1, procmod, proctyp, provid, qty, region, revcode, rx, seqnum, sex, stdplac, stdprov, svcdate, svcscat, tsvcdat, version, wgtkey, year, units, npi, msclmid) {
  defaults <- frameworkContext$defaultValues$inpatient_services;
  
  if (!missing(admdate)) {
    defaults$admdate <- admdate
  }
  if (!missing(admtyp)) {
    defaults$admtyp <- admtyp
  }
  if (!missing(age)) {
    defaults$age <- age
  }
  if (!missing(agegrp)) {
    defaults$agegrp <- agegrp
  }
  if (!missing(cap_svc)) {
    defaults$cap_svc <- cap_svc
  }
  if (!missing(caseid)) {
    defaults$caseid <- caseid
  }
  if (!missing(cob)) {
    defaults$cob <- cob
  }
  if (!missing(coins)) {
    defaults$coins <- coins
  }
  if (!missing(copay)) {
    defaults$copay <- copay
  }
  if (!missing(datatyp)) {
    defaults$datatyp <- datatyp
  }
  if (!missing(deduct)) {
    defaults$deduct <- deduct
  }
  if (!missing(disdate)) {
    defaults$disdate <- disdate
  }
  if (!missing(dobyr)) {
    defaults$dobyr <- dobyr
  }
  if (!missing(drg)) {
    defaults$drg <- drg
  }
  if (!missing(dstatus)) {
    defaults$dstatus <- dstatus
  }
  if (!missing(dx1)) {
    defaults$dx1 <- dx1
  }
  if (!missing(dx2)) {
    defaults$dx2 <- dx2
  }
  if (!missing(dx3)) {
    defaults$dx3 <- dx3
  }
  if (!missing(dx4)) {
    defaults$dx4 <- dx4
  }
  if (!missing(dx5)) {
    defaults$dx5 <- dx5
  }
  if (!missing(dxver)) {
    defaults$dxver <- dxver
  }
  if (!missing(eeclass)) {
    defaults$eeclass <- eeclass
  }
  if (!missing(eestatu)) {
    defaults$eestatu <- eestatu
  }
  if (!missing(efamid)) {
    defaults$efamid <- efamid
  }
  if (!missing(egeoloc)) {
    defaults$egeoloc <- egeoloc
  }
  if (!missing(eidflag)) {
    defaults$eidflag <- eidflag
  }
  if (!missing(emprel)) {
    defaults$emprel <- emprel
  }
  if (!missing(enrflag)) {
    defaults$enrflag <- enrflag
  }
  if (!missing(enrolid)) {
    defaults$enrolid <- enrolid
  }
  if (!missing(fachdid)) {
    defaults$fachdid <- fachdid
  }
  if (!missing(facprof)) {
    defaults$facprof <- facprof
  }
  if (!missing(hlthplan)) {
    defaults$hlthplan <- hlthplan
  }
  if (!missing(indstry)) {
    defaults$indstry <- indstry
  }
  if (!missing(mdc)) {
    defaults$mdc <- mdc
  }
  if (!missing(mhsacovg)) {
    defaults$mhsacovg <- mhsacovg
  }
  if (!missing(msa)) {
    defaults$msa <- msa
  }
  if (!missing(netpay)) {
    defaults$netpay <- netpay
  }
  if (!missing(ntwkprov)) {
    defaults$ntwkprov <- ntwkprov
  }
  if (!missing(paidntwk)) {
    defaults$paidntwk <- paidntwk
  }
  if (!missing(pay)) {
    defaults$pay <- pay
  }
  if (!missing(pddate)) {
    defaults$pddate <- pddate
  }
  if (!missing(pdx)) {
    defaults$pdx <- pdx
  }
  if (!missing(phyflag)) {
    defaults$phyflag <- phyflag
  }
  if (!missing(plankey)) {
    defaults$plankey <- plankey
  }
  if (!missing(plantyp)) {
    defaults$plantyp <- plantyp
  }
  if (!missing(pproc)) {
    defaults$pproc <- pproc
  }
  if (!missing(proc1)) {
    defaults$proc1 <- proc1
  }
  if (!missing(procmod)) {
    defaults$procmod <- procmod
  }
  if (!missing(proctyp)) {
    defaults$proctyp <- proctyp
  }
  if (!missing(provid)) {
    defaults$provid <- provid
  }
  if (!missing(qty)) {
    defaults$qty <- qty
  }
  if (!missing(region)) {
    defaults$region <- region
  }
  if (!missing(revcode)) {
    defaults$revcode <- revcode
  }
  if (!missing(rx)) {
    defaults$rx <- rx
  }
  if (!missing(seqnum)) {
    defaults$seqnum <- seqnum
  }
  if (!missing(sex)) {
    defaults$sex <- sex
  }
  if (!missing(stdplac)) {
    defaults$stdplac <- stdplac
  }
  if (!missing(stdprov)) {
    defaults$stdprov <- stdprov
  }
  if (!missing(svcdate)) {
    defaults$svcdate <- svcdate
  }
  if (!missing(svcscat)) {
    defaults$svcscat <- svcscat
  }
  if (!missing(tsvcdat)) {
    defaults$tsvcdat <- tsvcdat
  }
  if (!missing(version)) {
    defaults$version <- version
  }
  if (!missing(wgtkey)) {
    defaults$wgtkey <- wgtkey
  }
  if (!missing(year)) {
    defaults$year <- year
  }
  if (!missing(units)) {
    defaults$units <- units
  }
  if (!missing(npi)) {
    defaults$npi <- npi
  }
  if (!missing(msclmid)) {
    defaults$msclmid <- msclmid
  }
  invisible(defaults)
}

set_defaults_lab <- function(enrolid, seqnum, abnormal, agegrp, eeclass, eestatu, eidflag, emprel, enrflag, hlthplan, indstry, mhsacovg, phyflag, proctyp, region, rx, sex, egeoloc, mdc, version, resltcat, dx1, proc1, pddate, svcdate, msa, orderid, provid, refhigh, reflow, result, testcnt, dobyr, plankey, stdprov, wgtkey, year, age, datatyp, plantyp, stdplac, loinccd, resunit, efamid, dxver) {
  defaults <- frameworkContext$defaultValues$lab;
  if (!missing(enrolid)) {
    defaults$enrolid <- enrolid
  }
  if (!missing(seqnum)) {
    defaults$seqnum <- seqnum
  }
  if (!missing(abnormal)) {
    defaults$abnormal <- abnormal
  }
  if (!missing(agegrp)) {
    defaults$agegrp <- agegrp
  }
  if (!missing(eeclass)) {
    defaults$eeclass <- eeclass
  }
  if (!missing(eestatu)) {
    defaults$eestatu <- eestatu
  }
  if (!missing(eidflag)) {
    defaults$eidflag <- eidflag
  }
  if (!missing(emprel)) {
    defaults$emprel <- emprel
  }
  if (!missing(enrflag)) {
    defaults$enrflag <- enrflag
  }
  if (!missing(hlthplan)) {
    defaults$hlthplan <- hlthplan
  }
  if (!missing(indstry)) {
    defaults$indstry <- indstry
  }
  if (!missing(mhsacovg)) {
    defaults$mhsacovg <- mhsacovg
  }
  if (!missing(phyflag)) {
    defaults$phyflag <- phyflag
  }
  if (!missing(proctyp)) {
    defaults$proctyp <- proctyp
  }
  if (!missing(region)) {
    defaults$region <- region
  }
  if (!missing(rx)) {
    defaults$rx <- rx
  }
  if (!missing(sex)) {
    defaults$sex <- sex
  }
  if (!missing(egeoloc)) {
    defaults$egeoloc <- egeoloc
  }
  if (!missing(mdc)) {
    defaults$mdc <- mdc
  }
  if (!missing(version)) {
    defaults$version <- version
  }
  if (!missing(resltcat)) {
    defaults$resltcat <- resltcat
  }
  if (!missing(dx1)) {
    defaults$dx1 <- dx1
  }
  if (!missing(proc1)) {
    defaults$proc1 <- proc1
  }
  if (!missing(pddate)) {
    defaults$pddate <- pddate
  }
  if (!missing(svcdate)) {
    defaults$svcdate <- svcdate
  }
  if (!missing(msa)) {
    defaults$msa <- msa
  }
  if (!missing(orderid)) {
    defaults$orderid <- orderid
  }
  if (!missing(provid)) {
    defaults$provid <- provid
  }
  if (!missing(refhigh)) {
    defaults$refhigh <- refhigh
  }
  if (!missing(reflow)) {
    defaults$reflow <- reflow
  }
  if (!missing(result)) {
    defaults$result <- result
  }
  if (!missing(testcnt)) {
    defaults$testcnt <- testcnt
  }
  if (!missing(dobyr)) {
    defaults$dobyr <- dobyr
  }
  if (!missing(plankey)) {
    defaults$plankey <- plankey
  }
  if (!missing(stdprov)) {
    defaults$stdprov <- stdprov
  }
  if (!missing(wgtkey)) {
    defaults$wgtkey <- wgtkey
  }
  if (!missing(year)) {
    defaults$year <- year
  }
  if (!missing(age)) {
    defaults$age <- age
  }
  if (!missing(datatyp)) {
    defaults$datatyp <- datatyp
  }
  if (!missing(plantyp)) {
    defaults$plantyp <- plantyp
  }
  if (!missing(stdplac)) {
    defaults$stdplac <- stdplac
  }
  if (!missing(loinccd)) {
    defaults$loinccd <- loinccd
  }
  if (!missing(resunit)) {
    defaults$resunit <- resunit
  }
  if (!missing(efamid)) {
    defaults$efamid <- efamid
  }
  if (!missing(dxver)) {
    defaults$dxver <- dxver
  }
  invisible(defaults)
}

set_defaults_outpatient_services <- function(age, agegrp, cap_svc, cob, coins, copay, datatyp, deduct, dobyr, dx1, dx2, dx3, dx4, dx5, dxver, eeclass, eestatu, efamid, egeoloc, eidflag, emprel, enrflag, enrolid, fachdid, facprof, hlthplan, indstry, mdc, mhsacovg, msa, netpay, ntwkprov, paidntwk, pay, pddate, phyflag, plankey, plantyp, proc1, procgrp, procmod, proctyp, provid, qty, region, revcode, rx, seqnum, sex, stdplac, stdprov, svcdate, svcscat, tsvcdat, version, wgtkey, year, units, npi, msclmid) {
  defaults <- frameworkContext$defaultValues$outpatient_services;
  
  if (!missing(age)) {
    defaults$age <- age
  }
  if (!missing(agegrp)) {
    defaults$agegrp <- agegrp
  }
  if (!missing(cap_svc)) {
    defaults$cap_svc <- cap_svc
  }
  if (!missing(cob)) {
    defaults$cob <- cob
  }
  if (!missing(coins)) {
    defaults$coins <- coins
  }
  if (!missing(copay)) {
    defaults$copay <- copay
  }
  if (!missing(datatyp)) {
    defaults$datatyp <- datatyp
  }
  if (!missing(deduct)) {
    defaults$deduct <- deduct
  }
  if (!missing(dobyr)) {
    defaults$dobyr <- dobyr
  }
  if (!missing(dx1)) {
    defaults$dx1 <- dx1
  }
  if (!missing(dx2)) {
    defaults$dx2 <- dx2
  }
  if (!missing(dx3)) {
    defaults$dx3 <- dx3
  }
  if (!missing(dx4)) {
    defaults$dx4 <- dx4
  }
  if (!missing(dx5)) {
    defaults$dx5 <- dx5
  }
  if (!missing(dxver)) {
    defaults$dxver <- dxver
  }
  if (!missing(eeclass)) {
    defaults$eeclass <- eeclass
  }
  if (!missing(eestatu)) {
    defaults$eestatu <- eestatu
  }
  if (!missing(efamid)) {
    defaults$efamid <- efamid
  }
  if (!missing(egeoloc)) {
    defaults$egeoloc <- egeoloc
  }
  if (!missing(eidflag)) {
    defaults$eidflag <- eidflag
  }
  if (!missing(emprel)) {
    defaults$emprel <- emprel
  }
  if (!missing(enrflag)) {
    defaults$enrflag <- enrflag
  }
  if (!missing(enrolid)) {
    defaults$enrolid <- enrolid
  }
  if (!missing(fachdid)) {
    defaults$fachdid <- fachdid
  }
  if (!missing(facprof)) {
    defaults$facprof <- facprof
  }
  if (!missing(hlthplan)) {
    defaults$hlthplan <- hlthplan
  }
  if (!missing(indstry)) {
    defaults$indstry <- indstry
  }
  if (!missing(mdc)) {
    defaults$mdc <- mdc
  }
  if (!missing(mhsacovg)) {
    defaults$mhsacovg <- mhsacovg
  }
  if (!missing(msa)) {
    defaults$msa <- msa
  }
  if (!missing(netpay)) {
    defaults$netpay <- netpay
  }
  if (!missing(ntwkprov)) {
    defaults$ntwkprov <- ntwkprov
  }
  if (!missing(paidntwk)) {
    defaults$paidntwk <- paidntwk
  }
  if (!missing(pay)) {
    defaults$pay <- pay
  }
  if (!missing(pddate)) {
    defaults$pddate <- pddate
  }
  if (!missing(phyflag)) {
    defaults$phyflag <- phyflag
  }
  if (!missing(plankey)) {
    defaults$plankey <- plankey
  }
  if (!missing(plantyp)) {
    defaults$plantyp <- plantyp
  }
  if (!missing(proc1)) {
    defaults$proc1 <- proc1
  }
  if (!missing(procgrp)) {
    defaults$procgrp <- procgrp
  }
  if (!missing(procmod)) {
    defaults$procmod <- procmod
  }
  if (!missing(proctyp)) {
    defaults$proctyp <- proctyp
  }
  if (!missing(provid)) {
    defaults$provid <- provid
  }
  if (!missing(qty)) {
    defaults$qty <- qty
  }
  if (!missing(region)) {
    defaults$region <- region
  }
  if (!missing(revcode)) {
    defaults$revcode <- revcode
  }
  if (!missing(rx)) {
    defaults$rx <- rx
  }
  if (!missing(seqnum)) {
    defaults$seqnum <- seqnum
  }
  if (!missing(sex)) {
    defaults$sex <- sex
  }
  if (!missing(stdplac)) {
    defaults$stdplac <- stdplac
  }
  if (!missing(stdprov)) {
    defaults$stdprov <- stdprov
  }
  if (!missing(svcdate)) {
    defaults$svcdate <- svcdate
  }
  if (!missing(svcscat)) {
    defaults$svcscat <- svcscat
  }
  if (!missing(tsvcdat)) {
    defaults$tsvcdat <- tsvcdat
  }
  if (!missing(version)) {
    defaults$version <- version
  }
  if (!missing(wgtkey)) {
    defaults$wgtkey <- wgtkey
  }
  if (!missing(year)) {
    defaults$year <- year
  }
  if (!missing(units)) {
    defaults$units <- units
  }
  if (!missing(npi)) {
    defaults$npi <- npi
  }
  if (!missing(msclmid)) {
    defaults$msclmid <- msclmid
  }
  invisible(defaults)
}

get_defaults_drug_claims <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_enrollment_detail <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_enrollment_summary <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_facility_header <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_health_risk_assessment <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_hra_question_ref <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_hra_variable_ref <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_inpatient_admissions <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_inpatient_services <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_lab <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_outpatient_services <- function() {
  return(frameworkContext$defaultValues)
}

add_drug_claims <- function(age, agegrp, awp, cap_svc, cob, coins, copay, datatyp, dawind, daysupp, deaclas, deduct, dispfee, dobyr, eeclass, eestatu, efamid, egeoloc, eidflag, emprel, enrflag, enrolid, generid, genind, hlthplan, indstry, ingcost, maintin, metqty, mhsacovg, msa, ndcnum, netpay, ntwkprov, paidntwk, pay, pddate, pharmid, phyflag, plankey, plantyp, qty, refill, region, rxmr, saletax, seqnum, sex, svcdate, thercls, thergrp, version, wgtkey, year) {
  defaults <- frameworkContext$defaultValues$drug_claims;
  insertFields <- c()
  insertValues <- c()

  if (missing(age)) {
    age <- defaults$age
  }
  if (!is.null(age)) {
    insertFields <- c(insertFields, "age")
    insertValues <- c(insertValues, age)
  }

  if (missing(agegrp)) {
    agegrp <- defaults$agegrp
  }
  if (!is.null(agegrp)) {
    insertFields <- c(insertFields, "agegrp")
    insertValues <- c(insertValues, agegrp)
  }

  if (missing(awp)) {
    awp <- defaults$awp
  }
  if (!is.null(awp)) {
    insertFields <- c(insertFields, "awp")
    insertValues <- c(insertValues, awp)
  }

  if (missing(cap_svc)) {
    cap_svc <- defaults$cap_svc
  }
  if (!is.null(cap_svc)) {
    insertFields <- c(insertFields, "cap_svc")
    insertValues <- c(insertValues, cap_svc)
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

  if (missing(copay)) {
    copay <- defaults$copay
  }
  if (!is.null(copay)) {
    insertFields <- c(insertFields, "copay")
    insertValues <- c(insertValues, copay)
  }

  if (missing(datatyp)) {
    datatyp <- defaults$datatyp
  }
  if (!is.null(datatyp)) {
    insertFields <- c(insertFields, "datatyp")
    insertValues <- c(insertValues, datatyp)
  }

  if (missing(dawind)) {
    dawind <- defaults$dawind
  }
  if (!is.null(dawind)) {
    insertFields <- c(insertFields, "dawind")
    insertValues <- c(insertValues, dawind)
  }

  if (missing(daysupp)) {
    daysupp <- defaults$daysupp
  }
  if (!is.null(daysupp)) {
    insertFields <- c(insertFields, "daysupp")
    insertValues <- c(insertValues, daysupp)
  }

  if (missing(deaclas)) {
    deaclas <- defaults$deaclas
  }
  if (!is.null(deaclas)) {
    insertFields <- c(insertFields, "deaclas")
    insertValues <- c(insertValues, deaclas)
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

  if (missing(dobyr)) {
    dobyr <- defaults$dobyr
  }
  if (!is.null(dobyr)) {
    insertFields <- c(insertFields, "dobyr")
    insertValues <- c(insertValues, dobyr)
  }

  if (missing(eeclass)) {
    eeclass <- defaults$eeclass
  }
  if (!is.null(eeclass)) {
    insertFields <- c(insertFields, "eeclass")
    insertValues <- c(insertValues, eeclass)
  }

  if (missing(eestatu)) {
    eestatu <- defaults$eestatu
  }
  if (!is.null(eestatu)) {
    insertFields <- c(insertFields, "eestatu")
    insertValues <- c(insertValues, eestatu)
  }

  if (missing(efamid)) {
    efamid <- defaults$efamid
  }
  if (!is.null(efamid)) {
    insertFields <- c(insertFields, "efamid")
    insertValues <- c(insertValues, efamid)
  }

  if (missing(egeoloc)) {
    egeoloc <- defaults$egeoloc
  }
  if (!is.null(egeoloc)) {
    insertFields <- c(insertFields, "egeoloc")
    insertValues <- c(insertValues, egeoloc)
  }

  if (missing(eidflag)) {
    eidflag <- defaults$eidflag
  }
  if (!is.null(eidflag)) {
    insertFields <- c(insertFields, "eidflag")
    insertValues <- c(insertValues, eidflag)
  }

  if (missing(emprel)) {
    emprel <- defaults$emprel
  }
  if (!is.null(emprel)) {
    insertFields <- c(insertFields, "emprel")
    insertValues <- c(insertValues, emprel)
  }

  if (missing(enrflag)) {
    enrflag <- defaults$enrflag
  }
  if (!is.null(enrflag)) {
    insertFields <- c(insertFields, "enrflag")
    insertValues <- c(insertValues, enrflag)
  }

  if (missing(enrolid)) {
    enrolid <- defaults$enrolid
  }
  if (!is.null(enrolid)) {
    insertFields <- c(insertFields, "enrolid")
    insertValues <- c(insertValues, enrolid)
  }

  if (missing(generid)) {
    generid <- defaults$generid
  }
  if (!is.null(generid)) {
    insertFields <- c(insertFields, "generid")
    insertValues <- c(insertValues, generid)
  }

  if (missing(genind)) {
    genind <- defaults$genind
  }
  if (!is.null(genind)) {
    insertFields <- c(insertFields, "genind")
    insertValues <- c(insertValues, genind)
  }

  if (missing(hlthplan)) {
    hlthplan <- defaults$hlthplan
  }
  if (!is.null(hlthplan)) {
    insertFields <- c(insertFields, "hlthplan")
    insertValues <- c(insertValues, hlthplan)
  }

  if (missing(indstry)) {
    indstry <- defaults$indstry
  }
  if (!is.null(indstry)) {
    insertFields <- c(insertFields, "indstry")
    insertValues <- c(insertValues, indstry)
  }

  if (missing(ingcost)) {
    ingcost <- defaults$ingcost
  }
  if (!is.null(ingcost)) {
    insertFields <- c(insertFields, "ingcost")
    insertValues <- c(insertValues, ingcost)
  }

  if (missing(maintin)) {
    maintin <- defaults$maintin
  }
  if (!is.null(maintin)) {
    insertFields <- c(insertFields, "maintin")
    insertValues <- c(insertValues, maintin)
  }

  if (missing(metqty)) {
    metqty <- defaults$metqty
  }
  if (!is.null(metqty)) {
    insertFields <- c(insertFields, "metqty")
    insertValues <- c(insertValues, metqty)
  }

  if (missing(mhsacovg)) {
    mhsacovg <- defaults$mhsacovg
  }
  if (!is.null(mhsacovg)) {
    insertFields <- c(insertFields, "mhsacovg")
    insertValues <- c(insertValues, mhsacovg)
  }

  if (missing(msa)) {
    msa <- defaults$msa
  }
  if (!is.null(msa)) {
    insertFields <- c(insertFields, "msa")
    insertValues <- c(insertValues, msa)
  }

  if (missing(ndcnum)) {
    ndcnum <- defaults$ndcnum
  }
  if (!is.null(ndcnum)) {
    insertFields <- c(insertFields, "ndcnum")
    insertValues <- c(insertValues, ndcnum)
  }

  if (missing(netpay)) {
    netpay <- defaults$netpay
  }
  if (!is.null(netpay)) {
    insertFields <- c(insertFields, "netpay")
    insertValues <- c(insertValues, netpay)
  }

  if (missing(ntwkprov)) {
    ntwkprov <- defaults$ntwkprov
  }
  if (!is.null(ntwkprov)) {
    insertFields <- c(insertFields, "ntwkprov")
    insertValues <- c(insertValues, ntwkprov)
  }

  if (missing(paidntwk)) {
    paidntwk <- defaults$paidntwk
  }
  if (!is.null(paidntwk)) {
    insertFields <- c(insertFields, "paidntwk")
    insertValues <- c(insertValues, paidntwk)
  }

  if (missing(pay)) {
    pay <- defaults$pay
  }
  if (!is.null(pay)) {
    insertFields <- c(insertFields, "pay")
    insertValues <- c(insertValues, pay)
  }

  if (missing(pddate)) {
    pddate <- defaults$pddate
  }
  if (!is.null(pddate)) {
    insertFields <- c(insertFields, "pddate")
    insertValues <- c(insertValues, pddate)
  }

  if (missing(pharmid)) {
    pharmid <- defaults$pharmid
  }
  if (!is.null(pharmid)) {
    insertFields <- c(insertFields, "pharmid")
    insertValues <- c(insertValues, pharmid)
  }

  if (missing(phyflag)) {
    phyflag <- defaults$phyflag
  }
  if (!is.null(phyflag)) {
    insertFields <- c(insertFields, "phyflag")
    insertValues <- c(insertValues, phyflag)
  }

  if (missing(plankey)) {
    plankey <- defaults$plankey
  }
  if (!is.null(plankey)) {
    insertFields <- c(insertFields, "plankey")
    insertValues <- c(insertValues, plankey)
  }

  if (missing(plantyp)) {
    plantyp <- defaults$plantyp
  }
  if (!is.null(plantyp)) {
    insertFields <- c(insertFields, "plantyp")
    insertValues <- c(insertValues, plantyp)
  }

  if (missing(qty)) {
    qty <- defaults$qty
  }
  if (!is.null(qty)) {
    insertFields <- c(insertFields, "qty")
    insertValues <- c(insertValues, qty)
  }

  if (missing(refill)) {
    refill <- defaults$refill
  }
  if (!is.null(refill)) {
    insertFields <- c(insertFields, "refill")
    insertValues <- c(insertValues, refill)
  }

  if (missing(region)) {
    region <- defaults$region
  }
  if (!is.null(region)) {
    insertFields <- c(insertFields, "region")
    insertValues <- c(insertValues, region)
  }

  if (missing(rxmr)) {
    rxmr <- defaults$rxmr
  }
  if (!is.null(rxmr)) {
    insertFields <- c(insertFields, "rxmr")
    insertValues <- c(insertValues, rxmr)
  }

  if (missing(saletax)) {
    saletax <- defaults$saletax
  }
  if (!is.null(saletax)) {
    insertFields <- c(insertFields, "saletax")
    insertValues <- c(insertValues, saletax)
  }

  if (missing(seqnum)) {
    seqnum <- defaults$seqnum
  }
  if (!is.null(seqnum)) {
    insertFields <- c(insertFields, "seqnum")
    insertValues <- c(insertValues, seqnum)
  }

  if (missing(sex)) {
    sex <- defaults$sex
  }
  if (!is.null(sex)) {
    insertFields <- c(insertFields, "sex")
    insertValues <- c(insertValues, sex)
  }

  if (missing(svcdate)) {
    svcdate <- defaults$svcdate
  }
  if (!is.null(svcdate)) {
    insertFields <- c(insertFields, "svcdate")
    insertValues <- c(insertValues, svcdate)
  }

  if (missing(thercls)) {
    thercls <- defaults$thercls
  }
  if (!is.null(thercls)) {
    insertFields <- c(insertFields, "thercls")
    insertValues <- c(insertValues, thercls)
  }

  if (missing(thergrp)) {
    thergrp <- defaults$thergrp
  }
  if (!is.null(thergrp)) {
    insertFields <- c(insertFields, "thergrp")
    insertValues <- c(insertValues, thergrp)
  }

  if (missing(version)) {
    version <- defaults$version
  }
  if (!is.null(version)) {
    insertFields <- c(insertFields, "version")
    insertValues <- c(insertValues, version)
  }

  if (missing(wgtkey)) {
    wgtkey <- defaults$wgtkey
  }
  if (!is.null(wgtkey)) {
    insertFields <- c(insertFields, "wgtkey")
    insertValues <- c(insertValues, wgtkey)
  }

  if (missing(year)) {
    year <- defaults$year
  }
  if (!is.null(year)) {
    insertFields <- c(insertFields, "year")
    insertValues <- c(insertValues, year)
  }

  statement <- paste0("INSERT INTO @source_schema.drug_claims (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
  invisible(statement);
}

add_enrollment_detail <- function(age, agegrp, datatyp, dobyr, dtend, dtstart, eeclass, eestatu, efamid, egeoloc, emprel, enrolid, hlthplan, indstry, memdays, mhsacovg, msa, phyflag, plankey, plantyp, region, rx, seqnum, sex, version, wgtkey, year) {
  defaults <- frameworkContext$defaultValues$enrollment_detail;
  insertFields <- c()
  insertValues <- c()

  if (missing(age)) {
    age <- defaults$age
  }
  if (!is.null(age)) {
    insertFields <- c(insertFields, "age")
    insertValues <- c(insertValues, age)
  }

  if (missing(agegrp)) {
    agegrp <- defaults$agegrp
  }
  if (!is.null(agegrp)) {
    insertFields <- c(insertFields, "agegrp")
    insertValues <- c(insertValues, agegrp)
  }

  if (missing(datatyp)) {
    datatyp <- defaults$datatyp
  }
  if (!is.null(datatyp)) {
    insertFields <- c(insertFields, "datatyp")
    insertValues <- c(insertValues, datatyp)
  }

  if (missing(dobyr)) {
    dobyr <- defaults$dobyr
  }
  if (!is.null(dobyr)) {
    insertFields <- c(insertFields, "dobyr")
    insertValues <- c(insertValues, dobyr)
  }

  if (missing(dtend)) {
    dtend <- defaults$dtend
  }
  if (!is.null(dtend)) {
    insertFields <- c(insertFields, "dtend")
    insertValues <- c(insertValues, dtend)
  }

  if (missing(dtstart)) {
    dtstart <- defaults$dtstart
  }
  if (!is.null(dtstart)) {
    insertFields <- c(insertFields, "dtstart")
    insertValues <- c(insertValues, dtstart)
  }

  if (missing(eeclass)) {
    eeclass <- defaults$eeclass
  }
  if (!is.null(eeclass)) {
    insertFields <- c(insertFields, "eeclass")
    insertValues <- c(insertValues, eeclass)
  }

  if (missing(eestatu)) {
    eestatu <- defaults$eestatu
  }
  if (!is.null(eestatu)) {
    insertFields <- c(insertFields, "eestatu")
    insertValues <- c(insertValues, eestatu)
  }

  if (missing(efamid)) {
    efamid <- defaults$efamid
  }
  if (!is.null(efamid)) {
    insertFields <- c(insertFields, "efamid")
    insertValues <- c(insertValues, efamid)
  }

  if (missing(egeoloc)) {
    egeoloc <- defaults$egeoloc
  }
  if (!is.null(egeoloc)) {
    insertFields <- c(insertFields, "egeoloc")
    insertValues <- c(insertValues, egeoloc)
  }

  if (missing(emprel)) {
    emprel <- defaults$emprel
  }
  if (!is.null(emprel)) {
    insertFields <- c(insertFields, "emprel")
    insertValues <- c(insertValues, emprel)
  }

  if (missing(enrolid)) {
    enrolid <- defaults$enrolid
  }
  if (!is.null(enrolid)) {
    insertFields <- c(insertFields, "enrolid")
    insertValues <- c(insertValues, enrolid)
  }

  if (missing(hlthplan)) {
    hlthplan <- defaults$hlthplan
  }
  if (!is.null(hlthplan)) {
    insertFields <- c(insertFields, "hlthplan")
    insertValues <- c(insertValues, hlthplan)
  }

  if (missing(indstry)) {
    indstry <- defaults$indstry
  }
  if (!is.null(indstry)) {
    insertFields <- c(insertFields, "indstry")
    insertValues <- c(insertValues, indstry)
  }

  if (missing(memdays)) {
    memdays <- defaults$memdays
  }
  if (!is.null(memdays)) {
    insertFields <- c(insertFields, "memdays")
    insertValues <- c(insertValues, memdays)
  }

  if (missing(mhsacovg)) {
    mhsacovg <- defaults$mhsacovg
  }
  if (!is.null(mhsacovg)) {
    insertFields <- c(insertFields, "mhsacovg")
    insertValues <- c(insertValues, mhsacovg)
  }

  if (missing(msa)) {
    msa <- defaults$msa
  }
  if (!is.null(msa)) {
    insertFields <- c(insertFields, "msa")
    insertValues <- c(insertValues, msa)
  }

  if (missing(phyflag)) {
    phyflag <- defaults$phyflag
  }
  if (!is.null(phyflag)) {
    insertFields <- c(insertFields, "phyflag")
    insertValues <- c(insertValues, phyflag)
  }

  if (missing(plankey)) {
    plankey <- defaults$plankey
  }
  if (!is.null(plankey)) {
    insertFields <- c(insertFields, "plankey")
    insertValues <- c(insertValues, plankey)
  }

  if (missing(plantyp)) {
    plantyp <- defaults$plantyp
  }
  if (!is.null(plantyp)) {
    insertFields <- c(insertFields, "plantyp")
    insertValues <- c(insertValues, plantyp)
  }

  if (missing(region)) {
    region <- defaults$region
  }
  if (!is.null(region)) {
    insertFields <- c(insertFields, "region")
    insertValues <- c(insertValues, region)
  }

  if (missing(rx)) {
    rx <- defaults$rx
  }
  if (!is.null(rx)) {
    insertFields <- c(insertFields, "rx")
    insertValues <- c(insertValues, rx)
  }

  if (missing(seqnum)) {
    seqnum <- defaults$seqnum
  }
  if (!is.null(seqnum)) {
    insertFields <- c(insertFields, "seqnum")
    insertValues <- c(insertValues, seqnum)
  }

  if (missing(sex)) {
    sex <- defaults$sex
  }
  if (!is.null(sex)) {
    insertFields <- c(insertFields, "sex")
    insertValues <- c(insertValues, sex)
  }

  if (missing(version)) {
    version <- defaults$version
  }
  if (!is.null(version)) {
    insertFields <- c(insertFields, "version")
    insertValues <- c(insertValues, version)
  }

  if (missing(wgtkey)) {
    wgtkey <- defaults$wgtkey
  }
  if (!is.null(wgtkey)) {
    insertFields <- c(insertFields, "wgtkey")
    insertValues <- c(insertValues, wgtkey)
  }

  if (missing(year)) {
    year <- defaults$year
  }
  if (!is.null(year)) {
    insertFields <- c(insertFields, "year")
    insertValues <- c(insertValues, year)
  }

  statement <- paste0("INSERT INTO @source_schema.enrollment_detail (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
  invisible(statement);
}

add_enrollment_summary <- function(age, agegrp, dattyp1, dattyp10, dattyp11, dattyp12, dattyp2, dattyp3, dattyp4, dattyp5, dattyp6, dattyp7, dattyp8, dattyp9, dobyr, eeclass, eestatu, efamid, egeoloc, emprel, enrind1, enrind10, enrind11, enrind12, enrind2, enrind3, enrind4, enrind5, enrind6, enrind7, enrind8, enrind9, enrmon, enrolid, hlthplan, indstry, memday1, memday10, memday11, memday12, memday2, memday3, memday4, memday5, memday6, memday7, memday8, memday9, memdays, mhsacovg, msa, phyflag, plnkey1, plnkey10, plnkey11, plnkey12, plnkey2, plnkey3, plnkey4, plnkey5, plnkey6, plnkey7, plnkey8, plnkey9, plntyp1, plntyp10, plntyp11, plntyp12, plntyp2, plntyp3, plntyp4, plntyp5, plntyp6, plntyp7, plntyp8, plntyp9, region, rx, seqnum, sex, version, wgtkey, year, mswgtkey) {
  defaults <- frameworkContext$defaultValues$enrollment_summary;
  insertFields <- c()
  insertValues <- c()

  if (missing(age)) {
    age <- defaults$age
  }
  if (!is.null(age)) {
    insertFields <- c(insertFields, "age")
    insertValues <- c(insertValues, age)
  }

  if (missing(agegrp)) {
    agegrp <- defaults$agegrp
  }
  if (!is.null(agegrp)) {
    insertFields <- c(insertFields, "agegrp")
    insertValues <- c(insertValues, agegrp)
  }

  if (missing(dattyp1)) {
    dattyp1 <- defaults$dattyp1
  }
  if (!is.null(dattyp1)) {
    insertFields <- c(insertFields, "dattyp1")
    insertValues <- c(insertValues, dattyp1)
  }

  if (missing(dattyp10)) {
    dattyp10 <- defaults$dattyp10
  }
  if (!is.null(dattyp10)) {
    insertFields <- c(insertFields, "dattyp10")
    insertValues <- c(insertValues, dattyp10)
  }

  if (missing(dattyp11)) {
    dattyp11 <- defaults$dattyp11
  }
  if (!is.null(dattyp11)) {
    insertFields <- c(insertFields, "dattyp11")
    insertValues <- c(insertValues, dattyp11)
  }

  if (missing(dattyp12)) {
    dattyp12 <- defaults$dattyp12
  }
  if (!is.null(dattyp12)) {
    insertFields <- c(insertFields, "dattyp12")
    insertValues <- c(insertValues, dattyp12)
  }

  if (missing(dattyp2)) {
    dattyp2 <- defaults$dattyp2
  }
  if (!is.null(dattyp2)) {
    insertFields <- c(insertFields, "dattyp2")
    insertValues <- c(insertValues, dattyp2)
  }

  if (missing(dattyp3)) {
    dattyp3 <- defaults$dattyp3
  }
  if (!is.null(dattyp3)) {
    insertFields <- c(insertFields, "dattyp3")
    insertValues <- c(insertValues, dattyp3)
  }

  if (missing(dattyp4)) {
    dattyp4 <- defaults$dattyp4
  }
  if (!is.null(dattyp4)) {
    insertFields <- c(insertFields, "dattyp4")
    insertValues <- c(insertValues, dattyp4)
  }

  if (missing(dattyp5)) {
    dattyp5 <- defaults$dattyp5
  }
  if (!is.null(dattyp5)) {
    insertFields <- c(insertFields, "dattyp5")
    insertValues <- c(insertValues, dattyp5)
  }

  if (missing(dattyp6)) {
    dattyp6 <- defaults$dattyp6
  }
  if (!is.null(dattyp6)) {
    insertFields <- c(insertFields, "dattyp6")
    insertValues <- c(insertValues, dattyp6)
  }

  if (missing(dattyp7)) {
    dattyp7 <- defaults$dattyp7
  }
  if (!is.null(dattyp7)) {
    insertFields <- c(insertFields, "dattyp7")
    insertValues <- c(insertValues, dattyp7)
  }

  if (missing(dattyp8)) {
    dattyp8 <- defaults$dattyp8
  }
  if (!is.null(dattyp8)) {
    insertFields <- c(insertFields, "dattyp8")
    insertValues <- c(insertValues, dattyp8)
  }

  if (missing(dattyp9)) {
    dattyp9 <- defaults$dattyp9
  }
  if (!is.null(dattyp9)) {
    insertFields <- c(insertFields, "dattyp9")
    insertValues <- c(insertValues, dattyp9)
  }

  if (missing(dobyr)) {
    dobyr <- defaults$dobyr
  }
  if (!is.null(dobyr)) {
    insertFields <- c(insertFields, "dobyr")
    insertValues <- c(insertValues, dobyr)
  }

  if (missing(eeclass)) {
    eeclass <- defaults$eeclass
  }
  if (!is.null(eeclass)) {
    insertFields <- c(insertFields, "eeclass")
    insertValues <- c(insertValues, eeclass)
  }

  if (missing(eestatu)) {
    eestatu <- defaults$eestatu
  }
  if (!is.null(eestatu)) {
    insertFields <- c(insertFields, "eestatu")
    insertValues <- c(insertValues, eestatu)
  }

  if (missing(efamid)) {
    efamid <- defaults$efamid
  }
  if (!is.null(efamid)) {
    insertFields <- c(insertFields, "efamid")
    insertValues <- c(insertValues, efamid)
  }

  if (missing(egeoloc)) {
    egeoloc <- defaults$egeoloc
  }
  if (!is.null(egeoloc)) {
    insertFields <- c(insertFields, "egeoloc")
    insertValues <- c(insertValues, egeoloc)
  }

  if (missing(emprel)) {
    emprel <- defaults$emprel
  }
  if (!is.null(emprel)) {
    insertFields <- c(insertFields, "emprel")
    insertValues <- c(insertValues, emprel)
  }

  if (missing(enrind1)) {
    enrind1 <- defaults$enrind1
  }
  if (!is.null(enrind1)) {
    insertFields <- c(insertFields, "enrind1")
    insertValues <- c(insertValues, enrind1)
  }

  if (missing(enrind10)) {
    enrind10 <- defaults$enrind10
  }
  if (!is.null(enrind10)) {
    insertFields <- c(insertFields, "enrind10")
    insertValues <- c(insertValues, enrind10)
  }

  if (missing(enrind11)) {
    enrind11 <- defaults$enrind11
  }
  if (!is.null(enrind11)) {
    insertFields <- c(insertFields, "enrind11")
    insertValues <- c(insertValues, enrind11)
  }

  if (missing(enrind12)) {
    enrind12 <- defaults$enrind12
  }
  if (!is.null(enrind12)) {
    insertFields <- c(insertFields, "enrind12")
    insertValues <- c(insertValues, enrind12)
  }

  if (missing(enrind2)) {
    enrind2 <- defaults$enrind2
  }
  if (!is.null(enrind2)) {
    insertFields <- c(insertFields, "enrind2")
    insertValues <- c(insertValues, enrind2)
  }

  if (missing(enrind3)) {
    enrind3 <- defaults$enrind3
  }
  if (!is.null(enrind3)) {
    insertFields <- c(insertFields, "enrind3")
    insertValues <- c(insertValues, enrind3)
  }

  if (missing(enrind4)) {
    enrind4 <- defaults$enrind4
  }
  if (!is.null(enrind4)) {
    insertFields <- c(insertFields, "enrind4")
    insertValues <- c(insertValues, enrind4)
  }

  if (missing(enrind5)) {
    enrind5 <- defaults$enrind5
  }
  if (!is.null(enrind5)) {
    insertFields <- c(insertFields, "enrind5")
    insertValues <- c(insertValues, enrind5)
  }

  if (missing(enrind6)) {
    enrind6 <- defaults$enrind6
  }
  if (!is.null(enrind6)) {
    insertFields <- c(insertFields, "enrind6")
    insertValues <- c(insertValues, enrind6)
  }

  if (missing(enrind7)) {
    enrind7 <- defaults$enrind7
  }
  if (!is.null(enrind7)) {
    insertFields <- c(insertFields, "enrind7")
    insertValues <- c(insertValues, enrind7)
  }

  if (missing(enrind8)) {
    enrind8 <- defaults$enrind8
  }
  if (!is.null(enrind8)) {
    insertFields <- c(insertFields, "enrind8")
    insertValues <- c(insertValues, enrind8)
  }

  if (missing(enrind9)) {
    enrind9 <- defaults$enrind9
  }
  if (!is.null(enrind9)) {
    insertFields <- c(insertFields, "enrind9")
    insertValues <- c(insertValues, enrind9)
  }

  if (missing(enrmon)) {
    enrmon <- defaults$enrmon
  }
  if (!is.null(enrmon)) {
    insertFields <- c(insertFields, "enrmon")
    insertValues <- c(insertValues, enrmon)
  }

  if (missing(enrolid)) {
    enrolid <- defaults$enrolid
  }
  if (!is.null(enrolid)) {
    insertFields <- c(insertFields, "enrolid")
    insertValues <- c(insertValues, enrolid)
  }

  if (missing(hlthplan)) {
    hlthplan <- defaults$hlthplan
  }
  if (!is.null(hlthplan)) {
    insertFields <- c(insertFields, "hlthplan")
    insertValues <- c(insertValues, hlthplan)
  }

  if (missing(indstry)) {
    indstry <- defaults$indstry
  }
  if (!is.null(indstry)) {
    insertFields <- c(insertFields, "indstry")
    insertValues <- c(insertValues, indstry)
  }

  if (missing(memday1)) {
    memday1 <- defaults$memday1
  }
  if (!is.null(memday1)) {
    insertFields <- c(insertFields, "memday1")
    insertValues <- c(insertValues, memday1)
  }

  if (missing(memday10)) {
    memday10 <- defaults$memday10
  }
  if (!is.null(memday10)) {
    insertFields <- c(insertFields, "memday10")
    insertValues <- c(insertValues, memday10)
  }

  if (missing(memday11)) {
    memday11 <- defaults$memday11
  }
  if (!is.null(memday11)) {
    insertFields <- c(insertFields, "memday11")
    insertValues <- c(insertValues, memday11)
  }

  if (missing(memday12)) {
    memday12 <- defaults$memday12
  }
  if (!is.null(memday12)) {
    insertFields <- c(insertFields, "memday12")
    insertValues <- c(insertValues, memday12)
  }

  if (missing(memday2)) {
    memday2 <- defaults$memday2
  }
  if (!is.null(memday2)) {
    insertFields <- c(insertFields, "memday2")
    insertValues <- c(insertValues, memday2)
  }

  if (missing(memday3)) {
    memday3 <- defaults$memday3
  }
  if (!is.null(memday3)) {
    insertFields <- c(insertFields, "memday3")
    insertValues <- c(insertValues, memday3)
  }

  if (missing(memday4)) {
    memday4 <- defaults$memday4
  }
  if (!is.null(memday4)) {
    insertFields <- c(insertFields, "memday4")
    insertValues <- c(insertValues, memday4)
  }

  if (missing(memday5)) {
    memday5 <- defaults$memday5
  }
  if (!is.null(memday5)) {
    insertFields <- c(insertFields, "memday5")
    insertValues <- c(insertValues, memday5)
  }

  if (missing(memday6)) {
    memday6 <- defaults$memday6
  }
  if (!is.null(memday6)) {
    insertFields <- c(insertFields, "memday6")
    insertValues <- c(insertValues, memday6)
  }

  if (missing(memday7)) {
    memday7 <- defaults$memday7
  }
  if (!is.null(memday7)) {
    insertFields <- c(insertFields, "memday7")
    insertValues <- c(insertValues, memday7)
  }

  if (missing(memday8)) {
    memday8 <- defaults$memday8
  }
  if (!is.null(memday8)) {
    insertFields <- c(insertFields, "memday8")
    insertValues <- c(insertValues, memday8)
  }

  if (missing(memday9)) {
    memday9 <- defaults$memday9
  }
  if (!is.null(memday9)) {
    insertFields <- c(insertFields, "memday9")
    insertValues <- c(insertValues, memday9)
  }

  if (missing(memdays)) {
    memdays <- defaults$memdays
  }
  if (!is.null(memdays)) {
    insertFields <- c(insertFields, "memdays")
    insertValues <- c(insertValues, memdays)
  }

  if (missing(mhsacovg)) {
    mhsacovg <- defaults$mhsacovg
  }
  if (!is.null(mhsacovg)) {
    insertFields <- c(insertFields, "mhsacovg")
    insertValues <- c(insertValues, mhsacovg)
  }

  if (missing(msa)) {
    msa <- defaults$msa
  }
  if (!is.null(msa)) {
    insertFields <- c(insertFields, "msa")
    insertValues <- c(insertValues, msa)
  }

  if (missing(phyflag)) {
    phyflag <- defaults$phyflag
  }
  if (!is.null(phyflag)) {
    insertFields <- c(insertFields, "phyflag")
    insertValues <- c(insertValues, phyflag)
  }

  if (missing(plnkey1)) {
    plnkey1 <- defaults$plnkey1
  }
  if (!is.null(plnkey1)) {
    insertFields <- c(insertFields, "plnkey1")
    insertValues <- c(insertValues, plnkey1)
  }

  if (missing(plnkey10)) {
    plnkey10 <- defaults$plnkey10
  }
  if (!is.null(plnkey10)) {
    insertFields <- c(insertFields, "plnkey10")
    insertValues <- c(insertValues, plnkey10)
  }

  if (missing(plnkey11)) {
    plnkey11 <- defaults$plnkey11
  }
  if (!is.null(plnkey11)) {
    insertFields <- c(insertFields, "plnkey11")
    insertValues <- c(insertValues, plnkey11)
  }

  if (missing(plnkey12)) {
    plnkey12 <- defaults$plnkey12
  }
  if (!is.null(plnkey12)) {
    insertFields <- c(insertFields, "plnkey12")
    insertValues <- c(insertValues, plnkey12)
  }

  if (missing(plnkey2)) {
    plnkey2 <- defaults$plnkey2
  }
  if (!is.null(plnkey2)) {
    insertFields <- c(insertFields, "plnkey2")
    insertValues <- c(insertValues, plnkey2)
  }

  if (missing(plnkey3)) {
    plnkey3 <- defaults$plnkey3
  }
  if (!is.null(plnkey3)) {
    insertFields <- c(insertFields, "plnkey3")
    insertValues <- c(insertValues, plnkey3)
  }

  if (missing(plnkey4)) {
    plnkey4 <- defaults$plnkey4
  }
  if (!is.null(plnkey4)) {
    insertFields <- c(insertFields, "plnkey4")
    insertValues <- c(insertValues, plnkey4)
  }

  if (missing(plnkey5)) {
    plnkey5 <- defaults$plnkey5
  }
  if (!is.null(plnkey5)) {
    insertFields <- c(insertFields, "plnkey5")
    insertValues <- c(insertValues, plnkey5)
  }

  if (missing(plnkey6)) {
    plnkey6 <- defaults$plnkey6
  }
  if (!is.null(plnkey6)) {
    insertFields <- c(insertFields, "plnkey6")
    insertValues <- c(insertValues, plnkey6)
  }

  if (missing(plnkey7)) {
    plnkey7 <- defaults$plnkey7
  }
  if (!is.null(plnkey7)) {
    insertFields <- c(insertFields, "plnkey7")
    insertValues <- c(insertValues, plnkey7)
  }

  if (missing(plnkey8)) {
    plnkey8 <- defaults$plnkey8
  }
  if (!is.null(plnkey8)) {
    insertFields <- c(insertFields, "plnkey8")
    insertValues <- c(insertValues, plnkey8)
  }

  if (missing(plnkey9)) {
    plnkey9 <- defaults$plnkey9
  }
  if (!is.null(plnkey9)) {
    insertFields <- c(insertFields, "plnkey9")
    insertValues <- c(insertValues, plnkey9)
  }

  if (missing(plntyp1)) {
    plntyp1 <- defaults$plntyp1
  }
  if (!is.null(plntyp1)) {
    insertFields <- c(insertFields, "plntyp1")
    insertValues <- c(insertValues, plntyp1)
  }

  if (missing(plntyp10)) {
    plntyp10 <- defaults$plntyp10
  }
  if (!is.null(plntyp10)) {
    insertFields <- c(insertFields, "plntyp10")
    insertValues <- c(insertValues, plntyp10)
  }

  if (missing(plntyp11)) {
    plntyp11 <- defaults$plntyp11
  }
  if (!is.null(plntyp11)) {
    insertFields <- c(insertFields, "plntyp11")
    insertValues <- c(insertValues, plntyp11)
  }

  if (missing(plntyp12)) {
    plntyp12 <- defaults$plntyp12
  }
  if (!is.null(plntyp12)) {
    insertFields <- c(insertFields, "plntyp12")
    insertValues <- c(insertValues, plntyp12)
  }

  if (missing(plntyp2)) {
    plntyp2 <- defaults$plntyp2
  }
  if (!is.null(plntyp2)) {
    insertFields <- c(insertFields, "plntyp2")
    insertValues <- c(insertValues, plntyp2)
  }

  if (missing(plntyp3)) {
    plntyp3 <- defaults$plntyp3
  }
  if (!is.null(plntyp3)) {
    insertFields <- c(insertFields, "plntyp3")
    insertValues <- c(insertValues, plntyp3)
  }

  if (missing(plntyp4)) {
    plntyp4 <- defaults$plntyp4
  }
  if (!is.null(plntyp4)) {
    insertFields <- c(insertFields, "plntyp4")
    insertValues <- c(insertValues, plntyp4)
  }

  if (missing(plntyp5)) {
    plntyp5 <- defaults$plntyp5
  }
  if (!is.null(plntyp5)) {
    insertFields <- c(insertFields, "plntyp5")
    insertValues <- c(insertValues, plntyp5)
  }

  if (missing(plntyp6)) {
    plntyp6 <- defaults$plntyp6
  }
  if (!is.null(plntyp6)) {
    insertFields <- c(insertFields, "plntyp6")
    insertValues <- c(insertValues, plntyp6)
  }

  if (missing(plntyp7)) {
    plntyp7 <- defaults$plntyp7
  }
  if (!is.null(plntyp7)) {
    insertFields <- c(insertFields, "plntyp7")
    insertValues <- c(insertValues, plntyp7)
  }

  if (missing(plntyp8)) {
    plntyp8 <- defaults$plntyp8
  }
  if (!is.null(plntyp8)) {
    insertFields <- c(insertFields, "plntyp8")
    insertValues <- c(insertValues, plntyp8)
  }

  if (missing(plntyp9)) {
    plntyp9 <- defaults$plntyp9
  }
  if (!is.null(plntyp9)) {
    insertFields <- c(insertFields, "plntyp9")
    insertValues <- c(insertValues, plntyp9)
  }

  if (missing(region)) {
    region <- defaults$region
  }
  if (!is.null(region)) {
    insertFields <- c(insertFields, "region")
    insertValues <- c(insertValues, region)
  }

  if (missing(rx)) {
    rx <- defaults$rx
  }
  if (!is.null(rx)) {
    insertFields <- c(insertFields, "rx")
    insertValues <- c(insertValues, rx)
  }

  if (missing(seqnum)) {
    seqnum <- defaults$seqnum
  }
  if (!is.null(seqnum)) {
    insertFields <- c(insertFields, "seqnum")
    insertValues <- c(insertValues, seqnum)
  }

  if (missing(sex)) {
    sex <- defaults$sex
  }
  if (!is.null(sex)) {
    insertFields <- c(insertFields, "sex")
    insertValues <- c(insertValues, sex)
  }

  if (missing(version)) {
    version <- defaults$version
  }
  if (!is.null(version)) {
    insertFields <- c(insertFields, "version")
    insertValues <- c(insertValues, version)
  }

  if (missing(wgtkey)) {
    wgtkey <- defaults$wgtkey
  }
  if (!is.null(wgtkey)) {
    insertFields <- c(insertFields, "wgtkey")
    insertValues <- c(insertValues, wgtkey)
  }

  if (missing(year)) {
    year <- defaults$year
  }
  if (!is.null(year)) {
    insertFields <- c(insertFields, "year")
    insertValues <- c(insertValues, year)
  }

  if (missing(mswgtkey)) {
    mswgtkey <- defaults$mswgtkey
  }
  if (!is.null(mswgtkey)) {
    insertFields <- c(insertFields, "mswgtkey")
    insertValues <- c(insertValues, mswgtkey)
  }

  statement <- paste0("INSERT INTO @source_schema.enrollment_summary (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
  invisible(statement);
}

add_facility_header <- function(age, agegrp, billtyp, cap_svc, caseid, cob, coins, copay, datatyp, deduct, dobyr, dstatus, dx1, dx2, dx3, dx4, dx5, dx6, dx7, dx8, dx9, dxver, eeclass, eestatu, efamid, egeoloc, eidflag, emprel, enrflag, enrolid, fachdid, hlthplan, indstry, mdc, mhsacovg, msa, netpay, ntwkprov, paidntwk, pddate, phyflag, plankey, plantyp, proc1, proc2, proc3, proc4, proc5, proc6, provid, region, rx, seqnum, sex, stdplac, stdprov, svcdate, tsvcdat, version, wgtkey, year, msclmid, npi) {
  defaults <- frameworkContext$defaultValues$facility_header;
  insertFields <- c()
  insertValues <- c()

  if (missing(age)) {
    age <- defaults$age
  }
  if (!is.null(age)) {
    insertFields <- c(insertFields, "age")
    insertValues <- c(insertValues, age)
  }

  if (missing(agegrp)) {
    agegrp <- defaults$agegrp
  }
  if (!is.null(agegrp)) {
    insertFields <- c(insertFields, "agegrp")
    insertValues <- c(insertValues, agegrp)
  }

  if (missing(billtyp)) {
    billtyp <- defaults$billtyp
  }
  if (!is.null(billtyp)) {
    insertFields <- c(insertFields, "billtyp")
    insertValues <- c(insertValues, billtyp)
  }

  if (missing(cap_svc)) {
    cap_svc <- defaults$cap_svc
  }
  if (!is.null(cap_svc)) {
    insertFields <- c(insertFields, "cap_svc")
    insertValues <- c(insertValues, cap_svc)
  }

  if (missing(caseid)) {
    caseid <- defaults$caseid
  }
  if (!is.null(caseid)) {
    insertFields <- c(insertFields, "caseid")
    insertValues <- c(insertValues, caseid)
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

  if (missing(copay)) {
    copay <- defaults$copay
  }
  if (!is.null(copay)) {
    insertFields <- c(insertFields, "copay")
    insertValues <- c(insertValues, copay)
  }

  if (missing(datatyp)) {
    datatyp <- defaults$datatyp
  }
  if (!is.null(datatyp)) {
    insertFields <- c(insertFields, "datatyp")
    insertValues <- c(insertValues, datatyp)
  }

  if (missing(deduct)) {
    deduct <- defaults$deduct
  }
  if (!is.null(deduct)) {
    insertFields <- c(insertFields, "deduct")
    insertValues <- c(insertValues, deduct)
  }

  if (missing(dobyr)) {
    dobyr <- defaults$dobyr
  }
  if (!is.null(dobyr)) {
    insertFields <- c(insertFields, "dobyr")
    insertValues <- c(insertValues, dobyr)
  }

  if (missing(dstatus)) {
    dstatus <- defaults$dstatus
  }
  if (!is.null(dstatus)) {
    insertFields <- c(insertFields, "dstatus")
    insertValues <- c(insertValues, dstatus)
  }

  if (missing(dx1)) {
    dx1 <- defaults$dx1
  }
  if (!is.null(dx1)) {
    insertFields <- c(insertFields, "dx1")
    insertValues <- c(insertValues, dx1)
  }

  if (missing(dx2)) {
    dx2 <- defaults$dx2
  }
  if (!is.null(dx2)) {
    insertFields <- c(insertFields, "dx2")
    insertValues <- c(insertValues, dx2)
  }

  if (missing(dx3)) {
    dx3 <- defaults$dx3
  }
  if (!is.null(dx3)) {
    insertFields <- c(insertFields, "dx3")
    insertValues <- c(insertValues, dx3)
  }

  if (missing(dx4)) {
    dx4 <- defaults$dx4
  }
  if (!is.null(dx4)) {
    insertFields <- c(insertFields, "dx4")
    insertValues <- c(insertValues, dx4)
  }

  if (missing(dx5)) {
    dx5 <- defaults$dx5
  }
  if (!is.null(dx5)) {
    insertFields <- c(insertFields, "dx5")
    insertValues <- c(insertValues, dx5)
  }

  if (missing(dx6)) {
    dx6 <- defaults$dx6
  }
  if (!is.null(dx6)) {
    insertFields <- c(insertFields, "dx6")
    insertValues <- c(insertValues, dx6)
  }

  if (missing(dx7)) {
    dx7 <- defaults$dx7
  }
  if (!is.null(dx7)) {
    insertFields <- c(insertFields, "dx7")
    insertValues <- c(insertValues, dx7)
  }

  if (missing(dx8)) {
    dx8 <- defaults$dx8
  }
  if (!is.null(dx8)) {
    insertFields <- c(insertFields, "dx8")
    insertValues <- c(insertValues, dx8)
  }

  if (missing(dx9)) {
    dx9 <- defaults$dx9
  }
  if (!is.null(dx9)) {
    insertFields <- c(insertFields, "dx9")
    insertValues <- c(insertValues, dx9)
  }

  if (missing(dxver)) {
    dxver <- defaults$dxver
  }
  if (!is.null(dxver)) {
    insertFields <- c(insertFields, "dxver")
    insertValues <- c(insertValues, dxver)
  }

  if (missing(eeclass)) {
    eeclass <- defaults$eeclass
  }
  if (!is.null(eeclass)) {
    insertFields <- c(insertFields, "eeclass")
    insertValues <- c(insertValues, eeclass)
  }

  if (missing(eestatu)) {
    eestatu <- defaults$eestatu
  }
  if (!is.null(eestatu)) {
    insertFields <- c(insertFields, "eestatu")
    insertValues <- c(insertValues, eestatu)
  }

  if (missing(efamid)) {
    efamid <- defaults$efamid
  }
  if (!is.null(efamid)) {
    insertFields <- c(insertFields, "efamid")
    insertValues <- c(insertValues, efamid)
  }

  if (missing(egeoloc)) {
    egeoloc <- defaults$egeoloc
  }
  if (!is.null(egeoloc)) {
    insertFields <- c(insertFields, "egeoloc")
    insertValues <- c(insertValues, egeoloc)
  }

  if (missing(eidflag)) {
    eidflag <- defaults$eidflag
  }
  if (!is.null(eidflag)) {
    insertFields <- c(insertFields, "eidflag")
    insertValues <- c(insertValues, eidflag)
  }

  if (missing(emprel)) {
    emprel <- defaults$emprel
  }
  if (!is.null(emprel)) {
    insertFields <- c(insertFields, "emprel")
    insertValues <- c(insertValues, emprel)
  }

  if (missing(enrflag)) {
    enrflag <- defaults$enrflag
  }
  if (!is.null(enrflag)) {
    insertFields <- c(insertFields, "enrflag")
    insertValues <- c(insertValues, enrflag)
  }

  if (missing(enrolid)) {
    enrolid <- defaults$enrolid
  }
  if (!is.null(enrolid)) {
    insertFields <- c(insertFields, "enrolid")
    insertValues <- c(insertValues, enrolid)
  }

  if (missing(fachdid)) {
    fachdid <- defaults$fachdid
  }
  if (!is.null(fachdid)) {
    insertFields <- c(insertFields, "fachdid")
    insertValues <- c(insertValues, fachdid)
  }

  if (missing(hlthplan)) {
    hlthplan <- defaults$hlthplan
  }
  if (!is.null(hlthplan)) {
    insertFields <- c(insertFields, "hlthplan")
    insertValues <- c(insertValues, hlthplan)
  }

  if (missing(indstry)) {
    indstry <- defaults$indstry
  }
  if (!is.null(indstry)) {
    insertFields <- c(insertFields, "indstry")
    insertValues <- c(insertValues, indstry)
  }

  if (missing(mdc)) {
    mdc <- defaults$mdc
  }
  if (!is.null(mdc)) {
    insertFields <- c(insertFields, "mdc")
    insertValues <- c(insertValues, mdc)
  }

  if (missing(mhsacovg)) {
    mhsacovg <- defaults$mhsacovg
  }
  if (!is.null(mhsacovg)) {
    insertFields <- c(insertFields, "mhsacovg")
    insertValues <- c(insertValues, mhsacovg)
  }

  if (missing(msa)) {
    msa <- defaults$msa
  }
  if (!is.null(msa)) {
    insertFields <- c(insertFields, "msa")
    insertValues <- c(insertValues, msa)
  }

  if (missing(netpay)) {
    netpay <- defaults$netpay
  }
  if (!is.null(netpay)) {
    insertFields <- c(insertFields, "netpay")
    insertValues <- c(insertValues, netpay)
  }

  if (missing(ntwkprov)) {
    ntwkprov <- defaults$ntwkprov
  }
  if (!is.null(ntwkprov)) {
    insertFields <- c(insertFields, "ntwkprov")
    insertValues <- c(insertValues, ntwkprov)
  }

  if (missing(paidntwk)) {
    paidntwk <- defaults$paidntwk
  }
  if (!is.null(paidntwk)) {
    insertFields <- c(insertFields, "paidntwk")
    insertValues <- c(insertValues, paidntwk)
  }

  if (missing(pddate)) {
    pddate <- defaults$pddate
  }
  if (!is.null(pddate)) {
    insertFields <- c(insertFields, "pddate")
    insertValues <- c(insertValues, pddate)
  }

  if (missing(phyflag)) {
    phyflag <- defaults$phyflag
  }
  if (!is.null(phyflag)) {
    insertFields <- c(insertFields, "phyflag")
    insertValues <- c(insertValues, phyflag)
  }

  if (missing(plankey)) {
    plankey <- defaults$plankey
  }
  if (!is.null(plankey)) {
    insertFields <- c(insertFields, "plankey")
    insertValues <- c(insertValues, plankey)
  }

  if (missing(plantyp)) {
    plantyp <- defaults$plantyp
  }
  if (!is.null(plantyp)) {
    insertFields <- c(insertFields, "plantyp")
    insertValues <- c(insertValues, plantyp)
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

  if (missing(proc6)) {
    proc6 <- defaults$proc6
  }
  if (!is.null(proc6)) {
    insertFields <- c(insertFields, "proc6")
    insertValues <- c(insertValues, proc6)
  }

  if (missing(provid)) {
    provid <- defaults$provid
  }
  if (!is.null(provid)) {
    insertFields <- c(insertFields, "provid")
    insertValues <- c(insertValues, provid)
  }

  if (missing(region)) {
    region <- defaults$region
  }
  if (!is.null(region)) {
    insertFields <- c(insertFields, "region")
    insertValues <- c(insertValues, region)
  }

  if (missing(rx)) {
    rx <- defaults$rx
  }
  if (!is.null(rx)) {
    insertFields <- c(insertFields, "rx")
    insertValues <- c(insertValues, rx)
  }

  if (missing(seqnum)) {
    seqnum <- defaults$seqnum
  }
  if (!is.null(seqnum)) {
    insertFields <- c(insertFields, "seqnum")
    insertValues <- c(insertValues, seqnum)
  }

  if (missing(sex)) {
    sex <- defaults$sex
  }
  if (!is.null(sex)) {
    insertFields <- c(insertFields, "sex")
    insertValues <- c(insertValues, sex)
  }

  if (missing(stdplac)) {
    stdplac <- defaults$stdplac
  }
  if (!is.null(stdplac)) {
    insertFields <- c(insertFields, "stdplac")
    insertValues <- c(insertValues, stdplac)
  }

  if (missing(stdprov)) {
    stdprov <- defaults$stdprov
  }
  if (!is.null(stdprov)) {
    insertFields <- c(insertFields, "stdprov")
    insertValues <- c(insertValues, stdprov)
  }

  if (missing(svcdate)) {
    svcdate <- defaults$svcdate
  }
  if (!is.null(svcdate)) {
    insertFields <- c(insertFields, "svcdate")
    insertValues <- c(insertValues, svcdate)
  }

  if (missing(tsvcdat)) {
    tsvcdat <- defaults$tsvcdat
  }
  if (!is.null(tsvcdat)) {
    insertFields <- c(insertFields, "tsvcdat")
    insertValues <- c(insertValues, tsvcdat)
  }

  if (missing(version)) {
    version <- defaults$version
  }
  if (!is.null(version)) {
    insertFields <- c(insertFields, "version")
    insertValues <- c(insertValues, version)
  }

  if (missing(wgtkey)) {
    wgtkey <- defaults$wgtkey
  }
  if (!is.null(wgtkey)) {
    insertFields <- c(insertFields, "wgtkey")
    insertValues <- c(insertValues, wgtkey)
  }

  if (missing(year)) {
    year <- defaults$year
  }
  if (!is.null(year)) {
    insertFields <- c(insertFields, "year")
    insertValues <- c(insertValues, year)
  }

  if (missing(msclmid)) {
    msclmid <- defaults$msclmid
  }
  if (!is.null(msclmid)) {
    insertFields <- c(insertFields, "msclmid")
    insertValues <- c(insertValues, msclmid)
  }

  if (missing(npi)) {
    npi <- defaults$npi
  }
  if (!is.null(npi)) {
    insertFields <- c(insertFields, "npi")
    insertValues <- c(insertValues, npi)
  }

  statement <- paste0("INSERT INTO @source_schema.facility_header (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
  invisible(statement);
}

add_health_risk_assessment <- function(alc_amt, alcdyamt, alcweek, bmi, cc_allergy, cc_arthritis, cc_asthma, cc_backpain, cc_chf, cc_depress, cc_diab, cc_heartdis, cc_highbp, cc_highcol, cc_hrtburn, cc_lungdis, cc_migraine, cc_nonskincan, cc_osteopo, cc_skincan, cgramt, cgrcurr, cgrdur, cgrprev, cgrqtyr, cgrquit, cgtamt, cgtcurr, cgtdur, cgtpkamt, cgtprev, cgtqtcat, cgtqtyr, cgtquit, chewamt, chewcurr, chewdur, chewprev, chewqtyr, chewquit, cholestr, copestrs, diast_bp, dietfrt, dietfrvg, dietveg, dobyr, drnkdrv, educ_lvl, efamid, enrolid, exermo, exerweek, famabscat12, fireext, flu_shot, glucose, hdl, height, hlthplan, hltimpct, job_sat, ldl, life_sat, liftwgt, mh_freq, mh_prob, pipeamt, pipecurr, pipedur, pipeprev, pipeqtyr, pipequit, planalc, plandiet, plandrad, planexer, planslp, planstrs, plantob, planwgt, prev_mammo, prev_paptest, prev_prostex, prev_sigmoid, prodabscat, risk_alc, risk_bp, risk_chol, risk_exer, risk_gluc, risk_mh, risk_nutr, risk_safe, risk_sleep, risk_smok, risk_wgt, seatbelt, selfhlth, seqnum, sex, sleep_hr, slpapnea, slpprob, smkdetect, stretch, survdate, systo_bp, tobcurr, tobprev, triglycd, version, weight, workabs, wrkabscat, wrkabscat12, year) {
  defaults <- frameworkContext$defaultValues$health_risk_assessment;
  insertFields <- c()
  insertValues <- c()

  if (missing(alc_amt)) {
    alc_amt <- defaults$alc_amt
  }
  if (!is.null(alc_amt)) {
    insertFields <- c(insertFields, "alc_amt")
    insertValues <- c(insertValues, alc_amt)
  }

  if (missing(alcdyamt)) {
    alcdyamt <- defaults$alcdyamt
  }
  if (!is.null(alcdyamt)) {
    insertFields <- c(insertFields, "alcdyamt")
    insertValues <- c(insertValues, alcdyamt)
  }

  if (missing(alcweek)) {
    alcweek <- defaults$alcweek
  }
  if (!is.null(alcweek)) {
    insertFields <- c(insertFields, "alcweek")
    insertValues <- c(insertValues, alcweek)
  }

  if (missing(bmi)) {
    bmi <- defaults$bmi
  }
  if (!is.null(bmi)) {
    insertFields <- c(insertFields, "bmi")
    insertValues <- c(insertValues, bmi)
  }

  if (missing(cc_allergy)) {
    cc_allergy <- defaults$cc_allergy
  }
  if (!is.null(cc_allergy)) {
    insertFields <- c(insertFields, "cc_allergy")
    insertValues <- c(insertValues, cc_allergy)
  }

  if (missing(cc_arthritis)) {
    cc_arthritis <- defaults$cc_arthritis
  }
  if (!is.null(cc_arthritis)) {
    insertFields <- c(insertFields, "cc_arthritis")
    insertValues <- c(insertValues, cc_arthritis)
  }

  if (missing(cc_asthma)) {
    cc_asthma <- defaults$cc_asthma
  }
  if (!is.null(cc_asthma)) {
    insertFields <- c(insertFields, "cc_asthma")
    insertValues <- c(insertValues, cc_asthma)
  }

  if (missing(cc_backpain)) {
    cc_backpain <- defaults$cc_backpain
  }
  if (!is.null(cc_backpain)) {
    insertFields <- c(insertFields, "cc_backpain")
    insertValues <- c(insertValues, cc_backpain)
  }

  if (missing(cc_chf)) {
    cc_chf <- defaults$cc_chf
  }
  if (!is.null(cc_chf)) {
    insertFields <- c(insertFields, "cc_chf")
    insertValues <- c(insertValues, cc_chf)
  }

  if (missing(cc_depress)) {
    cc_depress <- defaults$cc_depress
  }
  if (!is.null(cc_depress)) {
    insertFields <- c(insertFields, "cc_depress")
    insertValues <- c(insertValues, cc_depress)
  }

  if (missing(cc_diab)) {
    cc_diab <- defaults$cc_diab
  }
  if (!is.null(cc_diab)) {
    insertFields <- c(insertFields, "cc_diab")
    insertValues <- c(insertValues, cc_diab)
  }

  if (missing(cc_heartdis)) {
    cc_heartdis <- defaults$cc_heartdis
  }
  if (!is.null(cc_heartdis)) {
    insertFields <- c(insertFields, "cc_heartdis")
    insertValues <- c(insertValues, cc_heartdis)
  }

  if (missing(cc_highbp)) {
    cc_highbp <- defaults$cc_highbp
  }
  if (!is.null(cc_highbp)) {
    insertFields <- c(insertFields, "cc_highbp")
    insertValues <- c(insertValues, cc_highbp)
  }

  if (missing(cc_highcol)) {
    cc_highcol <- defaults$cc_highcol
  }
  if (!is.null(cc_highcol)) {
    insertFields <- c(insertFields, "cc_highcol")
    insertValues <- c(insertValues, cc_highcol)
  }

  if (missing(cc_hrtburn)) {
    cc_hrtburn <- defaults$cc_hrtburn
  }
  if (!is.null(cc_hrtburn)) {
    insertFields <- c(insertFields, "cc_hrtburn")
    insertValues <- c(insertValues, cc_hrtburn)
  }

  if (missing(cc_lungdis)) {
    cc_lungdis <- defaults$cc_lungdis
  }
  if (!is.null(cc_lungdis)) {
    insertFields <- c(insertFields, "cc_lungdis")
    insertValues <- c(insertValues, cc_lungdis)
  }

  if (missing(cc_migraine)) {
    cc_migraine <- defaults$cc_migraine
  }
  if (!is.null(cc_migraine)) {
    insertFields <- c(insertFields, "cc_migraine")
    insertValues <- c(insertValues, cc_migraine)
  }

  if (missing(cc_nonskincan)) {
    cc_nonskincan <- defaults$cc_nonskincan
  }
  if (!is.null(cc_nonskincan)) {
    insertFields <- c(insertFields, "cc_nonskincan")
    insertValues <- c(insertValues, cc_nonskincan)
  }

  if (missing(cc_osteopo)) {
    cc_osteopo <- defaults$cc_osteopo
  }
  if (!is.null(cc_osteopo)) {
    insertFields <- c(insertFields, "cc_osteopo")
    insertValues <- c(insertValues, cc_osteopo)
  }

  if (missing(cc_skincan)) {
    cc_skincan <- defaults$cc_skincan
  }
  if (!is.null(cc_skincan)) {
    insertFields <- c(insertFields, "cc_skincan")
    insertValues <- c(insertValues, cc_skincan)
  }

  if (missing(cgramt)) {
    cgramt <- defaults$cgramt
  }
  if (!is.null(cgramt)) {
    insertFields <- c(insertFields, "cgramt")
    insertValues <- c(insertValues, cgramt)
  }

  if (missing(cgrcurr)) {
    cgrcurr <- defaults$cgrcurr
  }
  if (!is.null(cgrcurr)) {
    insertFields <- c(insertFields, "cgrcurr")
    insertValues <- c(insertValues, cgrcurr)
  }

  if (missing(cgrdur)) {
    cgrdur <- defaults$cgrdur
  }
  if (!is.null(cgrdur)) {
    insertFields <- c(insertFields, "cgrdur")
    insertValues <- c(insertValues, cgrdur)
  }

  if (missing(cgrprev)) {
    cgrprev <- defaults$cgrprev
  }
  if (!is.null(cgrprev)) {
    insertFields <- c(insertFields, "cgrprev")
    insertValues <- c(insertValues, cgrprev)
  }

  if (missing(cgrqtyr)) {
    cgrqtyr <- defaults$cgrqtyr
  }
  if (!is.null(cgrqtyr)) {
    insertFields <- c(insertFields, "cgrqtyr")
    insertValues <- c(insertValues, cgrqtyr)
  }

  if (missing(cgrquit)) {
    cgrquit <- defaults$cgrquit
  }
  if (!is.null(cgrquit)) {
    insertFields <- c(insertFields, "cgrquit")
    insertValues <- c(insertValues, cgrquit)
  }

  if (missing(cgtamt)) {
    cgtamt <- defaults$cgtamt
  }
  if (!is.null(cgtamt)) {
    insertFields <- c(insertFields, "cgtamt")
    insertValues <- c(insertValues, cgtamt)
  }

  if (missing(cgtcurr)) {
    cgtcurr <- defaults$cgtcurr
  }
  if (!is.null(cgtcurr)) {
    insertFields <- c(insertFields, "cgtcurr")
    insertValues <- c(insertValues, cgtcurr)
  }

  if (missing(cgtdur)) {
    cgtdur <- defaults$cgtdur
  }
  if (!is.null(cgtdur)) {
    insertFields <- c(insertFields, "cgtdur")
    insertValues <- c(insertValues, cgtdur)
  }

  if (missing(cgtpkamt)) {
    cgtpkamt <- defaults$cgtpkamt
  }
  if (!is.null(cgtpkamt)) {
    insertFields <- c(insertFields, "cgtpkamt")
    insertValues <- c(insertValues, cgtpkamt)
  }

  if (missing(cgtprev)) {
    cgtprev <- defaults$cgtprev
  }
  if (!is.null(cgtprev)) {
    insertFields <- c(insertFields, "cgtprev")
    insertValues <- c(insertValues, cgtprev)
  }

  if (missing(cgtqtcat)) {
    cgtqtcat <- defaults$cgtqtcat
  }
  if (!is.null(cgtqtcat)) {
    insertFields <- c(insertFields, "cgtqtcat")
    insertValues <- c(insertValues, cgtqtcat)
  }

  if (missing(cgtqtyr)) {
    cgtqtyr <- defaults$cgtqtyr
  }
  if (!is.null(cgtqtyr)) {
    insertFields <- c(insertFields, "cgtqtyr")
    insertValues <- c(insertValues, cgtqtyr)
  }

  if (missing(cgtquit)) {
    cgtquit <- defaults$cgtquit
  }
  if (!is.null(cgtquit)) {
    insertFields <- c(insertFields, "cgtquit")
    insertValues <- c(insertValues, cgtquit)
  }

  if (missing(chewamt)) {
    chewamt <- defaults$chewamt
  }
  if (!is.null(chewamt)) {
    insertFields <- c(insertFields, "chewamt")
    insertValues <- c(insertValues, chewamt)
  }

  if (missing(chewcurr)) {
    chewcurr <- defaults$chewcurr
  }
  if (!is.null(chewcurr)) {
    insertFields <- c(insertFields, "chewcurr")
    insertValues <- c(insertValues, chewcurr)
  }

  if (missing(chewdur)) {
    chewdur <- defaults$chewdur
  }
  if (!is.null(chewdur)) {
    insertFields <- c(insertFields, "chewdur")
    insertValues <- c(insertValues, chewdur)
  }

  if (missing(chewprev)) {
    chewprev <- defaults$chewprev
  }
  if (!is.null(chewprev)) {
    insertFields <- c(insertFields, "chewprev")
    insertValues <- c(insertValues, chewprev)
  }

  if (missing(chewqtyr)) {
    chewqtyr <- defaults$chewqtyr
  }
  if (!is.null(chewqtyr)) {
    insertFields <- c(insertFields, "chewqtyr")
    insertValues <- c(insertValues, chewqtyr)
  }

  if (missing(chewquit)) {
    chewquit <- defaults$chewquit
  }
  if (!is.null(chewquit)) {
    insertFields <- c(insertFields, "chewquit")
    insertValues <- c(insertValues, chewquit)
  }

  if (missing(cholestr)) {
    cholestr <- defaults$cholestr
  }
  if (!is.null(cholestr)) {
    insertFields <- c(insertFields, "cholestr")
    insertValues <- c(insertValues, cholestr)
  }

  if (missing(copestrs)) {
    copestrs <- defaults$copestrs
  }
  if (!is.null(copestrs)) {
    insertFields <- c(insertFields, "copestrs")
    insertValues <- c(insertValues, copestrs)
  }

  if (missing(diast_bp)) {
    diast_bp <- defaults$diast_bp
  }
  if (!is.null(diast_bp)) {
    insertFields <- c(insertFields, "diast_bp")
    insertValues <- c(insertValues, diast_bp)
  }

  if (missing(dietfrt)) {
    dietfrt <- defaults$dietfrt
  }
  if (!is.null(dietfrt)) {
    insertFields <- c(insertFields, "dietfrt")
    insertValues <- c(insertValues, dietfrt)
  }

  if (missing(dietfrvg)) {
    dietfrvg <- defaults$dietfrvg
  }
  if (!is.null(dietfrvg)) {
    insertFields <- c(insertFields, "dietfrvg")
    insertValues <- c(insertValues, dietfrvg)
  }

  if (missing(dietveg)) {
    dietveg <- defaults$dietveg
  }
  if (!is.null(dietveg)) {
    insertFields <- c(insertFields, "dietveg")
    insertValues <- c(insertValues, dietveg)
  }

  if (missing(dobyr)) {
    dobyr <- defaults$dobyr
  }
  if (!is.null(dobyr)) {
    insertFields <- c(insertFields, "dobyr")
    insertValues <- c(insertValues, dobyr)
  }

  if (missing(drnkdrv)) {
    drnkdrv <- defaults$drnkdrv
  }
  if (!is.null(drnkdrv)) {
    insertFields <- c(insertFields, "drnkdrv")
    insertValues <- c(insertValues, drnkdrv)
  }

  if (missing(educ_lvl)) {
    educ_lvl <- defaults$educ_lvl
  }
  if (!is.null(educ_lvl)) {
    insertFields <- c(insertFields, "educ_lvl")
    insertValues <- c(insertValues, educ_lvl)
  }

  if (missing(efamid)) {
    efamid <- defaults$efamid
  }
  if (!is.null(efamid)) {
    insertFields <- c(insertFields, "efamid")
    insertValues <- c(insertValues, efamid)
  }

  if (missing(enrolid)) {
    enrolid <- defaults$enrolid
  }
  if (!is.null(enrolid)) {
    insertFields <- c(insertFields, "enrolid")
    insertValues <- c(insertValues, enrolid)
  }

  if (missing(exermo)) {
    exermo <- defaults$exermo
  }
  if (!is.null(exermo)) {
    insertFields <- c(insertFields, "exermo")
    insertValues <- c(insertValues, exermo)
  }

  if (missing(exerweek)) {
    exerweek <- defaults$exerweek
  }
  if (!is.null(exerweek)) {
    insertFields <- c(insertFields, "exerweek")
    insertValues <- c(insertValues, exerweek)
  }

  if (missing(famabscat12)) {
    famabscat12 <- defaults$famabscat12
  }
  if (!is.null(famabscat12)) {
    insertFields <- c(insertFields, "famabscat12")
    insertValues <- c(insertValues, famabscat12)
  }

  if (missing(fireext)) {
    fireext <- defaults$fireext
  }
  if (!is.null(fireext)) {
    insertFields <- c(insertFields, "fireext")
    insertValues <- c(insertValues, fireext)
  }

  if (missing(flu_shot)) {
    flu_shot <- defaults$flu_shot
  }
  if (!is.null(flu_shot)) {
    insertFields <- c(insertFields, "flu_shot")
    insertValues <- c(insertValues, flu_shot)
  }

  if (missing(glucose)) {
    glucose <- defaults$glucose
  }
  if (!is.null(glucose)) {
    insertFields <- c(insertFields, "glucose")
    insertValues <- c(insertValues, glucose)
  }

  if (missing(hdl)) {
    hdl <- defaults$hdl
  }
  if (!is.null(hdl)) {
    insertFields <- c(insertFields, "hdl")
    insertValues <- c(insertValues, hdl)
  }

  if (missing(height)) {
    height <- defaults$height
  }
  if (!is.null(height)) {
    insertFields <- c(insertFields, "height")
    insertValues <- c(insertValues, height)
  }

  if (missing(hlthplan)) {
    hlthplan <- defaults$hlthplan
  }
  if (!is.null(hlthplan)) {
    insertFields <- c(insertFields, "hlthplan")
    insertValues <- c(insertValues, hlthplan)
  }

  if (missing(hltimpct)) {
    hltimpct <- defaults$hltimpct
  }
  if (!is.null(hltimpct)) {
    insertFields <- c(insertFields, "hltimpct")
    insertValues <- c(insertValues, hltimpct)
  }

  if (missing(job_sat)) {
    job_sat <- defaults$job_sat
  }
  if (!is.null(job_sat)) {
    insertFields <- c(insertFields, "job_sat")
    insertValues <- c(insertValues, job_sat)
  }

  if (missing(ldl)) {
    ldl <- defaults$ldl
  }
  if (!is.null(ldl)) {
    insertFields <- c(insertFields, "ldl")
    insertValues <- c(insertValues, ldl)
  }

  if (missing(life_sat)) {
    life_sat <- defaults$life_sat
  }
  if (!is.null(life_sat)) {
    insertFields <- c(insertFields, "life_sat")
    insertValues <- c(insertValues, life_sat)
  }

  if (missing(liftwgt)) {
    liftwgt <- defaults$liftwgt
  }
  if (!is.null(liftwgt)) {
    insertFields <- c(insertFields, "liftwgt")
    insertValues <- c(insertValues, liftwgt)
  }

  if (missing(mh_freq)) {
    mh_freq <- defaults$mh_freq
  }
  if (!is.null(mh_freq)) {
    insertFields <- c(insertFields, "mh_freq")
    insertValues <- c(insertValues, mh_freq)
  }

  if (missing(mh_prob)) {
    mh_prob <- defaults$mh_prob
  }
  if (!is.null(mh_prob)) {
    insertFields <- c(insertFields, "mh_prob")
    insertValues <- c(insertValues, mh_prob)
  }

  if (missing(pipeamt)) {
    pipeamt <- defaults$pipeamt
  }
  if (!is.null(pipeamt)) {
    insertFields <- c(insertFields, "pipeamt")
    insertValues <- c(insertValues, pipeamt)
  }

  if (missing(pipecurr)) {
    pipecurr <- defaults$pipecurr
  }
  if (!is.null(pipecurr)) {
    insertFields <- c(insertFields, "pipecurr")
    insertValues <- c(insertValues, pipecurr)
  }

  if (missing(pipedur)) {
    pipedur <- defaults$pipedur
  }
  if (!is.null(pipedur)) {
    insertFields <- c(insertFields, "pipedur")
    insertValues <- c(insertValues, pipedur)
  }

  if (missing(pipeprev)) {
    pipeprev <- defaults$pipeprev
  }
  if (!is.null(pipeprev)) {
    insertFields <- c(insertFields, "pipeprev")
    insertValues <- c(insertValues, pipeprev)
  }

  if (missing(pipeqtyr)) {
    pipeqtyr <- defaults$pipeqtyr
  }
  if (!is.null(pipeqtyr)) {
    insertFields <- c(insertFields, "pipeqtyr")
    insertValues <- c(insertValues, pipeqtyr)
  }

  if (missing(pipequit)) {
    pipequit <- defaults$pipequit
  }
  if (!is.null(pipequit)) {
    insertFields <- c(insertFields, "pipequit")
    insertValues <- c(insertValues, pipequit)
  }

  if (missing(planalc)) {
    planalc <- defaults$planalc
  }
  if (!is.null(planalc)) {
    insertFields <- c(insertFields, "planalc")
    insertValues <- c(insertValues, planalc)
  }

  if (missing(plandiet)) {
    plandiet <- defaults$plandiet
  }
  if (!is.null(plandiet)) {
    insertFields <- c(insertFields, "plandiet")
    insertValues <- c(insertValues, plandiet)
  }

  if (missing(plandrad)) {
    plandrad <- defaults$plandrad
  }
  if (!is.null(plandrad)) {
    insertFields <- c(insertFields, "plandrad")
    insertValues <- c(insertValues, plandrad)
  }

  if (missing(planexer)) {
    planexer <- defaults$planexer
  }
  if (!is.null(planexer)) {
    insertFields <- c(insertFields, "planexer")
    insertValues <- c(insertValues, planexer)
  }

  if (missing(planslp)) {
    planslp <- defaults$planslp
  }
  if (!is.null(planslp)) {
    insertFields <- c(insertFields, "planslp")
    insertValues <- c(insertValues, planslp)
  }

  if (missing(planstrs)) {
    planstrs <- defaults$planstrs
  }
  if (!is.null(planstrs)) {
    insertFields <- c(insertFields, "planstrs")
    insertValues <- c(insertValues, planstrs)
  }

  if (missing(plantob)) {
    plantob <- defaults$plantob
  }
  if (!is.null(plantob)) {
    insertFields <- c(insertFields, "plantob")
    insertValues <- c(insertValues, plantob)
  }

  if (missing(planwgt)) {
    planwgt <- defaults$planwgt
  }
  if (!is.null(planwgt)) {
    insertFields <- c(insertFields, "planwgt")
    insertValues <- c(insertValues, planwgt)
  }

  if (missing(prev_mammo)) {
    prev_mammo <- defaults$prev_mammo
  }
  if (!is.null(prev_mammo)) {
    insertFields <- c(insertFields, "prev_mammo")
    insertValues <- c(insertValues, prev_mammo)
  }

  if (missing(prev_paptest)) {
    prev_paptest <- defaults$prev_paptest
  }
  if (!is.null(prev_paptest)) {
    insertFields <- c(insertFields, "prev_paptest")
    insertValues <- c(insertValues, prev_paptest)
  }

  if (missing(prev_prostex)) {
    prev_prostex <- defaults$prev_prostex
  }
  if (!is.null(prev_prostex)) {
    insertFields <- c(insertFields, "prev_prostex")
    insertValues <- c(insertValues, prev_prostex)
  }

  if (missing(prev_sigmoid)) {
    prev_sigmoid <- defaults$prev_sigmoid
  }
  if (!is.null(prev_sigmoid)) {
    insertFields <- c(insertFields, "prev_sigmoid")
    insertValues <- c(insertValues, prev_sigmoid)
  }

  if (missing(prodabscat)) {
    prodabscat <- defaults$prodabscat
  }
  if (!is.null(prodabscat)) {
    insertFields <- c(insertFields, "prodabscat")
    insertValues <- c(insertValues, prodabscat)
  }

  if (missing(risk_alc)) {
    risk_alc <- defaults$risk_alc
  }
  if (!is.null(risk_alc)) {
    insertFields <- c(insertFields, "risk_alc")
    insertValues <- c(insertValues, risk_alc)
  }

  if (missing(risk_bp)) {
    risk_bp <- defaults$risk_bp
  }
  if (!is.null(risk_bp)) {
    insertFields <- c(insertFields, "risk_bp")
    insertValues <- c(insertValues, risk_bp)
  }

  if (missing(risk_chol)) {
    risk_chol <- defaults$risk_chol
  }
  if (!is.null(risk_chol)) {
    insertFields <- c(insertFields, "risk_chol")
    insertValues <- c(insertValues, risk_chol)
  }

  if (missing(risk_exer)) {
    risk_exer <- defaults$risk_exer
  }
  if (!is.null(risk_exer)) {
    insertFields <- c(insertFields, "risk_exer")
    insertValues <- c(insertValues, risk_exer)
  }

  if (missing(risk_gluc)) {
    risk_gluc <- defaults$risk_gluc
  }
  if (!is.null(risk_gluc)) {
    insertFields <- c(insertFields, "risk_gluc")
    insertValues <- c(insertValues, risk_gluc)
  }

  if (missing(risk_mh)) {
    risk_mh <- defaults$risk_mh
  }
  if (!is.null(risk_mh)) {
    insertFields <- c(insertFields, "risk_mh")
    insertValues <- c(insertValues, risk_mh)
  }

  if (missing(risk_nutr)) {
    risk_nutr <- defaults$risk_nutr
  }
  if (!is.null(risk_nutr)) {
    insertFields <- c(insertFields, "risk_nutr")
    insertValues <- c(insertValues, risk_nutr)
  }

  if (missing(risk_safe)) {
    risk_safe <- defaults$risk_safe
  }
  if (!is.null(risk_safe)) {
    insertFields <- c(insertFields, "risk_safe")
    insertValues <- c(insertValues, risk_safe)
  }

  if (missing(risk_sleep)) {
    risk_sleep <- defaults$risk_sleep
  }
  if (!is.null(risk_sleep)) {
    insertFields <- c(insertFields, "risk_sleep")
    insertValues <- c(insertValues, risk_sleep)
  }

  if (missing(risk_smok)) {
    risk_smok <- defaults$risk_smok
  }
  if (!is.null(risk_smok)) {
    insertFields <- c(insertFields, "risk_smok")
    insertValues <- c(insertValues, risk_smok)
  }

  if (missing(risk_wgt)) {
    risk_wgt <- defaults$risk_wgt
  }
  if (!is.null(risk_wgt)) {
    insertFields <- c(insertFields, "risk_wgt")
    insertValues <- c(insertValues, risk_wgt)
  }

  if (missing(seatbelt)) {
    seatbelt <- defaults$seatbelt
  }
  if (!is.null(seatbelt)) {
    insertFields <- c(insertFields, "seatbelt")
    insertValues <- c(insertValues, seatbelt)
  }

  if (missing(selfhlth)) {
    selfhlth <- defaults$selfhlth
  }
  if (!is.null(selfhlth)) {
    insertFields <- c(insertFields, "selfhlth")
    insertValues <- c(insertValues, selfhlth)
  }

  if (missing(seqnum)) {
    seqnum <- defaults$seqnum
  }
  if (!is.null(seqnum)) {
    insertFields <- c(insertFields, "seqnum")
    insertValues <- c(insertValues, seqnum)
  }

  if (missing(sex)) {
    sex <- defaults$sex
  }
  if (!is.null(sex)) {
    insertFields <- c(insertFields, "sex")
    insertValues <- c(insertValues, sex)
  }

  if (missing(sleep_hr)) {
    sleep_hr <- defaults$sleep_hr
  }
  if (!is.null(sleep_hr)) {
    insertFields <- c(insertFields, "sleep_hr")
    insertValues <- c(insertValues, sleep_hr)
  }

  if (missing(slpapnea)) {
    slpapnea <- defaults$slpapnea
  }
  if (!is.null(slpapnea)) {
    insertFields <- c(insertFields, "slpapnea")
    insertValues <- c(insertValues, slpapnea)
  }

  if (missing(slpprob)) {
    slpprob <- defaults$slpprob
  }
  if (!is.null(slpprob)) {
    insertFields <- c(insertFields, "slpprob")
    insertValues <- c(insertValues, slpprob)
  }

  if (missing(smkdetect)) {
    smkdetect <- defaults$smkdetect
  }
  if (!is.null(smkdetect)) {
    insertFields <- c(insertFields, "smkdetect")
    insertValues <- c(insertValues, smkdetect)
  }

  if (missing(stretch)) {
    stretch <- defaults$stretch
  }
  if (!is.null(stretch)) {
    insertFields <- c(insertFields, "stretch")
    insertValues <- c(insertValues, stretch)
  }

  if (missing(survdate)) {
    survdate <- defaults$survdate
  }
  if (!is.null(survdate)) {
    insertFields <- c(insertFields, "survdate")
    insertValues <- c(insertValues, survdate)
  }

  if (missing(systo_bp)) {
    systo_bp <- defaults$systo_bp
  }
  if (!is.null(systo_bp)) {
    insertFields <- c(insertFields, "systo_bp")
    insertValues <- c(insertValues, systo_bp)
  }

  if (missing(tobcurr)) {
    tobcurr <- defaults$tobcurr
  }
  if (!is.null(tobcurr)) {
    insertFields <- c(insertFields, "tobcurr")
    insertValues <- c(insertValues, tobcurr)
  }

  if (missing(tobprev)) {
    tobprev <- defaults$tobprev
  }
  if (!is.null(tobprev)) {
    insertFields <- c(insertFields, "tobprev")
    insertValues <- c(insertValues, tobprev)
  }

  if (missing(triglycd)) {
    triglycd <- defaults$triglycd
  }
  if (!is.null(triglycd)) {
    insertFields <- c(insertFields, "triglycd")
    insertValues <- c(insertValues, triglycd)
  }

  if (missing(version)) {
    version <- defaults$version
  }
  if (!is.null(version)) {
    insertFields <- c(insertFields, "version")
    insertValues <- c(insertValues, version)
  }

  if (missing(weight)) {
    weight <- defaults$weight
  }
  if (!is.null(weight)) {
    insertFields <- c(insertFields, "weight")
    insertValues <- c(insertValues, weight)
  }

  if (missing(workabs)) {
    workabs <- defaults$workabs
  }
  if (!is.null(workabs)) {
    insertFields <- c(insertFields, "workabs")
    insertValues <- c(insertValues, workabs)
  }

  if (missing(wrkabscat)) {
    wrkabscat <- defaults$wrkabscat
  }
  if (!is.null(wrkabscat)) {
    insertFields <- c(insertFields, "wrkabscat")
    insertValues <- c(insertValues, wrkabscat)
  }

  if (missing(wrkabscat12)) {
    wrkabscat12 <- defaults$wrkabscat12
  }
  if (!is.null(wrkabscat12)) {
    insertFields <- c(insertFields, "wrkabscat12")
    insertValues <- c(insertValues, wrkabscat12)
  }

  if (missing(year)) {
    year <- defaults$year
  }
  if (!is.null(year)) {
    insertFields <- c(insertFields, "year")
    insertValues <- c(insertValues, year)
  }

  statement <- paste0("INSERT INTO @source_schema.health_risk_assessment (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
  invisible(statement);
}

add_hra_question_ref <- function(question_type_id, category_value, category_name) {
  defaults <- frameworkContext$defaultValues$hra_question_ref;
  insertFields <- c()
  insertValues <- c()
  if (missing(question_type_id)) {
    question_type_id <- defaults$question_type_id
  }
  if (!is.null(question_type_id)) {
    insertFields <- c(insertFields, "question_type_id")
    insertValues <- c(insertValues, question_type_id)
  }

  if (missing(category_value)) {
    category_value <- defaults$category_value
  }
  if (!is.null(category_value)) {
    insertFields <- c(insertFields, "category_value")
    insertValues <- c(insertValues, category_value)
  }

  if (missing(category_name)) {
    category_name <- defaults$category_name
  }
  if (!is.null(category_name)) {
    insertFields <- c(insertFields, "category_name")
    insertValues <- c(insertValues, category_name)
  }

  statement <- paste0("INSERT INTO @source_schema.hra_question_ref (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
  invisible(statement);
}

add_hra_variable_ref <- function(variable_name, variable_longname, variable_description, notes, question_type_id) {
  defaults <- frameworkContext$defaultValues$hra_variable_ref;
  insertFields <- c()
  insertValues <- c()
  if (missing(variable_name)) {
    variable_name <- defaults$variable_name
  }
  if (!is.null(variable_name)) {
    insertFields <- c(insertFields, "variable_name")
    insertValues <- c(insertValues, variable_name)
  }

  if (missing(variable_longname)) {
    variable_longname <- defaults$variable_longname
  }
  if (!is.null(variable_longname)) {
    insertFields <- c(insertFields, "variable_longname")
    insertValues <- c(insertValues, variable_longname)
  }

  if (missing(variable_description)) {
    variable_description <- defaults$variable_description
  }
  if (!is.null(variable_description)) {
    insertFields <- c(insertFields, "variable_description")
    insertValues <- c(insertValues, variable_description)
  }

  if (missing(notes)) {
    notes <- defaults$notes
  }
  if (!is.null(notes)) {
    insertFields <- c(insertFields, "notes")
    insertValues <- c(insertValues, notes)
  }

  if (missing(question_type_id)) {
    question_type_id <- defaults$question_type_id
  }
  if (!is.null(question_type_id)) {
    insertFields <- c(insertFields, "question_type_id")
    insertValues <- c(insertValues, question_type_id)
  }

  statement <- paste0("INSERT INTO @source_schema.hra_variable_ref (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
  invisible(statement);
}

add_inpatient_admissions <- function(admdate, admtyp, age, agegrp, caseid, datatyp, days, disdate, dobyr, drg, dstatus, dx1, dx10, dx11, dx12, dx13, dx14, dx15, dx2, dx3, dx4, dx5, dx6, dx7, dx8, dx9, dxver, eeclass, eestatu, efamid, egeoloc, eidflag, emprel, enrflag, enrolid, hlthplan, hospnet, hosppay, indstry, mdc, mhsacovg, msa, pdx, phyflag, physid, physnet, physpay, plankey, plantyp, pproc, proc1, proc10, proc11, proc12, proc13, proc14, proc15, proc2, proc3, proc4, proc5, proc6, proc7, proc8, proc9, region, rx, seqnum, sex, state, totcob, totcoins, totcopay, totded, totnet, totpay, version, wgtkey, year) {
  defaults <- frameworkContext$defaultValues$inpatient_admissions;
  insertFields <- c()
  insertValues <- c()

  if (missing(admdate)) {
    admdate <- defaults$admdate
  }
  if (!is.null(admdate)) {
    insertFields <- c(insertFields, "admdate")
    insertValues <- c(insertValues, admdate)
  }

  if (missing(admtyp)) {
    admtyp <- defaults$admtyp
  }
  if (!is.null(admtyp)) {
    insertFields <- c(insertFields, "admtyp")
    insertValues <- c(insertValues, admtyp)
  }

  if (missing(age)) {
    age <- defaults$age
  }
  if (!is.null(age)) {
    insertFields <- c(insertFields, "age")
    insertValues <- c(insertValues, age)
  }

  if (missing(agegrp)) {
    agegrp <- defaults$agegrp
  }
  if (!is.null(agegrp)) {
    insertFields <- c(insertFields, "agegrp")
    insertValues <- c(insertValues, agegrp)
  }

  if (missing(caseid)) {
    caseid <- defaults$caseid
  }
  if (!is.null(caseid)) {
    insertFields <- c(insertFields, "caseid")
    insertValues <- c(insertValues, caseid)
  }

  if (missing(datatyp)) {
    datatyp <- defaults$datatyp
  }
  if (!is.null(datatyp)) {
    insertFields <- c(insertFields, "datatyp")
    insertValues <- c(insertValues, datatyp)
  }

  if (missing(days)) {
    days <- defaults$days
  }
  if (!is.null(days)) {
    insertFields <- c(insertFields, "days")
    insertValues <- c(insertValues, days)
  }

  if (missing(disdate)) {
    disdate <- defaults$disdate
  }
  if (!is.null(disdate)) {
    insertFields <- c(insertFields, "disdate")
    insertValues <- c(insertValues, disdate)
  }

  if (missing(dobyr)) {
    dobyr <- defaults$dobyr
  }
  if (!is.null(dobyr)) {
    insertFields <- c(insertFields, "dobyr")
    insertValues <- c(insertValues, dobyr)
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

  if (missing(dx1)) {
    dx1 <- defaults$dx1
  }
  if (!is.null(dx1)) {
    insertFields <- c(insertFields, "dx1")
    insertValues <- c(insertValues, dx1)
  }

  if (missing(dx10)) {
    dx10 <- defaults$dx10
  }
  if (!is.null(dx10)) {
    insertFields <- c(insertFields, "dx10")
    insertValues <- c(insertValues, dx10)
  }

  if (missing(dx11)) {
    dx11 <- defaults$dx11
  }
  if (!is.null(dx11)) {
    insertFields <- c(insertFields, "dx11")
    insertValues <- c(insertValues, dx11)
  }

  if (missing(dx12)) {
    dx12 <- defaults$dx12
  }
  if (!is.null(dx12)) {
    insertFields <- c(insertFields, "dx12")
    insertValues <- c(insertValues, dx12)
  }

  if (missing(dx13)) {
    dx13 <- defaults$dx13
  }
  if (!is.null(dx13)) {
    insertFields <- c(insertFields, "dx13")
    insertValues <- c(insertValues, dx13)
  }

  if (missing(dx14)) {
    dx14 <- defaults$dx14
  }
  if (!is.null(dx14)) {
    insertFields <- c(insertFields, "dx14")
    insertValues <- c(insertValues, dx14)
  }

  if (missing(dx15)) {
    dx15 <- defaults$dx15
  }
  if (!is.null(dx15)) {
    insertFields <- c(insertFields, "dx15")
    insertValues <- c(insertValues, dx15)
  }

  if (missing(dx2)) {
    dx2 <- defaults$dx2
  }
  if (!is.null(dx2)) {
    insertFields <- c(insertFields, "dx2")
    insertValues <- c(insertValues, dx2)
  }

  if (missing(dx3)) {
    dx3 <- defaults$dx3
  }
  if (!is.null(dx3)) {
    insertFields <- c(insertFields, "dx3")
    insertValues <- c(insertValues, dx3)
  }

  if (missing(dx4)) {
    dx4 <- defaults$dx4
  }
  if (!is.null(dx4)) {
    insertFields <- c(insertFields, "dx4")
    insertValues <- c(insertValues, dx4)
  }

  if (missing(dx5)) {
    dx5 <- defaults$dx5
  }
  if (!is.null(dx5)) {
    insertFields <- c(insertFields, "dx5")
    insertValues <- c(insertValues, dx5)
  }

  if (missing(dx6)) {
    dx6 <- defaults$dx6
  }
  if (!is.null(dx6)) {
    insertFields <- c(insertFields, "dx6")
    insertValues <- c(insertValues, dx6)
  }

  if (missing(dx7)) {
    dx7 <- defaults$dx7
  }
  if (!is.null(dx7)) {
    insertFields <- c(insertFields, "dx7")
    insertValues <- c(insertValues, dx7)
  }

  if (missing(dx8)) {
    dx8 <- defaults$dx8
  }
  if (!is.null(dx8)) {
    insertFields <- c(insertFields, "dx8")
    insertValues <- c(insertValues, dx8)
  }

  if (missing(dx9)) {
    dx9 <- defaults$dx9
  }
  if (!is.null(dx9)) {
    insertFields <- c(insertFields, "dx9")
    insertValues <- c(insertValues, dx9)
  }

  if (missing(dxver)) {
    dxver <- defaults$dxver
  }
  if (!is.null(dxver)) {
    insertFields <- c(insertFields, "dxver")
    insertValues <- c(insertValues, dxver)
  }

  if (missing(eeclass)) {
    eeclass <- defaults$eeclass
  }
  if (!is.null(eeclass)) {
    insertFields <- c(insertFields, "eeclass")
    insertValues <- c(insertValues, eeclass)
  }

  if (missing(eestatu)) {
    eestatu <- defaults$eestatu
  }
  if (!is.null(eestatu)) {
    insertFields <- c(insertFields, "eestatu")
    insertValues <- c(insertValues, eestatu)
  }

  if (missing(efamid)) {
    efamid <- defaults$efamid
  }
  if (!is.null(efamid)) {
    insertFields <- c(insertFields, "efamid")
    insertValues <- c(insertValues, efamid)
  }

  if (missing(egeoloc)) {
    egeoloc <- defaults$egeoloc
  }
  if (!is.null(egeoloc)) {
    insertFields <- c(insertFields, "egeoloc")
    insertValues <- c(insertValues, egeoloc)
  }

  if (missing(eidflag)) {
    eidflag <- defaults$eidflag
  }
  if (!is.null(eidflag)) {
    insertFields <- c(insertFields, "eidflag")
    insertValues <- c(insertValues, eidflag)
  }

  if (missing(emprel)) {
    emprel <- defaults$emprel
  }
  if (!is.null(emprel)) {
    insertFields <- c(insertFields, "emprel")
    insertValues <- c(insertValues, emprel)
  }

  if (missing(enrflag)) {
    enrflag <- defaults$enrflag
  }
  if (!is.null(enrflag)) {
    insertFields <- c(insertFields, "enrflag")
    insertValues <- c(insertValues, enrflag)
  }

  if (missing(enrolid)) {
    enrolid <- defaults$enrolid
  }
  if (!is.null(enrolid)) {
    insertFields <- c(insertFields, "enrolid")
    insertValues <- c(insertValues, enrolid)
  }

  if (missing(hlthplan)) {
    hlthplan <- defaults$hlthplan
  }
  if (!is.null(hlthplan)) {
    insertFields <- c(insertFields, "hlthplan")
    insertValues <- c(insertValues, hlthplan)
  }

  if (missing(hospnet)) {
    hospnet <- defaults$hospnet
  }
  if (!is.null(hospnet)) {
    insertFields <- c(insertFields, "hospnet")
    insertValues <- c(insertValues, hospnet)
  }

  if (missing(hosppay)) {
    hosppay <- defaults$hosppay
  }
  if (!is.null(hosppay)) {
    insertFields <- c(insertFields, "hosppay")
    insertValues <- c(insertValues, hosppay)
  }

  if (missing(indstry)) {
    indstry <- defaults$indstry
  }
  if (!is.null(indstry)) {
    insertFields <- c(insertFields, "indstry")
    insertValues <- c(insertValues, indstry)
  }

  if (missing(mdc)) {
    mdc <- defaults$mdc
  }
  if (!is.null(mdc)) {
    insertFields <- c(insertFields, "mdc")
    insertValues <- c(insertValues, mdc)
  }

  if (missing(mhsacovg)) {
    mhsacovg <- defaults$mhsacovg
  }
  if (!is.null(mhsacovg)) {
    insertFields <- c(insertFields, "mhsacovg")
    insertValues <- c(insertValues, mhsacovg)
  }

  if (missing(msa)) {
    msa <- defaults$msa
  }
  if (!is.null(msa)) {
    insertFields <- c(insertFields, "msa")
    insertValues <- c(insertValues, msa)
  }

  if (missing(pdx)) {
    pdx <- defaults$pdx
  }
  if (!is.null(pdx)) {
    insertFields <- c(insertFields, "pdx")
    insertValues <- c(insertValues, pdx)
  }

  if (missing(phyflag)) {
    phyflag <- defaults$phyflag
  }
  if (!is.null(phyflag)) {
    insertFields <- c(insertFields, "phyflag")
    insertValues <- c(insertValues, phyflag)
  }

  if (missing(physid)) {
    physid <- defaults$physid
  }
  if (!is.null(physid)) {
    insertFields <- c(insertFields, "physid")
    insertValues <- c(insertValues, physid)
  }

  if (missing(physnet)) {
    physnet <- defaults$physnet
  }
  if (!is.null(physnet)) {
    insertFields <- c(insertFields, "physnet")
    insertValues <- c(insertValues, physnet)
  }

  if (missing(physpay)) {
    physpay <- defaults$physpay
  }
  if (!is.null(physpay)) {
    insertFields <- c(insertFields, "physpay")
    insertValues <- c(insertValues, physpay)
  }

  if (missing(plankey)) {
    plankey <- defaults$plankey
  }
  if (!is.null(plankey)) {
    insertFields <- c(insertFields, "plankey")
    insertValues <- c(insertValues, plankey)
  }

  if (missing(plantyp)) {
    plantyp <- defaults$plantyp
  }
  if (!is.null(plantyp)) {
    insertFields <- c(insertFields, "plantyp")
    insertValues <- c(insertValues, plantyp)
  }

  if (missing(pproc)) {
    pproc <- defaults$pproc
  }
  if (!is.null(pproc)) {
    insertFields <- c(insertFields, "pproc")
    insertValues <- c(insertValues, pproc)
  }

  if (missing(proc1)) {
    proc1 <- defaults$proc1
  }
  if (!is.null(proc1)) {
    insertFields <- c(insertFields, "proc1")
    insertValues <- c(insertValues, proc1)
  }

  if (missing(proc10)) {
    proc10 <- defaults$proc10
  }
  if (!is.null(proc10)) {
    insertFields <- c(insertFields, "proc10")
    insertValues <- c(insertValues, proc10)
  }

  if (missing(proc11)) {
    proc11 <- defaults$proc11
  }
  if (!is.null(proc11)) {
    insertFields <- c(insertFields, "proc11")
    insertValues <- c(insertValues, proc11)
  }

  if (missing(proc12)) {
    proc12 <- defaults$proc12
  }
  if (!is.null(proc12)) {
    insertFields <- c(insertFields, "proc12")
    insertValues <- c(insertValues, proc12)
  }

  if (missing(proc13)) {
    proc13 <- defaults$proc13
  }
  if (!is.null(proc13)) {
    insertFields <- c(insertFields, "proc13")
    insertValues <- c(insertValues, proc13)
  }

  if (missing(proc14)) {
    proc14 <- defaults$proc14
  }
  if (!is.null(proc14)) {
    insertFields <- c(insertFields, "proc14")
    insertValues <- c(insertValues, proc14)
  }

  if (missing(proc15)) {
    proc15 <- defaults$proc15
  }
  if (!is.null(proc15)) {
    insertFields <- c(insertFields, "proc15")
    insertValues <- c(insertValues, proc15)
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

  if (missing(proc6)) {
    proc6 <- defaults$proc6
  }
  if (!is.null(proc6)) {
    insertFields <- c(insertFields, "proc6")
    insertValues <- c(insertValues, proc6)
  }

  if (missing(proc7)) {
    proc7 <- defaults$proc7
  }
  if (!is.null(proc7)) {
    insertFields <- c(insertFields, "proc7")
    insertValues <- c(insertValues, proc7)
  }

  if (missing(proc8)) {
    proc8 <- defaults$proc8
  }
  if (!is.null(proc8)) {
    insertFields <- c(insertFields, "proc8")
    insertValues <- c(insertValues, proc8)
  }

  if (missing(proc9)) {
    proc9 <- defaults$proc9
  }
  if (!is.null(proc9)) {
    insertFields <- c(insertFields, "proc9")
    insertValues <- c(insertValues, proc9)
  }

  if (missing(region)) {
    region <- defaults$region
  }
  if (!is.null(region)) {
    insertFields <- c(insertFields, "region")
    insertValues <- c(insertValues, region)
  }

  if (missing(rx)) {
    rx <- defaults$rx
  }
  if (!is.null(rx)) {
    insertFields <- c(insertFields, "rx")
    insertValues <- c(insertValues, rx)
  }

  if (missing(seqnum)) {
    seqnum <- defaults$seqnum
  }
  if (!is.null(seqnum)) {
    insertFields <- c(insertFields, "seqnum")
    insertValues <- c(insertValues, seqnum)
  }

  if (missing(sex)) {
    sex <- defaults$sex
  }
  if (!is.null(sex)) {
    insertFields <- c(insertFields, "sex")
    insertValues <- c(insertValues, sex)
  }

  if (missing(state)) {
    state <- defaults$state
  }
  if (!is.null(state)) {
    insertFields <- c(insertFields, "state")
    insertValues <- c(insertValues, state)
  }

  if (missing(totcob)) {
    totcob <- defaults$totcob
  }
  if (!is.null(totcob)) {
    insertFields <- c(insertFields, "totcob")
    insertValues <- c(insertValues, totcob)
  }

  if (missing(totcoins)) {
    totcoins <- defaults$totcoins
  }
  if (!is.null(totcoins)) {
    insertFields <- c(insertFields, "totcoins")
    insertValues <- c(insertValues, totcoins)
  }

  if (missing(totcopay)) {
    totcopay <- defaults$totcopay
  }
  if (!is.null(totcopay)) {
    insertFields <- c(insertFields, "totcopay")
    insertValues <- c(insertValues, totcopay)
  }

  if (missing(totded)) {
    totded <- defaults$totded
  }
  if (!is.null(totded)) {
    insertFields <- c(insertFields, "totded")
    insertValues <- c(insertValues, totded)
  }

  if (missing(totnet)) {
    totnet <- defaults$totnet
  }
  if (!is.null(totnet)) {
    insertFields <- c(insertFields, "totnet")
    insertValues <- c(insertValues, totnet)
  }

  if (missing(totpay)) {
    totpay <- defaults$totpay
  }
  if (!is.null(totpay)) {
    insertFields <- c(insertFields, "totpay")
    insertValues <- c(insertValues, totpay)
  }

  if (missing(version)) {
    version <- defaults$version
  }
  if (!is.null(version)) {
    insertFields <- c(insertFields, "version")
    insertValues <- c(insertValues, version)
  }

  if (missing(wgtkey)) {
    wgtkey <- defaults$wgtkey
  }
  if (!is.null(wgtkey)) {
    insertFields <- c(insertFields, "wgtkey")
    insertValues <- c(insertValues, wgtkey)
  }

  if (missing(year)) {
    year <- defaults$year
  }
  if (!is.null(year)) {
    insertFields <- c(insertFields, "year")
    insertValues <- c(insertValues, year)
  }

  statement <- paste0("INSERT INTO @source_schema.inpatient_admissions (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
  invisible(statement);
}

add_inpatient_services <- function(admdate, admtyp, age, agegrp, cap_svc, caseid, cob, coins, copay, datatyp, deduct, disdate, dobyr, drg, dstatus, dx1, dx2, dx3, dx4, dx5, dxver, eeclass, eestatu, efamid, egeoloc, eidflag, emprel, enrflag, enrolid, fachdid, facprof, hlthplan, indstry, mdc, mhsacovg, msa, netpay, ntwkprov, paidntwk, pay, pddate, pdx, phyflag, plankey, plantyp, pproc, proc1, procmod, proctyp, provid, qty, region, revcode, rx, seqnum, sex, stdplac, stdprov, svcdate, svcscat, tsvcdat, version, wgtkey, year, units, npi, msclmid) {
  defaults <- frameworkContext$defaultValues$inpatient_services;
  insertFields <- c()
  insertValues <- c()

  if (missing(admdate)) {
    admdate <- defaults$admdate
  }
  if (!is.null(admdate)) {
    insertFields <- c(insertFields, "admdate")
    insertValues <- c(insertValues, admdate)
  }

  if (missing(admtyp)) {
    admtyp <- defaults$admtyp
  }
  if (!is.null(admtyp)) {
    insertFields <- c(insertFields, "admtyp")
    insertValues <- c(insertValues, admtyp)
  }

  if (missing(age)) {
    age <- defaults$age
  }
  if (!is.null(age)) {
    insertFields <- c(insertFields, "age")
    insertValues <- c(insertValues, age)
  }

  if (missing(agegrp)) {
    agegrp <- defaults$agegrp
  }
  if (!is.null(agegrp)) {
    insertFields <- c(insertFields, "agegrp")
    insertValues <- c(insertValues, agegrp)
  }

  if (missing(cap_svc)) {
    cap_svc <- defaults$cap_svc
  }
  if (!is.null(cap_svc)) {
    insertFields <- c(insertFields, "cap_svc")
    insertValues <- c(insertValues, cap_svc)
  }

  if (missing(caseid)) {
    caseid <- defaults$caseid
  }
  if (!is.null(caseid)) {
    insertFields <- c(insertFields, "caseid")
    insertValues <- c(insertValues, caseid)
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

  if (missing(copay)) {
    copay <- defaults$copay
  }
  if (!is.null(copay)) {
    insertFields <- c(insertFields, "copay")
    insertValues <- c(insertValues, copay)
  }

  if (missing(datatyp)) {
    datatyp <- defaults$datatyp
  }
  if (!is.null(datatyp)) {
    insertFields <- c(insertFields, "datatyp")
    insertValues <- c(insertValues, datatyp)
  }

  if (missing(deduct)) {
    deduct <- defaults$deduct
  }
  if (!is.null(deduct)) {
    insertFields <- c(insertFields, "deduct")
    insertValues <- c(insertValues, deduct)
  }

  if (missing(disdate)) {
    disdate <- defaults$disdate
  }
  if (!is.null(disdate)) {
    insertFields <- c(insertFields, "disdate")
    insertValues <- c(insertValues, disdate)
  }

  if (missing(dobyr)) {
    dobyr <- defaults$dobyr
  }
  if (!is.null(dobyr)) {
    insertFields <- c(insertFields, "dobyr")
    insertValues <- c(insertValues, dobyr)
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

  if (missing(dx1)) {
    dx1 <- defaults$dx1
  }
  if (!is.null(dx1)) {
    insertFields <- c(insertFields, "dx1")
    insertValues <- c(insertValues, dx1)
  }

  if (missing(dx2)) {
    dx2 <- defaults$dx2
  }
  if (!is.null(dx2)) {
    insertFields <- c(insertFields, "dx2")
    insertValues <- c(insertValues, dx2)
  }

  if (missing(dx3)) {
    dx3 <- defaults$dx3
  }
  if (!is.null(dx3)) {
    insertFields <- c(insertFields, "dx3")
    insertValues <- c(insertValues, dx3)
  }

  if (missing(dx4)) {
    dx4 <- defaults$dx4
  }
  if (!is.null(dx4)) {
    insertFields <- c(insertFields, "dx4")
    insertValues <- c(insertValues, dx4)
  }

  if (missing(dx5)) {
    dx5 <- defaults$dx5
  }
  if (!is.null(dx5)) {
    insertFields <- c(insertFields, "dx5")
    insertValues <- c(insertValues, dx5)
  }

  if (missing(dxver)) {
    dxver <- defaults$dxver
  }
  if (!is.null(dxver)) {
    insertFields <- c(insertFields, "dxver")
    insertValues <- c(insertValues, dxver)
  }

  if (missing(eeclass)) {
    eeclass <- defaults$eeclass
  }
  if (!is.null(eeclass)) {
    insertFields <- c(insertFields, "eeclass")
    insertValues <- c(insertValues, eeclass)
  }

  if (missing(eestatu)) {
    eestatu <- defaults$eestatu
  }
  if (!is.null(eestatu)) {
    insertFields <- c(insertFields, "eestatu")
    insertValues <- c(insertValues, eestatu)
  }

  if (missing(efamid)) {
    efamid <- defaults$efamid
  }
  if (!is.null(efamid)) {
    insertFields <- c(insertFields, "efamid")
    insertValues <- c(insertValues, efamid)
  }

  if (missing(egeoloc)) {
    egeoloc <- defaults$egeoloc
  }
  if (!is.null(egeoloc)) {
    insertFields <- c(insertFields, "egeoloc")
    insertValues <- c(insertValues, egeoloc)
  }

  if (missing(eidflag)) {
    eidflag <- defaults$eidflag
  }
  if (!is.null(eidflag)) {
    insertFields <- c(insertFields, "eidflag")
    insertValues <- c(insertValues, eidflag)
  }

  if (missing(emprel)) {
    emprel <- defaults$emprel
  }
  if (!is.null(emprel)) {
    insertFields <- c(insertFields, "emprel")
    insertValues <- c(insertValues, emprel)
  }

  if (missing(enrflag)) {
    enrflag <- defaults$enrflag
  }
  if (!is.null(enrflag)) {
    insertFields <- c(insertFields, "enrflag")
    insertValues <- c(insertValues, enrflag)
  }

  if (missing(enrolid)) {
    enrolid <- defaults$enrolid
  }
  if (!is.null(enrolid)) {
    insertFields <- c(insertFields, "enrolid")
    insertValues <- c(insertValues, enrolid)
  }

  if (missing(fachdid)) {
    fachdid <- defaults$fachdid
  }
  if (!is.null(fachdid)) {
    insertFields <- c(insertFields, "fachdid")
    insertValues <- c(insertValues, fachdid)
  }

  if (missing(facprof)) {
    facprof <- defaults$facprof
  }
  if (!is.null(facprof)) {
    insertFields <- c(insertFields, "facprof")
    insertValues <- c(insertValues, facprof)
  }

  if (missing(hlthplan)) {
    hlthplan <- defaults$hlthplan
  }
  if (!is.null(hlthplan)) {
    insertFields <- c(insertFields, "hlthplan")
    insertValues <- c(insertValues, hlthplan)
  }

  if (missing(indstry)) {
    indstry <- defaults$indstry
  }
  if (!is.null(indstry)) {
    insertFields <- c(insertFields, "indstry")
    insertValues <- c(insertValues, indstry)
  }

  if (missing(mdc)) {
    mdc <- defaults$mdc
  }
  if (!is.null(mdc)) {
    insertFields <- c(insertFields, "mdc")
    insertValues <- c(insertValues, mdc)
  }

  if (missing(mhsacovg)) {
    mhsacovg <- defaults$mhsacovg
  }
  if (!is.null(mhsacovg)) {
    insertFields <- c(insertFields, "mhsacovg")
    insertValues <- c(insertValues, mhsacovg)
  }

  if (missing(msa)) {
    msa <- defaults$msa
  }
  if (!is.null(msa)) {
    insertFields <- c(insertFields, "msa")
    insertValues <- c(insertValues, msa)
  }

  if (missing(netpay)) {
    netpay <- defaults$netpay
  }
  if (!is.null(netpay)) {
    insertFields <- c(insertFields, "netpay")
    insertValues <- c(insertValues, netpay)
  }

  if (missing(ntwkprov)) {
    ntwkprov <- defaults$ntwkprov
  }
  if (!is.null(ntwkprov)) {
    insertFields <- c(insertFields, "ntwkprov")
    insertValues <- c(insertValues, ntwkprov)
  }

  if (missing(paidntwk)) {
    paidntwk <- defaults$paidntwk
  }
  if (!is.null(paidntwk)) {
    insertFields <- c(insertFields, "paidntwk")
    insertValues <- c(insertValues, paidntwk)
  }

  if (missing(pay)) {
    pay <- defaults$pay
  }
  if (!is.null(pay)) {
    insertFields <- c(insertFields, "pay")
    insertValues <- c(insertValues, pay)
  }

  if (missing(pddate)) {
    pddate <- defaults$pddate
  }
  if (!is.null(pddate)) {
    insertFields <- c(insertFields, "pddate")
    insertValues <- c(insertValues, pddate)
  }

  if (missing(pdx)) {
    pdx <- defaults$pdx
  }
  if (!is.null(pdx)) {
    insertFields <- c(insertFields, "pdx")
    insertValues <- c(insertValues, pdx)
  }

  if (missing(phyflag)) {
    phyflag <- defaults$phyflag
  }
  if (!is.null(phyflag)) {
    insertFields <- c(insertFields, "phyflag")
    insertValues <- c(insertValues, phyflag)
  }

  if (missing(plankey)) {
    plankey <- defaults$plankey
  }
  if (!is.null(plankey)) {
    insertFields <- c(insertFields, "plankey")
    insertValues <- c(insertValues, plankey)
  }

  if (missing(plantyp)) {
    plantyp <- defaults$plantyp
  }
  if (!is.null(plantyp)) {
    insertFields <- c(insertFields, "plantyp")
    insertValues <- c(insertValues, plantyp)
  }

  if (missing(pproc)) {
    pproc <- defaults$pproc
  }
  if (!is.null(pproc)) {
    insertFields <- c(insertFields, "pproc")
    insertValues <- c(insertValues, pproc)
  }

  if (missing(proc1)) {
    proc1 <- defaults$proc1
  }
  if (!is.null(proc1)) {
    insertFields <- c(insertFields, "proc1")
    insertValues <- c(insertValues, proc1)
  }

  if (missing(procmod)) {
    procmod <- defaults$procmod
  }
  if (!is.null(procmod)) {
    insertFields <- c(insertFields, "procmod")
    insertValues <- c(insertValues, procmod)
  }

  if (missing(proctyp)) {
    proctyp <- defaults$proctyp
  }
  if (!is.null(proctyp)) {
    insertFields <- c(insertFields, "proctyp")
    insertValues <- c(insertValues, proctyp)
  }

  if (missing(provid)) {
    provid <- defaults$provid
  }
  if (!is.null(provid)) {
    insertFields <- c(insertFields, "provid")
    insertValues <- c(insertValues, provid)
  }

  if (missing(qty)) {
    qty <- defaults$qty
  }
  if (!is.null(qty)) {
    insertFields <- c(insertFields, "qty")
    insertValues <- c(insertValues, qty)
  }

  if (missing(region)) {
    region <- defaults$region
  }
  if (!is.null(region)) {
    insertFields <- c(insertFields, "region")
    insertValues <- c(insertValues, region)
  }

  if (missing(revcode)) {
    revcode <- defaults$revcode
  }
  if (!is.null(revcode)) {
    insertFields <- c(insertFields, "revcode")
    insertValues <- c(insertValues, revcode)
  }

  if (missing(rx)) {
    rx <- defaults$rx
  }
  if (!is.null(rx)) {
    insertFields <- c(insertFields, "rx")
    insertValues <- c(insertValues, rx)
  }

  if (missing(seqnum)) {
    seqnum <- defaults$seqnum
  }
  if (!is.null(seqnum)) {
    insertFields <- c(insertFields, "seqnum")
    insertValues <- c(insertValues, seqnum)
  }

  if (missing(sex)) {
    sex <- defaults$sex
  }
  if (!is.null(sex)) {
    insertFields <- c(insertFields, "sex")
    insertValues <- c(insertValues, sex)
  }

  if (missing(stdplac)) {
    stdplac <- defaults$stdplac
  }
  if (!is.null(stdplac)) {
    insertFields <- c(insertFields, "stdplac")
    insertValues <- c(insertValues, stdplac)
  }

  if (missing(stdprov)) {
    stdprov <- defaults$stdprov
  }
  if (!is.null(stdprov)) {
    insertFields <- c(insertFields, "stdprov")
    insertValues <- c(insertValues, stdprov)
  }

  if (missing(svcdate)) {
    svcdate <- defaults$svcdate
  }
  if (!is.null(svcdate)) {
    insertFields <- c(insertFields, "svcdate")
    insertValues <- c(insertValues, svcdate)
  }

  if (missing(svcscat)) {
    svcscat <- defaults$svcscat
  }
  if (!is.null(svcscat)) {
    insertFields <- c(insertFields, "svcscat")
    insertValues <- c(insertValues, svcscat)
  }

  if (missing(tsvcdat)) {
    tsvcdat <- defaults$tsvcdat
  }
  if (!is.null(tsvcdat)) {
    insertFields <- c(insertFields, "tsvcdat")
    insertValues <- c(insertValues, tsvcdat)
  }

  if (missing(version)) {
    version <- defaults$version
  }
  if (!is.null(version)) {
    insertFields <- c(insertFields, "version")
    insertValues <- c(insertValues, version)
  }

  if (missing(wgtkey)) {
    wgtkey <- defaults$wgtkey
  }
  if (!is.null(wgtkey)) {
    insertFields <- c(insertFields, "wgtkey")
    insertValues <- c(insertValues, wgtkey)
  }

  if (missing(year)) {
    year <- defaults$year
  }
  if (!is.null(year)) {
    insertFields <- c(insertFields, "year")
    insertValues <- c(insertValues, year)
  }

  if (missing(units)) {
    units <- defaults$units
  }
  if (!is.null(units)) {
    insertFields <- c(insertFields, "units")
    insertValues <- c(insertValues, units)
  }

  if (missing(npi)) {
    npi <- defaults$npi
  }
  if (!is.null(npi)) {
    insertFields <- c(insertFields, "npi")
    insertValues <- c(insertValues, npi)
  }

  if (missing(msclmid)) {
    msclmid <- defaults$msclmid
  }
  if (!is.null(msclmid)) {
    insertFields <- c(insertFields, "msclmid")
    insertValues <- c(insertValues, msclmid)
  }

  statement <- paste0("INSERT INTO @source_schema.inpatient_services (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
  invisible(statement);
}

add_lab <- function(enrolid, seqnum, abnormal, agegrp, eeclass, eestatu, eidflag, emprel, enrflag, hlthplan, indstry, mhsacovg, phyflag, proctyp, region, rx, sex, egeoloc, mdc, version, resltcat, dx1, proc1, pddate, svcdate, msa, orderid, provid, refhigh, reflow, result, testcnt, dobyr, plankey, stdprov, wgtkey, year, age, datatyp, plantyp, stdplac, loinccd, resunit, efamid, dxver) {
  defaults <- frameworkContext$defaultValues$lab;
  insertFields <- c()
  insertValues <- c()
  if (missing(enrolid)) {
    enrolid <- defaults$enrolid
  }
  if (!is.null(enrolid)) {
    insertFields <- c(insertFields, "enrolid")
    insertValues <- c(insertValues, enrolid)
  }

  if (missing(seqnum)) {
    seqnum <- defaults$seqnum
  }
  if (!is.null(seqnum)) {
    insertFields <- c(insertFields, "seqnum")
    insertValues <- c(insertValues, seqnum)
  }

  if (missing(abnormal)) {
    abnormal <- defaults$abnormal
  }
  if (!is.null(abnormal)) {
    insertFields <- c(insertFields, "abnormal")
    insertValues <- c(insertValues, abnormal)
  }

  if (missing(agegrp)) {
    agegrp <- defaults$agegrp
  }
  if (!is.null(agegrp)) {
    insertFields <- c(insertFields, "agegrp")
    insertValues <- c(insertValues, agegrp)
  }

  if (missing(eeclass)) {
    eeclass <- defaults$eeclass
  }
  if (!is.null(eeclass)) {
    insertFields <- c(insertFields, "eeclass")
    insertValues <- c(insertValues, eeclass)
  }

  if (missing(eestatu)) {
    eestatu <- defaults$eestatu
  }
  if (!is.null(eestatu)) {
    insertFields <- c(insertFields, "eestatu")
    insertValues <- c(insertValues, eestatu)
  }

  if (missing(eidflag)) {
    eidflag <- defaults$eidflag
  }
  if (!is.null(eidflag)) {
    insertFields <- c(insertFields, "eidflag")
    insertValues <- c(insertValues, eidflag)
  }

  if (missing(emprel)) {
    emprel <- defaults$emprel
  }
  if (!is.null(emprel)) {
    insertFields <- c(insertFields, "emprel")
    insertValues <- c(insertValues, emprel)
  }

  if (missing(enrflag)) {
    enrflag <- defaults$enrflag
  }
  if (!is.null(enrflag)) {
    insertFields <- c(insertFields, "enrflag")
    insertValues <- c(insertValues, enrflag)
  }

  if (missing(hlthplan)) {
    hlthplan <- defaults$hlthplan
  }
  if (!is.null(hlthplan)) {
    insertFields <- c(insertFields, "hlthplan")
    insertValues <- c(insertValues, hlthplan)
  }

  if (missing(indstry)) {
    indstry <- defaults$indstry
  }
  if (!is.null(indstry)) {
    insertFields <- c(insertFields, "indstry")
    insertValues <- c(insertValues, indstry)
  }

  if (missing(mhsacovg)) {
    mhsacovg <- defaults$mhsacovg
  }
  if (!is.null(mhsacovg)) {
    insertFields <- c(insertFields, "mhsacovg")
    insertValues <- c(insertValues, mhsacovg)
  }

  if (missing(phyflag)) {
    phyflag <- defaults$phyflag
  }
  if (!is.null(phyflag)) {
    insertFields <- c(insertFields, "phyflag")
    insertValues <- c(insertValues, phyflag)
  }

  if (missing(proctyp)) {
    proctyp <- defaults$proctyp
  }
  if (!is.null(proctyp)) {
    insertFields <- c(insertFields, "proctyp")
    insertValues <- c(insertValues, proctyp)
  }

  if (missing(region)) {
    region <- defaults$region
  }
  if (!is.null(region)) {
    insertFields <- c(insertFields, "region")
    insertValues <- c(insertValues, region)
  }

  if (missing(rx)) {
    rx <- defaults$rx
  }
  if (!is.null(rx)) {
    insertFields <- c(insertFields, "rx")
    insertValues <- c(insertValues, rx)
  }

  if (missing(sex)) {
    sex <- defaults$sex
  }
  if (!is.null(sex)) {
    insertFields <- c(insertFields, "sex")
    insertValues <- c(insertValues, sex)
  }

  if (missing(egeoloc)) {
    egeoloc <- defaults$egeoloc
  }
  if (!is.null(egeoloc)) {
    insertFields <- c(insertFields, "egeoloc")
    insertValues <- c(insertValues, egeoloc)
  }

  if (missing(mdc)) {
    mdc <- defaults$mdc
  }
  if (!is.null(mdc)) {
    insertFields <- c(insertFields, "mdc")
    insertValues <- c(insertValues, mdc)
  }

  if (missing(version)) {
    version <- defaults$version
  }
  if (!is.null(version)) {
    insertFields <- c(insertFields, "version")
    insertValues <- c(insertValues, version)
  }

  if (missing(resltcat)) {
    resltcat <- defaults$resltcat
  }
  if (!is.null(resltcat)) {
    insertFields <- c(insertFields, "resltcat")
    insertValues <- c(insertValues, resltcat)
  }

  if (missing(dx1)) {
    dx1 <- defaults$dx1
  }
  if (!is.null(dx1)) {
    insertFields <- c(insertFields, "dx1")
    insertValues <- c(insertValues, dx1)
  }

  if (missing(proc1)) {
    proc1 <- defaults$proc1
  }
  if (!is.null(proc1)) {
    insertFields <- c(insertFields, "proc1")
    insertValues <- c(insertValues, proc1)
  }

  if (missing(pddate)) {
    pddate <- defaults$pddate
  }
  if (!is.null(pddate)) {
    insertFields <- c(insertFields, "pddate")
    insertValues <- c(insertValues, pddate)
  }

  if (missing(svcdate)) {
    svcdate <- defaults$svcdate
  }
  if (!is.null(svcdate)) {
    insertFields <- c(insertFields, "svcdate")
    insertValues <- c(insertValues, svcdate)
  }

  if (missing(msa)) {
    msa <- defaults$msa
  }
  if (!is.null(msa)) {
    insertFields <- c(insertFields, "msa")
    insertValues <- c(insertValues, msa)
  }

  if (missing(orderid)) {
    orderid <- defaults$orderid
  }
  if (!is.null(orderid)) {
    insertFields <- c(insertFields, "orderid")
    insertValues <- c(insertValues, orderid)
  }

  if (missing(provid)) {
    provid <- defaults$provid
  }
  if (!is.null(provid)) {
    insertFields <- c(insertFields, "provid")
    insertValues <- c(insertValues, provid)
  }

  if (missing(refhigh)) {
    refhigh <- defaults$refhigh
  }
  if (!is.null(refhigh)) {
    insertFields <- c(insertFields, "refhigh")
    insertValues <- c(insertValues, refhigh)
  }

  if (missing(reflow)) {
    reflow <- defaults$reflow
  }
  if (!is.null(reflow)) {
    insertFields <- c(insertFields, "reflow")
    insertValues <- c(insertValues, reflow)
  }

  if (missing(result)) {
    result <- defaults$result
  }
  if (!is.null(result)) {
    insertFields <- c(insertFields, "result")
    insertValues <- c(insertValues, result)
  }

  if (missing(testcnt)) {
    testcnt <- defaults$testcnt
  }
  if (!is.null(testcnt)) {
    insertFields <- c(insertFields, "testcnt")
    insertValues <- c(insertValues, testcnt)
  }

  if (missing(dobyr)) {
    dobyr <- defaults$dobyr
  }
  if (!is.null(dobyr)) {
    insertFields <- c(insertFields, "dobyr")
    insertValues <- c(insertValues, dobyr)
  }

  if (missing(plankey)) {
    plankey <- defaults$plankey
  }
  if (!is.null(plankey)) {
    insertFields <- c(insertFields, "plankey")
    insertValues <- c(insertValues, plankey)
  }

  if (missing(stdprov)) {
    stdprov <- defaults$stdprov
  }
  if (!is.null(stdprov)) {
    insertFields <- c(insertFields, "stdprov")
    insertValues <- c(insertValues, stdprov)
  }

  if (missing(wgtkey)) {
    wgtkey <- defaults$wgtkey
  }
  if (!is.null(wgtkey)) {
    insertFields <- c(insertFields, "wgtkey")
    insertValues <- c(insertValues, wgtkey)
  }

  if (missing(year)) {
    year <- defaults$year
  }
  if (!is.null(year)) {
    insertFields <- c(insertFields, "year")
    insertValues <- c(insertValues, year)
  }

  if (missing(age)) {
    age <- defaults$age
  }
  if (!is.null(age)) {
    insertFields <- c(insertFields, "age")
    insertValues <- c(insertValues, age)
  }

  if (missing(datatyp)) {
    datatyp <- defaults$datatyp
  }
  if (!is.null(datatyp)) {
    insertFields <- c(insertFields, "datatyp")
    insertValues <- c(insertValues, datatyp)
  }

  if (missing(plantyp)) {
    plantyp <- defaults$plantyp
  }
  if (!is.null(plantyp)) {
    insertFields <- c(insertFields, "plantyp")
    insertValues <- c(insertValues, plantyp)
  }

  if (missing(stdplac)) {
    stdplac <- defaults$stdplac
  }
  if (!is.null(stdplac)) {
    insertFields <- c(insertFields, "stdplac")
    insertValues <- c(insertValues, stdplac)
  }

  if (missing(loinccd)) {
    loinccd <- defaults$loinccd
  }
  if (!is.null(loinccd)) {
    insertFields <- c(insertFields, "loinccd")
    insertValues <- c(insertValues, loinccd)
  }

  if (missing(resunit)) {
    resunit <- defaults$resunit
  }
  if (!is.null(resunit)) {
    insertFields <- c(insertFields, "resunit")
    insertValues <- c(insertValues, resunit)
  }

  if (missing(efamid)) {
    efamid <- defaults$efamid
  }
  if (!is.null(efamid)) {
    insertFields <- c(insertFields, "efamid")
    insertValues <- c(insertValues, efamid)
  }

  if (missing(dxver)) {
    dxver <- defaults$dxver
  }
  if (!is.null(dxver)) {
    insertFields <- c(insertFields, "dxver")
    insertValues <- c(insertValues, dxver)
  }

  statement <- paste0("INSERT INTO @source_schema.lab (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
  invisible(statement);
}

add_outpatient_services <- function(age, agegrp, cap_svc, cob, coins, copay, datatyp, deduct, dobyr, dx1, dx2, dx3, dx4, dx5, dxver, eeclass, eestatu, efamid, egeoloc, eidflag, emprel, enrflag, enrolid, fachdid, facprof, hlthplan, indstry, mdc, mhsacovg, msa, netpay, ntwkprov, paidntwk, pay, pddate, phyflag, plankey, plantyp, proc1, procgrp, procmod, proctyp, provid, qty, region, revcode, rx, seqnum, sex, stdplac, stdprov, svcdate, svcscat, tsvcdat, version, wgtkey, year, units, npi, msclmid) {
  defaults <- frameworkContext$defaultValues$outpatient_services;
  insertFields <- c()
  insertValues <- c()
  
  if (missing(age)) {
    age <- defaults$age
  }
  if (!is.null(age)) {
    insertFields <- c(insertFields, "age")
    insertValues <- c(insertValues, age)
  }

  if (missing(agegrp)) {
    agegrp <- defaults$agegrp
  }
  if (!is.null(agegrp)) {
    insertFields <- c(insertFields, "agegrp")
    insertValues <- c(insertValues, agegrp)
  }

  if (missing(cap_svc)) {
    cap_svc <- defaults$cap_svc
  }
  if (!is.null(cap_svc)) {
    insertFields <- c(insertFields, "cap_svc")
    insertValues <- c(insertValues, cap_svc)
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

  if (missing(copay)) {
    copay <- defaults$copay
  }
  if (!is.null(copay)) {
    insertFields <- c(insertFields, "copay")
    insertValues <- c(insertValues, copay)
  }

  if (missing(datatyp)) {
    datatyp <- defaults$datatyp
  }
  if (!is.null(datatyp)) {
    insertFields <- c(insertFields, "datatyp")
    insertValues <- c(insertValues, datatyp)
  }

  if (missing(deduct)) {
    deduct <- defaults$deduct
  }
  if (!is.null(deduct)) {
    insertFields <- c(insertFields, "deduct")
    insertValues <- c(insertValues, deduct)
  }

  if (missing(dobyr)) {
    dobyr <- defaults$dobyr
  }
  if (!is.null(dobyr)) {
    insertFields <- c(insertFields, "dobyr")
    insertValues <- c(insertValues, dobyr)
  }

  if (missing(dx1)) {
    dx1 <- defaults$dx1
  }
  if (!is.null(dx1)) {
    insertFields <- c(insertFields, "dx1")
    insertValues <- c(insertValues, dx1)
  }

  if (missing(dx2)) {
    dx2 <- defaults$dx2
  }
  if (!is.null(dx2)) {
    insertFields <- c(insertFields, "dx2")
    insertValues <- c(insertValues, dx2)
  }

  if (missing(dx3)) {
    dx3 <- defaults$dx3
  }
  if (!is.null(dx3)) {
    insertFields <- c(insertFields, "dx3")
    insertValues <- c(insertValues, dx3)
  }

  if (missing(dx4)) {
    dx4 <- defaults$dx4
  }
  if (!is.null(dx4)) {
    insertFields <- c(insertFields, "dx4")
    insertValues <- c(insertValues, dx4)
  }

  if (missing(dx5)) {
    dx5 <- defaults$dx5
  }
  if (!is.null(dx5)) {
    insertFields <- c(insertFields, "dx5")
    insertValues <- c(insertValues, dx5)
  }

  if (missing(dxver)) {
    dxver <- defaults$dxver
  }
  if (!is.null(dxver)) {
    insertFields <- c(insertFields, "dxver")
    insertValues <- c(insertValues, dxver)
  }

  if (missing(eeclass)) {
    eeclass <- defaults$eeclass
  }
  if (!is.null(eeclass)) {
    insertFields <- c(insertFields, "eeclass")
    insertValues <- c(insertValues, eeclass)
  }

  if (missing(eestatu)) {
    eestatu <- defaults$eestatu
  }
  if (!is.null(eestatu)) {
    insertFields <- c(insertFields, "eestatu")
    insertValues <- c(insertValues, eestatu)
  }

  if (missing(efamid)) {
    efamid <- defaults$efamid
  }
  if (!is.null(efamid)) {
    insertFields <- c(insertFields, "efamid")
    insertValues <- c(insertValues, efamid)
  }

  if (missing(egeoloc)) {
    egeoloc <- defaults$egeoloc
  }
  if (!is.null(egeoloc)) {
    insertFields <- c(insertFields, "egeoloc")
    insertValues <- c(insertValues, egeoloc)
  }

  if (missing(eidflag)) {
    eidflag <- defaults$eidflag
  }
  if (!is.null(eidflag)) {
    insertFields <- c(insertFields, "eidflag")
    insertValues <- c(insertValues, eidflag)
  }

  if (missing(emprel)) {
    emprel <- defaults$emprel
  }
  if (!is.null(emprel)) {
    insertFields <- c(insertFields, "emprel")
    insertValues <- c(insertValues, emprel)
  }

  if (missing(enrflag)) {
    enrflag <- defaults$enrflag
  }
  if (!is.null(enrflag)) {
    insertFields <- c(insertFields, "enrflag")
    insertValues <- c(insertValues, enrflag)
  }

  if (missing(enrolid)) {
    enrolid <- defaults$enrolid
  }
  if (!is.null(enrolid)) {
    insertFields <- c(insertFields, "enrolid")
    insertValues <- c(insertValues, enrolid)
  }

  if (missing(fachdid)) {
    fachdid <- defaults$fachdid
  }
  if (!is.null(fachdid)) {
    insertFields <- c(insertFields, "fachdid")
    insertValues <- c(insertValues, fachdid)
  }

  if (missing(facprof)) {
    facprof <- defaults$facprof
  }
  if (!is.null(facprof)) {
    insertFields <- c(insertFields, "facprof")
    insertValues <- c(insertValues, facprof)
  }

  if (missing(hlthplan)) {
    hlthplan <- defaults$hlthplan
  }
  if (!is.null(hlthplan)) {
    insertFields <- c(insertFields, "hlthplan")
    insertValues <- c(insertValues, hlthplan)
  }

  if (missing(indstry)) {
    indstry <- defaults$indstry
  }
  if (!is.null(indstry)) {
    insertFields <- c(insertFields, "indstry")
    insertValues <- c(insertValues, indstry)
  }

  if (missing(mdc)) {
    mdc <- defaults$mdc
  }
  if (!is.null(mdc)) {
    insertFields <- c(insertFields, "mdc")
    insertValues <- c(insertValues, mdc)
  }

  if (missing(mhsacovg)) {
    mhsacovg <- defaults$mhsacovg
  }
  if (!is.null(mhsacovg)) {
    insertFields <- c(insertFields, "mhsacovg")
    insertValues <- c(insertValues, mhsacovg)
  }

  if (missing(msa)) {
    msa <- defaults$msa
  }
  if (!is.null(msa)) {
    insertFields <- c(insertFields, "msa")
    insertValues <- c(insertValues, msa)
  }

  if (missing(netpay)) {
    netpay <- defaults$netpay
  }
  if (!is.null(netpay)) {
    insertFields <- c(insertFields, "netpay")
    insertValues <- c(insertValues, netpay)
  }

  if (missing(ntwkprov)) {
    ntwkprov <- defaults$ntwkprov
  }
  if (!is.null(ntwkprov)) {
    insertFields <- c(insertFields, "ntwkprov")
    insertValues <- c(insertValues, ntwkprov)
  }

  if (missing(paidntwk)) {
    paidntwk <- defaults$paidntwk
  }
  if (!is.null(paidntwk)) {
    insertFields <- c(insertFields, "paidntwk")
    insertValues <- c(insertValues, paidntwk)
  }

  if (missing(pay)) {
    pay <- defaults$pay
  }
  if (!is.null(pay)) {
    insertFields <- c(insertFields, "pay")
    insertValues <- c(insertValues, pay)
  }

  if (missing(pddate)) {
    pddate <- defaults$pddate
  }
  if (!is.null(pddate)) {
    insertFields <- c(insertFields, "pddate")
    insertValues <- c(insertValues, pddate)
  }

  if (missing(phyflag)) {
    phyflag <- defaults$phyflag
  }
  if (!is.null(phyflag)) {
    insertFields <- c(insertFields, "phyflag")
    insertValues <- c(insertValues, phyflag)
  }

  if (missing(plankey)) {
    plankey <- defaults$plankey
  }
  if (!is.null(plankey)) {
    insertFields <- c(insertFields, "plankey")
    insertValues <- c(insertValues, plankey)
  }

  if (missing(plantyp)) {
    plantyp <- defaults$plantyp
  }
  if (!is.null(plantyp)) {
    insertFields <- c(insertFields, "plantyp")
    insertValues <- c(insertValues, plantyp)
  }

  if (missing(proc1)) {
    proc1 <- defaults$proc1
  }
  if (!is.null(proc1)) {
    insertFields <- c(insertFields, "proc1")
    insertValues <- c(insertValues, proc1)
  }

  if (missing(procgrp)) {
    procgrp <- defaults$procgrp
  }
  if (!is.null(procgrp)) {
    insertFields <- c(insertFields, "procgrp")
    insertValues <- c(insertValues, procgrp)
  }

  if (missing(procmod)) {
    procmod <- defaults$procmod
  }
  if (!is.null(procmod)) {
    insertFields <- c(insertFields, "procmod")
    insertValues <- c(insertValues, procmod)
  }

  if (missing(proctyp)) {
    proctyp <- defaults$proctyp
  }
  if (!is.null(proctyp)) {
    insertFields <- c(insertFields, "proctyp")
    insertValues <- c(insertValues, proctyp)
  }

  if (missing(provid)) {
    provid <- defaults$provid
  }
  if (!is.null(provid)) {
    insertFields <- c(insertFields, "provid")
    insertValues <- c(insertValues, provid)
  }

  if (missing(qty)) {
    qty <- defaults$qty
  }
  if (!is.null(qty)) {
    insertFields <- c(insertFields, "qty")
    insertValues <- c(insertValues, qty)
  }

  if (missing(region)) {
    region <- defaults$region
  }
  if (!is.null(region)) {
    insertFields <- c(insertFields, "region")
    insertValues <- c(insertValues, region)
  }

  if (missing(revcode)) {
    revcode <- defaults$revcode
  }
  if (!is.null(revcode)) {
    insertFields <- c(insertFields, "revcode")
    insertValues <- c(insertValues, revcode)
  }

  if (missing(rx)) {
    rx <- defaults$rx
  }
  if (!is.null(rx)) {
    insertFields <- c(insertFields, "rx")
    insertValues <- c(insertValues, rx)
  }

  if (missing(seqnum)) {
    seqnum <- defaults$seqnum
  }
  if (!is.null(seqnum)) {
    insertFields <- c(insertFields, "seqnum")
    insertValues <- c(insertValues, seqnum)
  }

  if (missing(sex)) {
    sex <- defaults$sex
  }
  if (!is.null(sex)) {
    insertFields <- c(insertFields, "sex")
    insertValues <- c(insertValues, sex)
  }

  if (missing(stdplac)) {
    stdplac <- defaults$stdplac
  }
  if (!is.null(stdplac)) {
    insertFields <- c(insertFields, "stdplac")
    insertValues <- c(insertValues, stdplac)
  }

  if (missing(stdprov)) {
    stdprov <- defaults$stdprov
  }
  if (!is.null(stdprov)) {
    insertFields <- c(insertFields, "stdprov")
    insertValues <- c(insertValues, stdprov)
  }

  if (missing(svcdate)) {
    svcdate <- defaults$svcdate
  }
  if (!is.null(svcdate)) {
    insertFields <- c(insertFields, "svcdate")
    insertValues <- c(insertValues, svcdate)
  }

  if (missing(svcscat)) {
    svcscat <- defaults$svcscat
  }
  if (!is.null(svcscat)) {
    insertFields <- c(insertFields, "svcscat")
    insertValues <- c(insertValues, svcscat)
  }

  if (missing(tsvcdat)) {
    tsvcdat <- defaults$tsvcdat
  }
  if (!is.null(tsvcdat)) {
    insertFields <- c(insertFields, "tsvcdat")
    insertValues <- c(insertValues, tsvcdat)
  }

  if (missing(version)) {
    version <- defaults$version
  }
  if (!is.null(version)) {
    insertFields <- c(insertFields, "version")
    insertValues <- c(insertValues, version)
  }

  if (missing(wgtkey)) {
    wgtkey <- defaults$wgtkey
  }
  if (!is.null(wgtkey)) {
    insertFields <- c(insertFields, "wgtkey")
    insertValues <- c(insertValues, wgtkey)
  }

  if (missing(year)) {
    year <- defaults$year
  }
  if (!is.null(year)) {
    insertFields <- c(insertFields, "year")
    insertValues <- c(insertValues, year)
  }

  if (missing(units)) {
    units <- defaults$units
  }
  if (!is.null(units)) {
    insertFields <- c(insertFields, "units")
    insertValues <- c(insertValues, units)
  }

  if (missing(npi)) {
    npi <- defaults$npi
  }
  if (!is.null(npi)) {
    insertFields <- c(insertFields, "npi")
    insertValues <- c(insertValues, npi)
  }

  if (missing(msclmid)) {
    msclmid <- defaults$msclmid
  }
  if (!is.null(msclmid)) {
    insertFields <- c(insertFields, "msclmid")
    insertValues <- c(insertValues, msclmid)
  }

  statement <- paste0("INSERT INTO @source_schema.outpatient_services (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
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

