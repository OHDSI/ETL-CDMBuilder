frameworkContext <- new.env(parent = emptyenv());
initFramework <- function() {
  frameworkContext$groupIndex <- 0;
  insertSql <- c()
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.drug_claims;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.enrollment_detail;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.enrollment_summary;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.facility_header;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.icd9;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.inpatient_admissions;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.inpatient_services;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @source_schema.long_term_care;")
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
  defaults$awp <- "0.0"
  defaults$boe <- "2"
  defaults$cap <- "0"
  defaults$cob <- "0.0"
  defaults$coins <- "0.0"
  defaults$copay <- "0.0"
  defaults$dawind <- "01"
  defaults$daysupp <- "30"
  defaults$deaclas <- "6"
  defaults$deduct <- "0.0"
  defaults$dispfee <- "0.0"
  defaults$dobyr <- "1957"
  defaults$drugcovg <- "1"
  defaults$generid <- "111273"
  defaults$genind <- "4"
  defaults$ingcost <- "0.0"
  defaults$maintin <- "2"
  defaults$mas <- "9"
  defaults$medicare <- "0"
  defaults$metqty <- "30.0"
  defaults$mhsacovg <- "1"
  defaults$ndcnum <- "00173068220"
  defaults$netpay <- "0.0"
  defaults$pay <- "0.0"
  defaults$pddate <- "2014-05-14"
  defaults$plantyp <- "2"
  defaults$qty <- "1"
  defaults$refill <- "0"
  defaults$sex <- "2"
  defaults$stdrace <- "1"
  defaults$svcdate <- "2015-06-01"
  defaults$thercls <- "69"
  defaults$thergrp <- "08"
  defaults$version <- "01"
  defaults$year <- "2015"
  frameworkContext$defaultValues$drug_claims = defaults;

  defaults <- new.env(parent = emptyenv())
  defaults$boe <- "4"
  defaults$cap <- "1"
  defaults$dobyr <- "2006"
  defaults$drugcovg <- "1"
  defaults$dtend <- "2015-08-31"
  defaults$dtstart <- "2015-08-01"
  defaults$mas <- "9"
  defaults$medicare <- "0"
  defaults$memdays <- "31"
  defaults$mhsacovg <- "1"
  defaults$plantyp <- "4"
  defaults$sex <- "2"
  defaults$stdrace <- "1"
  defaults$version <- "01"
  defaults$year <- "2015"
  frameworkContext$defaultValues$enrollment_detail = defaults;

  defaults <- new.env(parent = emptyenv())
  defaults$boe <- "4"
  defaults$cap <- "1"
  defaults$dobyr <- "2006"
  defaults$drugcovg <- "1"
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
  defaults$mas <- "9"
  defaults$medicare <- "0"
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
  defaults$plntyp1 <- "4"
  defaults$plntyp10 <- "4"
  defaults$plntyp11 <- "4"
  defaults$plntyp12 <- "4"
  defaults$plntyp2 <- "4"
  defaults$plntyp3 <- "4"
  defaults$plntyp4 <- "4"
  defaults$plntyp5 <- "4"
  defaults$plntyp6 <- "4"
  defaults$plntyp7 <- "4"
  defaults$plntyp8 <- "4"
  defaults$plntyp9 <- "4"
  defaults$sex <- "2"
  defaults$stdrace <- "1"
  defaults$version <- "01"
  defaults$year <- "2015"
  frameworkContext$defaultValues$enrollment_summary = defaults;

  defaults <- new.env(parent = emptyenv())
  defaults$billtyp <- "131"
  defaults$boe <- "2"
  defaults$cap <- "0"
  defaults$cob <- "0.0"
  defaults$coins <- "0.0"
  defaults$copay <- "0.0"
  defaults$deduct <- "0.0"
  defaults$dobyr <- "2007"
  defaults$drugcovg <- "1"
  defaults$dstatus <- "01"
  defaults$dx1 <- "V221   "
  defaults$enrolid <- "20019200694"
  defaults$mas <- "9"
  defaults$mdc <- "23"
  defaults$medicare <- "0"
  defaults$mhsacovg <- "1"
  defaults$netpay <- "0.0"
  defaults$pddate <- "2013-07-12"
  defaults$plantyp <- "2"
  defaults$sex <- "2"
  defaults$stdplac <- "22"
  defaults$stdprov <- "1"
  defaults$stdrace <- "1"
  defaults$svcdate <- "2014-08-01"
  defaults$tsvcdat <- "2014-01-31"
  defaults$version <- "01"
  defaults$year <- "2015"
  frameworkContext$defaultValues$facility_header = defaults;

  defaults <- new.env(parent = emptyenv())
  defaults$parent_icd_code <- "V30-V39"
  defaults$level <- "4"
  defaults$children_count <- "0"
  defaults$children_count_recursive <- "0"
  defaults$description <- "Other"
  frameworkContext$defaultValues$icd9 = defaults;

  defaults <- new.env(parent = emptyenv())
  defaults$admdate <- "2014-03-12"
  defaults$admtyp <- "3"
  defaults$boe <- "2"
  defaults$cap <- "0"
  defaults$days <- "2"
  defaults$disdate <- "2014-12-31"
  defaults$dobyr <- "2014"
  defaults$drg <- "795"
  defaults$drugcovg <- "1"
  defaults$dstatus <- "01"
  defaults$dx1 <- "V3000  "
  defaults$dx2 <- "25000  "
  defaults$enrolid <- "20019200694"
  defaults$hospnet <- "0.0"
  defaults$hosppay <- "0.0"
  defaults$mas <- "9"
  defaults$mdc <- "14"
  defaults$medicare <- "0"
  defaults$mhsacovg <- "1"
  defaults$pddate <- "2008-05-12"
  defaults$pdx <- "V3000  "
  defaults$physnet <- "0.0"
  defaults$physpay <- "0.0"
  defaults$plantyp <- "2"
  defaults$proc2 <- "7359   "
  defaults$sex <- "2"
  defaults$stdrace <- "1"
  defaults$totcob <- "0.0"
  defaults$totcoins <- "0.0"
  defaults$totcopay <- "0.0"
  defaults$totded <- "0.0"
  defaults$totnet <- "0.0"
  defaults$totpay <- "0.0"
  defaults$version <- "01"
  defaults$year <- "2014"
  frameworkContext$defaultValues$inpatient_admissions = defaults;

  defaults <- new.env(parent = emptyenv())
  defaults$admdate <- "2015-04-08"
  defaults$admtyp <- "2"
  defaults$boe <- "2"
  defaults$cap <- "0"
  defaults$caseid <- "532786"
  defaults$cob <- "0.0"
  defaults$coins <- "0.0"
  defaults$copay <- "0.0"
  defaults$deduct <- "0.0"
  defaults$disdate <- "2015-02-27"
  defaults$dobyr <- "2014"
  defaults$drg <- "775"
  defaults$drugcovg <- "1"
  defaults$dstatus <- "01"
  defaults$dx1 <- "V3000  "
  defaults$enrolid <- "20019446559"
  defaults$facprof <- "F"
  defaults$mas <- "9"
  defaults$mdc <- "14"
  defaults$medicare <- "0"
  defaults$mhsacovg <- "1"
  defaults$netpay <- "0.0"
  defaults$pay <- "0.0"
  defaults$pddate <- "2015-03-31"
  defaults$pdx <- "V3000  "
  defaults$plantyp <- "2"
  defaults$qty <- "1"
  defaults$sex <- "2"
  defaults$stdplac <- "21"
  defaults$stdprov <- "1"
  defaults$stdrace <- "1"
  defaults$stdsvc <- "50"
  defaults$svcdate <- "2015-02-24"
  defaults$svcscat <- "20226"
  defaults$tsvcdat <- "2015-02-19"
  defaults$version <- "01"
  defaults$year <- "2014"
  frameworkContext$defaultValues$inpatient_services = defaults;

  defaults <- new.env(parent = emptyenv())
  defaults$boe <- "1"
  defaults$cap <- "0"
  defaults$cob <- "0.0"
  defaults$coins <- "0.0"
  defaults$copay <- "0.0"
  defaults$deduct <- "0.0"
  defaults$dobyr <- "1925"
  defaults$drugcovg <- "0"
  defaults$enrolid <- "20000073370"
  defaults$facprof <- "F"
  defaults$mas <- "9"
  defaults$mdc <- "01"
  defaults$medicare <- "1"
  defaults$mhsacovg <- "1"
  defaults$netpay <- "0.0"
  defaults$pay <- "0.0"
  defaults$pddate <- "2010-08-30"
  defaults$plantyp <- "2"
  defaults$qty <- "1"
  defaults$revcode <- "0190"
  defaults$sex <- "2"
  defaults$stdplac <- "31"
  defaults$stdrace <- "1"
  defaults$svcdate <- "2015-05-01"
  defaults$svcscat <- "10210"
  defaults$tsvcdat <- "2014-06-30"
  defaults$version <- "01"
  defaults$year <- "2014"
  frameworkContext$defaultValues$long_term_care = defaults;

  defaults <- new.env(parent = emptyenv())
  defaults$boe <- "2"
  defaults$cap <- "0"
  defaults$cob <- "0.0"
  defaults$coins <- "0.0"
  defaults$copay <- "0.0"
  defaults$deduct <- "0.0"
  defaults$dental <- "0"
  defaults$dobyr <- "2006"
  defaults$drugcovg <- "1"
  defaults$facprof <- "P"
  defaults$mas <- "9"
  defaults$mdc <- "23"
  defaults$medicare <- "0"
  defaults$mhsacovg <- "1"
  defaults$netpay <- "0.0"
  defaults$pay <- "0.0"
  defaults$pddate <- "2014-05-28"
  defaults$plantyp <- "2"
  defaults$procgrp <- "104"
  defaults$proctyp <- "1"
  defaults$qty <- "1"
  defaults$sex <- "2"
  defaults$stdplac <- "11"
  defaults$stdprov <- "1"
  defaults$stdrace <- "1"
  defaults$svcdate <- "2015-07-01"
  defaults$svcscat <- "12220"
  defaults$tsvcdat <- "2015-04-30"
  defaults$version <- "01"
  defaults$year <- "2015"
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

set_defaults_drug_claims <- function(awp, boe, cap, cob, coins, copay, dawind, daysupp, deaclas, deduct, dispfee, dobyr, drugcovg, enrolid, generid, genind, ingcost, maintin, mas, mcasenum, medicare, metqty, mhsacovg, ndcnum, netpay, pay, pddate, pharmid, plantyp, qty, refill, seqnum, sex, stdrace, svcdate, thercls, thergrp, version, year) {
  defaults <- frameworkContext$defaultValues$drug_claims;
  if (!missing(awp)) {
    defaults$awp <- awp
  }
  if (!missing(boe)) {
    defaults$boe <- boe
  }
  if (!missing(cap)) {
    defaults$cap <- cap
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
  if (!missing(drugcovg)) {
    defaults$drugcovg <- drugcovg
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
  if (!missing(ingcost)) {
    defaults$ingcost <- ingcost
  }
  if (!missing(maintin)) {
    defaults$maintin <- maintin
  }
  if (!missing(mas)) {
    defaults$mas <- mas
  }
  if (!missing(mcasenum)) {
    defaults$mcasenum <- mcasenum
  }
  if (!missing(medicare)) {
    defaults$medicare <- medicare
  }
  if (!missing(metqty)) {
    defaults$metqty <- metqty
  }
  if (!missing(mhsacovg)) {
    defaults$mhsacovg <- mhsacovg
  }
  if (!missing(ndcnum)) {
    defaults$ndcnum <- ndcnum
  }
  if (!missing(netpay)) {
    defaults$netpay <- netpay
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
  if (!missing(plantyp)) {
    defaults$plantyp <- plantyp
  }
  if (!missing(qty)) {
    defaults$qty <- qty
  }
  if (!missing(refill)) {
    defaults$refill <- refill
  }
  if (!missing(seqnum)) {
    defaults$seqnum <- seqnum
  }
  if (!missing(sex)) {
    defaults$sex <- sex
  }
  if (!missing(stdrace)) {
    defaults$stdrace <- stdrace
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
  if (!missing(year)) {
    defaults$year <- year
  }
  invisible(defaults)
}

set_defaults_enrollment_detail <- function(boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, mcasenum, medicare, memdays, mhsacovg, plantyp, seqnum, sex, stdrace, version, year) {
  defaults <- frameworkContext$defaultValues$enrollment_detail;
  if (!missing(boe)) {
    defaults$boe <- boe
  }
  if (!missing(cap)) {
    defaults$cap <- cap
  }
  if (!missing(dobyr)) {
    defaults$dobyr <- dobyr
  }
  if (!missing(drugcovg)) {
    defaults$drugcovg <- drugcovg
  }
  if (!missing(dtend)) {
    defaults$dtend <- dtend
  }
  if (!missing(dtstart)) {
    defaults$dtstart <- dtstart
  }
  if (!missing(enrolid)) {
    defaults$enrolid <- enrolid
  }
  if (!missing(mas)) {
    defaults$mas <- mas
  }
  if (!missing(mcasenum)) {
    defaults$mcasenum <- mcasenum
  }
  if (!missing(medicare)) {
    defaults$medicare <- medicare
  }
  if (!missing(memdays)) {
    defaults$memdays <- memdays
  }
  if (!missing(mhsacovg)) {
    defaults$mhsacovg <- mhsacovg
  }
  if (!missing(plantyp)) {
    defaults$plantyp <- plantyp
  }
  if (!missing(seqnum)) {
    defaults$seqnum <- seqnum
  }
  if (!missing(sex)) {
    defaults$sex <- sex
  }
  if (!missing(stdrace)) {
    defaults$stdrace <- stdrace
  }
  if (!missing(version)) {
    defaults$version <- version
  }
  if (!missing(year)) {
    defaults$year <- year
  }
  invisible(defaults)
}

set_defaults_enrollment_summary <- function(boe, cap, dobyr, drugcovg, enrind1, enrind10, enrind11, enrind12, enrind2, enrind3, enrind4, enrind5, enrind6, enrind7, enrind8, enrind9, enrmon, enrolid, mas, mcasenum, medicare, memday1, memday10, memday11, memday12, memday2, memday3, memday4, memday5, memday6, memday7, memday8, memday9, memdays, mhsacovg, plntyp1, plntyp10, plntyp11, plntyp12, plntyp2, plntyp3, plntyp4, plntyp5, plntyp6, plntyp7, plntyp8, plntyp9, seqnum, sex, stdrace, version, year) {
  defaults <- frameworkContext$defaultValues$enrollment_summary;
  if (!missing(boe)) {
    defaults$boe <- boe
  }
  if (!missing(cap)) {
    defaults$cap <- cap
  }
  if (!missing(dobyr)) {
    defaults$dobyr <- dobyr
  }
  if (!missing(drugcovg)) {
    defaults$drugcovg <- drugcovg
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
  if (!missing(mas)) {
    defaults$mas <- mas
  }
  if (!missing(mcasenum)) {
    defaults$mcasenum <- mcasenum
  }
  if (!missing(medicare)) {
    defaults$medicare <- medicare
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
  if (!missing(seqnum)) {
    defaults$seqnum <- seqnum
  }
  if (!missing(sex)) {
    defaults$sex <- sex
  }
  if (!missing(stdrace)) {
    defaults$stdrace <- stdrace
  }
  if (!missing(version)) {
    defaults$version <- version
  }
  if (!missing(year)) {
    defaults$year <- year
  }
  invisible(defaults)
}

set_defaults_facility_header <- function(billtyp, boe, cap, caseid, cob, coins, copay, deduct, dobyr, drugcovg, dstatus, dx1, dx2, dx3, dx4, dx5, dx6, dx7, dx8, dx9, dxver, enrolid, fachdid, mas, mcasenum, mdc, medicare, mhsacovg, netpay, pddate, plantyp, proc1, proc2, proc3, proc4, proc5, proc6, prov_id, seqnum, sex, stdplac, stdprov, stdrace, svcdate, tsvcdat, version, year, npi, msclmid) {
  defaults <- frameworkContext$defaultValues$facility_header;
  if (!missing(billtyp)) {
    defaults$billtyp <- billtyp
  }
  if (!missing(boe)) {
    defaults$boe <- boe
  }
  if (!missing(cap)) {
    defaults$cap <- cap
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
  if (!missing(deduct)) {
    defaults$deduct <- deduct
  }
  if (!missing(dobyr)) {
    defaults$dobyr <- dobyr
  }
  if (!missing(drugcovg)) {
    defaults$drugcovg <- drugcovg
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
  if (!missing(enrolid)) {
    defaults$enrolid <- enrolid
  }
  if (!missing(fachdid)) {
    defaults$fachdid <- fachdid
  }
  if (!missing(mas)) {
    defaults$mas <- mas
  }
  if (!missing(mcasenum)) {
    defaults$mcasenum <- mcasenum
  }
  if (!missing(mdc)) {
    defaults$mdc <- mdc
  }
  if (!missing(medicare)) {
    defaults$medicare <- medicare
  }
  if (!missing(mhsacovg)) {
    defaults$mhsacovg <- mhsacovg
  }
  if (!missing(netpay)) {
    defaults$netpay <- netpay
  }
  if (!missing(pddate)) {
    defaults$pddate <- pddate
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
  if (!missing(prov_id)) {
    defaults$prov_id <- prov_id
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
  if (!missing(stdrace)) {
    defaults$stdrace <- stdrace
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
  if (!missing(year)) {
    defaults$year <- year
  }
  if (!missing(npi)) {
    defaults$npi <- npi
  }
  if (!missing(msclmid)) {
    defaults$msclmid <- msclmid
  }
  invisible(defaults)
}

set_defaults_icd9 <- function(icd_key, icd_code, parent_icd_code, level, children_count, children_count_recursive, description) {
  defaults <- frameworkContext$defaultValues$icd9;
  if (!missing(icd_key)) {
    defaults$icd_key <- icd_key
  }
  if (!missing(icd_code)) {
    defaults$icd_code <- icd_code
  }
  if (!missing(parent_icd_code)) {
    defaults$parent_icd_code <- parent_icd_code
  }
  if (!missing(level)) {
    defaults$level <- level
  }
  if (!missing(children_count)) {
    defaults$children_count <- children_count
  }
  if (!missing(children_count_recursive)) {
    defaults$children_count_recursive <- children_count_recursive
  }
  if (!missing(description)) {
    defaults$description <- description
  }
  invisible(defaults)
}

set_defaults_inpatient_admissions <- function(admdate, admtyp, boe, cap, caseid, days, disdate, dobyr, drg, drugcovg, dstatus, dx1, dx10, dx11, dx12, dx13, dx14, dx15, dx2, dx3, dx4, dx5, dx6, dx7, dx8, dx9, dxver, enrolid, hosp_id, hospnet, hosppay, mas, mcasenum, mdc, medicare, mhsacovg, pddate, pdx, phys_id, physnet, physpay, plantyp, pproc, proc1, proc10, proc11, proc12, proc13, proc14, proc15, proc2, proc3, proc4, proc5, proc6, proc7, proc8, proc9, seqnum, sex, stdrace, totcob, totcoins, totcopay, totded, totnet, totpay, version, year) {
  defaults <- frameworkContext$defaultValues$inpatient_admissions;
  if (!missing(admdate)) {
    defaults$admdate <- admdate
  }
  if (!missing(admtyp)) {
    defaults$admtyp <- admtyp
  }
  if (!missing(boe)) {
    defaults$boe <- boe
  }
  if (!missing(cap)) {
    defaults$cap <- cap
  }
  if (!missing(caseid)) {
    defaults$caseid <- caseid
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
  if (!missing(drugcovg)) {
    defaults$drugcovg <- drugcovg
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
  if (!missing(enrolid)) {
    defaults$enrolid <- enrolid
  }
  if (!missing(hosp_id)) {
    defaults$hosp_id <- hosp_id
  }
  if (!missing(hospnet)) {
    defaults$hospnet <- hospnet
  }
  if (!missing(hosppay)) {
    defaults$hosppay <- hosppay
  }
  if (!missing(mas)) {
    defaults$mas <- mas
  }
  if (!missing(mcasenum)) {
    defaults$mcasenum <- mcasenum
  }
  if (!missing(mdc)) {
    defaults$mdc <- mdc
  }
  if (!missing(medicare)) {
    defaults$medicare <- medicare
  }
  if (!missing(mhsacovg)) {
    defaults$mhsacovg <- mhsacovg
  }
  if (!missing(pddate)) {
    defaults$pddate <- pddate
  }
  if (!missing(pdx)) {
    defaults$pdx <- pdx
  }
  if (!missing(phys_id)) {
    defaults$phys_id <- phys_id
  }
  if (!missing(physnet)) {
    defaults$physnet <- physnet
  }
  if (!missing(physpay)) {
    defaults$physpay <- physpay
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
  if (!missing(seqnum)) {
    defaults$seqnum <- seqnum
  }
  if (!missing(sex)) {
    defaults$sex <- sex
  }
  if (!missing(stdrace)) {
    defaults$stdrace <- stdrace
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
  if (!missing(year)) {
    defaults$year <- year
  }
  invisible(defaults)
}

set_defaults_inpatient_services <- function(admdate, admtyp, boe, cap, caseid, cob, coins, copay, deduct, disdate, dobyr, drg, drugcovg, dstatus, dx1, dx2, dx3, dx4, dxver, enrolid, fachdid, facprof, mas, mcasenum, mdc, medicare, mhsacovg, netpay, pay, pddate, pdx, plantyp, pproc, proc1, proctyp, prov_id, qty, revcode, seqnum, sex, stdplac, stdprov, stdrace, stdsvc, svcdate, svcscat, tsvcdat, version, year, units, npi, msclmid) {
  defaults <- frameworkContext$defaultValues$inpatient_services;
  if (!missing(admdate)) {
    defaults$admdate <- admdate
  }
  if (!missing(admtyp)) {
    defaults$admtyp <- admtyp
  }
  if (!missing(boe)) {
    defaults$boe <- boe
  }
  if (!missing(cap)) {
    defaults$cap <- cap
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
  if (!missing(drugcovg)) {
    defaults$drugcovg <- drugcovg
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
  if (!missing(dxver)) {
    defaults$dxver <- dxver
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
  if (!missing(mas)) {
    defaults$mas <- mas
  }
  if (!missing(mcasenum)) {
    defaults$mcasenum <- mcasenum
  }
  if (!missing(mdc)) {
    defaults$mdc <- mdc
  }
  if (!missing(medicare)) {
    defaults$medicare <- medicare
  }
  if (!missing(mhsacovg)) {
    defaults$mhsacovg <- mhsacovg
  }
  if (!missing(netpay)) {
    defaults$netpay <- netpay
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
  if (!missing(plantyp)) {
    defaults$plantyp <- plantyp
  }
  if (!missing(pproc)) {
    defaults$pproc <- pproc
  }
  if (!missing(proc1)) {
    defaults$proc1 <- proc1
  }
  if (!missing(proctyp)) {
    defaults$proctyp <- proctyp
  }
  if (!missing(prov_id)) {
    defaults$prov_id <- prov_id
  }
  if (!missing(qty)) {
    defaults$qty <- qty
  }
  if (!missing(revcode)) {
    defaults$revcode <- revcode
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
  if (!missing(stdrace)) {
    defaults$stdrace <- stdrace
  }
  if (!missing(stdsvc)) {
    defaults$stdsvc <- stdsvc
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

set_defaults_long_term_care <- function(boe, cap, cob, coins, copay, deduct, dobyr, drugcovg, dx1, dx2, dx3, dx4, dxver, enrolid, fachdid, facprof, mas, mcasenum, mdc, medicare, mhsacovg, netpay, pay, pddate, plantyp, proc1, procgrp, proctyp, prov_id, qty, revcode, seqnum, sex, stdplac, stdprov, stdrace, stdsvc, svcdate, svcscat, tsvcdat, version, year, units, npi, msclmid) {
  defaults <- frameworkContext$defaultValues$long_term_care;
  if (!missing(boe)) {
    defaults$boe <- boe
  }
  if (!missing(cap)) {
    defaults$cap <- cap
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
  if (!missing(deduct)) {
    defaults$deduct <- deduct
  }
  if (!missing(dobyr)) {
    defaults$dobyr <- dobyr
  }
  if (!missing(drugcovg)) {
    defaults$drugcovg <- drugcovg
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
  if (!missing(dxver)) {
    defaults$dxver <- dxver
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
  if (!missing(mas)) {
    defaults$mas <- mas
  }
  if (!missing(mcasenum)) {
    defaults$mcasenum <- mcasenum
  }
  if (!missing(mdc)) {
    defaults$mdc <- mdc
  }
  if (!missing(medicare)) {
    defaults$medicare <- medicare
  }
  if (!missing(mhsacovg)) {
    defaults$mhsacovg <- mhsacovg
  }
  if (!missing(netpay)) {
    defaults$netpay <- netpay
  }
  if (!missing(pay)) {
    defaults$pay <- pay
  }
  if (!missing(pddate)) {
    defaults$pddate <- pddate
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
  if (!missing(proctyp)) {
    defaults$proctyp <- proctyp
  }
  if (!missing(prov_id)) {
    defaults$prov_id <- prov_id
  }
  if (!missing(qty)) {
    defaults$qty <- qty
  }
  if (!missing(revcode)) {
    defaults$revcode <- revcode
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
  if (!missing(stdrace)) {
    defaults$stdrace <- stdrace
  }
  if (!missing(stdsvc)) {
    defaults$stdsvc <- stdsvc
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

set_defaults_outpatient_services <- function(boe, cap, cob, coins, copay, deduct, dental, dobyr, drugcovg, dx1, dx2, dx3, dx4, dxver, enrolid, fachdid, facprof, mas, mcasenum, mdc, medicare, mhsacovg, netpay, pay, pddate, plantyp, proc1, procgrp, proctyp, prov_id, qty, revcode, seqnum, sex, stdplac, stdprov, stdrace, stdsvc, svcdate, svcscat, tsvcdat, version, year, units, npi, msclmid) {
  defaults <- frameworkContext$defaultValues$outpatient_services;
  if (!missing(boe)) {
    defaults$boe <- boe
  }
  if (!missing(cap)) {
    defaults$cap <- cap
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
  if (!missing(deduct)) {
    defaults$deduct <- deduct
  }
  if (!missing(dental)) {
    defaults$dental <- dental
  }
  if (!missing(dobyr)) {
    defaults$dobyr <- dobyr
  }
  if (!missing(drugcovg)) {
    defaults$drugcovg <- drugcovg
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
  if (!missing(dxver)) {
    defaults$dxver <- dxver
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
  if (!missing(mas)) {
    defaults$mas <- mas
  }
  if (!missing(mcasenum)) {
    defaults$mcasenum <- mcasenum
  }
  if (!missing(mdc)) {
    defaults$mdc <- mdc
  }
  if (!missing(medicare)) {
    defaults$medicare <- medicare
  }
  if (!missing(mhsacovg)) {
    defaults$mhsacovg <- mhsacovg
  }
  if (!missing(netpay)) {
    defaults$netpay <- netpay
  }
  if (!missing(pay)) {
    defaults$pay <- pay
  }
  if (!missing(pddate)) {
    defaults$pddate <- pddate
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
  if (!missing(proctyp)) {
    defaults$proctyp <- proctyp
  }
  if (!missing(prov_id)) {
    defaults$prov_id <- prov_id
  }
  if (!missing(qty)) {
    defaults$qty <- qty
  }
  if (!missing(revcode)) {
    defaults$revcode <- revcode
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
  if (!missing(stdrace)) {
    defaults$stdrace <- stdrace
  }
  if (!missing(stdsvc)) {
    defaults$stdsvc <- stdsvc
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

get_defaults_icd9 <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_inpatient_admissions <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_inpatient_services <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_long_term_care <- function() {
  return(frameworkContext$defaultValues)
}

get_defaults_outpatient_services <- function() {
  return(frameworkContext$defaultValues)
}

add_drug_claims <- function(awp, boe, cap, cob, coins, copay, dawind, daysupp, deaclas, deduct, dispfee, dobyr, drugcovg, enrolid, generid, genind, ingcost, maintin, mas, mcasenum, medicare, metqty, mhsacovg, ndcnum, netpay, pay, pddate, pharmid, plantyp, qty, refill, seqnum, sex, stdrace, svcdate, thercls, thergrp, version, year) {
  defaults <- frameworkContext$defaultValues$drug_claims;
  insertFields <- c()
  insertValues <- c()
  if (missing(awp)) {
    awp <- defaults$awp
  }
  if (!is.null(awp)) {
    insertFields <- c(insertFields, "awp")
    insertValues <- c(insertValues, awp)
  }

  if (missing(boe)) {
    boe <- defaults$boe
  }
  if (!is.null(boe)) {
    insertFields <- c(insertFields, "boe")
    insertValues <- c(insertValues, boe)
  }

  if (missing(cap)) {
    cap <- defaults$cap
  }
  if (!is.null(cap)) {
    insertFields <- c(insertFields, "cap")
    insertValues <- c(insertValues, cap)
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

  if (missing(drugcovg)) {
    drugcovg <- defaults$drugcovg
  }
  if (!is.null(drugcovg)) {
    insertFields <- c(insertFields, "drugcovg")
    insertValues <- c(insertValues, drugcovg)
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

  if (missing(mas)) {
    mas <- defaults$mas
  }
  if (!is.null(mas)) {
    insertFields <- c(insertFields, "mas")
    insertValues <- c(insertValues, mas)
  }

  if (missing(mcasenum)) {
    mcasenum <- defaults$mcasenum
  }
  if (!is.null(mcasenum)) {
    insertFields <- c(insertFields, "mcasenum")
    insertValues <- c(insertValues, mcasenum)
  }

  if (missing(medicare)) {
    medicare <- defaults$medicare
  }
  if (!is.null(medicare)) {
    insertFields <- c(insertFields, "medicare")
    insertValues <- c(insertValues, medicare)
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

  if (missing(stdrace)) {
    stdrace <- defaults$stdrace
  }
  if (!is.null(stdrace)) {
    insertFields <- c(insertFields, "stdrace")
    insertValues <- c(insertValues, stdrace)
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

add_enrollment_detail <- function(boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, mcasenum, medicare, memdays, mhsacovg, plantyp, seqnum, sex, stdrace, version, year) {
  defaults <- frameworkContext$defaultValues$enrollment_detail;
  insertFields <- c()
  insertValues <- c()
  if (missing(boe)) {
    boe <- defaults$boe
  }
  if (!is.null(boe)) {
    insertFields <- c(insertFields, "boe")
    insertValues <- c(insertValues, boe)
  }

  if (missing(cap)) {
    cap <- defaults$cap
  }
  if (!is.null(cap)) {
    insertFields <- c(insertFields, "cap")
    insertValues <- c(insertValues, cap)
  }

  if (missing(dobyr)) {
    dobyr <- defaults$dobyr
  }
  if (!is.null(dobyr)) {
    insertFields <- c(insertFields, "dobyr")
    insertValues <- c(insertValues, dobyr)
  }

  if (missing(drugcovg)) {
    drugcovg <- defaults$drugcovg
  }
  if (!is.null(drugcovg)) {
    insertFields <- c(insertFields, "drugcovg")
    insertValues <- c(insertValues, drugcovg)
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

  if (missing(enrolid)) {
    enrolid <- defaults$enrolid
  }
  if (!is.null(enrolid)) {
    insertFields <- c(insertFields, "enrolid")
    insertValues <- c(insertValues, enrolid)
  }

  if (missing(mas)) {
    mas <- defaults$mas
  }
  if (!is.null(mas)) {
    insertFields <- c(insertFields, "mas")
    insertValues <- c(insertValues, mas)
  }

  if (missing(mcasenum)) {
    mcasenum <- defaults$mcasenum
  }
  if (!is.null(mcasenum)) {
    insertFields <- c(insertFields, "mcasenum")
    insertValues <- c(insertValues, mcasenum)
  }

  if (missing(medicare)) {
    medicare <- defaults$medicare
  }
  if (!is.null(medicare)) {
    insertFields <- c(insertFields, "medicare")
    insertValues <- c(insertValues, medicare)
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

  if (missing(plantyp)) {
    plantyp <- defaults$plantyp
  }
  if (!is.null(plantyp)) {
    insertFields <- c(insertFields, "plantyp")
    insertValues <- c(insertValues, plantyp)
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

  if (missing(stdrace)) {
    stdrace <- defaults$stdrace
  }
  if (!is.null(stdrace)) {
    insertFields <- c(insertFields, "stdrace")
    insertValues <- c(insertValues, stdrace)
  }

  if (missing(version)) {
    version <- defaults$version
  }
  if (!is.null(version)) {
    insertFields <- c(insertFields, "version")
    insertValues <- c(insertValues, version)
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

add_enrollment_summary <- function(boe, cap, dobyr, drugcovg, enrind1, enrind10, enrind11, enrind12, enrind2, enrind3, enrind4, enrind5, enrind6, enrind7, enrind8, enrind9, enrmon, enrolid, mas, mcasenum, medicare, memday1, memday10, memday11, memday12, memday2, memday3, memday4, memday5, memday6, memday7, memday8, memday9, memdays, mhsacovg, plntyp1, plntyp10, plntyp11, plntyp12, plntyp2, plntyp3, plntyp4, plntyp5, plntyp6, plntyp7, plntyp8, plntyp9, seqnum, sex, stdrace, version, year) {
  defaults <- frameworkContext$defaultValues$enrollment_summary;
  insertFields <- c()
  insertValues <- c()
  if (missing(boe)) {
    boe <- defaults$boe
  }
  if (!is.null(boe)) {
    insertFields <- c(insertFields, "boe")
    insertValues <- c(insertValues, boe)
  }

  if (missing(cap)) {
    cap <- defaults$cap
  }
  if (!is.null(cap)) {
    insertFields <- c(insertFields, "cap")
    insertValues <- c(insertValues, cap)
  }

  if (missing(dobyr)) {
    dobyr <- defaults$dobyr
  }
  if (!is.null(dobyr)) {
    insertFields <- c(insertFields, "dobyr")
    insertValues <- c(insertValues, dobyr)
  }

  if (missing(drugcovg)) {
    drugcovg <- defaults$drugcovg
  }
  if (!is.null(drugcovg)) {
    insertFields <- c(insertFields, "drugcovg")
    insertValues <- c(insertValues, drugcovg)
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

  if (missing(mas)) {
    mas <- defaults$mas
  }
  if (!is.null(mas)) {
    insertFields <- c(insertFields, "mas")
    insertValues <- c(insertValues, mas)
  }

  if (missing(mcasenum)) {
    mcasenum <- defaults$mcasenum
  }
  if (!is.null(mcasenum)) {
    insertFields <- c(insertFields, "mcasenum")
    insertValues <- c(insertValues, mcasenum)
  }

  if (missing(medicare)) {
    medicare <- defaults$medicare
  }
  if (!is.null(medicare)) {
    insertFields <- c(insertFields, "medicare")
    insertValues <- c(insertValues, medicare)
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

  if (missing(stdrace)) {
    stdrace <- defaults$stdrace
  }
  if (!is.null(stdrace)) {
    insertFields <- c(insertFields, "stdrace")
    insertValues <- c(insertValues, stdrace)
  }

  if (missing(version)) {
    version <- defaults$version
  }
  if (!is.null(version)) {
    insertFields <- c(insertFields, "version")
    insertValues <- c(insertValues, version)
  }

  if (missing(year)) {
    year <- defaults$year
  }
  if (!is.null(year)) {
    insertFields <- c(insertFields, "year")
    insertValues <- c(insertValues, year)
  }

  statement <- paste0("INSERT INTO @source_schema.enrollment_summary (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
  invisible(statement);
}

add_facility_header <- function(billtyp, boe, cap, caseid, cob, coins, copay, deduct, dobyr, drugcovg, dstatus, dx1, dx2, dx3, dx4, dx5, dx6, dx7, dx8, dx9, dxver, enrolid, fachdid, mas, mcasenum, mdc, medicare, mhsacovg, netpay, pddate, plantyp, proc1, proc2, proc3, proc4, proc5, proc6, prov_id, seqnum, sex, stdplac, stdprov, stdrace, svcdate, tsvcdat, version, year, npi, msclmid) {
  defaults <- frameworkContext$defaultValues$facility_header;
  insertFields <- c()
  insertValues <- c()
  if (missing(billtyp)) {
    billtyp <- defaults$billtyp
  }
  if (!is.null(billtyp)) {
    insertFields <- c(insertFields, "billtyp")
    insertValues <- c(insertValues, billtyp)
  }

  if (missing(boe)) {
    boe <- defaults$boe
  }
  if (!is.null(boe)) {
    insertFields <- c(insertFields, "boe")
    insertValues <- c(insertValues, boe)
  }

  if (missing(cap)) {
    cap <- defaults$cap
  }
  if (!is.null(cap)) {
    insertFields <- c(insertFields, "cap")
    insertValues <- c(insertValues, cap)
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

  if (missing(drugcovg)) {
    drugcovg <- defaults$drugcovg
  }
  if (!is.null(drugcovg)) {
    insertFields <- c(insertFields, "drugcovg")
    insertValues <- c(insertValues, drugcovg)
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

  if (missing(mas)) {
    mas <- defaults$mas
  }
  if (!is.null(mas)) {
    insertFields <- c(insertFields, "mas")
    insertValues <- c(insertValues, mas)
  }

  if (missing(mcasenum)) {
    mcasenum <- defaults$mcasenum
  }
  if (!is.null(mcasenum)) {
    insertFields <- c(insertFields, "mcasenum")
    insertValues <- c(insertValues, mcasenum)
  }

  if (missing(mdc)) {
    mdc <- defaults$mdc
  }
  if (!is.null(mdc)) {
    insertFields <- c(insertFields, "mdc")
    insertValues <- c(insertValues, mdc)
  }

  if (missing(medicare)) {
    medicare <- defaults$medicare
  }
  if (!is.null(medicare)) {
    insertFields <- c(insertFields, "medicare")
    insertValues <- c(insertValues, medicare)
  }

  if (missing(mhsacovg)) {
    mhsacovg <- defaults$mhsacovg
  }
  if (!is.null(mhsacovg)) {
    insertFields <- c(insertFields, "mhsacovg")
    insertValues <- c(insertValues, mhsacovg)
  }

  if (missing(netpay)) {
    netpay <- defaults$netpay
  }
  if (!is.null(netpay)) {
    insertFields <- c(insertFields, "netpay")
    insertValues <- c(insertValues, netpay)
  }

  if (missing(pddate)) {
    pddate <- defaults$pddate
  }
  if (!is.null(pddate)) {
    insertFields <- c(insertFields, "pddate")
    insertValues <- c(insertValues, pddate)
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

  if (missing(prov_id)) {
    prov_id <- defaults$prov_id
  }
  if (!is.null(prov_id)) {
    insertFields <- c(insertFields, "prov_id")
    insertValues <- c(insertValues, prov_id)
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

  if (missing(stdrace)) {
    stdrace <- defaults$stdrace
  }
  if (!is.null(stdrace)) {
    insertFields <- c(insertFields, "stdrace")
    insertValues <- c(insertValues, stdrace)
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

  if (missing(year)) {
    year <- defaults$year
  }
  if (!is.null(year)) {
    insertFields <- c(insertFields, "year")
    insertValues <- c(insertValues, year)
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

  statement <- paste0("INSERT INTO @source_schema.facility_header (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
  invisible(statement);
}

add_icd9 <- function(icd_key, icd_code, parent_icd_code, level, children_count, children_count_recursive, description) {
  defaults <- frameworkContext$defaultValues$icd9;
  insertFields <- c()
  insertValues <- c()
  if (missing(icd_key)) {
    icd_key <- defaults$icd_key
  }
  if (!is.null(icd_key)) {
    insertFields <- c(insertFields, "icd_key")
    insertValues <- c(insertValues, icd_key)
  }

  if (missing(icd_code)) {
    icd_code <- defaults$icd_code
  }
  if (!is.null(icd_code)) {
    insertFields <- c(insertFields, "icd_code")
    insertValues <- c(insertValues, icd_code)
  }

  if (missing(parent_icd_code)) {
    parent_icd_code <- defaults$parent_icd_code
  }
  if (!is.null(parent_icd_code)) {
    insertFields <- c(insertFields, "parent_icd_code")
    insertValues <- c(insertValues, parent_icd_code)
  }

  if (missing(level)) {
    level <- defaults$level
  }
  if (!is.null(level)) {
    insertFields <- c(insertFields, "level")
    insertValues <- c(insertValues, level)
  }

  if (missing(children_count)) {
    children_count <- defaults$children_count
  }
  if (!is.null(children_count)) {
    insertFields <- c(insertFields, "children_count")
    insertValues <- c(insertValues, children_count)
  }

  if (missing(children_count_recursive)) {
    children_count_recursive <- defaults$children_count_recursive
  }
  if (!is.null(children_count_recursive)) {
    insertFields <- c(insertFields, "children_count_recursive")
    insertValues <- c(insertValues, children_count_recursive)
  }

  if (missing(description)) {
    description <- defaults$description
  }
  if (!is.null(description)) {
    insertFields <- c(insertFields, "description")
    insertValues <- c(insertValues, description)
  }

  statement <- paste0("INSERT INTO @source_schema.icd9 (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
  invisible(statement);
}

add_inpatient_admissions <- function(admdate, admtyp, boe, cap, caseid, days, disdate, dobyr, drg, drugcovg, dstatus, dx1, dx10, dx11, dx12, dx13, dx14, dx15, dx2, dx3, dx4, dx5, dx6, dx7, dx8, dx9, dxver, enrolid, hosp_id, hospnet, hosppay, mas, mcasenum, mdc, medicare, mhsacovg, pddate, pdx, phys_id, physnet, physpay, plantyp, pproc, proc1, proc10, proc11, proc12, proc13, proc14, proc15, proc2, proc3, proc4, proc5, proc6, proc7, proc8, proc9, seqnum, sex, stdrace, totcob, totcoins, totcopay, totded, totnet, totpay, version, year) {
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

  if (missing(boe)) {
    boe <- defaults$boe
  }
  if (!is.null(boe)) {
    insertFields <- c(insertFields, "boe")
    insertValues <- c(insertValues, boe)
  }

  if (missing(cap)) {
    cap <- defaults$cap
  }
  if (!is.null(cap)) {
    insertFields <- c(insertFields, "cap")
    insertValues <- c(insertValues, cap)
  }

  if (missing(caseid)) {
    caseid <- defaults$caseid
  }
  if (!is.null(caseid)) {
    insertFields <- c(insertFields, "caseid")
    insertValues <- c(insertValues, caseid)
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

  if (missing(drugcovg)) {
    drugcovg <- defaults$drugcovg
  }
  if (!is.null(drugcovg)) {
    insertFields <- c(insertFields, "drugcovg")
    insertValues <- c(insertValues, drugcovg)
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

  if (missing(enrolid)) {
    enrolid <- defaults$enrolid
  }
  if (!is.null(enrolid)) {
    insertFields <- c(insertFields, "enrolid")
    insertValues <- c(insertValues, enrolid)
  }

  if (missing(hosp_id)) {
    hosp_id <- defaults$hosp_id
  }
  if (!is.null(hosp_id)) {
    insertFields <- c(insertFields, "hosp_id")
    insertValues <- c(insertValues, hosp_id)
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

  if (missing(mas)) {
    mas <- defaults$mas
  }
  if (!is.null(mas)) {
    insertFields <- c(insertFields, "mas")
    insertValues <- c(insertValues, mas)
  }

  if (missing(mcasenum)) {
    mcasenum <- defaults$mcasenum
  }
  if (!is.null(mcasenum)) {
    insertFields <- c(insertFields, "mcasenum")
    insertValues <- c(insertValues, mcasenum)
  }

  if (missing(mdc)) {
    mdc <- defaults$mdc
  }
  if (!is.null(mdc)) {
    insertFields <- c(insertFields, "mdc")
    insertValues <- c(insertValues, mdc)
  }

  if (missing(medicare)) {
    medicare <- defaults$medicare
  }
  if (!is.null(medicare)) {
    insertFields <- c(insertFields, "medicare")
    insertValues <- c(insertValues, medicare)
  }

  if (missing(mhsacovg)) {
    mhsacovg <- defaults$mhsacovg
  }
  if (!is.null(mhsacovg)) {
    insertFields <- c(insertFields, "mhsacovg")
    insertValues <- c(insertValues, mhsacovg)
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

  if (missing(phys_id)) {
    phys_id <- defaults$phys_id
  }
  if (!is.null(phys_id)) {
    insertFields <- c(insertFields, "phys_id")
    insertValues <- c(insertValues, phys_id)
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

  if (missing(stdrace)) {
    stdrace <- defaults$stdrace
  }
  if (!is.null(stdrace)) {
    insertFields <- c(insertFields, "stdrace")
    insertValues <- c(insertValues, stdrace)
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

add_inpatient_services <- function(admdate, admtyp, boe, cap, caseid, cob, coins, copay, deduct, disdate, dobyr, drg, drugcovg, dstatus, dx1, dx2, dx3, dx4, dxver, enrolid, fachdid, facprof, mas, mcasenum, mdc, medicare, mhsacovg, netpay, pay, pddate, pdx, plantyp, pproc, proc1, proctyp, prov_id, qty, revcode, seqnum, sex, stdplac, stdprov, stdrace, stdsvc, svcdate, svcscat, tsvcdat, version, year, units, npi, msclmid) {
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

  if (missing(boe)) {
    boe <- defaults$boe
  }
  if (!is.null(boe)) {
    insertFields <- c(insertFields, "boe")
    insertValues <- c(insertValues, boe)
  }

  if (missing(cap)) {
    cap <- defaults$cap
  }
  if (!is.null(cap)) {
    insertFields <- c(insertFields, "cap")
    insertValues <- c(insertValues, cap)
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

  if (missing(drugcovg)) {
    drugcovg <- defaults$drugcovg
  }
  if (!is.null(drugcovg)) {
    insertFields <- c(insertFields, "drugcovg")
    insertValues <- c(insertValues, drugcovg)
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

  if (missing(dxver)) {
    dxver <- defaults$dxver
  }
  if (!is.null(dxver)) {
    insertFields <- c(insertFields, "dxver")
    insertValues <- c(insertValues, dxver)
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

  if (missing(mas)) {
    mas <- defaults$mas
  }
  if (!is.null(mas)) {
    insertFields <- c(insertFields, "mas")
    insertValues <- c(insertValues, mas)
  }

  if (missing(mcasenum)) {
    mcasenum <- defaults$mcasenum
  }
  if (!is.null(mcasenum)) {
    insertFields <- c(insertFields, "mcasenum")
    insertValues <- c(insertValues, mcasenum)
  }

  if (missing(mdc)) {
    mdc <- defaults$mdc
  }
  if (!is.null(mdc)) {
    insertFields <- c(insertFields, "mdc")
    insertValues <- c(insertValues, mdc)
  }

  if (missing(medicare)) {
    medicare <- defaults$medicare
  }
  if (!is.null(medicare)) {
    insertFields <- c(insertFields, "medicare")
    insertValues <- c(insertValues, medicare)
  }

  if (missing(mhsacovg)) {
    mhsacovg <- defaults$mhsacovg
  }
  if (!is.null(mhsacovg)) {
    insertFields <- c(insertFields, "mhsacovg")
    insertValues <- c(insertValues, mhsacovg)
  }

  if (missing(netpay)) {
    netpay <- defaults$netpay
  }
  if (!is.null(netpay)) {
    insertFields <- c(insertFields, "netpay")
    insertValues <- c(insertValues, netpay)
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

  if (missing(proctyp)) {
    proctyp <- defaults$proctyp
  }
  if (!is.null(proctyp)) {
    insertFields <- c(insertFields, "proctyp")
    insertValues <- c(insertValues, proctyp)
  }

  if (missing(prov_id)) {
    prov_id <- defaults$prov_id
  }
  if (!is.null(prov_id)) {
    insertFields <- c(insertFields, "prov_id")
    insertValues <- c(insertValues, prov_id)
  }

  if (missing(qty)) {
    qty <- defaults$qty
  }
  if (!is.null(qty)) {
    insertFields <- c(insertFields, "qty")
    insertValues <- c(insertValues, qty)
  }

  if (missing(revcode)) {
    revcode <- defaults$revcode
  }
  if (!is.null(revcode)) {
    insertFields <- c(insertFields, "revcode")
    insertValues <- c(insertValues, revcode)
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

  if (missing(stdrace)) {
    stdrace <- defaults$stdrace
  }
  if (!is.null(stdrace)) {
    insertFields <- c(insertFields, "stdrace")
    insertValues <- c(insertValues, stdrace)
  }

  if (missing(stdsvc)) {
    stdsvc <- defaults$stdsvc
  }
  if (!is.null(stdsvc)) {
    insertFields <- c(insertFields, "stdsvc")
    insertValues <- c(insertValues, stdsvc)
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

add_long_term_care <- function(boe, cap, cob, coins, copay, deduct, dobyr, drugcovg, dx1, dx2, dx3, dx4, dxver, enrolid, fachdid, facprof, mas, mcasenum, mdc, medicare, mhsacovg, netpay, pay, pddate, plantyp, proc1, procgrp, proctyp, prov_id, qty, revcode, seqnum, sex, stdplac, stdprov, stdrace, stdsvc, svcdate, svcscat, tsvcdat, version, year, units, npi, msclmid) {
  defaults <- frameworkContext$defaultValues$long_term_care;
  insertFields <- c()
  insertValues <- c()
  if (missing(boe)) {
    boe <- defaults$boe
  }
  if (!is.null(boe)) {
    insertFields <- c(insertFields, "boe")
    insertValues <- c(insertValues, boe)
  }

  if (missing(cap)) {
    cap <- defaults$cap
  }
  if (!is.null(cap)) {
    insertFields <- c(insertFields, "cap")
    insertValues <- c(insertValues, cap)
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

  if (missing(drugcovg)) {
    drugcovg <- defaults$drugcovg
  }
  if (!is.null(drugcovg)) {
    insertFields <- c(insertFields, "drugcovg")
    insertValues <- c(insertValues, drugcovg)
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

  if (missing(dxver)) {
    dxver <- defaults$dxver
  }
  if (!is.null(dxver)) {
    insertFields <- c(insertFields, "dxver")
    insertValues <- c(insertValues, dxver)
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

  if (missing(mas)) {
    mas <- defaults$mas
  }
  if (!is.null(mas)) {
    insertFields <- c(insertFields, "mas")
    insertValues <- c(insertValues, mas)
  }

  if (missing(mcasenum)) {
    mcasenum <- defaults$mcasenum
  }
  if (!is.null(mcasenum)) {
    insertFields <- c(insertFields, "mcasenum")
    insertValues <- c(insertValues, mcasenum)
  }

  if (missing(mdc)) {
    mdc <- defaults$mdc
  }
  if (!is.null(mdc)) {
    insertFields <- c(insertFields, "mdc")
    insertValues <- c(insertValues, mdc)
  }

  if (missing(medicare)) {
    medicare <- defaults$medicare
  }
  if (!is.null(medicare)) {
    insertFields <- c(insertFields, "medicare")
    insertValues <- c(insertValues, medicare)
  }

  if (missing(mhsacovg)) {
    mhsacovg <- defaults$mhsacovg
  }
  if (!is.null(mhsacovg)) {
    insertFields <- c(insertFields, "mhsacovg")
    insertValues <- c(insertValues, mhsacovg)
  }

  if (missing(netpay)) {
    netpay <- defaults$netpay
  }
  if (!is.null(netpay)) {
    insertFields <- c(insertFields, "netpay")
    insertValues <- c(insertValues, netpay)
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

  if (missing(proctyp)) {
    proctyp <- defaults$proctyp
  }
  if (!is.null(proctyp)) {
    insertFields <- c(insertFields, "proctyp")
    insertValues <- c(insertValues, proctyp)
  }

  if (missing(prov_id)) {
    prov_id <- defaults$prov_id
  }
  if (!is.null(prov_id)) {
    insertFields <- c(insertFields, "prov_id")
    insertValues <- c(insertValues, prov_id)
  }

  if (missing(qty)) {
    qty <- defaults$qty
  }
  if (!is.null(qty)) {
    insertFields <- c(insertFields, "qty")
    insertValues <- c(insertValues, qty)
  }

  if (missing(revcode)) {
    revcode <- defaults$revcode
  }
  if (!is.null(revcode)) {
    insertFields <- c(insertFields, "revcode")
    insertValues <- c(insertValues, revcode)
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

  if (missing(stdrace)) {
    stdrace <- defaults$stdrace
  }
  if (!is.null(stdrace)) {
    insertFields <- c(insertFields, "stdrace")
    insertValues <- c(insertValues, stdrace)
  }

  if (missing(stdsvc)) {
    stdsvc <- defaults$stdsvc
  }
  if (!is.null(stdsvc)) {
    insertFields <- c(insertFields, "stdsvc")
    insertValues <- c(insertValues, stdsvc)
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

  statement <- paste0("INSERT INTO @source_schema.long_term_care (", paste(insertFields, collapse = ", "), ") VALUES ('", paste(insertValues, collapse = "', '"), "');")
  frameworkContext$insertSql = c(frameworkContext$insertSql, statement);
  invisible(statement);
}

add_outpatient_services <- function(boe, cap, cob, coins, copay, deduct, dental, dobyr, drugcovg, dx1, dx2, dx3, dx4, dxver, enrolid, fachdid, facprof, mas, mcasenum, mdc, medicare, mhsacovg, netpay, pay, pddate, plantyp, proc1, procgrp, proctyp, prov_id, qty, revcode, seqnum, sex, stdplac, stdprov, stdrace, stdsvc, svcdate, svcscat, tsvcdat, version, year, units, npi, msclmid) {
  defaults <- frameworkContext$defaultValues$outpatient_services;
  insertFields <- c()
  insertValues <- c()
  if (missing(boe)) {
    boe <- defaults$boe
  }
  if (!is.null(boe)) {
    insertFields <- c(insertFields, "boe")
    insertValues <- c(insertValues, boe)
  }

  if (missing(cap)) {
    cap <- defaults$cap
  }
  if (!is.null(cap)) {
    insertFields <- c(insertFields, "cap")
    insertValues <- c(insertValues, cap)
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

  if (missing(deduct)) {
    deduct <- defaults$deduct
  }
  if (!is.null(deduct)) {
    insertFields <- c(insertFields, "deduct")
    insertValues <- c(insertValues, deduct)
  }

  if (missing(dental)) {
    dental <- defaults$dental
  }
  if (!is.null(dental)) {
    insertFields <- c(insertFields, "dental")
    insertValues <- c(insertValues, dental)
  }

  if (missing(dobyr)) {
    dobyr <- defaults$dobyr
  }
  if (!is.null(dobyr)) {
    insertFields <- c(insertFields, "dobyr")
    insertValues <- c(insertValues, dobyr)
  }

  if (missing(drugcovg)) {
    drugcovg <- defaults$drugcovg
  }
  if (!is.null(drugcovg)) {
    insertFields <- c(insertFields, "drugcovg")
    insertValues <- c(insertValues, drugcovg)
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

  if (missing(dxver)) {
    dxver <- defaults$dxver
  }
  if (!is.null(dxver)) {
    insertFields <- c(insertFields, "dxver")
    insertValues <- c(insertValues, dxver)
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

  if (missing(mas)) {
    mas <- defaults$mas
  }
  if (!is.null(mas)) {
    insertFields <- c(insertFields, "mas")
    insertValues <- c(insertValues, mas)
  }

  if (missing(mcasenum)) {
    mcasenum <- defaults$mcasenum
  }
  if (!is.null(mcasenum)) {
    insertFields <- c(insertFields, "mcasenum")
    insertValues <- c(insertValues, mcasenum)
  }

  if (missing(mdc)) {
    mdc <- defaults$mdc
  }
  if (!is.null(mdc)) {
    insertFields <- c(insertFields, "mdc")
    insertValues <- c(insertValues, mdc)
  }

  if (missing(medicare)) {
    medicare <- defaults$medicare
  }
  if (!is.null(medicare)) {
    insertFields <- c(insertFields, "medicare")
    insertValues <- c(insertValues, medicare)
  }

  if (missing(mhsacovg)) {
    mhsacovg <- defaults$mhsacovg
  }
  if (!is.null(mhsacovg)) {
    insertFields <- c(insertFields, "mhsacovg")
    insertValues <- c(insertValues, mhsacovg)
  }

  if (missing(netpay)) {
    netpay <- defaults$netpay
  }
  if (!is.null(netpay)) {
    insertFields <- c(insertFields, "netpay")
    insertValues <- c(insertValues, netpay)
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

  if (missing(proctyp)) {
    proctyp <- defaults$proctyp
  }
  if (!is.null(proctyp)) {
    insertFields <- c(insertFields, "proctyp")
    insertValues <- c(insertValues, proctyp)
  }

  if (missing(prov_id)) {
    prov_id <- defaults$prov_id
  }
  if (!is.null(prov_id)) {
    insertFields <- c(insertFields, "prov_id")
    insertValues <- c(insertValues, prov_id)
  }

  if (missing(qty)) {
    qty <- defaults$qty
  }
  if (!is.null(qty)) {
    insertFields <- c(insertFields, "qty")
    insertValues <- c(insertValues, qty)
  }

  if (missing(revcode)) {
    revcode <- defaults$revcode
  }
  if (!is.null(revcode)) {
    insertFields <- c(insertFields, "revcode")
    insertValues <- c(insertValues, revcode)
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

  if (missing(stdrace)) {
    stdrace <- defaults$stdrace
  }
  if (!is.null(stdrace)) {
    insertFields <- c(insertFields, "stdrace")
    insertValues <- c(insertValues, stdrace)
  }

  if (missing(stdsvc)) {
    stdsvc <- defaults$stdsvc
  }
  if (!is.null(stdsvc)) {
    insertFields <- c(insertFields, "stdsvc")
    insertValues <- c(insertValues, stdsvc)
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

