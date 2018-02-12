initFramework <- function() {
  frameworkContext <- new.env(parent = globalenv())
  assign('frameworkContext', frameworkContext, envir = globalenv())
  frameworkContext$inserts <- list()
  frameworkContext$expects <- list()
  frameworkContext$testId <- -1
  frameworkContext$testDescription <- ""
  frameworkContext$defaultValues <- new.env(parent = frameworkContext)

  defaults <- list()
  defaults$awp <- '0.0'
  defaults$boe <- '2'
  defaults$cap <- '0'
  defaults$cob <- '0.0'
  defaults$coins <- '0.0'
  defaults$copay <- '0.0'
  defaults$dawind <- '  '
  defaults$daysupp <- '30'
  defaults$deaclas <- '6'
  defaults$deduct <- '0.0'
  defaults$dispfee <- '0.0'
  defaults$dobyr <- '1960'
  defaults$drugcovg <- '1'
  defaults$generid <- '999999'
  defaults$genind <- '4'
  defaults$ingcost <- '0.0'
  defaults$maintin <- '2'
  defaults$mas <- '9'
  defaults$medicare <- '0'
  defaults$metqty <- '30.0'
  defaults$mhsacovg <- '1'
  defaults$ndcnum <- '00173068220'
  defaults$netpay <- '0.0'
  defaults$pay <- '0.0'
  defaults$pddate <- '2016-03-11'
  defaults$plantyp <- '2'
  defaults$qty <- '1'
  defaults$refill <- '0'
  defaults$sex <- '2'
  defaults$stdrace <- '1'
  defaults$svcdate <- '2016-03-01'
  defaults$thercls <- '69'
  defaults$thergrp <- '08'
  defaults$version <- '10'
  defaults$year <- '2016'
  defaults$gpi <- '44201010103410'
  assign('drug_claims', defaults, envir = frameworkContext$defaultValues)

  defaults <- list()
  defaults$boe <- '4'
  defaults$cap <- '1'
  defaults$dobyr <- '2006'
  defaults$drugcovg <- '1'
  defaults$dtend <- '2016-06-30'
  defaults$dtstart <- '2016-06-01'
  defaults$mas <- '9'
  defaults$medicare <- '0'
  defaults$memdays <- '31'
  defaults$mhsacovg <- '1'
  defaults$plantyp <- '2'
  defaults$sex <- '2'
  defaults$stdrace <- '1'
  defaults$version <- '10'
  defaults$year <- '2016'
  assign('enrollment_detail', defaults, envir = frameworkContext$defaultValues)

  defaults <- list()
  defaults$boe <- '4'
  defaults$cap <- '1'
  defaults$dobyr <- '2006'
  defaults$drugcovg <- '1'
  defaults$enrind1 <- '1'
  defaults$enrind10 <- '1'
  defaults$enrind11 <- '1'
  defaults$enrind12 <- '1'
  defaults$enrind2 <- '1'
  defaults$enrind3 <- '1'
  defaults$enrind4 <- '1'
  defaults$enrind5 <- '1'
  defaults$enrind6 <- '1'
  defaults$enrind7 <- '1'
  defaults$enrind8 <- '1'
  defaults$enrind9 <- '1'
  defaults$enrmon <- '12'
  defaults$mas <- '9'
  defaults$medicare <- '0'
  defaults$memday1 <- '31'
  defaults$memday10 <- '31'
  defaults$memday11 <- '30'
  defaults$memday12 <- '31'
  defaults$memday2 <- '28'
  defaults$memday3 <- '31'
  defaults$memday4 <- '30'
  defaults$memday5 <- '31'
  defaults$memday6 <- '30'
  defaults$memday7 <- '31'
  defaults$memday8 <- '31'
  defaults$memday9 <- '30'
  defaults$memdays <- '365'
  defaults$mhsacovg <- '1'
  defaults$plntyp1 <- '2'
  defaults$plntyp10 <- '4'
  defaults$plntyp11 <- '4'
  defaults$plntyp12 <- '4'
  defaults$plntyp2 <- '2'
  defaults$plntyp3 <- '2'
  defaults$plntyp4 <- '2'
  defaults$plntyp5 <- '2'
  defaults$plntyp6 <- '2'
  defaults$plntyp7 <- '4'
  defaults$plntyp8 <- '4'
  defaults$plntyp9 <- '4'
  defaults$sex <- '2'
  defaults$stdrace <- '1'
  defaults$version <- '10'
  defaults$year <- '2016'
  assign('enrollment_summary', defaults, envir = frameworkContext$defaultValues)

  defaults <- list()
  defaults$billtyp <- '131'
  defaults$boe <- '2'
  defaults$cap <- '0'
  defaults$cob <- '0.0'
  defaults$coins <- '0.0'
  defaults$copay <- '0.0'
  defaults$deduct <- '0.0'
  defaults$dobyr <- '2008'
  defaults$drugcovg <- '1'
  defaults$dstatus <- '01'
  defaults$dx1 <- '       '
  defaults$dx2 <- '       '
  defaults$dx3 <- '       '
  defaults$dx4 <- '       '
  defaults$dx5 <- '       '
  defaults$dx6 <- '       '
  defaults$dx7 <- '       '
  defaults$dx8 <- '       '
  defaults$dx9 <- 'v5869'
  defaults$dxver <- ' '
  defaults$enrolid <- '20032786215'
  defaults$mas <- '9'
  defaults$mdc <- '23'
  defaults$medicare <- '0'
  defaults$mhsacovg <- '1'
  defaults$netpay <- '0.0'
  defaults$pddate <- '2016-04-22'
  defaults$plantyp <- '2'
  defaults$proc1 <- '       '
  defaults$proc2 <- '3893'
  defaults$proc3 <- '734'
  defaults$proc4 <- '9604'
  defaults$proc5 <- '9604'
  defaults$proc6 <- '8856'
  defaults$sex <- '2'
  defaults$stdplac <- '22'
  defaults$stdprov <- '1'
  defaults$stdrace <- '1'
  defaults$svcdate <- '2016-06-01'
  defaults$tsvcdat <- '2016-05-31'
  defaults$version <- '01'
  defaults$year <- '2016'
  assign('facility_header', defaults, envir = frameworkContext$defaultValues)

  defaults <- list()
  defaults$admdate <- '2016-02-02'
  defaults$admtyp <- '3'
  defaults$boe <- '2'
  defaults$cap <- '0'
  defaults$days <- '2'
  defaults$disdate <- '2016-02-04'
  defaults$dobyr <- '2016'
  defaults$drg <- '795'
  defaults$drugcovg <- '1'
  defaults$dstatus <- '01'
  defaults$dx1 <- 'V3000  '
  defaults$dx10 <- '       '
  defaults$dx11 <- '       '
  defaults$dx12 <- '       '
  defaults$dx13 <- '       '
  defaults$dx14 <- '       '
  defaults$dx15 <- '       '
  defaults$dx2 <- '25000  '
  defaults$dx3 <- '       '
  defaults$dx4 <- '       '
  defaults$dx5 <- '       '
  defaults$dx6 <- '       '
  defaults$dx7 <- '       '
  defaults$dx8 <- '       '
  defaults$dx9 <- '       '
  defaults$dxver <- ' '
  defaults$enrolid <- '20021433641'
  defaults$hospnet <- '0.0'
  defaults$hosppay <- '0.0'
  defaults$mas <- '9'
  defaults$mdc <- '14'
  defaults$medicare <- '0'
  defaults$mhsacovg <- '1'
  defaults$pddate <- '2016-06-24'
  defaults$pdx <- 'V3000  '
  defaults$physnet <- '0.0'
  defaults$physpay <- '0.0'
  defaults$plantyp <- '2'
  defaults$poadx14 <- '1'
  defaults$poadx15 <- '1'
  defaults$pproc <- '       '
  defaults$proc1 <- '       '
  defaults$proc10 <- '       '
  defaults$proc11 <- '       '
  defaults$proc12 <- '       '
  defaults$proc13 <- '       '
  defaults$proc14 <- '       '
  defaults$proc15 <- '       '
  defaults$proc2 <- '7359   '
  defaults$proc3 <- '       '
  defaults$proc4 <- '       '
  defaults$proc5 <- '       '
  defaults$proc6 <- '       '
  defaults$proc7 <- '       '
  defaults$proc8 <- '       '
  defaults$proc9 <- '       '
  defaults$sex <- '2'
  defaults$stdrace <- '1'
  defaults$totcob <- '0.0'
  defaults$totcoins <- '0.0'
  defaults$totcopay <- '0.0'
  defaults$totded <- '0.0'
  defaults$totnet <- '0.0'
  defaults$totpay <- '0.0'
  defaults$version <- '01'
  defaults$year <- '2016'
  assign('inpatient_admissions', defaults, envir = frameworkContext$defaultValues)

  defaults <- list()
  defaults$admdate <- '2016-01-04'
  defaults$admtyp <- '2'
  defaults$boe <- '2'
  defaults$cap <- '0'
  defaults$cob <- '0.0'
  defaults$coins <- '0.0'
  defaults$copay <- '0.0'
  defaults$deduct <- '0.0'
  defaults$disdate <- '2016-02-19'
  defaults$dobyr <- '2016'
  defaults$drg <- '775'
  defaults$drugcovg <- '1'
  defaults$dstatus <- '01'
  defaults$dx1 <- 'V3000  '
  defaults$dx2 <- '       '
  defaults$dx3 <- '       '
  defaults$dx4 <- '       '
  defaults$dxver <- ' '
  defaults$enrolid <- '20033635890'
  defaults$facprof <- 'F'
  defaults$mas <- '9'
  defaults$mdc <- '14'
  defaults$medicare <- '0'
  defaults$mhsacovg <- '1'
  defaults$netpay <- '0.0'
  defaults$pay <- '0.0'
  defaults$pddate <- '2015-03-31'
  defaults$pdx <- 'V3000  '
  defaults$plantyp <- '2'
  defaults$pproc <- '       '
  defaults$proc1 <- '       '
  defaults$proctyp <- ' '
  defaults$qty <- '1'
  defaults$revcode <- '    '
  defaults$sex <- '2'
  defaults$stdplac <- '21'
  defaults$stdprov <- '1'
  defaults$stdrace <- '1'
  defaults$svcdate <- '2016-02-22'
  defaults$svcscat <- '20226'
  defaults$tsvcdat <- '2016-01-28'
  defaults$version <- '10'
  defaults$year <- '2016'
  assign('inpatient_services', defaults, envir = frameworkContext$defaultValues)

  defaults <- list()
  defaults$boe <- '1'
  defaults$cap <- '0'
  defaults$cob <- '0.0'
  defaults$coins <- '0.0'
  defaults$copay <- '0.0'
  defaults$deduct <- '0.0'
  defaults$dobyr <- '1926'
  defaults$drugcovg <- '0'
  defaults$dx1 <- '       '
  defaults$dx2 <- '       '
  defaults$dx3 <- '       '
  defaults$dx4 <- '       '
  defaults$dxver <- ' '
  defaults$enrolid <- '20029713968'
  defaults$facprof <- 'F'
  defaults$mas <- '9'
  defaults$mdc <- '01'
  defaults$medicare <- '1'
  defaults$mhsacovg <- '1'
  defaults$netpay <- '0.0'
  defaults$pay <- '0.0'
  defaults$pddate <- '2010-08-30'
  defaults$plantyp <- '2'
  defaults$proc1 <- '       '
  defaults$proctyp <- ' '
  defaults$qty <- '1'
  defaults$revcode <- '0190'
  defaults$sex <- '2'
  defaults$stdplac <- '31'
  defaults$stdrace <- '1'
  defaults$svcdate <- '2016-06-01'
  defaults$svcscat <- '10210'
  defaults$tsvcdat <- '2016-06-30'
  defaults$version <- '10'
  defaults$year <- '2016'
  assign('long_term_care', defaults, envir = frameworkContext$defaultValues)

  defaults <- list()
  defaults$boe <- '2'
  defaults$cap <- '0'
  defaults$cob <- '0.0'
  defaults$coins <- '0.0'
  defaults$copay <- '0.0'
  defaults$deduct <- '0.0'
  defaults$dental <- '0'
  defaults$dobyr <- '2007'
  defaults$drugcovg <- '1'
  defaults$dx1 <- '       '
  defaults$dx2 <- '       '
  defaults$dx3 <- '       '
  defaults$dx4 <- '       '
  defaults$dxver <- ' '
  defaults$facprof <- 'P'
  defaults$mas <- '9'
  defaults$mdc <- '23'
  defaults$medicare <- '0'
  defaults$mhsacovg <- '1'
  defaults$netpay <- '0.0'
  defaults$pay <- '0.0'
  defaults$pddate <- '2016-04-22'
  defaults$plantyp <- '2'
  defaults$proc1 <- '       '
  defaults$proctyp <- '1'
  defaults$qty <- '1'
  defaults$revcode <- '    '
  defaults$sex <- '2'
  defaults$stdplac <- '11'
  defaults$stdprov <- '1'
  defaults$stdrace <- '1'
  defaults$svcdate <- '2016-02-01'
  defaults$svcscat <- '12220'
  defaults$tsvcdat <- '2016-02-29'
  defaults$version <- '10'
  defaults$year <- '2016'
  assign('outpatient_services', defaults, envir = frameworkContext$defaultValues)
}

initFramework()

set_defaults_drug_claims <- function(awp, boe, cap, cob, coins, copay, dawind, daysupp, deaclas, deduct, dispfee, dobyr, drugcovg, enrolid, generid, genind, ingcost, maintin, mas, mcasenum, medicare, metqty, mhsacovg, ndcnum, netpay, pay, pddate, pharmid, plantyp, qty, refill, seqnum, sex, stdrace, svcdate, thercls, thergrp, version, year, gpi) {
  defaults <- get('drug_claims', envir = frameworkContext$defaultValues)
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
  if (!missing(gpi)) {
    defaults$gpi <- gpi
  }
  assign('drug_claims', defaults, envir = frameworkContext$defaultValues)
  invisible(defaults)
}

set_defaults_enrollment_detail <- function(boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, mcasenum, medicare, memdays, mhsacovg, plantyp, seqnum, sex, stdrace, version, year) {
  defaults <- get('enrollment_detail', envir = frameworkContext$defaultValues)
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
  assign('enrollment_detail', defaults, envir = frameworkContext$defaultValues)
  invisible(defaults)
}

set_defaults_enrollment_summary <- function(boe, cap, dobyr, drugcovg, enrind1, enrind10, enrind11, enrind12, enrind2, enrind3, enrind4, enrind5, enrind6, enrind7, enrind8, enrind9, enrmon, enrolid, mas, mcasenum, medicare, memday1, memday10, memday11, memday12, memday2, memday3, memday4, memday5, memday6, memday7, memday8, memday9, memdays, mhsacovg, plntyp1, plntyp10, plntyp11, plntyp12, plntyp2, plntyp3, plntyp4, plntyp5, plntyp6, plntyp7, plntyp8, plntyp9, seqnum, sex, stdrace, version, year) {
  defaults <- get('enrollment_summary', envir = frameworkContext$defaultValues)
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
  assign('enrollment_summary', defaults, envir = frameworkContext$defaultValues)
  invisible(defaults)
}

set_defaults_facility_header <- function(billtyp, boe, cap, caseid, cob, coins, copay, deduct, dobyr, drugcovg, dstatus, dx1, dx2, dx3, dx4, dx5, dx6, dx7, dx8, dx9, dxver, enrolid, fachdid, mas, mcasenum, mdc, medicare, mhsacovg, netpay, pddate, plantyp, poadx1, poadx2, poadx3, poadx4, poadx5, poadx6, poadx7, poadx8, poadx9, proc1, proc2, proc3, proc4, proc5, proc6, prov_id, seqnum, sex, stdplac, stdprov, stdrace, svcdate, tsvcdat, version, year, npi, msclmid) {
  defaults <- get('facility_header', envir = frameworkContext$defaultValues)
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
  if (!missing(poadx1)) {
    defaults$poadx1 <- poadx1
  }
  if (!missing(poadx2)) {
    defaults$poadx2 <- poadx2
  }
  if (!missing(poadx3)) {
    defaults$poadx3 <- poadx3
  }
  if (!missing(poadx4)) {
    defaults$poadx4 <- poadx4
  }
  if (!missing(poadx5)) {
    defaults$poadx5 <- poadx5
  }
  if (!missing(poadx6)) {
    defaults$poadx6 <- poadx6
  }
  if (!missing(poadx7)) {
    defaults$poadx7 <- poadx7
  }
  if (!missing(poadx8)) {
    defaults$poadx8 <- poadx8
  }
  if (!missing(poadx9)) {
    defaults$poadx9 <- poadx9
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
  assign('facility_header', defaults, envir = frameworkContext$defaultValues)
  invisible(defaults)
}

set_defaults_inpatient_admissions <- function(admdate, admtyp, boe, cap, caseid, days, disdate, dobyr, drg, drugcovg, dstatus, dx1, dx10, dx11, dx12, dx13, dx14, dx15, dx2, dx3, dx4, dx5, dx6, dx7, dx8, dx9, dxver, enrolid, hosp_id, hospnet, hosppay, mas, mcasenum, mdc, medicare, mhsacovg, pddate, pdx, phys_id, physnet, physpay, plantyp, poapdx, poadx1, poadx2, poadx3, poadx4, poadx5, poadx6, poadx7, poadx8, poadx9, poadx10, poadx11, poadx12, poadx13, poadx14, poadx15, pproc, proc1, proc10, proc11, proc12, proc13, proc14, proc15, proc2, proc3, proc4, proc5, proc6, proc7, proc8, proc9, seqnum, sex, stdrace, totcob, totcoins, totcopay, totded, totnet, totpay, version, year) {
  defaults <- get('inpatient_admissions', envir = frameworkContext$defaultValues)
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
  if (!missing(poapdx)) {
    defaults$poapdx <- poapdx
  }
  if (!missing(poadx1)) {
    defaults$poadx1 <- poadx1
  }
  if (!missing(poadx2)) {
    defaults$poadx2 <- poadx2
  }
  if (!missing(poadx3)) {
    defaults$poadx3 <- poadx3
  }
  if (!missing(poadx4)) {
    defaults$poadx4 <- poadx4
  }
  if (!missing(poadx5)) {
    defaults$poadx5 <- poadx5
  }
  if (!missing(poadx6)) {
    defaults$poadx6 <- poadx6
  }
  if (!missing(poadx7)) {
    defaults$poadx7 <- poadx7
  }
  if (!missing(poadx8)) {
    defaults$poadx8 <- poadx8
  }
  if (!missing(poadx9)) {
    defaults$poadx9 <- poadx9
  }
  if (!missing(poadx10)) {
    defaults$poadx10 <- poadx10
  }
  if (!missing(poadx11)) {
    defaults$poadx11 <- poadx11
  }
  if (!missing(poadx12)) {
    defaults$poadx12 <- poadx12
  }
  if (!missing(poadx13)) {
    defaults$poadx13 <- poadx13
  }
  if (!missing(poadx14)) {
    defaults$poadx14 <- poadx14
  }
  if (!missing(poadx15)) {
    defaults$poadx15 <- poadx15
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
  assign('inpatient_admissions', defaults, envir = frameworkContext$defaultValues)
  invisible(defaults)
}

set_defaults_inpatient_services <- function(admdate, admtyp, boe, cap, caseid, cob, coins, copay, deduct, disdate, dobyr, drg, drugcovg, dstatus, dx1, dx2, dx3, dx4, dxver, enrolid, fachdid, facprof, mas, mcasenum, mdc, medicare, mhsacovg, netpay, pay, pddate, pdx, plantyp, pproc, proc1, proctyp, prov_id, qty, revcode, seqnum, sex, stdplac, stdprov, stdrace, stdsvc, svcdate, svcscat, tsvcdat, version, year, units, npi, msclmid) {
  defaults <- get('inpatient_services', envir = frameworkContext$defaultValues)
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
  assign('inpatient_services', defaults, envir = frameworkContext$defaultValues)
  invisible(defaults)
}

set_defaults_long_term_care <- function(boe, cap, cob, coins, copay, deduct, dobyr, drugcovg, dx1, dx2, dx3, dx4, dxver, enrolid, fachdid, facprof, mas, mcasenum, mdc, medicare, mhsacovg, netpay, pay, pddate, plantyp, proc1, procgrp, proctyp, prov_id, qty, revcode, seqnum, sex, stdplac, stdprov, stdrace, stdsvc, svcdate, svcscat, tsvcdat, version, year, units, npi, msclmid) {
  defaults <- get('long_term_care', envir = frameworkContext$defaultValues)
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
  assign('long_term_care', defaults, envir = frameworkContext$defaultValues)
  invisible(defaults)
}

set_defaults_outpatient_services <- function(boe, cap, cob, coins, copay, deduct, dental, dobyr, drugcovg, dx1, dx2, dx3, dx4, dxver, enrolid, fachdid, facprof, mas, mcasenum, mdc, medicare, mhsacovg, netpay, pay, pddate, plantyp, proc1, procgrp, proctyp, prov_id, qty, revcode, seqnum, sex, stdplac, stdprov, stdrace, stdsvc, svcdate, svcscat, tsvcdat, version, year, units, npi, msclmid) {
  defaults <- get('outpatient_services', envir = frameworkContext$defaultValues)
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
  assign('outpatient_services', defaults, envir = frameworkContext$defaultValues)
  invisible(defaults)
}

get_defaults_drug_claims <- function() {
  defaults <- get('drug_claims', envir = frameworkContext$defaultValues)
  return(defaults)
}

get_defaults_enrollment_detail <- function() {
  defaults <- get('enrollment_detail', envir = frameworkContext$defaultValues)
  return(defaults)
}

get_defaults_enrollment_summary <- function() {
  defaults <- get('enrollment_summary', envir = frameworkContext$defaultValues)
  return(defaults)
}

get_defaults_facility_header <- function() {
  defaults <- get('facility_header', envir = frameworkContext$defaultValues)
  return(defaults)
}

get_defaults_inpatient_admissions <- function() {
  defaults <- get('inpatient_admissions', envir = frameworkContext$defaultValues)
  return(defaults)
}

get_defaults_inpatient_services <- function() {
  defaults <- get('inpatient_services', envir = frameworkContext$defaultValues)
  return(defaults)
}

get_defaults_long_term_care <- function() {
  defaults <- get('long_term_care', envir = frameworkContext$defaultValues)
  return(defaults)
}

get_defaults_outpatient_services <- function() {
  defaults <- get('outpatient_services', envir = frameworkContext$defaultValues)
  return(defaults)
}

declareTestGroup <- function(groupName, id) {
  frameworkContext$groupIndex <- frameworkContext$groupIndex + 1 ;
  frameworkContext$currentGroup <- {}
  
  frameworkContext$currentGroup$groupName <- groupName;
  frameworkContext$currentGroup$groupItemIndex <- -1;
  sql <- c(paste0(groupName));
  frameworkContext$testId <- id
  inserts <- list(testId = frameworkContext$testId, sql = sql)
  frameworkContext$inserts[[length(frameworkContext$inserts) + 1]] <- inserts
}

declareTest <- function(id, description) {
  frameworkContext$testId <- id
  frameworkContext$testDescription <- description
}

add_drug_claims <- function(awp, boe, cap, cob, coins, copay, dawind, daysupp, deaclas, deduct, dispfee, dobyr, drugcovg, enrolid, generid, genind, ingcost, maintin, mas, mcasenum, medicare, metqty, mhsacovg, ndcnum, netpay, pay, pddate, pharmid, plantyp, qty, refill, seqnum, sex, stdrace, svcdate, thercls, thergrp, version, year, gpi) {
  defaults <- get('drug_claims', envir = frameworkContext$defaultValues)
  fields <- c()
  values <- c()
  if (missing(awp)) {
    awp <- defaults$awp
  }
  if (!is.null(awp)) {
    fields <- c(fields, "awp")
    values <- c(values, if (is.null(awp)) "NULL" else if (is(awp, "subQuery")) paste0("(", as.character(awp), ")") else paste0("'", as.character(awp), "'"))
  }

  if (missing(boe)) {
    boe <- defaults$boe
  }
  if (!is.null(boe)) {
    fields <- c(fields, "boe")
    values <- c(values, if (is.null(boe)) "NULL" else if (is(boe, "subQuery")) paste0("(", as.character(boe), ")") else paste0("'", as.character(boe), "'"))
  }

  if (missing(cap)) {
    cap <- defaults$cap
  }
  if (!is.null(cap)) {
    fields <- c(fields, "cap")
    values <- c(values, if (is.null(cap)) "NULL" else if (is(cap, "subQuery")) paste0("(", as.character(cap), ")") else paste0("'", as.character(cap), "'"))
  }

  if (missing(cob)) {
    cob <- defaults$cob
  }
  if (!is.null(cob)) {
    fields <- c(fields, "cob")
    values <- c(values, if (is.null(cob)) "NULL" else if (is(cob, "subQuery")) paste0("(", as.character(cob), ")") else paste0("'", as.character(cob), "'"))
  }

  if (missing(coins)) {
    coins <- defaults$coins
  }
  if (!is.null(coins)) {
    fields <- c(fields, "coins")
    values <- c(values, if (is.null(coins)) "NULL" else if (is(coins, "subQuery")) paste0("(", as.character(coins), ")") else paste0("'", as.character(coins), "'"))
  }

  if (missing(copay)) {
    copay <- defaults$copay
  }
  if (!is.null(copay)) {
    fields <- c(fields, "copay")
    values <- c(values, if (is.null(copay)) "NULL" else if (is(copay, "subQuery")) paste0("(", as.character(copay), ")") else paste0("'", as.character(copay), "'"))
  }

  if (missing(dawind)) {
    dawind <- defaults$dawind
  }
  if (!is.null(dawind)) {
    fields <- c(fields, "dawind")
    values <- c(values, if (is.null(dawind)) "NULL" else if (is(dawind, "subQuery")) paste0("(", as.character(dawind), ")") else paste0("'", as.character(dawind), "'"))
  }

  if (missing(daysupp)) {
    daysupp <- defaults$daysupp
  }
  if (!is.null(daysupp)) {
    fields <- c(fields, "daysupp")
    values <- c(values, if (is.null(daysupp)) "NULL" else if (is(daysupp, "subQuery")) paste0("(", as.character(daysupp), ")") else paste0("'", as.character(daysupp), "'"))
  }

  if (missing(deaclas)) {
    deaclas <- defaults$deaclas
  }
  if (!is.null(deaclas)) {
    fields <- c(fields, "deaclas")
    values <- c(values, if (is.null(deaclas)) "NULL" else if (is(deaclas, "subQuery")) paste0("(", as.character(deaclas), ")") else paste0("'", as.character(deaclas), "'"))
  }

  if (missing(deduct)) {
    deduct <- defaults$deduct
  }
  if (!is.null(deduct)) {
    fields <- c(fields, "deduct")
    values <- c(values, if (is.null(deduct)) "NULL" else if (is(deduct, "subQuery")) paste0("(", as.character(deduct), ")") else paste0("'", as.character(deduct), "'"))
  }

  if (missing(dispfee)) {
    dispfee <- defaults$dispfee
  }
  if (!is.null(dispfee)) {
    fields <- c(fields, "dispfee")
    values <- c(values, if (is.null(dispfee)) "NULL" else if (is(dispfee, "subQuery")) paste0("(", as.character(dispfee), ")") else paste0("'", as.character(dispfee), "'"))
  }

  if (missing(dobyr)) {
    dobyr <- defaults$dobyr
  }
  if (!is.null(dobyr)) {
    fields <- c(fields, "dobyr")
    values <- c(values, if (is.null(dobyr)) "NULL" else if (is(dobyr, "subQuery")) paste0("(", as.character(dobyr), ")") else paste0("'", as.character(dobyr), "'"))
  }

  if (missing(drugcovg)) {
    drugcovg <- defaults$drugcovg
  }
  if (!is.null(drugcovg)) {
    fields <- c(fields, "drugcovg")
    values <- c(values, if (is.null(drugcovg)) "NULL" else if (is(drugcovg, "subQuery")) paste0("(", as.character(drugcovg), ")") else paste0("'", as.character(drugcovg), "'"))
  }

  if (missing(enrolid)) {
    enrolid <- defaults$enrolid
  }
  if (!is.null(enrolid)) {
    fields <- c(fields, "enrolid")
    values <- c(values, if (is.null(enrolid)) "NULL" else if (is(enrolid, "subQuery")) paste0("(", as.character(enrolid), ")") else paste0("'", as.character(enrolid), "'"))
  }

  if (missing(generid)) {
    generid <- defaults$generid
  }
  if (!is.null(generid)) {
    fields <- c(fields, "generid")
    values <- c(values, if (is.null(generid)) "NULL" else if (is(generid, "subQuery")) paste0("(", as.character(generid), ")") else paste0("'", as.character(generid), "'"))
  }

  if (missing(genind)) {
    genind <- defaults$genind
  }
  if (!is.null(genind)) {
    fields <- c(fields, "genind")
    values <- c(values, if (is.null(genind)) "NULL" else if (is(genind, "subQuery")) paste0("(", as.character(genind), ")") else paste0("'", as.character(genind), "'"))
  }

  if (missing(ingcost)) {
    ingcost <- defaults$ingcost
  }
  if (!is.null(ingcost)) {
    fields <- c(fields, "ingcost")
    values <- c(values, if (is.null(ingcost)) "NULL" else if (is(ingcost, "subQuery")) paste0("(", as.character(ingcost), ")") else paste0("'", as.character(ingcost), "'"))
  }

  if (missing(maintin)) {
    maintin <- defaults$maintin
  }
  if (!is.null(maintin)) {
    fields <- c(fields, "maintin")
    values <- c(values, if (is.null(maintin)) "NULL" else if (is(maintin, "subQuery")) paste0("(", as.character(maintin), ")") else paste0("'", as.character(maintin), "'"))
  }

  if (missing(mas)) {
    mas <- defaults$mas
  }
  if (!is.null(mas)) {
    fields <- c(fields, "mas")
    values <- c(values, if (is.null(mas)) "NULL" else if (is(mas, "subQuery")) paste0("(", as.character(mas), ")") else paste0("'", as.character(mas), "'"))
  }

  if (missing(mcasenum)) {
    mcasenum <- defaults$mcasenum
  }
  if (!is.null(mcasenum)) {
    fields <- c(fields, "mcasenum")
    values <- c(values, if (is.null(mcasenum)) "NULL" else if (is(mcasenum, "subQuery")) paste0("(", as.character(mcasenum), ")") else paste0("'", as.character(mcasenum), "'"))
  }

  if (missing(medicare)) {
    medicare <- defaults$medicare
  }
  if (!is.null(medicare)) {
    fields <- c(fields, "medicare")
    values <- c(values, if (is.null(medicare)) "NULL" else if (is(medicare, "subQuery")) paste0("(", as.character(medicare), ")") else paste0("'", as.character(medicare), "'"))
  }

  if (missing(metqty)) {
    metqty <- defaults$metqty
  }
  if (!is.null(metqty)) {
    fields <- c(fields, "metqty")
    values <- c(values, if (is.null(metqty)) "NULL" else if (is(metqty, "subQuery")) paste0("(", as.character(metqty), ")") else paste0("'", as.character(metqty), "'"))
  }

  if (missing(mhsacovg)) {
    mhsacovg <- defaults$mhsacovg
  }
  if (!is.null(mhsacovg)) {
    fields <- c(fields, "mhsacovg")
    values <- c(values, if (is.null(mhsacovg)) "NULL" else if (is(mhsacovg, "subQuery")) paste0("(", as.character(mhsacovg), ")") else paste0("'", as.character(mhsacovg), "'"))
  }

  if (missing(ndcnum)) {
    ndcnum <- defaults$ndcnum
  }
  if (!is.null(ndcnum)) {
    fields <- c(fields, "ndcnum")
    values <- c(values, if (is.null(ndcnum)) "NULL" else if (is(ndcnum, "subQuery")) paste0("(", as.character(ndcnum), ")") else paste0("'", as.character(ndcnum), "'"))
  }

  if (missing(netpay)) {
    netpay <- defaults$netpay
  }
  if (!is.null(netpay)) {
    fields <- c(fields, "netpay")
    values <- c(values, if (is.null(netpay)) "NULL" else if (is(netpay, "subQuery")) paste0("(", as.character(netpay), ")") else paste0("'", as.character(netpay), "'"))
  }

  if (missing(pay)) {
    pay <- defaults$pay
  }
  if (!is.null(pay)) {
    fields <- c(fields, "pay")
    values <- c(values, if (is.null(pay)) "NULL" else if (is(pay, "subQuery")) paste0("(", as.character(pay), ")") else paste0("'", as.character(pay), "'"))
  }

  if (missing(pddate)) {
    pddate <- defaults$pddate
  }
  if (!is.null(pddate)) {
    fields <- c(fields, "pddate")
    values <- c(values, if (is.null(pddate)) "NULL" else if (is(pddate, "subQuery")) paste0("(", as.character(pddate), ")") else paste0("'", as.character(pddate), "'"))
  }

  if (missing(pharmid)) {
    pharmid <- defaults$pharmid
  }
  if (!is.null(pharmid)) {
    fields <- c(fields, "pharmid")
    values <- c(values, if (is.null(pharmid)) "NULL" else if (is(pharmid, "subQuery")) paste0("(", as.character(pharmid), ")") else paste0("'", as.character(pharmid), "'"))
  }

  if (missing(plantyp)) {
    plantyp <- defaults$plantyp
  }
  if (!is.null(plantyp)) {
    fields <- c(fields, "plantyp")
    values <- c(values, if (is.null(plantyp)) "NULL" else if (is(plantyp, "subQuery")) paste0("(", as.character(plantyp), ")") else paste0("'", as.character(plantyp), "'"))
  }

  if (missing(qty)) {
    qty <- defaults$qty
  }
  if (!is.null(qty)) {
    fields <- c(fields, "qty")
    values <- c(values, if (is.null(qty)) "NULL" else if (is(qty, "subQuery")) paste0("(", as.character(qty), ")") else paste0("'", as.character(qty), "'"))
  }

  if (missing(refill)) {
    refill <- defaults$refill
  }
  if (!is.null(refill)) {
    fields <- c(fields, "refill")
    values <- c(values, if (is.null(refill)) "NULL" else if (is(refill, "subQuery")) paste0("(", as.character(refill), ")") else paste0("'", as.character(refill), "'"))
  }

  if (missing(seqnum)) {
    seqnum <- defaults$seqnum
  }
  if (!is.null(seqnum)) {
    fields <- c(fields, "seqnum")
    values <- c(values, if (is.null(seqnum)) "NULL" else if (is(seqnum, "subQuery")) paste0("(", as.character(seqnum), ")") else paste0("'", as.character(seqnum), "'"))
  }

  if (missing(sex)) {
    sex <- defaults$sex
  }
  if (!is.null(sex)) {
    fields <- c(fields, "sex")
    values <- c(values, if (is.null(sex)) "NULL" else if (is(sex, "subQuery")) paste0("(", as.character(sex), ")") else paste0("'", as.character(sex), "'"))
  }

  if (missing(stdrace)) {
    stdrace <- defaults$stdrace
  }
  if (!is.null(stdrace)) {
    fields <- c(fields, "stdrace")
    values <- c(values, if (is.null(stdrace)) "NULL" else if (is(stdrace, "subQuery")) paste0("(", as.character(stdrace), ")") else paste0("'", as.character(stdrace), "'"))
  }

  if (missing(svcdate)) {
    svcdate <- defaults$svcdate
  }
  if (!is.null(svcdate)) {
    fields <- c(fields, "svcdate")
    values <- c(values, if (is.null(svcdate)) "NULL" else if (is(svcdate, "subQuery")) paste0("(", as.character(svcdate), ")") else paste0("'", as.character(svcdate), "'"))
  }

  if (missing(thercls)) {
    thercls <- defaults$thercls
  }
  if (!is.null(thercls)) {
    fields <- c(fields, "thercls")
    values <- c(values, if (is.null(thercls)) "NULL" else if (is(thercls, "subQuery")) paste0("(", as.character(thercls), ")") else paste0("'", as.character(thercls), "'"))
  }

  if (missing(thergrp)) {
    thergrp <- defaults$thergrp
  }
  if (!is.null(thergrp)) {
    fields <- c(fields, "thergrp")
    values <- c(values, if (is.null(thergrp)) "NULL" else if (is(thergrp, "subQuery")) paste0("(", as.character(thergrp), ")") else paste0("'", as.character(thergrp), "'"))
  }

  if (missing(version)) {
    version <- defaults$version
  }
  if (!is.null(version)) {
    fields <- c(fields, "version")
    values <- c(values, if (is.null(version)) "NULL" else if (is(version, "subQuery")) paste0("(", as.character(version), ")") else paste0("'", as.character(version), "'"))
  }

  if (missing(year)) {
    year <- defaults$year
  }
  if (!is.null(year)) {
    fields <- c(fields, "year")
    values <- c(values, if (is.null(year)) "NULL" else if (is(year, "subQuery")) paste0("(", as.character(year), ")") else paste0("'", as.character(year), "'"))
  }

  if (missing(gpi)) {
    gpi <- defaults$gpi
  }
  if (!is.null(gpi)) {
    fields <- c(fields, "gpi")
    values <- c(values, if (is.null(gpi)) "NULL" else if (is(gpi, "subQuery")) paste0("(", as.character(gpi), ")") else paste0("'", as.character(gpi), "'"))
  }

  inserts <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, table = "drug_claims", fields = fields, values = values)
  frameworkContext$inserts[[length(frameworkContext$inserts) + 1]] <- inserts
  invisible(NULL)
}

add_enrollment_detail <- function(boe, cap, dobyr, drugcovg, dtend, dtstart, enrolid, mas, mcasenum, medicare, memdays, mhsacovg, plantyp, seqnum, sex, stdrace, version, year) {
  defaults <- get('enrollment_detail', envir = frameworkContext$defaultValues)
  fields <- c()
  values <- c()
  if (missing(boe)) {
    boe <- defaults$boe
  }
  if (!is.null(boe)) {
    fields <- c(fields, "boe")
    values <- c(values, if (is.null(boe)) "NULL" else if (is(boe, "subQuery")) paste0("(", as.character(boe), ")") else paste0("'", as.character(boe), "'"))
  }

  if (missing(cap)) {
    cap <- defaults$cap
  }
  if (!is.null(cap)) {
    fields <- c(fields, "cap")
    values <- c(values, if (is.null(cap)) "NULL" else if (is(cap, "subQuery")) paste0("(", as.character(cap), ")") else paste0("'", as.character(cap), "'"))
  }

  if (missing(dobyr)) {
    dobyr <- defaults$dobyr
  }
  if (!is.null(dobyr)) {
    fields <- c(fields, "dobyr")
    values <- c(values, if (is.null(dobyr)) "NULL" else if (is(dobyr, "subQuery")) paste0("(", as.character(dobyr), ")") else paste0("'", as.character(dobyr), "'"))
  }

  if (missing(drugcovg)) {
    drugcovg <- defaults$drugcovg
  }
  if (!is.null(drugcovg)) {
    fields <- c(fields, "drugcovg")
    values <- c(values, if (is.null(drugcovg)) "NULL" else if (is(drugcovg, "subQuery")) paste0("(", as.character(drugcovg), ")") else paste0("'", as.character(drugcovg), "'"))
  }

  if (missing(dtend)) {
    dtend <- defaults$dtend
  }
  if (!is.null(dtend)) {
    fields <- c(fields, "dtend")
    values <- c(values, if (is.null(dtend)) "NULL" else if (is(dtend, "subQuery")) paste0("(", as.character(dtend), ")") else paste0("'", as.character(dtend), "'"))
  }

  if (missing(dtstart)) {
    dtstart <- defaults$dtstart
  }
  if (!is.null(dtstart)) {
    fields <- c(fields, "dtstart")
    values <- c(values, if (is.null(dtstart)) "NULL" else if (is(dtstart, "subQuery")) paste0("(", as.character(dtstart), ")") else paste0("'", as.character(dtstart), "'"))
  }

  if (missing(enrolid)) {
    enrolid <- defaults$enrolid
  }
  if (!is.null(enrolid)) {
    fields <- c(fields, "enrolid")
    values <- c(values, if (is.null(enrolid)) "NULL" else if (is(enrolid, "subQuery")) paste0("(", as.character(enrolid), ")") else paste0("'", as.character(enrolid), "'"))
  }

  if (missing(mas)) {
    mas <- defaults$mas
  }
  if (!is.null(mas)) {
    fields <- c(fields, "mas")
    values <- c(values, if (is.null(mas)) "NULL" else if (is(mas, "subQuery")) paste0("(", as.character(mas), ")") else paste0("'", as.character(mas), "'"))
  }

  if (missing(mcasenum)) {
    mcasenum <- defaults$mcasenum
  }
  if (!is.null(mcasenum)) {
    fields <- c(fields, "mcasenum")
    values <- c(values, if (is.null(mcasenum)) "NULL" else if (is(mcasenum, "subQuery")) paste0("(", as.character(mcasenum), ")") else paste0("'", as.character(mcasenum), "'"))
  }

  if (missing(medicare)) {
    medicare <- defaults$medicare
  }
  if (!is.null(medicare)) {
    fields <- c(fields, "medicare")
    values <- c(values, if (is.null(medicare)) "NULL" else if (is(medicare, "subQuery")) paste0("(", as.character(medicare), ")") else paste0("'", as.character(medicare), "'"))
  }

  if (missing(memdays)) {
    memdays <- defaults$memdays
  }
  if (!is.null(memdays)) {
    fields <- c(fields, "memdays")
    values <- c(values, if (is.null(memdays)) "NULL" else if (is(memdays, "subQuery")) paste0("(", as.character(memdays), ")") else paste0("'", as.character(memdays), "'"))
  }

  if (missing(mhsacovg)) {
    mhsacovg <- defaults$mhsacovg
  }
  if (!is.null(mhsacovg)) {
    fields <- c(fields, "mhsacovg")
    values <- c(values, if (is.null(mhsacovg)) "NULL" else if (is(mhsacovg, "subQuery")) paste0("(", as.character(mhsacovg), ")") else paste0("'", as.character(mhsacovg), "'"))
  }

  if (missing(plantyp)) {
    plantyp <- defaults$plantyp
  }
  if (!is.null(plantyp)) {
    fields <- c(fields, "plantyp")
    values <- c(values, if (is.null(plantyp)) "NULL" else if (is(plantyp, "subQuery")) paste0("(", as.character(plantyp), ")") else paste0("'", as.character(plantyp), "'"))
  }

  if (missing(seqnum)) {
    seqnum <- defaults$seqnum
  }
  if (!is.null(seqnum)) {
    fields <- c(fields, "seqnum")
    values <- c(values, if (is.null(seqnum)) "NULL" else if (is(seqnum, "subQuery")) paste0("(", as.character(seqnum), ")") else paste0("'", as.character(seqnum), "'"))
  }

  if (missing(sex)) {
    sex <- defaults$sex
  }
  if (!is.null(sex)) {
    fields <- c(fields, "sex")
    values <- c(values, if (is.null(sex)) "NULL" else if (is(sex, "subQuery")) paste0("(", as.character(sex), ")") else paste0("'", as.character(sex), "'"))
  }

  if (missing(stdrace)) {
    stdrace <- defaults$stdrace
  }
  if (!is.null(stdrace)) {
    fields <- c(fields, "stdrace")
    values <- c(values, if (is.null(stdrace)) "NULL" else if (is(stdrace, "subQuery")) paste0("(", as.character(stdrace), ")") else paste0("'", as.character(stdrace), "'"))
  }

  if (missing(version)) {
    version <- defaults$version
  }
  if (!is.null(version)) {
    fields <- c(fields, "version")
    values <- c(values, if (is.null(version)) "NULL" else if (is(version, "subQuery")) paste0("(", as.character(version), ")") else paste0("'", as.character(version), "'"))
  }

  if (missing(year)) {
    year <- defaults$year
  }
  if (!is.null(year)) {
    fields <- c(fields, "year")
    values <- c(values, if (is.null(year)) "NULL" else if (is(year, "subQuery")) paste0("(", as.character(year), ")") else paste0("'", as.character(year), "'"))
  }

  inserts <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, table = "enrollment_detail", fields = fields, values = values)
  frameworkContext$inserts[[length(frameworkContext$inserts) + 1]] <- inserts
  invisible(NULL)
}

add_enrollment_summary <- function(boe, cap, dobyr, drugcovg, enrind1, enrind10, enrind11, enrind12, enrind2, enrind3, enrind4, enrind5, enrind6, enrind7, enrind8, enrind9, enrmon, enrolid, mas, mcasenum, medicare, memday1, memday10, memday11, memday12, memday2, memday3, memday4, memday5, memday6, memday7, memday8, memday9, memdays, mhsacovg, plntyp1, plntyp10, plntyp11, plntyp12, plntyp2, plntyp3, plntyp4, plntyp5, plntyp6, plntyp7, plntyp8, plntyp9, seqnum, sex, stdrace, version, year) {
  defaults <- get('enrollment_summary', envir = frameworkContext$defaultValues)
  fields <- c()
  values <- c()
  if (missing(boe)) {
    boe <- defaults$boe
  }
  if (!is.null(boe)) {
    fields <- c(fields, "boe")
    values <- c(values, if (is.null(boe)) "NULL" else if (is(boe, "subQuery")) paste0("(", as.character(boe), ")") else paste0("'", as.character(boe), "'"))
  }

  if (missing(cap)) {
    cap <- defaults$cap
  }
  if (!is.null(cap)) {
    fields <- c(fields, "cap")
    values <- c(values, if (is.null(cap)) "NULL" else if (is(cap, "subQuery")) paste0("(", as.character(cap), ")") else paste0("'", as.character(cap), "'"))
  }

  if (missing(dobyr)) {
    dobyr <- defaults$dobyr
  }
  if (!is.null(dobyr)) {
    fields <- c(fields, "dobyr")
    values <- c(values, if (is.null(dobyr)) "NULL" else if (is(dobyr, "subQuery")) paste0("(", as.character(dobyr), ")") else paste0("'", as.character(dobyr), "'"))
  }

  if (missing(drugcovg)) {
    drugcovg <- defaults$drugcovg
  }
  if (!is.null(drugcovg)) {
    fields <- c(fields, "drugcovg")
    values <- c(values, if (is.null(drugcovg)) "NULL" else if (is(drugcovg, "subQuery")) paste0("(", as.character(drugcovg), ")") else paste0("'", as.character(drugcovg), "'"))
  }

  if (missing(enrind1)) {
    enrind1 <- defaults$enrind1
  }
  if (!is.null(enrind1)) {
    fields <- c(fields, "enrind1")
    values <- c(values, if (is.null(enrind1)) "NULL" else if (is(enrind1, "subQuery")) paste0("(", as.character(enrind1), ")") else paste0("'", as.character(enrind1), "'"))
  }

  if (missing(enrind10)) {
    enrind10 <- defaults$enrind10
  }
  if (!is.null(enrind10)) {
    fields <- c(fields, "enrind10")
    values <- c(values, if (is.null(enrind10)) "NULL" else if (is(enrind10, "subQuery")) paste0("(", as.character(enrind10), ")") else paste0("'", as.character(enrind10), "'"))
  }

  if (missing(enrind11)) {
    enrind11 <- defaults$enrind11
  }
  if (!is.null(enrind11)) {
    fields <- c(fields, "enrind11")
    values <- c(values, if (is.null(enrind11)) "NULL" else if (is(enrind11, "subQuery")) paste0("(", as.character(enrind11), ")") else paste0("'", as.character(enrind11), "'"))
  }

  if (missing(enrind12)) {
    enrind12 <- defaults$enrind12
  }
  if (!is.null(enrind12)) {
    fields <- c(fields, "enrind12")
    values <- c(values, if (is.null(enrind12)) "NULL" else if (is(enrind12, "subQuery")) paste0("(", as.character(enrind12), ")") else paste0("'", as.character(enrind12), "'"))
  }

  if (missing(enrind2)) {
    enrind2 <- defaults$enrind2
  }
  if (!is.null(enrind2)) {
    fields <- c(fields, "enrind2")
    values <- c(values, if (is.null(enrind2)) "NULL" else if (is(enrind2, "subQuery")) paste0("(", as.character(enrind2), ")") else paste0("'", as.character(enrind2), "'"))
  }

  if (missing(enrind3)) {
    enrind3 <- defaults$enrind3
  }
  if (!is.null(enrind3)) {
    fields <- c(fields, "enrind3")
    values <- c(values, if (is.null(enrind3)) "NULL" else if (is(enrind3, "subQuery")) paste0("(", as.character(enrind3), ")") else paste0("'", as.character(enrind3), "'"))
  }

  if (missing(enrind4)) {
    enrind4 <- defaults$enrind4
  }
  if (!is.null(enrind4)) {
    fields <- c(fields, "enrind4")
    values <- c(values, if (is.null(enrind4)) "NULL" else if (is(enrind4, "subQuery")) paste0("(", as.character(enrind4), ")") else paste0("'", as.character(enrind4), "'"))
  }

  if (missing(enrind5)) {
    enrind5 <- defaults$enrind5
  }
  if (!is.null(enrind5)) {
    fields <- c(fields, "enrind5")
    values <- c(values, if (is.null(enrind5)) "NULL" else if (is(enrind5, "subQuery")) paste0("(", as.character(enrind5), ")") else paste0("'", as.character(enrind5), "'"))
  }

  if (missing(enrind6)) {
    enrind6 <- defaults$enrind6
  }
  if (!is.null(enrind6)) {
    fields <- c(fields, "enrind6")
    values <- c(values, if (is.null(enrind6)) "NULL" else if (is(enrind6, "subQuery")) paste0("(", as.character(enrind6), ")") else paste0("'", as.character(enrind6), "'"))
  }

  if (missing(enrind7)) {
    enrind7 <- defaults$enrind7
  }
  if (!is.null(enrind7)) {
    fields <- c(fields, "enrind7")
    values <- c(values, if (is.null(enrind7)) "NULL" else if (is(enrind7, "subQuery")) paste0("(", as.character(enrind7), ")") else paste0("'", as.character(enrind7), "'"))
  }

  if (missing(enrind8)) {
    enrind8 <- defaults$enrind8
  }
  if (!is.null(enrind8)) {
    fields <- c(fields, "enrind8")
    values <- c(values, if (is.null(enrind8)) "NULL" else if (is(enrind8, "subQuery")) paste0("(", as.character(enrind8), ")") else paste0("'", as.character(enrind8), "'"))
  }

  if (missing(enrind9)) {
    enrind9 <- defaults$enrind9
  }
  if (!is.null(enrind9)) {
    fields <- c(fields, "enrind9")
    values <- c(values, if (is.null(enrind9)) "NULL" else if (is(enrind9, "subQuery")) paste0("(", as.character(enrind9), ")") else paste0("'", as.character(enrind9), "'"))
  }

  if (missing(enrmon)) {
    enrmon <- defaults$enrmon
  }
  if (!is.null(enrmon)) {
    fields <- c(fields, "enrmon")
    values <- c(values, if (is.null(enrmon)) "NULL" else if (is(enrmon, "subQuery")) paste0("(", as.character(enrmon), ")") else paste0("'", as.character(enrmon), "'"))
  }

  if (missing(enrolid)) {
    enrolid <- defaults$enrolid
  }
  if (!is.null(enrolid)) {
    fields <- c(fields, "enrolid")
    values <- c(values, if (is.null(enrolid)) "NULL" else if (is(enrolid, "subQuery")) paste0("(", as.character(enrolid), ")") else paste0("'", as.character(enrolid), "'"))
  }

  if (missing(mas)) {
    mas <- defaults$mas
  }
  if (!is.null(mas)) {
    fields <- c(fields, "mas")
    values <- c(values, if (is.null(mas)) "NULL" else if (is(mas, "subQuery")) paste0("(", as.character(mas), ")") else paste0("'", as.character(mas), "'"))
  }

  if (missing(mcasenum)) {
    mcasenum <- defaults$mcasenum
  }
  if (!is.null(mcasenum)) {
    fields <- c(fields, "mcasenum")
    values <- c(values, if (is.null(mcasenum)) "NULL" else if (is(mcasenum, "subQuery")) paste0("(", as.character(mcasenum), ")") else paste0("'", as.character(mcasenum), "'"))
  }

  if (missing(medicare)) {
    medicare <- defaults$medicare
  }
  if (!is.null(medicare)) {
    fields <- c(fields, "medicare")
    values <- c(values, if (is.null(medicare)) "NULL" else if (is(medicare, "subQuery")) paste0("(", as.character(medicare), ")") else paste0("'", as.character(medicare), "'"))
  }

  if (missing(memday1)) {
    memday1 <- defaults$memday1
  }
  if (!is.null(memday1)) {
    fields <- c(fields, "memday1")
    values <- c(values, if (is.null(memday1)) "NULL" else if (is(memday1, "subQuery")) paste0("(", as.character(memday1), ")") else paste0("'", as.character(memday1), "'"))
  }

  if (missing(memday10)) {
    memday10 <- defaults$memday10
  }
  if (!is.null(memday10)) {
    fields <- c(fields, "memday10")
    values <- c(values, if (is.null(memday10)) "NULL" else if (is(memday10, "subQuery")) paste0("(", as.character(memday10), ")") else paste0("'", as.character(memday10), "'"))
  }

  if (missing(memday11)) {
    memday11 <- defaults$memday11
  }
  if (!is.null(memday11)) {
    fields <- c(fields, "memday11")
    values <- c(values, if (is.null(memday11)) "NULL" else if (is(memday11, "subQuery")) paste0("(", as.character(memday11), ")") else paste0("'", as.character(memday11), "'"))
  }

  if (missing(memday12)) {
    memday12 <- defaults$memday12
  }
  if (!is.null(memday12)) {
    fields <- c(fields, "memday12")
    values <- c(values, if (is.null(memday12)) "NULL" else if (is(memday12, "subQuery")) paste0("(", as.character(memday12), ")") else paste0("'", as.character(memday12), "'"))
  }

  if (missing(memday2)) {
    memday2 <- defaults$memday2
  }
  if (!is.null(memday2)) {
    fields <- c(fields, "memday2")
    values <- c(values, if (is.null(memday2)) "NULL" else if (is(memday2, "subQuery")) paste0("(", as.character(memday2), ")") else paste0("'", as.character(memday2), "'"))
  }

  if (missing(memday3)) {
    memday3 <- defaults$memday3
  }
  if (!is.null(memday3)) {
    fields <- c(fields, "memday3")
    values <- c(values, if (is.null(memday3)) "NULL" else if (is(memday3, "subQuery")) paste0("(", as.character(memday3), ")") else paste0("'", as.character(memday3), "'"))
  }

  if (missing(memday4)) {
    memday4 <- defaults$memday4
  }
  if (!is.null(memday4)) {
    fields <- c(fields, "memday4")
    values <- c(values, if (is.null(memday4)) "NULL" else if (is(memday4, "subQuery")) paste0("(", as.character(memday4), ")") else paste0("'", as.character(memday4), "'"))
  }

  if (missing(memday5)) {
    memday5 <- defaults$memday5
  }
  if (!is.null(memday5)) {
    fields <- c(fields, "memday5")
    values <- c(values, if (is.null(memday5)) "NULL" else if (is(memday5, "subQuery")) paste0("(", as.character(memday5), ")") else paste0("'", as.character(memday5), "'"))
  }

  if (missing(memday6)) {
    memday6 <- defaults$memday6
  }
  if (!is.null(memday6)) {
    fields <- c(fields, "memday6")
    values <- c(values, if (is.null(memday6)) "NULL" else if (is(memday6, "subQuery")) paste0("(", as.character(memday6), ")") else paste0("'", as.character(memday6), "'"))
  }

  if (missing(memday7)) {
    memday7 <- defaults$memday7
  }
  if (!is.null(memday7)) {
    fields <- c(fields, "memday7")
    values <- c(values, if (is.null(memday7)) "NULL" else if (is(memday7, "subQuery")) paste0("(", as.character(memday7), ")") else paste0("'", as.character(memday7), "'"))
  }

  if (missing(memday8)) {
    memday8 <- defaults$memday8
  }
  if (!is.null(memday8)) {
    fields <- c(fields, "memday8")
    values <- c(values, if (is.null(memday8)) "NULL" else if (is(memday8, "subQuery")) paste0("(", as.character(memday8), ")") else paste0("'", as.character(memday8), "'"))
  }

  if (missing(memday9)) {
    memday9 <- defaults$memday9
  }
  if (!is.null(memday9)) {
    fields <- c(fields, "memday9")
    values <- c(values, if (is.null(memday9)) "NULL" else if (is(memday9, "subQuery")) paste0("(", as.character(memday9), ")") else paste0("'", as.character(memday9), "'"))
  }

  if (missing(memdays)) {
    memdays <- defaults$memdays
  }
  if (!is.null(memdays)) {
    fields <- c(fields, "memdays")
    values <- c(values, if (is.null(memdays)) "NULL" else if (is(memdays, "subQuery")) paste0("(", as.character(memdays), ")") else paste0("'", as.character(memdays), "'"))
  }

  if (missing(mhsacovg)) {
    mhsacovg <- defaults$mhsacovg
  }
  if (!is.null(mhsacovg)) {
    fields <- c(fields, "mhsacovg")
    values <- c(values, if (is.null(mhsacovg)) "NULL" else if (is(mhsacovg, "subQuery")) paste0("(", as.character(mhsacovg), ")") else paste0("'", as.character(mhsacovg), "'"))
  }

  if (missing(plntyp1)) {
    plntyp1 <- defaults$plntyp1
  }
  if (!is.null(plntyp1)) {
    fields <- c(fields, "plntyp1")
    values <- c(values, if (is.null(plntyp1)) "NULL" else if (is(plntyp1, "subQuery")) paste0("(", as.character(plntyp1), ")") else paste0("'", as.character(plntyp1), "'"))
  }

  if (missing(plntyp10)) {
    plntyp10 <- defaults$plntyp10
  }
  if (!is.null(plntyp10)) {
    fields <- c(fields, "plntyp10")
    values <- c(values, if (is.null(plntyp10)) "NULL" else if (is(plntyp10, "subQuery")) paste0("(", as.character(plntyp10), ")") else paste0("'", as.character(plntyp10), "'"))
  }

  if (missing(plntyp11)) {
    plntyp11 <- defaults$plntyp11
  }
  if (!is.null(plntyp11)) {
    fields <- c(fields, "plntyp11")
    values <- c(values, if (is.null(plntyp11)) "NULL" else if (is(plntyp11, "subQuery")) paste0("(", as.character(plntyp11), ")") else paste0("'", as.character(plntyp11), "'"))
  }

  if (missing(plntyp12)) {
    plntyp12 <- defaults$plntyp12
  }
  if (!is.null(plntyp12)) {
    fields <- c(fields, "plntyp12")
    values <- c(values, if (is.null(plntyp12)) "NULL" else if (is(plntyp12, "subQuery")) paste0("(", as.character(plntyp12), ")") else paste0("'", as.character(plntyp12), "'"))
  }

  if (missing(plntyp2)) {
    plntyp2 <- defaults$plntyp2
  }
  if (!is.null(plntyp2)) {
    fields <- c(fields, "plntyp2")
    values <- c(values, if (is.null(plntyp2)) "NULL" else if (is(plntyp2, "subQuery")) paste0("(", as.character(plntyp2), ")") else paste0("'", as.character(plntyp2), "'"))
  }

  if (missing(plntyp3)) {
    plntyp3 <- defaults$plntyp3
  }
  if (!is.null(plntyp3)) {
    fields <- c(fields, "plntyp3")
    values <- c(values, if (is.null(plntyp3)) "NULL" else if (is(plntyp3, "subQuery")) paste0("(", as.character(plntyp3), ")") else paste0("'", as.character(plntyp3), "'"))
  }

  if (missing(plntyp4)) {
    plntyp4 <- defaults$plntyp4
  }
  if (!is.null(plntyp4)) {
    fields <- c(fields, "plntyp4")
    values <- c(values, if (is.null(plntyp4)) "NULL" else if (is(plntyp4, "subQuery")) paste0("(", as.character(plntyp4), ")") else paste0("'", as.character(plntyp4), "'"))
  }

  if (missing(plntyp5)) {
    plntyp5 <- defaults$plntyp5
  }
  if (!is.null(plntyp5)) {
    fields <- c(fields, "plntyp5")
    values <- c(values, if (is.null(plntyp5)) "NULL" else if (is(plntyp5, "subQuery")) paste0("(", as.character(plntyp5), ")") else paste0("'", as.character(plntyp5), "'"))
  }

  if (missing(plntyp6)) {
    plntyp6 <- defaults$plntyp6
  }
  if (!is.null(plntyp6)) {
    fields <- c(fields, "plntyp6")
    values <- c(values, if (is.null(plntyp6)) "NULL" else if (is(plntyp6, "subQuery")) paste0("(", as.character(plntyp6), ")") else paste0("'", as.character(plntyp6), "'"))
  }

  if (missing(plntyp7)) {
    plntyp7 <- defaults$plntyp7
  }
  if (!is.null(plntyp7)) {
    fields <- c(fields, "plntyp7")
    values <- c(values, if (is.null(plntyp7)) "NULL" else if (is(plntyp7, "subQuery")) paste0("(", as.character(plntyp7), ")") else paste0("'", as.character(plntyp7), "'"))
  }

  if (missing(plntyp8)) {
    plntyp8 <- defaults$plntyp8
  }
  if (!is.null(plntyp8)) {
    fields <- c(fields, "plntyp8")
    values <- c(values, if (is.null(plntyp8)) "NULL" else if (is(plntyp8, "subQuery")) paste0("(", as.character(plntyp8), ")") else paste0("'", as.character(plntyp8), "'"))
  }

  if (missing(plntyp9)) {
    plntyp9 <- defaults$plntyp9
  }
  if (!is.null(plntyp9)) {
    fields <- c(fields, "plntyp9")
    values <- c(values, if (is.null(plntyp9)) "NULL" else if (is(plntyp9, "subQuery")) paste0("(", as.character(plntyp9), ")") else paste0("'", as.character(plntyp9), "'"))
  }

  if (missing(seqnum)) {
    seqnum <- defaults$seqnum
  }
  if (!is.null(seqnum)) {
    fields <- c(fields, "seqnum")
    values <- c(values, if (is.null(seqnum)) "NULL" else if (is(seqnum, "subQuery")) paste0("(", as.character(seqnum), ")") else paste0("'", as.character(seqnum), "'"))
  }

  if (missing(sex)) {
    sex <- defaults$sex
  }
  if (!is.null(sex)) {
    fields <- c(fields, "sex")
    values <- c(values, if (is.null(sex)) "NULL" else if (is(sex, "subQuery")) paste0("(", as.character(sex), ")") else paste0("'", as.character(sex), "'"))
  }

  if (missing(stdrace)) {
    stdrace <- defaults$stdrace
  }
  if (!is.null(stdrace)) {
    fields <- c(fields, "stdrace")
    values <- c(values, if (is.null(stdrace)) "NULL" else if (is(stdrace, "subQuery")) paste0("(", as.character(stdrace), ")") else paste0("'", as.character(stdrace), "'"))
  }

  if (missing(version)) {
    version <- defaults$version
  }
  if (!is.null(version)) {
    fields <- c(fields, "version")
    values <- c(values, if (is.null(version)) "NULL" else if (is(version, "subQuery")) paste0("(", as.character(version), ")") else paste0("'", as.character(version), "'"))
  }

  if (missing(year)) {
    year <- defaults$year
  }
  if (!is.null(year)) {
    fields <- c(fields, "year")
    values <- c(values, if (is.null(year)) "NULL" else if (is(year, "subQuery")) paste0("(", as.character(year), ")") else paste0("'", as.character(year), "'"))
  }

  inserts <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, table = "enrollment_summary", fields = fields, values = values)
  frameworkContext$inserts[[length(frameworkContext$inserts) + 1]] <- inserts
  invisible(NULL)
}

add_facility_header <- function(billtyp, boe, cap, caseid, cob, coins, copay, deduct, dobyr, drugcovg, dstatus, dx1, dx2, dx3, dx4, dx5, dx6, dx7, dx8, dx9, dxver, enrolid, fachdid, mas, mcasenum, mdc, medicare, mhsacovg, netpay, pddate, plantyp, poadx1, poadx2, poadx3, poadx4, poadx5, poadx6, poadx7, poadx8, poadx9, proc1, proc2, proc3, proc4, proc5, proc6, prov_id, seqnum, sex, stdplac, stdprov, stdrace, svcdate, tsvcdat, version, year, npi, msclmid) {
  defaults <- get('facility_header', envir = frameworkContext$defaultValues)
  fields <- c()
  values <- c()
  if (missing(billtyp)) {
    billtyp <- defaults$billtyp
  }
  if (!is.null(billtyp)) {
    fields <- c(fields, "billtyp")
    values <- c(values, if (is.null(billtyp)) "NULL" else if (is(billtyp, "subQuery")) paste0("(", as.character(billtyp), ")") else paste0("'", as.character(billtyp), "'"))
  }

  if (missing(boe)) {
    boe <- defaults$boe
  }
  if (!is.null(boe)) {
    fields <- c(fields, "boe")
    values <- c(values, if (is.null(boe)) "NULL" else if (is(boe, "subQuery")) paste0("(", as.character(boe), ")") else paste0("'", as.character(boe), "'"))
  }

  if (missing(cap)) {
    cap <- defaults$cap
  }
  if (!is.null(cap)) {
    fields <- c(fields, "cap")
    values <- c(values, if (is.null(cap)) "NULL" else if (is(cap, "subQuery")) paste0("(", as.character(cap), ")") else paste0("'", as.character(cap), "'"))
  }

  if (missing(caseid)) {
    caseid <- defaults$caseid
  }
  if (!is.null(caseid)) {
    fields <- c(fields, "caseid")
    values <- c(values, if (is.null(caseid)) "NULL" else if (is(caseid, "subQuery")) paste0("(", as.character(caseid), ")") else paste0("'", as.character(caseid), "'"))
  }

  if (missing(cob)) {
    cob <- defaults$cob
  }
  if (!is.null(cob)) {
    fields <- c(fields, "cob")
    values <- c(values, if (is.null(cob)) "NULL" else if (is(cob, "subQuery")) paste0("(", as.character(cob), ")") else paste0("'", as.character(cob), "'"))
  }

  if (missing(coins)) {
    coins <- defaults$coins
  }
  if (!is.null(coins)) {
    fields <- c(fields, "coins")
    values <- c(values, if (is.null(coins)) "NULL" else if (is(coins, "subQuery")) paste0("(", as.character(coins), ")") else paste0("'", as.character(coins), "'"))
  }

  if (missing(copay)) {
    copay <- defaults$copay
  }
  if (!is.null(copay)) {
    fields <- c(fields, "copay")
    values <- c(values, if (is.null(copay)) "NULL" else if (is(copay, "subQuery")) paste0("(", as.character(copay), ")") else paste0("'", as.character(copay), "'"))
  }

  if (missing(deduct)) {
    deduct <- defaults$deduct
  }
  if (!is.null(deduct)) {
    fields <- c(fields, "deduct")
    values <- c(values, if (is.null(deduct)) "NULL" else if (is(deduct, "subQuery")) paste0("(", as.character(deduct), ")") else paste0("'", as.character(deduct), "'"))
  }

  if (missing(dobyr)) {
    dobyr <- defaults$dobyr
  }
  if (!is.null(dobyr)) {
    fields <- c(fields, "dobyr")
    values <- c(values, if (is.null(dobyr)) "NULL" else if (is(dobyr, "subQuery")) paste0("(", as.character(dobyr), ")") else paste0("'", as.character(dobyr), "'"))
  }

  if (missing(drugcovg)) {
    drugcovg <- defaults$drugcovg
  }
  if (!is.null(drugcovg)) {
    fields <- c(fields, "drugcovg")
    values <- c(values, if (is.null(drugcovg)) "NULL" else if (is(drugcovg, "subQuery")) paste0("(", as.character(drugcovg), ")") else paste0("'", as.character(drugcovg), "'"))
  }

  if (missing(dstatus)) {
    dstatus <- defaults$dstatus
  }
  if (!is.null(dstatus)) {
    fields <- c(fields, "dstatus")
    values <- c(values, if (is.null(dstatus)) "NULL" else if (is(dstatus, "subQuery")) paste0("(", as.character(dstatus), ")") else paste0("'", as.character(dstatus), "'"))
  }

  if (missing(dx1)) {
    dx1 <- defaults$dx1
  }
  if (!is.null(dx1)) {
    fields <- c(fields, "dx1")
    values <- c(values, if (is.null(dx1)) "NULL" else if (is(dx1, "subQuery")) paste0("(", as.character(dx1), ")") else paste0("'", as.character(dx1), "'"))
  }

  if (missing(dx2)) {
    dx2 <- defaults$dx2
  }
  if (!is.null(dx2)) {
    fields <- c(fields, "dx2")
    values <- c(values, if (is.null(dx2)) "NULL" else if (is(dx2, "subQuery")) paste0("(", as.character(dx2), ")") else paste0("'", as.character(dx2), "'"))
  }

  if (missing(dx3)) {
    dx3 <- defaults$dx3
  }
  if (!is.null(dx3)) {
    fields <- c(fields, "dx3")
    values <- c(values, if (is.null(dx3)) "NULL" else if (is(dx3, "subQuery")) paste0("(", as.character(dx3), ")") else paste0("'", as.character(dx3), "'"))
  }

  if (missing(dx4)) {
    dx4 <- defaults$dx4
  }
  if (!is.null(dx4)) {
    fields <- c(fields, "dx4")
    values <- c(values, if (is.null(dx4)) "NULL" else if (is(dx4, "subQuery")) paste0("(", as.character(dx4), ")") else paste0("'", as.character(dx4), "'"))
  }

  if (missing(dx5)) {
    dx5 <- defaults$dx5
  }
  if (!is.null(dx5)) {
    fields <- c(fields, "dx5")
    values <- c(values, if (is.null(dx5)) "NULL" else if (is(dx5, "subQuery")) paste0("(", as.character(dx5), ")") else paste0("'", as.character(dx5), "'"))
  }

  if (missing(dx6)) {
    dx6 <- defaults$dx6
  }
  if (!is.null(dx6)) {
    fields <- c(fields, "dx6")
    values <- c(values, if (is.null(dx6)) "NULL" else if (is(dx6, "subQuery")) paste0("(", as.character(dx6), ")") else paste0("'", as.character(dx6), "'"))
  }

  if (missing(dx7)) {
    dx7 <- defaults$dx7
  }
  if (!is.null(dx7)) {
    fields <- c(fields, "dx7")
    values <- c(values, if (is.null(dx7)) "NULL" else if (is(dx7, "subQuery")) paste0("(", as.character(dx7), ")") else paste0("'", as.character(dx7), "'"))
  }

  if (missing(dx8)) {
    dx8 <- defaults$dx8
  }
  if (!is.null(dx8)) {
    fields <- c(fields, "dx8")
    values <- c(values, if (is.null(dx8)) "NULL" else if (is(dx8, "subQuery")) paste0("(", as.character(dx8), ")") else paste0("'", as.character(dx8), "'"))
  }

  if (missing(dx9)) {
    dx9 <- defaults$dx9
  }
  if (!is.null(dx9)) {
    fields <- c(fields, "dx9")
    values <- c(values, if (is.null(dx9)) "NULL" else if (is(dx9, "subQuery")) paste0("(", as.character(dx9), ")") else paste0("'", as.character(dx9), "'"))
  }

  if (missing(dxver)) {
    dxver <- defaults$dxver
  }
  if (!is.null(dxver)) {
    fields <- c(fields, "dxver")
    values <- c(values, if (is.null(dxver)) "NULL" else if (is(dxver, "subQuery")) paste0("(", as.character(dxver), ")") else paste0("'", as.character(dxver), "'"))
  }

  if (missing(enrolid)) {
    enrolid <- defaults$enrolid
  }
  if (!is.null(enrolid)) {
    fields <- c(fields, "enrolid")
    values <- c(values, if (is.null(enrolid)) "NULL" else if (is(enrolid, "subQuery")) paste0("(", as.character(enrolid), ")") else paste0("'", as.character(enrolid), "'"))
  }

  if (missing(fachdid)) {
    fachdid <- defaults$fachdid
  }
  if (!is.null(fachdid)) {
    fields <- c(fields, "fachdid")
    values <- c(values, if (is.null(fachdid)) "NULL" else if (is(fachdid, "subQuery")) paste0("(", as.character(fachdid), ")") else paste0("'", as.character(fachdid), "'"))
  }

  if (missing(mas)) {
    mas <- defaults$mas
  }
  if (!is.null(mas)) {
    fields <- c(fields, "mas")
    values <- c(values, if (is.null(mas)) "NULL" else if (is(mas, "subQuery")) paste0("(", as.character(mas), ")") else paste0("'", as.character(mas), "'"))
  }

  if (missing(mcasenum)) {
    mcasenum <- defaults$mcasenum
  }
  if (!is.null(mcasenum)) {
    fields <- c(fields, "mcasenum")
    values <- c(values, if (is.null(mcasenum)) "NULL" else if (is(mcasenum, "subQuery")) paste0("(", as.character(mcasenum), ")") else paste0("'", as.character(mcasenum), "'"))
  }

  if (missing(mdc)) {
    mdc <- defaults$mdc
  }
  if (!is.null(mdc)) {
    fields <- c(fields, "mdc")
    values <- c(values, if (is.null(mdc)) "NULL" else if (is(mdc, "subQuery")) paste0("(", as.character(mdc), ")") else paste0("'", as.character(mdc), "'"))
  }

  if (missing(medicare)) {
    medicare <- defaults$medicare
  }
  if (!is.null(medicare)) {
    fields <- c(fields, "medicare")
    values <- c(values, if (is.null(medicare)) "NULL" else if (is(medicare, "subQuery")) paste0("(", as.character(medicare), ")") else paste0("'", as.character(medicare), "'"))
  }

  if (missing(mhsacovg)) {
    mhsacovg <- defaults$mhsacovg
  }
  if (!is.null(mhsacovg)) {
    fields <- c(fields, "mhsacovg")
    values <- c(values, if (is.null(mhsacovg)) "NULL" else if (is(mhsacovg, "subQuery")) paste0("(", as.character(mhsacovg), ")") else paste0("'", as.character(mhsacovg), "'"))
  }

  if (missing(netpay)) {
    netpay <- defaults$netpay
  }
  if (!is.null(netpay)) {
    fields <- c(fields, "netpay")
    values <- c(values, if (is.null(netpay)) "NULL" else if (is(netpay, "subQuery")) paste0("(", as.character(netpay), ")") else paste0("'", as.character(netpay), "'"))
  }

  if (missing(pddate)) {
    pddate <- defaults$pddate
  }
  if (!is.null(pddate)) {
    fields <- c(fields, "pddate")
    values <- c(values, if (is.null(pddate)) "NULL" else if (is(pddate, "subQuery")) paste0("(", as.character(pddate), ")") else paste0("'", as.character(pddate), "'"))
  }

  if (missing(plantyp)) {
    plantyp <- defaults$plantyp
  }
  if (!is.null(plantyp)) {
    fields <- c(fields, "plantyp")
    values <- c(values, if (is.null(plantyp)) "NULL" else if (is(plantyp, "subQuery")) paste0("(", as.character(plantyp), ")") else paste0("'", as.character(plantyp), "'"))
  }

  if (missing(poadx1)) {
    poadx1 <- defaults$poadx1
  }
  if (!is.null(poadx1)) {
    fields <- c(fields, "poadx1")
    values <- c(values, if (is.null(poadx1)) "NULL" else if (is(poadx1, "subQuery")) paste0("(", as.character(poadx1), ")") else paste0("'", as.character(poadx1), "'"))
  }

  if (missing(poadx2)) {
    poadx2 <- defaults$poadx2
  }
  if (!is.null(poadx2)) {
    fields <- c(fields, "poadx2")
    values <- c(values, if (is.null(poadx2)) "NULL" else if (is(poadx2, "subQuery")) paste0("(", as.character(poadx2), ")") else paste0("'", as.character(poadx2), "'"))
  }

  if (missing(poadx3)) {
    poadx3 <- defaults$poadx3
  }
  if (!is.null(poadx3)) {
    fields <- c(fields, "poadx3")
    values <- c(values, if (is.null(poadx3)) "NULL" else if (is(poadx3, "subQuery")) paste0("(", as.character(poadx3), ")") else paste0("'", as.character(poadx3), "'"))
  }

  if (missing(poadx4)) {
    poadx4 <- defaults$poadx4
  }
  if (!is.null(poadx4)) {
    fields <- c(fields, "poadx4")
    values <- c(values, if (is.null(poadx4)) "NULL" else if (is(poadx4, "subQuery")) paste0("(", as.character(poadx4), ")") else paste0("'", as.character(poadx4), "'"))
  }

  if (missing(poadx5)) {
    poadx5 <- defaults$poadx5
  }
  if (!is.null(poadx5)) {
    fields <- c(fields, "poadx5")
    values <- c(values, if (is.null(poadx5)) "NULL" else if (is(poadx5, "subQuery")) paste0("(", as.character(poadx5), ")") else paste0("'", as.character(poadx5), "'"))
  }

  if (missing(poadx6)) {
    poadx6 <- defaults$poadx6
  }
  if (!is.null(poadx6)) {
    fields <- c(fields, "poadx6")
    values <- c(values, if (is.null(poadx6)) "NULL" else if (is(poadx6, "subQuery")) paste0("(", as.character(poadx6), ")") else paste0("'", as.character(poadx6), "'"))
  }

  if (missing(poadx7)) {
    poadx7 <- defaults$poadx7
  }
  if (!is.null(poadx7)) {
    fields <- c(fields, "poadx7")
    values <- c(values, if (is.null(poadx7)) "NULL" else if (is(poadx7, "subQuery")) paste0("(", as.character(poadx7), ")") else paste0("'", as.character(poadx7), "'"))
  }

  if (missing(poadx8)) {
    poadx8 <- defaults$poadx8
  }
  if (!is.null(poadx8)) {
    fields <- c(fields, "poadx8")
    values <- c(values, if (is.null(poadx8)) "NULL" else if (is(poadx8, "subQuery")) paste0("(", as.character(poadx8), ")") else paste0("'", as.character(poadx8), "'"))
  }

  if (missing(poadx9)) {
    poadx9 <- defaults$poadx9
  }
  if (!is.null(poadx9)) {
    fields <- c(fields, "poadx9")
    values <- c(values, if (is.null(poadx9)) "NULL" else if (is(poadx9, "subQuery")) paste0("(", as.character(poadx9), ")") else paste0("'", as.character(poadx9), "'"))
  }

  if (missing(proc1)) {
    proc1 <- defaults$proc1
  }
  if (!is.null(proc1)) {
    fields <- c(fields, "proc1")
    values <- c(values, if (is.null(proc1)) "NULL" else if (is(proc1, "subQuery")) paste0("(", as.character(proc1), ")") else paste0("'", as.character(proc1), "'"))
  }

  if (missing(proc2)) {
    proc2 <- defaults$proc2
  }
  if (!is.null(proc2)) {
    fields <- c(fields, "proc2")
    values <- c(values, if (is.null(proc2)) "NULL" else if (is(proc2, "subQuery")) paste0("(", as.character(proc2), ")") else paste0("'", as.character(proc2), "'"))
  }

  if (missing(proc3)) {
    proc3 <- defaults$proc3
  }
  if (!is.null(proc3)) {
    fields <- c(fields, "proc3")
    values <- c(values, if (is.null(proc3)) "NULL" else if (is(proc3, "subQuery")) paste0("(", as.character(proc3), ")") else paste0("'", as.character(proc3), "'"))
  }

  if (missing(proc4)) {
    proc4 <- defaults$proc4
  }
  if (!is.null(proc4)) {
    fields <- c(fields, "proc4")
    values <- c(values, if (is.null(proc4)) "NULL" else if (is(proc4, "subQuery")) paste0("(", as.character(proc4), ")") else paste0("'", as.character(proc4), "'"))
  }

  if (missing(proc5)) {
    proc5 <- defaults$proc5
  }
  if (!is.null(proc5)) {
    fields <- c(fields, "proc5")
    values <- c(values, if (is.null(proc5)) "NULL" else if (is(proc5, "subQuery")) paste0("(", as.character(proc5), ")") else paste0("'", as.character(proc5), "'"))
  }

  if (missing(proc6)) {
    proc6 <- defaults$proc6
  }
  if (!is.null(proc6)) {
    fields <- c(fields, "proc6")
    values <- c(values, if (is.null(proc6)) "NULL" else if (is(proc6, "subQuery")) paste0("(", as.character(proc6), ")") else paste0("'", as.character(proc6), "'"))
  }

  if (missing(prov_id)) {
    prov_id <- defaults$prov_id
  }
  if (!is.null(prov_id)) {
    fields <- c(fields, "prov_id")
    values <- c(values, if (is.null(prov_id)) "NULL" else if (is(prov_id, "subQuery")) paste0("(", as.character(prov_id), ")") else paste0("'", as.character(prov_id), "'"))
  }

  if (missing(seqnum)) {
    seqnum <- defaults$seqnum
  }
  if (!is.null(seqnum)) {
    fields <- c(fields, "seqnum")
    values <- c(values, if (is.null(seqnum)) "NULL" else if (is(seqnum, "subQuery")) paste0("(", as.character(seqnum), ")") else paste0("'", as.character(seqnum), "'"))
  }

  if (missing(sex)) {
    sex <- defaults$sex
  }
  if (!is.null(sex)) {
    fields <- c(fields, "sex")
    values <- c(values, if (is.null(sex)) "NULL" else if (is(sex, "subQuery")) paste0("(", as.character(sex), ")") else paste0("'", as.character(sex), "'"))
  }

  if (missing(stdplac)) {
    stdplac <- defaults$stdplac
  }
  if (!is.null(stdplac)) {
    fields <- c(fields, "stdplac")
    values <- c(values, if (is.null(stdplac)) "NULL" else if (is(stdplac, "subQuery")) paste0("(", as.character(stdplac), ")") else paste0("'", as.character(stdplac), "'"))
  }

  if (missing(stdprov)) {
    stdprov <- defaults$stdprov
  }
  if (!is.null(stdprov)) {
    fields <- c(fields, "stdprov")
    values <- c(values, if (is.null(stdprov)) "NULL" else if (is(stdprov, "subQuery")) paste0("(", as.character(stdprov), ")") else paste0("'", as.character(stdprov), "'"))
  }

  if (missing(stdrace)) {
    stdrace <- defaults$stdrace
  }
  if (!is.null(stdrace)) {
    fields <- c(fields, "stdrace")
    values <- c(values, if (is.null(stdrace)) "NULL" else if (is(stdrace, "subQuery")) paste0("(", as.character(stdrace), ")") else paste0("'", as.character(stdrace), "'"))
  }

  if (missing(svcdate)) {
    svcdate <- defaults$svcdate
  }
  if (!is.null(svcdate)) {
    fields <- c(fields, "svcdate")
    values <- c(values, if (is.null(svcdate)) "NULL" else if (is(svcdate, "subQuery")) paste0("(", as.character(svcdate), ")") else paste0("'", as.character(svcdate), "'"))
  }

  if (missing(tsvcdat)) {
    tsvcdat <- defaults$tsvcdat
  }
  if (!is.null(tsvcdat)) {
    fields <- c(fields, "tsvcdat")
    values <- c(values, if (is.null(tsvcdat)) "NULL" else if (is(tsvcdat, "subQuery")) paste0("(", as.character(tsvcdat), ")") else paste0("'", as.character(tsvcdat), "'"))
  }

  if (missing(version)) {
    version <- defaults$version
  }
  if (!is.null(version)) {
    fields <- c(fields, "version")
    values <- c(values, if (is.null(version)) "NULL" else if (is(version, "subQuery")) paste0("(", as.character(version), ")") else paste0("'", as.character(version), "'"))
  }

  if (missing(year)) {
    year <- defaults$year
  }
  if (!is.null(year)) {
    fields <- c(fields, "year")
    values <- c(values, if (is.null(year)) "NULL" else if (is(year, "subQuery")) paste0("(", as.character(year), ")") else paste0("'", as.character(year), "'"))
  }

  if (missing(npi)) {
    npi <- defaults$npi
  }
  if (!is.null(npi)) {
    fields <- c(fields, "npi")
    values <- c(values, if (is.null(npi)) "NULL" else if (is(npi, "subQuery")) paste0("(", as.character(npi), ")") else paste0("'", as.character(npi), "'"))
  }

  if (missing(msclmid)) {
    msclmid <- defaults$msclmid
  }
  if (!is.null(msclmid)) {
    fields <- c(fields, "msclmid")
    values <- c(values, if (is.null(msclmid)) "NULL" else if (is(msclmid, "subQuery")) paste0("(", as.character(msclmid), ")") else paste0("'", as.character(msclmid), "'"))
  }

  inserts <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, table = "facility_header", fields = fields, values = values)
  frameworkContext$inserts[[length(frameworkContext$inserts) + 1]] <- inserts
  invisible(NULL)
}

add_inpatient_admissions <- function(admdate, admtyp, boe, cap, caseid, days, disdate, dobyr, drg, drugcovg, dstatus, dx1, dx10, dx11, dx12, dx13, dx14, dx15, dx2, dx3, dx4, dx5, dx6, dx7, dx8, dx9, dxver, enrolid, hosp_id, hospnet, hosppay, mas, mcasenum, mdc, medicare, mhsacovg, pddate, pdx, phys_id, physnet, physpay, plantyp, poapdx, poadx1, poadx2, poadx3, poadx4, poadx5, poadx6, poadx7, poadx8, poadx9, poadx10, poadx11, poadx12, poadx13, poadx14, poadx15, pproc, proc1, proc10, proc11, proc12, proc13, proc14, proc15, proc2, proc3, proc4, proc5, proc6, proc7, proc8, proc9, seqnum, sex, stdrace, totcob, totcoins, totcopay, totded, totnet, totpay, version, year) {
  defaults <- get('inpatient_admissions', envir = frameworkContext$defaultValues)
  fields <- c()
  values <- c()
  if (missing(admdate)) {
    admdate <- defaults$admdate
  }
  if (!is.null(admdate)) {
    fields <- c(fields, "admdate")
    values <- c(values, if (is.null(admdate)) "NULL" else if (is(admdate, "subQuery")) paste0("(", as.character(admdate), ")") else paste0("'", as.character(admdate), "'"))
  }

  if (missing(admtyp)) {
    admtyp <- defaults$admtyp
  }
  if (!is.null(admtyp)) {
    fields <- c(fields, "admtyp")
    values <- c(values, if (is.null(admtyp)) "NULL" else if (is(admtyp, "subQuery")) paste0("(", as.character(admtyp), ")") else paste0("'", as.character(admtyp), "'"))
  }

  if (missing(boe)) {
    boe <- defaults$boe
  }
  if (!is.null(boe)) {
    fields <- c(fields, "boe")
    values <- c(values, if (is.null(boe)) "NULL" else if (is(boe, "subQuery")) paste0("(", as.character(boe), ")") else paste0("'", as.character(boe), "'"))
  }

  if (missing(cap)) {
    cap <- defaults$cap
  }
  if (!is.null(cap)) {
    fields <- c(fields, "cap")
    values <- c(values, if (is.null(cap)) "NULL" else if (is(cap, "subQuery")) paste0("(", as.character(cap), ")") else paste0("'", as.character(cap), "'"))
  }

  if (missing(caseid)) {
    caseid <- defaults$caseid
  }
  if (!is.null(caseid)) {
    fields <- c(fields, "caseid")
    values <- c(values, if (is.null(caseid)) "NULL" else if (is(caseid, "subQuery")) paste0("(", as.character(caseid), ")") else paste0("'", as.character(caseid), "'"))
  }

  if (missing(days)) {
    days <- defaults$days
  }
  if (!is.null(days)) {
    fields <- c(fields, "days")
    values <- c(values, if (is.null(days)) "NULL" else if (is(days, "subQuery")) paste0("(", as.character(days), ")") else paste0("'", as.character(days), "'"))
  }

  if (missing(disdate)) {
    disdate <- defaults$disdate
  }
  if (!is.null(disdate)) {
    fields <- c(fields, "disdate")
    values <- c(values, if (is.null(disdate)) "NULL" else if (is(disdate, "subQuery")) paste0("(", as.character(disdate), ")") else paste0("'", as.character(disdate), "'"))
  }

  if (missing(dobyr)) {
    dobyr <- defaults$dobyr
  }
  if (!is.null(dobyr)) {
    fields <- c(fields, "dobyr")
    values <- c(values, if (is.null(dobyr)) "NULL" else if (is(dobyr, "subQuery")) paste0("(", as.character(dobyr), ")") else paste0("'", as.character(dobyr), "'"))
  }

  if (missing(drg)) {
    drg <- defaults$drg
  }
  if (!is.null(drg)) {
    fields <- c(fields, "drg")
    values <- c(values, if (is.null(drg)) "NULL" else if (is(drg, "subQuery")) paste0("(", as.character(drg), ")") else paste0("'", as.character(drg), "'"))
  }

  if (missing(drugcovg)) {
    drugcovg <- defaults$drugcovg
  }
  if (!is.null(drugcovg)) {
    fields <- c(fields, "drugcovg")
    values <- c(values, if (is.null(drugcovg)) "NULL" else if (is(drugcovg, "subQuery")) paste0("(", as.character(drugcovg), ")") else paste0("'", as.character(drugcovg), "'"))
  }

  if (missing(dstatus)) {
    dstatus <- defaults$dstatus
  }
  if (!is.null(dstatus)) {
    fields <- c(fields, "dstatus")
    values <- c(values, if (is.null(dstatus)) "NULL" else if (is(dstatus, "subQuery")) paste0("(", as.character(dstatus), ")") else paste0("'", as.character(dstatus), "'"))
  }

  if (missing(dx1)) {
    dx1 <- defaults$dx1
  }
  if (!is.null(dx1)) {
    fields <- c(fields, "dx1")
    values <- c(values, if (is.null(dx1)) "NULL" else if (is(dx1, "subQuery")) paste0("(", as.character(dx1), ")") else paste0("'", as.character(dx1), "'"))
  }

  if (missing(dx10)) {
    dx10 <- defaults$dx10
  }
  if (!is.null(dx10)) {
    fields <- c(fields, "dx10")
    values <- c(values, if (is.null(dx10)) "NULL" else if (is(dx10, "subQuery")) paste0("(", as.character(dx10), ")") else paste0("'", as.character(dx10), "'"))
  }

  if (missing(dx11)) {
    dx11 <- defaults$dx11
  }
  if (!is.null(dx11)) {
    fields <- c(fields, "dx11")
    values <- c(values, if (is.null(dx11)) "NULL" else if (is(dx11, "subQuery")) paste0("(", as.character(dx11), ")") else paste0("'", as.character(dx11), "'"))
  }

  if (missing(dx12)) {
    dx12 <- defaults$dx12
  }
  if (!is.null(dx12)) {
    fields <- c(fields, "dx12")
    values <- c(values, if (is.null(dx12)) "NULL" else if (is(dx12, "subQuery")) paste0("(", as.character(dx12), ")") else paste0("'", as.character(dx12), "'"))
  }

  if (missing(dx13)) {
    dx13 <- defaults$dx13
  }
  if (!is.null(dx13)) {
    fields <- c(fields, "dx13")
    values <- c(values, if (is.null(dx13)) "NULL" else if (is(dx13, "subQuery")) paste0("(", as.character(dx13), ")") else paste0("'", as.character(dx13), "'"))
  }

  if (missing(dx14)) {
    dx14 <- defaults$dx14
  }
  if (!is.null(dx14)) {
    fields <- c(fields, "dx14")
    values <- c(values, if (is.null(dx14)) "NULL" else if (is(dx14, "subQuery")) paste0("(", as.character(dx14), ")") else paste0("'", as.character(dx14), "'"))
  }

  if (missing(dx15)) {
    dx15 <- defaults$dx15
  }
  if (!is.null(dx15)) {
    fields <- c(fields, "dx15")
    values <- c(values, if (is.null(dx15)) "NULL" else if (is(dx15, "subQuery")) paste0("(", as.character(dx15), ")") else paste0("'", as.character(dx15), "'"))
  }

  if (missing(dx2)) {
    dx2 <- defaults$dx2
  }
  if (!is.null(dx2)) {
    fields <- c(fields, "dx2")
    values <- c(values, if (is.null(dx2)) "NULL" else if (is(dx2, "subQuery")) paste0("(", as.character(dx2), ")") else paste0("'", as.character(dx2), "'"))
  }

  if (missing(dx3)) {
    dx3 <- defaults$dx3
  }
  if (!is.null(dx3)) {
    fields <- c(fields, "dx3")
    values <- c(values, if (is.null(dx3)) "NULL" else if (is(dx3, "subQuery")) paste0("(", as.character(dx3), ")") else paste0("'", as.character(dx3), "'"))
  }

  if (missing(dx4)) {
    dx4 <- defaults$dx4
  }
  if (!is.null(dx4)) {
    fields <- c(fields, "dx4")
    values <- c(values, if (is.null(dx4)) "NULL" else if (is(dx4, "subQuery")) paste0("(", as.character(dx4), ")") else paste0("'", as.character(dx4), "'"))
  }

  if (missing(dx5)) {
    dx5 <- defaults$dx5
  }
  if (!is.null(dx5)) {
    fields <- c(fields, "dx5")
    values <- c(values, if (is.null(dx5)) "NULL" else if (is(dx5, "subQuery")) paste0("(", as.character(dx5), ")") else paste0("'", as.character(dx5), "'"))
  }

  if (missing(dx6)) {
    dx6 <- defaults$dx6
  }
  if (!is.null(dx6)) {
    fields <- c(fields, "dx6")
    values <- c(values, if (is.null(dx6)) "NULL" else if (is(dx6, "subQuery")) paste0("(", as.character(dx6), ")") else paste0("'", as.character(dx6), "'"))
  }

  if (missing(dx7)) {
    dx7 <- defaults$dx7
  }
  if (!is.null(dx7)) {
    fields <- c(fields, "dx7")
    values <- c(values, if (is.null(dx7)) "NULL" else if (is(dx7, "subQuery")) paste0("(", as.character(dx7), ")") else paste0("'", as.character(dx7), "'"))
  }

  if (missing(dx8)) {
    dx8 <- defaults$dx8
  }
  if (!is.null(dx8)) {
    fields <- c(fields, "dx8")
    values <- c(values, if (is.null(dx8)) "NULL" else if (is(dx8, "subQuery")) paste0("(", as.character(dx8), ")") else paste0("'", as.character(dx8), "'"))
  }

  if (missing(dx9)) {
    dx9 <- defaults$dx9
  }
  if (!is.null(dx9)) {
    fields <- c(fields, "dx9")
    values <- c(values, if (is.null(dx9)) "NULL" else if (is(dx9, "subQuery")) paste0("(", as.character(dx9), ")") else paste0("'", as.character(dx9), "'"))
  }

  if (missing(dxver)) {
    dxver <- defaults$dxver
  }
  if (!is.null(dxver)) {
    fields <- c(fields, "dxver")
    values <- c(values, if (is.null(dxver)) "NULL" else if (is(dxver, "subQuery")) paste0("(", as.character(dxver), ")") else paste0("'", as.character(dxver), "'"))
  }

  if (missing(enrolid)) {
    enrolid <- defaults$enrolid
  }
  if (!is.null(enrolid)) {
    fields <- c(fields, "enrolid")
    values <- c(values, if (is.null(enrolid)) "NULL" else if (is(enrolid, "subQuery")) paste0("(", as.character(enrolid), ")") else paste0("'", as.character(enrolid), "'"))
  }

  if (missing(hosp_id)) {
    hosp_id <- defaults$hosp_id
  }
  if (!is.null(hosp_id)) {
    fields <- c(fields, "hosp_id")
    values <- c(values, if (is.null(hosp_id)) "NULL" else if (is(hosp_id, "subQuery")) paste0("(", as.character(hosp_id), ")") else paste0("'", as.character(hosp_id), "'"))
  }

  if (missing(hospnet)) {
    hospnet <- defaults$hospnet
  }
  if (!is.null(hospnet)) {
    fields <- c(fields, "hospnet")
    values <- c(values, if (is.null(hospnet)) "NULL" else if (is(hospnet, "subQuery")) paste0("(", as.character(hospnet), ")") else paste0("'", as.character(hospnet), "'"))
  }

  if (missing(hosppay)) {
    hosppay <- defaults$hosppay
  }
  if (!is.null(hosppay)) {
    fields <- c(fields, "hosppay")
    values <- c(values, if (is.null(hosppay)) "NULL" else if (is(hosppay, "subQuery")) paste0("(", as.character(hosppay), ")") else paste0("'", as.character(hosppay), "'"))
  }

  if (missing(mas)) {
    mas <- defaults$mas
  }
  if (!is.null(mas)) {
    fields <- c(fields, "mas")
    values <- c(values, if (is.null(mas)) "NULL" else if (is(mas, "subQuery")) paste0("(", as.character(mas), ")") else paste0("'", as.character(mas), "'"))
  }

  if (missing(mcasenum)) {
    mcasenum <- defaults$mcasenum
  }
  if (!is.null(mcasenum)) {
    fields <- c(fields, "mcasenum")
    values <- c(values, if (is.null(mcasenum)) "NULL" else if (is(mcasenum, "subQuery")) paste0("(", as.character(mcasenum), ")") else paste0("'", as.character(mcasenum), "'"))
  }

  if (missing(mdc)) {
    mdc <- defaults$mdc
  }
  if (!is.null(mdc)) {
    fields <- c(fields, "mdc")
    values <- c(values, if (is.null(mdc)) "NULL" else if (is(mdc, "subQuery")) paste0("(", as.character(mdc), ")") else paste0("'", as.character(mdc), "'"))
  }

  if (missing(medicare)) {
    medicare <- defaults$medicare
  }
  if (!is.null(medicare)) {
    fields <- c(fields, "medicare")
    values <- c(values, if (is.null(medicare)) "NULL" else if (is(medicare, "subQuery")) paste0("(", as.character(medicare), ")") else paste0("'", as.character(medicare), "'"))
  }

  if (missing(mhsacovg)) {
    mhsacovg <- defaults$mhsacovg
  }
  if (!is.null(mhsacovg)) {
    fields <- c(fields, "mhsacovg")
    values <- c(values, if (is.null(mhsacovg)) "NULL" else if (is(mhsacovg, "subQuery")) paste0("(", as.character(mhsacovg), ")") else paste0("'", as.character(mhsacovg), "'"))
  }

  if (missing(pddate)) {
    pddate <- defaults$pddate
  }
  if (!is.null(pddate)) {
    fields <- c(fields, "pddate")
    values <- c(values, if (is.null(pddate)) "NULL" else if (is(pddate, "subQuery")) paste0("(", as.character(pddate), ")") else paste0("'", as.character(pddate), "'"))
  }

  if (missing(pdx)) {
    pdx <- defaults$pdx
  }
  if (!is.null(pdx)) {
    fields <- c(fields, "pdx")
    values <- c(values, if (is.null(pdx)) "NULL" else if (is(pdx, "subQuery")) paste0("(", as.character(pdx), ")") else paste0("'", as.character(pdx), "'"))
  }

  if (missing(phys_id)) {
    phys_id <- defaults$phys_id
  }
  if (!is.null(phys_id)) {
    fields <- c(fields, "phys_id")
    values <- c(values, if (is.null(phys_id)) "NULL" else if (is(phys_id, "subQuery")) paste0("(", as.character(phys_id), ")") else paste0("'", as.character(phys_id), "'"))
  }

  if (missing(physnet)) {
    physnet <- defaults$physnet
  }
  if (!is.null(physnet)) {
    fields <- c(fields, "physnet")
    values <- c(values, if (is.null(physnet)) "NULL" else if (is(physnet, "subQuery")) paste0("(", as.character(physnet), ")") else paste0("'", as.character(physnet), "'"))
  }

  if (missing(physpay)) {
    physpay <- defaults$physpay
  }
  if (!is.null(physpay)) {
    fields <- c(fields, "physpay")
    values <- c(values, if (is.null(physpay)) "NULL" else if (is(physpay, "subQuery")) paste0("(", as.character(physpay), ")") else paste0("'", as.character(physpay), "'"))
  }

  if (missing(plantyp)) {
    plantyp <- defaults$plantyp
  }
  if (!is.null(plantyp)) {
    fields <- c(fields, "plantyp")
    values <- c(values, if (is.null(plantyp)) "NULL" else if (is(plantyp, "subQuery")) paste0("(", as.character(plantyp), ")") else paste0("'", as.character(plantyp), "'"))
  }

  if (missing(poapdx)) {
    poapdx <- defaults$poapdx
  }
  if (!is.null(poapdx)) {
    fields <- c(fields, "poapdx")
    values <- c(values, if (is.null(poapdx)) "NULL" else if (is(poapdx, "subQuery")) paste0("(", as.character(poapdx), ")") else paste0("'", as.character(poapdx), "'"))
  }

  if (missing(poadx1)) {
    poadx1 <- defaults$poadx1
  }
  if (!is.null(poadx1)) {
    fields <- c(fields, "poadx1")
    values <- c(values, if (is.null(poadx1)) "NULL" else if (is(poadx1, "subQuery")) paste0("(", as.character(poadx1), ")") else paste0("'", as.character(poadx1), "'"))
  }

  if (missing(poadx2)) {
    poadx2 <- defaults$poadx2
  }
  if (!is.null(poadx2)) {
    fields <- c(fields, "poadx2")
    values <- c(values, if (is.null(poadx2)) "NULL" else if (is(poadx2, "subQuery")) paste0("(", as.character(poadx2), ")") else paste0("'", as.character(poadx2), "'"))
  }

  if (missing(poadx3)) {
    poadx3 <- defaults$poadx3
  }
  if (!is.null(poadx3)) {
    fields <- c(fields, "poadx3")
    values <- c(values, if (is.null(poadx3)) "NULL" else if (is(poadx3, "subQuery")) paste0("(", as.character(poadx3), ")") else paste0("'", as.character(poadx3), "'"))
  }

  if (missing(poadx4)) {
    poadx4 <- defaults$poadx4
  }
  if (!is.null(poadx4)) {
    fields <- c(fields, "poadx4")
    values <- c(values, if (is.null(poadx4)) "NULL" else if (is(poadx4, "subQuery")) paste0("(", as.character(poadx4), ")") else paste0("'", as.character(poadx4), "'"))
  }

  if (missing(poadx5)) {
    poadx5 <- defaults$poadx5
  }
  if (!is.null(poadx5)) {
    fields <- c(fields, "poadx5")
    values <- c(values, if (is.null(poadx5)) "NULL" else if (is(poadx5, "subQuery")) paste0("(", as.character(poadx5), ")") else paste0("'", as.character(poadx5), "'"))
  }

  if (missing(poadx6)) {
    poadx6 <- defaults$poadx6
  }
  if (!is.null(poadx6)) {
    fields <- c(fields, "poadx6")
    values <- c(values, if (is.null(poadx6)) "NULL" else if (is(poadx6, "subQuery")) paste0("(", as.character(poadx6), ")") else paste0("'", as.character(poadx6), "'"))
  }

  if (missing(poadx7)) {
    poadx7 <- defaults$poadx7
  }
  if (!is.null(poadx7)) {
    fields <- c(fields, "poadx7")
    values <- c(values, if (is.null(poadx7)) "NULL" else if (is(poadx7, "subQuery")) paste0("(", as.character(poadx7), ")") else paste0("'", as.character(poadx7), "'"))
  }

  if (missing(poadx8)) {
    poadx8 <- defaults$poadx8
  }
  if (!is.null(poadx8)) {
    fields <- c(fields, "poadx8")
    values <- c(values, if (is.null(poadx8)) "NULL" else if (is(poadx8, "subQuery")) paste0("(", as.character(poadx8), ")") else paste0("'", as.character(poadx8), "'"))
  }

  if (missing(poadx9)) {
    poadx9 <- defaults$poadx9
  }
  if (!is.null(poadx9)) {
    fields <- c(fields, "poadx9")
    values <- c(values, if (is.null(poadx9)) "NULL" else if (is(poadx9, "subQuery")) paste0("(", as.character(poadx9), ")") else paste0("'", as.character(poadx9), "'"))
  }

  if (missing(poadx10)) {
    poadx10 <- defaults$poadx10
  }
  if (!is.null(poadx10)) {
    fields <- c(fields, "poadx10")
    values <- c(values, if (is.null(poadx10)) "NULL" else if (is(poadx10, "subQuery")) paste0("(", as.character(poadx10), ")") else paste0("'", as.character(poadx10), "'"))
  }

  if (missing(poadx11)) {
    poadx11 <- defaults$poadx11
  }
  if (!is.null(poadx11)) {
    fields <- c(fields, "poadx11")
    values <- c(values, if (is.null(poadx11)) "NULL" else if (is(poadx11, "subQuery")) paste0("(", as.character(poadx11), ")") else paste0("'", as.character(poadx11), "'"))
  }

  if (missing(poadx12)) {
    poadx12 <- defaults$poadx12
  }
  if (!is.null(poadx12)) {
    fields <- c(fields, "poadx12")
    values <- c(values, if (is.null(poadx12)) "NULL" else if (is(poadx12, "subQuery")) paste0("(", as.character(poadx12), ")") else paste0("'", as.character(poadx12), "'"))
  }

  if (missing(poadx13)) {
    poadx13 <- defaults$poadx13
  }
  if (!is.null(poadx13)) {
    fields <- c(fields, "poadx13")
    values <- c(values, if (is.null(poadx13)) "NULL" else if (is(poadx13, "subQuery")) paste0("(", as.character(poadx13), ")") else paste0("'", as.character(poadx13), "'"))
  }

  if (missing(poadx14)) {
    poadx14 <- defaults$poadx14
  }
  if (!is.null(poadx14)) {
    fields <- c(fields, "poadx14")
    values <- c(values, if (is.null(poadx14)) "NULL" else if (is(poadx14, "subQuery")) paste0("(", as.character(poadx14), ")") else paste0("'", as.character(poadx14), "'"))
  }

  if (missing(poadx15)) {
    poadx15 <- defaults$poadx15
  }
  if (!is.null(poadx15)) {
    fields <- c(fields, "poadx15")
    values <- c(values, if (is.null(poadx15)) "NULL" else if (is(poadx15, "subQuery")) paste0("(", as.character(poadx15), ")") else paste0("'", as.character(poadx15), "'"))
  }

  if (missing(pproc)) {
    pproc <- defaults$pproc
  }
  if (!is.null(pproc)) {
    fields <- c(fields, "pproc")
    values <- c(values, if (is.null(pproc)) "NULL" else if (is(pproc, "subQuery")) paste0("(", as.character(pproc), ")") else paste0("'", as.character(pproc), "'"))
  }

  if (missing(proc1)) {
    proc1 <- defaults$proc1
  }
  if (!is.null(proc1)) {
    fields <- c(fields, "proc1")
    values <- c(values, if (is.null(proc1)) "NULL" else if (is(proc1, "subQuery")) paste0("(", as.character(proc1), ")") else paste0("'", as.character(proc1), "'"))
  }

  if (missing(proc10)) {
    proc10 <- defaults$proc10
  }
  if (!is.null(proc10)) {
    fields <- c(fields, "proc10")
    values <- c(values, if (is.null(proc10)) "NULL" else if (is(proc10, "subQuery")) paste0("(", as.character(proc10), ")") else paste0("'", as.character(proc10), "'"))
  }

  if (missing(proc11)) {
    proc11 <- defaults$proc11
  }
  if (!is.null(proc11)) {
    fields <- c(fields, "proc11")
    values <- c(values, if (is.null(proc11)) "NULL" else if (is(proc11, "subQuery")) paste0("(", as.character(proc11), ")") else paste0("'", as.character(proc11), "'"))
  }

  if (missing(proc12)) {
    proc12 <- defaults$proc12
  }
  if (!is.null(proc12)) {
    fields <- c(fields, "proc12")
    values <- c(values, if (is.null(proc12)) "NULL" else if (is(proc12, "subQuery")) paste0("(", as.character(proc12), ")") else paste0("'", as.character(proc12), "'"))
  }

  if (missing(proc13)) {
    proc13 <- defaults$proc13
  }
  if (!is.null(proc13)) {
    fields <- c(fields, "proc13")
    values <- c(values, if (is.null(proc13)) "NULL" else if (is(proc13, "subQuery")) paste0("(", as.character(proc13), ")") else paste0("'", as.character(proc13), "'"))
  }

  if (missing(proc14)) {
    proc14 <- defaults$proc14
  }
  if (!is.null(proc14)) {
    fields <- c(fields, "proc14")
    values <- c(values, if (is.null(proc14)) "NULL" else if (is(proc14, "subQuery")) paste0("(", as.character(proc14), ")") else paste0("'", as.character(proc14), "'"))
  }

  if (missing(proc15)) {
    proc15 <- defaults$proc15
  }
  if (!is.null(proc15)) {
    fields <- c(fields, "proc15")
    values <- c(values, if (is.null(proc15)) "NULL" else if (is(proc15, "subQuery")) paste0("(", as.character(proc15), ")") else paste0("'", as.character(proc15), "'"))
  }

  if (missing(proc2)) {
    proc2 <- defaults$proc2
  }
  if (!is.null(proc2)) {
    fields <- c(fields, "proc2")
    values <- c(values, if (is.null(proc2)) "NULL" else if (is(proc2, "subQuery")) paste0("(", as.character(proc2), ")") else paste0("'", as.character(proc2), "'"))
  }

  if (missing(proc3)) {
    proc3 <- defaults$proc3
  }
  if (!is.null(proc3)) {
    fields <- c(fields, "proc3")
    values <- c(values, if (is.null(proc3)) "NULL" else if (is(proc3, "subQuery")) paste0("(", as.character(proc3), ")") else paste0("'", as.character(proc3), "'"))
  }

  if (missing(proc4)) {
    proc4 <- defaults$proc4
  }
  if (!is.null(proc4)) {
    fields <- c(fields, "proc4")
    values <- c(values, if (is.null(proc4)) "NULL" else if (is(proc4, "subQuery")) paste0("(", as.character(proc4), ")") else paste0("'", as.character(proc4), "'"))
  }

  if (missing(proc5)) {
    proc5 <- defaults$proc5
  }
  if (!is.null(proc5)) {
    fields <- c(fields, "proc5")
    values <- c(values, if (is.null(proc5)) "NULL" else if (is(proc5, "subQuery")) paste0("(", as.character(proc5), ")") else paste0("'", as.character(proc5), "'"))
  }

  if (missing(proc6)) {
    proc6 <- defaults$proc6
  }
  if (!is.null(proc6)) {
    fields <- c(fields, "proc6")
    values <- c(values, if (is.null(proc6)) "NULL" else if (is(proc6, "subQuery")) paste0("(", as.character(proc6), ")") else paste0("'", as.character(proc6), "'"))
  }

  if (missing(proc7)) {
    proc7 <- defaults$proc7
  }
  if (!is.null(proc7)) {
    fields <- c(fields, "proc7")
    values <- c(values, if (is.null(proc7)) "NULL" else if (is(proc7, "subQuery")) paste0("(", as.character(proc7), ")") else paste0("'", as.character(proc7), "'"))
  }

  if (missing(proc8)) {
    proc8 <- defaults$proc8
  }
  if (!is.null(proc8)) {
    fields <- c(fields, "proc8")
    values <- c(values, if (is.null(proc8)) "NULL" else if (is(proc8, "subQuery")) paste0("(", as.character(proc8), ")") else paste0("'", as.character(proc8), "'"))
  }

  if (missing(proc9)) {
    proc9 <- defaults$proc9
  }
  if (!is.null(proc9)) {
    fields <- c(fields, "proc9")
    values <- c(values, if (is.null(proc9)) "NULL" else if (is(proc9, "subQuery")) paste0("(", as.character(proc9), ")") else paste0("'", as.character(proc9), "'"))
  }

  if (missing(seqnum)) {
    seqnum <- defaults$seqnum
  }
  if (!is.null(seqnum)) {
    fields <- c(fields, "seqnum")
    values <- c(values, if (is.null(seqnum)) "NULL" else if (is(seqnum, "subQuery")) paste0("(", as.character(seqnum), ")") else paste0("'", as.character(seqnum), "'"))
  }

  if (missing(sex)) {
    sex <- defaults$sex
  }
  if (!is.null(sex)) {
    fields <- c(fields, "sex")
    values <- c(values, if (is.null(sex)) "NULL" else if (is(sex, "subQuery")) paste0("(", as.character(sex), ")") else paste0("'", as.character(sex), "'"))
  }

  if (missing(stdrace)) {
    stdrace <- defaults$stdrace
  }
  if (!is.null(stdrace)) {
    fields <- c(fields, "stdrace")
    values <- c(values, if (is.null(stdrace)) "NULL" else if (is(stdrace, "subQuery")) paste0("(", as.character(stdrace), ")") else paste0("'", as.character(stdrace), "'"))
  }

  if (missing(totcob)) {
    totcob <- defaults$totcob
  }
  if (!is.null(totcob)) {
    fields <- c(fields, "totcob")
    values <- c(values, if (is.null(totcob)) "NULL" else if (is(totcob, "subQuery")) paste0("(", as.character(totcob), ")") else paste0("'", as.character(totcob), "'"))
  }

  if (missing(totcoins)) {
    totcoins <- defaults$totcoins
  }
  if (!is.null(totcoins)) {
    fields <- c(fields, "totcoins")
    values <- c(values, if (is.null(totcoins)) "NULL" else if (is(totcoins, "subQuery")) paste0("(", as.character(totcoins), ")") else paste0("'", as.character(totcoins), "'"))
  }

  if (missing(totcopay)) {
    totcopay <- defaults$totcopay
  }
  if (!is.null(totcopay)) {
    fields <- c(fields, "totcopay")
    values <- c(values, if (is.null(totcopay)) "NULL" else if (is(totcopay, "subQuery")) paste0("(", as.character(totcopay), ")") else paste0("'", as.character(totcopay), "'"))
  }

  if (missing(totded)) {
    totded <- defaults$totded
  }
  if (!is.null(totded)) {
    fields <- c(fields, "totded")
    values <- c(values, if (is.null(totded)) "NULL" else if (is(totded, "subQuery")) paste0("(", as.character(totded), ")") else paste0("'", as.character(totded), "'"))
  }

  if (missing(totnet)) {
    totnet <- defaults$totnet
  }
  if (!is.null(totnet)) {
    fields <- c(fields, "totnet")
    values <- c(values, if (is.null(totnet)) "NULL" else if (is(totnet, "subQuery")) paste0("(", as.character(totnet), ")") else paste0("'", as.character(totnet), "'"))
  }

  if (missing(totpay)) {
    totpay <- defaults$totpay
  }
  if (!is.null(totpay)) {
    fields <- c(fields, "totpay")
    values <- c(values, if (is.null(totpay)) "NULL" else if (is(totpay, "subQuery")) paste0("(", as.character(totpay), ")") else paste0("'", as.character(totpay), "'"))
  }

  if (missing(version)) {
    version <- defaults$version
  }
  if (!is.null(version)) {
    fields <- c(fields, "version")
    values <- c(values, if (is.null(version)) "NULL" else if (is(version, "subQuery")) paste0("(", as.character(version), ")") else paste0("'", as.character(version), "'"))
  }

  if (missing(year)) {
    year <- defaults$year
  }
  if (!is.null(year)) {
    fields <- c(fields, "year")
    values <- c(values, if (is.null(year)) "NULL" else if (is(year, "subQuery")) paste0("(", as.character(year), ")") else paste0("'", as.character(year), "'"))
  }

  inserts <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, table = "inpatient_admissions", fields = fields, values = values)
  frameworkContext$inserts[[length(frameworkContext$inserts) + 1]] <- inserts
  invisible(NULL)
}

add_inpatient_services <- function(admdate, admtyp, boe, cap, caseid, cob, coins, copay, deduct, disdate, dobyr, drg, drugcovg, dstatus, dx1, dx2, dx3, dx4, dxver, enrolid, fachdid, facprof, mas, mcasenum, mdc, medicare, mhsacovg, netpay, pay, pddate, pdx, plantyp, pproc, proc1, proctyp, prov_id, qty, revcode, seqnum, sex, stdplac, stdprov, stdrace, stdsvc, svcdate, svcscat, tsvcdat, version, year, units, npi, msclmid) {
  defaults <- get('inpatient_services', envir = frameworkContext$defaultValues)
  fields <- c()
  values <- c()
  if (missing(admdate)) {
    admdate <- defaults$admdate
  }
  if (!is.null(admdate)) {
    fields <- c(fields, "admdate")
    values <- c(values, if (is.null(admdate)) "NULL" else if (is(admdate, "subQuery")) paste0("(", as.character(admdate), ")") else paste0("'", as.character(admdate), "'"))
  }

  if (missing(admtyp)) {
    admtyp <- defaults$admtyp
  }
  if (!is.null(admtyp)) {
    fields <- c(fields, "admtyp")
    values <- c(values, if (is.null(admtyp)) "NULL" else if (is(admtyp, "subQuery")) paste0("(", as.character(admtyp), ")") else paste0("'", as.character(admtyp), "'"))
  }

  if (missing(boe)) {
    boe <- defaults$boe
  }
  if (!is.null(boe)) {
    fields <- c(fields, "boe")
    values <- c(values, if (is.null(boe)) "NULL" else if (is(boe, "subQuery")) paste0("(", as.character(boe), ")") else paste0("'", as.character(boe), "'"))
  }

  if (missing(cap)) {
    cap <- defaults$cap
  }
  if (!is.null(cap)) {
    fields <- c(fields, "cap")
    values <- c(values, if (is.null(cap)) "NULL" else if (is(cap, "subQuery")) paste0("(", as.character(cap), ")") else paste0("'", as.character(cap), "'"))
  }

  if (missing(caseid)) {
    caseid <- defaults$caseid
  }
  if (!is.null(caseid)) {
    fields <- c(fields, "caseid")
    values <- c(values, if (is.null(caseid)) "NULL" else if (is(caseid, "subQuery")) paste0("(", as.character(caseid), ")") else paste0("'", as.character(caseid), "'"))
  }

  if (missing(cob)) {
    cob <- defaults$cob
  }
  if (!is.null(cob)) {
    fields <- c(fields, "cob")
    values <- c(values, if (is.null(cob)) "NULL" else if (is(cob, "subQuery")) paste0("(", as.character(cob), ")") else paste0("'", as.character(cob), "'"))
  }

  if (missing(coins)) {
    coins <- defaults$coins
  }
  if (!is.null(coins)) {
    fields <- c(fields, "coins")
    values <- c(values, if (is.null(coins)) "NULL" else if (is(coins, "subQuery")) paste0("(", as.character(coins), ")") else paste0("'", as.character(coins), "'"))
  }

  if (missing(copay)) {
    copay <- defaults$copay
  }
  if (!is.null(copay)) {
    fields <- c(fields, "copay")
    values <- c(values, if (is.null(copay)) "NULL" else if (is(copay, "subQuery")) paste0("(", as.character(copay), ")") else paste0("'", as.character(copay), "'"))
  }

  if (missing(deduct)) {
    deduct <- defaults$deduct
  }
  if (!is.null(deduct)) {
    fields <- c(fields, "deduct")
    values <- c(values, if (is.null(deduct)) "NULL" else if (is(deduct, "subQuery")) paste0("(", as.character(deduct), ")") else paste0("'", as.character(deduct), "'"))
  }

  if (missing(disdate)) {
    disdate <- defaults$disdate
  }
  if (!is.null(disdate)) {
    fields <- c(fields, "disdate")
    values <- c(values, if (is.null(disdate)) "NULL" else if (is(disdate, "subQuery")) paste0("(", as.character(disdate), ")") else paste0("'", as.character(disdate), "'"))
  }

  if (missing(dobyr)) {
    dobyr <- defaults$dobyr
  }
  if (!is.null(dobyr)) {
    fields <- c(fields, "dobyr")
    values <- c(values, if (is.null(dobyr)) "NULL" else if (is(dobyr, "subQuery")) paste0("(", as.character(dobyr), ")") else paste0("'", as.character(dobyr), "'"))
  }

  if (missing(drg)) {
    drg <- defaults$drg
  }
  if (!is.null(drg)) {
    fields <- c(fields, "drg")
    values <- c(values, if (is.null(drg)) "NULL" else if (is(drg, "subQuery")) paste0("(", as.character(drg), ")") else paste0("'", as.character(drg), "'"))
  }

  if (missing(drugcovg)) {
    drugcovg <- defaults$drugcovg
  }
  if (!is.null(drugcovg)) {
    fields <- c(fields, "drugcovg")
    values <- c(values, if (is.null(drugcovg)) "NULL" else if (is(drugcovg, "subQuery")) paste0("(", as.character(drugcovg), ")") else paste0("'", as.character(drugcovg), "'"))
  }

  if (missing(dstatus)) {
    dstatus <- defaults$dstatus
  }
  if (!is.null(dstatus)) {
    fields <- c(fields, "dstatus")
    values <- c(values, if (is.null(dstatus)) "NULL" else if (is(dstatus, "subQuery")) paste0("(", as.character(dstatus), ")") else paste0("'", as.character(dstatus), "'"))
  }

  if (missing(dx1)) {
    dx1 <- defaults$dx1
  }
  if (!is.null(dx1)) {
    fields <- c(fields, "dx1")
    values <- c(values, if (is.null(dx1)) "NULL" else if (is(dx1, "subQuery")) paste0("(", as.character(dx1), ")") else paste0("'", as.character(dx1), "'"))
  }

  if (missing(dx2)) {
    dx2 <- defaults$dx2
  }
  if (!is.null(dx2)) {
    fields <- c(fields, "dx2")
    values <- c(values, if (is.null(dx2)) "NULL" else if (is(dx2, "subQuery")) paste0("(", as.character(dx2), ")") else paste0("'", as.character(dx2), "'"))
  }

  if (missing(dx3)) {
    dx3 <- defaults$dx3
  }
  if (!is.null(dx3)) {
    fields <- c(fields, "dx3")
    values <- c(values, if (is.null(dx3)) "NULL" else if (is(dx3, "subQuery")) paste0("(", as.character(dx3), ")") else paste0("'", as.character(dx3), "'"))
  }

  if (missing(dx4)) {
    dx4 <- defaults$dx4
  }
  if (!is.null(dx4)) {
    fields <- c(fields, "dx4")
    values <- c(values, if (is.null(dx4)) "NULL" else if (is(dx4, "subQuery")) paste0("(", as.character(dx4), ")") else paste0("'", as.character(dx4), "'"))
  }

  if (missing(dxver)) {
    dxver <- defaults$dxver
  }
  if (!is.null(dxver)) {
    fields <- c(fields, "dxver")
    values <- c(values, if (is.null(dxver)) "NULL" else if (is(dxver, "subQuery")) paste0("(", as.character(dxver), ")") else paste0("'", as.character(dxver), "'"))
  }

  if (missing(enrolid)) {
    enrolid <- defaults$enrolid
  }
  if (!is.null(enrolid)) {
    fields <- c(fields, "enrolid")
    values <- c(values, if (is.null(enrolid)) "NULL" else if (is(enrolid, "subQuery")) paste0("(", as.character(enrolid), ")") else paste0("'", as.character(enrolid), "'"))
  }

  if (missing(fachdid)) {
    fachdid <- defaults$fachdid
  }
  if (!is.null(fachdid)) {
    fields <- c(fields, "fachdid")
    values <- c(values, if (is.null(fachdid)) "NULL" else if (is(fachdid, "subQuery")) paste0("(", as.character(fachdid), ")") else paste0("'", as.character(fachdid), "'"))
  }

  if (missing(facprof)) {
    facprof <- defaults$facprof
  }
  if (!is.null(facprof)) {
    fields <- c(fields, "facprof")
    values <- c(values, if (is.null(facprof)) "NULL" else if (is(facprof, "subQuery")) paste0("(", as.character(facprof), ")") else paste0("'", as.character(facprof), "'"))
  }

  if (missing(mas)) {
    mas <- defaults$mas
  }
  if (!is.null(mas)) {
    fields <- c(fields, "mas")
    values <- c(values, if (is.null(mas)) "NULL" else if (is(mas, "subQuery")) paste0("(", as.character(mas), ")") else paste0("'", as.character(mas), "'"))
  }

  if (missing(mcasenum)) {
    mcasenum <- defaults$mcasenum
  }
  if (!is.null(mcasenum)) {
    fields <- c(fields, "mcasenum")
    values <- c(values, if (is.null(mcasenum)) "NULL" else if (is(mcasenum, "subQuery")) paste0("(", as.character(mcasenum), ")") else paste0("'", as.character(mcasenum), "'"))
  }

  if (missing(mdc)) {
    mdc <- defaults$mdc
  }
  if (!is.null(mdc)) {
    fields <- c(fields, "mdc")
    values <- c(values, if (is.null(mdc)) "NULL" else if (is(mdc, "subQuery")) paste0("(", as.character(mdc), ")") else paste0("'", as.character(mdc), "'"))
  }

  if (missing(medicare)) {
    medicare <- defaults$medicare
  }
  if (!is.null(medicare)) {
    fields <- c(fields, "medicare")
    values <- c(values, if (is.null(medicare)) "NULL" else if (is(medicare, "subQuery")) paste0("(", as.character(medicare), ")") else paste0("'", as.character(medicare), "'"))
  }

  if (missing(mhsacovg)) {
    mhsacovg <- defaults$mhsacovg
  }
  if (!is.null(mhsacovg)) {
    fields <- c(fields, "mhsacovg")
    values <- c(values, if (is.null(mhsacovg)) "NULL" else if (is(mhsacovg, "subQuery")) paste0("(", as.character(mhsacovg), ")") else paste0("'", as.character(mhsacovg), "'"))
  }

  if (missing(netpay)) {
    netpay <- defaults$netpay
  }
  if (!is.null(netpay)) {
    fields <- c(fields, "netpay")
    values <- c(values, if (is.null(netpay)) "NULL" else if (is(netpay, "subQuery")) paste0("(", as.character(netpay), ")") else paste0("'", as.character(netpay), "'"))
  }

  if (missing(pay)) {
    pay <- defaults$pay
  }
  if (!is.null(pay)) {
    fields <- c(fields, "pay")
    values <- c(values, if (is.null(pay)) "NULL" else if (is(pay, "subQuery")) paste0("(", as.character(pay), ")") else paste0("'", as.character(pay), "'"))
  }

  if (missing(pddate)) {
    pddate <- defaults$pddate
  }
  if (!is.null(pddate)) {
    fields <- c(fields, "pddate")
    values <- c(values, if (is.null(pddate)) "NULL" else if (is(pddate, "subQuery")) paste0("(", as.character(pddate), ")") else paste0("'", as.character(pddate), "'"))
  }

  if (missing(pdx)) {
    pdx <- defaults$pdx
  }
  if (!is.null(pdx)) {
    fields <- c(fields, "pdx")
    values <- c(values, if (is.null(pdx)) "NULL" else if (is(pdx, "subQuery")) paste0("(", as.character(pdx), ")") else paste0("'", as.character(pdx), "'"))
  }

  if (missing(plantyp)) {
    plantyp <- defaults$plantyp
  }
  if (!is.null(plantyp)) {
    fields <- c(fields, "plantyp")
    values <- c(values, if (is.null(plantyp)) "NULL" else if (is(plantyp, "subQuery")) paste0("(", as.character(plantyp), ")") else paste0("'", as.character(plantyp), "'"))
  }

  if (missing(pproc)) {
    pproc <- defaults$pproc
  }
  if (!is.null(pproc)) {
    fields <- c(fields, "pproc")
    values <- c(values, if (is.null(pproc)) "NULL" else if (is(pproc, "subQuery")) paste0("(", as.character(pproc), ")") else paste0("'", as.character(pproc), "'"))
  }

  if (missing(proc1)) {
    proc1 <- defaults$proc1
  }
  if (!is.null(proc1)) {
    fields <- c(fields, "proc1")
    values <- c(values, if (is.null(proc1)) "NULL" else if (is(proc1, "subQuery")) paste0("(", as.character(proc1), ")") else paste0("'", as.character(proc1), "'"))
  }

  if (missing(proctyp)) {
    proctyp <- defaults$proctyp
  }
  if (!is.null(proctyp)) {
    fields <- c(fields, "proctyp")
    values <- c(values, if (is.null(proctyp)) "NULL" else if (is(proctyp, "subQuery")) paste0("(", as.character(proctyp), ")") else paste0("'", as.character(proctyp), "'"))
  }

  if (missing(prov_id)) {
    prov_id <- defaults$prov_id
  }
  if (!is.null(prov_id)) {
    fields <- c(fields, "prov_id")
    values <- c(values, if (is.null(prov_id)) "NULL" else if (is(prov_id, "subQuery")) paste0("(", as.character(prov_id), ")") else paste0("'", as.character(prov_id), "'"))
  }

  if (missing(qty)) {
    qty <- defaults$qty
  }
  if (!is.null(qty)) {
    fields <- c(fields, "qty")
    values <- c(values, if (is.null(qty)) "NULL" else if (is(qty, "subQuery")) paste0("(", as.character(qty), ")") else paste0("'", as.character(qty), "'"))
  }

  if (missing(revcode)) {
    revcode <- defaults$revcode
  }
  if (!is.null(revcode)) {
    fields <- c(fields, "revcode")
    values <- c(values, if (is.null(revcode)) "NULL" else if (is(revcode, "subQuery")) paste0("(", as.character(revcode), ")") else paste0("'", as.character(revcode), "'"))
  }

  if (missing(seqnum)) {
    seqnum <- defaults$seqnum
  }
  if (!is.null(seqnum)) {
    fields <- c(fields, "seqnum")
    values <- c(values, if (is.null(seqnum)) "NULL" else if (is(seqnum, "subQuery")) paste0("(", as.character(seqnum), ")") else paste0("'", as.character(seqnum), "'"))
  }

  if (missing(sex)) {
    sex <- defaults$sex
  }
  if (!is.null(sex)) {
    fields <- c(fields, "sex")
    values <- c(values, if (is.null(sex)) "NULL" else if (is(sex, "subQuery")) paste0("(", as.character(sex), ")") else paste0("'", as.character(sex), "'"))
  }

  if (missing(stdplac)) {
    stdplac <- defaults$stdplac
  }
  if (!is.null(stdplac)) {
    fields <- c(fields, "stdplac")
    values <- c(values, if (is.null(stdplac)) "NULL" else if (is(stdplac, "subQuery")) paste0("(", as.character(stdplac), ")") else paste0("'", as.character(stdplac), "'"))
  }

  if (missing(stdprov)) {
    stdprov <- defaults$stdprov
  }
  if (!is.null(stdprov)) {
    fields <- c(fields, "stdprov")
    values <- c(values, if (is.null(stdprov)) "NULL" else if (is(stdprov, "subQuery")) paste0("(", as.character(stdprov), ")") else paste0("'", as.character(stdprov), "'"))
  }

  if (missing(stdrace)) {
    stdrace <- defaults$stdrace
  }
  if (!is.null(stdrace)) {
    fields <- c(fields, "stdrace")
    values <- c(values, if (is.null(stdrace)) "NULL" else if (is(stdrace, "subQuery")) paste0("(", as.character(stdrace), ")") else paste0("'", as.character(stdrace), "'"))
  }

  if (missing(stdsvc)) {
    stdsvc <- defaults$stdsvc
  }
  if (!is.null(stdsvc)) {
    fields <- c(fields, "stdsvc")
    values <- c(values, if (is.null(stdsvc)) "NULL" else if (is(stdsvc, "subQuery")) paste0("(", as.character(stdsvc), ")") else paste0("'", as.character(stdsvc), "'"))
  }

  if (missing(svcdate)) {
    svcdate <- defaults$svcdate
  }
  if (!is.null(svcdate)) {
    fields <- c(fields, "svcdate")
    values <- c(values, if (is.null(svcdate)) "NULL" else if (is(svcdate, "subQuery")) paste0("(", as.character(svcdate), ")") else paste0("'", as.character(svcdate), "'"))
  }

  if (missing(svcscat)) {
    svcscat <- defaults$svcscat
  }
  if (!is.null(svcscat)) {
    fields <- c(fields, "svcscat")
    values <- c(values, if (is.null(svcscat)) "NULL" else if (is(svcscat, "subQuery")) paste0("(", as.character(svcscat), ")") else paste0("'", as.character(svcscat), "'"))
  }

  if (missing(tsvcdat)) {
    tsvcdat <- defaults$tsvcdat
  }
  if (!is.null(tsvcdat)) {
    fields <- c(fields, "tsvcdat")
    values <- c(values, if (is.null(tsvcdat)) "NULL" else if (is(tsvcdat, "subQuery")) paste0("(", as.character(tsvcdat), ")") else paste0("'", as.character(tsvcdat), "'"))
  }

  if (missing(version)) {
    version <- defaults$version
  }
  if (!is.null(version)) {
    fields <- c(fields, "version")
    values <- c(values, if (is.null(version)) "NULL" else if (is(version, "subQuery")) paste0("(", as.character(version), ")") else paste0("'", as.character(version), "'"))
  }

  if (missing(year)) {
    year <- defaults$year
  }
  if (!is.null(year)) {
    fields <- c(fields, "year")
    values <- c(values, if (is.null(year)) "NULL" else if (is(year, "subQuery")) paste0("(", as.character(year), ")") else paste0("'", as.character(year), "'"))
  }

  if (missing(units)) {
    units <- defaults$units
  }
  if (!is.null(units)) {
    fields <- c(fields, "units")
    values <- c(values, if (is.null(units)) "NULL" else if (is(units, "subQuery")) paste0("(", as.character(units), ")") else paste0("'", as.character(units), "'"))
  }

  if (missing(npi)) {
    npi <- defaults$npi
  }
  if (!is.null(npi)) {
    fields <- c(fields, "npi")
    values <- c(values, if (is.null(npi)) "NULL" else if (is(npi, "subQuery")) paste0("(", as.character(npi), ")") else paste0("'", as.character(npi), "'"))
  }

  if (missing(msclmid)) {
    msclmid <- defaults$msclmid
  }
  if (!is.null(msclmid)) {
    fields <- c(fields, "msclmid")
    values <- c(values, if (is.null(msclmid)) "NULL" else if (is(msclmid, "subQuery")) paste0("(", as.character(msclmid), ")") else paste0("'", as.character(msclmid), "'"))
  }

  inserts <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, table = "inpatient_services", fields = fields, values = values)
  frameworkContext$inserts[[length(frameworkContext$inserts) + 1]] <- inserts
  invisible(NULL)
}

add_long_term_care <- function(boe, cap, cob, coins, copay, deduct, dobyr, drugcovg, dx1, dx2, dx3, dx4, dxver, enrolid, fachdid, facprof, mas, mcasenum, mdc, medicare, mhsacovg, netpay, pay, pddate, plantyp, proc1, procgrp, proctyp, prov_id, qty, revcode, seqnum, sex, stdplac, stdprov, stdrace, stdsvc, svcdate, svcscat, tsvcdat, version, year, units, npi, msclmid) {
  defaults <- get('long_term_care', envir = frameworkContext$defaultValues)
  fields <- c()
  values <- c()
  if (missing(boe)) {
    boe <- defaults$boe
  }
  if (!is.null(boe)) {
    fields <- c(fields, "boe")
    values <- c(values, if (is.null(boe)) "NULL" else if (is(boe, "subQuery")) paste0("(", as.character(boe), ")") else paste0("'", as.character(boe), "'"))
  }

  if (missing(cap)) {
    cap <- defaults$cap
  }
  if (!is.null(cap)) {
    fields <- c(fields, "cap")
    values <- c(values, if (is.null(cap)) "NULL" else if (is(cap, "subQuery")) paste0("(", as.character(cap), ")") else paste0("'", as.character(cap), "'"))
  }

  if (missing(cob)) {
    cob <- defaults$cob
  }
  if (!is.null(cob)) {
    fields <- c(fields, "cob")
    values <- c(values, if (is.null(cob)) "NULL" else if (is(cob, "subQuery")) paste0("(", as.character(cob), ")") else paste0("'", as.character(cob), "'"))
  }

  if (missing(coins)) {
    coins <- defaults$coins
  }
  if (!is.null(coins)) {
    fields <- c(fields, "coins")
    values <- c(values, if (is.null(coins)) "NULL" else if (is(coins, "subQuery")) paste0("(", as.character(coins), ")") else paste0("'", as.character(coins), "'"))
  }

  if (missing(copay)) {
    copay <- defaults$copay
  }
  if (!is.null(copay)) {
    fields <- c(fields, "copay")
    values <- c(values, if (is.null(copay)) "NULL" else if (is(copay, "subQuery")) paste0("(", as.character(copay), ")") else paste0("'", as.character(copay), "'"))
  }

  if (missing(deduct)) {
    deduct <- defaults$deduct
  }
  if (!is.null(deduct)) {
    fields <- c(fields, "deduct")
    values <- c(values, if (is.null(deduct)) "NULL" else if (is(deduct, "subQuery")) paste0("(", as.character(deduct), ")") else paste0("'", as.character(deduct), "'"))
  }

  if (missing(dobyr)) {
    dobyr <- defaults$dobyr
  }
  if (!is.null(dobyr)) {
    fields <- c(fields, "dobyr")
    values <- c(values, if (is.null(dobyr)) "NULL" else if (is(dobyr, "subQuery")) paste0("(", as.character(dobyr), ")") else paste0("'", as.character(dobyr), "'"))
  }

  if (missing(drugcovg)) {
    drugcovg <- defaults$drugcovg
  }
  if (!is.null(drugcovg)) {
    fields <- c(fields, "drugcovg")
    values <- c(values, if (is.null(drugcovg)) "NULL" else if (is(drugcovg, "subQuery")) paste0("(", as.character(drugcovg), ")") else paste0("'", as.character(drugcovg), "'"))
  }

  if (missing(dx1)) {
    dx1 <- defaults$dx1
  }
  if (!is.null(dx1)) {
    fields <- c(fields, "dx1")
    values <- c(values, if (is.null(dx1)) "NULL" else if (is(dx1, "subQuery")) paste0("(", as.character(dx1), ")") else paste0("'", as.character(dx1), "'"))
  }

  if (missing(dx2)) {
    dx2 <- defaults$dx2
  }
  if (!is.null(dx2)) {
    fields <- c(fields, "dx2")
    values <- c(values, if (is.null(dx2)) "NULL" else if (is(dx2, "subQuery")) paste0("(", as.character(dx2), ")") else paste0("'", as.character(dx2), "'"))
  }

  if (missing(dx3)) {
    dx3 <- defaults$dx3
  }
  if (!is.null(dx3)) {
    fields <- c(fields, "dx3")
    values <- c(values, if (is.null(dx3)) "NULL" else if (is(dx3, "subQuery")) paste0("(", as.character(dx3), ")") else paste0("'", as.character(dx3), "'"))
  }

  if (missing(dx4)) {
    dx4 <- defaults$dx4
  }
  if (!is.null(dx4)) {
    fields <- c(fields, "dx4")
    values <- c(values, if (is.null(dx4)) "NULL" else if (is(dx4, "subQuery")) paste0("(", as.character(dx4), ")") else paste0("'", as.character(dx4), "'"))
  }

  if (missing(dxver)) {
    dxver <- defaults$dxver
  }
  if (!is.null(dxver)) {
    fields <- c(fields, "dxver")
    values <- c(values, if (is.null(dxver)) "NULL" else if (is(dxver, "subQuery")) paste0("(", as.character(dxver), ")") else paste0("'", as.character(dxver), "'"))
  }

  if (missing(enrolid)) {
    enrolid <- defaults$enrolid
  }
  if (!is.null(enrolid)) {
    fields <- c(fields, "enrolid")
    values <- c(values, if (is.null(enrolid)) "NULL" else if (is(enrolid, "subQuery")) paste0("(", as.character(enrolid), ")") else paste0("'", as.character(enrolid), "'"))
  }

  if (missing(fachdid)) {
    fachdid <- defaults$fachdid
  }
  if (!is.null(fachdid)) {
    fields <- c(fields, "fachdid")
    values <- c(values, if (is.null(fachdid)) "NULL" else if (is(fachdid, "subQuery")) paste0("(", as.character(fachdid), ")") else paste0("'", as.character(fachdid), "'"))
  }

  if (missing(facprof)) {
    facprof <- defaults$facprof
  }
  if (!is.null(facprof)) {
    fields <- c(fields, "facprof")
    values <- c(values, if (is.null(facprof)) "NULL" else if (is(facprof, "subQuery")) paste0("(", as.character(facprof), ")") else paste0("'", as.character(facprof), "'"))
  }

  if (missing(mas)) {
    mas <- defaults$mas
  }
  if (!is.null(mas)) {
    fields <- c(fields, "mas")
    values <- c(values, if (is.null(mas)) "NULL" else if (is(mas, "subQuery")) paste0("(", as.character(mas), ")") else paste0("'", as.character(mas), "'"))
  }

  if (missing(mcasenum)) {
    mcasenum <- defaults$mcasenum
  }
  if (!is.null(mcasenum)) {
    fields <- c(fields, "mcasenum")
    values <- c(values, if (is.null(mcasenum)) "NULL" else if (is(mcasenum, "subQuery")) paste0("(", as.character(mcasenum), ")") else paste0("'", as.character(mcasenum), "'"))
  }

  if (missing(mdc)) {
    mdc <- defaults$mdc
  }
  if (!is.null(mdc)) {
    fields <- c(fields, "mdc")
    values <- c(values, if (is.null(mdc)) "NULL" else if (is(mdc, "subQuery")) paste0("(", as.character(mdc), ")") else paste0("'", as.character(mdc), "'"))
  }

  if (missing(medicare)) {
    medicare <- defaults$medicare
  }
  if (!is.null(medicare)) {
    fields <- c(fields, "medicare")
    values <- c(values, if (is.null(medicare)) "NULL" else if (is(medicare, "subQuery")) paste0("(", as.character(medicare), ")") else paste0("'", as.character(medicare), "'"))
  }

  if (missing(mhsacovg)) {
    mhsacovg <- defaults$mhsacovg
  }
  if (!is.null(mhsacovg)) {
    fields <- c(fields, "mhsacovg")
    values <- c(values, if (is.null(mhsacovg)) "NULL" else if (is(mhsacovg, "subQuery")) paste0("(", as.character(mhsacovg), ")") else paste0("'", as.character(mhsacovg), "'"))
  }

  if (missing(netpay)) {
    netpay <- defaults$netpay
  }
  if (!is.null(netpay)) {
    fields <- c(fields, "netpay")
    values <- c(values, if (is.null(netpay)) "NULL" else if (is(netpay, "subQuery")) paste0("(", as.character(netpay), ")") else paste0("'", as.character(netpay), "'"))
  }

  if (missing(pay)) {
    pay <- defaults$pay
  }
  if (!is.null(pay)) {
    fields <- c(fields, "pay")
    values <- c(values, if (is.null(pay)) "NULL" else if (is(pay, "subQuery")) paste0("(", as.character(pay), ")") else paste0("'", as.character(pay), "'"))
  }

  if (missing(pddate)) {
    pddate <- defaults$pddate
  }
  if (!is.null(pddate)) {
    fields <- c(fields, "pddate")
    values <- c(values, if (is.null(pddate)) "NULL" else if (is(pddate, "subQuery")) paste0("(", as.character(pddate), ")") else paste0("'", as.character(pddate), "'"))
  }

  if (missing(plantyp)) {
    plantyp <- defaults$plantyp
  }
  if (!is.null(plantyp)) {
    fields <- c(fields, "plantyp")
    values <- c(values, if (is.null(plantyp)) "NULL" else if (is(plantyp, "subQuery")) paste0("(", as.character(plantyp), ")") else paste0("'", as.character(plantyp), "'"))
  }

  if (missing(proc1)) {
    proc1 <- defaults$proc1
  }
  if (!is.null(proc1)) {
    fields <- c(fields, "proc1")
    values <- c(values, if (is.null(proc1)) "NULL" else if (is(proc1, "subQuery")) paste0("(", as.character(proc1), ")") else paste0("'", as.character(proc1), "'"))
  }

  if (missing(procgrp)) {
    procgrp <- defaults$procgrp
  }
  if (!is.null(procgrp)) {
    fields <- c(fields, "procgrp")
    values <- c(values, if (is.null(procgrp)) "NULL" else if (is(procgrp, "subQuery")) paste0("(", as.character(procgrp), ")") else paste0("'", as.character(procgrp), "'"))
  }

  if (missing(proctyp)) {
    proctyp <- defaults$proctyp
  }
  if (!is.null(proctyp)) {
    fields <- c(fields, "proctyp")
    values <- c(values, if (is.null(proctyp)) "NULL" else if (is(proctyp, "subQuery")) paste0("(", as.character(proctyp), ")") else paste0("'", as.character(proctyp), "'"))
  }

  if (missing(prov_id)) {
    prov_id <- defaults$prov_id
  }
  if (!is.null(prov_id)) {
    fields <- c(fields, "prov_id")
    values <- c(values, if (is.null(prov_id)) "NULL" else if (is(prov_id, "subQuery")) paste0("(", as.character(prov_id), ")") else paste0("'", as.character(prov_id), "'"))
  }

  if (missing(qty)) {
    qty <- defaults$qty
  }
  if (!is.null(qty)) {
    fields <- c(fields, "qty")
    values <- c(values, if (is.null(qty)) "NULL" else if (is(qty, "subQuery")) paste0("(", as.character(qty), ")") else paste0("'", as.character(qty), "'"))
  }

  if (missing(revcode)) {
    revcode <- defaults$revcode
  }
  if (!is.null(revcode)) {
    fields <- c(fields, "revcode")
    values <- c(values, if (is.null(revcode)) "NULL" else if (is(revcode, "subQuery")) paste0("(", as.character(revcode), ")") else paste0("'", as.character(revcode), "'"))
  }

  if (missing(seqnum)) {
    seqnum <- defaults$seqnum
  }
  if (!is.null(seqnum)) {
    fields <- c(fields, "seqnum")
    values <- c(values, if (is.null(seqnum)) "NULL" else if (is(seqnum, "subQuery")) paste0("(", as.character(seqnum), ")") else paste0("'", as.character(seqnum), "'"))
  }

  if (missing(sex)) {
    sex <- defaults$sex
  }
  if (!is.null(sex)) {
    fields <- c(fields, "sex")
    values <- c(values, if (is.null(sex)) "NULL" else if (is(sex, "subQuery")) paste0("(", as.character(sex), ")") else paste0("'", as.character(sex), "'"))
  }

  if (missing(stdplac)) {
    stdplac <- defaults$stdplac
  }
  if (!is.null(stdplac)) {
    fields <- c(fields, "stdplac")
    values <- c(values, if (is.null(stdplac)) "NULL" else if (is(stdplac, "subQuery")) paste0("(", as.character(stdplac), ")") else paste0("'", as.character(stdplac), "'"))
  }

  if (missing(stdprov)) {
    stdprov <- defaults$stdprov
  }
  if (!is.null(stdprov)) {
    fields <- c(fields, "stdprov")
    values <- c(values, if (is.null(stdprov)) "NULL" else if (is(stdprov, "subQuery")) paste0("(", as.character(stdprov), ")") else paste0("'", as.character(stdprov), "'"))
  }

  if (missing(stdrace)) {
    stdrace <- defaults$stdrace
  }
  if (!is.null(stdrace)) {
    fields <- c(fields, "stdrace")
    values <- c(values, if (is.null(stdrace)) "NULL" else if (is(stdrace, "subQuery")) paste0("(", as.character(stdrace), ")") else paste0("'", as.character(stdrace), "'"))
  }

  if (missing(stdsvc)) {
    stdsvc <- defaults$stdsvc
  }
  if (!is.null(stdsvc)) {
    fields <- c(fields, "stdsvc")
    values <- c(values, if (is.null(stdsvc)) "NULL" else if (is(stdsvc, "subQuery")) paste0("(", as.character(stdsvc), ")") else paste0("'", as.character(stdsvc), "'"))
  }

  if (missing(svcdate)) {
    svcdate <- defaults$svcdate
  }
  if (!is.null(svcdate)) {
    fields <- c(fields, "svcdate")
    values <- c(values, if (is.null(svcdate)) "NULL" else if (is(svcdate, "subQuery")) paste0("(", as.character(svcdate), ")") else paste0("'", as.character(svcdate), "'"))
  }

  if (missing(svcscat)) {
    svcscat <- defaults$svcscat
  }
  if (!is.null(svcscat)) {
    fields <- c(fields, "svcscat")
    values <- c(values, if (is.null(svcscat)) "NULL" else if (is(svcscat, "subQuery")) paste0("(", as.character(svcscat), ")") else paste0("'", as.character(svcscat), "'"))
  }

  if (missing(tsvcdat)) {
    tsvcdat <- defaults$tsvcdat
  }
  if (!is.null(tsvcdat)) {
    fields <- c(fields, "tsvcdat")
    values <- c(values, if (is.null(tsvcdat)) "NULL" else if (is(tsvcdat, "subQuery")) paste0("(", as.character(tsvcdat), ")") else paste0("'", as.character(tsvcdat), "'"))
  }

  if (missing(version)) {
    version <- defaults$version
  }
  if (!is.null(version)) {
    fields <- c(fields, "version")
    values <- c(values, if (is.null(version)) "NULL" else if (is(version, "subQuery")) paste0("(", as.character(version), ")") else paste0("'", as.character(version), "'"))
  }

  if (missing(year)) {
    year <- defaults$year
  }
  if (!is.null(year)) {
    fields <- c(fields, "year")
    values <- c(values, if (is.null(year)) "NULL" else if (is(year, "subQuery")) paste0("(", as.character(year), ")") else paste0("'", as.character(year), "'"))
  }

  if (missing(units)) {
    units <- defaults$units
  }
  if (!is.null(units)) {
    fields <- c(fields, "units")
    values <- c(values, if (is.null(units)) "NULL" else if (is(units, "subQuery")) paste0("(", as.character(units), ")") else paste0("'", as.character(units), "'"))
  }

  if (missing(npi)) {
    npi <- defaults$npi
  }
  if (!is.null(npi)) {
    fields <- c(fields, "npi")
    values <- c(values, if (is.null(npi)) "NULL" else if (is(npi, "subQuery")) paste0("(", as.character(npi), ")") else paste0("'", as.character(npi), "'"))
  }

  if (missing(msclmid)) {
    msclmid <- defaults$msclmid
  }
  if (!is.null(msclmid)) {
    fields <- c(fields, "msclmid")
    values <- c(values, if (is.null(msclmid)) "NULL" else if (is(msclmid, "subQuery")) paste0("(", as.character(msclmid), ")") else paste0("'", as.character(msclmid), "'"))
  }

  inserts <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, table = "long_term_care", fields = fields, values = values)
  frameworkContext$inserts[[length(frameworkContext$inserts) + 1]] <- inserts
  invisible(NULL)
}

add_outpatient_services <- function(boe, cap, cob, coins, copay, deduct, dental, dobyr, drugcovg, dx1, dx2, dx3, dx4, dxver, enrolid, fachdid, facprof, mas, mcasenum, mdc, medicare, mhsacovg, netpay, pay, pddate, plantyp, proc1, procgrp, proctyp, prov_id, qty, revcode, seqnum, sex, stdplac, stdprov, stdrace, stdsvc, svcdate, svcscat, tsvcdat, version, year, units, npi, msclmid) {
  defaults <- get('outpatient_services', envir = frameworkContext$defaultValues)
  fields <- c()
  values <- c()
  if (missing(boe)) {
    boe <- defaults$boe
  }
  if (!is.null(boe)) {
    fields <- c(fields, "boe")
    values <- c(values, if (is.null(boe)) "NULL" else if (is(boe, "subQuery")) paste0("(", as.character(boe), ")") else paste0("'", as.character(boe), "'"))
  }

  if (missing(cap)) {
    cap <- defaults$cap
  }
  if (!is.null(cap)) {
    fields <- c(fields, "cap")
    values <- c(values, if (is.null(cap)) "NULL" else if (is(cap, "subQuery")) paste0("(", as.character(cap), ")") else paste0("'", as.character(cap), "'"))
  }

  if (missing(cob)) {
    cob <- defaults$cob
  }
  if (!is.null(cob)) {
    fields <- c(fields, "cob")
    values <- c(values, if (is.null(cob)) "NULL" else if (is(cob, "subQuery")) paste0("(", as.character(cob), ")") else paste0("'", as.character(cob), "'"))
  }

  if (missing(coins)) {
    coins <- defaults$coins
  }
  if (!is.null(coins)) {
    fields <- c(fields, "coins")
    values <- c(values, if (is.null(coins)) "NULL" else if (is(coins, "subQuery")) paste0("(", as.character(coins), ")") else paste0("'", as.character(coins), "'"))
  }

  if (missing(copay)) {
    copay <- defaults$copay
  }
  if (!is.null(copay)) {
    fields <- c(fields, "copay")
    values <- c(values, if (is.null(copay)) "NULL" else if (is(copay, "subQuery")) paste0("(", as.character(copay), ")") else paste0("'", as.character(copay), "'"))
  }

  if (missing(deduct)) {
    deduct <- defaults$deduct
  }
  if (!is.null(deduct)) {
    fields <- c(fields, "deduct")
    values <- c(values, if (is.null(deduct)) "NULL" else if (is(deduct, "subQuery")) paste0("(", as.character(deduct), ")") else paste0("'", as.character(deduct), "'"))
  }

  if (missing(dental)) {
    dental <- defaults$dental
  }
  if (!is.null(dental)) {
    fields <- c(fields, "dental")
    values <- c(values, if (is.null(dental)) "NULL" else if (is(dental, "subQuery")) paste0("(", as.character(dental), ")") else paste0("'", as.character(dental), "'"))
  }

  if (missing(dobyr)) {
    dobyr <- defaults$dobyr
  }
  if (!is.null(dobyr)) {
    fields <- c(fields, "dobyr")
    values <- c(values, if (is.null(dobyr)) "NULL" else if (is(dobyr, "subQuery")) paste0("(", as.character(dobyr), ")") else paste0("'", as.character(dobyr), "'"))
  }

  if (missing(drugcovg)) {
    drugcovg <- defaults$drugcovg
  }
  if (!is.null(drugcovg)) {
    fields <- c(fields, "drugcovg")
    values <- c(values, if (is.null(drugcovg)) "NULL" else if (is(drugcovg, "subQuery")) paste0("(", as.character(drugcovg), ")") else paste0("'", as.character(drugcovg), "'"))
  }

  if (missing(dx1)) {
    dx1 <- defaults$dx1
  }
  if (!is.null(dx1)) {
    fields <- c(fields, "dx1")
    values <- c(values, if (is.null(dx1)) "NULL" else if (is(dx1, "subQuery")) paste0("(", as.character(dx1), ")") else paste0("'", as.character(dx1), "'"))
  }

  if (missing(dx2)) {
    dx2 <- defaults$dx2
  }
  if (!is.null(dx2)) {
    fields <- c(fields, "dx2")
    values <- c(values, if (is.null(dx2)) "NULL" else if (is(dx2, "subQuery")) paste0("(", as.character(dx2), ")") else paste0("'", as.character(dx2), "'"))
  }

  if (missing(dx3)) {
    dx3 <- defaults$dx3
  }
  if (!is.null(dx3)) {
    fields <- c(fields, "dx3")
    values <- c(values, if (is.null(dx3)) "NULL" else if (is(dx3, "subQuery")) paste0("(", as.character(dx3), ")") else paste0("'", as.character(dx3), "'"))
  }

  if (missing(dx4)) {
    dx4 <- defaults$dx4
  }
  if (!is.null(dx4)) {
    fields <- c(fields, "dx4")
    values <- c(values, if (is.null(dx4)) "NULL" else if (is(dx4, "subQuery")) paste0("(", as.character(dx4), ")") else paste0("'", as.character(dx4), "'"))
  }

  if (missing(dxver)) {
    dxver <- defaults$dxver
  }
  if (!is.null(dxver)) {
    fields <- c(fields, "dxver")
    values <- c(values, if (is.null(dxver)) "NULL" else if (is(dxver, "subQuery")) paste0("(", as.character(dxver), ")") else paste0("'", as.character(dxver), "'"))
  }

  if (missing(enrolid)) {
    enrolid <- defaults$enrolid
  }
  if (!is.null(enrolid)) {
    fields <- c(fields, "enrolid")
    values <- c(values, if (is.null(enrolid)) "NULL" else if (is(enrolid, "subQuery")) paste0("(", as.character(enrolid), ")") else paste0("'", as.character(enrolid), "'"))
  }

  if (missing(fachdid)) {
    fachdid <- defaults$fachdid
  }
  if (!is.null(fachdid)) {
    fields <- c(fields, "fachdid")
    values <- c(values, if (is.null(fachdid)) "NULL" else if (is(fachdid, "subQuery")) paste0("(", as.character(fachdid), ")") else paste0("'", as.character(fachdid), "'"))
  }

  if (missing(facprof)) {
    facprof <- defaults$facprof
  }
  if (!is.null(facprof)) {
    fields <- c(fields, "facprof")
    values <- c(values, if (is.null(facprof)) "NULL" else if (is(facprof, "subQuery")) paste0("(", as.character(facprof), ")") else paste0("'", as.character(facprof), "'"))
  }

  if (missing(mas)) {
    mas <- defaults$mas
  }
  if (!is.null(mas)) {
    fields <- c(fields, "mas")
    values <- c(values, if (is.null(mas)) "NULL" else if (is(mas, "subQuery")) paste0("(", as.character(mas), ")") else paste0("'", as.character(mas), "'"))
  }

  if (missing(mcasenum)) {
    mcasenum <- defaults$mcasenum
  }
  if (!is.null(mcasenum)) {
    fields <- c(fields, "mcasenum")
    values <- c(values, if (is.null(mcasenum)) "NULL" else if (is(mcasenum, "subQuery")) paste0("(", as.character(mcasenum), ")") else paste0("'", as.character(mcasenum), "'"))
  }

  if (missing(mdc)) {
    mdc <- defaults$mdc
  }
  if (!is.null(mdc)) {
    fields <- c(fields, "mdc")
    values <- c(values, if (is.null(mdc)) "NULL" else if (is(mdc, "subQuery")) paste0("(", as.character(mdc), ")") else paste0("'", as.character(mdc), "'"))
  }

  if (missing(medicare)) {
    medicare <- defaults$medicare
  }
  if (!is.null(medicare)) {
    fields <- c(fields, "medicare")
    values <- c(values, if (is.null(medicare)) "NULL" else if (is(medicare, "subQuery")) paste0("(", as.character(medicare), ")") else paste0("'", as.character(medicare), "'"))
  }

  if (missing(mhsacovg)) {
    mhsacovg <- defaults$mhsacovg
  }
  if (!is.null(mhsacovg)) {
    fields <- c(fields, "mhsacovg")
    values <- c(values, if (is.null(mhsacovg)) "NULL" else if (is(mhsacovg, "subQuery")) paste0("(", as.character(mhsacovg), ")") else paste0("'", as.character(mhsacovg), "'"))
  }

  if (missing(netpay)) {
    netpay <- defaults$netpay
  }
  if (!is.null(netpay)) {
    fields <- c(fields, "netpay")
    values <- c(values, if (is.null(netpay)) "NULL" else if (is(netpay, "subQuery")) paste0("(", as.character(netpay), ")") else paste0("'", as.character(netpay), "'"))
  }

  if (missing(pay)) {
    pay <- defaults$pay
  }
  if (!is.null(pay)) {
    fields <- c(fields, "pay")
    values <- c(values, if (is.null(pay)) "NULL" else if (is(pay, "subQuery")) paste0("(", as.character(pay), ")") else paste0("'", as.character(pay), "'"))
  }

  if (missing(pddate)) {
    pddate <- defaults$pddate
  }
  if (!is.null(pddate)) {
    fields <- c(fields, "pddate")
    values <- c(values, if (is.null(pddate)) "NULL" else if (is(pddate, "subQuery")) paste0("(", as.character(pddate), ")") else paste0("'", as.character(pddate), "'"))
  }

  if (missing(plantyp)) {
    plantyp <- defaults$plantyp
  }
  if (!is.null(plantyp)) {
    fields <- c(fields, "plantyp")
    values <- c(values, if (is.null(plantyp)) "NULL" else if (is(plantyp, "subQuery")) paste0("(", as.character(plantyp), ")") else paste0("'", as.character(plantyp), "'"))
  }

  if (missing(proc1)) {
    proc1 <- defaults$proc1
  }
  if (!is.null(proc1)) {
    fields <- c(fields, "proc1")
    values <- c(values, if (is.null(proc1)) "NULL" else if (is(proc1, "subQuery")) paste0("(", as.character(proc1), ")") else paste0("'", as.character(proc1), "'"))
  }

  if (missing(procgrp)) {
    procgrp <- defaults$procgrp
  }
  if (!is.null(procgrp)) {
    fields <- c(fields, "procgrp")
    values <- c(values, if (is.null(procgrp)) "NULL" else if (is(procgrp, "subQuery")) paste0("(", as.character(procgrp), ")") else paste0("'", as.character(procgrp), "'"))
  }

  if (missing(proctyp)) {
    proctyp <- defaults$proctyp
  }
  if (!is.null(proctyp)) {
    fields <- c(fields, "proctyp")
    values <- c(values, if (is.null(proctyp)) "NULL" else if (is(proctyp, "subQuery")) paste0("(", as.character(proctyp), ")") else paste0("'", as.character(proctyp), "'"))
  }

  if (missing(prov_id)) {
    prov_id <- defaults$prov_id
  }
  if (!is.null(prov_id)) {
    fields <- c(fields, "prov_id")
    values <- c(values, if (is.null(prov_id)) "NULL" else if (is(prov_id, "subQuery")) paste0("(", as.character(prov_id), ")") else paste0("'", as.character(prov_id), "'"))
  }

  if (missing(qty)) {
    qty <- defaults$qty
  }
  if (!is.null(qty)) {
    fields <- c(fields, "qty")
    values <- c(values, if (is.null(qty)) "NULL" else if (is(qty, "subQuery")) paste0("(", as.character(qty), ")") else paste0("'", as.character(qty), "'"))
  }

  if (missing(revcode)) {
    revcode <- defaults$revcode
  }
  if (!is.null(revcode)) {
    fields <- c(fields, "revcode")
    values <- c(values, if (is.null(revcode)) "NULL" else if (is(revcode, "subQuery")) paste0("(", as.character(revcode), ")") else paste0("'", as.character(revcode), "'"))
  }

  if (missing(seqnum)) {
    seqnum <- defaults$seqnum
  }
  if (!is.null(seqnum)) {
    fields <- c(fields, "seqnum")
    values <- c(values, if (is.null(seqnum)) "NULL" else if (is(seqnum, "subQuery")) paste0("(", as.character(seqnum), ")") else paste0("'", as.character(seqnum), "'"))
  }

  if (missing(sex)) {
    sex <- defaults$sex
  }
  if (!is.null(sex)) {
    fields <- c(fields, "sex")
    values <- c(values, if (is.null(sex)) "NULL" else if (is(sex, "subQuery")) paste0("(", as.character(sex), ")") else paste0("'", as.character(sex), "'"))
  }

  if (missing(stdplac)) {
    stdplac <- defaults$stdplac
  }
  if (!is.null(stdplac)) {
    fields <- c(fields, "stdplac")
    values <- c(values, if (is.null(stdplac)) "NULL" else if (is(stdplac, "subQuery")) paste0("(", as.character(stdplac), ")") else paste0("'", as.character(stdplac), "'"))
  }

  if (missing(stdprov)) {
    stdprov <- defaults$stdprov
  }
  if (!is.null(stdprov)) {
    fields <- c(fields, "stdprov")
    values <- c(values, if (is.null(stdprov)) "NULL" else if (is(stdprov, "subQuery")) paste0("(", as.character(stdprov), ")") else paste0("'", as.character(stdprov), "'"))
  }

  if (missing(stdrace)) {
    stdrace <- defaults$stdrace
  }
  if (!is.null(stdrace)) {
    fields <- c(fields, "stdrace")
    values <- c(values, if (is.null(stdrace)) "NULL" else if (is(stdrace, "subQuery")) paste0("(", as.character(stdrace), ")") else paste0("'", as.character(stdrace), "'"))
  }

  if (missing(stdsvc)) {
    stdsvc <- defaults$stdsvc
  }
  if (!is.null(stdsvc)) {
    fields <- c(fields, "stdsvc")
    values <- c(values, if (is.null(stdsvc)) "NULL" else if (is(stdsvc, "subQuery")) paste0("(", as.character(stdsvc), ")") else paste0("'", as.character(stdsvc), "'"))
  }

  if (missing(svcdate)) {
    svcdate <- defaults$svcdate
  }
  if (!is.null(svcdate)) {
    fields <- c(fields, "svcdate")
    values <- c(values, if (is.null(svcdate)) "NULL" else if (is(svcdate, "subQuery")) paste0("(", as.character(svcdate), ")") else paste0("'", as.character(svcdate), "'"))
  }

  if (missing(svcscat)) {
    svcscat <- defaults$svcscat
  }
  if (!is.null(svcscat)) {
    fields <- c(fields, "svcscat")
    values <- c(values, if (is.null(svcscat)) "NULL" else if (is(svcscat, "subQuery")) paste0("(", as.character(svcscat), ")") else paste0("'", as.character(svcscat), "'"))
  }

  if (missing(tsvcdat)) {
    tsvcdat <- defaults$tsvcdat
  }
  if (!is.null(tsvcdat)) {
    fields <- c(fields, "tsvcdat")
    values <- c(values, if (is.null(tsvcdat)) "NULL" else if (is(tsvcdat, "subQuery")) paste0("(", as.character(tsvcdat), ")") else paste0("'", as.character(tsvcdat), "'"))
  }

  if (missing(version)) {
    version <- defaults$version
  }
  if (!is.null(version)) {
    fields <- c(fields, "version")
    values <- c(values, if (is.null(version)) "NULL" else if (is(version, "subQuery")) paste0("(", as.character(version), ")") else paste0("'", as.character(version), "'"))
  }

  if (missing(year)) {
    year <- defaults$year
  }
  if (!is.null(year)) {
    fields <- c(fields, "year")
    values <- c(values, if (is.null(year)) "NULL" else if (is(year, "subQuery")) paste0("(", as.character(year), ")") else paste0("'", as.character(year), "'"))
  }

  if (missing(units)) {
    units <- defaults$units
  }
  if (!is.null(units)) {
    fields <- c(fields, "units")
    values <- c(values, if (is.null(units)) "NULL" else if (is(units, "subQuery")) paste0("(", as.character(units), ")") else paste0("'", as.character(units), "'"))
  }

  if (missing(npi)) {
    npi <- defaults$npi
  }
  if (!is.null(npi)) {
    fields <- c(fields, "npi")
    values <- c(values, if (is.null(npi)) "NULL" else if (is(npi, "subQuery")) paste0("(", as.character(npi), ")") else paste0("'", as.character(npi), "'"))
  }

  if (missing(msclmid)) {
    msclmid <- defaults$msclmid
  }
  if (!is.null(msclmid)) {
    fields <- c(fields, "msclmid")
    values <- c(values, if (is.null(msclmid)) "NULL" else if (is(msclmid, "subQuery")) paste0("(", as.character(msclmid), ")") else paste0("'", as.character(msclmid), "'"))
  }

  inserts <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, table = "outpatient_services", fields = fields, values = values)
  frameworkContext$inserts[[length(frameworkContext$inserts) + 1]] <- inserts
  invisible(NULL)
}

expect_condition_occurrence <- function(condition_occurrence_id, person_id, condition_concept_id, condition_start_date, condition_start_datetime, condition_end_date, condition_end_datetime, condition_type_concept_id, stop_reason, provider_id, visit_occurrence_id, visit_detail_id, condition_source_value, condition_source_concept_id, condition_status_source_value, condition_status_concept_id) {
  fields <- c()
  values <- c()
  if (!missing(condition_occurrence_id)) {
    fields <- c(fields, "condition_occurrence_id")
    values <- c(values, if (is.null(condition_occurrence_id)) "NULL" else if (is(condition_occurrence_id, "subQuery")) paste0("(", as.character(condition_occurrence_id), ")") else paste0("'", as.character(condition_occurrence_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(condition_concept_id)) {
    fields <- c(fields, "condition_concept_id")
    values <- c(values, if (is.null(condition_concept_id)) "NULL" else if (is(condition_concept_id, "subQuery")) paste0("(", as.character(condition_concept_id), ")") else paste0("'", as.character(condition_concept_id), "'"))
  }

  if (!missing(condition_start_date)) {
    fields <- c(fields, "condition_start_date")
    values <- c(values, if (is.null(condition_start_date)) "NULL" else if (is(condition_start_date, "subQuery")) paste0("(", as.character(condition_start_date), ")") else paste0("'", as.character(condition_start_date), "'"))
  }

  if (!missing(condition_start_datetime)) {
    fields <- c(fields, "condition_start_datetime")
    values <- c(values, if (is.null(condition_start_datetime)) "NULL" else if (is(condition_start_datetime, "subQuery")) paste0("(", as.character(condition_start_datetime), ")") else paste0("'", as.character(condition_start_datetime), "'"))
  }

  if (!missing(condition_end_date)) {
    fields <- c(fields, "condition_end_date")
    values <- c(values, if (is.null(condition_end_date)) "NULL" else if (is(condition_end_date, "subQuery")) paste0("(", as.character(condition_end_date), ")") else paste0("'", as.character(condition_end_date), "'"))
  }

  if (!missing(condition_end_datetime)) {
    fields <- c(fields, "condition_end_datetime")
    values <- c(values, if (is.null(condition_end_datetime)) "NULL" else if (is(condition_end_datetime, "subQuery")) paste0("(", as.character(condition_end_datetime), ")") else paste0("'", as.character(condition_end_datetime), "'"))
  }

  if (!missing(condition_type_concept_id)) {
    fields <- c(fields, "condition_type_concept_id")
    values <- c(values, if (is.null(condition_type_concept_id)) "NULL" else if (is(condition_type_concept_id, "subQuery")) paste0("(", as.character(condition_type_concept_id), ")") else paste0("'", as.character(condition_type_concept_id), "'"))
  }

  if (!missing(stop_reason)) {
    fields <- c(fields, "stop_reason")
    values <- c(values, if (is.null(stop_reason)) "NULL" else if (is(stop_reason, "subQuery")) paste0("(", as.character(stop_reason), ")") else paste0("'", as.character(stop_reason), "'"))
  }

  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    fields <- c(fields, "visit_occurrence_id")
    values <- c(values, if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  if (!missing(visit_detail_id)) {
    fields <- c(fields, "visit_detail_id")
    values <- c(values, if (is.null(visit_detail_id)) "NULL" else if (is(visit_detail_id, "subQuery")) paste0("(", as.character(visit_detail_id), ")") else paste0("'", as.character(visit_detail_id), "'"))
  }

  if (!missing(condition_source_value)) {
    fields <- c(fields, "condition_source_value")
    values <- c(values, if (is.null(condition_source_value)) "NULL" else if (is(condition_source_value, "subQuery")) paste0("(", as.character(condition_source_value), ")") else paste0("'", as.character(condition_source_value), "'"))
  }

  if (!missing(condition_source_concept_id)) {
    fields <- c(fields, "condition_source_concept_id")
    values <- c(values, if (is.null(condition_source_concept_id)) "NULL" else if (is(condition_source_concept_id, "subQuery")) paste0("(", as.character(condition_source_concept_id), ")") else paste0("'", as.character(condition_source_concept_id), "'"))
  }

  if (!missing(condition_status_source_value)) {
    fields <- c(fields, "condition_status_source_value")
    values <- c(values, if (is.null(condition_status_source_value)) "NULL" else if (is(condition_status_source_value, "subQuery")) paste0("(", as.character(condition_status_source_value), ")") else paste0("'", as.character(condition_status_source_value), "'"))
  }

  if (!missing(condition_status_concept_id)) {
    fields <- c(fields, "condition_status_concept_id")
    values <- c(values, if (is.null(condition_status_concept_id)) "NULL" else if (is(condition_status_concept_id, "subQuery")) paste0("(", as.character(condition_status_concept_id), ")") else paste0("'", as.character(condition_status_concept_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 0, table = "condition_occurrence", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_death <- function(person_id, death_date, death_datetime, death_type_concept_id, cause_concept_id, cause_source_value, cause_source_concept_id) {
  fields <- c()
  values <- c()
  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(death_date)) {
    fields <- c(fields, "death_date")
    values <- c(values, if (is.null(death_date)) "NULL" else if (is(death_date, "subQuery")) paste0("(", as.character(death_date), ")") else paste0("'", as.character(death_date), "'"))
  }

  if (!missing(death_datetime)) {
    fields <- c(fields, "death_datetime")
    values <- c(values, if (is.null(death_datetime)) "NULL" else if (is(death_datetime, "subQuery")) paste0("(", as.character(death_datetime), ")") else paste0("'", as.character(death_datetime), "'"))
  }

  if (!missing(death_type_concept_id)) {
    fields <- c(fields, "death_type_concept_id")
    values <- c(values, if (is.null(death_type_concept_id)) "NULL" else if (is(death_type_concept_id, "subQuery")) paste0("(", as.character(death_type_concept_id), ")") else paste0("'", as.character(death_type_concept_id), "'"))
  }

  if (!missing(cause_concept_id)) {
    fields <- c(fields, "cause_concept_id")
    values <- c(values, if (is.null(cause_concept_id)) "NULL" else if (is(cause_concept_id, "subQuery")) paste0("(", as.character(cause_concept_id), ")") else paste0("'", as.character(cause_concept_id), "'"))
  }

  if (!missing(cause_source_value)) {
    fields <- c(fields, "cause_source_value")
    values <- c(values, if (is.null(cause_source_value)) "NULL" else if (is(cause_source_value, "subQuery")) paste0("(", as.character(cause_source_value), ")") else paste0("'", as.character(cause_source_value), "'"))
  }

  if (!missing(cause_source_concept_id)) {
    fields <- c(fields, "cause_source_concept_id")
    values <- c(values, if (is.null(cause_source_concept_id)) "NULL" else if (is(cause_source_concept_id, "subQuery")) paste0("(", as.character(cause_source_concept_id), ")") else paste0("'", as.character(cause_source_concept_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 0, table = "death", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_device_exposure <- function(device_exposure_id, person_id, device_concept_id, device_exposure_start_date, device_exposure_start_datetime, device_exposure_end_date, device_exposure_end_datetime, device_type_concept_id, unique_device_id, quantity, provider_id, visit_occurrence_id, device_source_value, device_source__concept_id, visit_detail_id) {
  fields <- c()
  values <- c()
  if (!missing(device_exposure_id)) {
    fields <- c(fields, "device_exposure_id")
    values <- c(values, if (is.null(device_exposure_id)) "NULL" else if (is(device_exposure_id, "subQuery")) paste0("(", as.character(device_exposure_id), ")") else paste0("'", as.character(device_exposure_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(device_concept_id)) {
    fields <- c(fields, "device_concept_id")
    values <- c(values, if (is.null(device_concept_id)) "NULL" else if (is(device_concept_id, "subQuery")) paste0("(", as.character(device_concept_id), ")") else paste0("'", as.character(device_concept_id), "'"))
  }

  if (!missing(device_exposure_start_date)) {
    fields <- c(fields, "device_exposure_start_date")
    values <- c(values, if (is.null(device_exposure_start_date)) "NULL" else if (is(device_exposure_start_date, "subQuery")) paste0("(", as.character(device_exposure_start_date), ")") else paste0("'", as.character(device_exposure_start_date), "'"))
  }

  if (!missing(device_exposure_start_datetime)) {
    fields <- c(fields, "device_exposure_start_datetime")
    values <- c(values, if (is.null(device_exposure_start_datetime)) "NULL" else if (is(device_exposure_start_datetime, "subQuery")) paste0("(", as.character(device_exposure_start_datetime), ")") else paste0("'", as.character(device_exposure_start_datetime), "'"))
  }

  if (!missing(device_exposure_end_date)) {
    fields <- c(fields, "device_exposure_end_date")
    values <- c(values, if (is.null(device_exposure_end_date)) "NULL" else if (is(device_exposure_end_date, "subQuery")) paste0("(", as.character(device_exposure_end_date), ")") else paste0("'", as.character(device_exposure_end_date), "'"))
  }

  if (!missing(device_exposure_end_datetime)) {
    fields <- c(fields, "device_exposure_end_datetime")
    values <- c(values, if (is.null(device_exposure_end_datetime)) "NULL" else if (is(device_exposure_end_datetime, "subQuery")) paste0("(", as.character(device_exposure_end_datetime), ")") else paste0("'", as.character(device_exposure_end_datetime), "'"))
  }

  if (!missing(device_type_concept_id)) {
    fields <- c(fields, "device_type_concept_id")
    values <- c(values, if (is.null(device_type_concept_id)) "NULL" else if (is(device_type_concept_id, "subQuery")) paste0("(", as.character(device_type_concept_id), ")") else paste0("'", as.character(device_type_concept_id), "'"))
  }

  if (!missing(unique_device_id)) {
    fields <- c(fields, "unique_device_id")
    values <- c(values, if (is.null(unique_device_id)) "NULL" else if (is(unique_device_id, "subQuery")) paste0("(", as.character(unique_device_id), ")") else paste0("'", as.character(unique_device_id), "'"))
  }

  if (!missing(quantity)) {
    fields <- c(fields, "quantity")
    values <- c(values, if (is.null(quantity)) "NULL" else if (is(quantity, "subQuery")) paste0("(", as.character(quantity), ")") else paste0("'", as.character(quantity), "'"))
  }

  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    fields <- c(fields, "visit_occurrence_id")
    values <- c(values, if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  if (!missing(device_source_value)) {
    fields <- c(fields, "device_source_value")
    values <- c(values, if (is.null(device_source_value)) "NULL" else if (is(device_source_value, "subQuery")) paste0("(", as.character(device_source_value), ")") else paste0("'", as.character(device_source_value), "'"))
  }

  if (!missing(device_source__concept_id)) {
    fields <- c(fields, "[device_source_ concept_id]")
    values <- c(values, if (is.null(device_source__concept_id)) "NULL" else if (is(device_source__concept_id, "subQuery")) paste0("(", as.character(device_source__concept_id), ")") else paste0("'", as.character(device_source__concept_id), "'"))
  }

  if (!missing(visit_detail_id)) {
    fields <- c(fields, "visit_detail_id")
    values <- c(values, if (is.null(visit_detail_id)) "NULL" else if (is(visit_detail_id, "subQuery")) paste0("(", as.character(visit_detail_id), ")") else paste0("'", as.character(visit_detail_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 0, table = "device_exposure", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_drug_exposure <- function(drug_exposure_id, person_id, drug_concept_id, drug_exposure_start_date, drug_exposure_start_datetime, drug_exposure_end_date, drug_exposure_end_datetime, verbatim_end_date, drug_type_concept_id, stop_reason, refills, quantity, days_supply, sig, route_concept_id, lot_number, provider_id, visit_occurrence_id, drug_source_value, drug_source_concept_id, route_source_value, dose_unit_source_value, visit_detail_id) {
  fields <- c()
  values <- c()
  if (!missing(drug_exposure_id)) {
    fields <- c(fields, "drug_exposure_id")
    values <- c(values, if (is.null(drug_exposure_id)) "NULL" else if (is(drug_exposure_id, "subQuery")) paste0("(", as.character(drug_exposure_id), ")") else paste0("'", as.character(drug_exposure_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(drug_concept_id)) {
    fields <- c(fields, "drug_concept_id")
    values <- c(values, if (is.null(drug_concept_id)) "NULL" else if (is(drug_concept_id, "subQuery")) paste0("(", as.character(drug_concept_id), ")") else paste0("'", as.character(drug_concept_id), "'"))
  }

  if (!missing(drug_exposure_start_date)) {
    fields <- c(fields, "drug_exposure_start_date")
    values <- c(values, if (is.null(drug_exposure_start_date)) "NULL" else if (is(drug_exposure_start_date, "subQuery")) paste0("(", as.character(drug_exposure_start_date), ")") else paste0("'", as.character(drug_exposure_start_date), "'"))
  }

  if (!missing(drug_exposure_start_datetime)) {
    fields <- c(fields, "drug_exposure_start_datetime")
    values <- c(values, if (is.null(drug_exposure_start_datetime)) "NULL" else if (is(drug_exposure_start_datetime, "subQuery")) paste0("(", as.character(drug_exposure_start_datetime), ")") else paste0("'", as.character(drug_exposure_start_datetime), "'"))
  }

  if (!missing(drug_exposure_end_date)) {
    fields <- c(fields, "drug_exposure_end_date")
    values <- c(values, if (is.null(drug_exposure_end_date)) "NULL" else if (is(drug_exposure_end_date, "subQuery")) paste0("(", as.character(drug_exposure_end_date), ")") else paste0("'", as.character(drug_exposure_end_date), "'"))
  }

  if (!missing(drug_exposure_end_datetime)) {
    fields <- c(fields, "drug_exposure_end_datetime")
    values <- c(values, if (is.null(drug_exposure_end_datetime)) "NULL" else if (is(drug_exposure_end_datetime, "subQuery")) paste0("(", as.character(drug_exposure_end_datetime), ")") else paste0("'", as.character(drug_exposure_end_datetime), "'"))
  }

  if (!missing(verbatim_end_date)) {
    fields <- c(fields, "verbatim_end_date")
    values <- c(values, if (is.null(verbatim_end_date)) "NULL" else if (is(verbatim_end_date, "subQuery")) paste0("(", as.character(verbatim_end_date), ")") else paste0("'", as.character(verbatim_end_date), "'"))
  }

  if (!missing(drug_type_concept_id)) {
    fields <- c(fields, "drug_type_concept_id")
    values <- c(values, if (is.null(drug_type_concept_id)) "NULL" else if (is(drug_type_concept_id, "subQuery")) paste0("(", as.character(drug_type_concept_id), ")") else paste0("'", as.character(drug_type_concept_id), "'"))
  }

  if (!missing(stop_reason)) {
    fields <- c(fields, "stop_reason")
    values <- c(values, if (is.null(stop_reason)) "NULL" else if (is(stop_reason, "subQuery")) paste0("(", as.character(stop_reason), ")") else paste0("'", as.character(stop_reason), "'"))
  }

  if (!missing(refills)) {
    fields <- c(fields, "refills")
    values <- c(values, if (is.null(refills)) "NULL" else if (is(refills, "subQuery")) paste0("(", as.character(refills), ")") else paste0("'", as.character(refills), "'"))
  }

  if (!missing(quantity)) {
    fields <- c(fields, "quantity")
    values <- c(values, if (is.null(quantity)) "NULL" else if (is(quantity, "subQuery")) paste0("(", as.character(quantity), ")") else paste0("'", as.character(quantity), "'"))
  }

  if (!missing(days_supply)) {
    fields <- c(fields, "days_supply")
    values <- c(values, if (is.null(days_supply)) "NULL" else if (is(days_supply, "subQuery")) paste0("(", as.character(days_supply), ")") else paste0("'", as.character(days_supply), "'"))
  }

  if (!missing(sig)) {
    fields <- c(fields, "sig")
    values <- c(values, if (is.null(sig)) "NULL" else if (is(sig, "subQuery")) paste0("(", as.character(sig), ")") else paste0("'", as.character(sig), "'"))
  }

  if (!missing(route_concept_id)) {
    fields <- c(fields, "route_concept_id")
    values <- c(values, if (is.null(route_concept_id)) "NULL" else if (is(route_concept_id, "subQuery")) paste0("(", as.character(route_concept_id), ")") else paste0("'", as.character(route_concept_id), "'"))
  }

  if (!missing(lot_number)) {
    fields <- c(fields, "lot_number")
    values <- c(values, if (is.null(lot_number)) "NULL" else if (is(lot_number, "subQuery")) paste0("(", as.character(lot_number), ")") else paste0("'", as.character(lot_number), "'"))
  }

  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    fields <- c(fields, "visit_occurrence_id")
    values <- c(values, if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  if (!missing(drug_source_value)) {
    fields <- c(fields, "drug_source_value")
    values <- c(values, if (is.null(drug_source_value)) "NULL" else if (is(drug_source_value, "subQuery")) paste0("(", as.character(drug_source_value), ")") else paste0("'", as.character(drug_source_value), "'"))
  }

  if (!missing(drug_source_concept_id)) {
    fields <- c(fields, "drug_source_concept_id")
    values <- c(values, if (is.null(drug_source_concept_id)) "NULL" else if (is(drug_source_concept_id, "subQuery")) paste0("(", as.character(drug_source_concept_id), ")") else paste0("'", as.character(drug_source_concept_id), "'"))
  }

  if (!missing(route_source_value)) {
    fields <- c(fields, "route_source_value")
    values <- c(values, if (is.null(route_source_value)) "NULL" else if (is(route_source_value, "subQuery")) paste0("(", as.character(route_source_value), ")") else paste0("'", as.character(route_source_value), "'"))
  }

  if (!missing(dose_unit_source_value)) {
    fields <- c(fields, "dose_unit_source_value")
    values <- c(values, if (is.null(dose_unit_source_value)) "NULL" else if (is(dose_unit_source_value, "subQuery")) paste0("(", as.character(dose_unit_source_value), ")") else paste0("'", as.character(dose_unit_source_value), "'"))
  }

  if (!missing(visit_detail_id)) {
    fields <- c(fields, "visit_detail_id")
    values <- c(values, if (is.null(visit_detail_id)) "NULL" else if (is(visit_detail_id, "subQuery")) paste0("(", as.character(visit_detail_id), ")") else paste0("'", as.character(visit_detail_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 0, table = "drug_exposure", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_fact_relationship <- function(domain_concept_id_1, fact_id_1, domain_concept_id_2, fact_id_2, relationship_concept_id) {
  fields <- c()
  values <- c()
  if (!missing(domain_concept_id_1)) {
    fields <- c(fields, "domain_concept_id_1")
    values <- c(values, if (is.null(domain_concept_id_1)) "NULL" else if (is(domain_concept_id_1, "subQuery")) paste0("(", as.character(domain_concept_id_1), ")") else paste0("'", as.character(domain_concept_id_1), "'"))
  }

  if (!missing(fact_id_1)) {
    fields <- c(fields, "fact_id_1")
    values <- c(values, if (is.null(fact_id_1)) "NULL" else if (is(fact_id_1, "subQuery")) paste0("(", as.character(fact_id_1), ")") else paste0("'", as.character(fact_id_1), "'"))
  }

  if (!missing(domain_concept_id_2)) {
    fields <- c(fields, "domain_concept_id_2")
    values <- c(values, if (is.null(domain_concept_id_2)) "NULL" else if (is(domain_concept_id_2, "subQuery")) paste0("(", as.character(domain_concept_id_2), ")") else paste0("'", as.character(domain_concept_id_2), "'"))
  }

  if (!missing(fact_id_2)) {
    fields <- c(fields, "fact_id_2")
    values <- c(values, if (is.null(fact_id_2)) "NULL" else if (is(fact_id_2, "subQuery")) paste0("(", as.character(fact_id_2), ")") else paste0("'", as.character(fact_id_2), "'"))
  }

  if (!missing(relationship_concept_id)) {
    fields <- c(fields, "relationship_concept_id")
    values <- c(values, if (is.null(relationship_concept_id)) "NULL" else if (is(relationship_concept_id, "subQuery")) paste0("(", as.character(relationship_concept_id), ")") else paste0("'", as.character(relationship_concept_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 0, table = "fact_relationship", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_measurement <- function(measurement_id, person_id, measurement_concept_id, measurement_date, measurement_datetime, measurement_type_concept_id, operator_concept_id, value_as_number, value_as_concept_id, unit_concept_id, range_low, range_high, provider_id, visit_occurrence_id, visit_detail_id, measurement_source_value, measurement_source_concept_id, unit_source_value, value_source_value) {
  fields <- c()
  values <- c()
  if (!missing(measurement_id)) {
    fields <- c(fields, "measurement_id")
    values <- c(values, if (is.null(measurement_id)) "NULL" else if (is(measurement_id, "subQuery")) paste0("(", as.character(measurement_id), ")") else paste0("'", as.character(measurement_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(measurement_concept_id)) {
    fields <- c(fields, "measurement_concept_id")
    values <- c(values, if (is.null(measurement_concept_id)) "NULL" else if (is(measurement_concept_id, "subQuery")) paste0("(", as.character(measurement_concept_id), ")") else paste0("'", as.character(measurement_concept_id), "'"))
  }

  if (!missing(measurement_date)) {
    fields <- c(fields, "measurement_date")
    values <- c(values, if (is.null(measurement_date)) "NULL" else if (is(measurement_date, "subQuery")) paste0("(", as.character(measurement_date), ")") else paste0("'", as.character(measurement_date), "'"))
  }

  if (!missing(measurement_datetime)) {
    fields <- c(fields, "measurement_datetime")
    values <- c(values, if (is.null(measurement_datetime)) "NULL" else if (is(measurement_datetime, "subQuery")) paste0("(", as.character(measurement_datetime), ")") else paste0("'", as.character(measurement_datetime), "'"))
  }

  if (!missing(measurement_type_concept_id)) {
    fields <- c(fields, "measurement_type_concept_id")
    values <- c(values, if (is.null(measurement_type_concept_id)) "NULL" else if (is(measurement_type_concept_id, "subQuery")) paste0("(", as.character(measurement_type_concept_id), ")") else paste0("'", as.character(measurement_type_concept_id), "'"))
  }

  if (!missing(operator_concept_id)) {
    fields <- c(fields, "operator_concept_id")
    values <- c(values, if (is.null(operator_concept_id)) "NULL" else if (is(operator_concept_id, "subQuery")) paste0("(", as.character(operator_concept_id), ")") else paste0("'", as.character(operator_concept_id), "'"))
  }

  if (!missing(value_as_number)) {
    fields <- c(fields, "value_as_number")
    values <- c(values, if (is.null(value_as_number)) "NULL" else if (is(value_as_number, "subQuery")) paste0("(", as.character(value_as_number), ")") else paste0("'", as.character(value_as_number), "'"))
  }

  if (!missing(value_as_concept_id)) {
    fields <- c(fields, "value_as_concept_id")
    values <- c(values, if (is.null(value_as_concept_id)) "NULL" else if (is(value_as_concept_id, "subQuery")) paste0("(", as.character(value_as_concept_id), ")") else paste0("'", as.character(value_as_concept_id), "'"))
  }

  if (!missing(unit_concept_id)) {
    fields <- c(fields, "unit_concept_id")
    values <- c(values, if (is.null(unit_concept_id)) "NULL" else if (is(unit_concept_id, "subQuery")) paste0("(", as.character(unit_concept_id), ")") else paste0("'", as.character(unit_concept_id), "'"))
  }

  if (!missing(range_low)) {
    fields <- c(fields, "range_low")
    values <- c(values, if (is.null(range_low)) "NULL" else if (is(range_low, "subQuery")) paste0("(", as.character(range_low), ")") else paste0("'", as.character(range_low), "'"))
  }

  if (!missing(range_high)) {
    fields <- c(fields, "range_high")
    values <- c(values, if (is.null(range_high)) "NULL" else if (is(range_high, "subQuery")) paste0("(", as.character(range_high), ")") else paste0("'", as.character(range_high), "'"))
  }

  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    fields <- c(fields, "visit_occurrence_id")
    values <- c(values, if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  if (!missing(visit_detail_id)) {
    fields <- c(fields, "visit_detail_id")
    values <- c(values, if (is.null(visit_detail_id)) "NULL" else if (is(visit_detail_id, "subQuery")) paste0("(", as.character(visit_detail_id), ")") else paste0("'", as.character(visit_detail_id), "'"))
  }

  if (!missing(measurement_source_value)) {
    fields <- c(fields, "measurement_source_value")
    values <- c(values, if (is.null(measurement_source_value)) "NULL" else if (is(measurement_source_value, "subQuery")) paste0("(", as.character(measurement_source_value), ")") else paste0("'", as.character(measurement_source_value), "'"))
  }

  if (!missing(measurement_source_concept_id)) {
    fields <- c(fields, "measurement_source_concept_id")
    values <- c(values, if (is.null(measurement_source_concept_id)) "NULL" else if (is(measurement_source_concept_id, "subQuery")) paste0("(", as.character(measurement_source_concept_id), ")") else paste0("'", as.character(measurement_source_concept_id), "'"))
  }

  if (!missing(unit_source_value)) {
    fields <- c(fields, "unit_source_value")
    values <- c(values, if (is.null(unit_source_value)) "NULL" else if (is(unit_source_value, "subQuery")) paste0("(", as.character(unit_source_value), ")") else paste0("'", as.character(unit_source_value), "'"))
  }

  if (!missing(value_source_value)) {
    fields <- c(fields, "value_source_value")
    values <- c(values, if (is.null(value_source_value)) "NULL" else if (is(value_source_value, "subQuery")) paste0("(", as.character(value_source_value), ")") else paste0("'", as.character(value_source_value), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 0, table = "measurement", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_note <- function(note_id, person_id, note_date, note_datetime, note_type_concept_id, note_class_concept_id, note_title, note_text, encoding_concept_id, language_concept_id, provider_id, note_source_value, visit_occurrence_id) {
  fields <- c()
  values <- c()
  if (!missing(note_id)) {
    fields <- c(fields, "note_id")
    values <- c(values, if (is.null(note_id)) "NULL" else if (is(note_id, "subQuery")) paste0("(", as.character(note_id), ")") else paste0("'", as.character(note_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(note_date)) {
    fields <- c(fields, "note_date")
    values <- c(values, if (is.null(note_date)) "NULL" else if (is(note_date, "subQuery")) paste0("(", as.character(note_date), ")") else paste0("'", as.character(note_date), "'"))
  }

  if (!missing(note_datetime)) {
    fields <- c(fields, "note_datetime")
    values <- c(values, if (is.null(note_datetime)) "NULL" else if (is(note_datetime, "subQuery")) paste0("(", as.character(note_datetime), ")") else paste0("'", as.character(note_datetime), "'"))
  }

  if (!missing(note_type_concept_id)) {
    fields <- c(fields, "note_type_concept_id")
    values <- c(values, if (is.null(note_type_concept_id)) "NULL" else if (is(note_type_concept_id, "subQuery")) paste0("(", as.character(note_type_concept_id), ")") else paste0("'", as.character(note_type_concept_id), "'"))
  }

  if (!missing(note_class_concept_id)) {
    fields <- c(fields, "note_class_concept_id")
    values <- c(values, if (is.null(note_class_concept_id)) "NULL" else if (is(note_class_concept_id, "subQuery")) paste0("(", as.character(note_class_concept_id), ")") else paste0("'", as.character(note_class_concept_id), "'"))
  }

  if (!missing(note_title)) {
    fields <- c(fields, "note_title")
    values <- c(values, if (is.null(note_title)) "NULL" else if (is(note_title, "subQuery")) paste0("(", as.character(note_title), ")") else paste0("'", as.character(note_title), "'"))
  }

  if (!missing(note_text)) {
    fields <- c(fields, "note_text")
    values <- c(values, if (is.null(note_text)) "NULL" else if (is(note_text, "subQuery")) paste0("(", as.character(note_text), ")") else paste0("'", as.character(note_text), "'"))
  }

  if (!missing(encoding_concept_id)) {
    fields <- c(fields, "encoding_concept_id")
    values <- c(values, if (is.null(encoding_concept_id)) "NULL" else if (is(encoding_concept_id, "subQuery")) paste0("(", as.character(encoding_concept_id), ")") else paste0("'", as.character(encoding_concept_id), "'"))
  }

  if (!missing(language_concept_id)) {
    fields <- c(fields, "language_concept_id")
    values <- c(values, if (is.null(language_concept_id)) "NULL" else if (is(language_concept_id, "subQuery")) paste0("(", as.character(language_concept_id), ")") else paste0("'", as.character(language_concept_id), "'"))
  }

  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(note_source_value)) {
    fields <- c(fields, "note_source_value")
    values <- c(values, if (is.null(note_source_value)) "NULL" else if (is(note_source_value, "subQuery")) paste0("(", as.character(note_source_value), ")") else paste0("'", as.character(note_source_value), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    fields <- c(fields, "visit_occurrence_id")
    values <- c(values, if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 0, table = "note", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_note_nlp <- function(note_nlp_id, note_id, section_concept_id, snippet, offset, lexical_variant, note_nlp_concept_id, note_nlp_source_concept_id, nlp_system, nlp_date, nlp_date_time, term_exists, term_temporal, term_modifiers) {
  fields <- c()
  values <- c()
  if (!missing(note_nlp_id)) {
    fields <- c(fields, "note_nlp_id")
    values <- c(values, if (is.null(note_nlp_id)) "NULL" else if (is(note_nlp_id, "subQuery")) paste0("(", as.character(note_nlp_id), ")") else paste0("'", as.character(note_nlp_id), "'"))
  }

  if (!missing(note_id)) {
    fields <- c(fields, "note_id")
    values <- c(values, if (is.null(note_id)) "NULL" else if (is(note_id, "subQuery")) paste0("(", as.character(note_id), ")") else paste0("'", as.character(note_id), "'"))
  }

  if (!missing(section_concept_id)) {
    fields <- c(fields, "section_concept_id")
    values <- c(values, if (is.null(section_concept_id)) "NULL" else if (is(section_concept_id, "subQuery")) paste0("(", as.character(section_concept_id), ")") else paste0("'", as.character(section_concept_id), "'"))
  }

  if (!missing(snippet)) {
    fields <- c(fields, "snippet")
    values <- c(values, if (is.null(snippet)) "NULL" else if (is(snippet, "subQuery")) paste0("(", as.character(snippet), ")") else paste0("'", as.character(snippet), "'"))
  }

  if (!missing(offset)) {
    fields <- c(fields, "offset")
    values <- c(values, if (is.null(offset)) "NULL" else if (is(offset, "subQuery")) paste0("(", as.character(offset), ")") else paste0("'", as.character(offset), "'"))
  }

  if (!missing(lexical_variant)) {
    fields <- c(fields, "lexical_variant")
    values <- c(values, if (is.null(lexical_variant)) "NULL" else if (is(lexical_variant, "subQuery")) paste0("(", as.character(lexical_variant), ")") else paste0("'", as.character(lexical_variant), "'"))
  }

  if (!missing(note_nlp_concept_id)) {
    fields <- c(fields, "note_nlp_concept_id")
    values <- c(values, if (is.null(note_nlp_concept_id)) "NULL" else if (is(note_nlp_concept_id, "subQuery")) paste0("(", as.character(note_nlp_concept_id), ")") else paste0("'", as.character(note_nlp_concept_id), "'"))
  }

  if (!missing(note_nlp_source_concept_id)) {
    fields <- c(fields, "note_nlp_source_concept_id")
    values <- c(values, if (is.null(note_nlp_source_concept_id)) "NULL" else if (is(note_nlp_source_concept_id, "subQuery")) paste0("(", as.character(note_nlp_source_concept_id), ")") else paste0("'", as.character(note_nlp_source_concept_id), "'"))
  }

  if (!missing(nlp_system)) {
    fields <- c(fields, "nlp_system")
    values <- c(values, if (is.null(nlp_system)) "NULL" else if (is(nlp_system, "subQuery")) paste0("(", as.character(nlp_system), ")") else paste0("'", as.character(nlp_system), "'"))
  }

  if (!missing(nlp_date)) {
    fields <- c(fields, "nlp_date")
    values <- c(values, if (is.null(nlp_date)) "NULL" else if (is(nlp_date, "subQuery")) paste0("(", as.character(nlp_date), ")") else paste0("'", as.character(nlp_date), "'"))
  }

  if (!missing(nlp_date_time)) {
    fields <- c(fields, "nlp_date_time")
    values <- c(values, if (is.null(nlp_date_time)) "NULL" else if (is(nlp_date_time, "subQuery")) paste0("(", as.character(nlp_date_time), ")") else paste0("'", as.character(nlp_date_time), "'"))
  }

  if (!missing(term_exists)) {
    fields <- c(fields, "term_exists")
    values <- c(values, if (is.null(term_exists)) "NULL" else if (is(term_exists, "subQuery")) paste0("(", as.character(term_exists), ")") else paste0("'", as.character(term_exists), "'"))
  }

  if (!missing(term_temporal)) {
    fields <- c(fields, "term_temporal")
    values <- c(values, if (is.null(term_temporal)) "NULL" else if (is(term_temporal, "subQuery")) paste0("(", as.character(term_temporal), ")") else paste0("'", as.character(term_temporal), "'"))
  }

  if (!missing(term_modifiers)) {
    fields <- c(fields, "term_modifiers")
    values <- c(values, if (is.null(term_modifiers)) "NULL" else if (is(term_modifiers, "subQuery")) paste0("(", as.character(term_modifiers), ")") else paste0("'", as.character(term_modifiers), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 0, table = "note_nlp", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_observation <- function(observation_id, person_id, observation_concept_id, observation_date, observation_datetime, observation_type_concept_id, value_as_number, value_as_string, value_as_concept_id, qualifier_concept_id, unit_concept_id, provider_id, visit_occurrence_id, visit_detail_id, observation_source_value, observation_source_concept_id, unit_source_value, qualifier_source_value) {
  fields <- c()
  values <- c()
  if (!missing(observation_id)) {
    fields <- c(fields, "observation_id")
    values <- c(values, if (is.null(observation_id)) "NULL" else if (is(observation_id, "subQuery")) paste0("(", as.character(observation_id), ")") else paste0("'", as.character(observation_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(observation_concept_id)) {
    fields <- c(fields, "observation_concept_id")
    values <- c(values, if (is.null(observation_concept_id)) "NULL" else if (is(observation_concept_id, "subQuery")) paste0("(", as.character(observation_concept_id), ")") else paste0("'", as.character(observation_concept_id), "'"))
  }

  if (!missing(observation_date)) {
    fields <- c(fields, "observation_date")
    values <- c(values, if (is.null(observation_date)) "NULL" else if (is(observation_date, "subQuery")) paste0("(", as.character(observation_date), ")") else paste0("'", as.character(observation_date), "'"))
  }

  if (!missing(observation_datetime)) {
    fields <- c(fields, "observation_datetime")
    values <- c(values, if (is.null(observation_datetime)) "NULL" else if (is(observation_datetime, "subQuery")) paste0("(", as.character(observation_datetime), ")") else paste0("'", as.character(observation_datetime), "'"))
  }

  if (!missing(observation_type_concept_id)) {
    fields <- c(fields, "observation_type_concept_id")
    values <- c(values, if (is.null(observation_type_concept_id)) "NULL" else if (is(observation_type_concept_id, "subQuery")) paste0("(", as.character(observation_type_concept_id), ")") else paste0("'", as.character(observation_type_concept_id), "'"))
  }

  if (!missing(value_as_number)) {
    fields <- c(fields, "value_as_number")
    values <- c(values, if (is.null(value_as_number)) "NULL" else if (is(value_as_number, "subQuery")) paste0("(", as.character(value_as_number), ")") else paste0("'", as.character(value_as_number), "'"))
  }

  if (!missing(value_as_string)) {
    fields <- c(fields, "value_as_string")
    values <- c(values, if (is.null(value_as_string)) "NULL" else if (is(value_as_string, "subQuery")) paste0("(", as.character(value_as_string), ")") else paste0("'", as.character(value_as_string), "'"))
  }

  if (!missing(value_as_concept_id)) {
    fields <- c(fields, "value_as_concept_id")
    values <- c(values, if (is.null(value_as_concept_id)) "NULL" else if (is(value_as_concept_id, "subQuery")) paste0("(", as.character(value_as_concept_id), ")") else paste0("'", as.character(value_as_concept_id), "'"))
  }

  if (!missing(qualifier_concept_id)) {
    fields <- c(fields, "qualifier_concept_id")
    values <- c(values, if (is.null(qualifier_concept_id)) "NULL" else if (is(qualifier_concept_id, "subQuery")) paste0("(", as.character(qualifier_concept_id), ")") else paste0("'", as.character(qualifier_concept_id), "'"))
  }

  if (!missing(unit_concept_id)) {
    fields <- c(fields, "unit_concept_id")
    values <- c(values, if (is.null(unit_concept_id)) "NULL" else if (is(unit_concept_id, "subQuery")) paste0("(", as.character(unit_concept_id), ")") else paste0("'", as.character(unit_concept_id), "'"))
  }

  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    fields <- c(fields, "visit_occurrence_id")
    values <- c(values, if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  if (!missing(visit_detail_id)) {
    fields <- c(fields, "visit_detail_id")
    values <- c(values, if (is.null(visit_detail_id)) "NULL" else if (is(visit_detail_id, "subQuery")) paste0("(", as.character(visit_detail_id), ")") else paste0("'", as.character(visit_detail_id), "'"))
  }

  if (!missing(observation_source_value)) {
    fields <- c(fields, "observation_source_value")
    values <- c(values, if (is.null(observation_source_value)) "NULL" else if (is(observation_source_value, "subQuery")) paste0("(", as.character(observation_source_value), ")") else paste0("'", as.character(observation_source_value), "'"))
  }

  if (!missing(observation_source_concept_id)) {
    fields <- c(fields, "observation_source_concept_id")
    values <- c(values, if (is.null(observation_source_concept_id)) "NULL" else if (is(observation_source_concept_id, "subQuery")) paste0("(", as.character(observation_source_concept_id), ")") else paste0("'", as.character(observation_source_concept_id), "'"))
  }

  if (!missing(unit_source_value)) {
    fields <- c(fields, "unit_source_value")
    values <- c(values, if (is.null(unit_source_value)) "NULL" else if (is(unit_source_value, "subQuery")) paste0("(", as.character(unit_source_value), ")") else paste0("'", as.character(unit_source_value), "'"))
  }

  if (!missing(qualifier_source_value)) {
    fields <- c(fields, "qualifier_source_value")
    values <- c(values, if (is.null(qualifier_source_value)) "NULL" else if (is(qualifier_source_value, "subQuery")) paste0("(", as.character(qualifier_source_value), ")") else paste0("'", as.character(qualifier_source_value), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 0, table = "observation", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_observation_period <- function(observation_period_id, person_id, observation_period_start_date, observation_period_end_date, period_type_concept_id) {
  fields <- c()
  values <- c()
  if (!missing(observation_period_id)) {
    fields <- c(fields, "observation_period_id")
    values <- c(values, if (is.null(observation_period_id)) "NULL" else if (is(observation_period_id, "subQuery")) paste0("(", as.character(observation_period_id), ")") else paste0("'", as.character(observation_period_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(observation_period_start_date)) {
    fields <- c(fields, "observation_period_start_date")
    values <- c(values, if (is.null(observation_period_start_date)) "NULL" else if (is(observation_period_start_date, "subQuery")) paste0("(", as.character(observation_period_start_date), ")") else paste0("'", as.character(observation_period_start_date), "'"))
  }

  if (!missing(observation_period_end_date)) {
    fields <- c(fields, "observation_period_end_date")
    values <- c(values, if (is.null(observation_period_end_date)) "NULL" else if (is(observation_period_end_date, "subQuery")) paste0("(", as.character(observation_period_end_date), ")") else paste0("'", as.character(observation_period_end_date), "'"))
  }

  if (!missing(period_type_concept_id)) {
    fields <- c(fields, "period_type_concept_id")
    values <- c(values, if (is.null(period_type_concept_id)) "NULL" else if (is(period_type_concept_id, "subQuery")) paste0("(", as.character(period_type_concept_id), ")") else paste0("'", as.character(period_type_concept_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 0, table = "observation_period", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_person <- function(person_id, gender_concept_id, year_of_birth, month_of_birth, day_of_birth, birth_datetime, race_concept_id, ethnicity_concept_id, location_id, provider_id, care_site_id, person_source_value, gender_source_value, gender_source_concept_id, race_source_value, race_source_concept_id, ethnicity_source_value, ethnicity_source_concept_id) {
  fields <- c()
  values <- c()
  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(gender_concept_id)) {
    fields <- c(fields, "gender_concept_id")
    values <- c(values, if (is.null(gender_concept_id)) "NULL" else if (is(gender_concept_id, "subQuery")) paste0("(", as.character(gender_concept_id), ")") else paste0("'", as.character(gender_concept_id), "'"))
  }

  if (!missing(year_of_birth)) {
    fields <- c(fields, "year_of_birth")
    values <- c(values, if (is.null(year_of_birth)) "NULL" else if (is(year_of_birth, "subQuery")) paste0("(", as.character(year_of_birth), ")") else paste0("'", as.character(year_of_birth), "'"))
  }

  if (!missing(month_of_birth)) {
    fields <- c(fields, "month_of_birth")
    values <- c(values, if (is.null(month_of_birth)) "NULL" else if (is(month_of_birth, "subQuery")) paste0("(", as.character(month_of_birth), ")") else paste0("'", as.character(month_of_birth), "'"))
  }

  if (!missing(day_of_birth)) {
    fields <- c(fields, "day_of_birth")
    values <- c(values, if (is.null(day_of_birth)) "NULL" else if (is(day_of_birth, "subQuery")) paste0("(", as.character(day_of_birth), ")") else paste0("'", as.character(day_of_birth), "'"))
  }

  if (!missing(birth_datetime)) {
    fields <- c(fields, "birth_datetime")
    values <- c(values, if (is.null(birth_datetime)) "NULL" else if (is(birth_datetime, "subQuery")) paste0("(", as.character(birth_datetime), ")") else paste0("'", as.character(birth_datetime), "'"))
  }

  if (!missing(race_concept_id)) {
    fields <- c(fields, "race_concept_id")
    values <- c(values, if (is.null(race_concept_id)) "NULL" else if (is(race_concept_id, "subQuery")) paste0("(", as.character(race_concept_id), ")") else paste0("'", as.character(race_concept_id), "'"))
  }

  if (!missing(ethnicity_concept_id)) {
    fields <- c(fields, "ethnicity_concept_id")
    values <- c(values, if (is.null(ethnicity_concept_id)) "NULL" else if (is(ethnicity_concept_id, "subQuery")) paste0("(", as.character(ethnicity_concept_id), ")") else paste0("'", as.character(ethnicity_concept_id), "'"))
  }

  if (!missing(location_id)) {
    fields <- c(fields, "location_id")
    values <- c(values, if (is.null(location_id)) "NULL" else if (is(location_id, "subQuery")) paste0("(", as.character(location_id), ")") else paste0("'", as.character(location_id), "'"))
  }

  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(care_site_id)) {
    fields <- c(fields, "care_site_id")
    values <- c(values, if (is.null(care_site_id)) "NULL" else if (is(care_site_id, "subQuery")) paste0("(", as.character(care_site_id), ")") else paste0("'", as.character(care_site_id), "'"))
  }

  if (!missing(person_source_value)) {
    fields <- c(fields, "person_source_value")
    values <- c(values, if (is.null(person_source_value)) "NULL" else if (is(person_source_value, "subQuery")) paste0("(", as.character(person_source_value), ")") else paste0("'", as.character(person_source_value), "'"))
  }

  if (!missing(gender_source_value)) {
    fields <- c(fields, "gender_source_value")
    values <- c(values, if (is.null(gender_source_value)) "NULL" else if (is(gender_source_value, "subQuery")) paste0("(", as.character(gender_source_value), ")") else paste0("'", as.character(gender_source_value), "'"))
  }

  if (!missing(gender_source_concept_id)) {
    fields <- c(fields, "gender_source_concept_id")
    values <- c(values, if (is.null(gender_source_concept_id)) "NULL" else if (is(gender_source_concept_id, "subQuery")) paste0("(", as.character(gender_source_concept_id), ")") else paste0("'", as.character(gender_source_concept_id), "'"))
  }

  if (!missing(race_source_value)) {
    fields <- c(fields, "race_source_value")
    values <- c(values, if (is.null(race_source_value)) "NULL" else if (is(race_source_value, "subQuery")) paste0("(", as.character(race_source_value), ")") else paste0("'", as.character(race_source_value), "'"))
  }

  if (!missing(race_source_concept_id)) {
    fields <- c(fields, "race_source_concept_id")
    values <- c(values, if (is.null(race_source_concept_id)) "NULL" else if (is(race_source_concept_id, "subQuery")) paste0("(", as.character(race_source_concept_id), ")") else paste0("'", as.character(race_source_concept_id), "'"))
  }

  if (!missing(ethnicity_source_value)) {
    fields <- c(fields, "ethnicity_source_value")
    values <- c(values, if (is.null(ethnicity_source_value)) "NULL" else if (is(ethnicity_source_value, "subQuery")) paste0("(", as.character(ethnicity_source_value), ")") else paste0("'", as.character(ethnicity_source_value), "'"))
  }

  if (!missing(ethnicity_source_concept_id)) {
    fields <- c(fields, "ethnicity_source_concept_id")
    values <- c(values, if (is.null(ethnicity_source_concept_id)) "NULL" else if (is(ethnicity_source_concept_id, "subQuery")) paste0("(", as.character(ethnicity_source_concept_id), ")") else paste0("'", as.character(ethnicity_source_concept_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 0, table = "person", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_procedure_occurrence <- function(procedure_occurrence_id, person_id, procedure_concept_id, procedure_date, procedure_datetime, procedure_type_concept_id, modifier_concept_id, quantity, provider_id, visit_occurrence_id, procedure_source_value, procedure_source_concept_id, qualifier_source_value, visit_detail_id) {
  fields <- c()
  values <- c()
  if (!missing(procedure_occurrence_id)) {
    fields <- c(fields, "procedure_occurrence_id")
    values <- c(values, if (is.null(procedure_occurrence_id)) "NULL" else if (is(procedure_occurrence_id, "subQuery")) paste0("(", as.character(procedure_occurrence_id), ")") else paste0("'", as.character(procedure_occurrence_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(procedure_concept_id)) {
    fields <- c(fields, "procedure_concept_id")
    values <- c(values, if (is.null(procedure_concept_id)) "NULL" else if (is(procedure_concept_id, "subQuery")) paste0("(", as.character(procedure_concept_id), ")") else paste0("'", as.character(procedure_concept_id), "'"))
  }

  if (!missing(procedure_date)) {
    fields <- c(fields, "procedure_date")
    values <- c(values, if (is.null(procedure_date)) "NULL" else if (is(procedure_date, "subQuery")) paste0("(", as.character(procedure_date), ")") else paste0("'", as.character(procedure_date), "'"))
  }

  if (!missing(procedure_datetime)) {
    fields <- c(fields, "procedure_datetime")
    values <- c(values, if (is.null(procedure_datetime)) "NULL" else if (is(procedure_datetime, "subQuery")) paste0("(", as.character(procedure_datetime), ")") else paste0("'", as.character(procedure_datetime), "'"))
  }

  if (!missing(procedure_type_concept_id)) {
    fields <- c(fields, "procedure_type_concept_id")
    values <- c(values, if (is.null(procedure_type_concept_id)) "NULL" else if (is(procedure_type_concept_id, "subQuery")) paste0("(", as.character(procedure_type_concept_id), ")") else paste0("'", as.character(procedure_type_concept_id), "'"))
  }

  if (!missing(modifier_concept_id)) {
    fields <- c(fields, "modifier_concept_id")
    values <- c(values, if (is.null(modifier_concept_id)) "NULL" else if (is(modifier_concept_id, "subQuery")) paste0("(", as.character(modifier_concept_id), ")") else paste0("'", as.character(modifier_concept_id), "'"))
  }

  if (!missing(quantity)) {
    fields <- c(fields, "quantity")
    values <- c(values, if (is.null(quantity)) "NULL" else if (is(quantity, "subQuery")) paste0("(", as.character(quantity), ")") else paste0("'", as.character(quantity), "'"))
  }

  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    fields <- c(fields, "visit_occurrence_id")
    values <- c(values, if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  if (!missing(procedure_source_value)) {
    fields <- c(fields, "procedure_source_value")
    values <- c(values, if (is.null(procedure_source_value)) "NULL" else if (is(procedure_source_value, "subQuery")) paste0("(", as.character(procedure_source_value), ")") else paste0("'", as.character(procedure_source_value), "'"))
  }

  if (!missing(procedure_source_concept_id)) {
    fields <- c(fields, "procedure_source_concept_id")
    values <- c(values, if (is.null(procedure_source_concept_id)) "NULL" else if (is(procedure_source_concept_id, "subQuery")) paste0("(", as.character(procedure_source_concept_id), ")") else paste0("'", as.character(procedure_source_concept_id), "'"))
  }

  if (!missing(qualifier_source_value)) {
    fields <- c(fields, "qualifier_source_value")
    values <- c(values, if (is.null(qualifier_source_value)) "NULL" else if (is(qualifier_source_value, "subQuery")) paste0("(", as.character(qualifier_source_value), ")") else paste0("'", as.character(qualifier_source_value), "'"))
  }

  if (!missing(visit_detail_id)) {
    fields <- c(fields, "visit_detail_id")
    values <- c(values, if (is.null(visit_detail_id)) "NULL" else if (is(visit_detail_id, "subQuery")) paste0("(", as.character(visit_detail_id), ")") else paste0("'", as.character(visit_detail_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 0, table = "procedure_occurrence", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_specimen <- function(specimen_id, person_id, specimen_concept_id, specimen_type_concept_id, specimen_date, specimen_datetime, quantity, unit_concept_id, anatomic_site_concept_id, disease_status_concept_id, specimen_source_id, specimen_source_value, unit_source_value, anatomic_site_source_value, disease_status_source_value) {
  fields <- c()
  values <- c()
  if (!missing(specimen_id)) {
    fields <- c(fields, "specimen_id")
    values <- c(values, if (is.null(specimen_id)) "NULL" else if (is(specimen_id, "subQuery")) paste0("(", as.character(specimen_id), ")") else paste0("'", as.character(specimen_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(specimen_concept_id)) {
    fields <- c(fields, "specimen_concept_id")
    values <- c(values, if (is.null(specimen_concept_id)) "NULL" else if (is(specimen_concept_id, "subQuery")) paste0("(", as.character(specimen_concept_id), ")") else paste0("'", as.character(specimen_concept_id), "'"))
  }

  if (!missing(specimen_type_concept_id)) {
    fields <- c(fields, "specimen_type_concept_id")
    values <- c(values, if (is.null(specimen_type_concept_id)) "NULL" else if (is(specimen_type_concept_id, "subQuery")) paste0("(", as.character(specimen_type_concept_id), ")") else paste0("'", as.character(specimen_type_concept_id), "'"))
  }

  if (!missing(specimen_date)) {
    fields <- c(fields, "specimen_date")
    values <- c(values, if (is.null(specimen_date)) "NULL" else if (is(specimen_date, "subQuery")) paste0("(", as.character(specimen_date), ")") else paste0("'", as.character(specimen_date), "'"))
  }

  if (!missing(specimen_datetime)) {
    fields <- c(fields, "specimen_datetime")
    values <- c(values, if (is.null(specimen_datetime)) "NULL" else if (is(specimen_datetime, "subQuery")) paste0("(", as.character(specimen_datetime), ")") else paste0("'", as.character(specimen_datetime), "'"))
  }

  if (!missing(quantity)) {
    fields <- c(fields, "quantity")
    values <- c(values, if (is.null(quantity)) "NULL" else if (is(quantity, "subQuery")) paste0("(", as.character(quantity), ")") else paste0("'", as.character(quantity), "'"))
  }

  if (!missing(unit_concept_id)) {
    fields <- c(fields, "unit_concept_id")
    values <- c(values, if (is.null(unit_concept_id)) "NULL" else if (is(unit_concept_id, "subQuery")) paste0("(", as.character(unit_concept_id), ")") else paste0("'", as.character(unit_concept_id), "'"))
  }

  if (!missing(anatomic_site_concept_id)) {
    fields <- c(fields, "anatomic_site_concept_id")
    values <- c(values, if (is.null(anatomic_site_concept_id)) "NULL" else if (is(anatomic_site_concept_id, "subQuery")) paste0("(", as.character(anatomic_site_concept_id), ")") else paste0("'", as.character(anatomic_site_concept_id), "'"))
  }

  if (!missing(disease_status_concept_id)) {
    fields <- c(fields, "disease_status_concept_id")
    values <- c(values, if (is.null(disease_status_concept_id)) "NULL" else if (is(disease_status_concept_id, "subQuery")) paste0("(", as.character(disease_status_concept_id), ")") else paste0("'", as.character(disease_status_concept_id), "'"))
  }

  if (!missing(specimen_source_id)) {
    fields <- c(fields, "specimen_source_id")
    values <- c(values, if (is.null(specimen_source_id)) "NULL" else if (is(specimen_source_id, "subQuery")) paste0("(", as.character(specimen_source_id), ")") else paste0("'", as.character(specimen_source_id), "'"))
  }

  if (!missing(specimen_source_value)) {
    fields <- c(fields, "specimen_source_value")
    values <- c(values, if (is.null(specimen_source_value)) "NULL" else if (is(specimen_source_value, "subQuery")) paste0("(", as.character(specimen_source_value), ")") else paste0("'", as.character(specimen_source_value), "'"))
  }

  if (!missing(unit_source_value)) {
    fields <- c(fields, "unit_source_value")
    values <- c(values, if (is.null(unit_source_value)) "NULL" else if (is(unit_source_value, "subQuery")) paste0("(", as.character(unit_source_value), ")") else paste0("'", as.character(unit_source_value), "'"))
  }

  if (!missing(anatomic_site_source_value)) {
    fields <- c(fields, "anatomic_site_source_value")
    values <- c(values, if (is.null(anatomic_site_source_value)) "NULL" else if (is(anatomic_site_source_value, "subQuery")) paste0("(", as.character(anatomic_site_source_value), ")") else paste0("'", as.character(anatomic_site_source_value), "'"))
  }

  if (!missing(disease_status_source_value)) {
    fields <- c(fields, "disease_status_source_value")
    values <- c(values, if (is.null(disease_status_source_value)) "NULL" else if (is(disease_status_source_value, "subQuery")) paste0("(", as.character(disease_status_source_value), ")") else paste0("'", as.character(disease_status_source_value), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 0, table = "specimen", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_visit_detail <- function(visit_detail_id, person_id, visit_concept_id, visit_start_date, visit_start_datetime, visit_end_date, visit_end_datetime, visit_type_concept_id, provider_id, care_site_id, visit_source_value, visit_source_concept_id, admitting_source_value, admitting_source_concept_id, discharge_to_source_value, discharge_to_concept_id, preceding_visit_detail_id, visit_detail_parent_id, visit_occurrence_id) {
  fields <- c()
  values <- c()
  if (!missing(visit_detail_id)) {
    fields <- c(fields, "visit_detail_id")
    values <- c(values, if (is.null(visit_detail_id)) "NULL" else if (is(visit_detail_id, "subQuery")) paste0("(", as.character(visit_detail_id), ")") else paste0("'", as.character(visit_detail_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(visit_concept_id)) {
    fields <- c(fields, "visit_concept_id")
    values <- c(values, if (is.null(visit_concept_id)) "NULL" else if (is(visit_concept_id, "subQuery")) paste0("(", as.character(visit_concept_id), ")") else paste0("'", as.character(visit_concept_id), "'"))
  }

  if (!missing(visit_start_date)) {
    fields <- c(fields, "visit_start_date")
    values <- c(values, if (is.null(visit_start_date)) "NULL" else if (is(visit_start_date, "subQuery")) paste0("(", as.character(visit_start_date), ")") else paste0("'", as.character(visit_start_date), "'"))
  }

  if (!missing(visit_start_datetime)) {
    fields <- c(fields, "visit_start_datetime")
    values <- c(values, if (is.null(visit_start_datetime)) "NULL" else if (is(visit_start_datetime, "subQuery")) paste0("(", as.character(visit_start_datetime), ")") else paste0("'", as.character(visit_start_datetime), "'"))
  }

  if (!missing(visit_end_date)) {
    fields <- c(fields, "visit_end_date")
    values <- c(values, if (is.null(visit_end_date)) "NULL" else if (is(visit_end_date, "subQuery")) paste0("(", as.character(visit_end_date), ")") else paste0("'", as.character(visit_end_date), "'"))
  }

  if (!missing(visit_end_datetime)) {
    fields <- c(fields, "visit_end_datetime")
    values <- c(values, if (is.null(visit_end_datetime)) "NULL" else if (is(visit_end_datetime, "subQuery")) paste0("(", as.character(visit_end_datetime), ")") else paste0("'", as.character(visit_end_datetime), "'"))
  }

  if (!missing(visit_type_concept_id)) {
    fields <- c(fields, "visit_type_concept_id")
    values <- c(values, if (is.null(visit_type_concept_id)) "NULL" else if (is(visit_type_concept_id, "subQuery")) paste0("(", as.character(visit_type_concept_id), ")") else paste0("'", as.character(visit_type_concept_id), "'"))
  }

  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(care_site_id)) {
    fields <- c(fields, "care_site_id")
    values <- c(values, if (is.null(care_site_id)) "NULL" else if (is(care_site_id, "subQuery")) paste0("(", as.character(care_site_id), ")") else paste0("'", as.character(care_site_id), "'"))
  }

  if (!missing(visit_source_value)) {
    fields <- c(fields, "visit_source_value")
    values <- c(values, if (is.null(visit_source_value)) "NULL" else if (is(visit_source_value, "subQuery")) paste0("(", as.character(visit_source_value), ")") else paste0("'", as.character(visit_source_value), "'"))
  }

  if (!missing(visit_source_concept_id)) {
    fields <- c(fields, "visit_source_concept_id")
    values <- c(values, if (is.null(visit_source_concept_id)) "NULL" else if (is(visit_source_concept_id, "subQuery")) paste0("(", as.character(visit_source_concept_id), ")") else paste0("'", as.character(visit_source_concept_id), "'"))
  }

  if (!missing(admitting_source_value)) {
    fields <- c(fields, "admitting_source_value")
    values <- c(values, if (is.null(admitting_source_value)) "NULL" else if (is(admitting_source_value, "subQuery")) paste0("(", as.character(admitting_source_value), ")") else paste0("'", as.character(admitting_source_value), "'"))
  }

  if (!missing(admitting_source_concept_id)) {
    fields <- c(fields, "admitting_source_concept_id")
    values <- c(values, if (is.null(admitting_source_concept_id)) "NULL" else if (is(admitting_source_concept_id, "subQuery")) paste0("(", as.character(admitting_source_concept_id), ")") else paste0("'", as.character(admitting_source_concept_id), "'"))
  }

  if (!missing(discharge_to_source_value)) {
    fields <- c(fields, "discharge_to_source_value")
    values <- c(values, if (is.null(discharge_to_source_value)) "NULL" else if (is(discharge_to_source_value, "subQuery")) paste0("(", as.character(discharge_to_source_value), ")") else paste0("'", as.character(discharge_to_source_value), "'"))
  }

  if (!missing(discharge_to_concept_id)) {
    fields <- c(fields, "discharge_to_concept_id")
    values <- c(values, if (is.null(discharge_to_concept_id)) "NULL" else if (is(discharge_to_concept_id, "subQuery")) paste0("(", as.character(discharge_to_concept_id), ")") else paste0("'", as.character(discharge_to_concept_id), "'"))
  }

  if (!missing(preceding_visit_detail_id)) {
    fields <- c(fields, "preceding_visit_detail_id")
    values <- c(values, if (is.null(preceding_visit_detail_id)) "NULL" else if (is(preceding_visit_detail_id, "subQuery")) paste0("(", as.character(preceding_visit_detail_id), ")") else paste0("'", as.character(preceding_visit_detail_id), "'"))
  }

  if (!missing(visit_detail_parent_id)) {
    fields <- c(fields, "visit_detail_parent_id")
    values <- c(values, if (is.null(visit_detail_parent_id)) "NULL" else if (is(visit_detail_parent_id, "subQuery")) paste0("(", as.character(visit_detail_parent_id), ")") else paste0("'", as.character(visit_detail_parent_id), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    fields <- c(fields, "visit_occurrence_id")
    values <- c(values, if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 0, table = "visit_detail", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_visit_occurrence <- function(visit_occurrence_id, person_id, visit_concept_id, visit_start_date, visit_start_datetime, visit_end_date, visit_end_datetime, visit_type_concept_id, provider_id, care_site_id, visit_source_value, visit_source_concept_id, admitting_source_concept_id, admitting_source_value, discharge_to_concept_id, discharge_to_source_value, preceding_visit_occurrence_id) {
  fields <- c()
  values <- c()
  if (!missing(visit_occurrence_id)) {
    fields <- c(fields, "visit_occurrence_id")
    values <- c(values, if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(visit_concept_id)) {
    fields <- c(fields, "visit_concept_id")
    values <- c(values, if (is.null(visit_concept_id)) "NULL" else if (is(visit_concept_id, "subQuery")) paste0("(", as.character(visit_concept_id), ")") else paste0("'", as.character(visit_concept_id), "'"))
  }

  if (!missing(visit_start_date)) {
    fields <- c(fields, "visit_start_date")
    values <- c(values, if (is.null(visit_start_date)) "NULL" else if (is(visit_start_date, "subQuery")) paste0("(", as.character(visit_start_date), ")") else paste0("'", as.character(visit_start_date), "'"))
  }

  if (!missing(visit_start_datetime)) {
    fields <- c(fields, "visit_start_datetime")
    values <- c(values, if (is.null(visit_start_datetime)) "NULL" else if (is(visit_start_datetime, "subQuery")) paste0("(", as.character(visit_start_datetime), ")") else paste0("'", as.character(visit_start_datetime), "'"))
  }

  if (!missing(visit_end_date)) {
    fields <- c(fields, "visit_end_date")
    values <- c(values, if (is.null(visit_end_date)) "NULL" else if (is(visit_end_date, "subQuery")) paste0("(", as.character(visit_end_date), ")") else paste0("'", as.character(visit_end_date), "'"))
  }

  if (!missing(visit_end_datetime)) {
    fields <- c(fields, "visit_end_datetime")
    values <- c(values, if (is.null(visit_end_datetime)) "NULL" else if (is(visit_end_datetime, "subQuery")) paste0("(", as.character(visit_end_datetime), ")") else paste0("'", as.character(visit_end_datetime), "'"))
  }

  if (!missing(visit_type_concept_id)) {
    fields <- c(fields, "visit_type_concept_id")
    values <- c(values, if (is.null(visit_type_concept_id)) "NULL" else if (is(visit_type_concept_id, "subQuery")) paste0("(", as.character(visit_type_concept_id), ")") else paste0("'", as.character(visit_type_concept_id), "'"))
  }

  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(care_site_id)) {
    fields <- c(fields, "care_site_id")
    values <- c(values, if (is.null(care_site_id)) "NULL" else if (is(care_site_id, "subQuery")) paste0("(", as.character(care_site_id), ")") else paste0("'", as.character(care_site_id), "'"))
  }

  if (!missing(visit_source_value)) {
    fields <- c(fields, "visit_source_value")
    values <- c(values, if (is.null(visit_source_value)) "NULL" else if (is(visit_source_value, "subQuery")) paste0("(", as.character(visit_source_value), ")") else paste0("'", as.character(visit_source_value), "'"))
  }

  if (!missing(visit_source_concept_id)) {
    fields <- c(fields, "visit_source_concept_id")
    values <- c(values, if (is.null(visit_source_concept_id)) "NULL" else if (is(visit_source_concept_id, "subQuery")) paste0("(", as.character(visit_source_concept_id), ")") else paste0("'", as.character(visit_source_concept_id), "'"))
  }

  if (!missing(admitting_source_concept_id)) {
    fields <- c(fields, "admitting_source_concept_id")
    values <- c(values, if (is.null(admitting_source_concept_id)) "NULL" else if (is(admitting_source_concept_id, "subQuery")) paste0("(", as.character(admitting_source_concept_id), ")") else paste0("'", as.character(admitting_source_concept_id), "'"))
  }

  if (!missing(admitting_source_value)) {
    fields <- c(fields, "admitting_source_value")
    values <- c(values, if (is.null(admitting_source_value)) "NULL" else if (is(admitting_source_value, "subQuery")) paste0("(", as.character(admitting_source_value), ")") else paste0("'", as.character(admitting_source_value), "'"))
  }

  if (!missing(discharge_to_concept_id)) {
    fields <- c(fields, "discharge_to_concept_id")
    values <- c(values, if (is.null(discharge_to_concept_id)) "NULL" else if (is(discharge_to_concept_id, "subQuery")) paste0("(", as.character(discharge_to_concept_id), ")") else paste0("'", as.character(discharge_to_concept_id), "'"))
  }

  if (!missing(discharge_to_source_value)) {
    fields <- c(fields, "discharge_to_source_value")
    values <- c(values, if (is.null(discharge_to_source_value)) "NULL" else if (is(discharge_to_source_value, "subQuery")) paste0("(", as.character(discharge_to_source_value), ")") else paste0("'", as.character(discharge_to_source_value), "'"))
  }

  if (!missing(preceding_visit_occurrence_id)) {
    fields <- c(fields, "preceding_visit_occurrence_id")
    values <- c(values, if (is.null(preceding_visit_occurrence_id)) "NULL" else if (is(preceding_visit_occurrence_id, "subQuery")) paste0("(", as.character(preceding_visit_occurrence_id), ")") else paste0("'", as.character(preceding_visit_occurrence_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 0, table = "visit_occurrence", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_cohort <- function(cohort_definition_id, subject_id, cohort_start_date, cohort_end_date) {
  fields <- c()
  values <- c()
  if (!missing(cohort_definition_id)) {
    fields <- c(fields, "cohort_definition_id")
    values <- c(values, if (is.null(cohort_definition_id)) "NULL" else if (is(cohort_definition_id, "subQuery")) paste0("(", as.character(cohort_definition_id), ")") else paste0("'", as.character(cohort_definition_id), "'"))
  }

  if (!missing(subject_id)) {
    fields <- c(fields, "subject_id")
    values <- c(values, if (is.null(subject_id)) "NULL" else if (is(subject_id, "subQuery")) paste0("(", as.character(subject_id), ")") else paste0("'", as.character(subject_id), "'"))
  }

  if (!missing(cohort_start_date)) {
    fields <- c(fields, "cohort_start_date")
    values <- c(values, if (is.null(cohort_start_date)) "NULL" else if (is(cohort_start_date, "subQuery")) paste0("(", as.character(cohort_start_date), ")") else paste0("'", as.character(cohort_start_date), "'"))
  }

  if (!missing(cohort_end_date)) {
    fields <- c(fields, "cohort_end_date")
    values <- c(values, if (is.null(cohort_end_date)) "NULL" else if (is(cohort_end_date, "subQuery")) paste0("(", as.character(cohort_end_date), ")") else paste0("'", as.character(cohort_end_date), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 0, table = "cohort", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_cohort_attribute <- function(cohort_definition_id, subject_id, cohort_start_date, cohort_end_date, attribute_definition_id, value_as_number, value_as_concept_id) {
  fields <- c()
  values <- c()
  if (!missing(cohort_definition_id)) {
    fields <- c(fields, "cohort_definition_id")
    values <- c(values, if (is.null(cohort_definition_id)) "NULL" else if (is(cohort_definition_id, "subQuery")) paste0("(", as.character(cohort_definition_id), ")") else paste0("'", as.character(cohort_definition_id), "'"))
  }

  if (!missing(subject_id)) {
    fields <- c(fields, "subject_id")
    values <- c(values, if (is.null(subject_id)) "NULL" else if (is(subject_id, "subQuery")) paste0("(", as.character(subject_id), ")") else paste0("'", as.character(subject_id), "'"))
  }

  if (!missing(cohort_start_date)) {
    fields <- c(fields, "cohort_start_date")
    values <- c(values, if (is.null(cohort_start_date)) "NULL" else if (is(cohort_start_date, "subQuery")) paste0("(", as.character(cohort_start_date), ")") else paste0("'", as.character(cohort_start_date), "'"))
  }

  if (!missing(cohort_end_date)) {
    fields <- c(fields, "cohort_end_date")
    values <- c(values, if (is.null(cohort_end_date)) "NULL" else if (is(cohort_end_date, "subQuery")) paste0("(", as.character(cohort_end_date), ")") else paste0("'", as.character(cohort_end_date), "'"))
  }

  if (!missing(attribute_definition_id)) {
    fields <- c(fields, "attribute_definition_id")
    values <- c(values, if (is.null(attribute_definition_id)) "NULL" else if (is(attribute_definition_id, "subQuery")) paste0("(", as.character(attribute_definition_id), ")") else paste0("'", as.character(attribute_definition_id), "'"))
  }

  if (!missing(value_as_number)) {
    fields <- c(fields, "value_as_number")
    values <- c(values, if (is.null(value_as_number)) "NULL" else if (is(value_as_number, "subQuery")) paste0("(", as.character(value_as_number), ")") else paste0("'", as.character(value_as_number), "'"))
  }

  if (!missing(value_as_concept_id)) {
    fields <- c(fields, "value_as_concept_id")
    values <- c(values, if (is.null(value_as_concept_id)) "NULL" else if (is(value_as_concept_id, "subQuery")) paste0("(", as.character(value_as_concept_id), ")") else paste0("'", as.character(value_as_concept_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 0, table = "cohort_attribute", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_condition_era <- function(condition_era_id, person_id, condition_concept_id, condition_era_start_date, condition_era_end_date, condition_occurrence_count) {
  fields <- c()
  values <- c()
  if (!missing(condition_era_id)) {
    fields <- c(fields, "condition_era_id")
    values <- c(values, if (is.null(condition_era_id)) "NULL" else if (is(condition_era_id, "subQuery")) paste0("(", as.character(condition_era_id), ")") else paste0("'", as.character(condition_era_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(condition_concept_id)) {
    fields <- c(fields, "condition_concept_id")
    values <- c(values, if (is.null(condition_concept_id)) "NULL" else if (is(condition_concept_id, "subQuery")) paste0("(", as.character(condition_concept_id), ")") else paste0("'", as.character(condition_concept_id), "'"))
  }

  if (!missing(condition_era_start_date)) {
    fields <- c(fields, "condition_era_start_date")
    values <- c(values, if (is.null(condition_era_start_date)) "NULL" else if (is(condition_era_start_date, "subQuery")) paste0("(", as.character(condition_era_start_date), ")") else paste0("'", as.character(condition_era_start_date), "'"))
  }

  if (!missing(condition_era_end_date)) {
    fields <- c(fields, "condition_era_end_date")
    values <- c(values, if (is.null(condition_era_end_date)) "NULL" else if (is(condition_era_end_date, "subQuery")) paste0("(", as.character(condition_era_end_date), ")") else paste0("'", as.character(condition_era_end_date), "'"))
  }

  if (!missing(condition_occurrence_count)) {
    fields <- c(fields, "condition_occurrence_count")
    values <- c(values, if (is.null(condition_occurrence_count)) "NULL" else if (is(condition_occurrence_count, "subQuery")) paste0("(", as.character(condition_occurrence_count), ")") else paste0("'", as.character(condition_occurrence_count), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 0, table = "condition_era", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_dose_era <- function(dose_era_id, person_id, drug_concept_id, unit_concept_id, dose_value, dose_era_start_date, dose_era_end_date) {
  fields <- c()
  values <- c()
  if (!missing(dose_era_id)) {
    fields <- c(fields, "dose_era_id")
    values <- c(values, if (is.null(dose_era_id)) "NULL" else if (is(dose_era_id, "subQuery")) paste0("(", as.character(dose_era_id), ")") else paste0("'", as.character(dose_era_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(drug_concept_id)) {
    fields <- c(fields, "drug_concept_id")
    values <- c(values, if (is.null(drug_concept_id)) "NULL" else if (is(drug_concept_id, "subQuery")) paste0("(", as.character(drug_concept_id), ")") else paste0("'", as.character(drug_concept_id), "'"))
  }

  if (!missing(unit_concept_id)) {
    fields <- c(fields, "unit_concept_id")
    values <- c(values, if (is.null(unit_concept_id)) "NULL" else if (is(unit_concept_id, "subQuery")) paste0("(", as.character(unit_concept_id), ")") else paste0("'", as.character(unit_concept_id), "'"))
  }

  if (!missing(dose_value)) {
    fields <- c(fields, "dose_value")
    values <- c(values, if (is.null(dose_value)) "NULL" else if (is(dose_value, "subQuery")) paste0("(", as.character(dose_value), ")") else paste0("'", as.character(dose_value), "'"))
  }

  if (!missing(dose_era_start_date)) {
    fields <- c(fields, "dose_era_start_date")
    values <- c(values, if (is.null(dose_era_start_date)) "NULL" else if (is(dose_era_start_date, "subQuery")) paste0("(", as.character(dose_era_start_date), ")") else paste0("'", as.character(dose_era_start_date), "'"))
  }

  if (!missing(dose_era_end_date)) {
    fields <- c(fields, "dose_era_end_date")
    values <- c(values, if (is.null(dose_era_end_date)) "NULL" else if (is(dose_era_end_date, "subQuery")) paste0("(", as.character(dose_era_end_date), ")") else paste0("'", as.character(dose_era_end_date), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 0, table = "dose_era", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_drug_era <- function(drug_era_id, person_id, drug_concept_id, drug_era_start_date, drug_era_end_date, drug_exposure_count, gap_days) {
  fields <- c()
  values <- c()
  if (!missing(drug_era_id)) {
    fields <- c(fields, "drug_era_id")
    values <- c(values, if (is.null(drug_era_id)) "NULL" else if (is(drug_era_id, "subQuery")) paste0("(", as.character(drug_era_id), ")") else paste0("'", as.character(drug_era_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(drug_concept_id)) {
    fields <- c(fields, "drug_concept_id")
    values <- c(values, if (is.null(drug_concept_id)) "NULL" else if (is(drug_concept_id, "subQuery")) paste0("(", as.character(drug_concept_id), ")") else paste0("'", as.character(drug_concept_id), "'"))
  }

  if (!missing(drug_era_start_date)) {
    fields <- c(fields, "drug_era_start_date")
    values <- c(values, if (is.null(drug_era_start_date)) "NULL" else if (is(drug_era_start_date, "subQuery")) paste0("(", as.character(drug_era_start_date), ")") else paste0("'", as.character(drug_era_start_date), "'"))
  }

  if (!missing(drug_era_end_date)) {
    fields <- c(fields, "drug_era_end_date")
    values <- c(values, if (is.null(drug_era_end_date)) "NULL" else if (is(drug_era_end_date, "subQuery")) paste0("(", as.character(drug_era_end_date), ")") else paste0("'", as.character(drug_era_end_date), "'"))
  }

  if (!missing(drug_exposure_count)) {
    fields <- c(fields, "drug_exposure_count")
    values <- c(values, if (is.null(drug_exposure_count)) "NULL" else if (is(drug_exposure_count, "subQuery")) paste0("(", as.character(drug_exposure_count), ")") else paste0("'", as.character(drug_exposure_count), "'"))
  }

  if (!missing(gap_days)) {
    fields <- c(fields, "gap_days")
    values <- c(values, if (is.null(gap_days)) "NULL" else if (is(gap_days, "subQuery")) paste0("(", as.character(gap_days), ")") else paste0("'", as.character(gap_days), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 0, table = "drug_era", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_cost <- function(cost_id, cost_event_id, cost_domain_id, cost_type_concept_id, currency_concept_id, total_charge, total_cost, total_paid, paid_by_payer, paid_by_patient, paid_patient_copay, paid_patient_coinsurance, paid_patient_deductible, paid_by_primary, paid_ingredient_cost, paid_dispensing_fee, payer_plan_period_id, amount_allowed, revenue_code_concept_id, revenue_code_source_value, drg_concept_id, drg_source_value) {
  fields <- c()
  values <- c()
  if (!missing(cost_id)) {
    fields <- c(fields, "cost_id")
    values <- c(values, if (is.null(cost_id)) "NULL" else if (is(cost_id, "subQuery")) paste0("(", as.character(cost_id), ")") else paste0("'", as.character(cost_id), "'"))
  }

  if (!missing(cost_event_id)) {
    fields <- c(fields, "cost_event_id")
    values <- c(values, if (is.null(cost_event_id)) "NULL" else if (is(cost_event_id, "subQuery")) paste0("(", as.character(cost_event_id), ")") else paste0("'", as.character(cost_event_id), "'"))
  }

  if (!missing(cost_domain_id)) {
    fields <- c(fields, "cost_domain_id")
    values <- c(values, if (is.null(cost_domain_id)) "NULL" else if (is(cost_domain_id, "subQuery")) paste0("(", as.character(cost_domain_id), ")") else paste0("'", as.character(cost_domain_id), "'"))
  }

  if (!missing(cost_type_concept_id)) {
    fields <- c(fields, "cost_type_concept_id")
    values <- c(values, if (is.null(cost_type_concept_id)) "NULL" else if (is(cost_type_concept_id, "subQuery")) paste0("(", as.character(cost_type_concept_id), ")") else paste0("'", as.character(cost_type_concept_id), "'"))
  }

  if (!missing(currency_concept_id)) {
    fields <- c(fields, "currency_concept_id")
    values <- c(values, if (is.null(currency_concept_id)) "NULL" else if (is(currency_concept_id, "subQuery")) paste0("(", as.character(currency_concept_id), ")") else paste0("'", as.character(currency_concept_id), "'"))
  }

  if (!missing(total_charge)) {
    fields <- c(fields, "total_charge")
    values <- c(values, if (is.null(total_charge)) "NULL" else if (is(total_charge, "subQuery")) paste0("(", as.character(total_charge), ")") else paste0("'", as.character(total_charge), "'"))
  }

  if (!missing(total_cost)) {
    fields <- c(fields, "total_cost")
    values <- c(values, if (is.null(total_cost)) "NULL" else if (is(total_cost, "subQuery")) paste0("(", as.character(total_cost), ")") else paste0("'", as.character(total_cost), "'"))
  }

  if (!missing(total_paid)) {
    fields <- c(fields, "total_paid")
    values <- c(values, if (is.null(total_paid)) "NULL" else if (is(total_paid, "subQuery")) paste0("(", as.character(total_paid), ")") else paste0("'", as.character(total_paid), "'"))
  }

  if (!missing(paid_by_payer)) {
    fields <- c(fields, "paid_by_payer")
    values <- c(values, if (is.null(paid_by_payer)) "NULL" else if (is(paid_by_payer, "subQuery")) paste0("(", as.character(paid_by_payer), ")") else paste0("'", as.character(paid_by_payer), "'"))
  }

  if (!missing(paid_by_patient)) {
    fields <- c(fields, "paid_by_patient")
    values <- c(values, if (is.null(paid_by_patient)) "NULL" else if (is(paid_by_patient, "subQuery")) paste0("(", as.character(paid_by_patient), ")") else paste0("'", as.character(paid_by_patient), "'"))
  }

  if (!missing(paid_patient_copay)) {
    fields <- c(fields, "paid_patient_copay")
    values <- c(values, if (is.null(paid_patient_copay)) "NULL" else if (is(paid_patient_copay, "subQuery")) paste0("(", as.character(paid_patient_copay), ")") else paste0("'", as.character(paid_patient_copay), "'"))
  }

  if (!missing(paid_patient_coinsurance)) {
    fields <- c(fields, "paid_patient_coinsurance")
    values <- c(values, if (is.null(paid_patient_coinsurance)) "NULL" else if (is(paid_patient_coinsurance, "subQuery")) paste0("(", as.character(paid_patient_coinsurance), ")") else paste0("'", as.character(paid_patient_coinsurance), "'"))
  }

  if (!missing(paid_patient_deductible)) {
    fields <- c(fields, "paid_patient_deductible")
    values <- c(values, if (is.null(paid_patient_deductible)) "NULL" else if (is(paid_patient_deductible, "subQuery")) paste0("(", as.character(paid_patient_deductible), ")") else paste0("'", as.character(paid_patient_deductible), "'"))
  }

  if (!missing(paid_by_primary)) {
    fields <- c(fields, "paid_by_primary")
    values <- c(values, if (is.null(paid_by_primary)) "NULL" else if (is(paid_by_primary, "subQuery")) paste0("(", as.character(paid_by_primary), ")") else paste0("'", as.character(paid_by_primary), "'"))
  }

  if (!missing(paid_ingredient_cost)) {
    fields <- c(fields, "paid_ingredient_cost")
    values <- c(values, if (is.null(paid_ingredient_cost)) "NULL" else if (is(paid_ingredient_cost, "subQuery")) paste0("(", as.character(paid_ingredient_cost), ")") else paste0("'", as.character(paid_ingredient_cost), "'"))
  }

  if (!missing(paid_dispensing_fee)) {
    fields <- c(fields, "paid_dispensing_fee")
    values <- c(values, if (is.null(paid_dispensing_fee)) "NULL" else if (is(paid_dispensing_fee, "subQuery")) paste0("(", as.character(paid_dispensing_fee), ")") else paste0("'", as.character(paid_dispensing_fee), "'"))
  }

  if (!missing(payer_plan_period_id)) {
    fields <- c(fields, "payer_plan_period_id")
    values <- c(values, if (is.null(payer_plan_period_id)) "NULL" else if (is(payer_plan_period_id, "subQuery")) paste0("(", as.character(payer_plan_period_id), ")") else paste0("'", as.character(payer_plan_period_id), "'"))
  }

  if (!missing(amount_allowed)) {
    fields <- c(fields, "amount_allowed")
    values <- c(values, if (is.null(amount_allowed)) "NULL" else if (is(amount_allowed, "subQuery")) paste0("(", as.character(amount_allowed), ")") else paste0("'", as.character(amount_allowed), "'"))
  }

  if (!missing(revenue_code_concept_id)) {
    fields <- c(fields, "revenue_code_concept_id")
    values <- c(values, if (is.null(revenue_code_concept_id)) "NULL" else if (is(revenue_code_concept_id, "subQuery")) paste0("(", as.character(revenue_code_concept_id), ")") else paste0("'", as.character(revenue_code_concept_id), "'"))
  }

  if (!missing(revenue_code_source_value)) {
    fields <- c(fields, "revenue_code_source_value")
    values <- c(values, if (is.null(revenue_code_source_value)) "NULL" else if (is(revenue_code_source_value, "subQuery")) paste0("(", as.character(revenue_code_source_value), ")") else paste0("'", as.character(revenue_code_source_value), "'"))
  }

  if (!missing(drg_concept_id)) {
    fields <- c(fields, "drg_concept_id")
    values <- c(values, if (is.null(drg_concept_id)) "NULL" else if (is(drg_concept_id, "subQuery")) paste0("(", as.character(drg_concept_id), ")") else paste0("'", as.character(drg_concept_id), "'"))
  }

  if (!missing(drg_source_value)) {
    fields <- c(fields, "drg_source_value")
    values <- c(values, if (is.null(drg_source_value)) "NULL" else if (is(drg_source_value, "subQuery")) paste0("(", as.character(drg_source_value), ")") else paste0("'", as.character(drg_source_value), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 0, table = "cost", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_payer_plan_period <- function(payer_plan_period_id, person_id, payer_plan_period_start_date, payer_plan_period_end_date, payer_source_value, plan_source_value, family_source_value) {
  fields <- c()
  values <- c()
  if (!missing(payer_plan_period_id)) {
    fields <- c(fields, "payer_plan_period_id")
    values <- c(values, if (is.null(payer_plan_period_id)) "NULL" else if (is(payer_plan_period_id, "subQuery")) paste0("(", as.character(payer_plan_period_id), ")") else paste0("'", as.character(payer_plan_period_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(payer_plan_period_start_date)) {
    fields <- c(fields, "payer_plan_period_start_date")
    values <- c(values, if (is.null(payer_plan_period_start_date)) "NULL" else if (is(payer_plan_period_start_date, "subQuery")) paste0("(", as.character(payer_plan_period_start_date), ")") else paste0("'", as.character(payer_plan_period_start_date), "'"))
  }

  if (!missing(payer_plan_period_end_date)) {
    fields <- c(fields, "payer_plan_period_end_date")
    values <- c(values, if (is.null(payer_plan_period_end_date)) "NULL" else if (is(payer_plan_period_end_date, "subQuery")) paste0("(", as.character(payer_plan_period_end_date), ")") else paste0("'", as.character(payer_plan_period_end_date), "'"))
  }

  if (!missing(payer_source_value)) {
    fields <- c(fields, "payer_source_value")
    values <- c(values, if (is.null(payer_source_value)) "NULL" else if (is(payer_source_value, "subQuery")) paste0("(", as.character(payer_source_value), ")") else paste0("'", as.character(payer_source_value), "'"))
  }

  if (!missing(plan_source_value)) {
    fields <- c(fields, "plan_source_value")
    values <- c(values, if (is.null(plan_source_value)) "NULL" else if (is(plan_source_value, "subQuery")) paste0("(", as.character(plan_source_value), ")") else paste0("'", as.character(plan_source_value), "'"))
  }

  if (!missing(family_source_value)) {
    fields <- c(fields, "family_source_value")
    values <- c(values, if (is.null(family_source_value)) "NULL" else if (is(family_source_value, "subQuery")) paste0("(", as.character(family_source_value), ")") else paste0("'", as.character(family_source_value), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 0, table = "payer_plan_period", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_care_site <- function(care_site_id, care_site_name, place_of_service_concept_id, location_id, care_site_source_value, place_of_service_source_value) {
  fields <- c()
  values <- c()
  if (!missing(care_site_id)) {
    fields <- c(fields, "care_site_id")
    values <- c(values, if (is.null(care_site_id)) "NULL" else if (is(care_site_id, "subQuery")) paste0("(", as.character(care_site_id), ")") else paste0("'", as.character(care_site_id), "'"))
  }

  if (!missing(care_site_name)) {
    fields <- c(fields, "care_site_name")
    values <- c(values, if (is.null(care_site_name)) "NULL" else if (is(care_site_name, "subQuery")) paste0("(", as.character(care_site_name), ")") else paste0("'", as.character(care_site_name), "'"))
  }

  if (!missing(place_of_service_concept_id)) {
    fields <- c(fields, "place_of_service_concept_id")
    values <- c(values, if (is.null(place_of_service_concept_id)) "NULL" else if (is(place_of_service_concept_id, "subQuery")) paste0("(", as.character(place_of_service_concept_id), ")") else paste0("'", as.character(place_of_service_concept_id), "'"))
  }

  if (!missing(location_id)) {
    fields <- c(fields, "location_id")
    values <- c(values, if (is.null(location_id)) "NULL" else if (is(location_id, "subQuery")) paste0("(", as.character(location_id), ")") else paste0("'", as.character(location_id), "'"))
  }

  if (!missing(care_site_source_value)) {
    fields <- c(fields, "care_site_source_value")
    values <- c(values, if (is.null(care_site_source_value)) "NULL" else if (is(care_site_source_value, "subQuery")) paste0("(", as.character(care_site_source_value), ")") else paste0("'", as.character(care_site_source_value), "'"))
  }

  if (!missing(place_of_service_source_value)) {
    fields <- c(fields, "place_of_service_source_value")
    values <- c(values, if (is.null(place_of_service_source_value)) "NULL" else if (is(place_of_service_source_value, "subQuery")) paste0("(", as.character(place_of_service_source_value), ")") else paste0("'", as.character(place_of_service_source_value), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 0, table = "care_site", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_location <- function(location_id, address_1, address_2, city, state, zip, county, location_source_value) {
  fields <- c()
  values <- c()
  if (!missing(location_id)) {
    fields <- c(fields, "location_id")
    values <- c(values, if (is.null(location_id)) "NULL" else if (is(location_id, "subQuery")) paste0("(", as.character(location_id), ")") else paste0("'", as.character(location_id), "'"))
  }

  if (!missing(address_1)) {
    fields <- c(fields, "address_1")
    values <- c(values, if (is.null(address_1)) "NULL" else if (is(address_1, "subQuery")) paste0("(", as.character(address_1), ")") else paste0("'", as.character(address_1), "'"))
  }

  if (!missing(address_2)) {
    fields <- c(fields, "address_2")
    values <- c(values, if (is.null(address_2)) "NULL" else if (is(address_2, "subQuery")) paste0("(", as.character(address_2), ")") else paste0("'", as.character(address_2), "'"))
  }

  if (!missing(city)) {
    fields <- c(fields, "city")
    values <- c(values, if (is.null(city)) "NULL" else if (is(city, "subQuery")) paste0("(", as.character(city), ")") else paste0("'", as.character(city), "'"))
  }

  if (!missing(state)) {
    fields <- c(fields, "state")
    values <- c(values, if (is.null(state)) "NULL" else if (is(state, "subQuery")) paste0("(", as.character(state), ")") else paste0("'", as.character(state), "'"))
  }

  if (!missing(zip)) {
    fields <- c(fields, "zip")
    values <- c(values, if (is.null(zip)) "NULL" else if (is(zip, "subQuery")) paste0("(", as.character(zip), ")") else paste0("'", as.character(zip), "'"))
  }

  if (!missing(county)) {
    fields <- c(fields, "county")
    values <- c(values, if (is.null(county)) "NULL" else if (is(county, "subQuery")) paste0("(", as.character(county), ")") else paste0("'", as.character(county), "'"))
  }

  if (!missing(location_source_value)) {
    fields <- c(fields, "location_source_value")
    values <- c(values, if (is.null(location_source_value)) "NULL" else if (is(location_source_value, "subQuery")) paste0("(", as.character(location_source_value), ")") else paste0("'", as.character(location_source_value), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 0, table = "location", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_provider <- function(provider_id, provider_name, npi, dea, specialty_concept_id, care_site_id, year_of_birth, gender_concept_id, provider_source_value, specialty_source_value, specialty_source_concept_id, gender_source_value, gender_source_concept_id) {
  fields <- c()
  values <- c()
  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(provider_name)) {
    fields <- c(fields, "provider_name")
    values <- c(values, if (is.null(provider_name)) "NULL" else if (is(provider_name, "subQuery")) paste0("(", as.character(provider_name), ")") else paste0("'", as.character(provider_name), "'"))
  }

  if (!missing(npi)) {
    fields <- c(fields, "npi")
    values <- c(values, if (is.null(npi)) "NULL" else if (is(npi, "subQuery")) paste0("(", as.character(npi), ")") else paste0("'", as.character(npi), "'"))
  }

  if (!missing(dea)) {
    fields <- c(fields, "dea")
    values <- c(values, if (is.null(dea)) "NULL" else if (is(dea, "subQuery")) paste0("(", as.character(dea), ")") else paste0("'", as.character(dea), "'"))
  }

  if (!missing(specialty_concept_id)) {
    fields <- c(fields, "specialty_concept_id")
    values <- c(values, if (is.null(specialty_concept_id)) "NULL" else if (is(specialty_concept_id, "subQuery")) paste0("(", as.character(specialty_concept_id), ")") else paste0("'", as.character(specialty_concept_id), "'"))
  }

  if (!missing(care_site_id)) {
    fields <- c(fields, "care_site_id")
    values <- c(values, if (is.null(care_site_id)) "NULL" else if (is(care_site_id, "subQuery")) paste0("(", as.character(care_site_id), ")") else paste0("'", as.character(care_site_id), "'"))
  }

  if (!missing(year_of_birth)) {
    fields <- c(fields, "year_of_birth")
    values <- c(values, if (is.null(year_of_birth)) "NULL" else if (is(year_of_birth, "subQuery")) paste0("(", as.character(year_of_birth), ")") else paste0("'", as.character(year_of_birth), "'"))
  }

  if (!missing(gender_concept_id)) {
    fields <- c(fields, "gender_concept_id")
    values <- c(values, if (is.null(gender_concept_id)) "NULL" else if (is(gender_concept_id, "subQuery")) paste0("(", as.character(gender_concept_id), ")") else paste0("'", as.character(gender_concept_id), "'"))
  }

  if (!missing(provider_source_value)) {
    fields <- c(fields, "provider_source_value")
    values <- c(values, if (is.null(provider_source_value)) "NULL" else if (is(provider_source_value, "subQuery")) paste0("(", as.character(provider_source_value), ")") else paste0("'", as.character(provider_source_value), "'"))
  }

  if (!missing(specialty_source_value)) {
    fields <- c(fields, "specialty_source_value")
    values <- c(values, if (is.null(specialty_source_value)) "NULL" else if (is(specialty_source_value, "subQuery")) paste0("(", as.character(specialty_source_value), ")") else paste0("'", as.character(specialty_source_value), "'"))
  }

  if (!missing(specialty_source_concept_id)) {
    fields <- c(fields, "specialty_source_concept_id")
    values <- c(values, if (is.null(specialty_source_concept_id)) "NULL" else if (is(specialty_source_concept_id, "subQuery")) paste0("(", as.character(specialty_source_concept_id), ")") else paste0("'", as.character(specialty_source_concept_id), "'"))
  }

  if (!missing(gender_source_value)) {
    fields <- c(fields, "gender_source_value")
    values <- c(values, if (is.null(gender_source_value)) "NULL" else if (is(gender_source_value, "subQuery")) paste0("(", as.character(gender_source_value), ")") else paste0("'", as.character(gender_source_value), "'"))
  }

  if (!missing(gender_source_concept_id)) {
    fields <- c(fields, "gender_source_concept_id")
    values <- c(values, if (is.null(gender_source_concept_id)) "NULL" else if (is(gender_source_concept_id, "subQuery")) paste0("(", as.character(gender_source_concept_id), ")") else paste0("'", as.character(gender_source_concept_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 0, table = "provider", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_cdm_source <- function(cdm_source_name, cdm_source_abbreviation, cdm_holder, source_description, source_documentation_reference, cdm_etl__reference, source_release_date, cdm_release_date, cdm_version, vocabulary_version) {
  fields <- c()
  values <- c()
  if (!missing(cdm_source_name)) {
    fields <- c(fields, "cdm_source_name")
    values <- c(values, if (is.null(cdm_source_name)) "NULL" else if (is(cdm_source_name, "subQuery")) paste0("(", as.character(cdm_source_name), ")") else paste0("'", as.character(cdm_source_name), "'"))
  }

  if (!missing(cdm_source_abbreviation)) {
    fields <- c(fields, "cdm_source_abbreviation")
    values <- c(values, if (is.null(cdm_source_abbreviation)) "NULL" else if (is(cdm_source_abbreviation, "subQuery")) paste0("(", as.character(cdm_source_abbreviation), ")") else paste0("'", as.character(cdm_source_abbreviation), "'"))
  }

  if (!missing(cdm_holder)) {
    fields <- c(fields, "cdm_holder")
    values <- c(values, if (is.null(cdm_holder)) "NULL" else if (is(cdm_holder, "subQuery")) paste0("(", as.character(cdm_holder), ")") else paste0("'", as.character(cdm_holder), "'"))
  }

  if (!missing(source_description)) {
    fields <- c(fields, "source_description")
    values <- c(values, if (is.null(source_description)) "NULL" else if (is(source_description, "subQuery")) paste0("(", as.character(source_description), ")") else paste0("'", as.character(source_description), "'"))
  }

  if (!missing(source_documentation_reference)) {
    fields <- c(fields, "source_documentation_reference")
    values <- c(values, if (is.null(source_documentation_reference)) "NULL" else if (is(source_documentation_reference, "subQuery")) paste0("(", as.character(source_documentation_reference), ")") else paste0("'", as.character(source_documentation_reference), "'"))
  }

  if (!missing(cdm_etl__reference)) {
    fields <- c(fields, "[cdm_etl _reference]")
    values <- c(values, if (is.null(cdm_etl__reference)) "NULL" else if (is(cdm_etl__reference, "subQuery")) paste0("(", as.character(cdm_etl__reference), ")") else paste0("'", as.character(cdm_etl__reference), "'"))
  }

  if (!missing(source_release_date)) {
    fields <- c(fields, "source_release_date")
    values <- c(values, if (is.null(source_release_date)) "NULL" else if (is(source_release_date, "subQuery")) paste0("(", as.character(source_release_date), ")") else paste0("'", as.character(source_release_date), "'"))
  }

  if (!missing(cdm_release_date)) {
    fields <- c(fields, "cdm_release_date")
    values <- c(values, if (is.null(cdm_release_date)) "NULL" else if (is(cdm_release_date, "subQuery")) paste0("(", as.character(cdm_release_date), ")") else paste0("'", as.character(cdm_release_date), "'"))
  }

  if (!missing(cdm_version)) {
    fields <- c(fields, "cdm_version")
    values <- c(values, if (is.null(cdm_version)) "NULL" else if (is(cdm_version, "subQuery")) paste0("(", as.character(cdm_version), ")") else paste0("'", as.character(cdm_version), "'"))
  }

  if (!missing(vocabulary_version)) {
    fields <- c(fields, "vocabulary_version")
    values <- c(values, if (is.null(vocabulary_version)) "NULL" else if (is(vocabulary_version, "subQuery")) paste0("(", as.character(vocabulary_version), ")") else paste0("'", as.character(vocabulary_version), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 0, table = "cdm_source", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_attribute_definition <- function(attribute_definition_id, attribute_name, attribute_description, attribute_type_concept_id, attribute_syntax) {
  fields <- c()
  values <- c()
  if (!missing(attribute_definition_id)) {
    fields <- c(fields, "attribute_definition_id")
    values <- c(values, if (is.null(attribute_definition_id)) "NULL" else if (is(attribute_definition_id, "subQuery")) paste0("(", as.character(attribute_definition_id), ")") else paste0("'", as.character(attribute_definition_id), "'"))
  }

  if (!missing(attribute_name)) {
    fields <- c(fields, "attribute_name")
    values <- c(values, if (is.null(attribute_name)) "NULL" else if (is(attribute_name, "subQuery")) paste0("(", as.character(attribute_name), ")") else paste0("'", as.character(attribute_name), "'"))
  }

  if (!missing(attribute_description)) {
    fields <- c(fields, "attribute_description")
    values <- c(values, if (is.null(attribute_description)) "NULL" else if (is(attribute_description, "subQuery")) paste0("(", as.character(attribute_description), ")") else paste0("'", as.character(attribute_description), "'"))
  }

  if (!missing(attribute_type_concept_id)) {
    fields <- c(fields, "attribute_type_concept_id")
    values <- c(values, if (is.null(attribute_type_concept_id)) "NULL" else if (is(attribute_type_concept_id, "subQuery")) paste0("(", as.character(attribute_type_concept_id), ")") else paste0("'", as.character(attribute_type_concept_id), "'"))
  }

  if (!missing(attribute_syntax)) {
    fields <- c(fields, "attribute_syntax")
    values <- c(values, if (is.null(attribute_syntax)) "NULL" else if (is(attribute_syntax, "subQuery")) paste0("(", as.character(attribute_syntax), ")") else paste0("'", as.character(attribute_syntax), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 0, table = "attribute_definition", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_cohort_definition <- function(cohort_definition_id, cohort_definition_name, cohort_definition_description, definition_type_concept_id, cohort_definition_syntax, subject_concept_id, cohort_instantiation_date) {
  fields <- c()
  values <- c()
  if (!missing(cohort_definition_id)) {
    fields <- c(fields, "cohort_definition_id")
    values <- c(values, if (is.null(cohort_definition_id)) "NULL" else if (is(cohort_definition_id, "subQuery")) paste0("(", as.character(cohort_definition_id), ")") else paste0("'", as.character(cohort_definition_id), "'"))
  }

  if (!missing(cohort_definition_name)) {
    fields <- c(fields, "cohort_definition_name")
    values <- c(values, if (is.null(cohort_definition_name)) "NULL" else if (is(cohort_definition_name, "subQuery")) paste0("(", as.character(cohort_definition_name), ")") else paste0("'", as.character(cohort_definition_name), "'"))
  }

  if (!missing(cohort_definition_description)) {
    fields <- c(fields, "cohort_definition_description")
    values <- c(values, if (is.null(cohort_definition_description)) "NULL" else if (is(cohort_definition_description, "subQuery")) paste0("(", as.character(cohort_definition_description), ")") else paste0("'", as.character(cohort_definition_description), "'"))
  }

  if (!missing(definition_type_concept_id)) {
    fields <- c(fields, "definition_type_concept_id")
    values <- c(values, if (is.null(definition_type_concept_id)) "NULL" else if (is(definition_type_concept_id, "subQuery")) paste0("(", as.character(definition_type_concept_id), ")") else paste0("'", as.character(definition_type_concept_id), "'"))
  }

  if (!missing(cohort_definition_syntax)) {
    fields <- c(fields, "cohort_definition_syntax")
    values <- c(values, if (is.null(cohort_definition_syntax)) "NULL" else if (is(cohort_definition_syntax, "subQuery")) paste0("(", as.character(cohort_definition_syntax), ")") else paste0("'", as.character(cohort_definition_syntax), "'"))
  }

  if (!missing(subject_concept_id)) {
    fields <- c(fields, "subject_concept_id")
    values <- c(values, if (is.null(subject_concept_id)) "NULL" else if (is(subject_concept_id, "subQuery")) paste0("(", as.character(subject_concept_id), ")") else paste0("'", as.character(subject_concept_id), "'"))
  }

  if (!missing(cohort_instantiation_date)) {
    fields <- c(fields, "cohort_instantiation_date")
    values <- c(values, if (is.null(cohort_instantiation_date)) "NULL" else if (is(cohort_instantiation_date, "subQuery")) paste0("(", as.character(cohort_instantiation_date), ")") else paste0("'", as.character(cohort_instantiation_date), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 0, table = "cohort_definition", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_no_condition_occurrence <- function(condition_occurrence_id, person_id, condition_concept_id, condition_start_date, condition_start_datetime, condition_end_date, condition_end_datetime, condition_type_concept_id, stop_reason, provider_id, visit_occurrence_id, visit_detail_id, condition_source_value, condition_source_concept_id, condition_status_source_value, condition_status_concept_id) {
  fields <- c()
  values <- c()
  if (!missing(condition_occurrence_id)) {
    fields <- c(fields, "condition_occurrence_id")
    values <- c(values, if (is.null(condition_occurrence_id)) "NULL" else if (is(condition_occurrence_id, "subQuery")) paste0("(", as.character(condition_occurrence_id), ")") else paste0("'", as.character(condition_occurrence_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(condition_concept_id)) {
    fields <- c(fields, "condition_concept_id")
    values <- c(values, if (is.null(condition_concept_id)) "NULL" else if (is(condition_concept_id, "subQuery")) paste0("(", as.character(condition_concept_id), ")") else paste0("'", as.character(condition_concept_id), "'"))
  }

  if (!missing(condition_start_date)) {
    fields <- c(fields, "condition_start_date")
    values <- c(values, if (is.null(condition_start_date)) "NULL" else if (is(condition_start_date, "subQuery")) paste0("(", as.character(condition_start_date), ")") else paste0("'", as.character(condition_start_date), "'"))
  }

  if (!missing(condition_start_datetime)) {
    fields <- c(fields, "condition_start_datetime")
    values <- c(values, if (is.null(condition_start_datetime)) "NULL" else if (is(condition_start_datetime, "subQuery")) paste0("(", as.character(condition_start_datetime), ")") else paste0("'", as.character(condition_start_datetime), "'"))
  }

  if (!missing(condition_end_date)) {
    fields <- c(fields, "condition_end_date")
    values <- c(values, if (is.null(condition_end_date)) "NULL" else if (is(condition_end_date, "subQuery")) paste0("(", as.character(condition_end_date), ")") else paste0("'", as.character(condition_end_date), "'"))
  }

  if (!missing(condition_end_datetime)) {
    fields <- c(fields, "condition_end_datetime")
    values <- c(values, if (is.null(condition_end_datetime)) "NULL" else if (is(condition_end_datetime, "subQuery")) paste0("(", as.character(condition_end_datetime), ")") else paste0("'", as.character(condition_end_datetime), "'"))
  }

  if (!missing(condition_type_concept_id)) {
    fields <- c(fields, "condition_type_concept_id")
    values <- c(values, if (is.null(condition_type_concept_id)) "NULL" else if (is(condition_type_concept_id, "subQuery")) paste0("(", as.character(condition_type_concept_id), ")") else paste0("'", as.character(condition_type_concept_id), "'"))
  }

  if (!missing(stop_reason)) {
    fields <- c(fields, "stop_reason")
    values <- c(values, if (is.null(stop_reason)) "NULL" else if (is(stop_reason, "subQuery")) paste0("(", as.character(stop_reason), ")") else paste0("'", as.character(stop_reason), "'"))
  }

  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    fields <- c(fields, "visit_occurrence_id")
    values <- c(values, if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  if (!missing(visit_detail_id)) {
    fields <- c(fields, "visit_detail_id")
    values <- c(values, if (is.null(visit_detail_id)) "NULL" else if (is(visit_detail_id, "subQuery")) paste0("(", as.character(visit_detail_id), ")") else paste0("'", as.character(visit_detail_id), "'"))
  }

  if (!missing(condition_source_value)) {
    fields <- c(fields, "condition_source_value")
    values <- c(values, if (is.null(condition_source_value)) "NULL" else if (is(condition_source_value, "subQuery")) paste0("(", as.character(condition_source_value), ")") else paste0("'", as.character(condition_source_value), "'"))
  }

  if (!missing(condition_source_concept_id)) {
    fields <- c(fields, "condition_source_concept_id")
    values <- c(values, if (is.null(condition_source_concept_id)) "NULL" else if (is(condition_source_concept_id, "subQuery")) paste0("(", as.character(condition_source_concept_id), ")") else paste0("'", as.character(condition_source_concept_id), "'"))
  }

  if (!missing(condition_status_source_value)) {
    fields <- c(fields, "condition_status_source_value")
    values <- c(values, if (is.null(condition_status_source_value)) "NULL" else if (is(condition_status_source_value, "subQuery")) paste0("(", as.character(condition_status_source_value), ")") else paste0("'", as.character(condition_status_source_value), "'"))
  }

  if (!missing(condition_status_concept_id)) {
    fields <- c(fields, "condition_status_concept_id")
    values <- c(values, if (is.null(condition_status_concept_id)) "NULL" else if (is(condition_status_concept_id, "subQuery")) paste0("(", as.character(condition_status_concept_id), ")") else paste0("'", as.character(condition_status_concept_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 1, table = "condition_occurrence", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_no_death <- function(person_id, death_date, death_datetime, death_type_concept_id, cause_concept_id, cause_source_value, cause_source_concept_id) {
  fields <- c()
  values <- c()
  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(death_date)) {
    fields <- c(fields, "death_date")
    values <- c(values, if (is.null(death_date)) "NULL" else if (is(death_date, "subQuery")) paste0("(", as.character(death_date), ")") else paste0("'", as.character(death_date), "'"))
  }

  if (!missing(death_datetime)) {
    fields <- c(fields, "death_datetime")
    values <- c(values, if (is.null(death_datetime)) "NULL" else if (is(death_datetime, "subQuery")) paste0("(", as.character(death_datetime), ")") else paste0("'", as.character(death_datetime), "'"))
  }

  if (!missing(death_type_concept_id)) {
    fields <- c(fields, "death_type_concept_id")
    values <- c(values, if (is.null(death_type_concept_id)) "NULL" else if (is(death_type_concept_id, "subQuery")) paste0("(", as.character(death_type_concept_id), ")") else paste0("'", as.character(death_type_concept_id), "'"))
  }

  if (!missing(cause_concept_id)) {
    fields <- c(fields, "cause_concept_id")
    values <- c(values, if (is.null(cause_concept_id)) "NULL" else if (is(cause_concept_id, "subQuery")) paste0("(", as.character(cause_concept_id), ")") else paste0("'", as.character(cause_concept_id), "'"))
  }

  if (!missing(cause_source_value)) {
    fields <- c(fields, "cause_source_value")
    values <- c(values, if (is.null(cause_source_value)) "NULL" else if (is(cause_source_value, "subQuery")) paste0("(", as.character(cause_source_value), ")") else paste0("'", as.character(cause_source_value), "'"))
  }

  if (!missing(cause_source_concept_id)) {
    fields <- c(fields, "cause_source_concept_id")
    values <- c(values, if (is.null(cause_source_concept_id)) "NULL" else if (is(cause_source_concept_id, "subQuery")) paste0("(", as.character(cause_source_concept_id), ")") else paste0("'", as.character(cause_source_concept_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 1, table = "death", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_no_device_exposure <- function(device_exposure_id, person_id, device_concept_id, device_exposure_start_date, device_exposure_start_datetime, device_exposure_end_date, device_exposure_end_datetime, device_type_concept_id, unique_device_id, quantity, provider_id, visit_occurrence_id, device_source_value, device_source__concept_id, visit_detail_id) {
  fields <- c()
  values <- c()
  if (!missing(device_exposure_id)) {
    fields <- c(fields, "device_exposure_id")
    values <- c(values, if (is.null(device_exposure_id)) "NULL" else if (is(device_exposure_id, "subQuery")) paste0("(", as.character(device_exposure_id), ")") else paste0("'", as.character(device_exposure_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(device_concept_id)) {
    fields <- c(fields, "device_concept_id")
    values <- c(values, if (is.null(device_concept_id)) "NULL" else if (is(device_concept_id, "subQuery")) paste0("(", as.character(device_concept_id), ")") else paste0("'", as.character(device_concept_id), "'"))
  }

  if (!missing(device_exposure_start_date)) {
    fields <- c(fields, "device_exposure_start_date")
    values <- c(values, if (is.null(device_exposure_start_date)) "NULL" else if (is(device_exposure_start_date, "subQuery")) paste0("(", as.character(device_exposure_start_date), ")") else paste0("'", as.character(device_exposure_start_date), "'"))
  }

  if (!missing(device_exposure_start_datetime)) {
    fields <- c(fields, "device_exposure_start_datetime")
    values <- c(values, if (is.null(device_exposure_start_datetime)) "NULL" else if (is(device_exposure_start_datetime, "subQuery")) paste0("(", as.character(device_exposure_start_datetime), ")") else paste0("'", as.character(device_exposure_start_datetime), "'"))
  }

  if (!missing(device_exposure_end_date)) {
    fields <- c(fields, "device_exposure_end_date")
    values <- c(values, if (is.null(device_exposure_end_date)) "NULL" else if (is(device_exposure_end_date, "subQuery")) paste0("(", as.character(device_exposure_end_date), ")") else paste0("'", as.character(device_exposure_end_date), "'"))
  }

  if (!missing(device_exposure_end_datetime)) {
    fields <- c(fields, "device_exposure_end_datetime")
    values <- c(values, if (is.null(device_exposure_end_datetime)) "NULL" else if (is(device_exposure_end_datetime, "subQuery")) paste0("(", as.character(device_exposure_end_datetime), ")") else paste0("'", as.character(device_exposure_end_datetime), "'"))
  }

  if (!missing(device_type_concept_id)) {
    fields <- c(fields, "device_type_concept_id")
    values <- c(values, if (is.null(device_type_concept_id)) "NULL" else if (is(device_type_concept_id, "subQuery")) paste0("(", as.character(device_type_concept_id), ")") else paste0("'", as.character(device_type_concept_id), "'"))
  }

  if (!missing(unique_device_id)) {
    fields <- c(fields, "unique_device_id")
    values <- c(values, if (is.null(unique_device_id)) "NULL" else if (is(unique_device_id, "subQuery")) paste0("(", as.character(unique_device_id), ")") else paste0("'", as.character(unique_device_id), "'"))
  }

  if (!missing(quantity)) {
    fields <- c(fields, "quantity")
    values <- c(values, if (is.null(quantity)) "NULL" else if (is(quantity, "subQuery")) paste0("(", as.character(quantity), ")") else paste0("'", as.character(quantity), "'"))
  }

  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    fields <- c(fields, "visit_occurrence_id")
    values <- c(values, if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  if (!missing(device_source_value)) {
    fields <- c(fields, "device_source_value")
    values <- c(values, if (is.null(device_source_value)) "NULL" else if (is(device_source_value, "subQuery")) paste0("(", as.character(device_source_value), ")") else paste0("'", as.character(device_source_value), "'"))
  }

  if (!missing(device_source__concept_id)) {
    fields <- c(fields, "[device_source_ concept_id]")
    values <- c(values, if (is.null(device_source__concept_id)) "NULL" else if (is(device_source__concept_id, "subQuery")) paste0("(", as.character(device_source__concept_id), ")") else paste0("'", as.character(device_source__concept_id), "'"))
  }

  if (!missing(visit_detail_id)) {
    fields <- c(fields, "visit_detail_id")
    values <- c(values, if (is.null(visit_detail_id)) "NULL" else if (is(visit_detail_id, "subQuery")) paste0("(", as.character(visit_detail_id), ")") else paste0("'", as.character(visit_detail_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 1, table = "device_exposure", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_no_drug_exposure <- function(drug_exposure_id, person_id, drug_concept_id, drug_exposure_start_date, drug_exposure_start_datetime, drug_exposure_end_date, drug_exposure_end_datetime, verbatim_end_date, drug_type_concept_id, stop_reason, refills, quantity, days_supply, sig, route_concept_id, lot_number, provider_id, visit_occurrence_id, drug_source_value, drug_source_concept_id, route_source_value, dose_unit_source_value, visit_detail_id) {
  fields <- c()
  values <- c()
  if (!missing(drug_exposure_id)) {
    fields <- c(fields, "drug_exposure_id")
    values <- c(values, if (is.null(drug_exposure_id)) "NULL" else if (is(drug_exposure_id, "subQuery")) paste0("(", as.character(drug_exposure_id), ")") else paste0("'", as.character(drug_exposure_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(drug_concept_id)) {
    fields <- c(fields, "drug_concept_id")
    values <- c(values, if (is.null(drug_concept_id)) "NULL" else if (is(drug_concept_id, "subQuery")) paste0("(", as.character(drug_concept_id), ")") else paste0("'", as.character(drug_concept_id), "'"))
  }

  if (!missing(drug_exposure_start_date)) {
    fields <- c(fields, "drug_exposure_start_date")
    values <- c(values, if (is.null(drug_exposure_start_date)) "NULL" else if (is(drug_exposure_start_date, "subQuery")) paste0("(", as.character(drug_exposure_start_date), ")") else paste0("'", as.character(drug_exposure_start_date), "'"))
  }

  if (!missing(drug_exposure_start_datetime)) {
    fields <- c(fields, "drug_exposure_start_datetime")
    values <- c(values, if (is.null(drug_exposure_start_datetime)) "NULL" else if (is(drug_exposure_start_datetime, "subQuery")) paste0("(", as.character(drug_exposure_start_datetime), ")") else paste0("'", as.character(drug_exposure_start_datetime), "'"))
  }

  if (!missing(drug_exposure_end_date)) {
    fields <- c(fields, "drug_exposure_end_date")
    values <- c(values, if (is.null(drug_exposure_end_date)) "NULL" else if (is(drug_exposure_end_date, "subQuery")) paste0("(", as.character(drug_exposure_end_date), ")") else paste0("'", as.character(drug_exposure_end_date), "'"))
  }

  if (!missing(drug_exposure_end_datetime)) {
    fields <- c(fields, "drug_exposure_end_datetime")
    values <- c(values, if (is.null(drug_exposure_end_datetime)) "NULL" else if (is(drug_exposure_end_datetime, "subQuery")) paste0("(", as.character(drug_exposure_end_datetime), ")") else paste0("'", as.character(drug_exposure_end_datetime), "'"))
  }

  if (!missing(verbatim_end_date)) {
    fields <- c(fields, "verbatim_end_date")
    values <- c(values, if (is.null(verbatim_end_date)) "NULL" else if (is(verbatim_end_date, "subQuery")) paste0("(", as.character(verbatim_end_date), ")") else paste0("'", as.character(verbatim_end_date), "'"))
  }

  if (!missing(drug_type_concept_id)) {
    fields <- c(fields, "drug_type_concept_id")
    values <- c(values, if (is.null(drug_type_concept_id)) "NULL" else if (is(drug_type_concept_id, "subQuery")) paste0("(", as.character(drug_type_concept_id), ")") else paste0("'", as.character(drug_type_concept_id), "'"))
  }

  if (!missing(stop_reason)) {
    fields <- c(fields, "stop_reason")
    values <- c(values, if (is.null(stop_reason)) "NULL" else if (is(stop_reason, "subQuery")) paste0("(", as.character(stop_reason), ")") else paste0("'", as.character(stop_reason), "'"))
  }

  if (!missing(refills)) {
    fields <- c(fields, "refills")
    values <- c(values, if (is.null(refills)) "NULL" else if (is(refills, "subQuery")) paste0("(", as.character(refills), ")") else paste0("'", as.character(refills), "'"))
  }

  if (!missing(quantity)) {
    fields <- c(fields, "quantity")
    values <- c(values, if (is.null(quantity)) "NULL" else if (is(quantity, "subQuery")) paste0("(", as.character(quantity), ")") else paste0("'", as.character(quantity), "'"))
  }

  if (!missing(days_supply)) {
    fields <- c(fields, "days_supply")
    values <- c(values, if (is.null(days_supply)) "NULL" else if (is(days_supply, "subQuery")) paste0("(", as.character(days_supply), ")") else paste0("'", as.character(days_supply), "'"))
  }

  if (!missing(sig)) {
    fields <- c(fields, "sig")
    values <- c(values, if (is.null(sig)) "NULL" else if (is(sig, "subQuery")) paste0("(", as.character(sig), ")") else paste0("'", as.character(sig), "'"))
  }

  if (!missing(route_concept_id)) {
    fields <- c(fields, "route_concept_id")
    values <- c(values, if (is.null(route_concept_id)) "NULL" else if (is(route_concept_id, "subQuery")) paste0("(", as.character(route_concept_id), ")") else paste0("'", as.character(route_concept_id), "'"))
  }

  if (!missing(lot_number)) {
    fields <- c(fields, "lot_number")
    values <- c(values, if (is.null(lot_number)) "NULL" else if (is(lot_number, "subQuery")) paste0("(", as.character(lot_number), ")") else paste0("'", as.character(lot_number), "'"))
  }

  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    fields <- c(fields, "visit_occurrence_id")
    values <- c(values, if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  if (!missing(drug_source_value)) {
    fields <- c(fields, "drug_source_value")
    values <- c(values, if (is.null(drug_source_value)) "NULL" else if (is(drug_source_value, "subQuery")) paste0("(", as.character(drug_source_value), ")") else paste0("'", as.character(drug_source_value), "'"))
  }

  if (!missing(drug_source_concept_id)) {
    fields <- c(fields, "drug_source_concept_id")
    values <- c(values, if (is.null(drug_source_concept_id)) "NULL" else if (is(drug_source_concept_id, "subQuery")) paste0("(", as.character(drug_source_concept_id), ")") else paste0("'", as.character(drug_source_concept_id), "'"))
  }

  if (!missing(route_source_value)) {
    fields <- c(fields, "route_source_value")
    values <- c(values, if (is.null(route_source_value)) "NULL" else if (is(route_source_value, "subQuery")) paste0("(", as.character(route_source_value), ")") else paste0("'", as.character(route_source_value), "'"))
  }

  if (!missing(dose_unit_source_value)) {
    fields <- c(fields, "dose_unit_source_value")
    values <- c(values, if (is.null(dose_unit_source_value)) "NULL" else if (is(dose_unit_source_value, "subQuery")) paste0("(", as.character(dose_unit_source_value), ")") else paste0("'", as.character(dose_unit_source_value), "'"))
  }

  if (!missing(visit_detail_id)) {
    fields <- c(fields, "visit_detail_id")
    values <- c(values, if (is.null(visit_detail_id)) "NULL" else if (is(visit_detail_id, "subQuery")) paste0("(", as.character(visit_detail_id), ")") else paste0("'", as.character(visit_detail_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 1, table = "drug_exposure", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_no_fact_relationship <- function(domain_concept_id_1, fact_id_1, domain_concept_id_2, fact_id_2, relationship_concept_id) {
  fields <- c()
  values <- c()
  if (!missing(domain_concept_id_1)) {
    fields <- c(fields, "domain_concept_id_1")
    values <- c(values, if (is.null(domain_concept_id_1)) "NULL" else if (is(domain_concept_id_1, "subQuery")) paste0("(", as.character(domain_concept_id_1), ")") else paste0("'", as.character(domain_concept_id_1), "'"))
  }

  if (!missing(fact_id_1)) {
    fields <- c(fields, "fact_id_1")
    values <- c(values, if (is.null(fact_id_1)) "NULL" else if (is(fact_id_1, "subQuery")) paste0("(", as.character(fact_id_1), ")") else paste0("'", as.character(fact_id_1), "'"))
  }

  if (!missing(domain_concept_id_2)) {
    fields <- c(fields, "domain_concept_id_2")
    values <- c(values, if (is.null(domain_concept_id_2)) "NULL" else if (is(domain_concept_id_2, "subQuery")) paste0("(", as.character(domain_concept_id_2), ")") else paste0("'", as.character(domain_concept_id_2), "'"))
  }

  if (!missing(fact_id_2)) {
    fields <- c(fields, "fact_id_2")
    values <- c(values, if (is.null(fact_id_2)) "NULL" else if (is(fact_id_2, "subQuery")) paste0("(", as.character(fact_id_2), ")") else paste0("'", as.character(fact_id_2), "'"))
  }

  if (!missing(relationship_concept_id)) {
    fields <- c(fields, "relationship_concept_id")
    values <- c(values, if (is.null(relationship_concept_id)) "NULL" else if (is(relationship_concept_id, "subQuery")) paste0("(", as.character(relationship_concept_id), ")") else paste0("'", as.character(relationship_concept_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 1, table = "fact_relationship", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_no_measurement <- function(measurement_id, person_id, measurement_concept_id, measurement_date, measurement_datetime, measurement_type_concept_id, operator_concept_id, value_as_number, value_as_concept_id, unit_concept_id, range_low, range_high, provider_id, visit_occurrence_id, visit_detail_id, measurement_source_value, measurement_source_concept_id, unit_source_value, value_source_value) {
  fields <- c()
  values <- c()
  if (!missing(measurement_id)) {
    fields <- c(fields, "measurement_id")
    values <- c(values, if (is.null(measurement_id)) "NULL" else if (is(measurement_id, "subQuery")) paste0("(", as.character(measurement_id), ")") else paste0("'", as.character(measurement_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(measurement_concept_id)) {
    fields <- c(fields, "measurement_concept_id")
    values <- c(values, if (is.null(measurement_concept_id)) "NULL" else if (is(measurement_concept_id, "subQuery")) paste0("(", as.character(measurement_concept_id), ")") else paste0("'", as.character(measurement_concept_id), "'"))
  }

  if (!missing(measurement_date)) {
    fields <- c(fields, "measurement_date")
    values <- c(values, if (is.null(measurement_date)) "NULL" else if (is(measurement_date, "subQuery")) paste0("(", as.character(measurement_date), ")") else paste0("'", as.character(measurement_date), "'"))
  }

  if (!missing(measurement_datetime)) {
    fields <- c(fields, "measurement_datetime")
    values <- c(values, if (is.null(measurement_datetime)) "NULL" else if (is(measurement_datetime, "subQuery")) paste0("(", as.character(measurement_datetime), ")") else paste0("'", as.character(measurement_datetime), "'"))
  }

  if (!missing(measurement_type_concept_id)) {
    fields <- c(fields, "measurement_type_concept_id")
    values <- c(values, if (is.null(measurement_type_concept_id)) "NULL" else if (is(measurement_type_concept_id, "subQuery")) paste0("(", as.character(measurement_type_concept_id), ")") else paste0("'", as.character(measurement_type_concept_id), "'"))
  }

  if (!missing(operator_concept_id)) {
    fields <- c(fields, "operator_concept_id")
    values <- c(values, if (is.null(operator_concept_id)) "NULL" else if (is(operator_concept_id, "subQuery")) paste0("(", as.character(operator_concept_id), ")") else paste0("'", as.character(operator_concept_id), "'"))
  }

  if (!missing(value_as_number)) {
    fields <- c(fields, "value_as_number")
    values <- c(values, if (is.null(value_as_number)) "NULL" else if (is(value_as_number, "subQuery")) paste0("(", as.character(value_as_number), ")") else paste0("'", as.character(value_as_number), "'"))
  }

  if (!missing(value_as_concept_id)) {
    fields <- c(fields, "value_as_concept_id")
    values <- c(values, if (is.null(value_as_concept_id)) "NULL" else if (is(value_as_concept_id, "subQuery")) paste0("(", as.character(value_as_concept_id), ")") else paste0("'", as.character(value_as_concept_id), "'"))
  }

  if (!missing(unit_concept_id)) {
    fields <- c(fields, "unit_concept_id")
    values <- c(values, if (is.null(unit_concept_id)) "NULL" else if (is(unit_concept_id, "subQuery")) paste0("(", as.character(unit_concept_id), ")") else paste0("'", as.character(unit_concept_id), "'"))
  }

  if (!missing(range_low)) {
    fields <- c(fields, "range_low")
    values <- c(values, if (is.null(range_low)) "NULL" else if (is(range_low, "subQuery")) paste0("(", as.character(range_low), ")") else paste0("'", as.character(range_low), "'"))
  }

  if (!missing(range_high)) {
    fields <- c(fields, "range_high")
    values <- c(values, if (is.null(range_high)) "NULL" else if (is(range_high, "subQuery")) paste0("(", as.character(range_high), ")") else paste0("'", as.character(range_high), "'"))
  }

  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    fields <- c(fields, "visit_occurrence_id")
    values <- c(values, if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  if (!missing(visit_detail_id)) {
    fields <- c(fields, "visit_detail_id")
    values <- c(values, if (is.null(visit_detail_id)) "NULL" else if (is(visit_detail_id, "subQuery")) paste0("(", as.character(visit_detail_id), ")") else paste0("'", as.character(visit_detail_id), "'"))
  }

  if (!missing(measurement_source_value)) {
    fields <- c(fields, "measurement_source_value")
    values <- c(values, if (is.null(measurement_source_value)) "NULL" else if (is(measurement_source_value, "subQuery")) paste0("(", as.character(measurement_source_value), ")") else paste0("'", as.character(measurement_source_value), "'"))
  }

  if (!missing(measurement_source_concept_id)) {
    fields <- c(fields, "measurement_source_concept_id")
    values <- c(values, if (is.null(measurement_source_concept_id)) "NULL" else if (is(measurement_source_concept_id, "subQuery")) paste0("(", as.character(measurement_source_concept_id), ")") else paste0("'", as.character(measurement_source_concept_id), "'"))
  }

  if (!missing(unit_source_value)) {
    fields <- c(fields, "unit_source_value")
    values <- c(values, if (is.null(unit_source_value)) "NULL" else if (is(unit_source_value, "subQuery")) paste0("(", as.character(unit_source_value), ")") else paste0("'", as.character(unit_source_value), "'"))
  }

  if (!missing(value_source_value)) {
    fields <- c(fields, "value_source_value")
    values <- c(values, if (is.null(value_source_value)) "NULL" else if (is(value_source_value, "subQuery")) paste0("(", as.character(value_source_value), ")") else paste0("'", as.character(value_source_value), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 1, table = "measurement", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_no_note <- function(note_id, person_id, note_date, note_datetime, note_type_concept_id, note_class_concept_id, note_title, note_text, encoding_concept_id, language_concept_id, provider_id, note_source_value, visit_occurrence_id) {
  fields <- c()
  values <- c()
  if (!missing(note_id)) {
    fields <- c(fields, "note_id")
    values <- c(values, if (is.null(note_id)) "NULL" else if (is(note_id, "subQuery")) paste0("(", as.character(note_id), ")") else paste0("'", as.character(note_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(note_date)) {
    fields <- c(fields, "note_date")
    values <- c(values, if (is.null(note_date)) "NULL" else if (is(note_date, "subQuery")) paste0("(", as.character(note_date), ")") else paste0("'", as.character(note_date), "'"))
  }

  if (!missing(note_datetime)) {
    fields <- c(fields, "note_datetime")
    values <- c(values, if (is.null(note_datetime)) "NULL" else if (is(note_datetime, "subQuery")) paste0("(", as.character(note_datetime), ")") else paste0("'", as.character(note_datetime), "'"))
  }

  if (!missing(note_type_concept_id)) {
    fields <- c(fields, "note_type_concept_id")
    values <- c(values, if (is.null(note_type_concept_id)) "NULL" else if (is(note_type_concept_id, "subQuery")) paste0("(", as.character(note_type_concept_id), ")") else paste0("'", as.character(note_type_concept_id), "'"))
  }

  if (!missing(note_class_concept_id)) {
    fields <- c(fields, "note_class_concept_id")
    values <- c(values, if (is.null(note_class_concept_id)) "NULL" else if (is(note_class_concept_id, "subQuery")) paste0("(", as.character(note_class_concept_id), ")") else paste0("'", as.character(note_class_concept_id), "'"))
  }

  if (!missing(note_title)) {
    fields <- c(fields, "note_title")
    values <- c(values, if (is.null(note_title)) "NULL" else if (is(note_title, "subQuery")) paste0("(", as.character(note_title), ")") else paste0("'", as.character(note_title), "'"))
  }

  if (!missing(note_text)) {
    fields <- c(fields, "note_text")
    values <- c(values, if (is.null(note_text)) "NULL" else if (is(note_text, "subQuery")) paste0("(", as.character(note_text), ")") else paste0("'", as.character(note_text), "'"))
  }

  if (!missing(encoding_concept_id)) {
    fields <- c(fields, "encoding_concept_id")
    values <- c(values, if (is.null(encoding_concept_id)) "NULL" else if (is(encoding_concept_id, "subQuery")) paste0("(", as.character(encoding_concept_id), ")") else paste0("'", as.character(encoding_concept_id), "'"))
  }

  if (!missing(language_concept_id)) {
    fields <- c(fields, "language_concept_id")
    values <- c(values, if (is.null(language_concept_id)) "NULL" else if (is(language_concept_id, "subQuery")) paste0("(", as.character(language_concept_id), ")") else paste0("'", as.character(language_concept_id), "'"))
  }

  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(note_source_value)) {
    fields <- c(fields, "note_source_value")
    values <- c(values, if (is.null(note_source_value)) "NULL" else if (is(note_source_value, "subQuery")) paste0("(", as.character(note_source_value), ")") else paste0("'", as.character(note_source_value), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    fields <- c(fields, "visit_occurrence_id")
    values <- c(values, if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 1, table = "note", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_no_note_nlp <- function(note_nlp_id, note_id, section_concept_id, snippet, offset, lexical_variant, note_nlp_concept_id, note_nlp_source_concept_id, nlp_system, nlp_date, nlp_date_time, term_exists, term_temporal, term_modifiers) {
  fields <- c()
  values <- c()
  if (!missing(note_nlp_id)) {
    fields <- c(fields, "note_nlp_id")
    values <- c(values, if (is.null(note_nlp_id)) "NULL" else if (is(note_nlp_id, "subQuery")) paste0("(", as.character(note_nlp_id), ")") else paste0("'", as.character(note_nlp_id), "'"))
  }

  if (!missing(note_id)) {
    fields <- c(fields, "note_id")
    values <- c(values, if (is.null(note_id)) "NULL" else if (is(note_id, "subQuery")) paste0("(", as.character(note_id), ")") else paste0("'", as.character(note_id), "'"))
  }

  if (!missing(section_concept_id)) {
    fields <- c(fields, "section_concept_id")
    values <- c(values, if (is.null(section_concept_id)) "NULL" else if (is(section_concept_id, "subQuery")) paste0("(", as.character(section_concept_id), ")") else paste0("'", as.character(section_concept_id), "'"))
  }

  if (!missing(snippet)) {
    fields <- c(fields, "snippet")
    values <- c(values, if (is.null(snippet)) "NULL" else if (is(snippet, "subQuery")) paste0("(", as.character(snippet), ")") else paste0("'", as.character(snippet), "'"))
  }

  if (!missing(offset)) {
    fields <- c(fields, "offset")
    values <- c(values, if (is.null(offset)) "NULL" else if (is(offset, "subQuery")) paste0("(", as.character(offset), ")") else paste0("'", as.character(offset), "'"))
  }

  if (!missing(lexical_variant)) {
    fields <- c(fields, "lexical_variant")
    values <- c(values, if (is.null(lexical_variant)) "NULL" else if (is(lexical_variant, "subQuery")) paste0("(", as.character(lexical_variant), ")") else paste0("'", as.character(lexical_variant), "'"))
  }

  if (!missing(note_nlp_concept_id)) {
    fields <- c(fields, "note_nlp_concept_id")
    values <- c(values, if (is.null(note_nlp_concept_id)) "NULL" else if (is(note_nlp_concept_id, "subQuery")) paste0("(", as.character(note_nlp_concept_id), ")") else paste0("'", as.character(note_nlp_concept_id), "'"))
  }

  if (!missing(note_nlp_source_concept_id)) {
    fields <- c(fields, "note_nlp_source_concept_id")
    values <- c(values, if (is.null(note_nlp_source_concept_id)) "NULL" else if (is(note_nlp_source_concept_id, "subQuery")) paste0("(", as.character(note_nlp_source_concept_id), ")") else paste0("'", as.character(note_nlp_source_concept_id), "'"))
  }

  if (!missing(nlp_system)) {
    fields <- c(fields, "nlp_system")
    values <- c(values, if (is.null(nlp_system)) "NULL" else if (is(nlp_system, "subQuery")) paste0("(", as.character(nlp_system), ")") else paste0("'", as.character(nlp_system), "'"))
  }

  if (!missing(nlp_date)) {
    fields <- c(fields, "nlp_date")
    values <- c(values, if (is.null(nlp_date)) "NULL" else if (is(nlp_date, "subQuery")) paste0("(", as.character(nlp_date), ")") else paste0("'", as.character(nlp_date), "'"))
  }

  if (!missing(nlp_date_time)) {
    fields <- c(fields, "nlp_date_time")
    values <- c(values, if (is.null(nlp_date_time)) "NULL" else if (is(nlp_date_time, "subQuery")) paste0("(", as.character(nlp_date_time), ")") else paste0("'", as.character(nlp_date_time), "'"))
  }

  if (!missing(term_exists)) {
    fields <- c(fields, "term_exists")
    values <- c(values, if (is.null(term_exists)) "NULL" else if (is(term_exists, "subQuery")) paste0("(", as.character(term_exists), ")") else paste0("'", as.character(term_exists), "'"))
  }

  if (!missing(term_temporal)) {
    fields <- c(fields, "term_temporal")
    values <- c(values, if (is.null(term_temporal)) "NULL" else if (is(term_temporal, "subQuery")) paste0("(", as.character(term_temporal), ")") else paste0("'", as.character(term_temporal), "'"))
  }

  if (!missing(term_modifiers)) {
    fields <- c(fields, "term_modifiers")
    values <- c(values, if (is.null(term_modifiers)) "NULL" else if (is(term_modifiers, "subQuery")) paste0("(", as.character(term_modifiers), ")") else paste0("'", as.character(term_modifiers), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 1, table = "note_nlp", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_no_observation <- function(observation_id, person_id, observation_concept_id, observation_date, observation_datetime, observation_type_concept_id, value_as_number, value_as_string, value_as_concept_id, qualifier_concept_id, unit_concept_id, provider_id, visit_occurrence_id, visit_detail_id, observation_source_value, observation_source_concept_id, unit_source_value, qualifier_source_value) {
  fields <- c()
  values <- c()
  if (!missing(observation_id)) {
    fields <- c(fields, "observation_id")
    values <- c(values, if (is.null(observation_id)) "NULL" else if (is(observation_id, "subQuery")) paste0("(", as.character(observation_id), ")") else paste0("'", as.character(observation_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(observation_concept_id)) {
    fields <- c(fields, "observation_concept_id")
    values <- c(values, if (is.null(observation_concept_id)) "NULL" else if (is(observation_concept_id, "subQuery")) paste0("(", as.character(observation_concept_id), ")") else paste0("'", as.character(observation_concept_id), "'"))
  }

  if (!missing(observation_date)) {
    fields <- c(fields, "observation_date")
    values <- c(values, if (is.null(observation_date)) "NULL" else if (is(observation_date, "subQuery")) paste0("(", as.character(observation_date), ")") else paste0("'", as.character(observation_date), "'"))
  }

  if (!missing(observation_datetime)) {
    fields <- c(fields, "observation_datetime")
    values <- c(values, if (is.null(observation_datetime)) "NULL" else if (is(observation_datetime, "subQuery")) paste0("(", as.character(observation_datetime), ")") else paste0("'", as.character(observation_datetime), "'"))
  }

  if (!missing(observation_type_concept_id)) {
    fields <- c(fields, "observation_type_concept_id")
    values <- c(values, if (is.null(observation_type_concept_id)) "NULL" else if (is(observation_type_concept_id, "subQuery")) paste0("(", as.character(observation_type_concept_id), ")") else paste0("'", as.character(observation_type_concept_id), "'"))
  }

  if (!missing(value_as_number)) {
    fields <- c(fields, "value_as_number")
    values <- c(values, if (is.null(value_as_number)) "NULL" else if (is(value_as_number, "subQuery")) paste0("(", as.character(value_as_number), ")") else paste0("'", as.character(value_as_number), "'"))
  }

  if (!missing(value_as_string)) {
    fields <- c(fields, "value_as_string")
    values <- c(values, if (is.null(value_as_string)) "NULL" else if (is(value_as_string, "subQuery")) paste0("(", as.character(value_as_string), ")") else paste0("'", as.character(value_as_string), "'"))
  }

  if (!missing(value_as_concept_id)) {
    fields <- c(fields, "value_as_concept_id")
    values <- c(values, if (is.null(value_as_concept_id)) "NULL" else if (is(value_as_concept_id, "subQuery")) paste0("(", as.character(value_as_concept_id), ")") else paste0("'", as.character(value_as_concept_id), "'"))
  }

  if (!missing(qualifier_concept_id)) {
    fields <- c(fields, "qualifier_concept_id")
    values <- c(values, if (is.null(qualifier_concept_id)) "NULL" else if (is(qualifier_concept_id, "subQuery")) paste0("(", as.character(qualifier_concept_id), ")") else paste0("'", as.character(qualifier_concept_id), "'"))
  }

  if (!missing(unit_concept_id)) {
    fields <- c(fields, "unit_concept_id")
    values <- c(values, if (is.null(unit_concept_id)) "NULL" else if (is(unit_concept_id, "subQuery")) paste0("(", as.character(unit_concept_id), ")") else paste0("'", as.character(unit_concept_id), "'"))
  }

  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    fields <- c(fields, "visit_occurrence_id")
    values <- c(values, if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  if (!missing(visit_detail_id)) {
    fields <- c(fields, "visit_detail_id")
    values <- c(values, if (is.null(visit_detail_id)) "NULL" else if (is(visit_detail_id, "subQuery")) paste0("(", as.character(visit_detail_id), ")") else paste0("'", as.character(visit_detail_id), "'"))
  }

  if (!missing(observation_source_value)) {
    fields <- c(fields, "observation_source_value")
    values <- c(values, if (is.null(observation_source_value)) "NULL" else if (is(observation_source_value, "subQuery")) paste0("(", as.character(observation_source_value), ")") else paste0("'", as.character(observation_source_value), "'"))
  }

  if (!missing(observation_source_concept_id)) {
    fields <- c(fields, "observation_source_concept_id")
    values <- c(values, if (is.null(observation_source_concept_id)) "NULL" else if (is(observation_source_concept_id, "subQuery")) paste0("(", as.character(observation_source_concept_id), ")") else paste0("'", as.character(observation_source_concept_id), "'"))
  }

  if (!missing(unit_source_value)) {
    fields <- c(fields, "unit_source_value")
    values <- c(values, if (is.null(unit_source_value)) "NULL" else if (is(unit_source_value, "subQuery")) paste0("(", as.character(unit_source_value), ")") else paste0("'", as.character(unit_source_value), "'"))
  }

  if (!missing(qualifier_source_value)) {
    fields <- c(fields, "qualifier_source_value")
    values <- c(values, if (is.null(qualifier_source_value)) "NULL" else if (is(qualifier_source_value, "subQuery")) paste0("(", as.character(qualifier_source_value), ")") else paste0("'", as.character(qualifier_source_value), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 1, table = "observation", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_no_observation_period <- function(observation_period_id, person_id, observation_period_start_date, observation_period_end_date, period_type_concept_id) {
  fields <- c()
  values <- c()
  if (!missing(observation_period_id)) {
    fields <- c(fields, "observation_period_id")
    values <- c(values, if (is.null(observation_period_id)) "NULL" else if (is(observation_period_id, "subQuery")) paste0("(", as.character(observation_period_id), ")") else paste0("'", as.character(observation_period_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(observation_period_start_date)) {
    fields <- c(fields, "observation_period_start_date")
    values <- c(values, if (is.null(observation_period_start_date)) "NULL" else if (is(observation_period_start_date, "subQuery")) paste0("(", as.character(observation_period_start_date), ")") else paste0("'", as.character(observation_period_start_date), "'"))
  }

  if (!missing(observation_period_end_date)) {
    fields <- c(fields, "observation_period_end_date")
    values <- c(values, if (is.null(observation_period_end_date)) "NULL" else if (is(observation_period_end_date, "subQuery")) paste0("(", as.character(observation_period_end_date), ")") else paste0("'", as.character(observation_period_end_date), "'"))
  }

  if (!missing(period_type_concept_id)) {
    fields <- c(fields, "period_type_concept_id")
    values <- c(values, if (is.null(period_type_concept_id)) "NULL" else if (is(period_type_concept_id, "subQuery")) paste0("(", as.character(period_type_concept_id), ")") else paste0("'", as.character(period_type_concept_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 1, table = "observation_period", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_no_person <- function(person_id, gender_concept_id, year_of_birth, month_of_birth, day_of_birth, birth_datetime, race_concept_id, ethnicity_concept_id, location_id, provider_id, care_site_id, person_source_value, gender_source_value, gender_source_concept_id, race_source_value, race_source_concept_id, ethnicity_source_value, ethnicity_source_concept_id) {
  fields <- c()
  values <- c()
  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(gender_concept_id)) {
    fields <- c(fields, "gender_concept_id")
    values <- c(values, if (is.null(gender_concept_id)) "NULL" else if (is(gender_concept_id, "subQuery")) paste0("(", as.character(gender_concept_id), ")") else paste0("'", as.character(gender_concept_id), "'"))
  }

  if (!missing(year_of_birth)) {
    fields <- c(fields, "year_of_birth")
    values <- c(values, if (is.null(year_of_birth)) "NULL" else if (is(year_of_birth, "subQuery")) paste0("(", as.character(year_of_birth), ")") else paste0("'", as.character(year_of_birth), "'"))
  }

  if (!missing(month_of_birth)) {
    fields <- c(fields, "month_of_birth")
    values <- c(values, if (is.null(month_of_birth)) "NULL" else if (is(month_of_birth, "subQuery")) paste0("(", as.character(month_of_birth), ")") else paste0("'", as.character(month_of_birth), "'"))
  }

  if (!missing(day_of_birth)) {
    fields <- c(fields, "day_of_birth")
    values <- c(values, if (is.null(day_of_birth)) "NULL" else if (is(day_of_birth, "subQuery")) paste0("(", as.character(day_of_birth), ")") else paste0("'", as.character(day_of_birth), "'"))
  }

  if (!missing(birth_datetime)) {
    fields <- c(fields, "birth_datetime")
    values <- c(values, if (is.null(birth_datetime)) "NULL" else if (is(birth_datetime, "subQuery")) paste0("(", as.character(birth_datetime), ")") else paste0("'", as.character(birth_datetime), "'"))
  }

  if (!missing(race_concept_id)) {
    fields <- c(fields, "race_concept_id")
    values <- c(values, if (is.null(race_concept_id)) "NULL" else if (is(race_concept_id, "subQuery")) paste0("(", as.character(race_concept_id), ")") else paste0("'", as.character(race_concept_id), "'"))
  }

  if (!missing(ethnicity_concept_id)) {
    fields <- c(fields, "ethnicity_concept_id")
    values <- c(values, if (is.null(ethnicity_concept_id)) "NULL" else if (is(ethnicity_concept_id, "subQuery")) paste0("(", as.character(ethnicity_concept_id), ")") else paste0("'", as.character(ethnicity_concept_id), "'"))
  }

  if (!missing(location_id)) {
    fields <- c(fields, "location_id")
    values <- c(values, if (is.null(location_id)) "NULL" else if (is(location_id, "subQuery")) paste0("(", as.character(location_id), ")") else paste0("'", as.character(location_id), "'"))
  }

  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(care_site_id)) {
    fields <- c(fields, "care_site_id")
    values <- c(values, if (is.null(care_site_id)) "NULL" else if (is(care_site_id, "subQuery")) paste0("(", as.character(care_site_id), ")") else paste0("'", as.character(care_site_id), "'"))
  }

  if (!missing(person_source_value)) {
    fields <- c(fields, "person_source_value")
    values <- c(values, if (is.null(person_source_value)) "NULL" else if (is(person_source_value, "subQuery")) paste0("(", as.character(person_source_value), ")") else paste0("'", as.character(person_source_value), "'"))
  }

  if (!missing(gender_source_value)) {
    fields <- c(fields, "gender_source_value")
    values <- c(values, if (is.null(gender_source_value)) "NULL" else if (is(gender_source_value, "subQuery")) paste0("(", as.character(gender_source_value), ")") else paste0("'", as.character(gender_source_value), "'"))
  }

  if (!missing(gender_source_concept_id)) {
    fields <- c(fields, "gender_source_concept_id")
    values <- c(values, if (is.null(gender_source_concept_id)) "NULL" else if (is(gender_source_concept_id, "subQuery")) paste0("(", as.character(gender_source_concept_id), ")") else paste0("'", as.character(gender_source_concept_id), "'"))
  }

  if (!missing(race_source_value)) {
    fields <- c(fields, "race_source_value")
    values <- c(values, if (is.null(race_source_value)) "NULL" else if (is(race_source_value, "subQuery")) paste0("(", as.character(race_source_value), ")") else paste0("'", as.character(race_source_value), "'"))
  }

  if (!missing(race_source_concept_id)) {
    fields <- c(fields, "race_source_concept_id")
    values <- c(values, if (is.null(race_source_concept_id)) "NULL" else if (is(race_source_concept_id, "subQuery")) paste0("(", as.character(race_source_concept_id), ")") else paste0("'", as.character(race_source_concept_id), "'"))
  }

  if (!missing(ethnicity_source_value)) {
    fields <- c(fields, "ethnicity_source_value")
    values <- c(values, if (is.null(ethnicity_source_value)) "NULL" else if (is(ethnicity_source_value, "subQuery")) paste0("(", as.character(ethnicity_source_value), ")") else paste0("'", as.character(ethnicity_source_value), "'"))
  }

  if (!missing(ethnicity_source_concept_id)) {
    fields <- c(fields, "ethnicity_source_concept_id")
    values <- c(values, if (is.null(ethnicity_source_concept_id)) "NULL" else if (is(ethnicity_source_concept_id, "subQuery")) paste0("(", as.character(ethnicity_source_concept_id), ")") else paste0("'", as.character(ethnicity_source_concept_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 1, table = "person", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_no_procedure_occurrence <- function(procedure_occurrence_id, person_id, procedure_concept_id, procedure_date, procedure_datetime, procedure_type_concept_id, modifier_concept_id, quantity, provider_id, visit_occurrence_id, procedure_source_value, procedure_source_concept_id, qualifier_source_value, visit_detail_id) {
  fields <- c()
  values <- c()
  if (!missing(procedure_occurrence_id)) {
    fields <- c(fields, "procedure_occurrence_id")
    values <- c(values, if (is.null(procedure_occurrence_id)) "NULL" else if (is(procedure_occurrence_id, "subQuery")) paste0("(", as.character(procedure_occurrence_id), ")") else paste0("'", as.character(procedure_occurrence_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(procedure_concept_id)) {
    fields <- c(fields, "procedure_concept_id")
    values <- c(values, if (is.null(procedure_concept_id)) "NULL" else if (is(procedure_concept_id, "subQuery")) paste0("(", as.character(procedure_concept_id), ")") else paste0("'", as.character(procedure_concept_id), "'"))
  }

  if (!missing(procedure_date)) {
    fields <- c(fields, "procedure_date")
    values <- c(values, if (is.null(procedure_date)) "NULL" else if (is(procedure_date, "subQuery")) paste0("(", as.character(procedure_date), ")") else paste0("'", as.character(procedure_date), "'"))
  }

  if (!missing(procedure_datetime)) {
    fields <- c(fields, "procedure_datetime")
    values <- c(values, if (is.null(procedure_datetime)) "NULL" else if (is(procedure_datetime, "subQuery")) paste0("(", as.character(procedure_datetime), ")") else paste0("'", as.character(procedure_datetime), "'"))
  }

  if (!missing(procedure_type_concept_id)) {
    fields <- c(fields, "procedure_type_concept_id")
    values <- c(values, if (is.null(procedure_type_concept_id)) "NULL" else if (is(procedure_type_concept_id, "subQuery")) paste0("(", as.character(procedure_type_concept_id), ")") else paste0("'", as.character(procedure_type_concept_id), "'"))
  }

  if (!missing(modifier_concept_id)) {
    fields <- c(fields, "modifier_concept_id")
    values <- c(values, if (is.null(modifier_concept_id)) "NULL" else if (is(modifier_concept_id, "subQuery")) paste0("(", as.character(modifier_concept_id), ")") else paste0("'", as.character(modifier_concept_id), "'"))
  }

  if (!missing(quantity)) {
    fields <- c(fields, "quantity")
    values <- c(values, if (is.null(quantity)) "NULL" else if (is(quantity, "subQuery")) paste0("(", as.character(quantity), ")") else paste0("'", as.character(quantity), "'"))
  }

  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    fields <- c(fields, "visit_occurrence_id")
    values <- c(values, if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  if (!missing(procedure_source_value)) {
    fields <- c(fields, "procedure_source_value")
    values <- c(values, if (is.null(procedure_source_value)) "NULL" else if (is(procedure_source_value, "subQuery")) paste0("(", as.character(procedure_source_value), ")") else paste0("'", as.character(procedure_source_value), "'"))
  }

  if (!missing(procedure_source_concept_id)) {
    fields <- c(fields, "procedure_source_concept_id")
    values <- c(values, if (is.null(procedure_source_concept_id)) "NULL" else if (is(procedure_source_concept_id, "subQuery")) paste0("(", as.character(procedure_source_concept_id), ")") else paste0("'", as.character(procedure_source_concept_id), "'"))
  }

  if (!missing(qualifier_source_value)) {
    fields <- c(fields, "qualifier_source_value")
    values <- c(values, if (is.null(qualifier_source_value)) "NULL" else if (is(qualifier_source_value, "subQuery")) paste0("(", as.character(qualifier_source_value), ")") else paste0("'", as.character(qualifier_source_value), "'"))
  }

  if (!missing(visit_detail_id)) {
    fields <- c(fields, "visit_detail_id")
    values <- c(values, if (is.null(visit_detail_id)) "NULL" else if (is(visit_detail_id, "subQuery")) paste0("(", as.character(visit_detail_id), ")") else paste0("'", as.character(visit_detail_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 1, table = "procedure_occurrence", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_no_specimen <- function(specimen_id, person_id, specimen_concept_id, specimen_type_concept_id, specimen_date, specimen_datetime, quantity, unit_concept_id, anatomic_site_concept_id, disease_status_concept_id, specimen_source_id, specimen_source_value, unit_source_value, anatomic_site_source_value, disease_status_source_value) {
  fields <- c()
  values <- c()
  if (!missing(specimen_id)) {
    fields <- c(fields, "specimen_id")
    values <- c(values, if (is.null(specimen_id)) "NULL" else if (is(specimen_id, "subQuery")) paste0("(", as.character(specimen_id), ")") else paste0("'", as.character(specimen_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(specimen_concept_id)) {
    fields <- c(fields, "specimen_concept_id")
    values <- c(values, if (is.null(specimen_concept_id)) "NULL" else if (is(specimen_concept_id, "subQuery")) paste0("(", as.character(specimen_concept_id), ")") else paste0("'", as.character(specimen_concept_id), "'"))
  }

  if (!missing(specimen_type_concept_id)) {
    fields <- c(fields, "specimen_type_concept_id")
    values <- c(values, if (is.null(specimen_type_concept_id)) "NULL" else if (is(specimen_type_concept_id, "subQuery")) paste0("(", as.character(specimen_type_concept_id), ")") else paste0("'", as.character(specimen_type_concept_id), "'"))
  }

  if (!missing(specimen_date)) {
    fields <- c(fields, "specimen_date")
    values <- c(values, if (is.null(specimen_date)) "NULL" else if (is(specimen_date, "subQuery")) paste0("(", as.character(specimen_date), ")") else paste0("'", as.character(specimen_date), "'"))
  }

  if (!missing(specimen_datetime)) {
    fields <- c(fields, "specimen_datetime")
    values <- c(values, if (is.null(specimen_datetime)) "NULL" else if (is(specimen_datetime, "subQuery")) paste0("(", as.character(specimen_datetime), ")") else paste0("'", as.character(specimen_datetime), "'"))
  }

  if (!missing(quantity)) {
    fields <- c(fields, "quantity")
    values <- c(values, if (is.null(quantity)) "NULL" else if (is(quantity, "subQuery")) paste0("(", as.character(quantity), ")") else paste0("'", as.character(quantity), "'"))
  }

  if (!missing(unit_concept_id)) {
    fields <- c(fields, "unit_concept_id")
    values <- c(values, if (is.null(unit_concept_id)) "NULL" else if (is(unit_concept_id, "subQuery")) paste0("(", as.character(unit_concept_id), ")") else paste0("'", as.character(unit_concept_id), "'"))
  }

  if (!missing(anatomic_site_concept_id)) {
    fields <- c(fields, "anatomic_site_concept_id")
    values <- c(values, if (is.null(anatomic_site_concept_id)) "NULL" else if (is(anatomic_site_concept_id, "subQuery")) paste0("(", as.character(anatomic_site_concept_id), ")") else paste0("'", as.character(anatomic_site_concept_id), "'"))
  }

  if (!missing(disease_status_concept_id)) {
    fields <- c(fields, "disease_status_concept_id")
    values <- c(values, if (is.null(disease_status_concept_id)) "NULL" else if (is(disease_status_concept_id, "subQuery")) paste0("(", as.character(disease_status_concept_id), ")") else paste0("'", as.character(disease_status_concept_id), "'"))
  }

  if (!missing(specimen_source_id)) {
    fields <- c(fields, "specimen_source_id")
    values <- c(values, if (is.null(specimen_source_id)) "NULL" else if (is(specimen_source_id, "subQuery")) paste0("(", as.character(specimen_source_id), ")") else paste0("'", as.character(specimen_source_id), "'"))
  }

  if (!missing(specimen_source_value)) {
    fields <- c(fields, "specimen_source_value")
    values <- c(values, if (is.null(specimen_source_value)) "NULL" else if (is(specimen_source_value, "subQuery")) paste0("(", as.character(specimen_source_value), ")") else paste0("'", as.character(specimen_source_value), "'"))
  }

  if (!missing(unit_source_value)) {
    fields <- c(fields, "unit_source_value")
    values <- c(values, if (is.null(unit_source_value)) "NULL" else if (is(unit_source_value, "subQuery")) paste0("(", as.character(unit_source_value), ")") else paste0("'", as.character(unit_source_value), "'"))
  }

  if (!missing(anatomic_site_source_value)) {
    fields <- c(fields, "anatomic_site_source_value")
    values <- c(values, if (is.null(anatomic_site_source_value)) "NULL" else if (is(anatomic_site_source_value, "subQuery")) paste0("(", as.character(anatomic_site_source_value), ")") else paste0("'", as.character(anatomic_site_source_value), "'"))
  }

  if (!missing(disease_status_source_value)) {
    fields <- c(fields, "disease_status_source_value")
    values <- c(values, if (is.null(disease_status_source_value)) "NULL" else if (is(disease_status_source_value, "subQuery")) paste0("(", as.character(disease_status_source_value), ")") else paste0("'", as.character(disease_status_source_value), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 1, table = "specimen", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_no_visit_detail <- function(visit_detail_id, person_id, visit_concept_id, visit_start_date, visit_start_datetime, visit_end_date, visit_end_datetime, visit_type_concept_id, provider_id, care_site_id, visit_source_value, visit_source_concept_id, admitting_source_value, admitting_source_concept_id, discharge_to_source_value, discharge_to_concept_id, preceding_visit_detail_id, visit_detail_parent_id, visit_occurrence_id) {
  fields <- c()
  values <- c()
  if (!missing(visit_detail_id)) {
    fields <- c(fields, "visit_detail_id")
    values <- c(values, if (is.null(visit_detail_id)) "NULL" else if (is(visit_detail_id, "subQuery")) paste0("(", as.character(visit_detail_id), ")") else paste0("'", as.character(visit_detail_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(visit_concept_id)) {
    fields <- c(fields, "visit_concept_id")
    values <- c(values, if (is.null(visit_concept_id)) "NULL" else if (is(visit_concept_id, "subQuery")) paste0("(", as.character(visit_concept_id), ")") else paste0("'", as.character(visit_concept_id), "'"))
  }

  if (!missing(visit_start_date)) {
    fields <- c(fields, "visit_start_date")
    values <- c(values, if (is.null(visit_start_date)) "NULL" else if (is(visit_start_date, "subQuery")) paste0("(", as.character(visit_start_date), ")") else paste0("'", as.character(visit_start_date), "'"))
  }

  if (!missing(visit_start_datetime)) {
    fields <- c(fields, "visit_start_datetime")
    values <- c(values, if (is.null(visit_start_datetime)) "NULL" else if (is(visit_start_datetime, "subQuery")) paste0("(", as.character(visit_start_datetime), ")") else paste0("'", as.character(visit_start_datetime), "'"))
  }

  if (!missing(visit_end_date)) {
    fields <- c(fields, "visit_end_date")
    values <- c(values, if (is.null(visit_end_date)) "NULL" else if (is(visit_end_date, "subQuery")) paste0("(", as.character(visit_end_date), ")") else paste0("'", as.character(visit_end_date), "'"))
  }

  if (!missing(visit_end_datetime)) {
    fields <- c(fields, "visit_end_datetime")
    values <- c(values, if (is.null(visit_end_datetime)) "NULL" else if (is(visit_end_datetime, "subQuery")) paste0("(", as.character(visit_end_datetime), ")") else paste0("'", as.character(visit_end_datetime), "'"))
  }

  if (!missing(visit_type_concept_id)) {
    fields <- c(fields, "visit_type_concept_id")
    values <- c(values, if (is.null(visit_type_concept_id)) "NULL" else if (is(visit_type_concept_id, "subQuery")) paste0("(", as.character(visit_type_concept_id), ")") else paste0("'", as.character(visit_type_concept_id), "'"))
  }

  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(care_site_id)) {
    fields <- c(fields, "care_site_id")
    values <- c(values, if (is.null(care_site_id)) "NULL" else if (is(care_site_id, "subQuery")) paste0("(", as.character(care_site_id), ")") else paste0("'", as.character(care_site_id), "'"))
  }

  if (!missing(visit_source_value)) {
    fields <- c(fields, "visit_source_value")
    values <- c(values, if (is.null(visit_source_value)) "NULL" else if (is(visit_source_value, "subQuery")) paste0("(", as.character(visit_source_value), ")") else paste0("'", as.character(visit_source_value), "'"))
  }

  if (!missing(visit_source_concept_id)) {
    fields <- c(fields, "visit_source_concept_id")
    values <- c(values, if (is.null(visit_source_concept_id)) "NULL" else if (is(visit_source_concept_id, "subQuery")) paste0("(", as.character(visit_source_concept_id), ")") else paste0("'", as.character(visit_source_concept_id), "'"))
  }

  if (!missing(admitting_source_value)) {
    fields <- c(fields, "admitting_source_value")
    values <- c(values, if (is.null(admitting_source_value)) "NULL" else if (is(admitting_source_value, "subQuery")) paste0("(", as.character(admitting_source_value), ")") else paste0("'", as.character(admitting_source_value), "'"))
  }

  if (!missing(admitting_source_concept_id)) {
    fields <- c(fields, "admitting_source_concept_id")
    values <- c(values, if (is.null(admitting_source_concept_id)) "NULL" else if (is(admitting_source_concept_id, "subQuery")) paste0("(", as.character(admitting_source_concept_id), ")") else paste0("'", as.character(admitting_source_concept_id), "'"))
  }

  if (!missing(discharge_to_source_value)) {
    fields <- c(fields, "discharge_to_source_value")
    values <- c(values, if (is.null(discharge_to_source_value)) "NULL" else if (is(discharge_to_source_value, "subQuery")) paste0("(", as.character(discharge_to_source_value), ")") else paste0("'", as.character(discharge_to_source_value), "'"))
  }

  if (!missing(discharge_to_concept_id)) {
    fields <- c(fields, "discharge_to_concept_id")
    values <- c(values, if (is.null(discharge_to_concept_id)) "NULL" else if (is(discharge_to_concept_id, "subQuery")) paste0("(", as.character(discharge_to_concept_id), ")") else paste0("'", as.character(discharge_to_concept_id), "'"))
  }

  if (!missing(preceding_visit_detail_id)) {
    fields <- c(fields, "preceding_visit_detail_id")
    values <- c(values, if (is.null(preceding_visit_detail_id)) "NULL" else if (is(preceding_visit_detail_id, "subQuery")) paste0("(", as.character(preceding_visit_detail_id), ")") else paste0("'", as.character(preceding_visit_detail_id), "'"))
  }

  if (!missing(visit_detail_parent_id)) {
    fields <- c(fields, "visit_detail_parent_id")
    values <- c(values, if (is.null(visit_detail_parent_id)) "NULL" else if (is(visit_detail_parent_id, "subQuery")) paste0("(", as.character(visit_detail_parent_id), ")") else paste0("'", as.character(visit_detail_parent_id), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    fields <- c(fields, "visit_occurrence_id")
    values <- c(values, if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 1, table = "visit_detail", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_no_visit_occurrence <- function(visit_occurrence_id, person_id, visit_concept_id, visit_start_date, visit_start_datetime, visit_end_date, visit_end_datetime, visit_type_concept_id, provider_id, care_site_id, visit_source_value, visit_source_concept_id, admitting_source_concept_id, admitting_source_value, discharge_to_concept_id, discharge_to_source_value, preceding_visit_occurrence_id) {
  fields <- c()
  values <- c()
  if (!missing(visit_occurrence_id)) {
    fields <- c(fields, "visit_occurrence_id")
    values <- c(values, if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(visit_concept_id)) {
    fields <- c(fields, "visit_concept_id")
    values <- c(values, if (is.null(visit_concept_id)) "NULL" else if (is(visit_concept_id, "subQuery")) paste0("(", as.character(visit_concept_id), ")") else paste0("'", as.character(visit_concept_id), "'"))
  }

  if (!missing(visit_start_date)) {
    fields <- c(fields, "visit_start_date")
    values <- c(values, if (is.null(visit_start_date)) "NULL" else if (is(visit_start_date, "subQuery")) paste0("(", as.character(visit_start_date), ")") else paste0("'", as.character(visit_start_date), "'"))
  }

  if (!missing(visit_start_datetime)) {
    fields <- c(fields, "visit_start_datetime")
    values <- c(values, if (is.null(visit_start_datetime)) "NULL" else if (is(visit_start_datetime, "subQuery")) paste0("(", as.character(visit_start_datetime), ")") else paste0("'", as.character(visit_start_datetime), "'"))
  }

  if (!missing(visit_end_date)) {
    fields <- c(fields, "visit_end_date")
    values <- c(values, if (is.null(visit_end_date)) "NULL" else if (is(visit_end_date, "subQuery")) paste0("(", as.character(visit_end_date), ")") else paste0("'", as.character(visit_end_date), "'"))
  }

  if (!missing(visit_end_datetime)) {
    fields <- c(fields, "visit_end_datetime")
    values <- c(values, if (is.null(visit_end_datetime)) "NULL" else if (is(visit_end_datetime, "subQuery")) paste0("(", as.character(visit_end_datetime), ")") else paste0("'", as.character(visit_end_datetime), "'"))
  }

  if (!missing(visit_type_concept_id)) {
    fields <- c(fields, "visit_type_concept_id")
    values <- c(values, if (is.null(visit_type_concept_id)) "NULL" else if (is(visit_type_concept_id, "subQuery")) paste0("(", as.character(visit_type_concept_id), ")") else paste0("'", as.character(visit_type_concept_id), "'"))
  }

  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(care_site_id)) {
    fields <- c(fields, "care_site_id")
    values <- c(values, if (is.null(care_site_id)) "NULL" else if (is(care_site_id, "subQuery")) paste0("(", as.character(care_site_id), ")") else paste0("'", as.character(care_site_id), "'"))
  }

  if (!missing(visit_source_value)) {
    fields <- c(fields, "visit_source_value")
    values <- c(values, if (is.null(visit_source_value)) "NULL" else if (is(visit_source_value, "subQuery")) paste0("(", as.character(visit_source_value), ")") else paste0("'", as.character(visit_source_value), "'"))
  }

  if (!missing(visit_source_concept_id)) {
    fields <- c(fields, "visit_source_concept_id")
    values <- c(values, if (is.null(visit_source_concept_id)) "NULL" else if (is(visit_source_concept_id, "subQuery")) paste0("(", as.character(visit_source_concept_id), ")") else paste0("'", as.character(visit_source_concept_id), "'"))
  }

  if (!missing(admitting_source_concept_id)) {
    fields <- c(fields, "admitting_source_concept_id")
    values <- c(values, if (is.null(admitting_source_concept_id)) "NULL" else if (is(admitting_source_concept_id, "subQuery")) paste0("(", as.character(admitting_source_concept_id), ")") else paste0("'", as.character(admitting_source_concept_id), "'"))
  }

  if (!missing(admitting_source_value)) {
    fields <- c(fields, "admitting_source_value")
    values <- c(values, if (is.null(admitting_source_value)) "NULL" else if (is(admitting_source_value, "subQuery")) paste0("(", as.character(admitting_source_value), ")") else paste0("'", as.character(admitting_source_value), "'"))
  }

  if (!missing(discharge_to_concept_id)) {
    fields <- c(fields, "discharge_to_concept_id")
    values <- c(values, if (is.null(discharge_to_concept_id)) "NULL" else if (is(discharge_to_concept_id, "subQuery")) paste0("(", as.character(discharge_to_concept_id), ")") else paste0("'", as.character(discharge_to_concept_id), "'"))
  }

  if (!missing(discharge_to_source_value)) {
    fields <- c(fields, "discharge_to_source_value")
    values <- c(values, if (is.null(discharge_to_source_value)) "NULL" else if (is(discharge_to_source_value, "subQuery")) paste0("(", as.character(discharge_to_source_value), ")") else paste0("'", as.character(discharge_to_source_value), "'"))
  }

  if (!missing(preceding_visit_occurrence_id)) {
    fields <- c(fields, "preceding_visit_occurrence_id")
    values <- c(values, if (is.null(preceding_visit_occurrence_id)) "NULL" else if (is(preceding_visit_occurrence_id, "subQuery")) paste0("(", as.character(preceding_visit_occurrence_id), ")") else paste0("'", as.character(preceding_visit_occurrence_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 1, table = "visit_occurrence", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_no_cohort <- function(cohort_definition_id, subject_id, cohort_start_date, cohort_end_date) {
  fields <- c()
  values <- c()
  if (!missing(cohort_definition_id)) {
    fields <- c(fields, "cohort_definition_id")
    values <- c(values, if (is.null(cohort_definition_id)) "NULL" else if (is(cohort_definition_id, "subQuery")) paste0("(", as.character(cohort_definition_id), ")") else paste0("'", as.character(cohort_definition_id), "'"))
  }

  if (!missing(subject_id)) {
    fields <- c(fields, "subject_id")
    values <- c(values, if (is.null(subject_id)) "NULL" else if (is(subject_id, "subQuery")) paste0("(", as.character(subject_id), ")") else paste0("'", as.character(subject_id), "'"))
  }

  if (!missing(cohort_start_date)) {
    fields <- c(fields, "cohort_start_date")
    values <- c(values, if (is.null(cohort_start_date)) "NULL" else if (is(cohort_start_date, "subQuery")) paste0("(", as.character(cohort_start_date), ")") else paste0("'", as.character(cohort_start_date), "'"))
  }

  if (!missing(cohort_end_date)) {
    fields <- c(fields, "cohort_end_date")
    values <- c(values, if (is.null(cohort_end_date)) "NULL" else if (is(cohort_end_date, "subQuery")) paste0("(", as.character(cohort_end_date), ")") else paste0("'", as.character(cohort_end_date), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 1, table = "cohort", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_no_cohort_attribute <- function(cohort_definition_id, subject_id, cohort_start_date, cohort_end_date, attribute_definition_id, value_as_number, value_as_concept_id) {
  fields <- c()
  values <- c()
  if (!missing(cohort_definition_id)) {
    fields <- c(fields, "cohort_definition_id")
    values <- c(values, if (is.null(cohort_definition_id)) "NULL" else if (is(cohort_definition_id, "subQuery")) paste0("(", as.character(cohort_definition_id), ")") else paste0("'", as.character(cohort_definition_id), "'"))
  }

  if (!missing(subject_id)) {
    fields <- c(fields, "subject_id")
    values <- c(values, if (is.null(subject_id)) "NULL" else if (is(subject_id, "subQuery")) paste0("(", as.character(subject_id), ")") else paste0("'", as.character(subject_id), "'"))
  }

  if (!missing(cohort_start_date)) {
    fields <- c(fields, "cohort_start_date")
    values <- c(values, if (is.null(cohort_start_date)) "NULL" else if (is(cohort_start_date, "subQuery")) paste0("(", as.character(cohort_start_date), ")") else paste0("'", as.character(cohort_start_date), "'"))
  }

  if (!missing(cohort_end_date)) {
    fields <- c(fields, "cohort_end_date")
    values <- c(values, if (is.null(cohort_end_date)) "NULL" else if (is(cohort_end_date, "subQuery")) paste0("(", as.character(cohort_end_date), ")") else paste0("'", as.character(cohort_end_date), "'"))
  }

  if (!missing(attribute_definition_id)) {
    fields <- c(fields, "attribute_definition_id")
    values <- c(values, if (is.null(attribute_definition_id)) "NULL" else if (is(attribute_definition_id, "subQuery")) paste0("(", as.character(attribute_definition_id), ")") else paste0("'", as.character(attribute_definition_id), "'"))
  }

  if (!missing(value_as_number)) {
    fields <- c(fields, "value_as_number")
    values <- c(values, if (is.null(value_as_number)) "NULL" else if (is(value_as_number, "subQuery")) paste0("(", as.character(value_as_number), ")") else paste0("'", as.character(value_as_number), "'"))
  }

  if (!missing(value_as_concept_id)) {
    fields <- c(fields, "value_as_concept_id")
    values <- c(values, if (is.null(value_as_concept_id)) "NULL" else if (is(value_as_concept_id, "subQuery")) paste0("(", as.character(value_as_concept_id), ")") else paste0("'", as.character(value_as_concept_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 1, table = "cohort_attribute", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_no_condition_era <- function(condition_era_id, person_id, condition_concept_id, condition_era_start_date, condition_era_end_date, condition_occurrence_count) {
  fields <- c()
  values <- c()
  if (!missing(condition_era_id)) {
    fields <- c(fields, "condition_era_id")
    values <- c(values, if (is.null(condition_era_id)) "NULL" else if (is(condition_era_id, "subQuery")) paste0("(", as.character(condition_era_id), ")") else paste0("'", as.character(condition_era_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(condition_concept_id)) {
    fields <- c(fields, "condition_concept_id")
    values <- c(values, if (is.null(condition_concept_id)) "NULL" else if (is(condition_concept_id, "subQuery")) paste0("(", as.character(condition_concept_id), ")") else paste0("'", as.character(condition_concept_id), "'"))
  }

  if (!missing(condition_era_start_date)) {
    fields <- c(fields, "condition_era_start_date")
    values <- c(values, if (is.null(condition_era_start_date)) "NULL" else if (is(condition_era_start_date, "subQuery")) paste0("(", as.character(condition_era_start_date), ")") else paste0("'", as.character(condition_era_start_date), "'"))
  }

  if (!missing(condition_era_end_date)) {
    fields <- c(fields, "condition_era_end_date")
    values <- c(values, if (is.null(condition_era_end_date)) "NULL" else if (is(condition_era_end_date, "subQuery")) paste0("(", as.character(condition_era_end_date), ")") else paste0("'", as.character(condition_era_end_date), "'"))
  }

  if (!missing(condition_occurrence_count)) {
    fields <- c(fields, "condition_occurrence_count")
    values <- c(values, if (is.null(condition_occurrence_count)) "NULL" else if (is(condition_occurrence_count, "subQuery")) paste0("(", as.character(condition_occurrence_count), ")") else paste0("'", as.character(condition_occurrence_count), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 1, table = "condition_era", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_no_dose_era <- function(dose_era_id, person_id, drug_concept_id, unit_concept_id, dose_value, dose_era_start_date, dose_era_end_date) {
  fields <- c()
  values <- c()
  if (!missing(dose_era_id)) {
    fields <- c(fields, "dose_era_id")
    values <- c(values, if (is.null(dose_era_id)) "NULL" else if (is(dose_era_id, "subQuery")) paste0("(", as.character(dose_era_id), ")") else paste0("'", as.character(dose_era_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(drug_concept_id)) {
    fields <- c(fields, "drug_concept_id")
    values <- c(values, if (is.null(drug_concept_id)) "NULL" else if (is(drug_concept_id, "subQuery")) paste0("(", as.character(drug_concept_id), ")") else paste0("'", as.character(drug_concept_id), "'"))
  }

  if (!missing(unit_concept_id)) {
    fields <- c(fields, "unit_concept_id")
    values <- c(values, if (is.null(unit_concept_id)) "NULL" else if (is(unit_concept_id, "subQuery")) paste0("(", as.character(unit_concept_id), ")") else paste0("'", as.character(unit_concept_id), "'"))
  }

  if (!missing(dose_value)) {
    fields <- c(fields, "dose_value")
    values <- c(values, if (is.null(dose_value)) "NULL" else if (is(dose_value, "subQuery")) paste0("(", as.character(dose_value), ")") else paste0("'", as.character(dose_value), "'"))
  }

  if (!missing(dose_era_start_date)) {
    fields <- c(fields, "dose_era_start_date")
    values <- c(values, if (is.null(dose_era_start_date)) "NULL" else if (is(dose_era_start_date, "subQuery")) paste0("(", as.character(dose_era_start_date), ")") else paste0("'", as.character(dose_era_start_date), "'"))
  }

  if (!missing(dose_era_end_date)) {
    fields <- c(fields, "dose_era_end_date")
    values <- c(values, if (is.null(dose_era_end_date)) "NULL" else if (is(dose_era_end_date, "subQuery")) paste0("(", as.character(dose_era_end_date), ")") else paste0("'", as.character(dose_era_end_date), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 1, table = "dose_era", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_no_drug_era <- function(drug_era_id, person_id, drug_concept_id, drug_era_start_date, drug_era_end_date, drug_exposure_count, gap_days) {
  fields <- c()
  values <- c()
  if (!missing(drug_era_id)) {
    fields <- c(fields, "drug_era_id")
    values <- c(values, if (is.null(drug_era_id)) "NULL" else if (is(drug_era_id, "subQuery")) paste0("(", as.character(drug_era_id), ")") else paste0("'", as.character(drug_era_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(drug_concept_id)) {
    fields <- c(fields, "drug_concept_id")
    values <- c(values, if (is.null(drug_concept_id)) "NULL" else if (is(drug_concept_id, "subQuery")) paste0("(", as.character(drug_concept_id), ")") else paste0("'", as.character(drug_concept_id), "'"))
  }

  if (!missing(drug_era_start_date)) {
    fields <- c(fields, "drug_era_start_date")
    values <- c(values, if (is.null(drug_era_start_date)) "NULL" else if (is(drug_era_start_date, "subQuery")) paste0("(", as.character(drug_era_start_date), ")") else paste0("'", as.character(drug_era_start_date), "'"))
  }

  if (!missing(drug_era_end_date)) {
    fields <- c(fields, "drug_era_end_date")
    values <- c(values, if (is.null(drug_era_end_date)) "NULL" else if (is(drug_era_end_date, "subQuery")) paste0("(", as.character(drug_era_end_date), ")") else paste0("'", as.character(drug_era_end_date), "'"))
  }

  if (!missing(drug_exposure_count)) {
    fields <- c(fields, "drug_exposure_count")
    values <- c(values, if (is.null(drug_exposure_count)) "NULL" else if (is(drug_exposure_count, "subQuery")) paste0("(", as.character(drug_exposure_count), ")") else paste0("'", as.character(drug_exposure_count), "'"))
  }

  if (!missing(gap_days)) {
    fields <- c(fields, "gap_days")
    values <- c(values, if (is.null(gap_days)) "NULL" else if (is(gap_days, "subQuery")) paste0("(", as.character(gap_days), ")") else paste0("'", as.character(gap_days), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 1, table = "drug_era", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_no_cost <- function(cost_id, cost_event_id, cost_domain_id, cost_type_concept_id, currency_concept_id, total_charge, total_cost, total_paid, paid_by_payer, paid_by_patient, paid_patient_copay, paid_patient_coinsurance, paid_patient_deductible, paid_by_primary, paid_ingredient_cost, paid_dispensing_fee, payer_plan_period_id, amount_allowed, revenue_code_concept_id, revenue_code_source_value, drg_concept_id, drg_source_value) {
  fields <- c()
  values <- c()
  if (!missing(cost_id)) {
    fields <- c(fields, "cost_id")
    values <- c(values, if (is.null(cost_id)) "NULL" else if (is(cost_id, "subQuery")) paste0("(", as.character(cost_id), ")") else paste0("'", as.character(cost_id), "'"))
  }

  if (!missing(cost_event_id)) {
    fields <- c(fields, "cost_event_id")
    values <- c(values, if (is.null(cost_event_id)) "NULL" else if (is(cost_event_id, "subQuery")) paste0("(", as.character(cost_event_id), ")") else paste0("'", as.character(cost_event_id), "'"))
  }

  if (!missing(cost_domain_id)) {
    fields <- c(fields, "cost_domain_id")
    values <- c(values, if (is.null(cost_domain_id)) "NULL" else if (is(cost_domain_id, "subQuery")) paste0("(", as.character(cost_domain_id), ")") else paste0("'", as.character(cost_domain_id), "'"))
  }

  if (!missing(cost_type_concept_id)) {
    fields <- c(fields, "cost_type_concept_id")
    values <- c(values, if (is.null(cost_type_concept_id)) "NULL" else if (is(cost_type_concept_id, "subQuery")) paste0("(", as.character(cost_type_concept_id), ")") else paste0("'", as.character(cost_type_concept_id), "'"))
  }

  if (!missing(currency_concept_id)) {
    fields <- c(fields, "currency_concept_id")
    values <- c(values, if (is.null(currency_concept_id)) "NULL" else if (is(currency_concept_id, "subQuery")) paste0("(", as.character(currency_concept_id), ")") else paste0("'", as.character(currency_concept_id), "'"))
  }

  if (!missing(total_charge)) {
    fields <- c(fields, "total_charge")
    values <- c(values, if (is.null(total_charge)) "NULL" else if (is(total_charge, "subQuery")) paste0("(", as.character(total_charge), ")") else paste0("'", as.character(total_charge), "'"))
  }

  if (!missing(total_cost)) {
    fields <- c(fields, "total_cost")
    values <- c(values, if (is.null(total_cost)) "NULL" else if (is(total_cost, "subQuery")) paste0("(", as.character(total_cost), ")") else paste0("'", as.character(total_cost), "'"))
  }

  if (!missing(total_paid)) {
    fields <- c(fields, "total_paid")
    values <- c(values, if (is.null(total_paid)) "NULL" else if (is(total_paid, "subQuery")) paste0("(", as.character(total_paid), ")") else paste0("'", as.character(total_paid), "'"))
  }

  if (!missing(paid_by_payer)) {
    fields <- c(fields, "paid_by_payer")
    values <- c(values, if (is.null(paid_by_payer)) "NULL" else if (is(paid_by_payer, "subQuery")) paste0("(", as.character(paid_by_payer), ")") else paste0("'", as.character(paid_by_payer), "'"))
  }

  if (!missing(paid_by_patient)) {
    fields <- c(fields, "paid_by_patient")
    values <- c(values, if (is.null(paid_by_patient)) "NULL" else if (is(paid_by_patient, "subQuery")) paste0("(", as.character(paid_by_patient), ")") else paste0("'", as.character(paid_by_patient), "'"))
  }

  if (!missing(paid_patient_copay)) {
    fields <- c(fields, "paid_patient_copay")
    values <- c(values, if (is.null(paid_patient_copay)) "NULL" else if (is(paid_patient_copay, "subQuery")) paste0("(", as.character(paid_patient_copay), ")") else paste0("'", as.character(paid_patient_copay), "'"))
  }

  if (!missing(paid_patient_coinsurance)) {
    fields <- c(fields, "paid_patient_coinsurance")
    values <- c(values, if (is.null(paid_patient_coinsurance)) "NULL" else if (is(paid_patient_coinsurance, "subQuery")) paste0("(", as.character(paid_patient_coinsurance), ")") else paste0("'", as.character(paid_patient_coinsurance), "'"))
  }

  if (!missing(paid_patient_deductible)) {
    fields <- c(fields, "paid_patient_deductible")
    values <- c(values, if (is.null(paid_patient_deductible)) "NULL" else if (is(paid_patient_deductible, "subQuery")) paste0("(", as.character(paid_patient_deductible), ")") else paste0("'", as.character(paid_patient_deductible), "'"))
  }

  if (!missing(paid_by_primary)) {
    fields <- c(fields, "paid_by_primary")
    values <- c(values, if (is.null(paid_by_primary)) "NULL" else if (is(paid_by_primary, "subQuery")) paste0("(", as.character(paid_by_primary), ")") else paste0("'", as.character(paid_by_primary), "'"))
  }

  if (!missing(paid_ingredient_cost)) {
    fields <- c(fields, "paid_ingredient_cost")
    values <- c(values, if (is.null(paid_ingredient_cost)) "NULL" else if (is(paid_ingredient_cost, "subQuery")) paste0("(", as.character(paid_ingredient_cost), ")") else paste0("'", as.character(paid_ingredient_cost), "'"))
  }

  if (!missing(paid_dispensing_fee)) {
    fields <- c(fields, "paid_dispensing_fee")
    values <- c(values, if (is.null(paid_dispensing_fee)) "NULL" else if (is(paid_dispensing_fee, "subQuery")) paste0("(", as.character(paid_dispensing_fee), ")") else paste0("'", as.character(paid_dispensing_fee), "'"))
  }

  if (!missing(payer_plan_period_id)) {
    fields <- c(fields, "payer_plan_period_id")
    values <- c(values, if (is.null(payer_plan_period_id)) "NULL" else if (is(payer_plan_period_id, "subQuery")) paste0("(", as.character(payer_plan_period_id), ")") else paste0("'", as.character(payer_plan_period_id), "'"))
  }

  if (!missing(amount_allowed)) {
    fields <- c(fields, "amount_allowed")
    values <- c(values, if (is.null(amount_allowed)) "NULL" else if (is(amount_allowed, "subQuery")) paste0("(", as.character(amount_allowed), ")") else paste0("'", as.character(amount_allowed), "'"))
  }

  if (!missing(revenue_code_concept_id)) {
    fields <- c(fields, "revenue_code_concept_id")
    values <- c(values, if (is.null(revenue_code_concept_id)) "NULL" else if (is(revenue_code_concept_id, "subQuery")) paste0("(", as.character(revenue_code_concept_id), ")") else paste0("'", as.character(revenue_code_concept_id), "'"))
  }

  if (!missing(revenue_code_source_value)) {
    fields <- c(fields, "revenue_code_source_value")
    values <- c(values, if (is.null(revenue_code_source_value)) "NULL" else if (is(revenue_code_source_value, "subQuery")) paste0("(", as.character(revenue_code_source_value), ")") else paste0("'", as.character(revenue_code_source_value), "'"))
  }

  if (!missing(drg_concept_id)) {
    fields <- c(fields, "drg_concept_id")
    values <- c(values, if (is.null(drg_concept_id)) "NULL" else if (is(drg_concept_id, "subQuery")) paste0("(", as.character(drg_concept_id), ")") else paste0("'", as.character(drg_concept_id), "'"))
  }

  if (!missing(drg_source_value)) {
    fields <- c(fields, "drg_source_value")
    values <- c(values, if (is.null(drg_source_value)) "NULL" else if (is(drg_source_value, "subQuery")) paste0("(", as.character(drg_source_value), ")") else paste0("'", as.character(drg_source_value), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 1, table = "cost", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_no_payer_plan_period <- function(payer_plan_period_id, person_id, payer_plan_period_start_date, payer_plan_period_end_date, payer_source_value, plan_source_value, family_source_value) {
  fields <- c()
  values <- c()
  if (!missing(payer_plan_period_id)) {
    fields <- c(fields, "payer_plan_period_id")
    values <- c(values, if (is.null(payer_plan_period_id)) "NULL" else if (is(payer_plan_period_id, "subQuery")) paste0("(", as.character(payer_plan_period_id), ")") else paste0("'", as.character(payer_plan_period_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(payer_plan_period_start_date)) {
    fields <- c(fields, "payer_plan_period_start_date")
    values <- c(values, if (is.null(payer_plan_period_start_date)) "NULL" else if (is(payer_plan_period_start_date, "subQuery")) paste0("(", as.character(payer_plan_period_start_date), ")") else paste0("'", as.character(payer_plan_period_start_date), "'"))
  }

  if (!missing(payer_plan_period_end_date)) {
    fields <- c(fields, "payer_plan_period_end_date")
    values <- c(values, if (is.null(payer_plan_period_end_date)) "NULL" else if (is(payer_plan_period_end_date, "subQuery")) paste0("(", as.character(payer_plan_period_end_date), ")") else paste0("'", as.character(payer_plan_period_end_date), "'"))
  }

  if (!missing(payer_source_value)) {
    fields <- c(fields, "payer_source_value")
    values <- c(values, if (is.null(payer_source_value)) "NULL" else if (is(payer_source_value, "subQuery")) paste0("(", as.character(payer_source_value), ")") else paste0("'", as.character(payer_source_value), "'"))
  }

  if (!missing(plan_source_value)) {
    fields <- c(fields, "plan_source_value")
    values <- c(values, if (is.null(plan_source_value)) "NULL" else if (is(plan_source_value, "subQuery")) paste0("(", as.character(plan_source_value), ")") else paste0("'", as.character(plan_source_value), "'"))
  }

  if (!missing(family_source_value)) {
    fields <- c(fields, "family_source_value")
    values <- c(values, if (is.null(family_source_value)) "NULL" else if (is(family_source_value, "subQuery")) paste0("(", as.character(family_source_value), ")") else paste0("'", as.character(family_source_value), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 1, table = "payer_plan_period", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_no_care_site <- function(care_site_id, care_site_name, place_of_service_concept_id, location_id, care_site_source_value, place_of_service_source_value) {
  fields <- c()
  values <- c()
  if (!missing(care_site_id)) {
    fields <- c(fields, "care_site_id")
    values <- c(values, if (is.null(care_site_id)) "NULL" else if (is(care_site_id, "subQuery")) paste0("(", as.character(care_site_id), ")") else paste0("'", as.character(care_site_id), "'"))
  }

  if (!missing(care_site_name)) {
    fields <- c(fields, "care_site_name")
    values <- c(values, if (is.null(care_site_name)) "NULL" else if (is(care_site_name, "subQuery")) paste0("(", as.character(care_site_name), ")") else paste0("'", as.character(care_site_name), "'"))
  }

  if (!missing(place_of_service_concept_id)) {
    fields <- c(fields, "place_of_service_concept_id")
    values <- c(values, if (is.null(place_of_service_concept_id)) "NULL" else if (is(place_of_service_concept_id, "subQuery")) paste0("(", as.character(place_of_service_concept_id), ")") else paste0("'", as.character(place_of_service_concept_id), "'"))
  }

  if (!missing(location_id)) {
    fields <- c(fields, "location_id")
    values <- c(values, if (is.null(location_id)) "NULL" else if (is(location_id, "subQuery")) paste0("(", as.character(location_id), ")") else paste0("'", as.character(location_id), "'"))
  }

  if (!missing(care_site_source_value)) {
    fields <- c(fields, "care_site_source_value")
    values <- c(values, if (is.null(care_site_source_value)) "NULL" else if (is(care_site_source_value, "subQuery")) paste0("(", as.character(care_site_source_value), ")") else paste0("'", as.character(care_site_source_value), "'"))
  }

  if (!missing(place_of_service_source_value)) {
    fields <- c(fields, "place_of_service_source_value")
    values <- c(values, if (is.null(place_of_service_source_value)) "NULL" else if (is(place_of_service_source_value, "subQuery")) paste0("(", as.character(place_of_service_source_value), ")") else paste0("'", as.character(place_of_service_source_value), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 1, table = "care_site", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_no_location <- function(location_id, address_1, address_2, city, state, zip, county, location_source_value) {
  fields <- c()
  values <- c()
  if (!missing(location_id)) {
    fields <- c(fields, "location_id")
    values <- c(values, if (is.null(location_id)) "NULL" else if (is(location_id, "subQuery")) paste0("(", as.character(location_id), ")") else paste0("'", as.character(location_id), "'"))
  }

  if (!missing(address_1)) {
    fields <- c(fields, "address_1")
    values <- c(values, if (is.null(address_1)) "NULL" else if (is(address_1, "subQuery")) paste0("(", as.character(address_1), ")") else paste0("'", as.character(address_1), "'"))
  }

  if (!missing(address_2)) {
    fields <- c(fields, "address_2")
    values <- c(values, if (is.null(address_2)) "NULL" else if (is(address_2, "subQuery")) paste0("(", as.character(address_2), ")") else paste0("'", as.character(address_2), "'"))
  }

  if (!missing(city)) {
    fields <- c(fields, "city")
    values <- c(values, if (is.null(city)) "NULL" else if (is(city, "subQuery")) paste0("(", as.character(city), ")") else paste0("'", as.character(city), "'"))
  }

  if (!missing(state)) {
    fields <- c(fields, "state")
    values <- c(values, if (is.null(state)) "NULL" else if (is(state, "subQuery")) paste0("(", as.character(state), ")") else paste0("'", as.character(state), "'"))
  }

  if (!missing(zip)) {
    fields <- c(fields, "zip")
    values <- c(values, if (is.null(zip)) "NULL" else if (is(zip, "subQuery")) paste0("(", as.character(zip), ")") else paste0("'", as.character(zip), "'"))
  }

  if (!missing(county)) {
    fields <- c(fields, "county")
    values <- c(values, if (is.null(county)) "NULL" else if (is(county, "subQuery")) paste0("(", as.character(county), ")") else paste0("'", as.character(county), "'"))
  }

  if (!missing(location_source_value)) {
    fields <- c(fields, "location_source_value")
    values <- c(values, if (is.null(location_source_value)) "NULL" else if (is(location_source_value, "subQuery")) paste0("(", as.character(location_source_value), ")") else paste0("'", as.character(location_source_value), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 1, table = "location", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_no_provider <- function(provider_id, provider_name, npi, dea, specialty_concept_id, care_site_id, year_of_birth, gender_concept_id, provider_source_value, specialty_source_value, specialty_source_concept_id, gender_source_value, gender_source_concept_id) {
  fields <- c()
  values <- c()
  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(provider_name)) {
    fields <- c(fields, "provider_name")
    values <- c(values, if (is.null(provider_name)) "NULL" else if (is(provider_name, "subQuery")) paste0("(", as.character(provider_name), ")") else paste0("'", as.character(provider_name), "'"))
  }

  if (!missing(npi)) {
    fields <- c(fields, "npi")
    values <- c(values, if (is.null(npi)) "NULL" else if (is(npi, "subQuery")) paste0("(", as.character(npi), ")") else paste0("'", as.character(npi), "'"))
  }

  if (!missing(dea)) {
    fields <- c(fields, "dea")
    values <- c(values, if (is.null(dea)) "NULL" else if (is(dea, "subQuery")) paste0("(", as.character(dea), ")") else paste0("'", as.character(dea), "'"))
  }

  if (!missing(specialty_concept_id)) {
    fields <- c(fields, "specialty_concept_id")
    values <- c(values, if (is.null(specialty_concept_id)) "NULL" else if (is(specialty_concept_id, "subQuery")) paste0("(", as.character(specialty_concept_id), ")") else paste0("'", as.character(specialty_concept_id), "'"))
  }

  if (!missing(care_site_id)) {
    fields <- c(fields, "care_site_id")
    values <- c(values, if (is.null(care_site_id)) "NULL" else if (is(care_site_id, "subQuery")) paste0("(", as.character(care_site_id), ")") else paste0("'", as.character(care_site_id), "'"))
  }

  if (!missing(year_of_birth)) {
    fields <- c(fields, "year_of_birth")
    values <- c(values, if (is.null(year_of_birth)) "NULL" else if (is(year_of_birth, "subQuery")) paste0("(", as.character(year_of_birth), ")") else paste0("'", as.character(year_of_birth), "'"))
  }

  if (!missing(gender_concept_id)) {
    fields <- c(fields, "gender_concept_id")
    values <- c(values, if (is.null(gender_concept_id)) "NULL" else if (is(gender_concept_id, "subQuery")) paste0("(", as.character(gender_concept_id), ")") else paste0("'", as.character(gender_concept_id), "'"))
  }

  if (!missing(provider_source_value)) {
    fields <- c(fields, "provider_source_value")
    values <- c(values, if (is.null(provider_source_value)) "NULL" else if (is(provider_source_value, "subQuery")) paste0("(", as.character(provider_source_value), ")") else paste0("'", as.character(provider_source_value), "'"))
  }

  if (!missing(specialty_source_value)) {
    fields <- c(fields, "specialty_source_value")
    values <- c(values, if (is.null(specialty_source_value)) "NULL" else if (is(specialty_source_value, "subQuery")) paste0("(", as.character(specialty_source_value), ")") else paste0("'", as.character(specialty_source_value), "'"))
  }

  if (!missing(specialty_source_concept_id)) {
    fields <- c(fields, "specialty_source_concept_id")
    values <- c(values, if (is.null(specialty_source_concept_id)) "NULL" else if (is(specialty_source_concept_id, "subQuery")) paste0("(", as.character(specialty_source_concept_id), ")") else paste0("'", as.character(specialty_source_concept_id), "'"))
  }

  if (!missing(gender_source_value)) {
    fields <- c(fields, "gender_source_value")
    values <- c(values, if (is.null(gender_source_value)) "NULL" else if (is(gender_source_value, "subQuery")) paste0("(", as.character(gender_source_value), ")") else paste0("'", as.character(gender_source_value), "'"))
  }

  if (!missing(gender_source_concept_id)) {
    fields <- c(fields, "gender_source_concept_id")
    values <- c(values, if (is.null(gender_source_concept_id)) "NULL" else if (is(gender_source_concept_id, "subQuery")) paste0("(", as.character(gender_source_concept_id), ")") else paste0("'", as.character(gender_source_concept_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 1, table = "provider", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_no_cdm_source <- function(cdm_source_name, cdm_source_abbreviation, cdm_holder, source_description, source_documentation_reference, cdm_etl__reference, source_release_date, cdm_release_date, cdm_version, vocabulary_version) {
  fields <- c()
  values <- c()
  if (!missing(cdm_source_name)) {
    fields <- c(fields, "cdm_source_name")
    values <- c(values, if (is.null(cdm_source_name)) "NULL" else if (is(cdm_source_name, "subQuery")) paste0("(", as.character(cdm_source_name), ")") else paste0("'", as.character(cdm_source_name), "'"))
  }

  if (!missing(cdm_source_abbreviation)) {
    fields <- c(fields, "cdm_source_abbreviation")
    values <- c(values, if (is.null(cdm_source_abbreviation)) "NULL" else if (is(cdm_source_abbreviation, "subQuery")) paste0("(", as.character(cdm_source_abbreviation), ")") else paste0("'", as.character(cdm_source_abbreviation), "'"))
  }

  if (!missing(cdm_holder)) {
    fields <- c(fields, "cdm_holder")
    values <- c(values, if (is.null(cdm_holder)) "NULL" else if (is(cdm_holder, "subQuery")) paste0("(", as.character(cdm_holder), ")") else paste0("'", as.character(cdm_holder), "'"))
  }

  if (!missing(source_description)) {
    fields <- c(fields, "source_description")
    values <- c(values, if (is.null(source_description)) "NULL" else if (is(source_description, "subQuery")) paste0("(", as.character(source_description), ")") else paste0("'", as.character(source_description), "'"))
  }

  if (!missing(source_documentation_reference)) {
    fields <- c(fields, "source_documentation_reference")
    values <- c(values, if (is.null(source_documentation_reference)) "NULL" else if (is(source_documentation_reference, "subQuery")) paste0("(", as.character(source_documentation_reference), ")") else paste0("'", as.character(source_documentation_reference), "'"))
  }

  if (!missing(cdm_etl__reference)) {
    fields <- c(fields, "[cdm_etl _reference]")
    values <- c(values, if (is.null(cdm_etl__reference)) "NULL" else if (is(cdm_etl__reference, "subQuery")) paste0("(", as.character(cdm_etl__reference), ")") else paste0("'", as.character(cdm_etl__reference), "'"))
  }

  if (!missing(source_release_date)) {
    fields <- c(fields, "source_release_date")
    values <- c(values, if (is.null(source_release_date)) "NULL" else if (is(source_release_date, "subQuery")) paste0("(", as.character(source_release_date), ")") else paste0("'", as.character(source_release_date), "'"))
  }

  if (!missing(cdm_release_date)) {
    fields <- c(fields, "cdm_release_date")
    values <- c(values, if (is.null(cdm_release_date)) "NULL" else if (is(cdm_release_date, "subQuery")) paste0("(", as.character(cdm_release_date), ")") else paste0("'", as.character(cdm_release_date), "'"))
  }

  if (!missing(cdm_version)) {
    fields <- c(fields, "cdm_version")
    values <- c(values, if (is.null(cdm_version)) "NULL" else if (is(cdm_version, "subQuery")) paste0("(", as.character(cdm_version), ")") else paste0("'", as.character(cdm_version), "'"))
  }

  if (!missing(vocabulary_version)) {
    fields <- c(fields, "vocabulary_version")
    values <- c(values, if (is.null(vocabulary_version)) "NULL" else if (is(vocabulary_version, "subQuery")) paste0("(", as.character(vocabulary_version), ")") else paste0("'", as.character(vocabulary_version), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 1, table = "cdm_source", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_no_attribute_definition <- function(attribute_definition_id, attribute_name, attribute_description, attribute_type_concept_id, attribute_syntax) {
  fields <- c()
  values <- c()
  if (!missing(attribute_definition_id)) {
    fields <- c(fields, "attribute_definition_id")
    values <- c(values, if (is.null(attribute_definition_id)) "NULL" else if (is(attribute_definition_id, "subQuery")) paste0("(", as.character(attribute_definition_id), ")") else paste0("'", as.character(attribute_definition_id), "'"))
  }

  if (!missing(attribute_name)) {
    fields <- c(fields, "attribute_name")
    values <- c(values, if (is.null(attribute_name)) "NULL" else if (is(attribute_name, "subQuery")) paste0("(", as.character(attribute_name), ")") else paste0("'", as.character(attribute_name), "'"))
  }

  if (!missing(attribute_description)) {
    fields <- c(fields, "attribute_description")
    values <- c(values, if (is.null(attribute_description)) "NULL" else if (is(attribute_description, "subQuery")) paste0("(", as.character(attribute_description), ")") else paste0("'", as.character(attribute_description), "'"))
  }

  if (!missing(attribute_type_concept_id)) {
    fields <- c(fields, "attribute_type_concept_id")
    values <- c(values, if (is.null(attribute_type_concept_id)) "NULL" else if (is(attribute_type_concept_id, "subQuery")) paste0("(", as.character(attribute_type_concept_id), ")") else paste0("'", as.character(attribute_type_concept_id), "'"))
  }

  if (!missing(attribute_syntax)) {
    fields <- c(fields, "attribute_syntax")
    values <- c(values, if (is.null(attribute_syntax)) "NULL" else if (is(attribute_syntax, "subQuery")) paste0("(", as.character(attribute_syntax), ")") else paste0("'", as.character(attribute_syntax), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 1, table = "attribute_definition", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_no_cohort_definition <- function(cohort_definition_id, cohort_definition_name, cohort_definition_description, definition_type_concept_id, cohort_definition_syntax, subject_concept_id, cohort_instantiation_date) {
  fields <- c()
  values <- c()
  if (!missing(cohort_definition_id)) {
    fields <- c(fields, "cohort_definition_id")
    values <- c(values, if (is.null(cohort_definition_id)) "NULL" else if (is(cohort_definition_id, "subQuery")) paste0("(", as.character(cohort_definition_id), ")") else paste0("'", as.character(cohort_definition_id), "'"))
  }

  if (!missing(cohort_definition_name)) {
    fields <- c(fields, "cohort_definition_name")
    values <- c(values, if (is.null(cohort_definition_name)) "NULL" else if (is(cohort_definition_name, "subQuery")) paste0("(", as.character(cohort_definition_name), ")") else paste0("'", as.character(cohort_definition_name), "'"))
  }

  if (!missing(cohort_definition_description)) {
    fields <- c(fields, "cohort_definition_description")
    values <- c(values, if (is.null(cohort_definition_description)) "NULL" else if (is(cohort_definition_description, "subQuery")) paste0("(", as.character(cohort_definition_description), ")") else paste0("'", as.character(cohort_definition_description), "'"))
  }

  if (!missing(definition_type_concept_id)) {
    fields <- c(fields, "definition_type_concept_id")
    values <- c(values, if (is.null(definition_type_concept_id)) "NULL" else if (is(definition_type_concept_id, "subQuery")) paste0("(", as.character(definition_type_concept_id), ")") else paste0("'", as.character(definition_type_concept_id), "'"))
  }

  if (!missing(cohort_definition_syntax)) {
    fields <- c(fields, "cohort_definition_syntax")
    values <- c(values, if (is.null(cohort_definition_syntax)) "NULL" else if (is(cohort_definition_syntax, "subQuery")) paste0("(", as.character(cohort_definition_syntax), ")") else paste0("'", as.character(cohort_definition_syntax), "'"))
  }

  if (!missing(subject_concept_id)) {
    fields <- c(fields, "subject_concept_id")
    values <- c(values, if (is.null(subject_concept_id)) "NULL" else if (is(subject_concept_id, "subQuery")) paste0("(", as.character(subject_concept_id), ")") else paste0("'", as.character(subject_concept_id), "'"))
  }

  if (!missing(cohort_instantiation_date)) {
    fields <- c(fields, "cohort_instantiation_date")
    values <- c(values, if (is.null(cohort_instantiation_date)) "NULL" else if (is(cohort_instantiation_date, "subQuery")) paste0("(", as.character(cohort_instantiation_date), ")") else paste0("'", as.character(cohort_instantiation_date), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 1, table = "cohort_definition", fields = fields, values = values)
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_count_condition_occurrence <- function(rowCount, condition_occurrence_id, person_id, condition_concept_id, condition_start_date, condition_start_datetime, condition_end_date, condition_end_datetime, condition_type_concept_id, stop_reason, provider_id, visit_occurrence_id, visit_detail_id, condition_source_value, condition_source_concept_id, condition_status_source_value, condition_status_concept_id) {
  fields <- c()
  values <- c()
  if (!missing(condition_occurrence_id)) {
    fields <- c(fields, "condition_occurrence_id")
    values <- c(values, if (is.null(condition_occurrence_id)) "NULL" else if (is(condition_occurrence_id, "subQuery")) paste0("(", as.character(condition_occurrence_id), ")") else paste0("'", as.character(condition_occurrence_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(condition_concept_id)) {
    fields <- c(fields, "condition_concept_id")
    values <- c(values, if (is.null(condition_concept_id)) "NULL" else if (is(condition_concept_id, "subQuery")) paste0("(", as.character(condition_concept_id), ")") else paste0("'", as.character(condition_concept_id), "'"))
  }

  if (!missing(condition_start_date)) {
    fields <- c(fields, "condition_start_date")
    values <- c(values, if (is.null(condition_start_date)) "NULL" else if (is(condition_start_date, "subQuery")) paste0("(", as.character(condition_start_date), ")") else paste0("'", as.character(condition_start_date), "'"))
  }

  if (!missing(condition_start_datetime)) {
    fields <- c(fields, "condition_start_datetime")
    values <- c(values, if (is.null(condition_start_datetime)) "NULL" else if (is(condition_start_datetime, "subQuery")) paste0("(", as.character(condition_start_datetime), ")") else paste0("'", as.character(condition_start_datetime), "'"))
  }

  if (!missing(condition_end_date)) {
    fields <- c(fields, "condition_end_date")
    values <- c(values, if (is.null(condition_end_date)) "NULL" else if (is(condition_end_date, "subQuery")) paste0("(", as.character(condition_end_date), ")") else paste0("'", as.character(condition_end_date), "'"))
  }

  if (!missing(condition_end_datetime)) {
    fields <- c(fields, "condition_end_datetime")
    values <- c(values, if (is.null(condition_end_datetime)) "NULL" else if (is(condition_end_datetime, "subQuery")) paste0("(", as.character(condition_end_datetime), ")") else paste0("'", as.character(condition_end_datetime), "'"))
  }

  if (!missing(condition_type_concept_id)) {
    fields <- c(fields, "condition_type_concept_id")
    values <- c(values, if (is.null(condition_type_concept_id)) "NULL" else if (is(condition_type_concept_id, "subQuery")) paste0("(", as.character(condition_type_concept_id), ")") else paste0("'", as.character(condition_type_concept_id), "'"))
  }

  if (!missing(stop_reason)) {
    fields <- c(fields, "stop_reason")
    values <- c(values, if (is.null(stop_reason)) "NULL" else if (is(stop_reason, "subQuery")) paste0("(", as.character(stop_reason), ")") else paste0("'", as.character(stop_reason), "'"))
  }

  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    fields <- c(fields, "visit_occurrence_id")
    values <- c(values, if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  if (!missing(visit_detail_id)) {
    fields <- c(fields, "visit_detail_id")
    values <- c(values, if (is.null(visit_detail_id)) "NULL" else if (is(visit_detail_id, "subQuery")) paste0("(", as.character(visit_detail_id), ")") else paste0("'", as.character(visit_detail_id), "'"))
  }

  if (!missing(condition_source_value)) {
    fields <- c(fields, "condition_source_value")
    values <- c(values, if (is.null(condition_source_value)) "NULL" else if (is(condition_source_value, "subQuery")) paste0("(", as.character(condition_source_value), ")") else paste0("'", as.character(condition_source_value), "'"))
  }

  if (!missing(condition_source_concept_id)) {
    fields <- c(fields, "condition_source_concept_id")
    values <- c(values, if (is.null(condition_source_concept_id)) "NULL" else if (is(condition_source_concept_id, "subQuery")) paste0("(", as.character(condition_source_concept_id), ")") else paste0("'", as.character(condition_source_concept_id), "'"))
  }

  if (!missing(condition_status_source_value)) {
    fields <- c(fields, "condition_status_source_value")
    values <- c(values, if (is.null(condition_status_source_value)) "NULL" else if (is(condition_status_source_value, "subQuery")) paste0("(", as.character(condition_status_source_value), ")") else paste0("'", as.character(condition_status_source_value), "'"))
  }

  if (!missing(condition_status_concept_id)) {
    fields <- c(fields, "condition_status_concept_id")
    values <- c(values, if (is.null(condition_status_concept_id)) "NULL" else if (is(condition_status_concept_id, "subQuery")) paste0("(", as.character(condition_status_concept_id), ")") else paste0("'", as.character(condition_status_concept_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 2, table = "condition_occurrence", fields = fields, values = values)
  expects$rowCount = rowCount
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_count_death <- function(rowCount, person_id, death_date, death_datetime, death_type_concept_id, cause_concept_id, cause_source_value, cause_source_concept_id) {
  fields <- c()
  values <- c()
  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(death_date)) {
    fields <- c(fields, "death_date")
    values <- c(values, if (is.null(death_date)) "NULL" else if (is(death_date, "subQuery")) paste0("(", as.character(death_date), ")") else paste0("'", as.character(death_date), "'"))
  }

  if (!missing(death_datetime)) {
    fields <- c(fields, "death_datetime")
    values <- c(values, if (is.null(death_datetime)) "NULL" else if (is(death_datetime, "subQuery")) paste0("(", as.character(death_datetime), ")") else paste0("'", as.character(death_datetime), "'"))
  }

  if (!missing(death_type_concept_id)) {
    fields <- c(fields, "death_type_concept_id")
    values <- c(values, if (is.null(death_type_concept_id)) "NULL" else if (is(death_type_concept_id, "subQuery")) paste0("(", as.character(death_type_concept_id), ")") else paste0("'", as.character(death_type_concept_id), "'"))
  }

  if (!missing(cause_concept_id)) {
    fields <- c(fields, "cause_concept_id")
    values <- c(values, if (is.null(cause_concept_id)) "NULL" else if (is(cause_concept_id, "subQuery")) paste0("(", as.character(cause_concept_id), ")") else paste0("'", as.character(cause_concept_id), "'"))
  }

  if (!missing(cause_source_value)) {
    fields <- c(fields, "cause_source_value")
    values <- c(values, if (is.null(cause_source_value)) "NULL" else if (is(cause_source_value, "subQuery")) paste0("(", as.character(cause_source_value), ")") else paste0("'", as.character(cause_source_value), "'"))
  }

  if (!missing(cause_source_concept_id)) {
    fields <- c(fields, "cause_source_concept_id")
    values <- c(values, if (is.null(cause_source_concept_id)) "NULL" else if (is(cause_source_concept_id, "subQuery")) paste0("(", as.character(cause_source_concept_id), ")") else paste0("'", as.character(cause_source_concept_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 2, table = "death", fields = fields, values = values)
  expects$rowCount = rowCount
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_count_device_exposure <- function(rowCount, device_exposure_id, person_id, device_concept_id, device_exposure_start_date, device_exposure_start_datetime, device_exposure_end_date, device_exposure_end_datetime, device_type_concept_id, unique_device_id, quantity, provider_id, visit_occurrence_id, device_source_value, device_source__concept_id, visit_detail_id) {
  fields <- c()
  values <- c()
  if (!missing(device_exposure_id)) {
    fields <- c(fields, "device_exposure_id")
    values <- c(values, if (is.null(device_exposure_id)) "NULL" else if (is(device_exposure_id, "subQuery")) paste0("(", as.character(device_exposure_id), ")") else paste0("'", as.character(device_exposure_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(device_concept_id)) {
    fields <- c(fields, "device_concept_id")
    values <- c(values, if (is.null(device_concept_id)) "NULL" else if (is(device_concept_id, "subQuery")) paste0("(", as.character(device_concept_id), ")") else paste0("'", as.character(device_concept_id), "'"))
  }

  if (!missing(device_exposure_start_date)) {
    fields <- c(fields, "device_exposure_start_date")
    values <- c(values, if (is.null(device_exposure_start_date)) "NULL" else if (is(device_exposure_start_date, "subQuery")) paste0("(", as.character(device_exposure_start_date), ")") else paste0("'", as.character(device_exposure_start_date), "'"))
  }

  if (!missing(device_exposure_start_datetime)) {
    fields <- c(fields, "device_exposure_start_datetime")
    values <- c(values, if (is.null(device_exposure_start_datetime)) "NULL" else if (is(device_exposure_start_datetime, "subQuery")) paste0("(", as.character(device_exposure_start_datetime), ")") else paste0("'", as.character(device_exposure_start_datetime), "'"))
  }

  if (!missing(device_exposure_end_date)) {
    fields <- c(fields, "device_exposure_end_date")
    values <- c(values, if (is.null(device_exposure_end_date)) "NULL" else if (is(device_exposure_end_date, "subQuery")) paste0("(", as.character(device_exposure_end_date), ")") else paste0("'", as.character(device_exposure_end_date), "'"))
  }

  if (!missing(device_exposure_end_datetime)) {
    fields <- c(fields, "device_exposure_end_datetime")
    values <- c(values, if (is.null(device_exposure_end_datetime)) "NULL" else if (is(device_exposure_end_datetime, "subQuery")) paste0("(", as.character(device_exposure_end_datetime), ")") else paste0("'", as.character(device_exposure_end_datetime), "'"))
  }

  if (!missing(device_type_concept_id)) {
    fields <- c(fields, "device_type_concept_id")
    values <- c(values, if (is.null(device_type_concept_id)) "NULL" else if (is(device_type_concept_id, "subQuery")) paste0("(", as.character(device_type_concept_id), ")") else paste0("'", as.character(device_type_concept_id), "'"))
  }

  if (!missing(unique_device_id)) {
    fields <- c(fields, "unique_device_id")
    values <- c(values, if (is.null(unique_device_id)) "NULL" else if (is(unique_device_id, "subQuery")) paste0("(", as.character(unique_device_id), ")") else paste0("'", as.character(unique_device_id), "'"))
  }

  if (!missing(quantity)) {
    fields <- c(fields, "quantity")
    values <- c(values, if (is.null(quantity)) "NULL" else if (is(quantity, "subQuery")) paste0("(", as.character(quantity), ")") else paste0("'", as.character(quantity), "'"))
  }

  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    fields <- c(fields, "visit_occurrence_id")
    values <- c(values, if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  if (!missing(device_source_value)) {
    fields <- c(fields, "device_source_value")
    values <- c(values, if (is.null(device_source_value)) "NULL" else if (is(device_source_value, "subQuery")) paste0("(", as.character(device_source_value), ")") else paste0("'", as.character(device_source_value), "'"))
  }

  if (!missing(device_source__concept_id)) {
    fields <- c(fields, "[device_source_ concept_id]")
    values <- c(values, if (is.null(device_source__concept_id)) "NULL" else if (is(device_source__concept_id, "subQuery")) paste0("(", as.character(device_source__concept_id), ")") else paste0("'", as.character(device_source__concept_id), "'"))
  }

  if (!missing(visit_detail_id)) {
    fields <- c(fields, "visit_detail_id")
    values <- c(values, if (is.null(visit_detail_id)) "NULL" else if (is(visit_detail_id, "subQuery")) paste0("(", as.character(visit_detail_id), ")") else paste0("'", as.character(visit_detail_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 2, table = "device_exposure", fields = fields, values = values)
  expects$rowCount = rowCount
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_count_drug_exposure <- function(rowCount, drug_exposure_id, person_id, drug_concept_id, drug_exposure_start_date, drug_exposure_start_datetime, drug_exposure_end_date, drug_exposure_end_datetime, verbatim_end_date, drug_type_concept_id, stop_reason, refills, quantity, days_supply, sig, route_concept_id, lot_number, provider_id, visit_occurrence_id, drug_source_value, drug_source_concept_id, route_source_value, dose_unit_source_value, visit_detail_id) {
  fields <- c()
  values <- c()
  if (!missing(drug_exposure_id)) {
    fields <- c(fields, "drug_exposure_id")
    values <- c(values, if (is.null(drug_exposure_id)) "NULL" else if (is(drug_exposure_id, "subQuery")) paste0("(", as.character(drug_exposure_id), ")") else paste0("'", as.character(drug_exposure_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(drug_concept_id)) {
    fields <- c(fields, "drug_concept_id")
    values <- c(values, if (is.null(drug_concept_id)) "NULL" else if (is(drug_concept_id, "subQuery")) paste0("(", as.character(drug_concept_id), ")") else paste0("'", as.character(drug_concept_id), "'"))
  }

  if (!missing(drug_exposure_start_date)) {
    fields <- c(fields, "drug_exposure_start_date")
    values <- c(values, if (is.null(drug_exposure_start_date)) "NULL" else if (is(drug_exposure_start_date, "subQuery")) paste0("(", as.character(drug_exposure_start_date), ")") else paste0("'", as.character(drug_exposure_start_date), "'"))
  }

  if (!missing(drug_exposure_start_datetime)) {
    fields <- c(fields, "drug_exposure_start_datetime")
    values <- c(values, if (is.null(drug_exposure_start_datetime)) "NULL" else if (is(drug_exposure_start_datetime, "subQuery")) paste0("(", as.character(drug_exposure_start_datetime), ")") else paste0("'", as.character(drug_exposure_start_datetime), "'"))
  }

  if (!missing(drug_exposure_end_date)) {
    fields <- c(fields, "drug_exposure_end_date")
    values <- c(values, if (is.null(drug_exposure_end_date)) "NULL" else if (is(drug_exposure_end_date, "subQuery")) paste0("(", as.character(drug_exposure_end_date), ")") else paste0("'", as.character(drug_exposure_end_date), "'"))
  }

  if (!missing(drug_exposure_end_datetime)) {
    fields <- c(fields, "drug_exposure_end_datetime")
    values <- c(values, if (is.null(drug_exposure_end_datetime)) "NULL" else if (is(drug_exposure_end_datetime, "subQuery")) paste0("(", as.character(drug_exposure_end_datetime), ")") else paste0("'", as.character(drug_exposure_end_datetime), "'"))
  }

  if (!missing(verbatim_end_date)) {
    fields <- c(fields, "verbatim_end_date")
    values <- c(values, if (is.null(verbatim_end_date)) "NULL" else if (is(verbatim_end_date, "subQuery")) paste0("(", as.character(verbatim_end_date), ")") else paste0("'", as.character(verbatim_end_date), "'"))
  }

  if (!missing(drug_type_concept_id)) {
    fields <- c(fields, "drug_type_concept_id")
    values <- c(values, if (is.null(drug_type_concept_id)) "NULL" else if (is(drug_type_concept_id, "subQuery")) paste0("(", as.character(drug_type_concept_id), ")") else paste0("'", as.character(drug_type_concept_id), "'"))
  }

  if (!missing(stop_reason)) {
    fields <- c(fields, "stop_reason")
    values <- c(values, if (is.null(stop_reason)) "NULL" else if (is(stop_reason, "subQuery")) paste0("(", as.character(stop_reason), ")") else paste0("'", as.character(stop_reason), "'"))
  }

  if (!missing(refills)) {
    fields <- c(fields, "refills")
    values <- c(values, if (is.null(refills)) "NULL" else if (is(refills, "subQuery")) paste0("(", as.character(refills), ")") else paste0("'", as.character(refills), "'"))
  }

  if (!missing(quantity)) {
    fields <- c(fields, "quantity")
    values <- c(values, if (is.null(quantity)) "NULL" else if (is(quantity, "subQuery")) paste0("(", as.character(quantity), ")") else paste0("'", as.character(quantity), "'"))
  }

  if (!missing(days_supply)) {
    fields <- c(fields, "days_supply")
    values <- c(values, if (is.null(days_supply)) "NULL" else if (is(days_supply, "subQuery")) paste0("(", as.character(days_supply), ")") else paste0("'", as.character(days_supply), "'"))
  }

  if (!missing(sig)) {
    fields <- c(fields, "sig")
    values <- c(values, if (is.null(sig)) "NULL" else if (is(sig, "subQuery")) paste0("(", as.character(sig), ")") else paste0("'", as.character(sig), "'"))
  }

  if (!missing(route_concept_id)) {
    fields <- c(fields, "route_concept_id")
    values <- c(values, if (is.null(route_concept_id)) "NULL" else if (is(route_concept_id, "subQuery")) paste0("(", as.character(route_concept_id), ")") else paste0("'", as.character(route_concept_id), "'"))
  }

  if (!missing(lot_number)) {
    fields <- c(fields, "lot_number")
    values <- c(values, if (is.null(lot_number)) "NULL" else if (is(lot_number, "subQuery")) paste0("(", as.character(lot_number), ")") else paste0("'", as.character(lot_number), "'"))
  }

  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    fields <- c(fields, "visit_occurrence_id")
    values <- c(values, if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  if (!missing(drug_source_value)) {
    fields <- c(fields, "drug_source_value")
    values <- c(values, if (is.null(drug_source_value)) "NULL" else if (is(drug_source_value, "subQuery")) paste0("(", as.character(drug_source_value), ")") else paste0("'", as.character(drug_source_value), "'"))
  }

  if (!missing(drug_source_concept_id)) {
    fields <- c(fields, "drug_source_concept_id")
    values <- c(values, if (is.null(drug_source_concept_id)) "NULL" else if (is(drug_source_concept_id, "subQuery")) paste0("(", as.character(drug_source_concept_id), ")") else paste0("'", as.character(drug_source_concept_id), "'"))
  }

  if (!missing(route_source_value)) {
    fields <- c(fields, "route_source_value")
    values <- c(values, if (is.null(route_source_value)) "NULL" else if (is(route_source_value, "subQuery")) paste0("(", as.character(route_source_value), ")") else paste0("'", as.character(route_source_value), "'"))
  }

  if (!missing(dose_unit_source_value)) {
    fields <- c(fields, "dose_unit_source_value")
    values <- c(values, if (is.null(dose_unit_source_value)) "NULL" else if (is(dose_unit_source_value, "subQuery")) paste0("(", as.character(dose_unit_source_value), ")") else paste0("'", as.character(dose_unit_source_value), "'"))
  }

  if (!missing(visit_detail_id)) {
    fields <- c(fields, "visit_detail_id")
    values <- c(values, if (is.null(visit_detail_id)) "NULL" else if (is(visit_detail_id, "subQuery")) paste0("(", as.character(visit_detail_id), ")") else paste0("'", as.character(visit_detail_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 2, table = "drug_exposure", fields = fields, values = values)
  expects$rowCount = rowCount
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_count_fact_relationship <- function(rowCount, domain_concept_id_1, fact_id_1, domain_concept_id_2, fact_id_2, relationship_concept_id) {
  fields <- c()
  values <- c()
  if (!missing(domain_concept_id_1)) {
    fields <- c(fields, "domain_concept_id_1")
    values <- c(values, if (is.null(domain_concept_id_1)) "NULL" else if (is(domain_concept_id_1, "subQuery")) paste0("(", as.character(domain_concept_id_1), ")") else paste0("'", as.character(domain_concept_id_1), "'"))
  }

  if (!missing(fact_id_1)) {
    fields <- c(fields, "fact_id_1")
    values <- c(values, if (is.null(fact_id_1)) "NULL" else if (is(fact_id_1, "subQuery")) paste0("(", as.character(fact_id_1), ")") else paste0("'", as.character(fact_id_1), "'"))
  }

  if (!missing(domain_concept_id_2)) {
    fields <- c(fields, "domain_concept_id_2")
    values <- c(values, if (is.null(domain_concept_id_2)) "NULL" else if (is(domain_concept_id_2, "subQuery")) paste0("(", as.character(domain_concept_id_2), ")") else paste0("'", as.character(domain_concept_id_2), "'"))
  }

  if (!missing(fact_id_2)) {
    fields <- c(fields, "fact_id_2")
    values <- c(values, if (is.null(fact_id_2)) "NULL" else if (is(fact_id_2, "subQuery")) paste0("(", as.character(fact_id_2), ")") else paste0("'", as.character(fact_id_2), "'"))
  }

  if (!missing(relationship_concept_id)) {
    fields <- c(fields, "relationship_concept_id")
    values <- c(values, if (is.null(relationship_concept_id)) "NULL" else if (is(relationship_concept_id, "subQuery")) paste0("(", as.character(relationship_concept_id), ")") else paste0("'", as.character(relationship_concept_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 2, table = "fact_relationship", fields = fields, values = values)
  expects$rowCount = rowCount
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_count_measurement <- function(rowCount, measurement_id, person_id, measurement_concept_id, measurement_date, measurement_datetime, measurement_type_concept_id, operator_concept_id, value_as_number, value_as_concept_id, unit_concept_id, range_low, range_high, provider_id, visit_occurrence_id, visit_detail_id, measurement_source_value, measurement_source_concept_id, unit_source_value, value_source_value) {
  fields <- c()
  values <- c()
  if (!missing(measurement_id)) {
    fields <- c(fields, "measurement_id")
    values <- c(values, if (is.null(measurement_id)) "NULL" else if (is(measurement_id, "subQuery")) paste0("(", as.character(measurement_id), ")") else paste0("'", as.character(measurement_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(measurement_concept_id)) {
    fields <- c(fields, "measurement_concept_id")
    values <- c(values, if (is.null(measurement_concept_id)) "NULL" else if (is(measurement_concept_id, "subQuery")) paste0("(", as.character(measurement_concept_id), ")") else paste0("'", as.character(measurement_concept_id), "'"))
  }

  if (!missing(measurement_date)) {
    fields <- c(fields, "measurement_date")
    values <- c(values, if (is.null(measurement_date)) "NULL" else if (is(measurement_date, "subQuery")) paste0("(", as.character(measurement_date), ")") else paste0("'", as.character(measurement_date), "'"))
  }

  if (!missing(measurement_datetime)) {
    fields <- c(fields, "measurement_datetime")
    values <- c(values, if (is.null(measurement_datetime)) "NULL" else if (is(measurement_datetime, "subQuery")) paste0("(", as.character(measurement_datetime), ")") else paste0("'", as.character(measurement_datetime), "'"))
  }

  if (!missing(measurement_type_concept_id)) {
    fields <- c(fields, "measurement_type_concept_id")
    values <- c(values, if (is.null(measurement_type_concept_id)) "NULL" else if (is(measurement_type_concept_id, "subQuery")) paste0("(", as.character(measurement_type_concept_id), ")") else paste0("'", as.character(measurement_type_concept_id), "'"))
  }

  if (!missing(operator_concept_id)) {
    fields <- c(fields, "operator_concept_id")
    values <- c(values, if (is.null(operator_concept_id)) "NULL" else if (is(operator_concept_id, "subQuery")) paste0("(", as.character(operator_concept_id), ")") else paste0("'", as.character(operator_concept_id), "'"))
  }

  if (!missing(value_as_number)) {
    fields <- c(fields, "value_as_number")
    values <- c(values, if (is.null(value_as_number)) "NULL" else if (is(value_as_number, "subQuery")) paste0("(", as.character(value_as_number), ")") else paste0("'", as.character(value_as_number), "'"))
  }

  if (!missing(value_as_concept_id)) {
    fields <- c(fields, "value_as_concept_id")
    values <- c(values, if (is.null(value_as_concept_id)) "NULL" else if (is(value_as_concept_id, "subQuery")) paste0("(", as.character(value_as_concept_id), ")") else paste0("'", as.character(value_as_concept_id), "'"))
  }

  if (!missing(unit_concept_id)) {
    fields <- c(fields, "unit_concept_id")
    values <- c(values, if (is.null(unit_concept_id)) "NULL" else if (is(unit_concept_id, "subQuery")) paste0("(", as.character(unit_concept_id), ")") else paste0("'", as.character(unit_concept_id), "'"))
  }

  if (!missing(range_low)) {
    fields <- c(fields, "range_low")
    values <- c(values, if (is.null(range_low)) "NULL" else if (is(range_low, "subQuery")) paste0("(", as.character(range_low), ")") else paste0("'", as.character(range_low), "'"))
  }

  if (!missing(range_high)) {
    fields <- c(fields, "range_high")
    values <- c(values, if (is.null(range_high)) "NULL" else if (is(range_high, "subQuery")) paste0("(", as.character(range_high), ")") else paste0("'", as.character(range_high), "'"))
  }

  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    fields <- c(fields, "visit_occurrence_id")
    values <- c(values, if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  if (!missing(visit_detail_id)) {
    fields <- c(fields, "visit_detail_id")
    values <- c(values, if (is.null(visit_detail_id)) "NULL" else if (is(visit_detail_id, "subQuery")) paste0("(", as.character(visit_detail_id), ")") else paste0("'", as.character(visit_detail_id), "'"))
  }

  if (!missing(measurement_source_value)) {
    fields <- c(fields, "measurement_source_value")
    values <- c(values, if (is.null(measurement_source_value)) "NULL" else if (is(measurement_source_value, "subQuery")) paste0("(", as.character(measurement_source_value), ")") else paste0("'", as.character(measurement_source_value), "'"))
  }

  if (!missing(measurement_source_concept_id)) {
    fields <- c(fields, "measurement_source_concept_id")
    values <- c(values, if (is.null(measurement_source_concept_id)) "NULL" else if (is(measurement_source_concept_id, "subQuery")) paste0("(", as.character(measurement_source_concept_id), ")") else paste0("'", as.character(measurement_source_concept_id), "'"))
  }

  if (!missing(unit_source_value)) {
    fields <- c(fields, "unit_source_value")
    values <- c(values, if (is.null(unit_source_value)) "NULL" else if (is(unit_source_value, "subQuery")) paste0("(", as.character(unit_source_value), ")") else paste0("'", as.character(unit_source_value), "'"))
  }

  if (!missing(value_source_value)) {
    fields <- c(fields, "value_source_value")
    values <- c(values, if (is.null(value_source_value)) "NULL" else if (is(value_source_value, "subQuery")) paste0("(", as.character(value_source_value), ")") else paste0("'", as.character(value_source_value), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 2, table = "measurement", fields = fields, values = values)
  expects$rowCount = rowCount
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_count_note <- function(rowCount, note_id, person_id, note_date, note_datetime, note_type_concept_id, note_class_concept_id, note_title, note_text, encoding_concept_id, language_concept_id, provider_id, note_source_value, visit_occurrence_id) {
  fields <- c()
  values <- c()
  if (!missing(note_id)) {
    fields <- c(fields, "note_id")
    values <- c(values, if (is.null(note_id)) "NULL" else if (is(note_id, "subQuery")) paste0("(", as.character(note_id), ")") else paste0("'", as.character(note_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(note_date)) {
    fields <- c(fields, "note_date")
    values <- c(values, if (is.null(note_date)) "NULL" else if (is(note_date, "subQuery")) paste0("(", as.character(note_date), ")") else paste0("'", as.character(note_date), "'"))
  }

  if (!missing(note_datetime)) {
    fields <- c(fields, "note_datetime")
    values <- c(values, if (is.null(note_datetime)) "NULL" else if (is(note_datetime, "subQuery")) paste0("(", as.character(note_datetime), ")") else paste0("'", as.character(note_datetime), "'"))
  }

  if (!missing(note_type_concept_id)) {
    fields <- c(fields, "note_type_concept_id")
    values <- c(values, if (is.null(note_type_concept_id)) "NULL" else if (is(note_type_concept_id, "subQuery")) paste0("(", as.character(note_type_concept_id), ")") else paste0("'", as.character(note_type_concept_id), "'"))
  }

  if (!missing(note_class_concept_id)) {
    fields <- c(fields, "note_class_concept_id")
    values <- c(values, if (is.null(note_class_concept_id)) "NULL" else if (is(note_class_concept_id, "subQuery")) paste0("(", as.character(note_class_concept_id), ")") else paste0("'", as.character(note_class_concept_id), "'"))
  }

  if (!missing(note_title)) {
    fields <- c(fields, "note_title")
    values <- c(values, if (is.null(note_title)) "NULL" else if (is(note_title, "subQuery")) paste0("(", as.character(note_title), ")") else paste0("'", as.character(note_title), "'"))
  }

  if (!missing(note_text)) {
    fields <- c(fields, "note_text")
    values <- c(values, if (is.null(note_text)) "NULL" else if (is(note_text, "subQuery")) paste0("(", as.character(note_text), ")") else paste0("'", as.character(note_text), "'"))
  }

  if (!missing(encoding_concept_id)) {
    fields <- c(fields, "encoding_concept_id")
    values <- c(values, if (is.null(encoding_concept_id)) "NULL" else if (is(encoding_concept_id, "subQuery")) paste0("(", as.character(encoding_concept_id), ")") else paste0("'", as.character(encoding_concept_id), "'"))
  }

  if (!missing(language_concept_id)) {
    fields <- c(fields, "language_concept_id")
    values <- c(values, if (is.null(language_concept_id)) "NULL" else if (is(language_concept_id, "subQuery")) paste0("(", as.character(language_concept_id), ")") else paste0("'", as.character(language_concept_id), "'"))
  }

  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(note_source_value)) {
    fields <- c(fields, "note_source_value")
    values <- c(values, if (is.null(note_source_value)) "NULL" else if (is(note_source_value, "subQuery")) paste0("(", as.character(note_source_value), ")") else paste0("'", as.character(note_source_value), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    fields <- c(fields, "visit_occurrence_id")
    values <- c(values, if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 2, table = "note", fields = fields, values = values)
  expects$rowCount = rowCount
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_count_note_nlp <- function(rowCount, note_nlp_id, note_id, section_concept_id, snippet, offset, lexical_variant, note_nlp_concept_id, note_nlp_source_concept_id, nlp_system, nlp_date, nlp_date_time, term_exists, term_temporal, term_modifiers) {
  fields <- c()
  values <- c()
  if (!missing(note_nlp_id)) {
    fields <- c(fields, "note_nlp_id")
    values <- c(values, if (is.null(note_nlp_id)) "NULL" else if (is(note_nlp_id, "subQuery")) paste0("(", as.character(note_nlp_id), ")") else paste0("'", as.character(note_nlp_id), "'"))
  }

  if (!missing(note_id)) {
    fields <- c(fields, "note_id")
    values <- c(values, if (is.null(note_id)) "NULL" else if (is(note_id, "subQuery")) paste0("(", as.character(note_id), ")") else paste0("'", as.character(note_id), "'"))
  }

  if (!missing(section_concept_id)) {
    fields <- c(fields, "section_concept_id")
    values <- c(values, if (is.null(section_concept_id)) "NULL" else if (is(section_concept_id, "subQuery")) paste0("(", as.character(section_concept_id), ")") else paste0("'", as.character(section_concept_id), "'"))
  }

  if (!missing(snippet)) {
    fields <- c(fields, "snippet")
    values <- c(values, if (is.null(snippet)) "NULL" else if (is(snippet, "subQuery")) paste0("(", as.character(snippet), ")") else paste0("'", as.character(snippet), "'"))
  }

  if (!missing(offset)) {
    fields <- c(fields, "offset")
    values <- c(values, if (is.null(offset)) "NULL" else if (is(offset, "subQuery")) paste0("(", as.character(offset), ")") else paste0("'", as.character(offset), "'"))
  }

  if (!missing(lexical_variant)) {
    fields <- c(fields, "lexical_variant")
    values <- c(values, if (is.null(lexical_variant)) "NULL" else if (is(lexical_variant, "subQuery")) paste0("(", as.character(lexical_variant), ")") else paste0("'", as.character(lexical_variant), "'"))
  }

  if (!missing(note_nlp_concept_id)) {
    fields <- c(fields, "note_nlp_concept_id")
    values <- c(values, if (is.null(note_nlp_concept_id)) "NULL" else if (is(note_nlp_concept_id, "subQuery")) paste0("(", as.character(note_nlp_concept_id), ")") else paste0("'", as.character(note_nlp_concept_id), "'"))
  }

  if (!missing(note_nlp_source_concept_id)) {
    fields <- c(fields, "note_nlp_source_concept_id")
    values <- c(values, if (is.null(note_nlp_source_concept_id)) "NULL" else if (is(note_nlp_source_concept_id, "subQuery")) paste0("(", as.character(note_nlp_source_concept_id), ")") else paste0("'", as.character(note_nlp_source_concept_id), "'"))
  }

  if (!missing(nlp_system)) {
    fields <- c(fields, "nlp_system")
    values <- c(values, if (is.null(nlp_system)) "NULL" else if (is(nlp_system, "subQuery")) paste0("(", as.character(nlp_system), ")") else paste0("'", as.character(nlp_system), "'"))
  }

  if (!missing(nlp_date)) {
    fields <- c(fields, "nlp_date")
    values <- c(values, if (is.null(nlp_date)) "NULL" else if (is(nlp_date, "subQuery")) paste0("(", as.character(nlp_date), ")") else paste0("'", as.character(nlp_date), "'"))
  }

  if (!missing(nlp_date_time)) {
    fields <- c(fields, "nlp_date_time")
    values <- c(values, if (is.null(nlp_date_time)) "NULL" else if (is(nlp_date_time, "subQuery")) paste0("(", as.character(nlp_date_time), ")") else paste0("'", as.character(nlp_date_time), "'"))
  }

  if (!missing(term_exists)) {
    fields <- c(fields, "term_exists")
    values <- c(values, if (is.null(term_exists)) "NULL" else if (is(term_exists, "subQuery")) paste0("(", as.character(term_exists), ")") else paste0("'", as.character(term_exists), "'"))
  }

  if (!missing(term_temporal)) {
    fields <- c(fields, "term_temporal")
    values <- c(values, if (is.null(term_temporal)) "NULL" else if (is(term_temporal, "subQuery")) paste0("(", as.character(term_temporal), ")") else paste0("'", as.character(term_temporal), "'"))
  }

  if (!missing(term_modifiers)) {
    fields <- c(fields, "term_modifiers")
    values <- c(values, if (is.null(term_modifiers)) "NULL" else if (is(term_modifiers, "subQuery")) paste0("(", as.character(term_modifiers), ")") else paste0("'", as.character(term_modifiers), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 2, table = "note_nlp", fields = fields, values = values)
  expects$rowCount = rowCount
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_count_observation <- function(rowCount, observation_id, person_id, observation_concept_id, observation_date, observation_datetime, observation_type_concept_id, value_as_number, value_as_string, value_as_concept_id, qualifier_concept_id, unit_concept_id, provider_id, visit_occurrence_id, visit_detail_id, observation_source_value, observation_source_concept_id, unit_source_value, qualifier_source_value) {
  fields <- c()
  values <- c()
  if (!missing(observation_id)) {
    fields <- c(fields, "observation_id")
    values <- c(values, if (is.null(observation_id)) "NULL" else if (is(observation_id, "subQuery")) paste0("(", as.character(observation_id), ")") else paste0("'", as.character(observation_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(observation_concept_id)) {
    fields <- c(fields, "observation_concept_id")
    values <- c(values, if (is.null(observation_concept_id)) "NULL" else if (is(observation_concept_id, "subQuery")) paste0("(", as.character(observation_concept_id), ")") else paste0("'", as.character(observation_concept_id), "'"))
  }

  if (!missing(observation_date)) {
    fields <- c(fields, "observation_date")
    values <- c(values, if (is.null(observation_date)) "NULL" else if (is(observation_date, "subQuery")) paste0("(", as.character(observation_date), ")") else paste0("'", as.character(observation_date), "'"))
  }

  if (!missing(observation_datetime)) {
    fields <- c(fields, "observation_datetime")
    values <- c(values, if (is.null(observation_datetime)) "NULL" else if (is(observation_datetime, "subQuery")) paste0("(", as.character(observation_datetime), ")") else paste0("'", as.character(observation_datetime), "'"))
  }

  if (!missing(observation_type_concept_id)) {
    fields <- c(fields, "observation_type_concept_id")
    values <- c(values, if (is.null(observation_type_concept_id)) "NULL" else if (is(observation_type_concept_id, "subQuery")) paste0("(", as.character(observation_type_concept_id), ")") else paste0("'", as.character(observation_type_concept_id), "'"))
  }

  if (!missing(value_as_number)) {
    fields <- c(fields, "value_as_number")
    values <- c(values, if (is.null(value_as_number)) "NULL" else if (is(value_as_number, "subQuery")) paste0("(", as.character(value_as_number), ")") else paste0("'", as.character(value_as_number), "'"))
  }

  if (!missing(value_as_string)) {
    fields <- c(fields, "value_as_string")
    values <- c(values, if (is.null(value_as_string)) "NULL" else if (is(value_as_string, "subQuery")) paste0("(", as.character(value_as_string), ")") else paste0("'", as.character(value_as_string), "'"))
  }

  if (!missing(value_as_concept_id)) {
    fields <- c(fields, "value_as_concept_id")
    values <- c(values, if (is.null(value_as_concept_id)) "NULL" else if (is(value_as_concept_id, "subQuery")) paste0("(", as.character(value_as_concept_id), ")") else paste0("'", as.character(value_as_concept_id), "'"))
  }

  if (!missing(qualifier_concept_id)) {
    fields <- c(fields, "qualifier_concept_id")
    values <- c(values, if (is.null(qualifier_concept_id)) "NULL" else if (is(qualifier_concept_id, "subQuery")) paste0("(", as.character(qualifier_concept_id), ")") else paste0("'", as.character(qualifier_concept_id), "'"))
  }

  if (!missing(unit_concept_id)) {
    fields <- c(fields, "unit_concept_id")
    values <- c(values, if (is.null(unit_concept_id)) "NULL" else if (is(unit_concept_id, "subQuery")) paste0("(", as.character(unit_concept_id), ")") else paste0("'", as.character(unit_concept_id), "'"))
  }

  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    fields <- c(fields, "visit_occurrence_id")
    values <- c(values, if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  if (!missing(visit_detail_id)) {
    fields <- c(fields, "visit_detail_id")
    values <- c(values, if (is.null(visit_detail_id)) "NULL" else if (is(visit_detail_id, "subQuery")) paste0("(", as.character(visit_detail_id), ")") else paste0("'", as.character(visit_detail_id), "'"))
  }

  if (!missing(observation_source_value)) {
    fields <- c(fields, "observation_source_value")
    values <- c(values, if (is.null(observation_source_value)) "NULL" else if (is(observation_source_value, "subQuery")) paste0("(", as.character(observation_source_value), ")") else paste0("'", as.character(observation_source_value), "'"))
  }

  if (!missing(observation_source_concept_id)) {
    fields <- c(fields, "observation_source_concept_id")
    values <- c(values, if (is.null(observation_source_concept_id)) "NULL" else if (is(observation_source_concept_id, "subQuery")) paste0("(", as.character(observation_source_concept_id), ")") else paste0("'", as.character(observation_source_concept_id), "'"))
  }

  if (!missing(unit_source_value)) {
    fields <- c(fields, "unit_source_value")
    values <- c(values, if (is.null(unit_source_value)) "NULL" else if (is(unit_source_value, "subQuery")) paste0("(", as.character(unit_source_value), ")") else paste0("'", as.character(unit_source_value), "'"))
  }

  if (!missing(qualifier_source_value)) {
    fields <- c(fields, "qualifier_source_value")
    values <- c(values, if (is.null(qualifier_source_value)) "NULL" else if (is(qualifier_source_value, "subQuery")) paste0("(", as.character(qualifier_source_value), ")") else paste0("'", as.character(qualifier_source_value), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 2, table = "observation", fields = fields, values = values)
  expects$rowCount = rowCount
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_count_observation_period <- function(rowCount, observation_period_id, person_id, observation_period_start_date, observation_period_end_date, period_type_concept_id) {
  fields <- c()
  values <- c()
  if (!missing(observation_period_id)) {
    fields <- c(fields, "observation_period_id")
    values <- c(values, if (is.null(observation_period_id)) "NULL" else if (is(observation_period_id, "subQuery")) paste0("(", as.character(observation_period_id), ")") else paste0("'", as.character(observation_period_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(observation_period_start_date)) {
    fields <- c(fields, "observation_period_start_date")
    values <- c(values, if (is.null(observation_period_start_date)) "NULL" else if (is(observation_period_start_date, "subQuery")) paste0("(", as.character(observation_period_start_date), ")") else paste0("'", as.character(observation_period_start_date), "'"))
  }

  if (!missing(observation_period_end_date)) {
    fields <- c(fields, "observation_period_end_date")
    values <- c(values, if (is.null(observation_period_end_date)) "NULL" else if (is(observation_period_end_date, "subQuery")) paste0("(", as.character(observation_period_end_date), ")") else paste0("'", as.character(observation_period_end_date), "'"))
  }

  if (!missing(period_type_concept_id)) {
    fields <- c(fields, "period_type_concept_id")
    values <- c(values, if (is.null(period_type_concept_id)) "NULL" else if (is(period_type_concept_id, "subQuery")) paste0("(", as.character(period_type_concept_id), ")") else paste0("'", as.character(period_type_concept_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 2, table = "observation_period", fields = fields, values = values)
  expects$rowCount = rowCount
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_count_person <- function(rowCount, person_id, gender_concept_id, year_of_birth, month_of_birth, day_of_birth, birth_datetime, race_concept_id, ethnicity_concept_id, location_id, provider_id, care_site_id, person_source_value, gender_source_value, gender_source_concept_id, race_source_value, race_source_concept_id, ethnicity_source_value, ethnicity_source_concept_id) {
  fields <- c()
  values <- c()
  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(gender_concept_id)) {
    fields <- c(fields, "gender_concept_id")
    values <- c(values, if (is.null(gender_concept_id)) "NULL" else if (is(gender_concept_id, "subQuery")) paste0("(", as.character(gender_concept_id), ")") else paste0("'", as.character(gender_concept_id), "'"))
  }

  if (!missing(year_of_birth)) {
    fields <- c(fields, "year_of_birth")
    values <- c(values, if (is.null(year_of_birth)) "NULL" else if (is(year_of_birth, "subQuery")) paste0("(", as.character(year_of_birth), ")") else paste0("'", as.character(year_of_birth), "'"))
  }

  if (!missing(month_of_birth)) {
    fields <- c(fields, "month_of_birth")
    values <- c(values, if (is.null(month_of_birth)) "NULL" else if (is(month_of_birth, "subQuery")) paste0("(", as.character(month_of_birth), ")") else paste0("'", as.character(month_of_birth), "'"))
  }

  if (!missing(day_of_birth)) {
    fields <- c(fields, "day_of_birth")
    values <- c(values, if (is.null(day_of_birth)) "NULL" else if (is(day_of_birth, "subQuery")) paste0("(", as.character(day_of_birth), ")") else paste0("'", as.character(day_of_birth), "'"))
  }

  if (!missing(birth_datetime)) {
    fields <- c(fields, "birth_datetime")
    values <- c(values, if (is.null(birth_datetime)) "NULL" else if (is(birth_datetime, "subQuery")) paste0("(", as.character(birth_datetime), ")") else paste0("'", as.character(birth_datetime), "'"))
  }

  if (!missing(race_concept_id)) {
    fields <- c(fields, "race_concept_id")
    values <- c(values, if (is.null(race_concept_id)) "NULL" else if (is(race_concept_id, "subQuery")) paste0("(", as.character(race_concept_id), ")") else paste0("'", as.character(race_concept_id), "'"))
  }

  if (!missing(ethnicity_concept_id)) {
    fields <- c(fields, "ethnicity_concept_id")
    values <- c(values, if (is.null(ethnicity_concept_id)) "NULL" else if (is(ethnicity_concept_id, "subQuery")) paste0("(", as.character(ethnicity_concept_id), ")") else paste0("'", as.character(ethnicity_concept_id), "'"))
  }

  if (!missing(location_id)) {
    fields <- c(fields, "location_id")
    values <- c(values, if (is.null(location_id)) "NULL" else if (is(location_id, "subQuery")) paste0("(", as.character(location_id), ")") else paste0("'", as.character(location_id), "'"))
  }

  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(care_site_id)) {
    fields <- c(fields, "care_site_id")
    values <- c(values, if (is.null(care_site_id)) "NULL" else if (is(care_site_id, "subQuery")) paste0("(", as.character(care_site_id), ")") else paste0("'", as.character(care_site_id), "'"))
  }

  if (!missing(person_source_value)) {
    fields <- c(fields, "person_source_value")
    values <- c(values, if (is.null(person_source_value)) "NULL" else if (is(person_source_value, "subQuery")) paste0("(", as.character(person_source_value), ")") else paste0("'", as.character(person_source_value), "'"))
  }

  if (!missing(gender_source_value)) {
    fields <- c(fields, "gender_source_value")
    values <- c(values, if (is.null(gender_source_value)) "NULL" else if (is(gender_source_value, "subQuery")) paste0("(", as.character(gender_source_value), ")") else paste0("'", as.character(gender_source_value), "'"))
  }

  if (!missing(gender_source_concept_id)) {
    fields <- c(fields, "gender_source_concept_id")
    values <- c(values, if (is.null(gender_source_concept_id)) "NULL" else if (is(gender_source_concept_id, "subQuery")) paste0("(", as.character(gender_source_concept_id), ")") else paste0("'", as.character(gender_source_concept_id), "'"))
  }

  if (!missing(race_source_value)) {
    fields <- c(fields, "race_source_value")
    values <- c(values, if (is.null(race_source_value)) "NULL" else if (is(race_source_value, "subQuery")) paste0("(", as.character(race_source_value), ")") else paste0("'", as.character(race_source_value), "'"))
  }

  if (!missing(race_source_concept_id)) {
    fields <- c(fields, "race_source_concept_id")
    values <- c(values, if (is.null(race_source_concept_id)) "NULL" else if (is(race_source_concept_id, "subQuery")) paste0("(", as.character(race_source_concept_id), ")") else paste0("'", as.character(race_source_concept_id), "'"))
  }

  if (!missing(ethnicity_source_value)) {
    fields <- c(fields, "ethnicity_source_value")
    values <- c(values, if (is.null(ethnicity_source_value)) "NULL" else if (is(ethnicity_source_value, "subQuery")) paste0("(", as.character(ethnicity_source_value), ")") else paste0("'", as.character(ethnicity_source_value), "'"))
  }

  if (!missing(ethnicity_source_concept_id)) {
    fields <- c(fields, "ethnicity_source_concept_id")
    values <- c(values, if (is.null(ethnicity_source_concept_id)) "NULL" else if (is(ethnicity_source_concept_id, "subQuery")) paste0("(", as.character(ethnicity_source_concept_id), ")") else paste0("'", as.character(ethnicity_source_concept_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 2, table = "person", fields = fields, values = values)
  expects$rowCount = rowCount
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_count_procedure_occurrence <- function(rowCount, procedure_occurrence_id, person_id, procedure_concept_id, procedure_date, procedure_datetime, procedure_type_concept_id, modifier_concept_id, quantity, provider_id, visit_occurrence_id, procedure_source_value, procedure_source_concept_id, qualifier_source_value, visit_detail_id) {
  fields <- c()
  values <- c()
  if (!missing(procedure_occurrence_id)) {
    fields <- c(fields, "procedure_occurrence_id")
    values <- c(values, if (is.null(procedure_occurrence_id)) "NULL" else if (is(procedure_occurrence_id, "subQuery")) paste0("(", as.character(procedure_occurrence_id), ")") else paste0("'", as.character(procedure_occurrence_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(procedure_concept_id)) {
    fields <- c(fields, "procedure_concept_id")
    values <- c(values, if (is.null(procedure_concept_id)) "NULL" else if (is(procedure_concept_id, "subQuery")) paste0("(", as.character(procedure_concept_id), ")") else paste0("'", as.character(procedure_concept_id), "'"))
  }

  if (!missing(procedure_date)) {
    fields <- c(fields, "procedure_date")
    values <- c(values, if (is.null(procedure_date)) "NULL" else if (is(procedure_date, "subQuery")) paste0("(", as.character(procedure_date), ")") else paste0("'", as.character(procedure_date), "'"))
  }

  if (!missing(procedure_datetime)) {
    fields <- c(fields, "procedure_datetime")
    values <- c(values, if (is.null(procedure_datetime)) "NULL" else if (is(procedure_datetime, "subQuery")) paste0("(", as.character(procedure_datetime), ")") else paste0("'", as.character(procedure_datetime), "'"))
  }

  if (!missing(procedure_type_concept_id)) {
    fields <- c(fields, "procedure_type_concept_id")
    values <- c(values, if (is.null(procedure_type_concept_id)) "NULL" else if (is(procedure_type_concept_id, "subQuery")) paste0("(", as.character(procedure_type_concept_id), ")") else paste0("'", as.character(procedure_type_concept_id), "'"))
  }

  if (!missing(modifier_concept_id)) {
    fields <- c(fields, "modifier_concept_id")
    values <- c(values, if (is.null(modifier_concept_id)) "NULL" else if (is(modifier_concept_id, "subQuery")) paste0("(", as.character(modifier_concept_id), ")") else paste0("'", as.character(modifier_concept_id), "'"))
  }

  if (!missing(quantity)) {
    fields <- c(fields, "quantity")
    values <- c(values, if (is.null(quantity)) "NULL" else if (is(quantity, "subQuery")) paste0("(", as.character(quantity), ")") else paste0("'", as.character(quantity), "'"))
  }

  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    fields <- c(fields, "visit_occurrence_id")
    values <- c(values, if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  if (!missing(procedure_source_value)) {
    fields <- c(fields, "procedure_source_value")
    values <- c(values, if (is.null(procedure_source_value)) "NULL" else if (is(procedure_source_value, "subQuery")) paste0("(", as.character(procedure_source_value), ")") else paste0("'", as.character(procedure_source_value), "'"))
  }

  if (!missing(procedure_source_concept_id)) {
    fields <- c(fields, "procedure_source_concept_id")
    values <- c(values, if (is.null(procedure_source_concept_id)) "NULL" else if (is(procedure_source_concept_id, "subQuery")) paste0("(", as.character(procedure_source_concept_id), ")") else paste0("'", as.character(procedure_source_concept_id), "'"))
  }

  if (!missing(qualifier_source_value)) {
    fields <- c(fields, "qualifier_source_value")
    values <- c(values, if (is.null(qualifier_source_value)) "NULL" else if (is(qualifier_source_value, "subQuery")) paste0("(", as.character(qualifier_source_value), ")") else paste0("'", as.character(qualifier_source_value), "'"))
  }

  if (!missing(visit_detail_id)) {
    fields <- c(fields, "visit_detail_id")
    values <- c(values, if (is.null(visit_detail_id)) "NULL" else if (is(visit_detail_id, "subQuery")) paste0("(", as.character(visit_detail_id), ")") else paste0("'", as.character(visit_detail_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 2, table = "procedure_occurrence", fields = fields, values = values)
  expects$rowCount = rowCount
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_count_specimen <- function(rowCount, specimen_id, person_id, specimen_concept_id, specimen_type_concept_id, specimen_date, specimen_datetime, quantity, unit_concept_id, anatomic_site_concept_id, disease_status_concept_id, specimen_source_id, specimen_source_value, unit_source_value, anatomic_site_source_value, disease_status_source_value) {
  fields <- c()
  values <- c()
  if (!missing(specimen_id)) {
    fields <- c(fields, "specimen_id")
    values <- c(values, if (is.null(specimen_id)) "NULL" else if (is(specimen_id, "subQuery")) paste0("(", as.character(specimen_id), ")") else paste0("'", as.character(specimen_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(specimen_concept_id)) {
    fields <- c(fields, "specimen_concept_id")
    values <- c(values, if (is.null(specimen_concept_id)) "NULL" else if (is(specimen_concept_id, "subQuery")) paste0("(", as.character(specimen_concept_id), ")") else paste0("'", as.character(specimen_concept_id), "'"))
  }

  if (!missing(specimen_type_concept_id)) {
    fields <- c(fields, "specimen_type_concept_id")
    values <- c(values, if (is.null(specimen_type_concept_id)) "NULL" else if (is(specimen_type_concept_id, "subQuery")) paste0("(", as.character(specimen_type_concept_id), ")") else paste0("'", as.character(specimen_type_concept_id), "'"))
  }

  if (!missing(specimen_date)) {
    fields <- c(fields, "specimen_date")
    values <- c(values, if (is.null(specimen_date)) "NULL" else if (is(specimen_date, "subQuery")) paste0("(", as.character(specimen_date), ")") else paste0("'", as.character(specimen_date), "'"))
  }

  if (!missing(specimen_datetime)) {
    fields <- c(fields, "specimen_datetime")
    values <- c(values, if (is.null(specimen_datetime)) "NULL" else if (is(specimen_datetime, "subQuery")) paste0("(", as.character(specimen_datetime), ")") else paste0("'", as.character(specimen_datetime), "'"))
  }

  if (!missing(quantity)) {
    fields <- c(fields, "quantity")
    values <- c(values, if (is.null(quantity)) "NULL" else if (is(quantity, "subQuery")) paste0("(", as.character(quantity), ")") else paste0("'", as.character(quantity), "'"))
  }

  if (!missing(unit_concept_id)) {
    fields <- c(fields, "unit_concept_id")
    values <- c(values, if (is.null(unit_concept_id)) "NULL" else if (is(unit_concept_id, "subQuery")) paste0("(", as.character(unit_concept_id), ")") else paste0("'", as.character(unit_concept_id), "'"))
  }

  if (!missing(anatomic_site_concept_id)) {
    fields <- c(fields, "anatomic_site_concept_id")
    values <- c(values, if (is.null(anatomic_site_concept_id)) "NULL" else if (is(anatomic_site_concept_id, "subQuery")) paste0("(", as.character(anatomic_site_concept_id), ")") else paste0("'", as.character(anatomic_site_concept_id), "'"))
  }

  if (!missing(disease_status_concept_id)) {
    fields <- c(fields, "disease_status_concept_id")
    values <- c(values, if (is.null(disease_status_concept_id)) "NULL" else if (is(disease_status_concept_id, "subQuery")) paste0("(", as.character(disease_status_concept_id), ")") else paste0("'", as.character(disease_status_concept_id), "'"))
  }

  if (!missing(specimen_source_id)) {
    fields <- c(fields, "specimen_source_id")
    values <- c(values, if (is.null(specimen_source_id)) "NULL" else if (is(specimen_source_id, "subQuery")) paste0("(", as.character(specimen_source_id), ")") else paste0("'", as.character(specimen_source_id), "'"))
  }

  if (!missing(specimen_source_value)) {
    fields <- c(fields, "specimen_source_value")
    values <- c(values, if (is.null(specimen_source_value)) "NULL" else if (is(specimen_source_value, "subQuery")) paste0("(", as.character(specimen_source_value), ")") else paste0("'", as.character(specimen_source_value), "'"))
  }

  if (!missing(unit_source_value)) {
    fields <- c(fields, "unit_source_value")
    values <- c(values, if (is.null(unit_source_value)) "NULL" else if (is(unit_source_value, "subQuery")) paste0("(", as.character(unit_source_value), ")") else paste0("'", as.character(unit_source_value), "'"))
  }

  if (!missing(anatomic_site_source_value)) {
    fields <- c(fields, "anatomic_site_source_value")
    values <- c(values, if (is.null(anatomic_site_source_value)) "NULL" else if (is(anatomic_site_source_value, "subQuery")) paste0("(", as.character(anatomic_site_source_value), ")") else paste0("'", as.character(anatomic_site_source_value), "'"))
  }

  if (!missing(disease_status_source_value)) {
    fields <- c(fields, "disease_status_source_value")
    values <- c(values, if (is.null(disease_status_source_value)) "NULL" else if (is(disease_status_source_value, "subQuery")) paste0("(", as.character(disease_status_source_value), ")") else paste0("'", as.character(disease_status_source_value), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 2, table = "specimen", fields = fields, values = values)
  expects$rowCount = rowCount
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_count_visit_detail <- function(rowCount, visit_detail_id, person_id, visit_concept_id, visit_start_date, visit_start_datetime, visit_end_date, visit_end_datetime, visit_type_concept_id, provider_id, care_site_id, visit_source_value, visit_source_concept_id, admitting_source_value, admitting_source_concept_id, discharge_to_source_value, discharge_to_concept_id, preceding_visit_detail_id, visit_detail_parent_id, visit_occurrence_id) {
  fields <- c()
  values <- c()
  if (!missing(visit_detail_id)) {
    fields <- c(fields, "visit_detail_id")
    values <- c(values, if (is.null(visit_detail_id)) "NULL" else if (is(visit_detail_id, "subQuery")) paste0("(", as.character(visit_detail_id), ")") else paste0("'", as.character(visit_detail_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(visit_concept_id)) {
    fields <- c(fields, "visit_concept_id")
    values <- c(values, if (is.null(visit_concept_id)) "NULL" else if (is(visit_concept_id, "subQuery")) paste0("(", as.character(visit_concept_id), ")") else paste0("'", as.character(visit_concept_id), "'"))
  }

  if (!missing(visit_start_date)) {
    fields <- c(fields, "visit_start_date")
    values <- c(values, if (is.null(visit_start_date)) "NULL" else if (is(visit_start_date, "subQuery")) paste0("(", as.character(visit_start_date), ")") else paste0("'", as.character(visit_start_date), "'"))
  }

  if (!missing(visit_start_datetime)) {
    fields <- c(fields, "visit_start_datetime")
    values <- c(values, if (is.null(visit_start_datetime)) "NULL" else if (is(visit_start_datetime, "subQuery")) paste0("(", as.character(visit_start_datetime), ")") else paste0("'", as.character(visit_start_datetime), "'"))
  }

  if (!missing(visit_end_date)) {
    fields <- c(fields, "visit_end_date")
    values <- c(values, if (is.null(visit_end_date)) "NULL" else if (is(visit_end_date, "subQuery")) paste0("(", as.character(visit_end_date), ")") else paste0("'", as.character(visit_end_date), "'"))
  }

  if (!missing(visit_end_datetime)) {
    fields <- c(fields, "visit_end_datetime")
    values <- c(values, if (is.null(visit_end_datetime)) "NULL" else if (is(visit_end_datetime, "subQuery")) paste0("(", as.character(visit_end_datetime), ")") else paste0("'", as.character(visit_end_datetime), "'"))
  }

  if (!missing(visit_type_concept_id)) {
    fields <- c(fields, "visit_type_concept_id")
    values <- c(values, if (is.null(visit_type_concept_id)) "NULL" else if (is(visit_type_concept_id, "subQuery")) paste0("(", as.character(visit_type_concept_id), ")") else paste0("'", as.character(visit_type_concept_id), "'"))
  }

  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(care_site_id)) {
    fields <- c(fields, "care_site_id")
    values <- c(values, if (is.null(care_site_id)) "NULL" else if (is(care_site_id, "subQuery")) paste0("(", as.character(care_site_id), ")") else paste0("'", as.character(care_site_id), "'"))
  }

  if (!missing(visit_source_value)) {
    fields <- c(fields, "visit_source_value")
    values <- c(values, if (is.null(visit_source_value)) "NULL" else if (is(visit_source_value, "subQuery")) paste0("(", as.character(visit_source_value), ")") else paste0("'", as.character(visit_source_value), "'"))
  }

  if (!missing(visit_source_concept_id)) {
    fields <- c(fields, "visit_source_concept_id")
    values <- c(values, if (is.null(visit_source_concept_id)) "NULL" else if (is(visit_source_concept_id, "subQuery")) paste0("(", as.character(visit_source_concept_id), ")") else paste0("'", as.character(visit_source_concept_id), "'"))
  }

  if (!missing(admitting_source_value)) {
    fields <- c(fields, "admitting_source_value")
    values <- c(values, if (is.null(admitting_source_value)) "NULL" else if (is(admitting_source_value, "subQuery")) paste0("(", as.character(admitting_source_value), ")") else paste0("'", as.character(admitting_source_value), "'"))
  }

  if (!missing(admitting_source_concept_id)) {
    fields <- c(fields, "admitting_source_concept_id")
    values <- c(values, if (is.null(admitting_source_concept_id)) "NULL" else if (is(admitting_source_concept_id, "subQuery")) paste0("(", as.character(admitting_source_concept_id), ")") else paste0("'", as.character(admitting_source_concept_id), "'"))
  }

  if (!missing(discharge_to_source_value)) {
    fields <- c(fields, "discharge_to_source_value")
    values <- c(values, if (is.null(discharge_to_source_value)) "NULL" else if (is(discharge_to_source_value, "subQuery")) paste0("(", as.character(discharge_to_source_value), ")") else paste0("'", as.character(discharge_to_source_value), "'"))
  }

  if (!missing(discharge_to_concept_id)) {
    fields <- c(fields, "discharge_to_concept_id")
    values <- c(values, if (is.null(discharge_to_concept_id)) "NULL" else if (is(discharge_to_concept_id, "subQuery")) paste0("(", as.character(discharge_to_concept_id), ")") else paste0("'", as.character(discharge_to_concept_id), "'"))
  }

  if (!missing(preceding_visit_detail_id)) {
    fields <- c(fields, "preceding_visit_detail_id")
    values <- c(values, if (is.null(preceding_visit_detail_id)) "NULL" else if (is(preceding_visit_detail_id, "subQuery")) paste0("(", as.character(preceding_visit_detail_id), ")") else paste0("'", as.character(preceding_visit_detail_id), "'"))
  }

  if (!missing(visit_detail_parent_id)) {
    fields <- c(fields, "visit_detail_parent_id")
    values <- c(values, if (is.null(visit_detail_parent_id)) "NULL" else if (is(visit_detail_parent_id, "subQuery")) paste0("(", as.character(visit_detail_parent_id), ")") else paste0("'", as.character(visit_detail_parent_id), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    fields <- c(fields, "visit_occurrence_id")
    values <- c(values, if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 2, table = "visit_detail", fields = fields, values = values)
  expects$rowCount = rowCount
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_count_visit_occurrence <- function(rowCount, visit_occurrence_id, person_id, visit_concept_id, visit_start_date, visit_start_datetime, visit_end_date, visit_end_datetime, visit_type_concept_id, provider_id, care_site_id, visit_source_value, visit_source_concept_id, admitting_source_concept_id, admitting_source_value, discharge_to_concept_id, discharge_to_source_value, preceding_visit_occurrence_id) {
  fields <- c()
  values <- c()
  if (!missing(visit_occurrence_id)) {
    fields <- c(fields, "visit_occurrence_id")
    values <- c(values, if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(visit_concept_id)) {
    fields <- c(fields, "visit_concept_id")
    values <- c(values, if (is.null(visit_concept_id)) "NULL" else if (is(visit_concept_id, "subQuery")) paste0("(", as.character(visit_concept_id), ")") else paste0("'", as.character(visit_concept_id), "'"))
  }

  if (!missing(visit_start_date)) {
    fields <- c(fields, "visit_start_date")
    values <- c(values, if (is.null(visit_start_date)) "NULL" else if (is(visit_start_date, "subQuery")) paste0("(", as.character(visit_start_date), ")") else paste0("'", as.character(visit_start_date), "'"))
  }

  if (!missing(visit_start_datetime)) {
    fields <- c(fields, "visit_start_datetime")
    values <- c(values, if (is.null(visit_start_datetime)) "NULL" else if (is(visit_start_datetime, "subQuery")) paste0("(", as.character(visit_start_datetime), ")") else paste0("'", as.character(visit_start_datetime), "'"))
  }

  if (!missing(visit_end_date)) {
    fields <- c(fields, "visit_end_date")
    values <- c(values, if (is.null(visit_end_date)) "NULL" else if (is(visit_end_date, "subQuery")) paste0("(", as.character(visit_end_date), ")") else paste0("'", as.character(visit_end_date), "'"))
  }

  if (!missing(visit_end_datetime)) {
    fields <- c(fields, "visit_end_datetime")
    values <- c(values, if (is.null(visit_end_datetime)) "NULL" else if (is(visit_end_datetime, "subQuery")) paste0("(", as.character(visit_end_datetime), ")") else paste0("'", as.character(visit_end_datetime), "'"))
  }

  if (!missing(visit_type_concept_id)) {
    fields <- c(fields, "visit_type_concept_id")
    values <- c(values, if (is.null(visit_type_concept_id)) "NULL" else if (is(visit_type_concept_id, "subQuery")) paste0("(", as.character(visit_type_concept_id), ")") else paste0("'", as.character(visit_type_concept_id), "'"))
  }

  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(care_site_id)) {
    fields <- c(fields, "care_site_id")
    values <- c(values, if (is.null(care_site_id)) "NULL" else if (is(care_site_id, "subQuery")) paste0("(", as.character(care_site_id), ")") else paste0("'", as.character(care_site_id), "'"))
  }

  if (!missing(visit_source_value)) {
    fields <- c(fields, "visit_source_value")
    values <- c(values, if (is.null(visit_source_value)) "NULL" else if (is(visit_source_value, "subQuery")) paste0("(", as.character(visit_source_value), ")") else paste0("'", as.character(visit_source_value), "'"))
  }

  if (!missing(visit_source_concept_id)) {
    fields <- c(fields, "visit_source_concept_id")
    values <- c(values, if (is.null(visit_source_concept_id)) "NULL" else if (is(visit_source_concept_id, "subQuery")) paste0("(", as.character(visit_source_concept_id), ")") else paste0("'", as.character(visit_source_concept_id), "'"))
  }

  if (!missing(admitting_source_concept_id)) {
    fields <- c(fields, "admitting_source_concept_id")
    values <- c(values, if (is.null(admitting_source_concept_id)) "NULL" else if (is(admitting_source_concept_id, "subQuery")) paste0("(", as.character(admitting_source_concept_id), ")") else paste0("'", as.character(admitting_source_concept_id), "'"))
  }

  if (!missing(admitting_source_value)) {
    fields <- c(fields, "admitting_source_value")
    values <- c(values, if (is.null(admitting_source_value)) "NULL" else if (is(admitting_source_value, "subQuery")) paste0("(", as.character(admitting_source_value), ")") else paste0("'", as.character(admitting_source_value), "'"))
  }

  if (!missing(discharge_to_concept_id)) {
    fields <- c(fields, "discharge_to_concept_id")
    values <- c(values, if (is.null(discharge_to_concept_id)) "NULL" else if (is(discharge_to_concept_id, "subQuery")) paste0("(", as.character(discharge_to_concept_id), ")") else paste0("'", as.character(discharge_to_concept_id), "'"))
  }

  if (!missing(discharge_to_source_value)) {
    fields <- c(fields, "discharge_to_source_value")
    values <- c(values, if (is.null(discharge_to_source_value)) "NULL" else if (is(discharge_to_source_value, "subQuery")) paste0("(", as.character(discharge_to_source_value), ")") else paste0("'", as.character(discharge_to_source_value), "'"))
  }

  if (!missing(preceding_visit_occurrence_id)) {
    fields <- c(fields, "preceding_visit_occurrence_id")
    values <- c(values, if (is.null(preceding_visit_occurrence_id)) "NULL" else if (is(preceding_visit_occurrence_id, "subQuery")) paste0("(", as.character(preceding_visit_occurrence_id), ")") else paste0("'", as.character(preceding_visit_occurrence_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 2, table = "visit_occurrence", fields = fields, values = values)
  expects$rowCount = rowCount
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_count_cohort <- function(rowCount, cohort_definition_id, subject_id, cohort_start_date, cohort_end_date) {
  fields <- c()
  values <- c()
  if (!missing(cohort_definition_id)) {
    fields <- c(fields, "cohort_definition_id")
    values <- c(values, if (is.null(cohort_definition_id)) "NULL" else if (is(cohort_definition_id, "subQuery")) paste0("(", as.character(cohort_definition_id), ")") else paste0("'", as.character(cohort_definition_id), "'"))
  }

  if (!missing(subject_id)) {
    fields <- c(fields, "subject_id")
    values <- c(values, if (is.null(subject_id)) "NULL" else if (is(subject_id, "subQuery")) paste0("(", as.character(subject_id), ")") else paste0("'", as.character(subject_id), "'"))
  }

  if (!missing(cohort_start_date)) {
    fields <- c(fields, "cohort_start_date")
    values <- c(values, if (is.null(cohort_start_date)) "NULL" else if (is(cohort_start_date, "subQuery")) paste0("(", as.character(cohort_start_date), ")") else paste0("'", as.character(cohort_start_date), "'"))
  }

  if (!missing(cohort_end_date)) {
    fields <- c(fields, "cohort_end_date")
    values <- c(values, if (is.null(cohort_end_date)) "NULL" else if (is(cohort_end_date, "subQuery")) paste0("(", as.character(cohort_end_date), ")") else paste0("'", as.character(cohort_end_date), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 2, table = "cohort", fields = fields, values = values)
  expects$rowCount = rowCount
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_count_cohort_attribute <- function(rowCount, cohort_definition_id, subject_id, cohort_start_date, cohort_end_date, attribute_definition_id, value_as_number, value_as_concept_id) {
  fields <- c()
  values <- c()
  if (!missing(cohort_definition_id)) {
    fields <- c(fields, "cohort_definition_id")
    values <- c(values, if (is.null(cohort_definition_id)) "NULL" else if (is(cohort_definition_id, "subQuery")) paste0("(", as.character(cohort_definition_id), ")") else paste0("'", as.character(cohort_definition_id), "'"))
  }

  if (!missing(subject_id)) {
    fields <- c(fields, "subject_id")
    values <- c(values, if (is.null(subject_id)) "NULL" else if (is(subject_id, "subQuery")) paste0("(", as.character(subject_id), ")") else paste0("'", as.character(subject_id), "'"))
  }

  if (!missing(cohort_start_date)) {
    fields <- c(fields, "cohort_start_date")
    values <- c(values, if (is.null(cohort_start_date)) "NULL" else if (is(cohort_start_date, "subQuery")) paste0("(", as.character(cohort_start_date), ")") else paste0("'", as.character(cohort_start_date), "'"))
  }

  if (!missing(cohort_end_date)) {
    fields <- c(fields, "cohort_end_date")
    values <- c(values, if (is.null(cohort_end_date)) "NULL" else if (is(cohort_end_date, "subQuery")) paste0("(", as.character(cohort_end_date), ")") else paste0("'", as.character(cohort_end_date), "'"))
  }

  if (!missing(attribute_definition_id)) {
    fields <- c(fields, "attribute_definition_id")
    values <- c(values, if (is.null(attribute_definition_id)) "NULL" else if (is(attribute_definition_id, "subQuery")) paste0("(", as.character(attribute_definition_id), ")") else paste0("'", as.character(attribute_definition_id), "'"))
  }

  if (!missing(value_as_number)) {
    fields <- c(fields, "value_as_number")
    values <- c(values, if (is.null(value_as_number)) "NULL" else if (is(value_as_number, "subQuery")) paste0("(", as.character(value_as_number), ")") else paste0("'", as.character(value_as_number), "'"))
  }

  if (!missing(value_as_concept_id)) {
    fields <- c(fields, "value_as_concept_id")
    values <- c(values, if (is.null(value_as_concept_id)) "NULL" else if (is(value_as_concept_id, "subQuery")) paste0("(", as.character(value_as_concept_id), ")") else paste0("'", as.character(value_as_concept_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 2, table = "cohort_attribute", fields = fields, values = values)
  expects$rowCount = rowCount
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_count_condition_era <- function(rowCount, condition_era_id, person_id, condition_concept_id, condition_era_start_date, condition_era_end_date, condition_occurrence_count) {
  fields <- c()
  values <- c()
  if (!missing(condition_era_id)) {
    fields <- c(fields, "condition_era_id")
    values <- c(values, if (is.null(condition_era_id)) "NULL" else if (is(condition_era_id, "subQuery")) paste0("(", as.character(condition_era_id), ")") else paste0("'", as.character(condition_era_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(condition_concept_id)) {
    fields <- c(fields, "condition_concept_id")
    values <- c(values, if (is.null(condition_concept_id)) "NULL" else if (is(condition_concept_id, "subQuery")) paste0("(", as.character(condition_concept_id), ")") else paste0("'", as.character(condition_concept_id), "'"))
  }

  if (!missing(condition_era_start_date)) {
    fields <- c(fields, "condition_era_start_date")
    values <- c(values, if (is.null(condition_era_start_date)) "NULL" else if (is(condition_era_start_date, "subQuery")) paste0("(", as.character(condition_era_start_date), ")") else paste0("'", as.character(condition_era_start_date), "'"))
  }

  if (!missing(condition_era_end_date)) {
    fields <- c(fields, "condition_era_end_date")
    values <- c(values, if (is.null(condition_era_end_date)) "NULL" else if (is(condition_era_end_date, "subQuery")) paste0("(", as.character(condition_era_end_date), ")") else paste0("'", as.character(condition_era_end_date), "'"))
  }

  if (!missing(condition_occurrence_count)) {
    fields <- c(fields, "condition_occurrence_count")
    values <- c(values, if (is.null(condition_occurrence_count)) "NULL" else if (is(condition_occurrence_count, "subQuery")) paste0("(", as.character(condition_occurrence_count), ")") else paste0("'", as.character(condition_occurrence_count), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 2, table = "condition_era", fields = fields, values = values)
  expects$rowCount = rowCount
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_count_dose_era <- function(rowCount, dose_era_id, person_id, drug_concept_id, unit_concept_id, dose_value, dose_era_start_date, dose_era_end_date) {
  fields <- c()
  values <- c()
  if (!missing(dose_era_id)) {
    fields <- c(fields, "dose_era_id")
    values <- c(values, if (is.null(dose_era_id)) "NULL" else if (is(dose_era_id, "subQuery")) paste0("(", as.character(dose_era_id), ")") else paste0("'", as.character(dose_era_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(drug_concept_id)) {
    fields <- c(fields, "drug_concept_id")
    values <- c(values, if (is.null(drug_concept_id)) "NULL" else if (is(drug_concept_id, "subQuery")) paste0("(", as.character(drug_concept_id), ")") else paste0("'", as.character(drug_concept_id), "'"))
  }

  if (!missing(unit_concept_id)) {
    fields <- c(fields, "unit_concept_id")
    values <- c(values, if (is.null(unit_concept_id)) "NULL" else if (is(unit_concept_id, "subQuery")) paste0("(", as.character(unit_concept_id), ")") else paste0("'", as.character(unit_concept_id), "'"))
  }

  if (!missing(dose_value)) {
    fields <- c(fields, "dose_value")
    values <- c(values, if (is.null(dose_value)) "NULL" else if (is(dose_value, "subQuery")) paste0("(", as.character(dose_value), ")") else paste0("'", as.character(dose_value), "'"))
  }

  if (!missing(dose_era_start_date)) {
    fields <- c(fields, "dose_era_start_date")
    values <- c(values, if (is.null(dose_era_start_date)) "NULL" else if (is(dose_era_start_date, "subQuery")) paste0("(", as.character(dose_era_start_date), ")") else paste0("'", as.character(dose_era_start_date), "'"))
  }

  if (!missing(dose_era_end_date)) {
    fields <- c(fields, "dose_era_end_date")
    values <- c(values, if (is.null(dose_era_end_date)) "NULL" else if (is(dose_era_end_date, "subQuery")) paste0("(", as.character(dose_era_end_date), ")") else paste0("'", as.character(dose_era_end_date), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 2, table = "dose_era", fields = fields, values = values)
  expects$rowCount = rowCount
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_count_drug_era <- function(rowCount, drug_era_id, person_id, drug_concept_id, drug_era_start_date, drug_era_end_date, drug_exposure_count, gap_days) {
  fields <- c()
  values <- c()
  if (!missing(drug_era_id)) {
    fields <- c(fields, "drug_era_id")
    values <- c(values, if (is.null(drug_era_id)) "NULL" else if (is(drug_era_id, "subQuery")) paste0("(", as.character(drug_era_id), ")") else paste0("'", as.character(drug_era_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(drug_concept_id)) {
    fields <- c(fields, "drug_concept_id")
    values <- c(values, if (is.null(drug_concept_id)) "NULL" else if (is(drug_concept_id, "subQuery")) paste0("(", as.character(drug_concept_id), ")") else paste0("'", as.character(drug_concept_id), "'"))
  }

  if (!missing(drug_era_start_date)) {
    fields <- c(fields, "drug_era_start_date")
    values <- c(values, if (is.null(drug_era_start_date)) "NULL" else if (is(drug_era_start_date, "subQuery")) paste0("(", as.character(drug_era_start_date), ")") else paste0("'", as.character(drug_era_start_date), "'"))
  }

  if (!missing(drug_era_end_date)) {
    fields <- c(fields, "drug_era_end_date")
    values <- c(values, if (is.null(drug_era_end_date)) "NULL" else if (is(drug_era_end_date, "subQuery")) paste0("(", as.character(drug_era_end_date), ")") else paste0("'", as.character(drug_era_end_date), "'"))
  }

  if (!missing(drug_exposure_count)) {
    fields <- c(fields, "drug_exposure_count")
    values <- c(values, if (is.null(drug_exposure_count)) "NULL" else if (is(drug_exposure_count, "subQuery")) paste0("(", as.character(drug_exposure_count), ")") else paste0("'", as.character(drug_exposure_count), "'"))
  }

  if (!missing(gap_days)) {
    fields <- c(fields, "gap_days")
    values <- c(values, if (is.null(gap_days)) "NULL" else if (is(gap_days, "subQuery")) paste0("(", as.character(gap_days), ")") else paste0("'", as.character(gap_days), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 2, table = "drug_era", fields = fields, values = values)
  expects$rowCount = rowCount
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_count_cost <- function(rowCount, cost_id, cost_event_id, cost_domain_id, cost_type_concept_id, currency_concept_id, total_charge, total_cost, total_paid, paid_by_payer, paid_by_patient, paid_patient_copay, paid_patient_coinsurance, paid_patient_deductible, paid_by_primary, paid_ingredient_cost, paid_dispensing_fee, payer_plan_period_id, amount_allowed, revenue_code_concept_id, revenue_code_source_value, drg_concept_id, drg_source_value) {
  fields <- c()
  values <- c()
  if (!missing(cost_id)) {
    fields <- c(fields, "cost_id")
    values <- c(values, if (is.null(cost_id)) "NULL" else if (is(cost_id, "subQuery")) paste0("(", as.character(cost_id), ")") else paste0("'", as.character(cost_id), "'"))
  }

  if (!missing(cost_event_id)) {
    fields <- c(fields, "cost_event_id")
    values <- c(values, if (is.null(cost_event_id)) "NULL" else if (is(cost_event_id, "subQuery")) paste0("(", as.character(cost_event_id), ")") else paste0("'", as.character(cost_event_id), "'"))
  }

  if (!missing(cost_domain_id)) {
    fields <- c(fields, "cost_domain_id")
    values <- c(values, if (is.null(cost_domain_id)) "NULL" else if (is(cost_domain_id, "subQuery")) paste0("(", as.character(cost_domain_id), ")") else paste0("'", as.character(cost_domain_id), "'"))
  }

  if (!missing(cost_type_concept_id)) {
    fields <- c(fields, "cost_type_concept_id")
    values <- c(values, if (is.null(cost_type_concept_id)) "NULL" else if (is(cost_type_concept_id, "subQuery")) paste0("(", as.character(cost_type_concept_id), ")") else paste0("'", as.character(cost_type_concept_id), "'"))
  }

  if (!missing(currency_concept_id)) {
    fields <- c(fields, "currency_concept_id")
    values <- c(values, if (is.null(currency_concept_id)) "NULL" else if (is(currency_concept_id, "subQuery")) paste0("(", as.character(currency_concept_id), ")") else paste0("'", as.character(currency_concept_id), "'"))
  }

  if (!missing(total_charge)) {
    fields <- c(fields, "total_charge")
    values <- c(values, if (is.null(total_charge)) "NULL" else if (is(total_charge, "subQuery")) paste0("(", as.character(total_charge), ")") else paste0("'", as.character(total_charge), "'"))
  }

  if (!missing(total_cost)) {
    fields <- c(fields, "total_cost")
    values <- c(values, if (is.null(total_cost)) "NULL" else if (is(total_cost, "subQuery")) paste0("(", as.character(total_cost), ")") else paste0("'", as.character(total_cost), "'"))
  }

  if (!missing(total_paid)) {
    fields <- c(fields, "total_paid")
    values <- c(values, if (is.null(total_paid)) "NULL" else if (is(total_paid, "subQuery")) paste0("(", as.character(total_paid), ")") else paste0("'", as.character(total_paid), "'"))
  }

  if (!missing(paid_by_payer)) {
    fields <- c(fields, "paid_by_payer")
    values <- c(values, if (is.null(paid_by_payer)) "NULL" else if (is(paid_by_payer, "subQuery")) paste0("(", as.character(paid_by_payer), ")") else paste0("'", as.character(paid_by_payer), "'"))
  }

  if (!missing(paid_by_patient)) {
    fields <- c(fields, "paid_by_patient")
    values <- c(values, if (is.null(paid_by_patient)) "NULL" else if (is(paid_by_patient, "subQuery")) paste0("(", as.character(paid_by_patient), ")") else paste0("'", as.character(paid_by_patient), "'"))
  }

  if (!missing(paid_patient_copay)) {
    fields <- c(fields, "paid_patient_copay")
    values <- c(values, if (is.null(paid_patient_copay)) "NULL" else if (is(paid_patient_copay, "subQuery")) paste0("(", as.character(paid_patient_copay), ")") else paste0("'", as.character(paid_patient_copay), "'"))
  }

  if (!missing(paid_patient_coinsurance)) {
    fields <- c(fields, "paid_patient_coinsurance")
    values <- c(values, if (is.null(paid_patient_coinsurance)) "NULL" else if (is(paid_patient_coinsurance, "subQuery")) paste0("(", as.character(paid_patient_coinsurance), ")") else paste0("'", as.character(paid_patient_coinsurance), "'"))
  }

  if (!missing(paid_patient_deductible)) {
    fields <- c(fields, "paid_patient_deductible")
    values <- c(values, if (is.null(paid_patient_deductible)) "NULL" else if (is(paid_patient_deductible, "subQuery")) paste0("(", as.character(paid_patient_deductible), ")") else paste0("'", as.character(paid_patient_deductible), "'"))
  }

  if (!missing(paid_by_primary)) {
    fields <- c(fields, "paid_by_primary")
    values <- c(values, if (is.null(paid_by_primary)) "NULL" else if (is(paid_by_primary, "subQuery")) paste0("(", as.character(paid_by_primary), ")") else paste0("'", as.character(paid_by_primary), "'"))
  }

  if (!missing(paid_ingredient_cost)) {
    fields <- c(fields, "paid_ingredient_cost")
    values <- c(values, if (is.null(paid_ingredient_cost)) "NULL" else if (is(paid_ingredient_cost, "subQuery")) paste0("(", as.character(paid_ingredient_cost), ")") else paste0("'", as.character(paid_ingredient_cost), "'"))
  }

  if (!missing(paid_dispensing_fee)) {
    fields <- c(fields, "paid_dispensing_fee")
    values <- c(values, if (is.null(paid_dispensing_fee)) "NULL" else if (is(paid_dispensing_fee, "subQuery")) paste0("(", as.character(paid_dispensing_fee), ")") else paste0("'", as.character(paid_dispensing_fee), "'"))
  }

  if (!missing(payer_plan_period_id)) {
    fields <- c(fields, "payer_plan_period_id")
    values <- c(values, if (is.null(payer_plan_period_id)) "NULL" else if (is(payer_plan_period_id, "subQuery")) paste0("(", as.character(payer_plan_period_id), ")") else paste0("'", as.character(payer_plan_period_id), "'"))
  }

  if (!missing(amount_allowed)) {
    fields <- c(fields, "amount_allowed")
    values <- c(values, if (is.null(amount_allowed)) "NULL" else if (is(amount_allowed, "subQuery")) paste0("(", as.character(amount_allowed), ")") else paste0("'", as.character(amount_allowed), "'"))
  }

  if (!missing(revenue_code_concept_id)) {
    fields <- c(fields, "revenue_code_concept_id")
    values <- c(values, if (is.null(revenue_code_concept_id)) "NULL" else if (is(revenue_code_concept_id, "subQuery")) paste0("(", as.character(revenue_code_concept_id), ")") else paste0("'", as.character(revenue_code_concept_id), "'"))
  }

  if (!missing(revenue_code_source_value)) {
    fields <- c(fields, "revenue_code_source_value")
    values <- c(values, if (is.null(revenue_code_source_value)) "NULL" else if (is(revenue_code_source_value, "subQuery")) paste0("(", as.character(revenue_code_source_value), ")") else paste0("'", as.character(revenue_code_source_value), "'"))
  }

  if (!missing(drg_concept_id)) {
    fields <- c(fields, "drg_concept_id")
    values <- c(values, if (is.null(drg_concept_id)) "NULL" else if (is(drg_concept_id, "subQuery")) paste0("(", as.character(drg_concept_id), ")") else paste0("'", as.character(drg_concept_id), "'"))
  }

  if (!missing(drg_source_value)) {
    fields <- c(fields, "drg_source_value")
    values <- c(values, if (is.null(drg_source_value)) "NULL" else if (is(drg_source_value, "subQuery")) paste0("(", as.character(drg_source_value), ")") else paste0("'", as.character(drg_source_value), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 2, table = "cost", fields = fields, values = values)
  expects$rowCount = rowCount
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_count_payer_plan_period <- function(rowCount, payer_plan_period_id, person_id, payer_plan_period_start_date, payer_plan_period_end_date, payer_source_value, plan_source_value, family_source_value) {
  fields <- c()
  values <- c()
  if (!missing(payer_plan_period_id)) {
    fields <- c(fields, "payer_plan_period_id")
    values <- c(values, if (is.null(payer_plan_period_id)) "NULL" else if (is(payer_plan_period_id, "subQuery")) paste0("(", as.character(payer_plan_period_id), ")") else paste0("'", as.character(payer_plan_period_id), "'"))
  }

  if (!missing(person_id)) {
    fields <- c(fields, "person_id")
    values <- c(values, if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(payer_plan_period_start_date)) {
    fields <- c(fields, "payer_plan_period_start_date")
    values <- c(values, if (is.null(payer_plan_period_start_date)) "NULL" else if (is(payer_plan_period_start_date, "subQuery")) paste0("(", as.character(payer_plan_period_start_date), ")") else paste0("'", as.character(payer_plan_period_start_date), "'"))
  }

  if (!missing(payer_plan_period_end_date)) {
    fields <- c(fields, "payer_plan_period_end_date")
    values <- c(values, if (is.null(payer_plan_period_end_date)) "NULL" else if (is(payer_plan_period_end_date, "subQuery")) paste0("(", as.character(payer_plan_period_end_date), ")") else paste0("'", as.character(payer_plan_period_end_date), "'"))
  }

  if (!missing(payer_source_value)) {
    fields <- c(fields, "payer_source_value")
    values <- c(values, if (is.null(payer_source_value)) "NULL" else if (is(payer_source_value, "subQuery")) paste0("(", as.character(payer_source_value), ")") else paste0("'", as.character(payer_source_value), "'"))
  }

  if (!missing(plan_source_value)) {
    fields <- c(fields, "plan_source_value")
    values <- c(values, if (is.null(plan_source_value)) "NULL" else if (is(plan_source_value, "subQuery")) paste0("(", as.character(plan_source_value), ")") else paste0("'", as.character(plan_source_value), "'"))
  }

  if (!missing(family_source_value)) {
    fields <- c(fields, "family_source_value")
    values <- c(values, if (is.null(family_source_value)) "NULL" else if (is(family_source_value, "subQuery")) paste0("(", as.character(family_source_value), ")") else paste0("'", as.character(family_source_value), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 2, table = "payer_plan_period", fields = fields, values = values)
  expects$rowCount = rowCount
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_count_care_site <- function(rowCount, care_site_id, care_site_name, place_of_service_concept_id, location_id, care_site_source_value, place_of_service_source_value) {
  fields <- c()
  values <- c()
  if (!missing(care_site_id)) {
    fields <- c(fields, "care_site_id")
    values <- c(values, if (is.null(care_site_id)) "NULL" else if (is(care_site_id, "subQuery")) paste0("(", as.character(care_site_id), ")") else paste0("'", as.character(care_site_id), "'"))
  }

  if (!missing(care_site_name)) {
    fields <- c(fields, "care_site_name")
    values <- c(values, if (is.null(care_site_name)) "NULL" else if (is(care_site_name, "subQuery")) paste0("(", as.character(care_site_name), ")") else paste0("'", as.character(care_site_name), "'"))
  }

  if (!missing(place_of_service_concept_id)) {
    fields <- c(fields, "place_of_service_concept_id")
    values <- c(values, if (is.null(place_of_service_concept_id)) "NULL" else if (is(place_of_service_concept_id, "subQuery")) paste0("(", as.character(place_of_service_concept_id), ")") else paste0("'", as.character(place_of_service_concept_id), "'"))
  }

  if (!missing(location_id)) {
    fields <- c(fields, "location_id")
    values <- c(values, if (is.null(location_id)) "NULL" else if (is(location_id, "subQuery")) paste0("(", as.character(location_id), ")") else paste0("'", as.character(location_id), "'"))
  }

  if (!missing(care_site_source_value)) {
    fields <- c(fields, "care_site_source_value")
    values <- c(values, if (is.null(care_site_source_value)) "NULL" else if (is(care_site_source_value, "subQuery")) paste0("(", as.character(care_site_source_value), ")") else paste0("'", as.character(care_site_source_value), "'"))
  }

  if (!missing(place_of_service_source_value)) {
    fields <- c(fields, "place_of_service_source_value")
    values <- c(values, if (is.null(place_of_service_source_value)) "NULL" else if (is(place_of_service_source_value, "subQuery")) paste0("(", as.character(place_of_service_source_value), ")") else paste0("'", as.character(place_of_service_source_value), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 2, table = "care_site", fields = fields, values = values)
  expects$rowCount = rowCount
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_count_location <- function(rowCount, location_id, address_1, address_2, city, state, zip, county, location_source_value) {
  fields <- c()
  values <- c()
  if (!missing(location_id)) {
    fields <- c(fields, "location_id")
    values <- c(values, if (is.null(location_id)) "NULL" else if (is(location_id, "subQuery")) paste0("(", as.character(location_id), ")") else paste0("'", as.character(location_id), "'"))
  }

  if (!missing(address_1)) {
    fields <- c(fields, "address_1")
    values <- c(values, if (is.null(address_1)) "NULL" else if (is(address_1, "subQuery")) paste0("(", as.character(address_1), ")") else paste0("'", as.character(address_1), "'"))
  }

  if (!missing(address_2)) {
    fields <- c(fields, "address_2")
    values <- c(values, if (is.null(address_2)) "NULL" else if (is(address_2, "subQuery")) paste0("(", as.character(address_2), ")") else paste0("'", as.character(address_2), "'"))
  }

  if (!missing(city)) {
    fields <- c(fields, "city")
    values <- c(values, if (is.null(city)) "NULL" else if (is(city, "subQuery")) paste0("(", as.character(city), ")") else paste0("'", as.character(city), "'"))
  }

  if (!missing(state)) {
    fields <- c(fields, "state")
    values <- c(values, if (is.null(state)) "NULL" else if (is(state, "subQuery")) paste0("(", as.character(state), ")") else paste0("'", as.character(state), "'"))
  }

  if (!missing(zip)) {
    fields <- c(fields, "zip")
    values <- c(values, if (is.null(zip)) "NULL" else if (is(zip, "subQuery")) paste0("(", as.character(zip), ")") else paste0("'", as.character(zip), "'"))
  }

  if (!missing(county)) {
    fields <- c(fields, "county")
    values <- c(values, if (is.null(county)) "NULL" else if (is(county, "subQuery")) paste0("(", as.character(county), ")") else paste0("'", as.character(county), "'"))
  }

  if (!missing(location_source_value)) {
    fields <- c(fields, "location_source_value")
    values <- c(values, if (is.null(location_source_value)) "NULL" else if (is(location_source_value, "subQuery")) paste0("(", as.character(location_source_value), ")") else paste0("'", as.character(location_source_value), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 2, table = "location", fields = fields, values = values)
  expects$rowCount = rowCount
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_count_provider <- function(rowCount, provider_id, provider_name, npi, dea, specialty_concept_id, care_site_id, year_of_birth, gender_concept_id, provider_source_value, specialty_source_value, specialty_source_concept_id, gender_source_value, gender_source_concept_id) {
  fields <- c()
  values <- c()
  if (!missing(provider_id)) {
    fields <- c(fields, "provider_id")
    values <- c(values, if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(provider_name)) {
    fields <- c(fields, "provider_name")
    values <- c(values, if (is.null(provider_name)) "NULL" else if (is(provider_name, "subQuery")) paste0("(", as.character(provider_name), ")") else paste0("'", as.character(provider_name), "'"))
  }

  if (!missing(npi)) {
    fields <- c(fields, "npi")
    values <- c(values, if (is.null(npi)) "NULL" else if (is(npi, "subQuery")) paste0("(", as.character(npi), ")") else paste0("'", as.character(npi), "'"))
  }

  if (!missing(dea)) {
    fields <- c(fields, "dea")
    values <- c(values, if (is.null(dea)) "NULL" else if (is(dea, "subQuery")) paste0("(", as.character(dea), ")") else paste0("'", as.character(dea), "'"))
  }

  if (!missing(specialty_concept_id)) {
    fields <- c(fields, "specialty_concept_id")
    values <- c(values, if (is.null(specialty_concept_id)) "NULL" else if (is(specialty_concept_id, "subQuery")) paste0("(", as.character(specialty_concept_id), ")") else paste0("'", as.character(specialty_concept_id), "'"))
  }

  if (!missing(care_site_id)) {
    fields <- c(fields, "care_site_id")
    values <- c(values, if (is.null(care_site_id)) "NULL" else if (is(care_site_id, "subQuery")) paste0("(", as.character(care_site_id), ")") else paste0("'", as.character(care_site_id), "'"))
  }

  if (!missing(year_of_birth)) {
    fields <- c(fields, "year_of_birth")
    values <- c(values, if (is.null(year_of_birth)) "NULL" else if (is(year_of_birth, "subQuery")) paste0("(", as.character(year_of_birth), ")") else paste0("'", as.character(year_of_birth), "'"))
  }

  if (!missing(gender_concept_id)) {
    fields <- c(fields, "gender_concept_id")
    values <- c(values, if (is.null(gender_concept_id)) "NULL" else if (is(gender_concept_id, "subQuery")) paste0("(", as.character(gender_concept_id), ")") else paste0("'", as.character(gender_concept_id), "'"))
  }

  if (!missing(provider_source_value)) {
    fields <- c(fields, "provider_source_value")
    values <- c(values, if (is.null(provider_source_value)) "NULL" else if (is(provider_source_value, "subQuery")) paste0("(", as.character(provider_source_value), ")") else paste0("'", as.character(provider_source_value), "'"))
  }

  if (!missing(specialty_source_value)) {
    fields <- c(fields, "specialty_source_value")
    values <- c(values, if (is.null(specialty_source_value)) "NULL" else if (is(specialty_source_value, "subQuery")) paste0("(", as.character(specialty_source_value), ")") else paste0("'", as.character(specialty_source_value), "'"))
  }

  if (!missing(specialty_source_concept_id)) {
    fields <- c(fields, "specialty_source_concept_id")
    values <- c(values, if (is.null(specialty_source_concept_id)) "NULL" else if (is(specialty_source_concept_id, "subQuery")) paste0("(", as.character(specialty_source_concept_id), ")") else paste0("'", as.character(specialty_source_concept_id), "'"))
  }

  if (!missing(gender_source_value)) {
    fields <- c(fields, "gender_source_value")
    values <- c(values, if (is.null(gender_source_value)) "NULL" else if (is(gender_source_value, "subQuery")) paste0("(", as.character(gender_source_value), ")") else paste0("'", as.character(gender_source_value), "'"))
  }

  if (!missing(gender_source_concept_id)) {
    fields <- c(fields, "gender_source_concept_id")
    values <- c(values, if (is.null(gender_source_concept_id)) "NULL" else if (is(gender_source_concept_id, "subQuery")) paste0("(", as.character(gender_source_concept_id), ")") else paste0("'", as.character(gender_source_concept_id), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 2, table = "provider", fields = fields, values = values)
  expects$rowCount = rowCount
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_count_cdm_source <- function(rowCount, cdm_source_name, cdm_source_abbreviation, cdm_holder, source_description, source_documentation_reference, cdm_etl__reference, source_release_date, cdm_release_date, cdm_version, vocabulary_version) {
  fields <- c()
  values <- c()
  if (!missing(cdm_source_name)) {
    fields <- c(fields, "cdm_source_name")
    values <- c(values, if (is.null(cdm_source_name)) "NULL" else if (is(cdm_source_name, "subQuery")) paste0("(", as.character(cdm_source_name), ")") else paste0("'", as.character(cdm_source_name), "'"))
  }

  if (!missing(cdm_source_abbreviation)) {
    fields <- c(fields, "cdm_source_abbreviation")
    values <- c(values, if (is.null(cdm_source_abbreviation)) "NULL" else if (is(cdm_source_abbreviation, "subQuery")) paste0("(", as.character(cdm_source_abbreviation), ")") else paste0("'", as.character(cdm_source_abbreviation), "'"))
  }

  if (!missing(cdm_holder)) {
    fields <- c(fields, "cdm_holder")
    values <- c(values, if (is.null(cdm_holder)) "NULL" else if (is(cdm_holder, "subQuery")) paste0("(", as.character(cdm_holder), ")") else paste0("'", as.character(cdm_holder), "'"))
  }

  if (!missing(source_description)) {
    fields <- c(fields, "source_description")
    values <- c(values, if (is.null(source_description)) "NULL" else if (is(source_description, "subQuery")) paste0("(", as.character(source_description), ")") else paste0("'", as.character(source_description), "'"))
  }

  if (!missing(source_documentation_reference)) {
    fields <- c(fields, "source_documentation_reference")
    values <- c(values, if (is.null(source_documentation_reference)) "NULL" else if (is(source_documentation_reference, "subQuery")) paste0("(", as.character(source_documentation_reference), ")") else paste0("'", as.character(source_documentation_reference), "'"))
  }

  if (!missing(cdm_etl__reference)) {
    fields <- c(fields, "[cdm_etl _reference]")
    values <- c(values, if (is.null(cdm_etl__reference)) "NULL" else if (is(cdm_etl__reference, "subQuery")) paste0("(", as.character(cdm_etl__reference), ")") else paste0("'", as.character(cdm_etl__reference), "'"))
  }

  if (!missing(source_release_date)) {
    fields <- c(fields, "source_release_date")
    values <- c(values, if (is.null(source_release_date)) "NULL" else if (is(source_release_date, "subQuery")) paste0("(", as.character(source_release_date), ")") else paste0("'", as.character(source_release_date), "'"))
  }

  if (!missing(cdm_release_date)) {
    fields <- c(fields, "cdm_release_date")
    values <- c(values, if (is.null(cdm_release_date)) "NULL" else if (is(cdm_release_date, "subQuery")) paste0("(", as.character(cdm_release_date), ")") else paste0("'", as.character(cdm_release_date), "'"))
  }

  if (!missing(cdm_version)) {
    fields <- c(fields, "cdm_version")
    values <- c(values, if (is.null(cdm_version)) "NULL" else if (is(cdm_version, "subQuery")) paste0("(", as.character(cdm_version), ")") else paste0("'", as.character(cdm_version), "'"))
  }

  if (!missing(vocabulary_version)) {
    fields <- c(fields, "vocabulary_version")
    values <- c(values, if (is.null(vocabulary_version)) "NULL" else if (is(vocabulary_version, "subQuery")) paste0("(", as.character(vocabulary_version), ")") else paste0("'", as.character(vocabulary_version), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 2, table = "cdm_source", fields = fields, values = values)
  expects$rowCount = rowCount
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_count_attribute_definition <- function(rowCount, attribute_definition_id, attribute_name, attribute_description, attribute_type_concept_id, attribute_syntax) {
  fields <- c()
  values <- c()
  if (!missing(attribute_definition_id)) {
    fields <- c(fields, "attribute_definition_id")
    values <- c(values, if (is.null(attribute_definition_id)) "NULL" else if (is(attribute_definition_id, "subQuery")) paste0("(", as.character(attribute_definition_id), ")") else paste0("'", as.character(attribute_definition_id), "'"))
  }

  if (!missing(attribute_name)) {
    fields <- c(fields, "attribute_name")
    values <- c(values, if (is.null(attribute_name)) "NULL" else if (is(attribute_name, "subQuery")) paste0("(", as.character(attribute_name), ")") else paste0("'", as.character(attribute_name), "'"))
  }

  if (!missing(attribute_description)) {
    fields <- c(fields, "attribute_description")
    values <- c(values, if (is.null(attribute_description)) "NULL" else if (is(attribute_description, "subQuery")) paste0("(", as.character(attribute_description), ")") else paste0("'", as.character(attribute_description), "'"))
  }

  if (!missing(attribute_type_concept_id)) {
    fields <- c(fields, "attribute_type_concept_id")
    values <- c(values, if (is.null(attribute_type_concept_id)) "NULL" else if (is(attribute_type_concept_id, "subQuery")) paste0("(", as.character(attribute_type_concept_id), ")") else paste0("'", as.character(attribute_type_concept_id), "'"))
  }

  if (!missing(attribute_syntax)) {
    fields <- c(fields, "attribute_syntax")
    values <- c(values, if (is.null(attribute_syntax)) "NULL" else if (is(attribute_syntax, "subQuery")) paste0("(", as.character(attribute_syntax), ")") else paste0("'", as.character(attribute_syntax), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 2, table = "attribute_definition", fields = fields, values = values)
  expects$rowCount = rowCount
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

expect_count_cohort_definition <- function(rowCount, cohort_definition_id, cohort_definition_name, cohort_definition_description, definition_type_concept_id, cohort_definition_syntax, subject_concept_id, cohort_instantiation_date) {
  fields <- c()
  values <- c()
  if (!missing(cohort_definition_id)) {
    fields <- c(fields, "cohort_definition_id")
    values <- c(values, if (is.null(cohort_definition_id)) "NULL" else if (is(cohort_definition_id, "subQuery")) paste0("(", as.character(cohort_definition_id), ")") else paste0("'", as.character(cohort_definition_id), "'"))
  }

  if (!missing(cohort_definition_name)) {
    fields <- c(fields, "cohort_definition_name")
    values <- c(values, if (is.null(cohort_definition_name)) "NULL" else if (is(cohort_definition_name, "subQuery")) paste0("(", as.character(cohort_definition_name), ")") else paste0("'", as.character(cohort_definition_name), "'"))
  }

  if (!missing(cohort_definition_description)) {
    fields <- c(fields, "cohort_definition_description")
    values <- c(values, if (is.null(cohort_definition_description)) "NULL" else if (is(cohort_definition_description, "subQuery")) paste0("(", as.character(cohort_definition_description), ")") else paste0("'", as.character(cohort_definition_description), "'"))
  }

  if (!missing(definition_type_concept_id)) {
    fields <- c(fields, "definition_type_concept_id")
    values <- c(values, if (is.null(definition_type_concept_id)) "NULL" else if (is(definition_type_concept_id, "subQuery")) paste0("(", as.character(definition_type_concept_id), ")") else paste0("'", as.character(definition_type_concept_id), "'"))
  }

  if (!missing(cohort_definition_syntax)) {
    fields <- c(fields, "cohort_definition_syntax")
    values <- c(values, if (is.null(cohort_definition_syntax)) "NULL" else if (is(cohort_definition_syntax, "subQuery")) paste0("(", as.character(cohort_definition_syntax), ")") else paste0("'", as.character(cohort_definition_syntax), "'"))
  }

  if (!missing(subject_concept_id)) {
    fields <- c(fields, "subject_concept_id")
    values <- c(values, if (is.null(subject_concept_id)) "NULL" else if (is(subject_concept_id, "subQuery")) paste0("(", as.character(subject_concept_id), ")") else paste0("'", as.character(subject_concept_id), "'"))
  }

  if (!missing(cohort_instantiation_date)) {
    fields <- c(fields, "cohort_instantiation_date")
    values <- c(values, if (is.null(cohort_instantiation_date)) "NULL" else if (is(cohort_instantiation_date, "subQuery")) paste0("(", as.character(cohort_instantiation_date), ")") else paste0("'", as.character(cohort_instantiation_date), "'"))
  }

  expects <- list(testId = frameworkContext$testId, testDescription = frameworkContext$testDescription, type = 2, table = "cohort_definition", fields = fields, values = values)
  expects$rowCount = rowCount
  frameworkContext$expects[[length(frameworkContext$expects) + 1]] <- expects
  invisible(NULL)
}

lookup_condition_occurrence <- function(fetchField, condition_occurrence_id, person_id, condition_concept_id, condition_start_date, condition_start_datetime, condition_end_date, condition_end_datetime, condition_type_concept_id, stop_reason, provider_id, visit_occurrence_id, visit_detail_id, condition_source_value, condition_source_concept_id, condition_status_source_value, condition_status_concept_id) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdm_database_schema.condition_occurrence WHERE')
  first <- TRUE
  if (!missing(condition_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " condition_occurrence_id = ", if (is.null(condition_occurrence_id)) "NULL" else if (is(condition_occurrence_id, "subQuery")) paste0("(", as.character(condition_occurrence_id), ")") else paste0("'", as.character(condition_occurrence_id), "'"))
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " person_id = ", if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(condition_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " condition_concept_id = ", if (is.null(condition_concept_id)) "NULL" else if (is(condition_concept_id, "subQuery")) paste0("(", as.character(condition_concept_id), ")") else paste0("'", as.character(condition_concept_id), "'"))
  }

  if (!missing(condition_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " condition_start_date = ", if (is.null(condition_start_date)) "NULL" else if (is(condition_start_date, "subQuery")) paste0("(", as.character(condition_start_date), ")") else paste0("'", as.character(condition_start_date), "'"))
  }

  if (!missing(condition_start_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " condition_start_datetime = ", if (is.null(condition_start_datetime)) "NULL" else if (is(condition_start_datetime, "subQuery")) paste0("(", as.character(condition_start_datetime), ")") else paste0("'", as.character(condition_start_datetime), "'"))
  }

  if (!missing(condition_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " condition_end_date = ", if (is.null(condition_end_date)) "NULL" else if (is(condition_end_date, "subQuery")) paste0("(", as.character(condition_end_date), ")") else paste0("'", as.character(condition_end_date), "'"))
  }

  if (!missing(condition_end_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " condition_end_datetime = ", if (is.null(condition_end_datetime)) "NULL" else if (is(condition_end_datetime, "subQuery")) paste0("(", as.character(condition_end_datetime), ")") else paste0("'", as.character(condition_end_datetime), "'"))
  }

  if (!missing(condition_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " condition_type_concept_id = ", if (is.null(condition_type_concept_id)) "NULL" else if (is(condition_type_concept_id, "subQuery")) paste0("(", as.character(condition_type_concept_id), ")") else paste0("'", as.character(condition_type_concept_id), "'"))
  }

  if (!missing(stop_reason)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " stop_reason = ", if (is.null(stop_reason)) "NULL" else if (is(stop_reason, "subQuery")) paste0("(", as.character(stop_reason), ")") else paste0("'", as.character(stop_reason), "'"))
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " provider_id = ", if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_occurrence_id = ", if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  if (!missing(visit_detail_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_detail_id = ", if (is.null(visit_detail_id)) "NULL" else if (is(visit_detail_id, "subQuery")) paste0("(", as.character(visit_detail_id), ")") else paste0("'", as.character(visit_detail_id), "'"))
  }

  if (!missing(condition_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " condition_source_value = ", if (is.null(condition_source_value)) "NULL" else if (is(condition_source_value, "subQuery")) paste0("(", as.character(condition_source_value), ")") else paste0("'", as.character(condition_source_value), "'"))
  }

  if (!missing(condition_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " condition_source_concept_id = ", if (is.null(condition_source_concept_id)) "NULL" else if (is(condition_source_concept_id, "subQuery")) paste0("(", as.character(condition_source_concept_id), ")") else paste0("'", as.character(condition_source_concept_id), "'"))
  }

  if (!missing(condition_status_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " condition_status_source_value = ", if (is.null(condition_status_source_value)) "NULL" else if (is(condition_status_source_value, "subQuery")) paste0("(", as.character(condition_status_source_value), ")") else paste0("'", as.character(condition_status_source_value), "'"))
  }

  if (!missing(condition_status_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " condition_status_concept_id = ", if (is.null(condition_status_concept_id)) "NULL" else if (is(condition_status_concept_id, "subQuery")) paste0("(", as.character(condition_status_concept_id), ")") else paste0("'", as.character(condition_status_concept_id), "'"))
  }

  class(statement) <- 'subQuery'
  return(statement)
}

lookup_death <- function(fetchField, person_id, death_date, death_datetime, death_type_concept_id, cause_concept_id, cause_source_value, cause_source_concept_id) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdm_database_schema.death WHERE')
  first <- TRUE
  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " person_id = ", if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(death_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " death_date = ", if (is.null(death_date)) "NULL" else if (is(death_date, "subQuery")) paste0("(", as.character(death_date), ")") else paste0("'", as.character(death_date), "'"))
  }

  if (!missing(death_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " death_datetime = ", if (is.null(death_datetime)) "NULL" else if (is(death_datetime, "subQuery")) paste0("(", as.character(death_datetime), ")") else paste0("'", as.character(death_datetime), "'"))
  }

  if (!missing(death_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " death_type_concept_id = ", if (is.null(death_type_concept_id)) "NULL" else if (is(death_type_concept_id, "subQuery")) paste0("(", as.character(death_type_concept_id), ")") else paste0("'", as.character(death_type_concept_id), "'"))
  }

  if (!missing(cause_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " cause_concept_id = ", if (is.null(cause_concept_id)) "NULL" else if (is(cause_concept_id, "subQuery")) paste0("(", as.character(cause_concept_id), ")") else paste0("'", as.character(cause_concept_id), "'"))
  }

  if (!missing(cause_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " cause_source_value = ", if (is.null(cause_source_value)) "NULL" else if (is(cause_source_value, "subQuery")) paste0("(", as.character(cause_source_value), ")") else paste0("'", as.character(cause_source_value), "'"))
  }

  if (!missing(cause_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " cause_source_concept_id = ", if (is.null(cause_source_concept_id)) "NULL" else if (is(cause_source_concept_id, "subQuery")) paste0("(", as.character(cause_source_concept_id), ")") else paste0("'", as.character(cause_source_concept_id), "'"))
  }

  class(statement) <- 'subQuery'
  return(statement)
}

lookup_device_exposure <- function(fetchField, device_exposure_id, person_id, device_concept_id, device_exposure_start_date, device_exposure_start_datetime, device_exposure_end_date, device_exposure_end_datetime, device_type_concept_id, unique_device_id, quantity, provider_id, visit_occurrence_id, device_source_value, device_source__concept_id, visit_detail_id) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdm_database_schema.device_exposure WHERE')
  first <- TRUE
  if (!missing(device_exposure_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " device_exposure_id = ", if (is.null(device_exposure_id)) "NULL" else if (is(device_exposure_id, "subQuery")) paste0("(", as.character(device_exposure_id), ")") else paste0("'", as.character(device_exposure_id), "'"))
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " person_id = ", if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(device_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " device_concept_id = ", if (is.null(device_concept_id)) "NULL" else if (is(device_concept_id, "subQuery")) paste0("(", as.character(device_concept_id), ")") else paste0("'", as.character(device_concept_id), "'"))
  }

  if (!missing(device_exposure_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " device_exposure_start_date = ", if (is.null(device_exposure_start_date)) "NULL" else if (is(device_exposure_start_date, "subQuery")) paste0("(", as.character(device_exposure_start_date), ")") else paste0("'", as.character(device_exposure_start_date), "'"))
  }

  if (!missing(device_exposure_start_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " device_exposure_start_datetime = ", if (is.null(device_exposure_start_datetime)) "NULL" else if (is(device_exposure_start_datetime, "subQuery")) paste0("(", as.character(device_exposure_start_datetime), ")") else paste0("'", as.character(device_exposure_start_datetime), "'"))
  }

  if (!missing(device_exposure_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " device_exposure_end_date = ", if (is.null(device_exposure_end_date)) "NULL" else if (is(device_exposure_end_date, "subQuery")) paste0("(", as.character(device_exposure_end_date), ")") else paste0("'", as.character(device_exposure_end_date), "'"))
  }

  if (!missing(device_exposure_end_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " device_exposure_end_datetime = ", if (is.null(device_exposure_end_datetime)) "NULL" else if (is(device_exposure_end_datetime, "subQuery")) paste0("(", as.character(device_exposure_end_datetime), ")") else paste0("'", as.character(device_exposure_end_datetime), "'"))
  }

  if (!missing(device_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " device_type_concept_id = ", if (is.null(device_type_concept_id)) "NULL" else if (is(device_type_concept_id, "subQuery")) paste0("(", as.character(device_type_concept_id), ")") else paste0("'", as.character(device_type_concept_id), "'"))
  }

  if (!missing(unique_device_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " unique_device_id = ", if (is.null(unique_device_id)) "NULL" else if (is(unique_device_id, "subQuery")) paste0("(", as.character(unique_device_id), ")") else paste0("'", as.character(unique_device_id), "'"))
  }

  if (!missing(quantity)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " quantity = ", if (is.null(quantity)) "NULL" else if (is(quantity, "subQuery")) paste0("(", as.character(quantity), ")") else paste0("'", as.character(quantity), "'"))
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " provider_id = ", if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_occurrence_id = ", if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  if (!missing(device_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " device_source_value = ", if (is.null(device_source_value)) "NULL" else if (is(device_source_value, "subQuery")) paste0("(", as.character(device_source_value), ")") else paste0("'", as.character(device_source_value), "'"))
  }

  if (!missing(device_source__concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " [device_source_ concept_id] = ", if (is.null(device_source__concept_id)) "NULL" else if (is(device_source__concept_id, "subQuery")) paste0("(", as.character(device_source__concept_id), ")") else paste0("'", as.character(device_source__concept_id), "'"))
  }

  if (!missing(visit_detail_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_detail_id = ", if (is.null(visit_detail_id)) "NULL" else if (is(visit_detail_id, "subQuery")) paste0("(", as.character(visit_detail_id), ")") else paste0("'", as.character(visit_detail_id), "'"))
  }

  class(statement) <- 'subQuery'
  return(statement)
}

lookup_drug_exposure <- function(fetchField, drug_exposure_id, person_id, drug_concept_id, drug_exposure_start_date, drug_exposure_start_datetime, drug_exposure_end_date, drug_exposure_end_datetime, verbatim_end_date, drug_type_concept_id, stop_reason, refills, quantity, days_supply, sig, route_concept_id, lot_number, provider_id, visit_occurrence_id, drug_source_value, drug_source_concept_id, route_source_value, dose_unit_source_value, visit_detail_id) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdm_database_schema.drug_exposure WHERE')
  first <- TRUE
  if (!missing(drug_exposure_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " drug_exposure_id = ", if (is.null(drug_exposure_id)) "NULL" else if (is(drug_exposure_id, "subQuery")) paste0("(", as.character(drug_exposure_id), ")") else paste0("'", as.character(drug_exposure_id), "'"))
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " person_id = ", if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(drug_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " drug_concept_id = ", if (is.null(drug_concept_id)) "NULL" else if (is(drug_concept_id, "subQuery")) paste0("(", as.character(drug_concept_id), ")") else paste0("'", as.character(drug_concept_id), "'"))
  }

  if (!missing(drug_exposure_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " drug_exposure_start_date = ", if (is.null(drug_exposure_start_date)) "NULL" else if (is(drug_exposure_start_date, "subQuery")) paste0("(", as.character(drug_exposure_start_date), ")") else paste0("'", as.character(drug_exposure_start_date), "'"))
  }

  if (!missing(drug_exposure_start_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " drug_exposure_start_datetime = ", if (is.null(drug_exposure_start_datetime)) "NULL" else if (is(drug_exposure_start_datetime, "subQuery")) paste0("(", as.character(drug_exposure_start_datetime), ")") else paste0("'", as.character(drug_exposure_start_datetime), "'"))
  }

  if (!missing(drug_exposure_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " drug_exposure_end_date = ", if (is.null(drug_exposure_end_date)) "NULL" else if (is(drug_exposure_end_date, "subQuery")) paste0("(", as.character(drug_exposure_end_date), ")") else paste0("'", as.character(drug_exposure_end_date), "'"))
  }

  if (!missing(drug_exposure_end_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " drug_exposure_end_datetime = ", if (is.null(drug_exposure_end_datetime)) "NULL" else if (is(drug_exposure_end_datetime, "subQuery")) paste0("(", as.character(drug_exposure_end_datetime), ")") else paste0("'", as.character(drug_exposure_end_datetime), "'"))
  }

  if (!missing(verbatim_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " verbatim_end_date = ", if (is.null(verbatim_end_date)) "NULL" else if (is(verbatim_end_date, "subQuery")) paste0("(", as.character(verbatim_end_date), ")") else paste0("'", as.character(verbatim_end_date), "'"))
  }

  if (!missing(drug_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " drug_type_concept_id = ", if (is.null(drug_type_concept_id)) "NULL" else if (is(drug_type_concept_id, "subQuery")) paste0("(", as.character(drug_type_concept_id), ")") else paste0("'", as.character(drug_type_concept_id), "'"))
  }

  if (!missing(stop_reason)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " stop_reason = ", if (is.null(stop_reason)) "NULL" else if (is(stop_reason, "subQuery")) paste0("(", as.character(stop_reason), ")") else paste0("'", as.character(stop_reason), "'"))
  }

  if (!missing(refills)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " refills = ", if (is.null(refills)) "NULL" else if (is(refills, "subQuery")) paste0("(", as.character(refills), ")") else paste0("'", as.character(refills), "'"))
  }

  if (!missing(quantity)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " quantity = ", if (is.null(quantity)) "NULL" else if (is(quantity, "subQuery")) paste0("(", as.character(quantity), ")") else paste0("'", as.character(quantity), "'"))
  }

  if (!missing(days_supply)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " days_supply = ", if (is.null(days_supply)) "NULL" else if (is(days_supply, "subQuery")) paste0("(", as.character(days_supply), ")") else paste0("'", as.character(days_supply), "'"))
  }

  if (!missing(sig)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " sig = ", if (is.null(sig)) "NULL" else if (is(sig, "subQuery")) paste0("(", as.character(sig), ")") else paste0("'", as.character(sig), "'"))
  }

  if (!missing(route_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " route_concept_id = ", if (is.null(route_concept_id)) "NULL" else if (is(route_concept_id, "subQuery")) paste0("(", as.character(route_concept_id), ")") else paste0("'", as.character(route_concept_id), "'"))
  }

  if (!missing(lot_number)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " lot_number = ", if (is.null(lot_number)) "NULL" else if (is(lot_number, "subQuery")) paste0("(", as.character(lot_number), ")") else paste0("'", as.character(lot_number), "'"))
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " provider_id = ", if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_occurrence_id = ", if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  if (!missing(drug_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " drug_source_value = ", if (is.null(drug_source_value)) "NULL" else if (is(drug_source_value, "subQuery")) paste0("(", as.character(drug_source_value), ")") else paste0("'", as.character(drug_source_value), "'"))
  }

  if (!missing(drug_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " drug_source_concept_id = ", if (is.null(drug_source_concept_id)) "NULL" else if (is(drug_source_concept_id, "subQuery")) paste0("(", as.character(drug_source_concept_id), ")") else paste0("'", as.character(drug_source_concept_id), "'"))
  }

  if (!missing(route_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " route_source_value = ", if (is.null(route_source_value)) "NULL" else if (is(route_source_value, "subQuery")) paste0("(", as.character(route_source_value), ")") else paste0("'", as.character(route_source_value), "'"))
  }

  if (!missing(dose_unit_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " dose_unit_source_value = ", if (is.null(dose_unit_source_value)) "NULL" else if (is(dose_unit_source_value, "subQuery")) paste0("(", as.character(dose_unit_source_value), ")") else paste0("'", as.character(dose_unit_source_value), "'"))
  }

  if (!missing(visit_detail_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_detail_id = ", if (is.null(visit_detail_id)) "NULL" else if (is(visit_detail_id, "subQuery")) paste0("(", as.character(visit_detail_id), ")") else paste0("'", as.character(visit_detail_id), "'"))
  }

  class(statement) <- 'subQuery'
  return(statement)
}

lookup_fact_relationship <- function(fetchField, domain_concept_id_1, fact_id_1, domain_concept_id_2, fact_id_2, relationship_concept_id) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdm_database_schema.fact_relationship WHERE')
  first <- TRUE
  if (!missing(domain_concept_id_1)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " domain_concept_id_1 = ", if (is.null(domain_concept_id_1)) "NULL" else if (is(domain_concept_id_1, "subQuery")) paste0("(", as.character(domain_concept_id_1), ")") else paste0("'", as.character(domain_concept_id_1), "'"))
  }

  if (!missing(fact_id_1)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " fact_id_1 = ", if (is.null(fact_id_1)) "NULL" else if (is(fact_id_1, "subQuery")) paste0("(", as.character(fact_id_1), ")") else paste0("'", as.character(fact_id_1), "'"))
  }

  if (!missing(domain_concept_id_2)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " domain_concept_id_2 = ", if (is.null(domain_concept_id_2)) "NULL" else if (is(domain_concept_id_2, "subQuery")) paste0("(", as.character(domain_concept_id_2), ")") else paste0("'", as.character(domain_concept_id_2), "'"))
  }

  if (!missing(fact_id_2)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " fact_id_2 = ", if (is.null(fact_id_2)) "NULL" else if (is(fact_id_2, "subQuery")) paste0("(", as.character(fact_id_2), ")") else paste0("'", as.character(fact_id_2), "'"))
  }

  if (!missing(relationship_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " relationship_concept_id = ", if (is.null(relationship_concept_id)) "NULL" else if (is(relationship_concept_id, "subQuery")) paste0("(", as.character(relationship_concept_id), ")") else paste0("'", as.character(relationship_concept_id), "'"))
  }

  class(statement) <- 'subQuery'
  return(statement)
}

lookup_measurement <- function(fetchField, measurement_id, person_id, measurement_concept_id, measurement_date, measurement_datetime, measurement_type_concept_id, operator_concept_id, value_as_number, value_as_concept_id, unit_concept_id, range_low, range_high, provider_id, visit_occurrence_id, visit_detail_id, measurement_source_value, measurement_source_concept_id, unit_source_value, value_source_value) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdm_database_schema.measurement WHERE')
  first <- TRUE
  if (!missing(measurement_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " measurement_id = ", if (is.null(measurement_id)) "NULL" else if (is(measurement_id, "subQuery")) paste0("(", as.character(measurement_id), ")") else paste0("'", as.character(measurement_id), "'"))
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " person_id = ", if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(measurement_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " measurement_concept_id = ", if (is.null(measurement_concept_id)) "NULL" else if (is(measurement_concept_id, "subQuery")) paste0("(", as.character(measurement_concept_id), ")") else paste0("'", as.character(measurement_concept_id), "'"))
  }

  if (!missing(measurement_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " measurement_date = ", if (is.null(measurement_date)) "NULL" else if (is(measurement_date, "subQuery")) paste0("(", as.character(measurement_date), ")") else paste0("'", as.character(measurement_date), "'"))
  }

  if (!missing(measurement_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " measurement_datetime = ", if (is.null(measurement_datetime)) "NULL" else if (is(measurement_datetime, "subQuery")) paste0("(", as.character(measurement_datetime), ")") else paste0("'", as.character(measurement_datetime), "'"))
  }

  if (!missing(measurement_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " measurement_type_concept_id = ", if (is.null(measurement_type_concept_id)) "NULL" else if (is(measurement_type_concept_id, "subQuery")) paste0("(", as.character(measurement_type_concept_id), ")") else paste0("'", as.character(measurement_type_concept_id), "'"))
  }

  if (!missing(operator_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " operator_concept_id = ", if (is.null(operator_concept_id)) "NULL" else if (is(operator_concept_id, "subQuery")) paste0("(", as.character(operator_concept_id), ")") else paste0("'", as.character(operator_concept_id), "'"))
  }

  if (!missing(value_as_number)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " value_as_number = ", if (is.null(value_as_number)) "NULL" else if (is(value_as_number, "subQuery")) paste0("(", as.character(value_as_number), ")") else paste0("'", as.character(value_as_number), "'"))
  }

  if (!missing(value_as_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " value_as_concept_id = ", if (is.null(value_as_concept_id)) "NULL" else if (is(value_as_concept_id, "subQuery")) paste0("(", as.character(value_as_concept_id), ")") else paste0("'", as.character(value_as_concept_id), "'"))
  }

  if (!missing(unit_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " unit_concept_id = ", if (is.null(unit_concept_id)) "NULL" else if (is(unit_concept_id, "subQuery")) paste0("(", as.character(unit_concept_id), ")") else paste0("'", as.character(unit_concept_id), "'"))
  }

  if (!missing(range_low)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " range_low = ", if (is.null(range_low)) "NULL" else if (is(range_low, "subQuery")) paste0("(", as.character(range_low), ")") else paste0("'", as.character(range_low), "'"))
  }

  if (!missing(range_high)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " range_high = ", if (is.null(range_high)) "NULL" else if (is(range_high, "subQuery")) paste0("(", as.character(range_high), ")") else paste0("'", as.character(range_high), "'"))
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " provider_id = ", if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_occurrence_id = ", if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  if (!missing(visit_detail_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_detail_id = ", if (is.null(visit_detail_id)) "NULL" else if (is(visit_detail_id, "subQuery")) paste0("(", as.character(visit_detail_id), ")") else paste0("'", as.character(visit_detail_id), "'"))
  }

  if (!missing(measurement_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " measurement_source_value = ", if (is.null(measurement_source_value)) "NULL" else if (is(measurement_source_value, "subQuery")) paste0("(", as.character(measurement_source_value), ")") else paste0("'", as.character(measurement_source_value), "'"))
  }

  if (!missing(measurement_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " measurement_source_concept_id = ", if (is.null(measurement_source_concept_id)) "NULL" else if (is(measurement_source_concept_id, "subQuery")) paste0("(", as.character(measurement_source_concept_id), ")") else paste0("'", as.character(measurement_source_concept_id), "'"))
  }

  if (!missing(unit_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " unit_source_value = ", if (is.null(unit_source_value)) "NULL" else if (is(unit_source_value, "subQuery")) paste0("(", as.character(unit_source_value), ")") else paste0("'", as.character(unit_source_value), "'"))
  }

  if (!missing(value_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " value_source_value = ", if (is.null(value_source_value)) "NULL" else if (is(value_source_value, "subQuery")) paste0("(", as.character(value_source_value), ")") else paste0("'", as.character(value_source_value), "'"))
  }

  class(statement) <- 'subQuery'
  return(statement)
}

lookup_note <- function(fetchField, note_id, person_id, note_date, note_datetime, note_type_concept_id, note_class_concept_id, note_title, note_text, encoding_concept_id, language_concept_id, provider_id, note_source_value, visit_occurrence_id) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdm_database_schema.note WHERE')
  first <- TRUE
  if (!missing(note_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " note_id = ", if (is.null(note_id)) "NULL" else if (is(note_id, "subQuery")) paste0("(", as.character(note_id), ")") else paste0("'", as.character(note_id), "'"))
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " person_id = ", if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(note_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " note_date = ", if (is.null(note_date)) "NULL" else if (is(note_date, "subQuery")) paste0("(", as.character(note_date), ")") else paste0("'", as.character(note_date), "'"))
  }

  if (!missing(note_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " note_datetime = ", if (is.null(note_datetime)) "NULL" else if (is(note_datetime, "subQuery")) paste0("(", as.character(note_datetime), ")") else paste0("'", as.character(note_datetime), "'"))
  }

  if (!missing(note_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " note_type_concept_id = ", if (is.null(note_type_concept_id)) "NULL" else if (is(note_type_concept_id, "subQuery")) paste0("(", as.character(note_type_concept_id), ")") else paste0("'", as.character(note_type_concept_id), "'"))
  }

  if (!missing(note_class_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " note_class_concept_id = ", if (is.null(note_class_concept_id)) "NULL" else if (is(note_class_concept_id, "subQuery")) paste0("(", as.character(note_class_concept_id), ")") else paste0("'", as.character(note_class_concept_id), "'"))
  }

  if (!missing(note_title)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " note_title = ", if (is.null(note_title)) "NULL" else if (is(note_title, "subQuery")) paste0("(", as.character(note_title), ")") else paste0("'", as.character(note_title), "'"))
  }

  if (!missing(note_text)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " note_text = ", if (is.null(note_text)) "NULL" else if (is(note_text, "subQuery")) paste0("(", as.character(note_text), ")") else paste0("'", as.character(note_text), "'"))
  }

  if (!missing(encoding_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " encoding_concept_id = ", if (is.null(encoding_concept_id)) "NULL" else if (is(encoding_concept_id, "subQuery")) paste0("(", as.character(encoding_concept_id), ")") else paste0("'", as.character(encoding_concept_id), "'"))
  }

  if (!missing(language_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " language_concept_id = ", if (is.null(language_concept_id)) "NULL" else if (is(language_concept_id, "subQuery")) paste0("(", as.character(language_concept_id), ")") else paste0("'", as.character(language_concept_id), "'"))
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " provider_id = ", if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(note_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " note_source_value = ", if (is.null(note_source_value)) "NULL" else if (is(note_source_value, "subQuery")) paste0("(", as.character(note_source_value), ")") else paste0("'", as.character(note_source_value), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_occurrence_id = ", if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  class(statement) <- 'subQuery'
  return(statement)
}

lookup_note_nlp <- function(fetchField, note_nlp_id, note_id, section_concept_id, snippet, offset, lexical_variant, note_nlp_concept_id, note_nlp_source_concept_id, nlp_system, nlp_date, nlp_date_time, term_exists, term_temporal, term_modifiers) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdm_database_schema.note_nlp WHERE')
  first <- TRUE
  if (!missing(note_nlp_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " note_nlp_id = ", if (is.null(note_nlp_id)) "NULL" else if (is(note_nlp_id, "subQuery")) paste0("(", as.character(note_nlp_id), ")") else paste0("'", as.character(note_nlp_id), "'"))
  }

  if (!missing(note_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " note_id = ", if (is.null(note_id)) "NULL" else if (is(note_id, "subQuery")) paste0("(", as.character(note_id), ")") else paste0("'", as.character(note_id), "'"))
  }

  if (!missing(section_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " section_concept_id = ", if (is.null(section_concept_id)) "NULL" else if (is(section_concept_id, "subQuery")) paste0("(", as.character(section_concept_id), ")") else paste0("'", as.character(section_concept_id), "'"))
  }

  if (!missing(snippet)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " snippet = ", if (is.null(snippet)) "NULL" else if (is(snippet, "subQuery")) paste0("(", as.character(snippet), ")") else paste0("'", as.character(snippet), "'"))
  }

  if (!missing(offset)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " offset = ", if (is.null(offset)) "NULL" else if (is(offset, "subQuery")) paste0("(", as.character(offset), ")") else paste0("'", as.character(offset), "'"))
  }

  if (!missing(lexical_variant)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " lexical_variant = ", if (is.null(lexical_variant)) "NULL" else if (is(lexical_variant, "subQuery")) paste0("(", as.character(lexical_variant), ")") else paste0("'", as.character(lexical_variant), "'"))
  }

  if (!missing(note_nlp_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " note_nlp_concept_id = ", if (is.null(note_nlp_concept_id)) "NULL" else if (is(note_nlp_concept_id, "subQuery")) paste0("(", as.character(note_nlp_concept_id), ")") else paste0("'", as.character(note_nlp_concept_id), "'"))
  }

  if (!missing(note_nlp_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " note_nlp_source_concept_id = ", if (is.null(note_nlp_source_concept_id)) "NULL" else if (is(note_nlp_source_concept_id, "subQuery")) paste0("(", as.character(note_nlp_source_concept_id), ")") else paste0("'", as.character(note_nlp_source_concept_id), "'"))
  }

  if (!missing(nlp_system)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " nlp_system = ", if (is.null(nlp_system)) "NULL" else if (is(nlp_system, "subQuery")) paste0("(", as.character(nlp_system), ")") else paste0("'", as.character(nlp_system), "'"))
  }

  if (!missing(nlp_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " nlp_date = ", if (is.null(nlp_date)) "NULL" else if (is(nlp_date, "subQuery")) paste0("(", as.character(nlp_date), ")") else paste0("'", as.character(nlp_date), "'"))
  }

  if (!missing(nlp_date_time)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " nlp_date_time = ", if (is.null(nlp_date_time)) "NULL" else if (is(nlp_date_time, "subQuery")) paste0("(", as.character(nlp_date_time), ")") else paste0("'", as.character(nlp_date_time), "'"))
  }

  if (!missing(term_exists)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " term_exists = ", if (is.null(term_exists)) "NULL" else if (is(term_exists, "subQuery")) paste0("(", as.character(term_exists), ")") else paste0("'", as.character(term_exists), "'"))
  }

  if (!missing(term_temporal)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " term_temporal = ", if (is.null(term_temporal)) "NULL" else if (is(term_temporal, "subQuery")) paste0("(", as.character(term_temporal), ")") else paste0("'", as.character(term_temporal), "'"))
  }

  if (!missing(term_modifiers)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " term_modifiers = ", if (is.null(term_modifiers)) "NULL" else if (is(term_modifiers, "subQuery")) paste0("(", as.character(term_modifiers), ")") else paste0("'", as.character(term_modifiers), "'"))
  }

  class(statement) <- 'subQuery'
  return(statement)
}

lookup_observation <- function(fetchField, observation_id, person_id, observation_concept_id, observation_date, observation_datetime, observation_type_concept_id, value_as_number, value_as_string, value_as_concept_id, qualifier_concept_id, unit_concept_id, provider_id, visit_occurrence_id, visit_detail_id, observation_source_value, observation_source_concept_id, unit_source_value, qualifier_source_value) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdm_database_schema.observation WHERE')
  first <- TRUE
  if (!missing(observation_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " observation_id = ", if (is.null(observation_id)) "NULL" else if (is(observation_id, "subQuery")) paste0("(", as.character(observation_id), ")") else paste0("'", as.character(observation_id), "'"))
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " person_id = ", if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(observation_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " observation_concept_id = ", if (is.null(observation_concept_id)) "NULL" else if (is(observation_concept_id, "subQuery")) paste0("(", as.character(observation_concept_id), ")") else paste0("'", as.character(observation_concept_id), "'"))
  }

  if (!missing(observation_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " observation_date = ", if (is.null(observation_date)) "NULL" else if (is(observation_date, "subQuery")) paste0("(", as.character(observation_date), ")") else paste0("'", as.character(observation_date), "'"))
  }

  if (!missing(observation_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " observation_datetime = ", if (is.null(observation_datetime)) "NULL" else if (is(observation_datetime, "subQuery")) paste0("(", as.character(observation_datetime), ")") else paste0("'", as.character(observation_datetime), "'"))
  }

  if (!missing(observation_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " observation_type_concept_id = ", if (is.null(observation_type_concept_id)) "NULL" else if (is(observation_type_concept_id, "subQuery")) paste0("(", as.character(observation_type_concept_id), ")") else paste0("'", as.character(observation_type_concept_id), "'"))
  }

  if (!missing(value_as_number)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " value_as_number = ", if (is.null(value_as_number)) "NULL" else if (is(value_as_number, "subQuery")) paste0("(", as.character(value_as_number), ")") else paste0("'", as.character(value_as_number), "'"))
  }

  if (!missing(value_as_string)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " value_as_string = ", if (is.null(value_as_string)) "NULL" else if (is(value_as_string, "subQuery")) paste0("(", as.character(value_as_string), ")") else paste0("'", as.character(value_as_string), "'"))
  }

  if (!missing(value_as_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " value_as_concept_id = ", if (is.null(value_as_concept_id)) "NULL" else if (is(value_as_concept_id, "subQuery")) paste0("(", as.character(value_as_concept_id), ")") else paste0("'", as.character(value_as_concept_id), "'"))
  }

  if (!missing(qualifier_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " qualifier_concept_id = ", if (is.null(qualifier_concept_id)) "NULL" else if (is(qualifier_concept_id, "subQuery")) paste0("(", as.character(qualifier_concept_id), ")") else paste0("'", as.character(qualifier_concept_id), "'"))
  }

  if (!missing(unit_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " unit_concept_id = ", if (is.null(unit_concept_id)) "NULL" else if (is(unit_concept_id, "subQuery")) paste0("(", as.character(unit_concept_id), ")") else paste0("'", as.character(unit_concept_id), "'"))
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " provider_id = ", if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_occurrence_id = ", if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  if (!missing(visit_detail_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_detail_id = ", if (is.null(visit_detail_id)) "NULL" else if (is(visit_detail_id, "subQuery")) paste0("(", as.character(visit_detail_id), ")") else paste0("'", as.character(visit_detail_id), "'"))
  }

  if (!missing(observation_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " observation_source_value = ", if (is.null(observation_source_value)) "NULL" else if (is(observation_source_value, "subQuery")) paste0("(", as.character(observation_source_value), ")") else paste0("'", as.character(observation_source_value), "'"))
  }

  if (!missing(observation_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " observation_source_concept_id = ", if (is.null(observation_source_concept_id)) "NULL" else if (is(observation_source_concept_id, "subQuery")) paste0("(", as.character(observation_source_concept_id), ")") else paste0("'", as.character(observation_source_concept_id), "'"))
  }

  if (!missing(unit_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " unit_source_value = ", if (is.null(unit_source_value)) "NULL" else if (is(unit_source_value, "subQuery")) paste0("(", as.character(unit_source_value), ")") else paste0("'", as.character(unit_source_value), "'"))
  }

  if (!missing(qualifier_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " qualifier_source_value = ", if (is.null(qualifier_source_value)) "NULL" else if (is(qualifier_source_value, "subQuery")) paste0("(", as.character(qualifier_source_value), ")") else paste0("'", as.character(qualifier_source_value), "'"))
  }

  class(statement) <- 'subQuery'
  return(statement)
}

lookup_observation_period <- function(fetchField, observation_period_id, person_id, observation_period_start_date, observation_period_end_date, period_type_concept_id) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdm_database_schema.observation_period WHERE')
  first <- TRUE
  if (!missing(observation_period_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " observation_period_id = ", if (is.null(observation_period_id)) "NULL" else if (is(observation_period_id, "subQuery")) paste0("(", as.character(observation_period_id), ")") else paste0("'", as.character(observation_period_id), "'"))
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " person_id = ", if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(observation_period_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " observation_period_start_date = ", if (is.null(observation_period_start_date)) "NULL" else if (is(observation_period_start_date, "subQuery")) paste0("(", as.character(observation_period_start_date), ")") else paste0("'", as.character(observation_period_start_date), "'"))
  }

  if (!missing(observation_period_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " observation_period_end_date = ", if (is.null(observation_period_end_date)) "NULL" else if (is(observation_period_end_date, "subQuery")) paste0("(", as.character(observation_period_end_date), ")") else paste0("'", as.character(observation_period_end_date), "'"))
  }

  if (!missing(period_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " period_type_concept_id = ", if (is.null(period_type_concept_id)) "NULL" else if (is(period_type_concept_id, "subQuery")) paste0("(", as.character(period_type_concept_id), ")") else paste0("'", as.character(period_type_concept_id), "'"))
  }

  class(statement) <- 'subQuery'
  return(statement)
}

lookup_person <- function(fetchField, person_id, gender_concept_id, year_of_birth, month_of_birth, day_of_birth, birth_datetime, race_concept_id, ethnicity_concept_id, location_id, provider_id, care_site_id, person_source_value, gender_source_value, gender_source_concept_id, race_source_value, race_source_concept_id, ethnicity_source_value, ethnicity_source_concept_id) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdm_database_schema.person WHERE')
  first <- TRUE
  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " person_id = ", if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(gender_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " gender_concept_id = ", if (is.null(gender_concept_id)) "NULL" else if (is(gender_concept_id, "subQuery")) paste0("(", as.character(gender_concept_id), ")") else paste0("'", as.character(gender_concept_id), "'"))
  }

  if (!missing(year_of_birth)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " year_of_birth = ", if (is.null(year_of_birth)) "NULL" else if (is(year_of_birth, "subQuery")) paste0("(", as.character(year_of_birth), ")") else paste0("'", as.character(year_of_birth), "'"))
  }

  if (!missing(month_of_birth)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " month_of_birth = ", if (is.null(month_of_birth)) "NULL" else if (is(month_of_birth, "subQuery")) paste0("(", as.character(month_of_birth), ")") else paste0("'", as.character(month_of_birth), "'"))
  }

  if (!missing(day_of_birth)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " day_of_birth = ", if (is.null(day_of_birth)) "NULL" else if (is(day_of_birth, "subQuery")) paste0("(", as.character(day_of_birth), ")") else paste0("'", as.character(day_of_birth), "'"))
  }

  if (!missing(birth_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " birth_datetime = ", if (is.null(birth_datetime)) "NULL" else if (is(birth_datetime, "subQuery")) paste0("(", as.character(birth_datetime), ")") else paste0("'", as.character(birth_datetime), "'"))
  }

  if (!missing(race_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " race_concept_id = ", if (is.null(race_concept_id)) "NULL" else if (is(race_concept_id, "subQuery")) paste0("(", as.character(race_concept_id), ")") else paste0("'", as.character(race_concept_id), "'"))
  }

  if (!missing(ethnicity_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " ethnicity_concept_id = ", if (is.null(ethnicity_concept_id)) "NULL" else if (is(ethnicity_concept_id, "subQuery")) paste0("(", as.character(ethnicity_concept_id), ")") else paste0("'", as.character(ethnicity_concept_id), "'"))
  }

  if (!missing(location_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " location_id = ", if (is.null(location_id)) "NULL" else if (is(location_id, "subQuery")) paste0("(", as.character(location_id), ")") else paste0("'", as.character(location_id), "'"))
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " provider_id = ", if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(care_site_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " care_site_id = ", if (is.null(care_site_id)) "NULL" else if (is(care_site_id, "subQuery")) paste0("(", as.character(care_site_id), ")") else paste0("'", as.character(care_site_id), "'"))
  }

  if (!missing(person_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " person_source_value = ", if (is.null(person_source_value)) "NULL" else if (is(person_source_value, "subQuery")) paste0("(", as.character(person_source_value), ")") else paste0("'", as.character(person_source_value), "'"))
  }

  if (!missing(gender_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " gender_source_value = ", if (is.null(gender_source_value)) "NULL" else if (is(gender_source_value, "subQuery")) paste0("(", as.character(gender_source_value), ")") else paste0("'", as.character(gender_source_value), "'"))
  }

  if (!missing(gender_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " gender_source_concept_id = ", if (is.null(gender_source_concept_id)) "NULL" else if (is(gender_source_concept_id, "subQuery")) paste0("(", as.character(gender_source_concept_id), ")") else paste0("'", as.character(gender_source_concept_id), "'"))
  }

  if (!missing(race_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " race_source_value = ", if (is.null(race_source_value)) "NULL" else if (is(race_source_value, "subQuery")) paste0("(", as.character(race_source_value), ")") else paste0("'", as.character(race_source_value), "'"))
  }

  if (!missing(race_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " race_source_concept_id = ", if (is.null(race_source_concept_id)) "NULL" else if (is(race_source_concept_id, "subQuery")) paste0("(", as.character(race_source_concept_id), ")") else paste0("'", as.character(race_source_concept_id), "'"))
  }

  if (!missing(ethnicity_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " ethnicity_source_value = ", if (is.null(ethnicity_source_value)) "NULL" else if (is(ethnicity_source_value, "subQuery")) paste0("(", as.character(ethnicity_source_value), ")") else paste0("'", as.character(ethnicity_source_value), "'"))
  }

  if (!missing(ethnicity_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " ethnicity_source_concept_id = ", if (is.null(ethnicity_source_concept_id)) "NULL" else if (is(ethnicity_source_concept_id, "subQuery")) paste0("(", as.character(ethnicity_source_concept_id), ")") else paste0("'", as.character(ethnicity_source_concept_id), "'"))
  }

  class(statement) <- 'subQuery'
  return(statement)
}

lookup_procedure_occurrence <- function(fetchField, procedure_occurrence_id, person_id, procedure_concept_id, procedure_date, procedure_datetime, procedure_type_concept_id, modifier_concept_id, quantity, provider_id, visit_occurrence_id, procedure_source_value, procedure_source_concept_id, qualifier_source_value, visit_detail_id) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdm_database_schema.procedure_occurrence WHERE')
  first <- TRUE
  if (!missing(procedure_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " procedure_occurrence_id = ", if (is.null(procedure_occurrence_id)) "NULL" else if (is(procedure_occurrence_id, "subQuery")) paste0("(", as.character(procedure_occurrence_id), ")") else paste0("'", as.character(procedure_occurrence_id), "'"))
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " person_id = ", if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(procedure_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " procedure_concept_id = ", if (is.null(procedure_concept_id)) "NULL" else if (is(procedure_concept_id, "subQuery")) paste0("(", as.character(procedure_concept_id), ")") else paste0("'", as.character(procedure_concept_id), "'"))
  }

  if (!missing(procedure_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " procedure_date = ", if (is.null(procedure_date)) "NULL" else if (is(procedure_date, "subQuery")) paste0("(", as.character(procedure_date), ")") else paste0("'", as.character(procedure_date), "'"))
  }

  if (!missing(procedure_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " procedure_datetime = ", if (is.null(procedure_datetime)) "NULL" else if (is(procedure_datetime, "subQuery")) paste0("(", as.character(procedure_datetime), ")") else paste0("'", as.character(procedure_datetime), "'"))
  }

  if (!missing(procedure_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " procedure_type_concept_id = ", if (is.null(procedure_type_concept_id)) "NULL" else if (is(procedure_type_concept_id, "subQuery")) paste0("(", as.character(procedure_type_concept_id), ")") else paste0("'", as.character(procedure_type_concept_id), "'"))
  }

  if (!missing(modifier_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " modifier_concept_id = ", if (is.null(modifier_concept_id)) "NULL" else if (is(modifier_concept_id, "subQuery")) paste0("(", as.character(modifier_concept_id), ")") else paste0("'", as.character(modifier_concept_id), "'"))
  }

  if (!missing(quantity)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " quantity = ", if (is.null(quantity)) "NULL" else if (is(quantity, "subQuery")) paste0("(", as.character(quantity), ")") else paste0("'", as.character(quantity), "'"))
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " provider_id = ", if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_occurrence_id = ", if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  if (!missing(procedure_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " procedure_source_value = ", if (is.null(procedure_source_value)) "NULL" else if (is(procedure_source_value, "subQuery")) paste0("(", as.character(procedure_source_value), ")") else paste0("'", as.character(procedure_source_value), "'"))
  }

  if (!missing(procedure_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " procedure_source_concept_id = ", if (is.null(procedure_source_concept_id)) "NULL" else if (is(procedure_source_concept_id, "subQuery")) paste0("(", as.character(procedure_source_concept_id), ")") else paste0("'", as.character(procedure_source_concept_id), "'"))
  }

  if (!missing(qualifier_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " qualifier_source_value = ", if (is.null(qualifier_source_value)) "NULL" else if (is(qualifier_source_value, "subQuery")) paste0("(", as.character(qualifier_source_value), ")") else paste0("'", as.character(qualifier_source_value), "'"))
  }

  if (!missing(visit_detail_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_detail_id = ", if (is.null(visit_detail_id)) "NULL" else if (is(visit_detail_id, "subQuery")) paste0("(", as.character(visit_detail_id), ")") else paste0("'", as.character(visit_detail_id), "'"))
  }

  class(statement) <- 'subQuery'
  return(statement)
}

lookup_specimen <- function(fetchField, specimen_id, person_id, specimen_concept_id, specimen_type_concept_id, specimen_date, specimen_datetime, quantity, unit_concept_id, anatomic_site_concept_id, disease_status_concept_id, specimen_source_id, specimen_source_value, unit_source_value, anatomic_site_source_value, disease_status_source_value) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdm_database_schema.specimen WHERE')
  first <- TRUE
  if (!missing(specimen_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " specimen_id = ", if (is.null(specimen_id)) "NULL" else if (is(specimen_id, "subQuery")) paste0("(", as.character(specimen_id), ")") else paste0("'", as.character(specimen_id), "'"))
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " person_id = ", if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(specimen_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " specimen_concept_id = ", if (is.null(specimen_concept_id)) "NULL" else if (is(specimen_concept_id, "subQuery")) paste0("(", as.character(specimen_concept_id), ")") else paste0("'", as.character(specimen_concept_id), "'"))
  }

  if (!missing(specimen_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " specimen_type_concept_id = ", if (is.null(specimen_type_concept_id)) "NULL" else if (is(specimen_type_concept_id, "subQuery")) paste0("(", as.character(specimen_type_concept_id), ")") else paste0("'", as.character(specimen_type_concept_id), "'"))
  }

  if (!missing(specimen_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " specimen_date = ", if (is.null(specimen_date)) "NULL" else if (is(specimen_date, "subQuery")) paste0("(", as.character(specimen_date), ")") else paste0("'", as.character(specimen_date), "'"))
  }

  if (!missing(specimen_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " specimen_datetime = ", if (is.null(specimen_datetime)) "NULL" else if (is(specimen_datetime, "subQuery")) paste0("(", as.character(specimen_datetime), ")") else paste0("'", as.character(specimen_datetime), "'"))
  }

  if (!missing(quantity)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " quantity = ", if (is.null(quantity)) "NULL" else if (is(quantity, "subQuery")) paste0("(", as.character(quantity), ")") else paste0("'", as.character(quantity), "'"))
  }

  if (!missing(unit_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " unit_concept_id = ", if (is.null(unit_concept_id)) "NULL" else if (is(unit_concept_id, "subQuery")) paste0("(", as.character(unit_concept_id), ")") else paste0("'", as.character(unit_concept_id), "'"))
  }

  if (!missing(anatomic_site_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " anatomic_site_concept_id = ", if (is.null(anatomic_site_concept_id)) "NULL" else if (is(anatomic_site_concept_id, "subQuery")) paste0("(", as.character(anatomic_site_concept_id), ")") else paste0("'", as.character(anatomic_site_concept_id), "'"))
  }

  if (!missing(disease_status_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " disease_status_concept_id = ", if (is.null(disease_status_concept_id)) "NULL" else if (is(disease_status_concept_id, "subQuery")) paste0("(", as.character(disease_status_concept_id), ")") else paste0("'", as.character(disease_status_concept_id), "'"))
  }

  if (!missing(specimen_source_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " specimen_source_id = ", if (is.null(specimen_source_id)) "NULL" else if (is(specimen_source_id, "subQuery")) paste0("(", as.character(specimen_source_id), ")") else paste0("'", as.character(specimen_source_id), "'"))
  }

  if (!missing(specimen_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " specimen_source_value = ", if (is.null(specimen_source_value)) "NULL" else if (is(specimen_source_value, "subQuery")) paste0("(", as.character(specimen_source_value), ")") else paste0("'", as.character(specimen_source_value), "'"))
  }

  if (!missing(unit_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " unit_source_value = ", if (is.null(unit_source_value)) "NULL" else if (is(unit_source_value, "subQuery")) paste0("(", as.character(unit_source_value), ")") else paste0("'", as.character(unit_source_value), "'"))
  }

  if (!missing(anatomic_site_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " anatomic_site_source_value = ", if (is.null(anatomic_site_source_value)) "NULL" else if (is(anatomic_site_source_value, "subQuery")) paste0("(", as.character(anatomic_site_source_value), ")") else paste0("'", as.character(anatomic_site_source_value), "'"))
  }

  if (!missing(disease_status_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " disease_status_source_value = ", if (is.null(disease_status_source_value)) "NULL" else if (is(disease_status_source_value, "subQuery")) paste0("(", as.character(disease_status_source_value), ")") else paste0("'", as.character(disease_status_source_value), "'"))
  }

  class(statement) <- 'subQuery'
  return(statement)
}

lookup_visit_detail <- function(fetchField, visit_detail_id, person_id, visit_concept_id, visit_start_date, visit_start_datetime, visit_end_date, visit_end_datetime, visit_type_concept_id, provider_id, care_site_id, visit_source_value, visit_source_concept_id, admitting_source_value, admitting_source_concept_id, discharge_to_source_value, discharge_to_concept_id, preceding_visit_detail_id, visit_detail_parent_id, visit_occurrence_id) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdm_database_schema.visit_detail WHERE')
  first <- TRUE
  if (!missing(visit_detail_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_detail_id = ", if (is.null(visit_detail_id)) "NULL" else if (is(visit_detail_id, "subQuery")) paste0("(", as.character(visit_detail_id), ")") else paste0("'", as.character(visit_detail_id), "'"))
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " person_id = ", if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(visit_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_concept_id = ", if (is.null(visit_concept_id)) "NULL" else if (is(visit_concept_id, "subQuery")) paste0("(", as.character(visit_concept_id), ")") else paste0("'", as.character(visit_concept_id), "'"))
  }

  if (!missing(visit_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_start_date = ", if (is.null(visit_start_date)) "NULL" else if (is(visit_start_date, "subQuery")) paste0("(", as.character(visit_start_date), ")") else paste0("'", as.character(visit_start_date), "'"))
  }

  if (!missing(visit_start_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_start_datetime = ", if (is.null(visit_start_datetime)) "NULL" else if (is(visit_start_datetime, "subQuery")) paste0("(", as.character(visit_start_datetime), ")") else paste0("'", as.character(visit_start_datetime), "'"))
  }

  if (!missing(visit_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_end_date = ", if (is.null(visit_end_date)) "NULL" else if (is(visit_end_date, "subQuery")) paste0("(", as.character(visit_end_date), ")") else paste0("'", as.character(visit_end_date), "'"))
  }

  if (!missing(visit_end_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_end_datetime = ", if (is.null(visit_end_datetime)) "NULL" else if (is(visit_end_datetime, "subQuery")) paste0("(", as.character(visit_end_datetime), ")") else paste0("'", as.character(visit_end_datetime), "'"))
  }

  if (!missing(visit_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_type_concept_id = ", if (is.null(visit_type_concept_id)) "NULL" else if (is(visit_type_concept_id, "subQuery")) paste0("(", as.character(visit_type_concept_id), ")") else paste0("'", as.character(visit_type_concept_id), "'"))
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " provider_id = ", if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(care_site_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " care_site_id = ", if (is.null(care_site_id)) "NULL" else if (is(care_site_id, "subQuery")) paste0("(", as.character(care_site_id), ")") else paste0("'", as.character(care_site_id), "'"))
  }

  if (!missing(visit_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_source_value = ", if (is.null(visit_source_value)) "NULL" else if (is(visit_source_value, "subQuery")) paste0("(", as.character(visit_source_value), ")") else paste0("'", as.character(visit_source_value), "'"))
  }

  if (!missing(visit_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_source_concept_id = ", if (is.null(visit_source_concept_id)) "NULL" else if (is(visit_source_concept_id, "subQuery")) paste0("(", as.character(visit_source_concept_id), ")") else paste0("'", as.character(visit_source_concept_id), "'"))
  }

  if (!missing(admitting_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " admitting_source_value = ", if (is.null(admitting_source_value)) "NULL" else if (is(admitting_source_value, "subQuery")) paste0("(", as.character(admitting_source_value), ")") else paste0("'", as.character(admitting_source_value), "'"))
  }

  if (!missing(admitting_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " admitting_source_concept_id = ", if (is.null(admitting_source_concept_id)) "NULL" else if (is(admitting_source_concept_id, "subQuery")) paste0("(", as.character(admitting_source_concept_id), ")") else paste0("'", as.character(admitting_source_concept_id), "'"))
  }

  if (!missing(discharge_to_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " discharge_to_source_value = ", if (is.null(discharge_to_source_value)) "NULL" else if (is(discharge_to_source_value, "subQuery")) paste0("(", as.character(discharge_to_source_value), ")") else paste0("'", as.character(discharge_to_source_value), "'"))
  }

  if (!missing(discharge_to_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " discharge_to_concept_id = ", if (is.null(discharge_to_concept_id)) "NULL" else if (is(discharge_to_concept_id, "subQuery")) paste0("(", as.character(discharge_to_concept_id), ")") else paste0("'", as.character(discharge_to_concept_id), "'"))
  }

  if (!missing(preceding_visit_detail_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " preceding_visit_detail_id = ", if (is.null(preceding_visit_detail_id)) "NULL" else if (is(preceding_visit_detail_id, "subQuery")) paste0("(", as.character(preceding_visit_detail_id), ")") else paste0("'", as.character(preceding_visit_detail_id), "'"))
  }

  if (!missing(visit_detail_parent_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_detail_parent_id = ", if (is.null(visit_detail_parent_id)) "NULL" else if (is(visit_detail_parent_id, "subQuery")) paste0("(", as.character(visit_detail_parent_id), ")") else paste0("'", as.character(visit_detail_parent_id), "'"))
  }

  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_occurrence_id = ", if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  class(statement) <- 'subQuery'
  return(statement)
}

lookup_visit_occurrence <- function(fetchField, visit_occurrence_id, person_id, visit_concept_id, visit_start_date, visit_start_datetime, visit_end_date, visit_end_datetime, visit_type_concept_id, provider_id, care_site_id, visit_source_value, visit_source_concept_id, admitting_source_concept_id, admitting_source_value, discharge_to_concept_id, discharge_to_source_value, preceding_visit_occurrence_id) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdm_database_schema.visit_occurrence WHERE')
  first <- TRUE
  if (!missing(visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_occurrence_id = ", if (is.null(visit_occurrence_id)) "NULL" else if (is(visit_occurrence_id, "subQuery")) paste0("(", as.character(visit_occurrence_id), ")") else paste0("'", as.character(visit_occurrence_id), "'"))
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " person_id = ", if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(visit_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_concept_id = ", if (is.null(visit_concept_id)) "NULL" else if (is(visit_concept_id, "subQuery")) paste0("(", as.character(visit_concept_id), ")") else paste0("'", as.character(visit_concept_id), "'"))
  }

  if (!missing(visit_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_start_date = ", if (is.null(visit_start_date)) "NULL" else if (is(visit_start_date, "subQuery")) paste0("(", as.character(visit_start_date), ")") else paste0("'", as.character(visit_start_date), "'"))
  }

  if (!missing(visit_start_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_start_datetime = ", if (is.null(visit_start_datetime)) "NULL" else if (is(visit_start_datetime, "subQuery")) paste0("(", as.character(visit_start_datetime), ")") else paste0("'", as.character(visit_start_datetime), "'"))
  }

  if (!missing(visit_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_end_date = ", if (is.null(visit_end_date)) "NULL" else if (is(visit_end_date, "subQuery")) paste0("(", as.character(visit_end_date), ")") else paste0("'", as.character(visit_end_date), "'"))
  }

  if (!missing(visit_end_datetime)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_end_datetime = ", if (is.null(visit_end_datetime)) "NULL" else if (is(visit_end_datetime, "subQuery")) paste0("(", as.character(visit_end_datetime), ")") else paste0("'", as.character(visit_end_datetime), "'"))
  }

  if (!missing(visit_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_type_concept_id = ", if (is.null(visit_type_concept_id)) "NULL" else if (is(visit_type_concept_id, "subQuery")) paste0("(", as.character(visit_type_concept_id), ")") else paste0("'", as.character(visit_type_concept_id), "'"))
  }

  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " provider_id = ", if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(care_site_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " care_site_id = ", if (is.null(care_site_id)) "NULL" else if (is(care_site_id, "subQuery")) paste0("(", as.character(care_site_id), ")") else paste0("'", as.character(care_site_id), "'"))
  }

  if (!missing(visit_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_source_value = ", if (is.null(visit_source_value)) "NULL" else if (is(visit_source_value, "subQuery")) paste0("(", as.character(visit_source_value), ")") else paste0("'", as.character(visit_source_value), "'"))
  }

  if (!missing(visit_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " visit_source_concept_id = ", if (is.null(visit_source_concept_id)) "NULL" else if (is(visit_source_concept_id, "subQuery")) paste0("(", as.character(visit_source_concept_id), ")") else paste0("'", as.character(visit_source_concept_id), "'"))
  }

  if (!missing(admitting_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " admitting_source_concept_id = ", if (is.null(admitting_source_concept_id)) "NULL" else if (is(admitting_source_concept_id, "subQuery")) paste0("(", as.character(admitting_source_concept_id), ")") else paste0("'", as.character(admitting_source_concept_id), "'"))
  }

  if (!missing(admitting_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " admitting_source_value = ", if (is.null(admitting_source_value)) "NULL" else if (is(admitting_source_value, "subQuery")) paste0("(", as.character(admitting_source_value), ")") else paste0("'", as.character(admitting_source_value), "'"))
  }

  if (!missing(discharge_to_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " discharge_to_concept_id = ", if (is.null(discharge_to_concept_id)) "NULL" else if (is(discharge_to_concept_id, "subQuery")) paste0("(", as.character(discharge_to_concept_id), ")") else paste0("'", as.character(discharge_to_concept_id), "'"))
  }

  if (!missing(discharge_to_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " discharge_to_source_value = ", if (is.null(discharge_to_source_value)) "NULL" else if (is(discharge_to_source_value, "subQuery")) paste0("(", as.character(discharge_to_source_value), ")") else paste0("'", as.character(discharge_to_source_value), "'"))
  }

  if (!missing(preceding_visit_occurrence_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " preceding_visit_occurrence_id = ", if (is.null(preceding_visit_occurrence_id)) "NULL" else if (is(preceding_visit_occurrence_id, "subQuery")) paste0("(", as.character(preceding_visit_occurrence_id), ")") else paste0("'", as.character(preceding_visit_occurrence_id), "'"))
  }

  class(statement) <- 'subQuery'
  return(statement)
}

lookup_cohort <- function(fetchField, cohort_definition_id, subject_id, cohort_start_date, cohort_end_date) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdm_database_schema.cohort WHERE')
  first <- TRUE
  if (!missing(cohort_definition_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " cohort_definition_id = ", if (is.null(cohort_definition_id)) "NULL" else if (is(cohort_definition_id, "subQuery")) paste0("(", as.character(cohort_definition_id), ")") else paste0("'", as.character(cohort_definition_id), "'"))
  }

  if (!missing(subject_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " subject_id = ", if (is.null(subject_id)) "NULL" else if (is(subject_id, "subQuery")) paste0("(", as.character(subject_id), ")") else paste0("'", as.character(subject_id), "'"))
  }

  if (!missing(cohort_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " cohort_start_date = ", if (is.null(cohort_start_date)) "NULL" else if (is(cohort_start_date, "subQuery")) paste0("(", as.character(cohort_start_date), ")") else paste0("'", as.character(cohort_start_date), "'"))
  }

  if (!missing(cohort_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " cohort_end_date = ", if (is.null(cohort_end_date)) "NULL" else if (is(cohort_end_date, "subQuery")) paste0("(", as.character(cohort_end_date), ")") else paste0("'", as.character(cohort_end_date), "'"))
  }

  class(statement) <- 'subQuery'
  return(statement)
}

lookup_cohort_attribute <- function(fetchField, cohort_definition_id, subject_id, cohort_start_date, cohort_end_date, attribute_definition_id, value_as_number, value_as_concept_id) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdm_database_schema.cohort_attribute WHERE')
  first <- TRUE
  if (!missing(cohort_definition_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " cohort_definition_id = ", if (is.null(cohort_definition_id)) "NULL" else if (is(cohort_definition_id, "subQuery")) paste0("(", as.character(cohort_definition_id), ")") else paste0("'", as.character(cohort_definition_id), "'"))
  }

  if (!missing(subject_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " subject_id = ", if (is.null(subject_id)) "NULL" else if (is(subject_id, "subQuery")) paste0("(", as.character(subject_id), ")") else paste0("'", as.character(subject_id), "'"))
  }

  if (!missing(cohort_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " cohort_start_date = ", if (is.null(cohort_start_date)) "NULL" else if (is(cohort_start_date, "subQuery")) paste0("(", as.character(cohort_start_date), ")") else paste0("'", as.character(cohort_start_date), "'"))
  }

  if (!missing(cohort_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " cohort_end_date = ", if (is.null(cohort_end_date)) "NULL" else if (is(cohort_end_date, "subQuery")) paste0("(", as.character(cohort_end_date), ")") else paste0("'", as.character(cohort_end_date), "'"))
  }

  if (!missing(attribute_definition_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " attribute_definition_id = ", if (is.null(attribute_definition_id)) "NULL" else if (is(attribute_definition_id, "subQuery")) paste0("(", as.character(attribute_definition_id), ")") else paste0("'", as.character(attribute_definition_id), "'"))
  }

  if (!missing(value_as_number)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " value_as_number = ", if (is.null(value_as_number)) "NULL" else if (is(value_as_number, "subQuery")) paste0("(", as.character(value_as_number), ")") else paste0("'", as.character(value_as_number), "'"))
  }

  if (!missing(value_as_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " value_as_concept_id = ", if (is.null(value_as_concept_id)) "NULL" else if (is(value_as_concept_id, "subQuery")) paste0("(", as.character(value_as_concept_id), ")") else paste0("'", as.character(value_as_concept_id), "'"))
  }

  class(statement) <- 'subQuery'
  return(statement)
}

lookup_condition_era <- function(fetchField, condition_era_id, person_id, condition_concept_id, condition_era_start_date, condition_era_end_date, condition_occurrence_count) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdm_database_schema.condition_era WHERE')
  first <- TRUE
  if (!missing(condition_era_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " condition_era_id = ", if (is.null(condition_era_id)) "NULL" else if (is(condition_era_id, "subQuery")) paste0("(", as.character(condition_era_id), ")") else paste0("'", as.character(condition_era_id), "'"))
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " person_id = ", if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(condition_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " condition_concept_id = ", if (is.null(condition_concept_id)) "NULL" else if (is(condition_concept_id, "subQuery")) paste0("(", as.character(condition_concept_id), ")") else paste0("'", as.character(condition_concept_id), "'"))
  }

  if (!missing(condition_era_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " condition_era_start_date = ", if (is.null(condition_era_start_date)) "NULL" else if (is(condition_era_start_date, "subQuery")) paste0("(", as.character(condition_era_start_date), ")") else paste0("'", as.character(condition_era_start_date), "'"))
  }

  if (!missing(condition_era_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " condition_era_end_date = ", if (is.null(condition_era_end_date)) "NULL" else if (is(condition_era_end_date, "subQuery")) paste0("(", as.character(condition_era_end_date), ")") else paste0("'", as.character(condition_era_end_date), "'"))
  }

  if (!missing(condition_occurrence_count)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " condition_occurrence_count = ", if (is.null(condition_occurrence_count)) "NULL" else if (is(condition_occurrence_count, "subQuery")) paste0("(", as.character(condition_occurrence_count), ")") else paste0("'", as.character(condition_occurrence_count), "'"))
  }

  class(statement) <- 'subQuery'
  return(statement)
}

lookup_dose_era <- function(fetchField, dose_era_id, person_id, drug_concept_id, unit_concept_id, dose_value, dose_era_start_date, dose_era_end_date) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdm_database_schema.dose_era WHERE')
  first <- TRUE
  if (!missing(dose_era_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " dose_era_id = ", if (is.null(dose_era_id)) "NULL" else if (is(dose_era_id, "subQuery")) paste0("(", as.character(dose_era_id), ")") else paste0("'", as.character(dose_era_id), "'"))
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " person_id = ", if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(drug_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " drug_concept_id = ", if (is.null(drug_concept_id)) "NULL" else if (is(drug_concept_id, "subQuery")) paste0("(", as.character(drug_concept_id), ")") else paste0("'", as.character(drug_concept_id), "'"))
  }

  if (!missing(unit_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " unit_concept_id = ", if (is.null(unit_concept_id)) "NULL" else if (is(unit_concept_id, "subQuery")) paste0("(", as.character(unit_concept_id), ")") else paste0("'", as.character(unit_concept_id), "'"))
  }

  if (!missing(dose_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " dose_value = ", if (is.null(dose_value)) "NULL" else if (is(dose_value, "subQuery")) paste0("(", as.character(dose_value), ")") else paste0("'", as.character(dose_value), "'"))
  }

  if (!missing(dose_era_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " dose_era_start_date = ", if (is.null(dose_era_start_date)) "NULL" else if (is(dose_era_start_date, "subQuery")) paste0("(", as.character(dose_era_start_date), ")") else paste0("'", as.character(dose_era_start_date), "'"))
  }

  if (!missing(dose_era_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " dose_era_end_date = ", if (is.null(dose_era_end_date)) "NULL" else if (is(dose_era_end_date, "subQuery")) paste0("(", as.character(dose_era_end_date), ")") else paste0("'", as.character(dose_era_end_date), "'"))
  }

  class(statement) <- 'subQuery'
  return(statement)
}

lookup_drug_era <- function(fetchField, drug_era_id, person_id, drug_concept_id, drug_era_start_date, drug_era_end_date, drug_exposure_count, gap_days) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdm_database_schema.drug_era WHERE')
  first <- TRUE
  if (!missing(drug_era_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " drug_era_id = ", if (is.null(drug_era_id)) "NULL" else if (is(drug_era_id, "subQuery")) paste0("(", as.character(drug_era_id), ")") else paste0("'", as.character(drug_era_id), "'"))
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " person_id = ", if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(drug_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " drug_concept_id = ", if (is.null(drug_concept_id)) "NULL" else if (is(drug_concept_id, "subQuery")) paste0("(", as.character(drug_concept_id), ")") else paste0("'", as.character(drug_concept_id), "'"))
  }

  if (!missing(drug_era_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " drug_era_start_date = ", if (is.null(drug_era_start_date)) "NULL" else if (is(drug_era_start_date, "subQuery")) paste0("(", as.character(drug_era_start_date), ")") else paste0("'", as.character(drug_era_start_date), "'"))
  }

  if (!missing(drug_era_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " drug_era_end_date = ", if (is.null(drug_era_end_date)) "NULL" else if (is(drug_era_end_date, "subQuery")) paste0("(", as.character(drug_era_end_date), ")") else paste0("'", as.character(drug_era_end_date), "'"))
  }

  if (!missing(drug_exposure_count)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " drug_exposure_count = ", if (is.null(drug_exposure_count)) "NULL" else if (is(drug_exposure_count, "subQuery")) paste0("(", as.character(drug_exposure_count), ")") else paste0("'", as.character(drug_exposure_count), "'"))
  }

  if (!missing(gap_days)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " gap_days = ", if (is.null(gap_days)) "NULL" else if (is(gap_days, "subQuery")) paste0("(", as.character(gap_days), ")") else paste0("'", as.character(gap_days), "'"))
  }

  class(statement) <- 'subQuery'
  return(statement)
}

lookup_cost <- function(fetchField, cost_id, cost_event_id, cost_domain_id, cost_type_concept_id, currency_concept_id, total_charge, total_cost, total_paid, paid_by_payer, paid_by_patient, paid_patient_copay, paid_patient_coinsurance, paid_patient_deductible, paid_by_primary, paid_ingredient_cost, paid_dispensing_fee, payer_plan_period_id, amount_allowed, revenue_code_concept_id, revenue_code_source_value, drg_concept_id, drg_source_value) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdm_database_schema.cost WHERE')
  first <- TRUE
  if (!missing(cost_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " cost_id = ", if (is.null(cost_id)) "NULL" else if (is(cost_id, "subQuery")) paste0("(", as.character(cost_id), ")") else paste0("'", as.character(cost_id), "'"))
  }

  if (!missing(cost_event_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " cost_event_id = ", if (is.null(cost_event_id)) "NULL" else if (is(cost_event_id, "subQuery")) paste0("(", as.character(cost_event_id), ")") else paste0("'", as.character(cost_event_id), "'"))
  }

  if (!missing(cost_domain_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " cost_domain_id = ", if (is.null(cost_domain_id)) "NULL" else if (is(cost_domain_id, "subQuery")) paste0("(", as.character(cost_domain_id), ")") else paste0("'", as.character(cost_domain_id), "'"))
  }

  if (!missing(cost_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " cost_type_concept_id = ", if (is.null(cost_type_concept_id)) "NULL" else if (is(cost_type_concept_id, "subQuery")) paste0("(", as.character(cost_type_concept_id), ")") else paste0("'", as.character(cost_type_concept_id), "'"))
  }

  if (!missing(currency_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " currency_concept_id = ", if (is.null(currency_concept_id)) "NULL" else if (is(currency_concept_id, "subQuery")) paste0("(", as.character(currency_concept_id), ")") else paste0("'", as.character(currency_concept_id), "'"))
  }

  if (!missing(total_charge)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " total_charge = ", if (is.null(total_charge)) "NULL" else if (is(total_charge, "subQuery")) paste0("(", as.character(total_charge), ")") else paste0("'", as.character(total_charge), "'"))
  }

  if (!missing(total_cost)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " total_cost = ", if (is.null(total_cost)) "NULL" else if (is(total_cost, "subQuery")) paste0("(", as.character(total_cost), ")") else paste0("'", as.character(total_cost), "'"))
  }

  if (!missing(total_paid)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " total_paid = ", if (is.null(total_paid)) "NULL" else if (is(total_paid, "subQuery")) paste0("(", as.character(total_paid), ")") else paste0("'", as.character(total_paid), "'"))
  }

  if (!missing(paid_by_payer)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " paid_by_payer = ", if (is.null(paid_by_payer)) "NULL" else if (is(paid_by_payer, "subQuery")) paste0("(", as.character(paid_by_payer), ")") else paste0("'", as.character(paid_by_payer), "'"))
  }

  if (!missing(paid_by_patient)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " paid_by_patient = ", if (is.null(paid_by_patient)) "NULL" else if (is(paid_by_patient, "subQuery")) paste0("(", as.character(paid_by_patient), ")") else paste0("'", as.character(paid_by_patient), "'"))
  }

  if (!missing(paid_patient_copay)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " paid_patient_copay = ", if (is.null(paid_patient_copay)) "NULL" else if (is(paid_patient_copay, "subQuery")) paste0("(", as.character(paid_patient_copay), ")") else paste0("'", as.character(paid_patient_copay), "'"))
  }

  if (!missing(paid_patient_coinsurance)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " paid_patient_coinsurance = ", if (is.null(paid_patient_coinsurance)) "NULL" else if (is(paid_patient_coinsurance, "subQuery")) paste0("(", as.character(paid_patient_coinsurance), ")") else paste0("'", as.character(paid_patient_coinsurance), "'"))
  }

  if (!missing(paid_patient_deductible)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " paid_patient_deductible = ", if (is.null(paid_patient_deductible)) "NULL" else if (is(paid_patient_deductible, "subQuery")) paste0("(", as.character(paid_patient_deductible), ")") else paste0("'", as.character(paid_patient_deductible), "'"))
  }

  if (!missing(paid_by_primary)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " paid_by_primary = ", if (is.null(paid_by_primary)) "NULL" else if (is(paid_by_primary, "subQuery")) paste0("(", as.character(paid_by_primary), ")") else paste0("'", as.character(paid_by_primary), "'"))
  }

  if (!missing(paid_ingredient_cost)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " paid_ingredient_cost = ", if (is.null(paid_ingredient_cost)) "NULL" else if (is(paid_ingredient_cost, "subQuery")) paste0("(", as.character(paid_ingredient_cost), ")") else paste0("'", as.character(paid_ingredient_cost), "'"))
  }

  if (!missing(paid_dispensing_fee)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " paid_dispensing_fee = ", if (is.null(paid_dispensing_fee)) "NULL" else if (is(paid_dispensing_fee, "subQuery")) paste0("(", as.character(paid_dispensing_fee), ")") else paste0("'", as.character(paid_dispensing_fee), "'"))
  }

  if (!missing(payer_plan_period_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " payer_plan_period_id = ", if (is.null(payer_plan_period_id)) "NULL" else if (is(payer_plan_period_id, "subQuery")) paste0("(", as.character(payer_plan_period_id), ")") else paste0("'", as.character(payer_plan_period_id), "'"))
  }

  if (!missing(amount_allowed)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " amount_allowed = ", if (is.null(amount_allowed)) "NULL" else if (is(amount_allowed, "subQuery")) paste0("(", as.character(amount_allowed), ")") else paste0("'", as.character(amount_allowed), "'"))
  }

  if (!missing(revenue_code_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " revenue_code_concept_id = ", if (is.null(revenue_code_concept_id)) "NULL" else if (is(revenue_code_concept_id, "subQuery")) paste0("(", as.character(revenue_code_concept_id), ")") else paste0("'", as.character(revenue_code_concept_id), "'"))
  }

  if (!missing(revenue_code_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " revenue_code_source_value = ", if (is.null(revenue_code_source_value)) "NULL" else if (is(revenue_code_source_value, "subQuery")) paste0("(", as.character(revenue_code_source_value), ")") else paste0("'", as.character(revenue_code_source_value), "'"))
  }

  if (!missing(drg_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " drg_concept_id = ", if (is.null(drg_concept_id)) "NULL" else if (is(drg_concept_id, "subQuery")) paste0("(", as.character(drg_concept_id), ")") else paste0("'", as.character(drg_concept_id), "'"))
  }

  if (!missing(drg_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " drg_source_value = ", if (is.null(drg_source_value)) "NULL" else if (is(drg_source_value, "subQuery")) paste0("(", as.character(drg_source_value), ")") else paste0("'", as.character(drg_source_value), "'"))
  }

  class(statement) <- 'subQuery'
  return(statement)
}

lookup_payer_plan_period <- function(fetchField, payer_plan_period_id, person_id, payer_plan_period_start_date, payer_plan_period_end_date, payer_source_value, plan_source_value, family_source_value) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdm_database_schema.payer_plan_period WHERE')
  first <- TRUE
  if (!missing(payer_plan_period_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " payer_plan_period_id = ", if (is.null(payer_plan_period_id)) "NULL" else if (is(payer_plan_period_id, "subQuery")) paste0("(", as.character(payer_plan_period_id), ")") else paste0("'", as.character(payer_plan_period_id), "'"))
  }

  if (!missing(person_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " person_id = ", if (is.null(person_id)) "NULL" else if (is(person_id, "subQuery")) paste0("(", as.character(person_id), ")") else paste0("'", as.character(person_id), "'"))
  }

  if (!missing(payer_plan_period_start_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " payer_plan_period_start_date = ", if (is.null(payer_plan_period_start_date)) "NULL" else if (is(payer_plan_period_start_date, "subQuery")) paste0("(", as.character(payer_plan_period_start_date), ")") else paste0("'", as.character(payer_plan_period_start_date), "'"))
  }

  if (!missing(payer_plan_period_end_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " payer_plan_period_end_date = ", if (is.null(payer_plan_period_end_date)) "NULL" else if (is(payer_plan_period_end_date, "subQuery")) paste0("(", as.character(payer_plan_period_end_date), ")") else paste0("'", as.character(payer_plan_period_end_date), "'"))
  }

  if (!missing(payer_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " payer_source_value = ", if (is.null(payer_source_value)) "NULL" else if (is(payer_source_value, "subQuery")) paste0("(", as.character(payer_source_value), ")") else paste0("'", as.character(payer_source_value), "'"))
  }

  if (!missing(plan_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " plan_source_value = ", if (is.null(plan_source_value)) "NULL" else if (is(plan_source_value, "subQuery")) paste0("(", as.character(plan_source_value), ")") else paste0("'", as.character(plan_source_value), "'"))
  }

  if (!missing(family_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " family_source_value = ", if (is.null(family_source_value)) "NULL" else if (is(family_source_value, "subQuery")) paste0("(", as.character(family_source_value), ")") else paste0("'", as.character(family_source_value), "'"))
  }

  class(statement) <- 'subQuery'
  return(statement)
}

lookup_care_site <- function(fetchField, care_site_id, care_site_name, place_of_service_concept_id, location_id, care_site_source_value, place_of_service_source_value) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdm_database_schema.care_site WHERE')
  first <- TRUE
  if (!missing(care_site_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " care_site_id = ", if (is.null(care_site_id)) "NULL" else if (is(care_site_id, "subQuery")) paste0("(", as.character(care_site_id), ")") else paste0("'", as.character(care_site_id), "'"))
  }

  if (!missing(care_site_name)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " care_site_name = ", if (is.null(care_site_name)) "NULL" else if (is(care_site_name, "subQuery")) paste0("(", as.character(care_site_name), ")") else paste0("'", as.character(care_site_name), "'"))
  }

  if (!missing(place_of_service_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " place_of_service_concept_id = ", if (is.null(place_of_service_concept_id)) "NULL" else if (is(place_of_service_concept_id, "subQuery")) paste0("(", as.character(place_of_service_concept_id), ")") else paste0("'", as.character(place_of_service_concept_id), "'"))
  }

  if (!missing(location_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " location_id = ", if (is.null(location_id)) "NULL" else if (is(location_id, "subQuery")) paste0("(", as.character(location_id), ")") else paste0("'", as.character(location_id), "'"))
  }

  if (!missing(care_site_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " care_site_source_value = ", if (is.null(care_site_source_value)) "NULL" else if (is(care_site_source_value, "subQuery")) paste0("(", as.character(care_site_source_value), ")") else paste0("'", as.character(care_site_source_value), "'"))
  }

  if (!missing(place_of_service_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " place_of_service_source_value = ", if (is.null(place_of_service_source_value)) "NULL" else if (is(place_of_service_source_value, "subQuery")) paste0("(", as.character(place_of_service_source_value), ")") else paste0("'", as.character(place_of_service_source_value), "'"))
  }

  class(statement) <- 'subQuery'
  return(statement)
}

lookup_location <- function(fetchField, location_id, address_1, address_2, city, state, zip, county, location_source_value) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdm_database_schema.location WHERE')
  first <- TRUE
  if (!missing(location_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " location_id = ", if (is.null(location_id)) "NULL" else if (is(location_id, "subQuery")) paste0("(", as.character(location_id), ")") else paste0("'", as.character(location_id), "'"))
  }

  if (!missing(address_1)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " address_1 = ", if (is.null(address_1)) "NULL" else if (is(address_1, "subQuery")) paste0("(", as.character(address_1), ")") else paste0("'", as.character(address_1), "'"))
  }

  if (!missing(address_2)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " address_2 = ", if (is.null(address_2)) "NULL" else if (is(address_2, "subQuery")) paste0("(", as.character(address_2), ")") else paste0("'", as.character(address_2), "'"))
  }

  if (!missing(city)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " city = ", if (is.null(city)) "NULL" else if (is(city, "subQuery")) paste0("(", as.character(city), ")") else paste0("'", as.character(city), "'"))
  }

  if (!missing(state)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " state = ", if (is.null(state)) "NULL" else if (is(state, "subQuery")) paste0("(", as.character(state), ")") else paste0("'", as.character(state), "'"))
  }

  if (!missing(zip)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " zip = ", if (is.null(zip)) "NULL" else if (is(zip, "subQuery")) paste0("(", as.character(zip), ")") else paste0("'", as.character(zip), "'"))
  }

  if (!missing(county)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " county = ", if (is.null(county)) "NULL" else if (is(county, "subQuery")) paste0("(", as.character(county), ")") else paste0("'", as.character(county), "'"))
  }

  if (!missing(location_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " location_source_value = ", if (is.null(location_source_value)) "NULL" else if (is(location_source_value, "subQuery")) paste0("(", as.character(location_source_value), ")") else paste0("'", as.character(location_source_value), "'"))
  }

  class(statement) <- 'subQuery'
  return(statement)
}

lookup_provider <- function(fetchField, provider_id, provider_name, npi, dea, specialty_concept_id, care_site_id, year_of_birth, gender_concept_id, provider_source_value, specialty_source_value, specialty_source_concept_id, gender_source_value, gender_source_concept_id) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdm_database_schema.provider WHERE')
  first <- TRUE
  if (!missing(provider_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " provider_id = ", if (is.null(provider_id)) "NULL" else if (is(provider_id, "subQuery")) paste0("(", as.character(provider_id), ")") else paste0("'", as.character(provider_id), "'"))
  }

  if (!missing(provider_name)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " provider_name = ", if (is.null(provider_name)) "NULL" else if (is(provider_name, "subQuery")) paste0("(", as.character(provider_name), ")") else paste0("'", as.character(provider_name), "'"))
  }

  if (!missing(npi)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " npi = ", if (is.null(npi)) "NULL" else if (is(npi, "subQuery")) paste0("(", as.character(npi), ")") else paste0("'", as.character(npi), "'"))
  }

  if (!missing(dea)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " dea = ", if (is.null(dea)) "NULL" else if (is(dea, "subQuery")) paste0("(", as.character(dea), ")") else paste0("'", as.character(dea), "'"))
  }

  if (!missing(specialty_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " specialty_concept_id = ", if (is.null(specialty_concept_id)) "NULL" else if (is(specialty_concept_id, "subQuery")) paste0("(", as.character(specialty_concept_id), ")") else paste0("'", as.character(specialty_concept_id), "'"))
  }

  if (!missing(care_site_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " care_site_id = ", if (is.null(care_site_id)) "NULL" else if (is(care_site_id, "subQuery")) paste0("(", as.character(care_site_id), ")") else paste0("'", as.character(care_site_id), "'"))
  }

  if (!missing(year_of_birth)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " year_of_birth = ", if (is.null(year_of_birth)) "NULL" else if (is(year_of_birth, "subQuery")) paste0("(", as.character(year_of_birth), ")") else paste0("'", as.character(year_of_birth), "'"))
  }

  if (!missing(gender_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " gender_concept_id = ", if (is.null(gender_concept_id)) "NULL" else if (is(gender_concept_id, "subQuery")) paste0("(", as.character(gender_concept_id), ")") else paste0("'", as.character(gender_concept_id), "'"))
  }

  if (!missing(provider_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " provider_source_value = ", if (is.null(provider_source_value)) "NULL" else if (is(provider_source_value, "subQuery")) paste0("(", as.character(provider_source_value), ")") else paste0("'", as.character(provider_source_value), "'"))
  }

  if (!missing(specialty_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " specialty_source_value = ", if (is.null(specialty_source_value)) "NULL" else if (is(specialty_source_value, "subQuery")) paste0("(", as.character(specialty_source_value), ")") else paste0("'", as.character(specialty_source_value), "'"))
  }

  if (!missing(specialty_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " specialty_source_concept_id = ", if (is.null(specialty_source_concept_id)) "NULL" else if (is(specialty_source_concept_id, "subQuery")) paste0("(", as.character(specialty_source_concept_id), ")") else paste0("'", as.character(specialty_source_concept_id), "'"))
  }

  if (!missing(gender_source_value)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " gender_source_value = ", if (is.null(gender_source_value)) "NULL" else if (is(gender_source_value, "subQuery")) paste0("(", as.character(gender_source_value), ")") else paste0("'", as.character(gender_source_value), "'"))
  }

  if (!missing(gender_source_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " gender_source_concept_id = ", if (is.null(gender_source_concept_id)) "NULL" else if (is(gender_source_concept_id, "subQuery")) paste0("(", as.character(gender_source_concept_id), ")") else paste0("'", as.character(gender_source_concept_id), "'"))
  }

  class(statement) <- 'subQuery'
  return(statement)
}

lookup_cdm_source <- function(fetchField, cdm_source_name, cdm_source_abbreviation, cdm_holder, source_description, source_documentation_reference, cdm_etl__reference, source_release_date, cdm_release_date, cdm_version, vocabulary_version) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdm_database_schema.cdm_source WHERE')
  first <- TRUE
  if (!missing(cdm_source_name)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " cdm_source_name = ", if (is.null(cdm_source_name)) "NULL" else if (is(cdm_source_name, "subQuery")) paste0("(", as.character(cdm_source_name), ")") else paste0("'", as.character(cdm_source_name), "'"))
  }

  if (!missing(cdm_source_abbreviation)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " cdm_source_abbreviation = ", if (is.null(cdm_source_abbreviation)) "NULL" else if (is(cdm_source_abbreviation, "subQuery")) paste0("(", as.character(cdm_source_abbreviation), ")") else paste0("'", as.character(cdm_source_abbreviation), "'"))
  }

  if (!missing(cdm_holder)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " cdm_holder = ", if (is.null(cdm_holder)) "NULL" else if (is(cdm_holder, "subQuery")) paste0("(", as.character(cdm_holder), ")") else paste0("'", as.character(cdm_holder), "'"))
  }

  if (!missing(source_description)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " source_description = ", if (is.null(source_description)) "NULL" else if (is(source_description, "subQuery")) paste0("(", as.character(source_description), ")") else paste0("'", as.character(source_description), "'"))
  }

  if (!missing(source_documentation_reference)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " source_documentation_reference = ", if (is.null(source_documentation_reference)) "NULL" else if (is(source_documentation_reference, "subQuery")) paste0("(", as.character(source_documentation_reference), ")") else paste0("'", as.character(source_documentation_reference), "'"))
  }

  if (!missing(cdm_etl__reference)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " [cdm_etl _reference] = ", if (is.null(cdm_etl__reference)) "NULL" else if (is(cdm_etl__reference, "subQuery")) paste0("(", as.character(cdm_etl__reference), ")") else paste0("'", as.character(cdm_etl__reference), "'"))
  }

  if (!missing(source_release_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " source_release_date = ", if (is.null(source_release_date)) "NULL" else if (is(source_release_date, "subQuery")) paste0("(", as.character(source_release_date), ")") else paste0("'", as.character(source_release_date), "'"))
  }

  if (!missing(cdm_release_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " cdm_release_date = ", if (is.null(cdm_release_date)) "NULL" else if (is(cdm_release_date, "subQuery")) paste0("(", as.character(cdm_release_date), ")") else paste0("'", as.character(cdm_release_date), "'"))
  }

  if (!missing(cdm_version)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " cdm_version = ", if (is.null(cdm_version)) "NULL" else if (is(cdm_version, "subQuery")) paste0("(", as.character(cdm_version), ")") else paste0("'", as.character(cdm_version), "'"))
  }

  if (!missing(vocabulary_version)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " vocabulary_version = ", if (is.null(vocabulary_version)) "NULL" else if (is(vocabulary_version, "subQuery")) paste0("(", as.character(vocabulary_version), ")") else paste0("'", as.character(vocabulary_version), "'"))
  }

  class(statement) <- 'subQuery'
  return(statement)
}

lookup_attribute_definition <- function(fetchField, attribute_definition_id, attribute_name, attribute_description, attribute_type_concept_id, attribute_syntax) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdm_database_schema.attribute_definition WHERE')
  first <- TRUE
  if (!missing(attribute_definition_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " attribute_definition_id = ", if (is.null(attribute_definition_id)) "NULL" else if (is(attribute_definition_id, "subQuery")) paste0("(", as.character(attribute_definition_id), ")") else paste0("'", as.character(attribute_definition_id), "'"))
  }

  if (!missing(attribute_name)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " attribute_name = ", if (is.null(attribute_name)) "NULL" else if (is(attribute_name, "subQuery")) paste0("(", as.character(attribute_name), ")") else paste0("'", as.character(attribute_name), "'"))
  }

  if (!missing(attribute_description)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " attribute_description = ", if (is.null(attribute_description)) "NULL" else if (is(attribute_description, "subQuery")) paste0("(", as.character(attribute_description), ")") else paste0("'", as.character(attribute_description), "'"))
  }

  if (!missing(attribute_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " attribute_type_concept_id = ", if (is.null(attribute_type_concept_id)) "NULL" else if (is(attribute_type_concept_id, "subQuery")) paste0("(", as.character(attribute_type_concept_id), ")") else paste0("'", as.character(attribute_type_concept_id), "'"))
  }

  if (!missing(attribute_syntax)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " attribute_syntax = ", if (is.null(attribute_syntax)) "NULL" else if (is(attribute_syntax, "subQuery")) paste0("(", as.character(attribute_syntax), ")") else paste0("'", as.character(attribute_syntax), "'"))
  }

  class(statement) <- 'subQuery'
  return(statement)
}

lookup_cohort_definition <- function(fetchField, cohort_definition_id, cohort_definition_name, cohort_definition_description, definition_type_concept_id, cohort_definition_syntax, subject_concept_id, cohort_instantiation_date) {
  statement <- paste0('SELECT ', fetchField , ' FROM @cdm_database_schema.cohort_definition WHERE')
  first <- TRUE
  if (!missing(cohort_definition_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " cohort_definition_id = ", if (is.null(cohort_definition_id)) "NULL" else if (is(cohort_definition_id, "subQuery")) paste0("(", as.character(cohort_definition_id), ")") else paste0("'", as.character(cohort_definition_id), "'"))
  }

  if (!missing(cohort_definition_name)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " cohort_definition_name = ", if (is.null(cohort_definition_name)) "NULL" else if (is(cohort_definition_name, "subQuery")) paste0("(", as.character(cohort_definition_name), ")") else paste0("'", as.character(cohort_definition_name), "'"))
  }

  if (!missing(cohort_definition_description)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " cohort_definition_description = ", if (is.null(cohort_definition_description)) "NULL" else if (is(cohort_definition_description, "subQuery")) paste0("(", as.character(cohort_definition_description), ")") else paste0("'", as.character(cohort_definition_description), "'"))
  }

  if (!missing(definition_type_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " definition_type_concept_id = ", if (is.null(definition_type_concept_id)) "NULL" else if (is(definition_type_concept_id, "subQuery")) paste0("(", as.character(definition_type_concept_id), ")") else paste0("'", as.character(definition_type_concept_id), "'"))
  }

  if (!missing(cohort_definition_syntax)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " cohort_definition_syntax = ", if (is.null(cohort_definition_syntax)) "NULL" else if (is(cohort_definition_syntax, "subQuery")) paste0("(", as.character(cohort_definition_syntax), ")") else paste0("'", as.character(cohort_definition_syntax), "'"))
  }

  if (!missing(subject_concept_id)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " subject_concept_id = ", if (is.null(subject_concept_id)) "NULL" else if (is(subject_concept_id, "subQuery")) paste0("(", as.character(subject_concept_id), ")") else paste0("'", as.character(subject_concept_id), "'"))
  }

  if (!missing(cohort_instantiation_date)) {
    if (first) {
      first <- FALSE
    } else {
      statement <- paste0(statement, " AND")
    }
    statement <- paste0(statement, " cohort_instantiation_date = ", if (is.null(cohort_instantiation_date)) "NULL" else if (is(cohort_instantiation_date, "subQuery")) paste0("(", as.character(cohort_instantiation_date), ")") else paste0("'", as.character(cohort_instantiation_date), "'"))
  }

  class(statement) <- 'subQuery'
  return(statement)
}

generateInsertSql <- function(databaseSchema = NULL) {
  insertSql <- c()
  insertSql <- c(insertSql, "TRUNCATE TABLE @cdm_database_schema.drug_claims;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @cdm_database_schema.enrollment_detail;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @cdm_database_schema.enrollment_summary;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @cdm_database_schema.facility_header;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @cdm_database_schema.inpatient_admissions;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @cdm_database_schema.inpatient_services;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @cdm_database_schema.long_term_care;")
  insertSql <- c(insertSql, "TRUNCATE TABLE @cdm_database_schema.outpatient_services;")
  createInsertStatement <- function(insert, env) {
    s <- c()
    if (length(insert$fields)==0){
      s <- c(s, paste0('-- Group ', insert$testId, ': ', insert$sql))
      return(s)
    }
    else {
    if (env$testId != insert$testId) {
      s <- c(s, paste0('-- Test Case ', insert$testId, ': ', insert$testDescription))
      env$testId <- insert$testId
    }
    s <- c(s, paste0("INSERT INTO @cdm_database_schema.",
                     insert$table,
                     "(",
                     paste(insert$fields, collapse = ", "),
                     ") VALUES (",
                     paste(insert$values, collapse = ", "), 
                     ");"))
    return(s)
    }
  }
  env <- new.env()
  env$testId <- -1
  insertSql <- c(insertSql, do.call(c, lapply(frameworkContext$inserts, createInsertStatement, env)))
  if (is.null(databaseSchema)) {
  	insertSql <- gsub('@cdm_database_schema.', '', insertSql)
  } else {
  	insertSql <- gsub('@cdm_database_schema', databaseSchema, insertSql)
  }
  return(insertSql)
}

generateTestSql <- function(databaseSchema = NULL) {
  testSql <- c()
  testSql <- c(testSql, "IF OBJECT_ID('@cdm_database_schema.test_results', 'U') IS NOT NULL DROP TABLE @cdm_database_schema.test_results;")
  testSql <- c(testSql, "CREATE TABLE @cdm_database_schema.test_results (id INT, description VARCHAR(512), test VARCHAR(256), status VARCHAR(5));")
  createExpectStatement <- function(expect, env) {
    s <- c()
    if (env$testId != expect$testId) {
      s <- c(s, paste0('-- ', expect$testId, ': ', expect$testDescription))
      env$testId <- expect$testId
    }
    operators <- rep("=", length(expect$fields))
    operators[expect$values == "NULL"] <- rep("IS", sum(expect$values == "NULL"))
    s <- c(s, paste0("INSERT INTO @cdm_database_schema.test_results SELECT ",
                     expect$testId,
                     " AS id, '",
                     expect$testDescription,
                     "' AS description, 'Expect ",
                     expect$table,
                     "' AS test, CASE WHEN (SELECT COUNT(*) FROM @cdm_database_schema.",
                     expect$table,
                     " WHERE ",
                     paste(paste(expect$fields, operators, expect$values), collapse = " AND "),
                     ") ",
                     if (expect$type == 0) "= 0" else if (expect$type == 1) "!= 0" else paste("!=", expect$rowCount),
                     " THEN 'FAIL' ELSE 'PASS' END AS status;"))
    return(s)
  }
  env <- new.env()
  env$testId <- -1
  testSql <- c(testSql, do.call(c, lapply(frameworkContext$expects, createExpectStatement, env)))
  if (is.null(databaseSchema)) {
  	testSql <- gsub('@cdm_database_schema.', '', testSql)
  } else {
  	testSql <- gsub('@cdm_database_schema', databaseSchema, testSql)
  }
  return(testSql)
}

